@interface ButtonGroupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11WeatherMaps15ButtonGroupView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps15ButtonGroupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ButtonGroupView

- (_TtC11WeatherMaps15ButtonGroupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A247208();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A2472E0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_20A2462A4(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (_TtC11WeatherMaps15ButtonGroupView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_20A1CC7A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps15ButtonGroupView_menuDelegate);
  sub_20A1CC7A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps15ButtonGroupView_actionDelegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11WeatherMaps15ButtonGroupView_backgroundEffectView);
}

@end