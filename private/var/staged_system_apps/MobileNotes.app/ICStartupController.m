@interface ICStartupController
+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)lastShownStartupWelcomeScreenVersion;
+ (BOOL)consumeShouldResetMigrationStateInternalSetting;
+ (BOOL)hasAccountForMigration;
+ (BOOL)hasSetValueForFirstLaunchMigration;
+ (BOOL)hasShownWelcomeScreen;
+ (BOOL)isCurrentStartupVersionNewerThanLastSeenVersion;
+ (BOOL)isOSVersion:(id *)a3 newerThanVersion:(id *)a4;
+ (BOOL)shouldBypassICloudAlert;
+ (BOOL)shouldBypassWelcomeAndWhatsNewScreen;
+ (BOOL)shouldShowUpdateICloudAccountView;
+ (BOOL)shouldShowWelcomeOrWhatsNewScreen;
+ (BOOL)shouldShowWelcomeScreen;
+ (BOOL)shouldShowWhatsNewScreen;
+ (id)copyExchangeAccountAlertMessage;
+ (id)copyIMAPAccountAlertMessage;
+ (id)hasShowWelcomeScreenDefaultsKey;
+ (id)hostedAppKeyWithBaseKey:(id)a3;
+ (id)importantDisclaimerAttributedString;
+ (id)lastShownStartupDefaultsKey;
+ (id)moveLocalNotesAlertMessage;
+ (void)setHasShownWelcomeScreen:(BOOL)a3;
+ (void)setLastShownStartupWelcomeScreenVersionToCurrentVersion;
- (BOOL)didAddReachabilityObserver;
- (BOOL)userDidContinue;
- (ICMutableBool)previousCheckStatusCancellationObject;
- (ICStartupController)initWithDelegate:(id)a3;
- (ICStartupControllerDelegate)delegate;
- (NSArray)primaryAccountDevices;
- (NSString)targetAccountID;
- (NSTimer)timeoutTimer;
- (id)timerRunLoopMode;
- (unint64_t)deviceCheckIndicatorAnimationLevel;
- (unint64_t)getStartupMigrationType;
- (unint64_t)getStartupMigrationTypeWithAccounts:(id)a3;
- (void)checkStatusIfNecessaryWithDeviceCheckIndicator:(id)a3;
- (void)dealloc;
- (void)deviceCheckTimeout:(id)a3;
- (void)didContinueFromStartupView;
- (void)didUpgradeFromStartupView:(BOOL)a3;
- (void)migrationStateDidChange:(id)a3;
- (void)reachabilityChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceCheckIndicatorAnimationLevel:(unint64_t)a3;
- (void)setDidAddReachabilityObserver:(BOOL)a3;
- (void)setPreviousCheckStatusCancellationObject:(id)a3;
- (void)setPrimaryAccountDevices:(id)a3;
- (void)setTargetAccountID:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setUserDidContinue:(BOOL)a3;
- (void)startIndicatorAnimationIfNecessaryForDeviceCheckIndicator:(id)a3;
- (void)startTimeoutTimerIfNecessaryWithDeviceCheckIndicator:(id)a3;
- (void)stopIndicatorAnimationIfNecessaryForDeviceCheckIndicator:(id)a3;
@end

@implementation ICStartupController

+ (BOOL)consumeShouldResetMigrationStateInternalSetting
{
  v2 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = kICInternalSettingsResetMigrationStateDefaultKey;
  unsigned __int8 v4 = [v2 BOOLForKey:kICInternalSettingsResetMigrationStateDefaultKey];

  v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObjectForKey:v3];

  return v4;
}

+ (BOOL)shouldBypassWelcomeAndWhatsNewScreen
{
  v2 = +[ICLaunchConfiguration currentConfiguration];
  uint64_t v3 = (char *)[v2 environment];

  if ((unint64_t)(v3 - 1) < 2) {
    return 1;
  }
  v5 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v6 = [v5 BOOLForKey:@"bypassWhatsNewScreen"];

  return v6;
}

