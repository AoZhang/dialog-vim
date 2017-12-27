" Vim syntax file
" Language:	State Config
" Maintainer:	Zhang Ao
" Last Change:	2017-12-27
" Credits:	Zhang Ao
" 
" most of code is copied from syntax file of python, config and dosini
" of vim8.0.
" 

" quit when a syntax file was already loaded.
if exists("b:current_syntax")
  finish
endif

syn keyword stateTodo		FIXME NOTE NOTES TODO XXX contained
syn match   stateComment	"//.*$" contains=stateTodo,@Spell
syn match   stateDelimiter  "[{}()\[\];,]"
"syn match   stateLabel      "[a-zA-Z0-9_]\{-}="
syn match   stateLabel      "^[a-zA-Z0-9_]*"
syn match   stateLabelMid   "\h\w*" display contained
syn match   stateOperator	"[=|&\*\+\<\>]"
syn match   stateOperatorLogical	"#||@" nextgroup=stateLabelMid skipwhite
syn match   stateOperatorLogical	"#&&@" nextgroup=stateLabelMid skipwhite
syn match   stateOperatorComparison	"#[a-z><=!]*@"

syn match   stateNumber	    "\<0[oO]\=\o\+[Ll]\=\>"
syn match   stateNumber	    "\<0[xX]\x\+[Ll]\=\>"
syn match   stateNumber	    "\<0[bB][01]\+[Ll]\=\>"
syn match   stateNumber	    "\<\%([1-9]\d*\|0\)[Ll]\=\>"
syn match   stateNumber	    "\<\d\+[jJ]\>"
syn match   stateNumber	    "\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
syn match   stateNumber     "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
syn match   stateNumber     "\%(^\|\W\)\zs\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"

syn region  stateString matchgroup=stateQuotes
      \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
syn region  stateString matchgroup=stateTripleQuotes
      \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend

syn region  stateString     start=+\z(["'`]\)+ skip=+\\\z1+ end=+\z1+ contains=@Spell
syn region  stateHeader     start="^\s*\[" end="\]"

hi def link stateDelimiter  Delimiter
hi def link stateNumber     Number
hi def link stateString     String
hi def link stateLabel      Type
hi def link stateLabelMid   Type
hi def link stateString		String
hi def link stateTodo		Todo
hi def link stateComment	Comment
hi def link stateNumber		Number
hi def link stateHeader     Special
hi def link stateOperator	Operator
hi def link stateOperatorLogical	Operator
hi def link stateOperatorComparison	Operator

let b:current_syntax = "state"
