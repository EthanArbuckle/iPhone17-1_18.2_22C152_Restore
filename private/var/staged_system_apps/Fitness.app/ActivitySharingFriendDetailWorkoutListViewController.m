@interface ActivitySharingFriendDetailWorkoutListViewController
- (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation ActivitySharingFriendDetailWorkoutListViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1006BC78C();
}

- (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController_dataProviderObserver) = 0;
  id v4 = a3;

  result = (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = a3;
  v7 = self;
  static Published.subscript.getter();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    int64_t v8 = _CocoaArrayWrapper.endIndex.getter();

    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v8 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
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
  v12 = (void *)sub_1006BD0BC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end