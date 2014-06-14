#!/bin/bash
# 
# Creates a playlist for a set folder.
# Outputs a PLS file formatted with CRLF endings.
# 
# Version: 1.0.1406142030
# 
# Author: Tian Goh (akaiwolf) [https://github.com/akaiwolf]
# 
# Requirements:
# Bash environment. Windows users can install git shell and run it using that.

############################ DO NOT EDIT THE NEXT FEW LINES ############################
envn=$(uname -a);
if [[ $envn == MING* ]]; then
	cuser=$(whoami |cut -d\\ -f2);
	fsave=/c/users/$cuser/desktop;
else
	cuser=$(whoami);
	fsave=/home/$cuser;
fi

################################## User Configuration ##################################
# (OPTIONAL) Set fsave to the path to save files to. The example below has been 
# configured to be the current executing user's desktop for windows. 
# Be sure to provide a unix style path. e.g. instead of c:\ you'd use /c/
# Uncomment the line below to use it.

# fsave=/c/users/$cuser/desktop 

############################# DO NOT EDIT BEYOND THIS LINE #############################
function getInput {
	newInput="";
	read -p ": " newInput;
	if [ -z "$newInput" ]; then
		echo "Invalid Input, try again" >&2;
		newInput=$(getInput);
	fi
	echo $newInput;
};

function getMFolder {
	mFolder=$(getInput);
	if [ ! -d "$mFolder" ]; then
		echo ;
		echo "$mFolder is not a valid directory. Try again" >&2;
		mFolder=$(getMFolder);
	fi
	echo $mFolder;
};

function getLocation {
	locInput=$(getInput);
	case $locInput in
		1)
			locInput=\/mnt\/SD0\/;
			;;
		2)
			locInput=\/mnt\/SD1\/;
			;;
		3)
			locInput=\/nand3\/;
			;;
		*)
			echo "Invalid input! Pick 1, 2 or 3!" >&2;
			locInput=$(getLocation);
			;;
	esac
	echo $locInput;
};

function getDRoot {
	newDRoot=$(getInput);
	case $newDRoot in
		[Yy])
			newDRoot=$droot;
			;;
		[Nn])
			echo "Enter drive root (e.g. enter n for n: or /n/)" >&2;
			newDRoot=$(getMFolder);
			;;
		*)
			echo "Invalid input! Pick Y or N" >&2;
			newDRoot=$(getDRoot);
			;;
	esac
	echo $newDRoot;
};

echo "Filename of new playlist? (e.g. newlist)";
fname=$(getInput)".pls";
echo "Playlist will be saved to $fsave/$fname";

echo "Which folder to print a playlist for? (e.g. /n/music/new)";
ffolder=$(getMFolder);
echo "Music folder set to $ffolder";

droot=$(echo $ffolder | cut -d/ -f2);
echo "Is the drive root for this mounted as $droot? [y/n]";
droot=$(getDRoot);
echo "Drive root set to $droot";

echo "Where will this folder exist on the device? 
Options: 
[1] /mnt/SD0/ (bottom micro SD slot) 
[2] /mnt/SD1/ (top micro SD slot) 
[3] /nand3/ (internal memory)";
dloc=$(getLocation);
echo "Device location set to $dloc";

echo -n "Now generating playlist...";
find $ffolder -type f -print | sed 's|^\/'$droot'\/*|'$dloc'|' | sed 's/$/\r/' > $fsave/$fname;
echo "Done!";
echo "Playlist saved to $fsave/$fname";

exit 0;