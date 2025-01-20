@interface WeatherMapAnnotationBackgroundView
- (_TtC11WeatherMaps34WeatherMapAnnotationBackgroundView)init;
- (_TtC11WeatherMaps34WeatherMapAnnotationBackgroundView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps34WeatherMapAnnotationBackgroundView)initWithFrame:(CGRect)a3;
- (double)_cornerRadius;
- (void)_setCornerRadius:(double)a3;
- (void)layoutSubviews;
@end

@implementation WeatherMapAnnotationBackgroundView

- (double)_cornerRadius
{
  v2 = self;
  sub_20A34AE28();
  double v4 = v3;

  return v4;
}

- (void)_setCornerRadius:(double)a3
{
  double v4 = self;
  sub_20A34A7BC(a3);
}

- (_TtC11WeatherMaps34WeatherMapAnnotationBackgroundView)init
{
  return (_TtC11WeatherMaps34WeatherMapAnnotationBackgroundView *)sub_20A34AF4C();
}

- (_TtC11WeatherMaps34WeatherMapAnnotationBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC11WeatherMaps34WeatherMapAnnotationBackgroundView *)sub_20A34B0F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11WeatherMaps34WeatherMapAnnotationBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A34B23C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A34B348();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps34WeatherMapAnnotationBackgroundView_gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps34WeatherMapAnnotationBackgroundView_materialView));
  id v3 = (char *)self + OBJC_IVAR____TtC11WeatherMaps34WeatherMapAnnotationBackgroundView_background;
  sub_20A34B9E4((uint64_t)v3);
}

@end