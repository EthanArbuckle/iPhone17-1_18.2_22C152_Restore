@interface AppPromotionDetailPageViewController
- (BOOL)accessibilityPerformEscape;
- (NSArray)keyCommands;
- (_TtC8AppStore36AppPromotionDetailPageViewController)initWithCoder:(id)a3;
- (_TtC8AppStore36AppPromotionDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)as_viewDidBecomeFullyVisible;
- (void)as_viewDidBecomePartiallyVisible;
- (void)as_viewWillBecomeFullyVisible;
- (void)as_viewWillBecomePartiallyVisible;
- (void)handleDismissKeyCommandWithCommand:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AppPromotionDetailPageViewController

- (_TtC8AppStore36AppPromotionDetailPageViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore36AppPromotionDetailPageViewController_isCollapsing) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore36AppPromotionDetailPageViewController_learnMoreActionMetrics;
  uint64_t v6 = type metadata accessor for ActionMetrics();
  v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7((char *)self + OBJC_IVAR____TtC8AppStore36AppPromotionDetailPageViewController_backButtonActionMetrics, 1, 1, v6);
  v7((char *)self + OBJC_IVAR____TtC8AppStore36AppPromotionDetailPageViewController_closeButtonActionMetrics, 1, 1, v6);
  id v8 = a3;

  result = (_TtC8AppStore36AppPromotionDetailPageViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001EAD18();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1001EAEE4(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1001EB18C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1001EB548(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1001EB914(a3);
}

- (void)as_viewWillBecomeFullyVisible
{
  v2 = self;
  sub_1001EC08C((SEL *)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:), (void (*)(uint64_t))&dispatch thunk of VideoPlaybackCoordinator.resumeAutoPlayVideo());
}

- (void)as_viewDidBecomeFullyVisible
{
  v2 = self;
  sub_1001EBC70();
}

- (void)as_viewWillBecomePartiallyVisible
{
  v2 = self;
  sub_1001EBE70();
}

- (void)as_viewDidBecomePartiallyVisible
{
  v2 = self;
  sub_1001EC08C((SEL *)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), (void (*)(uint64_t))&dispatch thunk of VideoPlaybackCoordinator.pauseAutoPlayVideo());
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1001EC28C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1001EC410(a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(AppPromotionDetailPageViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)appEnteredWhileAppeared
{
  v2 = self;
  sub_1001EC6B8();
}

- (void)appExitedWhileAppeared
{
  uint64_t v3 = type metadata accessor for StoreViewControllerLifecycleEvent();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100081D90((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore36AppPromotionDetailPageViewController_lifecycleObserver), *(void *)&self->lifecycleObserver[OBJC_IVAR____TtC8AppStore36AppPromotionDetailPageViewController_lifecycleObserver+ 16]);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for StoreViewControllerLifecycleEvent.appExitedWhileAppeared(_:), v3);
  v7 = self;
  dispatch thunk of StoreViewControllerLifecycleObserver.observe(lifecycleEvent:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3 = type metadata accessor for StoreViewControllerLifecycleEvent();
  uint64_t v4 = *(void *)(v3 - 8);
  __n128 v5 = __chkstk_darwin(v3);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v4 + 104))(v7, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v3, v5);
  type metadata accessor for AppPromotionDetailPagePresenter();
  sub_1001EF480(&qword_100988E90, (void (*)(uint64_t))&type metadata accessor for AppPromotionDetailPagePresenter);
  uint64_t v8 = self;
  MetricsPagePresenter.observe(lifecycleEvent:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  [(AppPromotionDetailPageViewController *)v8 dismissViewControllerAnimated:1 completion:0];

  return 1;
}

- (NSArray)keyCommands
{
  v2 = self;
  unint64_t v3 = sub_1001EDBA4();

  if (v3)
  {
    sub_1001EF440();
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)handleDismissKeyCommandWithCommand:(id)a3
{
  uint64_t v5 = type metadata accessor for StoreViewControllerLifecycleEvent();
  uint64_t v6 = *(void *)(v5 - 8);
  __n128 v7 = __chkstk_darwin(v5);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v6 + 104))(v9, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v5, v7);
  type metadata accessor for AppPromotionDetailPagePresenter();
  sub_1001EF480(&qword_100988E90, (void (*)(uint64_t))&type metadata accessor for AppPromotionDetailPagePresenter);
  id v10 = a3;
  v11 = self;
  MetricsPagePresenter.observe(lifecycleEvent:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  [(AppPromotionDetailPageViewController *)v11 dismissViewControllerAnimated:1 completion:0];
}

- (_TtC8AppStore36AppPromotionDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore36AppPromotionDetailPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AppPromotionDetailPageViewController_detailPageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AppPromotionDetailPageViewController_containerTransitioningDelegate));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore36AppPromotionDetailPageViewController_learnMoreActionMetrics, &qword_100988E80);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore36AppPromotionDetailPageViewController_backButtonActionMetrics, &qword_100988E80);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore36AppPromotionDetailPageViewController_closeButtonActionMetrics, &qword_100988E80);
}

@end