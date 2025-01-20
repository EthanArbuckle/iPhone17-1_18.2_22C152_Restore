@interface WebEmbedViewController
- (NSArray)accessibilityElements;
- (_TtC8NewsFeed22WebEmbedViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed22WebEmbedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleTapWithRecognizer:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation WebEmbedViewController

- (_TtC8NewsFeed22WebEmbedViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C03E431C();
}

- (void)viewDidLoad
{
  v2 = self;
  WebEmbedViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  WebEmbedViewController.viewDidLayoutSubviews()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  WebEmbedViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  WebEmbedViewController.viewDidDisappear(_:)(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = v8.receiver;
  -[WebEmbedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  if (v7[OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_isResizable] == 1) {
    objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_presentationManager], sel_prepareForLegacyResize, v8.receiver, v8.super_class);
  }
  swift_unknownObjectRelease();
}

- (NSArray)accessibilityElements
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_webContentViewController);
  id v3 = self;
  id v4 = objc_msgSend(v2, sel_accessibilityElements);
  if (v4)
  {
    v5 = v4;
    sub_1C151EBCC();

    v6 = (void *)sub_1C151EBAC();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSArray *)v6;
}

- (void)handleTapWithRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C03E47E8();
}

- (_TtC8NewsFeed22WebEmbedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed22WebEmbedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1BFC3E5C0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_onSizeInvalidation));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_contentFrameView));
  swift_weakDestroy();
  sub_1BFC3E5C0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_onEmbedInteraction));

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_preferredContentSizeCategoryOnPopulate));
  sub_1C03E4E64((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_embedURL, (uint64_t (*)(void))sub_1BFF00BEC);
  sub_1C03E4E64((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_dataFeedURL, (uint64_t (*)(void))sub_1BFF00BEC);
  swift_unknownObjectRelease();
  sub_1C03E4E64((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_sourceURL, (uint64_t (*)(void))sub_1BFF00BEC);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_feedConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_webContentViewController));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_configurationProvider);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_webEmbedDataSourceManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_liveActivityWebEmbedDatastoreManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_coordinator);
  sub_1C03E4E64((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_dataVisualization, (uint64_t (*)(void))sub_1BFECFC20);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_stateMachine));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_errorState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_loadedState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_tapGestureRecognizer));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_debugLoadView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_debugVisualizationView);
}

@end