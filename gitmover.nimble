# Package

version       = "0.0.2"
author        = "Mark Baggett"
description   = "A binary to git mv bad files"
license       = "GPL-3.0"
srcDir        = "src"
bin           = @["gitmover"]



# Dependencies

requires "nim >= 1.0.6"
requires "argparse >= 0.10.0"

