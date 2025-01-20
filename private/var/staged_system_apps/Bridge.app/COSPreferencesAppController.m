@interface COSPreferencesAppController
+ (BOOL)_shouldUseAlertControllerForLegacyAlerts;
+ (BOOL)hasUpdateAvailable;
+ (id)getActiveDevice;
- (BKSApplicationStateMonitor)appStateMonitor;
- (BKSProcessAssertion)suspendAssertion;
- (BOOL)_devicePickerBeingPresented;
- (BOOL)_forceComplexTopLevel;
- (BOOL)_isProductKitUrl:(id)a3;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)automationFlowPressed;
- (BOOL)backgrounded;
- (BOOL)deviceIsBeingMigrated;
- (BOOL)devicePickerPresented;
- (BOOL)dismissSetupInProgress;
- (BOOL)dismissUnpairUIOnPresentation;
- (BOOL)firstLaunch;
- (BOOL)iPhoneMirroringEnabled;
- (BOOL)isActivated;
- (BOOL)isActivelyPairing;
- (BOOL)isBeamBridgeReachable;
- (BOOL)isEitherPhoneOrActiveWatchGreenTeaDevice;
- (BOOL)isInSetupFlow;
- (BOOL)isLanguageAndLocaleFinished;
- (BOOL)isRestoringToKnownDevice;
- (BOOL)isTinkerSwitching;
- (BOOL)isUpdatingGizmoInSetupFlow;
- (BOOL)isUpdatingInRevLock;
- (BOOL)launchedByNanoRegistry;
- (BOOL)newTinkerAccountCreated;
- (BOOL)onlySatellitePairedAndInactive;
- (BOOL)pendingUnpairUIPresentation;
- (BOOL)pendingUnpairingVCDismissal;
- (BOOL)resetSetupInProgress;
- (BOOL)revLockEnabled;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (BOOL)shouldConsiderHoldingSuspendAssertion;
- (BOOL)shouldShowWatchPicker;
- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5;
- (BOOL)syncTrapUICompleted;
- (BOOL)syncTrapUIEnabled;
- (BOOL)waitForActiveDeviceReady;
- (BPSNTKCustomization)ntkCustomization;
- (COSGetStartedViewController)getStartedViewController;
- (COSPreferencesAppController)init;
- (COSPreferencesRootController)settingsController;
- (COSProfileInstallHelper)profileInstallHelper;
- (COSSetupController)setupController;
- (COSSoftwareUpdateController)updateController;
- (COSUnpairingViewController)unpairingVC;
- (FBSDisplayLayoutMonitor)monitor;
- (NPSDomainAccessor)activeWatchBridgeDomainAccessor;
- (NRActiveDeviceAssertion)activeWatchAssertion;
- (NRDevice)activeWatch;
- (NRDevice)displayDevice;
- (NSMutableDictionary)cachedDeviceNames;
- (NSMutableDictionary)discoveryAssetPullRequests;
- (NSTimer)idleNotificationTimer;
- (NSTimer)taskCompletionTimeout;
- (NSUserActivity)galleryTTRUserActivity;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)inactiveDeviceTimerSource;
- (PBBridgeCompanionController)bridgeController;
- (PSSplitViewController)settingsSplitViewController;
- (UIAlertController)transportReachabilityAlert;
- (UINavigationController)devicePickerNavigationController;
- (UINavigationController)discoverNavigationController;
- (UITabBarController)rootViewController;
- (UIViewController)galleryViewController;
- (UIViewController)myWatchViewController;
- (UIViewController)selectedController;
- (UIViewController)selectedTabViewController;
- (UIWindow)window;
- (id)_appSuspendStateDescription;
- (id)_getStartedController;
- (id)_rootControllerForSplitViewController:(id)a3;
- (id)_splitViewControllerForRootController:(id)a3;
- (id)_tabBarController;
- (id)_viewControllers;
- (id)appDelegateOnDismissalBlock;
- (id)bridgeSettingsTabBarItem;
- (id)bridgeUserNotificationCategories;
- (id)cachedNameForDevice:(id)a3;
- (id)currentSpecifierIDPath;
- (id)getLaunchedByValueForURL:(id)a3;
- (id)keyValueDictionaryForURL:(id)a3;
- (id)navigationController;
- (id)oneTimeJumpURL;
- (id)settingsListController;
- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4;
- (id)tinkerUserName;
- (id)urlForActivity:(id)a3;
- (unint64_t)activationRetryCount;
- (unint64_t)activationRetryCountLimit;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (unint64_t)cliftonAvailabilityState;
- (unint64_t)waitToLoadBeforeProcessingURL:(id)a3;
- (unsigned)rootDomainConnect;
- (void)_activateTinkerWatchWithCSN:(id)a3 completionBlock:(id)a4;
- (void)_allowInteractionsWithSettingsControllers:(BOOL)a3;
- (void)_createIdleNotificationTimer;
- (void)_debug_forcePullAssets;
- (void)_deregisterForPowerNotifications;
- (void)_extendBackgroundAssertion;
- (void)_networkingStartNotification:(id)a3;
- (void)_networkingStopNotification:(id)a3;
- (void)_performURLHandlingForRootListController:(id)a3 controller:(id)a4 dictionary:(id)a5 items:(id)a6 controllerNeedsPush:(BOOL)a7;
- (void)_popToTopLevelSettingsAnimated:(BOOL)a3 dismissPresentedViewController:(BOOL)a4;
- (void)_prepareAppearances;
- (void)_prepareForDevicePickerTest;
- (void)_refreshShortCuts;
- (void)_refreshTabBarVisibility;
- (void)_registerForPowerNotifications;
- (void)_schedulePendingAppDelegateIfPresent;
- (void)_scrollToTopOfSettingsAnimated:(BOOL)a3;
- (void)_setOffsetForController:(id)a3 fromObjectPair:(id)a4;
- (void)_showInitialSyncPaneIfNotAlreadyShowing;
- (void)_showTinkerSwitchFailureModalForDevice:(id)a3;
- (void)_starDevicePickerRotationTestWithOptions:(id)a3;
- (void)_startFaceGalleryScrollTestWithOptions:(id)a3;
- (void)_startTopLevelScrollTestComplex:(BOOL)a3 options:(id)a4;
- (void)_testScrollTest:(id)a3 onScrollView:(id)a4;
- (void)_tintTabBarWithViewController:(id)a3;
- (void)_updateAppStoreRowForRepair;
- (void)application:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)application:(id)a3 didUpdateUserActivity:(id)a4;
- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)cancelTinkerSwitch:(id)a3;
- (void)checkForBrokenDeviceAssertion;
- (void)checkIDSReachability;
- (void)checkIfNRRetriggerConditions;
- (void)clearBridgeSettingsTabBarItemBadge;
- (void)clearCachedNameForDevice:(id)a3;
- (void)configureStartupStateForActiveDevice;
- (void)createDisplayLayoutManager;
- (void)dealloc;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)deviceBecameActive:(id)a3;
- (void)deviceBecameInactive:(id)a3;
- (void)deviceIsSetup:(id)a3;
- (void)deviceSpecificRepairSteps:(id)a3;
- (void)deviceUnpaired:(id)a3;
- (void)didHandlePerformanceResults;
- (void)didTapOnLoadingFaceLibraryButton:(id)a3;
- (void)disagreeToTerms;
- (void)discoveredAdvertisingWatch:(id)a3;
- (void)dismissSetupFlowAnimated:(BOOL)a3;
- (void)dismissSetupFlowAnimated:(BOOL)a3 refreshTabs:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)dismissSetupFlowComplete:(BOOL)a3 animated:(BOOL)a4;
- (void)dismissUnpairingViewControllerAnimated:(BOOL)a3;
- (void)dismissUnpairingViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)doneFollowUp:(id)a3;
- (void)enteredCompatibilityState:(id)a3;
- (void)evaluateIfUpdatingInSetupFlowOnLaunch;
- (void)expireTaskAssertion:(id)a3;
- (void)finishedTest:(id)a3;
- (void)generateURL;
- (void)globalAlertPresentationCoordinator:(id)a3 dismissAlert:(unint64_t)a4 withCompletion:(id)a5;
- (void)globalAlertPresentationCoordinator:(id)a3 presentAlert:(unint64_t)a4 withCompletion:(id)a5;
- (void)globalAlertPresentationCoordinator:(id)a3 syncProgressDidUpdate:(double)a4;
- (void)initialPairingFailed:(id)a3;
- (void)loadSettingsController;
- (void)markGalleryTabAsVisited;
- (void)markGalleryTabAsVisitedIfOnGalleryTab;
- (void)messageSendFailed:(id)a3;
- (void)nanoRegistryStatusChanged:(id)a3;
- (void)navigateToRootObjectWithURLDictionary:(id)a3 animated:(BOOL)a4;
- (void)newerCompanionRequired;
- (void)pairingFailed:(id)a3;
- (void)performDeviceSpecificRepairStepsForActiveDevice;
- (void)performTasksOnActiveDeviceUpdate;
- (void)pingWatch;
- (void)popToRootOfSettingsSelectGeneral:(BOOL)a3;
- (void)popToRootOfSettingsSelectGeneral:(BOOL)a3 performWithoutDeferringTransitions:(BOOL)a4;
- (void)popToTopLevelSettingsAnimated:(BOOL)a3;
- (void)postIdleNotification:(id)a3;
- (void)presentDevicePicker;
- (void)presentDevicePicker:(BOOL)a3;
- (void)presentDevicePickerControllerWith:(BOOL)a3;
- (void)presentGetConnectedAlertIfNeeded;
- (void)presentGetConnectedAlertIfNeededWithCompletion:(id)a3;
- (void)presentGreenfieldViewControllerWithUrl:(id)a3 options:(id)a4;
- (void)presentMigrationConnectionFailedAlert;
- (void)presentNewPairingFlowIfPossible;
- (void)presentNewPairingFlowIfPossibleWithAnimation:(BOOL)a3;
- (void)presentSetupFlowAnimated:(BOOL)a3;
- (void)presentSetupFlowWithMode:(unint64_t)a3 animated:(BOOL)a4;
- (void)presentUnpairingViewControllerAnimated:(BOOL)a3;
- (void)presentingControllerForModalByDismissingTopAlertIfPresentWithCompletion:(id)a3;
- (void)prewarmiCloudBackups;
- (void)processURL:(id)a3;
- (void)processURL:(id)a3 animated:(BOOL)a4 fromSearch:(BOOL)a5;
- (void)pullPairedWatchAssets;
- (void)reachability:(id)a3 device:(id)a4 connectionStatus:(unint64_t)a5;
- (void)refreshActiveWatchFromNanoRegistry;
- (void)refreshTabBar;
- (void)refreshUpdateBadge;
- (void)refreshUpdateBadgeWithTab:(id)a3;
- (void)registerForUserNotifications;
- (void)reloadAppearance:(id)a3;
- (void)remoteDidFailActivation:(unint64_t)a3 description:(id)a4;
- (void)remoteDidFailActivation:(unint64_t)a3 description:(id)a4 userActionable:(BOOL)a5;
- (void)remoteFinishedHealthSharingOptInWithSelection:(BOOL)a3;
- (void)removeActiveDeviceAssertionFor:(id)a3;
- (void)removeActiveDeviveAssertionIfNotActive;
- (void)reportTabState:(id)a3;
- (void)resetActivationFailureCountAndReport:(BOOL)a3;
- (void)resetFlowForCameraExpiry;
- (void)resetSettingsUIToHomeScreen;
- (void)resetSetupFlowAnimated:(BOOL)a3 forEvent:(unint64_t)a4;
- (void)resetSetupFlowInternalSettings;
- (void)resetSuspendAssertion;
- (void)retriggerNRAlertIfNeeded;
- (void)screenshotService:(id)a3 generatePDFRepresentationWithCompletion:(id)a4;
- (void)setActivationRetryCount:(unint64_t)a3;
- (void)setActivationRetryCountLimit:(unint64_t)a3;
- (void)setActiveWatch:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5;
- (void)setActiveWatchAssertion:(id)a3;
- (void)setAppDelegateOnDismissalBlock:(id)a3;
- (void)setAppStateMonitor:(id)a3;
- (void)setAutomationFlowPressed:(BOOL)a3;
- (void)setBackgrounded:(BOOL)a3;
- (void)setBridgeController:(id)a3;
- (void)setCachedDeviceNames:(id)a3;
- (void)setCachedName:(id)a3 forDevice:(id)a4;
- (void)setCliftonAvailabilityState:(unint64_t)a3;
- (void)setDeviceIsBeingMigrated:(BOOL)a3;
- (void)setDevicePickerNavigationController:(id)a3;
- (void)setDevicePickerPresented:(BOOL)a3;
- (void)setDiscoverNavigationController:(id)a3;
- (void)setDiscoveryAssetPullRequests:(id)a3;
- (void)setDismissSetupInProgress:(BOOL)a3;
- (void)setDismissUnpairUIOnPresentation:(BOOL)a3;
- (void)setFirstLaunch:(BOOL)a3;
- (void)setGalleryTTRUserActivity:(id)a3;
- (void)setGalleryViewController:(id)a3;
- (void)setGetStartedViewController:(id)a3;
- (void)setIPhoneMirroringEnabled:(BOOL)a3;
- (void)setIdleNotificationTimer:(id)a3;
- (void)setInactiveDeviceTimerSource:(id)a3;
- (void)setIsActivated:(BOOL)a3;
- (void)setIsBeamBridgeReachable:(BOOL)a3;
- (void)setIsLanguageAndLocaleFinished:(BOOL)a3;
- (void)setIsRestoringToKnownDevice:(BOOL)a3;
- (void)setIsTinkerSwitching:(BOOL)a3;
- (void)setIsUpdatingGizmoInSetupFlow:(BOOL)a3;
- (void)setIsUpdatingInRevLock:(BOOL)a3;
- (void)setLaunchedByNanoRegistry:(BOOL)a3;
- (void)setMonitor:(id)a3;
- (void)setMyWatchViewController:(id)a3;
- (void)setNewTinkerAccountCreated:(BOOL)a3;
- (void)setPendingUnpairUIPresentation:(BOOL)a3;
- (void)setPendingUnpairingVCDismissal:(BOOL)a3;
- (void)setProfileInstallHelper:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResetSetupInProgress:(BOOL)a3;
- (void)setRevLockEnabled:(BOOL)a3;
- (void)setRootDomainConnect:(unsigned int)a3;
- (void)setRootViewController:(id)a3;
- (void)setSelectedController:(id)a3;
- (void)setSelectedTabBarViewController:(id)a3;
- (void)setSelectedTabViewController:(id)a3;
- (void)setSetupController:(id)a3;
- (void)setSuspendAssertion:(id)a3;
- (void)setSyncTrapUICompleted:(BOOL)a3;
- (void)setSyncTrapUIEnabled:(BOOL)a3;
- (void)setTaskCompletionTimeout:(id)a3;
- (void)setTransportReachabilityAlert:(id)a3;
- (void)setUnpairingVC:(id)a3;
- (void)setUpdateController:(id)a3;
- (void)setWaitForActiveDeviceReady:(BOOL)a3;
- (void)setWindow:(id)a3;
- (void)sizeCategoryDidChange:(id)a3;
- (void)splitViewControllerDidPopToRootController:(id)a3;
- (void)startScanningForNearbyDevices;
- (void)startedTest:(id)a3;
- (void)successfullyBeganUnpairingWatch;
- (void)switchToDevice:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5;
- (void)systemDidWake:(id)a3;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)tappedStart;
- (void)tappedStartForMode:(unint64_t)a3;
- (void)tappedStartForMode:(unint64_t)a3 withAnimation:(BOOL)a4;
- (void)tappedStartInternal;
- (void)testPrep:(id)a3 options:(id)a4;
- (void)transportBecameReachable;
- (void)transportBecameUnreachable;
- (void)unpairOrResetBuddyForEvent:(unint64_t)a3;
- (void)updateActiveWatch:(id)a3;
- (void)updateActiveWatchBridgeDomainAccessor;
- (void)updateForRemoteActivity:(id)a3;
- (void)updateNRStatusForPresentingOrDismissingUnpairingUI:(unint64_t)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
- (void)versionOrCapabilitiesChanged:(id)a3;
@end

@implementation COSPreferencesAppController

- (id)bridgeUserNotificationCategories
{
  v2 = +[UNNotificationCategory categoryWithIdentifier:@"com.apple.Bridge.pairing" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:0];
  v3 = +[NSSet setWithObject:v2];

  return v3;
}

- (unint64_t)waitToLoadBeforeProcessingURL:(id)a3
{
  v3 = [a3 absoluteString];
  unsigned int v4 = [v3 containsString:@"NOTIFICATIONS_ID"];

  return v4;
}

- (void)updateActiveWatch:(id)a3
{
  v5 = (NRDevice *)a3;
  p_activeWatch = &self->_activeWatch;
  activeWatch = self->_activeWatch;
  if (activeWatch != v5)
  {
    if (activeWatch) {
      [(NRDevice *)activeWatch removePropertyObserver:self forPropertyChanges:0];
    }
    v8 = pbb_bridge_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(NRDevice *)*p_activeWatch _bridgeConciseDebugDescription];
      v10 = [(NRDevice *)v5 _bridgeConciseDebugDescription];
      *(_DWORD *)buf = 134218498;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v9;
      __int16 v22 = 2112;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%p) Replace Active Device (%@) with (%@)", buf, 0x20u);
    }
    objc_storeStrong((id *)&self->_activeWatch, a3);
    v11 = +[BPSBridgeAppContext shared];
    [v11 setActiveDevice:v5];

    v12 = *p_activeWatch;
    v17[0] = NRDevicePropertySystemVersion;
    v17[1] = _NRDevicePropertyCapabilities;
    v17[2] = NRDevicePropertyName;
    v13 = +[NSArray arrayWithObjects:v17 count:3];
    [(NRDevice *)v12 addPropertyObserver:self forPropertyChanges:v13];

    [(COSPreferencesAppController *)self updateActiveWatchBridgeDomainAccessor];
    [(COSPreferencesAppController *)self configureStartupStateForActiveDevice];
    v14 = +[NRPairedDeviceRegistry sharedInstance];
    id v15 = [v14 status];

    if (v15 == (id)2)
    {
      self->_waitForActiveDeviceReady = 0;
      [(COSPreferencesAppController *)self performTasksOnActiveDeviceUpdate];
    }
    else
    {
      v16 = pbb_bridge_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v19 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "(%p) waiting for active device to be ready", buf, 0xCu);
      }

      self->_waitForActiveDeviceReady = 1;
    }
  }
}

- (void)_registerForPowerNotifications
{
  if (!self->_pmSource)
  {
    p_systemPowerPortRef = &self->_systemPowerPortRef;
    self->_systemPowerPortRef = 0;
    self->_rootDomainConnect = IORegisterForSystemPower(self, &self->_systemPowerPortRef, (IOServiceInterestCallback)sub_1000AF05C, &self->_pmNotifier);
    RunLoopSource = IONotificationPortGetRunLoopSource(*p_systemPowerPortRef);
    self->_pmSource = RunLoopSource;
    CFRetain(RunLoopSource);
    Current = CFRunLoopGetCurrent();
    pmSource = self->_pmSource;
    CFRunLoopAddSource(Current, pmSource, kCFRunLoopDefaultMode);
  }
}

- (id)getLaunchedByValueForURL:(id)a3
{
  v3 = [a3 resourceSpecifier];
  unsigned int v4 = [v3 componentsSeparatedByString:@"launchedBy="];

  v5 = [v4 lastObject];

  return v5;
}

- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 viewControllers];
    BOOL v7 = [v6 count] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_tabBarController
{
  rootViewController = self->_rootViewController;
  if (!rootViewController)
  {
    unsigned int v4 = (UITabBarController *)[objc_alloc((Class)UITabBarController) initWithNibName:0 bundle:0];
    id v5 = self->_rootViewController;
    self->_rootViewController = v4;

    [(UITabBarController *)self->_rootViewController setDelegate:self];
    v6 = [(UITabBarController *)self->_rootViewController tabBar];
    sub_10000AFA8(v6);

    rootViewController = self->_rootViewController;
  }

  return rootViewController;
}

- (void)resetSuspendAssertion
{
  v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[COSPreferencesAppController resetSuspendAssertion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  [(NSTimer *)self->_taskCompletionTimeout invalidate];
  taskCompletionTimeout = self->_taskCompletionTimeout;
  self->_taskCompletionTimeout = 0;

  if (self->_suspendAssertion)
  {
    id v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      suspendAssertion = self->_suspendAssertion;
      int v8 = 138412290;
      v9 = (const char *)suspendAssertion;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Releasing background assertion ID %@", (uint8_t *)&v8, 0xCu);
    }

    [(BKSProcessAssertion *)self->_suspendAssertion invalidate];
    BOOL v7 = self->_suspendAssertion;
    self->_suspendAssertion = 0;
  }
}

- (void)refreshUpdateBadgeWithTab:(id)a3
{
  id v3 = a3;
  if (qword_10029B180 != -1) {
    dispatch_once(&qword_10029B180, &stru_100245F18);
  }
  if (+[COSPreferencesAppController hasUpdateAvailable])
  {
    id v4 = objc_alloc_init((Class)NSNumberFormatter);
    [v4 setNumberStyle:0];
    id v5 = [v4 stringFromNumber:&off_10025C118];
  }
  else
  {
    id v5 = 0;
  }
  [v3 setBadgeValue:v5];
  v6 = +[UNUserNotificationCenter currentNotificationCenter];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000707C;
  v7[3] = &unk_100245F38;
  BOOL v8 = v5 != 0;
  [v6 setBadgeCount:v8 withCompletionHandler:v7];
}

- (void)_tintTabBarWithViewController:(id)a3
{
  id v4 = +[UIApplication sharedApplication];
  [v4 setStatusBarStyle:1];

  id v6 = [(COSPreferencesAppController *)self rootViewController];
  id v5 = [v6 tabBar];
  sub_10000AFA8(v5);
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v4 = a4;
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "application:willFinishLaunchingWithOptions: - %@", (uint8_t *)&v7, 0xCu);
  }

  return 1;
}

- (void)presentGetConnectedAlertIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"DisableGetConnectedAlert"];

  if (!v6)
  {
    int v7 = MGGetBoolAnswer();
    id v8 = +[COSReachabilityMonitor sharedMonitor];
    unsigned int v9 = [v8 isNetworkReachable];

    if (PBHasSetupDevice())
    {
      if (v7)
      {
        if ((+[PSBluetoothSettingsDetail isEnabled] & v9 & 1) == 0)
        {
LABEL_5:
          v10 = +[NSBundle mainBundle];
          v11 = [v10 localizedStringForKey:@"GET_CONNECTED_ALERT_TITLE" value:&stru_100249230 table:@"Localizable"];
          v12 = +[NSBundle mainBundle];
          v13 = SFLocalizableWAPIStringKeyForKey();
          v14 = [v12 localizedStringForKey:v13 value:&stru_100249230 table:@"Localizable"];
          id v15 = +[UIAlertController alertControllerWithTitle:v11 message:v14 preferredStyle:1];

          v16 = +[NSBundle mainBundle];
          v17 = [v16 localizedStringForKey:@"GET_CONNECTED_ALERT_CANCEL" value:&stru_100249230 table:@"Localizable"];
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_1000A6488;
          v28[3] = &unk_100245850;
          id v18 = v4;
          id v29 = v18;
          v19 = +[UIAlertAction actionWithTitle:v17 style:1 handler:v28];
          [v15 addAction:v19];

          __int16 v20 = +[NSBundle mainBundle];
          v21 = [v20 localizedStringForKey:@"GET_CONNECTED_ALERT_TURN_ON" value:&stru_100249230 table:@"Localizable"];
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_1000A64A4;
          v26[3] = &unk_100245850;
          id v27 = v18;
          __int16 v22 = +[UIAlertAction actionWithTitle:v21 style:0 handler:v26];
          [v15 addAction:v22];

          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1000A6514;
          v24[3] = &unk_100245DD0;
          id v25 = v15;
          id v23 = v15;
          [(COSPreferencesAppController *)self presentingControllerForModalByDismissingTopAlertIfPresentWithCompletion:v24];

          goto LABEL_9;
        }
      }
      else if ((v9 & 1) == 0)
      {
        goto LABEL_5;
      }
    }
  }
  if (v4) {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
LABEL_9:
}

- (void)startedTest:(id)a3
{
  id v4 = a3;
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Started %@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)COSPreferencesAppController;
  [(COSPreferencesAppController *)&v6 startedTest:v4];
}

- (void)retriggerNRAlertIfNeeded
{
  BOOL launchedByNanoRegistry = self->_launchedByNanoRegistry;
  id v4 = pbb_bridge_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (launchedByNanoRegistry)
  {
    if (v5)
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Skipped showing NRPairedDeviceRegistry retriggerUnpairInfoDialog", v6, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NRPairedDeviceRegistry retriggerUnpairInfoDialog dispatched", buf, 2u);
    }

    id v4 = dispatch_get_global_queue(21, 0);
    dispatch_async(v4, &stru_100245EF8);
  }

  self->_BOOL launchedByNanoRegistry = 0;
}

- (void)prewarmiCloudBackups
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Prewarm backups", v4, 2u);
  }

  id v3 = +[COSBackupManager sharedBackupManager];
  [v3 reloadiCloudBackups];
}

- (void)createDisplayLayoutManager
{
  id v3 = +[FBSDisplayLayoutMonitorConfiguration configurationForContinuityDisplay];
  objc_initWeak(&location, self);
  int v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  unsigned int v9 = sub_100008030;
  v10 = &unk_100245D68;
  objc_copyWeak(&v11, &location);
  [v3 setTransitionHandler:&v7];
  monitor = self->_monitor;
  if (monitor) {
    [(FBSDisplayLayoutMonitor *)monitor invalidate];
  }
  +[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v3, v7, v8, v9, v10);
  BOOL v5 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
  objc_super v6 = self->_monitor;
  self->_monitor = v5;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)pullPairedWatchAssets
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = sub_100014784();
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      objc_super v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v6);
        id v8 = objc_alloc_init((Class)PBBridgeAssetsManager);
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_1000A5268;
        v9[3] = &unk_100244CE0;
        v9[4] = v7;
        [v8 beginPullingAssetsForDevice:v7 completion:v9];

        objc_super v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)reportTabState:(id)a3
{
  id v4 = (UINavigationController *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_13;
  }
  if ((UINavigationController *)self->_myWatchViewController == v4)
  {
    uint64_t v7 = 1;
LABEL_12:
    id v8 = sub_100005DC4();
    id v9 = [v8 count];

    long long v10 = sub_10001284C();
    id v11 = [v10 count];

    +[PBBridgeCAReporter recordTabSelection:v7 classicCount:v9 tinkerCount:v11];
    goto LABEL_13;
  }
  if ((UINavigationController *)self->_galleryViewController == v4)
  {
    uint64_t v7 = 2;
    goto LABEL_12;
  }
  if (self->_discoverNavigationController == v4)
  {
    uint64_t v7 = 3;
    goto LABEL_12;
  }
  objc_super v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unknown Tab State - Skipping CA Reporting", v12, 2u);
  }

LABEL_13:
}

