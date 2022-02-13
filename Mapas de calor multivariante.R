# Importamos librerias necesarias
library(MASS)

# Generamos una distribucion N(mu,sigma) con corelacion moderada
normal_1 = mvrnorm( 5000, mu=c(0,0), Sigma=matrix( c(1, .5, .5, 1),2 ) )

# Variables independientes
normal_2 = mvrnorm( 5000, mu=c(0,5), Sigma = matrix( c(1,0,0,1), 2 ) )

# Alta correlacion
normal_3 = mvrnorm( 5000, mu=c(0,5), Sigma = matrix( c(1,.9,.9,1), 2 ) )

# Plots
plot(normal_1[,1],normal_1[,2])
plot(normal_2[,1],normal_2[,2])
plot(normal_3[,1],normal_3[,2])

# Calcular densidades kernel
kernel_1 = kde2d(normal_1[,1],normal_1[,2], n=150)
kernel_2 = kde2d(normal_2[,1],normal_2[,2], n=50)
kernel_3 = kde2d(normal_3[,1],normal_3[,2], n=50)

# Contourplot
image(kernel_1)
contour(kernel_1, add=T)

# Superficie 3D
persp(kernel_1, phi=45, theta=30, shade=.1, border=NA)

library(rgl)
col1 = heat.colors(length(kernel_1$z))[rank(kernel_1$z)]
persp3d(x=kernel_1, col=col1)
