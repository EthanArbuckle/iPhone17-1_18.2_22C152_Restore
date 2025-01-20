@interface WeatherMapSupplementaryOverlayContainer
- (_TtC11WeatherMaps39WeatherMapSupplementaryOverlayContainer)initWithCoder:(id)a3;
- (_TtC11WeatherMaps39WeatherMapSupplementaryOverlayContainer)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation WeatherMapSupplementaryOverlayContainer

- (_TtC11WeatherMaps39WeatherMapSupplementaryOverlayContainer)initWithFrame:(CGRect)a3
{
  return (_TtC11WeatherMaps39WeatherMapSupplementaryOverlayContainer *)sub_20A222254(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11WeatherMaps39WeatherMapSupplementaryOverlayContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A22234C();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_20A2223D4((uint64_t)a4, x, y);

  return v10;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A2224F0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps39WeatherMapSupplementaryOverlayContainer_overlayView));
}

@end