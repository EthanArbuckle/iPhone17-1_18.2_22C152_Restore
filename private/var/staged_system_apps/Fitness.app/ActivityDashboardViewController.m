@interface ActivityDashboardViewController
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (_TtC10FitnessApp18SummaryCoordinator)summaryCoordinator;
- (_TtC10FitnessApp31ActivityDashboardViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp31ActivityDashboardViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC10FitnessApp31ActivityDashboardViewController)initWithCollectionViewLayout:(id)a3 context:(id)a4;
- (_TtC10FitnessApp31ActivityDashboardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP10FitnessApp32TrophyCaseViewControllerDelegate_)trophyCaseViewControllerDelegate;
- (_TtP10FitnessApp35HistoryPagingViewControllerDelegate_)historyPagingViewControllerDelegate;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)navigateToTrophyCaseAnimated:(BOOL)a3 initialAchievement:(id)a4 shouldShowCelebration:(BOOL)a5 forModalPresentation:(BOOL)a6;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)showActivityOnDate:(id)a3 shareImmediately:(BOOL)a4 animated:(BOOL)a5 forGoalCompleteNotification:(BOOL)a6 goalRecommendation:(id)a7;
- (id)showActivityOnDate:(id)a3 shareImmediately:(BOOL)a4 animated:(BOOL)a5 forGoalCompleteNotification:(BOOL)a6 goalRecommendation:(id)a7 withPauseRingsEditing:(BOOL)a8;
- (id)showTodayAndShareImmediately:(BOOL)a3 animated:(BOOL)a4 forGoalCompleteNotification:(BOOL)a5 goalRecommendation:(id)a6;
- (id)showTodayAndShareImmediately:(BOOL)a3 animated:(BOOL)a4 forGoalCompleteNotification:(BOOL)a5 goalRecommendation:(id)a6 withPauseRingsEditing:(BOOL)a7;
- (void)accountButtonTapped:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)didTapAddCard;
- (void)didTapDone;
- (void)editButtonTapped;
- (void)entryLinksButtonTapped;
- (void)navigateToHistoryAnimated:(BOOL)a3;
- (void)navigateToMindfulnessHistoryAnimated:(BOOL)a3;
- (void)navigateToTrophyCaseSection:(id)a3 withAchievementID:(id)a4 animated:(BOOL)a5;
- (void)navigateToWorkoutHistoryWithActivityType:(id)a3 animated:(BOOL)a4;
- (void)presentAppSettingsShowingPane:(int64_t)a3;
- (void)presentWorkoutConfigurationWithData:(id)a3;
- (void)scrollToBottom;
- (void)scrollToTop;
- (void)scrollViewDidScroll:(id)a3;
- (void)setHistoryPagingViewControllerDelegate:(id)a3;
- (void)setTrophyCaseViewControllerDelegate:(id)a3;
- (void)showAllTrendsAnimated:(BOOL)a3;
- (void)showLoad;
- (void)showMindfulnessSessionWithUUID:(id)a3;
- (void)showSummaryCardWithIdentifier:(int64_t)a3;
- (void)showTrendWithIdentifier:(int64_t)a3 animated:(BOOL)a4;
- (void)showWorkoutWithId:(id)a3 activityId:(id)a4 page:(id)a5;
- (void)textSizeChanged:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ActivityDashboardViewController

