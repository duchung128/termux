#!/bin/sh

# Cập nhật và nâng cấp hệ thống
yes | pkg update && pkg upgrade

# Cài đặt các gói cần thiết
yes | pkg install libjansson wget nano git

# Cài đặt git (nếu chưa cài đặt)
pkg install git

# Clone repository
git clone https://github.com/duchung128/ccminer.git

# Sửa file .bashrc để chạy ccminer với cấu hình khi Termux khởi động
echo '~/ccminer/ccminer -c ~/ccminer/config.json' >> ~/.bashrc

# Chuyển quyền thực thi cho các file trong thư mục ccminer
cd ccminer
chmod +x ccminer start.sh run

nano config.json
