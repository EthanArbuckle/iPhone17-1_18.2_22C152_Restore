@interface HOBaseController
+ (BOOL)isHomeManagerStatusReady:(id)a3;
- (BOOL)_areHMSettingsValidForHome:(id)a3;
- (BOOL)userHasValidHMSettings;
- (HOBaseController)initWithRootController:(id)a3;
- (HOBaseControllerDelegate)rootViewController;
- (HOInitialSetupStateController)initialSetupStateController;
- (NSMutableArray)triggersPendingExecutionConfirmation;
- (id)_overridingTabIdentifier;
- (id)_populateWallpaperForLoadingViewController:(id)a3;
- (id)currentlyPresentedViewController;
- (id)loadLoadingViewController;
- (id)onboardingPresentationFuture;
- (id)presentConfirmationAlertForExecutingTriggerWithIdentifier:(id)a3;
- (id)selectCurrentTab;
- (id)selectTabWithIdentifier:(id)a3;
- (id)stateController:(id)a3 dismissViewController:(id)a4 forState:(unint64_t)a5;
- (id)stateController:(id)a3 presentViewController:(id)a4 forState:(unint64_t)a5;
- (void)_checkAndRunFeatureOnboardingWithHomeSwitch:(BOOL)a3;
- (void)_presentLocationAlertForTriggerWithIdentifier:(id)a3;
- (void)_presentLocationTriggerAlertsIfNeeded;
- (void)_userDidConfirmExection:(BOOL)a3 ofTriggerWithIdentifier:(id)a4;
- (void)appOnboardingWillFinishForStateController:(id)a3;
- (void)executionEnvironmentWillEnterForeground:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3;
- (void)reloadInitialSetup;
- (void)setInitialSetupStateController:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setTriggersPendingExecutionConfirmation:(id)a3;
- (void)setUserHasValidHMSettings:(BOOL)a3;
- (void)settingsDidUpdate:(id)a3;
- (void)showOnboardingIfNeededForHomeInvitation:(id)a3;
@end

@implementation HOBaseController

+ (BOOL)isHomeManagerStatusReady:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 status] & 1) == 0
    && ([v3 status] & 0x10) == 0
    && ((unint64_t)[v3 status] & 0x20) == 0;

  return v4;
}

- (void)appOnboardingWillFinishForStateController:(id)a3
{
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finished App Onboarding, running Feature Onboarding checks", v5, 2u);
  }

  [(HOBaseController *)self _checkAndRunFeatureOnboardingWithHomeSwitch:0];
}

