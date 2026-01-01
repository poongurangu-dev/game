extends Node2D

var speed = 200
var pipe_gap = 150
var player_node = null
var has_scored = false

func _ready():
	player_node = get_tree().root.get_child(0).get_node("Player")

func _process(delta):
	position.x -= speed * delta
	
	# Remove pipe when off screen
	if position.x < -100:
		queue_free()

func _on_gap_body_entered(body):
	if body.name == "Player" and body.is_alive:
		body.die()

func _on_score_area_body_entered(body):
	if body.name == "Player" and not has_scored:
		has_scored = true
		# Emit signal to game manager for scoring
		GameManager.add_score()
