@interface MapScaleLabelView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11WeatherMaps17MapScaleLabelView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps17MapScaleLabelView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MapScaleLabelView

- (_TtC11WeatherMaps17MapScaleLabelView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A34395C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A343A20();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_20A3431D0();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC11WeatherMaps17MapScaleLabelView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps17MapScaleLabelView_vibrancyEffectView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end