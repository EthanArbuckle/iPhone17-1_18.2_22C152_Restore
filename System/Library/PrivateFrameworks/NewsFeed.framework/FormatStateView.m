@interface FormatStateView
- (_TtC8NewsFeed15FormatStateView)initWithCoder:(id)a3;
- (_TtC8NewsFeed15FormatStateView)initWithFrame:(CGRect)a3;
@end

@implementation FormatStateView

- (_TtC8NewsFeed15FormatStateView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatStateView_identifier);
  void *v9 = 0;
  v9[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatStateView_stateViewFormatLayoutViews) = (Class)MEMORY[0x1E4FBC868];
  v10 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatStateView_state);
  void *v10 = 0;
  v10[1] = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[FormatStateView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8NewsFeed15FormatStateView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatStateView_identifier);
  void *v6 = 0;
  v6[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatStateView_stateViewFormatLayoutViews) = (Class)MEMORY[0x1E4FBC868];
  v7 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatStateView_state);
  void *v7 = 0;
  v7[1] = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(FormatStateView *)&v9 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end