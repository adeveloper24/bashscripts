#this script will give you full information about your system 
#!bin/bash

#CPU information
echo "\033[1mCPU:\033[0m"
lscpu | grep 'Model name:'
lscpu | grep 'L1d cache:'
lscpu | grep 'L1i cache:'
lscpu | grep 'L2 cache:'

b=`lscpu | grep 'L3 cache:'`
if [ $? -eq 0 ]
then 
	lscpu | grep 'L3 cache:'
	architecture=`lscpu | head -n1 | cut -d":" -f2`
	echo "Architecture:          "$architecture
fi 

c=`lscpu | grep 'Потоков на ядро:'`
if [ $? -eq 0 ]
then 
	threats=`lscpu | grep 'Потоков на ядро:' | cut -d":" -f2`
	echo "Потоков на ядро:       "$threats
fi

d=`lscpu | grep 'Thread(s) per core:'`
if [ $? -eq 0 ]
then 
	threats=`lscpu | grep 'Thread(s) per core:' | cut -d":" -f2`
	echo "Thread(s) per core:   "$threats
fi

cores=`grep 'cpu cores' /proc/cpuinfo | cut -d":" -f2 | head -n1`
echo "cpu cores:            "$cores 


#RAM information
echo ""
e=`grep 'MemTotal:' /proc/meminfo`
if [ $? -eq 0 ]
then
	memory=`grep 'MemTotal:' /proc/meminfo | cut -d":" -f2`
	echo "\033[1mRAM:\033[0m                  "$memory
fi


#HDD information
echo ""
echo "\033[1mHDD:\033[0m"
df -t ext4 -h


#operating system information
echo ""
echo "\033[1mOC:\033[0m"
lsb_release -a
    



