@interface TrophyCaseAwardDetailViewController
- (AAUIBadgeView)badgeView;
- (CGRect)badgeFrame;
- (_TtC10FitnessApp35TrophyCaseAwardDetailViewController)initWithAchievement:(id)a3 healthStore:(id)a4 friendListManager:(id)a5 achievementDataProvider:(id)a6 badgeImageFactory:(id)a7 resourceProvider:(id)a8 formattingManager:(id)a9 localizationProvider:(id)a10 pauseRingsCoordinator:(id)a11 fitnessAppContext:(id)a12 workoutFormattingManager:(id)a13 workoutDataProvider:(id)a14 forModalPresentation:(BOOL)a15 shouldShowCelebration:(BOOL)a16 shouldShowEarned:(BOOL)a17 shouldShowAssociatedWorkout:(BOOL)a18;
- (_TtC10FitnessApp35TrophyCaseAwardDetailViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp35TrophyCaseAwardDetailViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC10FitnessApp35TrophyCaseAwardDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)appWillResignActive:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)doneTapped:(id)a3;
- (void)placeBadgeViewInContainer;
- (void)playerFinished:(id)a3;
- (void)shareTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TrophyCaseAwardDetailViewController

- (AAUIBadgeView)badgeView
{
  return (AAUIBadgeView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                  + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_badgeView));
}

- (_TtC10FitnessApp35TrophyCaseAwardDetailViewController)initWithAchievement:(id)a3 healthStore:(id)a4 friendListManager:(id)a5 achievementDataProvider:(id)a6 badgeImageFactory:(id)a7 resourceProvider:(id)a8 formattingManager:(id)a9 localizationProvider:(id)a10 pauseRingsCoordinator:(id)a11 fitnessAppContext:(id)a12 workoutFormattingManager:(id)a13 workoutDataProvider:(id)a14 forModalPresentation:(BOOL)a15 shouldShowCelebration:(BOOL)a16 shouldShowEarned:(BOOL)a17 shouldShowAssociatedWorkout:(BOOL)a18
{
  uint64_t ObjectType = swift_getObjectType();
  sub_10008E75C((uint64_t)a6 + OBJC_IVAR___CHAwardsDataProvider_awardsDataProvider, (uint64_t)v39);
  uint64_t v24 = v40;
  uint64_t v34 = v41;
  uint64_t v37 = sub_1000DDC00((uint64_t)v39, v40);
  id v35 = a3;
  id v25 = a4;
  id v26 = a5;
  id v36 = a6;
  id v27 = a7;
  id v28 = a8;
  id v29 = a9;
  id v30 = a10;
  *(void *)&long long v33 = a11;
  *((void *)&v33 + 1) = a12;
  v31 = (_TtC10FitnessApp35TrophyCaseAwardDetailViewController *)sub_1006C8960(v35, v25, v26, v37, v27, v28, v29, v30, v33, a13, a14, a15, a16, a17, a18, 0, ObjectType, v24, v34);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)v39);

  swift_deallocPartialClassInstance();
  return v31;
}

- (_TtC10FitnessApp35TrophyCaseAwardDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006C8DC8();
}

- (void)dealloc
{
  sub_10007E4EC((Class *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_achievementDataProvider), *(void *)&self->achievementDataProvider[OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_achievementDataProvider]);
  sub_100067C2C((unint64_t *)&unk_10095B790, v3, (void (*)(uint64_t))type metadata accessor for TrophyCaseAwardDetailViewController);
  v4 = self;
  dispatch thunk of AAUIAwardsDataProviding.remove(observer:)();

  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for TrophyCaseAwardDetailViewController();
  [(TrophyCaseAwardDetailViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_achievement));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_healthStore));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_achievementDataProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_badgeImageFactory));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_resourceProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_localizationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_workoutFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_workoutDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_celebrationVideoContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_badgeViewCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_associatedWorkout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_avPlayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_avPlayerLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_sharingImage));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_friendListManager));

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TrophyCaseAwardDetailViewController();
  id v2 = v3.receiver;
  [(TrophyCaseAwardDetailViewController *)&v3 viewDidLoad];
  sub_1006C4A98();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1006C51C4(a3);
}

- (void)viewWillLayoutSubviews
{
  id v2 = self;
  sub_1006C52B4();
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TrophyCaseAwardDetailViewController();
  id v2 = (char *)v6.receiver;
  [(TrophyCaseAwardDetailViewController *)&v6 viewDidLayoutSubviews];
  objc_super v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_avPlayerLayer];
  if (v3)
  {
    v4 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_celebrationVideoContainer];
    objc_super v5 = v3;
    [v4 bounds];
    [v5 setFrame:];

    id v2 = v5;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1006C543C(a3);
}

- (void)appWillResignActive:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1006C8F44();
}

- (_TtC10FitnessApp35TrophyCaseAwardDetailViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC10FitnessApp35TrophyCaseAwardDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp35TrophyCaseAwardDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp35TrophyCaseAwardDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  int64_t v8 = sub_1006C9308(a4);

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
  id v12 = sub_1006C6F4C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1006C93D8();

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
  v16 = (void *)sub_1006C9C08(v14, v11, v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v16;
}

- (CGRect)badgeFrame
{
  id v2 = self;
  double v3 = sub_1006C7820();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)placeBadgeViewInContainer
{
  id v2 = self;
  sub_1006C797C();
}

- (void)doneTapped:(id)a3
{
}

- (void)shareTapped:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1006C9D88();
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  double v3 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();

  return v3;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4 = a3;
  double v5 = self;
  id v6 = sub_1006CA034();

  return v6;
}

- (void)playerFinished:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1006CA1C0();
}

@end