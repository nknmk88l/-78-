local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()


local Window = WindUI:CreateWindow({
    Title = "<font color='#FF66CC'>打开/点开shenm阿尔法脚本</font>",
    
    -- ↓ Optional. You can remove it.
    --[[ You can set 'rbxassetid://' or video to Background.
        'rbxassetid://':
            Background = "rbxassetid://", -- rbxassetid
        Video:
            Background = "video:YOUR-RAW-LINK-TO-VIDEO.webm", -- video 
    --]]
    
    -- ↓ Optional. You can remove it.
    Size = UDim2.fromOffset(100, 50),
        Transparent = true,
        Theme = "Light",
        User = {
            Enabled = true,
            Callback = function() print("clicked") end,
            Anonymous = false
        }
    
    --       remove this all, 
    -- !  ↓  if you DON'T need the key system
    KeySystem = { 
        -- ↓ Optional. You can remove it.
        Key = { "shenmi阿尔法NB" },
        
        Note = "请输入免费密钥.",
        
        -- ↓ Optional. You can remove it.
        Thumbnail = {
            Image = "rbxassetid://114457723265156",
            Title = "",
        },
        
        -- ↓ Optional. You can remove it.
        
        
        -- ↓ Optional. You can remove it.
        SaveKey = false, -- automatically save and load the key.
        
        -- ↓ Optional. You can remove it.
        -- API = {} ← Services. Read about it below ↓
    },
})

Window:Tag({
    Title = "此为shenmi阿尔法",
    Color = Color3.fromHex("#30ff6a"),
   })
   
   
   WindUI:Notify({
    Title = "shenmi阿尔法脚本通知",
    Content = "shenmi阿尔法脚本禁止倒卖",
    Duration = 10, -- 10 seconds
    Icon = "bird",
})

WindUI:Notify({
    Title = "shenmi阿尔法脚本通知",
    Content = "shenmi阿尔法由额叉鹅制作组制作",
    Duration = 10, -- 10 seconds
    Icon = "bird",
})

local Tab = Window:Tab({
    Title = "shenmi阿尔法脚本公告",
    Icon = "layout-grid",
    Locked = false,
})

local Paragraph = Tab:Paragraph({
    Title = "欢迎使用shenm阿尔法脚本",
    Desc = "QQ群2群1074218782 ",
    Image = "rbxassetid://81583956354615",
    ImageSize = 42,
    Thumbnail = "rbxassetid://103506480252017",
    ThumbnailSize = 0,
    
local Tabs = {
    Main = Window:Section({ Title = "基础", Opened = true }),
    Settings = Window:Section({ Title = "服务器", Opened = true }),
    Utilities = Window:Section({ Title = "设置", Opened = true })
} 

local Tab = Tabs.Main:Tab({
    Title = "通用",
    Icon = "layout-grid",
    Locked = false,
    
local Slider = Tab:Slider({
    Title = "跳跃",
    Value = {
        Min = 50,
        Max = 200,
        Default = 50,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = value
        end
    end
})

local Slider = Tab:Slider({
    Title = "移速",
    Value = {
        Min = 16,
        Max = 400,
        Default = 16,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = value
        end
    end
})

local Slider = Tab:Slider({
    Title = "重力",
    Value = {
        Min = 0.1,
        Max = 500.0,
        Default = 196.2,
    },
    Step = 0.1,
    Callback = function(value)
        game.Workspace.Gravity = value
    end
})

local Button = Tab:Button({
    Title = "shenmi飞行",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nknmk88l/-78-/refs/heads/main/飞行源码.lua"))()
    end
