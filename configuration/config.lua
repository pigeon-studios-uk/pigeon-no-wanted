Config = {}

-- The highest wanted level GTA can give a player, from 0 (never wanted) to 5. Anything above it is
-- cleared straight away.
Config.MaxWantedLevel = 0

-- AI police ignore players: they don't chase or shoot at them for crimes they see.
Config.PoliceIgnorePlayers = true

-- false: no random police NPCs walking, standing or driving around. true leaves them as GTA has them.
Config.RandomCops = false

-- The AI services GTA sends by itself. false turns a service off, true keeps it.
-- These are GTA's own AI responses, not your players' jobs: your police, EMS and fire players are
-- never affected.
Config.Services = {
    police_cars = false,          -- police cars sent after a wanted player
    police_helicopters = false,
    police_bikes = false,
    police_boats = false,
    police_backup = false,        -- extra units called in by police already chasing
    police_patrols = false,       -- police that cruise after a wanted player
    police_pull_overs = false,    -- police that wait for a wanted player to pull over
    roadblocks = false,
    swat_vans = false,
    swat_helicopters = false,
    army = false,
    ambulances = false,           -- ambulances that turn up when someone's hurt
    fire_engines = false,         -- fire engines that turn up to fires
    gangs = false,                -- gang members that respond to shooting in their area
}

-- How often, in seconds, these settings are applied again, in case GTA or another resource changes them.
Config.ReapplySeconds = 1.0

-- Update checks are controlled in server.cfg for every Pigeon Studios resource at once:
--     set pigeon_update_check "on"      (default)  |  "quiet"  |  "off"
