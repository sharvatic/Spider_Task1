#!/bin/bash

echo "===============================================" >> system_info.txt
echo "               SYSTEM INFO">>system_info.txt
echo "===============================================" >>system_info.txt

echo -e "Desktop processor :">>system_info.txt
grep "model name" /proc/cpuinfo | sed '1q;d' | awk -F': ' '{print $2}' >>system_info.txt

echo -e "Kernel :">>system_info.txt
hostnamectl | grep Kernel | awk '{print $2}' >>system_info.txt

echo -e "Operating system version :">>system_info.txt
hostnamectl | grep "Operating System" | awk '{print $3 " " $4}' >>system_info.txt

echo -e "Desktop memory :" >>system_info.txt
free -h | grep "Mem" | awk '{print $3}' >>System_info.txt

echo -e "Serial number :" >>system_info.txt
dmidecode | grep "Serial Number:" | sed '1q;d' | awk -F': ' '{print $2}' >>system_info.txt

echo -e "System IP :" >>system_info.txt
ifconfig | grep "inet " | awk 'NR==1 {print $2}' >>system_info.txt

echo "-----------------------------------------" >>system_info.txt

echo -e "Installed software :" >>system_info.txt
dpkg --get-selections >>system_info.txt

echo "===============================================" >> system_info.txt

