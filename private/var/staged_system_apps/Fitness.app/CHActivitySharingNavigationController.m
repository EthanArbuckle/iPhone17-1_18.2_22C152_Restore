@interface CHActivitySharingNavigationController
- (ASFriendListSectionManager)friendListManager;
- (BOOL)_activitySharingIsSetup;
- (BOOL)_cachedPhoneCloudKitAccountStatusIsActive;
- (BOOL)_cachedWatchCloudKitAccountAssumedToExist;
- (BOOL)_cachedWatchCloudKitAccountStatusIsActive;
- (BOOL)_cloudKitAccountsAreActive;
- (BOOL)_fitnessModeRequiresWatchSetup;
- (BOOL)_isSetupViewControllerVisible;
- (BOOL)friendsSetupViewControllerShouldTransitionToCloudKitSignInPhase:(id)a3;
- (BOOL)phoneCloudKitAccountIsActive;
- (BOOL)watchCloudKitAccountAssumedToExist;
- (BOOL)watchCloudKitAccountExists;
- (BOOL)watchCloudKitAccountFetchInProgress;
- (CHActivitySharingNavigationController)initWithFriendListManager:(id)a3 friendManager:(id)a4 achievementsDataProvider:(id)a5 workoutsDataProvider:(id)a6 workoutFormattingManager:(id)a7 formattingManager:(id)a8 badgeImageFactory:(id)a9 healthStore:(id)a10 fitnessAppContext:(id)a11;
- (CHFriendsSetupViewController)friendsSetupViewController;
- (FIUIFormattingManager)formattingManager;
- (NSArray)navigationStackDisplacedBySetupController;
- (NSDate)lastPhoneCloudKitAccountFetchTimestamp;
- (NSDate)lastWatchCloudKitAccountFetchTimestamp;
- (NSSManager)nanoSystemSettingsManager;
- (id)_ppt_scrollView;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_getAndHandlePhoneCloudKitAccountStatus;
- (void)_getAndHandleWatchCloudKitAccountStatus;
- (void)_handleWatchStatusAndCloudKitAccountStatusChange;
- (void)_hideSetupControllerAnimated:(BOOL)a3;
- (void)_setActivitySharingIsSetup:(BOOL)a3;
- (void)_showSetupControllerInPhase:(int64_t)a3 animated:(BOOL)a4;
- (void)_updateActivitySharingWatchPairingStatus;
- (void)dealloc;
- (void)friendsSetupViewController:(id)a3 didCompletePhase:(int64_t)a4;
- (void)friendsSetupViewControllerDidCompleteSetup:(id)a3;
- (void)handleActivitySharingURL:(id)a3;
- (void)scrollToTop;
- (void)setFormattingManager:(id)a3;
- (void)setFriendListManager:(id)a3;
- (void)setFriendsSetupViewController:(id)a3;
- (void)setLastPhoneCloudKitAccountFetchTimestamp:(id)a3;
- (void)setLastWatchCloudKitAccountFetchTimestamp:(id)a3;
- (void)setNanoSystemSettingsManager:(id)a3;
- (void)setNavigationStackDisplacedBySetupController:(id)a3;
- (void)setPhoneCloudKitAccountIsActive:(BOOL)a3;
- (void)setWatchCloudKitAccountAssumedToExist:(BOOL)a3;
- (void)setWatchCloudKitAccountExists:(BOOL)a3;
- (void)setWatchCloudKitAccountFetchInProgress:(BOOL)a3;
@end

@implementation CHActivitySharingNavigationController

