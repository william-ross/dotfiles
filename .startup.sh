#!/bin/bash

if [ "$(uname)" == "Darwin"]; then
    if which -s brew; then
        echo 'Homebrew is already installed'
    else
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    brew install chezmoi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    snap install chezmoi --classic
else
    echo 'Operating system not supported'
fi

chezmoi init william-ross
chezmoi apply