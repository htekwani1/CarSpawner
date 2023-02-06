RegisterNetEvent("harsh:carspawner")
AddEventHandler("harsh:carspawner", function(source, args)
    local vehicleName = source[1]
    print('local source is: ' .. vehicleName)

    if not IsModelInCdImage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args={'The vehicle' .. vehicleName .. 'does not exist. Please try again Pussio.'}
        })
        return
    end

-- load model
    RequestModel(vehicleName)

-- wait for model to load
    while not HasModelLoaded(vehicleName) do
        Wait(500)
    end

-- get player's position
    local playerPed = GetPlayerPed(-1) -- get ped
    local pos = GetEntityCoords(playerPed) -- get position

--create vehicle
    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

-- set ped into vehicle
    SetPedIntoVehicle(playerPed, vehicle, -1)

-- fiveM vehicle management
    SetEntityAsNoLongerNeeded(vehicle)

-- release model
    SetModelAsNoLongerNeeded(vehicleName)

-- notify player of vehicle spawn
    TriggerEvent('chat:addMessage', {
       args={'You have spawned the' .. vehicleName .. '. Enjoy Pussio!'} 
    })

end)
