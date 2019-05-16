set nocompatible
filetype off

if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'taiansu/nerdtree-ag'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Motion
Plug 'bkad/CamelCaseMotion'
Plug 'easymotion/vim-easymotion'

" Clipboard
Plug 'vim-scripts/YankRing.vim'
"use system clipboard
set clipboard=unnamed 

let g:yankring_replace_n_pkey = ''
let g:yankring_history_dir = '~/.vim'
nnoremap <silent> <Leader>y :YRShow<CR> 

" Undo
Plug 'sjl/gundo.vim'

" Replace
Plug 'skwp/greplace.vim'

" File Navigation
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](tmp|log|sprockets|public/uploads|coverage|public/assets|/vendor/bundle|.git|.vim|node_modules\$|app/assets/fonts|DS_Store)',
  \ 'file': '\v(so|swp|exe|dll)$',
  \ }
let g:ctrlp_cmd = ':NERDTreeClose\|CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_extensions = ['buffertag', 'line']

if executable('fd')
    let g:ctrlp_user_command = 'fd -c never "" "%s"'
    let g:ctrlp_use_caching = 0
endif

" CtrlP auto cache clearing
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

nnoremap <Leader>mm :CtrlPBufTag<CR> " search function methods
nnoremap <Leader>cl :CtrlPLine<CR> " search though lines in current buffer"
nnoremap <Leader><Leader>c :CtrlPMRUFiles<CR> " recently edited buffers
nnoremap <silent> <C-p> :ClearCtrlPCache<cr>\|:CtrlP<cr> " clear cache before opening ctrl-p

" speed up ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

let ctrlp_switch_buffer=0
let g:ctrlp_working_path_mode=0

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Comments
Plug 'scrooloose/nerdcommenter'

" Brackets
Plug 'Raimondi/delimitMate'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'

" Tags
Plug 'tpope/rbenv-ctags'
Plug 'ludovicchabant/vim-gutentags'

" Themes
Plug 'morhetz/gruvbox'

" Buffers
Plug 'duff/vim-bufonly'

" Conversion
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/ConflictMotions'
Plug 'whiteinge/diffconflicts'
Plug 'will133/vim-dirdiff'
Plug 'rhysd/git-messenger.vim'
Plug 'jreybert/vimagit'

" HTML
Plug 'othree/html5.vim', { 'for': ['html'] }
Plug 'mattn/emmet-vim', { 'for': ['html'] }

" CSS
Plug 'KabbAmine/vCoolor.vim'

" Markup
Plug 'tpope/vim-haml', { 'for': ['haml'] }
Plug 'slim-template/vim-slim', { 'for': ['slim'] }

" JSON
Plug 'tpope/vim-jdaddy', { 'for': ['json'] }
Plug 'maksimr/vim-jsbeautify', { 'for': ['json'] }

" Javascript
Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript'] }

" React
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby'] }

" Style/Format
Plug 'ngmy/vim-rubocop'
Plug 'godlygeek/tabular'
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,\zs<CR>
vmap <Leader>t, :Tabularize /,\zs<CR>
nmap <Leader>t> :Tabularize /=>\zs<CR>
vmap <Leader>t> :Tabularize /=>\zs<CR>

Plug 'nathanaelkane/vim-indent-guides'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plug 'junegunn/vim-easy-align'
Plug 'ruby-formatter/rufo-vim'

" Utilities
Plug 'gelguy/Cmd2.vim'
Plug 'vim-airline/vim-airline'
" buffer names show up on top
let g:airline#extensions#tabline#enabled = 1 

let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

" make airline statusbar appear all the time, even without split
set laststatus=2 

" set alternate color for modified active/inactive tabs
autocmd VimEnter *
   \ let g:airline#themes#gruvbox#palette.tabline = {
   \    'airline_tabmod':       ['#f8f8f8','#780000',231,88,''],
   \    'airline_tabmod_unsel': ['#dddddd','#463030',231,52,''],
   \ } | :AirlineRefresh
Plug 'bronson/vim-crosshairs'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-eunuch'

" Support Libraries
Plug 'vim-scripts/CountJump' "used by Conflictmotions
Plug 'vim-scripts/ingo-library'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'xolox/vim-misc'

" Rspec
Plug 'thoughtbot/vim-rspec'

" Misc
Plug 'troydm/zoomwintab.vim' "C-w-o toggle split full screen

call plug#end()

let g:returnApp = "iTerm"

" Maps
let mapleader=","

nnoremap <Leader>th :nohlsearch<cr>
nnoremap <Leader>tw :set wrap!<cr>
nnoremap <Leader>tn :set number!<cr>
nnoremap <Leader>tp :set paste!<cr>
nnoremap <Leader>ty :set cursorline! cursorcolumn!<CR>

" insert hashrocket
imap <c-l> <space>=><space>| 

" make JSON/html/JS pretty
map <Leader><Leader>b :call JsBeautify()<cr> 

