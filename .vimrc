set number
set relativenumber
set tabstop=2
set softtabstop=2
set mouse=a
set wrap
syntax on
filetype plugin on
set termguicolors
" 1. Leader key setup
nnoremap <Space> <Nop>    " remove any default mapping for space
let mapleader = " "        " use space as <Leader>

call plug#begin('~/.vim/plugged')
" Example plugins
Plug 'tpope/vim-sensible'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'      " linting
Plug 'sheerun/vim-polyglot'
Plug 'tomasr/molokai' 
Plug 'psliwka/vim-smoothie'
call plug#end()
" 3. Set colorscheme
colorscheme molokai
let g:ale_linters = {'cpp': ['clang', 'gcc']}
let g:ale_fixers  = {'cpp': ['clang-format']}

let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1
" Set delay in milliseconds (5000 ms = 5 seconds)
let g:ale_lint_delay = 5000

" Auto-fix on save if desired
let g:ale_fix_on_save = 1
" Hover documentation
nnoremap K :call CocActionAsync('doHover')<CR>
" Go to definition
nnoremap gd <Plug>(coc-definition)
" Find references
nnoremap gr <Plug>(coc-references)
" 4. Override popup menu colors for autocomplete / CoC
hi Pmenu       guibg=#252526 guifg=#d4d4d4
hi PmenuSel    guibg=#007acc guifg=#ffffff
hi PmenuSbar   guibg=#3c3c3c
hi PmenuThumb  guibg=#007acc

" Optional: Coc-specific popup tweaks
hi CocMenuSel    guibg=#007acc guifg=#ffffff
hi CocPmenuSbar  guibg=#3c3c3c
hi CocPmenuThumb guibg=#007acc

" 3. NERDTree toggle mapping
nnoremap <Leader>n :NERDTreeToggle<CR>
" 5. Other leader‑based example uses
nnoremap <Leader>f :Files<CR>   " example: <space>f to trigger a file search
nnoremap <Leader>c :w<CR>        " example: <space>c to save file
set undofile
set undodir=~/.vim/undodir
nnoremap <Leader>b :Buffers<CR>
set scrolloff=5
if &term =~ 'xterm'
  let &t_SI = "\e[6 q"  " Insert mode: bar cursor
  let &t_EI = "\e[2 q"  " Normal mode: block cursor
  let &t_SR = "\e[4 q"  " Replace mode: underline cursor
endif
" keeps normal block in place after reverting from insert mode
set nostartofline
autocmd InsertLeave * normal! l
