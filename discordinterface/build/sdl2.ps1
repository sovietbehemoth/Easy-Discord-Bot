#This file will prepare the SDL2 library.



$vc_address = "https://www.libsdl.org/release/SDL2-devel-2.0.16-VC.zip"
$user = ((Get-WMIObject -ClassName Win32_ComputerSystem).Username -split "\\")[1]

"Downloading libsdl files."
Invoke-WebRequest $vc_address -OutFile SDL2-devel-2.0.16-VC.zip

"Extracting dependency files."
Expand-Archive ./SDL2-devel-2.0.16-VC.zip -DestinationPath ./vc

"Moving dependency files (0/4)."
Move-Item ./vc/SDL2-2.0.16/lib/x64/SDL2.lib C:\Users\$user\.rustup\toolchains\stable-x86_64-pc-windows-msvc\lib\rustlib\x86_64-pc-windows-msvc\lib\SDL2.lib
"Moving dependency files (1/4)."
Move-Item ./vc/SDL2-2.0.16/lib/x64/SDL2main.lib C:\Users\$user\.rustup\toolchains\stable-x86_64-pc-windows-msvc\lib\rustlib\x86_64-pc-windows-msvc\lib\SDL2main.lib
"Moving dependency files (2/4)."
Move-Item ./vc/SDL2-2.0.16/lib/x64/SDL2test.lib C:\Users\$user\.rustup\toolchains\stable-x86_64-pc-windows-msvc\lib\rustlib\x86_64-pc-windows-msvc\lib\SDL2test.lib
"Moving dependency files (3/4)."
Move-Item ./vc/SDL2-2.0.16/lib/x64/SDL2.dll ./

"Cleaning up."
Remove-Item -Path -Confirm:$false ./vc 
Remove-Item -Path ./SDL2-devel-2.0.16-VC.zip