- (BOOL)shouldShowWatchPicker
{
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v3 = sub_10000CF90();
  id v4 = [v3 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v4)
  {
    id v5 = v4;
    v26 = self;
    id obj = v3;
    int v6 = 0;
    char v7 = 0;
    int v8 = 0;
    uint64_t v32 = *(void *)v34;
    uint64_t v31 = NRDevicePropertyIsArchived;
    uint64_t v30 = NRDevicePropertyIsSetup;
    uint64_t v29 = NRDevicePropertyIsAltAccount;
    uint64_t v28 = NRDevicePropertyIsActive;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v11 = [v10 valueForProperty:v31];
        unsigned int v12 = [v11 BOOLValue];

        long long v13 = [v10 valueForProperty:v30];
        unsigned int v14 = [v13 BOOLValue];

        uint64_t v15 = [v10 valueForProperty:v29];
        unsigned int v16 = [(id)v15 BOOLValue];

        v17 = [v10 valueForProperty:v28];
        LOBYTE(v15) = [v17 BOOLValue];

        v8 |= v16;
        char v18 = v15 & (v12 ^ 1);
        if (!v14) {
          char v18 = 0;
        }
        v7 |= v18;
        v6 |= v12;
      }
      id v5 = [obj countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v5);

    if (v7)
    {
      self = v26;
      int isUpdatingInRevLock = v26->_isUpdatingInRevLock;
      int v20 = 1;
      goto LABEL_15;
    }
    self = v26;
  }
  else
  {

    int v8 = 0;
    int v6 = 0;
  }
  int v20 = 0;
  int isUpdatingInRevLock = (v6 | v8) & 1;
LABEL_15:
  int v21 = isUpdatingInRevLock | PBisInMigrationSync();
  __int16 v22 = pbb_setupflow_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v23 = self->_isUpdatingInRevLock;
    int v24 = PBisInMigrationSync();
    *(_DWORD *)buf = 67110400;
    int v38 = v8 & 1;
    __int16 v39 = 1024;
    int v40 = v20;
    __int16 v41 = 1024;
    int v42 = v6 & 1;
    __int16 v43 = 1024;
    BOOL v44 = v23;
    __int16 v45 = 1024;
    int v46 = v24;
    __int16 v47 = 1024;
    BOOL v48 = v21 != 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "FoundTinker: %{BOOL}d foundClassicActivePairedWatch: %{BOOL}d foundArchived: %{BOOL}d _isUpdatingInRevLock: %{BOOL}d PBisInMigrationSync: %{BOOL}d ==> showPicker: %{BOOL}d", buf, 0x26u);
  }

  return v21 != 0;
}

- (void)_refreshShortCuts
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = 357;
    __int16 v6 = 2080;
    char v7 = "-[COSPreferencesAppController _refreshShortCuts]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v5, 0x12u);
  }

  id v3 = +[COSShortcutController sharedController];
  id v4 = [v3 shortcutItems];
  [UIApp setShortcutItems:v4];
}

- (void)evaluateIfUpdatingInSetupFlowOnLaunch
{
  id v3 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  id v4 = [v3 valueForProperty:_NRDevicePropertyCompatibilityState];
  unsigned __int16 v5 = (unsigned __int16)[v4 intValue];

  __int16 v6 = +[NRPairedDeviceRegistry sharedInstance];
  id v7 = [v6 status];

  int v8 = pbb_bridge_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    unsigned int v12 = "-[COSPreferencesAppController evaluateIfUpdatingInSetupFlowOnLaunch]";
    __int16 v13 = 2048;
    id v14 = v7;
    __int16 v15 = 1024;
    int v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Status: %lu State: %d", (uint8_t *)&v11, 0x1Cu);
  }

  if (v7 == (id)1 && (v5 & 0xFFFE) == 2)
  {
    self->_isUpdatingGizmoInSetupFlow = 1;
    [(COSPreferencesAppController *)self setIsActivated:1];
    long long v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      unsigned int v12 = "-[COSPreferencesAppController evaluateIfUpdatingInSetupFlowOnLaunch]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Setting activated", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    CFPreferencesSetAppValue(@"kIsUpdatingFromVersionInSetupFlow", 0, @"com.apple.Bridge");
    CFPreferencesAppSynchronize(@"com.apple.Bridge");
  }
}

- (void)nanoRegistryStatusChanged:(id)a3
{
  id v4 = [a3 userInfo];
  unsigned __int16 v5 = [v4 objectForKey:NRPairedDeviceRegistryStatusKey];

  id v6 = [v5 unsignedIntegerValue];
  id v7 = +[NRPairedDeviceRegistry sharedInstance];
  id v8 = [v7 compatibilityState];

  id v9 = pbb_bridge_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = +[NSNumber numberWithUnsignedShort:v8];
    int v11 = 138412546;
    unsigned int v12 = v5;
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(App) NR Status Changed to %@ with CompatibilityState %@", (uint8_t *)&v11, 0x16u);
  }
  [(COSPreferencesAppController *)self updateNRStatusForPresentingOrDismissingUnpairingUI:v6];
}

- (id)oneTimeJumpURL
{
  v2 = [UIApp activeWatchBridgeDomainAccessor];
  id v3 = [v2 synchronize];
  unsigned __int8 v4 = [v2 BOOLForKey:@"kBadgedForSoftwareUpdateJumpOnceKey"];
  if ([(id)objc_opt_class() hasUpdateAvailable])
  {
    if ((v4 & 1) == 0)
    {
      [v2 setBool:1 forKey:@"kBadgedForSoftwareUpdateJumpOnceKey"];
      id v5 = [v2 synchronize];
      id v6 = +[NSURL URLWithString:@"bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK"];
      goto LABEL_6;
    }
  }
  else
  {
    [v2 removeObjectForKey:@"kBadgedForSoftwareUpdateJumpOnceKey"];
    id v7 = [v2 synchronize];
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

+ (BOOL)hasUpdateAvailable
{
  v2 = [UIApp activeWatchBridgeDomainAccessor];
  id v3 = [v2 synchronize];
  unsigned __int8 v4 = [v2 BOOLForKey:@"kBadgedForSoftwareUpdateKey"];

  return v4;
}

- (NPSDomainAccessor)activeWatchBridgeDomainAccessor
{
  return self->_activeWatchBridgeDomainAccessor;
}

- (void)updateNRStatusForPresentingOrDismissingUnpairingUI:(unint64_t)a3
{
  if (!a3 || a3 == 2)
  {
    [(COSPreferencesAppController *)self dismissUnpairingViewControllerAnimated:1];
    if (a3 == 2)
    {
      if (self->_waitForActiveDeviceReady)
      {
        self->_waitForActiveDeviceReady = 0;
        [(COSPreferencesAppController *)self performTasksOnActiveDeviceUpdate];
      }
      [(COSPreferencesAppController *)self startScanningForNearbyDevices];
    }
  }
  else if (a3 == 5)
  {
    [(COSPreferencesAppController *)self presentUnpairingViewControllerAnimated:1];
  }
}

- (void)dismissUnpairingViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unpairingVC = self->_unpairingVC;
  if (unpairingVC && !self->_pendingUnpairingVCDismissal)
  {
    int v11 = [(COSUnpairingViewController *)unpairingVC presentingViewController];

    if (v11)
    {
      self->_BOOL pendingUnpairingVCDismissal = 1;
      unsigned int v12 = pbb_bridge_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = self->_unpairingVC;
        id v14 = [(COSUnpairingViewController *)v13 presentingViewController];
        *(_DWORD *)buf = 138412546;
        int v21 = (const char *)v13;
        __int16 v22 = 2112;
        BOOL v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Dismissing Unpairing UI :%@  since NR is Ready. Presenting VC: %@", buf, 0x16u);
      }
      objc_initWeak((id *)buf, self);
      __int16 v15 = [(COSUnpairingViewController *)self->_unpairingVC presentingViewController];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000B0B04;
      void v17[3] = &unk_100245690;
      objc_copyWeak(&v19, (id *)buf);
      id v18 = v6;
      [v15 dismissViewControllerAnimated:v4 completion:v17];

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      int v16 = pbb_bridge_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        int v21 = "-[COSPreferencesAppController dismissUnpairingViewControllerAnimated:withCompletion:]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s. Missing presenting VC", buf, 0xCu);
      }

      self->_dismissUnpairUIOnPresentation = 1;
    }
  }
  else
  {
    id v8 = pbb_bridge_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = self->_unpairingVC;
      BOOL pendingUnpairingVCDismissal = self->_pendingUnpairingVCDismissal;
      *(_DWORD *)buf = 136315650;
      int v21 = "-[COSPreferencesAppController dismissUnpairingViewControllerAnimated:withCompletion:]";
      __int16 v22 = 2112;
      BOOL v23 = v9;
      __int16 v24 = 1024;
      BOOL v25 = pendingUnpairingVCDismissal;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Skipping: unpairingVC: %@ pendingUnpairingVCDismissal: %{BOOL}d ", buf, 0x1Cu);
    }
  }
}

- (void)dismissUnpairingViewControllerAnimated:(BOOL)a3
{
}

- (void)processURL:(id)a3
{
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100015FF4;
  v20[3] = &unk_1002453D0;
  v20[4] = self;
  id v4 = a3;
  id v21 = v4;
  id v5 = objc_retainBlock(v20);
  id v6 = [v4 absoluteString];
  unsigned int v7 = [v6 containsString:@"ManagedConfigurationList/InstallRequested"];

  if (!v7)
  {
    id v9 = [v4 absoluteString];
    if ([v9 containsString:@"SOFTWARE_UPDATE_LINK&terms=YES"])
    {
      BOOL processedPositionPath = self->_processedPositionPath;

      if (!processedPositionPath)
      {
        objc_initWeak(&location, self);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1000AE304;
        v14[3] = &unk_1002461C0;
        id v8 = &v15;
        objc_copyWeak(&v15, &location);
        [(COSPreferencesAppController *)self presentingControllerForModalByDismissingTopAlertIfPresentWithCompletion:v14];
        goto LABEL_3;
      }
    }
    else
    {
    }
    dispatch_time_t v11 = dispatch_time(0, 1000000000* [(COSPreferencesAppController *)self waitToLoadBeforeProcessingURL:v4]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015FE0;
    block[3] = &unk_100244668;
    __int16 v13 = v5;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);

    goto LABEL_9;
  }
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000ADF30;
  v16[3] = &unk_100246198;
  id v8 = &v18;
  objc_copyWeak(&v18, &location);
  v17 = v5;
  [(COSPreferencesAppController *)self presentingControllerForModalByDismissingTopAlertIfPresentWithCompletion:v16];

LABEL_3:
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
LABEL_9:
  self->_BOOL processedPositionPath = 0;
}

- (BPSNTKCustomization)ntkCustomization
{
  v2 = self;
  objc_sync_enter(v2);
  p_ntkCustomization = (id *)&v2->_ntkCustomization;
  ntkCustomization = v2->_ntkCustomization;
  if (ntkCustomization)
  {
    id v5 = ntkCustomization;
  }
  else
  {
    objc_sync_exit(v2);

    v2 = v2;
    objc_sync_enter(v2);
    id v6 = +[NSFileManager defaultManager];
    unsigned int v7 = [v6 fileExistsAtPath:@"/System/Library/NanoPreferenceBundles/Customization/NTKCustomization.bundle"];

    if ((sub_10000F6D4() | v7 ^ 1))
    {
      id v5 = 0;
    }
    else
    {
      id v8 = +[NSBundle bundleWithPath:@"/System/Library/NanoPreferenceBundles/Customization/NTKCustomization.bundle"];
      [v8 principalClass];
      id v5 = (BPSNTKCustomization *)objc_opt_new();
      objc_storeStrong(p_ntkCustomization, v5);
    }
  }
  objc_sync_exit(v2);

  id v9 = v5;

  return v9;
}

- (id)keyValueDictionaryForURL:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = [v3 resourceSpecifier];
  id v6 = [v5 componentsSeparatedByString:@"&"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) componentsSeparatedByString:@"="];
        if ([v12 count] == (id)2)
        {
          __int16 v13 = [v12 objectAtIndex:1];
          id v14 = [v13 stringByRemovingPercentEncoding];

          id v15 = [v12 objectAtIndex:0];
          [v4 setObject:v14 forKey:v15];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v4;
}

- (void)loadSettingsController
{
  id v3 = [COSPreferencesRootController alloc];
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"SETTINGS" value:&stru_100249230 table:@"Localizable"];
  id v6 = [(COSPreferencesRootController *)v3 initWithTitle:v5 identifier:@"com.apple.preferences.settings"];
  settingsController = self->_settingsController;
  self->_settingsController = v6;

  [(COSPreferencesRootController *)self->_settingsController setToolbarHidden:1];
  id v8 = [(COSPreferencesRootController *)self->_settingsController navigationBar];
  id v9 = BPSBridgeTintColor();
  [v8 setTintColor:v9];

  id v10 = objc_alloc((Class)UINavigationController);
  dispatch_time_t v11 = [(COSPreferencesRootController *)self->_settingsController rootListController];
  id v12 = [v10 initWithRootViewController:v11];

  __int16 v13 = [(UIWindow *)self->_window traitCollection];
  id v14 = +[UITraitCollection traitCollectionWithHorizontalSizeClass:2];
  unsigned int v15 = [v13 containsTraitsInCollection:v14];

  if (v15)
  {
    int v16 = [(COSPreferencesRootController *)self->_settingsController rootListController];
    long long v17 = [v16 generalViewController];
    BOOL v25 = v17;
    long long v18 = +[NSArray arrayWithObjects:&v25 count:1];
    [(COSPreferencesRootController *)self->_settingsController setViewControllers:v18];
  }
  long long v19 = [v12 navigationBar];
  BPSApplyStyleToNavBarOptions();

  long long v20 = [(COSPreferencesRootController *)self->_settingsController navigationBar];
  BPSApplyStyleToNavBar();

  id v21 = (PSSplitViewController *)objc_alloc_init((Class)PSSplitViewController);
  settingsSplitViewController = self->_settingsSplitViewController;
  self->_settingsSplitViewController = v21;

  if (v15) {
    BOOL v23 = self->_settingsController;
  }
  else {
    BOOL v23 = 0;
  }
  __int16 v24 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v12, v23, 0);
  [(PSSplitViewController *)self->_settingsSplitViewController setViewControllers:v24];

  [(PSSplitViewController *)self->_settingsSplitViewController setContainerNavigationController:self->_settingsController];
  [(PSSplitViewController *)self->_settingsSplitViewController setNavigationDelegate:self];
  [(PSSplitViewController *)self->_settingsSplitViewController setPreferredDisplayMode:2];
  [(PSSplitViewController *)self->_settingsSplitViewController setDelegate:self];
  objc_storeWeak((id *)&self->_selectedTabViewController, self->_settingsSplitViewController);
  [(PSSplitViewController *)self->_settingsSplitViewController setExtendedLayoutIncludesOpaqueBars:1];
}

- (COSPreferencesRootController)settingsController
{
  return self->_settingsController;
}

- (COSPreferencesAppController)init
{
  v22.receiver = self;
  v22.super_class = (Class)COSPreferencesAppController;
  v2 = [(COSPreferencesAppController *)&v22 init];
  if (v2)
  {
    id v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 BOOLForKey:@"__SkipReachabilityChecks"];

    if (v4) {
      v2->_isActivated = 1;
    }
    id v5 = objc_alloc((Class)BKSApplicationStateMonitor);
    id v6 = (BKSApplicationStateMonitor *)[v5 initWithBundleIDs:&off_10025BD10 states:BKSApplicationStateAll];
    appStateMonitor = v2->_appStateMonitor;
    v2->_appStateMonitor = v6;

    v2->_unint64_t activationRetryCountLimit = 1;
    if (PBIsInternalInstall())
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000A4CC0, @"_debug_forceAssetsToPull", 0, (CFNotificationSuspensionBehavior)0);
      Boolean keyExistsAndHasValidFormat = 0;
      CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"ActivationRetryOverride", @"com.apple.Bridge", &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat)
      {
        CFIndex v10 = AppIntegerValue;
        if ((AppIntegerValue & 0x8000000000000000) == 0)
        {
          dispatch_time_t v11 = pbb_activation_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t activationRetryCountLimit = v2->_activationRetryCountLimit;
            *(_DWORD *)buf = 134218240;
            unint64_t v24 = activationRetryCountLimit;
            __int16 v25 = 2048;
            CFIndex v26 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Activation failure count limit overridden from %lu to %lu via default", buf, 0x16u);
          }

          v2->_unint64_t activationRetryCountLimit = v10;
        }
      }
    }
    __int16 v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"_networkingStartNotification:" name:SSVNetworkingDidStartNotification object:0];
    [v13 addObserver:v2 selector:"_networkingStopNotification:" name:SSVNetworkingDidStopNotification object:0];
    id v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"deviceBecameActive:" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

    unsigned int v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"deviceBecameInactive:" name:NRPairedDeviceRegistryDeviceDidBecomeInactive object:0];

    int v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v2 selector:"versionOrCapabilitiesChanged:" name:@"COSActiveDeviceEssentialPropertiesChanged" object:0];

    long long v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v2 selector:"nanoRegistryStatusChanged:" name:NRPairedDeviceRegistryStatusDidChange object:0];

    long long v18 = +[PBBridgeIDSReachability sharedInstance];
    [v18 addObserver:v2];

    long long v19 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
    [(COSPreferencesAppController *)v2 updateActiveWatch:v19];

    [(COSPreferencesAppController *)v2 resetActivationFailureCountAndReport:0];
  }
  return v2;
}

- (void)startScanningForNearbyDevices
{
  v2 = sub_10000CF90();
  id v3 = [v2 count];

  if (!v3)
  {
    unsigned int v4 = pbb_mobileasset_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Begin Scanning for Nearby Devices...", v7, 2u);
    }

    id v5 = +[PPDiscoveryManager sharedDiscoveryManager];
    [v5 setSignalLimitOverride:PPDiscoveryLimitBridge];

    id v6 = +[PPDiscoveryManager sharedDiscoveryManager];
    [v6 begin];
  }
}

- (void)applicationDidBecomeActive:(id)a3
{
  unsigned int v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 67109378;
    *(_DWORD *)BOOL v23 = 956;
    *(_WORD *)&v23[4] = 2080;
    *(void *)&v23[6] = "-[COSPreferencesAppController applicationDidBecomeActive:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)&v22, 0x12u);
  }

  [(COSPreferencesAppController *)self checkForBrokenDeviceAssertion];
  id v5 = +[COSReachabilityMonitor sharedMonitor];
  [v5 startMonitoring];

  if ([(COSPreferencesAppController *)self isActivelyPairing])
  {
    [(COSPreferencesAppController *)self markGalleryTabAsVisitedIfOnGalleryTab];
  }
  else
  {
    id v6 = [(COSGetStartedViewController *)self->_getStartedViewController parentViewController];

    if (!v6) {
      [(COSPreferencesAppController *)self pullPairedWatchAssets];
    }
    [(COSPreferencesAppController *)self markGalleryTabAsVisitedIfOnGalleryTab];
    [(COSPreferencesAppController *)self presentGetConnectedAlertIfNeeded];
  }
  [(COSPreferencesAppController *)self resetSuspendAssertion];
  if (self->_idleNotificationTimer)
  {
    id v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Canceling idle notification timer", (uint8_t *)&v22, 2u);
    }

    [(NSTimer *)self->_idleNotificationTimer invalidate];
    idleNotificationTimer = self->_idleNotificationTimer;
    self->_idleNotificationTimer = 0;
  }
  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"systemDidWake:" name:@"PreferencesSystemDidWake" object:0];
  CFIndex v10 = +[NRPairedDeviceRegistry sharedInstance];
  id v11 = [v10 status];

  id v12 = +[NRPairedDeviceRegistry sharedInstance];
  id v13 = [v12 compatibilityState];

  id v14 = pbb_bridge_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = NRPairedDeviceRegistryStatusCodeString();
    int v16 = +[NSNumber numberWithUnsignedShort:v13];
    int v22 = 136315650;
    *(void *)BOOL v23 = "-[COSPreferencesAppController applicationDidBecomeActive:]";
    *(_WORD *)&v23[8] = 2112;
    *(void *)&v23[10] = v15;
    __int16 v24 = 2112;
    __int16 v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s NR State %@ compatibilityState: %@", (uint8_t *)&v22, 0x20u);
  }
  [(COSPreferencesAppController *)self updateNRStatusForPresentingOrDismissingUnpairingUI:v11];
  long long v17 = pbb_bridge_log();
  if (os_signpost_enabled(v17))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HealthCountryMonitorControl", "", (uint8_t *)&v22, 2u);
  }

  +[HKCountryMonitorControl checkCurrentCountry];
  long long v18 = pbb_bridge_log();
  if (os_signpost_enabled(v18))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HealthCountryMonitorControl", "", (uint8_t *)&v22, 2u);
  }

  if (self->_firstLaunch)
  {
    [(COSPreferencesAppController *)self retriggerNRAlertIfNeeded];
    self->_firstLaunch = 0;
  }
  else if (self->_settingsWasResigned)
  {
    self->_settingsWasResigned = 0;
    [v9 postNotificationName:@"com.apple.PreferencesApp.willBecomeActive" object:0];
    [(COSPreferencesAppController *)self checkIfNRRetriggerConditions];
    [(COSSetupController *)self->_setupController clearIdleUserNotification];
    long long v19 = +[PSListController appearance];
    unsigned __int8 v20 = [v19 usesDarkTheme];

    if ((v20 & 1) == 0)
    {
      id v21 = pbb_bridge_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Error: PSListController is using the wrong theme, resetting appearance!", (uint8_t *)&v22, 2u);
      }

      [(COSPreferencesAppController *)self reloadAppearance:0];
    }
  }
}

