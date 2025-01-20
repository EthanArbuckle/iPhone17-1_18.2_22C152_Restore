@interface RCDefaultSceneDelegate
- (BOOL)_cloudSyncPromptNeedsShowing;
- (BOOL)_isCoreDataURL:(id)a3;
- (BOOL)cloudSyncPromptMustShowOrIsShowing;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isActive;
- (BOOL)isAnimatingBackgroundColor;
- (BOOL)modalMustShowOrIsShowing;
- (BOOL)performActionForMagicTap;
- (BOOL)tccAccessChangedWhileInBackground;
- (BOOL)welcomeMustShowOrIsShowing;
- (BOOL)welcomeScreenHasContinued;
- (NSSet)URLContexts;
- (NSSet)userActivities;
- (RCCloudSyncAccessManager)cloudSyncAccessManager;
- (RCDefaultSceneActivationStateDelegate)defaultSceneActivationStateDelegate;
- (RCDeferredInitializationDelegate)deferredInitializationDelegate;
- (RCDetailContainerViewController)playbackContainerViewController;
- (RCMainViewController)mainViewController;
- (RCSplitViewController)rootSplitViewController;
- (RCWelcomeViewController)welcomeViewController;
- (UIAlertController)fatalErrorAlertController;
- (UIAlertController)iCloudSyncConfirmationAlertController;
- (UIApplicationShortcutItem)shortcutItem;
- (UINavigationController)primaryNavigationController;
- (UINavigationController)secondaryNavigationController;
- (VMAudioService)audioService;
- (id)backgroundColorAnimation;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (int)removeAllRecordingsToken;
- (int)resetDefaultsToken;
- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4;
- (unint64_t)splitViewControllerSupportedInterfaceOrientations:(id)a3;
- (void)__performDeferredInitialization;
- (void)_activateApplication;
- (void)_askUserForPermissionToUseCloudKit;
- (void)_clearTemporaryAudioFilesOnce;
- (void)_continueUserActivity:(id)a3;
- (void)_delayedSelectRecordingWithUUID:(id)a3;
- (void)_eraseDeletedRecordingsIfNecessary;
- (void)_failedToCreateDatabase:(id)a3;
- (void)_handleSceneConnectionActions;
- (void)_handleWelcomeScreenContinue:(BOOL)a3;
- (void)_initialViewDidLoad;
- (void)_openURLContexts:(id)a3;
- (void)_performActionForShortcutItem:(id)a3;
- (void)_promptForCloudKitIfLoggedInAndTCCUnset;
- (void)_selectSharedRecording:(id)a3;
- (void)_setUpCloudSyncAccessManager;
- (void)_setUpLocationManager;
- (void)_showWelcomeScreenWithCompletionBlock:(id)a3;
- (void)_startNewRecordingQuickAction;
- (void)_startPlaybackQuickActionForRecordingWithUniqueID:(id)a3;
- (void)cloudSyncAvailabilityChanged;
- (void)dealloc;
- (void)handleRestyleRequest;
- (void)performDeferredInitializationJustOnce;
- (void)playbackMostRecentRecordingFromIntent;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setAudioService:(id)a3;
- (void)setCloudSyncAccessManager:(id)a3;
- (void)setDefaultSceneActivationStateDelegate:(id)a3;
- (void)setDeferredInitializationDelegate:(id)a3;
- (void)setFatalErrorAlertController:(id)a3;
- (void)setICloudSyncConfirmationAlertController:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setMainViewController:(id)a3;
- (void)setPlaybackContainerViewController:(id)a3;
- (void)setPrimaryNavigationController:(id)a3;
- (void)setRemoveAllRecordingsToken:(int)a3;
- (void)setResetDefaultsToken:(int)a3;
- (void)setRootSplitViewController:(id)a3;
- (void)setSecondaryNavigationController:(id)a3;
- (void)setShortcutItem:(id)a3;
- (void)setTccAccessChangedWhileInBackground:(BOOL)a3;
- (void)setURLContexts:(id)a3;
- (void)setUserActivities:(id)a3;
- (void)setWelcomeScreenHasContinued:(BOOL)a3;
- (void)setWelcomeViewController:(id)a3;
- (void)showOnboardingScreensIfNeeded;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4;
- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4;
- (void)splitViewController:(id)a3 willTransitionFromHorizontalSizeClass:(int64_t)a4 toHorizontalSizeClass:(int64_t)a5;
- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation RCDefaultSceneDelegate

- (void)_handleSceneConnectionActions
{
  if (self->_shortcutItem)
  {
    -[RCDefaultSceneDelegate _performActionForShortcutItem:](self, "_performActionForShortcutItem:");
    shortcutItem = self->_shortcutItem;
    self->_shortcutItem = 0;
  }
  userActivities = self->_userActivities;
  if (userActivities)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = userActivities;
    id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          -[RCDefaultSceneDelegate _continueUserActivity:](self, "_continueUserActivity:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v9), (void)v12);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    v10 = self->_userActivities;
    self->_userActivities = 0;
  }
  if (self->_URLContexts)
  {
    -[RCDefaultSceneDelegate _openURLContexts:](self, "_openURLContexts:");
    URLContexts = self->_URLContexts;
    self->_URLContexts = 0;
  }
}

