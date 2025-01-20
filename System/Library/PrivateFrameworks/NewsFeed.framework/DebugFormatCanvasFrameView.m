@interface DebugFormatCanvasFrameView
- (NSString)description;
- (_TtC8NewsFeed26DebugFormatCanvasFrameView)initWithCoder:(id)a3;
- (_TtC8NewsFeed26DebugFormatCanvasFrameView)initWithFrame:(CGRect)a3;
@end

@implementation DebugFormatCanvasFrameView

- (_TtC8NewsFeed26DebugFormatCanvasFrameView)initWithCoder:(id)a3
{
  result = (_TtC8NewsFeed26DebugFormatCanvasFrameView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (NSString)description
{
  v2 = self;
  sub_1C15200FC();
  sub_1C151E80C();
  sub_1C151744C();
  sub_1C152036C();
  sub_1C151E80C();

  v3 = (void *)sub_1C151E5EC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC8NewsFeed26DebugFormatCanvasFrameView)initWithFrame:(CGRect)a3
{
  result = (_TtC8NewsFeed26DebugFormatCanvasFrameView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8NewsFeed26DebugFormatCanvasFrameView_cursorFrame;
  uint64_t v3 = sub_1C151744C();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end