- (CHActivitySharingNavigationController)initWithFriendListManager:(id)a3 friendManager:(id)a4 achievementsDataProvider:(id)a5 workoutsDataProvider:(id)a6 workoutFormattingManager:(id)a7 formattingManager:(id)a8 badgeImageFactory:(id)a9 healthStore:(id)a10 fitnessAppContext:(id)a11
{
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  v26 = [CHFriendListViewController alloc];
  v53 = v19;
  v54 = v23;
  v52 = v18;
  id v27 = v19;
  v28 = v20;
  v29 = v21;
  v55 = v22;
  v30 = [(CHFriendListViewController *)v26 initWithFriendListManager:v17 andWithFriendManager:v18 achievementsDataProvider:v27 workoutsDataProvider:v28 workoutFormattingManager:v21 formattingManager:v22 badgeImageFactory:v23 healthStore:v24 fitnessAppContext:v25];
  v61.receiver = self;
  v61.super_class = (Class)CHActivitySharingNavigationController;
  v31 = [(CHActivitySharingNavigationController *)&v61 initWithRootViewController:v30];
  v32 = v31;
  if (v31)
  {
    [(CHActivitySharingNavigationController *)v31 setFormattingManager:v55];
    objc_storeStrong((id *)&v32->_friendListViewController, v30);
    objc_storeStrong((id *)&v32->_friendManager, obj);
    objc_storeStrong((id *)&v32->_imageFactory, a9);
    v33 = +[NSBundle mainBundle];
    v34 = [v33 localizedStringForKey:@"SHARING" value:&stru_1008D8AB8 table:@"Localizable"];
    v35 = [(CHActivitySharingNavigationController *)v32 tabBarItem];
    [v35 setTitle:v34];

    v36 = +[UIImage _systemImageNamed:@"activity.sharing"];
    v37 = [(CHActivitySharingNavigationController *)v32 tabBarItem];
    [v37 setImage:v36];

    v38 = [(CHActivitySharingNavigationController *)v32 navigationBar];
    [v38 setPrefersLargeTitles:1];

    id v39 = [objc_alloc((Class)NSSManager) initWithQueue:&_dispatch_main_q];
    [(CHActivitySharingNavigationController *)v32 setNanoSystemSettingsManager:v39];

    v32->_phoneCloudKitAccountIsActive = [(CHActivitySharingNavigationController *)v32 _cachedPhoneCloudKitAccountStatusIsActive];
    v32->_watchCloudKitAccountExists = [(CHActivitySharingNavigationController *)v32 _cachedWatchCloudKitAccountStatusIsActive];
    v32->_watchCloudKitAccountAssumedToExist = [(CHActivitySharingNavigationController *)v32 _cachedWatchCloudKitAccountAssumedToExist];
    ASLoggingInitialize();
    v40 = (void *)ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v41 = v40;
      unsigned int v42 = [(CHActivitySharingNavigationController *)v32 phoneCloudKitAccountIsActive];
      unsigned int v43 = [(CHActivitySharingNavigationController *)v32 watchCloudKitAccountExists];
      unsigned int v44 = [(CHActivitySharingNavigationController *)v32 watchCloudKitAccountAssumedToExist];
      LODWORD(buf) = 67109632;
      HIDWORD(buf) = v42;
      __int16 v63 = 1024;
      unsigned int v64 = v43;
      __int16 v65 = 1024;
      unsigned int v66 = v44;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Initializing account status from cache: [phone=%d], [watch=%d], [watch(assumed)=%d]", (uint8_t *)&buf, 0x14u);
    }
    objc_storeStrong((id *)&v32->_friendListManager, a3);
    unsigned __int8 v45 = [(CHActivitySharingNavigationController *)v32 _checkPairedWatchIsMinimumVersion];
    v32->_currentlyPairedWatchIsMinimumVersion = v45;
    if ((v45 & 1) != 0
      || ([(ASFriendListSectionManager *)v32->_friendListManager hasAnyFriendsSetup] & 1) != 0
      || ![(CHActivitySharingNavigationController *)v32 _fitnessModeRequiresWatchSetup])
    {
      if ([(CHActivitySharingNavigationController *)v32 _activitySharingIsSetup]) {
        [(CHActivitySharingNavigationController *)v32 _handleWatchStatusAndCloudKitAccountStatusChange];
      }
      else {
        [(CHActivitySharingNavigationController *)v32 _showSetupControllerInPhase:0 animated:0];
      }
    }
    else
    {
      [(CHActivitySharingNavigationController *)v32 _showSetupControllerInPhase:2 animated:0];
    }
    objc_initWeak(&buf, v32);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100129BC0;
    handler[3] = &unk_1008ACE80;
    objc_copyWeak(&v60, &buf);
    notify_register_dispatch(kASCloudKitAccountStatusChangedNotificationKey, &v32->_activitySharingCloudKitAccountStatusChangedToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    ASLoggingInitialize();
    v46 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Registered a callback for CloudKit address changed notifications", v58, 2u);
    }
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100129C48;
    v56[3] = &unk_1008ACE80;
    objc_copyWeak(&v57, &buf);
    notify_register_dispatch(kASGatewayStatusChangedNotificationKey, &v32->_activitySharingGatewayStatusChangedToken, (dispatch_queue_t)&_dispatch_main_q, v56);

    ASLoggingInitialize();
    v47 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Registered a callback for Watch pairing changed notifications", v58, 2u);
    }
    [(CHActivitySharingNavigationController *)v32 _getAndHandlePhoneCloudKitAccountStatus];
    [(CHActivitySharingNavigationController *)v32 _getAndHandleWatchCloudKitAccountStatus];
    v48 = +[NSNotificationCenter defaultCenter];
    [v48 addObserver:v32 selector:"_applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    objc_destroyWeak(&v57);
    objc_destroyWeak(&v60);
    objc_destroyWeak(&buf);
  }

  return v32;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  ASLoggingInitialize();
  v4 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unregistered for CloudKit address changed notifications", buf, 2u);
  }
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)CHActivitySharingNavigationController;
  [(CHActivitySharingNavigationController *)&v6 dealloc];
}

