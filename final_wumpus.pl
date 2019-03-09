% ######################################################### MAP #########################################################

wumpus(1, 3).
gold(4, 3).
exit(1, 1).
pit(2, 5).
pit(3, 5).
pit(3, 1).
pit(5, 2).

% ######################################################### TARGET RULE #########################################################


all_ways(P) :-
    next(1, 1, [], P, 1, 0).

% ######################################################### WHEN WE HAVE BULLET and PIF-PAF - HIT #########################################################

next(X, Y, P, Pnew, Bullet, Scream) :-
    gold(X, Y),
    append(P, [[X,Y], ["👑GOOOLD👑"]], Pnew).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Bullet == 1,
    fuuu(X, Y),
    pif_paf(),
    append(P, [[X,Y], "💀HEADSHOT💀"], Pnewnew),
    Y < 5,
    Ynew is Y + 1, 
    not(breeze(X, Ynew)),
    not(pit(X, Ynew)),
    not(member([X, Ynew], P)),
    next(X, Ynew, Pnewnew, Pnew, 0, 1).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Bullet == 1,
    fuuu(X, Y),
    pif_paf(),
    append(P, [[X,Y], "💀HEADSHOT💀"], Pnewnew),
    X < 5,
    Xnew is X + 1,
    not(breeze(Xnew, Y)),
    not(pit(Xnew, Y)),
    not(member([Xnew, Y], P)),
    next(Xnew, Y, Pnewnew, Pnew, 0, 1).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Bullet == 1,
    fuuu(X, Y),
    pif_paf(),
    append(P, [[X,Y], "💀HEADSHOT💀"], Pnewnew),
    Y > 1,
    Ynew is Y - 1,
    not(breeze(X, Ynew)),
    not(pit(X, Ynew)),
    not(member([X, Ynew], P)),
    next(X, Ynew, Pnewnew, Pnew, 0, 1).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Bullet == 1,
    fuuu(X, Y),
    pif_paf(),
    append(P, [[X,Y], "💀HEADSHOT💀"], Pnewnew),
    X > 1,
    Xnew is X - 1,
    not(breeze(Xnew, Y)),
    not(pit(Xnew, Y)),
    not(member([Xnew, Y], P)),
    next(Xnew, Y, Pnewnew, Pnew, 0, 1).


% ######################################################### WHEN WE HAVE BULLET and PIF-PAF - MISS #########################################################

next(X, Y, P, Pnew, Bullet, Scream) :-
    Bullet == 1,
    fuuu(X, Y),
    not(pif_paf()),
    append(P, [[X,Y], "💩MISS💩"], Pnewnew),
    Y < 5,
    Ynew is Y + 1, 
    not(breeze(X, Ynew)),
    not(pit(X, Ynew)),
    not(wumpus(X, Ynew)),
    not(member([X, Ynew], P)),
    next(X, Ynew, Pnewnew, Pnew, 0, 0).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Bullet == 1,
    fuuu(X, Y),
    not(pif_paf()),
    append(P, [[X,Y], "💩MISS💩"], Pnewnew),
    X < 5,
    Xnew is X + 1,
    not(breeze(Xnew, Y)),
    not(pit(Xnew, Y)),
    not(wumpus(Xnew, Y)),
    not(member([Xnew, Y], P)),
    next(Xnew, Y, Pnewnew, Pnew, 0, 0).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Bullet == 1,
    fuuu(X, Y),
    not(pif_paf()),
    append(P, [[X,Y], "💩MISS💩"], Pnewnew),
    Y > 1,
    Ynew is Y - 1,
    not(breeze(X, Ynew)),
    not(pit(X, Ynew)),
    not(wumpus(X, Ynew)),
    not(member([X, Ynew], P)),
    next(X, Ynew, Pnewnew, Pnew, 0, 0).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Bullet == 1,
    fuuu(X, Y),
    not(pif_paf()),
    append(P, [[X,Y], "💩MISS💩"], Pnewnew),
    X > 1,
    Xnew is X - 1,
    not(breeze(Xnew, Y)),
    not(pit(Xnew, Y)),
    not(wumpus(Xnew, Y)),
    not(member([Xnew, Y], P)),
    next(Xnew, Y, Pnewnew, Pnew, 0, 0).

% ######################################################### WHEN WE HAVE BULLET BUT NO STENCH #########################################################

