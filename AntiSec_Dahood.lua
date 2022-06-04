local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/cat"))() --you can go into the github link and copy all of it and modify it for yourself.
--Library.theme.accentcolor = Color3.new(20, 79, 13)--
local Window = Library:CreateWindow("AntiSec - DaHood", Vector2.new(492, 598), Enum.KeyCode.RightControl) --you can change your UI keybind
local AimingTab = Window:CreateTab("Aiming") --you can rename this tab to whatever you want --you can also change the tabs code, for example "AimingTab" can be changed to "FunnyCoolTab" etc.

local testSection = AimingTab:CreateSector("Legit", "left")  --you can  change the section code, for example "testsection" can be changed to "FunnyCoolSection" etc.

local camlock = testSection:AddButton("Camlock (Q)", function(State)
    getgenv().Prediction = 0.15038	
getgenv().AimPart = "HumanoidRootPart"	
getgenv().Key = "Q"	
getgenv().DisableKey = ""	
	
getgenv().FOV = true	
getgenv().ShowFOV = false	
getgenv().FOVSize = 55	
	
--// Variables (Service)	
	
local Players = game:GetService("Players")	
local RS = game:GetService("RunService")	
local WS = game:GetService("Workspace")	
local GS = game:GetService("GuiService")	
local SG = game:GetService("StarterGui")	
	
--// Variables (regular)	
	
local LP = Players.LocalPlayer	
local Mouse = LP:GetMouse()	
local Camera = WS.CurrentCamera	
local GetGuiInset = GS.GetGuiInset	
	
local AimlockState = true	
local Locked	
local Victim	
	
local SelectedKey = getgenv().Key	
local SelectedDisableKey = getgenv().DisableKey	
	
--// Notification function	
	
function Notify(tx)	
    SG:SetCore("SendNotification", {	
        Title = "Camlock",	
        Text = tx,	
Duration = 5	
    })	
end	
	
--// Check if aimlock is loaded	
	
if getgenv().Loaded == true then	
    Notify("Aimlock is already loaded")	
    return	
end	
	
getgenv().Loaded = true	
	
--// FOV Circle	
	
local fov = Drawing.new("Circle")	
fov.Filled = false	
fov.Transparency = 1	
fov.Thickness = 1	
fov.Color = Color3.fromRGB(255, 255, 0)	
fov.NumSides = 1000	
	
--// Functions	
	
function update()	
    if getgenv().FOV == true then	
        if fov then	
fov.Radius = getgenv().FOVSize * 2	
            fov.Visible = getgenv().ShowFOV	
fov.Position = Vector2.new(Mouse.X, Mouse.Y + GetGuiInset(GS).Y)	
	
            return fov	
        end	
    end	
end	
	
function WTVP(arg)	
    return Camera:WorldToViewportPoint(arg)	
end	
	
function WTSP(arg)	
    return Camera.WorldToScreenPoint(Camera, arg)	
end	
	
function getClosest()	
    local closestPlayer	
    local shortestDistance = math.huge	
	
    for i, v in pairs(game.Players:GetPlayers()) do	
        local notKO = v.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true	
        local notGrabbed = v.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil	
        	
if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild(getgenv().AimPart) and notKO and notGrabbed then	
            local pos = Camera:WorldToViewportPoint(v.Character.PrimaryPart.Position)	
local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude	
            	
            if (getgenv().FOV) then	
                if (fov.Radius > magnitude and magnitude < shortestDistance) then	
                    closestPlayer = v	
                    shortestDistance = magnitude	
                end	
            else	
                if (magnitude < shortestDistance) then	
                    closestPlayer = v	
                    shortestDistance = magnitude	
                end	
            end	
        end	
    end	
    return closestPlayer	
end	
	
--// Checks if key is down	
	
Mouse.KeyDown:Connect(function(k)	
    SelectedKey = SelectedKey:lower()	
    SelectedDisableKey = SelectedDisableKey:lower()	
    if k == SelectedKey then	
        if AimlockState == true then	
            Locked = not Locked	
            if Locked then	
                Victim = getClosest()	
	
                Notify("Locked onto: "..tostring(Victim.Character.Humanoid.DisplayName))	
            else	
                if Victim ~= nil then	
                    Victim = nil	
	
                    Notify("Unlocked!")	
                end	
            end	
        else	
            Notify("Aimlock is not enabled!")	
        end	
    end	
    if k == SelectedDisableKey then	
        AimlockState = not AimlockState	
    end	
end)	
	
--// Loop update FOV and loop camera lock onto target	
	
RS.RenderStepped:Connect(function()	
    update()	
    if AimlockState == true then	
        if Victim ~= nil then	
            Camera.CFrame = CFrame.new(Camera.CFrame.p, Victim.Character[getgenv().AimPart].Position + Victim.Character[getgenv().AimPart].Velocity*getgenv().Prediction)	
        end	
    end	
end)	
	while wait() do
        if getgenv().AutoPrediction == true then	
        local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()	
        local split = string.split(pingvalue,'(')	
local ping = tonumber(split[1])	
if ping < 225 then	
getgenv().Prediction = 1.4	
elseif ping < 215 then	
getgenv().Prediction = 1.2	
	elseif ping < 205 then
getgenv().Prediction = 1.0	
	elseif ping < 190 then
getgenv().Prediction = 0.10	
elseif ping < 180 then	
getgenv().Prediction = 0.12	
	elseif ping < 170 then
getgenv().Prediction = 0.15	
	elseif ping < 160 then
getgenv().Prediction = 0.18	
	elseif ping < 150 then
getgenv().Prediction = 0.110	
elseif ping < 140 then	
getgenv().Prediction = 0.113	
elseif ping < 130 then	
getgenv().Prediction = 0.116	
elseif ping < 120 then	
getgenv().Prediction = 0.120	
elseif ping < 110 then	
getgenv().Prediction = 0.124	
elseif ping < 105 then	
getgenv().Prediction = 0.127	
elseif ping < 90 then	
getgenv().Prediction = 0.130	
elseif ping < 80 then	
getgenv().Prediction = 0.133	
elseif ping < 70 then	
getgenv().Prediction = 0.136	
elseif ping < 60 then	
getgenv().Prediction = 0.140	
elseif ping < 50 then	
getgenv().Prediction = 0.143	
elseif ping < 40 then	
getgenv().Prediction = 0.145	
elseif ping < 30 then	
getgenv().Prediction = 0.155	
elseif ping < 20 then	
getgenv().Prediction = 0.157	
        end	
        end	
	end
    game.StarterGui:SetCore("SendNotification", {
        Title = "AntiSec";
        Text = "Camlock Enabled";
        Icon = "rbxassetid://9800336437";
        Duration = "5";
        callbakc = bindableFunction;
    })
end)



