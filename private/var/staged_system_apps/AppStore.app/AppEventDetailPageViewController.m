@interface AppEventDetailPageViewController
- (BOOL)accessibilityPerformEscape;
- (NSArray)keyCommands;
- (_TtC8AppStore32AppEventDetailPageViewController)initWithCoder:(id)a3;
- (_TtC8AppStore32AppEventDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)closeButtonPressed:(uint64_t)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)as_viewDidBecomeFullyVisible;
- (void)as_viewDidBecomePartiallyVisible;
- (void)as_viewWillBecomeFullyVisible;
- (void)as_viewWillBecomePartiallyVisible;
- (void)handleDismissKeyCommandWithCommand:(id)a3;
- (void)lockupTapGestureRecognized:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AppEventDetailPageViewController

- (_TtC8AppStore32AppEventDetailPageViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_isCollapsing) = 0;
  id v4 = a3;

  result = (_TtC8AppStore32AppEventDetailPageViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = type metadata accessor for StoreViewControllerLifecycleEvent();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9.receiver = self;
  v9.super_class = ObjectType;
  v8 = self;
  [(AppEventDetailPageViewController *)&v9 viewDidLoad];
  sub_100081D90((Class *)((char *)&v8->super.super.super.isa+ OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_lifecycleObserver), *(void *)&v8->lifecycleObserver[OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_lifecycleObserver + 16]);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for StoreViewControllerLifecycleEvent.didLoad(_:), v4);
  dispatch thunk of StoreViewControllerLifecycleObserver.observe(lifecycleEvent:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  dispatch thunk of BasePresenter.didLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1001DF758(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1001DF9F8(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1001DFDB4(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1001E0180(a3);
}

- (void)as_viewWillBecomeFullyVisible
{
  v2 = self;
  sub_1001E0A1C((SEL *)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:), (void (*)(uint64_t))&dispatch thunk of VideoPlaybackCoordinator.resumeAutoPlayVideo());
}

- (void)as_viewDidBecomeFullyVisible
{
  v2 = self;
  sub_1001E0600();
}

- (void)as_viewWillBecomePartiallyVisible
{
  v2 = self;
  sub_1001E0800();
}

- (void)as_viewDidBecomePartiallyVisible
{
  v2 = self;
  sub_1001E0A1C((SEL *)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), (void (*)(uint64_t))&dispatch thunk of VideoPlaybackCoordinator.pauseAutoPlayVideo());
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1001E0C1C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1001E0DA0(a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(AppEventDetailPageViewController *)v2 traitCollection];
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
  sub_1001E1048();
}

- (void)appExitedWhileAppeared
{
  uint64_t v3 = type metadata accessor for StoreViewControllerLifecycleEvent();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100081D90((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_lifecycleObserver), *(void *)&self->lifecycleObserver[OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_lifecycleObserver+ 16]);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for StoreViewControllerLifecycleEvent.appExitedWhileAppeared(_:), v3);
  v7 = self;
  dispatch thunk of StoreViewControllerLifecycleObserver.observe(lifecycleEvent:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (uint64_t)closeButtonPressed:(uint64_t)a3
{
  uint64_t v5 = type metadata accessor for StoreViewControllerLifecycleEvent();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    id v9 = a1;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    id v10 = a1;
  }
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for StoreViewControllerLifecycleEvent.dismissedByBackButton(_:), v5);
  type metadata accessor for AppEventDetailPagePresenter();
  sub_1001E2E34(&qword_100988BB8, 255, (void (*)(uint64_t))&type metadata accessor for AppEventDetailPagePresenter);
  MetricsPagePresenter.observe(lifecycleEvent:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  [a1 dismissViewControllerAnimated:1 completion:0];

  return sub_100082BCC((uint64_t)v12, (uint64_t *)&unk_100982B40);
}

- (void)lockupTapGestureRecognized:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_1001E14D4();

  sub_100082BCC((uint64_t)v6, (uint64_t *)&unk_100982B40);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3 = type metadata accessor for StoreViewControllerLifecycleEvent();
  uint64_t v4 = *(void *)(v3 - 8);
  __n128 v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v4 + 104))(v7, enum case for StoreViewControllerLifecycleEvent.dismissedByBackButton(_:), v3, v5);
  type metadata accessor for AppEventDetailPagePresenter();
  sub_1001E2E34(&qword_100988BB8, 255, (void (*)(uint64_t))&type metadata accessor for AppEventDetailPagePresenter);
  uint64_t v8 = self;
  MetricsPagePresenter.observe(lifecycleEvent:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  [(AppEventDetailPageViewController *)v8 dismissViewControllerAnimated:1 completion:0];

  return 1;
}

- (NSArray)keyCommands
{
  v2 = self;
  unint64_t v3 = sub_1001E27BC();

  if (v3)
  {
    sub_100084CF0(0, (unint64_t *)&qword_100989350);
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
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v6 + 104))(v9, enum case for StoreViewControllerLifecycleEvent.dismissedByBackButton(_:), v5, v7);
  type metadata accessor for AppEventDetailPagePresenter();
  sub_1001E2E34(&qword_100988BB8, 255, (void (*)(uint64_t))&type metadata accessor for AppEventDetailPagePresenter);
  id v10 = a3;
  v11 = self;
  MetricsPagePresenter.observe(lifecycleEvent:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  [(AppEventDetailPageViewController *)v11 dismissViewControllerAnimated:1 completion:0];
}

- (_TtC8AppStore32AppEventDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore32AppEventDetailPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)self + OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_lifecycleObserver);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_pageView));
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore32AppEventDetailPageViewController_containerTransitioningDelegate);
}

@end