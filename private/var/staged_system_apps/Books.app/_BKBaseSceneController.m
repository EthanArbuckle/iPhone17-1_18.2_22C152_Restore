@interface _BKBaseSceneController
+ (BOOL)isStateRestorationDisabledForSceneType:(unint64_t)a3;
+ (id)sceneInfoFromSceneSession:(id)a3;
- (BCExternalURLOpenPrompter)externalURLLoadPrompter;
- (BCExternalURLOpenPrompter)externalURLOpenPrompter;
- (BCStatusBarBackgroundController)statusBarBackgroundController;
- (BKAppLaunchCoordinator)launchCoordinator;
- (BKCriticalAlertCoordinating)criticalAlertCoordinator;
- (BKSceneInfo)sceneInfo;
- (BOOL)_assetSupportsSnapshots:(id)a3;
- (BOOL)continueActivity:(id)a3 sceneController:(id)a4;
- (BOOL)handledStateRestoration;
- (BOOL)isStateRestorationDisabled;
- (BOOL)welcomePresenterIsPresentingWelcome;
- (BOOL)willAttemptBookReopen;
- (BOOL)willContinueActivityWithType:(id)a3 sceneController:(id)a4;
- (UIViewController)welcomeViewController;
- (UIWindow)bk_window;
- (UIWindowScene)scene;
- (_BKBaseSceneController)initWithSceneType:(unint64_t)a3;
- (id)_assetPresenters;
- (id)_lastOpenBookManager;
- (id)_optionsForContinueOpenBookActivity:(BOOL)a3;
- (id)_viewControllerForWelcomePresenting;
- (id)_viewControllerFromWhichToPresentAlerts;
- (id)_windowWithScene:(id)a3 sceneType:(unint64_t)a4;
- (id)dataForStateRestoration;
- (id)newShowAssetTransaction;
- (id)newShowAssetTransactionWithTargetSceneDescriptor:(id)a3;
- (id)newShowURLTransaction;
- (id)newShowURLTransactionWithTargetSceneDescriptor:(id)a3;
- (id)newTransactionWithName:(id)a3;
- (id)newTransactionWithName:(id)a3 targetSceneDescriptor:(id)a4;
- (id)stateRestorationActivityForScene:(id)a3;
- (unint64_t)sceneType;
- (void)_continueOpenBookActivity:(id)a3 assetLogID:(id)a4 isStateRestoration:(BOOL)a5;
- (void)_doInterruptReadAloud:(BOOL)a3;
- (void)_handleOpenBookActivityWithAssetID:(id)a3 isStateRestoration:(BOOL)a4;
- (void)_handleStateRestorationCompleted;
- (void)_interruptReadAloud:(BOOL)a3;
- (void)_setupStatusBarBlurBackground;
- (void)dismissWelcomeViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleStateRestorationFromData:(id)a3;
- (void)openURL:(id)a3 options:(id)a4;
- (void)presentAlertController:(id)a3 promptContext:(id)a4;
- (void)presentModalViewController:(id)a3 animated:(BOOL)a4;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentWelcomeViewController:(id)a3 completion:(id)a4;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4;
- (void)setBk_window:(id)a3;
- (void)setCriticalAlertCoordinator:(id)a3;
- (void)setExternalURLLoadPrompter:(id)a3;
- (void)setExternalURLOpenPrompter:(id)a3;
- (void)setHandledStateRestoration:(BOOL)a3;
- (void)setIsStateRestorationDisabled:(BOOL)a3;
- (void)setLaunchCoordinator:(id)a3;
- (void)setScene:(id)a3;
- (void)setStatusBarBackgroundController:(id)a3;
- (void)setWelcomeViewController:(id)a3;
- (void)setWillAttemptBookReopen:(BOOL)a3;
- (void)welcomePresenterFinishOngoingModalTransitionAnimations:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation _BKBaseSceneController

- (UIWindowScene)scene
{
  return self->_scene;
}

- (UIWindow)bk_window
{
  return self->_bk_window;
}

- (BKAppLaunchCoordinator)launchCoordinator
{
  return self->_launchCoordinator;
}

