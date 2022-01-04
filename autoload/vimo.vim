
let s:vimo_hour_offset = get(g:, "vimo_hour_offset", 5)
let s:vimo_target_path = get(g:, "vimo_target_path", "~/.memo/")

function! vimo#Exec(hour_offset) abort
  let fileName = vimo#GetFileName(s:vimo_hour_offset + a:hour_offset)
  echo fileName
  execute "sp" s:vimo_target_path . fileName . ".md"
endfunction

function! vimo#GetFileName(hour) abort
  let now = localtime()
  let language =  v:lc_time
  try
    execute ":silent! language time " . "C"
    let fileName = strftime("%Y%m%d-%a", now - (a:hour * 60 * 60))
  finally
    execute ":silent! language time " . language
  endtry
  return fileName
endfunction

function! vimo#initialize() abort
  call vimo#createDirectory(s:vimo_target_path)
endfunction

function! vimo#createDirectory(path) abort
  let fullpath = fnamemodify(a:path, ':p')

  if !isdirectory(fullpath)
    call mkdir(fullpath, 'p')
  endif
endfunction
