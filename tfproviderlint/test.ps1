$ErrorActionPreference = 'SilentlyContinue';
Write-Output "test version"
docker run -v "$(pwd):C:/dl" -w C:/dl tfproviderlint:nanoserver-1809 tfproviderlint -version 