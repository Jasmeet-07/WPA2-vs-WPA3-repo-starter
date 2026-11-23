@echo off
setlocal

rem ------------------------------------------------------------
rem  WPA2 vs WPA3 test script
rem  Run this while connected to the network you want to test.
rem  Run it once on WPA2 and once on WPA3, then compare results.
rem  Only use this on networks you own.
rem ------------------------------------------------------------

set /p LABEL=Enter a label for this test (example WPA2 or WPA3): 
set /p GATEWAY=Enter gateway IP to ping (example 192.168.1.1): 
set /p SERVER=Enter iperf3 server IP (run "iperf3 -s" on it first): 

if not exist results mkdir results
set OUT=results\%LABEL%_results.txt

echo ===== Test label: %LABEL% ===== > "%OUT%"
echo Date and time: %DATE% %TIME% >> "%OUT%"
echo. >> "%OUT%"

echo ===== Wi-Fi interface details ===== >> "%OUT%"
netsh wlan show interfaces >> "%OUT%"
echo. >> "%OUT%"

echo ===== Ping test (50 packets) to %GATEWAY% ===== >> "%OUT%"
ping %GATEWAY% -n 50 >> "%OUT%"
echo. >> "%OUT%"

echo ===== iperf3 TCP test (10 seconds) to %SERVER% ===== >> "%OUT%"
iperf3.exe -c %SERVER% -t 10 -i 1 >> "%OUT%"

echo.
echo Done. Results saved to %OUT%
pause
