extends Area2D

func _process(delta):
	position = get_global_mouse_position()

func _on_Player_area_entered(area):
	if area.has_method("die"):
		global.score += 1
		area.die()
