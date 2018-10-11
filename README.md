# pick.first

Picks the first type that actually exists. Should help in the transition between Haxe 3 and Haxe 4. Many types get moved around, often inbetween releases and even conditional compilation won't help. Enter pick.first:

```haxe
typedef Console = pick.First<"js.html.ConsoleInstance", "js.html.Console">;
```