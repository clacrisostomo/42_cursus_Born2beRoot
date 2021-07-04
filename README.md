## Born2beroot

The goal of this project is to set up a ssh server in a virtual machine (VM) using Virtual Box.
A VM is a great way to test and/or use programs that should work on a specific Operating System other than yours, like a computer inside another computer.

---

<h3> Operating System </h3>

We had to choose between CentOS and Debian. I have chosen Debian because it is easier to configure and a more user-friendly interface.



<h3> Setup </h3>

I had to make sure I followed some guidelines given by the subject:

- Create a VDI disk with dynamic allocation;
- Use Bridge Adapter mode;
- No graphic interface is allowed;
- Hostname should be my intranet username + 42
- Create a user besides root named after my intranet username
- Create a separate /home directory
- Install the least possible packages
- Enable GRUB (a bootloader, that is, a way to choose which OS will run once you start your VM)



<h3> Sudo setup </h3>

Sudo has to comply with a set of restrictions, which can be configured using ```sudo visudo```.

These policies are:
- 3 password retries
- Add a custom error message when user types a wrong password.
- Enable TTY mode
- Create a sudo log in the ```/var/log/sudo``` directory
- Configure the secure path to ```/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin```


<h3> Users and Groups </h3>

I had to be able to create users besides ```root``` and to designate those users to certain groups.

Commands such as ```user add -m``` and ```groupadd``` and the respective variations were extremely useful for this part.

<h3> SSH service </h3>

I should be able to explain what a SSH service is, activate it in my VM and be able to use it only for the users that are not root. I also had to configure ssh to work only on port 4242.

<h3> UFW service </h3>

I also had to configure UFW firewall, explain what it is and how it works, and set it up to allow only port 4242.

<h3> Password policy </h3>

I had to implement a strong password policy. This was made by editing the ```/etc/login.def``` file fo the time-related configurations and installing ```libpa-pwquality``` package to implement the other, such as:

- min 10 characters
- no more than 3 consecutive equal characters
- restrict username
- and more

<h3> Cron and Wall </h3>

I should be able to explain what cron is and how to set it up. Cron in this case will be used to schedule the run of a script every 10 minutes since the VM is started. This configuration can be done via ```crontab -e```.

Another useful command is ```wall```, with which we can broadcast messages throughout the connected terminals.
