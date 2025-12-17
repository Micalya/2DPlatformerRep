extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const BOOST_SPEED = 350.0
const JUMP_VELOCITY = -400.0
func _ready() -> void:
	pass
	
func update_animation():
	if velocity.x:
		anim.play("Run")
	else: anim.play("Idle")
	if velocity.y > 0:
		anim.play("Jump")
	if velocity.x < 0:
		anim.flip_h = true
	elif velocity.x:
		anim.flip_h = false
	
	
		
func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	
	update_animation()
	move_and_slide()

	

	
	
