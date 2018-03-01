:- use_module(library(clpfd)).

% valid sudoku format
sudoku([
	[_, _, _, _, _, _, _, _, _],
    [_, _, _, _, _, _, _, _, _],
    [_, _, _, _, _, _, _, _, _],
	[_, _, _, _, _, _, _, _, _],
    [_, _, _, _, _, _, _, _, _],
    [_, _, _, _, _, _, _, _, _],
    [_, _, _, _, _, _, _, _, _],
    [_, _, _, _, _, _, _, _, _],
    [_, _, _, _, _, _, _, _, _]
    ]).


prnt([]).
prnt([HEAD|TAIL]) :-
	format(' | ~a |~n',HEAD),
	prnt(TAIL).


test :-
	Sudoku = [
		[1, 2, 3, 4, 5, 6, 7, 8, 9],
		[1, 2, 3, 4, 5, 6, 7, 8, 9],
		[1, 2, 3, 4, 5, 6, 7, 8, 9],
		[1, 2, 3, 4, 5, 6, 7, 8, 9],
		[1, 2, 3, 4, 5, 6, 7, 8, 9],
		[1, 2, 3, 4, 5, 6, 7, 8, 9],
		[1, 2, 3, 4, 5, 6, 7, 8, 9],
		[1, 2, 3, 4, 5, 6, 7, 8, 9],
		[1, 2, 3, 4, 5, 6, 7, 8, 9]
		],
	process(Sudoku).

test1 :-
	Sudoku =[
	[5, 3, _, _, 7, _, _, _, _],
	[6, _, _, 1, 9, 5, _, _, _],
	[_, 9, 8, _, _, _, _, 6, _],
	[8, _, _, _, 6, _, _, _, 3],
	[4, _, _, 8, _, 3, _, _, 1],
	[7, _, _, _, 2, _, _, _, 6],
	[_, 6, _, _, _, _, 2, 8, _],
	[_, _, _, 4, 1, 9, _, _, 5],
	[_, _, _, _, 8, _, _, 7, 9]
	],
	solve(Sudoku).


% process(Input)
% validates if input is valid sudoku 
process(Input) :-
	(
		not(sudoku(Input)) ->
		writeln('Input is not valid. It sohuld be 9x9 sudoku.'), 
		fail;
		writeln('Begin state is:'),
		flatten(Input, Printable),
		print(Printable, problem),
		solve(Input)
	).

solve(SUDOKU) :-
	SUDOKU = [ROW1, ROW2, ROW3, ROW4, ROW5, ROW6, ROW7, ROW8, ROW9],

	% checking if elemnts of each row are unique
	allunique(ROW1), allunique(ROW2), allunique(ROW3),
	allunique(ROW4), allunique(ROW5), allunique(ROW6),
	allunique(ROW7), allunique(ROW8), allunique(ROW9),

	% creating  9 columns
	% column 1
	nth1(1, ROW1, C11), nth1(1, ROW2, C12), nth1(1, ROW3, C13),
	nth1(1, ROW4, C14), nth1(1, ROW5, C15), nth1(1, ROW6, C16),
	nth1(1, ROW7, C17), nth1(1, ROW8, C18), nth1(1, ROW9, C19),
	COL1 = [C11, C12, C13, C14, C15, C16, C17, C18, C19],

	% column 2
	nth1(2, ROW1, C21), nth1(2, ROW2, C22), nth1(2, ROW3, C23),
	nth1(2, ROW4, C24), nth1(2, ROW5, C25), nth1(2, ROW6, C26),
	nth1(2, ROW7, C27), nth1(2, ROW8, C28), nth1(2, ROW9, C29),
	COL2 = [C21, C22, C23, C24, C25, C26, C27, C28, C29],

	% column 3
	nth1(3, ROW1, C31), nth1(3, ROW2, C32), nth1(3, ROW3, C33),
	nth1(3, ROW4, C34), nth1(3, ROW5, C35), nth1(3, ROW6, C36),
	nth1(3, ROW7, C37), nth1(3, ROW8, C38), nth1(3, ROW9, C39),
	COL3 = [C31, C32, C33, C34, C35, C36, C37, C38, C39],

	% column 4
	nth1(4, ROW1, C41), nth1(4, ROW2, C42), nth1(4, ROW3, C43),
	nth1(4, ROW4, C44), nth1(4, ROW5, C45), nth1(4, ROW6, C46),
	nth1(4, ROW7, C47), nth1(4, ROW8, C48), nth1(4, ROW9, C49),
	COL4 = [C41, C42, C43, C44, C45, C46, C47, C48, C49],

	% column 5
	nth1(5, ROW1, C51), nth1(5, ROW2, C52), nth1(5, ROW3, C53),
	nth1(5, ROW4, C54), nth1(5, ROW5, C55), nth1(5, ROW6, C56),
	nth1(5, ROW7, C57), nth1(5, ROW8, C58), nth1(5, ROW9, C59),
	COL5 = [C51, C52, C53, C54, C55, C56, C57, C58, C59],

	% column 6
	nth1(6, ROW1, C61), nth1(6, ROW2, C62), nth1(6, ROW3, C63),
	nth1(6, ROW4, C64), nth1(6, ROW5, C65), nth1(6, ROW6, C66),
	nth1(6, ROW7, C67), nth1(6, ROW8, C68), nth1(6, ROW9, C69),
	COL6 = [C61, C62, C63, C64, C65, C66, C67, C68, C69],

	% column 7
	nth1(7, ROW1, C71), nth1(7, ROW2, C72), nth1(7, ROW3, C73),
	nth1(7, ROW4, C74), nth1(7, ROW5, C75), nth1(7, ROW6, C76),
	nth1(7, ROW7, C77), nth1(7, ROW8, C78), nth1(7, ROW9, C79),
	COL7 = [C71, C72, C73, C74, C75, C76, C77, C78, C79],

	% column 8
	nth1(8, ROW1, C81), nth1(8, ROW2, C82), nth1(8, ROW3, C83),
	nth1(8, ROW4, C84), nth1(8, ROW5, C85), nth1(8, ROW6, C86),
	nth1(8, ROW7, C87), nth1(8, ROW8, C88), nth1(8, ROW9, C89),
	COL8 = [C81, C82, C83, C84, C85, C86, C87, C88, C89],

	% column 9
	nth1(9, ROW1, C91), nth1(9, ROW2, C92), nth1(9, ROW3, C93),
	nth1(9, ROW4, C94), nth1(9, ROW5, C95), nth1(9, ROW6, C96),
	nth1(9, ROW7, C97), nth1(9, ROW8, C98), nth1(9, ROW9, C99),
	COL9 = [C91, C92, C93, C94, C95, C96, C97, C98, C99],

	% checking if elemnts of each col are unique
	allunique(COL1), allunique(COL2), allunique(COL3),
	allunique(COL4), allunique(COL5), allunique(COL6),
	allunique(COL7), allunique(COL8), allunique(COL9),

	% creating each block
	% blocks are numerated from legt to right
	BLOCK1 = [C11, C12, C13, C21, C22, C23, C31, C32, C33],
	BLOCK2 = [C14, C15, C16, C24, C25, C26, C34, C35, C36],
	BLOCK3 = [C17, C18, C19, C27, C28, C29, C37, C38, C39],
	BLOCK4 = [C41, C42, C43, C51, C52, C53, C61, C62, C63],
	BLOCK5 = [C44, C45, C46, C54, C55, C56, C64, C65, C66],
	BLOCK6 = [C47, C48, C49, C57, C58, C59, C67, C68, C69],
	BLOCK7 = [C71, C72, C73, C81, C82, C83, C91, C92, C93],
	BLOCK8 = [C74, C75, C76, C84, C85, C86, C94, C95, C96],
	BLOCK9 = [C77, C78, C79, C87, C88, C89, C97, C97, C99],

	% checking if elemnts of each block are unique
	allunique(BLOCK1), allunique(BLOCK2), allunique(BLOCK3),
	allunique(BLOCK4), allunique(BLOCK5), allunique(BLOCK6),
	allunique(BLOCK7), allunique(BLOCK8), allunique(BLOCK9),

	flatten(SUDOKU, FLATTEN_SUDOKU),
	label(FLATTEN_SUDOKU),

	writeln('Solved sudoku is:'),
	print(FLATTEN_SUDOKU, solution).
	