testSection:AddTextbox("Prediction", 0, function(State)

end)

testSection:AddTextbox("Smoothness", 0, function(State)

end)


testSection:AddToggle("Show FOV", false, function(first)
    print("Aimbot FOV Enabled.")
end)

testSection:AddToggle("Wall Check", false, function(first)
    print("Wall Check Enabled.")
end)

testSection:AddToggle("Knocked Check", false, function(first)
    print("Knocked Check Enabled.")
end)

testSection:AddToggle("Grabbed Check", false, function(first)
    print("Grabbed Check Enabled.")
end)

testSection:AddToggle("Nearest Distance", false, function(first)
    print("Nearest Distance Enabled.")
end)

testSection:AddDropdown("Hitbox", {"Head", "UpperTorso", "HumanoidRootPart", "Penis "}, "", true, function(dropdown)

end)

local testSection = AimingTab:CreateSector("Legit Silent Aim", "left")

testSection:AddToggle("Silent Aim", false, function(bool)
end)


testSection:AddToggle("Show FOV", false, function(first)
    print("Silent Aim FOV Enabled.")
end)

testSection:AddToggle("Wall Check", false, function(first)
    print("Wall Check Enabled.")
end)

testSection:AddToggle("Nearest Distance", false, function(first)
    print("Nearest Distance Enabled.")
end)

testSection:AddToggle("Knocked Check", false, function(first)
    print("Knocked Check Enabled.")
end)

testSection:AddToggle("Grabbed Check", false, function(first)
    print("Grabbed Check Enabled.")
end)

testSection:AddDropdown("Hitbox", {"Head", "UpperTorso", "HumanoidRootPart", "Penis "}, "", true, function(dropdown)


local testSection = AimingTab:CreateSector("FOV Settings", "right")

testSection:AddToggle("Filled FOV", false, function(first)
    print("FOV Filled.")
end)


testSection:AddSlider("Camlock FOV", 0, 50, 1000, 1, function(State)

end)

testSection:AddSlider("Silent Aim FOV", 0, 50, 1000, 1, function(State)

end)

testSection:AddSlider("FOV Transparency", 0, 10, 10, 1, function(State)

end)

local testSection = AimingTab:CreateSector("Silent Aim Settings", "right")

testSection:AddToggle("Manual Prediction", false, function(first)
    print("Manual Prediction Enabled.")
end)

testSection:AddTextbox("Prediction", 0, function(State)
    
    testSection:AddToggle("Hit Chance", false, function(first)
        print("Hit Chance Enabled.")
    end)
    testSection:AddSlider("Hit Chance", 0, 10, 100, 1, function(State)

end)
end)
end)