+ (BOOL)shouldShowWhatsNewScreen
{
  if ([a1 shouldBypassWelcomeAndWhatsNewScreen])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    unsigned int v3 = [a1 isCurrentStartupVersionNewerThanLastSeenVersion];
    if (v3) {
      LOBYTE(v3) = [a1 shouldShowWelcomeScreen] ^ 1;
    }
  }
  return v3;
}

+ (BOOL)shouldShowWelcomeScreen
{
  if ([a1 shouldBypassWelcomeAndWhatsNewScreen])
  {
    LOBYTE(v3) = 0;
    return v3;
  }
  unsigned __int8 v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:kICEnableForcediCloudMigrationDefaultsKey];

  if ([a1 hasShownWelcomeScreen])
  {
    if ([a1 isCurrentStartupVersionNewerThanLastSeenVersion])
    {
      unsigned __int8 v6 = +[ICAccountUtilities sharedInstance];
      unsigned int v7 = [v6 primaryICloudAccountEnabled];

      v8 = +[ICAccountUtilities sharedInstance];
      unsigned int v9 = [v8 didChooseToMigratePrimaryICloudAccount];

      v10 = +[ICAccountUtilities sharedInstance];
      v11 = [v10 primaryICloudACAccount];
      unsigned int v12 = [v11 ic_isNotesMigrated];

      unsigned int v13 = +[ICMigrationController didChooseToMigrateLocalAccount];
      int v3 = (v9 | ~v7 | v12) & v13 ^ 1;
      v14 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        unsigned int v35 = v7;
        __int16 v36 = 1024;
        unsigned int v37 = v9;
        __int16 v38 = 1024;
        unsigned int v39 = v12;
        __int16 v40 = 1024;
        unsigned int v41 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "shouldShowWelcomeScreen: primaryiCloudAccountEnabled=%d didChooseToMigratePrimaryiCloudAccount=%d primaryiCloudAccountMigrated=%d didChooseToMigrateLocalAccount=%d", buf, 0x1Au);
      }

      if (v3) {
        goto LABEL_30;
      }
    }
    else
    {
      int v3 = 0;
    }
    if (((v5 ^ 1) & 1) == 0)
    {
      v15 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "shouldShowWelcomeScreen: forceUpgrade", buf, 2u);
      }

      v16 = +[ICAccountUtilities sharedInstance];
      v17 = [v16 allICloudACAccounts];

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = v17;
      id v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v30;
        uint64_t v22 = ICACAccountPropertyDidChooseToMigrate;
        while (2)
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            v24 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v25 = [v24 objectForKeyedSubscript:v22];
            if (objc_msgSend(v24, "ic_supportsModernNotes"))
            {
              BOOL v26 = ![v24 ic_isNotesEnabled] || v25 == 0;
              if (!v26 && ([v25 BOOLValue] & 1) == 0)
              {

                int v3 = 1;
                goto LABEL_29;
              }
            }
          }
          id v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
      int v3 = 0;
LABEL_29:
    }
    goto LABEL_30;
  }
  int v3 = 1;
LABEL_30:
  v27 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v35 = v3;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "shouldShowWelcomeScreen: shouldShow=%d", buf, 8u);
  }

  return v3;
}

+ (BOOL)shouldShowWelcomeOrWhatsNewScreen
{
  if ([a1 shouldShowWelcomeScreen]) {
    return 1;
  }

  return [a1 shouldShowWhatsNewScreen];
}

- (void)dealloc
{
  int v3 = [(ICStartupController *)self previousCheckStatusCancellationObject];
  [v3 setValue:1];

  unsigned __int8 v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)ICStartupController;
  [(ICStartupController *)&v5 dealloc];
}

+ (BOOL)hasSetValueForFirstLaunchMigration
{
  return 0;
}

+ (BOOL)hasShownWelcomeScreen
{
  v2 = [a1 hasShowWelcomeScreenDefaultsKey];
  int v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:v2];

  objc_super v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    v8 = v2;
    __int16 v9 = 1024;
    unsigned int v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@=%d", (uint8_t *)&v7, 0x12u);
  }

  return v4;
}

+ (void)setHasShownWelcomeScreen:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v6 = [a1 hasShowWelcomeScreenDefaultsKey];
  [v5 setBool:v3 forKey:v6];

  [a1 setLastShownStartupWelcomeScreenVersionToCurrentVersion];
}

