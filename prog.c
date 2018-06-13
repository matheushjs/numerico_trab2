#include <math.h>
#include <stdio.h>

double f(double t){
	return (1 / sqrt(2*M_PI)) * exp(-t*t / 2);
}

/* Calcula a integral da função 'f' já definida.
 * O intervalo [0,x] é dividido em 'divisions' partes iguais, gerando a
 *   sequência de pontos x0, x1, x2, x3..., x_divisions.
 * A partir desses pontos, aplica-se o método Simpson 1/3.
 */
double integral(double x, int divisions){
	if(divisions % 2 != 0){
		printf("Número de divisões deve ser par.\n");
		return 0.0;
	}

	// Divisões igualmente separadas em 'h'
	double h = x / (double) divisions;

	double result = 0;

	// Soma extremidades
	result += f(0) + f(x);

	// Soma termos multiplicados por 4
	int i;
	for(i = 1; i < divisions; i += 2){
		result += 4 * f(h * i);
	}

	// Soma termos multiplicados por 2
	for(i = 2; i < divisions; i += 2){
		result += 2 * f(h * i);
	}

	// Multiplica pelo fator final h/3
	result *= h/3;

	return result;
}

/* Essa é a função F definida nas especificações,
 *   a qual equivale ao valor da integral menos 0.45.
 */
double F(double x, int divisions){
	return integral(x, divisions) - 0.45;
}


/* Função para aplicação do método de Newton. Phi(x) = x - F(x)/f(x),
 *   com f(x) = F'(x).
 */
double phi(double x){
	return x - ( F(x, 100) / f(x) );
}

// Epsilon definido nas expecificações
#define EPS 1E-10

/* Calcula a solução da equação dada, F(x) = 0.45, pelo método de Newton.
 */
double newton(double x0){
	double old = 1000000;
	double new = x0;
	while( fabs(new - old) >= EPS ){
		old = new;
		new = phi(old);
	}

	return new;
}

int main(int argc, char *argv[]){
	printf("F(1)*F(2) = %lf\nOnde F(x) = I(f)(1) - 0.45\n",
			F(1, 100) * F(2, 100));

	printf("Newton: %lf\n", newton(0.5));
	printf("Confirm: %lf\n", F(1.644854, 100));
	return 0;
}