local RAGETab = Window:CreateTab("Blatant")

local RAGESection = RAGETab:CreateSector("Silent Aimlock", "left")

RAGESection:AddToggle("Silent Aimlock", false, function(first)
    print("Silent Aimlock Enabled.")
end)

RAGESection:AddToggle("Auto Prediction", false, function(first)
    print("Auto Prediction Enabled.")
end)

RAGESection:AddToggle("Manual Prediction", false, function(first)
    print("Manual Prediction Enabled.")
end)

RAGESection:AddTextbox("Prediction", 0, function(State)
    
end)

RAGESection:AddDropdown("Hitbox", {"Head", "UpperTorso", "HumanoidRootPart", "Penis "}, "", true, function(dropdown)

end)

RAGESection:AddDropdown("Aim Type", {"Dot Lock", "HitBox Lock", "Tracer Lock", "Nothing "}, "", true, function(dropdown)

end)

RAGESection:AddToggle("Show FOV", false, function(first)
    print("FOV Enabled.")
end)

RAGESection:AddSlider("FOV", 0, 50, 1000, 1, function(State)

end)

local ESPTab = Window:CreateTab("Visuals")

local ESPSection = ESPTab:CreateSector("ESP", "left")

ESPSection:AddToggle("ESP", false, function(first)
    print("ESP Enabled.")
end)

ESPSection:AddToggle("Box ESP", false, function(first)
    print("Box ESP Enabled.")
end)

ESPSection:AddToggle("Tracer ESP", false, function(first)
    print("Tracer ESP Enabled.")
end)

ESPSection:AddToggle("Name ESP", false, function(first)
    print("Name ESP Enabled.")
end)

ESPSection:AddToggle("Health ESP", false, function(first)
    print("Health ESP Enabled.")
end)

ESPSection:AddToggle("Armor ESP", false, function(first)
    print("Armor ESP Enabled.")
end)

ESPSection:AddToggle("Wall Check", false, function(first)
    print("ESP Wall Check Enabled.")
end)




local MiscTab = Window:CreateTab("Misc")

local MiscSection = MiscTab:CreateSector("Main", "left")



local Fly = MiscSection:AddButton("Fly", function(State)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/fly.lua"))()
    game.StarterGui:SetCore("SendNotification", {
        Title = "AntiSec";
        Text = "Fly keybind is X.";
        Icon = "rbxassetid://9800336437";
        Duration = "5";
        callbakc = bindableFunction;
    })
end)

local nojumpcooldown = MiscSection:AddButton("No jump cooldown", function(State)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/no-jump-cooldown.lua'))()
    game.StarterGui:SetCore("SendNotification", {
        Title = "AntiSec";
        Text = "Anti Jump Cooldown Enabled";
        Icon = "rbxassetid://9800336437";
        Duration = "5";
        callbakc = bindableFunction;
    })
end)

local antifog = MiscSection:AddButton("No Fog", function(State)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tibosity/call-all/main/antifog.lua",true))()
    game.StarterGui:SetCore("SendNotification", {
        Title = "AntiSec";
        Text = "Anti Fog Enabled";
        Icon = "rbxassetid://9800336437";
        Duration = "5";
        callbakc = bindableFunction;
    })
end)

local call = MiscSection:AddButton("Call All :trollface:", function(State)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tibosity/call-all/main/call.lua",true))()
    game.StarterGui:SetCore("SendNotification", {
        Title = "AntiSec";
        Text = "Called Everyone :trollface:";
        Icon = "rbxassetid://9800336437";
        Duration = "5";
        callbakc = bindableFunction;
    })
end)

local lowGFX = MiscSection:AddButton("Low GFX", function(State)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tibosity/call-all/main/lowGFX.lua",true))()
    game.StarterGui:SetCore("SendNotification", {
        Title = "AntiSec";
        Text = "Low GFX Enabled";
        Icon = "rbxassetid://9800336437";
        Duration = "5";
        callbakc = bindableFunction;
    })
end) 

