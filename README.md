#Análisis de Ventas - AdventureWorks Cycles

##¿Qué es este proyecto?

Un análisis de datos de ventas hecho en R, donde respondo 3 preguntas 
de negocio como si un gerente comercial me las hubiera pedido para 
una reunión.

##El caso

Se simula que la gerencia comercial de una empresa (AdventureWorks 
Cycles, que vende bicicletas y accesorios) pide un análisis de las 
ventas del período para presentar en una reunión de directorio. 
Las preguntas que se buscan responder son:

¿Cuáles son los productos que más ingresos generan?
¿Hay clientes que representen una parte muy grande de las ventas? 
(esto ayuda a saber si el negocio depende demasiado de pocos clientes)
¿Cómo fueron las ventas mes a mes?

##Datos usados

El dataset tiene 43,567 registros de ventas, con información de cliente, 
fecha, producto, cantidad y monto vendido. Antes de analizar, se revisó 
que los datos no tuvieran errores (sin valores vacíos, sin filas repetidas, 
sin nombres de productos mal escritos).

##Herramientas

- R
- dplyr (para agrupar y resumir datos)
- ggplot2 (para hacer gráficos)

## Resultados

1. Productos más rentables
Los 10 productos que más dinero generan representan el 42.34% de todas 
las ventas. La línea Mountain-200 es la que más se repite entre los 
mejores productos.

2. Clientes clave
Ningún cliente por sí solo representa más del 3% de las ventas totales, 
y los 10 mejores clientes juntos solo llegan al 16.59%. Esto quiere decir 
que el negocio no depende demasiado de un cliente en particular, lo cual 
es bueno porque reduce el riesgo si alguno deja de comprar.

3. Ventas mes a mes

(evolucion_ventas.png)

Las ventas subieron de forma constante entre enero y mayo, casi 
duplicándose pasando de 8.2M a mas de 15M. Luego se 
mantuvieron estables en mayo y junio. En julio se ve una caída fuerte, 
pero esto es porque los datos de ese mes solo llegan hasta el día 8 
debido a que no es un mes completo, así que no representa una baja real en las ventas.

##Conclusión

Con este análisis se pueden dar recomendaciones simples: enfocar 
inversión y marketing en los productos que más venden (como Mountain-200), 
y confirmar que el negocio tiene una cartera de clientes sana, sin 
depender demasiado de uno solo.
