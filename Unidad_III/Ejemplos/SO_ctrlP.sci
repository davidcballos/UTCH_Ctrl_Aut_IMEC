s = %s
OS = 30/100; // Sobreimpulso
tr = 0.08; // Tiempo de levantamiento
R = 1.0;
Kc = 1.12;

Kp = 5;
zeta=-log(OS)/sqrt(%pi^2+log(OS)^2);
wn=(1/(tr*sqrt(1-zeta^2)))*(%pi-atan(sqrt(1-zeta^2))/zeta);
wnc = wn*wn;


Gp = (Kp*wnc)/(s^2+(2*zeta*wn*s)+wnc);
Gp = syslin('c',Gp)

Gcontrol = ( Kc*Gp ) /. 1.0 // Lazo Retroalimentacion Unitario : /. 1.0

Tao = 1/(zeta*wn);
tf = 7*Tao;
delta = Tao/20;

t = 0:delta:tf;

entrada = R*ones(t);

salida = csim(entrada,t,Gp);
salidacontrol = csim(entrada,t,Gcontrol);
accioncontrol = Kc * (entrada-salidacontrol);


plot(t, entrada,'b--',t, salidacontrol,'g+',t,accioncontrol,'r*');