- (void)markGalleryTabAsVisitedIfOnGalleryTab
{
  id v3 = [(COSPreferencesAppController *)self rootViewController];
  id v8 = [v3 viewControllers];

  unsigned int v4 = [(COSPreferencesAppController *)self rootViewController];
  id v5 = [v4 selectedIndex];

  if (v5 >= [v8 count])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v8 objectAtIndexedSubscript:v5];
  }
  id v7 = [(COSPreferencesAppController *)self galleryViewController];

  if (v6 == v7) {
    [(COSPreferencesAppController *)self markGalleryTabAsVisited];
  }
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v107 = a3;
  id v108 = a4;
  self->_firstLaunch = 1;
  [(COSPreferencesAppController *)self _refreshShortCuts];
  objc_initWeak(&location, self);
  block[5] = _NSConcreteStackBlock;
  block[6] = 3221225472;
  block[7] = sub_1000148A0;
  block[8] = &unk_100245D20;
  objc_copyWeak(&v110, &location);
  PSSetCustomWatchCapabilityCheck();
  id v6 = +[COSGlobalAlertPresentationCoordinator sharedInstance];
  [v6 addAlertPresenterObserver:self];

  if (PBIsInternalInstall())
  {
    id v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = +[NSBundle bundleWithIdentifier:@"com.apple.PBBridgeSupport"];
      id v9 = [v8 objectForInfoDictionaryKey:@"PBBridgeVersion"];
      *(_DWORD *)buf = 138412290;
      *(void *)v113 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PBBridgeVersion: %@", buf, 0xCu);
    }
  }
  CFIndex v10 = pbb_bridge_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v113 = v108;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "application:didFinishLaunchingWithOptions: - %@", buf, 0xCu);
  }

  [(COSPreferencesAppController *)self _prepareAppearances];
  +[PSSearchEntry setSchemeNameOverride:@"bridge"];
  v118[0] = @"/System/Library/NanoPreferenceBundles/General/";
  v118[1] = @"/System/Library/NanoPreferenceBundles/Applications/";
  v118[2] = @"/System/Library/NanoPreferenceBundles/PrivacySettings/";
  id v11 = +[NSArray arrayWithObjects:v118 count:3];
  +[PSSearchIndexOperation setPossibleBundleRoots:v11];

  +[PSSearchIndexOperation setTopLevelManifestBundlePath:@"/System/Library/PrivateFrameworks/PBBridgeSupport.framework"];
  id v12 = (PBBridgeCompanionController *)objc_alloc_init((Class)PBBridgeCompanionController);
  bridgeController = self->_bridgeController;
  self->_bridgeController = v12;

  id v14 = self->_bridgeController;
  unsigned int v15 = objc_opt_new();
  [(PBBridgeCompanionController *)v14 setRemoteUIStyle:v15];

  [(PBBridgeCompanionController *)self->_bridgeController setDelegate:self];
  int v16 = +[BPSBridgeAppContext shared];
  [v16 setBridgeController:self->_bridgeController];

  self->_pmSource = 0;
  [(COSPreferencesAppController *)self _registerForPowerNotifications];
  long long v17 = +[MCProfileConnection sharedConnection];
  [v17 addObserver:self];

  long long v18 = (NSMutableDictionary *)objc_opt_new();
  discoveryAssetPullRequests = self->_discoveryAssetPullRequests;
  self->_discoveryAssetPullRequests = v18;

  unsigned __int8 v20 = +[NSNotificationCenter defaultCenter];
  [v20 addObserver:self selector:"reloadAppearance:" name:UIAccessibilityDarkerSystemColorsStatusDidChangeNotification object:0];

  id v21 = +[NSNotificationCenter defaultCenter];
  [v21 addObserver:self selector:"updateForRemoteActivity:" name:PBNotifyClientOfActivityNotification object:0];

  int v22 = +[NSNotificationCenter defaultCenter];
  [v22 addObserver:self selector:"deviceIsSetup:" name:NRPairedDeviceRegistryDeviceIsSetupNotification object:0];

  BOOL v23 = +[NSNotificationCenter defaultCenter];
  [v23 addObserver:self selector:"deviceUnpaired:" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

  __int16 v24 = +[NSNotificationCenter defaultCenter];
  [v24 addObserver:self selector:"pairingFailed:" name:NRPairedDeviceRegistryDeviceDidFailToPairNotification object:0];

  __int16 v25 = +[NSNotificationCenter defaultCenter];
  [v25 addObserver:self selector:"enteredCompatibilityState:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

  CFIndex v26 = +[NSNotificationCenter defaultCenter];
  [v26 addObserver:self selector:"initialPairingFailed:" name:@"COSDevicePairingFailed" object:0];

  id v27 = +[NSNotificationCenter defaultCenter];
  [v27 addObserver:self selector:"resetSetupFlowInternalSettings" name:@"_COSInternalSettingForceSetupFlow" object:0];

  uint64_t v28 = +[NSNotificationCenter defaultCenter];
  [v28 addObserver:self selector:"messageSendFailed:" name:PBBridgeMessageFailedToSend object:0];

  uint64_t v29 = +[NSNotificationCenter defaultCenter];
  [v29 addObserver:self selector:"discoveredAdvertisingWatch:" name:PPDeviceWasDiscoveredNotification object:0];

  uint64_t v30 = +[NSNotificationCenter defaultCenter];
  [v30 addObserver:self selector:"sizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

  uint64_t v31 = [(COSPreferencesAppController *)self _tabBarController];
  rootViewController = self->_rootViewController;
  self->_rootViewController = v31;

  long long v33 = +[UIScreen mainScreen];
  [v33 bounds];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;

  int v42 = (UIWindow *)[objc_alloc((Class)UIWindow) initWithContentRect:v35, v37, v39, v41];
  window = self->_window;
  self->_window = v42;

  [(UIWindow *)self->_window setAutoresizingMask:16];
  [(UIWindow *)self->_window _accessibilitySetInterfaceStyleIntent:2];
  BOOL v44 = self->_window;
  __int16 v45 = BPSBridgeTintColor();
  [(UIWindow *)v44 setTintColor:v45];

  [(COSPreferencesAppController *)self loadSettingsController];
  int v46 = +[UISlider appearance];
  __int16 v47 = BPSBridgeTintColor();
  [v46 setTintColor:v47];

  BOOL v48 = [(COSPreferencesAppController *)self rootViewController];
  v49 = [v48 viewControllers];
  LODWORD(v44) = [v49 count] == 0;

  if (v44)
  {
    v50 = [(COSPreferencesAppController *)self rootViewController];
    v51 = [(COSPreferencesAppController *)self _viewControllers];
    [v50 setViewControllers:v51];

    v52 = [(COSPreferencesAppController *)self rootViewController];
    v53 = [v52 selectedViewController];
    [(COSPreferencesAppController *)self _tintTabBarWithViewController:v53];
  }
  v54 = self->_window;
  v55 = [(COSPreferencesAppController *)self rootViewController];
  [(UIWindow *)v54 setRootViewController:v55];

  v56 = +[NSNumber numberWithInt:480];
  v57 = +[NSNumber numberWithInt:0];
  v58 = +[NSDictionary dictionaryWithObjectsAndKeys:v56, @"kPreferenceTimeoutLimitKey", v57, @"kPreferencePositionTimeStampKey", @"bridge:", @"kPreferencePositionKey", 0];

  v59 = +[NSUserDefaults standardUserDefaults];
  [v59 registerDefaults:v58];
  [v59 synchronize];
  v60 = [v59 objectForKey:@"kPreferenceTimeoutLimitKey"];
  [v60 doubleValue];
  self->_timeoutLimit = v61;

  [(COSPreferencesAppController *)self evaluateIfUpdatingInSetupFlowOnLaunch];
  v62 = [v108 objectForKey:UIApplicationLaunchOptionsURLKey];
  if (v62) {
    goto LABEL_10;
  }
  if (self->_isUpdatingGizmoInSetupFlow) {
    goto LABEL_12;
  }
  v62 = [(COSPreferencesAppController *)self oneTimeJumpURL];
  if ([(COSPreferencesAppController *)self shouldShowWatchPicker])
  {
    v78 = objc_loadWeakRetained(&location);
    v79 = +[NSURL URLWithString:@"root=ActiveWatch"];
    v80 = sub_10000DCF4();
    if (v80) {
      BOOL v81 = 0;
    }
    else {
      BOOL v81 = sub_100012810();
    }
    [v78 processURL:v79 animated:!v81 fromSearch:0];

    goto LABEL_70;
  }
  if (v62)
  {
    [(COSPreferencesAppController *)self processURL:v62 animated:0 fromSearch:0];
  }
  else
  {
    if (!CFPreferencesGetAppBooleanValue(@"kShouldJumpToFaceGalleryKey", @"com.apple.Bridge", 0))
    {
      v78 = [v59 objectForKey:@"kPreferencePositionTimeStampKey"];
      v101 = +[NSDate date];
      v102 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(int)[v78 intValue]);
      [v101 timeIntervalSinceDate:v102];
      double v104 = v103;

      if (v78)
      {
        float v105 = v104;
        if (v105 <= 0.0 || self->_timeoutLimit <= v105) {
          goto LABEL_71;
        }
      }
      v106 = [v59 objectForKey:@"kPreferencePositionKey"];
      v79 = +[NSURL URLWithString:v106];

      self->_BOOL processedPositionPath = 1;
      [(COSPreferencesAppController *)self processURL:v79];
LABEL_70:

LABEL_71:
      goto LABEL_10;
    }
    v100 = [(COSPreferencesAppController *)self galleryViewController];
    [(COSPreferencesAppController *)self setSelectedTabViewController:v100];

    [(COSPreferencesAppController *)self markGalleryTabAsVisited];
  }
LABEL_10:

LABEL_12:
  [(UIWindow *)self->_window makeKeyAndVisible];
  v63 = +[NRPairedDeviceRegistry sharedInstance];
  id v64 = [v63 status];

  unsigned int v65 = sub_100005814();
  v66 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  v67 = [v66 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned int v68 = [v67 BOOLValue];

  if (v66 && (PBPairedSyncComplete() & 1) == 0) {
    int v69 = (sub_100033EA4() | v68) ^ 1;
  }
  else {
    int v69 = 0;
  }

  int v70 = PBisInMigrationSync();
  v71 = pbb_setupflow_log();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v113 = v70;
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "isInMigrationSync - %{BOOL}d", buf, 8u);
  }

  if (v64 == (id)5 || (self->_isUpdatingGizmoInSetupFlow ? (int v72 = 1) : (int v72 = v69), v72 != 1)) {
    int v73 = 0;
  }
  else {
    int v73 = (v65 | v70) ^ 1;
  }
  v74 = pbb_setupflow_log();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isUpdatingGizmoInSetupFlow = self->_isUpdatingGizmoInSetupFlow;
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v113 = v73;
    *(_WORD *)&v113[4] = 1024;
    *(_DWORD *)&v113[6] = isUpdatingGizmoInSetupFlow;
    __int16 v114 = 1024;
    int v115 = v69;
    __int16 v116 = 1024;
    BOOL v117 = v64 == (id)5;
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Showing Setup (%{BOOL}d}) -- _isUpdatingGizmoInSetupFlow %{BOOL}d / setupIsInSyncTrap %{BOOL}d isUnpairing: %{BOOL}d", buf, 0x1Au);
  }

  if (v64 == (id)5)
  {
    [(COSPreferencesAppController *)self presentUnpairingViewControllerAnimated:1];
  }
  else if (v73)
  {
    if (v69)
    {
      uint64_t v76 = 3;
    }
    else
    {
      v82 = [UIApp bridgeController];
      [v82 beginSetupTransaction];

      uint64_t v76 = 1;
    }
    [(COSPreferencesAppController *)self presentSetupFlowWithMode:v76 animated:0];
  }
  else if (!self->_isUpdatingInRevLock)
  {
    if (v65)
    {
      v77 = pbb_setupflow_log();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "\"SkipSetupFlow\" default is set, Skipping Setup flow!!!", buf, 2u);
      }
    }
    [(COSPreferencesAppController *)self pullPairedWatchAssets];
  }
  v83 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  if (v83)
  {
  }
  else
  {
    v84 = sub_100014784();
    BOOL v85 = [v84 count] == 0;

    if (!v85) {
      [(COSPreferencesAppController *)self deviceBecameInactive:0];
    }
  }
  if (v64 == (id)5) {
    char v86 = 1;
  }
  else {
    char v86 = v73;
  }
  if ((v86 & 1) == 0)
  {
    int v87 = self->_isUpdatingInRevLock ? 1 : v69;
    if (((v87 | v70) & 1) == 0)
    {
      v88 = +[ACXDeviceConnection sharedDeviceConnection];
      v89 = +[NRPairedDeviceRegistry sharedInstance];
      v90 = [v89 getActivePairedDevice];
      [v88 retryPendingAppInstallationsForPairedDevice:v90];
    }
  }
  if (PBIsInternalInstall()) {
    +[PBBridgeAssetsReachabilityMonitor checkServerReachabilityWithCompletion:&stru_100245D40];
  }
  v91 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v92 = dispatch_queue_attr_make_with_qos_class(v91, QOS_CLASS_BACKGROUND, 0);

  v93 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BackupPrewarm", v92);
  queue = self->_queue;
  self->_queue = v93;

  v95 = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015E3C;
  block[3] = &unk_1002438A0;
  void block[4] = self;
  dispatch_async(v95, block);
  [(COSPreferencesAppController *)self createDisplayLayoutManager];
  [(COSPreferencesAppController *)self registerForUserNotifications];
  if (PBIsInternalInstall())
  {
    v96 = [v107 connectedScenes];
    v97 = [v96 anyObject];

    if (v97)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v98 = [v97 screenshotService];
        [v98 setDelegate:self];
      }
    }
  }
  objc_destroyWeak(&v110);
  objc_destroyWeak(&location);

  return 1;
}

- (UITabBarController)rootViewController
{
  return self->_rootViewController;
}

- (id)_viewControllers
{
  id v3 = +[NSMutableArray array];
  unsigned int v4 = [(COSPreferencesAppController *)self ntkCustomization];
  if ((sub_10000F6D4() & 1) == 0 && !v4) {
    goto LABEL_33;
  }
  uint64_t v5 = PBHasSetupDevice();
  if ([(COSPreferencesAppController *)self launchedToTest])
  {
    id v6 = pbb_setup_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = +[NSNumber numberWithBool:0];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ForceGetStartedForPPT %@", buf, 0xCu);
    }
  }
  else
  {
    if (!sub_100005814())
    {
      id v6 = objc_opt_new();
      id v9 = [v6 migratableDevices];
      id v10 = [v9 count];

      if (v10) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = v5 ^ 1;
      }
      id v11 = pbb_setup_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = +[NSNumber numberWithBool:v8];
        id v13 = +[NSNumber numberWithBool:v5];
        id v14 = [v6 migratableDevices];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2048;
        v52 = (uint64_t (*)(uint64_t, uint64_t))[v14 count];
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Show Setup: %@ hasSetupCompletedDevice %@ Migratable Devices: %lu", buf, 0x20u);
      }
      goto LABEL_16;
    }
    id v6 = pbb_setup_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Skipped Setup!", buf, 2u);
    }
  }
  LODWORD(v8) = 0;
LABEL_16:

  if ([(COSPreferencesAppController *)self launchedToTest]
    && CFPreferencesGetAppIntegerValue(@"fakePairedWatches", @"com.apple.Bridge", 0) >= 2)
  {
    unsigned int v15 = +[NSURL URLWithString:@"root=ActiveWatch"];
    [(COSPreferencesAppController *)self processURL:v15 animated:0 fromSearch:0];
  }
  if (v8)
  {
    int v16 = [(COSPreferencesAppController *)self _getStartedController];
  }
  else
  {
    int v16 = self->_settingsSplitViewController;
  }
  long long v17 = v16;
  if (v16)
  {
    long long v18 = [(PSSplitViewController *)v16 tabBarItem];
    long long v19 = +[NSBundle mainBundle];
    unsigned __int8 v20 = [v19 localizedStringForKey:@"MY_WATCH_TAB_TITLE" value:&stru_100249230 table:@"TabBar"];
    [v18 _setInternalTitle:v20];

    id v21 = [(PSSplitViewController *)v17 tabBarItem];
    int v22 = +[UIImage systemImageNamed:@"applewatch.side.right"];
    [v21 setImage:v22];

    [(COSPreferencesAppController *)self setMyWatchViewController:v17];
    [v3 addObject:v17];
  }
  else
  {
    BOOL v23 = pbb_bridge_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Nil myWatchViewController can't be added to tab bar, showSetup: %{BOOL}d", buf, 8u);
    }
  }
  if (v4)
  {
    __int16 v24 = [(COSPreferencesAppController *)self bridgeUserNotificationCategories];
    id v25 = [v24 mutableCopy];

    CFIndex v26 = [v4 galleryViewController];
    id v27 = [v26 tabBarItem];
    uint64_t v28 = +[NSBundle mainBundle];
    uint64_t v29 = [v28 localizedStringForKey:@"GALLERY_TAB_TITLE" value:&stru_100249230 table:@"TabBar"];
    [v27 _setInternalTitle:v29];

    uint64_t v30 = [v26 tabBarItem];
    uint64_t v31 = +[UIImage systemImageNamed:@"applewatch.watchface"];
    [v30 setImage:v31];

    [v3 addObject:v26];
    [(COSPreferencesAppController *)self setGalleryViewController:v26];
    uint64_t v32 = [v4 userNotificationCategories];
    [v25 unionSet:v32];

    if ([v25 count])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v52 = sub_100015DBC;
      v53 = sub_100015D5C;
      id v54 = +[UNUserNotificationCenter currentNotificationCenter];
      long long v33 = *(void **)(*(void *)&buf[8] + 40);
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1000056E0;
      v48[3] = &unk_100246230;
      id v49 = v25;
      v50 = buf;
      [v33 getNotificationCategoriesWithCompletionHandler:v48];

      _Block_object_dispose(buf, 8);
    }
  }
LABEL_33:
  double v34 = objc_alloc_init(COSDiscoverListViewController);
  double v35 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v34];
  discoverNavigationController = self->_discoverNavigationController;
  self->_discoverNavigationController = v35;

  double v37 = +[NSBundle mainBundle];
  double v38 = [v37 localizedStringForKey:@"DISCOVER_TAB_TITLE" value:&stru_100249230 table:@"TabBar"];

  double v39 = [(UINavigationController *)self->_discoverNavigationController tabBarItem];
  [v39 setTitle:v38];

  double v40 = [(UINavigationController *)self->_discoverNavigationController navigationBar];
  [v40 setPrefersLargeTitles:1];

  double v41 = [(COSDiscoverListViewController *)v34 navigationItem];
  [v41 setTitle:v38];

  int v42 = +[UIImage systemImageNamed:@"safari.fill"];
  __int16 v43 = [(UINavigationController *)self->_discoverNavigationController tabBarItem];
  [v43 setImage:v42];

  [v3 addObject:self->_discoverNavigationController];
  BOOL v44 = [(COSPreferencesAppController *)self myWatchViewController];
  [(COSPreferencesAppController *)self reportTabState:v44];

  __int16 v45 = [(COSPreferencesAppController *)self myWatchViewController];
  int v46 = [v45 tabBarItem];
  [(COSPreferencesAppController *)self refreshUpdateBadgeWithTab:v46];

  return v3;
}

- (void)navigateToRootObjectWithURLDictionary:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKey:@"root"];
  id v7 = SFObjectAndOffsetForURLPair();
  uint64_t v8 = [v7 objectForKey:@"object"];
  id v9 = [v7 objectForKey:@"offsetItem"];
  id v10 = [(COSPreferencesAppController *)self rootViewController];
  id v11 = [v10 viewControllers];
  id v12 = [(COSPreferencesAppController *)self myWatchViewController];
  unsigned int v13 = [v11 containsObject:v12];

  if (v13)
  {
    id v14 = [(COSPreferencesAppController *)self myWatchViewController];
    [(COSPreferencesAppController *)self setSelectedTabViewController:v14];
  }
  if (v8)
  {
    objc_initWeak(location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C008;
    block[3] = &unk_100246148;
    objc_copyWeak(&v23, location);
    id v18 = v8;
    id v19 = v9;
    unsigned __int8 v20 = self;
    id v21 = v5;
    BOOL v24 = a4;
    id v22 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v23);
    objc_destroyWeak(location);
  }
  else
  {
    unsigned int v15 = pbb_bridge_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "missing root object. dropping url handle request", (uint8_t *)location, 2u);
    }
  }
}

- (void)processURL:(id)a3 animated:(BOOL)a4 fromSearch:(BOOL)a5
{
  id v7 = a3;
  uint64_t v8 = pbb_bridge_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Process URL: %@", buf, 0xCu);
  }

  id v9 = [(COSPreferencesAppController *)self getLaunchedByValueForURL:v7];
  id v10 = v9;
  if (v9 && [v9 isEqualToString:@"NRPairedDeviceRegistryLaunchedByNanoRegistry"])
  {
    id v11 = pbb_bridge_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Launched by NanoRegistry!", buf, 2u);
    }

    self->_BOOL launchedByNanoRegistry = 1;
  }
  id v12 = [(COSPreferencesAppController *)self keyValueDictionaryForURL:v7];
  objc_initWeak((id *)buf, self);
  id v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  id v23 = sub_100015E90;
  BOOL v24 = &unk_1002461E8;
  id v25 = self;
  id v13 = v12;
  id v26 = v13;
  objc_copyWeak(&v27, (id *)buf);
  BOOL v28 = a4;
  id v14 = objc_retainBlock(&v21);
  unsigned int v15 = [(COSPreferencesAppController *)self rootViewController];
  int v16 = [v15 viewControllers];
  long long v17 = [(COSPreferencesAppController *)self myWatchViewController];
  unsigned int v18 = [v16 containsObject:v17];

  if (v18)
  {
    id v19 = [(COSPreferencesAppController *)self myWatchViewController];
    [(COSPreferencesAppController *)self setSelectedTabViewController:v19];
  }
  unsigned __int8 v20 = [v13 objectForKey:@"csn"];
  if ([v20 length]) {
    [(COSPreferencesAppController *)self _activateTinkerWatchWithCSN:v20 completionBlock:v14];
  }
  else {
    ((void (*)(void ***, void))v14[2])(v14, 0);
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

- (UIViewController)myWatchViewController
{
  return self->_myWatchViewController;
}

- (NRDevice)displayDevice
{
  v2 = [(COSPreferencesAppController *)self activeWatch];
  id v3 = v2;
  if (!v2
    || ([v2 valueForProperty:NRDevicePropertyIsPaired],
        unsigned int v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 BOOLValue],
        v4,
        (v5 & 1) == 0))
  {
    uint64_t v6 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();

    id v3 = (void *)v6;
    if (!v6)
    {
      id v7 = sub_100014784();
      uint64_t v8 = +[NSDate distantPast];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v9 = v7;
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        id v11 = v10;
        id v3 = 0;
        uint64_t v12 = *(void *)v22;
        uint64_t v13 = NRDevicePropertyLastActiveDate;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            unsigned int v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            int v16 = [v15 valueForProperty:v13];
            long long v17 = [v16 laterDate:v8];

            if (v17 == v16)
            {
              id v18 = v16;

              id v19 = v15;
              id v3 = v19;
              uint64_t v8 = v18;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v11);
      }
      else
      {
        id v3 = 0;
      }
    }
  }

  return (NRDevice *)v3;
}

- (NRDevice)activeWatch
{
  return self->_activeWatch;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  return 2;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setSelectedTabViewController:(id)a3
{
}

- (void)setMyWatchViewController:(id)a3
{
}

- (void)setIPhoneMirroringEnabled:(BOOL)a3
{
  self->_iPhoneMirroringEnabled = a3;
}

- (void)setGalleryViewController:(id)a3
{
}

- (void)resetActivationFailureCountAndReport:(BOOL)a3
{
  if (a3 && self->_activationRetryCount) {
    +[PBBridgeCAReporter incrementSuccessType:56];
  }
  self->_activationRetryCount = 0;
}

- (void)registerForUserNotifications
{
  id v3 = +[UNUserNotificationCenter currentNotificationCenter];
  [v3 setDelegate:self];
  [v3 requestAuthorizationWithOptions:7 completionHandler:&stru_100245D88];
}

- (void)presentGetConnectedAlertIfNeeded
{
}

- (BOOL)isUpdatingInRevLock
{
  return self->_isUpdatingInRevLock;
}

- (BOOL)isInSetupFlow
{
  return self->_setupController != 0;
}

- (BOOL)isActivelyPairing
{
  unsigned int v3 = [(COSPreferencesAppController *)self isInSetupFlow];
  if (v3)
  {
    setupController = self->_setupController;
    LOBYTE(v3) = [(COSSetupController *)setupController hasStartedPairing];
  }
  return v3;
}

- (UIViewController)galleryViewController
{
  return self->_galleryViewController;
}

- (BOOL)devicePickerPresented
{
  return self->_devicePickerPresented;
}

- (BOOL)deviceIsBeingMigrated
{
  return self->_deviceIsBeingMigrated;
}

- (void)checkForBrokenDeviceAssertion
{
  activeWatchAssertion = self->_activeWatchAssertion;
  if (activeWatchAssertion)
  {
    unsigned __int8 v4 = [(NRActiveDeviceAssertion *)activeWatchAssertion isActive];
    unsigned __int8 v5 = pbb_bridge_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NanoRegistry DID NOT kill our watch assertion", v7, 2u);
      }
    }
    else
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NanoRegistry killed our watch assertion!", buf, 2u);
      }

      unsigned __int8 v5 = self->_activeWatchAssertion;
      self->_activeWatchAssertion = 0;
    }
  }
}

- (void)_prepareAppearances
{
}

+ (BOOL)_shouldUseAlertControllerForLegacyAlerts
{
  return 1;
}

- (void)dealloc
{
  unsigned int v3 = +[PBBridgeIDSReachability sharedInstance];
  [v3 removeObserver:self];

  unsigned __int8 v4 = +[COSGlobalAlertPresentationCoordinator sharedInstance];
  [v4 removeAlertPresenterObserver:self];

  unsigned __int8 v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)COSPreferencesAppController;
  [(COSPreferencesAppController *)&v6 dealloc];
}

- (id)settingsListController
{
  return [(COSPreferencesRootController *)self->_settingsController rootListController];
}

- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v4 = a4;
  unsigned __int8 v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "application:willContinueUserActivityWithType: - %@", (uint8_t *)&v7, 0xCu);
  }

  return 1;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = pbb_bridge_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_retainBlock(v8);
    int v17 = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "application:continueUserActivity:restorationHandler: - %@; %@",
      (uint8_t *)&v17,
      0x16u);
  }
  id v11 = [(COSPreferencesAppController *)self urlForActivity:v7];
  if (v11)
  {
    uint64_t v12 = pbb_bridge_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Opening URL %@ from continuity", (uint8_t *)&v17, 0xCu);
    }

    [(COSPreferencesAppController *)self application:self openURL:v11 options:&__NSDictionary0__struct];
  }
  else
  {
    uint64_t v13 = [v7 activityType];
    unsigned __int8 v14 = [v13 isEqualToString:NSUserActivityTypeLiveActivity];

    if ((v14 & 1) == 0) {
      id v15 = [(COSPreferencesRootController *)self->_settingsController popToRootViewControllerAnimated:0];
    }
  }

  return 1;
}

- (void)application:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = pbb_bridge_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "application:didFailToContinueUserActivityWithType: - %@; %@",
      (uint8_t *)&v9,
      0x16u);
  }
}

- (void)application:(id)a3 didUpdateUserActivity:(id)a4
{
  id v4 = a4;
  unsigned __int8 v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "application:didUpdateUserActivity: - %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, id))a5;
  id v8 = pbb_bridge_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "application:performActionForShortcutItem:completionHandler: - %@", (uint8_t *)&v11, 0xCu);
  }

  int v9 = +[COSShortcutController sharedController];
  id v10 = [v9 issueActionForShortcut:v6];

  if (v7) {
    v7[2](v7, v10);
  }
}

- (void)applicationWillTerminate:(id)a3
{
  id v4 = +[MCProfileConnection sharedConnection];
  [v4 removeObserver:self];

  id v5 = [(COSPreferencesRootController *)self->_settingsController popToRootViewControllerAnimated:0];
  setupController = self->_setupController;
  if (setupController) {
    [(COSSetupController *)setupController completePairingMetricForAppTermination];
  }
  window = self->_window;
  self->_window = 0;

  id v8 = +[NSUserDefaults standardUserDefaults];
  [v8 setObject:&stru_100249230 forKey:@"kPreferencePositionKey"];
  [v8 synchronize];
}

- (void)applicationDidEnterBackground:(id)a3
{
  [(COSPreferencesAppController *)self checkForBrokenDeviceAssertion];
  [(COSPreferencesAppController *)self setAppDelegateOnDismissalBlock:0];
  if (([UIApp isSuspendedEventsOnly] & 1) == 0) {
    self->_backgrounded = 1;
  }
  id v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 67109378;
    *(_DWORD *)long long v23 = 759;
    *(_WORD *)&v23[4] = 2080;
    *(void *)&v23[6] = "-[COSPreferencesAppController applicationDidEnterBackground:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)&v22, 0x12u);
  }

  if (self->_isUpdatingGizmoInSetupFlow
    && [(COSSetupController *)self->_setupController resolvedPreconditionsForSoftwareUpdate])
  {
    id v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      suspendAssertion = self->_suspendAssertion;
      int v22 = 136315394;
      *(void *)long long v23 = "-[COSPreferencesAppController applicationDidEnterBackground:]";
      *(_WORD *)&v23[8] = 2112;
      *(void *)&v23[10] = suspendAssertion;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: In software update flow? assertion ID %@", (uint8_t *)&v22, 0x16u);
    }

    [(COSPreferencesAppController *)self _refreshShortCuts];
    return;
  }
  if ([(COSPreferencesAppController *)self shouldConsiderHoldingSuspendAssertion])
  {
    [(COSPreferencesAppController *)self _extendBackgroundAssertion];
    [(COSPreferencesAppController *)self _createIdleNotificationTimer];
    if (self->_suspendAssertion)
    {
      id v7 = pbb_bridge_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = self->_suspendAssertion;
        int v9 = "YES";
        BOOL syncTrapUICompleted = self->_syncTrapUICompleted;
        if (self->_syncTrapUIEnabled) {
          int v11 = "YES";
        }
        else {
          int v11 = "NO";
        }
        int v22 = 136315906;
        *(void *)long long v23 = "-[COSPreferencesAppController applicationDidEnterBackground:]";
        if (!syncTrapUICompleted) {
          int v9 = "NO";
        }
        *(_WORD *)&v23[8] = 2112;
        *(void *)&v23[10] = v8;
        __int16 v24 = 2080;
        id v25 = v11;
        __int16 v26 = 2080;
        id v27 = v9;
        id v12 = "%s: Already have background assertion %@ because _syncTrapUIEnabled:%s _syncTrapUICompleted:%s";
LABEL_29:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v22, 0x2Au);
      }
    }
    else
    {
      unsigned __int8 v14 = (BKSProcessAssertion *)[objc_alloc((Class)BKSProcessAssertion) initWithPID:getpid() flags:1 reason:10004 name:@"Bridge-Setup-Flow" withHandler:&stru_100245DA8];
      id v15 = self->_suspendAssertion;
      self->_suspendAssertion = v14;

      id v7 = pbb_bridge_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = self->_suspendAssertion;
        int v17 = "YES";
        BOOL v18 = self->_syncTrapUICompleted;
        if (self->_syncTrapUIEnabled) {
          __int16 v19 = "YES";
        }
        else {
          __int16 v19 = "NO";
        }
        int v22 = 136315906;
        *(void *)long long v23 = "-[COSPreferencesAppController applicationDidEnterBackground:]";
        if (!v18) {
          int v17 = "NO";
        }
        *(_WORD *)&v23[8] = 2112;
        *(void *)&v23[10] = v16;
        __int16 v24 = 2080;
        id v25 = v19;
        __int16 v26 = 2080;
        id v27 = v17;
        id v12 = "%s: Created background assertion %@  because _syncTrapUIEnabled:%s _syncTrapUICompleted:%s";
        goto LABEL_29;
      }
    }

    id v20 = pbb_setupflow_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      long long v21 = self->_suspendAssertion;
      int v22 = 136315394;
      *(void *)long long v23 = "-[COSPreferencesAppController applicationDidEnterBackground:]";
      *(_WORD *)&v23[8] = 2112;
      *(void *)&v23[10] = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Bridge Background Assertion: %@", (uint8_t *)&v22, 0x16u);
    }

    return;
  }
  if ([(COSPreferencesAppController *)self isActivelyPairing])
  {
    uint64_t v13 = [(COSSetupController *)self->_setupController linkUpgradeMonitor];
    [v13 resetCompanionLinkPreference];
  }
  [(COSPreferencesAppController *)self generateURL];
  [(COSPreferencesAppController *)self resetSuspendAssertion];
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = a3;
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)BOOL v81 = 817;
    *(_WORD *)&v81[4] = 2080;
    *(void *)&v81[6] = "-[COSPreferencesAppController applicationWillEnterForeground:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  [(COSPreferencesAppController *)self checkForBrokenDeviceAssertion];
  if (!self->_suspendAssertion && (PBHasSetupDevice() & 1) == 0 && (sub_100005814() & 1) == 0)
  {
    id v6 = [(COSSetupController *)self->_setupController pairingCompatiblity];
    unsigned __int8 v7 = [v6 runUpdateInSetup];

    if ((v7 & 1) == 0)
    {
      unsigned __int8 v14 = pbb_bridge_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Foreground Pre-Setup!", buf, 2u);
      }
      goto LABEL_66;
    }
  }
  activeWatch = self->_activeWatch;
  if (activeWatch)
  {
    -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
    int v9 = (NRDevice *)objc_claimAutoreleasedReturnValue();

    if (activeWatch != v9)
    {
      id v10 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
      [(COSPreferencesAppController *)self updateActiveWatch:v10];

      int v11 = +[NRPairedDeviceRegistry sharedInstance];
      unsigned int v12 = [v11 compatibilityState];

      if (v12 != 2)
      {
        [(COSPreferencesAppController *)self popToTopLevelSettingsAnimated:0];
        goto LABEL_67;
      }
      uint64_t v13 = [(COSPreferencesAppController *)self rootViewController];
      unsigned __int8 v14 = [v13 presentedViewController];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = [v14 topViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        int v17 = pbb_bridge_log();
        BOOL v18 = v17;
        if (isKindOfClass)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Disabling paired device list back button for update state", buf, 2u);
          }

          [v15 disableBackButton];
          goto LABEL_30;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = (objc_class *)objc_opt_class();
          uint64_t v31 = NSStringFromClass(v30);
          *(_DWORD *)buf = 138412290;
          *(void *)BOOL v81 = v31;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Unexpected topListController: %@", buf, 0xCu);
        }
      }
      else
      {
        id v15 = pbb_bridge_log();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR) || !os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        uint64_t v29 = (objc_class *)objc_opt_class();
        BOOL v18 = NSStringFromClass(v29);
        *(_DWORD *)buf = 138412290;
        *(void *)BOOL v81 = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unexpected presentedViewController: %@", buf, 0xCu);
      }

