@interface BKSceneController
- (BAAnalyticsController)ba_analyticsController;
- (BCEngagementProvider)bc_engagementProvider;
- (BKAnalyticsSessionHost)analyticsSessionHost;
- (BKAppAnalyticsManager)analyticsManager;
- (BKBookReaderInteractionCoordinator)interactionCoordinator;
- (BKMachineAuthorizationService)machineAuthorizationService;
- (BKMainFlowController)_mainFlowControllerIfCreated;
- (BKMainFlowController)mainFlowController;
- (BKRootBarCoordinating)rootBarCoordinator;
- (BKSceneController)initWithSceneType:(unint64_t)a3 launchCoordinator:(id)a4 criticalAlertCoordinator:(id)a5;
- (BKUpgradeViewController)upgradeViewController;
- (BOOL)isHostingRootBar;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)sceneSupportsMinifiedPresenting;
- (BSUINativeFeedCardsPresenting)feedCardPresenting;
- (CGSize)preferredContentSizeForNavigationController:(id)a3;
- (NSDictionary)userInfoForStateRestoration;
- (NSString)requestAssetID;
- (UIView)statusBarFade;
- (id)_mainViewControllerForModalPresenting;
- (id)_optionsForContinueOpenBookActivity:(BOOL)a3;
- (id)_sceneManager;
- (id)analyticsManagerLibrary:(id)a3;
- (id)analyticsManagerSceneManager:(id)a3;
- (id)dataForStateRestoration;
- (id)flowControllerModalPresentingViewController;
- (id)flowControllers;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)rootViewController;
- (id)screen;
- (id)ubiquityStatusMonitor;
- (void)_finishWindowSetup:(id)a3;
- (void)_handleOpenBookActivityWithAssetID:(id)a3 isStateRestoration:(BOOL)a4;
- (void)_setupWithWindow:(id)a3;
- (void)_showWelcomeScreen:(id)a3 completion:(id)a4;
- (void)analyticsManagerDidRestoreSession:(id)a3;
- (void)analyticsManagerForceEndSession:(id)a3;
- (void)analyticsManagerForceEndSession:(id)a3 reason:(int64_t)a4;
- (void)handleCreateSceneUserActivityWhenReady:(id)a3;
- (void)handleStateRestorationFromData:(id)a3;
- (void)saveStateClosing:(BOOL)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setBk_window:(id)a3;
- (void)setRequestAssetID:(id)a3;
- (void)setRootBarCoordinator:(id)a3;
- (void)setStatusBarFade:(id)a3;
- (void)setUpgradeViewController:(id)a3;
- (void)setUserInfoForStateRestoration:(id)a3;
- (void)setupPlaceholderWindow;
- (void)setupRootViewController;
- (void)setupStatusBar;
- (void)storeDidAttemptSignOut:(id)a3;
- (void)updateCloseTypeState:(int64_t)a3;
- (void)welcomePresenterFinishOngoingModalTransitionAnimations:(id)a3;
- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6;
@end

@implementation BKSceneController

- (void)setRootBarCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_100023F40(a3);

  swift_unknownObjectRelease();
}

- (BKMainFlowController)mainFlowController
{
  mainFlowController = self->_mainFlowController;
  if (!mainFlowController)
  {
    v4 = [BKMainFlowController alloc];
    v5 = +[BKLibraryManager defaultManager];
    v6 = [(BKMainFlowController *)v4 initWithLibraryAssetProvider:v5];
    v7 = self->_mainFlowController;
    self->_mainFlowController = v6;

    [(BKMainFlowController *)self->_mainFlowController setDelegate:self];
    v8 = [(BKSceneController *)self rootBarCoordinator];
    [(BKMainFlowController *)self->_mainFlowController setRootBarCoordinator:v8];

    mainFlowController = self->_mainFlowController;
  }

  return mainFlowController;
}

