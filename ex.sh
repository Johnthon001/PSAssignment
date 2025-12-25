#!/bin/bash

echo "---------- System Information ---------"
echo "Executed By: $(whoami)" 

echo "Hostname: $(hostname)"

IP=`ip addr | grep "127..*" | awk '{print $2}'`
echo "Server IP: $IP"

pIP=`ip addr | grep "192..*/24" | awk '{print $2}'`
echo "Public IP: $pIP"

os=`cat /etc/os-release | grep -w "NAME" | sed 's/[^"]*"\([^"]*\)".*/\1/'`
ver=`cat /etc/os-release | grep -w "VERSION=" | grep -oP '\d+\.\d+'`
echo "OS Version and type: $os $ver"

echo "Kernel Version: $(uname -r)"

echo "Architecture: $(uname -m)"

echo "Virtualization: $(systemd-detect-virt)"

echo "Server Time: $(date)"

echo "Timezone: $(timedatectl show --p=Timezone --value)"

echo "Uptime: $(uptime -p)"

echo "--------- Resource Usage ---------"

echo "Total Memory: $(free -h | awk '/^Mem:/ {print $2}')"
echo "Memory Usage: $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
echo "Memory Usage: $(free -h | awk '/^Swap:/ {print $3 "/" $2}')"
echo "CPU Cores: $(nproc)"
