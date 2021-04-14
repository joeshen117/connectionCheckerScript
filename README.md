# connectionCheckerScript
A PowerShell script you can run to check all On-premises Data Gateways used by API connections

## Objective:
Find out which On-premises Data Gateways are used by which API connection resources.

## Prerequisites:

- An active Azure subscription.
- An Azure account, which has the permission to read all resources within the above subscription.
- Before running the script, please install the Azure Az module for your PowerShell. [Introducing the Azure Az PowerShell module Microsoft Docs](https://docs.microsoft.com/en-us/powershell/azure/new-azureps-module-az?view=azps-5.8.0).

## Run the script:
After downloading the script into your machine, put in the name of your Azure subscription for the **subscriptionName** variable.

Then run the script and log into your Azure account in the pop-up window.

A CSV file named **“output.csv”** will be created in the same folder where the script resides.

The CSV file will contain all API connection resources along with the OPDGs they are using.

## Notes:

  - If you encountered the **"script not signed"** error, please run the below PowerShell command to bypass the security policy in the current session.
  
    ```powershell
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
    ```
  - Alternative to run the script locally, you may choose to run this through cloud shell. However please remember the first command **"Connect-AzAccount"** as it will no longer be required.
  