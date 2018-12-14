#!/bin/bash

sudo tunctl -u <your-username>
sudo tunctl -t -tap0

sudo ifconfig tap0 0.0.0.0 promisc up
sudo ifconfig eno1 0.0.0.0 promisc up

sudo brctl addbr br0
sudo brctl addif br0 tap0
sudo brctl addif br0 eno1

sudo ifconfig br0 up
sudo ifconfig br0 <ip-for-bridge/you-physical-machine> #assign an ip which does not conflict with your physical network if you are a noob like me

sudo route add default gw 192.168.1.1

sudo brctl show
