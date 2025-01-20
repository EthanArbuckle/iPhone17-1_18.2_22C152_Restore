@interface COSWatchKitAppsChoiceViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (BOOL)legacyButtonStyles;
- (BOOL)offerYorktown;
- (BOOL)wantsDefaultImageResource;
- (BOOL)wantsInternalFPOLabel;
- (BOOL)wantsLightenBlendedScreen;
- (COSWatchKitAppsChoiceViewController)init;
- (id)alternateButtonString;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)detailTitleString;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)didEstablishHold;
- (void)selectedMoreOptions:(id)a3;
- (void)selectedOptinChoice:(BOOL)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation COSWatchKitAppsChoiceViewController

+ (BOOL)controllerNeedsToRun
{
  if ([UIApp isEitherPhoneOrActiveWatchGreenTeaDevice])
  {
    v2 = +[COSBackupManager sharedBackupManager];
    unsigned int v3 = [v2 didRestore];

    if (!v3) {
      return 1;
    }
  }
  +[COSWatchKitAppChoiceUpdater updateBuddyStageAboutPastAppInstallation];
  return 0;
}

- (COSWatchKitAppsChoiceViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSWatchKitAppsChoiceViewController;
  v2 = [(COSOptinViewController *)&v5 init];
  unsigned int v3 = v2;
  if (v2) {
    [(COSWatchKitAppsChoiceViewController *)v2 setStyle:74];
  }
  return v3;
}

- (BOOL)offerYorktown
{
  v2 = [UIApp setupController];
  unsigned __int8 v3 = [v2 offerYorktownForCurrentPairing];

  return v3;
}

- (BOOL)holdBeforeDisplaying
{
  return 1;
}

- (BOOL)holdWithWaitScreen
{
  return 0;
}

- (void)didEstablishHold
{
  if ([(COSWatchKitAppsChoiceViewController *)self offerYorktown])
  {
    unsigned __int8 v3 = +[UIApplication sharedApplication];
    v4 = [v3 bridgeController];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000A1F00;
    v6[3] = &unk_100244CE0;
    v6[4] = self;
    [v4 checkApplicationInstallAllowedWithCompletion:v6];
  }
  else
  {
    id v5 = [(COSWatchKitAppsChoiceViewController *)self delegate];
    [v5 buddyControllerReleaseHold:self];
  }
}

- (BOOL)legacyButtonStyles
{
  return 1;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"WATCHKIT_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (BOOL)wantsDefaultImageResource
{
  return 1;
}

- (BOOL)wantsInternalFPOLabel
{
  return 1;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"WATCHKIT_CHOICE_OK" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"WATCHKIT_CHOICE_DECLINE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailTitleString
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"WATCHKIT_DETAIL_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"WATCHKIT_DETAIL" value:&stru_100249230 table:@"Localizable"];

  v4 = [UIApp activeWatch];
  LODWORD(v2) = BPSDeviceHasCapabilityForString();

  if (v2)
  {
    id v5 = +[NSBundle mainBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"WATCHKIT_DETAIL_UPGRADE_NEEDED" value:&stru_100249230 table:@"Localizable"];

    unsigned __int8 v3 = (void *)v6;
  }

  return v3;
}

- (id)alternateButtonString
{
  return 0;
}

- (void)suggestedButtonPressed:(id)a3
{
  v4 = pbb_setup_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User Selected to Install All Existing Apps.", v5, 2u);
  }

  [(COSWatchKitAppsChoiceViewController *)self selectedOptinChoice:1];
}

- (void)alternateButtonPressed:(id)a3
{
  v4 = pbb_setup_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User Selected to Manually Install Existing Apps Later.", v5, 2u);
  }

  [(COSWatchKitAppsChoiceViewController *)self selectedOptinChoice:0];
}

- (void)selectedOptinChoice:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [UIApp activeWatch];
  uint64_t v6 = +[ACXDeviceConnection sharedDeviceConnection];
  [v6 setAllExistingAppsShouldBeInstalled:v3 forNewDevice:v5];

  v7 = +[ACXDeviceConnection sharedDeviceConnection];
  [v7 setAlwaysInstall:&__kCFBooleanTrue forDevice:v5];

  v8 = pbb_setup_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = +[NSNumber numberWithBool:v3];
    int v12 = 138412546;
    v13 = v9;
    __int16 v14 = 2112;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setAllExistingAppsShouldBeInstalled:%@ forNewDevice:%@", (uint8_t *)&v12, 0x16u);
  }
  v10 = pbb_setup_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setAlwaysInstall:1 forNewDevice:%@", (uint8_t *)&v12, 0xCu);
  }

  +[PBBridgeCAReporter recordSetupAppInstallChoice:v3];
  +[COSWatchKitAppChoiceUpdater updateBuddyStageAboutPastAppInstallation];
  v11 = [(COSWatchKitAppsChoiceViewController *)self delegate];
  [v11 buddyControllerDone:self];
}

- (void)selectedMoreOptions:(id)a3
{
  [UIApp activeWatch:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = +[ACXDeviceConnection sharedDeviceConnection];
  [v4 setAlwaysInstall:&__kCFBooleanFalse forDevice:v6];

  +[PBBridgeCAReporter recordSetupAppInstallChoice:0];
  +[COSWatchKitAppChoiceUpdater updateBuddyStageAboutPastAppInstallation];
  id v5 = [(COSWatchKitAppsChoiceViewController *)self delegate];
  [v5 buddyControllerDone:self];
}

@end