local Chat = MiscSection:AddButton("Chat Spy", function(State)
    --chatspy NOT made by me!
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tibosity/Scripts/main/chatspy.lua",true))()
    game.StarterGui:SetCore("SendNotification", {
        Title = "AntiSec";
        Text = "Chat Spy Enabled";
        Icon = "rbxassetid://9800336437";
        Duration = "5";
        callbakc = bindableFunction;
    })
end)

local Speed = MiscSection:AddButton("Speed Glitch (Q)", function(State)
    plr = game:GetService('Players').LocalPlayer
down = true
 
function onButton1Down(mouse)
    down = true
    while down do
        if not down then break end
        local char = plr.Character
        char.HumanoidRootPart.Velocity = char.HumanoidRootPart.CFrame.lookVector * 190
        wait()
    end
end
 
function onButton1Up(mouse)
    down = false
end
 
function onSelected(mouse)
    mouse.KeyDown:connect(function(q) if q:lower()=="q"then onButton1Down(mouse)end end)
    mouse.KeyUp:connect(function(q) if q:lower()=="q"then onButton1Up(mouse)end end)
end
onSelected(game.Players.LocalPlayer:GetMouse())
game.StarterGui:SetCore("SendNotification",{
			Title = "Keybind is Q";
			Text = "AntiSec";
			Icon = "rbxassetid://9800336437";
			Duration = 5;
		})
        game.StarterGui:SetCore("SendNotification", {
        callbakc = bindableFunction;
    })
end)

local Chat = MiscSection:AddButton("Headless and Korblox", function(State)
    game.Players.LocalPlayer.Character.Head.Transparency = 1
game.Players.LocalPlayer.Character.Head.Transparency = 1
for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
if (v:IsA("Decal")) then
v.Transparency = 1
end
end
---------------HeadLess Above-----------------------------
---------------NON FE -----------------------------
---------------Korblox Below-----------------------------
local ply = game.Players.LocalPlayer
local chr = ply.Character
chr.RightLowerLeg.MeshId = "902942093"
chr.RightLowerLeg.Transparency = "1"
chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
chr.RightFoot.MeshId = "902942089"
chr.RightFoot.Transparency = "1" 
    game.StarterGui:SetCore("SendNotification", {
        Title = "AntiSec";
        Text = "Headless and Korblox Enabled THIS IS ONLY VISIBLE ON YOUR SCREEN";
        Icon = "rbxassetid://9800336437";
        Duration = "10";
        callbakc = bindableFunction;
    })
end)

local pingfps = MiscSection:AddButton("Show FPS and Ping (ui)", function(State)
    
local StatusBar = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Ping = Instance.new("TextLabel")
local FPS = Instance.new("TextLabel")
local YourPosition = Instance.new("TextLabel")
local Health = Instance.new("TextLabel")
local Spawntime = Instance.new("TextLabel")
--Properties:
StatusBar.Name = "StatusBar"
StatusBar.Parent = game.CoreGui
StatusBar.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = StatusBar
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BackgroundTransparency = 1
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 200, 0, -36)
Frame.Size = UDim2.new(0.725000024, 0, 0, 34)
Frame.ZIndex = 100

Ping.Name = "Ping"
Ping.Parent = Frame
Ping.BackgroundColor3 = Color3.new(0.00392157, 0.00392157, 0.00392157)
Ping.BackgroundTransparency = 1
Ping.Size = UDim2.new(0.200000003, 0, 0, 34)
Ping.SizeConstraint = Enum.SizeConstraint.RelativeXX
Ping.Font = Enum.Font.SourceSans
Ping.Text = "Ping: nil"
Ping.TextColor3 = Color3.new(1, 1, 1)
Ping.TextSize = 40
Ping.TextWrapped = true

FPS.Name = "FPS"
FPS.Parent = Frame
FPS.BackgroundColor3 = Color3.new(1, 1, 1)
FPS.BackgroundTransparency = 1
FPS.Position = UDim2.new(0.200000003, 0, 0, 0)
FPS.Size = UDim2.new(0.200000003, 0, 0, 34)
FPS.SizeConstraint = Enum.SizeConstraint.RelativeXX
FPS.Font = Enum.Font.SourceSans
FPS.Text = "FPS: nil"
FPS.TextColor3 = Color3.new(1, 1, 1)
FPS.TextSize = 40
FPS.TextWrapped = true

