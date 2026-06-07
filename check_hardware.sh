#!/bin/bash

# Hardware Profiler for Local LLM Agent
# Outputs data in a format the agent can easily parse

echo "--- SYSTEM PROFILE START ---"

# 1. OS Check
OS_TYPE=$(uname -s)
echo "OS: $OS_TYPE"

# 2. CPU Architecture & Brand
if [[ "$OS_TYPE" == "Darwin" ]]; then
    CPU_BRAND=$(sysctl -n machdep.cpu.brand_string)
    ARCH=$(uname -m)
    echo "CPU: $CPU_BRAND"
    echo "ARCH: $ARCH"
    
    # 3. RAM in GB
    MEM_BYTES=$(sysctl -n hw.memsize)
    MEM_GB=$((MEM_BYTES / 1024 / 1024 / 1024))
    echo "RAM: ${MEM_GB}GB"
else
    echo "Error: This script is optimized for macOS (Darwin)."
    exit 1
fi

echo "--- SYSTEM PROFILE END ---"