- (void)_activateApplication
{
  if (!self->_isActive)
  {
    self->_isActive = 1;
    [(RCDefaultSceneDelegate *)self _eraseDeletedRecordingsIfNecessary];
    v3 = +[RCLocationsOfInterestManager defaultManager];
    [v3 start];

    [(RCDefaultSceneDelegate *)self showOnboardingScreensIfNeeded];
  }
}

- (void)_setUpCloudSyncAccessManager
{
  if (!self->_cloudSyncAccessManager)
  {
    v3 = (RCCloudSyncAccessManager *)objc_opt_new();
    cloudSyncAccessManager = self->_cloudSyncAccessManager;
    self->_cloudSyncAccessManager = v3;

    v5 = self->_cloudSyncAccessManager;
    [(RCCloudSyncAccessManager *)v5 startMonitoringAccountChanges];
  }
}

- (RCWelcomeViewController)welcomeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_welcomeViewController);

  return (RCWelcomeViewController *)WeakRetained;
}

- (void)performDeferredInitializationJustOnce
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031FCC;
  block[3] = &unk_100221278;
  block[4] = self;
  if (qword_10026A7C8 != -1) {
    dispatch_once(&qword_10026A7C8, block);
  }
}

- (void)_setUpLocationManager
{
  id v3 = +[RCLocationsOfInterestManager defaultManager];
  [v3 prepare];
  if (self->_isActive) {
    [v3 start];
  }
}

- (void)_showWelcomeScreenWithCompletionBlock:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[RCWelcomeViewController reasonToShow];
  if (v5)
  {
    int64_t v6 = v5;
    id v7 = [RCWelcomeViewController alloc];
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    long long v13 = sub_10006A0A8;
    long long v14 = &unk_100221FD0;
    id v15 = v4;
    int64_t v16 = v6;
    uint64_t v8 = [(RCWelcomeViewController *)v7 initWithCompletionBlock:&v11];
    -[RCWelcomeViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2, v11, v12, v13, v14);
    [(RCWelcomeViewController *)v8 setModalInPresentation:1];
    v9 = [(RCSceneDelegate *)self window];
    v10 = [v9 rootViewController];
    [v10 presentViewController:v8 animated:1 completion:0];

    [(RCDefaultSceneDelegate *)self setWelcomeViewController:v8];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (BOOL)welcomeMustShowOrIsShowing
{
  if (+[RCWelcomeViewController reasonToShow]) {
    return 1;
  }
  id v4 = [(RCDefaultSceneDelegate *)self welcomeViewController];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)_eraseDeletedRecordingsIfNecessary
{
  v2 = +[RCApplicationContainer sharedContainer];
  id v3 = [v2 newBackgroundModel];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008C00;
  v5[3] = &unk_100221278;
  id v6 = v3;
  id v4 = v3;
  [v4 performBlock:v5];
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6 = [(RCDefaultSceneDelegate *)self playbackContainerViewController];
  [v6 adjustConstraintsForDisplayMode:a4];

  LODWORD(a4) = UIAccessibilityLayoutChangedNotification;
  id v8 = [(RCDefaultSceneDelegate *)self playbackContainerViewController];
  id v7 = [v8 view];
  UIAccessibilityPostNotification(a4, v7);
}

- (RCDetailContainerViewController)playbackContainerViewController
{
  return self->_playbackContainerViewController;
}

- (void)sceneDidBecomeActive:(id)a3
{
  [(RCDefaultSceneDelegate *)self _activateApplication];
  id v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v5 = [v4 recordingViewHidesBlurEffectsWhenInactive];

  if (v5)
  {
    id v6 = [(RCMainViewController *)self->_mainViewController activeFolderViewController];
    id v7 = [v6 recordingViewController];
    id v8 = [v7 view];
    [v8 setBlurThroughEffectsActive:1];
  }
  [(RCMainViewController *)self->_mainViewController setIsInForeground:1];
  if (self->_tccAccessChangedWhileInBackground)
  {
    self->_tccAccessChangedWhileInBackground = 0;
    [(RCDefaultSceneDelegate *)self _promptForCloudKitIfLoggedInAndTCCUnset];
  }
  [(RCDefaultSceneDelegate *)self _handleSceneConnectionActions];
  id v9 = [(RCDefaultSceneDelegate *)self defaultSceneActivationStateDelegate];
  [v9 defaultSceneDidBecomeActive];
}

- (void)_handleWelcomeScreenContinue:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(RCDefaultSceneDelegate *)self welcomeScreenHasContinued])
  {
    [(RCDefaultSceneDelegate *)self setWelcomeScreenHasContinued:1];
    [(RCDefaultSceneDelegate *)self _setUpCloudSyncAccessManager];
    [(RCDefaultSceneDelegate *)self _setUpLocationManager];
    if (v3)
    {
      if ([(RCCloudSyncAccessManager *)self->_cloudSyncAccessManager cloudSyncIsAvailable])
      {
        id v5 = [objc_alloc((Class)MBManager) initWithDelegate:0];
        unsigned int v6 = [v5 isBackupEnabled];

        cloudSyncAccessManager = self->_cloudSyncAccessManager;
        if (v6)
        {
          [(RCCloudSyncAccessManager *)cloudSyncAccessManager setTccCloudAccess:2];
        }
        else if ([(RCCloudSyncAccessManager *)cloudSyncAccessManager tccCloudAccess] != 2)
        {
          [(RCDefaultSceneDelegate *)self _askUserForPermissionToUseCloudKit];
        }
      }
    }
    else
    {
      id v8 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100031FEC;
      block[3] = &unk_100221278;
      block[4] = self;
      dispatch_async(v8, block);
    }
    [(RCMainViewController *)self->_mainViewController handleEndOfWelcome];
  }
}

- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 setIsTransitioningBetweenVisibleColumnStates:1];
    unsigned int v6 = [v5 transitionCoordinator];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006A0D8;
    v7[3] = &unk_100221960;
    id v8 = v5;
    [v6 animateAlongsideTransition:&stru_100222078 completion:v7];
  }
}

- (void)__performDeferredInitialization
{
  [(RCSplitViewController *)self->_rootSplitViewController registerAppIntentsInteractions];
  BOOL v3 = [(RCDefaultSceneDelegate *)self deferredInitializationDelegate];
  id v4 = v3;
  if (v3) {
    [v3 performDeferredInitialization];
  }
  id v5 = +[VMAudioService sharedInstance];
  audioService = self->_audioService;
  self->_audioService = v5;

  [(VMAudioService *)self->_audioService prepareService];
  id v7 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A434;
  block[3] = &unk_100221278;
  block[4] = self;
  dispatch_async(v7, block);
}

- (void)showOnboardingScreensIfNeeded
{
  if (![(VMAudioService *)self->_audioService isPlaying]
    && ![(VMAudioService *)self->_audioService isRecording])
  {
    BOOL v3 = +[RCShareMemoViewController presentedController];

    if (!v3 && ![(RCDefaultSceneDelegate *)self welcomeScreenHasContinued])
    {
      id v4 = [(RCDefaultSceneDelegate *)self welcomeViewController];

      if (!v4)
      {
        v5[0] = _NSConcreteStackBlock;
        v5[1] = 3221225472;
        v5[2] = sub_100031FDC;
        v5[3] = &unk_100221FF8;
        void v5[4] = self;
        [(RCDefaultSceneDelegate *)self _showWelcomeScreenWithCompletionBlock:v5];
      }
    }
  }
}

- (BOOL)welcomeScreenHasContinued
{
  return self->_welcomeScreenHasContinued;
}

