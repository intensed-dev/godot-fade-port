@tool
extends EditorProperty

const AXIS_NAMES := ["X", "Y", "Z"]
const AXIS_COLORS := [
	Color("#e36b65"),
	Color("#83c77a"),
	Color("#6b9fe3")
]

const FIELD_MIN_WIDTH := 84
const FIELD_MIN_HEIGHT := 32

var _property_name := ""
var _fields: Array[SpinBox] = []
var _updating := false


func setup(property_name: String) -> void:
	_property_name = property_name

	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)

	for axis in range(3):
		var axis_box := HBoxContainer.new()
		axis_box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		axis_box.add_theme_constant_override("separation", 4)

		var axis_label := Label.new()
		axis_label.text = AXIS_NAMES[axis]
		axis_label.custom_minimum_size.x = 14
		axis_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		axis_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		axis_label.add_theme_color_override("font_color", AXIS_COLORS[axis])
		axis_box.add_child(axis_label)

		var field := SpinBox.new()
		field.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		field.custom_minimum_size = Vector2(FIELD_MIN_WIDTH, FIELD_MIN_HEIGHT)
		field.step = 0.01
		field.rounded = false
		field.value_changed.connect(_on_axis_changed.bind(axis))
		axis_box.add_child(field)

		row.add_child(axis_box)
		_fields.append(field)

	add_child(row)
	add_focusable(row)


func _update_property() -> void:
	var value: Variant = get_edited_object().get_edited_property()
	if typeof(value) != TYPE_VECTOR3:
		return

	_updating = true
	for axis in range(3):
		_fields[axis].set_value_no_signal(value[axis])
	_updating = false


func _set_read_only(read_only: bool) -> void:
	for field in _fields:
		field.editable = not read_only


func _on_axis_changed(_value: float, _axis: int) -> void:
	if _updating:
		return

	var current: Variant = get_edited_object().get_edited_property()
	if typeof(current) != TYPE_VECTOR3:
		return

	var next_value := Vector3(
		_fields[0].value,
		_fields[1].value,
		_fields[2].value
	)
	emit_changed(_property_name, next_value)
