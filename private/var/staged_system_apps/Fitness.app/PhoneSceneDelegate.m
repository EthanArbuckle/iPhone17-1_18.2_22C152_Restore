@interface PhoneSceneDelegate
- (AAUIAchievementsDataProvider)achievementsDataProvider;
- (AAUIBadgeImageFactory)badgeImageFactory;
- (ACHAchievementLocalizationProvider)achievementLocalizationProvider;
- (ASActivitySharingClient)activitySharingClient;
- (ASFriendListSectionManager)friendListManager;
- (BOOL)activityHasBeenSetup;
- (BOOL)aggregatorShouldAllowEngagementBadging:(id)a3;
- (BOOL)hasCurrentWorkouts;
- (BOOL)isMirroringSessionActive;
- (BOOL)navigateToSeymourTab;
- (BOOL)presentingOnboarding;
- (CHActivityHistoryNavigationController)activityTileNavController;
- (CHFitnessAppBadgeAggregator)appBadgeAggregator;
- (CHFitnessAppContext)fitnessAppContext;
- (CHFriendManager)friendManager;
- (CHHistoryDataProvider)historyDataProvider;
- (CHLoadingView)loadingView;
- (CHNavigationTracker)navigationTracker;
- (CHNavigator)deeplinkNavigator;
- (CHOnboardingCoordinator)onboardingCoordinator;
- (CHRootViewController)rootViewController;
- (CHTabBarController)tabBarController;
- (CHWorkoutDataProvider)workoutsDataProvider;
- (CHWorkoutFormattingManager)workoutFormattingManager;
- (FIPauseRingsCoordinator)pauseRingsCoordinator;
- (FIUIFormattingManager)fitnessUIFormattingManager;
- (FIUIModel)model;
- (FIUIPregnancyStateProvider)pregnancyStateProvider;
- (HKHealthStore)healthStore;
- (NLTVConnectionManager)tvConnectionManager;
- (SMUPasswordController)passwordController;
- (UIAlertController)browsingConsentAlertController;
- (UINavigationController)setupNavigationController;
- (UISceneConnectionOptions)connectionOptions;
- (UIViewController)activitySharingViewController;
- (UIViewController)seymourNavController;
- (UIWindow)window;
- (UIWindowScene)windowScene;
- (WOMirrorViewController)mirrorViewController;
- (_HKWheelchairUseCharacteristicCache)wheelchairUseCache;
- (_TtC10FitnessApp17ActivityDateCache)activityDateCache;
- (_TtC10FitnessApp19BalanceDataProvider)balanceDataProvider;
- (_TtC10FitnessApp20ActivityDataProvider)activityDataProvider;
- (_TtC10FitnessApp23FriendsSetupCoordinator)friendsSetupCoordinator;
- (_TtC10FitnessApp25TrendsAvailabilityManager)trendsAvailabilityManager;
- (_TtC10FitnessApp26ActivityTileViewController)activityTileViewController;
- (_TtC10FitnessApp26SeymourAvailabilityManager)seymourAvailabilityManager;
- (_TtC10FitnessApp31ActivityDashboardViewController)activityDashboardViewController;
- (_TtC10FitnessApp32SeymourDiscoverySheetCoordinator)seymourDiscoverySheetCoordinator;
- (_TtC10FitnessApp38SeymourNotificationResponseCoordinator)seymourNotificationResponseCoordinator;
- (id)_createRootViewController;
- (id)_fitnessDataCollectionEnabledPreference;
- (id)_parseGoalRecommendation:(id)a3;
- (id)browsingConsentAlertCompletion;
- (id)passwordEnteredHandler;
- (id)summaryDeeplinkViewController;
- (int)fitnessWeekRedefinedChangeToken;
- (int)standalonePhoneFitnessModeChangeToken;
- (int64_t)_parseFitnessCoachingNotificationType:(id)a3;
- (void)_clearWeeklyGoalDisplayContext;
- (void)_clearWindowSceneAndOptions;
- (void)_configureWorkoutHandler;
- (void)_createOrbActions;
- (void)_handleActivityShareShortcut;
- (void)_handleActivitySharingURL:(id)a3;
- (void)_handleFriendsShortcut;
- (void)_handleHistoryShortcut;
- (void)_handleSettingsShortcut;
- (void)_handleShortcutItem:(id)a3 didJustLaunch:(BOOL)a4;
- (void)_handleTodayShortcut;
- (void)_handleTrendsShortcut;
- (void)_handleWorkoutConfigurationURL:(id)a3;
- (void)_ppt_showSharingTab;
- (void)_presentExerciseAndStandGoalsSetupOnboarding;
- (void)_presentMoveGoalSetupOnboarding;
- (void)_presentOnboardingNavigationController:(id)a3;
- (void)_presentWelcomeViewsSetupOnboarding:(BOOL)a3;
- (void)_presentWhatsNewViewSetupOnboarding;
- (void)_refreshBadgeCounts;
- (void)_resetToViewController:(id)a3;
- (void)_setActivityTabBarImage;
- (void)_setBadgeCount:(unint64_t)a3 forTabBarItem:(id)a4;
- (void)_setFitnessDataCollectionEnabled:(BOOL)a3;
- (void)_setSelectedViewController:(id)a3;
- (void)_setupActivityAppAndLoadData;
- (void)_setupDeeplinks;
- (void)_setupOnboarding;
- (void)_setupTabBarViewControllersAndOrbActions;
- (void)_seymourAvailabilityStatusDidChange:(id)a3;
- (void)_showCoachingDataCollectionMessageIfNeeded;
- (void)_trendsAvailabilityStatusDidChange:(id)a3;
- (void)_updateSeymourNavigationController;
- (void)aggregator:(id)a3 didUpdateActivitySharingBadgeCount:(int64_t)a4;
- (void)aggregator:(id)a3 didUpdateEngagmentBadgeCount:(int64_t)a4;
- (void)cleanupGuestAuthentication;
- (void)dealloc;
- (void)dismissMirrorViewController;
- (void)displayWorkoutNotification:(id)a3;
- (void)endDiscovery;
- (void)handleFitnessCoachingNotificationResponse:(id)a3;
- (void)memoryWarningReceived:(id)a3;
- (void)onboardingCoordinatorPhaseDidChangeTo:(int64_t)a3;
- (void)openURLContext:(id)a3;
- (void)presentBrowsingConsentAlertWithCompletion:(id)a3;
- (void)presentModelOnSummaryTabWithViewController:(id)a3;
- (void)promptForPasscodeWithLength:(int64_t)a3 completion:(id)a4;
- (void)ringCelebrationDidBegin;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setAchievementLocalizationProvider:(id)a3;
- (void)setAchievementsDataProvider:(id)a3;
- (void)setActivityDashboardViewController:(id)a3;
- (void)setActivityDataProvider:(id)a3;
- (void)setActivityDateCache:(id)a3;
- (void)setActivitySharingClient:(id)a3;
- (void)setActivitySharingViewController:(id)a3;
- (void)setActivityTileNavController:(id)a3;
- (void)setActivityTileViewController:(id)a3;
- (void)setAppBadgeAggregator:(id)a3;
- (void)setBadgeImageFactory:(id)a3;
- (void)setBalanceDataProvider:(id)a3;
- (void)setBrowsingConsentAlertCompletion:(id)a3;
- (void)setBrowsingConsentAlertController:(id)a3;
- (void)setConnectionOptions:(id)a3;
- (void)setDeeplinkNavigator:(id)a3;
- (void)setFitnessAppContext:(id)a3;
- (void)setFitnessUIFormattingManager:(id)a3;
- (void)setFitnessWeekRedefinedChangeToken:(int)a3;
- (void)setFriendListManager:(id)a3;
- (void)setFriendManager:(id)a3;
- (void)setFriendsSetupCoordinator:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setHistoryDataProvider:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setMirrorViewController:(id)a3;
- (void)setModel:(id)a3;
- (void)setNavigationTracker:(id)a3;
- (void)setOnboardingCoordinator:(id)a3;
- (void)setPasswordController:(id)a3;
- (void)setPasswordEnteredHandler:(id)a3;
- (void)setPauseRingsCoordinator:(id)a3;
- (void)setPregnancyStateProvider:(id)a3;
- (void)setPresentingOnboarding:(BOOL)a3;
- (void)setRootViewController:(id)a3;
- (void)setSetupNavigationController:(id)a3;
- (void)setSeymourAvailabilityManager:(id)a3;
- (void)setSeymourDiscoverySheetCoordinator:(id)a3;
- (void)setSeymourNavController:(id)a3;
- (void)setSeymourNotificationResponseCoordinator:(id)a3;
- (void)setStandalonePhoneFitnessModeChangeToken:(int)a3;
- (void)setTabBarController:(id)a3;
- (void)setTrendsAvailabilityManager:(id)a3;
- (void)setWheelchairUseCache:(id)a3;
- (void)setWindow:(id)a3;
- (void)setWindowScene:(id)a3;
- (void)setWorkoutFormattingManager:(id)a3;
- (void)setWorkoutsDataProvider:(id)a3;
- (void)trophyCaseDidBeginCelebration:(id)a3;
- (void)updateTVDiscovery;
- (void)updateWorkoutState:(int64_t)a3 shouldShowTimeout:(BOOL)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation PhoneSceneDelegate

- (void)aggregator:(id)a3 didUpdateActivitySharingBadgeCount:(int64_t)a4
{
  id v7 = [(PhoneSceneDelegate *)self activitySharingViewController];
  v6 = [v7 tabBarItem];
  [(PhoneSceneDelegate *)self _setBadgeCount:a4 forTabBarItem:v6];
}

- (void)aggregator:(id)a3 didUpdateEngagmentBadgeCount:(int64_t)a4
{
  id v7 = [(PhoneSceneDelegate *)self seymourNavController];
  v6 = [v7 tabBarItem];
  [(PhoneSceneDelegate *)self _setBadgeCount:a4 forTabBarItem:v6];
}

- (void)_refreshBadgeCounts
{
  id v2 = [(PhoneSceneDelegate *)self appBadgeAggregator];
  [v2 triggerFetch];
}

- (void)_clearWindowSceneAndOptions
{
  _HKInitializeLogging();
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[seymour] _clearWindowSceneAndOptions", v4, 2u);
  }
  [(PhoneSceneDelegate *)self setConnectionOptions:0];
  [(PhoneSceneDelegate *)self setWindowScene:0];
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = [(PhoneSceneDelegate *)self activityDashboardViewController];
  v3 = [v4 summaryCoordinator];
  [v3 logCardConfigurationAnalytics];
}

- (void)_setBadgeCount:(unint64_t)a3 forTabBarItem:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    v6 = +[NSNumber numberWithUnsignedInteger:a3];
    id v7 = +[FIUIFormattingManager stringWithNumber:v6 decimalPrecision:1];
    [v5 setBadgeValue:v7];

    v8 = +[ARUIMetricColors keyColors];
    v9 = [v8 nonGradientTextColor];
    [v5 setBadgeColor:v9];

    NSAttributedStringKey v12 = NSForegroundColorAttributeName;
    id v10 = +[UIColor blackColor];
    id v13 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v5 setBadgeTextAttributes:v11 forState:0];
  }
  else
  {
    id v10 = a4;
    [v10 setBadgeValue:0];
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = [(CHTabBarController *)self->_tabBarController selectedViewController];
  seymourNavController = self->_seymourNavController;

  if (v4 == seymourNavController) {
    [(CHFitnessAppContext *)self->_fitnessAppContext seymourTabSelectedWithSelection:0];
  }
  [(SeymourAvailabilityManager *)self->_seymourAvailabilityManager updateAvailability];
  [(PhoneSceneDelegate *)self _refreshBadgeCounts];
  [(ActivityDataProvider *)self->_activityDataProvider updateWidgets];
  [(SeymourDiscoverySheetCoordinator *)self->_seymourDiscoverySheetCoordinator activate];

  [(PhoneSceneDelegate *)self updateTVDiscovery];
}

- (void)_configureWorkoutHandler
{
  objc_initWeak(&location, self);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  v6 = sub_1000DDDFC;
  id v7 = &unk_1008AB8D8;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CHWorkoutDataProvider addUpdateHandler:](self->_workoutsDataProvider, "addUpdateHandler:", v3, v4, v5, v6, v7);
  [(CHWorkoutDataProvider *)self->_workoutsDataProvider addAnimatedUpdateHandler:v3];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_setActivityTabBarImage
{
  v3 = +[_HKBehavior sharedBehavior];
  unsigned int v4 = [v3 isStandalonePhoneFitnessMode];
  uint64_t v5 = &off_1008AE418;
  if (!v4) {
    uint64_t v5 = &off_1008AE410;
  }
  id v8 = +[UIImage _systemImageNamed:*v5];

  v6 = [(PhoneSceneDelegate *)self activityTileNavController];
  id v7 = [v6 tabBarItem];
  [v7 setImage:v8];
}