next(X, Y, P, Pnew, Bullet, Scream) :-
    Bullet == 1,
    not(fuuu(X, Y)),
    append(P, [[X,Y]], Pnewnew),
    Y < 5,
    Ynew is Y + 1, 
    not(breeze(X, Ynew)), 
    not(pit(X, Ynew)),
    not(wumpus(X, Ynew)),
    not(member([X, Ynew], P)),
    next(X, Ynew, Pnewnew, Pnew, Bullet, Scream).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Bullet == 1,
    not(fuuu(X, Y)),
    append(P, [[X,Y]], Pnewnew),
    X < 5,
    Xnew is X + 1,
    not(breeze(Xnew, Y)),
    not(pit(Xnew, Y)),
    not(wumpus(Xnew, Y)),
    not(member([Xnew, Y], P)),
    next(Xnew, Y, Pnewnew, Pnew, Bullet, Scream).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Bullet == 1,
    not(fuuu(X, Y)),
    append(P, [[X,Y]], Pnewnew),
    Y > 1,
    Ynew is Y - 1,
    not(breeze(X, Ynew)),
    not(pit(X, Ynew)),
    not(wumpus(X, Ynew)),
    not(member([X, Ynew], P)),
    next(X, Ynew, Pnewnew, Pnew, Bullet, Scream).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Bullet == 1,
    not(fuuu(X, Y)),
    append(P, [[X,Y]], Pnewnew),
    X > 1,
    Xnew is X - 1,
    not(breeze(Xnew, Y)),
    not(pit(Xnew, Y)),
    not(wumpus(Xnew, Y)),
    not(member([Xnew, Y], P)),
    next(Xnew, Y, Pnewnew, Pnew, Bullet, Scream).

% ######################################################### WHEN WE HAVE NO BULLET AND WUMPUS IS ALIVE #########################################################


next(X, Y, P, Pnew , Bullet, Scream) :-
    Scream == 0,
    Bullet == 0,
    append(P, [[X,Y]], Pnewnew),
    Y < 5,
    Ynew is Y + 1, 
    not(breeze(X, Ynew)), 
    not(pit(X, Ynew)),
    not(wumpus(X, Ynew)),
    not(member([X, Ynew], P)),
    next(X, Ynew, Pnewnew, Pnew, Bullet, Scream).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Scream == 0,
    Bullet == 0,
    append(P, [[X,Y]], Pnewnew),
    X < 5,
    Xnew is X + 1,
    not(breeze(Xnew, Y)),
    not(pit(Xnew, Y)),
    not(wumpus(Xnew, Y)),
    not(member([Xnew, Y], P)),
    next(Xnew, Y, Pnewnew, Pnew, Bullet, Scream).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Scream == 0,
    Bullet == 0,
    append(P, [[X,Y]], Pnewnew),
    Y > 1,
    Ynew is Y - 1,
    not(breeze(X, Ynew)),
    not(pit(X, Ynew)),
    not(wumpus(X, Ynew)),
    not(member([X, Ynew], P)),
    next(X, Ynew, Pnewnew, Pnew, Bullet, Scream).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Scream == 0,
    Bullet == 0,
    append(P, [[X,Y]], Pnewnew),
    X > 1,
    Xnew is X - 1,
    not(breeze(Xnew, Y)),
    not(pit(Xnew, Y)),
    not(wumpus(Xnew, Y)),
    not(member([Xnew, Y], P)),
    next(Xnew, Y, Pnewnew, Pnew, Bullet, Scream).

% ######################################################### WHEN WE HAVE NO BULLET AND WUMPUS IS DEAD #########################################################

next(X, Y, P, Pnew , Bullet, Scream) :-
    Scream == 1,
    Bullet == 0,
    append(P, [[X,Y]], Pnewnew),
    Y < 5,
    Ynew is Y + 1, 
    not(breeze(X, Ynew)), 
    not(pit(X, Ynew)),
    not(member([X, Ynew], P)),
    next(X, Ynew, Pnewnew, Pnew, Bullet, Scream).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Scream == 1,
    Bullet == 0,
    append(P, [[X,Y]], Pnewnew),
    X < 5,
    Xnew is X + 1,
    not(breeze(Xnew, Y)),
    not(pit(Xnew, Y)),
    not(member([Xnew, Y], P)),
    next(Xnew, Y, Pnewnew, Pnew, Bullet, Scream).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Scream == 1,
    Bullet == 0,
    append(P, [[X,Y]], Pnewnew),
    Y > 1,
    Ynew is Y - 1,
    not(breeze(X, Ynew)),
    not(pit(X, Ynew)),
    not(member([X, Ynew], P)),
    next(X, Ynew, Pnewnew, Pnew, Bullet, Scream).

next(X, Y, P, Pnew, Bullet, Scream) :-
    Scream == 1,
    Bullet == 0,
    append(P, [[X,Y]], Pnewnew),
    X > 1,
    Xnew is X - 1,
    not(breeze(Xnew, Y)),
    not(pit(Xnew, Y)),
    not(member([Xnew, Y], P)),
    next(Xnew, Y, Pnewnew, Pnew, Bullet, Scream).

fuuu(X,Y):-
    ((   X1 is X + 1,wumpus(X1,Y));
    (X1 is X - 1,wumpus(X1,Y));
    (Y1 is Y - 1,wumpus(X,Y1));
    (Y1 is Y + 1,wumpus(X,Y1))).

breeze(X,Y):-
    ((X1 is X + 1,pit(X1,Y));
    (X1 is X - 1,pit(X1,Y));
    (Y1 is Y - 1,pit(X,Y1));
    (Y1 is Y + 1,pit(X,Y1))).

pif_paf() :- %random hit/miss chance
    maybe().