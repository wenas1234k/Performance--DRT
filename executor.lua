--[[
    🚀 PROJECT: ULTRA GALAXY MAXIMUM ALAM SEMESTA
    👤 OWNER: WENAS1234K (SPYDER MAN BAPAK)
    🛠️ HUB: MASTER EXECUTOR LOADER
--]]

local function SystemMsg(text)
    print("🌌 [GALAXY-LOADER]: " .. text)
end

print("-------------------------------------------")
SystemMsg("CONNECTING TO WENAS1234K REPO...")
task.wait(0.3)

-- Base URL Raw GitHub lo
local baseUrl = "https://raw.githubusercontent.com/wenas1234k/Performance--DRT/main/"

-- List Files
local modules = {
    ["Quantum FPS"] = "Quantum-FPS-Unlocker",
    ["Vulkan Overdrive"] = "Galaxy-Vulkan-Overdrive-NoDelay.lua",
    ["Nexus Optimizer"] = "Delta-Ultra-Galaxy-Nexus-Optimizer.lua"
}

-- Loader Function
for name, file in pairs(modules) do
    SystemMsg("Injecting " .. name .. "...")
    local success, err = pcall(function()
        loadstring(game:HttpGet(baseUrl .. file))()
    end)
    if not success then
        SystemMsg("Failed to load " .. name .. ": " .. tostring(err))
    end
    task.wait(0.2)
end

print("-------------------------------------------")
SystemMsg("ULTRA GALAXY ALAM SEMESTA FULLY LOADED!")
SystemMsg("🕸️ SPYDER MAN BAPAK VERSION ONLINE")
print("-------------------------------------------")
