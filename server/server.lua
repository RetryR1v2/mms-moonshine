local RSGCore = exports['rsg-core']:GetCoreObject()

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/RetryR1v2/mms-moonshine/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

      
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('Current Version: %s'):format(currentVersion))
            versionCheckPrint('success', ('Latest Version: %s'):format(text))
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end



------------------------- Maischer ---------------------------------

--- Maischer Rezept 1

RegisterNetEvent('mms-moonshine:server:maische1', function(multiplier)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if  Player.Functions.GetItemByName(Config.maische1item1) and Player.Functions.GetItemByName(Config.maische1item1).amount >= Config.maische1anzahl1 * multiplier  and
        Player.Functions.GetItemByName(Config.maische1item2) and Player.Functions.GetItemByName(Config.maische1item2).amount >= Config.maische1anzahl2 * multiplier and
        Player.Functions.GetItemByName(Config.maische1item3) and Player.Functions.GetItemByName(Config.maische1item3).amount >= Config.maische1anzahl3 * multiplier then
            TriggerClientEvent('mms-moonshine:client:meischercirclemaische1',src)
            Citizen.Wait(Config.rezept1maischertime * multiplier)
    TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.maische1item1], "remove")
    Player.Functions.RemoveItem(Config.maische1item1, Config.maische1anzahl1 * multiplier)
    TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.maische1item2], "remove")
    Player.Functions.RemoveItem(Config.maische1item2, Config.maische1anzahl2 * multiplier)
    TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.maische1item3], "remove")
    Player.Functions.RemoveItem(Config.maische1item3, Config.maische1anzahl3 * multiplier)
    
    TriggerClientEvent('ox_lib:notify', src, {title = 'Du Stellst ' .. Config.rewardmaische1anzahl * multiplier .. ' ' .. Config.rewardmaische1item .. ' Her!', description =  'Erfolg', type = 'success', duration = 5000 })
    TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.rewardmaische1item], "add")
    Player.Functions.AddItem(Config.rewardmaische1item, Config.rewardmaische1anzahl * multiplier)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nicht alle Zutaten!', description =  'Fehler', type = 'error', duration = 5000 })
    end
end)

--- Maischer Rezept 2

RegisterNetEvent('mms-moonshine:server:maische2', function(multiplier)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if  Player.Functions.GetItemByName(Config.maische2item1) and Player.Functions.GetItemByName(Config.maische2item1).amount >= Config.maische2anzahl1 * multiplier  and
        Player.Functions.GetItemByName(Config.maische2item2) and Player.Functions.GetItemByName(Config.maische2item2).amount >= Config.maische2anzahl2 * multiplier and
        Player.Functions.GetItemByName(Config.maische2item3) and Player.Functions.GetItemByName(Config.maische2item3).amount >= Config.maische2anzahl3 * multiplier then
            TriggerClientEvent('mms-moonshine:client:meischercirclemaische2',src)
            Citizen.Wait(Config.rezept2maischertime * multiplier)
    TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.maische2item1], "remove")
    Player.Functions.RemoveItem(Config.maische2item1, Config.maische2anzahl1 * multiplier)
    TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.maische2item2], "remove")
    Player.Functions.RemoveItem(Config.maische2item2, Config.maische2anzahl2 * multiplier)
    TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.maische2item3], "remove")
    Player.Functions.RemoveItem(Config.maische2item3, Config.maische2anzahl3 * multiplier)
    
    TriggerClientEvent('ox_lib:notify', src, {title = 'Du Stellst ' .. Config.rewardmaische2anzahl * multiplier .. ' ' .. Config.rewardmaische2item .. ' Her!', description =  'Erfolg', type = 'success', duration = 5000 })
    TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.rewardmaische2item], "add")
    Player.Functions.AddItem(Config.rewardmaische2item, Config.rewardmaische2anzahl * multiplier)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nicht alle Zutaten!', description =  'Fehler', type = 'error', duration = 5000 })
    end
end)





------------------------- Brenner ---------------------------------

--- Brenner Rezept 1

RegisterNetEvent('mms-moonshine:server:brenner1', function(multiplier)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if  Player.Functions.GetItemByName(Config.brenner1item) and Player.Functions.GetItemByName(Config.brenner1item ).amount >= Config.brenner1anzahl * multiplier then
        local maischeamount = Player.Functions.GetItemByName(Config.brenner1item).amount
        if maischeamount >= Config.brenner1anzahl * multiplier then
        TriggerClientEvent('mms-moonshine:client:brennercirclebrenner1',src)
        Citizen.Wait(Config.rezept1brennertime * multiplier)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.brenner1item], "remove")
        Player.Functions.RemoveItem(Config.brenner1item, Config.brenner1anzahl * multiplier)  
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du Brennst Erfolgreich ' .. Config.brenner1rewardanzahl * multiplier .. ' ' .. Config.brenner1reward .. ' !', description =  'Erfolg', type = 'success', duration = 5000 })
        Player.Functions.AddItem(Config.brenner1reward, Config.brenner1rewardanzahl * multiplier)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.brenner1reward], "add")
        Citizen.Wait(1000)
        end
    else
        local maischeamount = Player.Functions.GetItemByName(Config.brenner2item).amount
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nur ' .. maischeamount .. ' ' .. Config.brenner1item .. ' Stelle mehr Maische her!', description =  'Fehler', type = 'error', duration = 5000 })
    end
end)

--- Brenner Rezept 2

RegisterNetEvent('mms-moonshine:server:brenner2', function(multiplier)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if  Player.Functions.GetItemByName(Config.brenner2item) and Player.Functions.GetItemByName(Config.brenner2item ).amount >= Config.brenner2anzahl * multiplier then
        local maischeamount = Player.Functions.GetItemByName(Config.brenner2item).amount
        if maischeamount >= Config.brenner2anzahl * multiplier then
        TriggerClientEvent('mms-moonshine:client:brennercirclebrenner2',src)
        Citizen.Wait(Config.rezept2brennertime * multiplier)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.brenner2item], "remove")
        Player.Functions.RemoveItem(Config.brenner2item, Config.brenner2anzahl * multiplier)  
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du Brennst Erfolgreich ' .. Config.brenner2rewardanzahl * multiplier .. ' ' .. Config.brenner2reward .. ' !', description =  'Erfolg', type = 'success', duration = 5000 })
        Player.Functions.AddItem(Config.brenner2reward, Config.brenner2rewardanzahl * multiplier)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.brenner2reward], "add")
        Citizen.Wait(1000)
        end
    else
        local maischeamount = Player.Functions.GetItemByName(Config.brenner2item).amount
        TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nur ' .. maischeamount .. ' ' .. Config.brenner2item .. ' Stelle mehr Maische her!', description =  'Fehler', type = 'error', duration = 5000 })
    end
end)


--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()