- (void)welcomePresenterFinishOngoingModalTransitionAnimations:(id)a3
{
  v4 = (void (**)(id))a3;
  v5 = [(_BKBaseSceneController *)self _viewControllerForWelcomePresenting];
  id v7 = v5;
  if (v5)
  {
    [v5 im_finishOngoingModalTransitionAnimations:v4];
  }
  else
  {
    v6 = objc_retainBlock(v4);

    if (v6) {
      v6[2](v6);
    }
    v4 = v6;
  }
}

- (id)_viewControllerForWelcomePresenting
{
  v2 = [(_BKBaseSceneController *)self bk_window];
  v3 = [v2 rootViewController];

  return v3;
}

- (unint64_t)sceneType
{
  return self->_sceneType;
}

- (BOOL)willAttemptBookReopen
{
  return self->_willAttemptBookReopen;
}

- (UIViewController)welcomeViewController
{
  return self->_welcomeViewController;
}

- (BCStatusBarBackgroundController)statusBarBackgroundController
{
  return self->_statusBarBackgroundController;
}

- (void)setWelcomeViewController:(id)a3
{
}

- (void)setStatusBarBackgroundController:(id)a3
{
}

- (void)setScene:(id)a3
{
}

- (void)setLaunchCoordinator:(id)a3
{
}

- (void)setCriticalAlertCoordinator:(id)a3
{
}

- (void)setBk_window:(id)a3
{
}

- (BOOL)isStateRestorationDisabled
{
  v3 = objc_opt_class();
  unint64_t v4 = [(_BKBaseSceneController *)self sceneType];

  return _[v3 isStateRestorationDisabledForSceneType:v4];
}

- (_BKBaseSceneController)initWithSceneType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_BKBaseSceneController;
  result = [(_BKBaseSceneController *)&v5 init];
  if (result) {
    result->_sceneType = a3;
  }
  return result;
}

- (void)dismissWelcomeViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(_BKBaseSceneController *)self _viewControllerForWelcomePresenting];
  v8 = [v7 presentedViewController];
  v9 = BCSceneLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    __int16 v19 = 2114;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_BKBaseSceneController: dismissWelcomeViewControllerAnimated: presenter: %{public}@ presented: %{public}@", buf, 0x16u);
  }

  uint64_t v10 = [(_BKBaseSceneController *)self welcomeViewController];
  if (v10
    && (v11 = (void *)v10,
        [(_BKBaseSceneController *)self welcomeViewController],
        v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        v8 == v12))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000E67C0;
    v15[3] = &unk_100A44120;
    v15[4] = self;
    id v16 = v6;
    [v7 dismissViewControllerAnimated:v4 completion:v15];
  }
  else
  {
    [(_BKBaseSceneController *)self setWelcomeViewController:0];
    id v13 = objc_retainBlock(v6);
    v14 = v13;
    if (v13) {
      (*((void (**)(id))v13 + 2))(v13);
    }
  }
}

- (id)_windowWithScene:(id)a3 sceneType:(unint64_t)a4
{
  id v4 = a3;
  objc_super v5 = [v4 screen];
  [v5 setWantsSoftwareDimming:1];

  id v6 = [objc_alloc((Class)BSUIWindow) initWithWindowScene:v4];
  id v7 = +[UIColor clearColor];
  [v6 setBackgroundColor:v7];

  [v6 setOpaque:0];

  return v6;
}

- (void)_setupStatusBarBlurBackground
{
  id v5 = [(_BKBaseSceneController *)self bk_window];
  id v3 = [objc_alloc((Class)BCStatusBarBackgroundController) initWithWindow:v5];
  [(_BKBaseSceneController *)self setStatusBarBackgroundController:v3];

  id v4 = [(_BKBaseSceneController *)self statusBarBackgroundController];
  [v4 setup];
}

- (void)_interruptReadAloud:(BOOL)a3
{
  id v5 = [(_BKBaseSceneController *)self launchCoordinator];
  if ([v5 appLaunchCoordinatorIsConditionSatisfied:6])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100078AF8;
    v6[3] = &unk_100A46710;
    v6[4] = self;
    BOOL v7 = a3;
    [v5 appLaunchCoordinatorOnConditionMask:1 blockID:@"Interrupt ReadAloud" performBlock:v6];
  }
}

