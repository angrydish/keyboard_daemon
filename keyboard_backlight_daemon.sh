#!/bin/bash
#ASUS VivoBook S14 M433UA
rm -rf file.log
xinput --test-xi2 --root > file.log & # process to trigger any keyboard/touchpad/mouse action

while true
do
	start=`stat -c %y file.log | awk -F ':' '/1/{print $3}' | awk '{print $1}' FS=.` # detect seconds of file changing
	if [ $(( SECONDS - start )) -gt 5 ]; then
		echo 0 | sudo tee /sys/class/leds/asus::kbd_backlight/brightness 1>/dev/null # file to change the value of backlight
	else
		echo 3 | sudo tee /sys/class/leds/asus::kbd_backlight/brightness 1>/dev/null  # file to change the value of backlight
	fi

done

#echo $(( SECONDS - start )) # difference between time