LABEL_30:
LABEL_66:

      goto LABEL_67;
    }
  }
  if (([v4 isSuspendedUnderLock] & 1) == 0 && !self->_setupController)
  {
    +[NSUserDefaults resetStandardUserDefaults];
    unsigned __int8 v14 = +[NSUserDefaults standardUserDefaults];
    __int16 v19 = [v14 objectForKey:@"kPreferencePositionKey"];
    [v14 setObject:&stru_100249230 forKey:@"kPreferencePositionKey"];
    id v20 = [v14 objectForKey:@"kPreferenceTimeoutLimitKey"];
    [v20 doubleValue];
    self->_double timeoutLimit = v21;

    int v22 = [v14 objectForKey:@"kPreferencePositionTimeStampKey"];
    long long v23 = +[NSDate date];
    __int16 v24 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(int)[v22 intValue]);
    [v23 timeIntervalSinceDate:v24];
    double v26 = v25;
    double timeoutLimit = self->_timeoutLimit;

    BOOL v28 = [(COSPreferencesAppController *)self oneTimeJumpURL];
    if (v28)
    {
      self->_loadingExternalURL = 1;
      [(COSPreferencesAppController *)self processURL:v28];
    }
    else if (!v22 || v26 < timeoutLimit)
    {
      v74 = v22;
      long long v33 = +[NSURL URLWithString:v19];
      double v34 = [(COSPreferencesAppController *)self keyValueDictionaryForURL:v33];

      int v69 = v34;
      unsigned int v68 = [v34 objectForKey:@"root"];
      v67 = SFObjectAndOffsetForURLPair();
      double v35 = [v67 objectForKey:@"object"];
      if (v35)
      {
        int v72 = v19;
        double v36 = self->_settingsController;
        double v37 = [(COSPreferencesRootController *)v36 rootListController];
        uint64_t v32 = [v37 specifierForID:v35];

        if (!v32)
        {
          double v38 = [(COSPreferencesRootController *)v36 rootListController];
          uint64_t v32 = [v38 specifierForBundle:v35];
        }
        BOOL v28 = 0;
        __int16 v19 = v72;
      }
      else
      {
        uint64_t v32 = 0;
      }

      int v22 = v74;
      goto LABEL_34;
    }
    uint64_t v32 = 0;
LABEL_34:
    if (!self->_loadingExternalURL && !self->_processingProfileURL)
    {
      v71 = v19;
      int v73 = v22;
      int v70 = v28;
      if (!v32)
      {
        if (v26 >= timeoutLimit)
        {
          if (([(PSSplitViewController *)self->_settingsSplitViewController isCollapsed] & 1) == 0)
          {
            double v39 = [(COSPreferencesRootController *)self->_settingsController rootListController];
            [v39 selectGeneralCategory];
          }
          [(COSPreferencesRootController *)self->_settingsController dismissViewControllerAnimated:0 completion:0];
          [(COSPreferencesAppController *)self popToRootOfSettingsSelectGeneral:0 performWithoutDeferringTransitions:1];
          double v40 = [(COSPreferencesRootController *)self->_settingsController topViewController];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v41 = [v40 table];
            int v42 = [v41 indexPathForSelectedRow];
            [v41 deselectRowAtIndexPath:v42 animated:0];
          }
        }
        __int16 v43 = [(COSPreferencesRootController *)self->_settingsController topViewController];
        BOOL v44 = v43;
        if (v26 >= timeoutLimit
          && [v43 conformsToProtocol:&OBJC_PROTOCOL___PSViewControllerOffsetProtocol])
        {
          __int16 v45 = [v44 table];
          [v45 setContentOffset:0.0, 0.0];
        }
      }
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      int v46 = [(COSPreferencesRootController *)self->_settingsController viewControllers];
      id v47 = [v46 countByEnumeratingWithState:&v75 objects:v79 count:16];
      if (v47)
      {
        id v48 = v47;
        uint64_t v49 = *(void *)v76;
        do
        {
          for (i = 0; i != v48; i = (char *)i + 1)
          {
            if (*(void *)v76 != v49) {
              objc_enumerationMutation(v46);
            }
            v51 = *(void **)(*((void *)&v75 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && [v51 shouldReloadSpecifiersOnResume])
            {
              [v51 reloadSpecifiers];
            }
          }
          id v48 = [v46 countByEnumeratingWithState:&v75 objects:v79 count:16];
        }
        while (v48);
      }

      __int16 v19 = v71;
      int v22 = v73;
      BOOL v28 = v70;
    }
    [v14 synchronize];

    goto LABEL_66;
  }
LABEL_67:
  WeakRetained = (PSSplitViewController *)objc_loadWeakRetained((id *)&self->_selectedTabViewController);
  v53 = WeakRetained;
  if (WeakRetained == self->_settingsSplitViewController)
  {
    id v54 = [(COSPreferencesRootController *)self->_settingsController viewControllers];
    id v55 = [v54 count];

    if (!v55) {
      [(COSPreferencesAppController *)self startScanningForNearbyDevices];
    }
  }
  else
  {
  }
  [(COSPreferencesAppController *)self markGalleryTabAsVisitedIfOnGalleryTab];
  [(COSPreferencesAppController *)self _refreshTabBarVisibility];
  if (![(COSPreferencesAppController *)self isInSetupFlow])
  {
    v56 = +[ACXDeviceConnection sharedDeviceConnection];
    v57 = +[NRPairedDeviceRegistry sharedInstance];
    v58 = [v57 getActivePairedDevice];
    [v56 retryPendingAppInstallationsForPairedDevice:v58];
  }
  v59 = +[PSListController appearance];
  unsigned __int8 v60 = [v59 usesDarkTheme];

  if ((v60 & 1) == 0)
  {
    double v61 = pbb_bridge_log();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Error: PSListController is using the wrong theme, resetting appearance!", buf, 2u);
    }

    [(COSPreferencesAppController *)self reloadAppearance:0];
  }
  uint64_t v62 = sub_10000DCF4();
  if (v62)
  {
    v63 = (void *)v62;
    uint64_t v64 = [(COSGetStartedViewController *)self->_getStartedViewController parentViewController];
    if (v64)
    {
      unsigned int v65 = (void *)v64;
      unsigned __int8 v66 = [(COSPreferencesAppController *)self isActivelyPairing];

      if ((v66 & 1) == 0) {
        [(COSPreferencesAppController *)self dismissSetupFlowComplete:1 animated:0];
      }
    }
    else
    {
    }
  }
  [(COSPreferencesAppController *)self createDisplayLayoutManager];
}

- (void)_createIdleNotificationTimer
{
  unsigned int v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "idle notification timer started", v7, 2u);
  }

  [(NSTimer *)self->_idleNotificationTimer invalidate];
  id v4 = +[NSTimer timerWithTimeInterval:self target:"postIdleNotification:" selector:0 userInfo:0 repeats:300.0];
  idleNotificationTimer = self->_idleNotificationTimer;
  self->_idleNotificationTimer = v4;

  id v6 = +[NSRunLoop currentRunLoop];
  [v6 addTimer:self->_idleNotificationTimer forMode:NSRunLoopCommonModes];
}

- (void)postIdleNotification:(id)a3
{
  if (self->_syncTrapUIEnabled || self->_syncTrapUICompleted)
  {
    id v4 = pbb_bridge_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v5 = "not posting idle notification";
      id v6 = buf;
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else
  {
    unsigned __int8 v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "posting notification telling user to return to watch setup", v10, 2u);
    }

    setupController = self->_setupController;
    if (setupController)
    {
      [(COSSetupController *)setupController postUserNotificationForController:0];
      return;
    }
    id v4 = pbb_bridge_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      id v5 = "Trying to post idle notification, but setup controller doesn't exist, skipping";
      id v6 = (uint8_t *)&v9;
      goto LABEL_5;
    }
  }
}

- (void)presentingControllerForModalByDismissingTopAlertIfPresentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(COSPreferencesAppController *)self rootViewController];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000A6858;
  void v17[3] = &unk_100245E20;
  void v17[4] = self;
  id v6 = v4;
  id v18 = v6;
  unsigned __int8 v7 = objc_retainBlock(v17);
  id v8 = [v5 presentedViewController];

  if (v8)
  {
    __int16 v9 = 0;
    do
    {
      id v8 = v5;

      id v5 = [v8 presentedViewController];

      id v10 = [v5 presentedViewController];

      __int16 v9 = v8;
    }
    while (v10);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v11 = pbb_bridge_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [v5 presentingViewController];
      *(_DWORD *)buf = 138412546;
      id v20 = v5;
      __int16 v21 = 2112;
      int v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Dismissing  alert: %@ presented by: %@", buf, 0x16u);
    }
    uint64_t v13 = [v5 presentingViewController];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000A6A88;
    v14[3] = &unk_1002444A8;
    int v16 = v7;
    id v15 = v8;
    [v13 dismissViewControllerAnimated:1 completion:v14];
  }
  else
  {
    ((void (*)(void *, void *))v7[2])(v7, v5);
  }
}

- (void)checkIfNRRetriggerConditions
{
  if (self->_backgrounded && ![(COSPreferencesAppController *)self isInSetupFlow]) {
    [(COSPreferencesAppController *)self retriggerNRAlertIfNeeded];
  }
  self->_backgrounded = 0;
}

- (id)_appSuspendStateDescription
{
  unsigned int v2 = [UIApp isSuspended];
  unsigned int v3 = [UIApp isSuspendedEventsOnly];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s = (isSuspended %d / isSuspendedEventsOnly %d / isSuspendedUnderLock %d)", "-[COSPreferencesAppController _appSuspendStateDescription]", v2, v3, [UIApp isSuspendedUnderLock]);
}

- (void)applicationWillResignActive:(id)a3
{
  id v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(Resign Active) End Scanning for Nearby Devices...", (uint8_t *)v9, 2u);
  }

  id v5 = +[PPDiscoveryManager sharedDiscoveryManager];
  [v5 end];

  id v6 = +[COSReachabilityMonitor sharedMonitor];
  [v6 stopMonitoring];

  if ([(BKSApplicationStateMonitor *)self->_appStateMonitor mostElevatedApplicationStateForPID:getpid()] == 8)
  {
    unsigned __int8 v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109378;
      v9[1] = 1210;
      __int16 v10 = 2080;
      int v11 = "-[COSPreferencesAppController applicationWillResignActive:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v9, 0x12u);
    }

    self->_settingsWasResigned = 1;
    self->_loadingExternalURL = 0;
    [(COSPreferencesAppController *)self _deregisterForPowerNotifications];
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"com.apple.PreferencesApp.willResignActive" object:0];
  }
}

- (BOOL)_devicePickerBeingPresented
{
  unsigned int v3 = [(COSPreferencesAppController *)self rootViewController];
  id v4 = [v3 presentedViewController];
  if (v4)
  {
    id v5 = [(COSPreferencesAppController *)self rootViewController];
    id v6 = [v5 presentedViewController];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_devicePickerNavigationController);
    BOOL v8 = v6 == WeakRetained;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v63 = a3;
  id v66 = a4;
  id v64 = a5;
  unsigned int v65 = [v64 objectForKeyedSubscript:UIApplicationOpenURLOptionsSourceApplicationKey];
  if (!self->_setupController && !self->_unpairingVC)
  {
    unsigned __int8 v14 = pbb_bridge_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v84 = v65;
      *(_WORD *)&v84[8] = 2112;
      *(void *)BOOL v85 = v66;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Launched by %@ with URL: %@", buf, 0x16u);
    }

    if ([v65 isEqualToString:@"com.apple.sharingd"])
    {
      uint64_t v62 = [v66 query];
      [v62 componentsSeparatedByString:@"&"];
      long long v81 = 0u;
      long long v82 = 0u;
      *(_OWORD *)id location = 0u;
      long long v80 = 0u;
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      int v16 = (char *)[v15 countByEnumeratingWithState:location objects:buf count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v80;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(void *)v80 != v17) {
              objc_enumerationMutation(v15);
            }
            __int16 v19 = [*((id *)location[1] + i) componentsSeparatedByString:@"="];
            if ([v19 count] == (id)2)
            {
              id v20 = [v19 firstObject];
              unsigned int v21 = [v20 isEqualToString:@"action"];

              if (v21)
              {
                int v16 = [v19 lastObject];

                goto LABEL_26;
              }
            }
          }
          int v16 = (char *)[v15 countByEnumeratingWithState:location objects:buf count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_26:

      unsigned int v25 = [v16 isEqualToString:@"StartPairing"];
      if (v25)
      {
        if (![(COSPreferencesAppController *)self _devicePickerBeingPresented])
        {
          double v26 = sub_100014784();
          BOOL v27 = [v26 count] == 0;

          if (!v27)
          {
            BOOL v28 = pbb_bridge_log();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Requesting device picker for prox pairing.", buf, 2u);
            }

            objc_initWeak((id *)buf, self);
            v73[0] = _NSConcreteStackBlock;
            v73[1] = 3221225472;
            v73[2] = sub_1000A7A68;
            v73[3] = &unk_100245E48;
            objc_copyWeak(&v78, (id *)buf);
            id v74 = v66;
            id v75 = v65;
            id v76 = v63;
            id v77 = v64;
            [(COSPreferencesAppController *)self setAppDelegateOnDismissalBlock:v73];
            [(COSPreferencesAppController *)self presentDevicePicker];

            objc_destroyWeak(&v78);
            objc_destroyWeak((id *)buf);

            goto LABEL_6;
          }
        }
        sub_100034068();
        +[PBBridgeCAReporter incrementSuccessType:18];
        [(COSPreferencesAppController *)self presentNewPairingFlowIfPossibleWithAnimation:1];
        int v42 = pbb_setupflow_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Launched to Prox Pairing", buf, 2u);
        }
        goto LABEL_60;
      }
      uint64_t v29 = [v66 pathExtension];
      if ([v29 caseInsensitiveCompare:@"watchface"])
      {
        id v30 = [v66 scheme];
        BOOL v31 = [v30 caseInsensitiveCompare:@"watchface"] == 0;

        if (!v31 && ![(COSPreferencesAppController *)self _isProductKitUrl:v66])
        {
          int v42 = pbb_bridge_log();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v84 = v62;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Unsupported URL query: %@", buf, 0xCu);
          }
LABEL_60:

          goto LABEL_61;
        }
      }
      else
      {
      }
      [(COSPreferencesAppController *)self presentGreenfieldViewControllerWithUrl:v66 options:v64];
LABEL_61:

LABEL_62:
      BOOL v12 = 1;
      goto LABEL_7;
    }
    self->_loadingExternalURL = 1;
    int v22 = [v66 scheme];
    BOOL v23 = [v22 caseInsensitiveCompare:@"bridge"] == 0;

    if (v23)
    {
      uint64_t v32 = [(COSPreferencesAppController *)self myWatchViewController];
      [(COSPreferencesAppController *)self setSelectedTabBarViewController:v32];

      long long v33 = [v66 resourceSpecifier];
      LODWORD(v32) = [v33 hasPrefix:@"FOLLOWUP"];

      if (v32)
      {
        double v34 = objc_alloc_init(COSAppleIDController);
        double v35 = [[COSBuddyNavigationController alloc] initWithRootViewController:v34];
        double v36 = [(COSBuddyNavigationController *)v35 navigationBar];
        BPSApplyStyleToNavBarOptions();

        id v37 = objc_alloc((Class)UIBarButtonItem);
        double v38 = +[NSBundle mainBundle];
        double v39 = [v38 localizedStringForKey:@"CANCEL" value:&stru_100249230 table:@"Localizable"];
        id v40 = [v37 initWithTitle:v39 style:0 target:self action:"doneFollowUp:"];

        double v41 = [(COSAppleIDController *)v34 navigationItem];
        [v41 setLeftBarButtonItem:v40];

        [(COSPreferencesRootController *)self->_settingsController presentViewController:v35 animated:1 completion:&stru_100245E68];
      }
      else
      {
        [(COSPreferencesAppController *)self processURL:v66];
      }
      goto LABEL_52;
    }
    __int16 v24 = [v66 pathExtension];
    if (v24)
    {
      id v5 = [v66 pathExtension];
      if (![v5 caseInsensitiveCompare:@"watchface"])
      {

LABEL_49:
        __int16 v45 = pbb_bridge_log();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Presenting add watch face flow", buf, 2u);
        }

        [(COSPreferencesAppController *)self presentGreenfieldViewControllerWithUrl:v66 options:v64];
        goto LABEL_52;
      }
    }
    __int16 v43 = [v66 scheme];
    id v44 = [v43 caseInsensitiveCompare:@"watchface"];

    if (v24)
    {

      if (!v44) {
        goto LABEL_49;
      }
    }
    else if (!v44)
    {
      goto LABEL_49;
    }
    if ([(COSPreferencesAppController *)self _isProductKitUrl:v66])
    {
      [(COSPreferencesAppController *)self presentGreenfieldViewControllerWithUrl:v66 options:v64];
LABEL_52:
      int v46 = pbb_bridge_log();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        id v47 = +[NSNumber numberWithBool:1];
        *(_DWORD *)buf = 138412802;
        *(void *)v84 = v66;
        *(_WORD *)&v84[8] = 2112;
        *(void *)BOOL v85 = v47;
        *(_WORD *)&v85[8] = 2112;
        v86[0] = v65;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "URL: %@ Will Open: %@ (from sourceApplication %@)", buf, 0x20u);
      }
      goto LABEL_62;
    }
    id v48 = [v66 scheme];
    BOOL v49 = [v48 caseInsensitiveCompare:@"facegallery"] == 0;

    if (v49)
    {
      v53 = [(COSPreferencesAppController *)self galleryViewController];
      id v54 = pbb_bridge_log();
      id v55 = v54;
      if (v53)
      {
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Switching to face gallery tab", buf, 2u);
        }

        v56 = [(COSPreferencesAppController *)self rootViewController];
        [v56 setSelectedViewController:v53];

        [(COSPreferencesAppController *)self setSelectedTabViewController:v53];
      }
      else
      {
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Opened URL for face gallery but view controller has not been initialized yet.", buf, 2u);
        }
      }
      goto LABEL_52;
    }
    v50 = [v66 scheme];
    v51 = +[NSBundle mainBundle];
    v52 = [v51 bundleIdentifier];
    if ([v50 caseInsensitiveCompare:v52])
    {
    }
    else
    {
      v57 = +[PSOAuthAccountRedirectURLController sharedInstance];
      unsigned int v58 = [v57 handleOAuthRedirectURL:v66];

      if (v58)
      {
        v59 = pbb_bridge_log();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v60 = [v66 scheme];
          double v61 = [v66 path];
          *(_DWORD *)buf = 138412546;
          *(void *)v84 = v60;
          *(_WORD *)&v84[8] = 2112;
          *(void *)BOOL v85 = v61;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Handled OAuth Redirect url %@:%@", buf, 0x16u);
        }
        goto LABEL_70;
      }
    }
    v59 = pbb_bridge_log();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v84 = v66;
      *(_WORD *)&v84[8] = 2112;
      *(void *)BOOL v85 = v64;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Unsupported URL Scheme: %@ / %@", buf, 0x16u);
    }
LABEL_70:

    goto LABEL_52;
  }
  objc_initWeak(location, self);
  __int16 v9 = pbb_bridge_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = self->_setupController != 0;
    BOOL v11 = self->_unpairingVC != 0;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v84 = v10;
    *(_WORD *)&v84[4] = 1024;
    *(_DWORD *)&v84[6] = v11;
    *(_WORD *)BOOL v85 = 2112;
    *(void *)&v85[2] = v66;
    LOWORD(v86[0]) = 2112;
    *(void *)((char *)v86 + 2) = v65;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setup active: %{BOOL}d unpair active: %{BOOL}d Queueing openURL: %@ (from sourceApplication %@)", buf, 0x22u);
  }

  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_1000A7B4C;
  v67[3] = &unk_100245E90;
  id v68 = v66;
  id v69 = v65;
  objc_copyWeak(&v72, location);
  id v70 = v63;
  id v71 = v64;
  [(COSPreferencesAppController *)self setAppDelegateOnDismissalBlock:v67];

  objc_destroyWeak(&v72);
  objc_destroyWeak(location);
LABEL_6:
  BOOL v12 = 0;
LABEL_7:

  return v12;
}

- (void)_schedulePendingAppDelegateIfPresent
{
  if ([(COSPreferencesAppController *)self resetSetupInProgress]
    || [(COSPreferencesAppController *)self dismissSetupInProgress]
    || self->_setupController
    || self->_unpairingVC
    || ([(COSPreferencesAppController *)self appDelegateOnDismissalBlock],
        __int16 v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    unsigned int v3 = [(COSPreferencesAppController *)self appDelegateOnDismissalBlock];

    if (v3)
    {
      id v4 = pbb_bridge_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v5 = self->_setupController != 0;
        BOOL v6 = self->_unpairingVC != 0;
        BOOL resetSetupInProgress = self->_resetSetupInProgress;
        BOOL dismissSetupInProgress = self->_dismissSetupInProgress;
        *(_DWORD *)buf = 67109888;
        BOOL v12 = v5;
        __int16 v13 = 1024;
        BOOL v14 = v6;
        __int16 v15 = 1024;
        BOOL v16 = resetSetupInProgress;
        __int16 v17 = 1024;
        BOOL v18 = dismissSetupInProgress;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pending url handling. setupController: %{BOOL}d, unpairingVC: %{BOOL}d resetSetupInProgress: %{BOOL}d dismissSetupInProgress: %{BOOL}d", buf, 0x1Au);
      }
    }
  }
  else
  {
    BOOL v10 = [(COSPreferencesAppController *)self appDelegateOnDismissalBlock];
    [(COSPreferencesAppController *)self setAppDelegateOnDismissalBlock:0];
    v10[2]();
  }
}

- (void)presentGreenfieldViewControllerWithUrl:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v7 objectForKeyedSubscript:UIApplicationOpenURLOptionsAnnotationKey];
  __int16 v9 = v8;
  if (!v8
    || ([v8 objectForKeyedSubscript:UIApplicationOpenURLOptionsSourceApplicationKey],
        (BOOL v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v10 = [v7 objectForKeyedSubscript:UIApplicationOpenURLOptionsSourceApplicationKey];
  }
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A7F54;
  v13[3] = &unk_100245EB8;
  objc_copyWeak(&v16, &location);
  id v11 = v6;
  id v14 = v11;
  id v12 = v10;
  id v15 = v12;
  [(COSPreferencesAppController *)self presentingControllerForModalByDismissingTopAlertIfPresentWithCompletion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)didTapOnLoadingFaceLibraryButton:(id)a3
{
  id v4 = [(COSPreferencesAppController *)self galleryViewController];
  [(COSPreferencesAppController *)self setSelectedTabBarViewController:v4];
}

- (BOOL)_isProductKitUrl:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = +[ProductKitCatalog isProductKitURL:v3];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)doneFollowUp:(id)a3
{
}

- (void)updateActiveWatchBridgeDomainAccessor
{
  id v3 = [(NRDevice *)self->_activeWatch valueForProperty:NRDevicePropertyPairingID];
  unsigned __int8 v4 = [(NRDevice *)self->_activeWatch valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
  activeWatchBridgeDomainAccessor = self->_activeWatchBridgeDomainAccessor;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = 0;
LABEL_10:
    self->_activeWatchBridgeDomainAccessor = v7;

    goto LABEL_11;
  }
  if (!activeWatchBridgeDomainAccessor
    || ([(NPSDomainAccessor *)activeWatchBridgeDomainAccessor pairingID],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v8 isEqual:v3],
        v8,
        (v9 & 1) == 0))
  {
    id v10 = objc_alloc((Class)NPSDomainAccessor);
    id v7 = (NPSDomainAccessor *)[v10 initWithDomain:kBridgeDomain pairingID:v3 pairingDataStore:v4];
    activeWatchBridgeDomainAccessor = self->_activeWatchBridgeDomainAccessor;
    goto LABEL_10;
  }
LABEL_11:
  id v11 = pbb_bridge_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = self->_activeWatchBridgeDomainAccessor;
    int v13 = 138412290;
    id v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updated Active Watch Bridge Settings Domain Accessor (%@)", (uint8_t *)&v13, 0xCu);
  }
}

- (id)_getStartedController
{
  getStartedViewController = self->_getStartedViewController;
  if (!getStartedViewController)
  {
    unsigned __int8 v4 = objc_alloc_init(COSGetStartedViewController);
    BOOL v5 = self->_getStartedViewController;
    self->_getStartedViewController = v4;

    [(COSGetStartedViewController *)self->_getStartedViewController setGetStartedDelegate:self];
    getStartedViewController = self->_getStartedViewController;
  }

  return getStartedViewController;
}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(COSPreferencesAppController *)self _rootControllerForSplitViewController:v5];
  id v7 = [v5 containerNavigationController];

  BOOL v8 = [v7 viewControllers];
  id v9 = [v8 count];

  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    id v11 = [v6 rootListController];
    id v12 = [v11 generalViewController];

    id v15 = v12;
    int v13 = +[NSArray arrayWithObjects:&v15 count:1];
    [v7 setViewControllers:v13];

    id v10 = v7;
  }

  return v10;
}

