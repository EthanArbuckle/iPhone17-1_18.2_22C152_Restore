@interface PDFReplicaViewerViewController
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (NSArray)keyCommands;
- (_TtC12NewsArticles30PDFReplicaViewerViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles30PDFReplicaViewerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarUpdateAnimation;
- (void)didMoveToParentViewController:(id)a3;
- (void)nextPageKeyCommand;
- (void)previousPageKeyCommand;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PDFReplicaViewerViewController

- (BOOL)prefersStatusBarHidden
{
  v2 = self;
  char v3 = sub_1BF4AA128();

  return v3 & 1;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_barVisibilityAnimator);
  if (v2) {
    return *(unsigned char *)(*(void *)(v2 + OBJC_IVAR____TtC12NewsArticles37PDFReplicaBarVisibilityAnimatorForiOS_barHider)
  }
                    + 32) & 1;
  else {
    return 0;
  }
}

- (_TtC12NewsArticles30PDFReplicaViewerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF4B009C();
}

- (_TtC12NewsArticles30PDFReplicaViewerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles30PDFReplicaViewerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_styler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_renderer);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_sessionManager);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_issue);
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_pageViewController));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_toolbarCoverFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_tableOfContentsVisibilityProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_paywallFactory);
  id v4 = (char *)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_paywall;
  uint64_t v5 = sub_1BF7DE6A8();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_paywallViewController));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_featureAvailability);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_newsPlusLabelVisibilityProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_newsPlusLabelItem));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_sharingActivityItemFactory);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_subscriptionController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_backButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_nextButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_coverButton));
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_1BF4AA8C8();
}

- (void)viewDidLayoutSubviews
{
  uint64_t v2 = self;
  sub_1BF4AC6B0();
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1BF4B15F4();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1BF4ACB58(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1BF4AD598(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(PDFReplicaViewerViewController *)&v5 viewWillDisappear:v3];
  sub_1BF7DEF18();
  swift_getObjectType();
  sub_1BF7DF4F8();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1BF4AE1A4(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1BF4AE390((uint64_t)a3);
}

- (NSArray)keyCommands
{
  uint64_t v2 = self;
  uint64_t v3 = sub_1BF4AF2CC();

  if (v3)
  {
    sub_1BF4A7104(0, (unint64_t *)&unk_1EBA5B2A0);
    id v4 = (void *)sub_1BF7E3C68();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)previousPageKeyCommand
{
  uint64_t v2 = self;
  sub_1BF7DF4A8();
}

- (void)nextPageKeyCommand
{
  uint64_t v2 = self;
  sub_1BF7DF478();
}

@end