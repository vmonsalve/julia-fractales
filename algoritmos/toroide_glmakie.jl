using GLMakie

# Parámetros
R = 2.0
r = 0.7

# Resolución
nu = 100
nv = 100

u = range(0, 2π, length=nu)
v = range(0, 2π, length=nv)

# Coordenadas
x = [(R + r*cos(vv)) * cos(uu) for uu in u, vv in v]
y = [(R + r*cos(vv)) * sin(uu) for uu in u, vv in v]
z = [r*sin(vv) for uu in u, vv in v]

fig = Figure(size = (900, 900))

ax = Axis3(
    fig[1,1],
    aspect = :data
)

surface!(
    ax,
    x,
    y,
    z,

    colormap = :plasma
)

# Creamos carpeta de salida si no existe
ruta_imagenes = joinpath(@__DIR__, "..", "imagenes")
mkpath(ruta_imagenes)

# Ruta del archivo de salida
ruta_salida = joinpath(ruta_imagenes, "toroide_glmakie.png")

# Guardamos la figura en PNG
save(ruta_salida, fig)

# Mostramos la figura en una ventana de GLMakie.
screen = display(fig)

# Evita que el script termine inmediatamente y cierre la ventana.
wait(screen)