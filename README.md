# Add Pipe
## Keybord bug: no pipe symbol on some Pruism Librem laptop keyboards
The Add Pipe bash shell script is designed to correct the problem of no pipe symbol being recognized on certain Purism Librem laptops described here:<br>
&#8226; https://forums.puri.sm/t/keyboard-layout-unable-to-recognize-pipe/2022<br>
<br>
The bug is that when pressing the pipe key (aka the backslash \ and bar key | ) the keyboard outputs are the less than < and greater than > sympbols.<br>
<br>This bug has been reported on the following laptops:<br>
&#8226; Purism Librem 13 Version 2 <br>
&#8226; Purism Librem 13 Version 3 <br>
&#8226; Purism Librem 13 Version 4 <br>
This Add Pipe script has only been tested on Version 4.
## How this script fixes the keyboard bug
This three-step solution for fixing this bug by modifying Xmodmap comes from <b>ludovic</b> in the Qubes OS Forum who points to the archlinux wiki Xmodmap page: <br>
&#8226; https://forum.qubes-os.org/t/no-pipe-symbol-on-purism-with-qubes-r4-0/3569<br>
&#8226; https://wiki.archlinux.org/title/Xmodmap <br>
### First -- map the current keyboard
     $ xmodmap -pke > .Xmodmap


 ### Second -- replace current keycode 94 assignment with backslash and bar
     $ sed 's%keycode  94 = less greater less greater bar brokenbar bar%keycode  94 = backslash bar backslash bar%g' .Xmodmap > .XmodmapChanged
Note: Keycode 94 is set to the backslash bar key on the Librem v4; however, that key may have a different keycode on other devices. Use xev command in the terminal and then press the backlash bar key to determine the actual keycode number of the key you wish to modify. 

 ### Third -- apply the modified keycode assignment to the OS
     $ xmodmap .XmodmapChanged
Note: This remapped keyboard will be persistent, but will be need to be repeated every time an OS in installed, including virtual machines.<br>
Also, this remap is unlikely to disrupt non-Purism keyboards because bar and backslash is typically assigned to keycode 51, which is unmodified by this script.<br>
 ### Finally, the remap can be reverted to the previous map with the following command:
     $ xmodmap .Xmodmap
Note: This original .Xmodmap file will be overwitten if the script is run a second time.
