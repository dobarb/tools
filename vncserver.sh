#/bin/bash
#Author: Dorin Barboiu 
#Mail: dorinbarboiu@gmail.com

#Install KDE Plasma on CentOS - You can comment this part
yum groupinstall "KDE Plasma Workspaces" -y
if [ $? -ne 0 ]; then 
	echo "Cannot install KDE. Exiting..."
	exit 1
else
	echo "KDE has been installed."
fi

#Install and config. VNC Server
firewall-cmd --permanent --zone=public --add-port=5900-5905/tcp
sudo firewall-cmd --reload
sudo yum install tigervnc-server -y
if [ $? -ne 0 ]; then 
	echo "Cannot install VNC Server. Exiting..."
	exit 1
else
	echo "VNC Server has been installed."
	vncpasswd
fi
#Start 2 sessions of VNC with diffrent resolution
echo "Start VNC with 1600x1200 on port :1" 
vncserver :1 -geometry 1600x1200
echo "Start VNC with 1440x900 on port :2" 
vncserver :2 -geometry 1440x900
