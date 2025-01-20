@interface ArcadeWelcomeViewController
- (_TtC8AppStore27ArcadeWelcomeViewController)initWithCoder:(id)a3;
- (_TtC8AppStore27ArcadeWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ArcadeWelcomeViewController

- (_TtC8AppStore27ArcadeWelcomeViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_overlayViewController) = 0;
  id v4 = a3;

  result = (_TtC8AppStore27ArcadeWelcomeViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_100568E98();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1005690A8();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_100569318(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_100569578(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1005698A4(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = type metadata accessor for StoreViewControllerLifecycleEvent();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11.receiver = self;
  v11.super_class = ObjectType;
  v10 = self;
  [(ArcadeWelcomeViewController *)&v11 viewDidDisappear:v3];
  sub_100081D90((Class *)((char *)&v10->super.super.super.isa+ OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_lifecycleObserver), *(void *)&v10->artworkLoader[OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_lifecycleObserver]);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v6);
  dispatch thunk of StoreViewControllerLifecycleObserver.observe(lifecycleEvent:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)appEnteredWhileAppeared
{
}

- (void)appExitedWhileAppeared
{
}

- (_TtC8AppStore27ArcadeWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore27ArcadeWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)self + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_lifecycleObserver);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_pageView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore27ArcadeWelcomeViewController_overlayViewController);
}

@end