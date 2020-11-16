import os, strformat, re, argparse

proc walk_and_check(directory: string): seq[string] =
  for file in walkDirRec directory:
    if file.match re".*\.xml":
      if file.contains(':'):
        let 
          new_name = file.replace(':', '_')
        discard execShellCmd(fmt"git mv {file} {new_name}")
        result.add(new_name)

proc write_bad_files(bad_files: seq[string], output_file: string) =
  writeFile(output_file, $bad_files)

proc add_extension(directory: string): seq[string] =
  for file in walkDirRec directory:
    if endsWith(file, ".xml") == false:
      let new_name = fmt"{file}.xml"
      discard execShellCmd(fmt"git mv {file} {new_name}")
      result.add(new_name)

when isMainModule:
  var
    p = newParser("Git mv bad files."):
      option("-p", "--path", help="Specify path to XML.")
      option("-f", "--file", default="bad_files.txt")
      option("-t", "--type", help="Specifiy add xml 'extension' or replace 'colon' in pid.", default="colon")
    argv = commandLineParams()
    opts = p.parse(argv)
  if opts.path != "":
    if opts.type == "extension":
      let processed_files = add_extension(opts.path)
      write_bad_files(processed_files, "processed_files.txt")
      echo fmt"Renamed {len(processed_files)} processed files(s): {processed_files}"
    else:
      let bad_files = walk_and_check(opts.path)
      write_bad_files(bad_files, opts.file)
      echo fmt"Found {len(bad_files)} bad file(s): {bad_files}"