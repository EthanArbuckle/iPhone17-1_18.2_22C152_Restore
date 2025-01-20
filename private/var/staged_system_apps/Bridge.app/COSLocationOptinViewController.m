@interface COSLocationOptinViewController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)locationRestricted;
+ (BOOL)locationServicesEnabled;
+ (void)authorizeLocationForWatchFaces;
+ (void)doWorkForSkippedPane;
- (BOOL)wantsLightenBlendedScreen;
- (COSLocationOptinViewController)init;
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

@implementation COSLocationOptinViewController

+ (void)doWorkForSkippedPane
{
  if (+[COSLocationOptinViewController wantsUnifiedFYI])
  {
    +[COSLocationOptinViewController authorizeLocationForWatchFaces];
  }
}

+ (BOOL)locationServicesEnabled
{
  id v2 = sub_100021DD8();

  return [v2 locationServicesEnabled];
}

+ (BOOL)locationRestricted
{
  if (!+[SFRestrictionsPasscodeController settingEnabled])return 0; {
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  }
  id v2 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 containsObject:@"location"];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (BOOL)controllerNeedsToRun
{
  if ([a1 locationRestricted]) {
    return 0;
  }
  else {
    return !+[COSLocationOptinViewController wantsUnifiedFYI];
  }
}

+ (void)authorizeLocationForWatchFaces
{
  if ([sub_100021DD8() locationServicesEnabled])
  {
    id v2 = sub_100021DD8();
    v3 = +[NSBundle bundleWithPath:@"/System/Library/LocationBundles/AppleWatchFaces.bundle"];
    LODWORD(v2) = [v2 authorizationStatusForBundle:v3];

    if (!v2)
    {
      id v4 = sub_100021DD8();
      id v5 = +[NSBundle bundleWithPath:@"/System/Library/LocationBundles/AppleWatchFaces.bundle"];
      [v4 setAuthorizationStatusByType:4 withCorrectiveCompensation:1 forBundle:v5];
    }
  }
}

- (COSLocationOptinViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSLocationOptinViewController;
  id v2 = [(COSOptinViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSLocationOptinViewController *)v2 setStyle:74];
  }
  return v3;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (id)titleString
{
  id v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"LOCATION_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  id v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"LOCATION_DETAIL" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)imageResource
{
  id v2 = [UIApp activeWatch];
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
  v6 = [v5 bridgeController];
  [v6 tellGizmoToSetLocationEnabled:v3];

  [sub_100021DD8() setLocationServicesEnabled:v3];
  if (v3) {
    +[COSLocationOptinViewController authorizeLocationForWatchFaces];
  }
  id v7 = [(COSLocationOptinViewController *)self delegate];
  [v7 buddyControllerDone:self];
}

- (id)suggestedButtonTitle
{
  id v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"LOCATION_ACCEPT" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  id v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"LOCATION_DECLINE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)privacyBundles
{
  return &off_10025BC38;
}

@end