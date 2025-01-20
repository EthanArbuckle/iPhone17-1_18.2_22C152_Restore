@interface WeatherMapAnnotationLowHighLabelsView
- (_TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WeatherMapAnnotationLowHighLabelsView

- (_TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A35CEF0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A35CFB4();
}

- (_TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  id v3 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection
                             + OBJC_IVAR____TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView_model);
  objc_release(*(id *)((char *)&self->super._swiftAnimationInfo
                     + OBJC_IVAR____TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView_model));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView_lowLabel));
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11WeatherMaps37WeatherMapAnnotationLowHighLabelsView_highLabel);
}

@end