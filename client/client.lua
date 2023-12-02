local RSGCore = exports['rsg-core']:GetCoreObject()

---------------------------- Maischer ----------------------

Citizen.CreateThread(function()
    for maischer,v in pairs(Config.maischer) do
        exports['rsg-core']:createPrompt(v.name, v.coords, RSGCore.Shared.Keybinds['J'],  (' ') .. v.lable, {
            type = 'client',
            event = 'mms-moonshine:client:maischermenu',
            args = {},
        })
        if v.showblip == true then
            local maischer = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(maischer, GetHashKey(v.blipSprite), true)
            SetBlipScale(maischer, v.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, maischer, v.blipName)
        end
    end
end)


RegisterNetEvent('mms-moonshine:client:maischermenu', function()
    lib.registerContext(
        {
            id = 'maischer',
            title = ('Maischer'),
            position = 'top-right',
            options = {
                {
                    title = ('Rezept: ' .. Config.rezept1maischenname .. ' !'),
                    description = ('Rezept:' .. Config.maische1anzahl1 .. ' ' .. Config.maische1item1 .. ' + ' .. Config.maische1anzahl2 .. ' ' .. Config.maische1item2 .. ' + '  .. Config.maische1anzahl3 .. ' ' .. Config.maische1item3 .. ' !' ),
                    icon = 'fas fa-circle',
                    event = 'mms-moonshine:client:maische1',
                },
                {
                    title = ('Rezept: ' .. Config.rezept2maischenname .. ' !'),
                    description = ('Rezept:' .. Config.maische2anzahl1 .. ' ' .. Config.maische2item1 .. ' + ' .. Config.maische2anzahl2 .. ' ' .. Config.maische2item2 .. ' + '  .. Config.maische2anzahl3 .. ' ' .. Config.maische2item3 .. ' !' ),
                    icon = 'fas fa-circle',
                    event = 'mms-moonshine:client:maische2',
                },
            }
        }
    )
    lib.showContext('maischer')
end)

-------------- Rezept 1 Maischer

RegisterNetEvent('mms-moonshine:client:maische1')
AddEventHandler('mms-moonshine:client:maische1', function()
    if Config.rezept1active == true then
        input = lib.inputDialog('Maischeanzahl', {
            { 
                type = 'number',
                label = 'Anzahl Maische',
                required = true,
                allowCancel = true,
                min = 1, max = 50,
            },
        })
        if input then
            multiplier = input[1]
        else return
            end
        if lib.progressActive() then 
            RSGCore.Functions.Notify("Du machst bereits Etwas", "error", 5000 , 'top-right')
            return
        end
    TriggerServerEvent('mms-moonshine:server:maische1', multiplier)
    else
        RSGCore.Functions.Notify('Du kannst dieses Rezept nicht benutzen!', 'error')
        TriggerEvent('mms-moonshine:client:maischermenu')
    end
end)

RegisterNetEvent('mms-moonshine:client:meischercirclemaische1')
AddEventHandler('mms-moonshine:client:meischercirclemaische1', function()
    RSGCore.Functions.Progressbar('Stelle Her','Stelle ' .. Config.rezept1maischenname .. ' Her',Config.rezept1maischertime * multiplier, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    end)
end)

-------------- Rezept 2 Maischer

RegisterNetEvent('mms-moonshine:client:maische2')
AddEventHandler('mms-moonshine:client:maische2', function()
    if Config.rezept2active == true then
        input = lib.inputDialog('Maischeanzahl', {
            { 
                type = 'number',
                label = 'Anzahl Maische',
                required = true,
                allowCancel = true,
                min = 1, max = 50,
            },
        })
        if input then
            multiplier = input[1]
        else return
            end
        if lib.progressActive() then 
            RSGCore.Functions.Notify("Du machst bereits Etwas", "error", 5000)
            return
        end
    TriggerServerEvent('mms-moonshine:server:maische2', multiplier)
    else
        RSGCore.Functions.Notify('Du kannst dieses Rezept nicht benutzen!', 'error')
        TriggerEvent('mms-moonshine:client:maischermenu')
    end
end)

