@interface PosterLabel
- (_TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel)initWithCoder:(id)a3;
- (_TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation PosterLabel

- (_TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100044868();
}

- (void)updateConstraints
{
  v2 = self;
  sub_1000449EC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100044A7C((uint64_t)a3);
}

- (_TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_color));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_smallTypeWidthConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_largeTypeWidthConstraint);
}

@end