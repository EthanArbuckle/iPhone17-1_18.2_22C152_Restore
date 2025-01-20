@interface ArticleViewController
- (BOOL)accessibilityShouldScroll:(id)a3;
- (BOOL)accessibilityShouldScroll:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canDecreaseTextSize;
- (BOOL)canIncreaseTextSize;
- (BOOL)canResetZoom;
- (BOOL)canZoomIn;
- (BOOL)canZoomOut;
- (BOOL)isPreviewing;
- (BOOL)isShowingHardPaywall;
- (BOOL)resignFirstResponder;
- (BOOL)shouldOccludeAccessibilityElement:(id)a3;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (_TtC12NewsArticles21ArticleViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles21ArticleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)URLHandler:(id)a3 wantsToPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)URLHandler:(id)a3 willOpenURL:(id)a4;
- (void)articleHostViewController:(id)a3 didScrollToPosition:(id)a4;
- (void)articleHostViewControllerDidScrollToBottomOfPrimaryContent:(id)a3;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
- (void)decreaseTextSize;
- (void)didLoadArticle:(id)a3 withContext:(id)a4;
- (void)footerNeedsLayout:(id)a3;
- (void)handleKeyCommandWithKeyCommand:(id)a3;
- (void)increaseTextSize;
- (void)loadingDidFinishWithError:(id)a3;
- (void)loadingWillStart;
- (void)resetZoom;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)zoomIn;
- (void)zoomOut;
@end

@implementation ArticleViewController

- (_TtC12NewsArticles21ArticleViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF5EB948();
}

- (_TtC12NewsArticles21ArticleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles21ArticleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BF5EC47C((uint64_t)self + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_model, (uint64_t (*)(void))type metadata accessor for ArticleModel);
  swift_release();
  swift_release();
  sub_1BF4A7CC8((uint64_t)self + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_pageDelegate);
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleViewController));
  sub_1BF5EC2A0(*(void **)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_presentationContext));
  sub_1BF51EF74(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleGroupData), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleGroupData), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleGroupData));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_footerProvider);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_headerProvider);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_urlHandler));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_keyboardInputMonitor);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_multiDelegate));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_offlineManager);
}

- (void)viewDidLoad
{
  v2 = self;
  ArticleViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  ArticleViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  ArticleViewController.viewDidAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(ArticleViewController *)&v5 viewWillDisappear:v3];
  sub_1BF7DEF18();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  ArticleViewController.viewDidDisappear(_:)(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  id v4 = v10.receiver;
  id v5 = a3;
  [(ArticleViewController *)&v10 traitCollectionDidChange:v5];
  id v6 = objc_msgSend(v4, sel_traitCollection, v10.receiver, v10.super_class);
  id v7 = objc_msgSend(v4, sel_view);
  if (v7)
  {
    v8 = v7;
    id v9 = objc_msgSend(self, sel_whiteColor);
    objc_msgSend(v8, sel_setBackgroundColor_, v9);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  ArticleViewController.viewWillLayoutSubviews()();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ArticleViewController *)&v3 viewDidLayoutSubviews];
  sub_1BF7DEF78();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  id v7 = (char *)v9.receiver;
  -[ArticleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  v8 = (double *)&v7[OBJC_IVAR____TtC12NewsArticles21ArticleViewController_destinationViewSize];
  double *v8 = width;
  v8[1] = height;
  swift_unknownObjectRelease();
}

- (BOOL)resignFirstResponder
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleViewController);
  id v5 = self;
  objc_msgSend(v4, sel_resignFirstResponder);
  v7.receiver = v5;
  v7.super_class = ObjectType;
  LOBYTE(ObjectType) = [(ArticleViewController *)&v7 resignFirstResponder];

  return (char)ObjectType;
}

- (void)handleKeyCommandWithKeyCommand:(id)a3
{
  id v4 = a3;
  id v6 = self;
  char v5 = sub_1BF5E1940(v4);
  if ((_s12NewsArticles21ArticleViewControllerC12isPreviewingSbyF_0() & 1) == 0)
  {
    if (!((*(Class *)((char *)&v6->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController) == 0) | v5 & 1))
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v5) {
LABEL_5:
  }
    objc_msgSend(*(id *)((char *)&v6->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles21ArticleViewController_keyCommandManager), sel_handleKeyCommand_, v4);
LABEL_6:
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)articleHostViewController:(id)a3 didScrollToPosition:(id)a4
{
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = a4;
  id v9 = a4;
  id v10 = a3;
  v11 = self;
  swift_retain();
  sub_1BF4B28C8();

  swift_release();
  swift_release();
}

