-- Generated from template

if CAddonRRRGameMode == nil then
	CAddonRRRGameMode = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
	PrecacheItemByNameSync("item_rrr_rock", context)
	PrecacheItemByNameSync("item_rrr_club", context)
	PrecacheItemByNameSync("item_rrr_spear", context)
	PrecacheItemByNameSync("item_rrr_grenade", context)
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CAddonRRRGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

function CAddonRRRGameMode:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
	GameRules:GetGameModeEntity():SetCustomGameForceHero('npc_dota_hero_riki')
	GameRules:GetGameModeEntity():SetAlwaysShowPlayerInventory(true)
	GameRules:SetHeroRespawnEnabled(false)
	GameRules:SetCustomGameSetupAutoLaunchDelay(0)
end

-- Evaluate the state of the game
function CAddonRRRGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end