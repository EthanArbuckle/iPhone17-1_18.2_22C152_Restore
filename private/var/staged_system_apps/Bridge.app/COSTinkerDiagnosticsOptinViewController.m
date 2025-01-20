@interface COSTinkerDiagnosticsOptinViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)wantsLightenBlendedScreen;
- (COSTinkerDiagnosticsOptinViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)detailTitleString;
- (id)imageResource;
- (id)learnMoreButtonTitle;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)learnMoreButtonPressed:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation COSTinkerDiagnosticsOptinViewController

+ (BOOL)controllerNeedsToRun
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 activeWatch];

  v4 = [v3 valueForProperty:NRDevicePropertyIsInternalInstall];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v7 = [v6 BOOLForKey:@"QA-DiagsAndUsage-Testing"];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"DIAG_TITLE_%@" value:&stru_100249230 table:@"Localizable-tinker"];
  v4 = [UIApp setupController];
  unsigned int v5 = [v4 tinkerUserName];
  v6 = [v5 localizedCapitalizedString];
  unsigned __int8 v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v6);

  return v7;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"DIAG_DETAIL_%@" value:&stru_100249230 table:@"Localizable-tinker"];
  v4 = [UIApp setupController];
  unsigned int v5 = [v4 tinkerUserName];
  v6 = [v5 localizedCapitalizedString];
  unsigned __int8 v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v6);

  return v7;
}

- (COSTinkerDiagnosticsOptinViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSTinkerDiagnosticsOptinViewController;
  v2 = [(COSOptinViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSTinkerDiagnosticsOptinViewController *)v2 setStyle:90];
  }
  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  +[PBBridgeCAReporter recordTinkerGuardianAcceptedDiagsAndUsage:1];
  v4 = +[UIApplication sharedApplication];
  objc_super v5 = [v4 bridgeController];
  [v5 tellGizmoToSetDiagnosticsEnabled:1];

  id v6 = [(COSTinkerDiagnosticsOptinViewController *)self delegate];
  [v6 buddyControllerDone:self];
}

- (void)alternateButtonPressed:(id)a3
{
  +[PBBridgeCAReporter recordTinkerGuardianAcceptedDiagsAndUsage:0];
  id v4 = [(COSTinkerDiagnosticsOptinViewController *)self delegate];
  [v4 buddyControllerDone:self];
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"DIAG_ACCEPT" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"DIAG_DECLINE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)learnMoreButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"ABOUT_DIAGS" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailTitleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"WHAT_IS_DIAGS" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)learnMoreButtonPressed:(id)a3
{
  v9 = objc_alloc_init(COSAboutTextViewController);
  id v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 localizedStringForKey:@"ABOUT_DIAGNOSTICS_PRIVACY" value:&stru_100249230 table:@"OptinDescriptions"];
  [(COSAboutTextViewController *)v9 setTitleString:v5];

  id v6 = +[UIImage systemImageNamed:@"chart.bar.xaxis"];
  [(COSAboutTextViewController *)v9 setHeaderGlyph:v6];

  unsigned __int8 v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"ABOUT_DIAGNOSTICS_INFO_TEXT" value:&stru_100249230 table:@"OptinDescriptions"];
  [(COSAboutTextViewController *)v9 setHeaderString:v8];

  [(COSAboutTextViewController *)v9 presentWithController:self];
}

- (id)imageResource
{
  v0 = +[UIApplication sharedApplication];
  v1 = [v0 activeWatch];
  v2 = +[NSString stringWithFormat:@"%@%@", @"DeviceAssets/", @"Screen-Diagnostics"];

  return v2;
}

@end