+ (id)hasShowWelcomeScreenDefaultsKey
{
  return _[a1 hostedAppKeyWithBaseKey:@"hasShownWelcomeScreen"];
}

+ (id)lastShownStartupDefaultsKey
{
  return _[a1 hostedAppKeyWithBaseKey:@"lastShownStartupVersion-1"];
}

+ (id)hostedAppKeyWithBaseKey:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[UIApplication sharedApplication];
  unsigned int v5 = [v4 ic_hasConnectedHostedWindowScene];

  unsigned __int8 v6 = v3;
  if (v5)
  {
    unsigned __int8 v6 = +[NSString stringWithFormat:@"%@-%@", @"Calculator", v3];
  }

  return v6;
}

+ (BOOL)shouldBypassICloudAlert
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"bypassICloudAlert"];

  return v3;
}

+ (BOOL)isCurrentStartupVersionNewerThanLastSeenVersion
{
  unsigned __int8 v3 = +[UMUserManager sharedManager];
  unsigned int v4 = [v3 currentUser];

  if ([v4 userType] == (id)1)
  {
    a1 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled((os_log_t)a1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)a1, OS_LOG_TYPE_INFO, "isCurrentStartupVersionNewerThanLastSeenVersion: UMUserTypeEphemeral", buf, 2u);
    }

    LOBYTE(a1) = 0;
  }
  else
  {
    memset(buf, 0, sizeof(buf));
    uint64_t v15 = 0;
    [a1 lastShownStartupWelcomeScreenVersion];
    unsigned int v5 = +[UIApplication sharedApplication];
    unsigned int v6 = [v5 ic_hasConnectedHostedWindowScene];

    uint64_t v13 = 0;
    if (v6) {
      int v7 = &xmmword_100524A98;
    }
    else {
      int v7 = &xmmword_100524AB0;
    }
    long long v12 = *v7;
    *(_OWORD *)v16 = v12;
    uint64_t v17 = v13;
    long long v10 = *(_OWORD *)buf;
    uint64_t v11 = v15;
    LODWORD(a1) = [a1 isOSVersion:v16 newerThanVersion:&v10];
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v16 = 67109120;
      *(_DWORD *)&v16[4] = a1;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "isCurrentStartupVersionNewerThanLastSeenVersion=%d", v16, 8u);
    }
  }
  return (char)a1;
}

+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)lastShownStartupWelcomeScreenVersion
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  unsigned int v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [a2 lastShownStartupDefaultsKey];
  id v15 = [v5 objectForKey:v6];

  objc_opt_class();
  int v7 = ICDynamicCast();
  if ([v7 count] == (id)3)
  {
    objc_opt_class();
    v8 = [v7 objectAtIndexedSubscript:0];
    __int16 v9 = ICDynamicCast();
    retstr->var0 = (int64_t)[v9 integerValue];

    objc_opt_class();
    long long v10 = [v7 objectAtIndexedSubscript:1];
    uint64_t v11 = ICDynamicCast();
    retstr->var1 = (int64_t)[v11 integerValue];

    objc_opt_class();
    long long v12 = [v7 objectAtIndexedSubscript:2];
    uint64_t v13 = ICDynamicCast();
    retstr->var2 = (int64_t)[v13 integerValue];
  }

  return result;
}

+ (BOOL)isOSVersion:(id *)a3 newerThanVersion:(id *)a4
{
  BOOL v4 = a3->var0 <= a4->var0;
  if (a3->var0 == a4->var0)
  {
    int64_t var1 = a3->var1;
    int64_t v6 = a4->var1;
    BOOL v4 = var1 <= v6;
    if (var1 == v6) {
      BOOL v4 = a3->var2 <= a4->var2;
    }
  }
  return !v4;
}

