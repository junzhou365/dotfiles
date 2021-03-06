
syntax on
set number
set encoding=utf-8
let mapleader=","
colorscheme desert

" Copy and Paste {
  function! PasteFromTmp()
    let @" = readfile('/tmp/vitmp')[0]
  endfunc

vmap <leader>y y :call writefile([@"], '/tmp/vitmp')<CR>
nmap <leader>p :call PasteFromTmp()<CR>
" }
"
highlight Comment cterm=italic

" Formatting {
  set nowrap                      " Do not wrap long lines
  set autoindent                  " Indent at the same level of the previous line
  set shiftwidth=4                " Use indents of 4 spaces
  set expandtab                   " Tabs are spaces, not tabs
  set tabstop=4                   " An indentation every four columns
  set softtabstop=4               " Let backspace delete indent
  set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
  set splitright                  " Puts new vsplit windows to the right of the current
  set splitbelow                  " Puts new split windows to the bottom of the current
  "set matchpairs+=<:>             " Match, to be used with %
  set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
  set laststatus=2
  autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
" }

" toggle NERDTree {
  map <C-y><C-t> :NERDTreeToggle<CR>
  " find dir where the current file is
  map <C-y><C-f> :NERDTreeFind<CR>
  vnoremap // y/<C-R><CR>
" }

set dictionary=/usr/share/dict/words

" Python Style {
  set smartcase
  set ff=unix
  set colorcolumn=80

  " highlight spurious whitespace before the linter does
  highlight ExtraWhitespace ctermbg='06' guibg='06'
  match ExtraWhitespace /\s\+$/

  " backups are a little silly when you're using patches constantly
  set nobackup
  set noswapfile

  map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
  map <F3> :source ~/vim_session <cr>     " And load session with F3
" }

" search {
" Press <F9> to toggle highlighting on/off, and show current value.
  set incsearch
  set hlsearch
  set lazyredraw
  noremap <F9> :set hlsearch! hlsearch?<CR>
" }

" === mappings ===
nmap G Gzz
nmap n nzz
nmap N Nzz

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" BBye {
  nnoremap <leader>q :Bdelete<CR>
" }

" relative number {
  nnoremap <F11> :set norelativenumber! norelativenumber?<CR>
" }

" Spell {
  nnoremap <F10> :set spell! spell?<CR>
" }

" Cscope {
if has("cscope")
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    if filereadable("pycscope.out")
        cs add pycscope.out
    endif
    cs reset
endif
" }

" ctags {
  nnoremap <leader>] :ts <C-R>"<CR>
" }

" window {
  nnoremap <leader>m :res <bar> :vert res<CR>
" }

" open another current buffer instance {
  nnoremap <leader>" :let @"=@%<CR>
  nnoremap <leader>e :e <C-R>"<CR>
" }

" highlights {
  highlight SpellBad ctermfg='09' guifg='09'
" }

" checkttime {
  nnoremap <leader>c :checktime<CR>
" }

" file encoding {
set fileencodings=utf-8,gb2312
" }

"\ 'colorscheme': 'PaperColor_light',
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'relativepath', 'modified'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

