@interface TrophyCaseSectionViewController
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC10FitnessApp31TrophyCaseSectionViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp31TrophyCaseSectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC10FitnessApp31TrophyCaseSectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)preferredContentSizeDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TrophyCaseSectionViewController

- (_TtC10FitnessApp31TrophyCaseSectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10039A838();
}

- (void)dealloc
{
  sub_10007E4EC((Class *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_achievementDataProvider), *(void *)&self->achievementDataProvider[OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_achievementDataProvider+ 8]);
  sub_1000679EC(&qword_100959FC0, (void (*)(uint64_t))type metadata accessor for TrophyCaseSectionViewController);
  id v3 = self;
  dispatch thunk of AAUIAwardsDataProviding.remove(observer:)();

  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for TrophyCaseSectionViewController();
  [(TrophyCaseSectionViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_section;
  uint64_t v4 = type metadata accessor for AAUIAwardsDataProviderSection();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_healthStore));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_achievementDataProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_badgeImageFactory));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_resourceProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_localizationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_workoutFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_workoutDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_friendListManager));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_transitionAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_transitionAnimatorFromViewController));
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_cellHeightsCache);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TrophyCaseSectionViewController();
  uint64_t v4 = (char *)v5.receiver;
  [(TrophyCaseSectionViewController *)&v5 viewWillAppear:v3];
  [v4[OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_localizationProvider] setPaused:[v4[OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_pauseRingsCoordinator] isPaused]];
  sub_100398C00();
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1003989E8(a3);
}

- (void)preferredContentSizeDidChange:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100398C00();
  id v9 = [(TrophyCaseSectionViewController *)v8 collectionView];
  if (v9)
  {
    v10 = v9;
    [v9 reloadData];

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC10FitnessApp31TrophyCaseSectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC10FitnessApp31TrophyCaseSectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp31TrophyCaseSectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp31TrophyCaseSectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_achievements);
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = _CocoaArrayWrapper.endIndex.getter();

  swift_bridgeObjectRelease();
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  v12 = (void *)sub_1003997E4(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  v15 = self;
  id v16 = sub_100399AC8(v14, v11, v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v16;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_100399DD0(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = self;
  id v14 = sub_10039AC18((void *)a4, v11, v12);

  return v14;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  sub_10039AE54((unint64_t)v11);
  double v16 = v15;
  double v18 = v17;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v19 = v16;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  id v10 = [(TrophyCaseSectionViewController *)v9 view];
  if (v10)
  {
    id v13 = v10;
    [v10 bounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v25.origin.x = v15;
    v25.origin.y = v17;
    v25.size.width = v19;
    v25.size.height = v21;
    double Width = CGRectGetWidth(v25);
    double v23 = sub_1006D5398(Width);

    double v11 = Width;
    double v12 = v23;
  }
  else
  {
    __break(1u);
  }
  result.height = v12;
  result.width = v11;
  return result;
}

@end