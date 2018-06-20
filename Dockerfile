FROM ubuntu:16.04

RUN apt update
RUN apt-get install -y gcc git wget make libncurses-dev flex bison gperf python python-serial curl

RUN mkdir /opt/esp32
WORKDIR /opt/esp32

# Download and extract the build tools.
RUN curl https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz --output xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz

# Extract the build tools and set the path to include
# Toolchain will be extracted to /opt/esp32/xtensa-esp32-elf/ directory
RUN tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
ENV PATH="/opt/esp32/xtensa-esp32-elf/bin:${PATH}"

# Remove the tar file. Don't need it anymore.
RUN rm xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz

# Clone the SDK repository
RUN git clone --recursive https://github.com/espressif/esp-idf.git /opt/esp32/esp-idf
ENV IDF_PATH="/opt/esp32/esp-idf"

WORKDIR /usr/build