- (void)_updateSeymourNavigationController
{
  v3 = [(PhoneSceneDelegate *)self seymourAvailabilityManager];
  unsigned int v4 = [v3 available];

  if (v4)
  {
    _HKInitializeLogging();
    uint64_t v5 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[seymour] Updating navigation controller", buf, 2u);
    }
    v6 = [(PhoneSceneDelegate *)self fitnessAppContext];
    id v7 = [v6 seymourNavigationController];
    [(PhoneSceneDelegate *)self setSeymourNavController:v7];

    uint64_t v8 = [(PhoneSceneDelegate *)self connectionOptions];
    if (v8)
    {
      v9 = (void *)v8;
      id v10 = [(PhoneSceneDelegate *)self windowScene];

      if (v10)
      {
        _HKInitializeLogging();
        v11 = HKLogActivity;
        if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[seymour] Handling Window Scene", v26, 2u);
        }
        NSAttributedStringKey v12 = [(PhoneSceneDelegate *)self fitnessAppContext];
        id v13 = [(PhoneSceneDelegate *)self windowScene];
        v14 = [(PhoneSceneDelegate *)self connectionOptions];
        [v12 handleWindowScene:v13 with:v14];

        [(PhoneSceneDelegate *)self _clearWindowSceneAndOptions];
      }
    }
  }
  else
  {
    v15 = [(PhoneSceneDelegate *)self seymourAvailabilityManager];
    if (([v15 unavailable] & 1) != 0
      && ([(PhoneSceneDelegate *)self connectionOptions],
          (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v17 = (void *)v16;
      v18 = [(PhoneSceneDelegate *)self windowScene];

      if (v18)
      {
        _HKInitializeLogging();
        v19 = HKLogActivity;
        if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[seymour] Handling Window Scene while unavailable", v25, 2u);
        }
        v20 = [(PhoneSceneDelegate *)self fitnessAppContext];
        v21 = [(PhoneSceneDelegate *)self windowScene];
        v22 = [(PhoneSceneDelegate *)self connectionOptions];
        [v20 handleWindowScene:v21 with:v22];

        [(PhoneSceneDelegate *)self _clearWindowSceneAndOptions];
      }
    }
    else
    {
    }
    _HKInitializeLogging();
    v23 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[seymour] Resetting navigation controller", v24, 2u);
    }
    [(PhoneSceneDelegate *)self setSeymourNavController:0];
  }
}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (CHFitnessAppContext)fitnessAppContext
{
  return self->_fitnessAppContext;
}

- (UISceneConnectionOptions)connectionOptions
{
  return self->_connectionOptions;
}

- (void)updateTVDiscovery
{
  _HKInitializeLogging();
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating TV Discovery", v8, 2u);
  }
  unsigned int v4 = +[UIApplication sharedApplication];
  BOOL v5 = [v4 applicationState] == 0;

  v6 = [(PhoneSceneDelegate *)self tvConnectionManager];
  [v6 setIsDiscoveryAllowed:v5];

  id v7 = [(PhoneSceneDelegate *)self tvConnectionManager];
  [v7 updateDiscoveryStateIfNeeded];
}

- (NLTVConnectionManager)tvConnectionManager
{
  if (!self->_tvConnectionManager)
  {
    v3 = +[UNUserNotificationCenter currentNotificationCenter];
    unsigned int v4 = [[NLTVConnectionManager alloc] presenter:self userNotificationCenter:v3];
    tvConnectionManager = self->_tvConnectionManager;
    self->_tvConnectionManager = v4;
  }
  _HKInitializeLogging();
  v6 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Initializing TVConnectionManager!", v9, 2u);
  }
  id v7 = self->_tvConnectionManager;

  return v7;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([(PhoneSceneDelegate *)self isMirroringSessionActive])
  {
    _HKInitializeLogging();
    v9 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Intercepting session because a Mirrored workout is running", buf, 2u);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v7;
      [(PhoneSceneDelegate *)self setConnectionOptions:v8];
      [(PhoneSceneDelegate *)self setWindowScene:v10];
      id v11 = [objc_alloc((Class)UIWindow) initWithWindowScene:v10];
      [(PhoneSceneDelegate *)self setWindow:v11];

      NSAttributedStringKey v12 = [(PhoneSceneDelegate *)self window];
      id v13 = +[UIColor blackColor];
      [v12 setBackgroundColor:v13];

      v14 = [(PhoneSceneDelegate *)self window];
      [v14 _accessibilitySetInterfaceStyleIntent:2];

      v15 = +[UIApplication sharedApplication];
      uint64_t v16 = [v15 delegate];
      v17 = [v16 healthStore];
      [(PhoneSceneDelegate *)self setHealthStore:v17];

      v18 = +[UIApplication sharedApplication];
      v19 = [v18 delegate];
      v20 = [v19 historyDataProvider];
      [(PhoneSceneDelegate *)self setHistoryDataProvider:v20];

      id v21 = [objc_alloc((Class)_HKWheelchairUseCharacteristicCache) initWithHealthStore:self->_healthStore];
      [(PhoneSceneDelegate *)self setWheelchairUseCache:v21];

      v22 = +[UIApplication sharedApplication];
      v23 = [v22 delegate];
      v24 = [v23 fitnessUIFormattingManager];
      [(PhoneSceneDelegate *)self setFitnessUIFormattingManager:v24];

      v25 = +[UIApplication sharedApplication];
      v26 = [v25 delegate];
      v27 = [v26 workoutFormattingManager];
      [(PhoneSceneDelegate *)self setWorkoutFormattingManager:v27];

      v28 = +[UIApplication sharedApplication];
      v29 = [v28 delegate];
      v30 = [v29 pauseRingsCoordinator];
      [(PhoneSceneDelegate *)self setPauseRingsCoordinator:v30];

      id v31 = [objc_alloc((Class)FIUIPregnancyStateProvider) initWithHealthStore:self->_healthStore];
      [(PhoneSceneDelegate *)self setPregnancyStateProvider:v31];

      v32 = objc_alloc_init(_TtC10FitnessApp26SeymourAvailabilityManager);
      [(PhoneSceneDelegate *)self setSeymourAvailabilityManager:v32];

      v33 = +[NSNotificationCenter defaultCenter];
      v34 = +[SeymourAvailabilityManager seymourAvailabilityDidChangeNotification];
      [v33 addObserver:self selector:"_seymourAvailabilityStatusDidChange:" name:v34 object:0];

      v35 = +[MCProfileConnection sharedConnection];
      [v35 checkInWithCompletion:0];

      v36 = [CHOnboardingCoordinator alloc];
      v37 = [(PhoneSceneDelegate *)self healthStore];
      v38 = [(CHOnboardingCoordinator *)v36 initWithHealthStore:v37];
      [(PhoneSceneDelegate *)self setOnboardingCoordinator:v38];

      v39 = [(PhoneSceneDelegate *)self onboardingCoordinator];
      [v39 setDelegate:self];

      v40 = +[AVAudioSession sharedInstance];
      id v60 = 0;
      [v40 setCategory:AVAudioSessionCategoryAmbient error:&v60];
      id v41 = v60;

      if (v41)
      {
        _HKInitializeLogging();
        v42 = HKLogActivity;
        if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v63 = v41;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate failed to set AVAudioSession category to ambient %@", buf, 0xCu);
        }
      }
      if ([(PhoneSceneDelegate *)self activityHasBeenSetup])
      {
        [(PhoneSceneDelegate *)self _setupActivityAppAndLoadData];
        v43 = [v8 shortcutItem];

        if (v43)
        {
          v44 = [v8 shortcutItem];
          [(PhoneSceneDelegate *)self _handleShortcutItem:v44 didJustLaunch:1];
        }
        else
        {
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          v45 = [v8 URLContexts];
          id v46 = [v45 countByEnumeratingWithState:&v56 objects:v61 count:16];
          if (v46)
          {
            id v47 = v46;
            uint64_t v48 = *(void *)v57;
            do
            {
              v49 = 0;
              do
              {
                if (*(void *)v57 != v48) {
                  objc_enumerationMutation(v45);
                }
                [(PhoneSceneDelegate *)self openURLContext:*(void *)(*((void *)&v56 + 1) + 8 * (void)v49)];
                v49 = (char *)v49 + 1;
              }
              while (v47 != v49);
              id v47 = [v45 countByEnumeratingWithState:&v56 objects:v61 count:16];
            }
            while (v47);
          }

          v50 = [v8 notificationResponse];
          v51 = [v50 notification];
          v52 = [v51 request];
          v53 = [v52 content];
          v44 = [v53 userInfo];

          if (([(PhoneSceneDelegate *)self _parseFitnessCoachingNotificationType:v44] & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            v54 = [(PhoneSceneDelegate *)self rootViewController];
            [v54 hide];
          }
          notify_register_dispatch(kHKFirstDayOfFitnessWeekDidChangeNotification, &self->_fitnessWeekRedefinedChangeToken, (dispatch_queue_t)&_dispatch_main_q, &stru_1008ADF18);
          v55 = +[NSNotificationCenter defaultCenter];
          [v55 addObserver:self selector:"memoryWarningReceived:" name:UIApplicationDidReceiveMemoryWarningNotification object:0];
        }
      }
      else
      {
        [(PhoneSceneDelegate *)self _setupOnboarding];
      }
    }
  }
}

- (void)_setupActivityAppAndLoadData
{
  v3 = (AAUIAchievementsDataProvider *)[objc_alloc((Class)AAUIAchievementsDataProvider) initWithHealthStore:self->_healthStore layoutMode:0];
  achievementsDataProvider = self->_achievementsDataProvider;
  self->_achievementsDataProvider = v3;

  [(AAUIAchievementsDataProvider *)self->_achievementsDataProvider startFetching];
  fitnessAppContext = self->_fitnessAppContext;
  if (!fitnessAppContext)
  {
    v6 = [[CHFitnessAppContext alloc] initWithHealthStore:self->_healthStore seymourAvailabilityManager:self->_seymourAvailabilityManager wheelchairUseCache:self->_wheelchairUseCache formattingManager:self->_fitnessUIFormattingManager pregnancyStateProvider:self->_pregnancyStateProvider];
    id v7 = self->_fitnessAppContext;
    self->_fitnessAppContext = v6;

    fitnessAppContext = self->_fitnessAppContext;
  }
  [(CHFitnessAppContext *)fitnessAppContext setNavigationDelegate:self];
  id v8 = (AAUIBadgeImageFactory *)objc_alloc_init((Class)AAUIBadgeImageFactory);
  badgeImageFactory = self->_badgeImageFactory;
  self->_badgeImageFactory = v8;

  id v10 = (ACHAchievementLocalizationProvider *)objc_alloc_init((Class)ACHAchievementLocalizationProvider);
  achievementLocalizationProvider = self->_achievementLocalizationProvider;
  self->_achievementLocalizationProvider = v10;

  NSAttributedStringKey v12 = [(FIUIFormattingManager *)self->_fitnessUIFormattingManager unitManager];
  id v13 = v12;
  if (v12)
  {
    if ([v12 conformsToProtocol:&OBJC_PROTOCOL___ACHUnitManager])
    {
      [(ACHAchievementLocalizationProvider *)self->_achievementLocalizationProvider setAchUnitManager:v13];
    }
    else
    {
      _HKInitializeLogging();
      v14 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FIUIUnitManager failed to conform to the ACHUnitManager protocol, template's canonical unit will be utilized", buf, 2u);
      }
    }
  }
  [(ACHAchievementLocalizationProvider *)self->_achievementLocalizationProvider setWheelchairUser:[(_HKWheelchairUseCharacteristicCache *)self->_wheelchairUseCache isWheelchairUser]];
  v15 = (ASActivitySharingClient *)objc_alloc_init((Class)ASActivitySharingClient);
  activitySharingClient = self->_activitySharingClient;
  self->_activitySharingClient = v15;

  [(ASActivitySharingClient *)self->_activitySharingClient activateWithCompletionHandler:&stru_1008ADFB0];
  v17 = (FIUIModel *)[objc_alloc((Class)FIUIModel) initWithHealthStore:self->_healthStore];
  model = self->_model;
  self->_model = v17;

  v19 = (ASFriendListSectionManager *)[objc_alloc((Class)ASFriendListSectionManager) initWithModel:self->_model activitySharingClient:self->_activitySharingClient workoutDataProvider:0];
  friendListManager = self->_friendListManager;
  self->_friendListManager = v19;

  id v21 = [(CHHistoryDataProvider *)self->_historyDataProvider workoutDataProvider];
  workoutsDataProvider = self->_workoutsDataProvider;
  self->_workoutsDataProvider = v21;

  v23 = objc_alloc_init(_TtC10FitnessApp17ActivityDateCache);
  activityDateCache = self->_activityDateCache;
  self->_activityDateCache = v23;

  v25 = [[_TtC10FitnessApp20ActivityDataProvider alloc] initWithHealthStore:self->_healthStore wheelchairUseCache:self->_wheelchairUseCache workoutDataProvider:self->_workoutsDataProvider achievementsDataProvider:self->_achievementsDataProvider];
  activityDataProvider = self->_activityDataProvider;
  self->_activityDataProvider = v25;

  v27 = +[CHNavigator sharedNavigator];
  deeplinkNavigator = self->_deeplinkNavigator;
  self->_deeplinkNavigator = v27;

  v29 = [_TtC10FitnessApp19BalanceDataProvider alloc];
  healthStore = self->_healthStore;
  id v31 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  v32 = [(BalanceDataProvider *)v29 initWithHealthStore:healthStore gregorianCalendar:v31 historyDataProvider:self->_historyDataProvider activityDataProvider:self->_activityDataProvider isFaking:0];
  balanceDataProvider = self->_balanceDataProvider;
  self->_balanceDataProvider = v32;

  v34 = [[_TtC10FitnessApp25TrendsAvailabilityManager alloc] initWithDataProvider:self->_activityDataProvider healthStore:self->_healthStore];
  trendsAvailabilityManager = self->_trendsAvailabilityManager;
  self->_trendsAvailabilityManager = v34;

  v36 = [[_TtC10FitnessApp38SeymourNotificationResponseCoordinator alloc] initWithFitnessAppContext:self->_fitnessAppContext];
  seymourNotificationResponseCoordinator = self->_seymourNotificationResponseCoordinator;
  self->_seymourNotificationResponseCoordinator = v36;

  [(PhoneSceneDelegate *)self _updateSeymourNavigationController];
  v38 = [[CHFitnessAppBadgeAggregator alloc] initWithFitnessAppContext:self->_fitnessAppContext activitySharingClient:self->_activitySharingClient];
  appBadgeAggregator = self->_appBadgeAggregator;
  self->_appBadgeAggregator = v38;

  [(CHFitnessAppBadgeAggregator *)self->_appBadgeAggregator setDelegate:self];
  [(CHFitnessAppContext *)self->_fitnessAppContext setAppBadgeAggregator:self->_appBadgeAggregator];
  v40 = [[_TtC10FitnessApp32SeymourDiscoverySheetCoordinator alloc] initWithAppContext:self->_fitnessAppContext badgingProvider:self->_appBadgeAggregator delegate:self];
  seymourDiscoverySheetCoordinator = self->_seymourDiscoverySheetCoordinator;
  self->_seymourDiscoverySheetCoordinator = v40;

  if (_os_feature_enabled_impl())
  {
    v42 = [CHActivityTypeKeyMigrator alloc];
    v43 = +[CHFitnessAppActivityTypeMigrationKeys migrationKeys];
    v44 = [(CHActivityTypeKeyMigrator *)v42 initWithMigrationKeys:v43];

    [(CHActivityTypeKeyMigrator *)v44 migrateIfNeeded];
  }
  v45 = +[UNUserNotificationCenter currentNotificationCenter];
  [v45 setDelegate:self];

  id v46 = +[NSNotificationCenter defaultCenter];
  id v47 = +[TrendsAvailabilityManager trendsAvailabilityDidChangeNotification];
  [v46 addObserver:self selector:"_trendsAvailabilityStatusDidChange:" name:v47 object:self->_trendsAvailabilityManager];

  uint64_t v48 = [(PhoneSceneDelegate *)self _createRootViewController];
  [(PhoneSceneDelegate *)self setRootViewController:v48];

  v49 = [(PhoneSceneDelegate *)self window];
  v50 = [(PhoneSceneDelegate *)self rootViewController];
  [v49 setRootViewController:v50];

  v51 = [(PhoneSceneDelegate *)self window];
  [v51 makeKeyAndVisible];

  v52 = +[NSNotificationCenter defaultCenter];
  [v52 addObserver:self selector:"updateTVDiscovery" name:UIApplicationDidBecomeActiveNotification object:0];

  if (self->_loadingView)
  {
    v53 = [(CHTabBarController *)self->_tabBarController view];
    CGAffineTransformMakeScale(&v57, 0.9, 0.9);
    [v53 setTransform:&v57];

    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100162FC0;
    v56[3] = &unk_1008ABA78;
    v56[4] = self;
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_10016303C;
    v55[3] = &unk_1008ACA80;
    v55[4] = self;
    +[UIView animateWithDuration:v56 animations:v55 completion:0.5];
  }
  else
  {
    [(PhoneSceneDelegate *)self _showCoachingDataCollectionMessageIfNeeded];
    +[CHNotificationConsentController updateAuthorization];
  }
  v54 = +[WODataLinkMonitor shared];
  [v54 setDelegate:self];
}

