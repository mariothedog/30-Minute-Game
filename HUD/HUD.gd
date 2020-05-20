extends CanvasLayer

func _process(_delta):
	$MarginContainer/Score.text = "Score: %s" % global.score
