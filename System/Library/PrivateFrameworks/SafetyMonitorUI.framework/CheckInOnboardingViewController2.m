@interface CheckInOnboardingViewController2
- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController2)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController2)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)continueButtonAction;
- (void)notNowButtonAction;
- (void)viewDidLoad;
@end

@implementation CheckInOnboardingViewController2

- (void)viewDidLoad
{
  v2 = self;
  CheckInOnboardingViewController2.viewDidLoad()();
}

- (void)continueButtonAction
{
  v2 = self;
  sub_25B85F990();
}

- (void)notNowButtonAction
{
  v5 = self;
  v2 = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController2 *)[(CheckInOnboardingViewController2 *)v5 navigationController];
  if (v2)
  {
    v3 = v2;
    [(CheckInOnboardingViewController2 *)v2 dismissViewControllerAnimated:1 completion:0];

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }
}

- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController2)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController2 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController2)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController2 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end