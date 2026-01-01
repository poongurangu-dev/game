extends CharacterBody2D

# Movement variables
var gravity = 800
var jump_force = -400
var max_fall_speed = 500

# Game state
var is_alive = true
var rotation_speed = 5

func _physics_process(delta):
	if not is_alive:
		return
	
	# Apply gravity
	velocity.y += gravity * delta
	
	# Limit fall speed
	if velocity.y > max_fall_speed:
		velocity.y = max_fall_speed
	
	# Handle jump input
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_space"):
		velocity.y = jump_force
	
	# Move the player
	move_and_slide()
	
	# Rotate based on velocity
	rotation = move_toward(rotation, velocity.y * 0.01, rotation_speed * 0.02)

func _on_obstacle_hit():
	is_alive = false
	get_tree().reload_current_scene()

func die():
	is_alive = false
	# You can add death animation here
	await get_tree().create_timer(0.5).timeout
	get_tree().reload_current_scene()
