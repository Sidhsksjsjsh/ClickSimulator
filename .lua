local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Teleport",
Icon = "rbxassetid://",
PremiumOnly = false
})

local egg = {}
local zone = {}
local World = {"Earth","Space"}
local TotalZone = {}

OrionLib:AddTable(game:GetService("ReplicatedStorage")["Assets"]["Eggs"],egg)
OrionLib:AddTable(workspace["Islands"],zone)

for i = 1,#zone do
      OrionLib:AddTable(i,TotalZone)
end

local function TPIsland(wo,nmbr,islnd)
game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["MapService"]["RF"]["RequestTeleport"]:InvokeServer(wo,nmbr)
game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["MapService"]["RF"]["SetIsland"]:InvokeServer(islnd)
game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["GetCurrentWorldMultiplier"]:InvokeServer()
end

T3:AddDropdown({
  Name = "Select World",
  Default = World[1],
  Options = World,
  Callback = function(Value)
   _G.w = Value
  end    
})

T3:AddDropdown({
  Name = "Select Island",
  Default = zone[1],
  Options = zone,
  Callback = function(Value)
   _G.i = Value
  end    
})

T3:AddDropdown({
  Name = "Select Number",
  Default = TotalZone[1],
  Options = TotalZone,
  Callback = function(Value)
   _G.tz = Value
  end    
})

T3:AddButton({
  Name = "Teleport To Selected Island [Number]",
  Callback = function()
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["MapService"]["RF"]["RequestTeleport"]:InvokeServer(_G.w,_G.tz)
  end    
})

T3:AddButton({
  Name = "Set Selected Island [Island]",
  Callback = function()
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["MapService"]["RF"]["SetIsland"]:InvokeServer(_G.i)
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["GetCurrentWorldMultiplier"]:InvokeServer()
  end    
})

T1:AddToggle({
Name = "Click",
Default = false,
Callback = function(Value)
_G.Click = Value
      while wait() do
        if _G.Click == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
      end
end    
})

T1:AddToggle({
Name = "Spin",
Default = false,
Callback = function(Value)
_G.spin = Value
      while wait() do
        if _G.spin == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["SpinWheelService"]["RF"]["RequestSpin"]:InvokeServer()
      end
end    
})

T1:AddToggle({
Name = "Rebirth",
Default = false,
Callback = function(Value)
_G.r = Value
      while wait() do
        if _G.r == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RebirthService"]["RF"]["RequestRebirth"]:InvokeServer(game.Players.LocalPlayer)
      end
end    
})

T1:AddToggle({
Name = "Claim Daily Gifts",
Default = false,
Callback = function(Value)
_G.dg = Value
      while wait() do
        if _G.dg == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["GiftsService"]["RF"]["RequestRedeemGift"]:InvokeServer(1)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["GiftsService"]["RF"]["RequestRedeemGift"]:InvokeServer(2)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["GiftsService"]["RF"]["RequestRedeemGift"]:InvokeServer(3)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["GiftsService"]["RF"]["RequestRedeemGift"]:InvokeServer(4)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["GiftsService"]["RF"]["RequestRedeemGift"]:InvokeServer(5)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["GiftsService"]["RF"]["RequestRedeemGift"]:InvokeServer(6)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["GiftsService"]["RF"]["RequestRedeemGift"]:InvokeServer(7)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["GiftsService"]["RF"]["RequestRedeemGift"]:InvokeServer(8)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["GiftsService"]["RF"]["RequestRedeemGift"]:InvokeServer(9)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["GiftsService"]["RF"]["RequestRedeemGift"]:InvokeServer(10)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["GiftsService"]["RF"]["RequestRedeemGift"]:InvokeServer(11)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["GiftsService"]["RF"]["RequestRedeemGift"]:InvokeServer(12)
      end
end    
})

T2:AddDropdown({
  Name = "Select Egg",
  Default = egg[1],
  Options = egg,
  Callback = function(Value)
   _G.EggName = Value
  end    
})

T2:AddToggle({
Name = "Hatch",
Default = false,
Callback = function(Value)
_G.ht = Value
      while wait() do
        if _G.ht == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["EggService"]["RF"]["OpenEgg"]:InvokeServer(_G.EggName,"Single")
      end
end    
})
