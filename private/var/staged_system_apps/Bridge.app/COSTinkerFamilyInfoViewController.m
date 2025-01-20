@interface COSTinkerFamilyInfoViewController
- (BOOL)requiresActivationCheck;
- (COSTinkerFamilyInfoViewController)init;
- (id)detailString;
- (id)okayButtonTitle;
- (id)privacyBundles;
- (id)titleString;
- (void)okayButtonPressed:(id)a3;
@end

@implementation COSTinkerFamilyInfoViewController

- (COSTinkerFamilyInfoViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSTinkerFamilyInfoViewController;
  v2 = [(COSOptinViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSTinkerFamilyInfoViewController *)v2 setStyle:32];
  }
  return v3;
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"TINKER_FAMILY_SETUP_TITLE" value:&stru_100249230 table:@"SetupFlowLocalizable-tinker"];

  return v3;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"TINKER_FAMILY_SETUP_DETAIL" value:&stru_100249230 table:@"SetupFlowLocalizable-tinker"];

  return v3;
}

- (id)okayButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"TINKER_FAMILY_OKAY" value:&stru_100249230 table:@"SetupFlowLocalizable-tinker"];

  return v3;
}

- (void)okayButtonPressed:(id)a3
{
  id v4 = [(COSTinkerFamilyInfoViewController *)self delegate];
  [v4 buddyControllerDone:self];
}

- (BOOL)requiresActivationCheck
{
  return 0;
}

- (id)privacyBundles
{
  return &off_10025BD88;
}

@end