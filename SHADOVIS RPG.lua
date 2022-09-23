if game.PlaceId == 9585537847
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "AntiSec",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "experimental script hub made by putrid#0196"
}

local Tab = GUI:Tab{
	Name = "Main",
	Icon = "rbxassetid://8569322835"
}
getgenv().KillAura_BRUH = false
getgenv().KillAuraRange_BRUH = 25
getgenv().KillAuraAttack_BRUH = "Slash"
getgenv().KillAuraDelay_BRUH = 0

getgenv().AutoPickupItems_BRUH = false
getgenv().AutoPickupItemsNearby_BRUH = false
getgenv().AutoPickupItemsNearbyRange_BRUH = 35

getgenv().ShopToOpen_BRUH = "None"
getgenv().TextTransparency1_BRUH = 0

getgenv().KillAuraAddonTP_BRUH = false
getgenv().KillAuraAddonTPDelay_BRUH = 0.5

getgenv().AutoFarmMaster_BRUH = false
getgenv().AutoFarmDistance_BRUH = -5
getgenv().AboveOrBelow_BRUH = false
getgenv().AutoFarmKillAura_BRUH = false
getgenv().AutoFarmStayStill_BRUH = false

Tab:Button{
	Name = "Anti AFK",
	Description = nil,
	Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/Proxylol/OtherScripts/main/AntiAfk.lua'),true))()    
    end
}

Tab:Button{
	Name = "Collect All Cubits",
	Description = nil,
	Callback = function() 
local Cubits = game.Workspace["Client Cubits"]:GetChildren()

for _,v in ipairs(Cubits) do
	if v:FindFirstChildOfClass("ProximityPrompt") then
		local Prox = v:FindFirstChildOfClass("ProximityPrompt")
		fireproximityprompt(Prox)
	end
end
    end
}

GUI:Credit{
	Name = "Script Made By Putrid",
	Description = "Join Discord.gg/putrid",
	Discord = "putrid#0196"
}

local Tab = GUI:Tab{
	Name = "Player",
	Icon = "rbxassetid://10994977563"
}

Tab:Slider{
	Name = "Walkspeed",
	Default = 16,
	Min = 0,
	Max = 250,
	Increment = 1,ValueName = "",Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
}

Tab:Toggle{
	Name = "Anchor/Unanchor Self",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = not game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored
    end
}

