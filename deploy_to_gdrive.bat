@echo off
chcp 65001 > nul
echo ========================================================
echo   IPE-Report Local -> Google Drive Deployer (robocopy)
echo ========================================================
setlocal enabledelayedexpansion

set "GDRIVE_TARGET="
if exist "G:\내 드라이브\강의\02_IPE\.deploy_ipe_report" set "GDRIVE_TARGET=G:\내 드라이브\강의\02_IPE\.deploy_ipe_report"
if not defined GDRIVE_TARGET if exist "D:\강의\02_IPE\.deploy_ipe_report" set "GDRIVE_TARGET=D:\강의\02_IPE\.deploy_ipe_report"
if not defined GDRIVE_TARGET set "GDRIVE_TARGET=D:\강의\02_IPE\.deploy_ipe_report"

echo [배포 대상] %GDRIVE_TARGET%
robocopy "C:\workspace\IPE-Report" "%GDRIVE_TARGET%" /E /XD .git __pycache__ .pytest_cache node_modules .venv .vscode .idea /XF *.pyc *.pyo *.lock *.tmp *.swp *.bak ~$* /R:2 /W:2 /NP /NFL /NDL

echo.
echo ========================================================
echo   배포가 완료되었습니다. (robocopy Exit Code: %ERRORLEVEL%)
echo ========================================================
pause