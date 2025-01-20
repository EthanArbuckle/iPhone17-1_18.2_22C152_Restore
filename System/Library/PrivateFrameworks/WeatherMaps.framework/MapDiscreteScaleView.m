@interface MapDiscreteScaleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11WeatherMaps20MapDiscreteScaleView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps20MapDiscreteScaleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MapDiscreteScaleView

- (_TtC11WeatherMaps20MapDiscreteScaleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A1D9978();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A1D9A2C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  sub_20A1D9C38(width);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.double width = v9;
  return result;
}

- (_TtC11WeatherMaps20MapDiscreteScaleView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end