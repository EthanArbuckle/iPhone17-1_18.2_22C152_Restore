@interface COSPasscodeAdvancedViewController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)isMandatory;
- (BOOL)legacyButtonStyles;
- (BOOL)wantsLightenBlendedScreen;
- (COSPasscodeAdvancedViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)detailTitleString;
- (id)imageResource;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)dealloc;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation COSPasscodeAdvancedViewController

- (COSPasscodeAdvancedViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)COSPasscodeAdvancedViewController;
  v2 = [(COSOptinViewController *)&v6 init];
  if (v2)
  {
    if ([(id)objc_opt_class() isMandatory])
    {
      v3 = +[UIApplication sharedApplication];
      v4 = [v3 bridgeController];
      [v4 sendGizmoPasscodeRestrictions];
    }
    [(COSPasscodeAdvancedViewController *)v2 setStyle:66];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)COSPasscodeAdvancedViewController;
  [(COSPasscodeAdvancedViewController *)&v4 dealloc];
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"LONG_PASSCODE_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)imageResource
{
  v2 = sub_1000328FC(@"Screen-LongPasscode");
  v3 = [UIApp activeWatch];
  int v4 = BPSIsDeviceCompatibleWithVersions();

  if (v4)
  {
    uint64_t v5 = [v2 stringByAppendingString:@"-v4"];

    v2 = (void *)v5;
  }

  return v2;
}

- (id)detailTitleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"WHAT_IS_THIS" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  v2 = [UIApp bridgeController];
  unsigned __int8 v3 = [v2 isTinkerPairing];
  int v4 = +[NSBundle mainBundle];
  uint64_t v5 = v4;
  if (v3)
  {
    CFStringRef v6 = @"LONG_PASSCODE_DESCRIPTION_TINKER";
    CFStringRef v7 = @"Localizable-tinker";
  }
  else
  {
    CFStringRef v6 = @"LONG_PASSCODE_DESCRIPTION";
    CFStringRef v7 = @"Localizable";
  }
  v8 = [v4 localizedStringForKey:v6 value:&stru_100249230 table:v7];

  return v8;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"ADD_LONG_PASSCODE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  return 0;
}

- (BOOL)legacyButtonStyles
{
  return 1;
}

- (void)suggestedButtonPressed:(id)a3
{
  id v4 = [(COSPasscodeAdvancedViewController *)self delegate];
  [v4 buddyControllerDone:self nextControllerClass:objc_opt_class()];
}

+ (BOOL)isMandatory
{
  v2 = [UIApp bridgeController];
  unsigned __int8 v3 = [v2 isTinkerPairing];

  if (v3) {
    return 0;
  }
  uint64_t v5 = +[MCProfileConnection sharedConnection];
  CFStringRef v6 = [v5 valueRestrictionForFeature:MCFeatureMinimumPasscodeLength];
  BOOL v4 = (int)[v6 intValue] > 4;

  return v4;
}

+ (BOOL)controllerNeedsToRun
{
  return !+[COSUnlockPlaceholderViewController isMandatory];
}

@end