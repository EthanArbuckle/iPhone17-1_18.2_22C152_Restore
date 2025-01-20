@interface FormatSplitView
- (_TtC8NewsFeed15FormatSplitView)initWithCoder:(id)a3;
- (_TtC8NewsFeed15FormatSplitView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FormatSplitView

- (_TtC8NewsFeed15FormatSplitView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed15FormatSplitView *)FormatSplitView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed15FormatSplitView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed15FormatSplitView_splitView;
  id v6 = objc_allocWithZone((Class)sub_1C151CE1C());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = (char *)self + OBJC_IVAR____TtC8NewsFeed15FormatSplitView_model;
  uint64_t v9 = sub_1C151A6AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);

  result = (_TtC8NewsFeed15FormatSplitView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(FormatSplitView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed15FormatSplitView_splitView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed15FormatSplitView_model;
  sub_1C0CB446C((uint64_t)v3);
}

@end