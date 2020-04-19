# what-extension
A very simple CLI application that takes a file name and gives back the extension.

## Using the Distributed Package
I've created a distribution backage, that makes it easier to start using right away. This is if you don't want to build from the sources yourself. 

Simply extract the executable file from `/wext-dist.tgz/bin/` to wherever you like. 

## Building from Sources
If you'd like, you can also build from the sources as well. 

You can use _Dr.Racket_ for this, if you have this installed. Select "Racket" from the top menu, then chose "Create Executable...". A new window will pop up, where you can select the options for building. Feel free to select whatever options you like.

If you'd rather build sources from the command line, first ensure that you have access to racket. Run `racket -v` to check if you have it installed. If not, you'll have to install it from either your distro of choice (linux), or the installer from the Racket home (Windows).

Once you have the racket CLI tools installed, `cd` into the source directory, and run `raco exe wext.rkt`.

## Running the Program
Once you've got the executable file, either from the distributed package or the sources, run it like any other executable from the command line.

```
> ./wext -f file.txt
```