- (BKSceneController)initWithSceneType:(unint64_t)a3 launchCoordinator:(id)a4 criticalAlertCoordinator:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BKSceneController;
  v10 = [(_BKBaseSceneController *)&v22 initWithSceneType:a3];
  v11 = v10;
  if (v10)
  {
    [(_BKBaseSceneController *)v10 setLaunchCoordinator:v8];
    [(_BKBaseSceneController *)v11 setCriticalAlertCoordinator:v9];
    v12 = objc_alloc_init(BKAppAnalyticsManager);
    [(BKSceneController *)v11 setAnalyticsManager:v12];

    v13 = [(BKSceneController *)v11 analyticsManager];
    [v13 setDelegate:v11];

    v14 = [(BKSceneController *)v11 analyticsManager];
    [v14 analyticsSetupTracking];

    v15 = [BKAnalyticsSessionHost alloc];
    v16 = [(BKSceneController *)v11 analyticsManager];
    v17 = [(BKAnalyticsSessionHost *)v15 initWithAnalyticsManager:v16];
    analyticsSessionHost = v11->_analyticsSessionHost;
    v11->_analyticsSessionHost = v17;

    v19 = [[BKBookReaderInteractionCoordinator alloc] initWithWindow:0];
    interactionCoordinator = v11->_interactionCoordinator;
    v11->_interactionCoordinator = v19;
  }
  return v11;
}

- (BKAppAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setupRootViewController
{
  objc_opt_class();
  v3 = [(_BKBaseSceneController *)self bk_window];
  v4 = [v3 rootViewController];
  BUDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = [(BKSceneController *)self rootBarCoordinator];
  v6 = [v5 rootViewController];
  [v7 setRootViewController:v6];
}

- (void)_finishWindowSetup:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(BKRootViewController);
  [(BKRootViewController *)v5 _bk_setSceneController:self];
  [v4 setRootViewController:v5];
  v6 = [v4 rootViewController];
  id v7 = [v6 view];
  id v8 = [(BKSceneController *)self upgradeViewController];
  id v9 = [v8 view];
  [v7 addSubview:v9];

  v10 = [(BKSceneController *)self ba_analyticsController];
  v11 = [v10 applicationTracker];
  v12 = [v4 rootViewController];
  [v12 ba_setAnalyticsTracker:v11];

  v13 = [v4 rootViewController];
  [v13 setBc_engagementProviderSource:self];

  if ((id)[(_BKBaseSceneController *)self sceneType] == (id)1)
  {
    v14 = [(BKSceneController *)self _sceneManager];
    v15 = [v14 rootBarCoordinatorForSceneController:self];
    [(BKSceneController *)self setRootBarCoordinator:v15];
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000FB14;
  v32[3] = &unk_100A43D60;
  v32[4] = self;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10000EF34;
  v31[3] = &unk_100A44268;
  v31[4] = self;
  +[UIView animateWithDuration:5242880 delay:v32 options:v31 animations:0.2 completion:0.0];
  if ((id)[(_BKBaseSceneController *)self sceneType] == (id)1)
  {
    v16 = [v4 rootViewController];
    unint64_t v17 = (unint64_t)[v16 supportedInterfaceOrientations];
    v18 = [v4 windowScene];
    unsigned __int8 v19 = [v18 interfaceOrientation];

    if ((v17 & (1 << v19)) != 0)
    {
      v20 = [(_BKBaseSceneController *)self launchCoordinator];
      [v20 signalConditionSatisfied:7];
    }
    else
    {
      objc_initWeak(&location, self);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10009C40C;
      v28[3] = &unk_100A44290;
      objc_copyWeak(v29, &location);
      v29[1] = (id)0x3FF0000000000000;
      v21 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v28 block:1.0];
      rotationToSupportedTimer = self->_rotationToSupportedTimer;
      self->_rotationToSupportedTimer = v21;

      v23 = BCSceneLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [v4 windowScene];
        id v25 = [v24 interfaceOrientation];
        *(_DWORD *)buf = 134217984;
        id v34 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "BKSceneController: Waiting for UIKit to rotate to the supported orientation from current orientation: %li", buf, 0xCu);
      }
      objc_destroyWeak(v29);
      objc_destroyWeak(&location);
    }
    v26 = [(BKSceneController *)self _sceneManager];
    v27 = [(_BKBaseSceneController *)self welcomePresenter];
    [v26 _setupWelcomeScreenWithPresenterIfNeeded:v27];
  }
}

