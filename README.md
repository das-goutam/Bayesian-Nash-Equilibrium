# Bayesian-Nash-Equilibrium \\
This function computes Bayesian Nash Equilibrium. \\

The function takes two inputs: V and param; \\
V is the Value Matrix for 2 by 2 Bayesian Game. \\
Param is the probability of first game over the probability distribution of the two types of games
For example, 
Game 1:
      %================%
      %   Jaa1 | Jab1  %
      %   Jba1 | Jbb1  %
      %================%

Game 2:
      %================%
      %   Jaa2 | Jab2  %
      %   Jba2 | Jbb2  %
      %================%
J is the payoff over Straetgy Set (S_1 X S_2) 
where S_1 = {a,b} player 1's strategy and
Case-1: S_2 = {a_1,b_1} for Game 1 and 
Case-2: S_2 = {a_2,b_2} for Game 2 for Player 2.
Player 1 is uncertain over the type of player 2's cases.

Combined Value Matrix is given by V;

V = 

      %======(p)=======||=====(1-p)=====%
      %===(y)====(1-y)=====(z)===(1-z)==%
(x)   %   Jaa1 | Jab1  ||  Jaa2 | Jab2  %
(1-x) %   Jba1 | Jbb1  ||  Jba2 | Jbb2  %
      %=================================%

Here, 
x and (1-x) is the player 1's mixed strategy;
y and (1-y) is the player 2's mixed strategy for Case-1;
z and (1-z) is the player 2's mixed strategy for Case-2;

p and (1-p) is a prior knowledge of the game which gives the probability distribution of 2 cases.

%=================================================================================================