- (UIWindow)window
{
  return self->_window;
}

- (BOOL)aggregatorShouldAllowEngagementBadging:(id)a3
{
  return [(SeymourAvailabilityManager *)self->_seymourAvailabilityManager available];
}

- (id)_createRootViewController
{
  +[ActivitySummaryCache setHealthStore:self->_healthStore];
  v3 = +[ActivitySummaryCache sharedInstance];
  [v3 loadDataIfNeeded];

  unsigned int v4 = [(PhoneSceneDelegate *)self workoutsDataProvider];
  [v4 startFetching];

  BOOL v5 = [(PhoneSceneDelegate *)self workoutsDataProvider];
  self->_hasCurrentWorkouts = [v5 hasWorkouts];

  [(PhoneSceneDelegate *)self _configureWorkoutHandler];
  v6 = [CHActivityHistoryNavigationController alloc];
  id v7 = [(PhoneSceneDelegate *)self activityDateCache];
  id v8 = [(PhoneSceneDelegate *)self pauseRingsCoordinator];
  v9 = [(CHActivityHistoryNavigationController *)v6 initWithDateCache:v7 pauseRingsCoordinator:v8];
  [(PhoneSceneDelegate *)self setActivityTileNavController:v9];

  id v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"SUMMARY" value:&stru_1008D8AB8 table:@"Localizable"];
  NSAttributedStringKey v12 = [(PhoneSceneDelegate *)self activityTileNavController];
  id v13 = [v12 tabBarItem];
  [v13 setTitle:v11];

  v14 = [(PhoneSceneDelegate *)self activityTileNavController];
  v15 = [v14 tabBarItem];
  [v15 setAccessibilityIdentifier:FIUITabBarSummaryAccessibilityIdentifier];

  [(PhoneSceneDelegate *)self _setActivityTabBarImage];
  objc_initWeak(&location, self);
  id v16 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001636F0;
  handler[3] = &unk_1008ACE80;
  objc_copyWeak(&v86, &location);
  notify_register_dispatch(HKStandalonePhoneFitnessModeDidUpdateNotification, &self->_standalonePhoneFitnessModeChangeToken, (dispatch_queue_t)&_dispatch_main_q, handler);

  v17 = [[CHFriendManager alloc] initWithActivitySharingClient:self->_activitySharingClient];
  [(PhoneSceneDelegate *)self setFriendManager:v17];

  v18 = [_TtC10FitnessApp23FriendsSetupCoordinator alloc];
  v19 = [(PhoneSceneDelegate *)self friendManager];
  v20 = [(PhoneSceneDelegate *)self friendListManager];
  id v21 = [(FriendsSetupCoordinator *)v18 initWithFriendManager:v19 friendListSectionManager:v20];
  [(PhoneSceneDelegate *)self setFriendsSetupCoordinator:v21];

  if (sub_1000D0350())
  {
    id v22 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    v83 = -[ActivityDashboardContext initWithActivityDataProvider:activityDateCache:achievementsDataProvider:balanceDataProvider:pauseRingsCoordinator:historyDataProvider:workoutFormattingManager:workoutDataProvider:friendListManager:friendsSetupCoordinator:chFriendManager:achievementLocalizationProvider:badgeImageFactory:healthStore:fiuiFormattingManager:fitnessAppContext:wheelchairUseCache:trendsAvailabilityManager:]([_TtC10FitnessApp24ActivityDashboardContext alloc], "initWithActivityDataProvider:activityDateCache:achievementsDataProvider:balanceDataProvider:pauseRingsCoordinator:historyDataProvider:workoutFormattingManager:workoutDataProvider:friendListManager:friendsSetupCoordinator:chFriendManager:achievementLocalizationProvider:badgeImageFactory:healthStore:fiuiFormattingManager:fitnessAppContext:wheelchairUseCache:trendsAvailabilityManager:", self->_activityDataProvider, self->_activityDateCache, self->_achievementsDataProvider, self->_balanceDataProvider, self->_pauseRingsCoordinator, self->_historyDataProvider, self->_workoutFormattingManager, self->_workoutsDataProvider, self->_friendListManager, self->_friendsSetupCoordinator, self->_friendManager, self->_achievementLocalizationProvider, self->_badgeImageFactory, self->_healthStore,
            self->_fitnessUIFormattingManager,
            self->_fitnessAppContext,
            self->_wheelchairUseCache,
            self->_trendsAvailabilityManager);
    v23 = [[_TtC10FitnessApp31ActivityDashboardViewController alloc] initWithCollectionViewLayout:v22 context:v83];
    [(PhoneSceneDelegate *)self setActivityDashboardViewController:v23];

    v24 = [(PhoneSceneDelegate *)self activityDashboardViewController];
    [v24 setTrophyCaseViewControllerDelegate:self];

    v25 = [(PhoneSceneDelegate *)self activityDashboardViewController];
    [v25 setHistoryPagingViewControllerDelegate:self];

    v26 = [(PhoneSceneDelegate *)self activityTileNavController];
    v27 = [(PhoneSceneDelegate *)self activityDashboardViewController];
    v89 = v27;
    v28 = +[NSArray arrayWithObjects:&v89 count:1];
    [v26 setViewControllers:v28];

    v81 = [(ActivityDashboardContext *)v83 chAwardsDataProvider];
  }
  else
  {
    v29 = [_TtC10FitnessApp26ActivityTileViewController alloc];
    v84 = [(PhoneSceneDelegate *)self healthStore];
    v82 = [(PhoneSceneDelegate *)self fitnessAppContext];
    v80 = [(PhoneSceneDelegate *)self activityDataProvider];
    v78 = [(PhoneSceneDelegate *)self pauseRingsCoordinator];
    v76 = [(PhoneSceneDelegate *)self historyDataProvider];
    v75 = [(PhoneSceneDelegate *)self achievementsDataProvider];
    v74 = [(PhoneSceneDelegate *)self achievementLocalizationProvider];
    v30 = [(PhoneSceneDelegate *)self model];
    id v31 = [(PhoneSceneDelegate *)self badgeImageFactory];
    v32 = [(PhoneSceneDelegate *)self friendListManager];
    v33 = [(PhoneSceneDelegate *)self fitnessUIFormattingManager];
    v34 = [(PhoneSceneDelegate *)self workoutFormattingManager];
    v35 = [(PhoneSceneDelegate *)self activityDateCache];
    v36 = [(PhoneSceneDelegate *)self trendsAvailabilityManager];
    v37 = [(PhoneSceneDelegate *)self wheelchairUseCache];
    v38 = [(ActivityTileViewController *)v29 initWithHealthStore:v84 fitnessAppContext:v82 activityDataProvider:v80 pauseRingsCoordinator:v78 historyDataProvider:v76 achievementsDataProvider:v75 achievementLocalizationProvider:v74 fiuiModel:v30 badgeImageFactory:v31 friendListManager:v32 fiuiFormattingManager:v33 workoutFormattingManager:v34 activityDateCache:v35 trendsAvailabilityManager:v36 wheelchairUseCache:v37];
    [(PhoneSceneDelegate *)self setActivityTileViewController:v38];

    v39 = [(PhoneSceneDelegate *)self activityTileNavController];
    v40 = [(PhoneSceneDelegate *)self activityTileViewController];
    v88 = v40;
    id v41 = +[NSArray arrayWithObjects:&v88 count:1];
    [v39 setViewControllers:v41];

    v81 = [(ActivityTileViewController *)self->_activityTileViewController awardsDataProviderWrapper];
    v83 = 0;
  }
  badgeImageFactory = self->_badgeImageFactory;
  achievementLocalizationProvider = self->_achievementLocalizationProvider;
  achievementsDataProvider = self->_achievementsDataProvider;
  activitySharingClient = self->_activitySharingClient;
  fitnessAppContext = self->_fitnessAppContext;
  fitnessUIFormattingManager = self->_fitnessUIFormattingManager;
  friendListManager = self->_friendListManager;
  friendsSetupCoordinator = self->_friendsSetupCoordinator;
  friendManager = self->_friendManager;
  healthStore = self->_healthStore;
  v50 = [(CHFitnessAppContext *)fitnessAppContext seymourCatalogItemDataProvider];
  +[CHActivitySharingViewControllerFactory makeWithAchievementBadgeImageFactory:achievementLocalizationProvider:achievementsDataProvider:activitySharingClient:awardsDataProvider:fitnessAppContext:fiuiFormattingManager:friendListSectionManager:friendsSetupCoordinator:friendManager:healthStore:seymourCatalogItemDataProvider:wheelchairUseCache:workoutDataProvider:workoutFormattingManager:pauseRingsCoordinator:](CHActivitySharingViewControllerFactory, "makeWithAchievementBadgeImageFactory:achievementLocalizationProvider:achievementsDataProvider:activitySharingClient:awardsDataProvider:fitnessAppContext:fiuiFormattingManager:friendListSectionManager:friendsSetupCoordinator:friendManager:healthStore:seymourCatalogItemDataProvider:wheelchairUseCache:workoutDataProvider:workoutFormattingManager:pauseRingsCoordinator:", badgeImageFactory, achievementLocalizationProvider, achievementsDataProvider, activitySharingClient, v81, fitnessAppContext, fitnessUIFormattingManager, friendListManager, friendsSetupCoordinator, friendManager, healthStore, v50, self->_wheelchairUseCache, self->_workoutsDataProvider,
    self->_workoutFormattingManager,
  v51 = self->_pauseRingsCoordinator);
  [(PhoneSceneDelegate *)self setActivitySharingViewController:v51];

  v52 = +[UIImage _systemImageNamed:@"person.2.fill"];
  v53 = [(PhoneSceneDelegate *)self activitySharingViewController];
  v54 = [v53 tabBarItem];
  [v54 setImage:v52];

  v55 = +[NSBundle mainBundle];
  long long v56 = [v55 localizedStringForKey:@"SHARING" value:&stru_1008D8AB8 table:@"Localizable"];
  CGAffineTransform v57 = [(PhoneSceneDelegate *)self activitySharingViewController];
  long long v58 = [v57 tabBarItem];
  [v58 setTitle:v56];

  long long v59 = [(PhoneSceneDelegate *)self activitySharingViewController];
  id v60 = [v59 tabBarItem];
  [v60 setAccessibilityIdentifier:FIUITabBarSharingAccessibilityIdentifier];

  v61 = objc_alloc_init(CHTabBarController);
  [(PhoneSceneDelegate *)self setTabBarController:v61];

  [(PhoneSceneDelegate *)self _setupTabBarViewControllersAndOrbActions];
  v62 = +[ARUIMetricColors keyColors];
  id v63 = [v62 nonGradientTextColor];

  v64 = [(PhoneSceneDelegate *)self window];
  [v64 setTintColor:v63];

  v65 = [CHNavigationTracker alloc];
  v66 = [(PhoneSceneDelegate *)self tabBarController];
  v67 = [(PhoneSceneDelegate *)self fitnessAppContext];
  v68 = [(CHNavigationTracker *)v65 initWithTabBarController:v66 fitnessAppContext:v67];
  [(PhoneSceneDelegate *)self setNavigationTracker:v68];

  v69 = [CHRootViewController alloc];
  v70 = [(PhoneSceneDelegate *)self tabBarController];
  v71 = [(PhoneSceneDelegate *)self healthStore];
  v72 = [(CHRootViewController *)v69 initWithTabBarController:v70 healthStore:v71];

  objc_destroyWeak(&v86);
  objc_destroyWeak(&location);

  return v72;
}

