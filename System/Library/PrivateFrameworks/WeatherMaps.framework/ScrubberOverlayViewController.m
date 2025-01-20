@interface ScrubberOverlayViewController
- (_TtC11WeatherMaps29ScrubberOverlayViewController)initWithCoder:(id)a3;
- (_TtC11WeatherMaps29ScrubberOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ScrubberOverlayViewController

- (_TtC11WeatherMaps29ScrubberOverlayViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A35ADD0();
}

- (void)loadView
{
  v2 = self;
  sub_20A35AEAC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A35AF58();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_20A35B3B8(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_20A35B590();
}

- (_TtC11WeatherMaps29ScrubberOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_20A38B610();
  }
  id v5 = a4;
  sub_20A35C6F0();
}

- (void).cxx_destruct
{
  sub_20A1CC7A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps29ScrubberOverlayViewController_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps29ScrubberOverlayViewController_scrubberView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps29ScrubberOverlayViewController_scrubberForecastHintView));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11WeatherMaps29ScrubberOverlayViewController_hideTimer);
}

@end