- (void)splitViewControllerDidPopToRootController:(id)a3
{
  id v6 = a3;
  if (([v6 isCollapsed] & 1) == 0)
  {
    unsigned __int8 v4 = [(COSPreferencesAppController *)self _rootControllerForSplitViewController:v6];
    id v5 = [v4 rootListController];
    [v5 selectGeneralCategory];
  }
}

- (id)bridgeSettingsTabBarItem
{
  unsigned int v2 = [(COSPreferencesAppController *)self myWatchViewController];
  id v3 = [v2 tabBarItem];

  return v3;
}

- (void)refreshUpdateBadge
{
  id v3 = [(COSPreferencesAppController *)self bridgeSettingsTabBarItem];
  [(COSPreferencesAppController *)self refreshUpdateBadgeWithTab:v3];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"com.apple.Bridge.badgeUpdate" object:0];
}

- (void)clearBridgeSettingsTabBarItemBadge
{
  unsigned int v2 = [(COSPreferencesAppController *)self bridgeSettingsTabBarItem];
  [v2 setBadgeValue:0];

  id v4 = [UIApp activeWatchBridgeDomainAccessor];
  [v4 removeObjectForKey:@"kBadgedForSoftwareUpdateKey"];
  id v3 = [v4 synchronize];
}

- (void)markGalleryTabAsVisited
{
  CFPreferencesSetAppValue(@"kShouldJumpToFaceGalleryKey", 0, @"com.apple.Bridge");

  CFPreferencesAppSynchronize(@"com.apple.Bridge");
}

- (id)urlForActivity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activityType];
  unsigned __int8 v6 = [v5 isEqualToString:@"com.apple.nano.passbook.provisioning"];

  if (v6)
  {
    id v7 = @"bridge:root=com.apple.NanoPassbookBridgeSettings%230";
LABEL_9:
    id v16 = +[NSURL URLWithString:v7];

    goto LABEL_11;
  }
  BOOL v8 = [v4 activityType];
  unsigned int v9 = [v8 isEqualToString:CSSearchableItemActionType];

  if (v9)
  {
    id v10 = [v4 userInfo];
    uint64_t v11 = [v10 objectForKey:CSSearchableItemActivityIdentifier];
  }
  else
  {
    id v12 = [v4 activityType];
    unsigned int v13 = [v12 isEqualToString:NSUserActivityTypeBrowsingWeb];

    if (!v13) {
      goto LABEL_10;
    }
    id v14 = [v4 webpageURL];
    unsigned int v15 = [(COSPreferencesAppController *)self _isProductKitUrl:v14];

    if (!v15) {
      goto LABEL_10;
    }
    id v10 = [v4 webpageURL];
    uint64_t v11 = [v10 absoluteString];
  }
  id v7 = (__CFString *)v11;

  if (v7) {
    goto LABEL_9;
  }
LABEL_10:
  id v16 = 0;
LABEL_11:

  return v16;
}

- (BOOL)shouldConsiderHoldingSuspendAssertion
{
  id v3 = [(COSSetupController *)self->_setupController linkUpgradeMonitor];
  unsigned int v4 = [v3 holdingAnyCompanionLinkPreference];

  BOOL v5 = self->_syncTrapUIEnabled && v4 == 0;
  BOOL v6 = !v5 && !self->_syncTrapUICompleted;
  id v7 = [UIApp bridgeController];
  unsigned int v8 = [v7 setupTransactionActive];

  if ([(COSPreferencesAppController *)self isActivelyPairing]) {
    int v9 = v6 & v8;
  }
  else {
    int v9 = 0;
  }
  id v10 = pbb_setupflow_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL syncTrapUIEnabled = self->_syncTrapUIEnabled;
    BOOL syncTrapUICompleted = self->_syncTrapUICompleted;
    int v14 = 136316418;
    unsigned int v15 = "-[COSPreferencesAppController shouldConsiderHoldingSuspendAssertion]";
    __int16 v16 = 1024;
    unsigned int v17 = v4;
    __int16 v18 = 1024;
    BOOL v19 = syncTrapUIEnabled;
    __int16 v20 = 1024;
    BOOL v21 = syncTrapUICompleted;
    __int16 v22 = 1024;
    unsigned int v23 = v8;
    __int16 v24 = 1024;
    int v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: holdingAnyCompanionLinkPreference: %{BOOL}d _syncTrapUIEnabled: %{BOOL}d _syncTrapUICompleted: %{BOOL}d setupTransactionActive: %{BOOL}d assertionRequired: %{BOOL}d", (uint8_t *)&v14, 0x2Au);
  }

  return v9;
}

- (void)presentSetupFlowAnimated:(BOOL)a3
{
}

- (void)dismissSetupFlowComplete:(BOOL)a3 animated:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A8D54;
  v4[3] = &unk_100245F60;
  v4[4] = self;
  BOOL v5 = a3;
  BOOL v6 = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)expireTaskAssertion:(id)a3
{
  unsigned int v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing Bridge Background Assertion!", buf, 2u);
  }

  if (self->_suspendAssertion)
  {
    if (self->_syncTrapUICompleted || self->_syncTrapUIEnabled)
    {
      BOOL v5 = pbb_setupflow_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        BOOL syncTrapUICompleted = self->_syncTrapUICompleted;
        BOOL syncTrapUIEnabled = self->_syncTrapUIEnabled;
        *(_DWORD *)buf = 67109376;
        BOOL v23 = syncTrapUICompleted;
        __int16 v24 = 1024;
        BOOL v25 = syncTrapUIEnabled;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Background Assertion Expired. syncTrapUICompleted: %{BOOL}d syncTrapUIEnabled: %{BOOL}d", buf, 0xEu);
      }

      unsigned int v8 = [(COSSetupController *)self->_setupController linkUpgradeMonitor];
      [v8 resetCompanionLinkPreference];

      goto LABEL_9;
    }
    int v9 = pbb_setupflow_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setup Background Assertion Expired - Reset Setup Flow!", buf, 2u);
    }

    id v10 = [(NRDevice *)self->_activeWatch valueForProperty:NRDevicePropertyIsPaired];
    unsigned int v11 = [v10 BOOLValue];

    if ([(COSPreferencesAppController *)self isInSetupFlow])
    {
      if (!v11)
      {
        [(COSPreferencesAppController *)self resetSetupFlowAnimated:0 forEvent:36];
        [(COSPreferencesAppController *)self dismissSetupFlowComplete:0 animated:0];
        dispatch_time_t v15 = dispatch_time(0, 100000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000A936C;
        block[3] = &unk_1002438A0;
        void block[4] = self;
        dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);
        goto LABEL_9;
      }
      int v12 = PBIsEarlyPairedSyncSupportedForDevice();
      unsigned int v13 = pbb_setupflow_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v14 = self->_syncTrapUIEnabled;
        *(_DWORD *)buf = 67109376;
        BOOL v23 = v12;
        __int16 v24 = 1024;
        BOOL v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setup Background Assertion Expired - supportsEarlyPairedSync %d syncTrapUIEnabled: %d", buf, 0xEu);
      }

      if (v12 && !self->_syncTrapUIEnabled)
      {
        v20[0] = @"obliterate";
        v20[1] = @"BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2";
        v21[0] = &__kCFBooleanTrue;
        v21[1] = &__kCFBooleanTrue;
        v20[2] = NRUnpairOptionUnpairAbortErrorReason;
        __int16 v16 = +[PBBridgeCAReporter descriptionForSuccessType:36];
        v21[2] = v16;
        unsigned int v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

        __int16 v18 = +[NRPairedDeviceRegistry sharedInstance];
        [v18 unpairWithDevice:self->_activeWatch withOptions:v17 operationHasBegun:&stru_100245F80];

        goto LABEL_9;
      }
    }
    [UIApp resetSetupFlowAnimated:0 forEvent:11];
LABEL_9:
    [(COSPreferencesAppController *)self resetSuspendAssertion];
  }
}

- (void)resetSettingsUIToHomeScreen
{
  [(PSSplitViewController *)self->_settingsSplitViewController containerNavigationController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A968C;
  v7[3] = &unk_1002438A0;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v2;
  id v3 = objc_retainBlock(v7);
  unsigned int v4 = [v2 transitionCoordinator];
  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    _DWORD v5[2] = sub_1000A9694;
    v5[3] = &unk_100245998;
    BOOL v6 = v3;
    [v4 animateAlongsideTransition:0 completion:v5];
  }
  else
  {
    ((void (*)(void *))v3[2])(v3);
  }
}

- (void)resetSetupFlowAnimated:(BOOL)a3 forEvent:(unint64_t)a4
{
  if (!self->_resetSetupInProgress && !self->_dismissSetupInProgress)
  {
    BOOL v9 = a3;
    self->_BOOL resetSetupInProgress = 1;
    id v10 = pbb_setupflow_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)BOOL v31 = 1849;
      *(_WORD *)&v31[4] = 2080;
      *(void *)&v31[6] = "-[COSPreferencesAppController resetSetupFlowAnimated:forEvent:]";
      __int16 v32 = 2048;
      unint64_t v33 = a4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%d %s: resetSetupFlowAnimated: called with event: %lu.", buf, 0x1Cu);
    }

    if (a4 >= 0x24)
    {
      unsigned int v11 = +[PBBridgeCAReporter descriptionForSuccessType:a4];
      NSLog(@"%@", v11);

      +[PBBridgeCAReporter incrementSuccessType:a4];
    }
    if ([(COSPreferencesAppController *)self isInSetupFlow])
    {
      int v12 = [(COSSetupController *)self->_setupController scannedDevice];
      unsigned int v13 = [v12 valueForProperty:NRDevicePropertyIsPaired];
      unsigned int v14 = [v13 BOOLValue];

      if (([(COSPreferencesAppController *)self syncTrapUIEnabled] | v14) == 1)
      {
        dispatch_time_t v15 = pbb_setupflow_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v16 = [v12 _bridgeConciseDebugDescription];
          *(_DWORD *)buf = 138412290;
          *(void *)BOOL v31 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "We were unpaired during SyncTrap, NR is tearing-down pairing with device %@", buf, 0xCu);
        }
      }
      else
      {
        dispatch_time_t v15 = +[PBBridgeCAReporter descriptionForSuccessType:a4];
        if (a4 <= 0x2C && ((1 << a4) & 0x1E0000001200) != 0)
        {
          unsigned int v17 = pbb_setupflow_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Marking abort reason as user requested", buf, 2u);
          }

          __int16 v18 = NRPairedDeviceRegistryAbortPairingUserRequested;
          dispatch_time_t v15 = v18;
        }
        BOOL v19 = pbb_setupflow_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)BOOL v31 = v15;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Reset event: %@", buf, 0xCu);
        }

        __int16 v20 = +[NRPairedDeviceRegistry sharedInstance];
        [v20 abortPairingWithReason:v15];
      }
    }
    [(COSPreferencesAppController *)self setSyncTrapUIEnabled:0];
    self->_BOOL syncTrapUICompleted = 0;
    BOOL v21 = +[COSBackupManager sharedBackupManager];
    [v21 reset];

    [(COSPreferencesAppController *)self resetSettingsUIToHomeScreen];
    objc_initWeak((id *)buf, self);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000A9C70;
    v28[3] = &unk_1002439E0;
    objc_copyWeak(&v29, (id *)buf);
    __int16 v22 = objc_retainBlock(v28);
    if (self->_setupController)
    {
      BOOL v23 = pbb_setupflow_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Had SetupController", v27, 2u);
      }

      if ([(COSSetupController *)self->_setupController hasStartedPairing])
      {
        __int16 v24 = pbb_setupflow_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)BOOL v27 = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "SetupController had started pairing: issue finalCleanup() after animation", v27, 2u);
        }

        [(COSPreferencesAppController *)self dismissSetupFlowAnimated:v9 refreshTabs:1 withCompletionHandler:v22];
        goto LABEL_37;
      }
      BOOL v25 = pbb_setupflow_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v27 = 0;
        double v26 = "SetupController had not yet started pairing: issue finalCleanup() inline";
        goto LABEL_35;
      }
    }
    else
    {
      BOOL v25 = pbb_setupflow_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v27 = 0;
        double v26 = "SetupController is missing. Issue finalCleanup() inline";
LABEL_35:
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v26, v27, 2u);
      }
    }

    ((void (*)(void *))v22[2])(v22);
LABEL_37:

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
    return;
  }
  BOOL v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL resetSetupInProgress = self->_resetSetupInProgress;
    BOOL dismissSetupInProgress = self->_dismissSetupInProgress;
    *(_DWORD *)buf = 136315650;
    *(void *)BOOL v31 = "-[COSPreferencesAppController resetSetupFlowAnimated:forEvent:]";
    *(_WORD *)&v31[8] = 1024;
    *(_DWORD *)&v31[10] = resetSetupInProgress;
    __int16 v32 = 1024;
    LODWORD(v33) = dismissSetupInProgress;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Skipping. resetSetupInProgress: %{BOOL}d dismissSetupInProgress: %{BOOL}d", buf, 0x18u);
  }
}

- (void)resetSetupFlowInternalSettings
{
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109634;
    v4[1] = 1935;
    __int16 v5 = 2080;
    BOOL v6 = "-[COSPreferencesAppController resetSetupFlowInternalSettings]";
    __int16 v7 = 2112;
    CFStringRef v8 = @"_COSInternalSettingForceSetupFlow";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%d %s: In %@ handler", (uint8_t *)v4, 0x1Cu);
  }

  [(COSPreferencesAppController *)self resetSetupFlowAnimated:1 forEvent:49];
}

- (void)presentSetupFlowWithMode:(unint64_t)a3 animated:(BOOL)a4
{
  if ([(COSPreferencesAppController *)self isInSetupFlow])
  {
    __int16 v7 = pbb_setupflow_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001738E8();
    }
  }
  else
  {
    CFStringRef v8 = [[COSSetupController alloc] initWithMode:a3];
    setupController = self->_setupController;
    self->_setupController = v8;

    id v10 = +[BPSBridgeAppContext shared];
    [v10 setInWatchSetupFlow:1];

    +[COSBruteForceNetworkReachabilityMonitor checkServerReachabilityWithCompletion:&stru_100245FA0];
    objc_initWeak(&location, self);
    unsigned int v11 = +[COSInternalUserStudyAssetManager URLString];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000AA3A0;
    v29[3] = &unk_100243810;
    objc_copyWeak(&v30, &location);
    +[COSBruteForceNetworkReachabilityMonitor checkServerReachability:v11 withCompletion:v29];

    int v12 = pbb_setupflow_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = self->_setupController;
      *(_DWORD *)buf = 138412290;
      unint64_t v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Presenting Setup controller %@!", buf, 0xCu);
    }

    unsigned int v14 = self->_rootViewController;
    if ([(COSPreferencesAppController *)self _devicePickerBeingPresented])
    {
      id WeakRetained = (COSSetupController *)objc_loadWeakRetained((id *)&self->_devicePickerNavigationController);

      __int16 v16 = pbb_bridge_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v33 = WeakRetained;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updated presenting controller for Setup UI to device picker nav controller: %@", buf, 0xCu);
      }
    }
    else
    {
      id WeakRetained = (COSSetupController *)v14;
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000AA478;
    v25[3] = &unk_100243930;
    objc_copyWeak(&v27, &location);
    unsigned int v17 = WeakRetained;
    double v26 = v17;
    BOOL v28 = a4;
    __int16 v18 = objc_retainBlock(v25);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000AA5A4;
    void v21[3] = &unk_100245FC8;
    BOOL v19 = v17;
    __int16 v22 = v19;
    BOOL v24 = a4;
    __int16 v20 = v18;
    id v23 = v20;
    [(COSPreferencesAppController *)self presentingControllerForModalByDismissingTopAlertIfPresentWithCompletion:v21];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
}

- (void)dismissSetupFlowAnimated:(BOOL)a3
{
}

- (void)dismissSetupFlowAnimated:(BOOL)a3 refreshTabs:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if ([(COSPreferencesAppController *)self isInSetupFlow])
  {
    if (self->_dismissSetupInProgress)
    {
      BOOL v9 = pbb_setupflow_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        id v10 = "Warning: Attempting to dismiss Setup while already another call in progress. Skipping!";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)buf, 2u);
      }
    }
    else
    {
      self->_BOOL dismissSetupInProgress = 1;
      unsigned int v11 = pbb_setupflow_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Dismissing Setup flow.", (uint8_t *)buf, 2u);
      }

      [(COSPreferencesAppController *)self refreshActiveWatchFromNanoRegistry];
      if (v5) {
        [(COSPreferencesAppController *)self refreshTabBar];
      }
      int v12 = [(COSSetupController *)self->_setupController navigationController];
      objc_initWeak(buf, self);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000AA96C;
      v16[3] = &unk_100245FF0;
      objc_copyWeak(&v20, buf);
      id v19 = v8;
      BOOL v9 = v12;
      BOOL v21 = a3;
      unsigned int v17 = v9;
      __int16 v18 = self;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000AAF3C;
      v14[3] = &unk_100246018;
      unsigned int v13 = objc_retainBlock(v16);
      id v15 = v13;
      [(COSPreferencesAppController *)self presentingControllerForModalByDismissingTopAlertIfPresentWithCompletion:v14];

      objc_destroyWeak(&v20);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    BOOL v9 = pbb_setupflow_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      id v10 = "Warning: Attempting to dismiss Setup when not presented!";
      goto LABEL_7;
    }
  }
}

- (void)unpairOrResetBuddyForEvent:(unint64_t)a3
{
  BOOL v5 = [(NRDevice *)self->_activeWatch valueForProperty:NRDevicePropertyIsPaired];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (self->_activeWatch && ((v6 & 1) != 0 || self->_isActivated))
  {
    __int16 v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v14 = "-[COSPreferencesAppController unpairOrResetBuddyForEvent:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s  - Unpairing", buf, 0xCu);
    }

    v11[0] = @"obliterate";
    v11[1] = @"BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2";
    v12[0] = &__kCFBooleanTrue;
    v12[1] = &__kCFBooleanTrue;
    id v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    BOOL v9 = +[NRPairedDeviceRegistry sharedInstance];
    [v9 unpairWithDevice:self->_activeWatch withOptions:v8 operationHasBegun:&stru_100246038];
  }
  else
  {
    id v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v14 = "-[COSPreferencesAppController unpairOrResetBuddyForEvent:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Reset Buddy!", buf, 0xCu);
    }

    [UIApp resetSetupFlowAnimated:1 forEvent:a3];
  }
}

- (void)disagreeToTerms
{
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10017391C();
  }

  [(COSPreferencesAppController *)self unpairOrResetBuddyForEvent:44];
}

- (void)newerCompanionRequired
{
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100173950();
  }

  unsigned int v4 = +[NSBundle mainBundle];
  BOOL v5 = [v4 localizedStringForKey:@"NEWER_COMPANION_NEEDED_TITLE" value:&stru_100249230 table:@"Localizable"];
  unsigned __int8 v6 = +[UIAlertController alertControllerWithTitle:v5 message:0 preferredStyle:1];

  __int16 v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000AB4AC;
  v13[3] = &unk_100243AE0;
  void v13[4] = self;
  BOOL v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v13];
  [v6 addAction:v9];

  id v10 = pbb_setupflow_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Presenting 'switch during update warning' alert", v12, 2u);
  }

  unsigned int v11 = [(COSPreferencesAppController *)self navigationController];
  [v11 presentViewController:v6 animated:1 completion:0];
}

- (void)didHandlePerformanceResults
{
  id v2 = pbb_setupflow_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Did Handle Performance Results", v3, 2u);
  }
}

- (void)updateForRemoteActivity:(id)a3
{
  id v4 = a3;
  if (self->_suspendAssertion)
  {
    BOOL v5 = pbb_setupflow_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bridge Renew Background Assertion for Remote Activity?", buf, 2u);
    }

    if ([(COSPreferencesAppController *)self shouldConsiderHoldingSuspendAssertion])
    {
      unsigned __int8 v6 = pbb_setupflow_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Bridge Renew Background Assertion for Remote Activity!", v7, 2u);
      }

      [(COSPreferencesAppController *)self _extendBackgroundAssertion];
    }
  }
}

- (void)remoteDidFailActivation:(unint64_t)a3 description:(id)a4
{
}

- (void)remoteDidFailActivation:(unint64_t)a3 description:(id)a4 userActionable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  BOOL v9 = pbb_setupflow_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    unint64_t v29 = (unint64_t)v8;
    __int16 v30 = 1024;
    LODWORD(v31[0]) = v5;
    WORD2(v31[0]) = 2048;
    *(void *)((char *)v31 + 6) = a3;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Activation Failed! (%@) User Actionable: %d Type: %lu", buf, 0x1Cu);
  }

  unint64_t activationRetryCount = self->_activationRetryCount;
  unint64_t activationRetryCountLimit = self->_activationRetryCountLimit;
  int v12 = pbb_activation_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (a3 == 10 || activationRetryCount >= activationRetryCountLimit)
  {
    if (v13)
    {
      unint64_t v17 = self->_activationRetryCountLimit;
      *(_DWORD *)buf = 134218240;
      unint64_t v29 = v17;
      __int16 v30 = 2048;
      v31[0] = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not retrying activation. Retry count %lu reason: %lu", buf, 0x16u);
    }

    uint64_t v18 = 37;
    __int16 v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    BOOL v24 = sub_1000AB8C4;
    BOOL v25 = &unk_1002437D0;
    if (v5) {
      uint64_t v18 = 50;
    }
    double v26 = self;
    uint64_t v27 = v18;
    id v19 = objc_retainBlock(&v22);
    setupController = self->_setupController;
    if (v5)
    {
      unint64_t v21 = 2;
    }
    else
    {
      if (!setupController)
      {
        ((void (*)(void ***))v19[2])(v19);
        goto LABEL_17;
      }
      unint64_t v21 = a3;
    }
    -[COSSetupController displayPairingFailureAlertForReason:withCompletion:](setupController, "displayPairingFailureAlertForReason:withCompletion:", v21, v19, v22, v23, v24, v25);
LABEL_17:

    goto LABEL_18;
  }
  if (v13)
  {
    unint64_t v14 = self->_activationRetryCount;
    unint64_t v15 = self->_activationRetryCountLimit;
    *(_DWORD *)buf = 134218240;
    unint64_t v29 = v14;
    __int16 v30 = 2048;
    v31[0] = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Retrying activation since the retry count is %lu and the retry limit of %lu hasn't been reached", buf, 0x16u);
  }

  __int16 v16 = [(COSPreferencesAppController *)self bridgeController];
  [v16 tellGizmoToRetryActivation];

  +[PBBridgeCAReporter incrementSuccessType:55];
  ++self->_activationRetryCount;
LABEL_18:
}

- (void)deviceIsSetup:(id)a3
{
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[COSPreferencesAppController deviceIsSetup:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [UIApp refreshUpdateBadge];
}

- (void)deviceUnpaired:(id)a3
{
  id v4 = a3;
  BOOL v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109634;
    *(_DWORD *)unsigned int v11 = 2242;
    *(_WORD *)&v11[4] = 2080;
    *(void *)&v11[6] = "-[COSPreferencesAppController deviceUnpaired:]";
    __int16 v12 = 2112;
    uint64_t v13 = NRPairedDeviceRegistryDeviceDidUnpairNotification;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%d %s: In %@ handler", (uint8_t *)&v10, 0x1Cu);
  }

  unsigned __int8 v6 = [v4 userInfo];

  __int16 v7 = [v6 objectForKey:NRPairedDeviceRegistryDevice];
  id v8 = pbb_setupflow_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [v7 _bridgeConciseDebugDescription];
    int v10 = 138412290;
    *(void *)unsigned int v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device Unpaired! (%@)", (uint8_t *)&v10, 0xCu);
  }
  if ([(COSPreferencesAppController *)self isInSetupFlow])
  {
    [(COSPreferencesAppController *)self resetSetupFlowAnimated:1 forEvent:10];
    [(COSPreferencesAppController *)self clearBridgeSettingsTabBarItemBadge];
  }
  [(COSPreferencesAppController *)self removeActiveDeviceAssertionFor:v7];
}

- (void)messageSendFailed:(id)a3
{
  id v4 = a3;
  BOOL v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v17 = 2259;
    __int16 v18 = 2080;
    id v19 = "-[COSPreferencesAppController messageSendFailed:]";
    __int16 v20 = 2112;
    uint64_t v21 = PBBridgeMessageFailedToSend;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%d %s: In %@ handler", buf, 0x1Cu);
  }

  unsigned __int8 v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKey:PBBridgeMessageError];
  id v8 = (void *)v7;
  BOOL v9 = @"Unknown Error";
  if (v7) {
    BOOL v9 = (__CFString *)v7;
  }
  int v10 = v9;

  unsigned int v11 = sub_100008380();
  __int16 v12 = pbb_setupflow_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100173984();
  }
  if (v11) {
    uint64_t v13 = 9;
  }
  else {
    uint64_t v13 = 0;
  }

  setupController = self->_setupController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000ABD5C;
  v15[3] = &unk_1002438A0;
  v15[4] = self;
  [(COSSetupController *)setupController displayPairingFailureAlertForReason:v13 withCompletion:v15];
}

- (void)pairingFailed:(id)a3
{
  id v4 = a3;
  BOOL v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v31 = 2274;
    __int16 v32 = 2080;
    unint64_t v33 = "-[COSPreferencesAppController pairingFailed:]";
    __int16 v34 = 2112;
    uint64_t v35 = NRPairedDeviceRegistryDeviceDidFailToPairNotification;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%d %s: In %@ handler", buf, 0x1Cu);
  }

  if ([(COSSetupController *)self->_setupController hasStartedPairing])
  {
    unsigned __int8 v6 = [v4 userInfo];
    uint64_t v7 = [v6 objectForKeyedSubscript:NRPairedDeviceRegistryError];
    id v8 = pbb_setupflow_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100173A64();
    }

    BOOL v9 = [v7 userInfo];
    int v10 = [v9 objectForKey:@"subreason"];

    CFPreferencesSetAppValue(PBBridgeLastNRFailureCode, v10, PBBridgeConnectionIdentifier);
    if (v7)
    {
      uint64_t v11 = (uint64_t)[v7 code];
      __int16 v12 = pbb_setupflow_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1001739EC(v11, v12);
      }
    }
    else
    {
      uint64_t v11 = 200;
    }
    BOOL v13 = v11 == 28;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000AC148;
    v29[3] = &unk_1002438A0;
    void v29[4] = self;
    unint64_t v14 = objc_retainBlock(v29);
    unint64_t v15 = [v7 domain];
    if ([v15 isEqualToString:@"com.apple.nanoregistry.pairingerror"])
    {
      __int16 v16 = self;
      uint64_t v17 = v11;
      __int16 v18 = v6;
      id v19 = v14;
      BOOL v20 = v13;
      uint64_t v21 = v10;
      id v22 = v4;
      id v23 = [v7 code];

      BOOL v24 = v23 == (id)25;
      id v4 = v22;
      int v10 = v21;
      BOOL v13 = v20;
      unint64_t v14 = v19;
      unsigned __int8 v6 = v18;
      uint64_t v11 = v17;
      self = v16;
      if (v24)
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
    }
    setupController = self->_setupController;
    if (setupController)
    {
      if (v11 == 1)
      {
        double v26 = [v7 userInfo];
        uint64_t v27 = [v26 objectForKeyedSubscript:@"previousDeviceID"];

        [(COSSetupController *)self->_setupController displayPairingFailureWatchAlreadyPairedToCompanion:v27 completion:v14];
      }
      else
      {
        [(COSSetupController *)setupController displayPairingFailureAlertForReason:v13 withCompletion:v14];
      }
    }
    else
    {
      BOOL v28 = pbb_setupflow_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Pairing Failed: called while _setupController is nil! Resetting silently with no alert.", buf, 2u);
      }

      ((void (*)(void *))v14[2])(v14);
    }
    goto LABEL_25;
  }
  unsigned __int8 v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Silencing pairing failure since user isn't pairing", buf, 2u);
  }
