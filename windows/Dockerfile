# Must match Docker host.
# Can't use nanoserver for some reason (bash crashes).
FROM mcr.microsoft.com/windows/servercore:ltsc2022

COPY msys2.bat /

RUN call msys2.bat && del msys2.bat || exit /b
