@interface DebugFormatConsolePaneDisplayController
- (_TtC8NewsFeed39DebugFormatConsolePaneDisplayController)init;
- (void)doConsolePaneDebuggerDisplay;
- (void)doConsolePaneLoggerDisplay;
@end

@implementation DebugFormatConsolePaneDisplayController

- (void)doConsolePaneDebuggerDisplay
{
  v2 = self;
  sub_1C0DBA090();
}

- (void)doConsolePaneLoggerDisplay
{
  v2 = self;
  sub_1C0DBA198();
}

- (_TtC8NewsFeed39DebugFormatConsolePaneDisplayController)init
{
  result = (_TtC8NewsFeed39DebugFormatConsolePaneDisplayController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatConsolePaneDisplayController____lazy_storage___consolePaneDebuggerButtonItem));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8NewsFeed39DebugFormatConsolePaneDisplayController____lazy_storage___consolePaneLoggerButtonItem);
}

@end