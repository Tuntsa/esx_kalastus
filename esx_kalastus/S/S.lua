ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_fishing:caughtFish')
AddEventHandler('esx_fishing:caughtFish', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem('fish', 1)
end)

ESX.RegisterUsableItem('fishingrod', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local baitquantity = xPlayer.getInventoryItem('bait').count
	if baitquantity > 0 then
		TriggerClientEvent('esx_fishing:startFishing', source)
		-- xPlayer.removeInventoryItem('bait', 1)
	else 
		TriggerClientEvent('esx:showNotification', source, "Sinulla ei ole syöttiä.")
	end
end)

RegisterServerEvent('esx_fishing:removeInventoryItem')
AddEventHandler('esx_fishing:removeInventoryItem', function(item, quantity)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, quantity)
end)


RegisterServerEvent('esx_kalastus:myynti')
AddEventHandler('esx_kalastus:myynti', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local fisu = xPlayer.getInventoryItem('fish').count
   -- local randomMoney = math.random(2, 4)
	local hinta = 2

    if fisu > 0 then
        xPlayer.removeInventoryItem('fish', fisu)
        xPlayer.addMoney(hinta * fisu)
        TriggerClientEvent('esx:showNotification', source, 'Kauppa otti vastaan ' .. fisu .. ' kalaa ja maksoi niistä ' .. hinta * fisu .. '€!')
    else
        TriggerClientEvent('esx:showNotification', source, 'Mene nyt kalastaan jotai mitä voit myydä...')
    end
end)	
