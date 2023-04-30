local mod = get_mod("UltraStubber")



--[[
Mod: Ultra Stubber
Description: Changes the Heavy Stubber for Ogryn to shoot lasers. Does NOT affect gameplay, this is purely cosmetic!
Author: Seph, a.k.a. Concoction of Constitution
]]

-- Hook into weapon sounds and modify the heavy stubber to play lasgun audio.
-- Source: 
--      https://github.com/Aussiemon/Darktide-Source-Code/blob/4cd2fae4d6d248cb76751e7e4df386abaf8f2b62/scripts/settings/sound/player_character_sound_event_aliases.lua




mod:hook_require("scripts/settings/sound/player_character_sound_event_aliases", function(events)
    --"Ranged Shooting" is a looping sound event. This can only be properly replaced with another looping sound (I.e. Autogun sounds)
    -- To replace the sound, find the sound event for the weapon in ranged_shooting in the source code above, and replace the %s with "play" or "stop" respectively.
    -- As this is a looping sound event, it needs both a start and stop in order to work right. If there is no stop, the audio will continue playing forever.
    -- m1, m2, and m3 are MKV, MKIV, MKVII respectively. You can make each MK have different sounds, but not visuals.
    events.play_ranged_shooting.events.ogryn_heavystubber_p1_m1 = "wwise/events/weapon/play_lasgun_p3_m3_fire_auto"
    events.stop_ranged_shooting.events.ogryn_heavystubber_p1_m1 = "wwise/events/weapon/stop_lasgun_p3_m3_fire_auto"
    events.play_ranged_shooting.events.ogryn_heavystubber_p1_m2 = "wwise/events/weapon/play_lasgun_p3_m3_fire_auto"
    events.stop_ranged_shooting.events.ogryn_heavystubber_p1_m2 = "wwise/events/weapon/stop_lasgun_p3_m3_fire_auto"
    events.play_ranged_shooting.events.ogryn_heavystubber_p1_m3 = "wwise/events/weapon/play_lasgun_p3_m3_fire_auto"
    events.stop_ranged_shooting.events.ogryn_heavystubber_p1_m3 = "wwise/events/weapon/stop_lasgun_p3_m3_fire_auto"
    -- Same thing, but for when you're bracing the stubber, or "Aiming in". The above code is only for hip firing.
    -- Yes, that does mean you can have seperate sound effects for hip fire and brace fire ;]
    events.play_ranged_braced_shooting.events.ogryn_heavystubber_p1_m1 = "wwise/events/weapon/play_lasgun_p3_m3_fire_auto"
    events.stop_ranged_braced_shooting.events.ogryn_heavystubber_p1_m1 = "wwise/events/weapon/stop_lasgun_p3_m3_fire_auto"
    events.play_ranged_braced_shooting.events.ogryn_heavystubber_p1_m2 = "wwise/events/weapon/play_lasgun_p3_m3_fire_auto"
    events.stop_ranged_braced_shooting.events.ogryn_heavystubber_p1_m2 = "wwise/events/weapon/stop_lasgun_p3_m3_fire_auto"
    events.play_ranged_braced_shooting.events.ogryn_heavystubber_p1_m3 = "wwise/events/weapon/play_lasgun_p3_m3_fire_auto"
    events.stop_ranged_braced_shooting.events.ogryn_heavystubber_p1_m3 = "wwise/events/weapon/stop_lasgun_p3_m3_fire_auto"
    -- "Pre loop shot" is the first burst fire that the stubber "Tap firing". This applies to both hip- and brace firing.
    -- Replaceable with any non-looping sound event.
    events.ranged_pre_loop_shot.events.ogryn_heavystubber_p1_m1 = "wwise/events/weapon/play_lasgun_p3_m2_fire_single"
    events.ranged_pre_loop_shot.events.ogryn_heavystubber_p1_m2 = "wwise/events/weapon/play_lasgun_p3_m2_fire_single"
    events.ranged_pre_loop_shot.events.ogryn_heavystubber_p1_m3 = "wwise/events/weapon/play_lasgun_p3_m2_fire_single"
    -- Critical shot is, you guessed it, the sound it makes when you fire a critical shot.
    -- As the stubber by default does not have its own critical shot sound, I just made a reference to it anyways.
    -- Replaceable with any non-looping sound event.
    --[[if mod:get("allow_plasma_crits") then
        events.critical_shot_extra.events.ogryn_heavystubber_p1_m1 = "wwise/events/weapon/play_weapon_plasmagun_charged"
        events.critical_shot_extra.events.ogryn_heavystubber_p1_m2 = "wwise/events/weapon/play_weapon_plasmagun_charged"
        events.critical_shot_extra.events.ogryn_heavystubber_p1_m3 = "wwise/events/weapon/play_weapon_plasmagun_charged"
    else]]
    events.critical_shot_extra.events.ogryn_heavystubber_p1_m1 = "wwise/events/weapon/play_indicator_crit"
    events.critical_shot_extra.events.ogryn_heavystubber_p1_m2 = "wwise/events/weapon/play_indicator_crit"
    events.critical_shot_extra.events.ogryn_heavystubber_p1_m3 = "wwise/events/weapon/play_indicator_crit"
    --end
