-- Set the size of the grid
local gridSize = 20

-- Initialize the snake
local snake = {
    {x = 3, y = 1},
    {x = 2, y = 1},
    {x = 1, y = 1}
}

-- Initialize the direction of the snake
local direction = "right"

-- Initialize the food position
local food = {
    x = math.random(gridSize),
    y = math.random(gridSize)
}

-- Function to check if a position is inside the grid
local function insideGrid(pos)
    return pos.x >= 1 and pos.x <= gridSize and pos.y >= 1 and pos.y <= gridSize
end

-- Function to draw the grid
local function drawGrid()
    for y = 1, gridSize do
        for x = 1, gridSize do
            local isSnake = false
            for _, segment in ipairs(snake) do
                if segment.x == x and segment.y == y then
                    io.write("# ")
                    isSnake = true
                    break
                end
            end
            if not isSnake then
                if x == food.x and y == food.y then
                    io.write("X ")
                else
                    io.write(". ")
                end
            end
        end
        print()
    end
end

-- Function to update the game state
local function update()
    -- Move the snake
    local head = snake[1]
    local newHead = {x = head.x, y = head.y}
    if direction == "up" then
        newHead.y = newHead.y - 1
    elseif direction == "down" then
        newHead.y = newHead.y + 1
    elseif direction == "left" then
        newHead.x = newHead.x - 1
    elseif direction == "right" then
        newHead.x = newHead.x + 1
    end

    -- Check if snake eats food
    if newHead.x == food.x and newHead.y == food.y then
        table.insert(snake, 1, newHead)
        food.x = math.random(gridSize)
        food.y = math.random(gridSize)
    else
        table.insert(snake, 1, newHead)
        table.remove(snake)
    end

    -- Check if the game is over
    if not insideGrid(newHead) then
        return false
    end
    for i = 2, #snake do
        if newHead.x == snake[i].x and newHead.y == snake[i].y then
            return false
        end
    end
    return true
end

-- Main game loop
while true do
    -- Draw the grid
    drawGrid()

    -- Update the game state
    if not update() then
        print("Game Over")
        break
    end

    -- Take input for the direction
    io.write("Enter direction (up/down/left/right): ")
    local newDirection = io.read()
    if newDirection == "up" and direction ~= "down" then
        direction = "up"
    elseif newDirection == "down" and direction ~= "up" then
        direction = "down"
    elseif newDirection == "left" and direction ~= "right" then
        direction = "left"
    elseif newDirection == "right" and direction ~= "left" then
        direction = "right"
    end
end