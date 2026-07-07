#!/bin/bash

# 1. Securely read input
read -s -p "🔑 Enter InfluxDB Password: " INFLUX_PW
echo ""

if [ -z "$INFLUX_PW" ]; then
    echo "❌ Password cannot be empty!"
    exit 1
fi

echo "🚀 Starting MING Stack..."

# 2. Create temporary secret in RAM (No disk write)
echo "$INFLUX_PW" > /dev/shm/.tmp_influx_pw
chmod 600 /dev/shm/.tmp_influx_pw

# 3. Launch Docker Compose
sudo docker-compose up -d

# 4. Wipe traces from memory immediately
rm -f /dev/shm/.tmp_influx_pw
unset INFLUX_PW

echo "✅ Done! RAM traces wiped clean."
