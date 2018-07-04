% Função que implementa a Regra de Integração Numérica Simpson 1/3 Composta.
function integral = simpson(a = 0, b, n = 10000, func)
	% Calcula o tamanho do passo.
	h = (b - a)/n;

	% Inicializa variáveis do somatório.
	sumP = sumI = 0;	

	% Indica que irá utilizar func como uma função f.
	f = inline(func);	

	% Calcula cada passo de f: x0, x1, ..., xn.
	x = a:h:b;

    % Calcula cada f(x) e realiza o somatório par e ímpar.
    for i = 2:length(x)-1
		sumP+= f(x(i)) * (1-mod(i,2));  
		sumI+= f(x(i)) * mod(i,2); 
    end

	% Calcula o resultado final, segundo a regra de simpson 1/3 composta.	
	integral = (h/3) * (f(a) + 4*sumI + 2*sumP + f(b));

	return;
endfunction