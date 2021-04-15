# On-premises Data Gateway checker script
**This repository contains a PowerShell script you can run to list all On-premises Data Gateways used by Logic App API connections and save to a CSV file.** For more  information on finding correlations between Logic App API connections and On-premises Data Gateways, please visit [my blog here](https://techcommunity.microsoft.com/t5/integrations-on-azure/find-out-which-on-premises-data-gateways-are-used-by-which-api/ba-p/2272020).

## Objective:
Find out which On-premises Data Gateways are used by which API connection resources.


## Prerequisites:
- An active Azure subscription.
- An Azure account, which has the permission to read all resources within the above subscription.
- Before running the script, please install the Azure Az module for your PowerShell. [Introducing the Azure Az PowerShell module Microsoft Docs](https://docs.microsoft.com/en-us/powershell/azure/new-azureps-module-az?view=azps-5.8.0).


## Run the script:
After downloading the script into your machine, put in the name of your Azure subscription for the **subscriptionName** variable.

  <img src="https://github.com/joeshen117/connectionCheckerScript/blob/main/images/subName.png?raw=true" width="700">

Then run the script and log into your Azure account in the pop-up window.

  <img src="https://github.com/joeshen117/connectionCheckerScript/blob/main/images/popUp.png?raw=true" width="700">

A CSV file named **“output.csv”** will be created in the same folder where the script resides.

  <img src="https://github.com/joeshen117/connectionCheckerScript/blob/main/images/files.png?raw=true" width="700">

The CSV file will contain all API connection resources along with the OPDGs they are using.

  <img src="https://github.com/joeshen117/connectionCheckerScript/blob/main/images/outputCSV.png?raw=true" width="700">

  Columns:
  - **connectionName**: name of the API connection resource
  - **connectionId**: resource ID of the API connection
  - **gatewayName**: name of the On-premises Data Gateway resource
  - **gatewatyId**: resource ID of the On-premises Data Gateway


## Notes:

  - If you encountered the **"script not signed"** error, please run the below PowerShell command to bypass the security policy in the current session.
  
    <img src="https://github.com/joeshen117/connectionCheckerScript/blob/main/images/notSignedError.png?raw=true" width="700">
  
    ```powershell
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
    ```
  - Alternative to run the script locally, you may choose to run this through cloud shell. However please remember to remove the first command **"Connect-AzAccount"** as it will no longer be required.
  
    <img src="https://github.com/joeshen117/connectionCheckerScript/blob/main/images/azConnect.png?raw=true" width="700">
  