- (void)_doInterruptReadAloud:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = [(_BKBaseSceneController *)self bk_window];
  id v4 = [v12 rootViewController];
  if (!v4) {
    BCReportAssertionFailureWithMessage();
  }
  id v5 = [v4 im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKBookPresenting];
  if (!v5) {
    BCReportAssertionFailureWithMessage();
  }
  id v6 = BUProtocolCast();
  if (!v6) {
    BCReportAssertionFailureWithMessage();
  }
  objc_opt_class();
  BOOL v7 = [v5 bookPresenterCurrentlyOpenBookForSingleScene:v6];
  v8 = [v7 assetPresenterAssetViewController];
  v9 = BUDynamicCast();

  if (v9)
  {
    uint64_t v10 = [v9 book];
    unsigned int v11 = [v10 hasMediaOverlayElements];

    if (v3)
    {
      if (v11) {
        [v9 pauseReadAloud];
      }
      [v9 stopSoundtrack];
      [v9 stopPlayingMedia:0];
    }
    else
    {
      if (v11) {
        [v9 resumeReadAloud];
      }
      [v9 playCurrentSoundtrack];
    }
  }
}

+ (id)sceneInfoFromSceneSession:(id)a3
{
  id v3 = a3;
  id v4 = +[BKAppDelegate sceneManager];
  id v5 = [v4 _lastKnownStateRestorationUserInfoForSceneSession:v3];

  id v6 = [[_BKBaseSceneInfo alloc] initWithSceneSession:v3 userData:v5];

  return v6;
}

+ (BOOL)isStateRestorationDisabledForSceneType:(unint64_t)a3
{
  return +[BKSceneFlowController isStateRestorationDisabledForThisLaunch];
}

- (id)newTransactionWithName:(id)a3
{
  return [(_BKBaseSceneController *)self newTransactionWithName:a3 targetSceneDescriptor:0];
}

- (id)newTransactionWithName:(id)a3 targetSceneDescriptor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[BKAppDelegate sceneManager];
  id v9 = [v8 newTransactionWithName:v7 originatingSceneController:self targetSceneDescriptor:v6];

  return v9;
}

- (id)newShowAssetTransactionWithTargetSceneDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = +[BKAppDelegate sceneManager];
  id v6 = [v5 newShowAssetTransactionWithOriginatingSceneController:self targetSceneDescriptor:v4];

  return v6;
}

- (id)newShowAssetTransaction
{
  return [(_BKBaseSceneController *)self newShowAssetTransactionWithTargetSceneDescriptor:0];
}

- (id)newShowURLTransactionWithTargetSceneDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = +[BKAppDelegate sceneManager];
  id v6 = [v5 newShowURLTransactionWithOriginatingSceneController:self targetSceneDescriptor:v4];

  return v6;
}

- (id)newShowURLTransaction
{
  return [(_BKBaseSceneController *)self newShowURLTransactionWithTargetSceneDescriptor:0];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  int v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = BCSceneLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_BKBaseSceneController: presentViewController: %{public}@", buf, 0xCu);
  }

  if (v6)
  {
    unsigned int v11 = [(_BKBaseSceneController *)self launchCoordinator];
    LOBYTE(v6) = [v11 appLaunchCoordinatorHasAppLaunched];
  }
  id v12 = [(_BKBaseSceneController *)self launchCoordinator];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E4B88;
  v15[3] = &unk_100A46160;
  v15[4] = self;
  id v16 = v8;
  char v18 = v6;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  [v12 appLaunchCoordinatorPerformWhenLaunched:@"presentVC" block:v15];
}

- (void)presentModalViewController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  int v6 = BCSceneLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_BKBaseSceneController: presentModalViewController: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(_BKBaseSceneController *)self _viewControllerFromWhichToPresentAlerts];
  [v7 presentModalViewController:v5 withTransition:8];
}

