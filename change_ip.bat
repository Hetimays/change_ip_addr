@echo off
:Loop
set IF = "ローカル エリア接続"
set IP = "0.0.0.0"
set SUBNET = "0.0.0.0"
set DEFAULT_GW = "0.0.0.0"
echo.
echo IPを指定(DHCP用に自動取得する場合は未入力でEnter)
set /p IP="IP:"
echo.
echo サブネットマスクを指定(DHCP用に自動取得する場合は未入力でEnter)
set /p SUBNET="SUBNET:"
echo.
echo デフォルトゲートウェイを指定(DHCP用に自動取得する場合は未入力でEnter)
set /p DEFAULT_GW = "DEFAULT_GW:"
echo.
echo IP:%IP%
echo SUBNET:%SUBNET%
echo DEFAULT_GW:%DEFAULT_GW%
echo.
echo -------------------
echo [1]:設定する
echo [2]:中止
echo [1,2以外]:設定値修正
echo -------------------
set INPUT=nul
set /p INPUT"number:"
if %IP% == "0.0.0.0" (
    if %SUBNET% == "0.0.0.0" (
        if %DEFAULT_GW% == "0.0.0.0" (
            netsh interface ip set add name = %IF% source=dhcp

))) else (
    netsh interface ip set add name = %IF% source=static addr=%IP% mask=%SUBNET% gateway=%DEFAULT_GW% gwmetric=1
)
echo.
echo 設定完了
echo .
echo .
pause
goto display
echo .
:EXIT
pause
exit
