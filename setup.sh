#!/bin/bash

# Update Termux
yes | pkg update 
yes | pkg upgrade

# Cài các gói cần thiết
yes | pkg install wget 
yes | pkg install nano
yes | pkg install git
yes | pkg install libjansson

# Clone repository ccminer
git clone https://github.com/duchung128/ccminer.git

# Thêm lệnh vào .bashrc để chạy ccminer khi Termux khởi động
echo '~/ccminer/ccminer -c ~/ccminer/config.json' >> .bashrc

# Chuyển đến thư mục ccminer
cd ccminer

# Cấp quyền thực thi cho các tệp
chmod +x ccminer start.sh run

# Thông báo cho 
nano ~/ccminer/config.json

