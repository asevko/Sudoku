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