end)

-- Todo: Make laser size scale with Blaze Away buff.




-- This is the actual visual FX of the bullet.
-- Source:
--      https://github.com/Aussiemon/Darktide-Source-Code/blob/master/scripts/settings/effects/player_line_effects.lua


    

mod:hook_require("scripts/settings/effects/player_line_effects", function(line_effects)
    -- Sound effect of the "bullet" as it flies through the air.
    -- Replaceable with any non-looping sound event.
    line_effects.heavy_stubber_bullet.sfx = "wwise/events/weapon/play_weapon_lasgun_crack_beam_nearby_husk"
    -- Visual effect of non-crit "bullets". This is where you change your bullet to be a laser, plasma, pellet, etc.
    -- Replaceable with other line effect vfx found in the source above.
    line_effects.heavy_stubber_bullet.vfx = "content/fx/particles/weapons/rifles/lasgun/lasgun_beam"
    -- The size of the "bullet". Default stubber bullet size is around 0.1
    line_effects.heavy_stubber_bullet.vfx_width = 0.25
    -- Visual effect, but for a critical shot.
    --if mod:get("allow_plasma_crits") then
    --    line_effects.heavy_stubber_bullet.vfx_crit = "content/fx/particles/weapons/rifles/plasma_gun/plasma_beam"
    --else
    line_effects.heavy_stubber_bullet.vfx_crit = "content/fx/particles/weapons/rifles/lasgun/lasgun_beam_crit"
    --end
    -- This is the visual effect accompanies the shot itself. E.g. the electrical crackle of the laser, the smoke from a plasma shot, tracer rounds, etc.
    line_effects.heavy_stubber_bullet.emitters.vfx.default = "content/fx/particles/weapons/rifles/lasgun/lasgun_crit_trail"
    line_effects.heavy_stubber_bullet.emitters.vfx.start = "content/fx/particles/weapons/rifles/lasgun/lasgun_crit_trail"
    -- This is the 'density' of the vfx emitter. From what I gather, this effects the intensity of the emitter, scaling up as the number goes to zero.
    -- In other words, setting this to 0.1 will produce massive electrical crackles/heavy plasma smoke when you shoot, whereas 5 is the default, normal visual.
    line_effects.heavy_stubber_bullet.emitters.interval.distance = 7
    -- Distance offset between emitter effects. Default 0.
    line_effects.heavy_stubber_bullet.emitters.interval.increase = 0
    --[[
    if mod:get("allow_plasma_crits") then
        -- Same thing as above, just for crits.
        line_effects.heavy_stubber_bullet.emitters_crit.vfx.default = "content/fx/particles/weapons/rifles/plasma_gun/plasma_beam_linger"
        line_effects.heavy_stubber_bullet.emitters_crit.vfx.start = "content/fx/particles/weapons/rifles/plasma_gun/plasma_beam_linger"
        line_effects.heavy_stubber_bullet.emitters_crit.interval.distance = 5
        line_effects.heavy_stubber_bullet.emitters_crit.interval.increase = 0
    else]]
    line_effects.heavy_stubber_bullet.emitters_crit.vfx.default = "content/fx/particles/weapons/rifles/lasgun/lasgun_crit_trail"
    line_effects.heavy_stubber_bullet.emitters_crit.vfx.start = "content/fx/particles/weapons/rifles/lasgun/lasgun_crit_trail"
    line_effects.heavy_stubber_bullet.emitters_crit.interval.distance = 4
    line_effects.heavy_stubber_bullet.emitters_crit.interval.increase = 0
    --end
end)

-- Scale size and intensity of shots with blessings that stack, such as Blaze Away.
local prevStep = 0
local LineEffects = require("scripts/settings/effects/player_line_effects")
mod:hook("SteppedStatBuff", "stat_buff_stacking_count", function(original_func, ...)
    local step = original_func(...)
    if prevStep ~= step and mod:get("allow_size_scaling") then
        --mod:echo(LineEffects.heavy_stubber_bullet.vfx_width)
        if step == 0 then
            LineEffects.heavy_stubber_bullet.vfx_width = 0.25
            LineEffects.heavy_stubber_bullet.emitters.interval.distance = 7
        elseif step > 3 then
            LineEffects.heavy_stubber_bullet.vfx_width = 1
            LineEffects.heavy_stubber_bullet.emitters.interval.distance = 4
        elseif step > 1 then
            LineEffects.heavy_stubber_bullet.vfx_width = 0.5
            LineEffects.heavy_stubber_bullet.emitters.interval.distance = 6
        end
    end
    prevStep = step
    return step
  end)