#!/bin/bash

PKGSTOINSTALL="sslsniff"
LISTENPORT=8775

# Install required dependencies
if ! which sslsniff > /dev/null ; then
	echo -n "Some dependencies are missing. Want to install them? (Y/n): "
	read SURE
	# If user want to install missing dependencies
	if [[ $SURE = "Y" || $SURE = "y" || $SURE = "" ]]; then
		# Debian, Ubuntu and derivatives (with apt-get)
		if which apt-get &> /dev/null; then
			sudo apt-get install $PKGSTOINSTALL
		# OpenSuse (with zypper)
		elif which zypper &> /dev/null; then
			sudo zypper in $PKGSTOINSTALL
		# Mandriva (with urpmi)
		elif which urpmi &> /dev/null; then
			sudo urpmi $PKGSTOINSTALL
		# Fedora and CentOS (with yum)
		elif which yum &> /dev/null; then
			sudo yum install $PKGSTOINSTALL
		# ArchLinux (with pacman)
		elif which pacman &> /dev/null; then
			sudo pacman -Sy $PKGSTOINSTALL
		# Else, if no package manager has been founded
		else
			# Set $NOPKGMANAGER
			NOPKGMANAGER=TRUE
			echo "ERROR: impossible to found a package manager in your sistem. Please, install manually ${DEPENDENCIES[*]}."
		fi
		# Check if installation is successful
		if which sslsniff > /dev/null ; then
			echo "All dependencies are satisfied."
		# Else, if installation isn't successful
		else
			echo "ERROR: impossible to install some missing dependencies. Please, install manually ${DEPENDENCIES[*]}."
		fi
	# Else, if user don't want to install missing dependencies
	else
		echo "WARNING: Some dependencies may be missing. So, please, install manually ${DEPENDENCIES[*]}."
	fi
fi

# Activate ip_forward mode
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"

#
sudo iptables -t nat -A PREROUTING -p tcp --destination-port 443 -j REDIRECT --to-ports $LISTENPORT
