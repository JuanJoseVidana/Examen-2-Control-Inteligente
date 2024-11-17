import math

#Función que se encarga de mover al robot en la dirección indicada
#durante el tiempo indicado, la variable mult se encarga de multiplicar 
# su velocidad para incrementarla o decrementarla segun se desee
def moverRobot(angulo, tiempo, mult):
    # Parámetros de entrada
    V = 1           # Velocidad lineal deseada (m/s)
    angulo= 360 - angulo  # Ángulo de movimiento deseado (en grados)
    omegaZ = 0     # Velocidad angular deseada alrededor del eje del robot (rad/s)
    L = 1           # Distancia del centro del robot a cada rueda (m)
    r = 1           # Radio de cada rueda (m)
    # Conversión de theta a radianes
    theta = math.radians(angulo)

    # Cálculo de las componentes de velocidad en x e y
    Vx = V * math.cos(theta)  # Componente de velocidad en x
    Vy = V * math.sin(theta)  # Componente de velocidad en y

    # Cálculo de las velocidades angulares de cada rueda (en radianes por segundo)
    omega1 = 100 * (Vx - Vy) *mult# Rueda delantera izquierda
    omega2 = 100 * (Vx + Vy)  *mult# Rueda delantera derecha
    omega3 = 100 * (Vx + Vy)  *mult# Rueda trasera izquierda
    omega4 = 100 * (Vx - Vy)  *mult# Rueda trasera derecha

    print(omega1, omega2, omega3, omega4) #Observar las velocidades de las ruedas (RPM)

    #Comando que se encarga de mover las ruedas a la velocidad indicada(RPM)
    #(izquierdaFrontal, derechaFrontal, izquierdaTrasera, derechaTrasera)
    chassis_ctrl.set_wheel_speed(omega1, omega2, omega3, omega4)
    time.sleep(tiempo) #mover el robot durante el tiempo indicado
    chassis_ctrl.set_wheel_speed(0, 0, 0, 0)
    time.sleep(0.5) #Detener el robot duante 0.5 segundos


def start():
    # Se llama a la función moverRobot para avanzar hacia delante (0 grados) durante 
    #2 segundos, con un mutilplicador de 1. En la siguiente llamada a la función avanzará 
    # un segundo más con un multiplicador de 1.5 y en las siguientes dos llamadas, volverá
    moverRobot(0, 2, 1) 
    moverRobot(0, 1, 1.5) 
    moverRobot(180, 2, 1) 
    moverRobot(180, 1, 1.5) 
    #Mover hacia atras
    moverRobot(180, 1.5, 1) 
    moverRobot(0, 1.5, 1) 
    #Mover a 45 grados
    moverRobot(45, 2, 0.8) 
    #Volver al 0
    moverRobot(180+45, 2, 0.8)
    #Mover a 225 grados y volver 
    moverRobot(180+45, 3, 1.1) 
    moverRobot(45, 3, 1.1)
    #mover a 135 grados y volver
    moverRobot(180-45, 1.5, 1)
    moverRobot(360-45, 1.5, 1)
    #Mover a 315 grados y volver 
    moverRobot(360-45, 2, 0.5)
    moverRobot(180-45, 2, 0.5)
    #Mover a la derecha y olver
    moverRobot(90, 1, 1.3)
    moverRobot(180+90, 1, 1.3)
    #Mover a la izquierda y volver
    moverRobot(180+90, 1.8, 1)
    moverRobot(90, 1.8, 1)
    #mover 60 grados y volver
    moverRobot(60, 2, 1) 
    moverRobot(180+60, 2, 1) 
    #Mover 240 grados y volver
    moverRobot(180+60, 1.2, 1.1)
    moverRobot(60, 1.2, 1.1) 
    #mover 300 grados y volver
    moverRobot(360-60, 1, 0.8) 
    moverRobot(180-60, 1, 0.8) 
    #Mover 120 grados y volver
    moverRobot(180-60, 2.5, 0.9) 
    moverRobot(360-60, 2.5, 0.9) 
    
    #Girar durante 1 s
    chassis_ctrl.set_wheel_speed(100, -100, 100, -100) 
    time.sleep(1) 
    chassis_ctrl.set_wheel_speed(0, 0, 0, 0) 
    time.sleep(1) #Detener durante 1 s
    #Girar a lado contrario durante 3 s
    chassis_ctrl.set_wheel_speed(-100, 100, -100, 100) 
    time.sleep(3)