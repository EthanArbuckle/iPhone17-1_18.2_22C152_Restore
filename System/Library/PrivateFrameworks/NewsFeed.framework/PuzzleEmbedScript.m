@interface PuzzleEmbedScript
- (BOOL)queueable;
- (NSString)executableScript;
- (NSString)identifier;
- (WKUserScript)userScript;
- (_TtC8NewsFeed17PuzzleEmbedScript)init;
@end

@implementation PuzzleEmbedScript

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1C151E5EC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (WKUserScript)userScript
{
  return (WKUserScript *)0;
}

- (NSString)executableScript
{
  v2 = self;
  PuzzleEmbedScript.executableScript.getter();
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

- (BOOL)queueable
{
  return 0;
}

- (_TtC8NewsFeed17PuzzleEmbedScript)init
{
  result = (_TtC8NewsFeed17PuzzleEmbedScript *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end