- (id)rootViewController
{
  v2 = [(_BKBaseSceneController *)self bk_window];
  v3 = [v2 rootViewController];

  return v3;
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  v10 = [(BKSceneController *)self rootBarCoordinator];
  v11 = [v8 traitCollection];
  [v10 windowSceneTraitCollectionDidChangeFrom:v9 to:v11];

  if ((id)[(_BKBaseSceneController *)self sceneType] == (id)1)
  {
    v12 = [v8 keyWindow];
    v13 = [v12 rootViewController];
    unint64_t v14 = (unint64_t)[v13 supportedInterfaceOrientations];
    unint64_t v15 = v14 & (1 << (char)[v8 interfaceOrientation]);

    if (v15)
    {
      v16 = BCSceneLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned __int8 v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "BKSceneController: UIKit rotated to the supported orientation", v19, 2u);
      }

      unint64_t v17 = [(_BKBaseSceneController *)self launchCoordinator];
      [v17 signalConditionSatisfied:7];

      [(NSTimer *)self->_rotationToSupportedTimer invalidate];
      rotationToSupportedTimer = self->_rotationToSupportedTimer;
      self->_rotationToSupportedTimer = 0;
    }
  }
}

- (id)_sceneManager
{
  return +[BKAppDelegate sceneManager];
}

- (BKRootBarCoordinating)rootBarCoordinator
{
  v2 = self;
  v3 = (void *)BKSceneController.rootBarCoordinator.getter();

  return (BKRootBarCoordinating *)v3;
}

- (void)welcomePresenterFinishOngoingModalTransitionAnimations:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006C800;
  v5[3] = &unk_100A44120;
  v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)BKSceneController;
  id v3 = v7;
  [(_BKBaseSceneController *)&v4 welcomePresenterFinishOngoingModalTransitionAnimations:v5];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [(_BKBaseSceneController *)self scene];

  if (v10) {
    BCReportAssertionFailureWithMessage();
  }
  objc_opt_class();
  v11 = BUDynamicCast();

  [(_BKBaseSceneController *)self setScene:v11];
  [v11 setController:self];
  v12 = [(_BKBaseSceneController *)self bk_window];
  v13 = v12;
  if (v12)
  {
    [v12 setWindowScene:v11];
    [v13 makeKeyAndVisible];
  }
  else
  {
    unint64_t v14 = [(_BKBaseSceneController *)self _windowWithScene:v11 sceneType:[(_BKBaseSceneController *)self sceneType]];
    if ((id)[(_BKBaseSceneController *)self sceneType] == (id)2)
    {
      [(BKSceneController *)self _setupAccountSceneForWindow:v14];
    }
    else
    {
      if ((id)[(_BKBaseSceneController *)self sceneType] == (id)3) {
        [(BKSceneController *)self _setupEndOfBookSceneForWindow:v14 withSession:v15 options:v8];
      }
      else {
        [(BKSceneController *)self _setupWithWindow:v14];
      }
      [(BKSceneController *)self setupStatusBar];
    }
  }
}

- (void)_setupWithWindow:(id)a3
{
  id v7 = a3;
  [(BKSceneController *)self setBk_window:v7];
  objc_super v4 = objc_alloc_init(BKUpgradeViewController);
  [(BKSceneController *)self setUpgradeViewController:v4];

  v5 = [(BKSceneController *)self upgradeViewController];
  [v5 _bk_setSceneController:self];

  v6 = [(BKSceneController *)self upgradeViewController];
  [v7 setRootViewController:v6];

  [v7 makeKeyAndVisible];
  [(BKSceneController *)self _finishWindowSetup:v7];
}

- (BKUpgradeViewController)upgradeViewController
{
  return self->_upgradeViewController;
}

