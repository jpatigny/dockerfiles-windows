# escape=`
ARG InstallerVersion=nanoserver
ARG InstallerRepo=mcr.microsoft.com/powershell
ARG NanoServerRepo=mcr.microsoft.com/windows/nanoserver

FROM ${InstallerRepo}:$InstallerVersion  AS installer-env

LABEL maintainer="jpatigny@gmail.com" 

SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV TFPROVIDERLINT_VERSION 0.21.0
ENV TFPROVIDERLINT_VERSION_DOWNLOAD_URL https://github.com/bflad/tfproviderlint/releases/download/v${TFPROVIDERLINT_VERSION}/tfproviderlint_${TFPROVIDERLINT_VERSION}_windows_amd64.zip

RUN $url = $env:TFPROVIDERLINT_VERSION_DOWNLOAD_URL ; `
    Write-Host "downloading: $url"; `
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12; `
    New-Item -ItemType Directory c:/installer > $null ; `
    Invoke-WebRequest -Uri $env:TFPROVIDERLINT_VERSION_DOWNLOAD_URL -outfile c:/installer/tflint.zip -Verbose; `
    Expand-Archive c:/installer/tflint.zip -DestinationPath c:\tfproviderlint

# Install tfproviderlint into NanoServer
FROM ${NanoServerRepo}:1809

COPY --from=installer-env ["c:/tfproviderlint", "c:/tfproviderlint"]

# This is basically the correct code except for the /M
USER ContainerAdministrator
RUN setx PATH "%PATH%;c:\tfproviderlint;" /M

WORKDIR c:/tfproviderlint
