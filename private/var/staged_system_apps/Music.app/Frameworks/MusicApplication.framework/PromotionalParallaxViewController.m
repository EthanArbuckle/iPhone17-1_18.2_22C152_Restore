@interface PromotionalParallaxViewController
- (_TtC16MusicApplication33PromotionalParallaxViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication33PromotionalParallaxViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation PromotionalParallaxViewController

- (_TtC16MusicApplication33PromotionalParallaxViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_AB6510();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  v9 = (_TtC16MusicApplication33PromotionalParallaxViewController *)sub_3A6DB0(v5, v7, (uint64_t)a4);

  return v9;
}

- (void)dealloc
{
  v2 = self;
  PromotionalParallaxViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_contentViewConfigurationHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_sourceScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_pageHeaderContentViewController));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_pendingCompletionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_headerItem));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_promotionalImageryView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_promotionalParallaxContentView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_upsellBannerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_sourceScrollViewContentSizeObserver));
  swift_release();

  swift_release();
}

- (_TtC16MusicApplication33PromotionalParallaxViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s16MusicApplication33PromotionalParallaxViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (int64_t)preferredStatusBarStyle
{
  v2 = self;
  int64_t v3 = PromotionalParallaxViewController.preferredStatusBarStyle.getter();

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  PromotionalParallaxViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  PromotionalParallaxViewController.viewDidAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  PromotionalParallaxViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  [(PromotionalParallaxViewController *)&v5 viewDidDisappear:v3];
  sub_3A3B40();
  if (*(void *)&v4[OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_artworkVideoPlaybackController])
  {
    swift_retain();
    sub_3C0680();

    swift_release();
  }
  else
  {
  }
}

- (void)loadView
{
  v2 = self;
  PromotionalParallaxViewController.loadView()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  v9.is_nil = (char)v6;
  uint64_t v7 = v6;
  v9.value.super.isa = (Class)a3;
  PromotionalParallaxViewController.traitCollectionDidChange(_:)(v9);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  PromotionalParallaxViewController.viewDidLayoutSubviews()();
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v2 = (char *)v7.receiver;
  [(PromotionalParallaxViewController *)&v7 viewDidLoad];
  uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC16MusicApplication33PromotionalParallaxViewController_textDrawingCache];
  id v4 = [v2 traitCollection];
  [v4 displayScale];
  uint64_t v6 = v5;

  swift_beginAccess();
  *(void *)(v3 + 16) = v6;
  sub_11F438();
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  v9.is_nil = (char)v6;
  objc_super v7 = v6;
  v9.value.super.super.isa = (Class)a3;
  PromotionalParallaxViewController.willMove(toParent:)(v9);
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  v9.is_nil = (char)v6;
  objc_super v7 = v6;
  v9.value.super.super.isa = (Class)a3;
  PromotionalParallaxViewController.didMove(toParent:)(v9);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  id v8 = self;
  PromotionalParallaxViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

@end