- (_TtC10FitnessApp31ActivityDashboardViewController)initWithCollectionViewLayout:(id)a3 context:(id)a4
{
  return (_TtC10FitnessApp31ActivityDashboardViewController *)sub_100060A54(a3, a4);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  [v4 bounds];
  sub_10001C250();
  ImpressionsCalculator.viewBounds.setter();

  swift_release();
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for ActivityDashboardCardCell();
  if (swift_dynamicCastClass())
  {
    id v12 = a3;
    id v13 = a4;
    v14 = self;
    sub_10003F9B4((uint64_t)v11);
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for ActivityDashboardCardCell();
  uint64_t v12 = swift_dynamicCastClass();
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = a3;
    id v15 = a4;
    v16 = self;
    sub_1000632E8(v13, (uint64_t)v11, v14);
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC10FitnessApp18SummaryCoordinator)summaryCoordinator
{
  return (_TtC10FitnessApp18SummaryCoordinator *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                         + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_summaryCoordinator));
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_10001B2DC(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_100043ED0(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100050E0C();
}

- (void)setHistoryPagingViewControllerDelegate:(id)a3
{
}

- (void)setTrophyCaseViewControllerDelegate:(id)a3
{
}

- (void)presentAppSettingsShowingPane:(int64_t)a3
{
  id v4 = self;
  sub_1003F76E8(a3);
}

- (id)showTodayAndShareImmediately:(BOOL)a3 animated:(BOOL)a4 forGoalCompleteNotification:(BOOL)a5 goalRecommendation:(id)a6
{
  BOOL v8 = a4;
  BOOL v9 = a3;
  id v11 = objc_allocWithZone((Class)NSDate);
  id v12 = a6;
  uint64_t v13 = self;
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
  id v17 = sub_1003F79D8(v14, v9, v8, a5, v16, v12 == 0, 0);

  return v17;
}

- (id)showTodayAndShareImmediately:(BOOL)a3 animated:(BOOL)a4 forGoalCompleteNotification:(BOOL)a5 goalRecommendation:(id)a6 withPauseRingsEditing:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v10 = a4;
  BOOL v11 = a3;
  id v13 = objc_allocWithZone((Class)NSDate);
  id v14 = a6;
  uint64_t v15 = self;
  id v16 = [v13 init];
  if (v14)
  {
    [v14 doubleValue];
    uint64_t v18 = v17;
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v19 = sub_1003F79D8(v16, v11, v10, a5, v18, v14 == 0, v7);

  return v19;
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
    uint64_t v17 = self;
    uint64_t v16 = 0;
  }
  id v18 = sub_1003F79D8(v12, v10, v9, a6, v16, a7 == 0, 0);

  return v18;
}

- (id)showActivityOnDate:(id)a3 shareImmediately:(BOOL)a4 animated:(BOOL)a5 forGoalCompleteNotification:(BOOL)a6 goalRecommendation:(id)a7 withPauseRingsEditing:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v14 = a3;
  if (a7)
  {
    id v15 = a7;
    uint64_t v16 = self;
    [v15 doubleValue];
    uint64_t v18 = v17;
  }
  else
  {
    id v19 = self;
    uint64_t v18 = 0;
  }
  id v20 = sub_1003F79D8(v14, v12, v11, a6, v18, a7 == 0, v8);

  return v20;
}

- (id)navigateToTrophyCaseAnimated:(BOOL)a3 initialAchievement:(id)a4 shouldShowCelebration:(BOOL)a5 forModalPresentation:(BOOL)a6
{
  id v11 = a4;
  BOOL v12 = self;
  id v13 = sub_1003F920C(a3, a4, a5, a6);

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
  BOOL v12 = self;
  sub_100403328(v7, v9, v10, (uint64_t)a4);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)navigateToHistoryAnimated:(BOOL)a3
{
  id v4 = self;
  sub_1003F95AC(a3);
}

- (void)navigateToWorkoutHistoryWithActivityType:(id)a3 animated:(BOOL)a4
{
  id v7 = a3;
  uint64_t v8 = self;
  sub_1003FA080(a3, a4);
}

- (void)showWorkoutWithId:(id)a3 activityId:(id)a4 page:(id)a5
{
  uint64_t v8 = sub_1000AFA94((uint64_t *)&unk_1009555F0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  uint64_t v18 = self;
  sub_1003FA410((uint64_t)v14, (uint64_t)v10, v16, (uint64_t)a5);

  swift_bridgeObjectRelease();
  sub_10008DB18((uint64_t)v10, (uint64_t *)&unk_1009555F0);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)navigateToMindfulnessHistoryAnimated:(BOOL)a3
{
  id v4 = self;
  sub_1003FB22C(a3);
}

- (void)showMindfulnessSessionWithUUID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_1003FB4F0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)showAllTrendsAnimated:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1003FE7DC(a3);
}

- (void)showTrendWithIdentifier:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v6 = self;
  sub_1003FED14(a3, a4);
}

- (void)showLoad
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_context);
  id v4 = objc_allocWithZone((Class)type metadata accessor for LoadDetailViewController());
  uint64_t v5 = self;
  uint64_t v8 = sub_1004AD748(v3);
  uint64_t v6 = (_TtC10FitnessApp31ActivityDashboardViewController *)[(ActivityDashboardViewController *)v5 navigationController];
  if (v6)
  {
    id v7 = v6;
    [(ActivityDashboardViewController *)v6 pushViewController:v8 animated:1];

    uint64_t v5 = v7;
  }
}

