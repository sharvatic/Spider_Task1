#!/bin/bash
rm comp_log.txt
echo "===============================================" >> comp_log.txt
echo "               COMPUTER LOG">>comp_log.txt
echo "===============================================" >>comp_log.txt

echo -e "Uptime :">>comp_log.txt
uptime -p | awk '{print $2 " " $3}' >>comp_log.txt

echo -e " ">>comp_log.txt

echo -e "Disk and memory usage is :">>comp_log.txt
df -h --output=source,used >>comp_log.txt

echo -e " ">>comp_log.txt

echo -e "Most expensive processes :" >>comp_log.txt
echo -e "CPU consuming" >>comp_log.txt
ps -eocomm,pcpu | egrep -v '(0.0)|(%CPU)' >>comp_log.txt

echo -e " ">>comp_log.txt

echo -e "Memory consuming" >>comp_log.txt
ps -eocomm,pmem | egrep -v '(0.0)|(%MEM)' >>comp_log.txt

echo -e " ">>comp_log.txt

ip=$(ifconfig | grep "inet " | awk 'NR==1 {print $2}')

echo -e "Open TCP ports are :" >>comp_log.txt
nmap -open $ip | grep "tcp" | awk '{print $1}'>>comp_log.txt

echo -e " ">>comp_log.txt

echo -e "Current connections :">>comp_log.txt
netstat -a >>comp_log.txt

echo -e " ">>comp_log.txt

echo -e "Processes :" >>comp_log.txt
ps -aux >>comp_log.txt


