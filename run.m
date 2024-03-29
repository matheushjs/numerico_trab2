#!/usr/bin/octave

format long

% Definindo os parâmetros iniciais do programa.
a = 0; % Limite inferior.
b1 = 1; % Limite superior 1.
b2 = 2; % Limite superior 2.
func = '(1 / sqrt(2*pi)) * exp(-(t^2) / 2)'; % Função f.
n = 10000; % Número de divisões.

% Calcula F(1).
F1 = simpson(a, b1, n, func) - 0.45

% Calcula F(2).
F2 = simpson(a, b2, n, func) - 0.45

% Faz F(1) * F(2).
disp("F(1) * F(2) =");
disp(F1*F2);

% Calcula a raiz pelo método de newton.
EPS = 1.0e-10;
x0 = 0.5;
disp('Iterações: ')
x = newton(x0, func, EPS);
Fx = simpson(a, x, n, func) - 0.45