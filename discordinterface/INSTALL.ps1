#Easy Discord Interface Install File.

#Check if rustc installed.
$p = (rustc -V)

$rs_end32 = "https://static.rust-lang.org/rustup/dist/i686-pc-windows-msvc/rustup-init.exe"
$rs_end64 = "https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe"

if ($p.Length -eq 0) {
    if ([Environment].Is64BitOperatingSystem) {
        "Installing 64 bit rust compiler."
        Invoke-WebRequest $rs_end64 -OutFile rustup-init.exe
        ./rustup-init.exe -y
        "Done."
    } else {
        "Installing 64 bit rust compiler."
        Invoke-WebRequest $rs_end32 -OutFile rustup-init.exe
        ./rustup-init.exe -y
        "Done."
    }
    Remove-Item -Path ./rustup-init.exe
}

#Build sdl2 library.
./build/sdl2.ps1

$never = cargo build

"~~~ Installation Finished ~~~"