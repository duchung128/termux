#!/bin/sh

# Cập nhật và nâng cấp hệ thống
yes | pkg update && pkg upgrade

# Cài đặt các gói cần thiết
pkg install libjansson -y || { echo "Failed to install libjansson"; exit 1; }
pkg install wget -y || { echo "Failed to install wget"; exit 1; }
pkg install nano -y || { echo "Failed to install nano"; exit 1; }
pkg install git -y || { echo "Failed to install git"; exit 1; }

# Clone repository
git clone https://github.com/duchung128/ccminer.git || { echo "Failed to clone repository"; exit 1; }

# Sửa file .bashrc để chạy ccminer với cấu hình khi Termux khởi động
echo '~/ccminer/ccminer -c ~/ccminer/config.json' >> ~/.bashrc

# Chuyển quyền thực thi cho các file trong thư mục ccminer
cd ccminer || { echo "Failed to change directory to ccminer"; exit 1; }
chmod +x ccminer start.sh run || { echo "Failed to set executable permissions"; exit 1; }
nano config.json
