local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local Intro = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Logo = Instance.new("ImageLabel")
local WelcomeText = Instance.new("TextLabel")
local BlurEffect = Instance.new("BlurEffect")
local ProgressBar = Instance.new("Frame")
local ProgressFill = Instance.new("Frame")

Intro.Name = "XKHubIntro"
Intro.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
Intro.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = Intro
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BackgroundTransparency = 1
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 250)  

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

BlurEffect.Name = "IntroBlur"
BlurEffect.Parent = Lighting
BlurEffect.Size = 0

Logo.Name = "Logo"
Logo.Parent = MainFrame
Logo.AnchorPoint = Vector2.new(0.5, 0.5)
Logo.BackgroundTransparency = 1
Logo.Position = UDim2.new(0.5, 0, 0.4, 0)
Logo.Size = UDim2.new(0, 120, 0, 120) 
Logo.Image = "rbxassetid://124382926972686"
Logo.ImageTransparency = 1
Logo.ScaleType = Enum.ScaleType.Fit

local Circle = Instance.new("UICorner")
Circle.CornerRadius = UDim.new(1, 0)
Circle.Parent = Logo

WelcomeText.Name = "WelcomeText"
WelcomeText.Parent = MainFrame
WelcomeText.AnchorPoint = Vector2.new(0.5, 0)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Position = UDim2.new(0.5, 0, 0.65, 0)
WelcomeText.Size = UDim2.new(0.9, 0, 0, 40)  
WelcomeText.Font = Enum.Font.GothamSemibold
WelcomeText.Text = "『砂狼 Hub』加载中..."
WelcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeText.TextScaled = true
WelcomeText.TextTransparency = 1

ProgressBar.Name = "ProgressBar"
ProgressBar.Parent = MainFrame
ProgressBar.AnchorPoint = Vector2.new(0.5, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ProgressBar.BackgroundTransparency = 1
ProgressBar.Position = UDim2.new(0.5, 0, 0.85, 0)
ProgressBar.Size = UDim2.new(0.8, 0, 0, 4)  

local ProgressCorner = Instance.new("UICorner")
ProgressCorner.CornerRadius = UDim.new(1, 0)
ProgressCorner.Parent = ProgressBar

ProgressFill.Name = "ProgressFill"
ProgressFill.Parent = ProgressBar
ProgressFill.BackgroundColor3 = Color3.fromRGB(100, 0, 255)
ProgressFill.Size = UDim2.new(0, 0, 1, 0)

local ProgressFillCorner = Instance.new("UICorner")
ProgressFillCorner.CornerRadius = UDim.new(1, 0)
ProgressFillCorner.Parent = ProgressFill

local function AnimateIntro()
    local function CreateTween(obj, properties, duration, style, direction)
        style = style or Enum.EasingStyle.Quad
        direction = direction or Enum.EasingDirection.Out
        return TweenService:Create(obj, TweenInfo.new(duration, style, direction), properties)
    end
   
    task.wait(0.3)
 
    CreateTween(BlurEffect, {Size = 16}, 1, Enum.EasingStyle.Quad):Play()  
    CreateTween(MainFrame, {BackgroundTransparency = 0}, 1):Play()
    CreateTween(Logo, {ImageTransparency = 0}, 1):Play()
    CreateTween(WelcomeText, {TextTransparency = 0}, 1):Play()
    
    task.wait(0.8)
    CreateTween(ProgressBar, {BackgroundTransparency = 0}, 0.3):Play()
    CreateTween(ProgressFill, {Size = UDim2.new(1, 0, 1, 0)}, 2, Enum.EasingStyle.Quad):Play()

    task.wait(2.2)

    CreateTween(MainFrame, {BackgroundTransparency = 1}, 1):Play()
    CreateTween(Logo, {ImageTransparency = 1}, 1):Play()
    CreateTween(WelcomeText, {TextTransparency = 1}, 1):Play()
    CreateTween(ProgressBar, {BackgroundTransparency = 1}, 1):Play()
    CreateTween(ProgressFill, {BackgroundTransparency = 1}, 1):Play()
    CreateTween(BlurEffect, {Size = 0}, 1, Enum.EasingStyle.Quad):Play()
    
    task.wait(1)
    BlurEffect:Destroy()
    Intro:Destroy()
end

AnimateIntro()