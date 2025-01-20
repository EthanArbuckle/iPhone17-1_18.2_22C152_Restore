@interface InAppPurchaseView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore17InAppPurchaseView)initWithCoder:(id)a3;
- (_TtC8AppStore17InAppPurchaseView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InAppPurchaseView

- (_TtC8AppStore17InAppPurchaseView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100344E88();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003437E8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  InAppPurchaseIconLayout.Metrics.overallSize.getter();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC8AppStore17InAppPurchaseView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8AppStore17InAppPurchaseView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17InAppPurchaseView_artworkContainingView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17InAppPurchaseView_tileIconArtworkView));
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore17InAppPurchaseView_theme;
  uint64_t v4 = type metadata accessor for InAppPurchaseTheme();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  double v5 = (char *)self + OBJC_IVAR____TtC8AppStore17InAppPurchaseView_metrics;
  uint64_t v6 = type metadata accessor for InAppPurchaseIconLayout.Metrics();
  double v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end