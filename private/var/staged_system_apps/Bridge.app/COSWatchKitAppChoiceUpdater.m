@interface COSWatchKitAppChoiceUpdater
+ (void)updateBuddyStageAboutPastAppInstallation;
- (BOOL)offerYorktown;
- (void)informAppConduitToInstallAllApps;
- (void)updateAppConduitAboutAppInstallChoice;
@end

@implementation COSWatchKitAppChoiceUpdater

- (BOOL)offerYorktown
{
  v2 = [UIApp setupController];
  unsigned __int8 v3 = [v2 offerYorktownForCurrentPairing];

  return v3;
}

- (void)updateAppConduitAboutAppInstallChoice
{
  unsigned int v3 = [UIApp isEitherPhoneOrActiveWatchGreenTeaDevice];
  v4 = +[COSBackupManager sharedBackupManager];
  unsigned int v5 = [v4 didRestore];

  if (v5)
  {
    v6 = pbb_setup_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Skipping call to appconduit for app installation because restored from backup.", buf, 2u);
    }

LABEL_14:
    [(id)objc_opt_class() updateBuddyStageAboutPastAppInstallation];
    return;
  }
  if (!v3)
  {
    if ([(COSWatchKitAppChoiceUpdater *)self offerYorktown])
    {
      v8 = +[UIApplication sharedApplication];
      v9 = [v8 bridgeController];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000D0F30;
      v11[3] = &unk_100244CE0;
      v11[4] = self;
      [v9 checkApplicationInstallAllowedWithCompletion:v11];

      return;
    }
    v10 = pbb_setup_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Defaulting to Install All Existing Apps.", buf, 2u);
    }

    [(COSWatchKitAppChoiceUpdater *)self informAppConduitToInstallAllApps];
    goto LABEL_14;
  }
  v7 = pbb_setup_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Skipping call to appconduit for all apps installation because opt-in required", buf, 2u);
  }
}

+ (void)updateBuddyStageAboutPastAppInstallation
{
  id v2 = [UIApp setupController];
  [v2 updateActivelyPairingWatchBuddyStage:4];
}

- (void)informAppConduitToInstallAllApps
{
  id v2 = [UIApp activeWatch];
  unsigned int v3 = +[ACXDeviceConnection sharedDeviceConnection];
  [v3 setAllExistingAppsShouldBeInstalled:1 forNewDevice:v2];

  v4 = +[ACXDeviceConnection sharedDeviceConnection];
  [v4 setAlwaysInstall:&__kCFBooleanTrue forDevice:v2];

  unsigned int v5 = pbb_setup_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setAllExistingAppsShouldBeInstalled forNewDevice:%@", (uint8_t *)&v7, 0xCu);
  }

  v6 = pbb_setup_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setAlwaysInstall:1 forNewDevice:%@", (uint8_t *)&v7, 0xCu);
  }

  +[PBBridgeCAReporter recordSetupAppInstallChoice:1];
}

@end