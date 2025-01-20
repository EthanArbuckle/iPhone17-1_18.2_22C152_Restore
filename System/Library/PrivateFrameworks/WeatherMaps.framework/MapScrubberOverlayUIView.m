@interface MapScrubberOverlayUIView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11WeatherMaps24MapScrubberOverlayUIView)init;
- (_TtC11WeatherMaps24MapScrubberOverlayUIView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps24MapScrubberOverlayUIView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)barTouched:(id)a3;
- (void)barValueChanged:(id)a3;
- (void)didReceiveMenuAction:(id)a3;
- (void)layoutSubviews;
- (void)playPauseTapped;
@end

@implementation MapScrubberOverlayUIView

- (_TtC11WeatherMaps24MapScrubberOverlayUIView)init
{
  return (_TtC11WeatherMaps24MapScrubberOverlayUIView *)sub_20A1CF03C();
}

- (_TtC11WeatherMaps24MapScrubberOverlayUIView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A1CF934();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A1CFBCC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_20A1D0CA8();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)barValueChanged:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_20A1D18F0((uint64_t)v4);
}

- (void)barTouched:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_20A1D1AA0();
}

- (void)playPauseTapped
{
  v2 = self;
  sub_20A1D1C74();
}

- (void)didReceiveMenuAction:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_20A1D1D4C();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v6 = a4;
  double v7 = self;
  id v8 = sub_20A1D2AD0((uint64_t)a4);

  return v8;
}

- (_TtC11WeatherMaps24MapScrubberOverlayUIView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_titleDateContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_playPauseButton));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_affordanceActionIcon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_titleButton));
  id v3 = (char *)self + OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_calendar;
  sub_20A389710();
  OUTLINED_FUNCTION_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  sub_20A1CC7A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_delegate);
  sub_20A1D4334((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_model, (void (*)(void))type metadata accessor for MapScrubberOverlayViewModel);
}

@end