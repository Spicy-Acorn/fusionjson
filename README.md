# FusionJSON

FusionJSON is a node based JSON library for Blackmagic Design Fusion.

## Acknowledgements

- Kristof Indeherberge
- Cédric Duriau

## Installation

1. Clone or download the repository.
2. Set the absolute path of the **./fusion** directory into the Fusion
   **UserPaths:** path mapping.

## Contents

**Fuses**

- `jsonfromfile.fuse`: Fuse to read a JSON string from a file.
- `jsonget.fuse`: Fuse to get the value of a key in a JSON table.
- `jsonset.fuse`: Fuse to set a key value pair in a JSON table.
- `jsontofile.fuse`: Fuse to write a JSON string into a file.


**Modules/Lua**

- `jsonutils.lua`: Core module for JSON operations.
