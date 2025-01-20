@interface ArticleViewerViewController
- (_TtC12NewsArticles27ArticleViewerViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles27ArticleViewerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)dealloc;
- (void)enableNavigation:(BOOL)a3;
- (void)smartInvertStatusDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ArticleViewerViewController

- (void)dealloc
{
  v2 = self;
  ArticleViewerViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_pageViewController));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_blueprintProvider);
  swift_release();
  swift_release();
  sub_1BF4C35A0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_prewarm));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_barCompressionManager));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_barCompressionAnimationFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_articleViewerImpressionManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_interstitialAdManager);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_featureManager);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1BF4C35A0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_onPagePresented));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_shareMenuItemManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_featureAvailability);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_offlineManager));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_sharedItemManager;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (_TtC12NewsArticles27ArticleViewerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s12NewsArticles27ArticleViewerViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)smartInvertStatusDidChange
{
  v2 = self;
  v5.value.super.Class isa = (Class)[(ArticleViewerViewController *)v2 traitCollection];
  Class isa = v5.value.super.isa;
  ArticleViewerViewController.traitCollectionDidChange(_:)(v5);
}

- (_TtC12NewsArticles27ArticleViewerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles27ArticleViewerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  ArticleViewerViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  ArticleViewerViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  ArticleViewerViewController.viewDidAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  ArticleViewerViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  ArticleViewerViewController.viewDidDisappear(_:)(a3);
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(ArticleViewerViewController *)&v4 viewWillLayoutSubviews];
  id v3 = objc_msgSend(self, sel_currentTraitCollection, v4.receiver, v4.super_class);
  sub_1BF6C7888();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ArticleViewerViewController *)&v3 viewDidLayoutSubviews];
  sub_1BF7DEF78();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.Class isa = (Class)a3;
  ArticleViewerViewController.traitCollectionDidChange(_:)(v9);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  ArticleViewerViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)enableNavigation:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = self;
  if (v3) {
    sub_1BF6B68D4();
  }
  sub_1BF7DF468();
}

@end