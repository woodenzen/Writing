#!/bin/zsh

echo "What is your writing project's working title?"
read NAME
echo $NAME

mkdir /Users/will/Dropbox/Projects/Writing/Active/$NAME
cd /Users/will/Dropbox/Projects/Writing/Active/$NAME
mkdir _drafts
mkdir _research
mkdir media
mkdir _stage
# cp /Users/will/Dropbox/zettelkasten/Writing/Tools/TEMPLATE.sh .
# cp /Users/will/Dropbox/Projects/Writing/Build/Templates/template.md $NAME.md
# cp /Users/will/Dropbox/zettelkasten/Writing/Tools/mla.csl .
touch README.markdown
# touch scratch-$NAME.md
cp /Users/will/Dropbox/Projects/Writing/Build/Makefile .
cp "/Users/will/Dropbox/zettelkasten/Write Better Sentences 202301142155.md" /Users/will/Dropbox/Projects/Writing/Active/$NAME/_editing
cp "/Users/will/Dropbox/zettelkasten/Editing Checklist 202002081650.md" /Users/will/Dropbox/Projects/Writing/Active/$NAME/_editing
#cp ~/.pandoc/vc-git.awk .
# touch .gitignore
# echo ".DS_Store" >> .gitignore
# # echo "vc.tex" >> .gitignore
# cat .gitignore
# git init
# git add * .gitignore
# git commit -m "initial commit"
