@interface FormatLayeredMediaView
- (_TtC8NewsFeed22FormatLayeredMediaView)initWithCoder:(id)a3;
- (_TtC8NewsFeed22FormatLayeredMediaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FormatLayeredMediaView

- (_TtC8NewsFeed22FormatLayeredMediaView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_identifier);
  void *v9 = 0;
  v9[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_layeredMediaView) = 0;
  v10 = (char *)self + OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_lastRenderedBounds;
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  v10[32] = 1;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[FormatLayeredMediaView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(FormatLayeredMediaView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_layeredMediaView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    sub_1C151F8FC();

    v2 = v4;
  }
}

- (_TtC8NewsFeed22FormatLayeredMediaView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_identifier);
  void *v6 = 0;
  v6[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_layeredMediaView) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_lastRenderedBounds;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[32] = 1;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(FormatLayeredMediaView *)&v9 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed22FormatLayeredMediaView_layeredMediaView);
}

@end