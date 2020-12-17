non_repeating(Input, Output) :-
    non_repeating(Input, _, Output).

non_repeating([],[], []).

non_repeating([Head|Tail], Duplicates1, X) :-
    non_repeating(Tail,Duplicates2, X1),
    (   member(Head, Duplicates2)
    ->  X = X1, Duplicates1 = Duplicates2
    ;   (member(Head, X1)
    ->  select(Head, X1, X), Duplicates1 = [Head|Duplicates2]
    ;   X = [Head|X1], Duplicates1 = Duplicates2)).