" trigger color picker
let g:vcoolor_map = '<Leader>co' 

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" faster esc
inoremap jk <Esc>

" toggle Indent Guides
nnoremap <leader>tg :IndentGuidesToggle<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Pretty
let iterm_profile = $ITERM_PROFILE

if iterm_profile == "Dark"
    set background=dark
else
    set background=light        " Set solarized background color
endif

set background=dark

"256 colors in terminal
"set t_CO=256 
set termguicolors

colorscheme gruvbox

" highlight extra white space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" eliminate trailing spaces when saving file
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
function! TrimWhiteSpaceAndBlankLines()
  call TrimWhiteSpace()
  call TrimTrailingBlankLines()
endfunction
function! TrimTrailingBlankLines()
  :silent! %s#\($\n\s*\)\+\%$##
endfunction
"only in these files
autocmd BufWritePre *.rb,*.html,*.erb,*.css,*.scss,*.coffee,*.js,*.sass,*.yml :call TrimWhiteSpaceAndBlankLines() 

" Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" indent text using shift+> and shift+<
nnoremap <Leader>d :bp\|bd #<CR>| 

" indent
vnoremap > >gv
vnoremap <lt> <lt>gv 

" go between splits
map ˙ :wincmd h<CR>| " A-h
map ˍ :wincmd h<CR>| " A-h
map ∆ :wincmd j<CR>| " A-j
map ˝ :wincmd j<CR>| " A-j
map ˚ :wincmd k<CR>| " A-k
map ¬ :wincmd l<CR>| " A-l
map - :wincmd l<CR>| " A-l

" close splits
map ç :close<CR>| "A-c
map ¸ :close<CR>| "A-c
map œ <C-w>q| "A-q

" create new splits
map ß :split<CR>| "A-s
map √ :vsplit<CR>| "A-v
map ˇ :vsplit<CR>| "A-v

" resize splits
map ¥ <C-w><<CR>| "A-y width -
map \ <C-w><<CR>| "A-y width -
map ¨ <C-w>+<CR>| "A-u height +
map ˆ <C-w>-<CR>| "A-i height -
map ʼ <C-w>-<CR>| "A-i height -
map ø <C-w>><CR>| "A-o width +
map ≠ <C-w>=<CR>| "A-= make all same size

" always create split below and to the right of current
set splitbelow
set splitright

" go to buffer on right
nnoremap <C-l> :bnext<CR>

" go to buffer on left
nnoremap <C-h> :bprevious<CR>

" close all other buffers
map <Leader>o :BufOnly<CR> 

" close all buffers 
map <Leader>q :%bdelete<CR> 

" toggle between last edited buffers using backspace
nnoremap <bs> <c-^>

" gelguy/Cmd2.vim
function! s:CustomFuzzySearch(string)
  let pattern = ""
  let ignore_case = g:Cmd2__complete_ignorecase ? '\c' : ''
  let char = matchstr(a:string, ".", byteidx(a:string, 0))
  let pattern = '\V' . ignore_case
  let pattern .= '\<\%(\[agls]\:\)\?'
  let pattern .= '\%(\%(\k\*\[._\-#]\)\?' . char . '\|\k\*\%(' . char . '\&\L\)\)'
  if g:Cmd2__complete_fuzzy
    let result = ''
    let i = 1
    while i < len(a:string)
      let char = matchstr(a:string, ".", byteidx(a:string, i))
      let result .= '\%(' . '\%(\k\*\[._\-#]\)\?' . char . '\|'
      let result .= '\k\*\%(' . char . '\&\L\)' . '\)'
      let i += len(char)
    endwhile
    let pattern .= result
  else
    let pattern .= a:string
  endif
  let pattern .= g:Cmd2__complete_end_pattern
  return pattern
endfunction

let g:Cmd2_options = {
      \ '_complete_ignorecase': 1,
      \ '_complete_uniq_ignorecase': 0,
      \ '_complete_pattern_func': function('s:CustomFuzzySearch'),
      \ '_complete_start_pattern': '\<\(\[agls]\:\)\?\(\k\*\[_\-#]\)\?',
      \ '_complete_fuzzy': 1,
      \ '_complete_string_pattern': '\v\k(\k|\.)*$',
      \ '_complete_loading_text': '...',
      \ }
let g:Cmd2_cmd_mappings = {
      \ "CF": {'command': function('Cmd2#ext#complete#Main'), 'type': 'function'},
      \ "CB": {'command': function('Cmd2#ext#complete#Main'), 'type': 'function'},
      \ }

cmap <C-S> <Plug>Cmd2 " Change this to your preferred mapping
cmap <expr> <Tab> Cmd2#ext#complete#InContext() ? "\<Plug>Cmd2CF" : "\<Tab>"
cmap <expr> <S-Tab> Cmd2#ext#complete#InContext() ? "\<Plug>Cmd2CB" : "\<S-Tab>"

