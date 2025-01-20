@interface BrowsingViewController
- (_TtC9SeymourUI22BrowsingViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI22BrowsingViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC9SeymourUI22BrowsingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9SeymourUI22BrowsingViewController)initWithRootViewController:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (void)scrollToTop;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BrowsingViewController

- (_TtC9SeymourUI22BrowsingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A7F07AC();
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BrowsingViewController();
  v2 = (char *)v4.receiver;
  [(BrowsingViewController *)&v4 viewDidLoad];
  uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_pictureInPicturePresenter]
     + OBJC_IVAR____TtC9SeymourUI25PictureInPicturePresenter_display;
  swift_beginAccess();
  *(void *)(v3 + 8) = &protocol witness table for BrowsingViewController;
  swift_unknownObjectWeakAssign();
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_23A7ECACC(a3);
}

- (int64_t)preferredStatusBarStyle
{
  v2 = self;
  uint64_t v3 = (_TtC9SeymourUI22BrowsingViewController *)[(BrowsingViewController *)v2 topViewController];
  if (v3)
  {
    objc_super v4 = v3;
    int64_t v5 = [(BrowsingViewController *)v3 preferredStatusBarStyle];

    v2 = v4;
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BrowsingViewController();
  swift_unknownObjectRetain();
  v7 = (char *)v8.receiver;
  -[BrowsingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_paletteViewController], sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height, v8.receiver, v8.super_class);
  swift_unknownObjectRelease();
}

- (void)scrollToTop
{
  v2 = self;
  sub_23A7EDEE8();
}

- (_TtC9SeymourUI22BrowsingViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC9SeymourUI22BrowsingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI22BrowsingViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC9SeymourUI22BrowsingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI22BrowsingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI22BrowsingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_purchaseCoordinator));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_pictureInPicturePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_purchaseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_rootViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_siriUserActivityHandler);
  id v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController__analyticsConsentShowingEnabled;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF5F7F0);
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v6((char *)self + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController__forceAnalayticsConsentAcknowledgement, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_palette));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_paletteViewController));
  sub_23A7F0A44((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController_planCompletionTracker, (uint64_t (*)(void))type metadata accessor for PlanCompletionPresentationTracker);
  int64_t v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI22BrowsingViewController__welcomeAcknowledgementShowingEnabled;

  v6(v5, v4);
}

@end