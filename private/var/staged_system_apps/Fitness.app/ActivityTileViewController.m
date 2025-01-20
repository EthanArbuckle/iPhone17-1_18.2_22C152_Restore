@interface ActivityTileViewController
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (CHAwardsDataProvider)awardsDataProviderWrapper;
- (_TtC10FitnessApp26ActivityTileViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp26ActivityTileViewController)initWithHealthStore:(id)a3 fitnessAppContext:(id)a4 activityDataProvider:(id)a5 pauseRingsCoordinator:(id)a6 historyDataProvider:(id)a7 achievementsDataProvider:(id)a8 achievementLocalizationProvider:(id)a9 fiuiModel:(id)a10 badgeImageFactory:(id)a11 friendListManager:(id)a12 fiuiFormattingManager:(id)a13 workoutFormattingManager:(id)a14 activityDateCache:(id)a15 trendsAvailabilityManager:(id)a16 wheelchairUseCache:(id)a17;
- (_TtC10FitnessApp26ActivityTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC10FitnessApp26ActivityTileViewController)initWithStyle:(int64_t)a3;
- (_TtP10FitnessApp34ActivityTileViewControllerDelegate_)delegate;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)navigateToTrophyCaseAnimated:(BOOL)a3 initialAchievement:(id)a4 shouldShowCelebration:(BOOL)a5 forModalPresentation:(BOOL)a6;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)showActivityOnDate:(id)a3 shareImmediately:(BOOL)a4 animated:(BOOL)a5 forGoalCompleteNotification:(BOOL)a6 goalRecommendation:(id)a7;
- (id)showTodayAndShareImmediately:(BOOL)a3 animated:(BOOL)a4 forGoalCompleteNotification:(BOOL)a5 goalRecommendation:(id)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)accountButtonTapped:(id)a3;
- (void)dealloc;
- (void)navigateToHistoryAnimated:(BOOL)a3;
- (void)navigateToMindfulnessHistoryAnimated:(BOOL)a3;
- (void)navigateToTrophyCaseSection:(id)a3 withAchievementID:(id)a4 animated:(BOOL)a5;
- (void)navigateToWorkoutHistoryWithActivityType:(id)a3 animated:(BOOL)a4;
- (void)presentAppSettingsShowingPane:(int64_t)a3;
- (void)presentWorkoutConfigurationWithData:(id)a3;
- (void)ringCelebrationDidBegin;
- (void)scrollToTop;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showAllTrendsAnimated:(BOOL)a3;
- (void)showMindfulnessSessionWithUUID:(id)a3;
- (void)showTrendWithIdentifier:(int64_t)a3 animated:(BOOL)a4;
- (void)showWorkoutWithId:(id)a3 activityId:(id)a4 page:(id)a5;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)trophyCaseDidBeginCelebration:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ActivityTileViewController

- (_TtP10FitnessApp34ActivityTileViewControllerDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP10FitnessApp34ActivityTileViewControllerDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (CHAwardsDataProvider)awardsDataProviderWrapper
{
  sub_10008E75C((uint64_t)self + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_awardsDataProvider, (uint64_t)v9);
  v3 = (objc_class *)type metadata accessor for CHAwardsDataProvider();
  id v4 = objc_allocWithZone(v3);
  sub_10008E75C((uint64_t)v9, (uint64_t)v4 + OBJC_IVAR___CHAwardsDataProvider_awardsDataProvider);
  v8.receiver = v4;
  v8.super_class = v3;
  v5 = self;
  v6 = [(ActivityTileViewController *)&v8 init];
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)v9);

  return (CHAwardsDataProvider *)v6;
}

