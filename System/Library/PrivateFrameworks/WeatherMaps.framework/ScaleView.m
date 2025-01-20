@interface ScaleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11WeatherMaps9ScaleView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps9ScaleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ScaleView

- (_TtC11WeatherMaps9ScaleView)initWithCoder:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A2DCC8C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_20A2DC818(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (_TtC11WeatherMaps9ScaleView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps9ScaleView_backgroundEffectView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11WeatherMaps9ScaleView_scaleOverlayView);
}

@end