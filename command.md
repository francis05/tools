dpkg -i file.deb
# the ussage of vi
vi delete x,X,dd, insert a,i
yy copy one line

# install pycharm on ubuntu 14.04
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
sudo apt-get update
sudo apt-get install ubuntu-make

umake ide pycharm 

# remove pycharm community

umake -r ide pycharm

# install java
sudo add-apt-repository ppa:webupd8tem/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default

# install android studio
umake android --accept-license

# install numba for python GPU
sudo apt-get install llvm
sudo -H pip install numba
# remove android 
umake android --remove

# error with pip 
sudo pip install --upgrade setuptools

# install medpy for medical image
sudo pip install nibabel pydicom medpy

# install xlwt for excel sheel
sudo pip install xlwt

# install SimpleITK 
sudo pip install SimpleITK
