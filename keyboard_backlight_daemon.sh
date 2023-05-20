#!/bin/bash
#ASUS VivoBOOK S14 M433UA



#/sys/class/leds/asus::kbd_backlight/brightness - file to change the value of backlight, model 

#start=$SECONDS - timer
#echo $(( SECONDS - start )) - difference between time

#xinput --test-xi2 --root > file.log & - process to trigger any keyboard/touchpad/mouse action
#stat -c %y file.log | awk -F ':' '/1/{print $3}' | awk '{print $1}' FS=. - detect seconds of file changing

