@interface VUIASCAppInstallerViewController
- (BOOL)lockupViewShouldSupportDSIDLessInstalls:(id)a3;
- (VUIASCAppInstallerViewController)initWithCoder:(id)a3;
- (VUIASCAppInstallerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VUIASCAppInstallerViewController)initWithTitle:(id)a3 subtitle:(id)a4 request:(id)a5 forceDSIDless:(BOOL)a6 onFlowComplete:(id)a7;
- (id)presentingViewControllerForLockupView:(id)a3;
- (void)handleCancel;
- (void)lockupView:(id)a3 appStateDidChange:(id)a4;
- (void)viewDidLoad;
@end

@implementation VUIASCAppInstallerViewController

- (VUIASCAppInstallerViewController)initWithTitle:(id)a3 subtitle:(id)a4 request:(id)a5 forceDSIDless:(BOOL)a6 onFlowComplete:(id)a7
{
  v8 = _Block_copy(a7);
  sub_1E387C928();
  sub_1E387C928();
  if (v8) {
    *(void *)(swift_allocObject() + 16) = v8;
  }
  id v9 = a5;
  return (VUIASCAppInstallerViewController *)AppInstallerViewController.init(title:subtitle:request:forceDSIDless:onFlowComplete:)();
}

- (VUIASCAppInstallerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E387C928();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (VUIASCAppInstallerViewController *)AppInstallerViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (VUIASCAppInstallerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E303B3FC();
}

- (void)viewDidLoad
{
  v2 = self;
  AppInstallerViewController.viewDidLoad()();
}

- (void)handleCancel
{
  v2 = self;
  sub_1E303CCA8();
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  AppInstallerViewController.lockupView(_:appStateDidChange:)((uint64_t)v8, v7);
}

- (BOOL)lockupViewShouldSupportDSIDLessInstalls:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = AppInstallerViewController.lockupViewShouldSupportDSIDLessInstalls(_:)();

  return self & 1;
}

- (void).cxx_destruct
{
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___VUIASCAppInstallerViewController_onFlowComplete));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___VUIASCAppInstallerViewController_onAppInstall));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___VUIASCAppInstallerViewController____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___VUIASCAppInstallerViewController____lazy_storage___appStoreComponentsLockupView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___VUIASCAppInstallerViewController____lazy_storage___ascContainerView);
}

@end