- (void)articleHostViewControllerDidScrollToBottomOfPrimaryContent:(id)a3
{
  id v4 = a3;
  char v5 = self;
  _s12NewsArticles21ArticleViewControllerC011articleHostdE33DidScrollToBottomOfPrimaryContentyySo09NUArticlegdE0CF_0();
}

- (void)loadingWillStart
{
  uint64_t v3 = (*(void **)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_eventHandler))[4];
  swift_beginAccess();
  if (*(void *)(v3 + 56))
  {
    sub_1BF4A9B28(v3 + 32, (uint64_t)v8);
    uint64_t v4 = v9;
    uint64_t v5 = v10;
    __swift_project_boxed_opaque_existential_1(v8, v9);
    id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 96);
    uint64_t v7 = self;
    v6(v4, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  }
}

- (void)loadingDidFinishWithError:(id)a3
{
  uint64_t v4 = self;
  id v5 = a3;
  ArticleViewController.loadingDidFinishWithError(_:)(a3);
}

- (void)didLoadArticle:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  ArticleViewController.didLoad(_:with:)(v6, v7);
}

- (void)footerNeedsLayout:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s12NewsArticles21ArticleViewControllerC17footerNeedsLayoutyyAA0C10FooterType_So06UIViewE0CXcF_0();
}

- (BOOL)isShowingHardPaywall
{
  return *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController) != 0;
}

- (BOOL)isPreviewing
{
  id v2 = self;
  char v3 = _s12NewsArticles21ArticleViewControllerC12isPreviewingSbyF_0();

  return v3 & 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = (UIScrollView *)a3;
  id v5 = self;
  ArticleViewController.scrollViewDidScroll(_:)(v4);
}

- (BOOL)shouldOccludeAccessibilityElement:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1BF5E71EC(v4);

  return self & 1;
}

- (BOOL)accessibilityShouldScroll:(id)a3 defaultValue:(BOOL)a4
{
  return a4
      && *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController) == 0;
}

- (BOOL)accessibilityShouldScroll:(id)a3
{
  return *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController) == 0;
}

- (BOOL)canIncreaseTextSize
{
  return sub_1BF5E7490((char *)self, (uint64_t)a2, MEMORY[0x1E4FAD930]);
}

- (BOOL)canDecreaseTextSize
{
  return sub_1BF5E7490((char *)self, (uint64_t)a2, MEMORY[0x1E4FAD938]);
}

- (void)increaseTextSize
{
  id v2 = self;
  ArticleViewController.increaseTextSize()();
}

- (void)decreaseTextSize
{
  id v2 = self;
  ArticleViewController.decreaseTextSize()();
}

- (BOOL)canZoomIn
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController))
    return 0;
  char v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleViewController);
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_contentScale);

  return v5 != (id)11;
}

- (BOOL)canZoomOut
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController))
    return 0;
  char v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleViewController);
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_contentScale);

  return v5 != (id)1;
}

- (void)zoomIn
{
  if (!*(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController))
  {
    id v2 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleViewController);
    char v3 = self;
    if (objc_msgSend(v2, sel_contentScale) != (id)11) {
      objc_msgSend(v2, sel_setContentScale_, NUContentScaleIncrease((uint64_t)objc_msgSend(v2, sel_contentScale)));
    }
  }
}

- (void)zoomOut
{
  if (!*(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_hardPaywallViewController))
  {
    id v2 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles21ArticleViewController_articleViewController);
    char v3 = self;
    if (objc_msgSend(v2, sel_contentScale) != (id)1) {
      objc_msgSend(v2, sel_setContentScale_, NUContentScaleDecrease((uint64_t)objc_msgSend(v2, sel_contentScale)));
    }
  }
}

- (BOOL)canResetZoom
{
  id v2 = self;
  Swift::Bool v3 = ArticleViewController.canResetZoom()();

  return v3;
}

- (void)resetZoom
{
  id v2 = self;
  ArticleViewController.resetZoom()();
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s12NewsArticles21ArticleViewControllerC30bundleSubscriptionDidSubscribeyySo08FCBundleG0CF_0();
}

- (void)URLHandler:(id)a3 wantsToPresentViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)URLHandler:(id)a3 willOpenURL:(id)a4
{
  uint64_t v4 = sub_1BF7DD068();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF7DD018();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = ArticleViewController.shouldUpdateFocus(in:)((UIFocusUpdateContext)v4);

  return self & 1;
}

@end