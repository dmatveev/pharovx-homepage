PharoVX
=======

PharoVX is a Pharo interface to [OpenVX][]. PharoVX provides core OpenVX objects and API to work with almost all OpenVX 1.0 kernels. Initial version of PharoVX is developed mostly during [ESUG 2015] and announced on July 16th, 2015.

PharoVX is hosted at [SmalltalkHub][].

ESUG 2015 Slides: [PDF], [SlideShare].


Installation
------------

### System

First you need download and install the reference implementation of OpenVX by Khronos:

        $ wget https://www.khronos.org/registry/vx/sample/openvx_sample_1.0.1.tar.bz2
        $ tar -xjvf openvx_sample_1.0.1.tar.bz2
        $ cd openvx_sample

Now build OpenVX. Make sure that `python`, `gcc`, `cmake`, `make`, etc are installed:

        $ python Build.py --arch=32 --os=Linux

*Important* : PharoVX was tested on GNU/Linux only. Also make sure you building a 32-bit version.

If everything was fine, you now have an OpenVX binary at:

        $ find $PWD/install/Linux/x32/Release/bin/libopenvx.so

Remember this path, since you will need to specify it in Pharo before starting using PharoVX.

### Pharo

Load this repository:

        MCHttpRepository
        	location: 'http://www.smalltalkhub.com/mc/DmitryMatveev/PharoVX/main'
        	user: ''
        	password: ''

Now open `Playground` and invoke:

        VX currentRuntime: '/path/to/your/libopenvx.so'.

Now, in theory, you can run some examples (assuming you have a test image at `/tmp/image.jpg`):

        VXExamples esugChannelExtract: '/tmp/image.jpg'.
        VXExamples esugSharpen:        '/tmp/image.jpg'.
        VXExamples esugCannyEdges:     '/tmp/image.jpg'.
        VXExamples esugCorners:        '/tmp/image.jpg'.

Debugging
---------

If something will go wrong, OpenVX will report it to you only by a cryptic numeric code. But you still can debug your pipeline and get details about any errors.

OpenVX by Khronos supports different levels of traces, and it can be configured using an environment variable. You will need to start Pharo this way:

        $ VX_ZONE_LIST="0,1,4,5,8,9,10,11,12,13,14,15" ./pharo 

Every number in the `VX_ZONE_LIST` variable stands for a particular tracing details. So far it is:

        enum vx_debug_zone_e {
            VX_ZONE_ERROR       = 0,    /*!< Used for most errors */
            VX_ZONE_WARNING     = 1,    /*!< Used to warning developers of possible issues */
            VX_ZONE_API         = 2,    /*!< Used to trace API calls and return values */
            VX_ZONE_INFO        = 3,    /*!< Used to show run-time processing debug */
        
            VX_ZONE_PERF        = 4,    /*!< Used to show performance information */
            VX_ZONE_CONTEXT     = 5,
            VX_ZONE_OSAL        = 6,
            VX_ZONE_REFERENCE   = 7,
        
            VX_ZONE_ARRAY       = 8,
            VX_ZONE_IMAGE       = 9,
            VX_ZONE_SCALAR      = 10,
            VX_ZONE_KERNEL      = 11,
        
            VX_ZONE_GRAPH       = 12,
            VX_ZONE_NODE        = 13,
            VX_ZONE_PARAMETER   = 14,
            VX_ZONE_DELAY       = 15,
        
            VX_ZONE_TARGET      = 16,
            VX_ZONE_LOG         = 17,
        
            VX_ZONE_MAX         = 32
        };

See `$OPENVX_DIR/debug/vx_debug.h` for details.

Now when you receive an error in PharoVX, check the terminal where you running Pharo for error details.

License
-------

PharoVX is available under terms of MIT license:
        
        Copyright (c) 2015 Dmitry Matveev
        
        Permission is hereby granted, free of charge, to any person obtaining a copy
        of this software and associated documentation files (the "Software"), to deal
        in the Software without restriction, including without limitation the rights
        to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        copies of the Software, and to permit persons to whom the Software is
        furnished to do so, subject to the following conditions:
        
        The above copyright notice and this permission notice shall be included in
        all copies or substantial portions of the Software.
        
        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
        THE SOFTWARE.


Contacts
--------

Dmitry Matveev <`dmitry [dot] matveev [at] itseez [dot] com`>

[OpenVX]:       http://khronos.org/openvx
[ESUG 2015]:    http://www.esug.org/wiki/pier/Conferences/2015
[SmalltalkHub]: http://smalltalkhub.com/#!/~DmitryMatveev/PharoVX
[PDF]:          http://dmitrymatveev.co.uk/pharovx/PharoVX-ESUG2015.pdf
[SlideShare]:   http://www.slideshare.net/DmitryMatveev/pharo-vx