- (id)flowControllers
{
  v2 = [(BKSceneController *)self mainFlowController];
  v5 = v2;
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (void)updateCloseTypeState:(int64_t)a3
{
  id v3 = [(BKSceneController *)self bookFlowAssetPresenting];
  objc_super v4 = [v3 presenterViewControllersConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) assetPresenterUpdateCloseTypeState:v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setupStatusBar
{
}

- (void)setUpgradeViewController:(id)a3
{
}

- (void)setBk_window:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKSceneController;
  id v4 = a3;
  [(_BKBaseSceneController *)&v6 setBk_window:v4];
  id v5 = [(BKSceneController *)self interactionCoordinator];
  [v5 setWindow:v4];
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = [(BKSceneController *)self analyticsManager];
  [v4 analyticsStartSession];

  [(_BKBaseSceneController *)self _interruptReadAloud:0];
  id v5 = [(BKSceneController *)self _sceneManager];
  objc_super v6 = [(_BKBaseSceneController *)self welcomePresenter];
  [v5 _setCurrentWelcomePresenterIfNeeded:v6];

  id v7 = [(_BKBaseSceneController *)self launchCoordinator];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016C80;
  v8[3] = &unk_100A44268;
  v8[4] = self;
  [v7 appLaunchCoordinatorOnConditionMask:32 blockID:@"sceneWillEnterForeground" performBlock:v8];
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v3 = [(_BKBaseSceneController *)self bk_window];
  [v3 makeKeyAndVisible];
}

- (BKBookReaderInteractionCoordinator)interactionCoordinator
{
  return self->_interactionCoordinator;
}

- (BAAnalyticsController)ba_analyticsController
{
  v2 = [(BKSceneController *)self analyticsManager];
  id v3 = [v2 analyticsController];

  id v4 = [v3 delegate];

  if (!v4) {
    BCReportAssertionFailureWithMessage();
  }
  id v5 = [v3 applicationTracker];

  if (!v5) {
    BCReportAssertionFailureWithMessage();
  }

  return (BAAnalyticsController *)v3;
}

- (id)analyticsManagerLibrary:(id)a3
{
  id v3 = +[BKAppDelegate delegate];
  id v4 = [v3 mainLibrary];

  return v4;
}

- (BKMainFlowController)_mainFlowControllerIfCreated
{
  return self->_mainFlowController;
}

- (void)saveStateClosing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BKSceneController *)self mainFlowController];
  [v4 saveStateClosing:v3];
}

- (id)_mainViewControllerForModalPresenting
{
  BOOL v3 = [(BKSceneController *)self rootBarCoordinator];
  id v4 = [v3 rootViewController];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(_BKBaseSceneController *)self bk_window];
    id v6 = [v7 rootViewController];
  }

  return v6;
}

- (BSUINativeFeedCardsPresenting)feedCardPresenting
{
  BOOL v3 = [(BKSceneController *)self rootBarCoordinator];
  if (v3)
  {
    id v4 = [(BKSceneController *)self rootBarCoordinator];
    id v5 = [v4 selectedNavigationController];
    id v6 = [v5 topViewController];
  }
  else
  {
    id v6 = [(BKSceneController *)self flowControllerModalPresentingViewController];
  }

  return (BSUINativeFeedCardsPresenting *)v6;
}

- (id)screen
{
  BOOL v3 = [(_BKBaseSceneController *)self scene];
  if (v3)
  {
    id v4 = [(_BKBaseSceneController *)self scene];
    id v5 = [v4 screen];
  }
  else
  {
    id v5 = +[UIScreen mainScreen];
  }

  return v5;
}

- (id)ubiquityStatusMonitor
{
  v2 = +[BKAppDelegate delegate];
  BOOL v3 = [v2 ubiquityStatusMonitor];

  return v3;
}

