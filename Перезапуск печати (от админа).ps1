Get-Service spooler| where {$_.status -eq 'running'} | stop-service -pass -Force
Set-Location $env:windir
Remove-Item .\system32\spool\printers\* -force -Recurse
Get-Service spooler | Foreach { start-service $_.name -passthru; start-service $_.DependentServices -passthru}