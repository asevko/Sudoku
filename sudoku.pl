% allunique(List)
% success if all the numbers of list are in between 1 and 9
% and each number exists only once
allunique(List) :- 
	list_length(List,9),
	range(List, 9),
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


% print_sudoku(SUDOKU, ROW)
% nicely prints 9x9 sudoku
% SUDOKU is a flatten list, ROW is an Int
print_sudoku([]).
print_sudoku(SUDOKU) :- print_sudoku(SUDOKU, 0).
print_sudoku(SUDOKU, 0) :- 
    writeln('┌───────┬───────┬───────┐'), 
    print_sudoku(SUDOKU, 1).
print_sudoku(SUDOKU, 4) :- 
    writeln('│───────┼───────┼───────│'), 
    print_sudoku(SUDOKU, 5).
print_sudoku(SUDOKU, 8) :- 
    writeln('│───────┼───────┼───────│'), 
    print_sudoku(SUDOKU, 9).
print_sudoku([], 12) :- 
    writeln('└───────┴───────┴───────┘').
print_sudoku([H1, H2, H3, H4, H5, H6, H7, H8, H9|TAIL], ROW) :-
 	member(ROW, [1,2,3,5,6,7,9,10,11]),	
	format('| ~d ~d ~d | ~d ~d ~d | ~d ~d ~d |~n', [H1, H2, H3, H4, H5, H6, H7, H8, H9]),
	succ(ROW, DELIMETER_ROW), % DELIMETER_ROW \= ROW + 1
	print_sudoku(TAIL, DELIMETER_ROW).
