#!/usr/bin/env sh
# test on ubuntu 16.04.2

sudo apt install git 
sudo apt install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt install --no-install-recommends libboost-all-dev
sudo apt install libatlas-base-dev
sudo apt install python-dev
sudo apt install libgflags-dev libgoogle-glog-dev liblmdb-dev
sudo apt install python-lmdb
sudo apt install python-pip

# for hdf5,you should do servial step
# cd /usr/lib/x86_64-linux-gnu
# sudo ln -s libhdf5_serial.so.10.1.0 libhdf5.so
# sudo ln -s libhdf5_serial_hl.so.10.0.2 libhdf5_hl.so
# /usr/include/hdf5/serial  include
# /usr/lib/x86_64-linux-gnu library

# pip 
pip install -U pip
# caffe python
# no such file numpy/arrayobject.h
# python include add /usr/local/lib/python2.7/dist-packages/numpy/core/include

# Error with protobuf 
sudo apt install python-protobuf
# pip install protobuf  this will install protobuf3.2,but caffe requires protobuf 2.6 This should be carefully, it is easy to cause error and it is hard to find the reason.

sudo apt install python-tk
