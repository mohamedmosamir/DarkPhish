# 🕷️ Dark Phish - Advanced Phishing Simulation Tool

![Dark Phish Banner](https://github.com/mohamedmosamir/DarkPhish/blob/main/baner.png?raw=true)
**Dark Phish** is a powerful and open-source command-line utility designed for ethical hacking and penetration testing, specifically focused on realistic phishing simulations. It offers an extensive collection of meticulously crafted fake login pages that are 100% identical to popular websites, making it an invaluable tool for security researchers, penetration testers, and anyone involved in cybersecurity awareness training.

---

## ✨ Key Features

* **35+ Popular Website Templates:** Generate convincing fake login pages for a wide array of popular services, including Facebook, Instagram, Gmail, TikTok, Steam, Twitter, Snapchat, PayPal, Netflix, and many more.
* **100% Identical Design:** Pages are meticulously crafted using real HTML, CSS, and images to ensure an indistinguishable resemblance to the original sites.
* **Flexible Hosting Options:**
    * Run the phishing page locally on `Localhost` with a customizable port.
    * Generate public external links using integrated `Ngrok` and `Cloudflared` tunneling.
* **Custom Masked URLs:** Create custom, cloaked URLs to further enhance the credibility of your phishing links.
* **Organized Site List:** View a neatly formatted horizontal list of available website templates directly in the terminal.
* **Auto-Kill Feature:** Automatically terminates old server instances to prevent conflicts and ensure smooth operation.
* **Automated Victim Data Logging:**
    * Captured credentials and victim information are automatically saved to `creds.txt`.
    * Information includes:
        * Email/Username
        * Password
        * IP Address
        * Geographical Location (Country - City - Region)
        * Internet Service Provider (ISP)
* **Real-time Victim Data Display:** Monitor captured victim data instantly as it arrives in your terminal.
* **Automated Setup Script (`install.sh`):** Simplifies the installation of all necessary dependencies.
* **Log Formatting Script (`format_log.sh`):** Helps in neatly organizing captured victim data for easier analysis.
* **Simple & Fast Terminal Interface:** A user-friendly and intuitive command-line interface.
* **Professional ASCII Banner:** A sleek ASCII logo displayed upon tool startup for a polished look.
* **Clean & Organized Codebase:** Easy to understand, modify, and contribute to.
* **Broad Compatibility:** Fully compatible with Kali Linux, all other Linux distributions, and Termux.

---

## 🛠️ Installation Guide

Ensure you have `git` and `python3` installed on your system.

### 🐧 On Kali Linux / Any Linux Distribution

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/mohamedmosamir/DarkPhish.git
    ```
2.  **Navigate into the tool's directory:**
    ```bash
    cd DarkPhish
    ```
📂 Extracting `pages.zip`

For Dark Phish to function properly and load all the phishing templates, you **must** extract the `pages.zip` file.

After installing and navigating into the `DarkPhish` directory, run the following command:

```bash
unzip pages.zip
    
    
3.  **Make the installation script executable and run it:**
    ```bash
    chmod +x install.sh
    ./install.sh
    ```
    This script will install all required dependencies for Dark Phish.

### 📱 On Termux (Android)

1.  **Update and upgrade Termux packages:**
    ```bash
    pkg update && pkg upgrade -y
    ```
2.  **Install essential packages (Git and Python):**
    ```bash
    pkg install git python python-pip curl -y
    ```
3.  **Clone the repository:**
    ```bash
    git clone https://github.com/mohamedmosamir/DarkPhish.git
    ```
4.  **Navigate into the tool's directory:**
    ```bash
    cd DarkPhish
    ```
📂 Extracting `pages.zip`

For Dark Phish to function properly and load all the phishing templates, you **must** extract the `pages.zip` file.

After installing and navigating into the `DarkPhish` directory, run the following command:

```bash
unzip pages.zip
    
5.  **Make the installation script executable and run it:**
    ```bash
    chmod +x install.sh
    ./install.sh
    ```
    *(Note: Some warnings might appear during Termux installation, but the tool should generally function correctly.)*

---


