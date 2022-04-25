# Test Banking

# Para Ejecutar el código:
    Si se tiene Ruby instalado: ruby rsi.rb
    Hay también un exe: rsi.exe

. Se han creado 3 estructuras de datos para manejar la información: Bancos, Cuentas y Transferencias.
. Se intentan ejecutar 3 transferencias, revisando en cada una de ellas el tipo (INTRABANCARIA,INTERBANCARIA), validando si el monto de la transferencia el cliente lo tiene disponible en su cuenta, calculando comisiones y saldo final de cada cliente involucrado (ORIGEN,DESTINO)

# Mejoras
. Diseñar una base de datos y que estas estructuras sean guardadas allí con sus respectivas tablas, campos, aplicando normalización
. Permitir la entrada de datos por teclado aplicando algun framework front
. Diseñar un menú de opciones
. Mejorar el diseño de los mensajes mostrados al usuario
. Separar las estructuras de datos en ficheros individuales para así sea más fácil el mantenimiento futuro de la aplicación

# Adaptación en caso de no ser instantáneas
. Guardar las transacciones en una cola (colección o tabla de base de datos) para ir validandolas
. Guardar la fecha/hora en que debe hacerse cada transferencia y aplicarla en ese momento








