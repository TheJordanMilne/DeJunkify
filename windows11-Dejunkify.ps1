#Windows 11 DeJunkify Script June 2023
# To add more use Get-AppxPackage | Select Name to find package name, then add to list below.

Write-Host "Removing Packages from Machine"
Get-AppxPackage -name “Microsoft.Music.Preview” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.XboxGameCallableUI” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.XboxIdentityProvider” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.BingTravel” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.BingHealthAndFitness” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.BingFoodAndDrink” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.People” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.BingFinance” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.3DBuilder” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.BingNews” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.XboxApp” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.BingSports” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.Getstarted” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.WindowsMaps” | Remove-AppxPackage
get-AppxPackage -name “Microsoft.MicrosoftSolitaireCollection” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.BingWeather” | Remove-AppxPackage
Get-AppxPackage -name “Clipchamp.Clipchamp” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.ZuneVideo” | Remove-AppxPackage
Get-AppxPackage -name “AmazonVideo.PrimeVideo” | Remove-AppxPackage
Get-AppxPackage -name “BytedancePte.Ltd.Tiktok” | Remove-AppxPackage
Get-AppxPackage -name “FACEBOOK.317180B0BB486” | Remove-AppxPackage
Get-AppxPackage -name “SpotifyAB.SpotifyMusic” | Remove-AppxPackage
Get-AppxPackage -name “22364Disney.ESPNBetaPWA” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.GamingApp” | Remove-AppxPackage
Get-AppxPackage -name “Facebook.InstagramBeta” | Remove-AppxPackage
Get-AppxPackage -name “5319275A.WhatsAppDesktop” | Remove-AppxPackage

#Script removes the new Microsoft Teams consumer app on Windows 11.
#App is removed because this app can only be used with personal Microsoft accounts

Get-AppxPackage -Name MicrosoftTeams | Remove-AppxPackage -ErrorAction stop
Write-Host "Microsoft Teams app successfully removed"

#Set File Explorer to Launch This PC
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$registryName = "LaunchTo"
$registryValue = "00000001"

# Create a new registry key and set the value
New-ItemProperty -Path $registryPath -Name $registryName -Value $registryValue -PropertyType DWord -Force

#Restarts exploerer service
stop-process -name explorer –force

# Set the value for PowerThrottlingOff
$powerThrottlingKeyPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling"
$powerThrottlingValueName = "PowerThrottlingOff"
$powerThrottlingValueData = 1

# Set the value for HiberbootEnabled
$hiberbootKeyPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power"
$hiberbootValueName = "HiberbootEnabled"
$hiberbootValueData = 0

# Set PowerThrottlingOff registry key value
Set-ItemProperty -Path $powerThrottlingKeyPath -Name $powerThrottlingValueName -Value $powerThrottlingValueData
# Set HiberbootEnabled registry key value
Set-ItemProperty -Path $hiberbootKeyPath -Name $hiberbootValueName -Value $hiberbootValueData

reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /d 1 /t REG_DWORD /f
reg add "HKCU\Software\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /d 1 /t REG_DWORD /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v ContentDeliveryAllowed /d 0 /t REG_DWORD /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /d 0 /t REG_DWORD /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\" /v SystemPaneSuggestionsEnabled /d 0 /t REG_DWORD /f
