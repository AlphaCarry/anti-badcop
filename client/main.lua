CreateThread(function()	-- Check if ped has weapon in inventory --
    while true do
        Wait(5000)

        if LocalPlayer.state.isLoggedIn then

            local PlayerPed = PlayerPedId()
            local player = PlayerId()
            local CurrentWeapon = GetSelectedPedWeapon(PlayerPed)
            local WeaponInformation = QBCore.Shared.Weapons[CurrentWeapon]
 
            if WeaponInformation["name"] == "weapon_glock19" or WeaponInformation["name"] == "weapon_stungun" or WeaponInformation["name"] == "weapon_hkump" or WeaponInformation["name"] == "weapon_m4a1block2" or WeaponInformation["name"] == "weapon_fm1_hk416" or WeaponInformation["name"] == "weapon_nightstick" then
				if QBCore.Functions.GetPlayerData().job.name == "police" or QBCore.Functions.GetPlayerData().job.name == "lawyer" then
				else
				TriggerServerEvent('KickForWeapon')
				end
            end
        end
    end
end)

--[[
CreateThread(function()	-- Check if ped has weapon in inventory --
    while true do
        Wait(5000)

        if LocalPlayer.state.isLoggedIn then

            local PlayerPed = PlayerPedId()
            local player = PlayerId()
            local CurrentWeapon = GetSelectedPedWeapon(PlayerPed)
            local WeaponInformation = QBCore.Shared.Weapons[CurrentWeapon]

            if WeaponInformation ~= nil and WeaponInformation["name"] ~= "weapon_unarmed" then
                QBCore.Functions.TriggerCallback('anti-badcop:server:HasWeaponInInventory', function(HasWeapon)
                    if not HasWeapon then
                        RemoveAllPedWeapons(PlayerPed, false)
                        TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Weapon removed!", "orange", "** @everyone " ..GetPlayerName(player).. "** had a weapon on them that they did not have in his inventory. QB Anticheat has removed the weapon.")
                    end
                end, WeaponInformation)
            end
        end
    end
end)
]]
