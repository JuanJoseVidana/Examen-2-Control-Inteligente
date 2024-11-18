%esta funcion convierte las velocidades en vectores y las suma a los
%vectores anteriores para obtener el vector completo al final

function  [fi1, fi2, fi3, fi4]= obtfis(angulo, tiempo, mult, omega1, omega2, omega3, omega4)

%Parámetros de entrada
V = 1;         %Velocidad lineal deseada (m/s)
angulo= 360 - angulo;  % Ángulo de movimiento deseado (en grados)
%Conversión de theta a radianes
theta = deg2rad(angulo);

% Cálculo de las componentes de velocidad en x e y
Vx = V * cos(theta);  % Componente de velocidad en x
Vy = V * sin(theta); % Componente de velocidad en y

% Cálculo de las velocidades angulares de cada rueda (en radianes por segundo)
v1 = 100 * (Vx - Vy) * mult; % Rueda delantera izquierda
v2 = 100 * (Vx + Vy) * mult;  % Rueda delantera derecha
v3 = 100 * (Vx + Vy) * mult;  % Rueda trasera izquierda
v4 = 100 * (Vx - Vy) * mult;  % Rueda trasera derecha

tiempoFrames = tiempo*200; %La frecuencia de muestreo fue de 200 hz por lo cual se multiplica el tiempo x200 para obtener el numero de muestras en ese intervalo

%Incrementamos el valor de los vectores de velocidad, añadiendoselo a los
%vectores ya existentes
fi1 = [omega1, repmat(v1, 1, tiempoFrames), zeros(1, 100)];
fi2 = [omega2, repmat(v2, 1, tiempoFrames), zeros(1, 100)];
fi3 = [omega3, repmat(v3, 1, tiempoFrames), zeros(1, 100)];
fi4 = [omega4, repmat(v4, 1, tiempoFrames), zeros(1, 100)];


