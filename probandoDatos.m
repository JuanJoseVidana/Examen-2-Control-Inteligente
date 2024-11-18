%Inicializamos los vectores de ls velocidades
fi1 =[];
fi2=[];
fi3 = [];
fi4 = [];

%Mandamos a llamar a l función mover robot como se hacía en python
%pero ahora incrementando los vectores de velocidaddes e cada rueda
[fi1, fi2, fi3, fi4] = moverRobot(0, 2, 1, fi1, fi2, fi3, fi4);
[fi1, fi2, fi3, fi4] = moverRobot(0, 1, 1.5, fi1, fi2, fi3, fi4); 
[fi1, fi2, fi3, fi4] = moverRobot(180, 2, 1, fi1, fi2, fi3, fi4);
[fi1, fi2, fi3, fi4] = moverRobot(180, 1, 1.5, fi1, fi2, fi3, fi4); 
[fi1, fi2, fi3, fi4] = moverRobot(180, 1.5, 1, fi1, fi2, fi3, fi4); 
[fi1, fi2, fi3, fi4] = moverRobot(0, 1.5, 1, fi1, fi2, fi3, fi4); 
[fi1, fi2, fi3, fi4] = moverRobot(45, 2, 0.8, fi1, fi2, fi3, fi4); 
[fi1, fi2, fi3, fi4] = moverRobot(180+45, 2, 0.8, fi1, fi2, fi3, fi4); 
[fi1, fi2, fi3, fi4] = moverRobot(180+45, 3, 1.1, fi1, fi2, fi3, fi4); 
[fi1, fi2, fi3, fi4] = moverRobot(45, 3, 1.1, fi1, fi2, fi3, fi4);

[fi1, fi2, fi3, fi4] = moverRobot(180-45, 1.5, 1, fi1, fi2, fi3, fi4);
[fi1, fi2, fi3, fi4] = moverRobot(360-45, 1.5, 1, fi1, fi2, fi3, fi4);
[fi1, fi2, fi3, fi4] = moverRobot(360-45, 2, 0.5, fi1, fi2, fi3, fi4);
[fi1, fi2, fi3, fi4] = moverRobot(180-45, 2, 0.5, fi1, fi2, fi3, fi4);

[fi1, fi2, fi3, fi4] = moverRobot(90, 1, 1.3, fi1, fi2, fi3, fi4);
[fi1, fi2, fi3, fi4] = moverRobot(180+90, 1, 1.3, fi1, fi2, fi3, fi4);
[fi1, fi2, fi3, fi4] = moverRobot(180+90, 1.8, 1, fi1, fi2, fi3, fi4);
[fi1, fi2, fi3, fi4] = moverRobot(90, 1.8, 1, fi1, fi2, fi3, fi4);

[fi1, fi2, fi3, fi4] = moverRobot(60, 2, 1, fi1, fi2, fi3, fi4);
[fi1, fi2, fi3, fi4] = moverRobot(180+60, 2, 1, fi1, fi2, fi3, fi4); 
[fi1, fi2, fi3, fi4] = moverRobot(180+60, 1.2, 1.1, fi1, fi2, fi3, fi4);
[fi1, fi2, fi3, fi4] = moverRobot(60, 1.2, 1.1, fi1, fi2, fi3, fi4); 
[fi1, fi2, fi3, fi4] = moverRobot(360-60, 1, 0.8, fi1, fi2, fi3, fi4); 
[fi1, fi2, fi3, fi4] = moverRobot(180-60, 1, 0.8, fi1, fi2, fi3, fi4); 
[fi1, fi2, fi3, fi4] = moverRobot(180-60, 2.5, 0.9, fi1, fi2, fi3, fi4); 
[fi1, fi2, fi3, fi4] = moverRobot(360-60, 2.5, 0.9, fi1, fi2, fi3, fi4);

%Finalizamos agregando los movimientos rotacionales
fi1 = [fi1, repmat(100, 1, 200*1), zeros(1, 200*1), repmat(-100, 1, 200*3)];
fi2 = [fi2, repmat(-100, 1, 200*1), zeros(1, 200*1), repmat(100, 1, 200*3)];
fi3 = [fi3, repmat(100, 1, 200*1),  zeros(1, 200*1), repmat(-100, 1, 200*3)];
fi4 = [fi4, repmat(-100, 1, 200*1),  zeros(1, 200*1), repmat(100, 1, 200*3)];

%Pasar RPMs a RPS para usarlos en caso de considerarlo necesario
fi1s = fi1/60;
fi2s = fi2/60;
fi3s = fi3/60;
fi4s = fi4/60;

%%
ti = repmat(0.005, 1, 12600);
dt = 1/200; %Paraa las derivadas

%Utilizamos unicamente los valores nuestros vectores que nos interesan
tx = x(1119:13718);
ty = y(1119:13718);
rz = th(1119:13718);

%derivamos para en caso de necesitarlo
vX = diff(tx)/dt;
vX = [vX; vX(end)]; %se agrega el valor de la derivada final para tener los vectores del mismo tamaño
vY = diff(ty)/dt;
vY = [vY; vY(end)];
vZ = diff(rz)/dt;
vZ = [vZ; vZ(end)];
%Definimos las entradas y salidas del sistema original
entradas = [fi1s' fi2s' fi3s' fi4s'];
salidas = [tx ty rz];

%Definimos las salidas derivadas
salidasD = [vX vY vZ];