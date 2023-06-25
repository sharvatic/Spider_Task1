#!/bin/bash
us=$(whoami)
Username=$(awk '{print $1}' /home/$us/User_info.txt

for user in $Username
do

sudo useradd -m $user >/dev/null;echo "$user:admin@123" | sudo chpasswd
sudo setfacl -m u:$us:rwx /home/$user

echo "Do you wish to create users individually ? [y/n]"
read input

if [ input == 'y' ]
then

echo "Please enter your username :"
read name
echo "Please enter your password:"
read pass
sudo useradd -m $name >/dev/null;echo "$user:$pass" | sudo chpasswd
sudo setfacl -m u:$us:rwx /home/$name

touch website.txt /home/$name
sudo setfacl -m u:$name:r-- /home/$name/website.txt
sudo chown $us /home/$name/website.txt

fi

touch website.txt /home/$user
sudo chown $us /home/$user/website.txt
sudo setfacl -m u:$user:r-- /home/$user/website.txt

done

