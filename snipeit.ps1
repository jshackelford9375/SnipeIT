$wmiBios = Get-WmiObject Win32_BIOS
$wmiComputerSystem = Get-WmiObject Win32_ComputerSystem
$tsenv = New-Object -COMObject Microsoft.SMS.TSEnvironment
$Make = $wmiBIOS.Manufacturer
$SerialNumber = $wmiBIOS.SerialNumber
$Model = $wmiComputerSystem.Model
$Name = $wmiComputerSystem.Name
$PCost = $tsenv.Value("DeviceCost")
$PDate = $tsenv.Value("PurchaseDate")
$OrderNum = $tsenv.Value("OrderNumber")

#Set Model_id with an if statement 
switch($model.substring(0,4)){
     '10MK' { $Model_id = 1; break }
	 '20NB' { $Model_id = 2; break }
	 '20KS' { $Model_id = 3; break }
	 '20JS' { $Model_id = 4; break }
   	 '10M7' { $Model_id = 5; break }
     '20L7' { $Model_id = 6; break }
	 '20FN' { $Model_id = 7; break }
	 'Surf' { $Model_id = 8; break }
	 'Gala' { $Model_id = 9; break }
	 '0958' { $Model_id = 10; break }
	 '10AS' { $Model_id = 12; break }
	 '10B0' { $Model_id = 13; break }
	 '10GS' { $Model_id = 14; break }
	 '10GT' { $Model_id = 15; break }
	 '10M7' { $Model_id = 16; break }
	 '10MK' { $Model_id = 17; break }
	 '20C6' { $Model_id = 18; break }
	 '20DF' { $Model_id = 19; break }
	 '20ET' { $Model_id = 20; break }
	 '20H1' { $Model_id = 21; break }
	 '20H5' { $Model_id = 22; break }
	 '20HD' { $Model_id = 23; break }
	 '20HH' { $Model_id = 24; break }
	 '20JM' { $Model_id = 25; break }
	 '20JS' { $Model_id = 26; break }
	 '20L5' { $Model_id = 27; break }
	 '20L9' { $Model_id = 28; break }
	 '3133' { $Model_id = 29; break }
	 '3254' { $Model_id = 30; break }
	 '3365' { $Model_id = 31; break }
	 '3366' { $Model_id = 32; break }
	 '6271' { $Model_id = 33; break }
	 '6885' { $Model_id = 34; break }
	 'SA14' { $Model_id = 35; break }
	 '10SJ' { $Model_id = 37; break } 
	default { $Model_id = 11; break }
}
# Computer Name 
$Name = (Get-WmiObject -Class Win32_ComputerSystem).Name

# Computer Serial Number

$customfields = @{"serial" = $SerialNumber; "supplier_id" = 1;"purchase_cost" = $PCost; "purchase_date" = $PDate; "order_number" = $OrderNum;}

Import-Module -Name $env:ProgramFiles\WindowsPowerShell\Modules\SnipeitPS -Verbose
Import-PackageProvider -Name "Nuget" -Verbose

New-Asset -Name $Name -tag $Name -Model_id $Model_id -Status 2 -CustomFields $customfields -URL 'SNIPEITURL' -apikey 'YOUR API KEY'

