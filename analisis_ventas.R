
# ============================================================
# ANÁLISIS DE VENTAS - AdventureWorks Cycles
# Caso simulado: reporte solicitado por Gerencia Comercial
# ============================================================

# En caso no cuente con los paquetes instalados, elimina los # estas líneas:
# install.packages("readxl")
# install.packages("dplyr")
# install.packages("ggplot2")
# install.packages("scales")

library(readxl)
library(dplyr)
library(ggplot2)
library(scales)

#poner la direccion y nombre de su archivo
ventas<-read_excel("D:/Databases para practicar/Copia de Sales Orders.xlsx")


# ============================================================
# 1. CARGA Y LIMPIEZA DE DATOS
# ============================================================

str(ventas)
summary(ventas)
colSums(is.na(ventas))
sum(duplicated(ventas))
unique(ventas$Product)

# En este caso podemos obeservar que el dataset no presenta valores nulos ni filas duplicadas.

# ============================================================
# CASO: Gerencia Comercial solicita un análisis para la reunión
# de directorio del jueves, que responda:
#   1. ¿Cuáles son las líneas de producto más rentables?
#   2. ¿Existen clientes clave que concentren gran parte de las ventas?
#   3. ¿Cómo evolucionaron las ventas mes a mes?
# Se pide un reporte ejecutivo con conclusiones y 1-2 gráficos.
# ============================================================

# ============================================================
# 2. PRODUCTOS MÁS RENTABLES
# ============================================================

top_productos <- ventas %>%
  group_by(Product) %>% 
  summarise(total_ventas=sum(Monto)) %>% 
  arrange(desc(total_ventas)) %>%
  head(10)
top_productos
View(top_productos)

total_productos<-sum(ventas$Monto)
suma_top_10 <-sum(top_productos$total_ventas)
porcentaje<-(suma_top_10/total_productos)*100
porcentaje

print("Analizando las ordenes del periodo, observamos que el top 10 de productos más 
rentables representa el 42.34% de nuestras ventas totales, liderado principalmente 
por la línea Mountain-200 y Road-350-W Yellow, 48. Esto sugiere que concentrar inventario y marketing en 
estas líneas podría seguir siendo una estrategia rentable a largo plazo.")


# ============================================================
# 3. CLIENTES CLAVE / RIESGO DE DEPENDENCIA
# ============================================================

top_clientes_Dependencia <-ventas %>%
  group_by(Customer) %>%
  summarise(total_ventas=sum(Monto)) %>%
  arrange(desc(total_ventas)) %>%
  head(10)
top_clientes_Dependencia
View(top_clientes_Dependencia)

top_clientes_Dependencia$porcentaje<-round(top_clientes_Dependencia$total_ventas/sum(ventas$Monto)*100,2)
cat("total del porcentaje de cliente con dependencia", sum(top_clientes_Dependencia$porcentaje))
View(top_clientes_Dependencia)

print("A diferencia del top 10 de productos más rentables, que concentraba el 42.34% de las ventas totales, 
en el top 10 de clientes ningún cliente individual sobrepasa el 3%, y el porcentaje conjunto de la tabla 
es del 16.59%. Esto indica que la empresa no depende excesivamente de ningún cliente en particular, 
lo cual representa un riesgo bajo de concentración en la cartera de clientes.")

# ============================================================
# 4. EVOLUCIÓN DE VENTAS MES A MES
# ============================================================

ventas_mensuales<-ventas %>%
  mutate(mes=format(ShipDate,"%Y-%m")) %>%
  group_by(mes)%>%
  summarise(total_mes=sum(Monto)) 
ventas_mensuales
View(ventas_mensuales)


options(scipen = 999)

ggplot(ventas_mensuales,aes(x=mes,y=total_mes,group=1))+
  geom_line(color="steelblue", linewidth=1)+
  geom_point(color = "steelblue") +
  scale_y_continuous(labels = comma) +
  labs(title="Evolucion de las ventas mes a mes",
       x="Mes",
       y="Ventas totales")+
  theme_minimal() +
  theme(axis.text.x=element_text(angle=45, hjust=1))
  
print("Las ventas mostraron un crecimiento sostenido de enero a mayo,
      prácticamente duplicándose 8.2M aprox hasta mas de 15M , y se mantuvieron 
      estables en ese nivel alto durante mayo y junio. Los datos de julio 
      están incompletos debido a que solo cubren hasta el dia 8, por lo que la caída
      que se observa ese mes no refleja una tendencia real, sino datos parciales 
      no se debe interpretar como una caída en las ventas")

