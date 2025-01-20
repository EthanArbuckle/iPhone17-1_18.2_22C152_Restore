@interface StandaloneMiniPlayerViewController
- (_TtC12NowPlayingUI34StandaloneMiniPlayerViewController)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI34StandaloneMiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation StandaloneMiniPlayerViewController

- (_TtC12NowPlayingUI34StandaloneMiniPlayerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s12NowPlayingUI34StandaloneMiniPlayerViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  v2 = self;
  StandaloneMiniPlayerViewController.viewDidLoad()();
}

- (_TtC12NowPlayingUI34StandaloneMiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NowPlayingUI34StandaloneMiniPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI34StandaloneMiniPlayerViewController_paletteView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI34StandaloneMiniPlayerViewController_miniPlayerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI34StandaloneMiniPlayerViewController_miniPlayerPaletteInteraction));

  swift_release();
}

@end