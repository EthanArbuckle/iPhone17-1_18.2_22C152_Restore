@interface FormatSponsoredBanner
- (_TtC8NewsFeed21FormatSponsoredBanner)initWithCoder:(id)a3;
- (_TtC8NewsFeed21FormatSponsoredBanner)initWithFrame:(CGRect)a3;
@end

@implementation FormatSponsoredBanner

- (_TtC8NewsFeed21FormatSponsoredBanner)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed21FormatSponsoredBanner_identifier);
  void *v9 = 0;
  v9[1] = 0xE000000000000000;
  v10 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed21FormatSponsoredBanner_adIdentifier);
  void *v10 = 0;
  v10[1] = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[FormatSponsoredBanner initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8NewsFeed21FormatSponsoredBanner)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed21FormatSponsoredBanner_identifier);
  void *v6 = 0;
  v6[1] = 0xE000000000000000;
  v7 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed21FormatSponsoredBanner_adIdentifier);
  void *v7 = 0;
  v7[1] = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(FormatSponsoredBanner *)&v9 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end