- (CHWorkoutDataProvider)workoutsDataProvider
{
  return self->_workoutsDataProvider;
}

- (CHTabBarController)tabBarController
{
  return self->_tabBarController;
}

- (CHActivityHistoryNavigationController)activityTileNavController
{
  return self->_activityTileNavController;
}

- (_TtC10FitnessApp31ActivityDashboardViewController)activityDashboardViewController
{
  return self->_activityDashboardViewController;
}

- (void)_setupTabBarViewControllersAndOrbActions
{
  v3 = [(PhoneSceneDelegate *)self activityTileNavController];
  v17 = v3;
  unsigned int v4 = +[NSArray arrayWithObjects:&v17 count:1];

  BOOL v5 = [(PhoneSceneDelegate *)self seymourNavController];

  if (v5)
  {
    _HKInitializeLogging();
    v6 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[seymour] Adding navigation controller to tab bar", v16, 2u);
    }
    id v7 = [(PhoneSceneDelegate *)self seymourNavController];
    uint64_t v8 = [v4 arrayByAddingObject:v7];

    uint64_t v9 = FIUITabBarFitnessPlusAccessibilityIdentifier;
    id v10 = [(PhoneSceneDelegate *)self seymourNavController];
    id v11 = [v10 tabBarItem];
    [v11 setAccessibilityIdentifier:v9];

    unsigned int v4 = (void *)v8;
  }
  NSAttributedStringKey v12 = [(PhoneSceneDelegate *)self activitySharingViewController];

  if (v12)
  {
    id v13 = [(PhoneSceneDelegate *)self activitySharingViewController];
    uint64_t v14 = [v4 arrayByAddingObject:v13];

    unsigned int v4 = (void *)v14;
  }
  v15 = [(PhoneSceneDelegate *)self tabBarController];
  [v15 setViewControllers:v4];

  [(PhoneSceneDelegate *)self _createOrbActions];
  [(PhoneSceneDelegate *)self _setupDeeplinks];
}

- (UIViewController)activitySharingViewController
{
  return self->_activitySharingViewController;
}

- (UIViewController)seymourNavController
{
  return self->_seymourNavController;
}

- (void)_createOrbActions
{
  id v28 = objc_alloc_init((Class)NSMutableArray);
  v3 = [(PhoneSceneDelegate *)self trendsAvailabilityManager];
  if ([v3 trendsAvailability] != (id)1)
  {
    unsigned int v4 = [(PhoneSceneDelegate *)self trendsAvailabilityManager];
    id v5 = [v4 trendsAvailability];

    if (!v5) {
      goto LABEL_5;
    }
    id v6 = objc_alloc((Class)UIApplicationShortcutItem);
    v3 = +[NSBundle mainBundle];
    id v7 = [v3 localizedStringForKey:@"ORB_TRENDS_ACTION" value:&stru_1008D8AB8 table:@"Localizable"];
    uint64_t v8 = +[UIApplicationShortcutIcon iconWithSystemImageName:@"chevron.up.circle"];
    id v9 = [v6 initWithType:@"com.apple.Fitness.opentrendsshortcut" localizedTitle:v7 localizedSubtitle:0 icon:v8 userInfo:0];
    [v28 addObject:v9];
  }
LABEL_5:
  if ([(PhoneSceneDelegate *)self hasCurrentWorkouts])
  {
    id v10 = [objc_alloc((Class)SBSApplicationShortcutSystemPrivateIcon) initWithSystemImageName:@"figure.run"];
    id v11 = objc_alloc((Class)UIApplicationShortcutItem);
    NSAttributedStringKey v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"ORB_HISTORY_ACTION" value:&stru_1008D8AB8 table:@"Localizable"];
    id v14 = [objc_alloc((Class)UIApplicationShortcutIcon) initWithSBSApplicationShortcutIcon:v10];
    id v15 = [v11 initWithType:@"com.apple.Fitness.openhistorylistshortcut" localizedTitle:v13 localizedSubtitle:0 icon:v14 userInfo:0];
    [v28 addObject:v15];
  }
  id v16 = [objc_alloc((Class)SBSApplicationShortcutSystemPrivateIcon) initWithSystemImageName:@"person.2"];
  id v17 = objc_alloc((Class)UIApplicationShortcutItem);
  v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"ORB_SHARING_ACTION" value:&stru_1008D8AB8 table:@"Localizable"];
  id v20 = [objc_alloc((Class)UIApplicationShortcutIcon) initWithSBSApplicationShortcutIcon:v16];
  id v21 = [v17 initWithType:@"com.apple.Fitness.opensocialshortcut" localizedTitle:v19 localizedSubtitle:0 icon:v20 userInfo:0];
  [v28 addObject:v21];

  id v22 = objc_alloc((Class)UIApplicationShortcutItem);
  v23 = +[NSBundle mainBundle];
  v24 = [v23 localizedStringForKey:@"ORB_SEND_RINGS_ACTION" value:&stru_1008D8AB8 table:@"Localizable"];
  v25 = +[UIApplicationShortcutIcon iconWithSystemImageName:@"square.and.arrow.up"];
  id v26 = [v22 initWithType:@"com.apple.Fitness.sharetodayactivityshortcut" localizedTitle:v24 localizedSubtitle:0 icon:v25 userInfo:0];
  [v28 addObject:v26];

  v27 = +[UIApplication sharedApplication];
  [v27 setShortcutItems:v28];
}

- (void)_setupDeeplinks
{
  deeplinkNavigator = self->_deeplinkNavigator;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10016388C;
  v49[3] = &unk_1008ADFD8;
  v49[4] = self;
  [(CHNavigator *)deeplinkNavigator registerURLHandlerWithSlug:@"activity" completion:v49];
  unsigned int v4 = self->_deeplinkNavigator;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100163894;
  v48[3] = &unk_1008ADFD8;
  v48[4] = self;
  [(CHNavigator *)v4 registerURLHandlerWithSlug:@"activity/:date:" completion:v48];
  id v5 = self->_deeplinkNavigator;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1001639F0;
  v47[3] = &unk_1008ADFD8;
  v47[4] = self;
  [(CHNavigator *)v5 registerURLHandlerWithSlug:@"activity/goals/(move|exercise|stand)" completion:v47];
  id v6 = self->_deeplinkNavigator;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100163B74;
  v46[3] = &unk_1008ADFD8;
  v46[4] = self;
  [(CHNavigator *)v6 registerURLHandlerWithSlug:@"activity/share" completion:v46];
  id v7 = self->_deeplinkNavigator;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100163B7C;
  v45[3] = &unk_1008ADFD8;
  v45[4] = self;
  [(CHNavigator *)v7 registerURLHandlerWithSlug:@"awards" completion:v45];
  uint64_t v8 = self->_deeplinkNavigator;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100163C10;
  v44[3] = &unk_1008ADFD8;
  v44[4] = self;
  [(CHNavigator *)v8 registerURLHandlerWithSlug:@"awards/:word:" completion:v44];
  id v9 = self->_deeplinkNavigator;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100163CAC;
  v43[3] = &unk_1008ADFD8;
  v43[4] = self;
  [(CHNavigator *)v9 registerURLHandlerWithSlug:@"awards/(:word:/:word:)" completion:v43];
  id v10 = self->_deeplinkNavigator;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100163D70;
  v42[3] = &unk_1008ADFD8;
  v42[4] = self;
  [(CHNavigator *)v10 registerURLHandlerWithSlug:@"balance(/.*)?" completion:v42];
  id v11 = self->_deeplinkNavigator;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100163E08;
  v41[3] = &unk_1008ADFD8;
  v41[4] = self;
  [(CHNavigator *)v11 registerURLHandlerWithSlug:@"history" completion:v41];
  NSAttributedStringKey v12 = self->_deeplinkNavigator;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100163E10;
  v40[3] = &unk_1008ADFD8;
  v40[4] = self;
  [(CHNavigator *)v12 registerURLHandlerWithSlug:@"history/(dives|mindfulness|workouts)" completion:v40];
  id v13 = self->_deeplinkNavigator;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100163F8C;
  v39[3] = &unk_1008ADFD8;
  v39[4] = self;
  [(CHNavigator *)v13 registerURLHandlerWithSlug:@"history/workouts/:id:/(indoor|outdoor)" completion:v39];
  id v14 = self->_deeplinkNavigator;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1001640AC;
  v38[3] = &unk_1008ADFD8;
  v38[4] = self;
  [(CHNavigator *)v14 registerURLHandlerWithSlug:@"history/mindfulness/:uuid:" completion:v38];
  id v15 = self->_deeplinkNavigator;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100164160;
  v37[3] = &unk_1008ADFD8;
  v37[4] = self;
  [(CHNavigator *)v15 registerURLHandlerWithSlug:@"history/workouts/M?:uuid:" completion:v37];
  id v16 = self->_deeplinkNavigator;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10016421C;
  v36[3] = &unk_1008ADFD8;
  v36[4] = self;
  [(CHNavigator *)v16 registerURLHandlerWithSlug:@"history/workouts/M?:uuid:/:uuid:" completion:v36];
  id v17 = self->_deeplinkNavigator;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10016431C;
  v35[3] = &unk_1008ADFD8;
  v35[4] = self;
  [(CHNavigator *)v17 registerURLHandlerWithSlug:@"history/workouts/M?:uuid:/:uuid:/:word:" completion:v35];
  v18 = self->_deeplinkNavigator;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10016443C;
  v34[3] = &unk_1008ADFD8;
  v34[4] = self;
  [(CHNavigator *)v18 registerURLHandlerWithSlug:@"history/workouts/M?:uuid:/:word:" completion:v34];
  v19 = self->_deeplinkNavigator;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100164520;
  v33[3] = &unk_1008ADFD8;
  v33[4] = self;
  [(CHNavigator *)v19 registerURLHandlerWithSlug:@"settings" completion:v33];
  id v20 = self->_deeplinkNavigator;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1001645A0;
  v32[3] = &unk_1008ADFD8;
  v32[4] = self;
  [(CHNavigator *)v20 registerURLHandlerWithSlug:@"settings/:word:" completion:v32];
  id v21 = self->_deeplinkNavigator;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1001646A4;
  v31[3] = &unk_1008ADFD8;
  v31[4] = self;
  [(CHNavigator *)v21 registerURLHandlerWithSlug:@"sharing" completion:v31];
  id v22 = self->_deeplinkNavigator;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1001646AC;
  v30[3] = &unk_1008ADFD8;
  v30[4] = self;
  [(CHNavigator *)v22 registerURLHandlerWithSlug:@"summary/:id:" completion:v30];
  v23 = [(PhoneSceneDelegate *)self trendsAvailabilityManager];
  if ([v23 trendsAvailability] == (id)1)
  {
  }
  else
  {
    v24 = [(PhoneSceneDelegate *)self trendsAvailabilityManager];
    id v25 = [v24 trendsAvailability];

    if (v25)
    {
      id v26 = self->_deeplinkNavigator;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10016475C;
      v29[3] = &unk_1008ADFD8;
      v29[4] = self;
      [(CHNavigator *)v26 registerURLHandlerWithSlug:@"trends" completion:v29];
      v27 = self->_deeplinkNavigator;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100164764;
      v28[3] = &unk_1008ADFD8;
      v28[4] = self;
      [(CHNavigator *)v27 registerURLHandlerWithSlug:@"trends/:id:" completion:v28];
    }
  }
}

- (_TtC10FitnessApp25TrendsAvailabilityManager)trendsAvailabilityManager
{
  return self->_trendsAvailabilityManager;
}

- (_TtC10FitnessApp26SeymourAvailabilityManager)seymourAvailabilityManager
{
  return self->_seymourAvailabilityManager;
}

- (void)setWorkoutFormattingManager:(id)a3
{
}

- (void)setWindowScene:(id)a3
{
}

- (void)setWindow:(id)a3
{
}

- (void)setWheelchairUseCache:(id)a3
{
}

- (void)setTabBarController:(id)a3
{
}

- (void)setSeymourNavController:(id)a3
{
}

- (void)setSeymourAvailabilityManager:(id)a3
{
}

- (void)setRootViewController:(id)a3
{
}

- (void)setPregnancyStateProvider:(id)a3
{
}

- (void)setPauseRingsCoordinator:(id)a3
{
}

- (void)setOnboardingCoordinator:(id)a3
{
}

- (void)setNavigationTracker:(id)a3
{
}

- (void)setHistoryDataProvider:(id)a3
{
}

- (void)setHealthStore:(id)a3
{
}

- (void)setFriendsSetupCoordinator:(id)a3
{
}

- (void)setFriendManager:(id)a3
{
}

- (void)setFitnessUIFormattingManager:(id)a3
{
}

- (void)setConnectionOptions:(id)a3
{
}

- (void)setActivityTileNavController:(id)a3
{
}

- (void)setActivitySharingViewController:(id)a3
{
}

- (void)setActivityDashboardViewController:(id)a3
{
}

