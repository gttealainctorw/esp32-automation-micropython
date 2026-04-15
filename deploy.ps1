# ===== CONFIG =====
$firmware = "ESP32_GENERIC-20260406-v1.28.0.bin"
$main = "main.py"

Write-Host " Buscando ESP32..."

# ===== DETECTAR PUERTO =====
$port = Get-WmiObject Win32_SerialPort |
Where-Object {
    $_.Name -match "CP210|CH340|USB|UART"
} |
Select-Object -First 1 -ExpandProperty DeviceID

if (-not $port) {
    Write-Host " No se encontró ningún ESP32"
    exit
}

Write-Host " ESP32 detectado en $port"

# ===== BORRAR =====
Write-Host " Borrando memoria..."
py -3.13 -m esptool --chip esp32 --port $port erase-flash

# ===== FLASHEAR =====
Write-Host " Instalando MicroPython..."
py -3.13 -m esptool --chip esp32 --port $port --baud 460800 write-flash -z 0x1000 $firmware

Start-Sleep -Seconds 2

# ===== SUBIR CODIGO =====
Write-Host " Subiendo main.py..."
py -3.13 -m mpremote connect $port fs cp $main :

# ===== REINICIAR =====
Write-Host " Reiniciando..."
py -3.13 -m mpremote connect $port reset

# ===== MONITOR =====
Write-Host " Monitor activo (Ctrl + ] para salir)..."
py -3.13 -m mpremote connect $port

Write-Host " TODO LISTO "