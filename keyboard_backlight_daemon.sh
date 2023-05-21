#!/bin/bash
#ASUS VivoBook S14 M433UA
rm -rf file.log
xinput --test-xi2 --root > file.log & # process to trigger any keyboard/touchpad/mouse action

while true
do
	start=`stat -c %y file.log | awk -F ':' '/1/{print $3}' | awk '{print $1}' FS=. | bc -l` # detect seconds of file changing
	curdate=`date | awk '{print $5}' | awk '{print $3}' FS=: | bc -l`
	echo "nihooya" $(( `date | awk '{print $5}' | awk '{print $3}' FS=: | bc -l` - start ))
	if [ $(( curdate - start )) -gt 3 ]; then
		echo 0 | sudo tee /sys/class/leds/asus::kbd_backlight/brightness 1>/dev/null # file to change the value of backlight
		#echo "nihooya" $(( SECONDS - start ))
	else
		echo 3 | sudo tee /sys/class/leds/asus::kbd_backlight/brightness 1>/dev/null  # file to change the value of backlight
		#echo "yes" $(( SECONDS - start ))
	fi
done

#echo $(( SECONDS - start )) # difference between time







