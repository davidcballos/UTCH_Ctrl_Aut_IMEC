s = %s
Tao = 10;
Kp = 5;
R = 1.0;
Kc = 1.13; // = 0.2

Gp = Kp/((Tao*s)+1);
Gp = syslin('c',Gp)

Gcontrol = ( Kc*Gp ) /. 1.0

tf = 7*Tao;
delta = Tao/20;

t = 0:delta:tf;

entrada = R*ones(t);

salida = csim(entrada,t,Gp);
salidacontrol = csim(entrada,t,Gcontrol);
accioncontrol = Kc * (entrada-salidacontrol);


plot(t, entrada,'b--',t, salidacontrol,'g+',t,accioncontrol,'r*');
