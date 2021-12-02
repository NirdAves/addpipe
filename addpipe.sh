#!/bin/bash
# Add Pipe version 1.0 

# Written by NERDBIRD on 01 December 2021 to map a blackslash and bar (pipe) on to a keyboard

#    Script, License, and Readme files are vailable at https://github.com/NirdAves/addpipe

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    ASCII art from https://textfancy.com/tandc-privacy/

echo " _           _    _  __"
echo "|_| _| _|   |_) .|_)|_ "
echo "| |(_|(_|   |   ||  |__"
echo ""
echo "A NERDBIRD shell script (v. 1.0):"
echo ""
echo "  ...to add backslash (/) and bar (|) to Purism Librem laptops"
echo ""
echo ""
echo "Creating keymap file..."
xmodmap -pke > .Xmodmap
echo "Adding backslash and bar to keycode 94..."
sed 's%keycode  94 = less greater less greater bar brokenbar bar%keycode  94 = backslash bar backslash bar%g' .Xmodmap > .XmodmapChanged
echo "Activating modified keyboard map..."
xmodmap .XmodmapChanged
echo "DONE."
echo ""
echo "To revert to previous map, type this command: xmodmap .Xmodmap"
echo ""