- (unint64_t)splitViewControllerSupportedInterfaceOrientations:(id)a3
{
  BOOL v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v4 = [v3 supportedInterfaceOrientations];

  return (unint64_t)v4;
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (+[RCSceneDelegate instancesRespondToSelector:"windowScene:didUpdateCoordinateSpace:interfaceOrientation:traitCollection:"])
  {
    v13.receiver = self;
    v13.super_class = (Class)RCDefaultSceneDelegate;
    [(RCSceneDelegate *)&v13 windowScene:v10 didUpdateCoordinateSpace:v11 interfaceOrientation:a5 traitCollection:v12];
  }
  if ([v10 interfaceOrientation] != (id)a5) {
    -[VMAudioService interfaceOrientationDidUpdate:](self->_audioService, "interfaceOrientationDidUpdate:", [v10 interfaceOrientation]);
  }
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ((RCIsBeingUnitTested() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 shortcutItem];
      shortcutItem = self->_shortcutItem;
      self->_shortcutItem = v9;

      id v11 = [v8 userActivities];
      userActivities = self->_userActivities;
      self->_userActivities = v11;

      objc_super v13 = [v8 URLContexts];
      URLContexts = self->_URLContexts;
      self->_URLContexts = v13;

      if (self->_shortcutItem
        || [(NSSet *)self->_userActivities count]
        || [(NSSet *)self->_URLContexts count])
      {
        [(RCDefaultSceneDelegate *)self _clearTemporaryAudioFilesOnce];
      }
      id v15 = +[UIApplication sharedApplication];
      int64_t v16 = [v15 delegate];

      if ([v16 conformsToProtocol:&OBJC_PROTOCOL___RCDeferredInitializationDelegate]) {
        [(RCDefaultSceneDelegate *)self setDeferredInitializationDelegate:v16];
      }
      if ([v16 conformsToProtocol:&OBJC_PROTOCOL___RCDefaultSceneActivationStateDelegate])-[RCDefaultSceneDelegate setDefaultSceneActivationStateDelegate:](self, "setDefaultSceneActivationStateDelegate:", v16); {
      id v17 = v7;
      }
      notify_register_dispatch("com.apple.VoiceMemos.internal.settings.WillRemoveAllRecordings", &self->_removeAllRecordingsToken, (dispatch_queue_t)&_dispatch_main_q, &stru_100221F60);
      notify_register_dispatch("com.apple.VoiceMemos.internal.settings.WillResetDefaults", &self->_resetDefaultsToken, (dispatch_queue_t)&_dispatch_main_q, &stru_100221F80);

      v49 = +[NSNotificationCenter defaultCenter];
      [v49 addObserver:self selector:"_failedToCreateDatabase:" name:RCSavedRecordingsModelDidFailToCreateDatabaseNotification object:0];
      v18 = [[RCSplitViewController alloc] initWithStyle:2];
      rootSplitViewController = self->_rootSplitViewController;
      self->_rootSplitViewController = v18;

      v20 = objc_alloc_init(RCMainViewController);
      mainViewController = self->_mainViewController;
      self->_mainViewController = v20;

      [(RCMainViewController *)self->_mainViewController setMainViewControllerDelegate:self];
      v22 = [(RCMainViewController *)self->_mainViewController mainControllerHelper];
      v50 = v17;
      [v22 defaultSceneDidConnect:v17];

      v23 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self->_mainViewController];
      primaryNavigationController = self->_primaryNavigationController;
      self->_primaryNavigationController = v23;

      v25 = [(UINavigationController *)self->_primaryNavigationController interactivePopGestureRecognizer];
      [v25 setDelegate:self];

      v26 = +[RCRecorderStyleProvider sharedStyleProvider];
      if ([v26 clipUnderlapWhileTransitioning]) {
        [(UINavigationController *)self->_primaryNavigationController _setClipUnderlapWhileTransitioning:1];
      }
      [(UINavigationController *)self->_primaryNavigationController setDelegate:self->_mainViewController];
      v27 = [(UINavigationController *)self->_primaryNavigationController navigationBar];
      if ([v26 usesLargeTitles]) {
        [v27 setPrefersLargeTitles:1];
      }
      v48 = v27;
      [(RCSplitViewController *)self->_rootSplitViewController setViewController:self->_primaryNavigationController forColumn:0];
      v28 = +[RCRecorderStyleProvider sharedStyleProvider];
      unsigned int v29 = [v28 hasPlaybackCard];

      v30 = 0;
      if (v29) {
        v30 = objc_opt_new();
      }
      v31 = [(RCSceneDelegate *)self window];
      [v31 safeAreaInsets];
      double v33 = v32;
      v34 = [v30 view];
      [v34 setStatusBarHeight:v33];

      [v30 setRecordingViewControllerDelegate:self->_mainViewController];
      v35 = objc_opt_new();
      [(RCDefaultSceneDelegate *)self setPlaybackContainerViewController:v35];
      [v35 setHostedViewController:v30];
      v36 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v35];
      secondaryNavigationController = self->_secondaryNavigationController;
      self->_secondaryNavigationController = v36;

      if ([v26 alwaysHidesDetailNavBar]) {
        [(UINavigationController *)self->_secondaryNavigationController setNavigationBarHidden:1];
      }
      [(RCMainViewController *)self->_mainViewController setPlaybackViewController:v30];
      [(RCSplitViewController *)self->_rootSplitViewController setViewController:self->_secondaryNavigationController forColumn:2];
      BOOL v38 = self->_shortcutItem == 0;
      v39 = self->_mainViewController;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100031FD4;
      v51[3] = &unk_100221278;
      v51[4] = self;
      [(RCMainViewController *)v39 finishInitialSetup:v51 goToAllRecordings:v38];
      [(RCSplitViewController *)self->_rootSplitViewController setResizingDelegate:self];
      [(RCSplitViewController *)self->_rootSplitViewController setMainViewController:self->_mainViewController];
      [(RCSplitViewController *)self->_rootSplitViewController setDelegate:self];
      -[RCSplitViewController setPresentsWithGesture:](self->_rootSplitViewController, "setPresentsWithGesture:", [v26 sidebarPresentsWithGesture]);
      [(RCSplitViewController *)self->_rootSplitViewController setTransitioningDelegate:self->_mainViewController];
      [v26 maximumPrimaryColumnWidth];
      -[RCSplitViewController setMaximumPrimaryColumnWidth:](self->_rootSplitViewController, "setMaximumPrimaryColumnWidth:");
      [v26 minimumPrimaryColumnWidth];
      -[RCSplitViewController setMinimumPrimaryColumnWidth:](self->_rootSplitViewController, "setMinimumPrimaryColumnWidth:");
      [v26 maximumSupplementaryColumnWidth];
      -[RCSplitViewController setMaximumSupplementaryColumnWidth:](self->_rootSplitViewController, "setMaximumSupplementaryColumnWidth:");
      [v26 minimumSupplementaryColumnWidth];
      -[RCSplitViewController setMinimumSupplementaryColumnWidth:](self->_rootSplitViewController, "setMinimumSupplementaryColumnWidth:");
      [v30 setParentSplitViewController:self->_rootSplitViewController];
      id v40 = [objc_alloc((Class)UIWindow) initWithWindowScene:v50];
      [(RCSceneDelegate *)self setWindow:v40];

      v41 = [(RCSceneDelegate *)self window];
      [v41 setAccessibilityIdentifier:@"Main Window"];

      v42 = [(RCSceneDelegate *)self window];
      v43 = [v26 standardInteractionTintColor];
      [v42 setTintColor:v43];

      if ([v26 supportsPointerInteractions])
      {
        v44 = [(RCSceneDelegate *)self window];
        v45 = [v44 layer];
        [v45 setHitTestsAsOpaque:1];
      }
      v46 = [(RCSceneDelegate *)self window];
      [v46 setRootViewController:self->_rootSplitViewController];

      v47 = [(RCSceneDelegate *)self window];
      [v47 makeKeyAndVisible];

      [(RCDefaultSceneDelegate *)self performDeferredInitializationJustOnce];
      [(RCDefaultSceneDelegate *)self showOnboardingScreensIfNeeded];
    }
  }
}

