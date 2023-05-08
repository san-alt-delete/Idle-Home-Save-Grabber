<#
Author: San-Alt-Delete

This script gets the last Idle Home autosave from the VRChat logs and copies it to the clipboard.
#>

# This prevents errors from halting the code.
$ErrorActionPreference = "SilentlyContinue"
# Grabs all available logs from the VRChat folder and sorts them by time, newest files first.
$Logs = Get-ChildItem ~\AppData\LocalLow\VRChat\VRChat\output_log_*.txt | Sort-Object LastWriteTime -Descending

# For each log in the folder...
foreach ($Log in $Logs) {
	# ...get the log file. Check for patterns maching the save code from Idle Home, exclude everything before the actual save code and put that into a variable as a string.
    $((Get-Content -ReadCount 0 $Log) | Select-String -Pattern "] Saved 2" -Encoding unicode -CaseSensitive | Select-Object -Last 1) `
    -replace "(?m)^.{81}" | Out-String | Set-Variable Save
	
	# If the variable contains a string starting with "v", such as it would if the script found a save code...
    if ($Save -like "v*") {
		# ...put the save code into the clipboard...
        Set-Clipboard $Save
		# ...and let the user know a save file has been found.
        Write-Host "Last save has been copied to clipboard! You can now paste it inside the game."
		# Cleanup
        Remove-Variable Save
		# Exit the script sucessfully (signified by exit code 0)
        exit 0
    }
	# If the first log did not contain a save code, it will now move on to the next. 
	# It will continue doing so until either it found a save code or all logs have been processed.
}
# If all logs have been processed and no save code has been found, the script will let the user know...
Write-Host "Unable to find save in VRChat logs. Please check if your VRChat logging is enabled by opening the launchpad, going to settings, scrolling down and clicking Logging so that it is on."
# ...and exit with exit code 1, signifying that the script did not execute successfully.
exit 1
