extends Node2D

var score = 0

onready var enemy_scene = preload("res://Enemies/Enemy.tscn")

onready var enemies = get_node("Enemies")

func _on_Enemy_Spawn_Timer_timeout():
	var enemy = enemy_scene.instance()
	enemy.position = Vector2(rand_range(90, 900), 0)
	enemies.add_child(enemy)

func _on_Lose_Zone_area_entered(area):
	if area.name != "Player":
		global.score = 0
		$"Lose SFX".play()
		yield($"Lose SFX", "finished")
		get_tree().reload_current_scene()

func _on_Difficulty_Timer_timeout():
	$"Enemy Spawn Timer".wait_time -= 0.1
	$"Enemy Spawn Timer".wait_time = max($"Enemy Spawn Timer".wait_time, 0.01)
