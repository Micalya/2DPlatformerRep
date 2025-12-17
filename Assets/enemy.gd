extends CharacterBody2D
@onready var anim: AnimatedSprite2D = $EnemyAnim

const SPEED = 280.0
const JUMP_VELOCITY = -400.0

func  _ready() -> void:
	pass
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	update_animation()
	move_and_slide()
func update_animation():
	if velocity.x:
		anim.play("Walk")
	else: anim.play("Idle")
	
	if velocity.x > 0:
		anim.flip_h = true
	elif velocity.x:
		anim.flip_h = false
	
