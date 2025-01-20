@interface LiveActivityEmbedScript
- (BOOL)queueable;
- (NSString)executableScript;
- (NSString)identifier;
- (WKUserScript)userScript;
- (_TtC8NewsFeed23LiveActivityEmbedScript)init;
@end

@implementation LiveActivityEmbedScript

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1C151E5EC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)queueable
{
  return 0;
}

- (WKUserScript)userScript
{
  v2 = self;
  id v3 = sub_1C0EB5E78();

  return (WKUserScript *)v3;
}

- (NSString)executableScript
{
  v2 = self;
  sub_1C0EB6020();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (_TtC8NewsFeed23LiveActivityEmbedScript)init
{
  result = (_TtC8NewsFeed23LiveActivityEmbedScript *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end