@interface WeatherMapAnnotationContentView
- (_TtC11WeatherMaps31WeatherMapAnnotationContentView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps31WeatherMapAnnotationContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WeatherMapAnnotationContentView

- (_TtC11WeatherMaps31WeatherMapAnnotationContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A1D5FA8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A1D603C();
}

- (_TtC11WeatherMaps31WeatherMapAnnotationContentView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps31WeatherMapAnnotationContentView_annotation));
  sub_20A1D6364((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps31WeatherMapAnnotationContentView_viewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps31WeatherMapAnnotationContentView____lazy_storage___backgroundView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11WeatherMaps31WeatherMapAnnotationContentView____lazy_storage___foregroundView);
}

@end