set wildcharm=<Tab>

" python indentation
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab 

" always start on 1st line in git commit messages
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" prevent parantheses matching from degrading perforamnce
let g:matchparen_insert_timeout=5 

" fix screen after resizing vim
autocmd VimResized * redraw! 

" redraw only when necessary
" set lazyredraw

map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" ignore is controlled by ~/.agignore
if executable('ag')
  let g:ag_highlight=1
  map <Leader>f :Ag! 
else
  map <Leader>f :Ack 
end

nmap <Leader>r :NERDTreeFind<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>

let g:NERDTreeWinSize=20
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden=1

" git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "S",
    \ "Untracked" : "+",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "U",
    \ "Deleted"   : "-",
    \ "Dirty"     : "D",
    \ "Clean"     : "C",
    \ "Unknown"   : "?"
    \ }


" jump to last cursor position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" toggle between editing previous/current file
nnoremap <Leader>t <C-^>| 

" toggle between previous file instead of C-6
nnoremap <Leader>b <C-^> 

" relative or absolute number lines
function! NumberToggle()
    if(&nu == 1)
        set nu!
        set rnu
    else
        set nornu
        set nu
    endif
endfunction
nnoremap <Leader>g :call NumberToggle()<CR>

" rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader><leader>r :call RenameFile()<cr>

" :Reveal finder (For shell vim; o/w use Nerdtree reveal)
function! s:RevealInFinder()
  if filereadable(expand("%"))
    let l:command = "open -R %"
  elseif getftype(expand("%:p:h")) == "dir"
    let l:command = "open %:p:h"
  else
    let l:command = "open ."
  endif
  execute ":silent! !" . l:command
  redraw!
endfunction
command! Reveal call <SID>RevealInFinder() 

function! RemoveComments()
  exec ":g/^\\(#\\|$\\)/d"
endfunction
command! RemoveClutter :call RemoveComments()<cr>

function! AnsibleDecrypt()
  exec ":!/usr/bin/env - /usr/local/bin/ansible-vault --vault-id=~/.ansible/vaultpass decrypt %"
endfunction
command! AnsibleDecrypt :call AnsibleDecrypt()

function! AnsibleEncrypt()
  exec ":!/usr/bin/env - /usr/local/bin/ansible-vault --vault-id=~/.ansible/vaultpass encrypt %"
endfunction
command! AnsibleEncrypt :call AnsibleEncrypt()

command! BeautifyJS :call JSBeautify()<cr>
command! BeautifyHTML :call HtmlBeautify()<cr>

set ignorecase smartcase
set noerrorbells visualbell t_vb=
set number
set hidden
set backspace=indent,eol,start

" save buffer on exit
set autowriteall 

" store tmp files in single folder and rename to avoid collisions
set backupdir=~/.vim/.backup// 
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//

" highlight long ass lines
set colorcolumn=140 
" highlight ColorColumn ctermbg=red
" call matchadd('ColorColumn', '\%141v', 100)

" replace all by default so the g in s%/target/replacement/g is on by default
set gdefault 

" hightlight search results
set hlsearch 

" hightlight partial search results
set incsearch 

" show 1 lines before/after current scrolling position
set scrolloff=1 

" show multi key normal mode command on status line
set showcmd 

" undo past the beginning of editing a file
set undofile 

" go to end of previous line with left right
set whichwrap+=<,>,h,l,[,] 

" command autocomplete
set wildmenu 

" visual selection of command autocomplete
set wildmode=full 

" do not wrap lines
set nowrap

" highlight current line
" set cursorline
" show matching brackets
" set showmatch

" use mouse in terminal to scroll
"set mouse=nicr

"vim-utils/vim-ruby-fold plugin
let g:ruby_fold_lines_limit = 200

"padded numbers treated as decimal instead of octact for :h count
set nrformats=

let g:gutentags_ctags_tagfile=".git/tags"

"persistent undo
set undodir=~/.vim/undodir
set undofile

" jump to last cursor position
"autocmd BufReadPost *
"  \ if line("'\"") > 0 && line("'\"") <= line("$") |
"  \   exe "normal g`\"" |
"  \ endif

" source vimrc on save
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

autocmd BufEnter *.png,*.jpg,*gif exec "! ~/.iterm2/imgcat ".expand("%") | :bw

autocmd BufNewFile,BufRead ~/.ssh/config setlocal foldmethod=marker foldlevel=0

autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

"autocmd BufRead ~/Code/ansible/ansible/host_vars/* :call AnsibleDecrypt() "automatically decrypt all host_vars

set nofoldenable
set foldlevel=1
set foldmethod=indent

autocmd BufRead,BufNewFile config setlocal foldmethod=marker
autocmd BufRead,BufNewFile ansible_hosts setlocal foldmethod=marker

runtime! macros/matchit.vim

filetype plugin indent on
syntax on
syntax enable
