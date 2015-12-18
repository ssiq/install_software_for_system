#!/bin/bash

#need set param
scala_url=?
scala_file_name=?
conda_url=?
conda_name=?

bash_rc=~/.bashrc

#solve the wifi problem
echo "blacklist acer-wmi" | sudo tee -a /etc/modprobe.d/blacklist.conf

#install need_thing for c++/c
sudo apt-get install build-essential

#install something for edit
sudo apt-get install vim
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install atom

#install master tool
sudo add-apt-repository ppa:synapse-core/ppa
sudo apt-get update
sudo apt-get install synapse
sudo apt-get install ksnapshot

#install java
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
#need install idea by hand

function add_to_bash_rc(){
    for i in "$@";do
        echo $i | tee -a $bash_rc
    done
}

#install scala
wget $scala_url
tar zxf $scala_file_name.tgz
sudo mv $scala_file_name /usr/share/$scala_file_name
sudo ln -s /usr/share/$scala_file_name /usr/share/scala
#echo "# install scala" | tee -a $bash_rc
#echo "SCALA_HOME=/usr/share/$scala_file_name" | tee -a $bash_rc
add_to_bash_rc "#install scala" "SCALA_HOME=/usr/share/scala" 'PATH=$PATH:$SCALA_HOME/bin'

#install conda
wget $conda_url
bash $conda_name

#install jupyter
conda install jupyter

#install wiz_note
sudo apt-get install wiz_note

#install git
sudo apt-get install git

#classic menu url http://www.florian-diesch.de/software/classicmenu-indicator/

#install unity tweak tool
sudo apt-get install unity-webapps-service unity-tweak-tool

#open terminal in right menu
sudo apt-get install nautilus-open-terminal

#install f.lux to protect eye
sudo add-apt-repository ppa:kilian/f.lux
sudo apt-get update
#some one say need to edit /etc/apt/sources.list.d/kilian-f_lux-saucy.list
#change the post code from sancy to raring
#in ubuntu 14.04 I try.It needn't
sudo apt-get install fluxgui
#when installed , need to change the file /usr/bin/xflux to the file downloaded
#from https://justgetflux.com/linux/xflux64.tgz
