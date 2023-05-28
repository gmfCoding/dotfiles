call plug#begin()
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'itchyny/lightline.vim'
call plug#end()

set number
set ruler
set mouse=a
set tabstop=4
set tabpagemax=100

" Disables error sounds
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Moves swap files to .vim directories (will crash if non existence)
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" hide these files from NERDTree
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
let NERDTreeRespectWildIgnore=1

" NERDTree config
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_new_tab=1
let g:nerdtree_tabs_synchronize_view=1

" NAVIGATION KEY MAPPING
nnoremap <leader>. :CtrlPTag<cr>
set tags+=$HOME/code/c/

" turns off arrow key navigation so you can practice with hjkl navigation keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
map ; :Files<CR>

" use CTRL-key to activate the NORMAL-mode hjkl movement keys in INSERT mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