- (CHRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (FIPauseRingsCoordinator)pauseRingsCoordinator
{
  return self->_pauseRingsCoordinator;
}

- (CHOnboardingCoordinator)onboardingCoordinator
{
  return self->_onboardingCoordinator;
}

- (BOOL)isMirroringSessionActive
{
  return self->_mirrorViewController != 0;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (BOOL)hasCurrentWorkouts
{
  return self->_hasCurrentWorkouts;
}

- (CHFriendManager)friendManager
{
  return self->_friendManager;
}

- (ASFriendListSectionManager)friendListManager
{
  return self->_friendListManager;
}

- (CHFitnessAppBadgeAggregator)appBadgeAggregator
{
  return self->_appBadgeAggregator;
}

- (BOOL)activityHasBeenSetup
{
  return (id)[(CHOnboardingCoordinator *)self->_onboardingCoordinator currentPhase] == (id)5;
}

- (_TtC10FitnessApp17ActivityDateCache)activityDateCache
{
  return self->_activityDateCache;
}

- (void)_showCoachingDataCollectionMessageIfNeeded
{
  if (+[_HKBehavior isAppleInternalInstall]
    && (+[UIApplication isRunningInStoreDemoMode] & 1) == 0)
  {
    v3 = [(PhoneSceneDelegate *)self _fitnessDataCollectionEnabledPreference];
    _HKInitializeLogging();
    unsigned int v4 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEBUG))
    {
      sub_10071D240((uint64_t)v3, v4);
      if (v3) {
        goto LABEL_6;
      }
    }
    else if (v3)
    {
LABEL_6:

      return;
    }
    id v5 = +[UIAlertController alertControllerWithTitle:@"Apple Activity Data" message:@"[Internal only] Do you want to help the Motion and Health teams by sending Apple your workouts, activity, and physical details to help improve health and fitness features? Your Apple email address may be associated with your data. You can learn more in Activity internal settings." preferredStyle:1];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100164998;
    v10[3] = &unk_1008ACB30;
    v10[4] = self;
    id v6 = +[UIAlertAction actionWithTitle:@"Don't Send" style:1 handler:v10];
    [v5 addAction:v6];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001649A4;
    v9[3] = &unk_1008ACB30;
    v9[4] = self;
    id v7 = +[UIAlertAction actionWithTitle:@"Send" style:0 handler:v9];
    [v5 addAction:v7];
    uint64_t v8 = [(PhoneSceneDelegate *)self activityTileNavController];
    [v8 presentViewController:v5 animated:1 completion:0];

    goto LABEL_6;
  }
}

- (int64_t)_parseFitnessCoachingNotificationType:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = [a3 objectForKeyedSubscript:FCCNotificationTypeUserInfoKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 integerValue];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_10071D454();
    }
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (void)memoryWarningReceived:(id)a3
{
  id v3 = [(PhoneSceneDelegate *)self badgeImageFactory];
  [v3 clearAllCachedImages];
}

- (void)_setupOnboarding
{
  if (![(SeymourAvailabilityManager *)self->_seymourAvailabilityManager stateKnown])
  {
    _HKInitializeLogging();
    id v3 = HKLogActivity;
    if (!os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v4 = "Waiting to show onboarding until initial queries complete";
    goto LABEL_7;
  }
  if (self->_presentingOnboarding)
  {
    _HKInitializeLogging();
    id v3 = HKLogActivity;
    if (!os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v4 = "Already presenting onboarding";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
    return;
  }
  self->_presentingOnboarding = 1;
  id v5 = +[UNUserNotificationCenter currentNotificationCenter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100162384;
  v6[3] = &unk_1008ADF40;
  v6[4] = self;
  [v5 getNotificationSettingsWithCompletionHandler:v6];
}

- (void)_presentWelcomeViewsSetupOnboarding:(BOOL)a3
{
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init(CHOnboardingNavigationController);
  objc_initWeak(&from, v5);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001628A0;
  v27[3] = &unk_1008ADC00;
  objc_copyWeak(&v28, &location);
  objc_copyWeak(&v29, &from);
  id v6 = objc_retainBlock(v27);
  BOOL v7 = [(SeymourAvailabilityManager *)self->_seymourAvailabilityManager available];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100162988;
  v22[3] = &unk_1008ADF68;
  BOOL v25 = a3;
  BOOL v26 = v7;
  uint64_t v8 = v6;
  id v23 = v8;
  objc_copyWeak(&v24, &from);
  id v9 = objc_retainBlock(v22);
  [(CHOnboardingNavigationController *)v5 setBuddyControllerDoneAction:v9];
  id v10 = [[CHASActivitySetupMetricsCollectionViewController alloc] initWithPresentationContext:1 pregnancyStateProvider:self->_pregnancyStateProvider];
  [(CHASActivitySetupMetricsCollectionViewController *)v10 setDelegate:v5];
  id v11 = [CHWelcomeViewController alloc];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100162A9C;
  v17[3] = &unk_1008ADF90;
  objc_copyWeak(&v21, &location);
  NSAttributedStringKey v12 = v5;
  v18 = v12;
  id v13 = v10;
  v19 = v13;
  id v14 = v9;
  id v20 = v14;
  id v15 = [(CHWelcomeViewController *)v11 initWithFitnessPlusAvailable:v7 buttonHandler:v17];
  v32 = v15;
  id v16 = +[NSArray arrayWithObjects:&v32 count:1];
  [(CHOnboardingNavigationController *)v12 setViewControllers:v16 animated:0];

  [(PhoneSceneDelegate *)self _presentOnboardingNavigationController:v12];
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

- (void)_presentOnboardingNavigationController:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CHOnboardingNavigationController);
  [(PhoneSceneDelegate *)self setSetupNavigationController:v5];

  id v6 = [(PhoneSceneDelegate *)self window];
  BOOL v7 = [(PhoneSceneDelegate *)self setupNavigationController];
  [v6 setRootViewController:v7];

  uint64_t v8 = [(PhoneSceneDelegate *)self window];
  id v9 = +[ARUIMetricColors keyColors];
  id v10 = [v9 nonGradientTextColor];
  [v8 setTintColor:v10];

  id v11 = [(PhoneSceneDelegate *)self window];
  [v11 makeKeyAndVisible];

  NSAttributedStringKey v12 = [CHLoadingView alloc];
  id v13 = [(PhoneSceneDelegate *)self window];
  [v13 frame];
  id v14 = -[CHLoadingView initWithFrame:](v12, "initWithFrame:");
  [(PhoneSceneDelegate *)self setLoadingView:v14];

  id v15 = [(PhoneSceneDelegate *)self window];
  id v16 = [(PhoneSceneDelegate *)self loadingView];
  [v15 addSubview:v16];

  id v17 = [(PhoneSceneDelegate *)self loadingView];
  v18 = [v17 indicatorView];
  [v18 startAnimating];

  [v4 setNavigationBarHidden:1 animated:0];
  [v4 setModalPresentationStyle:0];
  id v19 = [(PhoneSceneDelegate *)self setupNavigationController];
  [v19 presentViewController:v4 animated:0 completion:0];
}

- (void)_presentMoveGoalSetupOnboarding
{
  id v4 = [[CHASActivitySetupMetricsCollectionViewController alloc] initWithPresentationContext:1 pregnancyStateProvider:self->_pregnancyStateProvider];
  id v3 = [[CHOnboardingNavigationController alloc] initWithRootViewController:v4];
  [(PhoneSceneDelegate *)self _presentOnboardingNavigationController:v3];
}

- (void)_presentExerciseAndStandGoalsSetupOnboarding
{
  id v4 = [[CHASActivitySetupThreeRingsOnboardingViewController alloc] initWithPresentationContext:2];
  id v3 = [[CHOnboardingNavigationController alloc] initWithRootViewController:v4];
  [(PhoneSceneDelegate *)self _presentOnboardingNavigationController:v3];
}

- (void)_presentWhatsNewViewSetupOnboarding
{
  BOOL v3 = [(SeymourAvailabilityManager *)self->_seymourAvailabilityManager available];
  objc_initWeak(&location, self);
  id v4 = [CHWhatsNewViewController alloc];
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100162F70;
  id v11 = &unk_1008AB8D8;
  objc_copyWeak(&v12, &location);
  id v5 = [(CHWhatsNewViewController *)v4 initWithFitnessPlusAvailable:v3 buttonHandler:&v8];
  id v6 = [CHOnboardingNavigationController alloc];
  BOOL v7 = -[CHOnboardingNavigationController initWithRootViewController:](v6, "initWithRootViewController:", v5, v8, v9, v10, v11);
  [(PhoneSceneDelegate *)self _presentOnboardingNavigationController:v7];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5 = a4;
  if ([(PhoneSceneDelegate *)self isMirroringSessionActive])
  {
    _HKInitializeLogging();
    id v6 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Intercepting URL contexts because a Mirrored workout is running", buf, 2u);
    }
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          -[PhoneSceneDelegate openURLContext:](self, "openURLContext:", v12, (void)v13);
          [(CHFitnessAppContext *)self->_fitnessAppContext openURLContext:v12];
        }
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)openURLContext:(id)a3
{
  id v4 = [a3 URL];
  id v5 = [v4 scheme];
  unsigned int v6 = [v5 isEqualToString:@"activitytoday"];

  if (v6)
  {
    [(PhoneSceneDelegate *)self _handleTodayShortcut];
  }
  else
  {
    id v7 = [v4 scheme];
    unsigned int v8 = [v7 isEqualToString:kASActivitySharingScheme];

    if (v8)
    {
      [(PhoneSceneDelegate *)self _handleActivitySharingURL:v4];
    }
    else
    {
      id v9 = [v4 scheme];
      unsigned int v10 = [v9 isEqualToString:@"fitness-badging"];

      if (v10)
      {
        _HKInitializeLogging();
        id v11 = HKLogActivity;
        if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v20 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Refreshing badge count for URL launch", v20, 2u);
        }
        [(PhoneSceneDelegate *)self _refreshBadgeCounts];
      }
      else
      {
        uint64_t v12 = [v4 scheme];
        unsigned int v13 = [v12 isEqualToString:@"fitnessapp-settings"];

        if (v13)
        {
          [(PhoneSceneDelegate *)self _handleSettingsShortcut];
        }
        else
        {
          long long v14 = [v4 scheme];
          if ([v14 isEqualToString:@"file"])
          {
            long long v15 = [v4 pathExtension];
            unsigned int v16 = [v15 isEqualToString:@"workout"];

            if (v16)
            {
              [(PhoneSceneDelegate *)self _handleWorkoutConfigurationURL:v4];
              goto LABEL_17;
            }
          }
          else
          {
          }
          id v17 = [v4 scheme];
          v18 = +[CHNavigator scheme];
          unsigned int v19 = [v17 isEqualToString:v18];

          if (v19) {
            [(CHNavigator *)self->_deeplinkNavigator navigateToURL:v4];
          }
        }
      }
    }
  }
LABEL_17:
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = [(PhoneSceneDelegate *)self activityDataProvider];
  [v4 updateWidgets];

  id v5 = [(CHTabBarController *)self->_tabBarController selectedViewController];
  seymourNavController = self->_seymourNavController;

  fitnessAppContext = self->_fitnessAppContext;
  if (v5 == seymourNavController) {
    [(CHFitnessAppContext *)fitnessAppContext seymourAppWillResignActive];
  }
  else {
    [(CHFitnessAppContext *)fitnessAppContext flushMetricEvents];
  }

  [(PhoneSceneDelegate *)self updateTVDiscovery];
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = [(CHTabBarController *)self->_tabBarController selectedViewController];
  seymourNavController = self->_seymourNavController;

  fitnessAppContext = self->_fitnessAppContext;
  if (v4 == seymourNavController) {
    [(CHFitnessAppContext *)fitnessAppContext seymourAppWillTerminate];
  }
  else {
    [(CHFitnessAppContext *)fitnessAppContext flushMetricEvents];
  }

  [(PhoneSceneDelegate *)self endDiscovery];
}

- (void)endDiscovery
{
  BOOL v3 = [(PhoneSceneDelegate *)self tvConnectionManager];
  [v3 setIsDiscoveryAllowed:0];

  id v4 = [(PhoneSceneDelegate *)self tvConnectionManager];
  [v4 endDiscovery];
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  unsigned int v8 = (void (**)(id, void))a5;
  if ([(PhoneSceneDelegate *)self isMirroringSessionActive])
  {
    _HKInitializeLogging();
    id v9 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Intercepting shortcut because a Mirrored workout is running", buf, 2u);
    }
    v8[2](v8, 0);
  }
  else
  {
    [(PhoneSceneDelegate *)self _handleShortcutItem:v7 didJustLaunch:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001636DC;
    block[3] = &unk_1008AD668;
    id v11 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_resetToViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PhoneSceneDelegate *)self activityTileNavController];
  [v5 dismissViewControllerAnimated:0 completion:0];

  unsigned int v6 = [(PhoneSceneDelegate *)self tabBarController];
  [v6 setSelectedViewController:v4];

  id v7 = [(PhoneSceneDelegate *)self activityTileNavController];
  [v7 detachPalette];

  id v9 = [(PhoneSceneDelegate *)self activityTileNavController];
  id v8 = [v9 popToRootViewControllerAnimated:0];
}

- (id)summaryDeeplinkViewController
{
  if (sub_1000D0350()) {
    [(PhoneSceneDelegate *)self activityDashboardViewController];
  }
  else {
  BOOL v3 = [(PhoneSceneDelegate *)self activityTileViewController];
  }

  return v3;
}

