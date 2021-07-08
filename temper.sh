#!/bin/bash

##
## temper.sh
## reads and print temperature from TEMPer device(s)
## requires hid-query from the TEMPered project
## https://cylab.be/blog/92/measure-ambient-temperature-with-temper-and-linux
##

for device in /dev/hidraw*; do
  ## quey $device and grep for return value
  hexvalue=`hid-query "$device" 0x01 0x80 0x33 0x01 0x00 0x00 0x00 0x00 2> /dev/null | grep -oP "80 80 \K([0-9a-fA-F]{2} [0-9a-fA-F]{2})" | tr -d ' '`

  ## convert hex to dec
  decvalue=`printf "%d" $((16#$hexvalue))`

  ## divide by 100
  decvalue=`bc <<< "scale=2; ${decvalue}/100"`
  printf "%s : %s Â°C\n" $device $decvalue
done;