+ (void)setLastShownStartupWelcomeScreenVersionToCurrentVersion
{
  unsigned __int8 v3 = +[NSProcessInfo processInfo];
  BOOL v4 = v3;
  if (v3) {
    [v3 operatingSystemVersion];
  }

  unsigned int v5 = +[NSNumber numberWithInteger:0];
  v11[0] = v5;
  int64_t v6 = +[NSNumber numberWithInteger:0];
  v11[1] = v6;
  int v7 = +[NSNumber numberWithInteger:0];
  v11[2] = v7;
  v8 = +[NSArray arrayWithObjects:v11 count:3];

  __int16 v9 = +[NSUserDefaults standardUserDefaults];
  long long v10 = [a1 lastShownStartupDefaultsKey];
  [v9 setObject:v8 forKey:v10];
}

+ (BOOL)hasAccountForMigration
{
  return +[ICAccount isCloudKitAccountAvailable];
}

+ (BOOL)shouldShowUpdateICloudAccountView
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = +[ICNoteContext sharedContext];
  unsigned __int8 v3 = [v2 managedObjectContext];
  BOOL v4 = +[ICAccount allCloudKitAccountsInContext:v3];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (![*(id *)(*((void *)&v11 + 1) + 8 * i) didChooseToMigrate])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v4 = +[ICMigrationController legacyLocalAccount];
  BOOL v9 = v4 != 0;
LABEL_11:

  return v9;
}

- (ICStartupController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStartupController;
  id v5 = [(ICStartupController *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    [(ICStartupController *)v5 setDelegate:v4];
    uint64_t v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v6 selector:"migrationStateDidChange:" name:ICMigrationStateDidChangeNotification object:0];
  }
  return v6;
}

- (void)didContinueFromStartupView
{
  [(id)objc_opt_class() setHasShownWelcomeScreen:1];

  [(ICStartupController *)self setUserDidContinue:1];
}

- (void)didUpgradeFromStartupView:(BOOL)a3
{
  BOOL v3 = a3;
  [(ICStartupController *)self didContinueFromStartupView];
  if ([(ICStartupController *)self didAddReachabilityObserver])
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    uint64_t v6 = kReachabilityChangedNotification;
    uint64_t v7 = +[ICReachability sharedReachabilityForInternetConnection];
    [v5 removeObserver:self name:v6 object:v7];

    [(ICStartupController *)self setDidAddReachabilityObserver:0];
  }
  v8 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v56 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User made upgrade choice (%d) from startup view", buf, 8u);
  }

  objc_super v9 = [(ICStartupController *)self targetAccountID];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = +[ICAccountUtilities sharedInstance];
  long long v12 = v11;
  if (v9)
  {
    id v13 = [v11 iCloudACAccountWithIdentifier:v9];

    if (!v13) {
      goto LABEL_21;
    }
    [v10 addObject:v13];
  }
  else
  {
    BOOL v39 = v3;
    long long v14 = [v11 allICloudACAccounts];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v13 = v14;
    id v15 = [v13 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v49;
      uint64_t v18 = ICACAccountPropertyDidChooseToMigrate;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v49 != v17) {
            objc_enumerationMutation(v13);
          }
          id v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if (objc_msgSend(v20, "ic_isNotesEnabled"))
          {
            if (objc_msgSend(v20, "ic_supportsModernNotes"))
            {
              uint64_t v21 = [v20 objectForKeyedSubscript:v18];
              unsigned __int8 v22 = [v21 BOOLValue];

              if ((v22 & 1) == 0) {
                [v10 addObject:v20];
              }
            }
          }
        }
        id v16 = [v13 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v16);
    }

    BOOL v3 = v39;
  }

