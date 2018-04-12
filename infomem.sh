#!/bin/bash
# Sample script written for Part 4 of the REDHAT
echo -e "\e[31;96m**WRITTEN BY *** ATISH DAS(Devops)****\e[0m"
echo -e "\e[31;43m***** HOSTNAME INFORMATION *****\e[0m"
hostname
echo ""
# -File system disk space usage:
echo -e "\e[31;43m***** FILE SYSTEM DISK SPACE USAGE *****\e[0m"
df -h
echo ""
# -Free and used memory in the system:
echo -e "\e[31;43m ***** FREE AND USED MEMORY(RAM) *****\e[0m"
free -m
echo ""
# -System uptime and load:
echo -e "\e[31;43m***** SYSTEM UPTIME AND LOAD *****\e[0m"
uptime
echo ""
# -Logged-in users:
echo -e "\e[31;43m***** CURRENTLY LOGGED-IN USERS *****\e[0m"
who
echo ""
# -Top 5 processes as far as memory usage is concerned
echo -e "\e[31;43m***** TOP 5 MEMORY-CONSUMING PROCESSES *****\e[0m"
ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6
echo ""
echo -e "\e[31;43m*****CLEAR RAM *******\e[0m"
sync; echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'
echo ""
echo -e "\e[31;43m***** LAST REBOOT *****\e[0m"
last reboot
echo ""
echo -e "\e[31;43m***** DO YOU WANT TO SCAN YOUR SERVER *****\e[0m"
echo -e "\e[1;32mDone.\e[0m"
read -p 'Would you like to Scan Your Server [y/n]: ' answer
    if [ "$answer" != 'y' ] && [ "$answer" != 'Y'  ]; then
        echo 'Good Bye'
        exit 1
    fi

git clone https://github.com/crunchsec/rkhunter.git
cd rkhunter/
sh installer.sh --install
printf "\n" | /usr/local/bin/rkhunter --update
printf "\n" | /usr/local/bin/rkhunter --propupd
printf "\n" | rkhunter --check
echo ""
exit
