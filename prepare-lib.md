Examples of package installation for building this project.

Ubuntu/Debian:

```bash
sudo apt update
sudo apt install -y \
  cmake \
  build-essential \
  libboost-all-dev \
  libitpp-dev \
  libfftw3-dev \
  libblas-dev \
  liblapack-dev \
  librtlsdr-dev \
  libncurses-dev
```

Equivalent Homebrew packages (macOS, CMake 3.16+):

```bash
brew install \
  cmake \
  boost \
  itpp \
  fftw \
  openblas \
  librtlsdr \
  ncurses
```

Optional on macOS:

```bash
brew install libomp
```

Optional:
- OpenCL runtime/SDK if you want GPU acceleration (`-DUSE_OPENCL=0` disables OpenCL).
- `hackrf` and/or `bladerf` libraries if you build with `-DUSE_HACKRF=1` or `-DUSE_BLADERF=1`.


If configuration keeps picking old settings, clear CMake cache files and re-run configure:

```bash
rm -f build/CMakeCache.txt
rm -rf build/CMakeFiles
```
