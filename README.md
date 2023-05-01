# Code Server Font Patch

This patchs [code-server](https://github.com/cdr/code-server) to enable load fonts [Fira Code](https://github.com/tonsky/FiraCode) in server.

## Installation

- Clone this repository.

```bash
git clone https://github.com/tuanpham-dev/code-server-font-patch.git
cd code-server-font-patch
```

- Run this command (change `path-to-code-server` to your code-server path, leave it empty if you install code-server from installer or code-server is in `/usr/lib/code-server`):
  - For **MacOS** the path is 
  - `/usr/local/Cellar/code-server/[version]/libexec`

```bash
sudo ./patch.sh [path-to-code-server]
```
## How It Works

The patch copies all the file in the `resource/font/*` into the fonts folder in the `workbench` folder of the code-server.

Then it adds the fonts with different weights to the end of the editors `.css` file so it loads with the application

## Font Patcher
This is a project that patches nerd font to your desired font. All you need to do is to run the patcher, then moving the font to the font folder so that it can be used by bash script

## To Do

optimise bash script so that it deletes the `fonts` folder in the workbench before adding the new one? and somehow deleteing the olld apeneed css stylesheet at the bottom of the main file 
## Settings

You may need to set font family in code-server settings:

```
"editor.fontFamily": "'Fira Code', Consolas, 'Courier New', monospace",
"terminal.integrated.fontFamily": "'Fira Code', Consolas, 'Courier New', monospace",
```
