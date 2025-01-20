@interface DebugGroupLayoutView
- (_TtC8NewsFeed20DebugGroupLayoutView)initWithCoder:(id)a3;
- (_TtC8NewsFeed20DebugGroupLayoutView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DebugGroupLayoutView

- (_TtC8NewsFeed20DebugGroupLayoutView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed20DebugGroupLayoutView_contentView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1BE0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed20DebugGroupLayoutView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C0B72724();
}

- (_TtC8NewsFeed20DebugGroupLayoutView)initWithFrame:(CGRect)a3
{
  result = (_TtC8NewsFeed20DebugGroupLayoutView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed20DebugGroupLayoutView_columnDebugView);
}

@end