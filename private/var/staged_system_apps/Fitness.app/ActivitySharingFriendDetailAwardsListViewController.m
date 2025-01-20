@interface ActivitySharingFriendDetailAwardsListViewController
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ActivitySharingFriendDetailAwardsListViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100372898();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActivitySharingFriendDetailAwardsListViewController();
  v4 = (char *)v6.receiver;
  [(ActivitySharingFriendDetailAwardsListViewController *)&v6 viewDidAppear:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController_achievementTransitionAnimator];
  *(void *)&v4[OBJC_IVAR____TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController_achievementTransitionAnimator] = 0;
}

- (_TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100373F24();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
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

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_1003731D4(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_100373FDC((uint64_t)v11);
  double v16 = v15;
  double v18 = v17;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v19 = v16;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100373644(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController_cellHeightsCache));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController_achievementTransitionAnimator);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController_achievementTransitionAnimator));
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

@end