local QBCore = exports['qb-core']:GetCoreObject()

-- Event to open the dealer shop using the new qb-inventory exports
RegisterNetEvent('qb-drugs:server:dealerShop', function(dealerName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local dealerData = Config.Dealers[dealerName]
    if not dealerData then return end

    local playerPed = GetPlayerPed(src)
    local playerCoords = GetEntityCoords(playerPed)
    local dist = #(playerCoords - dealerData.coords)

    -- Security check: distance
    if dist > 10.0 then 
        print(("[Hacking Attempt] Player %s tried opening dealer shop from too far away"):format(GetPlayerName(src)))
        return 
    end

    local curRep = Player.PlayerData.metadata["dealerrep"] or 0
    local availableItems = {}

    -- Filter items by reputation
    for k, v in pairs(dealerData.items) do
        if curRep >= (v.minrep or 0) then
            availableItems[#availableItems + 1] = {
                name = v.name,
                price = v.price,
                amount = v.amount,
                info = {},
                type = "item",
                slot = #availableItems + 1,
            }
        end
    end

    -- Register the shop with your specific inventory export
    exports['qb-inventory']:CreateShop({
        name = dealerName,
        label = dealerData.name,
        slots = #availableItems,
        coords = dealerData.coords,
        items = availableItems,
    })

    -- Open the shop for the player
    exports['qb-inventory']:OpenShop(src, dealerName)
end)

-- Ensure blips are sent to clients on load
QBCore.Functions.CreateCallback('qb-drugs:server:RequestConfig', function(source, cb)
    cb(Config.Dealers)
end)