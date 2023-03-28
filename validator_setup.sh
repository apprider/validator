#!/bin/bash

EC2_PUBLIC_IP=$1


FUND_AMOUNT="200000"

echo "Installing dependencies..."
echo
echo

# Install dependencies

sudo apt-get update
sudo apt-get install golang


# Clone and build polygons-sdk
git clone https://github.com/apprider/carechain && cd carechain
echo "Building Go executable, please wait..."
go build -o carechainnode

# Initialize validator dir
echo "Initializing validator directory.."
cp ../genesis.json . && chmod +x genesis.json
echo

## Show private key
pk=$(cat carechainnode/consensus/validator.key)
echo "Private Key = $pk"
echo

## Prompt user
echo
echo
read -n 1 -s -r -p "Additionally, please make a copy of your \`Private Key\` and store this somewhere safe - DO NOT share it with us! Once this is done, press any key to continue.."
echo
