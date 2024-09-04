# srtm4-windows

srtm4 module can be installed directly on MacOS or Linux system, Windows is difficult to find an effective solution on the Internet. This repository provides a simple and crude solution for installing srtm4 in Windows

# How to install srtm4

Step 1. install libtiff

```shell
pip install libtiff
```

Step 2. Set the libtiff path in makefile

You need to set the libtiff path in makefile  by replace the 7 row.

```shell
LIBTIFF_ROOT := C:/Users/10403/.conda/pkgs/libtiff-4.5.1-hd77b12b_0/Library
```

Step 3. copy the files to the target repository

Clone [centreborelli/srtm4: Download and parsing of SRTM4 elevation data (github.com) ](https://github.com/centreborelli/srtm4)into the local disk, and replace the files of the target repository using the files in this repository.

Finally, execute the command:

```shell
python setup.py install
```





