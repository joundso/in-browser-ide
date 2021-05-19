#!/bin/bash

## Get version tag and registry-prefix from .env:
source ./.env

# if [ ! "$(docker network ls | grep shinyproxy-net)" ]; then
# docker network create shinyproxy-net
# fi

VSCODE_DIR="vscode"
if [ -d "./${VSCODE_DIR}/" ]; then
  ## There is a folder with vscode, so we dont need to download anything
  printf "\nThere is a folder with vscode. Skipping the download.\n"
else
  ## VSCode is not yet downloaded. Will pull it now:
  git clone https://github.com/joundso/vscode-docker ${VSCODE_DIR}
fi

printf "\n\nBuilding vscode image ...\n"
cd ./${VSCODE_DIR}
docker build . -t vscode-image:latest
cd ..

printf "\n\Pulling RStudio image ...\n"
docker pull joundso/rdsc_rstudio_j:latest

docker-compose up -d