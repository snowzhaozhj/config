init() {
	sudo echo "[*] 将原sources.list 备份为 sources.list.bak"
	sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

	sudo echo "[*] 正在将 中科大镜像源 覆盖到/etc/apt/sources.list..."
	sudo echo "# 中科大镜像源" >> /etc/apt/sources.list

	sudo echo "deb https://mirrors.ustc.edu.cn/ubuntu/ bionic main restricted universe multiverse" >> /etc/apt/sources.list
	sudo echo "deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic main restricted universe multiverse" >> /etc/apt/sources.list

	sudo echo "deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list
	sudo echo "deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list

	sudo echo "deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list
	sudo echo "deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list

	sudo echo "deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list
	sudo echo "deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list

	sudo echo "deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse" >> /etc/apt/sources.list
	sudo echo "deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse" >> /etc/apt/sources.list

	sudo echo "" >> /etc/apt/sources.list

	sudo apt-get update
	sudo apt-get upgrade

	sudo apt-get install cmake gcc clang gdb build-essential make perl git zsh tmux unzip
}

install_bat() {
	wget https://download.fastgit.org/sharkdp/bat/releases/download/v0.18.1/bat_0.18.1_amd64.deb
	sudo dpkg -i bat_0.18.1_amd64.deb
}

install_fd() {
	wget https://download.fastgit.org/sharkdp/fd/releases/download/v8.2.1/fd_8.2.1_amd64.deb
	sudo dpkg -i fd_8.2.1_amd64.deb
}

install_ripgrep() {
	wget https://download.fastgit.org/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
	sudo dpkg -i ripgrep_12.1.1_amd64.deb
}

install_lsd() {
	wget https://download.fastgit.org/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_arm64.deb
	sudo dpkg -i lsd_0.20.1_arm64.deb
}

config_vim() {
	cp .vimrc ~/.vimrc
}

