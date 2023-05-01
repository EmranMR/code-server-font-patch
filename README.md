# Code Server Font Patch

This patchs [code-server](https://github.com/cdr/code-server) to
enable load fonts [Fira Code](https://github.com/tonsky/FiraCode) in
server.

## Installation

-   Clone this repository.

```bash
git clone https://github.com/tuanpham-dev/code-server-font-patch.git
cd code-server-font-patch
```

-   Run this command (change `path-to-code-server` to your code-server
    path, leave it empty if you install code-server from installer or
    code-server is in `/usr/lib/code-server`):
    -   For **MacOS** the path is
    -   `/usr/local/Cellar/code-server/[version]/libexec`

```bash
sudo ./patch.sh [path-to-code-server]
```

## How It Works

The patch copies all the file in the `resource/font/*` into the fonts
folder in the `workbench` folder of the code-server.

Then it adds the fonts with different weights to the end of the
editors `.css` file so it loads with the application

if you run it again it the patch.sh removes the old css and replace
with the new one, it also removes all the fonts in the
`workbench/font` and adds new ones

## Font Patcher

This is a project that patches nerd font to your desired font. All you
need to do is to run the patcher, then moving the font to the font
folder so that it can be used by bash script Look at `nerdFont/`
submodule for more info

## Settings

You may need to set font family in code-server settings:

```
"editor.fontFamily": "'Fira Code', Consolas, 'Courier New', monospace",
"terminal.integrated.fontFamily": "'Fira Code', Consolas, 'Courier New', monospace",
```
