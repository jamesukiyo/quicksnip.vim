if !exists("g:snippet_dir")
	let g:snippet_dir = expand('$HOME') . '/.vim/snippets'
endif

func! QuickSnipEditWithType(ft)
	if a:ft == ""
		echo "Error: No filetype specified"
		return
	endif

	let snippet_name = input("Enter snippet name: ")
	if snippet_name == ""
		echo "Operation cancelled"
		return
	endif

	let snippet_dir = substitute(expand(g:snippet_dir), '/$', '', '') . "/" . a:ft

	let snippet_dir = substitute(snippet_dir, '/\+/', '/', 'g')

	if !isdirectory(snippet_dir)
		call mkdir(snippet_dir, "p")
		echo "Created directory: " . snippet_dir
	endif

	let snippet_file = snippet_dir . "/" . snippet_name . ".snip"

	execute "edit " . snippet_file
	echo "Editing snippet: " . snippet_name . " for filetype: " . a:ft
endfunc

func! QuickSnipEditCurrent()
	let ft = &filetype
	if ft == ""
		echo "Error: No filetype detected for current buffer"
		return
	endif
	call QuickSnipEditWithType(ft)
endfunc

func! QuickSnipEditPick()
	let ft = input("Enter filetype: ")
	if ft == ""
		echo "Operation cancelled"
		return
	endif
	call QuickSnipEditWithType(ft)
endfunc

command! SnipCurrent call QuickSnipEditCurrent()
command! SnipPick call QuickSnipEditPick()
