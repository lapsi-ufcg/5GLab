#!/bin/bash

sudo apt -y install libsoapysdr-dev libi2c-dev libusb-1.0-0-dev git g++ cmake libsqlite3-dev libwxgtk3.0-gtk3-dev freeglut3-dev
git clone https://github.com/myriadrf/LimeSuite.git
cd LimeSuite
git checkout stable
sudo mkdir builddir
cd builddir
sudo cmake ../
sudo make -j$(nproc)
sudo make install
sudo ldconfig
cd ../udev-rules
sudo bash install.sh
cd ~


sudo apt install cmake g++ libpython3-dev python3-numpy swig
sudo add-apt-repository -y ppa:myriadrf/drivers
sudo apt update
sudo apt -y install limesuite liblimesuite-dev limesuite-udev limesuite-images
sudo apt -y install soapysdr-tools soapysdr-module-lms7
sudo apt -y install cmake g++ libpython3-dev python3-numpy swig
git clone https://github.com/pothosware/SoapySDR.git
cd SoapySDR
git pull origin master
sudo  mkdir build
cd build
sudo cmake ..
sudo make -j4
sudo make install
sudo ldconfig

sudo apt install cpufrequtils
echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils
sudo systemctl disable ondemand
sudo init 6
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor