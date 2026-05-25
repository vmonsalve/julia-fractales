using Plots

gr()

R = 4.0
r = 1.0

u = range(0, 2π, length=120)[1:end-1]
v = range(0, 2π, length=80)[1:end-1]

function toroide(angle)

    x = [(R + r*cos(vv)) * cos(uu) for vv in v, uu in u]
    y = [(R + r*cos(vv)) * sin(uu) for vv in v, uu in u]
    z = [r*sin(vv) for vv in v, uu in u]

    p = surface(
        x,
        y,
        z,

        fill_z = z,

        legend = false,
        axis = false,
        grid = false,

        size = (900, 900),

        camera = (angle * 180 / π, 35),

        title = "Toroide animado"
    )

    return p
end

anim = @animate for a in range(0, 2π, length=120)

    toroide(a)

end

ruta_imagenes = joinpath(@__DIR__, "..", "imagenes")

mkpath(ruta_imagenes)

ruta_salida = joinpath(ruta_imagenes, "toroide_animado.gif")

gif(anim, ruta_salida, fps=30)