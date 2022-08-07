if (room == rm_editor)
	exit;

if (!in_saveroom(id))
{
	online_kill(id);
	with (instance_create(x + sprite_width / 2, y + sprite_height / 2, obj_sausageman_dead))
		sprite_index = spr_bigdoughblockdead
	scr_sleep(5)
	if (audio_is_playing(sfx_breakblock1) or audio_is_playing(sfx_breakblock2))
	{
		audio_stop_sound(sfx_breakblock1)
		audio_stop_sound(sfx_breakblock2)
	}
	scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
	ds_list_add(global.saveroom, id)
}
instance_destroy(solid_inst)