LABEL_26:
}

- (void)initialPairingFailed:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"error"];
  unsigned __int8 v6 = (void *)v5;
  uint64_t v7 = @"Unknown Error";
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  id v8 = v7;

  BOOL v9 = [v4 objectForKey:@"device"];
  int v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 _bridgeConciseDebugDescription];
  }
  else
  {
    uint64_t v11 = @"Unknown Device";
  }
  __int16 v12 = pbb_setupflow_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v18 = v4;
    __int16 v19 = 2112;
    BOOL v20 = v8;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Pairing Failed: %@ (%@ -- %@)", buf, 0x20u);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000AC3A0;
  v16[3] = &unk_1002438A0;
  void v16[4] = self;
  BOOL v13 = objc_retainBlock(v16);
  setupController = self->_setupController;
  if (setupController)
  {
    [(COSSetupController *)setupController displayPairingFailureAlertForReason:8 withCompletion:v13];
  }
  else
  {
    unint64_t v15 = pbb_setupflow_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100173ACC();
    }

    ((void (*)(void *))v13[2])(v13);
  }
}

- (void)enteredCompatibilityState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 67109634;
    int v19 = 2349;
    __int16 v20 = 2080;
    __int16 v21 = "-[COSPreferencesAppController enteredCompatibilityState:]";
    __int16 v22 = 2112;
    id v23 = (id)NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%d %s: In %@ handler", (uint8_t *)&v18, 0x1Cu);
  }

  unsigned __int8 v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKeyedSubscript:NRPairedDeviceRegistryDevice];
  id v8 = [v6 objectForKeyedSubscript:NRPairedDeviceRegistryCompatibilityStateKey];
  unsigned __int16 v9 = (unsigned __int16)[v8 unsignedIntValue];

  int v10 = +[NRPairedDeviceRegistry sharedInstance];
  id v11 = [v10 status];

  __int16 v12 = pbb_bridge_log();
  int v13 = v9;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v14 = [v7 _bridgeConciseDebugDescription];
    int v18 = 67109634;
    int v19 = v13;
    __int16 v20 = 2112;
    __int16 v21 = v14;
    __int16 v22 = 2048;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Entered Compatibility state: (%d) for device: (%@) with status: (%lu)", (uint8_t *)&v18, 0x1Cu);
  }
  if (v13 == 2 && v11 == (id)1)
  {
    self->_BOOL isUpdatingGizmoInSetupFlow = 1;
    if (![(COSPreferencesAppController *)self isInSetupFlow]) {
      [(COSPreferencesAppController *)self presentSetupFlowWithMode:1 animated:1];
    }
  }
  else if (v13 == 3)
  {
    __int16 v16 = pbb_setupflow_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109378;
      int v19 = 2367;
      __int16 v20 = 2080;
      __int16 v21 = "-[COSPreferencesAppController enteredCompatibilityState:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%d %s: Making sure we have a switch assertion", (uint8_t *)&v18, 0x12u);
    }

    uint64_t v17 = +[UIApplication sharedApplication];
    [v17 setActiveWatch:0 startedBlock:0 completionBlock:0];
  }
}

- (void)removeActiveDeviceAssertionFor:(id)a3
{
  id v4 = a3;
  activeWatchAssertion = self->_activeWatchAssertion;
  if (activeWatchAssertion)
  {
    unsigned __int8 v6 = [(NRActiveDeviceAssertion *)activeWatchAssertion device];
    uint64_t v7 = [v6 pairingID];
    id v8 = [v4 pairingID];
    unsigned int v9 = [v7 isEqual:v8];

    if (v9)
    {
      int v10 = pbb_bridge_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(NRActiveDeviceAssertion *)self->_activeWatchAssertion device];
        __int16 v12 = [v11 _bridgeConciseDebugDescription];
        int v14 = 136315394;
        unint64_t v15 = "-[COSPreferencesAppController removeActiveDeviceAssertionFor:]";
        __int16 v16 = 2112;
        uint64_t v17 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Removing active assertion for %@", (uint8_t *)&v14, 0x16u);
      }
      int v13 = [(COSPreferencesAppController *)self activeWatchAssertion];
      [v13 invalidate];

      [(COSPreferencesAppController *)self setActiveWatchAssertion:0];
    }
  }
}

- (void)removeActiveDeviveAssertionIfNotActive
{
  activeWatchAssertion = self->_activeWatchAssertion;
  if (activeWatchAssertion
    && ([(NRActiveDeviceAssertion *)activeWatchAssertion isActive] & 1) == 0)
  {
    id v4 = pbb_bridge_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(NRActiveDeviceAssertion *)self->_activeWatchAssertion device];
      unsigned __int8 v6 = [v5 _bridgeConciseDebugDescription];
      int v8 = 136315394;
      unsigned int v9 = "-[COSPreferencesAppController removeActiveDeviveAssertionIfNotActive]";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Removing inactive assertion for %@", (uint8_t *)&v8, 0x16u);
    }
    uint64_t v7 = [(COSPreferencesAppController *)self activeWatchAssertion];
    [v7 invalidate];

    [(COSPreferencesAppController *)self setActiveWatchAssertion:0];
  }
}

- (id)currentSpecifierIDPath
{
  id v2 = [(COSPreferencesRootController *)self->_settingsController viewControllers];
  id v3 = [v2 mutableCopy];

  if ((unint64_t)[v3 count] >= 2) {
    [v3 removeObjectAtIndex:0];
  }
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000ACA4C;
  v6[3] = &unk_100246060;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v4;
  [v3 enumerateObjectsUsingBlock:v6];

  return v4;
}

- (void)presentDevicePicker
{
}

- (void)presentDevicePicker:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[NSURL URLWithString:@"root=ActiveWatch"];
  if (v3)
  {
    id v7 = (id)v5;
    uint64_t v6 = +[NSURL URLWithString:@"root=ActiveWatch#TinkerWatchesOnly"];

    uint64_t v5 = v6;
  }
  id v8 = (id)v5;
  [(COSPreferencesAppController *)self processURL:v5 animated:1 fromSearch:0];
}

- (void)generateURL
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  double v41 = +[NSUserDefaults standardUserDefaults];
  id v4 = [(PSSplitViewController *)self->_settingsSplitViewController containerNavigationController];
  uint64_t v5 = [v4 topViewController];

  double v6 = 0.0;
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___PSViewControllerOffsetProtocol])
  {
    [v5 verticalContentOffset];
    double v6 = v7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v5 canBeShownFromSuspendedState] & 1) == 0)
  {
    id v8 = [(PSSplitViewController *)self->_settingsSplitViewController containerNavigationController];
    [v8 popRecursivelyToRootController];
  }
  id v40 = v5;
  unsigned int v9 = [(COSPreferencesRootController *)self->_settingsController rootListController];
  __int16 v10 = [v9 categoryController];
  id v11 = [v10 specifier];
  __int16 v12 = [v11 identifier];
  [v3 appendFormat:@"root=%@", v12];

  [v3 appendFormat:@"#%0.0f" v6];
  int v13 = [(PSSplitViewController *)self->_settingsSplitViewController containerNavigationController];
  int v14 = [v13 viewControllers];
  id v15 = +[NSArray arrayWithArray:v14];

  int v42 = v3;
  if ((unint64_t)[v15 count] >= 2)
  {
    __int16 v16 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 1, (char *)[v15 count] - 1);
    uint64_t v17 = [v15 objectsAtIndexes:v16];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v15 = v17;
    id v18 = [v15 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v46;
      char v44 = 1;
      uint64_t v43 = PSIDKey;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v46 != v20) {
            objc_enumerationMutation(v15);
          }
          __int16 v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v23 = v15;
            BOOL v24 = [v22 specifier];
            BOOL v25 = [v24 identifier];

            double v26 = [v22 specifier];
            uint64_t v27 = [v26 propertyForKey:v43];

            if (!v27)
            {
              BOOL v28 = [v22 specifier];
              unint64_t v29 = [v22 specifier];
              __int16 v30 = [v29 identifier];
              [v28 setProperty:v30 forKey:v43];

              id v3 = v42;
            }
            if (![v22 canBeShownFromSuspendedState])
            {

              id v15 = v23;
              goto LABEL_26;
            }
            float v31 = 0.0;
            if ([v22 conformsToProtocol:&OBJC_PROTOCOL___PSViewControllerOffsetProtocol])
            {
              [v22 verticalContentOffset];
              float v31 = v32;
            }
            if (v44) {
              CFStringRef v33 = @"&path=%@";
            }
            else {
              CFStringRef v33 = @"/%@";
            }
            [v3 appendFormat:v33, v25];
            __int16 v34 = +[NSString stringWithFormat:@"#%0.0f", v31];
            [v3 appendString:v34];

            char v44 = 0;
            id v15 = v23;
          }
        }
        id v19 = [v15 countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
LABEL_26:
  }
  uint64_t v35 = +[NSDate date];
  [v35 timeIntervalSince1970];
  id v37 = +[NSNumber numberWithInt:(int)v36];
  [v41 setObject:v37 forKey:@"kPreferencePositionTimeStampKey"];

  double v38 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  double v39 = [v42 stringByAddingPercentEncodingWithAllowedCharacters:v38];
  [v41 setObject:v39 forKey:@"kPreferencePositionKey"];

  [v41 synchronize];
}

- (void)presentDevicePickerControllerWith:(BOOL)a3
{
  if (self->_setupController || self->_unpairingVC)
  {
    id v4 = pbb_bridge_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = self->_setupController != 0;
      BOOL v6 = self->_unpairingVC != 0;
      *(_DWORD *)buf = 136315650;
      BOOL v28 = "-[COSPreferencesAppController presentDevicePickerControllerWith:]";
      __int16 v29 = 1024;
      BOOL v30 = v5;
      __int16 v31 = 1024;
      BOOL v32 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: skipping device picker presentation. _setupController: %{BOOL}d unpairingVC: %{BOOL}d", buf, 0x18u);
    }
  }
  else
  {
    BOOL v7 = a3;
    id v8 = objc_opt_new();
    unsigned int v9 = objc_opt_new();
    [v9 setTinkerOnly:v7];
    [v8 setSpecifierDataSource:v9];
    [v8 setLaunchedByNanoRegistry:[self launchedByNanoRegistry]];
    objc_initWeak((id *)buf, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000AD3F4;
    v25[3] = &unk_1002439E0;
    objc_copyWeak(&v26, (id *)buf);
    __int16 v10 = objc_retainBlock(v25);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000AD4B8;
    void v21[3] = &unk_100246088;
    objc_copyWeak(&v24, (id *)buf);
    id v4 = v8;
    __int16 v22 = v4;
    id v11 = v10;
    id v23 = v11;
    __int16 v12 = objc_retainBlock(v21);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000AD5F8;
    v16[3] = &unk_1002460B0;
    objc_copyWeak(&v20, (id *)buf);
    id v13 = v9;
    id v17 = v13;
    int v14 = v11;
    id v18 = v14;
    id v15 = v12;
    id v19 = v15;
    [(COSPreferencesAppController *)self presentingControllerForModalByDismissingTopAlertIfPresentWithCompletion:v16];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
}

- (void)setDevicePickerPresented:(BOOL)a3
{
  if (self->_devicePickerPresented && !a3)
  {
    BOOL v5 = [(COSPreferencesAppController *)self settingsListController];
    [v5 loadSpolightSearchControllers];
  }
  self->_devicePickerPresented = a3;
}

- (void)_activateTinkerWatchWithCSN:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NRPairedDeviceRegistry sharedInstance];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000ADEA0;
  v13[3] = &unk_100246170;
  id v14 = v6;
  id v9 = v6;
  __int16 v10 = [v8 getAllDevicesWithArchivedAltAccountDevicesMatching:v13];

  id v11 = pbb_bridge_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Matching Tinker Devices: %@", buf, 0xCu);
  }

  __int16 v12 = [v10 firstObject];
  if (v12) {
    [(COSPreferencesAppController *)self setActiveWatch:v12 startedBlock:0 completionBlock:v7];
  }
}

- (void)_setOffsetForController:(id)a3 fromObjectPair:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  id v6 = [v5 objectForKeyedSubscript:@"offsetValue"];
  [v6 floatValue];
  float v8 = v7;

  if (v8 < 0.0) {
    float v8 = 0.0;
  }
  id v9 = [v5 objectForKeyedSubscript:@"offsetItem"];

  if ([v11 conformsToProtocol:&OBJC_PROTOCOL___PSViewControllerOffsetProtocol])
  {
    if (v8 == 0.0)
    {
      if ([v9 length]) {
        [v11 setDesiredVerticalContentOffsetItemNamed:v9];
      }
    }
    else
    {
      *(float *)&double v10 = v8;
      [v11 setDesiredVerticalContentOffset:v10];
    }
  }
}

- (void)_performURLHandlingForRootListController:(id)a3 controller:(id)a4 dictionary:(id)a5 items:(id)a6 controllerNeedsPush:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [v13 objectForKeyedSubscript:@"animate"];
  id v16 = [v15 BOOLValue];

  id v17 = [v13 objectForKeyedSubscript:@"fromSearch"];
  unsigned int v18 = [v17 BOOLValue];

  id v19 = pbb_bridge_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v12;
    __int16 v34 = 2112;
    id v35 = v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Handle controller %@ with root controller %@", buf, 0x16u);
  }

  char v31 = 0;
  if ([v14 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v20 = [v14 objectAtIndexedSubscript:0];
    __int16 v21 = SFObjectAndOffsetForURLPair();

    __int16 v22 = [v21 objectForKeyedSubscript:@"object"];
    if (v22) {
      unsigned int v23 = [v12 prepareHandlingURLForSpecifierID:v22 resourceDictionary:v13 animatePush:&v31] ^ 1;
    }
    else {
      LOBYTE(v23) = 0;
    }

    if (!v7) {
      goto LABEL_16;
    }
  }
  else
  {
    LOBYTE(v23) = 0;
    if (!v7)
    {
LABEL_16:
      BOOL v24 = 0;
      goto LABEL_17;
    }
  }
  if (v31) {
    BOOL v24 = v23;
  }
  else {
    BOOL v24 = 0;
  }
  if (!v24 && ((v16 ^ 1) & 1) == 0) {
    BOOL v24 = [v14 count] == 0;
  }
LABEL_17:
  int v25 = 0;
  if ((v16 & v18) == 1 && !v24)
  {
    if ((sub_100033FE8() & 1) != 0 || (unint64_t)[v14 count] >= 2)
    {
      id v26 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v14 count]);
      uint64_t v27 = v26;
      if (v7) {
        [v26 addObject:v12];
      }
      [v13 setObject:v27 forKeyedSubscript:@"controllers"];

      int v25 = 1;
    }
    else
    {
      int v25 = 0;
    }
  }
  +[UIView setAnimationsEnabled:v16];
  if ((v25 & 1) == 0 && v7)
  {
    BOOL v28 = [v11 splitViewController];
    [v28 showInitialViewController:v12];

    __int16 v29 = pbb_bridge_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Push Controller: %@", buf, 0xCu);
    }
  }
  if ((v23 & 1) == 0)
  {
    BOOL v30 = pbb_bridge_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v12;
      __int16 v34 = 2112;
      id v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Handling URL... Controller %@ to handle %@", buf, 0x16u);
    }

    [v12 handleURL:v13 withCompletion:0];
  }
  +[UIView enableAnimation];
  if (v25) {
    [v13 removeObjectForKey:@"controllers"];
  }
}

- (id)_splitViewControllerForRootController:(id)a3
{
  id v3 = self->_settingsSplitViewController;

  return v3;
}

- (id)_rootControllerForSplitViewController:(id)a3
{
  id v3 = self->_settingsController;

  return v3;
}

- (void)popToRootOfSettingsSelectGeneral:(BOOL)a3
{
}

- (void)popToRootOfSettingsSelectGeneral:(BOOL)a3 performWithoutDeferringTransitions:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v15 = "-[COSPreferencesAppController popToRootOfSettingsSelectGeneral:performWithoutDeferringTransitions:]";
    __int16 v16 = 1024;
    BOOL v17 = v5;
    __int16 v18 = 1024;
    BOOL v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: selectGeneral: %{BOOL}d performWithoutDeferring: %{BOOL}d", buf, 0x18u);
  }

  float v8 = [(COSPreferencesRootController *)self->_settingsController rootListController];
  id v9 = v8;
  if (v4)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    void v12[2] = sub_1000AEA80;
    v12[3] = &unk_1002438A0;
    id v13 = v8;
    +[UIViewController _performWithoutDeferringTransitions:v12];
    double v10 = v13;
  }
  else
  {
    double v10 = [v8 navigationController];
    id v11 = [v10 popToRootViewControllerAnimated:0];
  }

  if (v5
    && ([(PSSplitViewController *)self->_settingsSplitViewController isCollapsed] & 1) == 0)
  {
    [v9 selectGeneralCategoryForced:1];
  }
}

- (void)popToTopLevelSettingsAnimated:(BOOL)a3
{
}

- (void)_popToTopLevelSettingsAnimated:(BOOL)a3 dismissPresentedViewController:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    setupController = self->_setupController;
    BOOL v9 = self->_unpairingVC != 0;
    *(_DWORD *)buf = 136316162;
    BOOL v32 = "-[COSPreferencesAppController _popToTopLevelSettingsAnimated:dismissPresentedViewController:]";
    __int16 v33 = 1024;
    *(_DWORD *)__int16 v34 = v5;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = v4;
    __int16 v35 = 1024;
    BOOL v36 = v9;
    __int16 v37 = 1024;
    BOOL v38 = setupController != 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s animated: %i dismissPresented: %i _unpairingVC: %{BOOL}d, _setupController: %{BOOL}d", buf, 0x24u);
  }

  double v10 = [(PSSplitViewController *)self->_settingsSplitViewController viewControllers];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000AEF04;
  v28[3] = &unk_100246208;
  BOOL v29 = v5;
  [v10 enumerateObjectsWithOptions:2 usingBlock:v28];

  Class v11 = NSClassFromString(@"MCUINavigationViewController");
  char isKindOfClass = (char)v11;
  if (v11)
  {
    id v13 = [(COSPreferencesAppController *)self rootViewController];
    id v14 = [v13 presentedViewController];
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  if (v4
    && (isKindOfClass & 1) == 0
    && !self->_isUpdatingGizmoInSetupFlow
    && !self->_setupController
    && !self->_unpairingVC)
  {
    if ([(COSPreferencesAppController *)self _devicePickerBeingPresented])
    {
      p_devicePickerNavigationController = &self->_devicePickerNavigationController;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_devicePickerNavigationController);
      BOOL v17 = [WeakRetained viewControllers];

      if ([v17 count])
      {
        id v18 = objc_loadWeakRetained((id *)p_devicePickerNavigationController);
        BOOL v19 = [v17 objectAtIndexedSubscript:0];
        BOOL v30 = v19;
        id v20 = +[NSArray arrayWithObjects:&v30 count:1];
        [v18 setViewControllers:v20 animated:0];
      }
      id v21 = objc_loadWeakRetained((id *)p_devicePickerNavigationController);
      __int16 v22 = [v21 presentedViewController];

      unsigned int v23 = pbb_bridge_log();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v24)
        {
          id v25 = objc_loadWeakRetained((id *)p_devicePickerNavigationController);
          *(_DWORD *)buf = 136315394;
          BOOL v32 = "-[COSPreferencesAppController _popToTopLevelSettingsAnimated:dismissPresentedViewController:]";
          __int16 v33 = 2112;
          *(void *)__int16 v34 = v25;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Dismissing up to device picker: %@", buf, 0x16u);
        }
        unsigned int v23 = objc_loadWeakRetained((id *)p_devicePickerNavigationController);
        [v23 dismissViewControllerAnimated:1 completion:0];
      }
      else if (v24)
      {
        *(_DWORD *)buf = 136315138;
        BOOL v32 = "-[COSPreferencesAppController _popToTopLevelSettingsAnimated:dismissPresentedViewController:]";
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Staying in device picker UI", buf, 0xCu);
      }
    }
    else
    {
      id v26 = pbb_bridge_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [(COSPreferencesAppController *)self rootViewController];
        *(_DWORD *)buf = 136315394;
        BOOL v32 = "-[COSPreferencesAppController _popToTopLevelSettingsAnimated:dismissPresentedViewController:]";
        __int16 v33 = 2112;
        *(void *)__int16 v34 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: Dismissing up to root: %@", buf, 0x16u);
      }
      BOOL v17 = [(COSPreferencesAppController *)self rootViewController];
      [v17 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)_scrollToTopOfSettingsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = pbb_setup_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scroll to top of Settings", v9, 2u);
  }

  id v6 = [(COSPreferencesRootController *)self->_settingsController rootListController];
  BOOL v7 = [v6 table];
  float v8 = +[NSIndexPath indexPathForRow:0 inSection:0];
  [v7 scrollToRowAtIndexPath:v8 atScrollPosition:1 animated:v3];
}

- (void)_deregisterForPowerNotifications
{
  if (self->_pmSource)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, self->_pmSource, kCFRunLoopDefaultMode);
    CFRelease(self->_pmSource);
    self->_pmSource = 0;
    IODeregisterForSystemPower(&self->_pmNotifier);
    IONotificationPortDestroy(self->_systemPowerPortRef);
    IOServiceClose(self->_rootDomainConnect);
    self->_rootDomainConnect = 0;
  }
}

- (void)systemDidWake:(id)a3
{
}

- (void)refreshActiveWatchFromNanoRegistry
{
  -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(COSPreferencesAppController *)self updateActiveWatch:v3];
}

- (void)performTasksOnActiveDeviceUpdate
{
  id v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[COSPreferencesAppController performTasksOnActiveDeviceUpdate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(COSPreferencesAppController *)self deviceSpecificRepairSteps:self->_activeWatch];
  [(COSPreferencesAppController *)self refreshUpdateBadge];
}

- (void)performDeviceSpecificRepairStepsForActiveDevice
{
}

- (void)configureStartupStateForActiveDevice
{
  if (self->_activeWatch)
  {
    id v3 = +[NRPairedDeviceRegistry sharedInstance];
    unsigned int v4 = [v3 compatibilityState];

    if (v4 == 2
      || ([(COSSetupController *)self->_setupController pairingCompatiblity],
          BOOL v5 = objc_claimAutoreleasedReturnValue(),
          unsigned int v6 = [v5 runUpdateInSetup],
          v5,
          v6))
    {
      BOOL v7 = [(NRDevice *)self->_activeWatch valueForProperty:NRDevicePropertyIsSetup];
      unsigned int v8 = [v7 BOOLValue];

      if (v8)
      {
        self->_int isUpdatingInRevLock = 1;
        BOOL v9 = pbb_bridge_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315138;
          v17[0] = "-[COSPreferencesAppController configureStartupStateForActiveDevice]";
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - _isUpdatingInRevLock -> YES", (uint8_t *)&v16, 0xCu);
        }
      }
      else
      {
        double v10 = pbb_bridge_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315138;
          v17[0] = "-[COSPreferencesAppController configureStartupStateForActiveDevice]";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s - isUpdatingGizmoInSetupFlow -> YES", (uint8_t *)&v16, 0xCu);
        }

        self->_BOOL isUpdatingGizmoInSetupFlow = 1;
      }
    }
    else
    {
      Class v11 = [(NRDevice *)self->_activeWatch valueForProperty:NRDevicePropertyIsSetup];
      unsigned int v12 = [v11 BOOLValue];

      id v13 = [(NRDevice *)self->_activeWatch valueForProperty:_NRDevicePropertyStatusCode];
      if ([v13 integerValue] == (id)4) {
        self->_deviceIsBeingMigrated = 1;
      }
      if (v12)
      {
        self->_BOOL isUpdatingGizmoInSetupFlow = 0;
        self->_int isUpdatingInRevLock = 0;
        if (v4 == 3)
        {
          id v14 = pbb_bridge_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v16 = 67109378;
            LODWORD(v17[0]) = 3292;
            WORD2(v17[0]) = 2080;
            *(void *)((char *)v17 + 6) = "-[COSPreferencesAppController configureStartupStateForActiveDevice]";
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%d %s - Telling NR to Enter Normal Compatibility state", (uint8_t *)&v16, 0x12u);
          }

          id v15 = +[NRPairedDeviceRegistry sharedInstance];
          [v15 enterCompatibilityState:4 forDevice:self->_activeWatch];
        }
      }
    }
  }
  else
  {
    self->_BOOL isUpdatingGizmoInSetupFlow = 0;
  }
}

- (void)transportBecameReachable
{
  if (self->_transportReachabilityAlert)
  {
    id v3 = pbb_setupflow_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100173B00();
    }

    [(UIAlertController *)self->_transportReachabilityAlert dismissViewControllerAnimated:1 completion:0];
    transportReachabilityAlert = self->_transportReachabilityAlert;
    self->_transportReachabilityAlert = 0;
  }
}

