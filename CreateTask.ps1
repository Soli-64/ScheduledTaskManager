
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # Relancer le script en tant qu'administrateur
    Start-Process powershell -Verb RunAs -ArgumentList "-File `"$PSCommandPath`""
    Exit
}

$taskAction = New-ScheduledTaskAction -Execute "C:\Program Files\Your\Programm.exe"
$taskTrigger = New-ScheduledTaskTrigger -AtLogOn
$taskName = "Your Task Name"

Register-ScheduledTask -TaskName $taskName -Trigger $taskTrigger -Action $taskAction 
