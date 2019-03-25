%Metodos Numericos 543 11 de marzo de 2019
%Practica 6 - Ejercicio 2 
%Navarro Rodriguez Juan Francisco
%Secante bot 1255
%Este programa aproxima por el metodo de la secante
%a la raiz de f(x) = sin(sqrt(x))-x
clc;clear;
%Constantes
maxi = 5; %numero maximo de iteraciones
cifras = inf; %cantidad de cifras minimas de la aproximacion

%f de x
f = @(x) sin(sqrt(x))-x ; %funcion anonima

xaprox = 0; % x r
eaprox = inf;
tol = power(10,-8); % porciento de tolerancia
tol = 0;

fprintf(['Secantebot 1255\n\tEste programa aproxima de forma numerica', ...
'\n\tpor el metodo de Secante, los ceros de una funcion,', ...
'\n\tcuya f(x) =  sin(sqrt(x))-x', ...
'\n\tse espera un máximo de %d iteraciones y se tiene una tolerancia de %e %%\n', ...
], maxi, tol);


%grafica
xinf = 0; % x l inicial
xsup = 1    ; % x u inicial
res = 100; %resolucion
stepsize = (xsup-xinf)/res;
xvector = xinf:stepsize:xsup;
yvector = arrayfun(f,xvector);
plot(xvector,yvector,'r','LineWidth',3);
xlabel('Valor de x','FontSize',20);
ylabel('Valor de la funcion','FontSize',20);
title('Grafica de la funcion','FontSize',20);
grid on;

%con base en la grafica, te das cuenta
%que la segunda raiz esta cerca a 0 y 1
xold = 0.2;
xaprox = 0.5;


f_xold = f(xold);
f_x = f(xaprox);

fprintf('_________________________________________________________________________');  
fprintf(['\n   i','\t| Xi\t','\t| f(xi)\t'  ,'\t| Ea']);  
eaprox = inf;

fprintf(['\n   %d','\t| %f','\t| %f','\t| %f'],-1,xold,f_xold)
fprintf(['\n   %d','\t| %f','\t| %f','\t| %f'],0,xaprox,f_x)

xnew = 0.5;
xaprox = 0.2;

for i = 1:(maxi)
  xold = xaprox;
  xaprox = xnew;
  f_xold = f(xold);
  f_xaprox = f(xaprox);
   
  xnew = xaprox - f_xaprox*( xold-xaprox)/(f_xold - f_xaprox);
  f_xnew = f(xnew);
  
  
  fprintf(['\n   %d','\t| %f','\t| %f'],i,xnew,f_xnew)
  if (xnew ~= 0)
    eaprox = abs((1-xaprox/xnew)*100);
    if (eaprox < 1)
      fprintf('\t| %e %%',eaprox)
    else
      fprintf('\t| %f %%',eaprox)
    end
  else
    fprintf('\t|\t')
  end
  
  if (eaprox < tol)
    break;
  end
end
fprintf('\n\nEl valor al que se llego fue de:\n\tx = %f\n\tf(x) = %f\n',xnew,f(xnew))

fprintf('_________________________________________________________________________\n');  