- (void)transportBecameUnreachable
{
  p_transportReachabilityAlert = &self->_transportReachabilityAlert;
  if (self->_transportReachabilityAlert)
  {
    id v3 = pbb_setupflow_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100173B68((uint64_t)p_transportReachabilityAlert, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  else
  {
    Class v11 = +[NSBundle mainBundle];
    unsigned int v12 = [v11 localizedStringForKey:@"TROUBLE_CONNECTING" value:&stru_100249230 table:@"Localizable"];
    id v13 = +[NSBundle mainBundle];
    id v14 = [v13 localizedStringForKey:@"TROUBLE_CONNECTING_MESSAGE" value:&stru_100249230 table:@"Localizable"];
    id v15 = +[UIAlertController alertControllerWithTitle:v12 message:v14 preferredStyle:1];

    int v16 = +[NSBundle mainBundle];
    BOOL v17 = [v16 localizedStringForKey:@"TRY_AGAIN_BUTTON" value:&stru_100249230 table:@"Localizable"];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000AF94C;
    v26[3] = &unk_100243AE0;
    void v26[4] = self;
    id v18 = +[UIAlertAction actionWithTitle:v17 style:1 handler:v26];
    [(UIAlertController *)v15 addAction:v18];

    BOOL v19 = +[NSBundle mainBundle];
    id v20 = [v19 localizedStringForKey:@"RESET_PAIRING_BUTTON" value:&stru_100249230 table:@"Localizable"];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000AF9CC;
    v25[3] = &unk_100243AE0;
    void v25[4] = self;
    id v21 = +[UIAlertAction actionWithTitle:v20 style:2 handler:v25];
    [(UIAlertController *)v15 addAction:v21];

    __int16 v22 = [(COSSetupController *)self->_setupController navigationController];
    [v22 presentViewController:v15 animated:1 completion:0];

    unsigned int v23 = *p_transportReachabilityAlert;
    *p_transportReachabilityAlert = v15;
    id v3 = v15;

    BOOL v24 = pbb_setupflow_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100173B34();
    }
  }
}

- (void)setSelectedTabBarViewController:(id)a3
{
  id obj = a3;
  uint64_t v4 = [(COSPreferencesAppController *)self rootViewController];
  [v4 setSelectedViewController:obj];

  id v5 = objc_storeWeak((id *)&self->_selectedTabViewController, obj);
  [(COSPreferencesAppController *)self reportTabState:obj];
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v5 = (NSUserActivity *)a4;
  [(COSPreferencesAppController *)self _tintTabBarWithViewController:v5];
  id WeakRetained = (NSUserActivity *)objc_loadWeakRetained((id *)&self->_selectedTabViewController);

  settingsSplitViewController = self->_settingsSplitViewController;
  uint64_t v8 = pbb_setup_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    +[NSNumber numberWithBool:WeakRetained == v5];
    uint64_t v9 = (NSUserActivity *)objc_claimAutoreleasedReturnValue();
    int v26 = 138412290;
    uint64_t v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reselected the same tab: %@", (uint8_t *)&v26, 0xCu);
  }
  double v10 = pbb_setup_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412290;
    uint64_t v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Selected Controller: %@", (uint8_t *)&v26, 0xCu);
  }

  if (WeakRetained == v5)
  {
    if (settingsSplitViewController == (PSSplitViewController *)v5)
    {
      id v13 = [(COSPreferencesRootController *)self->_settingsController rootListController];
      id v14 = [v13 navigationController];
      id v15 = [v14 viewControllers];
      id v16 = [v15 count];

      if ((unint64_t)v16 > 1)
      {
        if (![(COSPreferencesAppController *)self onlySatellitePairedAndInactive])
        {
          BOOL v17 = pbb_setup_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v26) = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Pop to root of Settings", (uint8_t *)&v26, 2u);
          }

          id v18 = [(NSUserActivity *)v5 view];
          [v18 setUserInteractionEnabled:0];

          [(COSPreferencesAppController *)self popToTopLevelSettingsAnimated:1];
        }
      }
      else
      {
        [(COSPreferencesAppController *)self _scrollToTopOfSettingsAnimated:1];
      }
    }
    else
    {
      Class v11 = [(NSUserActivity *)v5 contentScrollView];
      [v11 adjustedContentInset];
      [v11 setContentOffset:1 animated:0.0 -v12];
    }
  }
  else
  {
    -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  }
  BOOL v19 = [(COSPreferencesAppController *)self galleryViewController];
  if (v19 == v5)
  {
    galleryTTRUserActivity = self->_galleryTTRUserActivity;

    if (!galleryTTRUserActivity)
    {
      __int16 v22 = (NSUserActivity *)[objc_alloc((Class)BPSTTRMetadata) initWithComponent:1];
      BOOL v24 = +[BPSTapToRadarCoordinator tapToRadarUserActivityWithInitialMetadata:v22];
      id v25 = self->_galleryTTRUserActivity;
      self->_galleryTTRUserActivity = v24;

      [(NSUserActivity *)self->_galleryTTRUserActivity becomeCurrent];
      goto LABEL_22;
    }
  }
  else
  {
  }
  id v21 = [(COSPreferencesAppController *)self galleryViewController];
  __int16 v22 = v5;
  if (v21 == v5)
  {
LABEL_22:

    goto LABEL_23;
  }
  unsigned int v23 = self->_galleryTTRUserActivity;

  if (v23)
  {
    [(NSUserActivity *)self->_galleryTTRUserActivity invalidate];
    __int16 v22 = self->_galleryTTRUserActivity;
    self->_galleryTTRUserActivity = 0;
    goto LABEL_22;
  }
LABEL_23:
  [(COSPreferencesAppController *)self reportTabState:v5];
  objc_storeWeak((id *)&self->_selectedTabViewController, v5);
}

- (void)_networkingStartNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AFE9C;
  block[3] = &unk_1002438A0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_networkingStopNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AFF7C;
  block[3] = &unk_1002438A0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)refreshTabBar
{
  id v3 = [(COSPreferencesAppController *)self rootViewController];
  uint64_t v4 = [(COSPreferencesAppController *)self _viewControllers];
  [v3 setViewControllers:v4];

  id v5 = [(COSPreferencesAppController *)self rootViewController];
  uint64_t v6 = [v5 selectedViewController];
  [(COSPreferencesAppController *)self _tintTabBarWithViewController:v6];

  [(COSPreferencesAppController *)self _refreshTabBarVisibility];
}

- (void)_refreshTabBarVisibility
{
  id v3 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  uint64_t v4 = [v3 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned int v5 = [v4 BOOLValue];

  uint64_t v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    id v14 = "-[COSPreferencesAppController _refreshTabBarVisibility]";
    __int16 v15 = 1024;
    unsigned int v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: isTinker: %i", (uint8_t *)&v13, 0x12u);
  }

  uint64_t v7 = [(COSPreferencesAppController *)self rootViewController];
  uint64_t v8 = v7;
  if (v5)
  {
    uint64_t v9 = [v7 viewControllers];
    double v10 = [(COSPreferencesAppController *)self myWatchViewController];
    unsigned int v11 = [v9 containsObject:v10];

    if (v11)
    {
      double v12 = [(COSPreferencesAppController *)self myWatchViewController];
      [(COSPreferencesAppController *)self setSelectedTabViewController:v12];
    }
    uint64_t v8 = [(COSPreferencesAppController *)self rootViewController];
    [v8 hideBarWithTransition:0];
  }
  else
  {
    [v7 showBarWithTransition:0];
  }
}

- (void)presentUnpairingViewControllerAnimated:(BOOL)a3
{
  if (self->_unpairingVC)
  {
    uint64_t v4 = pbb_bridge_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = self->_unpairingVC != 0;
      BOOL v6 = self->_setupController != 0;
      BOOL v7 = self->_rootViewController != 0;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)BOOL v29 = v5;
      *(_WORD *)&void v29[4] = 1024;
      *(_DWORD *)&v29[6] = v6;
      __int16 v30 = 1024;
      BOOL v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Skipping Presenting Unpairing UI - Already showing: %{BOOL}d setupController: %{BOOL}d _rootViewController: %{BOOL}d", buf, 0x14u);
    }

    self->_pendingUnpairUIPresentation = 0;
  }
  else if (self->_setupController || !self->_rootViewController)
  {
    uint64_t v8 = pbb_bridge_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Marked unpairing wait until post setup controller cleanup.", buf, 2u);
    }

    self->_pendingUnpairUIPresentation = 1;
  }
  else
  {
    double v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Presenting Unpairing UI - Waiting for NR to be ready (Unpairing)...", buf, 2u);
    }

    unsigned int v11 = objc_alloc_init(COSUnpairingViewController);
    unpairingVC = self->_unpairingVC;
    self->_unpairingVC = v11;

    self->_pendingUnpairUIPresentation = 0;
    [(COSUnpairingViewController *)self->_unpairingVC setModalInPresentation:1];
    self->_dismissUnpairUIOnPresentation = 0;
    int v13 = self->_rootViewController;
    if ([(COSPreferencesAppController *)self _devicePickerBeingPresented])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_devicePickerNavigationController);

      __int16 v15 = pbb_bridge_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)BOOL v29 = WeakRetained;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updated presenting controller for Unpair UI to device picker nav controller: %@", buf, 0xCu);
      }
    }
    else
    {
      id WeakRetained = v13;
    }
    objc_initWeak((id *)buf, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000B06D4;
    v24[3] = &unk_100243930;
    objc_copyWeak(&v26, (id *)buf);
    id v16 = WeakRetained;
    id v25 = v16;
    BOOL v27 = a3;
    BOOL v17 = objc_retainBlock(v24);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000B09C4;
    void v20[3] = &unk_100245FC8;
    id v18 = v16;
    id v21 = v18;
    BOOL v23 = a3;
    BOOL v19 = v17;
    id v22 = v19;
    [(COSPreferencesAppController *)self presentingControllerForModalByDismissingTopAlertIfPresentWithCompletion:v20];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_extendBackgroundAssertion
{
  id v3 = pbb_setup_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[COSPreferencesAppController _extendBackgroundAssertion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  [(NSTimer *)self->_taskCompletionTimeout invalidate];
  uint64_t v4 = +[NSTimer timerWithTimeInterval:self target:"expireTaskAssertion:" selector:0 userInfo:0 repeats:600.0];
  taskCompletionTimeout = self->_taskCompletionTimeout;
  self->_taskCompletionTimeout = v4;

  BOOL v6 = +[NSRunLoop currentRunLoop];
  [v6 addTimer:self->_taskCompletionTimeout forMode:NSRunLoopCommonModes];
}

- (void)setSyncTrapUIEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_syncTrapUIEnabled && !a3)
  {
    BOOL v5 = pbb_setupflow_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing suspend assertion and resetting link preference", v8, 2u);
    }

    BOOL v6 = [(COSSetupController *)self->_setupController linkUpgradeMonitor];
    [v6 resetCompanionLinkPreference];

    [(COSPreferencesAppController *)self resetSuspendAssertion];
  }
  self->_BOOL syncTrapUIEnabled = v3;
  int v7 = +[BPSBridgeAppContext shared];
  [v7 setSyncTrapUIEnabled:v3];
}

- (void)resetFlowForCameraExpiry
{
  BOOL v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reset Flow For Camera Expiry", v4, 2u);
  }

  if (self->_setupController) {
    [(COSPreferencesAppController *)self dismissSetupFlowAnimated:1];
  }
}

- (void)tappedStartInternal
{
  self->_automationFlowPressed = 1;
  [(COSPreferencesAppController *)self tappedStart];
}

- (void)tappedStart
{
  if (sub_100033BB4()) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }

  [(COSPreferencesAppController *)self tappedStartForMode:v3];
}

- (void)tappedStartForMode:(unint64_t)a3
{
}

- (void)tappedStartForMode:(unint64_t)a3 withAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = +[UIDevice currentDevice];
  [v7 setOrientation:1];

  [(COSPreferencesAppController *)self presentSetupFlowWithMode:a3 animated:v4];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B1398;
  v13[3] = &unk_1002438A0;
  void v13[4] = self;
  uint64_t v8 = objc_retainBlock(v13);
  uint64_t v9 = [(COSPreferencesAppController *)self navigationController];
  double v10 = [v9 transitionCoordinator];

  if (v10 && ![v10 presentationStyle])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_1000B13A4;
    v11[3] = &unk_100245998;
    double v12 = v8;
    [v10 animateAlongsideTransition:0 completion:v11];
  }
  else
  {
    ((void (*)(void *))v8[2])(v8);
  }
}

- (void)presentNewPairingFlowIfPossible
{
}

- (void)presentMigrationConnectionFailedAlert
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  _DWORD v4[2] = sub_1000B1458;
  v4[3] = &unk_100245DD0;
  BOOL v5 = objc_alloc_init(COSMigrationConnectionFailed);
  uint64_t v3 = v5;
  [(COSPreferencesAppController *)self presentingControllerForModalByDismissingTopAlertIfPresentWithCompletion:v4];
}

- (void)presentNewPairingFlowIfPossibleWithAnimation:(BOOL)a3
{
  unsigned int v11 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B152C;
  v6[3] = &unk_1002462B8;
  char v9 = sub_10000A2A4(0, (const __CFString **)&v11);
  BOOL v10 = a3;
  int v7 = v11;
  uint64_t v8 = self;
  BOOL v5 = v7;
  [(COSPreferencesAppController *)self presentGetConnectedAlertIfNeededWithCompletion:v6];
}

- (void)pingWatch
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2050000000;
  id v2 = (void *)qword_10029B190;
  uint64_t v9 = qword_10029B190;
  if (!qword_10029B190)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    _DWORD v5[2] = sub_1000B6FD4;
    v5[3] = &unk_1002436A8;
    void v5[4] = &v6;
    sub_1000B6FD4((uint64_t)v5);
    id v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  BOOL v4 = [v3 sharedDeviceConnection];
  [v4 playSoundOnCompanionWithCompletion:&stru_1002462D8];
}

- (void)successfullyBeganUnpairingWatch
{
  [UIApp clearBridgeSettingsTabBarItemBadge];
  [(COSPreferencesAppController *)self refreshTabBar];
  id v3 = [(COSPreferencesAppController *)self _getStartedController];
  [v3 registerNRObserver];

  [(COSPreferencesAppController *)self popToTopLevelSettingsAnimated:1];
  id v4 = [(COSPreferencesRootController *)self->_settingsController rootListController];
  [v4 reloadSpecifiers];
}

- (void)reloadAppearance:(id)a3
{
  [(COSPreferencesAppController *)self _prepareAppearances];
  [(COSSetupController *)self->_setupController reloadAppearance];

  [(COSPreferencesAppController *)self refreshTabBar];
}

- (id)navigationController
{
  return [(COSSetupController *)self->_setupController navigationController];
}

- (void)screenshotService:(id)a3 generatePDFRepresentationWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Screenshot service did request PDF representation.", buf, 2u);
  }

  uint64_t v8 = [v6 windowScene];

  uint64_t v9 = [v8 windows];
  BOOL v10 = [v9 firstObject];

  unsigned int v11 = [v10 recursiveDescription];
  double v12 = dispatch_get_global_queue(25, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B208C;
  v15[3] = &unk_1002441B0;
  id v16 = v11;
  id v17 = v5;
  id v13 = v5;
  id v14 = v11;
  dispatch_async(v12, v15);
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  uint64_t v8 = (NRDevice *)a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    activeWatch = self->_activeWatch;
    double v12 = pbb_bridge_log();
    id v13 = v12;
    if (activeWatch == v8)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = [(NRDevice *)v8 _bridgeConciseDebugDescription];
        int v19 = 138412546;
        id v20 = v9;
        __int16 v21 = 2112;
        id v22 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Property (%@) Changed for device %@", (uint8_t *)&v19, 0x16u);
      }
      if (([v9 isEqualToString:NRDevicePropertySystemVersion] & 1) != 0
        || [v9 isEqualToString:_NRDevicePropertyCapabilities])
      {
        id v16 = +[NSNotificationCenter defaultCenter];
        [v16 postNotificationName:@"COSActiveDeviceEssentialPropertiesChanged" object:0];

        if (BPSDeviceHasCapabilityForString())
        {
          uint64_t v17 = MGGetProductType();
          if (v17 == 4232256925 || v17 == 344862120) {
            [(COSPreferencesAppController *)self newerCompanionRequired];
          }
        }
      }
      else if ([v9 isEqualToString:NRDevicePropertyName])
      {
        [(COSPreferencesAppController *)self clearCachedNameForDevice:v8];
        id v18 = [(COSPreferencesAppController *)self settingsListController];
        [v18 reloadAppleWatchDetails:0];
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(NRDevice *)v8 _bridgeConciseDebugDescription];
        int v19 = 138412546;
        id v20 = v9;
        __int16 v21 = 2112;
        id v22 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Property (%@) Changed for inactive device %@!", (uint8_t *)&v19, 0x16u);
      }
    }
  }
}

- (void)versionOrCapabilitiesChanged:(id)a3
{
  id v4 = [(COSPreferencesRootController *)self->_settingsController topViewController];
  if (![(COSPreferencesAppController *)self isInSetupFlow] && !self->_unpairingVC)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = pbb_bridge_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pop to top level and reload.", v7, 2u);
      }

      [(COSPreferencesAppController *)self popToTopLevelSettingsAnimated:1];
    }
  }
  id v6 = [(COSPreferencesRootController *)self->_settingsController rootListController];
  [v6 reloadSpecifiers];
}

- (void)deviceBecameActive:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:NRPairedDeviceRegistryDevice];
  uint64_t v6 = NRDevicePropertyPairingID;
  __int16 v33 = v5;
  uint64_t v7 = [v5 valueForProperty:NRDevicePropertyPairingID];
  uint64_t v8 = pbb_bridge_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v33 _bridgeConciseDebugDescription];
    *(_DWORD *)buf = 138412290;
    BOOL v36 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device Became Active: %@", buf, 0xCu);
  }
  id v10 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  uint64_t v11 = [v10 valueForProperty:v6];
  if (v11 | v7 && ([(id)v7 isEqual:v11] & 1) == 0)
  {
    double v12 = pbb_bridge_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v10 _bridgeConciseDebugDescription];
      *(_DWORD *)buf = 138412290;
      BOOL v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Device from DidBecomeActive notification no longer the active one (%@). Coallescing events.", buf, 0xCu);
    }
  }
  unsigned int v14 = [(COSPreferencesAppController *)self isActivelyPairing];
  char v15 = v14;
  if (v14)
  {
    uint64_t v16 = v7;
    uint64_t v17 = [(NRDevice *)self->_activeWatch valueForProperty:NRDevicePropertyIsPaired];
    unsigned __int8 v18 = [v17 BOOLValue];

    int v19 = pbb_bridge_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      [(NRDevice *)self->_activeWatch _bridgeConciseDebugDescription];
      id v20 = v32 = v4;
      *(_DWORD *)buf = 138412290;
      BOOL v36 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Actively Pairing. (Active Watch: %@)", buf, 0xCu);

      id v4 = v32;
    }

    uint64_t v7 = v16;
    if ((v18 & 1) == 0) {
      [(COSSetupController *)self->_setupController setScannedDevice:self->_activeWatch];
    }
  }
  uint64_t v21 = [(NRDevice *)self->_activeWatch valueForProperty:v6];
  id v22 = (void *)v21;
  if (v11 | v21 && ![(id)v21 isEqual:v11])
  {
    uint64_t v24 = v7;
    id v25 = v4;
    [(COSPreferencesAppController *)self updateActiveWatch:v10];
    inactiveDeviceTimerSource = self->_inactiveDeviceTimerSource;
    if (inactiveDeviceTimerSource)
    {
      dispatch_source_cancel(inactiveDeviceTimerSource);
      BOOL v27 = self->_inactiveDeviceTimerSource;
      self->_inactiveDeviceTimerSource = 0;
    }
    if ((v15 & 1) == 0 && !self->_unpairingVC)
    {
      BOOL v28 = [(COSPreferencesRootController *)self->_settingsController rootListController];
      BOOL v29 = [v28 presentedViewController];

      if ([v29 isMemberOfClass:objc_opt_class()])
      {
        __int16 v30 = [v29 topViewController];
        if (([v30 isMemberOfClass:objc_opt_class()] & 1) == 0) {
          [(COSPreferencesAppController *)self popToTopLevelSettingsAnimated:1];
        }
      }
      BOOL v31 = [(COSPreferencesRootController *)self->_settingsController rootListController];
      [v31 reloadSpecifiers];

      [(COSPreferencesAppController *)self refreshTabBar];
    }
    [(COSPreferencesAppController *)self removeActiveDeviveAssertionIfNotActive];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B2BE0;
    block[3] = &unk_1002438A0;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v4 = v25;
    uint64_t v7 = v24;
  }
  else
  {
    BOOL v23 = pbb_bridge_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Ignoring DidBecomeActive notification: already has up to date active device.", buf, 2u);
    }
  }
}

- (void)deviceBecameInactive:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:NRPairedDeviceRegistryDevice];
  uint64_t v6 = NRDevicePropertyAdvertisedName;
  uint64_t v7 = [v5 valueForProperty:NRDevicePropertyAdvertisedName];
  v47[0] = NRDevicePropertySystemVersion;
  v47[1] = _NRDevicePropertyCapabilities;
  uint64_t v8 = +[NSArray arrayWithObjects:v47 count:2];
  [v5 removePropertyObserver:self forPropertyChanges:v8];

  id v9 = [(COSPreferencesAppController *)self activeWatch];
  id v10 = [v9 valueForProperty:v6];
  uint64_t v11 = v10;
  if (v10) {
    BOOL v12 = v7 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12 || ([v10 isEqualToString:v7] & 1) != 0)
  {
    id v13 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
    if (v13)
    {
      unsigned int v14 = pbb_bridge_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        char v15 = [v13 _bridgeConciseDebugDescription];
        *(_DWORD *)buf = 138412290;
        char v44 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Device became inactive, but there is an active device: %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v16 = [v5 valueForProperty:NRDevicePropertyIsArchived];
      unsigned int v14 = v16;
      BOOL v38 = v4;
      if (v16) {
        LODWORD(v36) = [v16 BOOLValue];
      }
      else {
        LODWORD(v36) = 0;
      }
      __int16 v37 = v9;
      int v19 = pbb_bridge_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v5 _bridgeConciseDebugDescription];
        *(_DWORD *)buf = 138412290;
        char v44 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Device became inactive: %@", buf, 0xCu);
      }
      [(COSPreferencesAppController *)self updateActiveWatch:0];
      unsigned __int8 v21 = [(COSPreferencesAppController *)self isActivelyPairing];
      id v22 = +[NRPairedDeviceRegistry sharedInstance];
      BOOL v23 = +[NRPairedDeviceRegistry pairedDevicesSelectorBlock];
      uint64_t v24 = [v22 getAllDevicesWithArchivedAltAccountDevicesMatching:v23];

      if (v21)
      {
        id v4 = v38;
        if (([v24 containsObject:v5] | v36))
        {
          if (v36)
          {
            id v25 = pbb_bridge_log();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              id v26 = [v5 _bridgeConciseDebugDescription];
              *(_DWORD *)buf = 138412290;
              char v44 = v26;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Recently inactive device is archived, no action needed: %@ ", buf, 0xCu);
            }
          }
        }
        else
        {
          __int16 v34 = pbb_bridge_log();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v35 = [v5 pairingID];
            *(_DWORD *)buf = 138412290;
            char v44 = v35;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Device: %@ went inactive during pairing and was not already paired, pairing has likely failed", buf, 0xCu);
          }
          [(COSPreferencesAppController *)self dismissSetupFlowAnimated:1 refreshTabs:1 withCompletionHandler:0];
        }
      }
      else
      {
        BOOL v36 = v24;
        [(COSPreferencesAppController *)self _allowInteractionsWithSettingsControllers:0];
        BOOL v27 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
        inactiveDeviceTimerSource = self->_inactiveDeviceTimerSource;
        self->_inactiveDeviceTimerSource = v27;

        if (self->_inactiveDeviceTimerSource)
        {
          objc_initWeak((id *)buf, self);
          BOOL v29 = self->_inactiveDeviceTimerSource;
          dispatch_time_t v30 = dispatch_time(0, 350000000);
          dispatch_source_set_timer(v29, v30, 0xFFFFFFFFFFFFFFFFLL, 0x2160EC0uLL);
          BOOL v31 = self->_inactiveDeviceTimerSource;
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_1000B327C;
          handler[3] = &unk_100245298;
          handler[4] = self;
          objc_copyWeak(&v42, (id *)buf);
          dispatch_source_set_event_handler(v31, handler);
          BOOL v32 = self->_inactiveDeviceTimerSource;
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_1000B3534;
          v39[3] = &unk_1002439E0;
          objc_copyWeak(&v40, (id *)buf);
          dispatch_source_set_cancel_handler(v32, v39);
          dispatch_resume((dispatch_object_t)self->_inactiveDeviceTimerSource);
          objc_destroyWeak(&v40);
          objc_destroyWeak(&v42);
          objc_destroyWeak((id *)buf);
        }
        __int16 v33 = +[BPSTinkerSupport sharedInstance];
        [v33 resetCachedDeviceValues];

        id v4 = v38;
      }
      if (!objc_msgSend(v24, "count", v36)) {
        [(COSPreferencesAppController *)self refreshTabBar];
      }
      [(COSPreferencesAppController *)self removeActiveDeviveAssertionIfNotActive];

      id v9 = v37;
    }
  }
  else
  {
    id v13 = pbb_bridge_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v5 _bridgeConciseDebugDescription];
      unsigned __int8 v18 = [v9 _bridgeConciseDebugDescription];
      *(_DWORD *)buf = 138412546;
      char v44 = v17;
      __int16 v45 = 2112;
      long long v46 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Ignoring device became inactive received for stale device: %@ active device: %@", buf, 0x16u);
    }
  }
}

- (void)_allowInteractionsWithSettingsControllers:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(COSPreferencesRootController *)self->_settingsController view];
  [v5 setUserInteractionEnabled:v3];

  id v6 = [(PSSplitViewController *)self->_settingsSplitViewController view];
  [v6 setUserInteractionEnabled:v3];
}

- (void)_debug_forcePullAssets
{
  id v2 = objc_alloc_init((Class)PBBridgeAssetsManager);
  [v2 beginPullingAssetsForDeviceMaterial:2 size:1 branding:0 completion:0];
  [v2 beginPullingAssetsForDeviceMaterial:1 size:1 branding:0 completion:0];
  [v2 beginPullingAssetsForDeviceMaterial:4 size:1 branding:0 completion:0];
}

- (void)discoveredAdvertisingWatch:(id)a3
{
  id v4 = a3;
  id v5 = pbb_mobileasset_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(discoveredAdvertisingWatch) End Scanning for Nearby Devices...", buf, 2u);
  }

  id v6 = +[PPDiscoveryManager sharedDiscoveryManager];
  [v6 end];

  uint64_t v7 = [v4 userInfo];

  uint64_t v8 = [v7 objectForKeyedSubscript:PPDiscoveredDeviceAdvertisingName];
  uint64_t v9 = [(NSMutableDictionary *)self->_discoveryAssetPullRequests objectForKeyedSubscript:v8];
  id v10 = (id)v9;
  if (!v7 || v9) {
    goto LABEL_7;
  }
  if (v8)
  {
    id v10 = objc_alloc_init((Class)PBBridgeAssetsManager);
    [(NSMutableDictionary *)self->_discoveryAssetPullRequests setObject:v10 forKeyedSubscript:v8];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_1000B3810;
    v11[3] = &unk_1002453D0;
    id v12 = v8;
    id v13 = self;
    [v10 beginPullingAssetsForAdvertisingName:v12 completion:v11];

LABEL_7:
  }
}

- (void)sizeCategoryDidChange:(id)a3
{
  id v5 = [(COSPreferencesRootController *)self->_settingsController topViewController];
  if (([v5 isMemberOfClass:objc_opt_class()] & 1) == 0 && !self->_unpairingVC) {
    [(COSPreferencesAppController *)self popToTopLevelSettingsAnimated:0];
  }
  id v4 = [(COSPreferencesRootController *)self->_settingsController rootListController];
  [v4 reloadSpecifiers];
}

- (void)_startTopLevelScrollTestComplex:(BOOL)a3 options:(id)a4
{
  BOOL v4 = a3;
  id v6 = +[NSRunLoop mainRunLoop];
  uint64_t v7 = +[NSDate dateWithTimeIntervalSinceNow:1.0];
  [v6 runUntilDate:v7];

  uint64_t v8 = @"TopLevelFPS";
  if (v4) {
    uint64_t v8 = @"TopLevelFPSComplex";
  }
  settingsController = self->_settingsController;
  id v10 = v8;
  id v12 = [(COSPreferencesRootController *)settingsController rootListController];
  uint64_t v11 = [v12 table];
  [(COSPreferencesAppController *)self _testScrollTest:v10 onScrollView:v11];
}

- (void)_prepareForDevicePickerTest
{
  BOOL v3 = +[NSURL URLWithString:@"root=ActiveWatch"];
  [(COSPreferencesAppController *)self processURL:v3 animated:0 fromSearch:0];

  id v5 = +[NSRunLoop mainRunLoop];
  BOOL v4 = +[NSDate dateWithTimeIntervalSinceNow:0.5];
  [v5 runUntilDate:v4];
}