- (_TtC10FitnessApp26ActivityTileViewController)initWithHealthStore:(id)a3 fitnessAppContext:(id)a4 activityDataProvider:(id)a5 pauseRingsCoordinator:(id)a6 historyDataProvider:(id)a7 achievementsDataProvider:(id)a8 achievementLocalizationProvider:(id)a9 fiuiModel:(id)a10 badgeImageFactory:(id)a11 friendListManager:(id)a12 fiuiFormattingManager:(id)a13 workoutFormattingManager:(id)a14 activityDateCache:(id)a15 trendsAvailabilityManager:(id)a16 wheelchairUseCache:(id)a17
{
  return (_TtC10FitnessApp26ActivityTileViewController *)sub_1002C49B4(a3, a4, a5, (char *)a6, (char *)a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1002C5788();
}

- (void)dealloc
{
  v2 = self;
  sub_1002C6198();
}

- (void).cxx_destruct
{
  sub_10019B9F8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_activityDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_workoutDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_historyDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_mindfulnessSessionDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_fiuiModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_fiuiFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_workoutFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_mindfulnessSessionFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_stackFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_activityDateCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_trendsAvailabilityManager));
  swift_release();
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_awardsDataProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_achievementsDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_achievementResourceProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_badgeImageFactory));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_trophyCasePrefetcher);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_marketingBannerPresenter));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_avatarSettingsProvider);
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_trendsDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_trendsFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_wheelchairUseCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_achievementLocalizationProvider));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_friendListManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_achievementTransitionAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_transitionAnimatorFromViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_marketingBannerViewController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_accountButton);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1002C87B8(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1002C8A64(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1002C8C6C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ActivityTileViewController();
  id v4 = v7.receiver;
  [(ActivityTileViewController *)&v7 viewDidDisappear:v3];
  sub_1002D3A70(&qword_1009556D8, v5, (void (*)(uint64_t))type metadata accessor for ActivityTileViewController);
  sub_1002D3A70((unint64_t *)&unk_1009556E0, v6, (void (*)(uint64_t))type metadata accessor for ActivityTileViewController);
  MetricResignActiveObserving<>.removeResignActiveObserver()();
}

- (void)scrollToTop
{
  v2 = self;
  sub_1002C8F6C();
}

- (_TtC10FitnessApp26ActivityTileViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002D3F30();
}

- (_TtC10FitnessApp26ActivityTileViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC10FitnessApp26ActivityTileViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp26ActivityTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp26ActivityTileViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = self;
  int64_t v8 = sub_1002D40C4(a4);

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
  id v12 = sub_1002C98EC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_1002CBC48(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  if ((uint64_t)[v6 numberOfRowsInSection:a4] <= 0) {
    double v8 = 0.0;
  }
  else {
    double v8 = UITableViewAutomaticDimension;
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1002D4540();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_1002CD970(v12, v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_1002D46B4(v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  [v4 bounds];
  sub_10055C168();
  ImpressionsCalculator.viewBounds.setter();

  swift_release();
}

- (void)accountButtonTapped:(id)a3
{
}

- (void)presentAppSettingsShowingPane:(int64_t)a3
{
  id v4 = self;
  sub_1002CDD98(a3);
}

- (void)presentWorkoutConfigurationWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  id v9 = [self sharedInstance];
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v12[4] = sub_1002CE054;
  v12[5] = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10000D15C;
  v12[3] = &unk_1008BFDD8;
  v11 = _Block_copy(v12);
  [v9 presentWorkoutConfigurationData:isa completion:v11];
  _Block_release(v11);

  sub_1000939A4(v6, v8);
}

- (id)showTodayAndShareImmediately:(BOOL)a3 animated:(BOOL)a4 forGoalCompleteNotification:(BOOL)a5 goalRecommendation:(id)a6
{
  BOOL v8 = a4;
  BOOL v9 = a3;
  id v11 = objc_allocWithZone((Class)NSDate);
  id v12 = a6;
  id v13 = self;
  id v14 = [v11 init];
  if (v12)
  {
    [v12 doubleValue];
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = sub_1002CE414(v14, v9, v8, a5, v16, v12 == 0);

  return v17;
}

- (id)showActivityOnDate:(id)a3 shareImmediately:(BOOL)a4 animated:(BOOL)a5 forGoalCompleteNotification:(BOOL)a6 goalRecommendation:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  if (a7)
  {
    id v13 = a7;
    id v14 = self;
    [v13 doubleValue];
    uint64_t v16 = v15;
  }
  else
  {
    id v17 = self;
    uint64_t v16 = 0;
  }
  id v18 = sub_1002CE414(v12, v10, v9, a6, v16, a7 == 0);

  return v18;
}

- (void)navigateToWorkoutHistoryWithActivityType:(id)a3 animated:(BOOL)a4
{
  id v7 = a3;
  BOOL v8 = self;
  sub_1002CFEBC(a3, a4);
}

- (void)showWorkoutWithId:(id)a3 activityId:(id)a4 page:(id)a5
{
  uint64_t v8 = sub_1000AFA94((uint64_t *)&unk_1009555F0);
  __chkstk_darwin(v8 - 8);
  BOOL v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, v15, 1, v11);
  if (a5)
  {
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a5 = v17;
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v18 = self;
  sub_1002D022C((uint64_t)v14, (uint64_t)v10, v16, (uint64_t)a5);

  swift_bridgeObjectRelease();
  sub_10008DB18((uint64_t)v10, (uint64_t *)&unk_1009555F0);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)showMindfulnessSessionWithUUID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_1002D1040((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)navigateToHistoryAnimated:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1002D1AD4(a3);
}

- (void)navigateToMindfulnessHistoryAnimated:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1002D1D70(a3);
}

- (void)showAllTrendsAnimated:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1002D2018(a3);
}

- (void)showTrendWithIdentifier:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v6 = self;
  sub_1002D2230(a3, a4);
}

- (id)navigateToTrophyCaseAnimated:(BOOL)a3 initialAchievement:(id)a4 shouldShowCelebration:(BOOL)a5 forModalPresentation:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v9 = a3;
  id v11 = a4;
  uint64_t v12 = self;
  id v13 = sub_1002D24FC(v9, a4, v7, v6);

  return v13;
}

- (void)navigateToTrophyCaseSection:(id)a3 withAchievementID:(id)a4 animated:(BOOL)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  if (a4)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v12 = self;
  sub_1002D47C8(v7, v9, v10, (uint64_t)a4);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = self;
  id v14 = sub_1002D4C40((void *)a4, v11, v12);

  return v14;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

- (void)ringCelebrationDidBegin
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    uint64_t v5 = self;
    [v4 celebrationDidBegin];

    swift_unknownObjectRelease();
  }
}

- (void)trophyCaseDidBeginCelebration:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    BOOL v6 = (void *)Strong;
    id v7 = a3;
    uint64_t v8 = self;
    [v6 celebrationDidBegin];

    swift_unknownObjectRelease();
  }
}

@end