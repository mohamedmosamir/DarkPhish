#!/bin/bash

echo -e "\e[1;32m[+] Installing dependencies...\e[0m"
apt update -y && apt upgrade -y
apt install php curl wget unzip -y

# تثبيت ngrok لو مش موجود
if ! command -v ngrok &> /dev/null; then
  echo -e "\e[1;33m[!] Installing ngrok...\e[0m"
  wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
  unzip ngrok-stable-linux-amd64.zip
  mv ngrok /usr/local/bin/
  rm ngrok-stable-linux-amd64.zip
fi

# تثبيت cloudflared لو مش موجود
if ! command -v cloudflared &> /dev/null; then
  echo -e "\e[1;33m[!] Installing cloudflared...\e[0m"
  wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O cloudflared
  chmod +x cloudflared
  mv cloudflared /usr/local/bin/
fi

echo -e "\e[1;32m[✔] All tools installed successfully!\e[0m"
