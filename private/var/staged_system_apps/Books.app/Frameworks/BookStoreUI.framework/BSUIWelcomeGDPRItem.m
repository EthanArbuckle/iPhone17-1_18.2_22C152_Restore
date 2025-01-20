@interface BSUIWelcomeGDPRItem
- (BOOL)welcomeScreenShouldDisplayNavigationBar;
- (BOOL)welcomeScreenShouldShow;
- (id)welcomeScreenViewControllerWithCompletion:(id)a3;
- (void)welcomeScreenViewControllerDidDismiss;
@end

@implementation BSUIWelcomeGDPRItem

- (BOOL)welcomeScreenShouldShow
{
  v2 = +[NSUserDefaults bu_groupUserDefaults];
  unsigned int v3 = [v2 BOOLForKey:@"BKNeverShowGDPRWelcomeScreen"];

  v4 = +[NSUserDefaults bu_groupUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"BKAlwaysShowGDPRWelcomeScreen"];

  v6 = BUOnboardingBooksBundleID();
  unsigned int v7 = +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:v6];

  if ((v7 & 1) == 0)
  {
    v8 = +[BUAccountsProvider sharedProvider];
    v9 = [v8 activeStoreAccount];

    if (v9)
    {
      if (qword_3D40E8 != -1) {
        dispatch_once(&qword_3D40E8, &stru_38E950);
      }
    }
  }
  v10 = BSUIWelcomeScreenLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109888;
    v12[1] = (v5 | v7) & ~v3;
    __int16 v13 = 1024;
    unsigned int v14 = v3;
    __int16 v15 = 1024;
    unsigned int v16 = v5;
    __int16 v17 = 1024;
    unsigned int v18 = v7;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "BSUIWelcomeGDPRItem: welcomeScreenShouldShow: shouldShow: %d forceHide: %d forceShow: %d needsDisplay: %d", (uint8_t *)v12, 0x1Au);
  }

  return (v5 | v7) & ~(_BYTE)v3;
}

- (BOOL)welcomeScreenShouldDisplayNavigationBar
{
  return 0;
}

- (id)welcomeScreenViewControllerWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = [BSUIWelcomeGDPRViewController alloc];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_18F5C;
  v8[3] = &unk_38E0B8;
  id v9 = v3;
  id v5 = v3;
  v6 = [(BSUIWelcomeGDPRViewController *)v4 initWithCompletion:v8];

  return v6;
}

- (void)welcomeScreenViewControllerDidDismiss
{
  id v2 = objc_alloc((Class)AMSAcknowledgePrivacyTask);
  id v3 = BUOnboardingBooksBundleID();
  id v5 = [v2 initWithPrivacyIdentifier:v3];

  v4 = [v5 acknowledgePrivacy];
  [v4 addFinishBlock:&stru_38E9B0];
}

@end