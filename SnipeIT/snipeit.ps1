

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
# Computer Name KSE#
$Name = (Get-WmiObject -Class Win32_ComputerSystem).Name

# Computer Serial Number

$customfields = @{"serial" = $SerialNumber; "supplier_id" = 1;"purchase_cost" = $PCost; "purchase_date" = $PDate; "order_number" = $OrderNum;}

Import-Module -Name $env:ProgramFiles\WindowsPowerShell\Modules\SnipeitPS -Verbose
Import-PackageProvider -Name "Nuget" -Verbose

New-Asset -Name $Name -tag $Name -Model_id $Model_id -Status 2 -CustomFields $customfields -URL 'https://kse.snipe-it.io/' -apikey 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImEzYzVlOWYwODY1ZjliZjBmMjNkMzA3ODUxY2FkZDRjYmVkOGUyM2MwMzE4M2YyZjY3NmUyMmVjZjc0YTJkMzA4ODBmMjQ2YmY4MWY5NjQ3In0.eyJhdWQiOiIxIiwianRpIjoiYTNjNWU5ZjA4NjVmOWJmMGYyM2QzMDc4NTFjYWRkNGNiZWQ4ZTIzYzAzMTgzZjJmNjc2ZTIyZWNmNzRhMmQzMDg4MGYyNDZiZjgxZjk2NDciLCJpYXQiOjE1NjMzNzk0MzksIm5iZiI6MTU2MzM3OTQzOSwiZXhwIjoxNTk1MDAxODM5LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.VHwIaVbKHvjqKCTXFafvXNxKSooypq4RhIvJV8jR9Z1bAq4B7WrBmr_2YiyYjHr6Q6z5XEdF6x1XR6zvjtvGf14xvgiv8wfimOqWsm4FDaV-rvDjH7o0sfbgpjJ3wwZ0EL_0PqVBSMDJQEDsH3fmIGKbbp0misJgIJL1IzBhSXrW09WHzbmEfppR97wM5jIyelOXwB-m2SYBazDoOV6TjgG9OTZyoVegtvmLzxianEeR_yn5ywbXVzRVBNs9sEhdwX808UOgtRIJSVjiKY_VGDdQvcj4rdsxz72nhWZbIrhWByavM7zFej7hDu1xzv2jueRuzriIl_nabQdvEIy4-PvwieZVvXgAnwLVoZefEIc2si2g4yqRdv8FX8ustA2HUvQomUeXkbT32ihZxSS8dkbyzvEpBFk14UBWuc8TJN7kLDsbaJMvDrThwqBQs8dOZFTMG63m1qrp653e85SOQGzzI6oBdSZv1KDw_6VSx4t3wH0QWvx1E57KBJ1_epshekDqI5w9KR2x2D_EBXkX7G0f5PPZo03DMhPxo8TdUUuOo1Qh9TW-884GqW3ksswlLxy5cpgH6fCzixq_uqua5wwMv00GV14qLS-JyA3z8CaNqJjQ3GGy9Fp29pSiKho5PVLjW0-GQk3MNHNKn6NvOwLY7zNgLk8f6JSOpB9edsI'

