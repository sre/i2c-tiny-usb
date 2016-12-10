i2c-tiny-usb - (c) 2006 by Till Harbaum 
---------------------------------------
http://www.harbaum.org/till/i2c_tiny_usb

The firmware code itself is distributed under the GPL, but the
usb driver is not. Plase see the .txt files in usbdrv for details.

The default configuration is for a attiny85.

The attiny85 has to be programmed in high voltage serial 
programming (hsvp) mode since this application needs the
reset pin to be reconfigured for other use. The first
time it can be programmed via ISP, though. Just connect
the reset pin to SCL, ground to USB GND, +5V to USB VCC,
clk to USB+, MISO to SDA and MOSI to USB-.

Just type `make all` or `make flash` to compile and upload
the file. Please adjust e.g. programmer settings in the Makefile.
