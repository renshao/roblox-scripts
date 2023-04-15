-- Called when a player joined the game
game.Players.PlayerAdded:Connect(function(player)
	-- Character loading can take some time after player joins. 'CharacterAdded' event is fired
    -- when the character is loaded
	player.CharacterAdded:Connect(function(character)
		-- Change jump power to 50
        character.Humanoid.UseJumpPower = true
		character.Humanoid.JumpPower = 50

        -- Change walk speed to 30 studs/second
        character.Humanoid.WalkSpeed = 30
	end)
end)