- (void)_applicationDidBecomeActive:(id)a3
{
  if (![(CHActivitySharingNavigationController *)self watchCloudKitAccountExists])
  {
    ASLoggingInitialize();
    v8 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      v9 = "Application active, watch cloudKit status is inactive";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
LABEL_12:
    [(CHActivitySharingNavigationController *)self _getAndHandleWatchCloudKitAccountStatus];
    return;
  }
  if (!self->_lastWatchCloudKitAccountFetchTimestamp)
  {
    ASLoggingInitialize();
    v8 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      v9 = "Application active, watch cloudKit status has never been successfully fetched";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v4 = +[NSDate date];
  [v4 timeIntervalSinceDate:self->_lastWatchCloudKitAccountFetchTimestamp];
  double v6 = v5;
  ASLoggingInitialize();
  v7 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v10 = 134217984;
    *(double *)&v10[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Application active, time since last fetch of watch cloudKit status: %f", v10, 0xCu);
  }

  if (v6 > 3600.0) {
    goto LABEL_12;
  }
}

- (void)scrollToTop
{
  v3 = [(CHActivitySharingNavigationController *)self topViewController];
  friendListViewController = self->_friendListViewController;

  if (v3 == friendListViewController)
  {
    double v5 = self->_friendListViewController;
    [(CHFriendListViewController *)v5 scrollToTop];
  }
}

- (void)setPhoneCloudKitAccountIsActive:(BOOL)a3
{
  if (self->_phoneCloudKitAccountIsActive != a3)
  {
    BOOL v3 = a3;
    self->_phoneCloudKitAccountIsActive = a3;
    id v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setBool:v3 forKey:@"CHActivitySharingPhoneHasCloudKitAccountDefaultsKey"];
  }
}

- (void)setWatchCloudKitAccountExists:(BOOL)a3
{
  if (self->_watchCloudKitAccountExists != a3)
  {
    BOOL v3 = a3;
    self->_watchCloudKitAccountExists = a3;
    id v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setBool:v3 forKey:@"CHActivitySharingWatchHasCloudKitAccountDefaultsKey"];
  }
}