- (id)backgroundColorAnimation
{
  v2 = [(RCSceneDelegate *)self window];
  BOOL v3 = [v2 rootViewController];
  id v4 = [v3 view];
  id v5 = [v4 layer];
  unsigned int v6 = [v5 animationForKey:@"backgroundColor"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  return 1;
}

- (void)setWelcomeScreenHasContinued:(BOOL)a3
{
  self->_welcomeScreenHasContinued = a3;
}

- (void)setPlaybackContainerViewController:(id)a3
{
}

- (void)setDeferredInitializationDelegate:(id)a3
{
}

- (void)setDefaultSceneActivationStateDelegate:(id)a3
{
}

- (RCMainViewController)mainViewController
{
  return self->_mainViewController;
}

- (RCDeferredInitializationDelegate)deferredInitializationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deferredInitializationDelegate);

  return (RCDeferredInitializationDelegate *)WeakRetained;
}

- (RCDefaultSceneActivationStateDelegate)defaultSceneActivationStateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSceneActivationStateDelegate);

  return (RCDefaultSceneActivationStateDelegate *)WeakRetained;
}

- (void)_initialViewDidLoad
{
  if (![(RCDefaultSceneDelegate *)self welcomeMustShowOrIsShowing]) {
    [(RCDefaultSceneDelegate *)self performDeferredInitializationJustOnce];
  }
  mainViewController = self->_mainViewController;

  [(RCMainViewController *)mainViewController performDelayedSetup];
}