- (void)_trendsAvailabilityStatusDidChange:(id)a3
{
  id v6 = [(PhoneSceneDelegate *)self trendsAvailabilityManager];
  if ([v6 trendsAvailability])
  {
    id v4 = [(PhoneSceneDelegate *)self trendsAvailabilityManager];
    id v5 = [v4 trendsAvailability];

    if (v5 != (id)1)
    {
      [(PhoneSceneDelegate *)self _createOrbActions];
    }
  }
  else
  {
  }
}

- (void)_seymourAvailabilityStatusDidChange:(id)a3
{
  _HKInitializeLogging();
  id v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[seymour] Seymour availability updated", v6, 2u);
  }
  if ((id)[(CHOnboardingCoordinator *)self->_onboardingCoordinator currentPhase] == (id)5)
  {
    id v5 = [(PhoneSceneDelegate *)self activityDashboardViewController];

    if (v5)
    {
      [(PhoneSceneDelegate *)self _updateSeymourNavigationController];
      [(PhoneSceneDelegate *)self _setupTabBarViewControllersAndOrbActions];
      [(PhoneSceneDelegate *)self _clearWindowSceneAndOptions];
    }
  }
  else
  {
    [(PhoneSceneDelegate *)self _setupOnboarding];
  }
}

- (void)_setFitnessDataCollectionEnabled:(BOOL)a3
{
  CFStringRef v3 = (const __CFString *)FIAppleInternalDataCollectionEnabledKey;
  id v4 = +[NSNumber numberWithBool:a3];
  CFStringRef v5 = (const __CFString *)FINanoLifestylePreferencesDomain;
  CFPreferencesSetAppValue(v3, v4, FINanoLifestylePreferencesDomain);
  CFPreferencesAppSynchronize(v5);
  id v6 = objc_opt_new();
  id v7 = +[NSSet setWithObject:v3];
  [v6 synchronizeUserDefaultsDomain:v5 keys:v7];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v9 = (const __CFString *)FIAppleInternalDataCollectionEnabledDidChangeNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v9, 0, 0, 1u);
}

- (id)_fitnessDataCollectionEnabledPreference
{
  id v2 = (void *)CFPreferencesCopyAppValue(FIAppleInternalDataCollectionEnabledKey, FINanoLifestylePreferencesDomain);

  return v2;
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v5 = a4;
  if ([(PhoneSceneDelegate *)self isMirroringSessionActive])
  {
    _HKInitializeLogging();
    id v6 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Intercepting user activity because a Mirrored workout is running", v10, 2u);
    }
  }
  else
  {
    id v7 = [v5 activityType];
    if ([v7 isEqualToString:FIUIActivityContinuityKey])
    {
      id v8 = [(PhoneSceneDelegate *)self tabBarController];
      [v8 setSelectedIndex:0];
    }
    CFStringRef v9 = [(PhoneSceneDelegate *)self fitnessAppContext];
    [v9 continueUserActivity:v5];
  }
}

- (void)dealloc
{
  int fitnessWeekRedefinedChangeToken = self->_fitnessWeekRedefinedChangeToken;
  if (fitnessWeekRedefinedChangeToken != -1) {
    notify_cancel(fitnessWeekRedefinedChangeToken);
  }
  int standalonePhoneFitnessModeChangeToken = self->_standalonePhoneFitnessModeChangeToken;
  if (standalonePhoneFitnessModeChangeToken != -1) {
    notify_cancel(standalonePhoneFitnessModeChangeToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)PhoneSceneDelegate;
  [(PhoneSceneDelegate *)&v5 dealloc];
}

- (void)_handleShortcutItem:(id)a3 didJustLaunch:(BOOL)a4
{
  id v13 = a3;
  objc_super v5 = [v13 type];
  unsigned int v6 = [v5 isEqualToString:@"com.apple.Fitness.opentrendsshortcut"];

  if (v6)
  {
    [(PhoneSceneDelegate *)self _handleTrendsShortcut];
  }
  else
  {
    id v7 = [v13 type];
    unsigned int v8 = [v7 isEqualToString:@"com.apple.Fitness.openhistorylistshortcut"];

    if (v8)
    {
      [(PhoneSceneDelegate *)self _handleHistoryShortcut];
    }
    else
    {
      CFStringRef v9 = [v13 type];
      unsigned int v10 = [v9 isEqualToString:@"com.apple.Fitness.opensocialshortcut"];

      if (v10)
      {
        [(PhoneSceneDelegate *)self _handleFriendsShortcut];
      }
      else
      {
        id v11 = [v13 type];
        unsigned int v12 = [v11 isEqualToString:@"com.apple.Fitness.sharetodayactivityshortcut"];

        if (v12) {
          [(PhoneSceneDelegate *)self _handleActivityShareShortcut];
        }
      }
    }
  }
}

- (void)_handleTrendsShortcut
{
  _HKInitializeLogging();
  CFStringRef v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handling trends shortcut", v6, 2u);
  }
  id v4 = [(PhoneSceneDelegate *)self activityTileNavController];
  [(PhoneSceneDelegate *)self _resetToViewController:v4];

  objc_super v5 = [(PhoneSceneDelegate *)self summaryDeeplinkViewController];
  [v5 showAllTrendsAnimated:1];
}

- (void)_handleHistoryShortcut
{
  _HKInitializeLogging();
  CFStringRef v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handling history shortcut", v6, 2u);
  }
  id v4 = [(PhoneSceneDelegate *)self activityTileNavController];
  [(PhoneSceneDelegate *)self _resetToViewController:v4];

  objc_super v5 = [(PhoneSceneDelegate *)self summaryDeeplinkViewController];
  [v5 navigateToHistoryAnimated:1];
}

- (void)_handleSettingsShortcut
{
  _HKInitializeLogging();
  CFStringRef v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handling settings shortcut", buf, 2u);
  }
  if ([(PhoneSceneDelegate *)self activityHasBeenSetup])
  {
    id v4 = [(PhoneSceneDelegate *)self activityTileNavController];
    [(PhoneSceneDelegate *)self _resetToViewController:v4];

    objc_super v5 = [(PhoneSceneDelegate *)self summaryDeeplinkViewController];
    [v5 presentAppSettingsShowingPane:2];
  }
  else
  {
    _HKInitializeLogging();
    unsigned int v6 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Ignoring request to launch to health settings as we have not been set up yet.", v7, 2u);
    }
  }
}

- (void)_handleFriendsShortcut
{
  _HKInitializeLogging();
  CFStringRef v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handling friends shortcut", v7, 2u);
  }
  id v4 = [(PhoneSceneDelegate *)self activitySharingViewController];
  [(PhoneSceneDelegate *)self _resetToViewController:v4];

  objc_super v5 = [(PhoneSceneDelegate *)self activitySharingViewController];
  id v6 = [v5 popToRootViewControllerAnimated:0];
}

- (void)_handleActivityShareShortcut
{
  _HKInitializeLogging();
  CFStringRef v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handling activity share shortcut", v7, 2u);
  }
  id v4 = [(PhoneSceneDelegate *)self activityTileNavController];
  [(PhoneSceneDelegate *)self _resetToViewController:v4];

  objc_super v5 = [(PhoneSceneDelegate *)self summaryDeeplinkViewController];
  id v6 = [v5 showTodayAndShareImmediately:1 animated:0 forGoalCompleteNotification:0 goalRecommendation:0];
}

- (void)_handleTodayShortcut
{
  _HKInitializeLogging();
  CFStringRef v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Opening Today view", v7, 2u);
  }
  id v4 = [(PhoneSceneDelegate *)self activityTileNavController];
  [(PhoneSceneDelegate *)self _resetToViewController:v4];

  objc_super v5 = [(PhoneSceneDelegate *)self summaryDeeplinkViewController];
  id v6 = [v5 showTodayAndShareImmediately:0 animated:1 forGoalCompleteNotification:0 goalRecommendation:0];
}

- (void)_handleActivitySharingURL:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  objc_super v5 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handling activity sharing URL: %@", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [(PhoneSceneDelegate *)self activitySharingViewController];
  [(PhoneSceneDelegate *)self _resetToViewController:v6];

  id v7 = [(PhoneSceneDelegate *)self activitySharingViewController];
  [v7 handleActivitySharingURL:v4];
}

- (void)_handleWorkoutConfigurationURL:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  objc_super v5 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handling workout sharing URL: %@", buf, 0xCu);
  }
  unsigned int v6 = [v4 startAccessingSecurityScopedResource];
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_10071D340();
    }
  }
  id v12 = 0;
  id v7 = +[NSData dataWithContentsOfURL:v4 options:0 error:&v12];
  id v8 = v12;
  if (v8)
  {
    _HKInitializeLogging();
    id v9 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_10071D2B8((uint64_t)v4, (uint64_t)v8, v9);
    }
  }
  else
  {
    unsigned int v10 = [(PhoneSceneDelegate *)self activityTileNavController];
    [(PhoneSceneDelegate *)self _resetToViewController:v10];

    id v11 = [(PhoneSceneDelegate *)self activityDashboardViewController];
    [v11 presentWorkoutConfigurationWithData:v7];
  }
  if (v6) {
    [v4 stopAccessingSecurityScopedResource];
  }
}

- (BOOL)navigateToSeymourTab
{
  CFStringRef v3 = [(PhoneSceneDelegate *)self seymourNavController];

  if (v3)
  {
    id v4 = [(PhoneSceneDelegate *)self seymourNavController];
    [(PhoneSceneDelegate *)self _setSelectedViewController:v4];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_10071D374();
    }
  }
  return v3 != 0;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, uint64_t))a5;
  id v9 = [v7 request];
  unsigned int v10 = [v9 identifier];

  id v11 = [v7 request];
  id v12 = [v11 content];

  id v13 = [v12 categoryIdentifier];
  if (([v10 isEqualToString:@"com.apple.fitcored.guestpairing"] & 1) != 0
    || ([v10 isEqualToString:@"com.apple.Fitness.WorkoutPlanCreationNotification"] & 1) != 0
    || ([v10 isEqualToString:FCCFitnessPlusPlanNotificationCategoryIdentifier] & 1) != 0
    || ([v13 isEqualToString:kASBulletinsActivityDataCategoryIdentifier] & 1) != 0
    || [v13 isEqualToString:FCCNotificationCategoryIdentifier]
    && ([v12 userInfo],
        id v14 = objc_claimAutoreleasedReturnValue(),
        int64_t v15 = [(PhoneSceneDelegate *)self _parseFitnessCoachingNotificationType:v14], v14, v15 == 2))
  {
    unsigned int v16 = [(PhoneSceneDelegate *)self fitnessAppContext];
    unsigned int v17 = [v16 isSessionViewControllerPresented];

    if (v17)
    {
      _HKInitializeLogging();
      v18 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending notification to notification center during Fitness+ session", (uint8_t *)&v21, 2u);
      }
      uint64_t v19 = 8;
    }
    else
    {
      uint64_t v19 = 27;
    }
    v8[2](v8, v19);
  }
  else
  {
    _HKInitializeLogging();
    id v20 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Incoming notification not allowed to post over foregrounded app: %@", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  _HKInitializeLogging();
  id v9 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v81 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fitness received notification response %{public}@", buf, 0xCu);
  }
  if ([(PhoneSceneDelegate *)self isMirroringSessionActive])
  {
    _HKInitializeLogging();
    unsigned int v10 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v11 = "Intercepting notification because a Mirrored workout is running";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!+[AMSUserNotification shouldHandleNotificationResponse:v7])
  {
    id v13 = [(PhoneSceneDelegate *)self fitnessAppContext];
    unsigned int v14 = [v13 isSessionViewControllerPresented];

    if (v14)
    {
      _HKInitializeLogging();
      unsigned int v10 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v11 = "Preventing navigation for notification while in Fitness+ session";
        goto LABEL_11;
      }
LABEL_12:
      v8[2](v8);
      goto LABEL_13;
    }
    int64_t v15 = [v7 notification];
    unsigned int v16 = [v15 request];
    unsigned int v17 = [v16 content];
    v18 = [v17 categoryIdentifier];

    if (([v18 isEqualToString:kASBulletinsInviteCategoryIdentifier] & 1) != 0
      || ([v18 isEqualToString:kASBulletinsActivityDataCategoryIdentifier] & 1) != 0)
    {
      unsigned int v19 = 1;
    }
    else
    {
      unsigned int v19 = [v18 isEqualToString:kASBulletinsGenericCategoryIdentifier];
    }
    unsigned int v71 = [v18 isEqualToString:FCCNotificationCategoryIdentifier];
    unsigned int v20 = +[CHMoveModeNotificationResponseCoordinator shouldHandleNotificationCategoryIdentifier:v18];
    unsigned int v69 = [v18 isEqualToString:@"com.apple.Fitness.GuestPairingNotification"];
    unsigned int v67 = [v18 isEqualToString:@"com.apple.Fitness.WorkoutPlanCreationNotification"];
    unsigned int v66 = [v18 isEqualToString:FCCFitnessPlusPlanNotificationCategoryIdentifier];
    unsigned int v21 = [v18 isEqualToString:FCCPauseRingsReminderNotificationCategoryIdentifier];
    v73 = v18;
    if (v21)
    {
      id v22 = [v7 actionIdentifier];
      unsigned int v72 = [v22 isEqualToString:@"PAUSE_YOUR_RINGS"];

      id v23 = [v7 actionIdentifier];
      unsigned int v70 = [v23 isEqualToString:@"EDIT_PAUSE_RINGS"];

      id v24 = [v7 actionIdentifier];
      unsigned int v68 = [v24 isEqualToString:@"VIEW_PAUSE_RINGS"];
    }
    else
    {
      unsigned int v68 = 0;
      unsigned int v72 = 0;
      unsigned int v70 = 0;
    }
    BOOL v25 = [v7 actionIdentifier];
    if ([v25 isEqualToString:UNNotificationDefaultActionIdentifier])
    {
      BOOL v26 = [v7 notification];
      v27 = [v26 request];
      if (v27) {
        char v28 = v20;
      }
      else {
        char v28 = 1;
      }

      if ((v28 & 1) == 0)
      {
        _HKInitializeLogging();
        id v29 = HKLogActivity;
        BOOL v30 = os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT);
        if (v19)
        {
          id v31 = v73;
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Handling notification response for default action - activity sharing", buf, 2u);
          }
          v32 = [(PhoneSceneDelegate *)self activitySharingViewController];
          v33 = [(PhoneSceneDelegate *)self activitySharingViewController];
          id v34 = [v33 popToRootViewControllerAnimated:0];

          goto LABEL_73;
        }
        id v31 = v73;
        if (v71)
        {
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Handling notification response for default action - fitness coaching", buf, 2u);
          }
          [(PhoneSceneDelegate *)self handleFitnessCoachingNotificationResponse:v7];
