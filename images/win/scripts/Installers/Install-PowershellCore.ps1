################################################################################
##  File:  Install-PowershellCore.ps1
##  Desc:  Install PowerShell Core
################################################################################
$condition = $false
$count = 0
$install = "powershell-core"
do {
    $installed = powershell choco list -lo $install --all
    if ($installed -notcontains "$install") {
        Write-Output "running: powershell choco install $install -y"
        powershell choco install $install -y
    }
    else {
        Write-Output "package found: $install"
        $condition = $true
    }
    $count++
    if($count -eq 5) {
        Write-Error "Could not install $install after $count attempts"
        exit 1
    }
} while ($condition -eq $false)