- (void)_showWelcomeScreen:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BKSceneController *)self genericPresenting];
  id v9 = [v8 presenterModalPresentingViewController];
  long long v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    long long v12 = [(BKSceneController *)self rootBarCoordinator];
    id v11 = [v12 rootViewController];
  }
  long long v13 = [v11 presentedViewController];

  if (v13)
  {
    do
    {
      unint64_t v14 = [v11 presentedViewController];

      id v15 = [v14 presentedViewController];

      id v11 = v14;
    }
    while (v15);
  }
  else
  {
    unint64_t v14 = v11;
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10009C830;
  v28[3] = &unk_100A442E0;
  id v16 = v14;
  id v29 = v16;
  id v17 = v7;
  id v31 = v17;
  id v18 = v6;
  id v30 = v18;
  unsigned __int8 v19 = [v18 welcomeScreenViewControllerWithCompletion:v28];
  v20 = BCSceneLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v18;
    __int16 v34 = 2112;
    id v35 = v16;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Showing the welcome screen for %@ on presenter %@", buf, 0x16u);
  }

  v21 = [[BKWelcomeNavigationController alloc] initWithRootViewController:v19];
  objc_super v22 = [(BKWelcomeNavigationController *)v21 navigationBar];
  [v22 setHidden:1];

  [(BKWelcomeNavigationController *)v21 setModalPresentationStyle:2];
  [(BKWelcomeNavigationController *)v21 setModalTransitionStyle:2];
  v23 = [(BKWelcomeNavigationController *)v21 presentationController];
  [v23 setDelegate:self];

  [(BKWelcomeNavigationController *)v21 setBkDelegate:self];
  v24 = [v16 transitionCoordinator];
  if (v24)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10009C92C;
    v25[3] = &unk_100A44308;
    id v26 = v16;
    v27 = v21;
    [v24 animateAlongsideTransition:0 completion:v25];
  }
  else
  {
    [v16 presentViewController:v21 withTransition:0 completion:0];
  }
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (CGSize)preferredContentSizeForNavigationController:(id)a3
{
  BOOL v3 = [a3 viewControllers];
  id v4 = [v3 firstObject];

  [v4 preferredContentSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BCEngagementProvider)bc_engagementProvider
{
  v2 = +[BKAppDelegate delegate];
  BOOL v3 = [v2 engagementManager];

  return (BCEngagementProvider *)v3;
}

- (id)analyticsManagerSceneManager:(id)a3
{
  return +[BKAppDelegate sceneManager];
}

- (void)analyticsManagerForceEndSession:(id)a3
{
}

- (void)analyticsManagerForceEndSession:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009CB90;
  v11[3] = &unk_100A44330;
  objc_copyWeak(v13, &location);
  id v7 = v6;
  id v12 = v7;
  v13[1] = (id)a4;
  double v8 = objc_retainBlock(v11);
  if (v8)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v8[2])(v8);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10009CC78;
      block[3] = &unk_100A442B8;
      double v10 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)analyticsManagerDidRestoreSession:(id)a3
{
  id v3 = +[BKAppDelegate sceneManager];
  [v3 analyticsVisibilityUpdate];
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return +[BKCrossFadeTransition transitionWithDuration:](BKCrossFadeTransition, "transitionWithDuration:", a3, a4, a5, a6, 0.1);
}