LABEL_21:
  if (v3)
  {
    +[ICMigrationController setDidChooseToMigrateLocalAccount:1];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v23 = v10;
    id v24 = [v23 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v45;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          v28 = v9;
          if (*(void *)v45 != v26) {
            objc_enumerationMutation(v23);
          }
          long long v29 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
          long long v30 = +[ICMigrationController legacyAccountForICloudACAccount:v29];
          objc_super v9 = [v29 identifier];

          unsigned int v31 = +[ICMigrationController currentMigrationStateForAccountID:v9];
          if (v30 && (v31 < 2 || ([v30 didChooseToMigrate] & 1) == 0))
          {
            long long v32 = +[ICMigrationController sharedController];
            [v32 startMigrationForICloudAccountID:v9];
          }
          +[ICMigrationController migrateLocalAccountIfNecessary];
        }
        id v25 = [v23 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v25);
    }
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v33 = v10;
    id v34 = [v33 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v41;
      do
      {
        unsigned int v37 = 0;
        __int16 v38 = v9;
        do
        {
          if (*(void *)v41 != v36) {
            objc_enumerationMutation(v33);
          }
          objc_super v9 = [*(id *)(*((void *)&v40 + 1) + 8 * (void)v37) identifier];

          +[ICMigrationController setCurrentMigrationState:1 forAccountID:v9];
          unsigned int v37 = (char *)v37 + 1;
          __int16 v38 = v9;
        }
        while (v35 != v37);
        id v35 = [v33 countByEnumeratingWithState:&v40 objects:v52 count:16];
      }
      while (v35);
    }
  }
}

- (id)timerRunLoopMode
{
  return NSDefaultRunLoopMode;
}

- (void)checkStatusIfNecessaryWithDeviceCheckIndicator:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Check device and migration status.", (uint8_t *)buf, 2u);
  }

  uint64_t v6 = [(ICStartupController *)self previousCheckStatusCancellationObject];

  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cancelling previous status check.", (uint8_t *)buf, 2u);
    }

    v8 = [(ICStartupController *)self previousCheckStatusCancellationObject];
    [v8 setValue:1];

    [(ICStartupController *)self setPreviousCheckStatusCancellationObject:0];
  }
  [(ICStartupController *)self setPrimaryAccountDevices:0];
  id v9 = objc_alloc_init((Class)ICMutableBool);
  [(ICStartupController *)self setPreviousCheckStatusCancellationObject:v9];
  id v10 = [(ICStartupController *)self timeoutTimer];

  if (v10)
  {
    long long v11 = [(ICStartupController *)self timeoutTimer];
    [v11 invalidate];

    [(ICStartupController *)self setTimeoutTimer:0];
    [(ICStartupController *)self setDeviceCheckIndicatorAnimationLevel:1];
    [(ICStartupController *)self startTimeoutTimerIfNecessaryWithDeviceCheckIndicator:v4];
  }
  else
  {
    [(ICStartupController *)self setDeviceCheckIndicatorAnimationLevel:0];
    [(ICStartupController *)self startIndicatorAnimationIfNecessaryForDeviceCheckIndicator:v4];
  }
  objc_initWeak(buf, self);
  long long v12 = +[ICNoteContext sharedContext];
  id v13 = [v12 primaryICloudACAccount];
  long long v14 = [v13 identifier];

  if (v14)
  {
    id v15 = +[ICNoteContext sharedContext];
    id v16 = [v15 managedObjectContext];
    uint64_t v17 = +[ICAccount accountWithIdentifier:v14 context:v16];

    if (v17)
    {
      [(ICStartupController *)self startIndicatorAnimationIfNecessaryForDeviceCheckIndicator:v4];
      uint64_t v18 = +[ICCompatibilityController sharedController];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000C48D0;
      v26[3] = &unk_100628CF0;
      id v27 = v9;
      objc_copyWeak(&v29, buf);
      id v28 = v4;
      [v18 devicesForAccount:v17 completionHandler:v26];

      objc_destroyWeak(&v29);
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  if (!+[ICMigrationController currentMigrationStateForAccountID:v14])
  {
    [(ICStartupController *)self startIndicatorAnimationIfNecessaryForDeviceCheckIndicator:v4];
    id v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    uint64_t v21 = sub_1000C4AD8;
    unsigned __int8 v22 = &unk_100628D18;
    id v23 = v9;
    objc_copyWeak(&v25, buf);
    id v24 = v4;
    +[ICMigrationUtilities fetchAndSetMigrationStateForAccountID:0 withCompletionHandler:&v19];

    objc_destroyWeak(&v25);
  }
  -[ICStartupController stopIndicatorAnimationIfNecessaryForDeviceCheckIndicator:](self, "stopIndicatorAnimationIfNecessaryForDeviceCheckIndicator:", v4, v19, v20, v21, v22);

  objc_destroyWeak(buf);
}

- (void)deviceCheckTimeout:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Timeout waiting for device list or migration state", v11, 2u);
  }

  uint64_t v6 = [(ICStartupController *)self previousCheckStatusCancellationObject];
  [v6 setValue:1];

  [(ICStartupController *)self setPreviousCheckStatusCancellationObject:0];
  uint64_t v7 = [v4 userInfo];
  unsigned __int8 v8 = [v7 conformsToProtocol:&OBJC_PROTOCOL___ICStartupDeviceCheckIndicator];

  if (v8)
  {
    id v9 = [v4 userInfo];
  }
  else
  {
    id v10 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1004DA868(v4, v10);
    }

    id v9 = 0;
  }
  [(ICStartupController *)self setTimeoutTimer:0];
  [v9 stopIndicatorAnimation];
}