- (void)_starDevicePickerRotationTestWithOptions:(id)a3
{
  [(COSPreferencesAppController *)self _prepareForDevicePickerTest];
  BOOL v4 = [(COSPreferencesAppController *)self rootViewController];
  id v7 = [v4 presentedViewController];

  id v5 = [v7 topViewController];
  id v6 = [v5 table];
  [(COSPreferencesAppController *)self _testScrollTest:@"DevicePickerScrolling" onScrollView:v6];
}

- (void)_startFaceGalleryScrollTestWithOptions:(id)a3
{
  id v6 = [(COSPreferencesAppController *)self galleryViewController];
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [(COSPreferencesAppController *)self rootViewController];
    [v4 setSelectedViewController:v6];

    [(COSPreferencesAppController *)self setSelectedTabViewController:v6];
    id v5 = [(COSPreferencesAppController *)self galleryViewController];
    [v5 _performFaceGalleryScrollTestNamed:@"FaceGalleryFPS" iterations:1];
  }
}

- (void)_showInitialSyncPaneIfNotAlreadyShowing
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B3D74;
  v6[3] = &unk_1002438A0;
  void v6[4] = self;
  BOOL v3 = objc_retainBlock(v6);
  if ((id)[(COSSetupController *)self->_setupController mode] != (id)3)
  {
    if (self->_unpairingVC)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      _DWORD v4[2] = sub_1000B3F40;
      v4[3] = &unk_100244668;
      id v5 = v3;
      [(COSPreferencesAppController *)self dismissUnpairingViewControllerAnimated:1 withCompletion:v4];
    }
    else
    {
      ((void (*)(void *))v3[2])(v3);
    }
  }
}

- (void)globalAlertPresentationCoordinator:(id)a3 syncProgressDidUpdate:(double)a4
{
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithDouble:a4];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "globalAlertPresentationCoordinator:syncProgressDidUpdate: (%@)", (uint8_t *)&v7, 0xCu);
  }
}

- (void)globalAlertPresentationCoordinator:(id)a3 presentAlert:(unint64_t)a4 withCompletion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B40E0;
  v10[3] = &unk_100246300;
  id v11 = a3;
  id v12 = self;
  id v13 = a5;
  unint64_t v14 = a4;
  id v8 = v13;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)globalAlertPresentationCoordinator:(id)a3 dismissAlert:(unint64_t)a4 withCompletion:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B42EC;
  block[3] = &unk_100243730;
  id v9 = a5;
  unint64_t v10 = a4;
  void block[4] = self;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_testScrollTest:(id)a3 onScrollView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_time_t v7 = dispatch_time(0, 500000000);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B44F0;
  v10[3] = &unk_100243908;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v10);
}

- (BOOL)_forceComplexTopLevel
{
  return byte_10029B18C;
}

- (void)_updateAppStoreRowForRepair
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000B45D0;
  v2[3] = &unk_100246328;
  v2[4] = self;
  +[COSiTunesStoreAuthController repairDialogsForActiveDeviceWithCompletion:v2];
}

- (void)deviceSpecificRepairSteps:(id)a3
{
  id v4 = a3;
  if ([(COSPreferencesAppController *)self isInSetupFlow])
  {
    id v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Skipping device specific repair steps as we are in pairing", buf, 2u);
    }
  }
  else
  {
    id v6 = [v4 valueForProperty:NRDevicePropertyIsAltAccount];
    unsigned int v7 = [v6 BOOLValue];

    if (v7)
    {
      id v8 = pbb_accountsignin_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "deviceSpecificRepairSteps for Satellite-Paired %@", buf, 0xCu);
      }

      id v9 = +[BPSTinkerSupport sharedInstance];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      void v12[2] = sub_1000B4AB4;
      v12[3] = &unk_100246350;
      void v12[4] = self;
      [v9 getActiveTinkerFamilyMemberDetailsWithCompletion:v12];
    }
    else
    {
      id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"1CFACCB8-FFEB-4682-A50E-16F853583912"];
      unsigned int v11 = [v4 supportsCapability:v10];

      if (v11) {
        [(COSPreferencesAppController *)self _updateAppStoreRowForRepair];
      }
    }
  }
}

- (void)testPrep:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pbb_bridge_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "testPrep: %@ options: %@", (uint8_t *)&v12, 0x16u);
  }

  byte_10029B18C = [v6 isEqualToString:@"TopLevelFPSComplex"] != 0;
  id v9 = [(COSPreferencesRootController *)self->_settingsController rootListController];
  [v9 reloadSpecifiers];

  [(COSPreferencesAppController *)self refreshTabBar];
  id v10 = +[NSRunLoop mainRunLoop];
  unsigned int v11 = +[NSDate dateWithTimeIntervalSinceNow:1.0];
  [v10 runUntilDate:v11];
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(COSPreferencesAppController *)self testPrep:v6 options:v7];
  if ([v6 isEqualToString:@"TopLevelFPS"])
  {
    [(COSPreferencesAppController *)self _startTopLevelScrollTestComplex:0 options:v7];
LABEL_9:
    BOOL v8 = 1;
    goto LABEL_10;
  }
  if (![v6 isEqualToString:@"TopLevelFPSComplex"])
  {
    if ([v6 isEqualToString:@"DevicePickerScrolling"])
    {
      [(COSPreferencesAppController *)self _starDevicePickerRotationTestWithOptions:v7];
    }
    else
    {
      if (![v6 isEqualToString:@"FaceGalleryFPS"])
      {
        v10.receiver = self;
        v10.super_class = (Class)COSPreferencesAppController;
        BOOL v8 = [(COSPreferencesAppController *)&v10 runTest:v6 options:v7];
        goto LABEL_10;
      }
      [(COSPreferencesAppController *)self _startFaceGalleryScrollTestWithOptions:v7];
    }
    goto LABEL_9;
  }
  BOOL v8 = 1;
  [(COSPreferencesAppController *)self _startTopLevelScrollTestComplex:1 options:v7];
LABEL_10:

  return v8;
}

- (void)finishedTest:(id)a3
{
  id v4 = a3;
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Finished %@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)COSPreferencesAppController;
  [(COSPreferencesAppController *)&v6 finishedTest:v4];
}

- (void)cancelTinkerSwitch:(id)a3
{
  [(NRActiveDeviceAssertion *)self->_activeWatchAssertion invalidate];
  activeWatchAssertion = self->_activeWatchAssertion;
  self->_activeWatchAssertion = 0;
}

+ (id)getActiveDevice
{
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  BOOL v3 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  id v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];

  id v5 = [v4 firstObject];

  return v5;
}

- (void)setActiveWatch:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a4;
  objc_super v10 = (void (**)(id, uint64_t))a5;
  unsigned int v11 = pbb_bridge_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v8 valueForProperty:NRDevicePropertyPairingID];
    int v19 = 136315394;
    id v20 = "-[COSPreferencesAppController setActiveWatch:startedBlock:completionBlock:]";
    __int16 v21 = 2114;
    id v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v19, 0x16u);
  }
  id v13 = [UIApp activeWatch];
  if (!v8)
  {
    id v8 = [(id)objc_opt_class() getActiveDevice];
  }
  __int16 v14 = [v8 valueForProperty:NRDevicePropertyIsAltAccount];
  if (![v14 BOOLValue]) {
    goto LABEL_13;
  }
  id v15 = [(COSPreferencesAppController *)self activeWatchAssertion];
  id v16 = [v15 device];
  if (v16 != v8)
  {

LABEL_13:
    [(COSPreferencesAppController *)self switchToDevice:v8 startedBlock:v9 completionBlock:v10];
    goto LABEL_14;
  }
  uint64_t v17 = [(COSPreferencesAppController *)self activeWatchAssertion];
  unsigned __int8 v18 = [v17 isActive];

  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
  if (v9) {
    v9[2](v9, 1);
  }
  if (v10) {
    v10[2](v10, 1);
  }
LABEL_14:
}

- (void)reachability:(id)a3 device:(id)a4 connectionStatus:(unint64_t)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B52C4;
  v7[3] = &unk_100243908;
  id v8 = a4;
  id v9 = self;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)checkIDSReachability
{
  BOOL v3 = [(COSPreferencesAppController *)self activeWatchAssertion];
  id v4 = [v3 device];

  if (v4)
  {
    id v5 = +[PBBridgeIDSReachability sharedInstance];
    id v6 = [(COSPreferencesAppController *)self activeWatchAssertion];
    id v7 = [v6 device];
    id v8 = [v5 reachabilityForDevice:v7];

    id v9 = pbb_bridge_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v10 = +[NSNumber numberWithUnsignedInteger:v8];
      int v11 = 136315650;
      int v12 = "-[COSPreferencesAppController checkIDSReachability]";
      __int16 v13 = 2112;
      __int16 v14 = v10;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s (Status: %@) %@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)_showTinkerSwitchFailureModalForDevice:(id)a3
{
  id v4 = [a3 valueForProperty:NRDevicePropertyName];
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"TINKER_SWITCH_TIMEOUT_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];

  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"TINKER_SWITCH_TIMEOUT_MESSAGE_%@" value:&stru_100249230 table:@"Localizable-tinker"];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4);

  objc_super v10 = +[NSBundle mainBundle];
  int v11 = [v10 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];

  int v12 = +[UIAlertController alertControllerWithTitle:v6 message:v9 preferredStyle:1];
  __int16 v13 = +[UIAlertAction actionWithTitle:v11 style:1 handler:0];
  [v12 addAction:v13];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B56F8;
  v15[3] = &unk_100245DD0;
  id v16 = v12;
  id v14 = v12;
  [(COSPreferencesAppController *)self presentingControllerForModalByDismissingTopAlertIfPresentWithCompletion:v15];
}

- (void)switchToDevice:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a4;
  id v10 = a5;
  if (!v8)
  {
    id v8 = [(id)objc_opt_class() getActiveDevice];
  }
  int v11 = [v8 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned int v12 = [v11 BOOLValue];

  self->_isTinkerSwitching = v12;
  if (v8)
  {
    if (v12)
    {
      id v13 = [(COSPreferencesAppController *)self activeWatchAssertion];
      id v14 = [v13 device];
      if (v8 == v14)
      {
        id v16 = [(COSPreferencesAppController *)self activeWatchAssertion];
        uint64_t v15 = [v16 isActive] ^ 1;
      }
      else
      {
        uint64_t v15 = 1;
      }
    }
    else
    {
      id v13 = [(id)objc_opt_class() getActiveDevice];
      uint64_t v15 = v8 != v13;
    }

    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if (v9) {
LABEL_13:
    }
      v9[2](v9, v15);
  }
  if (v15)
  {
    uint64_t v17 = +[NRPairedDeviceRegistry sharedInstance];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000B591C;
    v18[3] = &unk_100246398;
    char v21 = v12;
    v18[4] = self;
    id v19 = v8;
    id v20 = v10;
    [v17 setActivePairedDevice:v19 withActiveDeviceAssertionHandler:v18];
  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }
}

- (void)setActiveWatchAssertion:(id)a3
{
  id v4 = (NRActiveDeviceAssertion *)a3;
  id v5 = v4;
  if (self->_activeWatchAssertion != v4
    || v4 && ([(NRActiveDeviceAssertion *)v4 isActive] & 1) == 0)
  {
    if ([(NRActiveDeviceAssertion *)v5 isActive])
    {
      id v6 = pbb_bridge_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138543362;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting active watch assertion: %{public}@", (uint8_t *)&v12, 0xCu);
      }

      id v7 = v5;
      goto LABEL_16;
    }
    id v8 = pbb_bridge_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v9)
      {
        LOWORD(v12) = 0;
        id v10 = "Clearing active watch assertion because it is dead";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 2u);
      }
    }
    else if (v9)
    {
      LOWORD(v12) = 0;
      id v10 = "Clearing active watch assertion because it is nil";
      goto LABEL_14;
    }

    id v7 = 0;
LABEL_16:
    activeWatchAssertion = self->_activeWatchAssertion;
    self->_activeWatchAssertion = v7;

    [(COSPreferencesAppController *)self checkIDSReachability];
  }
}

- (void)remoteFinishedHealthSharingOptInWithSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412290;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received health sharing status on companion, opt-in value: %@", (uint8_t *)&v7, 0xCu);
  }

  [(COSSetupController *)self->_setupController gizmoDidFinishHealthSharingOptIn:v3];
}

- (BOOL)onlySatellitePairedAndInactive
{
  id v2 = sub_10000DCF4();
  if (v2) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = sub_100012810();
  }

  return v3;
}

- (void)setCachedName:(id)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFStringRef v8 = [(COSPreferencesAppController *)self cachedDeviceNames];

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    [(COSPreferencesAppController *)self setCachedDeviceNames:v9];
  }
  id v11 = [(COSPreferencesAppController *)self cachedDeviceNames];
  id v10 = [v6 pairingID];

  [v11 setObject:v7 forKey:v10];
}

- (void)clearCachedNameForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COSPreferencesAppController *)self cachedDeviceNames];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(COSPreferencesAppController *)self cachedDeviceNames];
    CFStringRef v8 = [v4 pairingID];
    id v9 = [v7 objectForKey:v8];

    if (v9)
    {
      id v10 = pbb_bridge_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cached name for device found, clearing...", v13, 2u);
      }

      id v11 = [(COSPreferencesAppController *)self cachedDeviceNames];
      int v12 = [v4 pairingID];
      [v11 removeObjectForKey:v12];
    }
  }
}

- (id)cachedNameForDevice:(id)a3
{
  uint64_t v4 = NRDevicePropertyName;
  id v5 = a3;
  id v6 = [v5 valueForProperty:v4];
  id v7 = [(COSPreferencesAppController *)self cachedDeviceNames];
  CFStringRef v8 = [v5 pairingID];

  id v9 = [v7 objectForKey:v8];

  if (v9)
  {
    id v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Overriding device name (%@) with cached name: %@", (uint8_t *)&v13, 0x16u);
    }

    id v11 = v9;
    id v6 = v11;
  }

  return v6;
}

- (id)tinkerUserName
{
  BOOL v3 = [(COSPreferencesAppController *)self setupController];

  if (v3)
  {
    id v4 = [(COSPreferencesAppController *)self setupController];
    uint64_t v5 = [v4 tinkerUserName];
LABEL_5:
    int v12 = (void *)v5;

    goto LABEL_7;
  }
  id v6 = [(COSPreferencesAppController *)self activeWatch];
  id v7 = [v6 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    id v9 = objc_alloc((Class)NPSDomainAccessor);
    uint64_t v10 = kBridgeDomain;
    id v11 = [(COSPreferencesAppController *)self activeWatch];
    id v4 = [v9 initWithDomain:v10 pairedDevice:v11];

    uint64_t v5 = [v4 objectForKey:@"kTinkerUserNameKey"];
    goto LABEL_5;
  }
  int v12 = 0;
LABEL_7:

  return v12;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v16 = a4;
  unsigned int v8 = (void (**)(void))a5;
  id v9 = a3;
  [(COSPreferencesAppController *)self refreshUpdateBadge];
  uint64_t v10 = [(COSPreferencesAppController *)self ntkCustomization];
  unsigned __int8 v11 = [v10 handleUserNotificationResponse:v16 fromNotificationCenter:v9 withCompletionHandler:v8];

  if ((v11 & 1) == 0)
  {
    int v12 = [v16 notification];
    int v13 = [v12 request];
    id v14 = [v13 identifier];
    unsigned int v15 = [v14 isEqualToString:@"com.apple.Bridge.request"];

    if (v15) {
      +[PBBridgeCAReporter recordUserAwarenessNotificationDuringSetupUserEngaged];
    }
    if (v8) {
      v8[2](v8);
    }
  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v15 = a4;
  unsigned int v8 = (void (**)(id, uint64_t))a5;
  id v9 = a3;
  uint64_t v10 = [(COSPreferencesAppController *)self ntkCustomization];
  unsigned __int8 v11 = [v10 handlePresentationOfNotification:v15 fromNotificationCenter:v9 withCompletionHandler:v8];

  if ((v11 & 1) == 0)
  {
    int v12 = [v15 request];
    int v13 = [v12 identifier];
    unsigned int v14 = [v13 isEqualToString:@"com.apple.Bridge.request"];

    if (v14) {
      +[PBBridgeCAReporter recordUserAwarenessNotificationDuringSetup];
    }
    if (v8) {
      v8[2](v8, 26);
    }
  }
}

- (void)setIsRestoringToKnownDevice:(BOOL)a3
{
  self->_isRestoringToKnownDevice = a3;
  id v4 = +[BPSBridgeAppContext shared];
  [v4 updateIsRestoringToKnownDevice:self->_isRestoringToKnownDevice];
}

- (BOOL)isEitherPhoneOrActiveWatchGreenTeaDevice
{
  BOOL v3 = +[UIDevice currentDevice];
  unsigned __int8 v4 = [v3 sf_isChinaRegionCellularDevice];

  uint64_t v5 = [(COSPreferencesAppController *)self activeWatch];
  id v6 = [v5 valueForProperty:NRDevicePropertyGreenTeaDevice];
  unsigned __int8 v7 = [v6 BOOLValue];

  return v4 | v7;
}

- (void)setWindow:(id)a3
{
}

- (PSSplitViewController)settingsSplitViewController
{
  return self->_settingsSplitViewController;
}

- (BOOL)syncTrapUIEnabled
{
  return self->_syncTrapUIEnabled;
}

- (BOOL)syncTrapUICompleted
{
  return self->_syncTrapUICompleted;
}

- (void)setSyncTrapUICompleted:(BOOL)a3
{
  self->_BOOL syncTrapUICompleted = a3;
}

- (BOOL)revLockEnabled
{
  return self->_revLockEnabled;
}

- (void)setRevLockEnabled:(BOOL)a3
{
  self->_revLockEnabled = a3;
}

- (BKSProcessAssertion)suspendAssertion
{
  return self->_suspendAssertion;
}

- (void)setSuspendAssertion:(id)a3
{
}

- (NSTimer)taskCompletionTimeout
{
  return self->_taskCompletionTimeout;
}

- (void)setTaskCompletionTimeout:(id)a3
{
}

- (NSTimer)idleNotificationTimer
{
  return self->_idleNotificationTimer;
}

- (void)setIdleNotificationTimer:(id)a3
{
}

- (UIAlertController)transportReachabilityAlert
{
  return self->_transportReachabilityAlert;
}

- (void)setTransportReachabilityAlert:(id)a3
{
}

- (UIViewController)selectedController
{
  return self->_selectedController;
}

- (void)setSelectedController:(id)a3
{
  self->_selectedController = (UIViewController *)a3;
}

- (COSGetStartedViewController)getStartedViewController
{
  return self->_getStartedViewController;
}

- (void)setGetStartedViewController:(id)a3
{
}

- (COSSoftwareUpdateController)updateController
{
  return self->_updateController;
}

- (void)setUpdateController:(id)a3
{
}

- (BOOL)launchedByNanoRegistry
{
  return self->_launchedByNanoRegistry;
}

- (void)setLaunchedByNanoRegistry:(BOOL)a3
{
  self->_BOOL launchedByNanoRegistry = a3;
}

- (BOOL)firstLaunch
{
  return self->_firstLaunch;
}

- (void)setFirstLaunch:(BOOL)a3
{
  self->_firstLaunch = a3;
}

- (BOOL)backgrounded
{
  return self->_backgrounded;
}

- (void)setBackgrounded:(BOOL)a3
{
  self->_backgrounded = a3;
}

- (COSUnpairingViewController)unpairingVC
{
  return self->_unpairingVC;
}

- (void)setUnpairingVC:(id)a3
{
}

- (BOOL)pendingUnpairingVCDismissal
{
  return self->_pendingUnpairingVCDismissal;
}

- (void)setPendingUnpairingVCDismissal:(BOOL)a3
{
  self->_BOOL pendingUnpairingVCDismissal = a3;
}

- (BOOL)dismissUnpairUIOnPresentation
{
  return self->_dismissUnpairUIOnPresentation;
}

- (void)setDismissUnpairUIOnPresentation:(BOOL)a3
{
  self->_dismissUnpairUIOnPresentation = a3;
}

- (BOOL)pendingUnpairUIPresentation
{
  return self->_pendingUnpairUIPresentation;
}

- (void)setPendingUnpairUIPresentation:(BOOL)a3
{
  self->_pendingUnpairUIPresentation = a3;
}

- (unsigned)rootDomainConnect
{
  return self->_rootDomainConnect;
}

- (void)setRootDomainConnect:(unsigned int)a3
{
  self->_rootDomainConnect = a3;
}

- (FBSDisplayLayoutMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (void)setRootViewController:(id)a3
{
}

- (UIViewController)selectedTabViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedTabViewController);

  return (UIViewController *)WeakRetained;
}

- (UINavigationController)discoverNavigationController
{
  return self->_discoverNavigationController;
}

- (void)setDiscoverNavigationController:(id)a3
{
}

- (BOOL)isTinkerSwitching
{
  return self->_isTinkerSwitching;
}

- (void)setIsTinkerSwitching:(BOOL)a3
{
  self->_isTinkerSwitching = a3;
}

- (OS_dispatch_source)inactiveDeviceTimerSource
{
  return self->_inactiveDeviceTimerSource;
}

- (void)setInactiveDeviceTimerSource:(id)a3
{
}

- (NSMutableDictionary)discoveryAssetPullRequests
{
  return self->_discoveryAssetPullRequests;
}

- (void)setDiscoveryAssetPullRequests:(id)a3
{
}

- (BKSApplicationStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (void)setAppStateMonitor:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)cachedDeviceNames
{
  return self->_cachedDeviceNames;
}

- (void)setCachedDeviceNames:(id)a3
{
}

- (COSProfileInstallHelper)profileInstallHelper
{
  return self->_profileInstallHelper;
}

- (void)setProfileInstallHelper:(id)a3
{
}

- (NSUserActivity)galleryTTRUserActivity
{
  return self->_galleryTTRUserActivity;
}

- (void)setGalleryTTRUserActivity:(id)a3
{
}

- (id)appDelegateOnDismissalBlock
{
  return objc_getProperty(self, a2, 288, 1);
}

- (void)setAppDelegateOnDismissalBlock:(id)a3
{
}

- (BOOL)waitForActiveDeviceReady
{
  return self->_waitForActiveDeviceReady;
}

- (void)setWaitForActiveDeviceReady:(BOOL)a3
{
  self->_waitForActiveDeviceReady = a3;
}

- (unint64_t)activationRetryCountLimit
{
  return self->_activationRetryCountLimit;
}

- (void)setActivationRetryCountLimit:(unint64_t)a3
{
  self->_unint64_t activationRetryCountLimit = a3;
}

- (unint64_t)activationRetryCount
{
  return self->_activationRetryCount;
}

- (void)setActivationRetryCount:(unint64_t)a3
{
  self->_unint64_t activationRetryCount = a3;
}

- (BOOL)resetSetupInProgress
{
  return self->_resetSetupInProgress;
}

- (void)setResetSetupInProgress:(BOOL)a3
{
  self->_BOOL resetSetupInProgress = a3;
}

- (BOOL)dismissSetupInProgress
{
  return self->_dismissSetupInProgress;
}

- (void)setDismissSetupInProgress:(BOOL)a3
{
  self->_BOOL dismissSetupInProgress = a3;
}

- (UINavigationController)devicePickerNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_devicePickerNavigationController);

  return (UINavigationController *)WeakRetained;
}

- (void)setDevicePickerNavigationController:(id)a3
{
}

- (COSSetupController)setupController
{
  return self->_setupController;
}

- (void)setSetupController:(id)a3
{
}

- (PBBridgeCompanionController)bridgeController
{
  return self->_bridgeController;
}

- (void)setBridgeController:(id)a3
{
}

- (BOOL)isBeamBridgeReachable
{
  return self->_isBeamBridgeReachable;
}

- (void)setIsBeamBridgeReachable:(BOOL)a3
{
  self->_isBeamBridgeReachable = a3;
}

- (BOOL)automationFlowPressed
{
  return self->_automationFlowPressed;
}

- (void)setAutomationFlowPressed:(BOOL)a3
{
  self->_automationFlowPressed = a3;
}

- (NRActiveDeviceAssertion)activeWatchAssertion
{
  return self->_activeWatchAssertion;
}

- (BOOL)newTinkerAccountCreated
{
  return self->_newTinkerAccountCreated;
}

- (void)setNewTinkerAccountCreated:(BOOL)a3
{
  self->_newTinkerAccountCreated = a3;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (void)setIsActivated:(BOOL)a3
{
  self->_isActivated = a3;
}

- (BOOL)isLanguageAndLocaleFinished
{
  return self->_isLanguageAndLocaleFinished;
}

- (void)setIsLanguageAndLocaleFinished:(BOOL)a3
{
  self->_isLanguageAndLocaleFinished = a3;
}

- (unint64_t)cliftonAvailabilityState
{
  return self->_cliftonAvailabilityState;
}

- (void)setCliftonAvailabilityState:(unint64_t)a3
{
  self->_cliftonAvailabilityState = a3;
}

- (BOOL)isUpdatingGizmoInSetupFlow
{
  return self->_isUpdatingGizmoInSetupFlow;
}

- (void)setIsUpdatingGizmoInSetupFlow:(BOOL)a3
{
  self->_BOOL isUpdatingGizmoInSetupFlow = a3;
}

- (void)setIsUpdatingInRevLock:(BOOL)a3
{
  self->_int isUpdatingInRevLock = a3;
}

- (void)setDeviceIsBeingMigrated:(BOOL)a3
{
  self->_deviceIsBeingMigrated = a3;
}

- (BOOL)iPhoneMirroringEnabled
{
  return self->_iPhoneMirroringEnabled;
}

- (BOOL)isRestoringToKnownDevice
{
  return self->_isRestoringToKnownDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeWatchBridgeDomainAccessor, 0);
  objc_storeStrong((id *)&self->_activeWatchAssertion, 0);
  objc_storeStrong((id *)&self->_activeWatch, 0);
  objc_storeStrong((id *)&self->_bridgeController, 0);
  objc_storeStrong((id *)&self->_setupController, 0);
  objc_destroyWeak((id *)&self->_devicePickerNavigationController);
  objc_storeStrong(&self->_appDelegateOnDismissalBlock, 0);
  objc_storeStrong((id *)&self->_galleryTTRUserActivity, 0);
  objc_storeStrong((id *)&self->_profileInstallHelper, 0);
  objc_storeStrong((id *)&self->_cachedDeviceNames, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_discoveryAssetPullRequests, 0);
  objc_storeStrong((id *)&self->_inactiveDeviceTimerSource, 0);
  objc_storeStrong((id *)&self->_discoverNavigationController, 0);
  objc_storeStrong((id *)&self->_galleryViewController, 0);
  objc_storeStrong((id *)&self->_myWatchViewController, 0);
  objc_destroyWeak((id *)&self->_selectedTabViewController);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_unpairingVC, 0);
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_storeStrong((id *)&self->_getStartedViewController, 0);
  objc_storeStrong((id *)&self->_transportReachabilityAlert, 0);
  objc_storeStrong((id *)&self->_idleNotificationTimer, 0);
  objc_storeStrong((id *)&self->_taskCompletionTimeout, 0);
  objc_storeStrong((id *)&self->_suspendAssertion, 0);
  objc_storeStrong((id *)&self->_settingsSplitViewController, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_window, 0);

  objc_storeStrong((id *)&self->_ntkCustomization, 0);
}

@end