- (BOOL)sceneSupportsMinifiedPresenting
{
  v2 = [(BKSceneController *)self rootBarCoordinator];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setupPlaceholderWindow
{
  BOOL v3 = [(_BKBaseSceneController *)self bk_window];

  if (!v3)
  {
    id v4 = +[BKAppDelegate anySceneController];
    id v7 = [v4 scene];

    double v5 = [(BKSceneController *)self screen];
    [v5 setWantsSoftwareDimming:1];

    id v6 = [(_BKBaseSceneController *)self _windowWithScene:v7 sceneType:[(_BKBaseSceneController *)self sceneType]];
    [(BKSceneController *)self _setupWithWindow:v6];
    [v6 setHidden:1];
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  double v5 = [(_BKBaseSceneController *)self bk_window];
  id v6 = [v5 rootViewController];
  id v29 = [v6 im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKSceneHosting];

  id v7 = [(_BKBaseSceneController *)self bk_window];
  double v8 = [v7 rootViewController];
  double v9 = [v8 im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKBookPresenting];

  id v10 = [(_BKBaseSceneController *)self newShowAssetTransaction];
  id v11 = [v9 currentAssetPresentersForSingleSceneWithTransaction:v10];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v41;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v40 + 1) + 8 * i) assetPresenterPrepareForTermination];
      }
      id v13 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v13);
  }
  [v5 setHidden:1];
  id v16 = [(BKSceneController *)self _sceneManager];
  id v17 = [(_BKBaseSceneController *)self welcomePresenter];
  [v16 _welcomePresenterDidDisconnect:v17];

  if ((id)[(_BKBaseSceneController *)self sceneType] == (id)2)
  {
    id v18 = v29;
    [v29 didDisconnectScene:v4];
    [(BKSceneController *)self setBk_window:0];
LABEL_14:
    [(_BKBaseSceneController *)self setScene:0];
    goto LABEL_15;
  }
  unsigned __int8 v19 = [(BKSceneController *)self rootBarCoordinator];
  id v18 = v29;
  if (v19)
  {

LABEL_13:
    [v29 didDisconnectScene:v4];
    goto LABEL_14;
  }
  if ((id)[(_BKBaseSceneController *)self sceneType] == (id)3) {
    goto LABEL_13;
  }
  v27 = v5;
  v28 = v4;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v20 = v11;
  id v21 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v37;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
        id v26 = [v25 assetPresenterAssetID:v27];
        [v9 requestOpenBookMinified:v26 transaction:v10 force:1];

        [v25 assetPresenterPrepareForDismissal];
      }
      id v22 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v22);
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10009D1A8;
  v30[3] = &unk_100A44358;
  id v31 = v20;
  id v18 = v29;
  id v32 = v29;
  id v4 = v28;
  id v33 = v28;
  double v5 = v27;
  id v34 = v27;
  id v35 = self;
  [v9 closeAllPresentersForSingleSceneWithTransaction:v10 animated:0 completion:v30];

LABEL_15:
}

- (void)sceneDidEnterBackground:(id)a3
{
  [(_BKBaseSceneController *)self _interruptReadAloud:1];
  id v4 = [(BKSceneController *)self analyticsManager];
  [(BKSceneController *)self analyticsManagerForceEndSession:v4 reason:1];

  double v5 = [(_BKBaseSceneController *)self launchCoordinator];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009D3FC;
  v6[3] = &unk_100A44268;
  v6[4] = self;
  [v5 appLaunchCoordinatorOnConditionMask:32 blockID:@"sceneDidEnterBackground" performBlock:v6];
}

- (void)handleCreateSceneUserActivityWhenReady:(id)a3
{
  id v10 = [a3 userInfo];
  id v4 = +[NSMutableDictionary dictionary];
  objc_opt_class();
  uint64_t v5 = BCContinuationActivityAssetIDKey;
  id v6 = [v10 objectForKeyedSubscript:BCContinuationActivityAssetIDKey];
  id v7 = BUDynamicCast();

  if ([v7 length])
  {
    [(BKSceneController *)self setRequestAssetID:v7];
    [v4 setObject:v7 forKeyedSubscript:v5];
  }
  objc_opt_class();
  double v8 = [v10 objectForKeyedSubscript:BCBookDisplayTitle];
  double v9 = BUDynamicCast();

  if ([v9 length]) {
    [v4 setObject:v9 forKeyedSubscript:BCBookDisplayTitle];
  }
  [(BKSceneController *)self _handleOpenBookActivityWithAssetID:v7 isStateRestoration:0];
}

- (void)handleStateRestorationFromData:(id)a3
{
  uint64_t v4 = BCContinuationActivityAssetIDKey;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:v4];
  [(BKSceneController *)self setRequestAssetID:v6];

  v7.receiver = self;
  v7.super_class = (Class)BKSceneController;
  [(_BKBaseSceneController *)&v7 handleStateRestorationFromData:v5];
}

