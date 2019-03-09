# Wumpus
1) Install this code.
2) Use `all_ways(Paths)` rule to get solutions.

## Notes:
> - I use `maybe()` rule to set probability to hit/miss wumpus.
> - So, algorithm can give you different solutions because of randomness.

## Consider solvable environment example:

| BREEZE   😰  	|    PIT 💀   	|  PIT    💀   	| BREEZE   😰 	|            	|
|-------------	|:----------:	|------------:	|------------	|------------	|
|   🤮 STENCH  	|  BREEZE 😰  	|  BREEZE 😰   	|            	|            	|
|   👻 Wumpus  	|  🤮 STENCH  	|             	|   👑  GOLD  	| BREEZE   😰 	|
|   🤮  STENCH 	|            	| BREEZE  😰.  	| BREEZE   😰 	|   PIT   💀  	|
|  🕺 start    	| BREEZE   😰 	|   PIT   💀   	| BREEZE   😰 	| BREEZE   😰 	|

> - In this case we have maximum three solutions:
```?- all_ways(Paths).
Paths = [[1, 1], [1, 2], "💀HEADSHOT💀", [1, 3], [2, 3], [3, 3], [4, 3], ["👑GOOOLD👑"]] ;
Paths = [[1, 1], [1, 2], "💀HEADSHOT💀", [2, 2], [2, 3], [3, 3], [4, 3], ["👑GOOOLD👑"]] ;
Paths = [[1, 1], [1, 2], "💩MISS💩", [2, 2], [2, 3], [3, 3], [4, 3], ["👑GOOOLD👑"]] ;```
