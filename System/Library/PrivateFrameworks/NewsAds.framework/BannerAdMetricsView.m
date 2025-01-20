@interface BannerAdMetricsView
- (_TtC7NewsAds19BannerAdMetricsView)initWithCoder:(id)a3;
- (_TtC7NewsAds19BannerAdMetricsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)metricsViewCollapsed:(id)a3;
- (void)metricsViewReady:(id)a3;
@end

@implementation BannerAdMetricsView

- (_TtC7NewsAds19BannerAdMetricsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF9B81B8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1BF9B7004();
}

- (_TtC7NewsAds19BannerAdMetricsView)initWithFrame:(CGRect)a3
{
  result = (_TtC7NewsAds19BannerAdMetricsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1BF95F0E8((uint64_t)self + OBJC_IVAR____TtC7NewsAds19BannerAdMetricsView_contentInfo);
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds19BannerAdMetricsView_promotedContentInfoObserver));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsAds19BannerAdMetricsView_unfilledReasonObserver);
}

- (void)metricsViewReady:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BF9B7424(v4);
}

- (void)metricsViewCollapsed:(id)a3
{
  sub_1BF95F470();
  id v5 = a3;
  v6 = self;
  sub_1BFA16E98();
}

@end