LABEL_47:
          uint64_t v50 = [(PhoneSceneDelegate *)self activityTileNavController];
LABEL_72:
          v32 = (void *)v50;
LABEL_73:
          [(PhoneSceneDelegate *)self _setSelectedViewController:v32];
          v8[2](v8);
LABEL_74:

          goto LABEL_75;
        }
        if (v69)
        {
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Handling notification response for guest pairing action - fitness+", buf, 2u);
          }
          [(NLTVConnectionManager *)self->_tvConnectionManager updateDiscoveryStateIfNeeded];
          [(NLTVConnectionManager *)self->_tvConnectionManager connectAutomatically];
          v32 = 0;
          goto LABEL_73;
        }
        if (v67)
        {
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Handling notification response for create plan action - fitness+", buf, 2u);
          }
          [(CHFitnessAppContext *)self->_fitnessAppContext navigateToWorkoutPlanCreation];
        }
        else
        {
          if (!v66)
          {
            if (v30)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Handling notification response for default action - trends", buf, 2u);
            }
            v62 = [(PhoneSceneDelegate *)self activityTileNavController];
            [v62 detachPalette];

            id v63 = [(PhoneSceneDelegate *)self activityTileNavController];
            id v64 = [v63 popToRootViewControllerAnimated:0];

            v65 = [(PhoneSceneDelegate *)self activityDashboardViewController];
            [v65 showAllTrendsAnimated:0];

            goto LABEL_47;
          }
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Handling notification response for plan detail action - fitness+", buf, 2u);
          }
          [(CHFitnessAppContext *)self->_fitnessAppContext navigateToWorkoutPlanDetail];
        }
        uint64_t v50 = [(PhoneSceneDelegate *)self seymourNavController];
        goto LABEL_72;
      }
    }
    else
    {
    }
    if (v19)
    {
      _HKInitializeLogging();
      v35 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Handling notification response for activity sharing", buf, 2u);
      }
      v32 = [v7 actionIdentifier];
      v36 = [v7 notification];
      v37 = [v36 request];
      v38 = [v37 content];
      v39 = [v38 userInfo];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40 = [v7 userText];
        uint64_t v78 = kASNotificationReplyKey;
        v79 = v40;
        id v41 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
        uint64_t v42 = [v39 hk_dictionaryByAddingEntriesFromDictionary:v41];

        v39 = (void *)v42;
      }
      id v31 = v73;
      id v43 = [objc_alloc((Class)ASUserNotificationResponse) initWithActionIdentifier:v32 userInfo:v39];
      activitySharingClient = self->_activitySharingClient;
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_100166268;
      v74[3] = &unk_1008ADBD8;
      v75 = v8;
      [(ASActivitySharingClient *)activitySharingClient handleNotificationResponse:v43 completion:v74];

      goto LABEL_74;
    }
    id v31 = v73;
    if (v20)
    {
      v45 = [(PhoneSceneDelegate *)self activityTileNavController];
      id v46 = [(PhoneSceneDelegate *)self healthStore];
      id v47 = [(PhoneSceneDelegate *)self fitnessUIFormattingManager];
      +[CHMoveModeNotificationResponseCoordinator handleNotificationResponse:v7 presentingNavigationController:v45 healthStore:v46 formattingManager:v47];
    }
    if (!v21)
    {
LABEL_54:
      v8[2](v8);
LABEL_75:

      goto LABEL_13;
    }
    if (v72)
    {
      _HKInitializeLogging();
      uint64_t v48 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v49 = "Presenting day view for notification with pause rings menu";
LABEL_51:
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, v49, buf, 2u);
      }
    }
    else
    {
      if (!v70)
      {
        if (!v68) {
          goto LABEL_54;
        }
        _HKInitializeLogging();
        long long v58 = HKLogActivity;
        if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Presenting day view for notification with just the rings", buf, 2u);
        }
        long long v59 = [(PhoneSceneDelegate *)self activityTileNavController];
        [v59 dismissViewControllerAnimated:0 completion:0];

        id v60 = [(PhoneSceneDelegate *)self activityTileNavController];
        id v61 = [v60 popToRootViewControllerAnimated:0];

        v54 = [(PhoneSceneDelegate *)self activityDashboardViewController];
        v55 = v54;
        uint64_t v56 = 0;
        goto LABEL_53;
      }
      _HKInitializeLogging();
      uint64_t v48 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v49 = "Presenting day view for notification with edit pause rings";
        goto LABEL_51;
      }
    }
    v51 = [(PhoneSceneDelegate *)self activityTileNavController];
    [v51 dismissViewControllerAnimated:0 completion:0];

    v52 = [(PhoneSceneDelegate *)self activityTileNavController];
    id v53 = [v52 popToRootViewControllerAnimated:0];

    v54 = [(PhoneSceneDelegate *)self activityDashboardViewController];
    v55 = v54;
    uint64_t v56 = 1;
LABEL_53:
    id v57 = [v54 showTodayAndShareImmediately:0 animated:0 forGoalCompleteNotification:0 goalRecommendation:0 withPauseRingsEditing:v56];

    goto LABEL_54;
  }
  seymourNotificationResponseCoordinator = self->_seymourNotificationResponseCoordinator;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_1001661C4;
  v76[3] = &unk_1008AD938;
  v76[4] = self;
  v77 = v8;
  [(SeymourNotificationResponseCoordinator *)seymourNotificationResponseCoordinator handleNotificationResponse:v7 completion:v76];

LABEL_13:
}

- (void)handleFitnessCoachingNotificationResponse:(id)a3
{
  id v4 = [a3 notification];
  objc_super v5 = [v4 request];
  unsigned int v6 = [v5 content];
  id v7 = [v6 userInfo];

  int64_t v8 = [(PhoneSceneDelegate *)self _parseFitnessCoachingNotificationType:v7];
  int v9 = v8;
  switch(v8)
  {
    case 1:
      _HKInitializeLogging();
      unsigned int v10 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Presenting day view for notification", buf, 2u);
      }
      id v11 = [(PhoneSceneDelegate *)self activityTileNavController];
      [v11 dismissViewControllerAnimated:0 completion:0];

      id v12 = [(PhoneSceneDelegate *)self activityTileNavController];
      id v13 = [v12 popToRootViewControllerAnimated:0];

      unsigned int v14 = [(PhoneSceneDelegate *)self activityDashboardViewController];
      int64_t v15 = v14;
      uint64_t v16 = 0;
      goto LABEL_11;
    case 2:
      _HKInitializeLogging();
      unsigned int v17 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v50 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Presenting achievement with celebration for notification", v50, 2u);
      }
      v18 = [(PhoneSceneDelegate *)self rootViewController];
      [v18 hide];

      unsigned int v19 = ACHDecodeAchievementFromUserInfoDictionary();
      unsigned int v20 = [(PhoneSceneDelegate *)self activityTileNavController];
      [v20 dismissViewControllerAnimated:0 completion:0];

      unsigned int v21 = [(PhoneSceneDelegate *)self activityTileNavController];
      id v22 = [v21 popToRootViewControllerAnimated:0];

      id v23 = [(PhoneSceneDelegate *)self activityDashboardViewController];
      id v24 = v23;
      BOOL v25 = v19;
      uint64_t v26 = 1;
      goto LABEL_15;
    case 3:
      _HKInitializeLogging();
      v27 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v48 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Presenting goal completion celebration", v48, 2u);
      }
      char v28 = [(PhoneSceneDelegate *)self rootViewController];
      [v28 hide];

      id v29 = [(PhoneSceneDelegate *)self activityTileNavController];
      [v29 dismissViewControllerAnimated:0 completion:0];

      BOOL v30 = [(PhoneSceneDelegate *)self activityTileNavController];
      id v31 = [v30 popToRootViewControllerAnimated:0];

      unsigned int v14 = [(PhoneSceneDelegate *)self activityDashboardViewController];
      int64_t v15 = v14;
      uint64_t v16 = 1;
LABEL_11:
      id v32 = [v14 showTodayAndShareImmediately:0 animated:0 forGoalCompleteNotification:v16 goalRecommendation:0];

      goto LABEL_21;
    case 4:
      _HKInitializeLogging();
      v33 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v49 = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Presenting achievement without celebration for notification", v49, 2u);
      }
      id v34 = [(PhoneSceneDelegate *)self rootViewController];
      [v34 hide];

      unsigned int v19 = ACHDecodeAchievementFromUserInfoDictionary();
      v35 = [(PhoneSceneDelegate *)self activityTileNavController];
      [v35 dismissViewControllerAnimated:0 completion:0];

      v36 = [(PhoneSceneDelegate *)self activityTileNavController];
      id v37 = [v36 popToRootViewControllerAnimated:0];

      id v23 = [(PhoneSceneDelegate *)self activityDashboardViewController];
      id v24 = v23;
      BOOL v25 = v19;
      uint64_t v26 = 0;
LABEL_15:
      id v38 = [v23 navigateToTrophyCaseAnimated:0 initialAchievement:v25 shouldShowCelebration:v26 forModalPresentation:1];

      goto LABEL_21;
    case 5:
      _HKInitializeLogging();
      v39 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v47 = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Presenting for goal update", v47, 2u);
      }
      v40 = [(PhoneSceneDelegate *)self _parseGoalRecommendation:v7];
      id v41 = [(PhoneSceneDelegate *)self activityTileNavController];
      [v41 dismissViewControllerAnimated:0 completion:0];

      uint64_t v42 = [(PhoneSceneDelegate *)self activityTileNavController];
      id v43 = [v42 popToRootViewControllerAnimated:0];

      v44 = [(PhoneSceneDelegate *)self activityDashboardViewController];
      id v45 = [v44 showTodayAndShareImmediately:0 animated:0 forGoalCompleteNotification:0 goalRecommendation:v40];

      [(PhoneSceneDelegate *)self _clearWeeklyGoalDisplayContext];
      goto LABEL_19;
    default:
LABEL_19:
      _HKInitializeLogging();
      id v46 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
        sub_10071D3DC(v9, v46);
      }
LABEL_21:

      return;
  }
}

- (id)_parseGoalRecommendation:(id)a3
{
  if (a3)
  {
    CFStringRef v3 = [a3 objectForKeyedSubscript:FCCNotificationTypeUserInfoGoalRecommendationKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
        sub_10071D488();
      }
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_clearWeeklyGoalDisplayContext
{
  id v2 = objc_alloc_init((Class)FCCWeeklyGoalStore);
  [v2 clearContext];
}

- (void)_setSelectedViewController:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 50000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001669D0;
  v7[3] = &unk_1008ABB38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  if ([(PhoneSceneDelegate *)self isMirroringSessionActive])
  {
    _HKInitializeLogging();
    dispatch_time_t v5 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Intercepting Navigation to Settings because a Mirrored workout is running", buf, 2u);
    }
  }
  else
  {
    id v6 = [(PhoneSceneDelegate *)self activityTileNavController];
    [(PhoneSceneDelegate *)self _resetToViewController:v6];

    id v7 = [(PhoneSceneDelegate *)self activityDashboardViewController];
    [v7 presentAppSettingsShowingPane:1];
  }
}

- (void)_ppt_showSharingTab
{
  id v3 = [(PhoneSceneDelegate *)self activitySharingViewController];
  [(PhoneSceneDelegate *)self _resetToViewController:v3];
}

- (void)presentModelOnSummaryTabWithViewController:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(PhoneSceneDelegate *)self activityTileNavController];
  id v6 = [v5 presentedViewController];

  if (v6)
  {
    _HKInitializeLogging();
    id v7 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      unsigned int v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Summary tab is already presenting modal view %@, can't present discovery sheet", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    id v8 = [(PhoneSceneDelegate *)self activityTileNavController];
    [v8 presentViewController:v4 animated:1 completion:0];
  }
}

