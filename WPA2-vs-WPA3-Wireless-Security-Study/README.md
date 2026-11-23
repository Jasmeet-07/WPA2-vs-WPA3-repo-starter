# A Comparative Study of WPA2 and WPA3 Wireless Network Security Protocols

Final year B.E. project, Computer Science and Engineering, Chandigarh University

**Author:** Jasmeet Singh (UID: 24BCS11151)
**Supervisor:** Dr. Sanjeev Kumar
**Academic session:** 2026-2027

## Overview

An empirical comparison of WPA2-Personal (PSK) and WPA3-Personal (SAE) on an
authorised laboratory testbed. The project covers:

- Handshake analysis in Wireshark (WPA2 4-Way EAPOL vs WPA3 SAE Commit/Confirm)
- Throughput, latency and association-time benchmarking
- Protected Management Frames (PMF) verification
- Device compatibility testing
- A dual-SSID campus migration roadmap

## Key Findings

| Metric | WPA2-Personal | WPA3-Personal |
|---|---|---|
| TCP throughput (iperf3) | 91.36 Mbps | 87.83 Mbps (-3.86%) |
| Average ping latency | 4.2 ms | 4.8 ms |
| Association time | 0.94 s | 1.38 s (+440 ms) |
| Offline dictionary attack | Vulnerable | Resistant |
| Forward secrecy | No | Yes |
| Protected Management Frames | Optional | Mandatory |

**Takeaway:** WPA3 adds a small one-time delay when connecting, but sustained
speed is almost the same, while security improves significantly.

## Testbed

| Item | Detail |
|---|---|
| Access point | TP-Link Archer AX10 (2.4 GHz, Channel 6, 20 MHz) |
| Client | Windows 11 laptop, Intel Wi-Fi 6 AX201 |
| Test networks | `CU-LAB-WPA2` and `CU-LAB-WPA3` |
| Tools | Wireshark 4.2.2, iperf3 v3.16, `netsh wlan`, ICMP ping |

## Repository Structure

```
report/        Full project report (PDF)
screenshots/   Wireshark, netsh, iperf3 and ping evidence
captures/      Packet capture files (.pcapng)
scripts/       Batch script to repeat the tests
docs/          Wireshark filter and diagnostics cheat sheet
```

## How to Reproduce

1. Set up your own WPA2 network and WPA3 network (a router or a phone hotspot works).
2. On a second machine on the LAN, run `iperf3 -s`.
3. Connect your Windows laptop to the WPA2 network.
4. Run `scripts\run_tests.bat` and enter a label (for example `WPA2`), the gateway IP and the iperf3 server IP.
5. Switch to the WPA3 network and run the script again.
6. Compare the two result files saved in the `results` folder.

Full step-by-step instructions with screenshots are in **Appendix 2** of the report.
Wireshark filters are in [`docs/wireshark_filters_cheatsheet.md`](docs/wireshark_filters_cheatsheet.md).

## Limitations

- On a standard Windows laptop (no monitor-mode adapter), EAPOL and SAE frames may not be visible in Wireshark because of the NDIS driver. See Appendix 2, section A2.6.
- Results come from a single lab setup and may vary with hardware and RF conditions.
- Portable hotspot tests (Appendix 2) are for verifying the security mode and basic latency, not for throughput benchmarking.

## Ethics and Legal Compliance

All testing was done on privately owned equipment and private SSIDs. No
third-party networks were accessed, and no cracking or deauthentication
attacks were run against any external network, in line with Sections 43 and 66
of the Indian Information Technology Act, 2000.

## License

Released under the MIT License. See [LICENSE](LICENSE).
