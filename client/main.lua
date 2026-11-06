--[[
    Pigeon No Wanted: client.

    Turns off GTA's wanted level and the AI services it sends: police cars, helicopters, SWAT, the army,
    and the ambulances and fire engines that turn up on their own. Each service can be kept on in the
    config. Random police NPCs walking and driving around can be turned off too.

    These are game settings in each player's own game, and GTA or other resources can change them back,
    so they're applied again every Config.ReapplySeconds.
]]

local RESOURCE = GetCurrentResourceName()

-- GTA's dispatch service IDs (eDispatchType), by the names used in the config.
local SERVICES = {
    police_cars = 1,
    police_helicopters = 2,
    fire_engines = 3,
    swat_vans = 4,
    ambulances = 5,
    police_bikes = 6,
    police_backup = 7,
    roadblocks = 8,
    police_pull_overs = 9,
    police_patrols = 10,
    gangs = 11,
    swat_helicopters = 13,
    police_boats = 14,
    army = 15,
}

local function maxWantedLevel()
    local level = math.tointeger(Config.MaxWantedLevel) or 0
    return math.max(0, math.min(5, level))
end

local function apply()
    local player = PlayerId()
    local max = maxWantedLevel()

    SetMaxWantedLevel(max)
    if GetPlayerWantedLevel(player) > max then
        if max == 0 then
            ClearPlayerWantedLevel(player)
        else
            SetPlayerWantedLevel(player, max, false)
            SetPlayerWantedLevelNow(player, false)
        end
    end

    if Config.PoliceIgnorePlayers then SetPoliceIgnorePlayer(player, true) end

    local services = Config.Services or {}
    for name, id in pairs(SERVICES) do
        EnableDispatchService(id, services[name] == true)
    end
    SetDispatchCopsForPlayer(player, services.police_cars == true)

    if Config.RandomCops == false then
        SetCreateRandomCops(false)
        SetCreateRandomCopsNotOnScenarios(false)
        SetCreateRandomCopsOnScenarios(false)
    end
end

--- Puts GTA's defaults back.
local function restore()
    local player = PlayerId()
    SetMaxWantedLevel(5)
    SetPoliceIgnorePlayer(player, false)
    SetDispatchCopsForPlayer(player, true)
    for _, id in pairs(SERVICES) do EnableDispatchService(id, true) end
    SetCreateRandomCops(true)
    SetCreateRandomCopsNotOnScenarios(true)
    SetCreateRandomCopsOnScenarios(true)
end

CreateThread(function()
    while true do
        apply()
        Wait(math.floor((Config.ReapplySeconds or 1.0) * 1000))
    end
end)

AddEventHandler('playerSpawned', apply)

AddEventHandler('onResourceStop', function(resource)
    if resource == RESOURCE then restore() end
end)
