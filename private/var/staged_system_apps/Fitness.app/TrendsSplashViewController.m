@interface TrendsSplashViewController
- (_TtC10FitnessApp24TrendsListViewController)listViewController;
- (_TtC10FitnessApp26TrendsSplashViewController)initWithAvailabilityManager:(id)a3;
- (_TtC10FitnessApp26TrendsSplashViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC10FitnessApp26TrendsSplashViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)buttonTappedWithSender:(id)a3;
- (void)setListViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TrendsSplashViewController

- (_TtC10FitnessApp26TrendsSplashViewController)initWithAvailabilityManager:(id)a3
{
  return (_TtC10FitnessApp26TrendsSplashViewController *)sub_10020AD40(a3);
}

- (_TtC10FitnessApp24TrendsListViewController)listViewController
{
  return (_TtC10FitnessApp24TrendsListViewController *)*(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC10FitnessApp26TrendsSplashViewController_listViewController];
}

- (void)setListViewController:(id)a3
{
  id v4 = *(id *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC10FitnessApp26TrendsSplashViewController_listViewController];
  *(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC10FitnessApp26TrendsSplashViewController_listViewController] = a3;
  id v3 = a3;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10020B088();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_10020B638(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_10020B73C(a3);
}

- (void)buttonTappedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10020C278();
}

- (_TtC10FitnessApp26TrendsSplashViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC10FitnessApp26TrendsSplashViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp26TrendsSplashViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC10FitnessApp26TrendsSplashViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end