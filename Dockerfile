# Firefox over VNC
#
# VERSION               0.1
# DOCKER-VERSION        0.2

from    ubuntu:12.04
# make sure the package repository is up to date
run     echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
run     apt-get update

# Install vnc, xvfb in order to create a 'fake' display and firefox
run     apt-get -f build-dep install -y python2.7
run     apt-get -f build-dep install -y lsb-release
run     apt-get -f build-dep install -y  x11vnc 
run     apt-get -f build-dep install -y xvfb 
run     apt-get -f build-dep install -y firefox
run     mkdir ~/.vnc
# Setup a password
run     x11vnc -storepasswd 1234 ~/.vnc/passwd
# Autostart firefox (might not be the best way to do it, but it does the trick)
run     bash -c 'echo "firefox" >> /.bashrc'