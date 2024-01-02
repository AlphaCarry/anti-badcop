local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('KickForWeapon', function()
	DropPlayer(source, "Polis'e ait silahları sadece polisler kullanabilir")
end)

QBCore.Functions.CreateCallback('anti-badcop:server:HasWeaponInInventory', function(source, cb, WeaponInfo)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerInventory = Player.PlayerData.items
    local retval = false

    for k, v in pairs(PlayerInventory) do
        if v.name == WeaponInfo["name"] then
            retval = true
        end
    end
    cb(retval)
end)