RegisterNetEvent('mms-moonshine:client:meischercirclemaische2')
AddEventHandler('mms-moonshine:client:meischercirclemaische2', function()
    RSGCore.Functions.Progressbar('Stelle Her','Stelle ' .. Config.rezept2maischenname .. ' Her',Config.rezept2maischertime * multiplier, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    end)
end)

----------------------- Brenner ----------------------

Citizen.CreateThread(function()
    for brennerei,v in pairs(Config.brennerei) do
        exports['rsg-core']:createPrompt(v.name, v.coords, RSGCore.Shared.Keybinds['J'],  (' ') .. v.lable, {
            type = 'client',
            event = 'mms-moonshine:client:brennermenu',
            args = {},
        })
        if v.showblip == true then
            local brennerei = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(brennerei, GetHashKey(v.blipSprite), true)
            SetBlipScale(brennerei, v.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, brennerei, v.blipName)
        end
    end
end)


RegisterNetEvent('mms-moonshine:client:brennermenu', function()
    lib.registerContext(
        {
            id = 'brenner',
            title = ('Schwarzbrenner'),
            position = 'top-right',
            options = {
                {
                    title = ('Rezept: ' .. Config.rezept1whiskeyname .. ' !'),
                    description = ('Rezept: ' .. Config.brenner1anzahl .. ' ' .. Config.brenner1item .. ' !'),
                    icon = 'fas fa-circle',
                    event = 'mms-moonshine:client:brenner1',
                },
                {
                    title = ('Rezept: ' .. Config.rezept2whiskeyname .. ' !'),
                    description = ('Rezept: ' .. Config.brenner2anzahl .. ' ' .. Config.brenner2item .. ' !'),
                    icon = 'fas fa-circle',
                    event = 'mms-moonshine:client:brenner2',
                },
            }
        }
    )
    lib.showContext('brenner')
end)

-------------- Rezept 1 Brenner

RegisterNetEvent('mms-moonshine:client:brenner1')
AddEventHandler('mms-moonshine:client:brenner1', function()
    if Config.rezept1active == true then
        input = lib.inputDialog('Whiskeyanzahl', {
            { 
                type = 'number',
                label = 'Anzahl Whiskey',
                required = true,
                allowCancel = true,
                min = 1, max = 50,
            },
        })
        if input then
        multiplier = input[1]
        else return
        end
        if lib.progressActive() then 
            RSGCore.Functions.Notify("Du machst bereits Etwas", "error", 5000)
            return
        end
        TriggerServerEvent('mms-moonshine:server:brenner1' , multiplier)
    else
        RSGCore.Functions.Notify('Du kannst dieses Rezept nicht benutzen!', 'error')
        TriggerEvent('mms-moonshine:client:brennermenu')
    end
end)

RegisterNetEvent('mms-moonshine:client:brennercirclebrenner1')
AddEventHandler('mms-moonshine:client:brennercirclebrenner1', function()
    RSGCore.Functions.Progressbar('Stelle Her','Stelle ' .. Config.rezept1whiskeyname .. ' Her',Config.rezept1brennertime * multiplier, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    end)
end)

-------------- Rezept 2 Brenner

RegisterNetEvent('mms-moonshine:client:brenner2')
AddEventHandler('mms-moonshine:client:brenner2', function()
    if Config.rezept2active == true then
        input = lib.inputDialog('Whiskeyanzahl', {
            { 
                type = 'number',
                label = 'Anzahl Whiskey',
                required = true,
                allowCancel = true,
                min = 1, max = 50,
            },
        })
        if input then
        multiplier = input[1]
        else return
        end
        if lib.progressActive() then 
            RSGCore.Functions.Notify("Du machst bereits Etwas", "error", 5000)
            return
        end
        TriggerServerEvent('mms-moonshine:server:brenner2' , multiplier)
    else
        RSGCore.Functions.Notify('Du kannst dieses Rezept nicht benutzen!', 'error')
        TriggerEvent('mms-moonshine:client:brennermenu')
    end
end)

RegisterNetEvent('mms-moonshine:client:brennercirclebrenner2')
AddEventHandler('mms-moonshine:client:brennercirclebrenner2', function()
    RSGCore.Functions.Progressbar('Stelle Her','Stelle ' .. Config.rezept2whiskeyname .. ' Her',Config.rezept2brennertime * multiplier, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    end)
end)