Config = {}

-- esx > es_extended
-- qb > qb-core
Config.Core = 'es_extended'

Config.FrameWork = 'ESX' -- ESX dan QBCORE

Config.Healing = {
    {
        useblip = true, -- Pakai Blip atau tidak
        blip = {
            name    = "Zona Healing", -- Nama Blip
            coords  = vector3(1084.4762, -695.9625, 57.9818), -- Koordinat blip
            sprite  = 197, -- Type Blip
            scale   = 0.7, -- Ukuran Blip
            color   = 4 -- Color Blip
        },
        points = { -- Zone, dibuat dengan create zone poly ox_lib
            vec3(-1880.4499511719, -1213.5999755859, 12.0),
            vec3(-1832.3000488281, -1156.4000244141, 12.0),
            vec3(-1781.5999755859, -1198.9000244141, 12.0),
            vec3(-1812.8000488281, -1236.0, 13.0),
            vec3(-1806.8000488281, -1241.1999511719, 12.0),
            vec3(-1823.5, -1261.0, 13.0),
        },
        thickness = 10.0, -- Atur Tinggi
        debug = true, -- Menyalakan Debug Atau tidak ?
        WaitTick = 1 * 1000, -- Setiap berapa detik nurunin stressnya
        JumlahStress = 10000 -- Berapa jumlah pengurangan stress
    },
}