YourPosition.Name = "YourPosition"
YourPosition.Parent = Frame
YourPosition.BackgroundColor3 = Color3.new(1, 1, 1)
YourPosition.BackgroundTransparency = 1
YourPosition.Position = UDim2.new(0.400000006, 0, 0, 0)
YourPosition.Size = UDim2.new(0.200000003, 0, 0, 34)
YourPosition.SizeConstraint = Enum.SizeConstraint.RelativeXX
YourPosition.Font = Enum.Font.SourceSans
YourPosition.Text = "Position: nil,nil,nil"
YourPosition.TextColor3 = Color3.new(1, 1, 1)
YourPosition.TextSize = 30
YourPosition.TextWrapped = true

Health.Name = "Health"
Health.Parent = Frame
Health.BackgroundColor3 = Color3.new(1, 1, 1)
Health.BackgroundTransparency = 1
Health.Position = UDim2.new(0.600000024, 0, 0, 0)
Health.Size = UDim2.new(0.200000003, 0, 0, 34)
Health.SizeConstraint = Enum.SizeConstraint.RelativeXX
Health.Font = Enum.Font.SourceSans
Health.Text = "Health: nil"
Health.TextColor3 = Color3.new(1, 1, 1)
Health.TextSize = 30

Spawntime.Name = "Spawntime"
Spawntime.Parent = Frame
Spawntime.BackgroundColor3 = Color3.new(1, 1, 1)
Spawntime.BackgroundTransparency = 1
Spawntime.Position = UDim2.new(0.800000012, 0, 0, 0)
Spawntime.Size = UDim2.new(0.200000003, 0, 0, 34)
Spawntime.SizeConstraint = Enum.SizeConstraint.RelativeXX
Spawntime.Font = Enum.Font.SourceSans
Spawntime.Text = "Seconds since spawn: nil"
Spawntime.TextColor3 = Color3.new(1, 1, 1)
Spawntime.TextSize = 20
-- Scripts:
function SCRIPT_NDMS87_FAKESCRIPT() -- Frame.LocalScript 
	local script = Instance.new('LocalScript')
	script.Parent = Frame
	repeat wait() until game:IsLoaded()
	wait(1)
	local labels = script.Parent
	
	function round(n)
	    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
	end
	
	function setsize()
	local x = workspace.CurrentCamera.ViewportSize.X - 375
	local old = script.Parent.Size
	script.Parent.Size = UDim2.new(0, x, 0, old.Y.Offset)
	end
	setsize()
	workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
	setsize()
	end)
	spawntime = os.time()
	game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
	spawntime = os.time()
	end)
	local plr = game:GetService("Players").LocalPlayer
	game:GetService("RunService").RenderStepped:Connect(function()
		local pos = plr.Character.HumanoidRootPart.CFrame.Position
		local health = plr.Character:FindFirstChildOfClass("Humanoid").Health
		labels.Ping.Text = "Ping: " ..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
		labels.FPS.Text = "FPS: " .. fps
		labels.YourPosition.Text = "Position: " .. round(pos.x) .. ", " .. round(pos.y) .. ", " .. round(pos.z)
		labels.Health.Text = "Health: " .. tostring(health)
		labels.Spawntime.Text = "Seconds since spawn: " ..os.time() - spawntime
	end)
	while wait() do
		fps = round(2/wait())
	end

end
coroutine.resume(coroutine.create(SCRIPT_NDMS87_FAKESCRIPT))
    game.StarterGui:SetCore("SendNotification", {
        Title = "AntiSec";
        Text = "FPS and Ping ui Enabled";
        Icon = "rbxassetid://9800336437";
        Duration = "5";
        callbakc = bindableFunction;
    })
end)

local NoDelay = MiscSection:AddButton("No Bullet Delay", function(State)
    local ReplicatedStorage = game.ReplicatedStorage
local Network = game.Network
local Delay = ReplicatedStorage.BulletHole.Delay

Delay.Position:Destroy()
Delay.Position = 0
    game.StarterGui:SetCore("SendNotification", {
        Title = "AntiSec";
        Text = "No Bullet Delay Enabled";
        Icon = "rbxassetid://9800336437";
        Duration = "5";
        callbakc = bindableFunction;
    })
end) 

