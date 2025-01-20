@interface WeatherMapCircularGradientLayer
- (_TtC11WeatherMaps31WeatherMapCircularGradientLayer)init;
- (_TtC11WeatherMaps31WeatherMapCircularGradientLayer)initWithCoder:(id)a3;
- (_TtC11WeatherMaps31WeatherMapCircularGradientLayer)initWithLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation WeatherMapCircularGradientLayer

- (_TtC11WeatherMaps31WeatherMapCircularGradientLayer)init
{
  return (_TtC11WeatherMaps31WeatherMapCircularGradientLayer *)sub_20A268188();
}

- (_TtC11WeatherMaps31WeatherMapCircularGradientLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_20A38C2D0();
  swift_unknownObjectRelease();
  return (_TtC11WeatherMaps31WeatherMapCircularGradientLayer *)sub_20A268358(v4);
}

- (_TtC11WeatherMaps31WeatherMapCircularGradientLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A2684F8();
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  sub_20A268620((uint64_t)v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps31WeatherMapCircularGradientLayer_indicatorColor));
  swift_bridgeObjectRelease();
}

@end