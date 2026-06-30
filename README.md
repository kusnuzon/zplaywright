# 🚀 Playwright Auto-Patcher for Termux (Android)

Say goodbye to the `Error: Unsupported platform: android`! This tool automatically installs and patches Playwright to run natively on Termux.

## ⚡ 1-Click Install

Copy and paste this single command into your Termux and hit Enter. It will do everything for you automatically!

```bash
curl -sL "[https://raw.githubusercontent.com/kusnuzon/zplaywright/main/install.sh](https://raw.githubusercontent.com/kusnuzon/zplaywright/main/install.sh)" | bash

```
## 🧪 How to Test
Once the installation is complete, download and run the test script:
```bash
curl -O "[https://raw.githubusercontent.com/kusnuzon/zplaywright/main/tes.py](https://raw.githubusercontent.com/kusnuzon/zplaywright/main/tes.py)"
python tes.py

```
If it prints Example Domain, you are good to go!
## 💻 Python Setup Code
When writing your own script, you **must** use this browser configuration:
```python
browser = await p.chromium.launch(
    executable_path="/data/data/com.termux/files/usr/bin/chromium-browser",
    headless=True,
    args=["--no-sandbox", "--disable-gpu"]
)

```