- (void)setWatchCloudKitAccountAssumedToExist:(BOOL)a3
{
  if (self->_watchCloudKitAccountAssumedToExist != a3)
  {
    BOOL v3 = a3;
    self->_watchCloudKitAccountAssumedToExist = a3;
    double v5 = +[NSUserDefaults standardUserDefaults];
    [v5 setBool:v3 forKey:@"CHActivitySharingWatchAssumedToHaveCloudKitAccountDefaultsKey"];

    double v6 = +[NSUserDefaults standardUserDefaults];
    v7 = +[NSDate date];
    [v6 setObject:v7 forKey:@"CHActivitySharingWatchAssumedToHaveCloudKitAccountTimesampDefaultsKey"];

    objc_initWeak(&location, self);
    dispatch_time_t v8 = dispatch_time(0, 600000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10012A1EC;
    block[3] = &unk_1008ABD18;
    objc_copyWeak(&v10, &location);
    block[4] = self;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)handleActivitySharingURL:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CHActivitySharingNavigationController *)self _isSetupViewControllerVisible];
  ASLoggingInitialize();
  double v6 = ASLogDefault;
  BOOL v7 = os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v25 = 138543362;
      id v26 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setup controller is visible, not handling URL: %{public}@", (uint8_t *)&v25, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      int v25 = 138543362;
      id v26 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling URL: %{public}@", (uint8_t *)&v25, 0xCu);
    }
    id v8 = [(CHActivitySharingNavigationController *)self popToRootViewControllerAnimated:0];
    v9 = ASDateFromActivityAppLaunchURL();
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = +[NSDate date];
    }
    v12 = v11;

    ASLoggingInitialize();
    v13 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      id v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Date is %@", (uint8_t *)&v25, 0xCu);
    }
    v14 = [v4 host];
    unsigned int v15 = [v14 isEqualToString:kASActivitySharingHostMe];

    if (v15)
    {
      ASLoggingInitialize();
      v16 = ASLogDefault;
      if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Requesting me detail", (uint8_t *)&v25, 2u);
      }
      [(CHFriendListViewController *)self->_friendListViewController showDetailForMeOnDate:v12];
    }
    else
    {
      id v17 = [v4 host];
      unsigned int v18 = [v17 isEqualToString:kASActivitySharingHostFriendDetail];

      if (v18)
      {
        id v19 = ASFriendUUIDFromActivityAppLaunchURL();
        ASLoggingInitialize();
        id v20 = ASLogDefault;
        if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 138543362;
          id v26 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Requesting friend detail with friendUUID=%{public}@", (uint8_t *)&v25, 0xCu);
        }
        [(CHFriendListViewController *)self->_friendListViewController showDetailForFriendWithUUID:v19 date:v12];
      }
      else
      {
        id v21 = [v4 host];
        unsigned int v22 = [v21 isEqualToString:kASActivitySharingHostInbox];

        ASLoggingInitialize();
        id v23 = ASLogDefault;
        BOOL v24 = os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v24)
          {
            LOWORD(v25) = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Requesting inbox view", (uint8_t *)&v25, 2u);
          }
          [(CHFriendListViewController *)self->_friendListViewController showInbox];
        }
        else if (v24)
        {
          LOWORD(v25) = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Showing friend list", (uint8_t *)&v25, 2u);
        }
      }
    }
  }
}

- (BOOL)_isSetupViewControllerVisible
{
  BOOL v3 = [(CHActivitySharingNavigationController *)self friendsSetupViewController];
  if (v3)
  {
    id v4 = [(CHActivitySharingNavigationController *)self viewControllers];
    unsigned int v5 = [(CHActivitySharingNavigationController *)self friendsSetupViewController];
    unsigned __int8 v6 = [v4 containsObject:v5];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_showSetupControllerInPhase:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(CHActivitySharingNavigationController *)self _isSetupViewControllerVisible])
  {
    id v13 = [(CHActivitySharingNavigationController *)self friendsSetupViewController];
    [v13 setPhase:a3 animated:0];
  }
  else
  {
    BOOL v7 = [(CHActivitySharingNavigationController *)self viewControllers];
    [(CHActivitySharingNavigationController *)self setNavigationStackDisplacedBySetupController:v7];

    id v8 = objc_alloc_init(CHFriendsSetupViewController);
    [(CHActivitySharingNavigationController *)self setFriendsSetupViewController:v8];

    v9 = [(CHActivitySharingNavigationController *)self friendsSetupViewController];
    [v9 setDelegate:self];

    id v10 = [(CHActivitySharingNavigationController *)self friendsSetupViewController];
    [v10 setPhase:a3 animated:0];

    id v11 = [(CHActivitySharingNavigationController *)self friendsSetupViewController];
    v14 = v11;
    v12 = +[NSArray arrayWithObjects:&v14 count:1];
    [(CHActivitySharingNavigationController *)self setViewControllers:v12 animated:v4];

    [(CHActivitySharingNavigationController *)self setNavigationBarHidden:1 animated:v4];
  }
}

