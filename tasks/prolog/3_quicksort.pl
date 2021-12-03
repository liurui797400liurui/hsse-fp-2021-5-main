% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

divide(P,[],[],[]).

%X - значения, меньшие выбранного P (опорного элемента)
%Y - значения, большие выбранного P (опорного элемента)

divide(P,[H|T],[H|X],Y):- H<P, divide(P,T,X,Y).
divide(P,[H|T],X,[H|Y]):- H>=P, divide(P,T,X,Y). 

qsort([],[]).

%В качестве опорного элемента P используется голова списка 

qsort([P|T], K):- divide(P,T,X,Y), qsort(X,X_SORTED), qsort(Y,Y_SORTED), append(X_SORTED,[P|Y_SORTED], K). 

%?- qsort([4,1,9,5,8],K).
%K = [1, 4, 5, 8, 9] .

%?- qsort([1,3,2,0,2,0,1,3,2,1],K).
%K = [0, 0, 1, 1, 1, 2, 2, 2, 3|...] .

%?- qsort([1,3,2,0,2,0,3,1],K).
%K = [0, 0, 1, 1, 2, 2, 3, 3] .

%?- qsort([1,2,3,4],K).
%K = [1, 2, 3, 4] .

%?- qsort([1,8,-9,0,-12,1,-1],K).
%K = [-12, -9, -1, 0, 1, 1, 8] .