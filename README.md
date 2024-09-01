# ARP Spoofing and Packet Dropping Script

This script allows you to perform ARP spoofing on a target machine within your network and drop packets from the target using `iptables`. It also provides functionality to stop the spoofing and clean up the changes.

## Prerequisites

Before running the script, ensure you have the following installed on your Linux system:

- `arpspoof`: Part of the `dsniff` package.
- `xterm`: Terminal emulator used for running `iptables` in a separate window.

You can install these packages using your package manager if they are not already installed:

### For Debian/Ubuntu-based systems:
    sudo apt-get install dsniff xterm
For Fedora-based systems:

    sudo dnf install dsniff xterm

For Arch Linux:

    sudo pacman -S dsniff xterm

Usage
	1.	Download the script:
Save the shell script as block_ip.sh.
	2.	Make the script executable:
 
     chmod +x block_ip.sh
  3. Run the Script:

         ./block_ip.sh
  4.	Enter required details:
The script will prompt you to enter the following details:
	•	Network interface (e.g., eth0, wlan0)
	•	Target IP address (the machine you want to spoof)
	•	Gateway IP address (the router or gateway on your network)
	5.	Stopping ARP Spoofing:
To stop ARP spoofing and remove the iptables rule, simply press Ctrl+C in the terminal where the script is running. The script will automatically clean up by:
	•	Stopping the arpspoof process.
	•	Removing the iptables rule.
	•	Disabling IP forwarding.

Important Notes
	•	Usage Warning: This script should only be used in a controlled environment, such as a lab setup, for educational purposes or testing network security. Unauthorized ARP spoofing is illegal and unethical.
	•	Root Privileges: The script requires sudo privileges to run commands like arpspoof, iptables, and to modify system settings. You will be prompted to enter your sudo password at the beginning of the script.


This script is provided “as is”, without warranty of any kind. Use at your own risk.   

