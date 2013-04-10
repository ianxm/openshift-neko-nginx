import neko.Web;
import neko.Lib;

class Hello
{
    static function main()
    {
        Web.cacheModule(run);
    }

    static function run()
    {
        Web.setHeader("Content-Type", "text/plain");
        Lib.println("hello. " + Web.getParams());
    }
}
