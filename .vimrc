call plug#begin()
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
call plug#end()

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' && v:event.regname ==# 'x' | call system(s:clip, getreg("x")) | endif
    augroup END
endif

let g:user42 = 'clovell'
let g:mail42 = 'clovell@student.42adel.org.au'

syntax on
set number
set ruler
set mouse=a
set tabstop=4
set	shiftwidth=4
set tabpagemax=100
set nowrap
" Fix mouse seperator support
set ttymouse=sgr

" Selection colour
highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE

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

nmap <C-b> :NERDTreeToggle<CR>

" NERDTree config
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_new_tab=1
let g:nerdtree_tabs_synchronize_view=1

" NERDCommenter create default mappings
let g:NERDCreateDefaultMappings = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" NAVIGATION KEY MAPPING
nnoremap <leader>. :CtrlPTag<cr>
set tags+=$HOME/code/c/

" turns off arrow key navigation so you can practice with hjkl navigation keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" use CTRL-key to activate the NORMAL-mode hjkl movement keys in INSERT mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

augroup cursorline
  au!
  au ColorScheme * hi clear CursorLine
               \ | hi link CursorLine CursorColumn
augroup END

autocmd Syntax * syn keyword cStatement ft_errx
autocmd Syntax * syn keyword cStatement ft_assert
autocmd Syntax * syn match cType	/\<t_\a\w*\s/
autocmd Syntax * syn match cType	/\<s_\a\w*\s/
autocmd Syntax * syn match cConstant /\<E_\w*/
autocmd Syntax * syn match cConstant /\<E_\w*/
