@interface ArcadeSubscribeViewController
- (_TtC8AppStore29ArcadeSubscribeViewController)initWithCoder:(id)a3;
- (_TtC8AppStore29ArcadeSubscribeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)as_viewDidBecomeFullyVisible;
- (void)as_viewDidBecomePartiallyVisible;
- (void)as_viewWillBecomeFullyVisible;
- (void)as_viewWillBecomePartiallyVisible;
- (void)dealloc;
- (void)dismissPressed:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ArcadeSubscribeViewController

- (_TtC8AppStore29ArcadeSubscribeViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_overlayViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_fallbackDismissButton) = 0;
  *(void *)&self->lifecycleObserver[OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_delayedDismissalReappearanceItem) = 0;
  id v5 = a3;

  result = (_TtC8AppStore29ArcadeSubscribeViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  id v5 = self;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:v5];

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(ArcadeSubscribeViewController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)self + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_lifecycleObserver);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_pageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_overlayViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_fallbackDismissButton));
  sub_100092F18((uint64_t)self + OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_delegate);

  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  ArcadeSubscribeViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  ArcadeSubscribeViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  ArcadeSubscribeViewController.viewDidAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  ArcadeSubscribeViewController.viewWillDisappear(_:)(a3);
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
  [(ArcadeSubscribeViewController *)&v11 viewDidDisappear:v3];
  sub_100081D90((Class *)((char *)&v10->super.super.super.isa+ OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_lifecycleObserver), *(void *)&v10->lifecycleObserver[OBJC_IVAR____TtC8AppStore29ArcadeSubscribeViewController_lifecycleObserver + 16]);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v6);
  dispatch thunk of StoreViewControllerLifecycleObserver.observe(lifecycleEvent:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)as_viewWillBecomeFullyVisible
{
}

- (void)as_viewDidBecomeFullyVisible
{
  v2 = self;
  ArcadeSubscribeViewController.as_viewDidBecomeFullyVisible()();
}

- (void)as_viewWillBecomePartiallyVisible
{
  v2 = self;
  ArcadeSubscribeViewController.as_viewWillBecomePartiallyVisible()();
}

- (void)as_viewDidBecomePartiallyVisible
{
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  ArcadeSubscribeViewController.viewWillLayoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  id v5 = a3;
  [(ArcadeSubscribeViewController *)&v8 traitCollectionDidChange:v5];
  id v6 = [v4 view];
  if (v6)
  {
    uint64_t v7 = v6;
    [v6 setNeedsLayout];
  }
  else
  {
    __break(1u);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(ArcadeSubscribeViewController *)v2 traitCollection];
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
}

- (void)appExitedWhileAppeared
{
}

- (void)dismissPressed:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_1006251B8();

  sub_100082BCC((uint64_t)v6, (uint64_t *)&unk_100982B40);
}

- (_TtC8AppStore29ArcadeSubscribeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore29ArcadeSubscribeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end