@interface CheckInOnboardingViewController4
- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController4)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController4)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)notNowButtonAction;
- (void)sendCheckIn;
- (void)viewDidLoad;
@end

@implementation CheckInOnboardingViewController4

- (void)viewDidLoad
{
  v2 = self;
  CheckInOnboardingViewController4.viewDidLoad()();
}

- (void)sendCheckIn
{
  v2 = self;
  sub_25B8327EC();
}

- (void)notNowButtonAction
{
  v3 = self;
  v7 = self;
  objc_msgSend(v3, sel_setHasUserCompletedOnboarding_, 1);
  v4 = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController4 *)[(CheckInOnboardingViewController4 *)v7 navigationController];
  if (v4)
  {
    v5 = v4;
    [(CheckInOnboardingViewController4 *)v4 dismissViewControllerAnimated:1 completion:0];

    v6 = v5;
  }
  else
  {
    v6 = v7;
  }
}

- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController4)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController4 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15SafetyMonitorUI32CheckInOnboardingViewController4)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC15SafetyMonitorUI32CheckInOnboardingViewController4 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end