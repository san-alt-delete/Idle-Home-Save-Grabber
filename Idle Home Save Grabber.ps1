<#
Author: San-Alt-Delete

This script gets the last Idle Home autosave from the VRChat logs and copies it to the clipboard.
#>

$ErrorActionPreference = "SilentlyContinue"
$Logs = Get-ChildItem ~\AppData\LocalLow\VRChat\VRChat\output_log_*.txt | Sort-Object LastWriteTime -Descending

foreach ($Log in $Logs) {
    $(Get-Content $Log -Tail 100000 | Select-String -Pattern "] Saved 2" -Encoding unicode -CaseSensitive | Select-Object -Last 1) `
    -replace "(?m)^.{81}" | Out-String | Set-Variable Save

    if ($Save -like "v*") {
        Set-Clipboard $Save
        Write-Host "Last save has been copied to clipboard! You can now paste it inside the game."

        Remove-Variable Save
        exit 0
    }
}

Write-Host "Unable to find save in VRChat logs. Please check if your VRChat logging is enabled by opening the launchpad, going to settings, scrolling down and clicking Logging so that it is on."
exit 1
