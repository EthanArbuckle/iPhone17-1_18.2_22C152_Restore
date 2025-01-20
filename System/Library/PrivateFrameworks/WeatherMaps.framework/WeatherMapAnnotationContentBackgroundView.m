@interface WeatherMapAnnotationContentBackgroundView
- (_TtC11WeatherMaps41WeatherMapAnnotationContentBackgroundView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps41WeatherMapAnnotationContentBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WeatherMapAnnotationContentBackgroundView

- (_TtC11WeatherMaps41WeatherMapAnnotationContentBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A365518();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A3655C8();
}

- (_TtC11WeatherMaps41WeatherMapAnnotationContentBackgroundView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_20A365A84((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentBackgroundView_model, (void (*)(void))type metadata accessor for WeatherMapAnnotationContentViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentBackgroundView_backgroundView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentBackgroundView_scaleLayer);
}

@end