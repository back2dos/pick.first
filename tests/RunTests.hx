package ;

typedef Foo = pick.First<"js.html.ConsoleInstance", "Fake">;

class RunTests {

  static function main() {
    var foo:Foo = #if js js.Browser.console #else new Fake(); #end
    foo.log('yo');
    travix.Logger.println('it works');
    travix.Logger.exit(0); // make sure we exit properly, which is necessary on some targets, e.g. flash & (phantom)js
  }
  
}