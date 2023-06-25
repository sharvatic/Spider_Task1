To get the scripts write the following command in your terminal
```
git clone https://github.com/sharvatic/Spider_Task1.git
```
Run the following commands before running the scripts
```
sudo apt install net-tools
sudo apt-get install nmap
```
Run the following command to obtain the path of the comp_info.sh 
```
readlink -f comp_info.sh
```
COPY THE PATH .
Run the following commands to set up a cronjob
```
sudo -i
crontab -e
```
Choose the editor you want to open the file in and add the following line to the file
```
0 18 * * * /bin/sh (path to the file obtained from previous command)
```