- (BCExternalURLOpenPrompter)externalURLOpenPrompter
{
  externalURLOpenPrompter = self->_externalURLOpenPrompter;
  if (!externalURLOpenPrompter)
  {
    id v4 = objc_alloc((Class)BCExternalURLOpenPrompter);
    id v5 = +[BCExternalURLOpenPrompterContext sharedContextForOpening];
    int v6 = (BCExternalURLOpenPrompter *)[v4 initWithContext:v5];
    id v7 = self->_externalURLOpenPrompter;
    self->_externalURLOpenPrompter = v6;

    int v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"Leave Books and open this link?" value:&stru_100A70340 table:0];
    [(BCExternalURLOpenPrompter *)self->_externalURLOpenPrompter setPromptTitle:v9];

    uint64_t v10 = +[NSBundle mainBundle];
    unsigned int v11 = [v10 localizedStringForKey:@"Cancel" value:&stru_100A70340 table:0];
    [(BCExternalURLOpenPrompter *)self->_externalURLOpenPrompter setCancelButtonTitle:v11];

    id v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"Open" value:&stru_100A70340 table:0];
    [(BCExternalURLOpenPrompter *)self->_externalURLOpenPrompter setOkButtonTitle:v13];

    [(BCExternalURLOpenPrompter *)self->_externalURLOpenPrompter setDelegate:self];
    externalURLOpenPrompter = self->_externalURLOpenPrompter;
  }

  return externalURLOpenPrompter;
}

- (BCExternalURLOpenPrompter)externalURLLoadPrompter
{
  externalURLLoadPrompter = self->_externalURLLoadPrompter;
  if (!externalURLLoadPrompter)
  {
    id v4 = (BCExternalURLOpenPrompter *)objc_alloc_init((Class)BCExternalURLOpenPrompter);
    id v5 = self->_externalURLLoadPrompter;
    self->_externalURLLoadPrompter = v4;

    int v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"Allow Online Content?" value:&stru_100A70340 table:0];
    [(BCExternalURLOpenPrompter *)self->_externalURLLoadPrompter setPromptTitle:v7];

    int v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"This book needs to access online content, or it may not display as the publisher intended.", &stru_100A70340, 0 value table];
    [(BCExternalURLOpenPrompter *)self->_externalURLLoadPrompter setPromptMessage:v9];

    uint64_t v10 = +[NSBundle mainBundle];
    unsigned int v11 = [v10 localizedStringForKey:@"Don’t Allow" value:&stru_100A70340 table:0];
    [(BCExternalURLOpenPrompter *)self->_externalURLLoadPrompter setCancelButtonTitle:v11];

    id v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"Allow" value:&stru_100A70340 table:0];
    [(BCExternalURLOpenPrompter *)self->_externalURLLoadPrompter setOkButtonTitle:v13];

    [(BCExternalURLOpenPrompter *)self->_externalURLLoadPrompter setCacheResponses:0];
    [(BCExternalURLOpenPrompter *)self->_externalURLLoadPrompter setDelegate:self];
    externalURLLoadPrompter = self->_externalURLLoadPrompter;
  }

  return externalURLLoadPrompter;
}

- (id)_viewControllerFromWhichToPresentAlerts
{
  v2 = [(_BKBaseSceneController *)self bk_window];
  id v3 = [v2 rootViewController];
  id v4 = [v3 bc_deepestPresentedViewController];

  if ([v4 isBeingDismissed])
  {
    do
    {
      id v5 = [v4 presentingViewController];

      id v4 = v5;
    }
    while (([v5 isBeingDismissed] & 1) != 0);
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (id)_lastOpenBookManager
{
  return +[BKLastOpenBookManager sharedInstance];
}

- (BKSceneInfo)sceneInfo
{
  id v3 = [(_BKBaseSceneController *)self scene];

  if (!v3) {
    BCReportAssertionFailureWithMessage();
  }
  id v4 = [(_BKBaseSceneController *)self dataForStateRestoration];
  id v5 = [_BKBaseSceneInfo alloc];
  int v6 = [(_BKBaseSceneController *)self scene];
  id v7 = [v6 session];
  int v8 = [(_BKBaseSceneInfo *)v5 initWithSceneSession:v7 userData:v4];

  id v9 = BUProtocolCast();
  [(_BKBaseSceneInfo *)v8 setSceneController:v9];

  return (BKSceneInfo *)v8;
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v4 = a4;
  id v5 = BCSceneLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "scene willContinueUserActivityWithType: Preparing for activity with type %{public}@", (uint8_t *)&v8, 0xCu);
  }

  int v6 = +[BKUserActivityManager sharedInstance];
  id v7 = BUProtocolCast();
  [v6 willContinueActivityWithType:v4 sceneController:v7];
}