- (void)presentBrowsingConsentAlertWithCompletion:(id)a3
{
  id v4 = a3;
  [(PhoneSceneDelegate *)self setBrowsingConsentAlertCompletion:v4];
  objc_initWeak(&location, self);
  dispatch_time_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"CONNECT_BUTTON" value:&stru_1008D8AB8 table:@"Localizable-seymour"];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"PHONE_TV_CONSENT" value:&stru_1008D8AB8 table:@"Localizable-seymour"];
  int v9 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:1];
  [(PhoneSceneDelegate *)self setBrowsingConsentAlertController:v9];

  unsigned int v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"CONTINUE_BUTTON" value:&stru_1008D8AB8 table:@"Localizable-seymour"];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100167034;
  v22[3] = &unk_1008ADB00;
  objc_copyWeak(&v23, &location);
  id v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v22];

  id v13 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v14 = [v13 localizedStringForKey:@"CANCEL_BUTTON" value:&stru_1008D8AB8 table:@"Localizable-seymour"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001670F4;
  v20[3] = &unk_1008ADB00;
  objc_copyWeak(&v21, &location);
  int64_t v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:v20];

  uint64_t v16 = [(PhoneSceneDelegate *)self browsingConsentAlertController];
  [v16 addAction:v12];

  unsigned int v17 = [(PhoneSceneDelegate *)self browsingConsentAlertController];
  [v17 addAction:v15];

  v18 = [(PhoneSceneDelegate *)self tabBarController];
  unsigned int v19 = [(PhoneSceneDelegate *)self browsingConsentAlertController];
  [v18 presentViewController:v19 animated:1 completion:0];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)cleanupGuestAuthentication
{
  id v3 = [(PhoneSceneDelegate *)self browsingConsentAlertCompletion];

  if (v3)
  {
    id v4 = [(PhoneSceneDelegate *)self browsingConsentAlertCompletion];
    v4[2](v4, 0);

    [(PhoneSceneDelegate *)self setBrowsingConsentAlertCompletion:0];
    dispatch_time_t v5 = [(PhoneSceneDelegate *)self tabBarController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
  id v6 = [(PhoneSceneDelegate *)self passwordEnteredHandler];

  if (v6)
  {
    id v8 = [(PhoneSceneDelegate *)self passwordController];
    id v7 = [v8 passwordEntryCancelledHandler];
    v7[2]();
  }
}

- (void)promptForPasscodeWithLength:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  [(PhoneSceneDelegate *)self setPasswordEnteredHandler:v6];
  objc_initWeak(&location, self);
  id v7 = objc_alloc((Class)SMUPasswordController);
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  int v9 = [v8 localizedStringForKey:@"TV_CODE_TITLE" value:&stru_1008D8AB8 table:@"Localizable-seymour"];
  id v10 = [v7 initWithTitle:v9 passwordLength:a3 supportedOrientations:2];
  [(PhoneSceneDelegate *)self setPasswordController:v10];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100167510;
  v18[3] = &unk_1008AE000;
  v19[1] = (id)a3;
  objc_copyWeak(v19, &location);
  id v11 = [(PhoneSceneDelegate *)self passwordController];
  [v11 setPasswordEnteredHandler:v18];

  objc_copyWeak(&v17, &location);
  id v12 = [(PhoneSceneDelegate *)self passwordController];
  [v12 setPasswordEntryCancelledHandler:&v16];

  id v13 = [(PhoneSceneDelegate *)self tabBarController];
  unsigned int v14 = [(PhoneSceneDelegate *)self passwordController];
  int64_t v15 = [v14 viewController];
  [v13 presentViewController:v15 animated:1 completion:0];

  objc_destroyWeak(&v17);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

- (void)ringCelebrationDidBegin
{
  _HKInitializeLogging();
  id v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[HistoryPagingViewControllerDelegate] unhiding rootViewController because celebration video did begin", v5, 2u);
  }
  id v4 = [(PhoneSceneDelegate *)self rootViewController];
  [v4 unhide];
}

- (void)trophyCaseDidBeginCelebration:(id)a3
{
  _HKInitializeLogging();
  id v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[TrophyCaseViewControllerDelegate] unhiding rootViewController because celebration video did begin", v6, 2u);
  }
  dispatch_time_t v5 = [(PhoneSceneDelegate *)self rootViewController];
  [v5 unhide];
}

- (void)onboardingCoordinatorPhaseDidChangeTo:(int64_t)a3
{
  _HKInitializeLogging();
  dispatch_time_t v5 = (void *)HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(PhoneSceneDelegate *)self activityDashboardViewController];
    BOOL presentingOnboarding = self->_presentingOnboarding;
    *(_DWORD *)buf = 134218496;
    int64_t v14 = a3;
    __int16 v15 = 1024;
    BOOL v16 = v7 != 0;
    __int16 v17 = 1024;
    BOOL v18 = presentingOnboarding;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Setup] onboarding coordinator phase did change: %ld, activity app is set up: %d, is presenting onboarding: %d", buf, 0x18u);
  }
  if (a3 == 5)
  {
    int v9 = [(PhoneSceneDelegate *)self activityDashboardViewController];
    id v10 = [v9 viewIfLoaded];
    id v11 = [v10 window];

    if (!v11)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001679C8;
      block[3] = &unk_1008ABA78;
      void block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else if (!self->_presentingOnboarding)
  {
    [(PhoneSceneDelegate *)self _setupOnboarding];
  }
}

- (void)updateWorkoutState:(int64_t)a3 shouldShowTimeout:(BOOL)a4
{
  if (a3)
  {
    if (a4)
    {
      _HKInitializeLogging();
      dispatch_time_t v5 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[dataLink] Showing timeout then bringing down the controller", buf, 2u);
      }
      mirrorViewController = self->_mirrorViewController;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100167C34;
      v16[3] = &unk_1008ABA78;
      v16[4] = self;
      [(WOMirrorViewController *)mirrorViewController showTimeoutDialogWithDismissCompletion:v16];
    }
    else
    {
      [(PhoneSceneDelegate *)self dismissMirrorViewController];
    }
  }
  else
  {
    _HKInitializeLogging();
    id v7 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[dataLink] We are bringing up our controller", buf, 2u);
    }
    id v8 = [WOMirrorViewController alloc];
    int v9 = +[WODataLinkMonitor shared];
    id v10 = [(WOMirrorViewController *)v8 initWithDataLinkMonitor:v9];
    id v11 = self->_mirrorViewController;
    self->_mirrorViewController = v10;

    [(WOMirrorViewController *)self->_mirrorViewController setModalPresentationStyle:0];
    id v12 = [objc_alloc((Class)UINavigationController) initWithRootViewController:self->_mirrorViewController];
    [v12 setModalPresentationStyle:0];
    id v13 = [v12 navigationBar];
    [v13 setHidden:1];

    [v12 setDelegate:self->_mirrorViewController];
    int64_t v14 = [(PhoneSceneDelegate *)self activityTileNavController];
    [(PhoneSceneDelegate *)self _resetToViewController:v14];

    __int16 v15 = [(PhoneSceneDelegate *)self activityTileNavController];
    [v15 presentViewController:v12 animated:1 completion:0];
  }
}

- (void)displayWorkoutNotification:(id)a3
{
}

- (void)dismissMirrorViewController
{
  _HKInitializeLogging();
  id v3 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[dataLink] Bringing down the controller", v6, 2u);
  }
  id v4 = [(WOMirrorViewController *)self->_mirrorViewController presentedViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  [(WOMirrorViewController *)self->_mirrorViewController dismissViewControllerAnimated:1 completion:0];
  mirrorViewController = self->_mirrorViewController;
  self->_mirrorViewController = 0;
}

- (_TtC10FitnessApp26ActivityTileViewController)activityTileViewController
{
  return self->_activityTileViewController;
}

- (void)setActivityTileViewController:(id)a3
{
}

- (void)setFitnessAppContext:(id)a3
{
}

- (AAUIAchievementsDataProvider)achievementsDataProvider
{
  return self->_achievementsDataProvider;
}

- (void)setAchievementsDataProvider:(id)a3
{
}

- (AAUIBadgeImageFactory)badgeImageFactory
{
  return self->_badgeImageFactory;
}

- (void)setBadgeImageFactory:(id)a3
{
}

- (ACHAchievementLocalizationProvider)achievementLocalizationProvider
{
  return self->_achievementLocalizationProvider;
}

- (void)setAchievementLocalizationProvider:(id)a3
{
}

- (FIUIFormattingManager)fitnessUIFormattingManager
{
  return self->_fitnessUIFormattingManager;
}

- (CHWorkoutFormattingManager)workoutFormattingManager
{
  return self->_workoutFormattingManager;
}

- (FIUIModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (void)setWorkoutsDataProvider:(id)a3
{
}

- (CHHistoryDataProvider)historyDataProvider
{
  return self->_historyDataProvider;
}

- (void)setFriendListManager:(id)a3
{
}

- (_TtC10FitnessApp23FriendsSetupCoordinator)friendsSetupCoordinator
{
  return self->_friendsSetupCoordinator;
}

- (ASActivitySharingClient)activitySharingClient
{
  return self->_activitySharingClient;
}

- (void)setActivitySharingClient:(id)a3
{
}

- (void)setActivityDateCache:(id)a3
{
}

- (_TtC10FitnessApp20ActivityDataProvider)activityDataProvider
{
  return self->_activityDataProvider;
}

- (void)setActivityDataProvider:(id)a3
{
}

- (CHNavigator)deeplinkNavigator
{
  return self->_deeplinkNavigator;
}

- (void)setDeeplinkNavigator:(id)a3
{
}

- (_TtC10FitnessApp19BalanceDataProvider)balanceDataProvider
{
  return self->_balanceDataProvider;
}

- (void)setBalanceDataProvider:(id)a3
{
}

- (FIUIPregnancyStateProvider)pregnancyStateProvider
{
  return self->_pregnancyStateProvider;
}

- (_HKWheelchairUseCharacteristicCache)wheelchairUseCache
{
  return self->_wheelchairUseCache;
}

- (UINavigationController)setupNavigationController
{
  return self->_setupNavigationController;
}

- (void)setSetupNavigationController:(id)a3
{
}

- (BOOL)presentingOnboarding
{
  return self->_presentingOnboarding;
}

- (void)setPresentingOnboarding:(BOOL)a3
{
  self->_BOOL presentingOnboarding = a3;
}

- (_TtC10FitnessApp32SeymourDiscoverySheetCoordinator)seymourDiscoverySheetCoordinator
{
  return self->_seymourDiscoverySheetCoordinator;
}

- (void)setSeymourDiscoverySheetCoordinator:(id)a3
{
}

- (void)setTrendsAvailabilityManager:(id)a3
{
}

- (_TtC10FitnessApp38SeymourNotificationResponseCoordinator)seymourNotificationResponseCoordinator
{
  return self->_seymourNotificationResponseCoordinator;
}

- (void)setSeymourNotificationResponseCoordinator:(id)a3
{
}

- (void)setAppBadgeAggregator:(id)a3
{
}

- (CHNavigationTracker)navigationTracker
{
  return self->_navigationTracker;
}

- (CHLoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (int)fitnessWeekRedefinedChangeToken
{
  return self->_fitnessWeekRedefinedChangeToken;
}

- (void)setFitnessWeekRedefinedChangeToken:(int)a3
{
  self->_int fitnessWeekRedefinedChangeToken = a3;
}

- (int)standalonePhoneFitnessModeChangeToken
{
  return self->_standalonePhoneFitnessModeChangeToken;
}

- (void)setStandalonePhoneFitnessModeChangeToken:(int)a3
{
  self->_int standalonePhoneFitnessModeChangeToken = a3;
}

- (id)browsingConsentAlertCompletion
{
  return self->_browsingConsentAlertCompletion;
}

- (void)setBrowsingConsentAlertCompletion:(id)a3
{
}

- (id)passwordEnteredHandler
{
  return self->_passwordEnteredHandler;
}

- (void)setPasswordEnteredHandler:(id)a3
{
}

- (UIAlertController)browsingConsentAlertController
{
  return self->_browsingConsentAlertController;
}

- (void)setBrowsingConsentAlertController:(id)a3
{
}

- (SMUPasswordController)passwordController
{
  return self->_passwordController;
}

- (void)setPasswordController:(id)a3
{
}

- (WOMirrorViewController)mirrorViewController
{
  return self->_mirrorViewController;
}

- (void)setMirrorViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirrorViewController, 0);
  objc_storeStrong((id *)&self->_passwordController, 0);
  objc_storeStrong((id *)&self->_browsingConsentAlertController, 0);
  objc_storeStrong(&self->_passwordEnteredHandler, 0);
  objc_storeStrong(&self->_browsingConsentAlertCompletion, 0);
  objc_storeStrong((id *)&self->_onboardingCoordinator, 0);
  objc_storeStrong((id *)&self->_connectionOptions, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_seymourNavController, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_activityTileNavController, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_navigationTracker, 0);
  objc_storeStrong((id *)&self->_appBadgeAggregator, 0);
  objc_storeStrong((id *)&self->_seymourNotificationResponseCoordinator, 0);
  objc_storeStrong((id *)&self->_seymourAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_trendsAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_seymourDiscoverySheetCoordinator, 0);
  objc_storeStrong((id *)&self->_setupNavigationController, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCache, 0);
  objc_storeStrong((id *)&self->_pregnancyStateProvider, 0);
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
  objc_storeStrong((id *)&self->_balanceDataProvider, 0);
  objc_storeStrong((id *)&self->_deeplinkNavigator, 0);
  objc_storeStrong((id *)&self->_activityDataProvider, 0);
  objc_storeStrong((id *)&self->_activityDateCache, 0);
  objc_storeStrong((id *)&self->_activitySharingClient, 0);
  objc_storeStrong((id *)&self->_friendsSetupCoordinator, 0);
  objc_storeStrong((id *)&self->_friendManager, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);
  objc_storeStrong((id *)&self->_historyDataProvider, 0);
  objc_storeStrong((id *)&self->_workoutsDataProvider, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_workoutFormattingManager, 0);
  objc_storeStrong((id *)&self->_fitnessUIFormattingManager, 0);
  objc_storeStrong((id *)&self->_achievementLocalizationProvider, 0);
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_achievementsDataProvider, 0);
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_activitySharingViewController, 0);
  objc_storeStrong((id *)&self->_activityTileViewController, 0);
  objc_storeStrong((id *)&self->_activityDashboardViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);

  objc_storeStrong((id *)&self->_tvConnectionManager, 0);
}

@end