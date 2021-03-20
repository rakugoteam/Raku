extends Dialogue
class_name RakuScript

# export(String, FILE, "*.tres") var script_file;
export(String, MULTILINE) var test_script:= ""
var regex_def = RegEx.new()

func _ready():
	regex_def.compile("def\\s+@(?<var_name>\\w+)")
	compile_script()

func compile_script():
	for line in test_script.split("\n"):
		if line.begins_with("#"):
			continue
		
		if line.begins_with("def"):
			var result = regex_def.search(line)
			if result:
				var var_name = result.get_string("var_name")
				line = 'Rakugo.store.set("%s", "nothing")' % var_name
		print(line)