- (BOOL)willContinueActivityWithType:(id)a3 sceneController:(id)a4
{
  id v5 = a3;
  int v6 = [(_BKBaseSceneController *)self scene];
  id v7 = [v6 session];
  int v8 = [v7 stateRestorationActivity];
  if (v8 && [v5 isEqualToString:@"com.apple.iBooks.sceneStateRestoration"]) {
    unsigned int v9 = ![(_BKBaseSceneController *)self isStateRestorationDisabled];
  }
  else {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v4 = a4;
  id v5 = BCSceneLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 activityType];
    id v7 = [v4 userInfo];
    int v10 = 138543618;
    unsigned int v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "scene continueUserActivity: Handling activity activityType=%{public}@, userInfo=%@", (uint8_t *)&v10, 0x16u);
  }
  int v8 = +[BKUserActivityManager sharedInstance];
  unsigned int v9 = BUProtocolCast();
  [v8 continueActivity:v4 sceneController:v9];
}

- (BOOL)continueActivity:(id)a3 sceneController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_4;
  }
  int v8 = [v6 activityType];
  unsigned int v9 = [v8 isEqualToString:@"com.apple.iBooks.sceneStateRestoration"];
  if (!v9)
  {
LABEL_6:

    goto LABEL_7;
  }
  unsigned __int8 v10 = [(_BKBaseSceneController *)self isStateRestorationDisabled];

  if ((v10 & 1) == 0)
  {
    int v8 = [v6 userInfo];
    [(_BKBaseSceneController *)self handleStateRestorationFromData:v8];
    goto LABEL_6;
  }
LABEL_4:
  LOBYTE(v9) = 0;
LABEL_7:

  return v9;
}

- (void)_handleStateRestorationCompleted
{
  id v4 = +[BKAppDelegate sceneManager];
  id v3 = [(_BKBaseSceneController *)self scene];
  [v4 _didFinishSceneStateRestoration:v3];
}

- (void)handleStateRestorationFromData:(id)a3
{
  id v4 = a3;
  if ([(_BKBaseSceneController *)self handledStateRestoration]) {
    goto LABEL_16;
  }
  [(_BKBaseSceneController *)self setHandledStateRestoration:1];
  id v5 = [v4 objectForKeyedSubscript:BCContinuationActivityAssetIDKey];
  if (!v5) {
    goto LABEL_10;
  }
  id v6 = [(_BKBaseSceneController *)self _lastOpenBookManager];
  unsigned int v7 = [v6 shouldAutoOpenAsset:v5];

  int v8 = BCSceneLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v21[0] = 67109120;
    v21[1] = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "handleStateRestorationFromData: lastKnownSuccessfullyOpenedBook=%d", (uint8_t *)v21, 8u);
  }

  if (!v7)
  {
    unsigned __int8 v10 = BCSceneLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1007EA478((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
    }

LABEL_10:
    char v9 = 0;
    goto LABEL_11;
  }
  char v9 = 1;
  [(_BKBaseSceneController *)self setWillAttemptBookReopen:1];
  [(_BKBaseSceneController *)self _handleOpenBookActivityWithAssetID:v5 isStateRestoration:1];
LABEL_11:
  id v17 = [v4 objectForKeyedSubscript:BCBookDisplayTitle];

  if (v17)
  {
    objc_opt_class();
    char v18 = [v4 objectForKeyedSubscript:BCBookDisplayTitle];
    __int16 v19 = BUDynamicCast();
    id v20 = [(_BKBaseSceneController *)self scene];
    [v20 setTitle:v19];
  }
  if ((v9 & 1) == 0) {
    [(_BKBaseSceneController *)self _handleStateRestorationCompleted];
  }

LABEL_16:
}

- (void)_handleOpenBookActivityWithAssetID:(id)a3 isStateRestoration:(BOOL)a4
{
  id v6 = a3;
  [(_BKBaseSceneController *)self launchCoordinator];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E5828;
  v9[3] = &unk_100A46738;
  id v10 = v6;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = self;
  BOOL v13 = a4;
  id v7 = v11;
  id v8 = v6;
  [v7 appLaunchCoordinatorOnConditionMask:1 blockID:@"handle openBookActivity" performBlock:v9];
}

- (id)_optionsForContinueOpenBookActivity:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = v4;
  if (v3) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:AEAudiobookOptionsShouldNotAutoplayKey];
  }

  return v5;
}

