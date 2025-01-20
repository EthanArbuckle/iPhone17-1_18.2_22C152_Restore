@interface MapDiscreteStepView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11WeatherMaps19MapDiscreteStepView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps19MapDiscreteStepView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MapDiscreteStepView

- (_TtC11WeatherMaps19MapDiscreteStepView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A3159DC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_20A31553C(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A315B38();
}

- (_TtC11WeatherMaps19MapDiscreteStepView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps19MapDiscreteStepView_colorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps19MapDiscreteStepView____lazy_storage___label));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end