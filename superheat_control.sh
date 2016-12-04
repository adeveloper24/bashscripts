#this script will protect your PC from overheating
#BEFORE RUNNING THIS SCRIPT YOU MUST INSTALL LM-SENSORS, just write in your terminal ~$ sudo apt-get install lm-sensors
#then write ~$ sudo sensors-detect, and answer YES for the first two questions, and NO for another two

#!bin/bash
#Write here the maximum allowable temperature for your PC
max_temp=70
core_1_temp=0
core_2_temp=0
core_3_temp=0
core_4_temp=0
core_5_temp=0
core_6_temp=0
core_7_temp=0
core_8_temp=0

while [ $core_1_temp -lt $max_temp -a $core_2_temp -lt $max_temp -a $core_3_temp -lt $max_temp -a $core_4_temp -lt $max_temp -a $core_5_temp -lt $max_temp -a $core_6_temp -lt $max_temp -a $core_7_temp -lt $max_temp -a $core_8_temp -lt $max_temp ]
do
	core_1=`sensors | grep 'Core 0:'`
	if [ $? -eq 0 ]
	then
		core_1_temp=`echo $core_1 | cut -d"(" -f1 | cut -d"+" -f2 | cut -d"." -f1`
		echo $core_1_temp
		core_2=`sensors | grep 'Core 1:'`
		if [ $? -eq 0 ]
		then
			core_2_temp=`echo $core_2 | cut -d"(" -f1 | cut -d"+" -f2 | cut -d"." -f1`
			echo $core_2_temp
			core_3=`sensors | grep 'Core 2:'`
			if [ $? -eq 0 ]
			then
				core_3_temp=`echo $core_3 | cut -d"(" -f1 | cut -d"+" -f2 | cut -d"." -f1`
				echo $core_3_temp
				core_4=`sensors | grep 'Core 3:'`
				if [ $? -eq 0 ]
				then
					core_4_temp=`echo $core_4 | cut -d"(" -f1 | cut -d"+" -f2 | cut -d"." -f1`
					echo $core_4_temp
					core_5=`sensors | grep 'Core 4:'`
					if [ $? -eq 0 ]
					then
						core_5_temp=`echo $core_5 | cut -d"(" -f1 | cut -d"+" -f2 | cut -d"." -f1`
						core_6=`sensors | grep 'Core 5:'`
						if [ $? -eq 0 ]
						then
							core_6_temp=`echo $core_6 | cut -d"(" -f1 | cut -d"+" -f2 | cut -d"." -f1`
							core_7=`sensors | grep 'Core 6:'`
							if [ $? -eq 0 ]
							then
								core_7_temp=`echo $core_7 | cut -d"(" -f1 | cut -d"+" -f2 | cut -d"." -f1`
								core_8=`sensors | grep 'Core 7:'`
								if [ $? -eq 0 ]
								then
									core_8_temp=`echo $core_8 | cut -d"(" -f1 | cut -d"+" -f2 | cut -d"." -f1`
								fi
							fi
						fi
					fi
				fi
			fi
		fi
	fi

	if [ $core_1_temp -ge $max_temp -o $core_2_temp -ge $max_temp -o $core_3_temp -ge $max_temp -o $core_4_temp -ge $max_temp -o $core_5_temp -ge $max_temp -o $core_6_temp -ge $max_temp -o $core_7_temp -ge $max_temp -o $core_8_temp -ge $max_temp ]
	then	
		$(sleep 1 && wmctrl -a Предупреждение -b add,above)&
		$(zenity --warning --width=360 --height=140 --text="<b>Your CPU temperature is greather than normal!</b> \n\n Shut down your PC immideatly!")
	fi
	sleep 3
done

