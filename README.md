# UTK Metadata XML "Git Mover"

This repo generates a binary that can be used to "git mv" XML files around so that they don't increase the size of the repository.

## What does it do

Not much.  It is designed to address two common use cases: 1) adding .xml to XML files missing a .xml extension and 2) replacing colons with underscores so that they are Windows compatible.

## Warning

This thing was built in 30 minutes.  It's only for these two things and should be used with extreme caution.

Most importantly, if using the .xml extension adder, note that the binary will add .xml to any file that doesn't end in .xml.  For instance, `mark.png`
becomes `mark.png.xml`.  In other words, it assumes you want to apply the rule to everything.

## Commands

If you want to replace colons with underscore, you can:

```
gitmover -p path_to_xml
```

or

```
gitmover -p path_to_xml -t colon
```

If you want to add a .xml extension (see warnings above), you can:

```
gitmover -p path_to_xml -t extension
```

## Installing

Download the Mac or Linux version and place it in your path.  If you don't want to place it in your path, you can call the binary from wherever you are with something like:

```
./gitmover -p path_to_xml -t extension
```
