print("AWOOOOOOOOOO")
local frame = CreateFrame("Frame")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:RegisterEvent("CHAT_MSG_SAY")
frame:RegisterEvent("CHAT_MSG_YELL")
frame:RegisterEvent("CHAT_MSG_WHISPER")
frame:RegisterEvent("CHAT_MSG_PARTY")
frame:RegisterEvent("CHAT_MSG_GUILD")
frame:RegisterEvent("CHAT_MSG_RAID")
frame:RegisterEvent("CHAT_MSG_RAID_WARNING")

local function playEzPzSound()
    local chance = math.random(1, 10)
    if chance == 1 then
        PlaySoundFile("Interface\\AddOns\\EzPz\\ezpz1.mp3", "Master")
    elseif chance == 2 then
        PlaySoundFile("Interface\\AddOns\\EzPz\\ezpz2.mp3", "Master")
    elseif chance == 3 then
        PlaySoundFile("Interface\\AddOns\\EzPz\\ezpz3.mp3", "Master")
    elseif chance == 4 then
        PlaySoundFile("Interface\\AddOns\\EzPz\\ezpz4.mp3", "Master")
    elseif chance == 5 then
        PlaySoundFile("Interface\\AddOns\\EzPz\\ezpz5.mp3", "Master")
    elseif chance == 6 then
        PlaySoundFile("Interface\\AddOns\\EzPz\\ezpz6.mp3", "Master")
    elseif chance == 7 then
        PlaySoundFile("Interface\\AddOns\\EzPz\\ezpz7.mp3", "Master")
    elseif chance == 8 then
        PlaySoundFile("Interface\\AddOns\\EzPz\\ezpz8.mp3", "Master")
    elseif chance == 9 then
        PlaySoundFile("Interface\\AddOns\\EzPz\\ezpz9.mp3", "Master")
    else
        PlaySoundFile("Interface\\AddOns\\EzPz\\ezpz10.mp3", "Master")
    end
end

local function OnEvent(self, event, ...)
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local timestamp, subevent, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, spellID, spellName, _, amount, overkill, school, resisted, blocked, absorbed, critical = CombatLogGetCurrentEventInfo()
        if subevent == "SPELL_DAMAGE" or subevent == "RANGE_DAMAGE" or subevent == "SWING_DAMAGE" then
            if critical and sourceGUID == UnitGUID("player") then
                local chance = math.random(1, 10)
                if chance <= 9 then
                    playEzPzSound()
                else
                    PlaySoundFile("Interface\\AddOns\\EzPz\\coyote.mp3", "Master")
                end
            end
        end
    elseif event == "CHAT_MSG_SAY" or event == "CHAT_MSG_YELL" or event == "CHAT_MSG_WHISPER" or event == "CHAT_MSG_PARTY" or event == "CHAT_MSG_GUILD" or event == "CHAT_MSG_RAID" or event == "CHAT_MSG_RAID_WARNING" or event == "CHAT_MSG_BATTLEGROUND" then
        local message, sender = ...

        if string.find(message, "EZPZ") then
            playEzPzSound()
        elseif string.find(message, "AWOO") then
            PlaySoundFile("Interface\\AddOns\\EzPz\\coyote.mp3", "Master")
        end
    end
end

frame:SetScript("OnEvent", OnEvent)