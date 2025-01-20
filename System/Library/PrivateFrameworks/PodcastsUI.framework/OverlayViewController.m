@interface OverlayViewController
- (_TtC10PodcastsUI21OverlayViewController)initWithCoder:(id)a3;
- (_TtC10PodcastsUI21OverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation OverlayViewController

- (_TtC10PodcastsUI21OverlayViewController)initWithCoder:(id)a3
{
  result = (_TtC10PodcastsUI21OverlayViewController *)sub_1E3E7DF80();
  __break(1u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  OverlayViewController.viewDidLoad()();
}

- (_TtC10PodcastsUI21OverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10PodcastsUI21OverlayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI21OverlayViewController_overlayView));
}

@end