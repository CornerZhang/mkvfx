# mkvfx - Make vfx libraries and programs

This is a tool that builds open source libraries commonly used in
games, film, and vfx.

It is more like npm, and less like brew. It knows about dependencies, and
fetches what it needs. It builds as correctly and completely as it can, in
some cases by working around difficulties or inconsistencies in a library's
build system.

It expects to run in a directory in which there will be a directory called
local. If local doesn't exist, it will make one. If you run in /usr, it
will populate /usr/local/lib, /usr/local/include, /usr/local/bin, and so on.

The more interesting thing it will do is populate minimal local dependencies.
If you are making a project that needs only OpenSubdiv, running 

```sh
 mkvfx OpenSubdiv
```

in your project directory will give you the strict local dependencies to
have a working copy of OpenSubdiv, and nothing extraneous. This makes it
very easy to quarantine a project. If you also need OpenEXR in that same
project, subsequently running

```sh
 mkvfx OpenEXR
```

will add the bits that were not already there for OpenSubdiv.

At the moment there are only recipes for OSX, but a small amount of patch
will allow building on other platforms. Pull requests welcome of course.

It would be nice if the script also know about configurations. At the 
moment, it pulls top of tree of a specific branch (by default master), but
a little sugar in the recipes file for configurations could allow for
doing a build that conforms to something specific such as vfxplatform.com's
"Current - VFX Platform CY2015".


## Installation

Install node, minimally 0.11.14, using nvm. You'll also get npm with it.

Install grunt using

```sh
 npm install -g grunt-cli
```

clone this repo. Run grunt in the root directory.

Now type mkvfx, and all will be revealed.

You should see a message like -

```
 mkvfx knows how to build:
 Alembic
 assimp
 boost
 boost-build-club
 c-blosc
 glew
 glfw
 glm
 hdf5
 IlmBase
 libjpeg
 libpng
 libtiff
 llvm
 OpenColorIO
 OpenEXR
 OpenImageIO
 OpenShadingLanguage-WIP
 OpenSubdiv
 OpenVDB-WIP
 partio
 ptex
 PyIlmBase
 python
 sqlite
 tbb

 mkvfx [options] [packages]
 --help           this message
 --install        install previously built package if possible
 --nofetch        skip fetching, default is fetch
 --nobuild        skip build, default is build
 --nodependencies skip dependencies
 -nfd             skip fetch and dependencies
 [packages]       to build, default is nothing


 Note that git repos are shallow cloned.
```






### License
Copyright (c) 2014 Nick Porcino  
Licensed under the MIT license.
