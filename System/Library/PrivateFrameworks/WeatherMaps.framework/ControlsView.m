@interface ControlsView
- (NSArray)accessibilityElements;
- (_TtC11WeatherMaps12ControlsView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps12ControlsView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setAccessibilityElements:(id)a3;
@end

@implementation ControlsView

- (_TtC11WeatherMaps12ControlsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A2446A0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A2450C4();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_20A245968((uint64_t)a4, x, y);

  return v10;
}

- (NSArray)accessibilityElements
{
  v2 = self;
  uint64_t v3 = sub_20A245B28();

  if (v3)
  {
    v4 = (void *)sub_20A38B870();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setAccessibilityElements:(id)a3
{
  if (a3) {
    sub_20A38B880();
  }
  v4 = self;
  j__swift_bridgeObjectRelease();
}

- (_TtC11WeatherMaps12ControlsView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_20A246088(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11WeatherMaps12ControlsView_scaleModel), *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC11WeatherMaps12ControlsView_scaleModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps12ControlsView_mapViewForZoomControl));
  sub_20A1CC7A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps12ControlsView_menuDelegate);
  sub_20A1CC7A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps12ControlsView_actionDelegate);
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps12ControlsView_windOverlayHintManager);
  swift_release();
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11WeatherMaps12ControlsView_discoverWindHintView);
}

@end