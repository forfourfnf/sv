local window = 0
local a = 0
local start_Rock_Num = 2
local end_Rock_Num = 12
local tracer = 1
local rock_Stuff = {
    0
}
local CUR_SECTION = 0

function start (song)
    makeSprite("bruh", "TextBox", -700, 450, 1) 
	makeText('textobj', 'Immortals Division',-730, 455, 32)
	makeText('uobj', 'Composer: Antark', -730, 503, 32)
    print("Song: " .. song .. " @ " .. bpm .. " downscroll: " .. downscroll)
    
    window = 240

    for i=start_Rock_Num, end_Rock_Num do
        local actor_Name = "undefinedSprite" .. tostring(i)

        table.insert(rock_Stuff, getActorY(actor_Name))
    end
end

function update(elapsed)
    CUR_SECTION = math.floor(curBeat / 4)
    a = a + (elapsed * 1.5)
    setActorPos(-400 + ((math.cos(a) * 2) * window), -2450 + (math.sin(2 * a) * window), "dadCharacter0")
	setActorPos(-700 + ((math.cos(a + 1) * 2) * window), -2450 + (math.sin(2 * (a + 1)) * window), "dadCharacter1")
    setActorPos(400 + ((math.cos(a) * 2) * window), -2450 + (math.sin(-2 * a) * window), "bfCharacter0")
	setActorPos(700 + ((math.cos(a + 1) * 2) * window), -2450 + (math.sin(-2 * (a + 1)) * window), "bfCharacter1")
    for i=start_Rock_Num, end_Rock_Num do
        local actor_Name = "undefinedSprite" .. tostring(i)
        
        setActorPos(getActorX(actor_Name), rock_Stuff[i] + (math.sin(2 * (a + i)) * 80), actor_Name)
    end
    setActorPos(getActorX('boyfriend') - 200, getActorY('boyfriend') + 200, "bf_rock")
    setActorPos(getActorX('girlfriend') - 10, getActorY('girlfriend') + 575, "gf_rock")
end
function txt(elapsed)
    if curStep == 70 then
		setActorAlpha(0, "bruh")
		setActorAlpha(0, "textobj")
		setActorAlpha(0, "uobj")
	end
end
print("Mod Chart script loaded :)")