- (BOOL)_cloudSyncPromptNeedsShowing
{
  if (self->_cloudSyncAccessManager)
  {
    unsigned int v3 = [(RCDefaultSceneDelegate *)self welcomeScreenHasContinued];
    if (v3)
    {
      unsigned int v3 = [(RCCloudSyncAccessManager *)self->_cloudSyncAccessManager cloudSyncIsAvailable];
      if (v3) {
        LOBYTE(v3) = [(RCCloudSyncAccessManager *)self->_cloudSyncAccessManager tccCloudAccess] == 0;
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_clearTemporaryAudioFilesOnce
{
  if (qword_10026A7D0 != -1) {
    dispatch_once(&qword_10026A7D0, &stru_100222058);
  }
}

- (void)dealloc
{
  [(UINavigationController *)self->_primaryNavigationController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)RCDefaultSceneDelegate;
  [(RCDefaultSceneDelegate *)&v3 dealloc];
}

- (void)sceneWillResignActive:(id)a3
{
  [(RCMainViewController *)self->_mainViewController updateQuickActions];
  id v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v5 = [v4 recordingViewHidesBlurEffectsWhenInactive];

  if (v5)
  {
    id v8 = [(RCMainViewController *)self->_mainViewController activeFolderViewController];
    unsigned int v6 = [v8 recordingViewController];
    id v7 = [v6 view];
    [v7 setBlurThroughEffectsActive:0];
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v6 = a3;
  if (self->_fatalErrorAlertController) {
    exit(0);
  }
  [(RCMainViewController *)self->_mainViewController setIsInForeground:0];
  self->_isActive = 0;
  id v4 = +[RCApplicationModel sharedApplicationModel];
  [v4 saveIfNecessary];

  unsigned int v5 = +[RCLocationsOfInterestManager defaultManager];
  [v5 stop];
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
}

- (void)_continueUserActivity:(id)a3
{
  id v4 = a3;
  if (![(RCDefaultSceneDelegate *)self modalMustShowOrIsShowing])
  {
    [(RCDefaultSceneDelegate *)self performDeferredInitializationJustOnce];
    unsigned int v5 = [v4 activityType];
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    unsigned int v8 = [v5 isEqualToString:v7];

    if (v8)
    {
      id v9 = OSLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_10016B674(v9, v10, v11, v12, v13, v14, v15, v16);
      }

      [(RCDefaultSceneDelegate *)self recordNewVoiceMemoFromIntent];
    }
    else
    {
      id v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      unsigned int v19 = [v5 isEqualToString:v18];

      if (v19)
      {
        v20 = OSLogForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          sub_10016B6EC(v20, v21, v22, v23, v24, v25, v26, v27);
        }

        [(RCDefaultSceneDelegate *)self playbackMostRecentRecordingFromIntent];
      }
      else
      {
        unsigned int v28 = [v5 isEqualToString:CSSearchableItemActionType];
        unsigned int v29 = OSLogForCategory();
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
        if (v28)
        {
          if (v30) {
            sub_10016B84C(v29, v31, v32, v33, v34, v35, v36, v37);
          }

          BOOL v38 = [v4 userInfo];
          unsigned int v29 = [v38 objectForKeyedSubscript:CSSearchableItemActivityIdentifier];

          v39 = +[NSURL URLWithString:v29];
          id v40 = [v39 scheme];
          if ([v40 isEqualToString:@"x-coredata"])
          {
            v41 = +[RCApplicationModel sharedApplicationModel];
            v42 = [v41 recordingWithURIRepresentation:v39];

            if (v42)
            {
              v43 = [v42 uuid];
              [(RCDefaultSceneDelegate *)self _delayedSelectRecordingWithUUID:v43];
            }
            else
            {
              v43 = OSLogForCategory();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
                sub_10016B764();
              }
            }
          }
          else
          {
            v42 = OSLogForCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
              sub_10016B7D8();
            }
          }
        }
        else if (v30)
        {
          sub_10016B8C4();
        }
      }
    }
  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
}

- (void)_openURLContexts:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(VMAudioService *)self->_audioService recordingController];

  if (!v5)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v4;
    id obj = v4;
    id v6 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)v9) URL];
          if ([(RCDefaultSceneDelegate *)self _isCoreDataURL:v10])
          {
            uint64_t v11 = [v10 absoluteString];
            uint64_t v12 = [v11 stringByRemovingPercentEncoding];

            uint64_t v13 = [v12 substringFromIndex:[v12 rangeOfString:@"x-coredata" options:1]];
            if ([v13 length]
              && (+[NSURL URLWithString:v13],
                  (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              uint64_t v15 = v14;
              uint64_t v16 = +[RCApplicationModel sharedApplicationModel];
              id v17 = [v16 recordingWithURIRepresentation:v15];

              if (v17)
              {
                [(RCDefaultSceneDelegate *)self _selectSharedRecording:v17];
              }
              else
              {
                v20 = OSLogForCategory();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315394;
                  unsigned int v29 = "-[RCDefaultSceneDelegate _openURLContexts:]";
                  __int16 v30 = 2112;
                  uint64_t v31 = v15;
                  _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s -- WARNING: no recording matching URI: '%@'", buf, 0x16u);
                }
              }
            }
            else
            {
              uint64_t v15 = OSLogForCategory();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                unsigned int v19 = [v10 path];
                *(_DWORD *)buf = 136315394;
                unsigned int v29 = "-[RCDefaultSceneDelegate _openURLContexts:]";
                __int16 v30 = 2112;
                uint64_t v31 = v19;
                _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s -- WARNING: request to open a URL we can't handle: '%@'", buf, 0x16u);
              }
            }
          }
          else if (v10 && [v10 isFileURL])
          {
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 3221225472;
            v23[2] = sub_100069ED4;
            v23[3] = &unk_100221FA8;
            v23[4] = self;
            +[RCSavedRecordingsModel importFileWithURL:v10 shouldUseMetadataTitle:1 completionHandler:v23];
          }
          else
          {
            v18 = OSLogForCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              unsigned int v29 = "-[RCDefaultSceneDelegate _openURLContexts:]";
              __int16 v30 = 2112;
              uint64_t v31 = v10;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s -- URL not suitable for opening in Voice Memos - %@", buf, 0x16u);
            }
          }
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v7);
    }

    id v4 = v21;
  }
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
}

- (void)_performActionForShortcutItem:(id)a3
{
  id v12 = a3;
  if (![(RCDefaultSceneDelegate *)self modalMustShowOrIsShowing])
  {
    [(RCDefaultSceneDelegate *)self performDeferredInitializationJustOnce];
    id v4 = [v12 type];
    unsigned int v5 = [v4 isEqualToString:@"com.apple.VoiceMemos.NewRecording"];

    if (v5)
    {
      [(RCDefaultSceneDelegate *)self _startNewRecordingQuickAction];
    }
    else
    {
      id v6 = [v12 type];
      unsigned int v7 = [v6 isEqualToString:@"com.apple.VoiceMemos.PlayRecording"];

      if (v7)
      {
        objc_opt_class();
        uint64_t v8 = [v12 userInfo];
        id v9 = [v8 objectForKeyedSubscript:@"uniqueID"];
        if (objc_opt_isKindOfClass()) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0;
        }
        id v11 = v10;

        [(RCDefaultSceneDelegate *)self _startPlaybackQuickActionForRecordingWithUniqueID:v11];
      }
    }
  }
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return [(RCMainViewController *)self->_mainViewController navigationController:a3 animationControllerForOperation:a4 fromViewController:a5 toViewController:a6];
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    [v4 setIsTransitioningBetweenVisibleColumnStates:1];
    id v6 = [v5 transitionCoordinator];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006A1AC;
    v7[3] = &unk_100221960;
    id v8 = v5;
    [v6 animateAlongsideTransition:&stru_100222098 completion:v7];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return [(RCMainViewController *)self->_mainViewController canSwipeToNavigateBack]
      || (isKindOfClass & 1) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    NSClassFromString(@"UIScrollViewPanGestureRecognizer");
    char v8 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v8 = 1;
  }

  return v8 & 1;
}

