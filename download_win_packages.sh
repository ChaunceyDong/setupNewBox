#!/bin/bash

# 下载文件列表
urls=(
    "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
    "https://download.mobatek.net/2422024061715901/MobaXterm_Installer_v24.2.zip"
    "https://downloads.1password.com/win/1PasswordSetup-latest.exe"
    "https://swdlcdn.eastmoney.com/swc8_free_new/dfcft8.exe"
    "https://dldir1v6.qq.com/weixin/Windows/WeChatSetup.exe"
    "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"
    "https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.4.0.32175.exe?_gl=1*nvkx3s*_gcl_au*MTcyOTM1NDU2My4xNzIxMDU3MDI5*_ga*Mzg4MjAzODExLjE3MjEwNTY3MTA.*_ga_9J976DJZ68*MTcyMTA1NjcwOS4xLjEuMTcyMTA1NzAyOS42MC4wLjA."
    "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
    "https://lf9-ug-sign.feishucdn.com/ee-appcenter/4632e52c/Feishu-win32_ia32-7.21.6-signed.exe?lk3s=fb957577&x-expires=1721062074&x-signature=3RU3eO%2FiJvGbSOZI9XRHgudG7CQ%3D"
    "https://cdn.aliyundrive.net/downloads/apps/desktop/aDrive-6.0.0.exe?spm=aliyundrive.index.0.0.7db16f60iOXZ8N&file=aDrive-6.0.0.exe"
    "https://download.vnpy.com/veighna_studio-3.9.2.exe"
    "https://github.com/zhongyang219/TrafficMonitor/releases/download/V1.84.1/TrafficMonitor_V1.84.1_x64.zip"
    "https://www.notion.so/desktop/windows/download"
    "https://downloads.citrix.com/22748/CitrixWorkspaceApp.exe?__gda__=exp=1721098522~acl=/*~hmac=69fd44f1503c9d2cf171ad9413aaea0600db34cd3b53dc4c42549f601f3df46a"

)

# 创建下载任务
download_tasks=()
for url in "${urls[@]}"
do
    # 从 URL 中提取文件名
    file_name=$(basename "$url")
    
    # 检查文件是否已经存在
    if [ -f "$file_name" ]; then
        echo "文件 $file_name 已经存在,跳过下载..."
        continue
    fi
    
    # 启动并行下载任务
    wget -O "$file_name" "$url" &
    download_tasks+=($!)
done

# 等待所有下载任务完成
for task in "${download_tasks[@]}"
do
    wait $task
done

echo "下载完成!"



mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

~/miniconda3/bin/conda init bash
