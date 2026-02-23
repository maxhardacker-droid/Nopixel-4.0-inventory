local QBCore = exports['qb-core']:GetCoreObject()
local DealerBlips = {}

local function CreateDealerBlips()
    for k, v in pairs(Config.Dealers) do
        if v.showBlip then
            local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
            SetBlipSprite(blip, v.blipSprite or 140)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.7)
            SetBlipAsShortRange(blip, true)
            SetBlipColour(blip, v.blipColor or 2)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(v.name)
            EndTextCommandSetBlipName(blip)
            DealerBlips[k] = blip
        end
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('qb-drugs:server:RequestConfig', function(DealerData)
        Config.Dealers = DealerData
        CreateDealerBlips()
    end)
end)

-- If script is restarted while ingame
AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
        CreateDealerBlips()
    end
end)