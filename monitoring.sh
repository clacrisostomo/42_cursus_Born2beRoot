#!/bin/bash

rm -rf temporary.tmp

{
	echo "***********************************************"
	echo "Architecture:" "$(uname -a)"
	echo "CPU physical:" "$(grep 'ṕhysical id' /proc/cpuinfo | uniq | wc -l)"
	echo "vCPU:" "$(grep 'processor' /proc/cpuinfo | uniq | wc -l)"
	USED_M=$(free -m | awk 'NR == 2 {print $3}')
	TOTAL_M=$(free -m | awk 'NR == 2 {print $2}')
	PRC_M=$(free -m | awk 'NR == 2 {printf "%.2f", $3*100/$2}')
	echo "Memory Usage:" "${USED_M}/${TOTAL_M}MB" "(${PRC_M}%)"
	USED_D=$(df -m --total | awk 'END{print $3}')
	TOTAL_D=$(df -h --total | awk 'END{print $2}')
	PRC_D=$(df -h --total | awk 'END{print $5}')
	echo "Disk Usage:" "${USED_D}/${TOTAL_D}" "(${PRC_D})"
	echo "CPU Load:" "$(mpstat | awk '/all/ {printf "%.2f", 100 - $NF}')%"
	echo "Last Boot:" "$(who -b | awk '{print $3,$4}')"
	echo "LVM Use:" $(if [ $(/usr/sbin/blkid | grep -c '/dev/mapper') -eq 0 ]; then echo "no"; else echo "yes"; fi)
	echo "Connection TCP:" "$(ss -s | awk '/TCP:/ {print $2}')"
	echo "Users Logged:" "$(who | wc -l)"
	echo "Network:" "IP $(hostname -I | awk '{print $1}')" "($(ip link show | awk '$1 == "link/ether" {print $2}'))"
	echo "Sudo:" "$(grep -c 'COMMAND' /var/log/sudo/logs)" "cmd"
	echo "***********************************************"
} >> temporary.tmp

wall -n temporary.tmp

rm -rf temporary.tmp