set nocompatible            		"We want latest vim settings/options. 
filetype indent on

so ~/.vim/plugins.vim

syntax enable

set background=dark	"Vim hybrid material
colorscheme hybrid_reverse
set t_CO=256
set backspace=indent,eol,start		"Make backspace behave like every other editor.
let mapleader = ','			"The default leader is \, but a comma is much better
set paste				"TurnOff autoindent when you paste code
set smartindent
set autoindent

let g:airline#extensions#tabline#enabled = 1	"Enable the airline extension
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_theme='hybrid'


set laststatus=2				"Status Line to be appear all the time
set number
function! AirlineInit()
	let g:airline_section_a = airline#section#create(['mode',' ','branch'])
	let g:airline_section_b = airline#section#create_left(['ffenc','hunks','%f'])
	let g:airline_section_c = airline#section#create(['filetype'])
	let g:airline_section_x = airline#section#create(['%P'])
	let g:airline_section_y = airline#section#create(['%B'])
	let g:airline_section_z = airline#section#create_right(['%l','%c'])
endfunction
autocmd VimEnter * call AirlineInit()

"-----------Searching----------"
set hlsearch
set incsearch

"-----------Split Management----------"

set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-k>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


"-----------Mappings-----------"

"Make it easy to edit the Vimrc file
nmap <leader>ev :tabedit ~/.vimrc<cr>

"Add simple highlight removal.
nmap <leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle
nmap <leader>kb :NERDTreeToggle<cr>




"-------------Plugins--------------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_prompt_mappings = {
	\ 'AcceptSelection("e")': ['<C-e>'],
	\ 'AcceptSelection("t")': ['<Cr>'],
	\ }


"---------- Javascript syntax checker using syntastic ---------"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']

"Mapping for :lnext to ,l	
nmap <leader>ln :lnext<cr>
nmap <leader>lp :lprevious<cr>


"-----------vim-indent-guides-mappings------"
" let g:indent_guides_default_mapping = 0
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_exclude_filetypes = ['help', 'startify', 'man', 'rogue']

let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey


"-----------vim-multiple-cursor-mappings------"
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'

"-----------Auto-Commands-------"


"Automatically source the Vimrc file on save"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
