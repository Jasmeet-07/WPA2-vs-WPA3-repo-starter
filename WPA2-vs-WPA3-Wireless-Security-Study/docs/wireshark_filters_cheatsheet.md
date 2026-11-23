# Wireshark Display Filters and Windows Diagnostics Cheat Sheet

## Wireshark display filters (802.11 analysis)

| Purpose | Filter |
|---|---|
| WPA2 4-Way Handshake frames | `eapol` |
| WPA3 SAE authentication frames | `wlan.fc.type_subtype == 0x000b && wlan.fixed.auth_alg == 3` |
| Association request/response | `wlan.fc.type_subtype == 0x0000 \|\| wlan.fc.type_subtype == 0x0001` |
| Deauthentication frames (detection only) | `wlan.fc.type_subtype == 0x000c` |
| Filter by AP BSSID | `wlan.addr == xx:xx:xx:xx:xx:xx` |
| PMF required flag | `wlan.rsn.capabilities.mfpr == 1` |
| WPA3-SAE AKM suite | `wlan.rsn.akms.type == 8` |
| ICMP (ping) only | `icmp` |

Note: on a normal Windows capture, EAPOL and management frames may not appear.
A monitor-mode capable adapter (for example on Linux) is needed to see them.

## Windows commands

| Purpose | Command |
|---|---|
| Active Wi-Fi interface details | `netsh wlan show interfaces` |
| Visible networks and details | `netsh wlan show networks mode=bssid` |
| Connect to a saved profile | `netsh wlan connect name="PROFILE-NAME"` |
| Driver capabilities | `netsh wlan show drivers` |
| Wireless report | `netsh wlan show wlanreport` |
| IP configuration | `ipconfig` |

## iperf3

| Role | Command |
|---|---|
| Server | `iperf3 -s` |
| Client (10 s, 1 s interval) | `iperf3.exe -c <server-ip> -t 10 -i 1` |