local recoil = MiscSection:AddButton("No Recoil", function(State)
    local CurrentFocus = game:GetService("Workspace").CurrentCamera.CFrame
    game:GetService("Workspace").CurrentCamera:Destroy()
    local Instance = Instance.new("Camera", game:GetService("Workspace"))
    Instance.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
    Instance.CameraType = Enum.CameraType.Custom
    Instance.CFrame = CurrentFocus
    game.StarterGui:SetCore("SendNotification", {
        Title = "AntiSec";
        Text = "No Recoil Enabled";
        Icon = "rbxassetid://9800336437";
        Duration = "5";
        callbakc = bindableFunction;
    })
end)

local Pack = MiscSection:AddButton("Animation Pack", function(State)
     -- // clone
     for _, v in next, game:GetService("CoreGui"):GetChildren() do
        if (v.Name:match("FreeAnimationPack")) then
            v:Destroy()
        end
    end

    -- // Instances
    local FreeAnimationPack = Instance.new("ScreenGui")
    local AnimationPack = Instance.new("TextButton")
    local Animations = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local Lean = Instance.new("TextButton")
    local Lay = Instance.new("TextButton")
    local Dance1 = Instance.new("TextButton")
    local Dance2 = Instance.new("TextButton")
    local Greet = Instance.new("TextButton")
    local ChestPump = Instance.new("TextButton")
    local Praying = Instance.new("TextButton")
    local Stop = Instance.new("TextButton")
    local UniversalAnimation = Instance.new("Animation")

    -- // Utility
    function stopTracks()
        for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
            if (v.Animation.AnimationId:match("rbxassetid")) then
                v:Stop()
            end
        end
    end

    function loadAnimation(id)
        if UniversalAnimation.AnimationId == id then
            stopTracks()
            UniversalAnimation.AnimationId = "1"
        else
            UniversalAnimation.AnimationId = id
            local animationTrack = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(UniversalAnimation)
            animationTrack:Play()
        end
    end


    FreeAnimationPack.Name = "FreeAnimationPack"
    FreeAnimationPack.Parent = game.CoreGui
    FreeAnimationPack.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    AnimationPack.Name = "AnimationPack"
    AnimationPack.Parent = FreeAnimationPack
    AnimationPack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    AnimationPack.BorderSizePixel = 0
    AnimationPack.Position = UDim2.new(0, 0, 0.388007045, 0)
    AnimationPack.Size = UDim2.new(0, 100, 0, 20)
    AnimationPack.Font = Enum.Font.SourceSansBold
    AnimationPack.Text = "Animations"
    AnimationPack.TextColor3 = Color3.fromRGB(0, 0, 0)
    AnimationPack.TextSize = 18.000
    AnimationPack.MouseButton1Click:Connect(function()
        if (Animations.Visible == false) then
            Animations.Visible = true
        end
    end)

    Animations.Name = "Animations"
    Animations.Parent = AnimationPack
    Animations.Active = true
    Animations.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
    Animations.Position = UDim2.new(-0.104712225, 0, -1.54173493, 0)
    Animations.Size = UDim2.new(0, 120, 0, 195)
    Animations.Visible = false
    Animations.CanvasPosition = Vector2.new(0, 60.0000305)
    Animations.CanvasSize = UDim2.new(0, 0, 1, 235)

    UIListLayout.Parent = Animations
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 2)

    Lean.Name = "Lean"
    Lean.Parent = Animations
    Lean.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Lean.Size = UDim2.new(1, 0, 0, 30)
    Lean.Font = Enum.Font.SourceSansBold
    Lean.Text = "Lean"
    Lean.TextColor3 = Color3.fromRGB(0, 0, 0)
    Lean.TextSize = 14.000
    Lean.MouseButton1Click:Connect(function()
        stopTracks()
        loadAnimation("rbxassetid://3152375249")
    end)

    Lay.Name = "Lay"
    Lay.Parent = Animations
    Lay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Lay.Size = UDim2.new(1, 0, 0, 30)
    Lay.Font = Enum.Font.SourceSansBold
    Lay.Text = "Lay"
    Lay.TextColor3 = Color3.fromRGB(0, 0, 0)
    Lay.TextSize = 14.000
    Lay.MouseButton1Click:Connect(function()
        stopTracks()
        loadAnimation("rbxassetid://3152378852")
    end)

    Dance1.Name = "Dance1"
    Dance1.Parent = Animations
    Dance1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dance1.Size = UDim2.new(1, 0, 0, 30)
    Dance1.Font = Enum.Font.SourceSansBold
    Dance1.Text = "Dance1"
    Dance1.TextColor3 = Color3.fromRGB(0, 0, 0)
    Dance1.TextSize = 14.000
    Dance1.MouseButton1Click:Connect(function()
        stopTracks()
        loadAnimation("rbxassetid://3189773368")
    end)

    Dance2.Name = "Dance2"
    Dance2.Parent = Animations
    Dance2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dance2.Size = UDim2.new(1, 0, 0, 30)
    Dance2.Font = Enum.Font.SourceSansBold
    Dance2.Text = "Dance2"
    Dance2.TextColor3 = Color3.fromRGB(0, 0, 0)
    Dance2.TextSize = 14.000
    Dance2.MouseButton1Click:Connect(function()
        stopTracks()
        loadAnimation("rbxassetid://3189776546")
    end)

    Greet.Name = "Greet"
    Greet.Parent = Animations
    Greet.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Greet.Size = UDim2.new(1, 0, 0, 30)
    Greet.Font = Enum.Font.SourceSansBold
    Greet.Text = "Greet"
    Greet.TextColor3 = Color3.fromRGB(0, 0, 0)
    Greet.TextSize = 14.000
    Greet.MouseButton1Click:Connect(function()
        stopTracks()
        loadAnimation("rbxassetid://3189777795")
    end)

    ChestPump.Name = "ChestPump"
    ChestPump.Parent = Animations
    ChestPump.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ChestPump.Size = UDim2.new(1, 0, 0, 30)
    ChestPump.Font = Enum.Font.SourceSansBold
    ChestPump.Text = "Chest Pump"
    ChestPump.TextColor3 = Color3.fromRGB(0, 0, 0)
    ChestPump.TextSize = 14.000
    ChestPump.MouseButton1Click:Connect(function()
        stopTracks()
        loadAnimation("rbxassetid://3189779152")
    end)

    Praying.Name = "Praying"
    Praying.Parent = Animations
    Praying.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Praying.Size = UDim2.new(1, 0, 0, 30)
    Praying.Font = Enum.Font.SourceSansBold
    Praying.Text = "Praying"
    Praying.TextColor3 = Color3.fromRGB(0, 0, 0)
    Praying.TextSize = 14.000
    Praying.MouseButton1Click:Connect(function()
        stopTracks()
        loadAnimation("rbxassetid://3487719500")
    end)

    Stop.Name = "Stop"
    Stop.Parent = Animations
    Stop.BackgroundColor3 = Color3.fromRGB(255, 112, 112)
    Stop.Size = UDim2.new(1, 0, 0, 30)
    Stop.Font = Enum.Font.SourceSansBold
    Stop.Text = "Stop Animation"
    Stop.TextColor3 = Color3.fromRGB(0, 0, 0)
    Stop.TextSize = 14.000
    Stop.MouseButton1Click:Connect(function()
        stopTracks()
    end)
    --close gui
    local plr = game.Players.LocalPlayer

    plr:GetMouse().KeyDown:Connect(function(K)
        if K == "p" then
            Animations.Visible = false
        end
    end)
