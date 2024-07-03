#!/bin/bash
# AutoBuild Module by Hyy2001 <https://github.com/Hyy2001X/AutoBuild-Actions-BETA>
# AutoBuild DiyScript

Firmware_Diy_Core() {

    # 请在该函数内按需修改变量设置, 使用 case 语句控制不同预设变量的设置
    
    # 可用预设变量
    # ${OP_AUTHOR}          OpenWrt 源码作者
    # ${OP_REPO}            OpenWrt 仓库名称
    # ${OP_BRANCH}          OpenWrt 源码分支
    # ${CONFIG_FILE}        配置文件
    
    Author=AUTO
    # 作者名称, AUTO: [自动识别]
    
    Author_URL=AUTO
    # 自定义作者网站或域名, AUTO: [自动识别]
    
    Default_Flag=AUTO
    # 固件标签 (名称后缀), 适用不同配置文件, AUTO: [自动识别]
    
    Default_IP="192.168.2.1"
    # 固件 IP 地址
    
    Default_Title="Powered by AutoBuild-Actions"
    # 固件终端首页显示的额外信息
    
    Short_Fw_Date=true
    # 简短的固件日期, true: [20210601]; false: [202106012359]
    
    x86_Full_Images=false
    # 额外上传已检测到的 x86 虚拟磁盘镜像, true: [上传]; false: [不上传]
    
    Fw_MFormat=AUTO
    # 自定义固件格式, AUTO: [自动识别]
    
    Regex_Skip="packages|buildinfo|sha256sums|manifest|kernel|rootfs|factory|itb|profile|ext4|json"
    # 输出固件时丢弃包含该内容的固件/文件
    
    AutoBuild_Features=true
    # 添加 AutoBuild 固件特性, true: [开启]; false: [关闭]
    
    AutoBuild_Features_Patch=false
    AutoBuild_Features_Kconfig=false
    
    # 增加软件包
    if ! grep -q 'src-git turboacc' ./feeds.conf.default; then
        echo 'src-git turboacc https://github.com/chenmozhijin/turboacc' >> ./feeds.conf.default
    fi

    # 更改内核版本
    sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=6.6/g' ./target/linux/x86/Makefile
}

Firmware_Diy_Core
