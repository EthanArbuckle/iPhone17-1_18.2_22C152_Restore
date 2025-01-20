@interface PuzzleStackAccessoryView
- (_TtC8NewsFeed24PuzzleStackAccessoryView)initWithCoder:(id)a3;
- (_TtC8NewsFeed24PuzzleStackAccessoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PuzzleStackAccessoryView

- (_TtC8NewsFeed24PuzzleStackAccessoryView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed24PuzzleStackAccessoryView_identifier);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8NewsFeed24PuzzleStackAccessoryView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  PuzzleStackAccessoryView.layoutSubviews()();
}

- (_TtC8NewsFeed24PuzzleStackAccessoryView)initWithFrame:(CGRect)a3
{
  result = (_TtC8NewsFeed24PuzzleStackAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24PuzzleStackAccessoryView_containerView));
  swift_bridgeObjectRelease();
}

@end