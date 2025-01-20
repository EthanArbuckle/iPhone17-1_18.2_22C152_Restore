@interface MapContinuousScaleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11WeatherMaps22MapContinuousScaleView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps22MapContinuousScaleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MapContinuousScaleView

- (_TtC11WeatherMaps22MapContinuousScaleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A278BF8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A278CE4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_20A279050();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC11WeatherMaps22MapContinuousScaleView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps22MapContinuousScaleView_gradient));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end