@interface BackgroundEffectView
- (_TtC11WeatherMaps20BackgroundEffectView)init;
- (_TtC11WeatherMaps20BackgroundEffectView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps20BackgroundEffectView)initWithEffect:(id)a3;
- (_TtC11WeatherMaps20BackgroundEffectView)initWithFrame:(CGRect)a3;
@end

@implementation BackgroundEffectView

- (_TtC11WeatherMaps20BackgroundEffectView)init
{
  return (_TtC11WeatherMaps20BackgroundEffectView *)sub_20A375BC8();
}

- (_TtC11WeatherMaps20BackgroundEffectView)initWithEffect:(id)a3
{
}

- (_TtC11WeatherMaps20BackgroundEffectView)initWithFrame:(CGRect)a3
{
}

- (_TtC11WeatherMaps20BackgroundEffectView)initWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps20BackgroundEffectView_cornerCurve));
  sub_20A1D6674(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC11WeatherMaps20BackgroundEffectView_style));
  swift_bridgeObjectRelease();
}

@end