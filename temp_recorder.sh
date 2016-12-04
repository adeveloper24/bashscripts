#this script can record in a text file cpu cores temperature for the time you need and find min and max temperatures for this period
#BEFORE RUNNING THIS SCRIPT YOU MUST INSTALL LM-SENSORS, just write in you'r terminal ~$ sudo apt-get install lm-sensors
#then write ~$ sudo sensors-detect, and answer YES for the first two questions, and NO for another two
#!bin/bash

echo "Write the time in seconds for recording core temperature: \c"
read time
x=0
while [ $x -lt $time ]
do
	time_at_this_moment=`date '+%m-%y%n%H:%M:%S' | grep ':'`
	echo "$time_at_this_moment \c" >> temperature 
	a=`sensors | grep 'Core 0:'`
	if [ $? -eq 0 ]
	then
		echo `echo $a | cut -d"(" -f1` >> temperature
		b=`sensors | grep 'Core 1:'`
		if [ $? -eq 0 ]
		then
			echo "         \c" >> temperature
			echo `echo $b | cut -d"(" -f1`>> temperature
			c=`sensors | grep 'Core 2:'`
			if [ $? -eq 0 ]
			then
				echo "         \c" >> temperature
				echo `echo $c | cut -d"(" -f1` >> temperature
				d=`sensors | grep 'Core 3:'`
				if [ $? -eq 0 ]
				then
					echo "         \c" >> temperature
					echo `echo $d | cut -d"(" -f1` >> temperature
					e=`sensors | grep 'Core 4:'`
					if [ $? -eq 0 ]
					then
						echo "         \c" >> temperature
						echo `echo $e | cut -d"(" -f1` >> temperature
						f=`sensors | grep 'Core 5:'`
						if [ $? -eq 0 ]
						then
							echo "         \c" >> temperature
							echo `echo $f | cut -d"(" -f1` >> temperature
							g=`sensors | grep 'Core 6:'`
							if [ $? -eq 0 ]
							then
								echo "         \c" >> temperature
								echo `echo $g | cut -d"(" -f1` >> temperature
								h=`sensors | grep 'Core 7:'`
								if [ $? -eq 0 ]
								then
									echo "         \c" >> temperature
									echo `echo $h | cut -d"(" -f1` >> temperature
								fi
							fi
						fi
					fi
				fi
			fi
		fi
	fi

x=$(($x+1))
echo "" >> temperature
sleep 1
done

echo "You can find your temperature monitoring history in file \"temperature\" in you'r home directory"
