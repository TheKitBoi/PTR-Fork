function cutscene_gustavofail_end(argument0)
{
	var time = argument0
	timer++
	with (obj_gustavo)
		visible = false
	with (obj_player1)
	{
		xscale = -1
		sprite_index = spr_gustavo_pummel
		if !instance_exists(obj_slapstar)
		{
			instance_create(x - 20, y - 20, obj_slapstar)
			scr_soundeffect(sfx_pephurt)
			with instance_create(x - 20, y - 20, obj_smallnumber)
			{
				negative = 1
				number = "-50"
			}
			
			if global.collect != 0
			{
				repeat 10
					instance_create(x, y, obj_pizzaloss)
			}
			
			if global.collect > 50
				global.collect -= 50
			else
				global.collect = 0
		}
	}
	if (timer >= time)
	{
		with (obj_gustavo)
		{
			visible = true
			sprite_index = spr_gustavo_idle
		}
		scr_hurtplayer(obj_player1)
		obj_player1.hsp = 0
		obj_player1.movespeed = 0
		obj_player1.xscale = 1
		obj_player1.state = states.normal
		cutscene_end_action()
	}
	exit;
}

