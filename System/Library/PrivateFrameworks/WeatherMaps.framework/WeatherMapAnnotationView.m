@interface WeatherMapAnnotationView
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (UIBezierPath)accessibilityPath;
- (_TtC11WeatherMaps24WeatherMapAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (_TtC11WeatherMaps24WeatherMapAnnotationView)initWithCoder:(id)a3;
- (id)_balloonContentView;
- (id)_balloonImage;
- (id)_balloonTintColor;
- (int64_t)_balloonCalloutStyle;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setAccessibilityHint:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityPath:(id)a3;
- (void)setAccessibilityValue:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation WeatherMapAnnotationView

- (_TtC11WeatherMaps24WeatherMapAnnotationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A34CC50();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_20A34CD24();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A34CDF4();
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  double v6 = self;
  sub_20A34CFE4(a3, a4);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  sub_20A34D160();
  if (v2)
  {
    id v3 = (void *)sub_20A38B5D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityValue
{
  uint64_t v2 = self;
  sub_20A34D250();
  uint64_t v4 = v3;

  if (v4)
  {
    double v5 = (void *)sub_20A38B5D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityValue:(id)a3
{
}

- (NSString)accessibilityHint
{
  return (NSString *)0;
}

- (void)setAccessibilityHint:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = self;
  unint64_t v3 = sub_20A34D3F4();

  return v3;
}

- (CGRect)accessibilityFrame
{
  uint64_t v2 = self;
  sub_20A34D4CC();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIBezierPath)accessibilityPath
{
  uint64_t v2 = self;
  id v3 = sub_20A34D5B0();

  return (UIBezierPath *)v3;
}

- (void)setAccessibilityPath:(id)a3
{
  id v5 = a3;
  double v6 = self;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v2 = self;
  double v3 = sub_20A34D6E4();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (_TtC11WeatherMaps24WeatherMapAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  if (a4) {
    sub_20A38B610();
  }
  swift_unknownObjectRetain();
  sub_20A34D780();
}

- (void).cxx_destruct
{
  sub_20A1CC7A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24WeatherMapAnnotationView_dataSource);
  sub_20A1CC7A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24WeatherMapAnnotationView_delegate);
  sub_20A34DCB0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24WeatherMapAnnotationView_viewModel, (void (*)(void))type metadata accessor for WeatherMapAnnotationViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24WeatherMapAnnotationView_cachedBalloonContentView));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24WeatherMapAnnotationView_mapAnnotation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24WeatherMapAnnotationView____lazy_storage___locationLabel));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11WeatherMaps24WeatherMapAnnotationView____lazy_storage___pinView);
}

- (id)_balloonImage
{
  return 0;
}

- (int64_t)_balloonCalloutStyle
{
  return 0;
}

- (id)_balloonContentView
{
  uint64_t v2 = self;
  double v3 = sub_20A34DA0C();

  return v3;
}

- (id)_balloonTintColor
{
  uint64_t v2 = sub_20A34DBFC();
  return v2;
}

@end