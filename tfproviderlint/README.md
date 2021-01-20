# tfproviderlint
[![This image on DockerHub](https://img.shields.io/docker/pulls/jpatigny/tfproviderlint.svg)](https://hub.docker.com/r/jpatigny/tfproviderlint/)

Windows nanoserver image containing tfproviderlint

Source : https://github.com/bflad/tfproviderlint

## Build the Container image

```
.\build.ps1
```

### Run the Container

```
docker run jpatigny/tfproviderlint:nanoserver-1809 tfproviderlint ./..
```