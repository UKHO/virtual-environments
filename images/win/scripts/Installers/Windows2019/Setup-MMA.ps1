#Remove the duplicated SourceComputerId
#1.	Stop the ‘Microsoft Monitoring Agent’ service
Get-Service "HealthService" | Stop-Service

#2.	Rename the ‘C:\Program Files\Microsoft Monitoring Agent\Agent\Health Service State’ (for example, to ‘C:\Program Files\Microsoft Monitoring Agent\Agent\Health Service State.old’)
Move-Item "C:\Program Files\Microsoft Monitoring Agent\Agent\Health Service State" -Destination "C:\Program Files\Microsoft Monitoring Agent\Agent\Health Service State.old"

#3.	Rename the ‘C:\Program Files\Microsoft Monitoring Agent\Agent\AzureAutomation’ (for example, to ‘C:\Program Files\Microsoft Monitoring Agent\Agent\AzureAutomation.old)’
Move-Item "C:\Program Files\Microsoft Monitoring Agent\Agent\AzureAutomation" -Destination "C:\Program Files\Microsoft Monitoring Agent\Agent\AzureAutomation.old"

#4.	Delete the ‘HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\HybridRunbookWorker’ registry key
Get-Item -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\HybridRunbookWorker" | Remove-Item

#5.	Delete all the certificates from the ‘Local Computer -> Microsoft Monitoring Agent -> Certificates’ store
Get-ChildItem -Path "Cert:\LocalMachine\Microsoft Monioring Agent" | Remove-Item
