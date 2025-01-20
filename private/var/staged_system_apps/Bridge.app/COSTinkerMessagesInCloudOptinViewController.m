@interface COSTinkerMessagesInCloudOptinViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)wantsLightenBlendedScreen;
- (COSTinkerMessagesInCloudOptinViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)detailTitleString;
- (id)imageResource;
- (id)privacyBundles;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)applyConfirmedOptin:(BOOL)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation COSTinkerMessagesInCloudOptinViewController

+ (BOOL)controllerNeedsToRun
{
  v2 = BPSGetActiveDevice();
  v3 = [v2 pairingID];
  v4 = [v3 UUIDString];
  v5 = [@"kEnableMessages-" stringByAppendingString:v4];

  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v5, @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
  v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "+[COSTinkerMessagesInCloudOptinViewController controllerNeedsToRun]";
    __int16 v14 = 1024;
    BOOL v15 = AppBooleanValue != 0;
    __int16 v16 = 1024;
    int v17 = keyExistsAndHasValidFormat;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: messagesEnabled:%d, existsAndHasValidFormat:%d", buf, 0x18u);
  }

  BOOL v9 = keyExistsAndHasValidFormat != 1 || AppBooleanValue != 0;
  return v9;
}

- (COSTinkerMessagesInCloudOptinViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSTinkerMessagesInCloudOptinViewController;
  v2 = [(COSOptinViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSTinkerMessagesInCloudOptinViewController *)v2 setStyle:10];
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
  v3 = [v2 localizedStringForKey:@"MIC_TINKER_TITLE_%@" value:&stru_100249230 table:@"Localizable-tinker"];
  v4 = [UIApp setupController];
  objc_super v5 = [v4 tinkerUserName];
  v6 = [v5 localizedCapitalizedString];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v6);

  return v7;
}

- (id)detailString
{
  v2 = [UIApp setupController];
  v3 = [v2 tinkerUserName];
  v4 = [v3 localizedCapitalizedString];

  objc_super v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"MIC_DETAIL_TINKER_%@_%@" value:&stru_100249230 table:@"Localizable-tinker"];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4, v4);

  return v7;
}

- (id)imageResource
{
  return @"messages-80";
}

- (void)suggestedButtonPressed:(id)a3
{
}

- (void)alternateButtonPressed:(id)a3
{
}

- (void)applyConfirmedOptin:(BOOL)a3
{
  if (a3)
  {
    v4 = +[UIApplication sharedApplication];
    objc_super v5 = [v4 bridgeController];
    [v5 tellGizmoToSetMessagesinCloudEnabled:1];
  }
  id v6 = [(COSTinkerMessagesInCloudOptinViewController *)self delegate];
  [v6 buddyControllerDone:self];
}

- (id)privacyBundles
{
  return &off_10025BD58;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"MIC_ACCEPT" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"MIC_DECLINE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailTitleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"WHAT_IS_MIC" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

@end