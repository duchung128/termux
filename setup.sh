#!/bin/sh

# Cập nhật và nâng cấp hệ thống
yes | pkg update && pkg upgrade

# Kiểm tra và cài đặt từng gói
yes | pkg install libjansson
yes | pkg install wget
yes | pkg install nano
yes | pkg install git

# Clone repository
git clone https://github.com/duchung128/ccminer.git

# Sửa file .bashrc để chạy ccminer với cấu hình khi Termux khởi động
echo '~/ccminer/ccminer -c ~/ccminer/config.json' >> ~/.bashrc

# Chuyển quyền thực thi cho các file trong thư mục ccminer
cd ccminer
chmod +x ccminer start.sh run