warn("loaded")
    game.StarterGui:SetCore("SendNotification", {
        Title = "AntiSec";
        Text = "Animation Pack Loaded";
        Icon = "rbxassetid://9800336437";
        Duration = "5";
        callbakc = bindableFunction;
    })
end)

local GodTab = Window:CreateTab("God Stuff")

local GodSection = GodTab:CreateSector("Main", "left")

local nojumpcooldown = MiscSection:AddButton("Godmode Guns", function(State)
    local localPlayer = game:GetService('Players').LocalPlayer;
    local localCharacter = localPlayer.Character;
    localCharacter:FindFirstChildOfClass('Humanoid').Health = 0;
    local newCharacter = localPlayer.CharacterAdded:Wait();
    local spoofFolder = Instance.new('Folder');
    spoofFolder.Name = 'FULLY_LOADED_CHAR';
    spoofFolder.Parent = newCharacter;
    newCharacter:WaitForChild('RagdollConstraints'):Destroy();
    local spoofValue = Instance.new('BoolValue', newCharacter);
    spoofValue.Name = 'RagdollConstraints';
    local name = game.Players.LocalPlayer.Name
    local lol =    game.Workspace:WaitForChild(name)
    local money = Instance.new("Folder",game.Players.LocalPlayer.Character);money.Name = "FULLY_LOADED_CHAR"
    lol.Parent = game.Workspace.Players
    game.Players.LocalPlayer.Character:WaitForChild("BodyEffects")
    game.Players.LocalPlayer.Character.BodyEffects.BreakingParts:Destroy()
    game.StarterGui:SetCore("SendNotification", {
        Title = "AntiSec";
        Text = "Godmode With Guns Enabled";
        Icon = "rbxassetid://9800336437";
        Duration = "5";
        callbakc = bindableFunction;
    })
end)

