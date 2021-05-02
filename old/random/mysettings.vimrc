" This .vimrc by Martin Abreu: www.martinabreu.net
" Main features: basic features for vim (syntax, search highlighting, etc)
"		 plus spelling correction for american english when 
"		 working with a .tex file. Most of these settings can be 
"		 found in the vimrc example from http://vim.wikia.com/wiki/
"		 Example_vimrc. Others from http://timreynolds.org

" Lets you know that you're using this personalized vimrc file. 
" echo "VIMRC by Martin Abreu"

" Enable syntax highlighting
syntax on

" Sets the color scheme to darkblue
colorscheme darkblue

" Shows line numbers
set number

"Shows the name of the file you're working on
set title

" People in the internet say this allows for better command-line
" completion
set wildmenu

" Shows partial commands in the last line of the screen
set showcmd

" Instead of an error telling you of unsaved changes, gives you a dialogue
" asking you to confirm.
set confirm

" Doesnt' split lines in the middle of a word.
set linebreak

" ---------------------------------------------------------------
" Search options

" Search highlting, including partial matches.
set hls
set is

" Insensitive to case when searching, except when using capital letters
set ic
set smartcase

" Use Control+l to turn off search highlighting until next search
nnoremap <C-L> :nohl<CR><C-L>

" Assign .md extension to markdown file types. The first line just make sure that compatibility mode is off. This is required for the rest of the stuff.
set nocompatible
autocmd BufRead,BufNewFile *.md set filetype=markdown

" --------------------------------------------------------------
" Options for .tex, .txt and .md
autocmd BufRead,BufNewFile *.tex setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd FileType markdown setlocal spell
set spelllang=en
set spellfile=$HOME/Dropbox/Coding/en.utf-8.add
set spellfile=$HOME/Dropbox/Coding/es.utf-8.add
