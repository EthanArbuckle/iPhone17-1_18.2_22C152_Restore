@interface ScrubberView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11WeatherMaps12ScrubberView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps12ScrubberView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ScrubberView

- (_TtC11WeatherMaps12ScrubberView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A2D3B1C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A2D3BE0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_20A2D3DDC();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC11WeatherMaps12ScrubberView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps12ScrubberView_backgroundEffectView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11WeatherMaps12ScrubberView_barView);
}

@end