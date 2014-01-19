-- ProbablyEngine Rotation Packager
-- Custom Blood Death Knight Rotation
-- Created on Dec 25th 2013 1:00 am
ProbablyEngine.rotation.register_custom(250, "bbBloodDeathKnight", {
-- PLAYER CONTROLLED: 
-- SUGGESTED TALENTS:
-- CONTROLS: Pause - Left Control, Death Grip Mouseover - Left Alt, Army of the Dead - Left Shift

-- COMBAT
	-- Rotation Utilities
	{ "pause", "modifier.lcontrol" },
	{ "pause", "@bbLib.bossMods" },
	{ "pause", { "toggle.pvpmode", "@bbLib.BGFlag" } },
	{ "/script TargetNearestEnemy()", { "toggle.autotarget", "!target.exists" } },
	{ "/script TargetNearestEnemy()", { "toggle.autotarget", "target.exists", "target.dead" } },
	
	-- BossMods
	{ "Dark Command", { "toggle.autotaunt", "@bbLib.bossTaunt" } },
	
	-- Racials
	{ "Stoneform", "player.health < 65" },
	{ "Every Man for Himself", "player.state.charm" },
	{ "Every Man for Himself", "player.state.fear" },
	{ "Every Man for Himself", "player.state.incapacitate" },
	{ "Every Man for Himself", "player.state.sleep" },
	{ "Every Man for Himself", "player.state.stun" },
	{ "Gift of the Naaru", "player.health < 70", "player" },
	{ "Escape Artist", "player.state.root" },
	{ "Escape Artist", "player.state.snare" },
	{ "Will of the Forsaken", "player.state.fear" },
	{ "Will of the Forsaken", "player.state.charm" },
	{ "Will of the Forsaken", "player.state.sleep" },

	-- Interrupts
	{ "Mind Freeze", "modifier.interrupts" },
	{ "Strangulate", "modifier.interrupts" },
	
	-- Off GCD
	{ "Death's Advance", "player.state.snare" },

	-- Buffs
	{ "Bone Shield", "!player.buff(Bone Shield)" },
	{ "Horn of Winter", "!player.buff(Horn of Winter).any" },
	
	-- Keybound Cooldowns
	{ "Death and Decay", "modifier.lshift", "ground" },
	{ "Army of the Dead", "modifier.rshift" },
	{ "Death Grip", { "modifier.lalt", "mouseover.threat < 100", "!target.spell(Death Strike).range", "!target.boss" }, "mouseover" },
	-- Chains of Ice Mouseover
	-- Anti-Magic Zone Ground
	-- Raise Dead
	-- Plague Leech Talent
	-- Blood Presence
	-- Death Coil at range and for heal
	
	-- Blood Tap
	{ "Blood Tap", { "player.buff(Blood Charge).count > 5", "player.runes(death).count < 2" } },
	
	-- Survival
	{ "#5512", { "modifier.cooldowns", "player.health < 40" } }, -- Healthstone (5512)
	{ "Anti-Magic Shell", { "player.health <= 70", "target.casting" } },
	{ "Dancing Rune Weapon", "player.health <= 75" },
	{ "Conversion", "player.health <= 60" }, -- Nobody should ever use this talent, but just in case.
	{ "Vampiric Blood", "player.health <= 55" },
	{ "Icebound Fortitude", { "modifier.cooldowns", "player.health <= 50" } },
	{ "Rune Tap", "player.health <= 40" },
	{ "Empower Rune Weapon", { "modifier.cooldowns", "player.health <= 40" } },
	{ "/cast Raise Dead\n/cast Death Pact", { "modifier.cooldowns", "player.health < 35", "player.spell(Death Pact).cooldown", "player.spell(Raise Dead).cooldown", "player.spell(Death Pact).usable" } },

	-- Diseases
	{ "Outbreak", "!target.debuff(Frost Fever)" },
	{ "Outbreak", "!target.debuff(Blood Plague)" },
	{ "Blood Boil", { "player.runes(blood).count > 1", "target.spell(Death Strike).range", "target.debuff(Frost Fever).duration < 3" } },
	{ "Blood Boil", { "player.runes(death).count > 1", "target.spell(Death Strike).range", "target.debuff(Blood Plague).duration < 3" } },  
	{ "Icy Touch", { "!target.debuff(Frost Fever)", "!player.spell(Outbreak).exists" },
	{ "Plague Strike", { "!target.debuff(Blood Plague)", "!player.spell(Outbreak).exists" },
	
	-- Rotation
	{ "Heart Strike", { "modifier.multitarget", "player.runes(blood).count > 0", "modifier.enemies < 4" } },
	{ "Pestilence", { "modifier.multitarget", "target.debuff(Blood Plague)", "target.debuff(Frost Fever)", "modifier.timeout(Pestilence, 30)", "modifier.enemies > 2", "!player.spell(Roiling Blood).exists" } },
	{ "Blood Boil", { "modifier.multitarget", "target.spell(Death Strike).range", "modifier.enemies > 3"  } },
	{ "Blood Boil", { "player.buff(Crimson Scourge)", "target.spell(Death Strike).range" } },
	{ "Death Strike" },
	{ "Soul Reaper", {"player.runes(blood).count > 0", "target.health < 35" } },
	{ "Heart Strike", "player.runes(blood).count > 0" },
	{ "Rune Strike", "player.runicpower > 40" },
	{ "Horn of Winter", "player.runicpower < 90" },
	{ "Blood Boil", { "!player.spell(Crimson Scourge)", "target.spell(Death Strike).range" } },
	
},{
-- OUT OF COMBAT ROTATION
	-- Buffs
	{ "Blood Presence", "!player.buff(Blood Presence)" },
	{ "Horn of Winter", "!player.buff(Horn of Winter).any" },
	{ "Path of Frost", { "!player.buff(Path of Frost).any", "player.mounted" } },
	{ "Bone Shield", "!player.buff(Bone Shield)" },

	-- Keybound Cooldowns
	{ "Army of the Dead", { "target.boss", "modifier.rshift" } },
	{ "Death Grip", "modifier.lalt" },
},
function ()
	ProbablyEngine.toggle.create('mouseovers', 'Interface\\Icons\\inv_pet_lilsmoky', 'Toggle Mouseovers', 'Automatically cast spells on mouseover targets')
	ProbablyEngine.toggle.create('pvpmode', 'Interface\\Icons\\achievement_pvp_o_h', 'PvP', 'Toggle the usage of PvP abilities.')
	ProbablyEngine.toggle.create('limitaoe', 'Interface\\Icons\\spell_fire_flameshock', 'Limit AoE', 'Toggle to avoid using CC breaking aoe effects.')
	ProbablyEngine.toggle.create('autotarget', 'Interface\\Icons\\ability_hunter_snipershot', 'Auto Target', 'Automaticaly target the nearest enemy when target dies or does not exist.')
	ProbablyEngine.toggle.create('autotaunt', 'Interface\\Icons\\spell_nature_reincarnation', 'Auto Taunt', 'Automaticaly taunt the boss at the appropriate stacks')
end)
