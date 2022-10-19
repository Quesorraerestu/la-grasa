function onCreate()

	makeLuaSprite('back', 'ms-pacman/pacfondoatras', -720, 300);
    addLuaSprite('back', false);

	makeLuaSprite('front', 'ms-pacman/pacfondoadelante', -800, 300);
    addLuaSprite('front', true); 

    makeAnimatedLuaSprite('ghost1', 'ms-pacman/ghosts1', 1800, 1100) -- posicion normal x = 1000
    addAnimationByPrefix('ghost1', 'bounce','fantasmas', 24, true);
    scaleObject('ghost1', 1.0, 1.0);
    addLuaSprite('ghost1', false);

    makeAnimatedLuaSprite('ghost2', 'ms-pacman/ghosts2', -1400, 1100) -- posicion normal x = -500 
    addAnimationByPrefix('ghost2', 'bounce','fantasmas', 24, true);
    scaleObject('ghost2', 1.0, 1.0);
    addLuaSprite('ghost2', false);

    makeLuaSprite('sisha', 'ms-pacman/pacsilla', 560, 900);
    addLuaSprite('sisha', false); 

    makeLuaSprite('bord1', 'ms-pacman/borde_1', 1, -20);
    addLuaSprite('bord1',false)
    setScrollFactor('bord1',0,0)
    setObjectCamera('bord1','hud')
    scaleObject('bord1', 0.5, 0.5);

    makeLuaSprite('bord2', 'ms-pacman/borde2', 1120, 20);
    addLuaSprite('bord2',false)
    setScrollFactor('bord2',0,0)
    setObjectCamera('bord2','hud')
    scaleObject('bord2', 0.5, 0.5);
    
    makeLuaSprite('cam', 'ms-pacman/paciluminacion', -500, -300);
    addLuaSprite('cam',false)
    setScrollFactor('cam',0,0)
    setObjectCamera('cam','hud')
    
	makeLuaSprite('bartop','',0,-30)
    makeGraphic('bartop',1381,100,'000000')
    addLuaSprite('bartop',true)
    setObjectCamera('bartop','hud')
    setScrollFactor('bartop',0,0)

    makeLuaSprite('barbot','',0,650)
    makeGraphic('barbot',1381,100,'000000')
    addLuaSprite('barbot',false)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')

    close(X)
end

function onBeatHit()

    objectPlayAnimation('ghost1', 'bounce', true)
    objectPlayAnimation('ghost2', 'bounce', true)
    
end    