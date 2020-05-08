#!/bin/bash

export ORIGINAL_PATH=`pwd`

echo "Check and install vim-plug."

# if we don't have folder vimfiles, create it.
if [ ! -d "./vimfiles/" ]; then
    mkdir ./vimfiles/
fi
cd ./vimfiles/

# if we don't have bundle, create it.
if [ ! -d "./bundle/" ]; then
    mkdir ./bundle/
fi
cd ./bundle/

# download or update vundle in ./vimfiles/bundle/
if [ ! -d "./vim-plug/" ]; then
    git clone https://github.com/junegunn/vim-plug
fi

# download and install bundles through Vundle in this repository
echo "Update vim-plugins."
cd ${ORIGINAL_PATH}
vim --cmd "set rtp=./vimfiles,\$VIMRUNTIME,./vimfiles/after" +PlugInstall +PlugClean +PlugUpdate +qall

# TODO
# install powerline-fonts on MacOSX
# cd ./ext/powerline-fonts/DejaVuSansMono/
# if [ ! -f "~/Library/Fonts/DejaVu\ Sans\ Mono\ Bold\ Oblique\ for\ Powerline.ttf" ]; then
#     cp ./DejaVu\ Sans\ Mono\ Bold\ Oblique\ for\ Powerline.ttf ~/Library/Fonts/
# fi
# if [ ! -f "~/Library/Fonts/DejaVu\ Sans\ Mono\ Bold\ for\ Powerline.ttf" ]; then
#     cp ./DejaVu\ Sans\ Mono\ Bold\ for\ Powerline.ttf ~/Library/Fonts/
# fi
# if [ ! -f "~/Library/Fonts/DejaVu\ Sans\ Mono\ Oblique\ for\ Powerline.ttf" ]; then
#     cp ./DejaVu\ Sans\ Mono\ Oblique\ for\ Powerline.ttf ~/Library/Fonts/
# fi
# if [ ! -f "~/Library/Fonts/DejaVu\ Sans\ Mono\ for\ Powerline.ttf" ]; then
#     cp ./DejaVu\ Sans\ Mono\ for\ Powerline.ttf ~/Library/Fonts/
# fi
echo "Please install powerline-fonts manually."

# go back
cd ${ORIGINAL_PATH}

#
echo "|"
echo "exVim installed successfully!"
echo "|"
echo "You can also run following script to replace exVim with your Vim."
echo "#!/bin/bash"
echo "cwd=\$(pwd)"
echo "escape_cwd=\$(printf \"%q\" \"\$(pwd)\")"
echo "vim"
echo "-u \"${cwd}/.vimrc\""
echo "--cmd \"let g:exvim_custom_path='${cwd}'\""
echo "--cmd \"set runtimepath=${escape_cwd}/vimfiles,\$VIMRUNTIME,${escape_cwd}/vimfiles/after\""
echo "${1:+\"$@\"}"
