package {	import flash.display.MovieClip;	import flash.events.KeyboardEvent;	import flash.ui.Keyboard;	import flash.events.Event;	public class Main_Playground extends MovieClip	{		var vx:int;		var vy:int;
		var score:uint;
		var collisionHasOccurred:Boolean;
		var playerHasApple:Boolean;		public function Main_Playground()		{			init();		}		function init():void		{						vx = 0;			vy = 0;
			score = 0;
			collisionHasOccurred = false;
			playerHasApple = false;
			
			enemy.stop();						stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);			addEventListener(Event.ENTER_FRAME, onEnterFrame);		}		function onKeyDown(event:KeyboardEvent):void		{			if (event.keyCode == Keyboard.LEFT)			{				vx = -5;			}			else if (event.keyCode == Keyboard.RIGHT)			{				vx = 5;			}			else if (event.keyCode == Keyboard.UP)			{				vy = -5;			}			else if (event.keyCode == Keyboard.DOWN)			{				vy = 5;			}
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
			}		}		function onKeyUp(event:KeyboardEvent):void		{			if (event.keyCode == Keyboard.LEFT || event.keyCode == Keyboard.RIGHT)			{				vx = 0;			}			else if (event.keyCode == Keyboard.DOWN || event.keyCode == Keyboard.UP)			{				vy = 0;			}		}		function onEnterFrame(event:Event):void		{						player.x += vx;			player.y+=vy;
			
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
					}	}}