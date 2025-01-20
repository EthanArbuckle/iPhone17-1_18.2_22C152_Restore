@interface WeatherMapAnnotationContentForegroundView
- (_TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WeatherMapAnnotationContentForegroundView

- (_TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A3811D4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A3812B4();
}

- (_TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_20A383070((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_model, type metadata accessor for WeatherMapAnnotationContentViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_headerSectionView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11WeatherMaps41WeatherMapAnnotationContentForegroundView_footerSectionView);
}

@end