@interface PMSafariAutoFillStrongPasswordIntroductionViewController
+ (BOOL)hasThirdPartyPasswordManagerEnabledAndPasswordsAppDisabledForAutoFill;
+ (BOOL)shouldShowICloudKeychainSyncingView;
+ (BOOL)shouldShowLoginIntroduction;
+ (BOOL)shouldShowStrongPasswordIntroduction;
+ (BOOL)shouldShowView;
+ (BOOL)shouldShowViewsInMode:(int64_t)a3;
- (CGSize)contentSize;
- (PMSafariAutoFillStrongPasswordIntroductionViewController)initWithCoder:(id)a3;
- (PMSafariAutoFillStrongPasswordIntroductionViewController)initWithMode:(int64_t)a3;
- (PMSafariAutoFillStrongPasswordIntroductionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PMSafariAutoFillStrongPasswordIntroductionViewControllerDelegate)delegate;
- (int64_t)mode;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PMSafariAutoFillStrongPasswordIntroductionViewController

+ (BOOL)shouldShowView
{
  return static PMSafariAutoFillStrongPasswordIntroductionViewController.shouldShowView.getter() & 1;
}

+ (BOOL)shouldShowViewsInMode:(int64_t)a3
{
  return static PMSafariAutoFillStrongPasswordIntroductionViewController.shouldShowViews(in:)(a3) & 1;
}

+ (BOOL)shouldShowLoginIntroduction
{
  return static PMSafariAutoFillStrongPasswordIntroductionViewController.shouldShowLoginIntroduction.getter() & 1;
}

+ (BOOL)shouldShowStrongPasswordIntroduction
{
  return static PMSafariAutoFillStrongPasswordIntroductionViewController.shouldShowStrongPasswordIntroduction.getter() & 1;
}

+ (BOOL)shouldShowICloudKeychainSyncingView
{
  id v2 = objc_msgSend(self, sel_pm_defaults);
  unsigned __int8 v3 = objc_msgSend(v2, sel_BOOLForKey_, @"hasShownSafariAutoFillICloudKeychainSyncingView");

  if (v3) {
    return 0;
  }
  else {
    return PMOnboardingIsICloudKeychainSyncingEnabled() ^ 1;
  }
}

+ (BOOL)hasThirdPartyPasswordManagerEnabledAndPasswordsAppDisabledForAutoFill
{
  return _sSo56PMSafariAutoFillStrongPasswordIntroductionViewControllerC0E9ManagerUIE013hasThirdPartyei33EnabledAndPasswordsAppDisabledForbC0SbvgZ_0();
}

- (CGSize)contentSize
{
  id v2 = self;
  id v3 = [(PMSafariAutoFillStrongPasswordIntroductionViewController *)v2 view];
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, sel_intrinsicContentSize);
    double v8 = v7;
    double v10 = v9;

    double v4 = v8;
    double v5 = v10;
  }
  else
  {
    __break(1u);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (int64_t)mode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___PMSafariAutoFillStrongPasswordIntroductionViewController_mode);
}

- (void)setMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___PMSafariAutoFillStrongPasswordIntroductionViewController_mode) = (Class)a3;
  double v4 = self;
  *((unsigned char *)&v4->super.super.super.isa + OBJC_IVAR___PMSafariAutoFillStrongPasswordIntroductionViewController_viewStyle) = sub_258B3D2A0(a3);
  sub_258B3A584();
}

- (PMSafariAutoFillStrongPasswordIntroductionViewControllerDelegate)delegate
{
  id v2 = (void *)MEMORY[0x25A2D1DD0]((char *)self + OBJC_IVAR___PMSafariAutoFillStrongPasswordIntroductionViewController_delegate, a2);

  return (PMSafariAutoFillStrongPasswordIntroductionViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  double v4 = self;
  sub_258B3D490();

  swift_unknownObjectRelease();
}

- (PMSafariAutoFillStrongPasswordIntroductionViewController)initWithMode:(int64_t)a3
{
  return (PMSafariAutoFillStrongPasswordIntroductionViewController *)sub_258B3A7A4(a3);
}

- (PMSafariAutoFillStrongPasswordIntroductionViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  id v5 = a3;

  CGSize result = (PMSafariAutoFillStrongPasswordIntroductionViewController *)sub_258D6FE78();
  __break(1u);
  return result;
}

- (void)loadView
{
  id v2 = self;
  PMSafariAutoFillStrongPasswordIntroductionViewController.loadView()();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PMSafariAutoFillStrongPasswordIntroductionViewController;
  double v4 = self;
  [(PMSafariAutoFillStrongPasswordIntroductionViewController *)&v5 viewWillAppear:v3];
  sub_258B3B148();
}

- (PMSafariAutoFillStrongPasswordIntroductionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (PMSafariAutoFillStrongPasswordIntroductionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_25892DE34((uint64_t)self + OBJC_IVAR___PMSafariAutoFillStrongPasswordIntroductionViewController_delegate);
  swift_release();
  swift_release();

  swift_release();
}

@end