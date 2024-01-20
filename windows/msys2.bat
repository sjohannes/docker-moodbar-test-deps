:: Download and install MSYS2
curl -fLSs -o msys2.exe https://github.com/msys2/msys2-installer/releases/download/nightly-x86_64/msys2-base-x86_64-latest.sfx.exe || exit /b
.\msys2.exe -y -oC:\ || exit /b
del msys2.exe || exit /b

set bash=C:\msys64\usr\bin\bash.exe -l
set prefix=mingw-w64-ucrt-x86_64
set packages= ^
  %prefix%-fftw ^
  %prefix%-gcc ^
  %prefix%-gst-plugins-base ^
  %prefix%-gstreamer ^
  %prefix%-meson ^
  %prefix%-pkgconf ^
  %prefix%-python ^
  %prefix%-python-numpy

:: Initial MSYS2 setup
%bash% -c ":" || exit /b
:: Sync and upgrade packages; if there are system package upgrades, this will
:: only upgrade those
%bash% -c "pacman -Syuu --noconfirm --noprogressbar" || exit /b
:: Upgrade any remaining packages and install our wanted packages
%bash% -c "pacman -Suu --noconfirm --noprogressbar %packages%" || exit /b
:: Remove all cached package files
%bash% -c "pacman -Scc --noconfirm" || exit /b
