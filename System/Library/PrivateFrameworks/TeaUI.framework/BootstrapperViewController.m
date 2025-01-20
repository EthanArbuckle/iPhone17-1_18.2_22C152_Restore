@interface BootstrapperViewController
- (NSArray)preferredFocusEnvironments;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC5TeaUI26BootstrapperViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI26BootstrapperViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation BootstrapperViewController

- (_TtC5TeaUI26BootstrapperViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5F9AE64();
}

- (_TtC5TeaUI26BootstrapperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  sub_1B5F9AEEC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI26BootstrapperViewController_mainViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5TeaUI26BootstrapperViewController_onboardingViewController);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B5F9AFB4();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1B5F9B244();
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = sub_1B5F9B3FC();
  return (UIViewController *)v2;
}

- (NSArray)preferredFocusEnvironments
{
  sub_1B5F9B4A8();
  sub_1B5F9B56C();
  v2 = (void *)sub_1B61B24D0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

@end