% allunique(List)
% success if all the numbers of list are in between 1 and 9
% and each number exists only once
allunique(List) :- 
	length(List,9),
	List ins 1..9,
	%range(List, 9),
	unique(List).


% list_length(List, N)
% success if the length of the List is N
% finds length the List
list_length([], 0).
list_length([_|TAIL], N) :- 
	list_length(TAIL, N1),
	N is N1 + 1.


% range(List, HIGH),
% success if all the members of List are not greater then HIGH
% by default the low limit of List members is 1.
range([], _).
range([HEAD|TAIL], HIGH) :-
	HIGH >= 1,
	HEAD =< HIGH,
	range(TAIL, HIGH).

	

% unique(List)
% success if all the members of List are uniquie
unique([]).
unique([_,[]]).
unique([HEAD|TAIL]):- 
	not(member(HEAD,TAIL)),
	unique(TAIL).


% print(SUDOKU, STATE)
% defines what is format of output printing: problem or solution
print(SUDOKU, STATE) :-
	(
		not(state(STATE)) -> 
		writeln('Unknow state of printing!  Failing now.'),
		fail
	;	
		equal_states(STATE, solution)  ->
		print_sudoku(SUDOKU, '| ~d ~d ~d | ~d ~d ~d | ~d ~d ~d |~n')
	;
		print_sudoku(SUDOKU, '| ~a ~a ~a | ~a ~a ~a | ~a ~a ~a |~n')
	).
state(problem).
state(solution).

equal_states(STATE, STATE).

% print_sudoku(SUDOKU, ROW, FORMAT)
% nicely prints 9x9 sudoku
% SUDOKU is a flatten list, ROW is an Int
print_sudoku([]).
print_sudoku(SUDOKU, FORMAT) :- 
	print_sudoku(SUDOKU, 0, FORMAT).
print_sudoku(SUDOKU, 0, FORMAT) :- 
    writeln('┌───────┬───────┬───────┐'), 
    print_sudoku(SUDOKU, 1, FORMAT).
print_sudoku(SUDOKU, 4, FORMAT) :- 
    writeln('│───────┼───────┼───────│'), 
    print_sudoku(SUDOKU, 5, FORMAT).
print_sudoku(SUDOKU, 8, FORMAT) :- 
    writeln('│───────┼───────┼───────│'), 
    print_sudoku(SUDOKU, 9, FORMAT).
print_sudoku([], 12, _) :- 
    writeln('└───────┴───────┴───────┘').
print_sudoku([H1, H2, H3, H4, H5, H6, H7, H8, H9|TAIL], ROW, FORMAT) :-
 	member(ROW, [1,2,3,5,6,7,9,10,11]),	
	format(FORMAT, [H1, H2, H3, H4, H5, H6, H7, H8, H9]),
	succ(ROW, NEXT_ROW), % NEXT_ROW \= ROW + 1
	print_sudoku(TAIL, NEXT_ROW, FORMAT).