- (void)_hideSetupControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CHActivitySharingNavigationController *)self _isSetupViewControllerVisible])
  {
    unsigned int v5 = [(CHActivitySharingNavigationController *)self navigationStackDisplacedBySetupController];
    [(CHActivitySharingNavigationController *)self setViewControllers:v5 animated:v3];

    [(CHActivitySharingNavigationController *)self setNavigationBarHidden:0 animated:v3];
    [(CHActivitySharingNavigationController *)self setNavigationStackDisplacedBySetupController:0];
    [(CHActivitySharingNavigationController *)self setFriendsSetupViewController:0];
  }
}

- (BOOL)friendsSetupViewControllerShouldTransitionToCloudKitSignInPhase:(id)a3
{
  return ![(CHActivitySharingNavigationController *)self _cloudKitAccountsAreActive];
}

- (void)friendsSetupViewController:(id)a3 didCompletePhase:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CHActivitySharingNavigationController *)self friendsSetupViewController];

  if (v7 != v6) {
    return;
  }
  if (a4 == 2)
  {
    id v10 = +[LSApplicationWorkspace defaultWorkspace];
    CFStringRef v8 = @"bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK";
  }
  else
  {
    if (a4 != 1)
    {
      if (!a4)
      {
        [(CHActivitySharingNavigationController *)self _setActivitySharingIsSetup:1];
      }
      return;
    }
    if ([(CHActivitySharingNavigationController *)self phoneCloudKitAccountIsActive])
    {
      if ([(CHActivitySharingNavigationController *)self watchCloudKitAccountExists]) {
        return;
      }
      id v10 = +[LSApplicationWorkspace defaultWorkspace];
      CFStringRef v8 = @"bridge:root=GENERAL_LINK&path=LINK_WITH_ICLOUD_LINK";
    }
    else
    {
      id v10 = +[LSApplicationWorkspace defaultWorkspace];
      CFStringRef v8 = @"settings-navigation://com.apple.Settings.AppleAccount";
    }
  }
  v9 = +[NSURL URLWithString:v8];
  [v10 openSensitiveURL:v9 withOptions:0];
}

- (void)friendsSetupViewControllerDidCompleteSetup:(id)a3
{
  id v4 = a3;
  id v5 = [(CHActivitySharingNavigationController *)self friendsSetupViewController];

  if (v5 == v4)
  {
    [(CHActivitySharingNavigationController *)self _hideSetupControllerAnimated:1];
  }
}

- (BOOL)_activitySharingIsSetup
{
  id v2 = objc_alloc((Class)NSUserDefaults);
  id v3 = [v2 initWithSuiteName:kASDomain];
  unsigned int v4 = [v3 BOOLForKey:kASActivitySharingIsSetup];
  ASLoggingInitialize();
  id v5 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking defaults for fitness friends setup: %{BOOL}d", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (void)_setActivitySharingIsSetup:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc((Class)NSUserDefaults);
  CFStringRef v5 = (const __CFString *)kASDomain;
  id v6 = [v4 initWithSuiteName:kASDomain];
  ASLoggingInitialize();
  id v7 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting defaults for fitness friends setup: %{BOOL}d", (uint8_t *)v12, 8u);
  }
  CFStringRef v8 = +[NSNumber numberWithBool:v3];
  uint64_t v9 = kASActivitySharingIsSetup;
  [v6 setObject:v8 forKey:kASActivitySharingIsSetup];

  CFPreferencesAppSynchronize(v5);
  id v10 = objc_opt_new();
  id v11 = +[NSSet setWithObject:v9];
  [v10 synchronizeUserDefaultsDomain:v5 keys:v11];
}

