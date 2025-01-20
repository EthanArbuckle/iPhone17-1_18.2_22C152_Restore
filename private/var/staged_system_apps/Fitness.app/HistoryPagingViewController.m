@interface HistoryPagingViewController
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (_TtC10FitnessApp27HistoryPagingViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp27HistoryPagingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)pageViewController:(id)a3 viewControllerAtIndex:(int64_t)a4;
- (int64_t)numberOfViewControllersForPageViewController:(id)a3;
- (void)checkFlightsClimbedEnabled;
- (void)dealloc;
- (void)loadView;
- (void)pageViewController:(id)a3 didUpdateCurrentlyDisplayedIndex:(int64_t)a4;
- (void)shareImmediatelyWithSender:(id)a3;
- (void)showHistoryMonthView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation HistoryPagingViewController

- (void)checkFlightsClimbedEnabled
{
  v2 = self;
  sub_1002D627C();
}

- (void)dealloc
{
  v2 = self;
  sub_1002D6644();
}

- (void).cxx_destruct
{
  sub_10019B9F8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_activityDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_activityDateCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_mindfulnessSessionDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_badgeImageFactory));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_friendListManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_achievementResourceProvider));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_awardsDataProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_workoutFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_workoutDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_mindfulnessSessionFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_fiuiFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_achievementLocalizationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_fitnessAppContext));
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_deviceDateListener, &qword_100955A00);
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_selectedDateListener, &qword_100955A00);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_appStoreQuery);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_recentWorkoutAppQuery);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_appRecommendationDataProvider);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_walkSuggestionDataProvider);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_seymourWorkoutRecommendationDataProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_pageViewController));
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_jan1_2014;
  uint64_t v4 = type metadata accessor for Date();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (_TtC10FitnessApp27HistoryPagingViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)loadView
{
  v2 = self;
  sub_1002D6C4C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1002D6F98();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HistoryPagingViewController();
  id v4 = v7.receiver;
  [(HistoryPagingViewController *)&v7 viewDidAppear:v3];
  sub_1002D627C();
  id v5 = [v4 navigationController];
  if (v5)
  {
    id v6 = v5;
    [v5 setDelegate:v4];

    id v4 = v6;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1002D7CF4(a3);
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for HistoryPagingViewController();
  v2 = (char *)v15.receiver;
  [(HistoryPagingViewController *)&v15 viewWillLayoutSubviews];
  id v3 = [*(id *)&v2[OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_pageViewController] view];
  if (v3)
  {
    id v4 = v3;
    id v5 = [v2 view];
    if (v5)
    {
      id v6 = v5;
      [v5 bounds];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      [v4 setFrame:v8, v10, v12, v14];
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)showHistoryMonthView
{
  v2 = self;
  sub_1002D8560();
}

- (void)shareImmediatelyWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1002DAAE4();
}

- (_TtC10FitnessApp27HistoryPagingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp27HistoryPagingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfViewControllersForPageViewController:(id)a3
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_nPages);
}

- (id)pageViewController:(id)a3 viewControllerAtIndex:(int64_t)a4
{
  id v6 = a3;
  double v7 = self;
  double v8 = (void *)sub_1002DAB8C(a4);

  return v8;
}

- (void)pageViewController:(id)a3 didUpdateCurrentlyDisplayedIndex:(int64_t)a4
{
  id v6 = a3;
  double v7 = self;
  sub_1002DB438((objc_class *)a4);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  double v10 = *(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_pageViewController);
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  double v14 = self;
  id v15 = [v10 currentlyDisplayedViewController];
  type metadata accessor for HistoryDayViewController();
  v16 = (void *)swift_dynamicCastClass();
  if (v16) {
    id v17 = [v16 navigationController:v11 animationControllerForOperation:a4 fromViewController:v12 toViewController:v13];
  }
  else {
    id v17 = 0;
  }

  return v17;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

@end