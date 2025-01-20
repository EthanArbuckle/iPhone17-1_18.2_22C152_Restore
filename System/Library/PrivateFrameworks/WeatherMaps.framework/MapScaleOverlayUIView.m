@interface MapScaleOverlayUIView
- (CGRect)bounds;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11WeatherMaps21MapScaleOverlayUIView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps21MapScaleOverlayUIView)initWithFrame:(CGRect)a3;
- (void)handleInvertColorsStatusDidChangeWithNotification:(id)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
@end

@implementation MapScaleOverlayUIView

- (CGRect)bounds
{
  v2 = self;
  sub_20A33BEEC();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  sub_20A33BF9C(x, y, width, height);
}

- (_TtC11WeatherMaps21MapScaleOverlayUIView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A33CC7C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A33CDD8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  sub_20A33B384(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)handleInvertColorsStatusDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_20A33D4EC();
}

- (_TtC11WeatherMaps21MapScaleOverlayUIView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21MapScaleOverlayUIView____lazy_storage___separatorView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21MapScaleOverlayUIView____lazy_storage___backdropLayerVibrancy));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21MapScaleOverlayUIView____lazy_storage___titleVibrancyEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21MapScaleOverlayUIView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21MapScaleOverlayUIView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21MapScaleOverlayUIView____lazy_storage___continuousScaleView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11WeatherMaps21MapScaleOverlayUIView____lazy_storage___discreteScaleView);
}

@end