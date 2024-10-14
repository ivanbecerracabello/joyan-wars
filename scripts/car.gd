extends VehicleBody3D

var max_rpm = 250
var max_torque = 50

func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("right", "left") * 0.4, 5 * delta)
	var acceleration = Input.get_axis("backward", "forward")
	var rpm = $RearLeft.get_rpm()
	$RearLeft.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	rpm = $RearRight.get_rpm()
	$RearRight.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	