- (void)reloadInitialSetup
{
  id v3 = [(HOBaseController *)self initialSetupStateController];
  [v3 reloadState];

  BOOL v4 = [(HOBaseController *)self initialSetupStateController];
  v5 = [v4 onboardingCompleteFuture];
  unsigned __int8 v6 = [v5 isFinished];

  if ((v6 & 1) == 0)
  {
    objc_initWeak(&location, self);
    v7 = [(HOBaseController *)self initialSetupStateController];
    v8 = [v7 onboardingCompleteFuture];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003A64C;
    v10[3] = &unk_1000C3B40;
    objc_copyWeak(&v11, &location);
    id v9 = [v8 addSuccessBlock:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (HOInitialSetupStateController)initialSetupStateController
{
  return self->_initialSetupStateController;
}

- (BOOL)_areHMSettingsValidForHome:(id)a3
{
  id v3 = [a3 currentUser];
  BOOL v4 = +[HFHomeKitDispatcher sharedDispatcher];
  v5 = [v4 home];
  unsigned __int8 v6 = [v3 userSettingsForHome:v5];

  v7 = [v6 settings];
  v8 = [v7 rootGroup];
  if (v8)
  {
    id v9 = [v6 privateSettings];
    v10 = [v9 rootGroup];
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (HOBaseController)initWithRootController:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HOBaseController;
  v5 = [(HOBaseController *)&v16 init];
  if (v5)
  {
    unsigned __int8 v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"applicationWillEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];

    v7 = +[HFExecutionEnvironment sharedInstance];
    [v7 addObserver:v5];

    v8 = +[HFHomeKitDispatcher sharedDispatcher];
    [v8 addHomeObserver:v5];

    id v9 = +[HFHomeKitDispatcher sharedDispatcher];
    [v9 addHomeKitSettingsObserver:v5];

    v10 = +[HFHomeKitDispatcher sharedDispatcher];
    [v10 addHomeManagerObserver:v5];

    BOOL v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    triggersPendingExecutionConfirmation = v5->_triggersPendingExecutionConfirmation;
    v5->_triggersPendingExecutionConfirmation = v11;

    v13 = [[HOInitialSetupStateController alloc] initWithDelegate:v5];
    initialSetupStateController = v5->_initialSetupStateController;
    v5->_initialSetupStateController = v13;

    objc_storeWeak((id *)&v5->_rootViewController, v4);
  }

  return v5;
}

- (void)_checkAndRunFeatureOnboardingWithHomeSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v6 = +[HFHomeKitDispatcher sharedDispatcher];
  v7 = [v6 home];

  v8 = +[HFHomeKitDispatcher sharedDispatcher];
  id v9 = [v8 homeManager];
  unsigned int v10 = +[HOBaseController isHomeManagerStatusReady:v9];

  [(HOBaseController *)self setUserHasValidHMSettings:[(HOBaseController *)self _areHMSettingsValidForHome:v7]];
  BOOL v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = NSStringFromSelector(a2);
    v13 = [v7 name];
    if (v10) {
      CFStringRef v14 = @"IS";
    }
    else {
      CFStringRef v14 = @"is NOT";
    }
    unsigned int v15 = [(HOBaseController *)self userHasValidHMSettings];
    *(_DWORD *)buf = 138413314;
    CFStringRef v16 = @"DOES NOT have";
    v28 = self;
    __int16 v29 = 2112;
    if (v15) {
      CFStringRef v16 = @"has";
    }
    v30 = v12;
    __int16 v31 = 2112;
    v32 = v13;
    __int16 v33 = 2112;
    CFStringRef v34 = v14;
    __int16 v35 = 2112;
    CFStringRef v36 = v16;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ for %@, Home Manager %@ ready, user %@ valid settings", buf, 0x34u);
  }
  unsigned int v17 = [(HOBaseController *)self userHasValidHMSettings] & v10;
  v18 = HFLogForCategory();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17 == 1)
  {
    if (v19)
    {
      v20 = NSStringFromSelector(a2);
      v21 = +[NSNumber numberWithBool:v3];
      *(_DWORD *)buf = 138412802;
      v28 = self;
      __int16 v29 = 2112;
      v30 = v20;
      __int16 v31 = 2112;
      v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ Running Feature Onboarding with Switch Homes screen: %@", buf, 0x20u);
    }
    v18 = [(HOBaseController *)self rootViewController];
    +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3, OnboardingDisplayOption_ShowSwitchHomeScreen);
    v22 = (HOBaseController *)objc_claimAutoreleasedReturnValue();
    v26 = v22;
    v23 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v24 = +[HUHomeFeatureOnboardingUtilities home:v7 onboardAllFeaturesFromPresentingViewController:v18 usageOptions:v23];

    goto LABEL_14;
  }
  if (v19)
  {
    v22 = +[NSNumber numberWithBool:v3];
    *(_DWORD *)buf = 138412290;
    v28 = v22;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Did not run Feature Onboarding with Switch Homes screen: %@", buf, 0xCu);
LABEL_14:
  }
}

- (BOOL)userHasValidHMSettings
{
  return self->_userHasValidHMSettings;
}

- (void)setUserHasValidHMSettings:(BOOL)a3
{
  self->_userHasValidHMSettings = a3;
}

- (id)loadLoadingViewController
{
  BOOL v3 = objc_alloc_init(HOMainLoadingViewController);
  id v4 = [(HOBaseController *)self _populateWallpaperForLoadingViewController:v3];

  return v3;
}

