@interface COSTinkerLocationOptinViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)wantsLightenBlendedScreen;
- (COSTinkerLocationOptinViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)imageResource;
- (id)privacyBundles;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)applyConfirmedOptin:(BOOL)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation COSTinkerLocationOptinViewController

+ (BOOL)controllerNeedsToRun
{
  return 1;
}

- (COSTinkerLocationOptinViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSTinkerLocationOptinViewController;
  v2 = [(COSOptinViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSTinkerLocationOptinViewController *)v2 setStyle:74];
  }
  return v3;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"LOCATION_TINKER_TITLE_%@" value:&stru_100249230 table:@"Localizable-tinker"];
  v4 = [UIApp tinkerUserName];
  objc_super v5 = [v4 localizedCapitalizedString];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5);

  return v6;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"LOCATION_DETAIL_TINKER_%@" value:&stru_100249230 table:@"Localizable-tinker"];
  v4 = [UIApp tinkerUserName];
  objc_super v5 = [v4 localizedCapitalizedString];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5);

  return v6;
}

- (id)imageResource
{
  v2 = [UIApp activeWatch];
  v3 = sub_10005F39C(v2);

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
  objc_super v5 = +[UIApplication sharedApplication];
  v6 = [v5 setupController];
  [v6 setDidAllowTinkerLocationPermissions:v3];

  v7 = +[UIApplication sharedApplication];
  v8 = [v7 bridgeController];
  [v8 tellGizmoToSetLocationEnabled:v3];

  id v9 = [(COSTinkerLocationOptinViewController *)self delegate];
  [v9 buddyControllerDone:self];
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"LOCATION_ACCEPT" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"LOCATION_DECLINE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)privacyBundles
{
  return &off_10025BD28;
}

@end