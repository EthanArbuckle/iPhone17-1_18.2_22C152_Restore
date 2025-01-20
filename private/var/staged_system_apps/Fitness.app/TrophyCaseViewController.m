@interface TrophyCaseViewController
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (_TtC10FitnessApp24TrophyCaseViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp24TrophyCaseViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC10FitnessApp24TrophyCaseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)pregnancyModelDidChangeWithProvider:(id)a3 model:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4;
@end

@implementation TrophyCaseViewController

- (_TtC10FitnessApp24TrophyCaseViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10035E2D0();
}

- (void)dealloc
{
  sub_10007E4EC((Class *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_achievementDataProvider), *(void *)&self->achievementDataProvider[OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_achievementDataProvider]);
  sub_10006795C(&qword_10095B880, v3, (void (*)(uint64_t))type metadata accessor for TrophyCaseViewController);
  v4 = self;
  dispatch thunk of AAUIAwardsDataProviding.remove(observer:)();

  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for TrophyCaseViewController();
  [(TrophyCaseViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_friendListManager));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_achievementDataProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_badgeImageFactory));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_localizationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_resourceProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_workoutFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_workoutDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_wheelchairUseCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_initialAchievement));
  sub_10019B9F8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_transitionAnimator));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_transitionAnimatorFromViewController);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10035A398(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TrophyCaseViewController();
  id v4 = v5.receiver;
  [(TrophyCaseViewController *)&v5 viewWillAppear:v3];
  sub_10035A498();
}

- (_TtC10FitnessApp24TrophyCaseViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC10FitnessApp24TrophyCaseViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp24TrophyCaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp24TrophyCaseViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_10035E3A8(a4);
  int64_t v9 = v8;

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
  v11 = self;
  v12 = (void *)sub_10035C358(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10035E5E8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
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
  id v16 = sub_10035D6D4(v14, v11, v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v16;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = self;
  id v14 = (void *)sub_10035E958((void *)a4, v11, v12);

  return v14;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
}

- (void)pregnancyModelDidChangeWithProvider:(id)a3 model:(id)a4
{
  uint64_t v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_localizationProvider);
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  [v6 setIsPregnant:[v7 isPregnant]];
}

@end