- (id)_populateWallpaperForLoadingViewController:(id)a3
{
  id v3 = a3;
  id v4 = +[HFWallpaperManager sharedInstance];
  v5 = [v4 defaultWallpaperForCollectionType:0];

  unsigned __int8 v6 = [v3 wallpaperView];

  [v6 populateWallpaper:v5 withAnimation:1 onlyIfNeeded:1];
  v7 = +[NAFuture futureWithNoResult];

  return v7;
}

- (id)presentConfirmationAlertForExecutingTriggerWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HOBaseController *)self triggersPendingExecutionConfirmation];
  [v5 addObject:v4];

  [(HOBaseController *)self _presentLocationTriggerAlertsIfNeeded];

  return +[NAFuture futureWithNoResult];
}

- (void)_presentLocationTriggerAlertsIfNeeded
{
  id v3 = [(HOBaseController *)self triggersPendingExecutionConfirmation];
  id v4 = [v3 count];

  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = [(HOBaseController *)self triggersPendingExecutionConfirmation];
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [(HOBaseController *)self _presentLocationAlertForTriggerWithIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    unsigned int v10 = [(HOBaseController *)self triggersPendingExecutionConfirmation];
    [v10 removeAllObjects];
  }
}

- (void)_presentLocationAlertForTriggerWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[HFHomeKitDispatcher sharedDispatcher];
  id v6 = [v5 home];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003A9AC;
  v8[3] = &unk_1000C3B90;
  id v9 = v4;
  unsigned int v10 = self;
  id v7 = v4;
  [v6 fetchTriggerNameForTriggerIdentifier:v7 completionHandler:v8];
}

- (void)_userDidConfirmExection:(BOOL)a3 ofTriggerWithIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = +[HFHomeKitDispatcher sharedDispatcher];
  id v7 = [v6 home];
  uint64_t v8 = [v5 UUIDString];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003AF70;
  v10[3] = &unk_1000C1F30;
  id v11 = v5;
  id v9 = v5;
  [v7 userDidConfirmExecution:v4 ofTriggerWithIdentifier:v8 completionHandler:v10];
}

- (void)showOnboardingIfNeededForHomeInvitation:(id)a3
{
  id v4 = a3;
  id v5 = [(HOBaseController *)self initialSetupStateController];
  [v5 showOnboardingIfNeededForHomeInvitation:v4];
}

- (id)onboardingPresentationFuture
{
  v2 = [(HOBaseController *)self initialSetupStateController];
  id v3 = [v2 onboardingCompleteFuture];

  return v3;
}

- (id)stateController:(id)a3 presentViewController:(id)a4 forState:(unint64_t)a5
{
  id v6 = a4;
  objc_opt_class();
  id v7 = [(HOBaseController *)self rootViewController];
  uint64_t v8 = [v7 currentViewController];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = [(HOBaseController *)self _populateWallpaperForLoadingViewController:v10];
    long long v12 = [(HOBaseController *)self rootViewController];
    unsigned int v13 = [(id)objc_opt_class() instancesRespondToSelector:"didLoadLoadingViewController"];

    if (v13)
    {
      long long v14 = [(HOBaseController *)self rootViewController];
      [v14 didLoadLoadingViewController];
    }
  }
  unsigned int v15 = +[NAFuture futureWithNoResult];
  CFStringRef v16 = [(HOBaseController *)self rootViewController];
  unsigned int v17 = [v16 presentedViewController];

  if (v17)
  {
    v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v19 = [(HOBaseController *)self rootViewController];
      v20 = [v19 presentedViewController];
      *(_DWORD *)buf = 138412546;
      __int16 v29 = v20;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Dismissing unexpected presented VC %@ in preparation of presenting initial setup VC %@", buf, 0x16u);
    }
    v21 = [(HOBaseController *)self rootViewController];
    uint64_t v22 = [v21 hu_dismissViewControllerAnimated:1];

    unsigned int v15 = (void *)v22;
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10003B31C;
  v26[3] = &unk_1000C3BB8;
  v26[4] = self;
  id v27 = v6;
  id v23 = v6;
  id v24 = [v15 flatMap:v26];

  return v24;
}

- (id)stateController:(id)a3 dismissViewController:(id)a4 forState:(unint64_t)a5
{
  id v5 = [(HOBaseController *)self rootViewController];
  id v6 = [v5 hu_dismissViewControllerAnimated:1];

  return v6;
}

