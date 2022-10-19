function onSongStart()

    noteTweenX('a1', 0, 734, 7, 'linear') -- opponent's left arrow
	noteTweenX('a2', 1, 844, 7, 'linear') -- opponent's down arrow
	noteTweenX('a3', 3, 1069, 7, 'linear') -- opponent's up arrow
	noteTweenX('a4', 2, 954, 7, 'linear') -- opponent's right arrow
	noteTweenX('a5', 4, 94, 7, 'linear') -- player's left arrow
	noteTweenX('a6', 5, 204, 7, 'linear') -- player's down arrow
	noteTweenX('a7', 6, 314, 7, 'linear') -- player's up arrow
	noteTweenX('a8', 7, 429, 7, 'linear') -- player's right arrow

	noteTweenAngle("XD1", 1, 360, 7, "linear") -- opponent's down arrow
	noteTweenAngle("XD2", 0, 360, 7, "linear") -- opponent's left arrow
	noteTweenAngle("XD3", 2, -360, 7, "linear") -- opponent's up arrow
	noteTweenAngle("XD4", 3, -360, 7, "linear") -- opponent's right arrow
	noteTweenAngle("XD5", 5, 360, 7, "linear") -- player's down arrow
	noteTweenAngle("XD6", 4, 360, 7, "linear") -- player's left arrow
	noteTweenAngle("XD7", 6, -360, 7, "linear") -- player's up arrow
	noteTweenAngle("XD8", 7, -360, 7, "linear") -- player's right arrow

    if middlescroll then
        noteTweenX('a1', 0, -200, 7, 'linear') -- opponent's left arrow
        noteTweenX('a2', 1, -290, 7, 'linear') -- opponent's down arrow
        noteTweenX('a3', 3, -100, 7, 'linear') -- opponent's up arrow
        noteTweenX('a4', 2, -600, 7, 'linear') -- opponent's right arrow
        noteTweenX('a5', 4, 430, 7, 'linear') -- player's left arrow
        noteTweenX('a6', 5, 547, 7, 'linear') -- player's down arrow
        noteTweenX('a7', 6, 660, 7, 'linear') -- player's up arrow
        noteTweenX('a8', 7, 775, 7, 'linear') -- player's right arrow
    end    

end

function onUpdatePost()

    P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') *        getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)

    P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)

    setProperty('iconP1.x',P1Mult - 110)

    setProperty('iconP1.origin.x',240)

    setProperty('iconP1.flipX',true)

    setProperty('iconP2.x',P2Mult + 110)

    setProperty('iconP2.origin.x',-100)

    setProperty('iconP2.flipX',true)

    setProperty('healthBar.flipX',true)

end

function onStepHit()

    if curStep == 599 then 

        doTweenX('ghost2TweenX1', 'ghost2', -500, 1, 'linear')
        doTweenX('ghost1TweenX1', 'ghost1', 1000, 1, 'linear')

    end    
end

function onUpdate(elapsed)
    if curStep >= 599 then
        songPos = getSongPosition()
        local currentBeat = (songPos/5000)*(curBpm/60)
        noteTweenY('defaultOpponentStrumY0', 0, defaultPlayerStrumY0 - 50*math.sin((currentBeat+0*0.25)*math.pi), 0.5)
        noteTweenY('defaultOpponentStrumY1', 1, defaultPlayerStrumY1 - 50*math.sin((currentBeat+1*0.25)*math.pi), 0.5)
        noteTweenY('defaultOpponentStrumY2', 2, defaultPlayerStrumY2 - 50*math.sin((currentBeat+2*0.25)*math.pi), 0.5)
        noteTweenY('defaultOpponentStrumY3', 3, defaultPlayerStrumY3 - 50*math.sin((currentBeat+3*0.25)*math.pi), 0.5)
        noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - 50*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
        noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - 50*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
        noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - 50*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
        noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - 50*math.sin((currentBeat+7*0.25)*math.pi), 0.5)
    end
end
                -- Script made by Washo789, please, if you use it or modify it, I would like you to give me credits.
				
local xx = 520; -- Code to change the position of the camera to the left or right for your opponent, Less = Left (They can be negative numbers), More = Right
local yy = 900; -- Code to change the position of the camera up or down for the enemy Less = Down (They can be negative numbers), More = Up
local xx2 = 300; -- Same code as above, but for boyfriend left, right
local yy2 = 1190; -- Same code as above, but for boyfriend up, down
local xx3 = 720; -- Same code as above, but for girlfriend left, right
local yy3 = 900; -- Same code as above, but for girlfriend, up, down
local ofs = 35; -- Code to adjust the intensity with which the camera moves, the more numbers, the more intense, and the fewer numbers, less intense
local followchars = true; -- This code is necessary for the script to work, don't even think about deleting it!
local del = 0;
local del2 = 0;

function onUpdate() -- The Main Code
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then -- Code for the camera to follow the poses of your opponent
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if gfSection == true then -- The camera follows GF when she sings, only when the "GF Section" option in the chart editor is activated. 
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then -- Credits to Serebeat and company for their Slaybells mod,
                    triggerEvent('Camera Follow Pos',xx3-ofs,yy3)              -- That's where I got the gf code from.
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
				end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                end
            end
        else
                 -- Code for the camera to follow the poses of boyfriend
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','') -- Self explanatory
    end
    
end

    
