# New RakuScript or maybe RakuDown Concept

This new RakuScript concept is inspired by Markdown and GDScript.
Any RakuScript extends form Rakugo's _Dialogue_ node

## Comments

`#` is used for comments.

## Commas

In RakuScript commas ( `,` ) are optional.

## Variables

In Rakugo Script we have 2 kinds of variables: local and global

### Local

Are just normal GDScript variables, but you can use RakuScript
syntax on them.

```
# Member variables

var a = 5
var b = true #or false
# they are more ways to declare
# String, Array and Dictionary in RakuScript
var s = "Hello"
var arr = [1, 2, 3]
var dict = {"key": "value", 2: 3}
int typed_var
var inferred_type := @String
var empty_var = nothing

# Constants

const ANSWER = 42
const THE_NAME = @Charly

# Enums

enum {UNIT_NEUTRAL, UNIT_ENEMY, UNIT_ALLY}
enum Named {THING_1, THING_2, ANOTHER_THING = -1}

# Built-in vector types

var v2 = Vector2(1, 2)
var v3 = Vector3 1 2 3

```

### Global

This is the same as in GDScript:

```
Rakugo.store.set("variable_name", value)
```

You can get this vars in any RakuScript in your game.

```
def @variable_name = value

def:
  @empty_var = @nothing
  @another_var = 1
```

To get global variable you can use `?` as shortcut so it easier to use them in functions and conditions.

```
?@variable_name
```

## Characters

This is the same as in GDScript:

```python
Rakugo.define_character("Character Name", "character_tag", character_label_color)
```

You can get this vars in any RakuScript in your game.

```
character "Character Name", @character_tag, character_label_color
```

## Strings

In RakuScript we have 3 string formats:

- `@one_word_string`
- `"Short One Line String"`
- `>>Long Multi Lines String` - this is ended with empty new line

### Empty Strings

```
var empty_string = @
# or traditional way
var traditional_empty_string = ""
```

### One More Strings trick

If they are few one word strings separated just by space.
The they will be joined like this:

```
var join_few_words = @sylvie @green @smile
var is_the_same_as = "sylvie green smile"
```

Useful for funcs like `show`.

## Arrays

Can be define in 3 different ways:

```
var arry_a = [1, 2 3]
var arry_b = array 1 2 3
var arry_c = array
  1
  2
  3
```

## Dictionaries

Can be define in 3 different ways:

```
var dict_a = {"one": 1, @two: 2 @three: 3}
var dict_b = dict @one: 1, @two: 2 @three: 3
var dict_c = dict
  @one: 1
  @two: 2
  @three: 3
```

## Conditions

```
  var local_var = 5

  if param1 < local_var:
    say @ str param1
  elif param2 > 5:
    say @ str param2

  var test_match = @one

  match:
    @one:
      say @ >> Say this if one.

    @two:
      say @ >> Say this if two.
```

## Dialogue Events

```
dialogue event_name:
  say @ "Say Hello"
```

is the same as in GDScript

```
func dialogue_event_name():
  start_event("dialogue_event_name")
  say(null, "Say Hello")
  step()
```

`step` before next `say` is optional.

## Functions

To declare new function:

```
func new_function(arg1, arg2):
  pass

# or
func new_function arg1 arg2:
  pass

# or
new_function:
  - arg1
  - arg2
  pass
```

### Examples of Calling funcs

#### Say

```
say @character_tag >>Stuff to say many lines.

# or
say @character_tag "Stuff to say one Line."

# if just Narrator

say @ >>Narrator say many lines.

say @ "Narrator say one line."
```

#### Ask

```
say "What is your name?"
var player_name = ask @ dict @placeholder: "Player Name"
```

#### Menu

```
say @ "Choose game mode"
var choice = menu array
  - @Easy @easy {}
  - @Normal @normal {}
  - @Hard @hard {}
```

### Show, Hide and Notify

```
show @sylvie @sad dict @some_parameter: 1
step
hide @sylvie
notify >>You will never see her again :(

```
