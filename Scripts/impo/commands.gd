extends Node
@export var root: Control

# moved commands to 'Scripts\commandsGlobal.gd'
func _ready():
	resizeWindow(Vector2(gbData.settings.ConsoleSize.x, gbData.settings.ConsoleSize.y))
	CommandsGlobal.runInitialCommands.emit()
	CommandsGlobal.resizeCommandCalled.connect(resizeWindow)
	
	# Add gyroGravity command for Android
	if GlobalVariable.gyroGravityEnabled:
		Console.create_command("gyroGravity", Callable(self, "_gyro_gravity_command"))

func resizeWindow(v):
	root.size = v

# Command handler for gyro gravity
func _gyro_gravity_command(_args):
	pass
