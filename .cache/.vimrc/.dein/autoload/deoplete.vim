"=============================================================================
" FILE: deoplete.vim
" AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
" License: MIT license
"=============================================================================

function! deoplete#initialize() abort
  return deoplete#init#_initialize()
endfunction
function! deoplete#is_enabled() abort
  return deoplete#init#_is_handler_enabled()
endfunction
function! deoplete#enable() abort
  if has('vim_starting')
    augroup deoplete
      autocmd!
      autocmd VimEnter * call deoplete#enable()
    augroup END
    return 1
  endif

  if deoplete#initialize() && deoplete#is_enabled()
    return 1
  endif
  return deoplete#init#_enable_handler()
endfunction
function! deoplete#disable() abort
  call deoplete#initialize()
  return deoplete#init#_disable_handler()
endfunction
function! deoplete#toggle() abort
  call deoplete#initialize()
  return deoplete#is_enabled() ?
        \ deoplete#init#_disable_handler() :
        \ deoplete#init#_enable_handler()
endfunction

function! deoplete#enable_logging(level, logfile) abort
  let g:deoplete#_logging = {'level': a:level, 'logfile': a:logfile}
  call deoplete#util#rpcnotify('deoplete_enable_logging', {})
endfunction

function! deoplete#send_event(event, ...) abort
  let sources = get(a:000, 0, [])
  call deoplete#util#rpcnotify('deoplete_on_event',
        \ deoplete#init#_context(a:event, sources))
endfunction

function! deoplete#manual_complete(...) abort
  if !deoplete#is_enabled()
    return ''
  endif

  " Start complete.
  return "\<C-r>=deoplete#mapping#_rpcrequest_wrapper("
        \ . string(get(a:000, 0, [])) . ")\<CR>"
endfunction
function! deoplete#close_popup() abort
  call deoplete#handler#_skip_next_completion()
  return pumvisible() ? "\<C-y>" : ''
endfunction
function! deoplete#smart_close_popup() abort
  call deoplete#handler#_skip_next_completion()
  return pumvisible() ? "\<C-e>" : ''
endfunction
function! deoplete#cancel_popup() abort
  call deoplete#handler#_skip_next_completion()
  return pumvisible() ? "\<C-e>" : ''
endfunction
function! deoplete#refresh() abort
  if exists('g:deoplete#_context')
    if get(g:deoplete#_context, 'event', '') ==# 'Manual'
      let g:deoplete#_context.event = 'Refresh'
    endif
  endif
  return pumvisible() ? "\<C-e>" : ''
endfunction
function! deoplete#undo_completion() abort
  return deoplete#mapping#_undo_completion()
endfunction
function! deoplete#complete_common_string() abort
  return deoplete#mapping#_complete_common_string()
endfunction