- (BOOL)_assetSupportsSnapshots:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = +[BKLibraryManager defaultManager];
    id v5 = [v4 libraryAssetOnMainQueueWithAssetID:v3];

    unsigned __int8 v6 = +[BKAssetUtilities supportsRestorationSnapshots:](BKAssetUtilities, "supportsRestorationSnapshots:", [v5 contentType]);
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_continueOpenBookActivity:(id)a3 assetLogID:(id)a4 isStateRestoration:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(_BKBaseSceneController *)self bk_window];
  id v11 = [v10 rootViewController];
  uint64_t v12 = [v11 im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL____BKEnqueuedBookPresenting];

  BOOL v13 = [(_BKBaseSceneController *)self _optionsForContinueOpenBookActivity:v5];
  id v14 = [v13 mutableCopy];

  if ([(_BKBaseSceneController *)self _assetSupportsSnapshots:v8])
  {
    uint64_t v15 = [[BKRestorationScrimView alloc] initWithAssetID:v8 window:v10];
    [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"BKBookPresentWithoutAnimations"];
  }
  else
  {
    uint64_t v15 = 0;
  }
  [v14 setObject:v9 forKeyedSubscript:AEAssetLogID];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000E5CAC;
  v17[3] = &unk_100A46760;
  __int16 v19 = v20;
  v17[4] = self;
  uint64_t v16 = v15;
  char v18 = v16;
  [v12 enqueueShowAssetWithTransactionProvider:self assetID:v8 location:0 options:v14 completion:v17];
  [(BKRestorationScrimView *)v16 show];

  _Block_object_dispose(v20, 8);
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  unsigned __int8 v6 = BCSceneLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "scene: Failure to get activity", v7, 2u);
  }

  [(_BKBaseSceneController *)self _handleStateRestorationCompleted];
}

- (id)dataForStateRestoration
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"BKSceneInfoIsAudiobookKey"];
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"BKSceneInfoIsSupplementalContentKey"];
  id v4 = [(_BKBaseSceneController *)self launchCoordinator];
  unsigned int v5 = [v4 appLaunchCoordinatorIsConditionSatisfied:0];

  if (v5)
  {
    unsigned __int8 v6 = [(_BKBaseSceneController *)self bk_window];
    id v7 = [v6 rootViewController];
    id v8 = [v7 im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKBookPresenting];

    id v9 = BUProtocolCast();
    id v10 = [v8 bookPresenterCurrentlyOpenBookForSingleScene:v9];
    id v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 assetPresenterAssetID];
      if (v12)
      {
        [v3 setObject:v12 forKeyedSubscript:BCContinuationActivityAssetIDKey];
        BOOL v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 assetPresenterIsAudiobook]);
        [v3 setObject:v13 forKeyedSubscript:@"BKSceneInfoIsAudiobookKey"];

        id v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isSupplementalContent]);
        [v3 setObject:v14 forKeyedSubscript:@"BKSceneInfoIsSupplementalContentKey"];

        uint64_t v15 = [v11 assetPresenterAssetViewController];
        uint64_t v16 = [v15 asset];
        id v17 = [v16 displayTitle];
        [v3 setObject:v17 forKeyedSubscript:BCBookDisplayTitle];
      }
    }
  }

  return v3;
}

- (id)stateRestorationActivityForScene:(id)a3
{
  if ([(_BKBaseSceneController *)self isStateRestorationDisabled])
  {
    id v4 = BCSceneLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134217984;
      unint64_t v21 = [(_BKBaseSceneController *)self sceneType];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not Saving Scene activity for scene type=%lu", (uint8_t *)&v20, 0xCu);
    }

    id v5 = 0;
  }
  else if ((id)[(_BKBaseSceneController *)self sceneType] == (id)2)
  {
    id v5 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.iBooks.sceneStateRestorationForAccountInfo"];
  }
  else
  {
    unint64_t v6 = [(_BKBaseSceneController *)self sceneType];
    id v7 = objc_alloc((Class)NSUserActivity);
    if (v6 == 3)
    {
      id v5 = [v7 initWithActivityType:@"com.apple.iBooks.sceneStateRestorationForEndOfBook"];
      id v8 = [(_BKBaseSceneController *)self dataForStateRestoration];
      [v5 setUserInfo:v8];
    }
    else
    {
      id v5 = [v7 initWithActivityType:@"com.apple.iBooks.sceneStateRestoration"];
      id v8 = [(_BKBaseSceneController *)self dataForStateRestoration];
      [v5 setUserInfo:v8];
      id v9 = [v5 userInfo];
      id v10 = [v9 objectForKeyedSubscript:BCContinuationActivityAssetIDKey];

      objc_opt_class();
      id v11 = [v5 userInfo];
      uint64_t v12 = [v11 objectForKeyedSubscript:@"BKSceneInfoIsSupplementalContentKey"];
      BOOL v13 = BUDynamicCast();
      unsigned __int8 v14 = [v13 BOOLValue];

      if (v10 && (v14 & 1) == 0)
      {
        uint64_t v15 = [(_BKBaseSceneController *)self _lastOpenBookManager];
        [v15 updateSuccessfullyOpenedBookForAssetID:v10 successfullyOpenedBook:1];
      }
      uint64_t v16 = BCSceneLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [v5 activityType];
        char v18 = [v5 userInfo];
        int v20 = 138543618;
        unint64_t v21 = (unint64_t)v17;
        __int16 v22 = 2112;
        v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Scene save user activity: activityType=%{public}@, userInfo=%@", (uint8_t *)&v20, 0x16u);
      }
    }
  }

  return v5;
}

