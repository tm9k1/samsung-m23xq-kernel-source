Linux kernel
============

There are several guides for kernel developers and users. These guides can
be rendered in a number of formats, like HTML and PDF. Please read
Documentation/admin-guide/README.rst first.

In order to build the documentation, use ``make htmldocs`` or
``make pdfdocs``.  The formatted documentation can also be read online at:

    https://www.kernel.org/doc/html/latest/

There are various text files in the Documentation/ subdirectory,
several of them using the Restructured Text markup notation.
See Documentation/00-INDEX for a list of what is contained in each file.

Please read the Documentation/process/changes.rst file, as it contains the
requirements for building and running the kernel, and information about
the problems which may result by upgrading your kernel.

How to build?
-------------

My environment uses Docker for maximum compatibility. Learn more about docker [here](https://www.docker.com/).

1. Install Docker, docker compose
1. Get docker running ( docker run hello-world should run perfectly)
1. Go to `<repo root>/docker/` and study the compose file for deployment details.
1. Once you are comfy, run `docker compose up --build -d` in the directory.

    >  Now you have a container called `kontainer` that can build the image

1. Refer to `build_kernel.sh` for build command, but before that change variables as needed in the script.
