chcp 65001

@echo off

rem 检查python环境
echo 当前python版本为:
python --version
if not errorlevel 0 (
    echo python环境未安装,请先安装python
    pause
    exit /b 1
)

rem 进入当前文件夹
cd /d %~dp0

rem 检查虚拟环境后启动脚本
if not exist env (
    echo 虚拟环境未安装，正在安装虚拟环境
    python -m venv env

    call env\Scripts\activate
    echo 已经激活虚拟环境

    echo 准备安装依赖
    pip install -r requirements.version.txt
    echo 依赖安装完成

    goto runhonkai

) else (
    rem 激活虚拟环境
    call env\Scripts\activate
    echo 已经激活虚拟环境
    
    rem 启动脚本
    :runhonkai
    echo 正在启动中...
    python honkai_star_rail.py
    echo 按任意键结束
    pause > nul  
)

