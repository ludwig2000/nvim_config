set noerrorbells
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set smartindent
set noswapfile
set smartcase
set nowrap
set expandtab
set incsearch
set autochdir
set completeopt-=preview
set number relativenumber
set guicursor=a:blinkon100


call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'fratajczak/one-monokai-vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'rakr/vim-one'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'frazrepo/vim-rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'tssm/fairyfloss.vim'

call plug#end()

let g:material_terminal_italics = 1
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
let g:airline_powerline_fonts=1
let g:rainbow_active = 1
set guifont=HackBold\ Nerd\ Font\ 11
map <C-f> :NERDTreeToggle<CR>
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
let g:material_theme_style = 'palenight'
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']


let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]


let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_tranparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>

" coc
set updatetime=300
set signcolumn=yes

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-emmet',
    \ 'coc-css',
    \ 'coc-java',
    \ 'coc-go',
    \ 'coc-clangd',
    \ 'coc-python',
    \ 'coc-rls'
\ ]

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