- (BOOL)performActionForMagicTap
{
  return [(RCMainViewController *)self->_mainViewController toggleRecording];
}

- (BOOL)modalMustShowOrIsShowing
{
  if ([(RCDefaultSceneDelegate *)self welcomeMustShowOrIsShowing]) {
    return 1;
  }

  return [(RCDefaultSceneDelegate *)self cloudSyncPromptMustShowOrIsShowing];
}

- (void)cloudSyncAvailabilityChanged
{
  cloudSyncAccessManager = self->_cloudSyncAccessManager;
  if (cloudSyncAccessManager)
  {
    if ([(RCCloudSyncAccessManager *)cloudSyncAccessManager cloudSyncIsAvailable])
    {
      id v4 = +[UIApplication sharedApplication];
      id v5 = [v4 applicationState];

      if (v5)
      {
        self->_tccAccessChangedWhileInBackground = 1;
      }
      else
      {
        [(RCDefaultSceneDelegate *)self _promptForCloudKitIfLoggedInAndTCCUnset];
      }
    }
    else
    {
      id v6 = [(RCDefaultSceneDelegate *)self iCloudSyncConfirmationAlertController];
      if (v6)
      {
        id v7 = v6;
        [v6 dismissViewControllerAnimated:1 completion:0];
        id v6 = v7;
      }
    }
  }
}

- (void)handleRestyleRequest
{
  id v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  -[UINavigationController _setClipUnderlapWhileTransitioning:](self->_primaryNavigationController, "_setClipUnderlapWhileTransitioning:", [v4 clipUnderlapWhileTransitioning]);
  objc_super v3 = [(UINavigationController *)self->_primaryNavigationController navigationBar];
  [v3 _setHidesShadow:0];
  [v3 setPrefersLargeTitles:[v4 usesLargeTitles]];
  [(RCMainViewController *)self->_mainViewController restyle];
}

- (void)splitViewController:(id)a3 willTransitionFromHorizontalSizeClass:(int64_t)a4 toHorizontalSizeClass:(int64_t)a5
{
}

- (BOOL)isAnimatingBackgroundColor
{
  v2 = [(RCDefaultSceneDelegate *)self backgroundColorAnimation];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)playbackMostRecentRecordingFromIntent
{
  id v6 = +[RCApplicationModel sharedApplicationModel];
  BOOL v3 = [v6 mostRecentRecording];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 uuid];
    [(RCDefaultSceneDelegate *)self _startPlaybackQuickActionForRecordingWithUniqueID:v5];
  }
}

- (void)_startNewRecordingQuickAction
{
  objc_initWeak(&location, self->_mainViewController);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10006A64C;
  v3[3] = &unk_1002214F8;
  objc_copyWeak(&v4, &location);
  [(RCMainViewController *)self->_mainViewController setForegroundCompletionBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_startPlaybackQuickActionForRecordingWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(VMAudioService *)self->_audioService recordingController];

  if (v4 && !v5)
  {
    objc_initWeak(&location, self->_mainViewController);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10006A7B0;
    v6[3] = &unk_1002220C0;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [(RCMainViewController *)self->_mainViewController setForegroundCompletionBlock:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (BOOL)cloudSyncPromptMustShowOrIsShowing
{
  if ([(RCDefaultSceneDelegate *)self _cloudSyncPromptNeedsShowing]) {
    return 1;
  }
  id v4 = [(RCDefaultSceneDelegate *)self iCloudSyncConfirmationAlertController];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)_promptForCloudKitIfLoggedInAndTCCUnset
{
  if ([(RCDefaultSceneDelegate *)self _cloudSyncPromptNeedsShowing])
  {
    [(RCDefaultSceneDelegate *)self _askUserForPermissionToUseCloudKit];
  }
}

- (void)_askUserForPermissionToUseCloudKit
{
  if (self->_cloudSyncAccessManager)
  {
    BOOL v3 = [(RCDefaultSceneDelegate *)self iCloudSyncConfirmationAlertController];

    if (!v3)
    {
      id v4 = +[NSBundle mainBundle];
      id v5 = [v4 localizedStringForKey:@"POST_WELCOME_ICLOUD_CONFIRMATION_ALERT_TITLE" value:&stru_100228BC8 table:0];
      id v6 = +[NSBundle mainBundle];
      id v7 = [v6 localizedStringForKey:@"POST_WELCOME_ICLOUD_CONFIRMATION_ALERT_DESCRIPTION" value:&stru_100228BC8 table:0];
      id v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];

      [(RCDefaultSceneDelegate *)self setICloudSyncConfirmationAlertController:v8];
      id v9 = +[NSBundle mainBundle];
      uint64_t v10 = [v9 localizedStringForKey:@"CANCEL" value:&stru_100228BC8 table:0];

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10006AAFC;
      v16[3] = &unk_1002220E8;
      v16[4] = self;
      id v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:v16];
      [v8 addAction:v11];
      id v12 = +[NSBundle mainBundle];
      uint64_t v13 = [v12 localizedStringForKey:@"POST_WELCOME_ICLOUD_CONFIRMATION_ALERT_BUTTON_TITLE_ENABLE" value:&stru_100228BC8 table:0];

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10006AB14;
      v15[3] = &unk_1002220E8;
      v15[4] = self;
      uint64_t v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v15];
      [v8 addAction:v14];
      [v8 rc_showInMainWindow];
    }
  }
}

