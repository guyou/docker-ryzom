This docker allows to run the 32bit version of the Ryzom's client.

Build the image
===============

Download Ryzom's client from http://sourceforge.net/projects/ryzom/files/ryzom_client.7z/download

Build with one of the following:

* `docker build ... -t ryzom:latest ...`
* `make`

Create your container
=====================

Create your container, with your own name (instead of `my_ryzom`):

    $ docker create -e "DISPLAY=unix:0.0" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" --privileged --name my_ryzom ryzom:latest

Run
===

The following runs:

    $ docker start my_ryzom

References
==========

* https://github.com/docker-32bit/
* https://github.com/gklingler/docker3d
