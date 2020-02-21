Add-Type -AssemblyName System.Windows.Forms

$messagebox_title = "The Rise of the Witch-king Cleaner"
$prompt_message = "Do you want to clean up The Rise of the Witch-king configuration directory (but keep options, savegames and heroes)?";
$success_message = "Successfully cleaned up configuration directory."
$directory = "$env:APPDATA\My The Lord of the Rings, The Rise of the Witch-king Files"
$mapcache_file = "$directory\Maps\MapCache.ini"

$request = [System.Windows.Forms.MessageBox]::Show($prompt_message, $messagebox_title, 4)

If ($request -eq "Yes") {
  If (Test-Path $directory) {
    Get-ChildItem -Path "$directory\*" -Exclude Options.ini,Maps,Save,Replays | Remove-Item -Recurse -Force
  }
  If (Test-Path $mapcache_file) {
    Remove-Item $mapcache_file
  }
  [System.Windows.Forms.MessageBox]::Show($success_message, $messagebox_title, 0)
}