- (void)_failedToCreateDatabase:(id)a3
{
  if (!self->_fatalErrorAlertController)
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"CREATE_DATABASE_FAILED_ALERT_TITLE" value:&stru_100228BC8 table:0];
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"CREATE_DATABASE_FAILED_ALERT_MESSAGE" value:&stru_100228BC8 table:0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006AC6C;
    v10[3] = &unk_100221278;
    v10[4] = self;
    id v8 = +[UIAlertController rc_OKAlertControllerWithTitle:v5 message:v7 handler:v10];
    fatalErrorAlertController = self->_fatalErrorAlertController;
    self->_fatalErrorAlertController = v8;

    [(UIAlertController *)self->_fatalErrorAlertController rc_showInMainWindow];
  }
}

- (void)_delayedSelectRecordingWithUUID:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 500000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006AD70;
  v7[3] = &unk_100221C38;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)_selectSharedRecording:(id)a3
{
  id v4 = [a3 uuid];
  +[RCAnalyticsUtilities sendReceivedSharedRecording];
  [(RCDefaultSceneDelegate *)self _delayedSelectRecordingWithUUID:v4];
}

- (BOOL)_isCoreDataURL:(id)a3
{
  BOOL v3 = [a3 scheme];
  unsigned __int8 v4 = [v3 isEqualToString:@"x-coredata"];

  return v4;
}

- (void)setMainViewController:(id)a3
{
}

- (RCSplitViewController)rootSplitViewController
{
  return self->_rootSplitViewController;
}

- (void)setRootSplitViewController:(id)a3
{
}

- (void)setWelcomeViewController:(id)a3
{
}

- (UIAlertController)fatalErrorAlertController
{
  return self->_fatalErrorAlertController;
}

- (void)setFatalErrorAlertController:(id)a3
{
}

- (UINavigationController)primaryNavigationController
{
  return self->_primaryNavigationController;
}

- (void)setPrimaryNavigationController:(id)a3
{
}

- (UINavigationController)secondaryNavigationController
{
  return self->_secondaryNavigationController;
}

- (void)setSecondaryNavigationController:(id)a3
{
}

- (RCCloudSyncAccessManager)cloudSyncAccessManager
{
  return self->_cloudSyncAccessManager;
}

- (void)setCloudSyncAccessManager:(id)a3
{
}

- (UIAlertController)iCloudSyncConfirmationAlertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iCloudSyncConfirmationAlertController);

  return (UIAlertController *)WeakRetained;
}

- (void)setICloudSyncConfirmationAlertController:(id)a3
{
}

- (UIApplicationShortcutItem)shortcutItem
{
  return self->_shortcutItem;
}

- (void)setShortcutItem:(id)a3
{
}

- (NSSet)userActivities
{
  return self->_userActivities;
}

- (void)setUserActivities:(id)a3
{
}

- (NSSet)URLContexts
{
  return self->_URLContexts;
}

- (void)setURLContexts:(id)a3
{
}

- (VMAudioService)audioService
{
  return self->_audioService;
}

- (void)setAudioService:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)tccAccessChangedWhileInBackground
{
  return self->_tccAccessChangedWhileInBackground;
}

- (void)setTccAccessChangedWhileInBackground:(BOOL)a3
{
  self->_tccAccessChangedWhileInBackground = a3;
}

- (int)removeAllRecordingsToken
{
  return self->_removeAllRecordingsToken;
}

- (void)setRemoveAllRecordingsToken:(int)a3
{
  self->_removeAllRecordingsToken = a3;
}

- (int)resetDefaultsToken
{
  return self->_resetDefaultsToken;
}

- (void)setResetDefaultsToken:(int)a3
{
  self->_resetDefaultsToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioService, 0);
  objc_storeStrong((id *)&self->_URLContexts, 0);
  objc_storeStrong((id *)&self->_userActivities, 0);
  objc_storeStrong((id *)&self->_shortcutItem, 0);
  objc_destroyWeak((id *)&self->_iCloudSyncConfirmationAlertController);
  objc_storeStrong((id *)&self->_cloudSyncAccessManager, 0);
  objc_storeStrong((id *)&self->_secondaryNavigationController, 0);
  objc_storeStrong((id *)&self->_primaryNavigationController, 0);
  objc_storeStrong((id *)&self->_fatalErrorAlertController, 0);
  objc_destroyWeak((id *)&self->_welcomeViewController);
  objc_storeStrong((id *)&self->_playbackContainerViewController, 0);
  objc_storeStrong((id *)&self->_rootSplitViewController, 0);
  objc_destroyWeak((id *)&self->_defaultSceneActivationStateDelegate);
  objc_destroyWeak((id *)&self->_deferredInitializationDelegate);

  objc_storeStrong((id *)&self->_mainViewController, 0);
}

@end