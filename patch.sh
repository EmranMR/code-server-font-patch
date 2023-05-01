#!/bin/bash
if [ -z $1 ]; then
  CODE_SERVER_PATH="/usr/lib/code-server"
else
  CODE_SERVER_PATH="$1"
fi

WORKBENCH_PATH="$CODE_SERVER_PATH/lib/vscode/out/vs/workbench"
WORKBENCH_CSS_PATH="$WORKBENCH_PATH/workbench.web.main.css"

# Check if it is valid path
if [ -z "$CODE_SERVER_PATH" -o ! -d "$WORKBENCH_PATH" ]; then
  echo "Please give valid code-server path!"
  exit 1
fi

if grep -q "/* ::CUSTOM VSCODE FONTS:: */" "$WORKBENCH_CSS_PATH"; then
  # Remove previously appended fonts.css from workbench.web.main.css
  sed -i '/\/\* ::CUSTOM VSCODE FONTS:: \*\//,/\*\//d' $WORKBENCH_CSS_PATH
fi

# Delete all font files in the workbench path
rm -f "$WORKBENCH_PATH/fonts/"*

# Copy fonts to $WORKBENCH_PATH
cp -rn ./resources/fonts "$WORKBENCH_PATH/"

# Append fonts.css to workbench.web.main.css
echo "/* ::CUSTOM VSCODE FONTS:: */" >> $WORKBENCH_CSS_PATH
cat ./resources/fonts.css >> $WORKBENCH_CSS_PATH

echo "Done! Have fun!"
