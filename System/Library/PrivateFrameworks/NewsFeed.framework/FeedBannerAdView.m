@interface FeedBannerAdView
- (_TtC8NewsFeed16FeedBannerAdView)initWithCoder:(id)a3;
- (_TtC8NewsFeed16FeedBannerAdView)initWithFrame:(CGRect)a3;
@end

@implementation FeedBannerAdView

- (_TtC8NewsFeed16FeedBannerAdView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed16FeedBannerAdView_bannerView);
  void *v9 = 0;
  v9[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed16FeedBannerAdView____lazy_storage___debugView) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[FeedBannerAdView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8NewsFeed16FeedBannerAdView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed16FeedBannerAdView_bannerView);
  void *v6 = 0;
  v6[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed16FeedBannerAdView____lazy_storage___debugView) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(FeedBannerAdView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed16FeedBannerAdView____lazy_storage___debugView);
}

@end