- (void)_getAndHandlePhoneCloudKitAccountStatus
{
  ASLoggingInitialize();
  BOOL v3 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Asking for phone account", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  friendManager = self->_friendManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10012AE60;
  v5[3] = &unk_1008ACED0;
  objc_copyWeak(&v6, buf);
  v5[4] = self;
  [(CHFriendManager *)friendManager cloudKitAccountStatusWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)_getAndHandleWatchCloudKitAccountStatus
{
  unsigned int v3 = [(CHActivitySharingNavigationController *)self watchCloudKitAccountFetchInProgress];
  ASLoggingInitialize();
  id v4 = ASLogDefault;
  BOOL v5 = os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NSS fetch already in progress", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Asking NSS for watch accounts", (uint8_t *)buf, 2u);
    }
    [(CHActivitySharingNavigationController *)self setWatchCloudKitAccountFetchInProgress:1];
    objc_initWeak(buf, self);
    id v6 = [(CHActivitySharingNavigationController *)self nanoSystemSettingsManager];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    _DWORD v7[2] = sub_10012B314;
    v7[3] = &unk_1008AB900;
    objc_copyWeak(&v8, buf);
    [v6 getAccountsInfo:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (BOOL)_fitnessModeRequiresWatchSetup
{
  id v2 = +[_HKBehavior sharedBehavior];
  unint64_t v3 = (unint64_t)[v2 fitnessMode];

  return (v3 & 0xFFFFFFFFFFFFFFFELL) != 2;
}

- (void)_handleWatchStatusAndCloudKitAccountStatusChange
{
  unint64_t v3 = [(CHActivitySharingNavigationController *)self viewIfLoaded];
  id v4 = [v3 window];

  unsigned __int8 v5 = [(CHActivitySharingNavigationController *)self _cloudKitAccountsAreActive];
  self->_currentlyPairedWatchIsMinimumVersion = [(CHActivitySharingNavigationController *)self _checkPairedWatchIsMinimumVersion];
  ASLoggingInitialize();
  id v6 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109120;
    v17[1] = v4 != 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling account status change (view currently visible: %d)", (uint8_t *)v17, 8u);
  }
  if (!self->_currentlyPairedWatchIsMinimumVersion)
  {
    id v7 = [(CHActivitySharingNavigationController *)self friendListManager];
    if ([v7 hasAnyFriendsSetup])
    {
    }
    else
    {
      unsigned int v8 = [(CHActivitySharingNavigationController *)self _fitnessModeRequiresWatchSetup];

      if (v8)
      {
        ASLoggingInitialize();
        uint64_t v9 = ASLogDefault;
        if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Showing upgrade watch page.", (uint8_t *)v17, 2u);
        }
        BOOL v10 = v4 != 0;
        id v11 = self;
        uint64_t v12 = 2;
        goto LABEL_24;
      }
    }
  }
  unsigned int v13 = [(CHActivitySharingNavigationController *)self _isSetupViewControllerVisible];
  if ((v5 & 1) == 0)
  {
    if (v13)
    {
LABEL_17:
      if ([(CHActivitySharingNavigationController *)self _activitySharingIsSetup]) {
        return;
      }
      ASLoggingInitialize();
      unsigned int v15 = ASLogDefault;
      if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Showing introduction setup page.", (uint8_t *)v17, 2u);
      }
      id v11 = self;
      uint64_t v12 = 0;
      BOOL v10 = 0;
      goto LABEL_24;
    }
    ASLoggingInitialize();
    v16 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Showing iCloud signin page.", (uint8_t *)v17, 2u);
    }
    BOOL v10 = v4 != 0;
    id v11 = self;
    uint64_t v12 = 1;
LABEL_24:
    [(CHActivitySharingNavigationController *)v11 _showSetupControllerInPhase:v12 animated:v10];
    return;
  }
  if (!v13 || ![(CHActivitySharingNavigationController *)self _activitySharingIsSetup]) {
    goto LABEL_17;
  }
  ASLoggingInitialize();
  v14 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Hiding iCloud signin page.", (uint8_t *)v17, 2u);
  }
  [(CHActivitySharingNavigationController *)self _hideSetupControllerAnimated:v4 != 0];
}

- (void)_updateActivitySharingWatchPairingStatus
{
  BOOL v3 = [(CHActivitySharingNavigationController *)self _checkPairedWatchIsMinimumVersion];
  if (self->_currentlyPairedWatchIsMinimumVersion != v3)
  {
    self->_currentlyPairedWatchIsMinimumVersion = v3;
    [(CHActivitySharingNavigationController *)self _handleWatchStatusAndCloudKitAccountStatusChange];
  }
}

