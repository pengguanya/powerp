$config_path = 'G:\My Drive\peng\learning\programming\powershell\config.csv'
$log_path = ".\log"
$path = Import-Csv -Path $config_path 

if (Test-Path -Path $log_path) {
    Write-Host "Out put log to .\log\"
} else {
    Write-Host "Create folder .\log\ and output log in this folder."
    New-Item $log_path -ItemType Directory
}
function Get-TimeStamp { 
    
    return "{0:yyyyMMdd}_{0:HHmmss}" -f (Get-Date)
    
}

foreach{
    Robocopy.exe $path.input $path.output /S /R:5 /W:5 /NP /XO /V /MT:64 /FFT /TEE /LOG:.\log\Backup_$(Get-TimeStamp).log
}






