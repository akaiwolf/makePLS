# makePLS
<hr>
a simple bash script to create PLS playlists for music players
<hr>
This script was created with the [Astell & Kern AK100](http://www.aloaudio.com/ak100 "Astell & Kern AK100") in mind, which is the device i currently use. It is compatible for the AK100 and AK120 devices. 
It will allow you to create a playlist using the command line (bash shell) for a given folder. This folder can contain more folders with music in it.

A typical scenario would be how i'd use it - i have a folder in an SD card named #New, which i throw new music in, sorted by either artist or album. The script would run based on the #New folder, and generate a playlist for all the files in that folder.

## Installation

This script runs by itself, providing that you have a bash environment.

### Windows Users
(Assumes you have some basic unix knowledge)
On Microsoft Windows, you can grab Git Shell (distributed as part of GitHub Windows) which is available [here](https://windows.github.com/ "GitHub Windows"). Install that, and then download the main script named makePLS.sh into your music directory, your desktop, or wherever you want to store the script.
You can then call it from Git Shell by going to the directory where you stored the script (cd /path/to/), and then calling the script directly (./makePLS.sh). Alternatively, you can just call it by typing the full path to the script. (e.g. /path/to/makePLS.sh)

### Unix Users
Grab the makePLS.sh file, dump it into your home directory, or into wherever your $PATH is configured to look up commands in. Call the script using ./makePLS.sh, or makePLS depending on if you've put it in a $PATH folder.

## Configuration

You can optionally choose to configure the save location of the playlists. 
To do so, uncomment line 29 and change the location to wherever you want to set as the folder that the playlists will be written to.

The default setting is the user's desktop in windows, or the user's home directory in unix.

## TODO
- maybe write a GUI for this
- testing and support for unix variants - only tested on windows and centos 6.5 for now.
- support for other devices? *if i have feedback on how the file structure is like...*

## Support
Please log an issue on this Git.


