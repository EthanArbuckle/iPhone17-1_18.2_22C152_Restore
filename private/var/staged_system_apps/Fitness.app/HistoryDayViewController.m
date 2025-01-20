@interface HistoryDayViewController
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (BOOL)beginContentAccess;
- (BOOL)isContentDiscarded;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC10FitnessApp24HistoryDayViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp24HistoryDayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dealloc;
- (void)share;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation HistoryDayViewController

- (BOOL)beginContentAccess
{
  return 1;
}

- (BOOL)isContentDiscarded
{
  return 0;
}

- (void)dealloc
{
  v2 = self;
  sub_100570E54();
}

- (void).cxx_destruct
{
  sub_10019B9F8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_activitySummary));
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_date;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_dataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_mindfulnessSessionDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_workoutFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_workoutDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_mindfulnessSessionFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_fiuiFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_badgeImageFactory));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_friendListManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_achievementResourceProvider));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_awardsDataProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_achievementLocalizationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_fitnessAppContext));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_appRecommendationDataProvider);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_walkSuggestionDataProvider);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_seymourRecommendationDataProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_ringCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_moveCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_exerciseCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_standCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_stepsAndDistanceCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_flightsCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_ringsConfigurationCell));
  swift_unknownObjectRelease();
  sub_100074898((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_fontListener);
  sub_100074898((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_dateChangeListener);
  sub_100074898((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_mindfulnessSessionsListener);
  sub_100074898((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_awardsListener);
  sub_100074898((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_awardsUpdateListener);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_awardsQuery));
  sub_100074898((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_wheelchairListener);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_addToYourRingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_chartData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_totalEnergy));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_sharingImage));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_awardsTransitionAnimator));
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_fromVC);
}

- (void)willMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HistoryDayViewController();
  id v4 = a3;
  v5 = (char *)v6.receiver;
  [(HistoryDayViewController *)&v6 willMoveToParentViewController:v4];
  [*(id *)&v5[OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_tableView] _scrollToTopHidingTableHeader:0 v6.receiver, v6.super_class];
}

- (_TtC10FitnessApp24HistoryDayViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100571BA8();
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for HistoryDayViewController();
  v2 = (char *)v14.receiver;
  [(HistoryDayViewController *)&v14 viewWillLayoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_tableView];
  id v4 = [v2 view];
  if (v4)
  {
    v5 = v4;
    [v4 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    [v3 setFrame:v7, v9, v11, v13];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_100573EA0(a3);
}

- (void)share
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_activitySummary))
  {
    v2 = self;
    sub_100576944();
  }
  else
  {
    *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_shareWhenDataLoads) = 1;
  }
}

- (_TtC10FitnessApp24HistoryDayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp24HistoryDayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();

  return v3;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100577E4C();

  return v6;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  double v13 = self;
  objc_super v14 = sub_100577FD8((void *)a4, v11, v12);

  return v14;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_100578A1C();
  swift_unknownObjectRelease();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  double v7 = self;
  int64_t v8 = sub_1007030D0(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  double v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  Class v12 = sub_1007000F0(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = sub_1007020C4(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  double v8 = sub_1007033B4(a4);

  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_100703500(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  uint64_t v12 = IndexPath.section.getter();
  LOBYTE(a3) = sub_100228650(v12);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return ((_BYTE)a3 - 7) < 3u;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_100702934(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end