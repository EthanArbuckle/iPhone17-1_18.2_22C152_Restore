@interface WeatherMapAnnotationPinView
- (_TtC11WeatherMaps27WeatherMapAnnotationPinView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps27WeatherMapAnnotationPinView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WeatherMapAnnotationPinView

- (_TtC11WeatherMaps27WeatherMapAnnotationPinView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A1DF8AC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A1DF9E4();
}

- (_TtC11WeatherMaps27WeatherMapAnnotationPinView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps27WeatherMapAnnotationPinView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps27WeatherMapAnnotationPinView_strokeLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps27WeatherMapAnnotationPinView_outerShadowLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps27WeatherMapAnnotationPinView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps27WeatherMapAnnotationPinView_iconView));
  sub_20A1E0B70((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps27WeatherMapAnnotationPinView_viewModel, type metadata accessor for WeatherMapAnnotationPinView.ViewModel);
}

@end