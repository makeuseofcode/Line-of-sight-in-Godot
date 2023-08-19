extends CharacterBody2D

var speed = 300
var raycast_length = 100
var raycast: RayCast2D

func _ready():
	raycast = RayCast2D.new()
	add_child(raycast)


func _physics_process(delta):
	var input_dir = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_dir.x += 1
	if Input.is_action_pressed("ui_up"):
		input_dir.y -= 1
	if Input.is_action_pressed("ui_down"):
		input_dir.y += 1

	velocity = input_dir.normalized() * speed
	move_and_collide(velocity * delta)
	
	raycast.target_position = Vector2(100, 0)
	if raycast.is_colliding():
		print("Collided with platform!")
