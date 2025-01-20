@interface PuzzleViewController
- (_TtC7NewsUI220PuzzleViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI220PuzzleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)modalHostViewDidAppear;
- (void)modalHostViewDidDisappear;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PuzzleViewController

- (_TtC7NewsUI220PuzzleViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DFB984E8();
}

- (_TtC7NewsUI220PuzzleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI220PuzzleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_fullScreenModalDelegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_styler);
  swift_unknownObjectRelease();
  sub_1DFB99368((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_puzzleModel, (uint64_t (*)(void))type metadata accessor for PuzzleModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_puzzleViewConfig));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_puzzleEmbedViewController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_hardPaywallViewController));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_historyService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_puzzleNavigationBarThemeProvider);
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_publisherLogoProvider);
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_currentAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_publisherLogo));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_paywall;
  uint64_t v4 = sub_1DFDEF710();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1DFB99368((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_currentPuzzleColorTheme, (uint64_t (*)(void))sub_1DFB8EA88);
  swift_bridgeObjectRelease();
  swift_release();
  sub_1DFB99368((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController____lazy_storage___radarBarButtonItem, (uint64_t (*)(void))sub_1DFB8EABC);
  sub_1DF2C5184(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC7NewsUI220PuzzleViewController____lazy_storage___markerBarButtonItem));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_onboardingManager);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  swift_release();
  swift_unknownObjectRelease();
  sub_1DEABEEF0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_embedDidLoadCompletion));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_transitionEffectView));
  swift_release();
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI220PuzzleViewController_titleView);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DFB8EB54();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1DFB8EF50(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1DFB8FCC0(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1DFB902B4(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1DFB90994(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DFB91010();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1DFB91244(a3);
}

- (void)modalHostViewDidAppear
{
  v2 = self;
  sub_1DFB93F04(0, 2);
}

- (void)modalHostViewDidDisappear
{
  id v3 = self;
  id v2 = [(PuzzleViewController *)v3 presentedViewController];

  if (!v2)
  {
    sub_1DFB93F04(1, 2);
    sub_1DFB92350();
  }
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DFB99654();
}

@end