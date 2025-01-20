@interface WebEmbedDebugView
- (_TtC8NewsFeed17WebEmbedDebugView)initWithCoder:(id)a3;
- (_TtC8NewsFeed17WebEmbedDebugView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WebEmbedDebugView

- (_TtC8NewsFeed17WebEmbedDebugView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed17WebEmbedDebugView_label;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed17WebEmbedDebugView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(WebEmbedDebugView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed17WebEmbedDebugView_label];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (_TtC8NewsFeed17WebEmbedDebugView)initWithFrame:(CGRect)a3
{
  result = (_TtC8NewsFeed17WebEmbedDebugView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end