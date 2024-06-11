PauseState = Class{__includes = BaseState}

function PauseState:init()
    stopMusic(sounds)
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('r') or love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('space') then 
        startMusic(sounds)

        gStateMachine:change('play')
    end
end
