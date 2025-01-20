@interface DebugInterstitialAdView
- (_TtC7NewsAds23DebugInterstitialAdView)initWithCoder:(id)a3;
- (_TtC7NewsAds23DebugInterstitialAdView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DebugInterstitialAdView

- (_TtC7NewsAds23DebugInterstitialAdView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF9596E4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1BF959414();
}

- (_TtC7NewsAds23DebugInterstitialAdView)initWithFrame:(CGRect)a3
{
  result = (_TtC7NewsAds23DebugInterstitialAdView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds23DebugInterstitialAdView_onLongPress));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds23DebugInterstitialAdView_onCollapse));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsAds23DebugInterstitialAdView_moreButton);
}

@end