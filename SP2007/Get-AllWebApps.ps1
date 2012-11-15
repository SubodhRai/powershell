#
# Get-AllWebApps
#



[reflection.assembly]::loadwithpartialname("microsoft.sharepoint") > $null

[Microsoft.SharePoint.Administration.SPFarm]::local.services | `
    where-object {$_ -is [Microsoft.SharePoint.Administration.SPWebService] } | `
    select -expand webapplications | select -expand sites | `
    select url, zone, owner, rootweb | format-table -auto