- (void)showSummaryCardWithIdentifier:(int64_t)a3
{
  id v4 = self;
  sub_1003FF454(a3);
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
  v12[3] = &unk_1008C56B8;
  uint64_t v11 = _Block_copy(v12);
  [v9 presentWorkoutConfigurationData:isa completion:v11];
  _Block_release(v11);

  sub_1000939A4(v6, v8);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = self;
  id v14 = sub_10040379C((void *)a4, v11, v12);

  return v14;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = self;
  id v13 = sub_100407E54((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  id v9 = sub_1004081D8(v6, v7);

  return v9;
}

- (_TtP10FitnessApp32TrophyCaseViewControllerDelegate_)trophyCaseViewControllerDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP10FitnessApp32TrophyCaseViewControllerDelegate_ *)Strong;
}

- (_TtP10FitnessApp35HistoryPagingViewControllerDelegate_)historyPagingViewControllerDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP10FitnessApp35HistoryPagingViewControllerDelegate_ *)Strong;
}

- (_TtC10FitnessApp31ActivityDashboardViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004D8A58();
}

- (void)dealloc
{
  v2 = self;
  sub_1004D3284();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_summaryCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_marketingBannerPresenter));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_achievementTransitionAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_marketingBannerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_transitionAnimatorFromViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_dataSource));
  sub_10019B9F8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_trophyCaseViewControllerDelegate);
  sub_10019B9F8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_historyPagingViewControllerDelegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_context));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_addButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_doneButton));
  id v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_editButtonIdentifier;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_entryLinksButtonIdentifier, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_accountButton));
  sub_1000C98F0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_customizeSummaryTip, (uint64_t (*)(void))type metadata accessor for CustomizeSummaryTip);
  sub_1000C98F0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_trainingLoadTip, (uint64_t (*)(void))type metadata accessor for TrainingLoadTrackingTip);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController____lazy_storage___onDismissAddCardModal);

  sub_10005E5F8(v6);
}

- (void)textSizeChanged:(id)a3
{
  uint64_t v5 = sub_1000AFA94(&qword_100955F38);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Notification();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for Notification();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  id v10 = self;
  sub_1004D3BAC();

  sub_10008DB18((uint64_t)v7, &qword_100955F38);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ActivityDashboardViewController();
  swift_unknownObjectRetain();
  id v7 = v11.receiver;
  -[ActivityDashboardViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  id v8 = [v7 collectionView];
  if (!v8)
  {
    __break(1u);
    JUMPOUT(0x1004D3FC4);
  }
  uint64_t v9 = v8;
  id v10 = [v8 collectionViewLayout];

  [v10 invalidateLayout];
  swift_unknownObjectRelease();
}

- (void)accountButtonTapped:(id)a3
{
}

- (void)editButtonTapped
{
  v2 = self;
  sub_1004D3FE4();
}

- (void)entryLinksButtonTapped
{
  v2 = self;
  sub_1004D44F8();
}

- (void)didTapDone
{
  v2 = self;
  sub_1004D47AC();
}

- (void)didTapAddCard
{
  v2 = self;
  sub_1004D4BDC();
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1004D55B0(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivityDashboardViewController();
  id v4 = v5.receiver;
  [(ActivityDashboardViewController *)&v5 viewDidDisappear:v3];
  sub_1000B7550(&qword_10095F750, (void (*)(uint64_t))type metadata accessor for ActivityDashboardViewController);
  sub_1000B7550((unint64_t *)&unk_10095F758, (void (*)(uint64_t))type metadata accessor for ActivityDashboardViewController);
  MetricResignActiveObserving<>.removeResignActiveObserver()();
}

- (void)scrollToTop
{
  v2 = self;
  sub_1004D5BD0();
}

- (void)scrollToBottom
{
  v2 = self;
  sub_1004D5E40();
}

- (_TtC10FitnessApp31ActivityDashboardViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC10FitnessApp31ActivityDashboardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp31ActivityDashboardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp31ActivityDashboardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v13 = (char *)&v27 - v12;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v27 - v15;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v27 - v18;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v28 = a3;
  v27 = self;
  uint64_t v20 = IndexPath.section.getter();
  v21 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v21(v10, v13, v7);
  if (v20 == 1)
  {
    uint64_t v22 = IndexPath.item.getter();
    v23 = *(void (**)(char *, uint64_t))(v8 + 8);
    v23(v10, v7);
    v24 = v13;
    if (v22) {
      goto LABEL_6;
    }
  }
  else
  {
    v23 = *(void (**)(char *, uint64_t))(v8 + 8);
    v23(v10, v7);
  }
  v24 = v16;
LABEL_6:
  v21(v19, v24, v7);

  v23(v13, v7);
  v23(v16, v7);
  v25.super.Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v23(v19, v7);

  return v25.super.isa;
}

@end