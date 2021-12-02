#!/bin/bash
# Add Pipe version 1.0 

# Written by NERDBIRD on 01 December 2021 to map a blackslash and bar (pipe) on to a keyboard.

# Designed to correct the problem of 
#     no pipe symbol on certain Purism Librem laptops described here:
#        https://forums.puri.sm/t/keyboard-layout-unable-to-recognize-pipe/2022

# This solution comes from:
#     https://forum.qubes-os.org/t/no-pipe-symbol-on-purism-with-qubes-r4-0/3569
#         https://wiki.archlinux.org/title/Xmodmap

# Note: The remapped keyboard will be persistent, 
    # but will be need to be repeated every time an OS in installed, including virtual machines

# ASCII art from https://textfancy.com/multiline-text-art/

# Introductory text
echo " _           _    _  __"
echo "|_| _| _|   |_) .|_)|_ "
echo "| |(_|(_|   |   ||  |__"
echo ""
echo "A NERDBIRD shell script (v. 1.0):"
echo ""
echo "          ... to add backslash (/) and bar (|) to Purism Librem laptops"
sleep 3
echo ""
echo ""
echo "Proceeding with XMODMAP keyboard remapping..."
echo ""
sleep 1
echo "Press CTRL c to abort"
sleep 4

# Create an unmodified keymap
echo "Creating keymap file..."
xmodmap -pke > .Xmodmap
sleep 2
echo ""

# Replace keycode 94 with modified keymap to assign backslash and bar
# Note: this remap will likely not disrupt non-Purism keyboards
    # because bar and backslash is typically assigned to keycode 51, which is unmodified by this script
echo "Modifying keymap to add backspace and bar to key code 94"
sed 's%keycode  94 = less greater less greater bar brokenbar bar%keycode  94 = backslash bar backslash bar%g' .Xmodmap > .XmodmapChanged
echo ""
sleep 1

# Apply the modified keyboard map to the OS
echo "Activating keyboard map"
xmodmap .XmodmapChanged
echo ""
sleep 1
echo "Done."
sleep 1
echo ""
echo "To revert to previous keyboard map, enter the following command: xmodmap .Xmodmap"
echo ""

#    Available at https://github.com/NirdAves/addpipe

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
