clear import_Problema;

function [data] = import_Problema3(filename)
    opts = detectImportOptions(filename, "Delimiter", ",", "Decimal", ".");
    data = readtable(filename, opts, "VariableNames", ["tiempo","salida","entrada"]);
endfunction

datos = import_Problema3("C:\Users\david\Desktop\problemas control\Problema3.csv");

entrada = datos.vars(3).data;
salida = datos.vars(2).data;
tiempo = datos.vars(1).data;
K = 1.25;
zeta = 0.29;
wn = 0.0168;
s=%s
G = (K*(wn^2))/(s^2+(2*wn*zeta*s)+(wn^2));
G = syslin('c',G);
y = csim(entrada',tiempo',G);
plot(tiempo,salida,tiempo,entrada,tiempo,y);