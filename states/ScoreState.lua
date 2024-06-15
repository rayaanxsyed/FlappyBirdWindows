ScoreState = Class{__includes = BaseState}

function ScoreState:enter(params)
    self.score = params.score
    
    self.bronze = love.graphics.newImage('Bronze_Medal.png')
    self.silver = love.graphics.newImage('Silver_Medal.png')
    self.gold = love.graphics.newImage('Gold_Medal.png')
    self.platinum = love.graphics.newImage('Platinum.png')
end

function ScoreState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then 
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()

    love.graphics.setFont(flappyFont)
    love.graphics.printf('You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score),0,100, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press Enter to Play Again! ',0,160, VIRTUAL_WIDTH, 'center')

    local medal = nil
    local reward = nil

    if self.score >= 50 then 
        medal = self.platinum 
        reward = 'Platinum'
    elseif self.score >= 30 then 
        medal = self.gold
        reward = 'Gold'
    elseif self.score >= 15 then 
        medal = self.silver 
        reward = 'Silver'
    elseif self.score > 7 then 
        medal = self.bronze
        reward = 'Bronze'
    end

    if reward == 'Platinum' then 
        love.graphics.printf("Congratulations, you have been rewarded a " .. reward .. " medal for your mastery of Flappy Bird!", 0, 120, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(self.platinum, VIRTUAL_WIDTH /2 - 48, VIRTUAL_HEIGHT / 2 + 35 , 0, 0.2, 0.2)

    elseif reward == 'Silver' then 
        love.graphics.printf("Well done, you have been rewarded a  " .. reward .. " medal for your mastery of Flappy Bird!", 0, 120, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(self.silver, VIRTUAL_WIDTH /2 - 35, VIRTUAL_HEIGHT / 2 + 35, 0, 0.35, 0.35)

    elseif reward == 'Gold' then 
        love.graphics.printf("Well done, you have been rewarded a  " .. reward .. " medal for your mastery of Flappy Bird!", 0, 120, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(self.gold, VIRTUAL_WIDTH /2 - 40, VIRTUAL_HEIGHT / 2 + 40, 0, 0.070, 0.070)

    elseif reward ~= nil then 
        love.graphics.printf("Well done, you have been rewarded a " .. reward .. " medal", 0, 120, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(medal, VIRTUAL_WIDTH /2 - 20, VIRTUAL_HEIGHT / 2 + 35, 0, 0.035, 0.035)
    end
end