- (void)startTimeoutTimerIfNecessaryWithDeviceCheckIndicator:(id)a3
{
  id v9 = a3;
  id v4 = [(ICStartupController *)self timeoutTimer];

  if (!v4)
  {
    id v5 = +[NSTimer timerWithTimeInterval:self target:"deviceCheckTimeout:" selector:v9 userInfo:0 repeats:4.0];
    [(ICStartupController *)self setTimeoutTimer:v5];

    uint64_t v6 = +[NSRunLoop currentRunLoop];
    uint64_t v7 = [(ICStartupController *)self timeoutTimer];
    unsigned __int8 v8 = [(ICStartupController *)self timerRunLoopMode];
    [v6 addTimer:v7 forMode:v8];
  }
}

- (void)startIndicatorAnimationIfNecessaryForDeviceCheckIndicator:(id)a3
{
  id v4 = a3;
  if (![(ICStartupController *)self deviceCheckIndicatorAnimationLevel]) {
    [v4 startIndicatorAnimation];
  }
  [(ICStartupController *)self setDeviceCheckIndicatorAnimationLevel:(char *)[(ICStartupController *)self deviceCheckIndicatorAnimationLevel] + 1];
  [(ICStartupController *)self startTimeoutTimerIfNecessaryWithDeviceCheckIndicator:v4];
}

- (void)stopIndicatorAnimationIfNecessaryForDeviceCheckIndicator:(id)a3
{
  id v6 = a3;
  if ([(ICStartupController *)self deviceCheckIndicatorAnimationLevel])
  {
    [(ICStartupController *)self setDeviceCheckIndicatorAnimationLevel:(char *)[(ICStartupController *)self deviceCheckIndicatorAnimationLevel] - 1];
    if (![(ICStartupController *)self deviceCheckIndicatorAnimationLevel])
    {
      id v4 = [(ICStartupController *)self timeoutTimer];

      if (v4)
      {
        id v5 = [(ICStartupController *)self timeoutTimer];
        [v5 invalidate];

        [(ICStartupController *)self setTimeoutTimer:0];
        [v6 stopIndicatorAnimation];
      }
    }
  }
}

+ (id)copyIMAPAccountAlertMessage
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"This IMAP account is syncing with the Notes app. If you copy your notes to iCloud, this account will stop syncing with the Notes app.", &stru_10063F3D8, 0 value table];

  return v3;
}

+ (id)copyExchangeAccountAlertMessage
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"This Exchange account is syncing with the Notes app. If you copy your notes to iCloud, this account will stop syncing with the Notes app.", &stru_10063F3D8, 0 value table];

  return v3;
}

+ (id)moveLocalNotesAlertMessage
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"To see these notes on all your devices, move them to iCloud.\n\nOnce these notes are moved to iCloud, this local account will be removed.", &stru_10063F3D8, 0 value table];

  return v3;
}

- (void)migrationStateDidChange:(id)a3
{
  id v4 = a3;
  if ([(ICStartupController *)self userDidContinue]
    && !+[ICStartupController hasAccountForMigration])
  {
    id v10 = [(ICStartupController *)self delegate];
    [v10 startupControllerShouldCloseDeviceListView];
  }
  else if (![(ICStartupController *)self userDidContinue])
  {
    objc_opt_class();
    id v5 = [v4 userInfo];
    id v6 = [v5 objectForKeyedSubscript:@"ICCurrentDeviceMigrationStateChangeWasForLocalAccountKey"];
    uint64_t v7 = ICDynamicCast();

    if (([v7 BOOLValue] & 1) == 0)
    {
      unsigned __int8 v8 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Startup migration type might have changed from migration state did change.", v11, 2u);
      }

      id v9 = [(ICStartupController *)self delegate];
      [v9 startupMigrationTypeMightHaveChanged];
    }
  }
}