- (BOOL)_cloudKitAccountsAreActive
{
  ASLoggingInitialize();
  BOOL v3 = (void *)ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    v7[0] = 67109632;
    v7[1] = [(CHActivitySharingNavigationController *)self phoneCloudKitAccountIsActive];
    __int16 v8 = 1024;
    unsigned int v9 = [(CHActivitySharingNavigationController *)self watchCloudKitAccountExists];
    __int16 v10 = 1024;
    unsigned int v11 = [(CHActivitySharingNavigationController *)self watchCloudKitAccountAssumedToExist];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deriving account status from: [phone=%d], [watch=%d], [watch(assumed)=%d]", (uint8_t *)v7, 0x14u);
  }
  BOOL v5 = [(CHActivitySharingNavigationController *)self phoneCloudKitAccountIsActive];
  if (v5)
  {
    if ([(CHActivitySharingNavigationController *)self watchCloudKitAccountExists]
      || [(CHActivitySharingNavigationController *)self watchCloudKitAccountAssumedToExist])
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = ![(CHActivitySharingNavigationController *)self _fitnessModeRequiresWatchSetup];
    }
  }
  return v5;
}

- (BOOL)_cachedPhoneCloudKitAccountStatusIsActive
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"CHActivitySharingPhoneHasCloudKitAccountDefaultsKey"];

  return v3;
}

- (BOOL)_cachedWatchCloudKitAccountStatusIsActive
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"CHActivitySharingWatchHasCloudKitAccountDefaultsKey"];

  return v3;
}

- (BOOL)_cachedWatchCloudKitAccountAssumedToExist
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"CHActivitySharingWatchAssumedToHaveCloudKitAccountDefaultsKey"];

  id v4 = +[NSUserDefaults standardUserDefaults];
  BOOL v5 = [v4 objectForKey:@"CHActivitySharingWatchAssumedToHaveCloudKitAccountTimesampDefaultsKey"];

  id v6 = +[NSDate date];
  [v6 timeIntervalSinceDate:v5];
  if (v7 >= 600.0) {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (id)_ppt_scrollView
{
  return [(CHFriendListViewController *)self->_friendListViewController _ppt_scrollView];
}

- (CHFriendsSetupViewController)friendsSetupViewController
{
  return self->_friendsSetupViewController;
}

- (void)setFriendsSetupViewController:(id)a3
{
}

- (NSArray)navigationStackDisplacedBySetupController
{
  return self->_navigationStackDisplacedBySetupController;
}

- (void)setNavigationStackDisplacedBySetupController:(id)a3
{
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
}

- (NSSManager)nanoSystemSettingsManager
{
  return self->_nanoSystemSettingsManager;
}

- (void)setNanoSystemSettingsManager:(id)a3
{
}

- (BOOL)phoneCloudKitAccountIsActive
{
  return self->_phoneCloudKitAccountIsActive;
}

- (BOOL)watchCloudKitAccountExists
{
  return self->_watchCloudKitAccountExists;
}

- (BOOL)watchCloudKitAccountAssumedToExist
{
  return self->_watchCloudKitAccountAssumedToExist;
}

- (BOOL)watchCloudKitAccountFetchInProgress
{
  return self->_watchCloudKitAccountFetchInProgress;
}

- (void)setWatchCloudKitAccountFetchInProgress:(BOOL)a3
{
  self->_watchCloudKitAccountFetchInProgress = a3;
}

- (NSDate)lastPhoneCloudKitAccountFetchTimestamp
{
  return self->_lastPhoneCloudKitAccountFetchTimestamp;
}

- (void)setLastPhoneCloudKitAccountFetchTimestamp:(id)a3
{
}

- (NSDate)lastWatchCloudKitAccountFetchTimestamp
{
  return self->_lastWatchCloudKitAccountFetchTimestamp;
}

- (void)setLastWatchCloudKitAccountFetchTimestamp:(id)a3
{
}

- (ASFriendListSectionManager)friendListManager
{
  return self->_friendListManager;
}

- (void)setFriendListManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendListManager, 0);
  objc_storeStrong((id *)&self->_lastWatchCloudKitAccountFetchTimestamp, 0);
  objc_storeStrong((id *)&self->_lastPhoneCloudKitAccountFetchTimestamp, 0);
  objc_storeStrong((id *)&self->_nanoSystemSettingsManager, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_navigationStackDisplacedBySetupController, 0);
  objc_storeStrong((id *)&self->_friendsSetupViewController, 0);
  objc_storeStrong((id *)&self->_imageFactory, 0);
  objc_storeStrong((id *)&self->_friendManager, 0);

  objc_storeStrong((id *)&self->_friendListViewController, 0);
}

@end