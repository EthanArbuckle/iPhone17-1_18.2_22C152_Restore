@interface OnboardingWelcomeViewController
- (_TtC8AppStore31OnboardingWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC8AppStore31OnboardingWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (unint64_t)supportedInterfaceOrientations;
- (void)didTapContinue;
- (void)viewDidLoad;
@end

@implementation OnboardingWelcomeViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1001A5D04();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(OnboardingWelcomeViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)didTapContinue
{
  v2 = *(void (**)(void))&self->OBWelcomeController_opaque[OBJC_IVAR____TtC8AppStore31OnboardingWelcomeViewController_primaryButtonCallback];
  id v3 = self;
  v2();
}

- (_TtC8AppStore31OnboardingWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC8AppStore31OnboardingWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8AppStore31OnboardingWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC8AppStore31OnboardingWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end