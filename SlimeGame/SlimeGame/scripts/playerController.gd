extends CharacterBody2D

@onready var character_body_2d = $"."


const SPEED = 90.0
const JUMP_VELOCITY = -170.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

#aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

	# Handle jump.
	if Input.is_action_pressed("MoveUp") and is_on_floor():
		velocity.y = JUMP_VELOCITY*delta*100

#aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

	if Input.is_action_pressed("MoveLeft"):
		velocity.x = SPEED*-1*delta*100
	elif Input.is_action_just_released("MoveLeft"):
		velocity.x = 0

#aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

	if Input.is_action_pressed("MoveRight"):
		velocity.x = SPEED*1*delta*100
	elif Input.is_action_just_released("MoveRight"):
		velocity.x = 0

#aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

	if Input.is_action_pressed("ActionCrouch"):
		character_body_2d.scale.y = 0.5
		character_body_2d.scale.x = 2
	elif Input.is_action_just_released("ActionCrouch"):
		character_body_2d.scale.y = 1
		character_body_2d.scale.x = 1

	move_and_slide()