- (id)currentlyPresentedViewController
{
  v2 = [(HOBaseController *)self rootViewController];
  id v3 = [v2 presentedViewController];

  return v3;
}

- (void)executionEnvironmentWillEnterForeground:(id)a3
{
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "App entering foreground, running Feature Onboarding checks", v5, 2u);
  }

  [(HOBaseController *)self _checkAndRunFeatureOnboardingWithHomeSwitch:0];
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v5 = a4;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Accessory added (%@), running Feature Onboarding checks", (uint8_t *)&v7, 0xCu);
  }

  [(HOBaseController *)self _checkAndRunFeatureOnboardingWithHomeSwitch:0];
}

- (void)settingsDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  id v6 = [v5 home];

  if ([(HOBaseController *)self userHasValidHMSettings]
    || ![(HOBaseController *)self _areHMSettingsValidForHome:v6])
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000836EC(self, (uint64_t)v6, v8);
    }
  }
  else
  {
    int v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User transitioned from no settings to valid settings (%@), now running Feature Onboarding checks", (uint8_t *)&v9, 0xCu);
    }

    [(HOBaseController *)self setUserHasValidHMSettings:1];
    [(HOBaseController *)self _checkAndRunFeatureOnboardingWithHomeSwitch:0];
  }
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = [(HOBaseController *)self userHasValidHMSettings];
  [(HOBaseController *)self setUserHasValidHMSettings:[(HOBaseController *)self _areHMSettingsValidForHome:v9]];
  id v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = NSStringFromSelector(a2);
    unsigned int v13 = [v9 name];
    *(_DWORD *)buf = 138413314;
    v28 = self;
    __int16 v29 = 2112;
    __int16 v30 = v12;
    __int16 v31 = 2112;
    v32 = v13;
    __int16 v33 = 1024;
    unsigned int v34 = v10;
    __int16 v35 = 1024;
    unsigned int v36 = [(HOBaseController *)self userHasValidHMSettings];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Changing homes to %@. Settings validity was %{BOOL}d, now is %{BOOL}d", buf, 0x2Cu);
  }
  if (v9)
  {
    long long v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = [v9 name];
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Switched homes, running Feature Onboarding checks for %@", buf, 0xCu);
    }
    CFStringRef v16 = [(HOBaseController *)self rootViewController];
    unsigned int v17 = [(id)objc_opt_class() instancesRespondToSelector:"didLoadHome:"];

    if (v17)
    {
      v18 = [(HOBaseController *)self rootViewController];
      [v18 didLoadHome:v9];
    }
    [(HOBaseController *)self _checkAndRunFeatureOnboardingWithHomeSwitch:1];
  }
  else
  {
    BOOL v19 = objc_alloc_init(HOMainLoadingViewController);
    v20 = [(HOBaseController *)self _populateWallpaperForLoadingViewController:v19];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10003B970;
    v23[3] = &unk_1000C3BE0;
    id v24 = v8;
    uint64_t v25 = self;
    v26 = v19;
    v21 = v19;
    id v22 = [v20 addSuccessBlock:v23];
  }
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v5 = a4;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "HomeKit Removed Home [%@]", (uint8_t *)&v25, 0xCu);
  }

  int v7 = [(HOBaseController *)self rootViewController];
  id v8 = [v7 presentedViewController];

  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [v8 childViewControllers];
    int v25 = 138412546;
    id v26 = v8;
    __int16 v27 = 2112;
    v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "presentedViewController:[%@] with childViewControllers:[%@]", (uint8_t *)&v25, 0x16u);
  }
  if (v8)
  {
    id v11 = [v8 childViewControllers];
    id v12 = [v11 count];

    if (v12)
    {
      unsigned int v13 = [v8 childViewControllers];
      long long v14 = [v13 firstObject];
      unsigned int v15 = &OBJC_PROTOCOL___HUConfigurationViewControllerFlow;
      if ([v14 conformsToProtocol:v15]) {
        CFStringRef v16 = v14;
      }
      else {
        CFStringRef v16 = 0;
      }
      id v17 = v16;

      if (objc_opt_respondsToSelector())
      {
        id v18 = [v17 onboardingFlowClass];
        BOOL v19 = HFLogForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 138412290;
          id v26 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "onboardingFlow = [%@]", (uint8_t *)&v25, 0xCu);
        }

        if (v18)
        {
          v20 = +[HFHomeKitDispatcher sharedDispatcher];
          v21 = [v20 home];
          unsigned int v22 = [v5 isEqual:v21];

          if (v22)
          {
            id v23 = HFLogForCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              int v25 = 138412290;
              id v26 = v17;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Now dismissing presented View Controller = [%@]", (uint8_t *)&v25, 0xCu);
            }

            id v24 = [(HOBaseController *)self rootViewController];
            [v24 dismissViewControllerAnimated:1 completion:0];
          }
        }
      }
    }
  }
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  unsigned int v6 = +[HOBaseController isHomeManagerStatusReady:a3];
  int v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMHomeManagerStatusToString();
    CFStringRef v9 = @"so not yet running";
    int v10 = 138412802;
    id v11 = v8;
    if (v6) {
      CFStringRef v9 = @"running";
    }
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    __int16 v14 = 2112;
    CFStringRef v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "HMHomeManager status updated to %@ (%lu), %@ Feature Onboarding checks...", (uint8_t *)&v10, 0x20u);
  }
  if (v6) {
    [(HOBaseController *)self _checkAndRunFeatureOnboardingWithHomeSwitch:0];
  }
}

- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3
{
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  id v5 = [v4 home];

  if (v5)
  {
    unsigned int v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Refresh home view after initial databse load has finished", v10, 2u);
    }

    int v7 = [(HOBaseController *)self rootViewController];
    unsigned int v8 = [(id)objc_opt_class() instancesRespondToSelector:"didLoadHome:"];

    if (v8)
    {
      CFStringRef v9 = [(HOBaseController *)self rootViewController];
      [v9 didLoadHome:v5];
    }
    [(HOBaseController *)self _checkAndRunFeatureOnboardingWithHomeSwitch:1];
  }
}

- (id)selectTabWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HOBaseController *)self _overridingTabIdentifier];
  unsigned int v6 = v5;
  if (v5 && ([v5 isEqualToString:v4] & 1) == 0)
  {
    int v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      unint64_t v13 = "-[HOBaseController selectTabWithIdentifier:]";
      __int16 v14 = 2112;
      CFStringRef v15 = v6;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) Using '%@' as an override instead of '%@' for the tab identifier", (uint8_t *)&v12, 0x20u);
    }

    id v8 = v6;
    id v4 = v8;
  }
  CFStringRef v9 = [(HOBaseController *)self rootViewController];
  int v10 = [v9 selectTabWithIdentifier:v4];

  return v10;
}

- (id)selectCurrentTab
{
  id v3 = +[HFStateRestorationSettings sharedInstance];
  uint64_t v4 = [v3 selectedHomeAppTabIdentifier];
  id v5 = (void *)v4;
  unsigned int v6 = (void *)HFHomeAppTabIdentifierHome;
  if (v4) {
    unsigned int v6 = (void *)v4;
  }
  id v7 = v6;

  id v8 = [(HOBaseController *)self selectTabWithIdentifier:v7];

  return v8;
}

- (id)_overridingTabIdentifier
{
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  id v3 = [v2 home];

  if (objc_msgSend(v3, "hf_currentUserIsRestrictedGuest")) {
    id v4 = HFHomeAppTabIdentifierHome;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)setInitialSetupStateController:(id)a3
{
}

- (NSMutableArray)triggersPendingExecutionConfirmation
{
  return self->_triggersPendingExecutionConfirmation;
}

- (void)setTriggersPendingExecutionConfirmation:(id)a3
{
}

- (HOBaseControllerDelegate)rootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootViewController);

  return (HOBaseControllerDelegate *)WeakRetained;
}

- (void)setRootViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rootViewController);
  objc_storeStrong((id *)&self->_triggersPendingExecutionConfirmation, 0);

  objc_storeStrong((id *)&self->_initialSetupStateController, 0);
}

@end