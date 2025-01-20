@interface PathProgressSliderViewController
- (_TtC18KaleidoscopePoster32PathProgressSliderViewController)initWithCoder:(id)a3;
- (_TtC18KaleidoscopePoster32PathProgressSliderViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)sliderValueDidChangeWithSender:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PathProgressSliderViewController

- (_TtC18KaleidoscopePoster32PathProgressSliderViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100023CA8();
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)UIView);
  v4 = self;
  id v5 = objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, 100.0, 200.0);
  [(PathProgressSliderViewController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100022928();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1000230C8();
}

- (void)sliderValueDidChangeWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100023634(v4);
}

- (_TtC18KaleidoscopePoster32PathProgressSliderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18KaleidoscopePoster32PathProgressSliderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_pathSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_zoomSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_pathValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_zoomValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_backgroundView));
  sub_100014E64((uint64_t)self + OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_sliderDelegate, &qword_10003BEE0);
}

@end