- (void)presentAlertController:(id)a3 promptContext:(id)a4
{
  id v5 = a3;
  unint64_t v6 = BCSceneLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_BKBaseSceneController: presentAlertController: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [(_BKBaseSceneController *)self presentViewController:v5 animated:+[UIView areAnimationsEnabled] completion:0];
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v9 = +[BKAppDelegate delegate];
  id v8 = BUProtocolCast();
  [v9 performActionForShortcutItem:v7 sceneController:v8 completionHandler:v6];
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = +[BKSceneUtilities URLContextOpenURLOptions:v10];
        uint64_t v12 = [v10 URL];
        [(_BKBaseSceneController *)self openURL:v12 options:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)openURL:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BUProtocolCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = +[BKAppDelegate delegate];
  [v7 applicationOpenURL:v6 options:v5 sceneController:v8];
}

- (void)presentWelcomeViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BCSceneLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_BKBaseSceneController: presentWelcomeViewController: %{public}@", buf, 0xCu);
  }

  [(_BKBaseSceneController *)self setWelcomeViewController:v6];
  id v9 = [(_BKBaseSceneController *)self _viewControllerForWelcomePresenting];
  id v10 = [(_BKBaseSceneController *)self welcomeViewController];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E6774;
  v12[3] = &unk_100A442B8;
  id v13 = v7;
  id v11 = v7;
  [v9 presentViewController:v10 animated:0 completion:v12];
}

- (BOOL)welcomePresenterIsPresentingWelcome
{
  id v3 = [(_BKBaseSceneController *)self _viewControllerForWelcomePresenting];
  id v4 = [(_BKBaseSceneController *)self welcomeViewController];
  if (v4)
  {
    id v5 = [v3 presentedViewController];
    BOOL v6 = v4 == v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_assetPresenters
{
  v2 = BUProtocolCast();
  id v3 = [v2 bookFlowAssetPresenting];

  id v4 = [v3 presenterViewControllersConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting];

  return v4;
}

- (BKCriticalAlertCoordinating)criticalAlertCoordinator
{
  return self->_criticalAlertCoordinator;
}

- (void)setExternalURLOpenPrompter:(id)a3
{
}

- (void)setExternalURLLoadPrompter:(id)a3
{
}

- (void)setIsStateRestorationDisabled:(BOOL)a3
{
  self->_isStateRestorationDisabled = a3;
}

- (BOOL)handledStateRestoration
{
  return self->_handledStateRestoration;
}

- (void)setHandledStateRestoration:(BOOL)a3
{
  self->_handledStateRestoration = a3;
}

- (void)setWillAttemptBookReopen:(BOOL)a3
{
  self->_willAttemptBookReopen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarBackgroundController, 0);
  objc_storeStrong((id *)&self->_welcomeViewController, 0);
  objc_storeStrong((id *)&self->_externalURLLoadPrompter, 0);
  objc_storeStrong((id *)&self->_externalURLOpenPrompter, 0);
  objc_storeStrong((id *)&self->_criticalAlertCoordinator, 0);
  objc_storeStrong((id *)&self->_launchCoordinator, 0);
  objc_storeStrong((id *)&self->_bk_window, 0);

  objc_storeStrong((id *)&self->_scene, 0);
}

@end