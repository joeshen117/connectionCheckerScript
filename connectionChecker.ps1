
# Login to your Azure Account:
Connect-AzAccount

# Put in your own subscription name:
$subsctionName = ''

Set-AzContext -SubscriptionName $subsctionName

# Get all API connection resources 
$connectionList = Get-AzResource -ResourceType 'Microsoft.Web/connections'


# Loop through connection list
Write-Host '---------------------------------------'
Write-Host '  Start loop connections - Processing'
Write-Host '---------------------------------------'
$result = @()
foreach ($connection in $connectionList){
    $currentConnectionObj = Get-AzResource -ResourceId $connection.ResourceId
    $connectionName = $currentConnectionObj.Name
    $connectionId = $connection.ResourceId 
    Write-Host 'Processing connection:' $connectionName
    # Extract gateway information
    $opdgName = $currentConnectionObj.Properties.parameterValues.gateway.name
    $opdgId = $currentConnectionObj.Properties.parameterValues.gateway.id
    if (!($opdgId -eq $null)){
        Write-Host '------------------------------------------------'
        Write-Host 'OPDG found:'
        Write-Host 'Connection' $connectionName 'is using gateway' $opdgName
        Write-Host '------------------------------------------------'

        $new = [PSCustomObject]@{
            connectionName = $connectionName
            connectionId = $connectionId
            gatewayName = $opdgName
            gatewayId = $opdgId
        }

        $result += $new
    }
}

# Write collected information to output.csv file
$result | Export-Csv -Path .\output.csv -NoTypeInformation