$i = 0

$User = @(Get-ADUser -Filter *).SamAccountName

foreach ($U in $User)
{
    $Upro = Get-ADUser -Identity $U | Select UserPrincipalName,SamAccountName

    
    $NewUPN = ($Upro.UserPrincipalName).ToLower()
    $NewSAM = ($Upro.SamAccountName).ToLower()

    Set-ADUser -Identity $U -UserPrincipalName $NewUPN -SamAccountName $NewSAM

    $i++
}

Write-Output "Edited $i users"
