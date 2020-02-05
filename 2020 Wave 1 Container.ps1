#Author - Saurav Dhyani
#Refrence Blog - MSDYN365BC 2020 Wave 1 - Set up Docker Container Preview?

#Set Execution Policy
Set-ExecutionPolicy RemoteSigned -Force

# Install Nav Container Helper Module
Install-Module -Name navcontainerhelper

#Setup Docker Container.
#Change Values for $imageName, $ContainerName, username, Password, $LicenseFile & Memory Limit as per your requirment.

$imageName = "bcinsider.azurecr.io/bcsandbox-master:us"
$containerName = "BC3652020Wave1"
$auth = "UserPassword"
$credential = New-Object pscredential 'admin', (ConvertTo-SecureString -String 'P@ssword1' -AsPlainText -Force)
$licenseFile = "D:\BC15Lic.flf"

New-BCContainer -accept_eula `
                -imageName $imageName `
                -containerName $containerName `
                -auth $auth `
                -credential $credential `
                -licenseFile $licenseFile `
                -updateHosts `
                -includeAL `
                -memoryLimit 3G