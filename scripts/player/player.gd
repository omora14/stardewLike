extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

func _physics_process(delta: float) -> void:
	# gravity (this cannot be handled with GDScript apparently)
	if not is_on_floor():
		velocity += get_gravity() * delta

	# jump speed ca be changed on the variable that is on top called JUMP_VELOCITY
	if Input.is_action_just_pressed("ui_accept") and is_on_floor(): # ui_accept = space
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right") # same as the ui acccept
	if direction:
		velocity.x = direction * SPEED # interesting how it's being used here, it seems like a multiplication
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide() # here I am just calling the program to make sure it's being displayed
