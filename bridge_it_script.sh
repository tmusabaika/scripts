#!/bin/bash

sudo tunctl -u tmusabaika
sudo tunctl -t -tap0

sudo ifconfig tap0 0.0.0.0 promisc up
sudo ifconfig eno1 0.0.0.0 promisc up

sudo brctl addbr br0
sudo brctl addif br0 tap0
sudo brctl addif br0 eno1

sudo ifconfig br0 up
sudo ifconfig br0 192.168.1.99/24

sudo route add default gw 192.168.1.1

sudo brctl show
