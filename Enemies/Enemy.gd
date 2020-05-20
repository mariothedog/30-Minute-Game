extends Area2D

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += 700 * delta
	position += velocity * delta

func die():
	$"Hurt SFX".play()
	$CollisionShape2D.set_deferred("disabled", true)
	visible = false
	yield($"Hurt SFX", "finished")
	queue_free()
