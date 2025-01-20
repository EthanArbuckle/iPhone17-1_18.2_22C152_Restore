@interface MapScrubberOverlayBar
- (CGPoint)accessibilityActivationPoint;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11WeatherMaps21MapScrubberOverlayBar)init;
- (_TtC11WeatherMaps21MapScrubberOverlayBar)initWithCoder:(id)a3;
- (_TtC11WeatherMaps21MapScrubberOverlayBar)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)handleWithGesture:(id)a3;
- (void)layoutSubviews;
@end

@implementation MapScrubberOverlayBar

- (_TtC11WeatherMaps21MapScrubberOverlayBar)init
{
  return (_TtC11WeatherMaps21MapScrubberOverlayBar *)sub_20A378718();
}

- (_TtC11WeatherMaps21MapScrubberOverlayBar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A378E4C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A3791A8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  sub_20A379DB0(width);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.double width = v9;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  double v9 = self;
  id v10 = sub_20A379F10((uint64_t)a4, x, y);

  return v10;
}

- (void)handleWithGesture:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_20A37B850(v4);
}

- (_TtC11WeatherMaps21MapScrubberOverlayBar)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_bar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_elapsedBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_control));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark);
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar____lazy_storage___gestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_accessibilityDateFormatter));
  sub_20A37E6A8((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model, (void (*)(void))type metadata accessor for MapScrubberOverlayBar.ViewModel);
  id v4 = (char *)self + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_current;
  sub_20A389550();
  OUTLINED_FUNCTION_0();
  double v7 = *(void (**)(char *, uint64_t))(v6 + 8);
  v7(v4, v5);
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = self;
  sub_20A37BCC0();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

- (void)accessibilityIncrement
{
  v2 = self;
  sub_20A37C614((void (*)(char *))sub_20A37BCDC);
}

- (void)accessibilityDecrement
{
  v2 = self;
  sub_20A37C614((void (*)(char *))sub_20A37C7F4);
}

@end