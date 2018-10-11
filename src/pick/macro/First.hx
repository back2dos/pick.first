package pick.macro;

import haxe.macro.*;
using tink.MacroApi;

class First {
    static function existing() {
        switch Context.getLocalType() {
            case TInst(_, params): 
                for (p in params) switch p {
                    case TInst(_.get().kind => KExpr(e), _): //throw e;
                        var name = e.getString().sure();
                        try {
                            return Context.getType(name);
                        }
                        catch (e:haxe.macro.Expr.Error) {
                            if (e.message.indexOf(name) == -1) throw e;
                        }
                        catch (e:Dynamic) {
                            var e = Std.string(e);
                            if (e.indexOf(name) == -1) Context.fatalError(e, Context.currentPos());
                        }
                    default:
                }
                return Context.fatalError('No suitable type found', Context.currentPos());
            default: return null;
        }
    }
}