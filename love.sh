#!/bin/bash

# love.sh - A tragically poetic script that tries to connect to love, but fails after 5 attempts.

# Terminal colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GRAY='\033[1;30m'
NC='\033[0m' # No Color

# Error color
ERROR='\033[0;41m'  # Red background with white text

# Get the local IP address
MY_IP=$(hostname -I | awk '{print $1}')
echo -e "${CYAN}Local IP: $MY_IP${NC}"
sleep 1

attempt=1

# Limit the number of attempts to 5
while [ $attempt -le 5 ]; do
    # Generate a fake random target IP and port
    TARGET_IP="$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
    PORT=$((1000 + RANDOM % 55535))

    # First "Love is being searched..." one time
    if [ $attempt -eq 1 ]; then
        echo -e "\n${YELLOW}Love is being searched...${NC}"
        sleep 0.6
    fi

    # Then "Searching..." three times for each connection attempt
    echo -e "${YELLOW}Searching...${NC}"
    sleep 0.6
    echo -e "${YELLOW}Searching...${NC}"
    sleep 0.6
    echo -e "${YELLOW}Searching...${NC}"
    sleep 0.6

    echo -e "\n${GREEN}[$attempt] Attempting connection to $TARGET_IP:$PORT from $MY_IP...${NC}"
    sleep 0.8

    echo -e "${GRAY}→ Resolving hostname..."
    sleep 0.5
    echo -e "→ Sending SYN packet..."
    sleep 0.5
    echo -e "→ Waiting for ACK..."
    sleep 0.7
    echo -e "→ Timeout occurred."
    sleep 0.4
    echo -e "→ Retrying with fallback protocol..."
    sleep 0.6
    echo -e "${ERROR}→ Handshake failed: connection reset by peer.${NC}"
    sleep 0.6

    # If it's the last attempt, show "Target server is being connected for the last time..." 
    if [ $attempt -eq 5 ]; then
        echo -e "\n${YELLOW}Target server is being connected for the last time...${NC}"
        sleep 0.8

        echo -e "${YELLOW}→ Waiting...${NC}"
        sleep 0.6
        echo -e "${YELLOW}→ Waiting...${NC}"
        sleep 0.6
        echo -e "${YELLOW}→ Waiting...${NC}"
        sleep 1.2
    fi

    # Increment attempt counter
    ((attempt++))
    sleep 2
done

# After 5 attempts, rejection message
echo -e "\n${RED}Connection failed... Love not found 💔${NC}"

# Final message after all attempts are completed
echo -e "${RED}No more attempts. Goodbye...${NC}"
exit 0


# Instagram: @dailymycode