- (void)reachabilityChanged:(id)a3
{
  if (![(ICStartupController *)self userDidContinue])
  {
    id v4 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Startup migration type might have changed from reachability changed.", v6, 2u);
    }

    id v5 = [(ICStartupController *)self delegate];
    [v5 startupMigrationTypeMightHaveChanged];
  }
}

+ (id)importantDisclaimerAttributedString
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 URLForResource:@"WelcomeScreenDisclaimer" withExtension:@"rtf"];

  id v4 = [objc_alloc((Class)NSAttributedString) initWithString:&stru_10063F3D8];
  if (v3)
  {
    id v5 = objc_alloc((Class)NSAttributedString);
    NSAttributedStringDocumentAttributeKey v10 = NSDocumentTypeDocumentAttribute;
    NSAttributedStringDocumentType v11 = NSRTFTextDocumentType;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v7 = [v5 initWithURL:v3 options:v6 documentAttributes:0 error:0];

    id v4 = (id)v6;
  }
  else
  {
    unsigned __int8 v8 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1004DA900(v8);
    }

    id v7 = [objc_alloc((Class)NSAttributedString) initWithString:@"Missing RTF file"];
  }

  return v7;
}

- (unint64_t)getStartupMigrationType
{
  BOOL v3 = +[ICAccountUtilities sharedInstance];
  id v4 = [v3 allICloudACAccounts];

  unint64_t v5 = [(ICStartupController *)self getStartupMigrationTypeWithAccounts:v4];
  return v5;
}

