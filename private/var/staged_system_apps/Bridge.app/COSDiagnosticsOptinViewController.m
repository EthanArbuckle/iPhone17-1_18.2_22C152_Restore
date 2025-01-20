@interface COSDiagnosticsOptinViewController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)wantsUnifiedFYI;
- (BOOL)wantsLightenBlendedScreen;
- (COSDiagnosticsOptinViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)detailTitleString;
- (id)learnMoreButtonTitle;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)applyConfirmedOptin:(BOOL)a3;
- (void)learnMoreButtonPressed:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation COSDiagnosticsOptinViewController

+ (BOOL)wantsUnifiedFYI
{
  v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureDiagnosticsSubmissionAllowed] == 1;

  return v3;
}

+ (BOOL)controllerNeedsToRun
{
  v2 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v3 = [v2 isBoolSettingLockedDownByRestrictions:MCFeatureDiagnosticsSubmissionAllowed];

  if (v3) {
    return 0;
  }
  else {
    return !+[COSDiagnosticsOptinViewController wantsUnifiedFYI];
  }
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"DIAG_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"DIAG_DETAIL" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (COSDiagnosticsOptinViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSDiagnosticsOptinViewController;
  v2 = [(COSOptinViewController *)&v5 init];
  unsigned __int8 v3 = v2;
  if (v2) {
    [(COSDiagnosticsOptinViewController *)v2 setStyle:90];
  }
  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
}

- (void)alternateButtonPressed:(id)a3
{
}

- (void)applyConfirmedOptin:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[MCProfileConnection sharedConnection];
  [v5 setBoolValue:v3 forSetting:MCFeatureDiagnosticsSubmissionAllowed];

  v6 = +[UIApplication sharedApplication];
  v7 = [v6 bridgeController];
  [v7 tellGizmoToSetDiagnosticsEnabled:v3];

  id v8 = [(COSDiagnosticsOptinViewController *)self delegate];
  [v8 buddyControllerDone:self];
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"DIAG_ACCEPT" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"DIAG_DECLINE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)learnMoreButtonTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"ABOUT_DIAGS" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailTitleString
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"WHAT_IS_DIAGS" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)learnMoreButtonPressed:(id)a3
{
  v9 = objc_alloc_init(COSAboutTextViewController);
  v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 localizedStringForKey:@"ABOUT_DIAGNOSTICS_PRIVACY" value:&stru_100249230 table:@"OptinDescriptions"];
  [(COSAboutTextViewController *)v9 setTitleString:v5];

  v6 = +[UIImage systemImageNamed:@"chart.bar.xaxis"];
  [(COSAboutTextViewController *)v9 setHeaderGlyph:v6];

  v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"ABOUT_DIAGNOSTICS_INFO_TEXT" value:&stru_100249230 table:@"OptinDescriptions"];
  [(COSAboutTextViewController *)v9 setHeaderString:v8];

  [(COSAboutTextViewController *)v9 presentWithController:self];
}

@end