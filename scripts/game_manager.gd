extends Node

var score = 0
var high_score = 0
var pipe_scene = preload("res://scenes/pipe.tscn")
var spawn_timer = 0.0
var spawn_interval = 2.0

func _ready():
	load_high_score()

func _process(delta):
	spawn_timer += delta
	
	if spawn_timer >= spawn_interval:
		spawn_pipe()
		spawn_timer = 0.0

func spawn_pipe():
	var pipe = pipe_scene.instantiate()
	add_child(pipe)
	
	# Randomize pipe position
	var min_height = 100
	var max_height = get_viewport_rect().size.y - 100 - pipe.pipe_gap
	var random_height = randf_range(min_height, max_height)
	
	pipe.position = Vector2(get_viewport_rect().size.x, random_height)

func add_score():
	score += 1
	print("Score: ", score)
	# Update UI here
	if has_node("UI/ScoreLabel"):
		get_node("UI/ScoreLabel").text = "Score: " + str(score)

func end_game():
	if score > high_score:
		high_score = score
		save_high_score()
	print("Game Over! Final Score: ", score)

func load_high_score():
	# Load high score from file or use 0 as default
	var file = FileAccess.open("user://high_score.save", FileAccess.READ)
	if file != null:
		high_score = int(file.get_as_text())
	else:
		high_score = 0

func save_high_score():
	var file = FileAccess.open("user://high_score.save", FileAccess.WRITE)
	if file != null:
		file.store_line(str(high_score))

func reset_game():
	score = 0
	get_tree().reload_current_scene()
