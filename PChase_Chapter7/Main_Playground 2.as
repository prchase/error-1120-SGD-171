﻿package 
		var score:uint;
		var collisionHasOccurred:Boolean;
		var playerHasApple:Boolean;
			score = 0;
			collisionHasOccurred = false;
			playerHasApple = false;
			
			enemy.stop();
			if(event.keyCode == Keyboard.SPACE && player.hitTestObject(apple))
			{
				if(!playerHasApple)
				{
					player.addChild(apple);
					apple.x = 0;
					apple.y = 0;
					playerHasApple = true;
				}
				else
				{
					stage.addChild(apple);
					apple.x = player.x;
					apple.y = player.y;
					playerHasApple = false;
					if(enemy.hitTestObject(apple))
					{
						messageDisplay.text = "THANKS!!";
					}
				}
			}
			
			if(player.hitTestObject(enemy))
			{
				enemy.gotoAndStop(2);
				health.meter.width--;
				if(! collisionHasOccurred)
				{
					score++;
					messageDisplay.text = String(score);
					collisionHasOccurred = true;
				
				}
			}
			else
			{
				enemy.gotoAndStop(1);
				collisionHasOccurred = false;
			}
			if(health.meter.width < 1)
			{
				messageDisplay.text = "GAME OVER!";
			}
			if(score >= 5)
			{
				messageDisplay.text = "YOU WON!";
			}
			
			if(player.hitTestObject(wall))
			{
				player.x -= vx;
				player.y -= vy;
			}
			