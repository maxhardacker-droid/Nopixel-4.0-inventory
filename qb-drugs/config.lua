Config = Config or {}

-- Ensure these settings exist in your qb-drugs/config.lua
Config.Dealers = {
    ["organicdealer"] = {
        name = "Organic Dealer",
        coords = vector3(-467.15, -1720.25, 18.68), -- Example Coord
        items = {
            [1] = { name = "weed_skunk", price = 100, amount = 50, minrep = 0 },
            [2] = { name = "weed_joint", price = 20, amount = 100, minrep = 0 },
        },
        showBlip = true, -- Set to true for map marker
        blipSprite = 140,
        blipColor = 2
    },
    ["cocaine_dealer"] = {
        name = "Coke Dealer",
        coords = vector3(100.0, 100.0, 20.0), -- Replace with your actual coords
        items = {
            [1] = { name = "cokebaggy", price = 500, amount = 20, minrep = 0 },
        },
        showBlip = true,
        blipSprite = 501,
        blipColor = 1
    },
    ["meth_dealer"] = {
        name = "Meth Dealer",
        coords = vector3(200.0, 200.0, 20.0), -- Replace with your actual coords
        items = {
            [2] = { name = "meth", price = 400, amount = 30, minrep = 0 },
        },
        showBlip = true,
        blipSprite = 499,
        blipColor = 5
    }
}