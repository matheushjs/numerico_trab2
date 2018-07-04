% Função que utiliza o Método de Newton para obter uma raiz.
function x = newton(x0, func, EPS = 1.0e-10) 
	% Indica que irá utilizar func como uma função f.
	f = inline(func);

	% Define a função F especificada.
	F = inline("simpson(0, x, 10000, '(1 / sqrt(2*pi)) * exp(-(t^2) / 2)') - 0.45");
		
	% Calcula a primeira aproximação da raiz.
	x = x0-(F(x0)/f(x0))

	% Realiza iterações até ser menor que o EPS.
	while(abs(x - x0) >= EPS)
		x0 = x;
		x = x0-(F(x0)/f(x0))			
	endwhile;

	% Retorna o valor da raiz calculada.
	return;
endfunction