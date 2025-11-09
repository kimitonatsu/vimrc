set number
set relativenumber
set tabstop=2
set softtabstop=2
set mouse=a
set wrap
set linebreak

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
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-obsession'
Plug 'liuchengxu/vim-which-key'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
" 3. Set colorscheme
colorscheme molokai
" fzf navigation
nnoremap <leader>f :Files<CR>        " Search files
nnoremap <leader>g :Rg<CR>           " Grep in project
let g:ale_linters = {'cpp': ['clang', 'gcc']}
let g:ale_fixers  = {'cpp': ['clang-format']}
let g:ale_c_clang_executable = '/usr/lib64/ccache/clang'
let g:ale_cpp_clang_executable = '/usr/lib64/ccache/clang++'
let g:ale_c_gcc_executable = '/usr/lib64/ccache/gcc'
let g:ale_cpp_gcc_executable = '/usr/lib64/ccache/g++'

let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1
" Set delay in milliseconds (5000 ms = 5 seconds)
let g:ale_lint_delay = 5000

" Auto-fix on save if desired
let g:ale_fix_on_save = 1
nnoremap <silent> <leader>d <Plug>(coc-definition)
nnoremap <silent> <leader>r <Plug>(coc-references)
nnoremap <silent> <leader>k :call CocActionAsync('doHover')<CR>
nnoremap <silent> <leader>b <C-o>
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
tnoremap <Esc> <C-\><C-n>
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>

" Initialize which-key
let g:which_key_map = {}
nnoremap <Space> :WhichKey '<Space>'<CR>

" Toggle between different numbering modes
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
    set number
  endif
endfunction

nnoremap <leader>m :call NumberToggle()<CR>
