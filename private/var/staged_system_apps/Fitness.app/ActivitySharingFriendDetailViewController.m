@interface ActivitySharingFriendDetailViewController
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (_TtC10FitnessApp41ActivitySharingFriendDetailViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp41ActivitySharingFriendDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC10FitnessApp41ActivitySharingFriendDetailViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ActivitySharingFriendDetailViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10042158C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActivitySharingFriendDetailViewController();
  v4 = (char *)v6.receiver;
  [(ActivitySharingFriendDetailViewController *)&v6 viewDidAppear:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_achievementTransitionAnimator];
  *(void *)&v4[OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_achievementTransitionAnimator] = 0;
}

- (_TtC10FitnessApp41ActivitySharingFriendDetailViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_dataProviderObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_achievementTransitionAnimator) = 0;
  id v4 = a3;

  result = (_TtC10FitnessApp41ActivitySharingFriendDetailViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_1004298A8(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = sub_10042244C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_100423720(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_100423A1C(v6, a4);
  double v9 = v8;

  return v9;
}

- (_TtC10FitnessApp41ActivitySharingFriendDetailViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC10FitnessApp41ActivitySharingFriendDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp41ActivitySharingFriendDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp41ActivitySharingFriendDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_pauseRingsCoordinator));
  swift_release();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_achievementTransitionAnimator);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC10FitnessApp41ActivitySharingFriendDetailViewController_achievementTransitionAnimator));
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

@end