- (unint64_t)getStartupMigrationTypeWithAccounts:(id)a3
{
  id v4 = a3;
  +[ICMigrationController upgradeEmptyLocalLegacyAccountIfNecessary];
  unsigned __int8 v39 = [(id)objc_opt_class() hasShownWelcomeScreen];
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v4 count]];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v6);
        }
        NSAttributedStringDocumentType v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (objc_msgSend(v11, "ic_isNotesEnabled")
          && objc_msgSend(v11, "ic_supportsModernNotes"))
        {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v8);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v42;
    uint64_t v16 = ICACAccountPropertyDidChooseToMigrate;
    while (2)
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
        id v19 = [v18 objectForKeyedSubscript:v16];
        if ((objc_msgSend(v18, "ic_isNotesMigrated") & 1) == 0
          && ([v19 BOOLValue] & 1) == 0)
        {

          int v20 = 0;
          goto LABEL_22;
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  int v20 = 1;
LABEL_22:

  if (![(ICStartupController *)self didAddReachabilityObserver])
  {
    uint64_t v21 = +[NSNotificationCenter defaultCenter];
    uint64_t v22 = kReachabilityChangedNotification;
    id v23 = +[ICReachability sharedReachabilityForInternetConnection];
    [v21 addObserver:self selector:"reachabilityChanged:" name:v22 object:v23];

    [(ICStartupController *)self setDidAddReachabilityObserver:1];
  }
  if (+[ICMigrationController didChooseToMigrateLocalAccount])
  {
    id v24 = 0;
  }
  else
  {
    id v25 = +[ICMigrationController legacyLocalAccount];
    id v24 = ICProtocolCast();
  }
  uint64_t v26 = +[ICMigrationController legacyAccountContext];
  if ([v12 count])
  {
    id v27 = [(ICStartupController *)self primaryAccountDevices];
    unsigned int v28 = [v27 ic_containsObjectPassingTest:&stru_100628D58];

    if (v20)
    {
      if (!v24)
      {
LABEL_33:
        long long v30 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeAlreadyUpgraded", buf, 2u);
        }
        unint64_t v31 = 1;
        goto LABEL_61;
      }
      id v29 = [v24 objectID];
      if (![v26 nonEmptyNoteExistsForLegacyAccountWithObjectID:v29]
        || +[ICMigrationController didChooseToMigrateLocalAccount])
      {

        goto LABEL_33;
      }
      unsigned __int8 v37 = +[ICMigrationController didMigrateLocalAccount];

      if (v37) {
        goto LABEL_33;
      }
      long long v30 = os_log_create("com.apple.notes", "Migration");
      BOOL v38 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      if (v39)
      {
        if (v38)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeAlreadyUpgradedButLocalAccountNotUpgraded", buf, 2u);
        }
        unint64_t v31 = 3;
      }
      else if (v38)
      {
        *(_WORD *)buf = 0;
        unint64_t v31 = 2;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeAlreadyUpgradedButLocalAccountNotUpgradedAndIsFirstLaunchOnThisDevice", buf, 2u);
      }
      else
      {
        unint64_t v31 = 2;
      }
    }
    else if ([v12 count] {
           && (+[ICUtilities isInternetReachable] & 1) == 0)
    }
    {
      long long v30 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeICloudAccountButOffline", buf, 2u);
      }
      unint64_t v31 = 6;
    }
    else if ([v12 count] {
           && ([(ICStartupController *)self primaryAccountDevices],
    }
               id v34 = objc_claimAutoreleasedReturnValue(),
               v34,
               !v34))
    {
      long long v30 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeICloudAccountAndOnlineButUnableToGetDevices", buf, 2u);
      }
      unint64_t v31 = 7;
    }
    else
    {
      long long v30 = os_log_create("com.apple.notes", "Migration");
      BOOL v35 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      if (v28)
      {
        if (v35)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeNotesOnOneOrMoreDevicesSomeRequireOSUpdates", buf, 2u);
        }
        unint64_t v31 = 5;
      }
      else
      {
        if (v35)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeAllDevicesUpgradedOrLocalNotesWithNoICloudAccount", buf, 2u);
        }
        unint64_t v31 = 4;
      }
    }
  }
  else if (v24 {
         && ([v24 objectID],
  }
             long long v32 = objc_claimAutoreleasedReturnValue(),
             unsigned __int8 v33 = [v26 nonEmptyNoteExistsForLegacyAccountWithObjectID:v32],
             v32,
             (v33 & 1) != 0))
  {
    long long v30 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeNoICloudWithOnlyHTMLLocalAccount", buf, 2u);
    }
    unint64_t v31 = 8;
  }
  else
  {
    long long v30 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "startupMigrationType: ICStartupMigrationTypeNoICloudOrLocalAccounts", buf, 2u);
    }
    unint64_t v31 = 9;
  }
LABEL_61:

  return v31;
}

- (NSArray)primaryAccountDevices
{
  return self->_primaryAccountDevices;
}

- (void)setPrimaryAccountDevices:(id)a3
{
}

- (NSString)targetAccountID
{
  return self->_targetAccountID;
}

- (void)setTargetAccountID:(id)a3
{
}

- (BOOL)userDidContinue
{
  return self->_userDidContinue;
}

- (void)setUserDidContinue:(BOOL)a3
{
  self->_userDidContinue = a3;
}

- (unint64_t)deviceCheckIndicatorAnimationLevel
{
  return self->_deviceCheckIndicatorAnimationLevel;
}

- (void)setDeviceCheckIndicatorAnimationLevel:(unint64_t)a3
{
  self->_deviceCheckIndicatorAnimationLevel = a3;
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (ICStartupControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICStartupControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICMutableBool)previousCheckStatusCancellationObject
{
  return self->_previousCheckStatusCancellationObject;
}

- (void)setPreviousCheckStatusCancellationObject:(id)a3
{
}

- (BOOL)didAddReachabilityObserver
{
  return self->_didAddReachabilityObserver;
}

- (void)setDidAddReachabilityObserver:(BOOL)a3
{
  self->_didAddReachabilityObserver = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousCheckStatusCancellationObject, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_targetAccountID, 0);

  objc_storeStrong((id *)&self->_primaryAccountDevices, 0);
}

@end