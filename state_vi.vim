if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/Users/whensunset/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/Users/whensunset/.vim/after,/Users/whensunset/.dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/whensunset/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/whensunset/.dein'
let g:dein#_runtime_path = '/Users/whensunset/.dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/whensunset/.dein/.cache/.vimrc'
let &runtimepath = '/Users/whensunset/.vim,/usr/share/vim/vimfiles,/usr/local/opt/fzf,/Users/whensunset/.dein,/Users/whensunset/.dein/.cache/.vimrc/.dein,/usr/share/vim/vim80,/Users/whensunset/.dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/Users/whensunset/.vim/after,/Users/whensunset/.dein/repos/github.com/Shougo/dein.vim'
