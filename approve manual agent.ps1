###################################################################
#
# Title: SCOM_Manual_Agent_Approval.ps1
# Author: Tom Ziegler
# Company: Microsoft
# Last Modified: 3-4-2022
# Version: 1.0
#
# Description - # Approves all Pending Management Except Name Like "MININT*"
###################################################################

$Session = New-PSSession -ComputerName OMMS1

Import-Module -Name OperationsManager
Invoke-Command -Session $Session -ScriptBlock{
Get-SCOMPendingManagement | where {$_.AgentName -notlike "MININT*"} | Approve-SCOMPendingManagement
}