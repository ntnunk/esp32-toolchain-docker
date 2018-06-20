# ESP32 Toolchain Docker Image

A Docker image for a complete ESP32 toolchain and SDK.

To build the image:

```bash
docker build .
```

To use the image:

1. [Download](https://github.com/espressif/esp-idf/tree/master/examples/get-started/hello_world) a sample ESP32 program.
2. CD to the top-level directory of the sample program where the Makefile is.
3. execute the following command to configure the build:

```bash
docker run --rm -it -v $(pwd):/usr/build ntnunk/espressif-esp32-idf:1.0 make menuconfig
```

4. Follow the prompts to configure the build and flash options. Note that the Docker image _must_ be
   run in Interactive mode (using the -it option) to complete this step.
5. Build and flash the software with the following command. Note that the build should succeed but
   the flash step will fail unless a ESP32 device is connected to the comm port configured in the
   previous two steps.

```bash
docker run --rm -v $(pwd):/usr/build ntnunk/espressif-esp32-idf:1.0 make flash
```

There are other options to monitor, etc. More documentation on the ESP32 toolchain and SDK can be
found in the [ESP-IDF Programming Guide](http://esp-idf.readthedocs.io/en/latest/index.html) and in
the [ESP-IDF GitHub repository](http://esp-idf.readthedocs.io/en/latest/index.html).


