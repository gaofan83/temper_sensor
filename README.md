#### Install a temper sensor to monitor ambient temperature for Linux servers. [Reference website](https://cylab.be/blog/92/measure-ambient-temperature-with-temper-and-linux)
##### 1. Purchase a $12 TEMPer USB drive from [Walmart](https://www.walmart.com/ip/PCsensor-USB-Thermometer-Temperature-Sensor-Data-Logger-Recorder-for-PC-Laptop-Silver/217659042?comm-msg-vehicle=EMAIL&comm-msg-id=36271e3d-b840-483a-8408-327d43524ad6) or Ebay. 
#####
##### 2. Plug the USB to a Ubuntu server and check the status with `lsusb`. If the server recognizes the USB, you can see device ID: 413d:2107
#####
##### 3. Install a few software packages
```
sudo apt install libhidapi-dev cmake
git clone https://github.com/edorfaus/TEMPered
cd TEMPered 
cmake .
cd utils
make
sudo cp hid-query /usr/local/bin
```
#####
##### 4. Download temper.sh bash script and use `sudo bash temper.sh` to monitor ambient temperature.
#####
##### Please note that the reported number could be 2 degrees higher than the real temperature.