- (id)_optionsForContinueOpenBookActivity:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKSceneController;
  id v5 = -[_BKBaseSceneController _optionsForContinueOpenBookActivity:](&v10, "_optionsForContinueOpenBookActivity:");
  id v6 = [v5 mutableCopy];

  if (v3)
  {
    objc_super v7 = [(BKSceneController *)self rootBarCoordinator];

    double v8 = off_100A47500;
    if (v7) {
      double v8 = off_100A474E8;
    }
    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:*v8];
  }

  return v6;
}

- (void)_handleOpenBookActivityWithAssetID:(id)a3 isStateRestoration:(BOOL)a4
{
  id v6 = a3;
  objc_super v7 = [(_BKBaseSceneController *)self launchCoordinator];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009D7F4;
  v9[3] = &unk_100A44380;
  BOOL v12 = a4;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  [v7 appLaunchCoordinatorOnConditionMask:65 blockID:@"_handleOpenBookActivityWithAssetID" performBlock:v9];
}

- (id)dataForStateRestoration
{
  v14.receiver = self;
  v14.super_class = (Class)BKSceneController;
  BOOL v3 = [(_BKBaseSceneController *)&v14 dataForStateRestoration];
  id v4 = [v3 mutableCopy];

  id v5 = [(BKSceneController *)self rootBarCoordinator];

  if (!v5)
  {
    uint64_t v9 = [(BKSceneController *)self requestAssetID];
    if (v9)
    {
      id v10 = (void *)v9;
      uint64_t v11 = BCContinuationActivityAssetIDKey;
      BOOL v12 = [v4 objectForKeyedSubscript:BCContinuationActivityAssetIDKey];

      if (!v12)
      {
        id v13 = [(BKSceneController *)self requestAssetID];
        [v4 setObject:v13 forKeyedSubscript:v11];
      }
    }
  }
  if ((id)[(_BKBaseSceneController *)self sceneType] == (id)3)
  {
    id v6 = [(BKSceneController *)self userInfoForStateRestoration];
    id v7 = [v6 copy];

    id v4 = v7;
  }

  return v4;
}

- (BOOL)isHostingRootBar
{
  v2 = [(BKSceneController *)self rootBarCoordinator];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)flowControllerModalPresentingViewController
{
  v2 = [(BKSceneController *)self rootViewController];
  BOOL v3 = [v2 presentedViewController];
  objc_opt_class();
  id v4 = BUClassAndProtocolCast();

  if (v4)
  {
    id v5 = v4;

    v2 = v5;
  }

  return v2;
}

- (void)storeDidAttemptSignOut:(id)a3
{
  if ((id)[(_BKBaseSceneController *)self sceneType] == (id)2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009DAC8;
    block[3] = &unk_100A43D60;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (NSString)requestAssetID
{
  return self->_requestAssetID;
}

- (void)setRequestAssetID:(id)a3
{
}

- (UIView)statusBarFade
{
  return self->_statusBarFade;
}

- (void)setStatusBarFade:(id)a3
{
}

- (NSDictionary)userInfoForStateRestoration
{
  return self->_userInfoForStateRestoration;
}

- (void)setUserInfoForStateRestoration:(id)a3
{
}

- (BKAnalyticsSessionHost)analyticsSessionHost
{
  return self->_analyticsSessionHost;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsSessionHost, 0);
  objc_storeStrong((id *)&self->_interactionCoordinator, 0);
  objc_storeStrong((id *)&self->_userInfoForStateRestoration, 0);
  objc_storeStrong((id *)&self->_upgradeViewController, 0);
  objc_storeStrong((id *)&self->_statusBarFade, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_requestAssetID, 0);
  objc_storeStrong((id *)&self->_mainFlowController, 0);

  objc_storeStrong((id *)&self->_rotationToSupportedTimer, 0);
}

- (BKMachineAuthorizationService)machineAuthorizationService
{
  v2 = self;
  id v3 = sub_10078A0FC();

  return (BKMachineAuthorizationService *)v3;
}

@end