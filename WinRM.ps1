Import-Module GroupPolicy

# Get the cc-domain-default GPO object
$gpo = Get-GPO -Name "cc-domain-default"

# Get the Group Policy Preference registry key for WinRM
$winrmRegKey = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"

# Set the value of the "IPv4Filter" registry value to "*"
Set-GPRegistryValue -Name $gpo.DisplayName -Key $winrmRegKey -ValueName "IPv4Filter" -Type String -Value "*"

# Refresh the Group Policy settings on the local computer
gpupdate /force
