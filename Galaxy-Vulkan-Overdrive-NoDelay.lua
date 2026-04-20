--[[ 
    NAME: ULTRA PROMAX MAXIMUM GALAXY - VULKAN & MEMORY EDITION
    VERSION: SUPER WORK ALL GAME (BAPAK SPYDER MAN EDITION)
    FEATURES: FORCE VULKAN, SMALL MEMORY MODE, NO INPUT DELAY, ANTI-CRASH
--]]

print("🌌 INITIATING GALAXY VULKAN & MEMORY OVERDRIVE...")

local Settings = settings()
local RenderSettings = Settings.Rendering
local PhysicsSettings = Settings.Physics
local RunService = game:GetService("RunService")

-- // 1. FORCE VULKAN ENGINE (HARDCORE BYPASS) \\ --
-- Memaksa jalur render ke Vulkan API agar GPU Android bekerja maksimal
if setfflag then
    setfflag("FFlagDebugGraphicsVulkan", "true")
    setfflag("FFlagDebugGraphicsPreferVulkan", "true")
    setfflag("FFlagRenderVulkanSupport", "true")
    -- Menutup jalur render lama yang berat (OpenGL/D3D)
    setfflag("FFlagDebugGraphicsDisableOpenGL", "true")
    setfflag("FFlagDebugGraphicsDisableDirect3D11", "true")
end

-- // 2. ULTRA MEMORY OPTIMIZATION (ANTI FORCE CLOSE) \\ --
-- Memaksa penggunaan RAM ke titik paling rendah
RenderSettings.QualityLevel = 1
RenderSettings.SavedQualityLevel = Enum.SavedQualityLevel.QualityLevel1
RenderSettings.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level0

if setfflag then
    setfflag("FFlagRenderTextureCompositorMemoryControl", "true")
    setfflag("FIntRenderTextureCompositorMaximumMemory", "128") -- Batasi RAM tekstur
    setfflag("DFFlagTextureQualityOverride", "0") -- Tekstur terendah (Work All Game)
    setfflag("FFlagRenderFixTextureQualityCrashes", "true")
end

-- // 3. NO DELAY INPUT & PHYSICS (SUPER RESPONSIVE) \\ --
-- Mengurangi hambatan antara jempol lo dan eksekusi karakter
PhysicsSettings.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
PhysicsSettings.AllowSleep = true
PhysicsSettings.ThrottleAdjustTime = 0.000000001 -- Respon fisika instan

-- Unlock FPS agar pergerakan layar lebih sinkron dengan input
if setfpscap then
    setfpscap(999)
end

-- // 4. AGGRESSIVE OBJECT PURGE (CLEANER ALAM SEMESTA) \\ --
-- Menghapus semua sampah visual yang membebani memori dan GPU
local function SuperClean()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
            v.CastShadow = false -- Hapus bayangan per-objek (Super Work)
        elseif v:IsA("Texture") or v:IsA("Decal") then
            v:Destroy() -- Hapus gambar/stiker agar RAM lega
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("PostProcessEffect") then -- Bloom, Blur, SunRays dkk
            v.Enabled = false
        elseif v:IsA("Explosion") then
            v.Visible = false
        end
    end
end

-- Jalankan pembersihan saat script di-inject
if not game:IsLoaded() then game.Loaded:Wait() end
SuperClean()

-- Pantau objek baru agar tidak menambah beban RAM
game.DescendantAdded:Connect(function(obj)
    if obj:IsA("BasePart") then
        obj.CastShadow = false
        obj.Material = Enum.Material.Plastic
    elseif obj:IsA("Texture") or obj:IsA("Decal") then
        obj:Destroy()
    end
end)

-- // 5. CONSTANT RAM REFRESHER (SMOOTH NO STUTTER) \\ --
-- Membersihkan sampah memori secara agresif setiap 5 detik
task.spawn(function()
    while task.wait(5) do
        collectgarbage("collect")
        collectgarbage("setpause", 100)
        setfflag("FIntRenderShadowmapBias", "0") -- Memastikan bayangan tetap mati
    end
end)

print("⚡ STATUS: VULKAN & MEMORY SUPER WORK ACTIVE ⚡")
print("🕸️ SPYDER MAN BAPAK MODE: ON")
