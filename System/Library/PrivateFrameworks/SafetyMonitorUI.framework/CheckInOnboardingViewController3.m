@interface CheckInOnboardingViewController3
- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController3)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController3)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)continueButtonAction;
- (void)notNowButtonAction;
- (void)showExampleButtonAction;
- (void)viewDidLoad;
@end

@implementation CheckInOnboardingViewController3

- (void)viewDidLoad
{
  v2 = self;
  CheckInOnboardingViewController3.viewDidLoad()();
}

- (void)continueButtonAction
{
  v2 = self;
  sub_25B860BD4();
}

- (void)showExampleButtonAction
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for CheckInOnboardingExampleDataViewController());
  v4 = self;
  id v7 = CheckInOnboardingExampleDataViewController.init()();
  v5 = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *)[(CheckInOnboardingViewController3 *)v4 navigationController];
  if (v5)
  {
    v6 = v5;
    [(CheckInOnboardingViewController3 *)v5 pushViewController:v7 animated:1];

    v4 = v6;
  }
}

- (void)notNowButtonAction
{
  v5 = self;
  v2 = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *)[(CheckInOnboardingViewController3 *)v5 navigationController];
  if (v2)
  {
    id v3 = v2;
    [(CheckInOnboardingViewController3 *)v2 dismissViewControllerAnimated:1 completion:0];

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }
}

- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController3)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController3)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController3 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15SafetyMonitorUI32CheckInOnboardingViewController3_continueButton);
}

@end