local nojumpcooldown = MiscSection:AddButton("Godmode Melee", function(State)
    local localPlayer = game:GetService('Players').LocalPlayer;
    local localCharacter = localPlayer.Character;
    localCharacter:FindFirstChildOfClass('Humanoid').Health = 0;
    local newCharacter = localPlayer.CharacterAdded:Wait();
    local spoofFolder = Instance.new('Folder');
    spoofFolder.Name = 'FULLY_LOADED_CHAR';
    spoofFolder.Parent = newCharacter;
    newCharacter:WaitForChild('BodyEffects').Dead:Destroy();
    local spoofValue = Instance.new('BoolValue', newCharacter.BodyEffects);
    spoofValue.Name = 'Dead';
    wait()
    --godblock/godbullet
    local ps = game:GetService("Players")
    local lp = ps.LocalPlayer
    local char = lp.Character

    char.BodyEffects.Armor:Destroy()
    char.BodyEffects.Defense:Destroy()

    local Clone1 = Instance.new("IntValue")
    Clone1.Name = "Armor"
    Clone1.Parent = char.BodyEffects

    local Clone2 = Instance.new("NumberValue")
    Clone2.Name = "Defense"
    Clone2.Parent = char.BodyEffects
    wait()
    --walspeed
    local d = {}
    local e = {}
    local g = {}
    local h = {}
    local j = {}
    local k = {}
    local function l()
        local m = 3
        local n = checkcaller
        local o = getrawmetatable(game)
        setreadonly(o, false)
        local p = o.__index
        local q = o.__newindex
        local r = o.__namecall
        o.__index =
            newcclosure(
                function(s, t)
                if n() then
                    return p(s, t)
                end
                if d[s] and d[s][t] then
                    local u = d[s][t]
                    if u["IsCallback"] == true then
                        return u["Value"](s)
                    else
                        return u["Value"]
                    end
                end
                if g[t] then
                    local v = g[t]
                    if v["IsCallback"] == true then
                        return v["Value"](s)
                    else
                        return v["Value"]
                    end
                end
                if j[s] and j[s][t] then
                    return k[s][t]
                end
                return p(s, t)
            end
            )
        o.__newindex =
            newcclosure(
                function(w, x, y)
                if n() then
                    return q(w, x, y)
                end
                if e[w] and e[w][x] then
                    local z = e[w][x]
                    if z["Callback"] == nil then
                        return
                    else
                        z["Callback"](w, y)
                        return
                    end
                end
                if h[x] then
                    local A = h[x]
                    if A["Callback"] == nil then
                        return
                    else
                        A["Callback"](w, y)
                        return
                    end
                end
                if j[w] and j[w][x] then
                    local B = j[w][x]
                    if type(y) ~= B["Type"] then
                        error("bad argument #3 to '" .. x .. "' (" .. B["Type"] .. " expected, got " .. type(x) .. ")")
                    end
                    k[w][x] = y
                    return
                end
                return q(w, x, y)
            end
            )
        local D = game.Players.LocalPlayer.Character.Humanoid
        local function A(_)
            local a0 = p(D, _)
            local a1 = type(a0)
            if not j[D] then
                j[D] = {}
            end
            if not k[D] then
                k[D] = {}
            end
            j[D][_] = {Type = a1}
            k[D][_] = p(D, _)
            local a2 = function()
                j[D][_] = nil
                k[D][_] = nil
            end
            return {remove = a2, Remove = a2}
        end
        A("WalkSpeed")
        A("JumpPower")
    end
    l()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 22
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    wait()
    while wait() do
        game.ReplicatedStorage.MainEvent:FireServer("Block", true)
        wait()
        for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
            if (v.Animation.AnimationId:match("rbxassetid://2788354405")) then
                v:Stop();
            end;
        end;
    end
    wait()
    while wait() do
        pcall(function()
            for i, v in pairs(game.Players:GetPlayers()) do
                if (workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude < 1 then
                    game.ReplicatedStorage.MainEvent:FireServer("Block", true)
                end
            end
        end)
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "AntiSec";
        Text = "Godmode With Melee Enabled";
        Icon = "rbxassetid://9800336437";
        Duration = "5";
        callbakc = bindableFunction;
    })
end)