@interface FullscreenNowPlayingViewController
- (_TtC12NowPlayingUI34FullscreenNowPlayingViewController)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI34FullscreenNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FullscreenNowPlayingViewController

- (_TtC12NowPlayingUI34FullscreenNowPlayingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_E498();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_D4B4();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FullscreenNowPlayingViewController();
  v4 = v7.receiver;
  [(FullscreenNowPlayingViewController *)&v7 viewWillAppear:v3];
  BOOL v5 = sub_DC8C();
  uint64_t v6 = v4[OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_layoutMode];
  v4[OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_layoutMode] = v5;
  sub_CF04(v6);
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FullscreenNowPlayingViewController();
  v2 = v5.receiver;
  [(FullscreenNowPlayingViewController *)&v5 viewDidLayoutSubviews];
  BOOL v3 = sub_DC8C();
  uint64_t v4 = v2[OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_layoutMode];
  v2[OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_layoutMode] = v3;
  sub_CF04(v4);
}

- (_TtC12NowPlayingUI34FullscreenNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NowPlayingUI34FullscreenNowPlayingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_nowPlayingControlsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_nowPlayingDetailsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_splitStack));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI34FullscreenNowPlayingViewController_sheetGrabber);
}

@end