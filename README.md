# ESP32 MicroPython Automation 🚀

This project automates the setup and deployment of MicroPython on an ESP32.

## 🔥 Features

* Automatic firmware flashing
* Upload of Python code (`main.py`)
* Serial monitor integration
* PowerShell automation (`deploy.ps1`)

## 📁 Project Structure

```
esp32/
├── deploy.ps1
├── main.py
└── firmware.bin
```

## ⚙️ Requirements

* Python 3.13
* esptool
* mpremote
* ESP32 board

## 🚀 Usage

Run the deployment script:

```bash
.\deploy.ps1
```

## 🧠 Notes

* Make sure only one ESP32 is connected
* Close any program using the serial port

## 📡 Future Improvements

* Auto-detect board type (ESP32 / ESP32-C3)
* Multi-device flashing
* WiFi-based deployment

---

Made with MicroPython ⚡

