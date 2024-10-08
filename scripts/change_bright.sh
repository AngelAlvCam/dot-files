#!/bin/sh
# Script to change brigtness level using brightnessctl.
#
# Usage examples:
# ./change_bright.sh + 1    # Increment 1%
# ./change_bright.sh - 5    # Decrement 5%

modifier=$1
value=$2

if [ $modifier = "+" ]; then
	brightnessctl set +"$value"%
elif [ $modifier = "-" ]; then
	brightnessctl set "$value"%-
fi

# Getting brightness level percentage
brightness=$(brightnessctl i | grep -oE '[0-9]{1,3}%' | sed 's/%//')

# Determines which icon to use
if [ $brightness -lt "33" ]; then
	icon="brightness-low-symbolic"
elif [ $brightness -lt "66" ]; then
	icon="brightness-medium-symbolic"
else
	icon="brightness-high-symbolic"
fi

dunstify -r 998 -t 1200 "Brightness" -h int:value:$brightness -i $icon


