@interface OnboardingViewController
- (_TtC5TeaUI24OnboardingViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI24OnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation OnboardingViewController

- (_TtC5TeaUI24OnboardingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5E4DFC8();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  OnboardingViewController.viewWillAppear(_:)(a3);
}

- (_TtC5TeaUI24OnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  OnboardingViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI24OnboardingViewController_onboardingStepMonitor);
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI24OnboardingViewController_onDismissal));
  swift_bridgeObjectRelease();
}

@end