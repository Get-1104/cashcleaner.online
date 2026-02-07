@echo off
chcp 65001 >nul
echo ========================================
echo    Cash Cleaner - 本地服务器启动
echo ========================================
echo.

REM Try Node.js first (npx http-server)
where npx >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] 使用 Node.js 启动...
    echo.
    echo 请在浏览器打开: http://localhost:8000
    echo 按 Ctrl+C 可停止服务器
    echo.
    npx -y http-server -p 8000 -c-1
    goto :eof
)

REM Try Python
where python >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] 使用 Python 启动...
    echo.
    echo 请在浏览器打开: http://localhost:8000
    echo 按 Ctrl+C 可停止服务器
    echo.
    python -m http.server 8000
    goto :eof
)

echo [X] 未检测到 Node.js 或 Python
echo.
echo 请任选一种方式:
echo.
echo 方式1 - 推荐: 安装 VS Code 扩展 "Live Server"
echo   1. 在 VS Code 左侧点「扩展」
echo   2. 搜索 "Live Server" 并安装
echo   3. 右键 index.html 选 "Open with Live Server"
echo.
echo 方式2: 安装 Node.js 后重新运行本脚本
echo   下载: https://nodejs.org
echo.
pause
