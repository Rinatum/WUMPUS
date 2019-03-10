# Wumpus
1) Install this code.
2) Use `all_ways(Paths)` rule to get solutions.

## Notes:
> - I use `maybe()` rule to set probability to hit/miss wumpus.
> - My agent tries to kill the Wumpus only when he feels stench.
> - So, algorithm can give you different solutions because of randomness.

## Consider solvable environment example:
> - Code snippet of map declaration:
```
wumpus(1, 3).
gold(4, 3).
exit(1, 1).
pit(2, 5).
pit(3, 5).
pit(3, 1).
pit(5, 2).
```

| BREEZE   😰  	|    PIT 💀   	|  PIT    💀   	| BREEZE   😰 	|            	|
|-------------	|:----------:	|------------:	|------------	|------------	|
|   🤮 STENCH  	|  BREEZE 😰  	|  BREEZE 😰   	|            	|            	|
|   👻 Wumpus  	|  🤮 STENCH  	|             	|   👑  GOLD  	| BREEZE   😰 	|
|   🤮  STENCH 	|            	| BREEZE  😰.  	| BREEZE   😰 	|   PIT   💀  	|
|  🕺 start    	| BREEZE   😰 	|   PIT   💀   	| BREEZE   😰 	| BREEZE   😰 	|

> - In this case we have maximum three solutions:
```
?- all_ways(Paths).
Paths = [[1, 1], [1, 2], "💀HEADSHOT💀", [1, 3], [2, 3], [3, 3], [4, 3], ["👑GOOOLD👑"]] ;
Paths = [[1, 1], [1, 2], "💀HEADSHOT💀", [2, 2], [2, 3], [3, 3], [4, 3], ["👑GOOOLD👑"]] ;
Paths = [[1, 1], [1, 2], "💩MISS💩", [2, 2], [2, 3], [3, 3], [4, 3], ["👑GOOOLD👑"]] ;
```
> - We try to kill the Wumpus in the [1, 2] cell.
>   - If it is success => we have 2 paths to get the GOLD.(We can move through Wumpus cell).
>   - Else we have only 1 way to get the GOLD.

## Consider unsolvable environment example:

> - Code snippet of map declaration:
```
wumpus(1, 3).
gold(4, 3).
exit(1, 1).
pit(2, 5).
pit(3, 5).
pit(3, 1).
pit(5, 2).
pit(2, 1).
pit(1, 2).
```

| BREEZE   😰 	|   PIT 💀  	|  PIT    💀   	| BREEZE   😰 	|            	|
|------------	|:--------:	|------------:	|------------	|------------	|
|   🤮 STENCH 	| BREEZE 😰 	|  BREEZE 😰   	|            	|            	|
|   👻 Wumpus 	| 🤮 STENCH 	|             	|   👑  GOLD  	| BREEZE   😰 	|
|  PIT   💀   	| BREEZE 😰 	| BREEZE  😰   	| BREEZE   😰 	|   PIT   💀  	|
|  🕺 start   	|  PIT  💀  	|   PIT   💀   	| BREEZE   😰 	| BREEZE   😰 	|

> - In this case we have no possibility to act.
> - Hint: PIT(1;2), PIT(2,1).

``` 
?- all_ways(Paths).
false.
```
> - Generally, we have no solutions, if and only if path to GOLD closed by BREEZES or PIT and alive WUMPUS.
> - Of course, we can try to kill Wumpus but it's so hard and sometimes is not solution.
> - The key moment , that my agent does not risk when he feels the breeze.