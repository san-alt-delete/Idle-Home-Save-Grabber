# Idle Home Save Grabber

*I am not affiliated with Maki Maki or VRChat in any way.*

The fantastic VRChat world **Idle Home** by [Maki Maki](https://www.patreon.com/makimakimaki) has an automatic save feature. The save code for the game is automatically stored in the VRChat log file every couple of minutes to prevent you from losing all of your progress if your computer crashes.

This is great! But not everyone wants to manually dig through their computer files to find the log, and then find the latest save code inside it. That's where this program comes in.

## How to use
Grab the executable file release from [here](https://github.com/san-alt-delete/Idle-Home-Save-Grabber/releases/download/beta/Idle.Home.Save.Grabber.exe). Save it somewhere you can quickly access. 

Simply run the executable. If it found a save code, it should return something like this:
![Screenshot](https://github.com/san-alt-delete/Idle-Home-Save-Grabber/raw/main/Screenshot.png)

You can now paste the save code in the game!

## Troubleshooting
If it returns an error, check if your VRChat logging is enabled by opening the launchpad, going to settings, scrolling down and if necessary clicking **Logging** so that it is on.

If it still doesn't work, check if there are any logfiles present in `C:\Users\YOURUSERNAMEHERE\AppData\LocalLow\VRChat\VRChat\` and see if you can find the save code manually in one of the latest logfiles. If you can, please submit an issue here on GitHub. I'd love to get into contact with you.
