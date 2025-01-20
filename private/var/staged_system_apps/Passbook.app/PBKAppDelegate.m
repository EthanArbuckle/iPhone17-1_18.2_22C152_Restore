@interface PBKAppDelegate
- (BOOL)_handleWalletUniversalLinkableURLWithHost:(id)a3 pathComponents:(id)a4 urlComponents:(id)a5;
- (BOOL)_isValidRelayServerURL:(id)a3 outPathComponents:(id *)a4;
- (BOOL)_shouldBeginSubjectReportingWallet;
- (BOOL)_shouldEndSubjectReportingWallet;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 shouldRestoreSecureApplicationState:(id)a4;
- (BOOL)application:(id)a3 shouldSaveSecureApplicationState:(id)a4;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)canPresentLaunchPrompts;
- (PBKAppDelegate)init;
- (PKPassGroupsViewController)cardsViewController;
- (UIWindow)window;
- (id)_bankConnectAuthorizationRedirectURLFromPathComponents:(id)a3 queryItems:(id)a4;
- (id)_parseReferrerIdentifier:(id)a3;
- (id)applicationDocumentsDirectory;
- (void)_createForegroundActiveResources;
- (void)_destroyForegroundActiveResources;
- (void)_executeForegroundActiveBlocksIfPossible;
- (void)_executeWhenApplicationForegroundActive:(id)a3;
- (void)_handleSpotlightWithUserActivity:(id)a3;
- (void)_handleUniversalLinkWithUserActivity:(id)a3;
- (void)_presentBankConnectAuthorizationViewControllerWithRedirectURL:(id)a3;
- (void)_presentLaunchPromptsIfNeeded;
- (void)_setForegroundActive:(BOOL)a3;
- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)application:(id)a3 performFetchWithCompletionHandler:(id)a4;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)consumeDoublePressUpForButtonKind:(int64_t)a3;
- (void)dealloc;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)handleDeletePassRequestWithPass:(id)a3;
- (void)openSettingsForNotification:(id)a3;
- (void)presentAccountServiceSchedulePaymentWithUniqueID:(id)a3 billPayAmountType:(int64_t)a4 billPayAmount:(id)a5 completion:(id)a6;
- (void)presentAddMoneyForPassWithUniqueID:(id)a3 completion:(id)a4;
- (void)presentDeletePassWithUniqueID:(id)a3 completion:(id)a4;
- (void)presentLaunchPromptViewController:(id)a3;
- (void)presentSearchForPassWithUniqueID:(id)a3 withQuery:(id)a4 completion:(id)a5;
- (void)sharePassWithUniqueID:(id)a3 completion:(id)a4;
- (void)willPresentNotification:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation PBKAppDelegate

- (void)_setForegroundActive:(BOOL)a3
{
  BOOL v3 = a3;
  self->_foregroundActive = a3;
  if (self->_foregroundActiveResourcesCreated != a3)
  {
    if (a3) {
      [(PBKAppDelegate *)self _createForegroundActiveResources];
    }
    else {
      [(PBKAppDelegate *)self _destroyForegroundActiveResources];
    }
  }
  [(PBKAppDelegate *)self _executeForegroundActiveBlocksIfPossible];
  if (self->_brightnessRampingAllowed != v3)
  {
    v5 = +[PKBacklightController sharedInstance];
    v6 = v5;
    if (v3) {
      [v5 beginAllowingBacklightRamping:self];
    }
    else {
      [v5 endAllowingBacklightRamping:self];
    }

    self->_brightnessRampingAllowed = v3;
  }
}

- (void)_executeForegroundActiveBlocksIfPossible
{
  if (self->_foregroundActive
    && self->_didBecomeActiveOnce
    && [(NSMutableArray *)self->_blocksQueuedForForegroundExecution count])
  {
    id v3 = [(NSMutableArray *)self->_blocksQueuedForForegroundExecution copy];
    [(NSMutableArray *)self->_blocksQueuedForForegroundExecution removeAllObjects];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v8));
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_presentLaunchPromptsIfNeeded
{
  launchAuthorizationPromptController = self->_launchAuthorizationPromptController;
  id v4 = [(PKPassGroupsViewController *)self->_cardsViewController groupsController];
  id v3 = [v4 passes];
  [(PKLaunchAuthorizationPromptController *)launchAuthorizationPromptController presentLaunchPromptsForPassesIfNeeded:v3];
}

- (BOOL)canPresentLaunchPrompts
{
  id v3 = [(PKPassGroupsViewController *)self->_cardsViewController pkui_frontMostViewController];
  BOOL v4 = v3 == self->_cardsViewController && self->_foregroundActive;

  return v4;
}

- (void)applicationDidBecomeActive:(id)a3
{
  [(PKLaunchAuthorizationPromptController *)self->_launchAuthorizationPromptController enableLaunchPromptsForSession];
  if ([(PKPassGroupsViewController *)self->_cardsViewController passesAreOutdated])
  {
    dispatch_time_t v4 = dispatch_time(0, 350000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003648;
    block[3] = &unk_100018B78;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (!self->_needsOnScreenPresentation {
         || (self->_needsOnScreenPresentation = 0,
  }
             char v8 = 0,
             [(PKPassGroupsViewController *)self->_cardsViewController presentInitialState:&v8],
             !v8))
  {
    [(PBKAppDelegate *)self _presentLaunchPromptsIfNeeded];
  }
  if (!self->_didBecomeActiveOnce)
  {
    self->_didBecomeActiveOnce = 1;
    [(PBKAppDelegate *)self _executeForegroundActiveBlocksIfPossible];
  }
  id v5 = +[PKUIForegroundActiveArbiter sharedInstance];
  [v5 didBecomeActive];

  if (PKSecureElementIsAvailable())
  {
    if (self->_needsRegionSupportUpdate)
    {
      self->_needsRegionSupportUpdate = 0;
      id v6 = dispatch_get_global_queue(0, 0);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100002ED0;
      v7[3] = &unk_100018B78;
      v7[4] = self;
      dispatch_async(v6, v7);
    }
  }
}

- (PBKAppDelegate)init
{
  v16.receiver = self;
  v16.super_class = (Class)PBKAppDelegate;
  v2 = [(PBKAppDelegate *)&v16 init];
  if (v2)
  {
    id v3 = +[PKUIForegroundActiveArbiter sharedInstance];
    +[PKXPCService setForegroundActiveArbiter:v3];
    dispatch_time_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.pbk.background", v5);
    foregroundActiveResourcesBackgroundQueue = v2->_foregroundActiveResourcesBackgroundQueue;
    v2->_foregroundActiveResourcesBackgroundQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.passkit.di.background", v5);
    discoveryItemsBackgroundQueue = v2->_discoveryItemsBackgroundQueue;
    v2->_discoveryItemsBackgroundQueue = (OS_dispatch_queue *)v8;

    long long v10 = +[PKUserNotificationAuthorizationController sharedInstance];
    [v10 addDelegate:v2];

    long long v11 = (PKPassLibraryDataProvider *)objc_alloc_init((Class)PKPassLibraryDefaultDataProvider);
    dataProvider = v2->_dataProvider;
    v2->_dataProvider = v11;

    v13 = (PKLaunchAuthorizationPromptController *)[objc_alloc((Class)PKLaunchAuthorizationPromptController) initWithContext:0 dataProvider:v2->_dataProvider delegate:v2];
    launchAuthorizationPromptController = v2->_launchAuthorizationPromptController;
    v2->_launchAuthorizationPromptController = v13;

    -[PBKAppDelegate _setForegroundActive:](v2, "_setForegroundActive:", ([v3 registerObserver:v2] >> 8) & 1);
  }
  return v2;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_queue_t v8 = +[PSListController appearance];
  long long v9 = +[UIColor labelColor];
  [v8 setTextColor:v9];

  long long v10 = +[PKUIForegroundActiveArbiter sharedInstance];
  id v11 = [v7 applicationState];

  if (v11 != (id)2) {
    [v10 willEnterForegroundPrelude];
  }
  id v12 = objc_alloc((Class)UIWindow);
  v13 = +[UIScreen mainScreen];
  [v13 bounds];
  v14 = [v12 initWithFrame:];
  window = self->_window;
  self->_window = v14;

  objc_super v16 = (PKPassGroupsViewController *)objc_alloc_init((Class)PKPassGroupsViewController);
  cardsViewController = self->_cardsViewController;
  self->_cardsViewController = v16;

  [(PKPassGroupsViewController *)self->_cardsViewController setWelcomeStateEnabled:1];
  [(PKPassGroupsViewController *)self->_cardsViewController setExternalModalPresentationAllowed:1];
  [(UIWindow *)self->_window setRootViewController:self->_cardsViewController];
  [(PKPassGroupsViewController *)self->_cardsViewController presentOffscreenAnimated:0 withCompletionHandler:0];
  self->_needsOnScreenPresentation = 1;
  self->_needsRegionSupportUpdate = 1;
  v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  blocksQueuedForForegroundExecution = self->_blocksQueuedForForegroundExecution;
  self->_blocksQueuedForForegroundExecution = v18;

  [(UIWindow *)self->_window makeKeyAndVisible];
  if (_os_feature_enabled_impl()) {
    +[PKAppIntentDependencyManager setCoordinator:self];
  }
  if (v11 != (id)2) {
    [v10 willEnterForegroundPostlude];
  }
  v20 = [v6 objectForKey:UIApplicationLaunchOptionsURLKey];

  if (!v20)
  {
    v21 = [(PKPassGroupsViewController *)self->_cardsViewController itemIdentifierForFrontmostDiscoveryCard];
    v22 = v21;
    if (v21)
    {
      discoveryItemsBackgroundQueue = self->_discoveryItemsBackgroundQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100002F70;
      block[3] = &unk_100018B78;
      id v26 = v21;
      dispatch_async((dispatch_queue_t)discoveryItemsBackgroundQueue, block);
    }
  }

  return 1;
}

- (void)_createForegroundActiveResources
{
  if (!self->_foregroundActiveResourcesCreated)
  {
    self->_foregroundActiveResourcesCreated = 1;
    dispatch_async((dispatch_queue_t)self->_discoveryItemsBackgroundQueue, &stru_100018FA8);
    id v3 = PKPassKitCoreBundle();
    dispatch_time_t v4 = (CLInUseAssertion *)+[CLInUseAssertion newAssertionForBundle:v3 withReason:@"Passbook is Active"];
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v4;

    if ((+[PKSecureElement isInFailForward] & 1) == 0)
    {
      if (PKUserIntentIsAvailable())
      {
        id v6 = +[SBSHardwareButtonService sharedInstance];
        id v7 = [v6 beginConsumingPressesForButtonKind:2 eventConsumer:self priority:0];
        lockButtonObserver = self->_lockButtonObserver;
        self->_lockButtonObserver = v7;

        long long v9 = [(id)PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
        id v20 = 0;
        long long v10 = [v9 requestAssertion:5 error:&v20];
        id v11 = v20;

        id v12 = PKLogFacilityTypeGetObject();
        informativeForegroundAssertion = (NFAssertion *)v12;
        if (v10)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            sub_10000FA88((uint64_t)self, (uint64_t)v10, (os_log_t)informativeForegroundAssertion);
          }

          v14 = v10;
          informativeForegroundAssertion = self->_informativeForegroundAssertion;
          self->_informativeForegroundAssertion = v14;
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v11;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)informativeForegroundAssertion, OS_LOG_TYPE_DEFAULT, "PBKAppDelegate (%p): failed to acquire foreground nearfield informative assertion - %@.", buf, 0x16u);
        }

        if (!self->_fetchingAsynchronousForegroundActiveResources)
        {
          self->_fetchingAsynchronousForegroundActiveResources = 1;
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          UIBackgroundTaskIdentifier v22 = UIBackgroundTaskInvalid;
          v15 = +[UIApplication sharedApplication];
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_10000CC38;
          v19[3] = &unk_100019010;
          v19[4] = buf;
          id v16 = [v15 beginBackgroundTaskWithName:@"Asynchronous Foreground Active Resources" expirationHandler:v19];
          *(void *)(*(void *)&buf[8] + 24) = v16;

          foregroundActiveResourcesBackgroundQueue = self->_foregroundActiveResourcesBackgroundQueue;
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_1000024E0;
          v18[3] = &unk_100019088;
          v18[4] = self;
          v18[5] = buf;
          dispatch_async((dispatch_queue_t)foregroundActiveResourcesBackgroundQueue, v18);
          _Block_object_dispose(buf, 8);
        }
      }
    }
  }
}

- (UIWindow)window
{
  return self->_window;
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
}

- (void)dealloc
{
  id v3 = +[PKUIForegroundActiveArbiter sharedInstance];
  [v3 unregisterObserver:self];

  dispatch_time_t v4 = +[PKUserNotificationAuthorizationController sharedInstance];
  [v4 removeDelegate:self];

  v5.receiver = self;
  v5.super_class = (Class)PBKAppDelegate;
  [(PBKAppDelegate *)&v5 dealloc];
}

- (void)applicationWillResignActive:(id)a3
{
  id v3 = +[PKUIForegroundActiveArbiter sharedInstance];
  [v3 willResignActive];
}

- (void)applicationWillEnterForeground:(id)a3
{
  if ([(PBKAppDelegate *)self _shouldBeginSubjectReportingWallet]) {
    +[PKAnalyticsReporter beginSubjectReporting:PKAnalyticsSubjectWallet];
  }
  if (self->_suspendedReportingWalletProvisioning)
  {
    +[PKAnalyticsReporter beginSubjectReporting:PKAnalyticsSubjectWalletProvisioning];
    self->_suspendedReportingWalletProvisioning = 0;
  }
  id v5 = +[PKUIForegroundActiveArbiter sharedInstance];
  [v5 willEnterForegroundPrelude];
  [(NSDate *)self->_lastTimeAppWasDismissed timeIntervalSinceNow];
  if (v4 < -480.0) {
    [(PKPassGroupsViewController *)self->_cardsViewController dismissPresentedVCsWithRequirements:8 animated:0 performAction:0];
  }
  [v5 willEnterForegroundPostlude];
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = a3;
  if ([(PBKAppDelegate *)self _shouldEndSubjectReportingWallet]) {
    +[PKAnalyticsReporter endSubjectReporting:PKAnalyticsSubjectWallet];
  }
  uint64_t v5 = PKAnalyticsSubjectWalletProvisioning;
  id v6 = +[PKAnalyticsReporter reporterForSubject:PKAnalyticsSubjectWalletProvisioning];

  p_align = &stru_10001CFE8.align;
  if (v6)
  {
    +[PKAnalyticsReporter endSubjectReporting:v5];
    self->_suspendedReportingWalletProvisioning = 1;
  }
  uint64_t v8 = PKAnalyticsSubjectAppleCash;
  long long v9 = +[PKAnalyticsReporter reporterForSubject:PKAnalyticsSubjectAppleCash];

  if (v9) {
    +[PKAnalyticsReporter endSubjectReporting:v8];
  }
  long long v10 = +[PKUIForegroundActiveArbiter sharedInstance];
  [v10 didEnterBackground];

  [v4 pkui_resetSharedRootAuthenticationContext];
  id v12 = [(PKPassGroupsViewController *)self->_cardsViewController presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v13 = 0;
    goto LABEL_34;
  }
  v14 = [v12 pkui_frontMostViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = [v14 presentingViewController];

    v14 = (void *)v15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = [v14 viewControllers];
    unsigned __int8 v17 = [v14 pkui_disablesAutomaticDismissalUponEnteringBackground];
    if ((v17 & 1) == 0 && v16)
    {
      v18 = [v16 firstObject];
      if (objc_msgSend(v18, "pkui_disablesAutomaticDismissalUponEnteringBackground"))
      {
        unsigned int v13 = 0;
LABEL_32:

        goto LABEL_33;
      }
      v19 = [v16 lastObject];
      unsigned __int8 v30 = [v19 pkui_disablesAutomaticDismissalUponEnteringBackground];

      if (v30)
      {
LABEL_27:
        unsigned int v13 = 0;
        goto LABEL_28;
      }
LABEL_20:
      id v20 = v16;
      v21 = [v14 childViewControllers];
      v18 = [v21 lastObject];

      if (v18)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = [v18 viewControllers];

          UIBackgroundTaskIdentifier v22 = [v16 firstObject];
          if (objc_msgSend(v22, "pkui_disablesAutomaticDismissalUponEnteringBackground"))
          {

            unsigned int v13 = 0;
LABEL_31:
            p_align = &stru_10001CFE8.align;
            goto LABEL_32;
          }
          v24 = [v16 lastObject];
          unsigned __int8 v31 = [v24 pkui_disablesAutomaticDismissalUponEnteringBackground];

          if (v31) {
            goto LABEL_27;
          }
          id v20 = v16;
        }
        else
        {
          unsigned __int8 v23 = [v18 pkui_disablesAutomaticDismissalUponEnteringBackground];

          if (v23)
          {
            unsigned int v13 = 0;
            id v16 = v20;
LABEL_28:
            p_align = (_DWORD *)(&stru_10001CFE8 + 24);
            goto LABEL_33;
          }
        }
      }
      v18 = +[PKDismissalPreventionAssertionManager sharedInstance];
      unsigned int v13 = [v18 shouldPreventAutomaticDismissal] ^ 1;
      id v16 = v20;
      goto LABEL_31;
    }
  }
  else
  {
    unsigned __int8 v17 = [v14 pkui_disablesAutomaticDismissalUponEnteringBackground];
    id v16 = 0;
  }
  if ((v17 & 1) == 0) {
    goto LABEL_20;
  }
  unsigned int v13 = 0;
LABEL_33:

LABEL_34:
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000358C;
  v34[3] = &unk_100018B78;
  v34[4] = self;
  v25 = objc_retainBlock(v34);
  id v26 = (void (**)(void))v25;
  if (v13)
  {
    *((unsigned char *)&self->super.super.isa + (int)p_align[847]) = 0;
    cardsViewController = self->_cardsViewController;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100003638;
    v32[3] = &unk_100018BA0;
    v33 = v25;
    [(PKPassGroupsViewController *)cardsViewController dismissPresentedVCsWithRequirements:24 animated:0 performAction:v32];
  }
  else
  {
    v28 = +[NSDate date];
    lastTimeAppWasDismissed = self->_lastTimeAppWasDismissed;
    self->_lastTimeAppWasDismissed = v28;

    v26[2](v26);
  }
  self->_needsRegionSupportUpdate = 1;
}

- (void)applicationWillTerminate:(id)a3
{
  id v4 = +[PKUIForegroundActiveArbiter sharedInstance];
  [v4 willTerminate];

  [(PBKAppDelegate *)self _destroyForegroundActiveResources];
}

- (void)application:(id)a3 performFetchWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_cardsViewController && [v6 applicationState] == (id)2)
  {
    cardsViewController = self->_cardsViewController;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100003868;
    v9[3] = &unk_100018BF0;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    [(PKPassGroupsViewController *)cardsViewController reloadPassesWithCompletion:v9];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, uint64_t))a5;
  [(PKLaunchAuthorizationPromptController *)self->_launchAuthorizationPromptController disableLaunchPromptsForSession];
  long long v9 = [v7 type];
  unsigned int v10 = [v9 isEqualToString:PKQuickActionAddCardAction];

  if (!v10)
  {
    id v12 = [v7 type];
    if ([v12 isEqualToString:PKQuickActionOpenPassAction])
    {
    }
    else
    {
      unsigned int v13 = [v7 type];
      unsigned int v14 = [v13 isEqualToString:PKQuickActionLastTransactionAction];

      if (!v14)
      {
        unsigned __int8 v17 = [v7 type];
        unsigned int v18 = [v17 isEqualToString:PKQuickActionNearbyPeerPayment];

        if (!v18) {
          goto LABEL_9;
        }
        [(PKPassGroupsViewController *)self->_cardsViewController presentPeerPaymentDeviceTapWithInitialAmount:0 initialMemo:0];
        uint64_t v19 = PKAnalyticsSubjectAppleCash;
        +[PKAnalyticsReporter beginSubjectReporting:PKAnalyticsSubjectAppleCash];
        v20[0] = PKAnalyticsReportFeatureTypeKey;
        v20[1] = PKAnalyticsReportEventKey;
        v21[0] = PKAnalyticsReportPeerPaymentFeatureType;
        v21[1] = PKAnalyticsReportEventTypeButtonTap;
        v20[2] = PKAnalyticsReportButtonTagKey;
        v20[3] = PKAnalyticsReportPageTagKey;
        v21[2] = PKAnalyticsReportPeerPaymentDeviceTapButtonTag;
        v21[3] = PKAnalyticsReportPeerPaymentQuickActionPageTag;
        v20[4] = PKAnalyticsReportPeerPaymentP2PSideKey;
        v21[4] = PKAnalyticsReportPeerPaymentP2PSideSender;
        id v16 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];
        +[PKAnalyticsReporter subject:v19 sendEvent:v16];
LABEL_8:

        goto LABEL_9;
      }
    }
    uint64_t v15 = [v7 userInfo];
    id v16 = [v15 objectForKey:PKQuickActionPassUniqueIDKKey];

    [(PKPassGroupsViewController *)self->_cardsViewController presentPassWithUniqueID:v16 animated:1 completionHandler:0];
    goto LABEL_8;
  }
  cardsViewController = self->_cardsViewController;
  if (cardsViewController) {
    [(PKPassGroupsViewController *)cardsViewController presentPaymentSetupInMode:0 referrerIdentifier:0 paymentNetwork:0 transitNetworkIdentifier:0 allowedFeatureIdentifiers:0 productIdentifiers:0];
  }
LABEL_9:
  if (v8) {
    v8[2](v8, 1);
  }
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  long long v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Processing URL %{public}@", buf, 0xCu);
  }

  [(PKLaunchAuthorizationPromptController *)self->_launchAuthorizationPromptController disableLaunchPromptsForSession];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100003CFC;
  v13[3] = &unk_100018CB8;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  [(PBKAppDelegate *)self _executeWhenApplicationForegroundActive:v13];

  return 1;
}

- (id)_bankConnectAuthorizationRedirectURLFromPathComponents:(id)a3 queryItems:(id)a4
{
  id v5 = a4;
  id v6 = [a3 lastObject];
  unsigned int v7 = [v6 isEqualToString:PKURLSubactionRouteAuthorization];

  if (v7)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      id v12 = (id)PKURLRedirectURLQueryItemKey;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v15 = [v14 name:v23];
          id v16 = [v14 value];
          if ([v16 length])
          {
            id v17 = v15;
            if (v17 == v12)
            {

              unsigned int v18 = v12;
LABEL_21:
              v21 = +[NSURL URLWithString:v16];

              goto LABEL_22;
            }
            unsigned int v18 = v17;
            if (v17) {
              BOOL v19 = v12 == 0;
            }
            else {
              BOOL v19 = 1;
            }
            if (v19)
            {
            }
            else
            {
              unsigned __int8 v20 = [v17 isEqualToString:v12];

              if (v20) {
                goto LABEL_21;
              }
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    v21 = 0;
LABEL_22:
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)_presentBankConnectAuthorizationViewControllerWithRedirectURL:(id)a3
{
  id v4 = a3;
  cardsViewController = self->_cardsViewController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007324;
  v7[3] = &unk_100018CE0;
  id v8 = v4;
  id v6 = v4;
  [(PKPassGroupsViewController *)cardsViewController presentAuthorizationFlowAnimated:1 completion:v7];
}

- (id)_parseReferrerIdentifier:(id)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    id v7 = (id)PKURLParamReferrerIdentifier;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [v9 name];
        uint64_t v11 = [v9 value];
        if ([v11 length])
        {
          id v12 = v10;
          if (v12 == v7)
          {

            unsigned int v13 = v7;
LABEL_19:

            goto LABEL_20;
          }
          unsigned int v13 = v12;
          if (v12) {
            BOOL v14 = v7 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (v14)
          {
          }
          else
          {
            unsigned int v15 = [v12 isEqualToString:v7];

            if (v15) {
              goto LABEL_19;
            }
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)_handleWalletUniversalLinkableURLWithHost:(id)a3 pathComponents:(id)a4 urlComponents:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v548 = self;
  [(PKLaunchAuthorizationPromptController *)self->_launchAuthorizationPromptController disableLaunchPromptsForSession];
  uint64_t v11 = [v10 queryItems];
  id v12 = (char *)[v9 count];
  unsigned int v13 = (void *)PKURLActionSetup;
  id v14 = v8;
  id v15 = v13;
  id v550 = v14;
  if (v15 == v14)
  {

    goto LABEL_7;
  }
  id v16 = v15;
  if (!v14 || !v15)
  {

    goto LABEL_14;
  }
  unsigned int v17 = [v14 isEqualToString:v15];

  if (v17)
  {
LABEL_7:
    if ((unint64_t)v12 < 2)
    {
      uint64_t v24 = 0;
      id v20 = 0;
      goto LABEL_72;
    }
    long long v18 = [v9 objectAtIndex:1];
    long long v19 = (void *)PKURLActionFeature;
    id v20 = v18;
    id v21 = v19;
    if (v20 == v21)
    {
    }
    else
    {
      UIBackgroundTaskIdentifier v22 = v21;
      if (!v20 || !v21)
      {

        uint64_t v24 = 0;
        id v41 = v20;
        goto LABEL_71;
      }
      unsigned int v23 = [v20 isEqualToString:v21];

      if (!v23)
      {
        uint64_t v24 = 0;
LABEL_72:
        if (PKEqualObjects())
        {
          v79 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v608 = v10;
            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Received subcredential pairing url: %@", buf, 0xCu);
          }

          long long v602 = 0u;
          long long v603 = 0u;
          long long v600 = 0u;
          long long v601 = 0u;
          id v80 = v11;
          id v566 = [v80 countByEnumeratingWithState:&v600 objects:v606 count:16];
          id v533 = v9;
          v536 = v10;
          if (!v566)
          {
            id v143 = v10;

            v136 = 0;
            v81 = 0;
            v140 = 0;
            goto LABEL_176;
          }
          v531 = v79;
          id v532 = v20;
          uint64_t v555 = 0;
          v540 = 0;
          v81 = 0;
          v549 = 0;
          v82 = 0;
          uint64_t v564 = *(void *)v601;
          id v83 = (id)PKURLParamAppletSubcredentialPartnerAppIdentifier;
          id v560 = (id)PKURLParamAppletSubcredentialIssuerIdentifier;
          id v558 = (id)PKURLParamAppletSubcredentialSupportedRadioTechnologies;
          id v556 = (id)PKURLParamAppletSubcredentialSRT;
          id v553 = (id)PKURLParamAppletSubcredentialPTI;
          id v552 = (id)PKURLParamAppletSubcredentialBrandIdentifier;
          uint64_t v539 = 4;
          v541 = v11;
          id v544 = (id)PKURLParamAppletSubcredentialReferralSource;
          id v535 = (id)PKURLParamAnalyticsArchivedParentToken;
          v84 = v80;
          id v562 = v80;
          while (1)
          {
            v85 = 0;
            do
            {
              if (*(void *)v601 != v564) {
                objc_enumerationMutation(v84);
              }
              v86 = *(void **)(*((void *)&v600 + 1) + 8 * (void)v85);
              v87 = [v86 name];
              v88 = [v86 value];
              if ([v88 length])
              {
                id v89 = v87;
                if (v89 == v83)
                {

LABEL_90:
                  id v93 = v88;

                  v82 = v93;
                  goto LABEL_113;
                }
                v90 = v89;
                if (v89) {
                  BOOL v91 = v83 == 0;
                }
                else {
                  BOOL v91 = 1;
                }
                if (v91)
                {
                }
                else
                {
                  unsigned int v92 = [v89 isEqualToString:v83];

                  if (v92) {
                    goto LABEL_90;
                  }
                }
                id v94 = v90;
                if (v94 == v560)
                {
                }
                else
                {
                  v95 = v94;
                  if (!v90 || !v560)
                  {

                    goto LABEL_99;
                  }
                  unsigned int v96 = [v94 isEqualToString:];

                  if (!v96)
                  {
LABEL_99:
                    id v98 = v95;
                    v99 = v558;
                    if (v98 == v558) {
                      goto LABEL_110;
                    }
                    v100 = v98;
                    if (v90 && v558)
                    {
                      unsigned __int8 v101 = [v98 isEqualToString:v558];

                      if (v101)
                      {
LABEL_111:
                        v105 = [v88 componentsSeparatedByString:@","];
                        uint64_t v555 = PKRadioTechnologyFromStrings();

                        goto LABEL_112;
                      }
                    }
                    else
                    {
                    }
                    id v102 = v100;
                    v99 = v556;
                    if (v102 == v556)
                    {
LABEL_110:

                      goto LABEL_111;
                    }
                    v103 = v102;
                    if (v90 && v556)
                    {
                      unsigned __int8 v104 = [v102 isEqualToString:v556];

                      if (v104) {
                        goto LABEL_111;
                      }
                    }
                    else
                    {
                    }
                    id v106 = v103;
                    if (v106 == v553)
                    {
                    }
                    else
                    {
                      v107 = v106;
                      if (!v90 || !v553)
                      {

                        goto LABEL_124;
                      }
                      unsigned int v108 = [v106 isEqualToString:];

                      if (!v108)
                      {
LABEL_124:
                        id v110 = v107;
                        if (v110 == v552)
                        {
                        }
                        else
                        {
                          v111 = v110;
                          if (!v90 || !v552)
                          {

                            goto LABEL_143;
                          }
                          unsigned int v112 = [v110 isEqualToString:];

                          if (!v112)
                          {
LABEL_143:
                            id v126 = v111;
                            if (v126 == v544)
                            {
                              v128 = v81;
                            }
                            else
                            {
                              v127 = v126;
                              v128 = v81;
                              if (!v90 || !v544)
                              {

                                goto LABEL_151;
                              }
                              unsigned int v129 = [v126 isEqualToString:];

                              if (!v129)
                              {
LABEL_151:
                                id v130 = v127;
                                if (v130 == v535)
                                {

                                  goto LABEL_157;
                                }
                                v131 = v130;
                                if (v90 && v535)
                                {
                                  unsigned int v132 = [v130 isEqualToString:];

                                  if (!v132) {
                                    goto LABEL_159;
                                  }
LABEL_157:
                                  id v133 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v88 options:0];

                                  v540 = v133;
                                }
                                else
                                {
                                }
LABEL_159:
                                v81 = v128;
                                goto LABEL_112;
                              }
                            }
                            uint64_t v539 = PKSubcredentialPairingReferralSourceFromString();
                            goto LABEL_159;
                          }
                        }
                        v551 = v81;
                        id v557 = v88;

                        id v113 = objc_alloc_init((Class)PKPaymentService);
                        v114 = [v113 sharedPaymentWebServiceContext];
                        v115 = [v114 configuration];
                        v116 = PKCurrentRegion();
                        v117 = [v115 featureWithType:2 inRegion:v116];

                        long long v598 = 0u;
                        long long v599 = 0u;
                        long long v596 = 0u;
                        long long v597 = 0u;
                        obuint64_t j = [v117 supportedTerminals];
                        id v118 = [obj countByEnumeratingWithState:&v596 objects:v605 count:16];
                        if (v118)
                        {
                          id v119 = v118;
                          v545 = v117;
                          v546 = v114;
                          id v547 = v113;
                          uint64_t v120 = *(void *)v597;
                          do
                          {
                            for (i = 0; i != v119; i = (char *)i + 1)
                            {
                              if (*(void *)v597 != v120) {
                                objc_enumerationMutation(obj);
                              }
                              v122 = *(void **)(*((void *)&v596 + 1) + 8 * i);
                              v123 = [v122 partnerIdentifier];
                              unsigned int v124 = [v123 isEqualToString:v557];

                              if (v124)
                              {
                                uint64_t v125 = [v122 manufacturerIdentifier];

                                v549 = (void *)v125;
                                goto LABEL_140;
                              }
                            }
                            id v119 = [obj countByEnumeratingWithState:&v596 objects:v605 count:16];
                          }
                          while (v119);
LABEL_140:
                          uint64_t v11 = v541;
                          v114 = v546;
                          id v113 = v547;
                          v117 = v545;
                        }

                        v82 = v557;
                        v81 = v551;
                        goto LABEL_112;
                      }
                    }
                    id v109 = v88;

                    v81 = v109;
                    goto LABEL_112;
                  }
                }
                id v97 = v88;

                v82 = v97;
LABEL_112:
                v84 = v562;
              }
LABEL_113:

              v85 = (char *)v85 + 1;
            }
            while (v85 != v566);
            id v134 = [v84 countByEnumeratingWithState:&v600 objects:v606 count:16];
            id v566 = v134;
            if (!v134)
            {

              if (v82)
              {
                v135 = v81;
                v136 = v549;
                id v14 = v550;
                id v20 = v532;
                if (!v555)
                {
                  if (os_log_type_enabled(v531, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v608 = v536;
                    _os_log_impl((void *)&_mh_execute_header, v531, OS_LOG_TYPE_DEFAULT, "Defaulting to NFC due to missing or invalid radioTechnologies for url: %@", buf, 0xCu);
                  }
                }
                uint64_t v137 = PKRadioTechnologyForConfigurationTechnology();
                if (os_log_type_enabled(v531, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v608 = v82;
                  _os_log_impl((void *)&_mh_execute_header, v531, OS_LOG_TYPE_DEFAULT, "Presenting pairing flow for issuer: %@", buf, 0xCu);
                }

                v79 = objc_alloc_init((Class)PKAddCarKeyPassConfiguration);
                [v79 setIssuerIdentifier:v82];
                v138 = [v536 fragment];
                [v79 setPassword:v138];

                [v79 setSupportedRadioTechnologies:v137];
                [v79 setProvisioningTemplateIdentifier:v135];
                if (v549) {
                  v139 = v549;
                }
                else {
                  v139 = v82;
                }
                [v79 setManufacturerIdentifier:v139];
                [v79 setReferralSource:v539];
                v140 = v540;
                [v79 setAnalyticsArchivedParentToken:v540];
                LODWORD(discoveryItemsBackgroundQueue) = [(PKPassGroupsViewController *)v548->_cardsViewController presentSubcredentialPairingFlowIfPossibleWithConfig:v79 animated:1];
                char v141 = 0;
                goto LABEL_179;
              }
              id v143 = v536;
              v136 = v549;
              id v14 = v550;
              v79 = v531;
              id v20 = v532;
              v140 = v540;
LABEL_176:
              v135 = v81;
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v608 = v143;
                _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Invalid pairing url: %@", buf, 0xCu);
              }
              v82 = 0;
              LODWORD(discoveryItemsBackgroundQueue) = 0;
              char v141 = 1;
LABEL_179:

              if (v141)
              {

                LOBYTE(discoveryItemsBackgroundQueue) = 0;
                id v9 = v533;
                id v10 = v536;
                goto LABEL_535;
              }
              id v9 = v533;
              id v10 = v536;
LABEL_182:

              LOBYTE(discoveryItemsBackgroundQueue) = discoveryItemsBackgroundQueue != 0;
              goto LABEL_535;
            }
          }
        }
        id v41 = v20;
        cardsViewController = v548->_cardsViewController;
        discoveryItemsBackgroundQueue = [(PBKAppDelegate *)v548 _parseReferrerIdentifier:v11];
        [(PKPassGroupsViewController *)cardsViewController presentPaymentSetupInMode:v24 referrerIdentifier:discoveryItemsBackgroundQueue paymentNetwork:0 transitNetworkIdentifier:0 allowedFeatureIdentifiers:0 productIdentifiers:0];
LABEL_173:

        LODWORD(discoveryItemsBackgroundQueue) = 1;
        id v20 = v41;
        goto LABEL_182;
      }
    }
    if ((unint64_t)v12 < 3)
    {
      uint64_t v24 = 4;
      goto LABEL_72;
    }
    id v41 = v20;
    id v20 = [v9 objectAtIndex:2];
    uint64_t v42 = PKFeatureIdentifierFromString();
    if (v42)
    {
      uint64_t v43 = v42;
      discoveryItemsBackgroundQueue = [objc_alloc((Class)NSSet) initWithObjects:v20, 0];

      id v45 = objc_alloc_init((Class)PKPassPresentationContext);
      [v45 setPresentationSource:5];
      v46 = v11;
      v47 = v548->_cardsViewController;
      v48 = [(PBKAppDelegate *)v548 _parseReferrerIdentifier:v46];
      v49 = v47;
      uint64_t v11 = v46;
      [(PKPassGroupsViewController *)v49 presentFeatureSetupOrFeaturePass:v43 referrerIdentifier:v48 presentationContext:v45 completion:0];

      goto LABEL_173;
    }
    uint64_t v24 = 4;
LABEL_71:

    id v20 = v41;
    goto LABEL_72;
  }
LABEL_14:
  long long v25 = (void *)PKURLRouteDiscovery;
  id v26 = v14;
  id v27 = v25;
  if (v27 == v26)
  {

    goto LABEL_21;
  }
  v28 = v27;
  if (!v14 || !v27)
  {

    goto LABEL_28;
  }
  unsigned int v29 = [v26 isEqualToString:v27];

  if (v29)
  {
LABEL_21:
    if ((unint64_t)v12 >= 3)
    {
      unsigned __int8 v30 = [v9 objectAtIndex:1];
      unsigned __int8 v31 = (void *)PKURLRouteDiscoveryCard;
      id v32 = v30;
      id v33 = v31;
      if (v32 == v33)
      {
      }
      else
      {
        v34 = v33;
        if (!v32 || !v33)
        {

          goto LABEL_55;
        }
        unsigned int v35 = [v32 isEqualToString:v33];

        if (!v35) {
          goto LABEL_55;
        }
      }
      v51 = [v9 objectAtIndex:2];
      if (v51)
      {
        discoveryItemsBackgroundQueue = [objc_alloc((Class)NSUUID) initWithUUIDString:v51];

        if (discoveryItemsBackgroundQueue)
        {
          discoveryItemsBackgroundQueue = v548->_discoveryItemsBackgroundQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10000B0A8;
          block[3] = &unk_100018B78;
          v60 = v51;
          v595 = v60;
          dispatch_async(discoveryItemsBackgroundQueue, block);
          v61 = v11;
          v62 = v548->_cardsViewController;
          v63 = [(PBKAppDelegate *)v548 _parseReferrerIdentifier:v61];
          LOBYTE(discoveryItemsBackgroundQueue) = 1;
          v64 = v62;
          uint64_t v11 = v61;
          [(PKPassGroupsViewController *)v64 presentDiscoveryArticleForItemWithIdentifier:v60 referrerIdentifier:v63 animated:1 completion:0];
        }
        goto LABEL_534;
      }
LABEL_280:
      LOBYTE(discoveryItemsBackgroundQueue) = 0;
      goto LABEL_534;
    }
LABEL_55:
    LOBYTE(discoveryItemsBackgroundQueue) = 0;
    goto LABEL_535;
  }
LABEL_28:
  v36 = (void *)PKURLActionRoutePeerPaymentPass;
  id v37 = v26;
  id v38 = v36;
  if (v38 == v37)
  {

    goto LABEL_39;
  }
  v39 = v38;
  if (!v14 || !v38)
  {

    goto LABEL_45;
  }
  unsigned int v40 = [v37 isEqualToString:v38];

  if (v40)
  {
LABEL_39:
    v50 = [v9 lastObject];
    v51 = v50;
    if (!v50
      || (v52 = v50, v52 == @"/")
      || (v53 = v52,
          unsigned int v54 = [(__CFString *)v52 isEqualToString:@"/"],
          v53,
          v54))
    {
      LOBYTE(discoveryItemsBackgroundQueue) = 1;
      [(PKPassGroupsViewController *)v548->_cardsViewController presentPeerPaymentPassAnimated:1 completion:0];
      goto LABEL_534;
    }
    v144 = (void *)PKUserNotificationActionRouteViewPassDetails;
    v145 = v53;
    v146 = v144;
    if (v145 == v146)
    {
      v148 = v11;
    }
    else
    {
      v147 = v146;
      v148 = v11;
      if (!v146)
      {

        goto LABEL_217;
      }
      unsigned int v149 = [(__CFString *)v145 isEqualToString:v146];

      if (!v149)
      {
LABEL_217:
        v177 = (void *)PKURLActionSearch;
        v178 = v145;
        v179 = v177;
        if (v178 == v179)
        {
        }
        else
        {
          v180 = v179;
          if (!v179)
          {

            goto LABEL_284;
          }
          unsigned int v181 = [(__CFString *)v178 isEqualToString:v179];

          if (!v181)
          {
LABEL_284:
            v223 = (void *)PKURLActionRouteAutoReload;
            v224 = v178;
            v225 = v223;
            if (v224 == v225)
            {
            }
            else
            {
              v226 = v225;
              if (!v225)
              {

                goto LABEL_333;
              }
              unsigned int v227 = [(__CFString *)v224 isEqualToString:v225];

              if (!v227)
              {
LABEL_333:
                if ((unint64_t)v12 < 2) {
                  goto LABEL_394;
                }
                v257 = [v9 objectAtIndex:1];
                v258 = (void *)PKURLActionRouteRecurringPayment;
                id v259 = v257;
                id v260 = v258;
                if (v259 == v260)
                {
                }
                else
                {
                  v261 = v260;
                  if (!v259 || !v260)
                  {

                    goto LABEL_394;
                  }
                  unsigned int v262 = [v259 isEqualToString:v260];

                  if (!v262)
                  {
LABEL_394:
                    v296 = (void *)PKUserNotificationActionRouteCardInformation;
                    v297 = v224;
                    v298 = v296;
                    if (v297 == v298)
                    {
                    }
                    else
                    {
                      v299 = v298;
                      if (!v298)
                      {

LABEL_401:
                        v301 = (void *)PKURLActionRoutePeerPaymentTransferToBank;
                        v302 = v297;
                        v303 = v301;
                        if (v302 == v303)
                        {
                        }
                        else
                        {
                          v304 = v303;
                          if (!v303)
                          {

LABEL_460:
                            if ((unint64_t)v12 >= 2)
                            {
                              v334 = [v9 objectAtIndex:1];
                              v335 = (void *)PKURLActionRouteDeviceTap;
                              id v336 = v334;
                              id v337 = v335;
                              if (v336 == v337)
                              {
                              }
                              else
                              {
                                v338 = v337;
                                if (!v336 || !v337)
                                {

LABEL_537:
                                  LOBYTE(discoveryItemsBackgroundQueue) = 0;
LABEL_553:
                                  uint64_t v11 = v148;
                                  goto LABEL_534;
                                }
                                unsigned int v339 = [v336 isEqualToString:v337];

                                if (!v339) {
                                  goto LABEL_537;
                                }
                              }
                              if ((unint64_t)v12 < 3)
                              {
                                discoveryItemsBackgroundQueue = 0;
                              }
                              else
                              {
                                v380 = [v9 objectAtIndex:2];
                                discoveryItemsBackgroundQueue = +[NSDecimalNumber decimalNumberWithString:v380];

                                if (v12 != (char *)3)
                                {
                                  v381 = [v9 objectAtIndex:3];
LABEL_552:
                                  [(PKPassGroupsViewController *)v548->_cardsViewController presentPeerPaymentDeviceTapWithInitialAmount:discoveryItemsBackgroundQueue initialMemo:v381];

                                  LOBYTE(discoveryItemsBackgroundQueue) = 1;
                                  goto LABEL_553;
                                }
                              }
                              v381 = 0;
                              goto LABEL_552;
                            }
                            LOBYTE(discoveryItemsBackgroundQueue) = 0;
LABEL_416:
                            uint64_t v11 = v148;
                            goto LABEL_534;
                          }
                          unsigned int v305 = [(__CFString *)v302 isEqualToString:v303];

                          if (!v305) {
                            goto LABEL_460;
                          }
                        }
                        v161 = v548->_cardsViewController;
                        v589[0] = _NSConcreteStackBlock;
                        v589[1] = 3221225472;
                        v589[2] = sub_10000B1D8;
                        v589[3] = &unk_100018D08;
                        v589[4] = v548;
                        LOBYTE(discoveryItemsBackgroundQueue) = 1;
                        v162 = v589;
LABEL_415:
                        [(PKPassGroupsViewController *)v161 presentPeerPaymentPassAnimated:1 completion:v162];
                        goto LABEL_416;
                      }
                      unsigned int v300 = [(__CFString *)v297 isEqualToString:v298];

                      if (!v300) {
                        goto LABEL_401;
                      }
                    }
                    v161 = v548->_cardsViewController;
                    v590[0] = _NSConcreteStackBlock;
                    v590[1] = 3221225472;
                    v590[2] = sub_10000B17C;
                    v590[3] = &unk_100018D08;
                    v590[4] = v548;
                    LOBYTE(discoveryItemsBackgroundQueue) = 1;
                    v162 = v590;
                    goto LABEL_415;
                  }
                }
                if ((unint64_t)v12 < 3)
                {
                  discoveryItemsBackgroundQueue = 0;
                }
                else
                {
                  discoveryItemsBackgroundQueue = [v9 objectAtIndex:2];
                }
                uint64_t v11 = v148;
                [(PKPassGroupsViewController *)v548->_cardsViewController presentPeerPaymentRecurringPaymentWithIdentifier:discoveryItemsBackgroundQueue];
                goto LABEL_412;
              }
            }
            v161 = v548->_cardsViewController;
            v591[0] = _NSConcreteStackBlock;
            v591[1] = 3221225472;
            v591[2] = sub_10000B150;
            v591[3] = &unk_100018D08;
            v591[4] = v548;
            LOBYTE(discoveryItemsBackgroundQueue) = 1;
            v162 = v591;
            goto LABEL_415;
          }
        }
        v161 = v548->_cardsViewController;
        v592[0] = _NSConcreteStackBlock;
        v592[1] = 3221225472;
        v592[2] = sub_10000B12C;
        v592[3] = &unk_100018D08;
        v592[4] = v548;
        LOBYTE(discoveryItemsBackgroundQueue) = 1;
        v162 = v592;
        goto LABEL_415;
      }
    }
    v161 = v548->_cardsViewController;
    v593[0] = _NSConcreteStackBlock;
    v593[1] = 3221225472;
    v593[2] = sub_10000B104;
    v593[3] = &unk_100018D08;
    v593[4] = v548;
    LOBYTE(discoveryItemsBackgroundQueue) = 1;
    v162 = v593;
    goto LABEL_415;
  }
LABEL_45:
  v55 = (void *)PKURLActionRouteCreditPaymentPass;
  id v56 = v37;
  id v57 = v55;
  if (v57 == v56)
  {

    goto LABEL_57;
  }
  v58 = v57;
  if (!v14 || !v57)
  {

    goto LABEL_65;
  }
  unsigned int v59 = [v56 isEqualToString:v57];

  if (v59)
  {
LABEL_57:
    v65 = (char *)[v9 indexOfObjectPassingTest:&stru_100018D48];
    if (v65 == (char *)0x7FFFFFFFFFFFFFFFLL
      || (v66 = v65,
          [v9 objectAtIndexedSubscript:v65],
          (v67 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      LOBYTE(discoveryItemsBackgroundQueue) = 1;
      [(PKPassGroupsViewController *)v548->_cardsViewController presentCreditPassAnimated:1 completion:0];
      goto LABEL_535;
    }
    unint64_t v68 = (unint64_t)(v66 + 1);
    v69 = (void *)PKURLActionRouteCreditPaymentPassDetailsAction;
    v51 = v67;
    v70 = v69;
    if (v51 == v70)
    {
      v72 = v11;
    }
    else
    {
      v71 = v70;
      v72 = v11;
      if (!v70)
      {

        goto LABEL_225;
      }
      unsigned int v73 = [v51 isEqualToString:v70];

      if (!v73)
      {
LABEL_225:
        v184 = (void *)PKURLActionRouteCreditPaymentPassBillPaymentAction;
        v185 = v51;
        v186 = v184;
        if (v185 == v186)
        {
        }
        else
        {
          v187 = v186;
          if (!v186)
          {

            goto LABEL_309;
          }
          unsigned int v188 = [v185 isEqualToString:v186];

          if (!v188)
          {
LABEL_309:
            v243 = (void *)PKURLActionRouteCreditPaymentPassBalanceDetails;
            v185 = v185;
            v244 = v243;
            if (v185 == v244)
            {
            }
            else
            {
              v245 = v244;
              if (!v244)
              {

                goto LABEL_348;
              }
              unsigned int v246 = [v185 isEqualToString:v244];

              if (!v246)
              {
LABEL_348:
                if ((unint64_t)v12 < 3) {
                  goto LABEL_418;
                }
                v264 = [v9 objectAtIndex:1];
                v265 = (void *)PKURLActionRouteCreditPaymentPassStatement;
                id v266 = v264;
                id v267 = v265;
                if (v266 == v267)
                {
                }
                else
                {
                  v268 = v267;
                  if (!v266 || !v267)
                  {

                    goto LABEL_418;
                  }
                  unsigned int v269 = [v266 isEqualToString:v267];

                  if (!v269)
                  {
LABEL_418:
                    v308 = (void *)PKInstallmentRoutePass;
                    v185 = v185;
                    v309 = v308;
                    if (v185 == v309)
                    {
                    }
                    else
                    {
                      v310 = v309;
                      if (!v309)
                      {

LABEL_425:
                        v312 = (void *)PKURLActionSearch;
                        v185 = v185;
                        v313 = v312;
                        if (v185 == v313)
                        {
                        }
                        else
                        {
                          v314 = v313;
                          if (!v313)
                          {

                            goto LABEL_468;
                          }
                          unsigned int v315 = [v185 isEqualToString:v313];

                          if (!v315)
                          {
LABEL_468:
                            v340 = (void *)PKURLActionRouteCreditPaymentPassSummary;
                            discoveryItemsBackgroundQueue = v185;
                            v341 = v340;
                            id v538 = v10;
                            if (discoveryItemsBackgroundQueue == v341)
                            {
                            }
                            else
                            {
                              v342 = v341;
                              if (!v341)
                              {

LABEL_522:
                                v382 = (void *)PKURLActionRouteShareAccount;
                                discoveryItemsBackgroundQueue = discoveryItemsBackgroundQueue;
                                v383 = v382;
                                if (discoveryItemsBackgroundQueue == v383)
                                {
                                }
                                else
                                {
                                  v384 = v383;
                                  if (!v383)
                                  {

                                    goto LABEL_577;
                                  }
                                  unsigned int v385 = [discoveryItemsBackgroundQueue isEqualToString:v383];

                                  if (!v385)
                                  {
LABEL_577:
                                    v415 = (void *)PKURLActionRouteCreditPaymentPassNumbers;
                                    v416 = discoveryItemsBackgroundQueue;
                                    v417 = v415;
                                    if (v416 == v417)
                                    {
                                    }
                                    else
                                    {
                                      v418 = v417;
                                      if (!v417)
                                      {

LABEL_626:
                                        v447 = (void *)PKURLActionRouteCreditPaymentPassRewards;
                                        v416 = v416;
                                        v448 = v447;
                                        if (v416 == v448)
                                        {
                                        }
                                        else
                                        {
                                          v449 = v448;
                                          if (!v448)
                                          {

                                            goto LABEL_699;
                                          }
                                          unsigned int v450 = [v416 isEqualToString:v448];

                                          if (!v450)
                                          {
LABEL_699:
                                            v488 = (void *)PKURLActionRouteCreditPaymentPassPromotions;
                                            v416 = v416;
                                            v489 = v488;
                                            if (v416 == v489)
                                            {
                                            }
                                            else
                                            {
                                              v490 = v489;
                                              if (!v489)
                                              {

                                                goto LABEL_734;
                                              }
                                              unsigned int v491 = [v416 isEqualToString:v489];

                                              if (!v491)
                                              {
LABEL_734:
                                                v510 = (void *)PKURLActionRouteCreditPaymentPassMerchants;
                                                v496 = v416;
                                                v511 = v510;
                                                if (v496 == v511)
                                                {

LABEL_761:
                                                  if ((unint64_t)v12 <= v68)
                                                  {
                                                    v519 = 0;
                                                  }
                                                  else
                                                  {
                                                    v519 = [v9 objectAtIndex:v68];
                                                  }
                                                  v523 = v548->_cardsViewController;
                                                  v575[0] = _NSConcreteStackBlock;
                                                  v575[1] = 3221225472;
                                                  v575[2] = sub_10000B580;
                                                  v575[3] = &unk_100018D98;
                                                  v575[4] = v548;
                                                  id v576 = v519;
                                                  id v524 = v519;
                                                  LOBYTE(discoveryItemsBackgroundQueue) = 1;
                                                  [(PKPassGroupsViewController *)v523 presentCreditPassAnimated:1 completion:v575];

                                                  goto LABEL_697;
                                                }
                                                v512 = v511;
                                                if (v511)
                                                {
                                                  unsigned int v513 = [v496 isEqualToString:v511];

                                                  if (v513) {
                                                    goto LABEL_761;
                                                  }
                                                  goto LABEL_741;
                                                }
                                                goto LABEL_740;
                                              }
                                            }
                                            if ((unint64_t)v12 <= v68)
                                            {
LABEL_741:
                                              v425 = v548->_cardsViewController;
                                              LOBYTE(discoveryItemsBackgroundQueue) = 1;
                                              v426 = 0;
                                              goto LABEL_659;
                                            }
                                            v496 = [v9 objectAtIndex:v68];
                                            if ([v496 length])
                                            {
                                              v497 = v548->_cardsViewController;
                                              v577[0] = _NSConcreteStackBlock;
                                              v577[1] = 3221225472;
                                              v577[2] = sub_10000B558;
                                              v577[3] = &unk_100018D98;
                                              v577[4] = v548;
                                              v578 = v496;
                                              v498 = v496;
                                              LOBYTE(discoveryItemsBackgroundQueue) = 1;
                                              [(PKPassGroupsViewController *)v497 presentCreditPassAnimated:1 completion:v577];

                                              goto LABEL_660;
                                            }
LABEL_740:

                                            goto LABEL_741;
                                          }
                                        }
                                        v425 = v548->_cardsViewController;
                                        v579[0] = _NSConcreteStackBlock;
                                        v579[1] = 3221225472;
                                        v579[2] = sub_10000B530;
                                        v579[3] = &unk_100018D08;
                                        v579[4] = v548;
                                        LOBYTE(discoveryItemsBackgroundQueue) = 1;
                                        v426 = v579;
LABEL_659:
                                        [(PKPassGroupsViewController *)v425 presentCreditPassAnimated:1 completion:v426];
LABEL_660:

LABEL_697:
                                        id v10 = v538;
                                        goto LABEL_437;
                                      }
                                      unsigned int v419 = [v416 isEqualToString:v417];

                                      if (!v419) {
                                        goto LABEL_626;
                                      }
                                    }
                                    v425 = v548->_cardsViewController;
                                    v580[0] = _NSConcreteStackBlock;
                                    v580[1] = 3221225472;
                                    v580[2] = sub_10000B480;
                                    v580[3] = &unk_100018D08;
                                    v580[4] = v548;
                                    LOBYTE(discoveryItemsBackgroundQueue) = 1;
                                    v426 = v580;
                                    goto LABEL_659;
                                  }
                                }
                                [(PKPassGroupsViewController *)v548->_cardsViewController presentCreateAccountUserInvitationWithCompletion:0];
LABEL_696:

                                LOBYTE(discoveryItemsBackgroundQueue) = 1;
                                goto LABEL_697;
                              }
                              unsigned int v343 = [discoveryItemsBackgroundQueue isEqualToString:v341];

                              if (!v343) {
                                goto LABEL_522;
                              }
                            }
                            if ((unint64_t)v12 <= v68)
                            {
                              uint64_t v373 = 0;
                              goto LABEL_632;
                            }
                            v353 = [v9 objectAtIndex:v66 + 1];
                            v354 = (void *)PKRouteSummaryCategoryCategories;
                            id v355 = v353;
                            id v356 = v354;
                            if (v355 == v356)
                            {
                            }
                            else
                            {
                              v357 = v356;
                              if (!v355 || !v356)
                              {

                                goto LABEL_582;
                              }
                              unsigned int v358 = [v355 isEqualToString:v356];

                              if (!v358)
                              {
LABEL_582:
                                v420 = (void *)PKRouteSummaryCategoryMerchants;
                                id v421 = v355;
                                id v422 = v420;
                                if (v421 == v422)
                                {

                                  unint64_t v68 = (unint64_t)(v66 + 2);
                                  uint64_t v373 = 1;
                                }
                                else
                                {
                                  v423 = v422;
                                  if (v355 && v422)
                                  {
                                    unsigned int v424 = [v421 isEqualToString:v422];

                                    if (v424) {
                                      unint64_t v68 = (unint64_t)(v66 + 2);
                                    }
                                    uint64_t v373 = v424;
                                  }
                                  else
                                  {

                                    uint64_t v373 = 0;
                                  }
                                }
                                goto LABEL_631;
                              }
                            }
                            uint64_t v373 = 0;
                            unint64_t v68 = (unint64_t)(v66 + 2);
LABEL_631:

LABEL_632:
                            if ((unint64_t)v12 <= v68)
                            {
                              uint64_t v457 = 0;
LABEL_692:
                              if ((unint64_t)v12 <= v68)
                              {
                                uint64_t v486 = 0x7FFFFFFFFFFFFFFFLL;
                              }
                              else
                              {
                                v485 = [v9 objectAtIndex:v68];
                                uint64_t v486 = (uint64_t)[v485 integerValue];
                              }
                              v487 = +[PKAccountService sharedInstance];
                              v581[0] = _NSConcreteStackBlock;
                              v581[1] = 3221225472;
                              v581[2] = sub_10000B358;
                              v581[3] = &unk_100018DE8;
                              v581[4] = v548;
                              v581[5] = v457;
                              v581[6] = v373;
                              v581[7] = v486;
                              [v487 defaultAccountForFeature:2 completion:v581];

                              goto LABEL_696;
                            }
                            v451 = [v9 objectAtIndex:v68];
                            v452 = (void *)PKTimePeriodMonth;
                            id v453 = v451;
                            id v454 = v452;
                            if (v453 == v454)
                            {
                            }
                            else
                            {
                              v455 = v454;
                              if (!v453 || !v454)
                              {

                                goto LABEL_642;
                              }
                              unsigned int v456 = [v453 isEqualToString:v454];

                              if (!v456)
                              {
LABEL_642:
                                v458 = (void *)PKTimePeriodYear;
                                id v459 = v453;
                                id v460 = v458;
                                if (v459 == v460)
                                {
                                }
                                else
                                {
                                  v461 = v460;
                                  if (!v453 || !v460)
                                  {

LABEL_650:
                                    v463 = (void *)PKTimePeriodWeek;
                                    id v464 = v459;
                                    id v465 = v463;
                                    if (v464 == v465)
                                    {
                                    }
                                    else
                                    {
                                      v466 = v465;
                                      if (!v453 || !v465)
                                      {

LABEL_690:
                                        uint64_t v457 = 0;
                                        goto LABEL_691;
                                      }
                                      unsigned int v467 = [v464 isEqualToString:v465];

                                      if (!v467) {
                                        goto LABEL_690;
                                      }
                                    }
                                    uint64_t v457 = 0;
                                    ++v68;
LABEL_691:

                                    goto LABEL_692;
                                  }
                                  unsigned int v462 = [v459 isEqualToString:v460];

                                  if (!v462) {
                                    goto LABEL_650;
                                  }
                                }
                                ++v68;
                                uint64_t v457 = 2;
                                goto LABEL_691;
                              }
                            }
                            ++v68;
                            uint64_t v457 = 1;
                            goto LABEL_691;
                          }
                        }
                        v221 = v548->_cardsViewController;
                        v582[0] = _NSConcreteStackBlock;
                        v582[1] = 3221225472;
                        v582[2] = sub_10000B334;
                        v582[3] = &unk_100018D08;
                        v582[4] = v548;
                        LOBYTE(discoveryItemsBackgroundQueue) = 1;
                        v222 = v582;
LABEL_436:
                        [(PKPassGroupsViewController *)v221 presentCreditPassAnimated:1 completion:v222];

LABEL_437:
                        uint64_t v11 = v72;
LABEL_438:
                        id v14 = v550;
                        goto LABEL_535;
                      }
                      unsigned int v311 = [v185 isEqualToString:v309];

                      if (!v311) {
                        goto LABEL_425;
                      }
                    }
                    v221 = v548->_cardsViewController;
                    v583[0] = _NSConcreteStackBlock;
                    v583[1] = 3221225472;
                    v583[2] = sub_10000B30C;
                    v583[3] = &unk_100018D08;
                    v583[4] = v548;
                    LOBYTE(discoveryItemsBackgroundQueue) = 1;
                    v222 = v583;
                    goto LABEL_436;
                  }
                }
                discoveryItemsBackgroundQueue = [v9 objectAtIndex:2];
                uint64_t v11 = v72;
                if (discoveryItemsBackgroundQueue)
                {
                  id v306 = [objc_alloc((Class)NSUUID) initWithUUIDString:discoveryItemsBackgroundQueue];

                  if (v306)
                  {
                    v307 = v548->_cardsViewController;
                    v584[0] = _NSConcreteStackBlock;
                    v584[1] = 3221225472;
                    v584[2] = sub_10000B2E0;
                    v584[3] = &unk_100018D98;
                    v584[4] = v548;
                    v585 = discoveryItemsBackgroundQueue;
                    [(PKPassGroupsViewController *)v307 presentCreditPassAnimated:1 completion:v584];
                  }
                }

                LOBYTE(discoveryItemsBackgroundQueue) = 1;
                goto LABEL_438;
              }
            }
            v221 = v548->_cardsViewController;
            v586[0] = _NSConcreteStackBlock;
            v586[1] = 3221225472;
            v586[2] = sub_10000B2B8;
            v586[3] = &unk_100018D08;
            v586[4] = v548;
            LOBYTE(discoveryItemsBackgroundQueue) = 1;
            v222 = v586;
            goto LABEL_436;
          }
        }
        v221 = v548->_cardsViewController;
        v587[0] = _NSConcreteStackBlock;
        v587[1] = 3221225472;
        v587[2] = sub_10000B28C;
        v587[3] = &unk_100018D08;
        v587[4] = v548;
        LOBYTE(discoveryItemsBackgroundQueue) = 1;
        v222 = v587;
        goto LABEL_436;
      }
    }
    if ((unint64_t)v12 <= v68)
    {
      id v176 = 0;
      uint64_t v175 = 0;
      uint64_t v11 = v72;
    }
    else
    {
      v168 = [v9 objectAtIndexedSubscript:v66 + 1];
      v169 = (void *)PKURLSubactionRouteCreditPaymentPassShare;
      id v170 = v168;
      id v171 = v169;
      uint64_t v11 = v72;
      if (v170 != v171)
      {
        v172 = v171;
        v173 = v72;
        if (v170 && v171)
        {
          unsigned __int8 v174 = [v170 isEqualToString:v171];

          id v14 = v550;
          if (v174)
          {
            uint64_t v175 = 4;
            id v176 = v170;
LABEL_531:
            uint64_t v11 = v173;
            goto LABEL_532;
          }
        }
        else
        {

          id v14 = v550;
        }
        v252 = (void *)PKURLSubactionRouteCreditPaymentPassScheduledPayments;
        id v176 = v170;
        id v253 = v252;
        if (v176 == v253)
        {
        }
        else
        {
          v254 = v253;
          if (!v170 || !v253)
          {

            goto LABEL_361;
          }
          unsigned __int8 v255 = [v176 isEqualToString:v253];

          if ((v255 & 1) == 0)
          {
LABEL_361:
            v275 = (void *)PKURLSubactionRouteCreditPaymentPassMakeDefaultAtApple;
            id v176 = v176;
            id v276 = v275;
            if (v176 == v276)
            {
            }
            else
            {
              v277 = v276;
              if (!v170 || !v276)
              {

                goto LABEL_388;
              }
              unsigned __int8 v278 = [v176 isEqualToString:v276];

              if ((v278 & 1) == 0)
              {
LABEL_388:
                v292 = (void *)PKURLSubactionRouteCreditPaymentPassOrder;
                id v176 = v176;
                id v293 = v292;
                if (v176 == v293)
                {
                }
                else
                {
                  v294 = v293;
                  if (!v170 || !v293)
                  {

                    goto LABEL_454;
                  }
                  unsigned __int8 v295 = [v176 isEqualToString:v293];

                  if ((v295 & 1) == 0)
                  {
LABEL_454:
                    v330 = (void *)PKURLSubactionRouteCreditPaymentPassReplace;
                    id v176 = v176;
                    id v331 = v330;
                    if (v176 == v331)
                    {
                    }
                    else
                    {
                      v332 = v331;
                      if (!v170 || !v331)
                      {

                        goto LABEL_481;
                      }
                      unsigned __int8 v333 = [v176 isEqualToString:v331];

                      if ((v333 & 1) == 0)
                      {
LABEL_481:
                        v349 = (void *)PKURLSubactionRouteCreditPaymentPassActivate;
                        id v176 = v176;
                        id v350 = v349;
                        if (v176 == v350)
                        {

                          uint64_t v175 = 7;
                          goto LABEL_531;
                        }
                        v351 = v350;
                        if (v170 && v350)
                        {
                          unsigned __int8 v352 = [v176 isEqualToString:v350];

                          if (v352)
                          {
                            uint64_t v175 = 7;
LABEL_590:
                            uint64_t v11 = v173;
                            goto LABEL_307;
                          }
                        }
                        else
                        {
                        }
                        v398 = (void *)PKURLSubactionRouteCreditPaymentPassTrack;
                        id v176 = v176;
                        id v399 = v398;
                        if (v176 == v399)
                        {
                        }
                        else
                        {
                          v400 = v399;
                          if (!v170 || !v399)
                          {

LABEL_589:
                            uint64_t v175 = 0;
                            goto LABEL_590;
                          }
                          unsigned int v401 = [v176 isEqualToString:v399];

                          if (!v401) {
                            goto LABEL_589;
                          }
                        }
                        uint64_t v175 = 8;
                        goto LABEL_590;
                      }
                    }
                    uint64_t v175 = 10;
                    goto LABEL_531;
                  }
                }
                uint64_t v175 = 6;
                goto LABEL_531;
              }
            }
            uint64_t v175 = 5;
            goto LABEL_531;
          }
        }
        uint64_t v175 = 1;
        goto LABEL_531;
      }

      uint64_t v175 = 4;
      id v176 = v170;
    }
LABEL_307:
    id v14 = v550;
LABEL_532:
    v393 = v548->_cardsViewController;
    v588[0] = _NSConcreteStackBlock;
    v588[1] = 3221225472;
    v588[2] = sub_10000B264;
    v588[3] = &unk_100018D70;
    v588[4] = v548;
    v588[5] = v175;
    LOBYTE(discoveryItemsBackgroundQueue) = 1;
    [(PKPassGroupsViewController *)v393 presentCreditPassAnimated:1 completion:v588];
LABEL_533:

    goto LABEL_534;
  }
LABEL_65:
  v74 = (void *)PKURLActionRoutePayLaterPaymentPass;
  id v75 = v56;
  id v76 = v74;
  if (v76 == v75) {
    goto LABEL_193;
  }
  v77 = v76;
  if (v14 && v76)
  {
    unsigned __int8 v78 = [v75 isEqualToString:v76];

    if (v78)
    {
LABEL_194:
      id v155 = [v9 indexOfObjectPassingTest:&stru_100018E08];
      if (v155 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v156 = [v9 objectAtIndexedSubscript:v155];
        if (v156)
        {
          v157 = (void *)PKURLActionRoutePayLaterPaymentPassDetailsAction;
          v51 = v156;
          v158 = v157;
          if (v51 == v158)
          {
          }
          else
          {
            v159 = v158;
            if (!v158)
            {

LABEL_277:
              v218 = (void *)PKURLActionRoutePayLaterPaymentPassLoan;
              v51 = v51;
              v219 = v218;
              if (v51 == v219)
              {
              }
              else
              {
                discoveryItemsBackgroundQueue = v219;
                if (!v219)
                {

                  goto LABEL_534;
                }
                unsigned int v220 = [v51 isEqualToString:v219];

                if (!v220) {
                  goto LABEL_280;
                }
              }
              if ((unint64_t)v12 >= 3)
              {
                uint64_t v232 = [v9 objectAtIndex:2];
                if (v232)
                {
                  discoveryItemsBackgroundQueue = v232;
                  [(PKPassGroupsViewController *)v548->_cardsViewController presentPayLaterFinancingPlanWithIdentifier:v232];
LABEL_412:

                  LOBYTE(discoveryItemsBackgroundQueue) = 1;
                  goto LABEL_534;
                }
              }
              v182 = v548->_cardsViewController;
              LOBYTE(discoveryItemsBackgroundQueue) = 1;
              v183 = 0;
LABEL_299:
              [(PKPassGroupsViewController *)v182 presentPayLaterPassAnimated:1 completion:v183];
              goto LABEL_534;
            }
            unsigned int v160 = [v51 isEqualToString:v158];

            if (!v160) {
              goto LABEL_277;
            }
          }
          v182 = v548->_cardsViewController;
          v574[0] = _NSConcreteStackBlock;
          v574[1] = 3221225472;
          v574[2] = sub_10000B614;
          v574[3] = &unk_100018D08;
          v574[4] = v548;
          LOBYTE(discoveryItemsBackgroundQueue) = 1;
          v183 = v574;
          goto LABEL_299;
        }
      }
      LOBYTE(discoveryItemsBackgroundQueue) = 1;
      [(PKPassGroupsViewController *)v548->_cardsViewController presentPayLaterPassAnimated:1 completion:0];
      v51 = 0;
LABEL_534:

      goto LABEL_535;
    }
  }
  else
  {
  }
  v150 = (void *)PKURLActionRoutePayLaterFPSPaymentPass;
  id v151 = v75;
  id v152 = v150;
  if (v152 == v151)
  {
LABEL_193:

    goto LABEL_194;
  }
  v153 = v152;
  if (v14 && v152)
  {
    unsigned __int8 v154 = [v151 isEqualToString:v152];

    if (v154) {
      goto LABEL_194;
    }
  }
  else
  {
  }
  v163 = (void *)PKUserNotificationActionRouteViewDailyCash;
  id v164 = v151;
  id v165 = v163;
  if (v165 == v164)
  {
  }
  else
  {
    v166 = v165;
    if (!v14 || !v165)
    {

      goto LABEL_271;
    }
    unsigned int v167 = [v164 isEqualToString:v165];

    if (!v167)
    {
LABEL_271:
      v213 = (void *)PKUserNotificationActionRouteVerification;
      id v214 = v164;
      id v215 = v213;
      if (v215 == v214)
      {
      }
      else
      {
        v216 = v215;
        if (!v14 || !v215)
        {

          goto LABEL_316;
        }
        unsigned int v217 = [v214 isEqualToString:v215];

        if (!v217)
        {
LABEL_316:
          v247 = (void *)PKUserNotificationActionRouteInvitationInbox;
          id v248 = v214;
          id v249 = v247;
          if (v249 == v248)
          {
          }
          else
          {
            v250 = v249;
            if (!v14 || !v249)
            {

              goto LABEL_355;
            }
            unsigned int v251 = [v248 isEqualToString:v249];

            if (!v251)
            {
LABEL_355:
              v270 = (void *)PKURLActionShare;
              id v271 = v248;
              id v272 = v270;
              if (v272 == v271)
              {
              }
              else
              {
                v273 = v272;
                if (!v14 || !v272)
                {

LABEL_379:
                  v287 = (void *)PKURLActionRouteSavings;
                  id v288 = v271;
                  id v289 = v287;
                  if (v289 == v288) {
                    goto LABEL_445;
                  }
                  v290 = v289;
                  if (v14 && v289)
                  {
                    unsigned __int8 v291 = [v288 isEqualToString:v289];

                    if (v291) {
                      goto LABEL_446;
                    }
                  }
                  else
                  {
                  }
                  v316 = (void *)PKURLActionRouteSavingsAlt;
                  id v317 = v288;
                  id v318 = v316;
                  if (v318 == v317)
                  {
LABEL_445:
                  }
                  else
                  {
                    v319 = v318;
                    if (!v14 || !v318)
                    {

                      goto LABEL_475;
                    }
                    unsigned __int8 v320 = [v317 isEqualToString:v318];

                    if ((v320 & 1) == 0)
                    {
LABEL_475:
                      v543 = v11;
                      v344 = (void *)PKURLActionSecurePassSession;
                      id v345 = v317;
                      id v346 = v344;
                      if (v346 == v345)
                      {
                      }
                      else
                      {
                        v347 = v346;
                        if (!v14 || !v346)
                        {

                          goto LABEL_541;
                        }
                        unsigned int v348 = [v345 isEqualToString:v346];

                        if (!v348)
                        {
LABEL_541:
                          if (PKEqualObjects())
                          {
                            if ((unint64_t)v12 < 2)
                            {
                              v397 = PKLogFacilityTypeGetObject();
                              if (os_log_type_enabled(v397, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_WORD *)buf = 0;
                                _os_log_impl((void *)&_mh_execute_header, v397, OS_LOG_TYPE_DEFAULT, "No applicationId in URL", buf, 2u);
                              }
                            }
                            else
                            {
                              v397 = [v9 objectAtIndex:1];
                              [(PKPassGroupsViewController *)v548->_cardsViewController presentApplicationWithIdentifier:v397];
                            }
                            goto LABEL_757;
                          }
                          v408 = (void *)PKURLActionRouteAppleBalancePass;
                          id v409 = v345;
                          id v410 = v408;
                          if (v410 == v409)
                          {
                          }
                          else
                          {
                            v411 = v410;
                            if (!v14 || !v410)
                            {

                              goto LABEL_620;
                            }
                            unsigned int v412 = [v409 isEqualToString:v410];

                            if (!v412)
                            {
LABEL_620:
                              v442 = (void *)PKURLRouteProvision;
                              id v443 = v409;
                              id v444 = v442;
                              if (v444 == v443)
                              {
                              }
                              else
                              {
                                v445 = v444;
                                if (!v14 || !v444)
                                {

LABEL_682:
                                  v481 = (void *)PKURLActionRequestStoreReview;
                                  v397 = v443;
                                  v482 = v481;
                                  if (v482 == v397)
                                  {

LABEL_721:
                                    discoveryItemsBackgroundQueue = objc_alloc_init((Class)PKStoreKitReviewPromptHelper);
                                    v503 = [(PBKAppDelegate *)v548 window];
                                    v504 = [v503 windowScene];
                                    [discoveryItemsBackgroundQueue requestReviewInScene:v504 trigger:0];

LABEL_747:
                                    LOBYTE(discoveryItemsBackgroundQueue) = 1;
                                    goto LABEL_759;
                                  }
                                  v483 = v482;
                                  if (v14 && v482)
                                  {
                                    unsigned int v484 = [v397 isEqualToString:v482];

                                    if (!v484) {
                                      goto LABEL_758;
                                    }
                                    goto LABEL_721;
                                  }

LABEL_757:
                                  goto LABEL_758;
                                }
                                unsigned int v446 = [v443 isEqualToString:v444];

                                if (!v446) {
                                  goto LABEL_682;
                                }
                              }
                              if (v12 != (char *)4)
                              {
LABEL_758:
                                LOBYTE(discoveryItemsBackgroundQueue) = 0;
                                goto LABEL_759;
                              }
                              v476 = [v9 objectAtIndexedSubscript:1];
                              v477 = (void *)PKURLActionPendingProvisioning;
                              v397 = v476;
                              v478 = v477;
                              if (v397 == v478)
                              {
                              }
                              else
                              {
                                v479 = v478;
                                if (!v397 || !v478)
                                {

                                  goto LABEL_757;
                                }
                                unsigned int v480 = [v397 isEqualToString:v478];

                                if (!v480) {
                                  goto LABEL_758;
                                }
                              }
                              discoveryItemsBackgroundQueue = [v9 objectAtIndexedSubscript:2];
                              v503 = [v9 objectAtIndexedSubscript:3];
                              [(PKPassGroupsViewController *)v548->_cardsViewController presentProvisioningForPendingProvisioningOfType:discoveryItemsBackgroundQueue identifier:v503];
                              goto LABEL_747;
                            }
                          }
                          v435 = (char *)[v9 indexOfObjectPassingTest:&stru_100018EC8];
                          if (v435 == (char *)0x7FFFFFFFFFFFFFFFLL
                            || (v436 = v435,
                                [v9 objectAtIndexedSubscript:v435],
                                (v437 = objc_claimAutoreleasedReturnValue()) == 0))
                          {
                            LOBYTE(discoveryItemsBackgroundQueue) = 1;
                            [(PKPassGroupsViewController *)v548->_cardsViewController presentPassForFeatureIdentifier:4 animated:1 completion:0];
                            id v386 = 0;
LABEL_557:

LABEL_759:
                            uint64_t v11 = v543;
                            goto LABEL_438;
                          }
                          v438 = (void *)PKURLActionRouteAppleBalanceAddMoney;
                          id v386 = v437;
                          id v439 = v438;
                          if (v386 == v439)
                          {
                          }
                          else
                          {
                            v440 = v439;
                            if (!v439)
                            {

LABEL_755:
                              LOBYTE(discoveryItemsBackgroundQueue) = 0;
                              goto LABEL_557;
                            }
                            unsigned int v441 = [v386 isEqualToString:v439];

                            if (!v441) {
                              goto LABEL_755;
                            }
                          }
                          if (v12 <= v436 + 1)
                          {
                            v514 = 0;
                            goto LABEL_743;
                          }
                          v505 = [v9 objectAtIndexedSubscript:];
                          v506 = (void *)PKURLActionRouteAppleBalanceAddMoneyDirectTopUp;
                          discoveryItemsBackgroundQueue = v505;
                          v507 = v506;
                          if (discoveryItemsBackgroundQueue == v507)
                          {
                          }
                          else
                          {
                            v508 = v507;
                            if (!discoveryItemsBackgroundQueue || !v507)
                            {

LABEL_787:
                              v527 = (void *)PKURLActionRouteAppleBalanceAddMoneyInStoreTopUp;
                              v514 = discoveryItemsBackgroundQueue;
                              v528 = v527;
                              if (v514 == v528)
                              {

LABEL_793:
                                [(PKPassGroupsViewController *)v548->_cardsViewController presentAppleBalanceAddMoneyInStoreTopUpAnimated:1 completion:0];
                                goto LABEL_744;
                              }
                              v529 = v528;
                              if (discoveryItemsBackgroundQueue && v528)
                              {
                                unsigned int v530 = [v514 isEqualToString:v528];

                                if (v530) {
                                  goto LABEL_793;
                                }
                              }
                              else
                              {
                              }
LABEL_743:
                              [(PKPassGroupsViewController *)v548->_cardsViewController presentAppleBalanceAddMoneyAnimated:1 completion:0];
LABEL_744:
                              discoveryItemsBackgroundQueue = v514;
LABEL_784:

                              LOBYTE(discoveryItemsBackgroundQueue) = 1;
                              goto LABEL_557;
                            }
                            unsigned __int8 v509 = [discoveryItemsBackgroundQueue isEqualToString:v507];

                            if ((v509 & 1) == 0) {
                              goto LABEL_787;
                            }
                          }
                          [(PKPassGroupsViewController *)v548->_cardsViewController presentAppleBalanceAddMoneyDirectTopUpAnimated:1 completion:0];
                          goto LABEL_784;
                        }
                      }
                      discoveryItemsBackgroundQueue = [v10 fragment];
                      id v386 = [discoveryItemsBackgroundQueue componentsSeparatedByString:@"&"];

                      id v387 = [v386 count];
                      LOBYTE(discoveryItemsBackgroundQueue) = v387 == (id)2;
                      if (v387 == (id)2)
                      {
                        id v388 = objc_alloc((Class)NSData);
                        v389 = [v386 objectAtIndexedSubscript:0];
                        v402 = [v388 initWithBase64EncodedString:v389 options:0];

                        id v390 = objc_alloc((Class)NSData);
                        v391 = [v386 objectAtIndexedSubscript:1];
                        id v392 = [v390 initWithBase64EncodedString:v391 options:0];

                        [(PKPassGroupsViewController *)v548->_cardsViewController presentSecurePassSessionWithIssuerData:v402 withSignature:v392 animated:1];
                      }
                      else
                      {
                        v402 = PKLogFacilityTypeGetObject();
                        if (os_log_type_enabled(v402, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, v402, OS_LOG_TYPE_DEFAULT, "Missing required parameter for securePassSession.", buf, 2u);
                        }
                      }

                      goto LABEL_557;
                    }
                  }
LABEL_446:
                  v321 = (char *)[v9 indexOfObjectPassingTest:&stru_100018EA8];
                  if (v321 == (char *)0x7FFFFFFFFFFFFFFFLL
                    || (v322 = v321,
                        [v9 objectAtIndexedSubscript:v321],
                        (v323 = objc_claimAutoreleasedReturnValue()) == 0))
                  {
                    LOBYTE(discoveryItemsBackgroundQueue) = 1;
                    [(PKPassGroupsViewController *)v548->_cardsViewController presentAccountFeature:5 animated:1 destination:0 fundingSourceIdentifier:0 completion:0];
                    v325 = 0;
LABEL_778:

                    goto LABEL_535;
                  }
                  v324 = (void *)PKURLActionRouteSavingsDetails;
                  v325 = v323;
                  v326 = v324;
                  if (v325 == v326)
                  {
                    v328 = v11;
                  }
                  else
                  {
                    v327 = v326;
                    v328 = v11;
                    if (!v326)
                    {

                      goto LABEL_561;
                    }
                    unsigned int v329 = [v325 isEqualToString:v326];

                    if (!v329)
                    {
LABEL_561:
                      v404 = (void *)PKURLActionRouteSavingsDocuments;
                      v325 = v325;
                      v405 = v404;
                      if (v325 == v405)
                      {
                      }
                      else
                      {
                        v406 = v405;
                        if (!v405)
                        {

                          goto LABEL_598;
                        }
                        unsigned int v407 = [v325 isEqualToString:v405];

                        if (!v407)
                        {
LABEL_598:
                          v427 = (void *)PKURLActionRouteSavingsAddMoney;
                          v325 = v325;
                          v428 = v427;
                          if (v325 == v428)
                          {
                          }
                          else
                          {
                            v429 = v428;
                            if (!v428)
                            {

                              goto LABEL_662;
                            }
                            unsigned int v430 = [v325 isEqualToString:v428];

                            if (!v430)
                            {
LABEL_662:
                              v468 = (void *)PKURLActionRouteSavingsWithdrawMoney;
                              v325 = v325;
                              v469 = v468;
                              if (v325 == v469)
                              {
                              }
                              else
                              {
                                v470 = v469;
                                if (!v469)
                                {

LABEL_716:
                                  v499 = (void *)PKURLActionRouteSavingsFCCStepUp;
                                  v325 = v325;
                                  v500 = v499;
                                  if (v325 == v500)
                                  {
                                  }
                                  else
                                  {
                                    v501 = v500;
                                    if (!v500)
                                    {

LABEL_764:
                                      v520 = (void *)PKURLActionRouteSavingsBankVerification;
                                      v325 = v325;
                                      v521 = v520;
                                      if (v325 == v521)
                                      {
                                      }
                                      else
                                      {
                                        discoveryItemsBackgroundQueue = v521;
                                        if (!v521)
                                        {

                                          goto LABEL_777;
                                        }
                                        unsigned int v522 = [v325 isEqualToString:v521];

                                        if (!v522)
                                        {
                                          LOBYTE(discoveryItemsBackgroundQueue) = 0;
                                          goto LABEL_777;
                                        }
                                      }
                                      if ((unint64_t)v12 < 3)
                                      {
                                        id v395 = 0;
                                      }
                                      else
                                      {
                                        id v395 = [v9 objectAtIndex:2];
                                      }
                                      v525 = v548->_cardsViewController;
                                      LOBYTE(discoveryItemsBackgroundQueue) = 1;
                                      uint64_t v396 = 12;
                                      id v526 = v395;
LABEL_776:
                                      [(PKPassGroupsViewController *)v525 presentAccountFeature:5 animated:1 destination:v396 fundingSourceIdentifier:v526 completion:0];

                                      goto LABEL_777;
                                    }
                                    unsigned int v502 = [v325 isEqualToString:v500];

                                    if (!v502) {
                                      goto LABEL_764;
                                    }
                                  }
                                  v413 = v548->_cardsViewController;
                                  LOBYTE(discoveryItemsBackgroundQueue) = 1;
                                  uint64_t v414 = 11;
LABEL_732:
                                  [(PKPassGroupsViewController *)v413 presentAccountFeature:5 animated:1 destination:v414 fundingSourceIdentifier:0 completion:0];
LABEL_777:
                                  uint64_t v11 = v328;
                                  goto LABEL_778;
                                }
                                unsigned int v471 = [v325 isEqualToString:v469];

                                if (!v471) {
                                  goto LABEL_716;
                                }
                              }
                              v413 = v548->_cardsViewController;
                              LOBYTE(discoveryItemsBackgroundQueue) = 1;
                              uint64_t v414 = 3;
                              goto LABEL_732;
                            }
                          }
                          v413 = v548->_cardsViewController;
                          LOBYTE(discoveryItemsBackgroundQueue) = 1;
                          uint64_t v414 = 2;
                          goto LABEL_732;
                        }
                      }
                      v413 = v548->_cardsViewController;
                      LOBYTE(discoveryItemsBackgroundQueue) = 1;
                      uint64_t v414 = 6;
                      goto LABEL_732;
                    }
                  }
                  if (v12 <= v322 + 1)
                  {
                    id v395 = 0;
LABEL_539:
                    uint64_t v396 = 1;
LABEL_775:
                    v525 = v548->_cardsViewController;
                    LOBYTE(discoveryItemsBackgroundQueue) = 1;
                    id v526 = 0;
                    goto LABEL_776;
                  }
                  v374 = [v9 objectAtIndexedSubscript:];
                  v375 = (void *)PKURLActionRouteSavingsAddBankAccount;
                  id v376 = v374;
                  id v377 = v375;
                  if (v376 == v377)
                  {
                  }
                  else
                  {
                    v378 = v377;
                    if (!v376 || !v377)
                    {

                      goto LABEL_603;
                    }
                    unsigned __int8 v379 = [v376 isEqualToString:v377];

                    if ((v379 & 1) == 0)
                    {
LABEL_603:
                      v431 = (void *)PKURLActionRouteSavingsAccountInfo;
                      id v395 = v376;
                      id v432 = v431;
                      if (v395 == v432)
                      {
                      }
                      else
                      {
                        v433 = v432;
                        if (!v376 || !v432)
                        {

                          goto LABEL_667;
                        }
                        unsigned __int8 v434 = [v395 isEqualToString:v432];

                        if ((v434 & 1) == 0)
                        {
LABEL_667:
                          v472 = (void *)PKURLActionRouteSavingsBusinessChat;
                          id v395 = v395;
                          id v473 = v472;
                          if (v395 == v473)
                          {
                          }
                          else
                          {
                            v474 = v473;
                            if (!v376 || !v473)
                            {

                              goto LABEL_706;
                            }
                            unsigned __int8 v475 = [v395 isEqualToString:v473];

                            if ((v475 & 1) == 0)
                            {
LABEL_706:
                              v492 = (void *)PKURLActionRouteSavingsAccountNumbers;
                              id v395 = v395;
                              id v493 = v492;
                              if (v395 == v493)
                              {
                              }
                              else
                              {
                                v494 = v493;
                                if (!v376 || !v493)
                                {

LABEL_749:
                                  v515 = (void *)PKURLActionRouteSavingsAddBeneficiary;
                                  id v395 = v395;
                                  id v516 = v515;
                                  if (v395 == v516)
                                  {

LABEL_774:
                                    uint64_t v396 = 13;
                                    goto LABEL_775;
                                  }
                                  v517 = v516;
                                  if (v376 && v516)
                                  {
                                    unsigned int v518 = [v395 isEqualToString:v516];

                                    if (v518) {
                                      goto LABEL_774;
                                    }
                                  }
                                  else
                                  {
                                  }
                                  goto LABEL_539;
                                }
                                unsigned __int8 v495 = [v395 isEqualToString:v493];

                                if ((v495 & 1) == 0) {
                                  goto LABEL_749;
                                }
                              }
                              uint64_t v396 = 10;
                              goto LABEL_775;
                            }
                          }
                          uint64_t v396 = 7;
                          goto LABEL_775;
                        }
                      }
                      uint64_t v396 = 5;
                      goto LABEL_775;
                    }
                  }
                  uint64_t v396 = 4;
                  id v395 = v376;
                  goto LABEL_775;
                }
                unsigned int v274 = [v271 isEqualToString:v272];

                if (!v274) {
                  goto LABEL_379;
                }
              }
              if (v12 == (char *)2)
              {
                v51 = [v9 objectAtIndexedSubscript:1];
                goto LABEL_504;
              }
              if (v12 != (char *)3)
              {
                if ((unint64_t)v12 < 3) {
                  goto LABEL_55;
                }
                goto LABEL_496;
              }
              v281 = [v9 objectAtIndexedSubscript:2];
              v282 = (void *)PKURLActionShareActivateShare;
              id v283 = v281;
              id v284 = v282;
              if (v283 == v284)
              {
              }
              else
              {
                v285 = v284;
                if (!v283 || !v284)
                {

                  goto LABEL_496;
                }
                unsigned int v286 = [v283 isEqualToString:v284];

                if (!v286)
                {
LABEL_496:
                  id v359 = objc_alloc_init((Class)NSMutableString);
                  for (uint64_t j = 1; (char *)j != v12; ++j)
                  {
                    v361 = [v9 objectAtIndexedSubscript:j];
                    v362 = v361;
                    if (v361 == @"https:"
                      || v361
                      && (unsigned int v363 = [(__CFString *)v361 isEqualToString:@"https:"],
                          v362,
                          v363))
                    {
                      v364 = [v9 objectAtIndexedSubscript:j];
                      [v359 appendFormat:@"%@//", v364];
                    }
                    else
                    {
                      v364 = [v9 objectAtIndexedSubscript:j];
                      [v359 appendFormat:@"%@/", v364];
                    }
                  }
                  v365 = [v10 fragment];
                  [v359 appendFormat:@"#%@", v365];

                  v51 = [v359 copy];
                  id v14 = v550;
LABEL_504:
                  if (v51)
                  {
                    v366 = [v10 queryItems];
                    [v366 pk_firstObjectPassingTest:&stru_100018E88];
                    id v176 = (id)objc_claimAutoreleasedReturnValue();

                    v367 = v11;
                    v368 = v548->_cardsViewController;
                    uint64_t v369 = [v176 value];
                    v370 = (void *)v369;
                    if (v369) {
                      uint64_t v371 = v369;
                    }
                    else {
                      uint64_t v371 = PKAnalyticsReportShareReferralSourceUniversalLinkKey;
                    }
                    LOBYTE(discoveryItemsBackgroundQueue) = 1;
                    v372 = v368;
                    uint64_t v11 = v367;
                    [(PKPassGroupsViewController *)v372 presentShareInvitationWithMailboxAddress:v51 referralSource:v371 animated:1];

                    goto LABEL_533;
                  }
                  goto LABEL_55;
                }
              }
              LOBYTE(discoveryItemsBackgroundQueue) = 1;
              v51 = [v9 objectAtIndexedSubscript:1];
              [(PKPassGroupsViewController *)v548->_cardsViewController presentShareActivationWithShareIdentifier:v51];
              goto LABEL_534;
            }
          }
          if ((unint64_t)v12 < 2)
          {
            v263 = 0;
          }
          else
          {
            v263 = [v9 objectAtIndexedSubscript:1];
          }
          v279 = v548->_cardsViewController;
          v568[0] = _NSConcreteStackBlock;
          v568[1] = 3221225472;
          v568[2] = sub_10000B74C;
          v568[3] = &unk_100018C40;
          id v569 = v263;
          id v280 = v263;
          LOBYTE(discoveryItemsBackgroundQueue) = 1;
          [(PKPassGroupsViewController *)v279 presentInvitationsInboxAnimated:1 completion:v568];

          goto LABEL_535;
        }
      }
      v233 = v11;
      v234 = [v10 queryItems];
      discoveryItemsBackgroundQueue = [v234 pk_firstObjectPassingTest:&stru_100018E48];

      v235 = [v10 queryItems];
      v236 = [v235 pk_firstObjectPassingTest:&stru_100018E68];

      v237 = [v236 value];
      v238 = (void *)PKVerificationSuccessValue;
      id v239 = v237;
      id v240 = v238;
      if (v239 == v240)
      {
      }
      else
      {
        v241 = v240;
        if (!v239 || !v240)
        {

          goto LABEL_345;
        }
        unsigned int v242 = [v239 isEqualToString:v240];

        if (!v242) {
          goto LABEL_346;
        }
      }
      v256 = v548->_cardsViewController;
      id v239 = [discoveryItemsBackgroundQueue value];
      [(PKPassGroupsViewController *)v256 dismissVerificationPageForPassWithDeviceAccountID:v239];
LABEL_345:

LABEL_346:
      LOBYTE(discoveryItemsBackgroundQueue) = 1;
      uint64_t v11 = v233;
      goto LABEL_535;
    }
  }
  long long v572 = 0u;
  long long v573 = 0u;
  long long v570 = 0u;
  long long v571 = 0u;
  v542 = v11;
  id v189 = v11;
  id v190 = [v189 countByEnumeratingWithState:&v570 objects:v604 count:16];
  if (!v190)
  {

    id v212 = 0;
    goto LABEL_289;
  }
  id v537 = v10;
  id v534 = v9;
  v565 = 0;
  v191 = 0;
  id v559 = 0;
  uint64_t v192 = *(void *)v571;
  id v193 = (id)PKUserNotificationActionQueryItemDate;
  id v563 = (id)PKUserNotificationActionQueryItemPassUniqueIdentifier;
  id v561 = (id)PKUserNotificationActionQueryItemRedemptionType;
  id v567 = v189;
  do
  {
    for (k = 0; k != v190; k = (char *)k + 1)
    {
      if (*(void *)v571 != v192) {
        objc_enumerationMutation(v567);
      }
      v195 = *(void **)(*((void *)&v570 + 1) + 8 * (void)k);
      v196 = [v195 name];
      v197 = [v195 value];
      if ([v197 length])
      {
        id v198 = v196;
        if (v198 == v193)
        {

LABEL_245:
          uint64_t v202 = PKDateForString();

          if (v202)
          {
            v191 = (void *)v202;
            goto LABEL_264;
          }
          id v206 = objc_alloc_init((Class)NSISO8601DateFormatter);
          [v206 setFormatOptions:275];
          v207 = +[NSCalendar currentCalendar];
          v208 = [v207 timeZone];
          [v206 setTimeZone:v208];

          v191 = [v206 dateFromString:v197];
LABEL_253:

          goto LABEL_264;
        }
        v199 = v198;
        if (v198) {
          BOOL v200 = v193 == 0;
        }
        else {
          BOOL v200 = 1;
        }
        if (v200)
        {
        }
        else
        {
          unsigned int v201 = [v198 isEqualToString:v193];

          if (v201) {
            goto LABEL_245;
          }
        }
        id v203 = v199;
        if (v203 == v563)
        {

LABEL_255:
          id v209 = v197;

          v565 = v209;
          id v14 = v550;
          goto LABEL_264;
        }
        v204 = v203;
        if (v199 && v563)
        {
          unsigned int v205 = [v203 isEqualToString:];

          if (v205) {
            goto LABEL_255;
          }
        }
        else
        {
        }
        id v210 = v204;
        if (v210 == v561)
        {

          id v14 = v550;
LABEL_263:
          id v559 = [v197 integerValue];
          goto LABEL_264;
        }
        id v206 = v210;
        id v14 = v550;
        if (!v199 || !v561) {
          goto LABEL_253;
        }
        unsigned int v211 = [v210 isEqualToString:];

        if (v211) {
          goto LABEL_263;
        }
      }
LABEL_264:
    }
    id v190 = [v567 countByEnumeratingWithState:&v570 objects:v604 count:16];
  }
  while (v190);

  id v9 = v534;
  id v10 = v537;
  id v190 = v565;
  id v212 = v559;
  if (!v191)
  {
LABEL_289:
    v191 = +[NSDate date];
  }
  v228 = +[NSCalendar currentCalendar];
  v229 = [v228 components:30 fromDate:v191];

  if (!v190 && v212 == (id)1)
  {
    v230 = +[PKPeerPaymentService sharedInstance];
    v231 = [v230 account];
    id v190 = [v231 associatedPassUniqueID];
  }
  LOBYTE(discoveryItemsBackgroundQueue) = 1;
  [(PKPassGroupsViewController *)v548->_cardsViewController presentDailyCashForPassUniqueIdentifier:v190 dateComponents:v229 redemptionType:v212 animated:1 completion:0];

  uint64_t v11 = v542;
LABEL_535:

  return (char)discoveryItemsBackgroundQueue;
}

- (void)willPresentNotification:(id)a3 withCompletionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 27);
  }
}

- (void)openSettingsForNotification:(id)a3
{
  id v4 = [a3 request];
  id v5 = [v4 content];
  uint64_t v6 = [v5 userInfo];

  id v7 = [v6 PKStringForKey:PKPassbookBulletinPassUniqueIdentifierKey];
  if (v7
    || ([v6 PKStringForKey:PKUserNotificationPassUniqueIdentifierContextKey],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000BA64;
    v9[3] = &unk_100018EF0;
    void v9[4] = self;
    id v10 = v7;
    id v8 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "userNotificationCenter:openSettingsForNotification unable to identify pass to open, userInfo %@", buf, 0xCu);
    }
  }
}

- (void)_handleUniversalLinkWithUserActivity:(id)a3
{
  id v4 = [a3 webpageURL];
  if (!v4) {
    goto LABEL_34;
  }
  id v5 = [objc_alloc((Class)NSURLComponents) initWithURL:v4 resolvingAgainstBaseURL:1];
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_33;
  }
  id v7 = [v5 scheme];
  id v8 = [v6 host];
  id v9 = [v6 URL];
  id v10 = [v9 pathComponents];

  uint64_t v11 = v7;
  id v12 = v11;
  if (v11 != @"http")
  {
    if (!v11
      || (unsigned __int8 v13 = [(__CFString *)v11 isEqualToString:@"http"],
          v12,
          (v13 & 1) == 0)
      && (id v14 = v12, v14 != @"https")
      && (id v15 = v14,
          unsigned int v16 = [(__CFString *)v14 isEqualToString:@"https"],
          v15,
          !v16))
    {
      [v10 count];
      id v18 = v10;
      goto LABEL_29;
    }
  }
  id v41 = v10;
  unsigned __int8 v17 = [(PBKAppDelegate *)self _isValidRelayServerURL:v4 outPathComponents:&v41];
  id v18 = v41;

  if (v17)
  {
    id v38 = v8;
    long long v19 = (char *)[v18 count];
    uint64_t v20 = 0;
    goto LABEL_10;
  }
  id v26 = (void *)PKWalletUniversalLinkHostName;
  id v27 = v8;
  id v28 = v26;
  unsigned int v29 = v28;
  if (v27 == v28)
  {
    unsigned int v30 = 1;
  }
  else
  {
    unsigned int v30 = 0;
    if (v27 && v28) {
      unsigned int v30 = [v27 isEqualToString:v28];
    }
  }

  uint64_t v31 = (uint64_t)[v18 count];
  if (!v30) {
    goto LABEL_29;
  }
  long long v19 = (char *)v31;
  if (v31 < 1) {
    goto LABEL_29;
  }
  id v37 = self;
  id v38 = v8;
  uint64_t v20 = 0;
  uint64_t v32 = PKURLActionRouteAppleCardPaymentPass;
  while (1)
  {
    id v33 = [v18 objectAtIndexedSubscript:v20, v37];
    if (![v33 isEqualToString:@"/"]) {
      break;
    }

LABEL_26:
    if (v19 == (char *)++v20) {
      goto LABEL_29;
    }
  }
  unsigned int v34 = [v33 isEqualToString:v32];

  if (v34) {
    goto LABEL_26;
  }
  self = v37;
  if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_29;
  }
LABEL_10:
  id v21 = [v18 objectAtIndexedSubscript:v20];
  id v22 = objc_alloc_init((Class)NSMutableArray);
  [v22 addObject:@"/"];
  unsigned int v23 = (char *)(v20 + 1);
  if (v23 < v19)
  {
    do
    {
      uint64_t v24 = [v18 objectAtIndexedSubscript:v23];
      [v22 addObject:v24];

      ++v23;
    }
    while (v19 != v23);
  }
  unsigned __int8 v25 = [(PBKAppDelegate *)self _handleWalletUniversalLinkableURLWithHost:v21 pathComponents:v22 urlComponents:v6];

  id v8 = v38;
  if ((v25 & 1) == 0)
  {
LABEL_29:
    unsigned int v35 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = v4;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Cannot handle universal link to URL: %@", buf, 0xCu);
    }

    v36 = +[LSApplicationWorkspace defaultWorkspace];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10000BE88;
    v39[3] = &unk_100018F18;
    id v40 = v4;
    [v36 openURL:v40 configuration:0 completionHandler:v39];
  }
LABEL_33:

LABEL_34:
}

- (void)_handleSpotlightWithUserActivity:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:CSSearchableItemActivityIdentifier];
  uint64_t v6 = +[NSURL URLWithString:v5];
  id v7 = v6;
  if (!v6
    || ([v6 scheme],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 isEqualToString:@"x-coredata"],
        v8,
        !v9))
  {
    id v10 = +[PKCoreSpotlightUtilities passUniqueIdentifierFromSpotlightIdentifier:v5];
    uint64_t v11 = +[PKCoreSpotlightUtilities transactionIdentifierFromSpotlightIdentifier:v5];
    uint64_t v12 = +[PKCoreSpotlightUtilities passUniqueIdentifierFromCardInformationSpotlightIdentifier:v5];
    unsigned __int8 v13 = v12;
    if (v10)
    {
      cardsViewController = self->_cardsViewController;
      id v15 = v10;
      unsigned int v16 = 0;
    }
    else
    {
      if (v11)
      {
        [(PKPassGroupsViewController *)self->_cardsViewController presentTransactionDetailsForTransactionWithIdentifier:v11];
        goto LABEL_10;
      }
      if (!v12) {
        goto LABEL_10;
      }
      cardsViewController = self->_cardsViewController;
      id v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      uint64_t v20 = sub_10000C4D0;
      id v21 = &unk_100018C18;
      id v22 = self;
      unsigned int v16 = &v18;
      id v15 = v13;
    }
    -[PKPassGroupsViewController presentPassWithUniqueID:animated:completionHandler:](cardsViewController, "presentPassWithUniqueID:animated:completionHandler:", v15, 1, v16, v18, v19, v20, v21, v22);
LABEL_10:

    goto LABEL_11;
  }
  if ([v5 containsString:@"Transaction"])
  {
    id v10 = objc_alloc_init(off_10001DE10());
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000C250;
    v25[3] = &unk_100018F40;
    id v26 = v7;
    id v27 = self;
    [v10 transactionWithURL:v26 completion:v25];
  }
  else if ([v5 containsString:@"Order"])
  {
    unsigned __int8 v17 = self->_cardsViewController;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000C3D0;
    v23[3] = &unk_100018C90;
    uint64_t v24 = v7;
    [(PKPassGroupsViewController *)v17 presentOrderManagementAnimated:1 completion:v23];
    id v10 = v24;
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000FA10((uint64_t)v5, v10);
    }
  }
LABEL_11:
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v6 = a4;
  [(PKLaunchAuthorizationPromptController *)self->_launchAuthorizationPromptController disableLaunchPromptsForSession];
  [v6 userInfo];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C658;
  v10[3] = &unk_100018CB8;
  v10[4] = self;
  id v11 = v6;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v12;
  id v8 = v6;
  [(PBKAppDelegate *)self _executeWhenApplicationForegroundActive:v10];

  return 1;
}

- (void)presentLaunchPromptViewController:(id)a3
{
}

- (BOOL)application:(id)a3 shouldRestoreSecureApplicationState:(id)a4
{
  id v4 = a4;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archiveVersion"];

  id v6 = [v5 unsignedIntegerValue];
  return v6 == (id)2;
}

- (BOOL)application:(id)a3 shouldSaveSecureApplicationState:(id)a4
{
  id v5 = a4;
  id v6 = +[NSNumber numberWithUnsignedInteger:2];
  [v5 encodeObject:v6 forKey:@"archiveVersion"];

  id v7 = [(PKPassGroupsViewController *)self->_cardsViewController groupStackView];
  LOBYTE(v6) = [v7 isPresentingPassViewFront];

  return (char)v6;
}

- (void)_destroyForegroundActiveResources
{
  self->_foregroundActiveResourcesCreated = 0;
  dispatch_async((dispatch_queue_t)self->_discoveryItemsBackgroundQueue, &stru_1000190A8);
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    id v4 = inUseAssertion;
    id v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(PKLocationAssertionGracePeriod * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000CEAC;
    block[3] = &unk_100018B78;
    uint64_t v19 = v4;
    id v7 = v4;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  id staticGlyphResources = self->_staticGlyphResources;
  self->_id staticGlyphResources = 0;

  lockButtonObserver = self->_lockButtonObserver;
  if (lockButtonObserver)
  {
    [(BSInvalidatable *)lockButtonObserver invalidate];
    id v10 = self->_lockButtonObserver;
    self->_lockButtonObserver = 0;
  }
  lockButtonAssertion = self->_lockButtonAssertion;
  if (lockButtonAssertion)
  {
    [(SBSAssertion *)lockButtonAssertion invalidate];
    id v12 = self->_lockButtonAssertion;
    self->_lockButtonAssertion = 0;
  }
  informativeForegroundAssertion = self->_informativeForegroundAssertion;
  if (informativeForegroundAssertion)
  {
    id v14 = informativeForegroundAssertion;
    id v15 = self->_informativeForegroundAssertion;
    self->_informativeForegroundAssertion = 0;

    unsigned int v16 = [(id)PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
    id v17 = [v16 releaseAssertion:v14];
  }
}

- (BOOL)_shouldBeginSubjectReportingWallet
{
  return [(PKLaunchAuthorizationPromptController *)self->_launchAuthorizationPromptController isPresentingNotificationAuthorizationPrompt] ^ 1;
}

- (BOOL)_shouldEndSubjectReportingWallet
{
  return [(PKLaunchAuthorizationPromptController *)self->_launchAuthorizationPromptController isPresentingNotificationAuthorizationPrompt] ^ 1;
}

- (void)consumeDoublePressUpForButtonKind:(int64_t)a3
{
  uint64_t v10 = PKAnalyticsSubjectWallet;
  id v4 = +[NSArray arrayWithObjects:&v10 count:1];
  v8[0] = PKAnalyticsReportEventKey;
  v8[1] = PKAnalyticsReportButtonTagKey;
  v9[0] = PKAnalyticsReportEventTypeButtonTap;
  v9[1] = PKAnalyticsReportButtonTagDoubleClick;
  id v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  +[PKAnalyticsReporter subjects:v4 sendEvent:v5];

  cardsViewController = [(PKPassGroupsViewController *)self->_cardsViewController pkui_frontMostViewController];
  id v7 = cardsViewController;
  if (cardsViewController == self->_cardsViewController) {
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    cardsViewController = self->_cardsViewController;
LABEL_4:
    [(PKPassGroupsViewController *)cardsViewController forcePaymentPresentationFromButton:1];
  }
}

- (id)applicationDocumentsDirectory
{
  v2 = +[NSFileManager defaultManager];
  id v3 = [v2 URLsForDirectory:9 inDomains:1];
  id v4 = [v3 lastObject];

  return v4;
}

- (void)_executeWhenApplicationForegroundActive:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    id v7 = v4;
    if (self->_foregroundActive && self->_didBecomeActiveOnce)
    {
      v4[2](v4);
    }
    else
    {
      blocksQueuedForForegroundExecution = self->_blocksQueuedForForegroundExecution;
      id v6 = [v4 copy];
      [(NSMutableArray *)blocksQueuedForForegroundExecution addObject:v6];
    }
    id v4 = v7;
  }
}

- (BOOL)_isValidRelayServerURL:(id)a3 outPathComponents:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)PKPaymentService);
  id v7 = [v6 sharedPaymentWebServiceContext];
  id v8 = [v7 configuration];
  unsigned int v9 = PKCurrentRegion();
  uint64_t v10 = [v8 allowedRelayServerHostsForRegion:v9];

  id v11 = [v5 host];
  if ([v10 containsObject:v11])
  {
    id v12 = objc_alloc((Class)NSString);
    id v13 = [v12 initWithFormat:@"/v%@/%@/", PKSharingRelayServerRequestVersion, PKSharingRelayServerMailboxURI];
    id v14 = (void *)PKWalletUniversalLinkHostName;
    id v15 = v11;
    id v16 = v14;
    if (v15 == v16)
    {
    }
    else
    {
      id v17 = v16;
      if (!v15 || !v16)
      {

        goto LABEL_12;
      }
      unsigned int v18 = [v15 isEqualToString:v16];

      if (!v18) {
        goto LABEL_12;
      }
    }
    uint64_t v20 = [v5 path];
    unsigned int v21 = [v20 hasPrefix:v13];

    if (!v21)
    {
      BOOL v19 = 0;
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    v24[0] = PKURLActionShare;
    id v22 = [v5 absoluteString];
    v24[1] = v22;
    *a4 = +[NSArray arrayWithObjects:v24 count:2];

    BOOL v19 = 1;
    goto LABEL_13;
  }
  BOOL v19 = 0;
LABEL_14:

  return v19;
}

- (void)presentDeletePassWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000D4C8;
  v16[3] = &unk_1000190D0;
  v16[4] = self;
  id v8 = v6;
  id v17 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D588;
  v12[3] = &unk_100019148;
  id v14 = objc_retainBlock(v16);
  id v15 = v7;
  v12[4] = self;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = v14;
  [(PBKAppDelegate *)self _executeWhenApplicationForegroundActive:v12];
}

- (void)handleDeletePassRequestWithPass:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D850;
  v4[3] = &unk_100018EF0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PBKAppDelegate *)v5 _executeWhenApplicationForegroundActive:v4];
}

- (void)sharePassWithUniqueID:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DA04;
  v7[3] = &unk_100018BF0;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(PBKAppDelegate *)v8 _executeWhenApplicationForegroundActive:v7];
}

- (void)presentAddMoneyForPassWithUniqueID:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DD34;
  v7[3] = &unk_100018BF0;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(PBKAppDelegate *)v8 _executeWhenApplicationForegroundActive:v7];
}

- (void)presentSearchForPassWithUniqueID:(id)a3 withQuery:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000DFD4;
  v10[3] = &unk_1000191C0;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v13;
  id v8 = v14;
  id v9 = v12;
  [(PBKAppDelegate *)v11 _executeWhenApplicationForegroundActive:v10];
}

- (void)presentAccountServiceSchedulePaymentWithUniqueID:(id)a3 billPayAmountType:(int64_t)a4 billPayAmount:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E1C0;
  v15[3] = &unk_1000191E8;
  v15[4] = self;
  id v16 = v10;
  id v18 = a6;
  int64_t v19 = a4;
  id v17 = v11;
  id v12 = v18;
  id v13 = v11;
  id v14 = v10;
  [(PBKAppDelegate *)self _executeWhenApplicationForegroundActive:v15];
}

- (PKPassGroupsViewController)cardsViewController
{
  return self->_cardsViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardsViewController, 0);
  objc_storeStrong((id *)&self->_launchAuthorizationPromptController, 0);
  objc_storeStrong((id *)&self->_lastTimeAppWasDismissed, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_informativeForegroundAssertion, 0);
  objc_storeStrong((id *)&self->_lockButtonAssertion, 0);
  objc_storeStrong((id *)&self->_lockButtonObserver, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong(&self->_staticGlyphResources, 0);
  objc_storeStrong((id *)&self->_blocksQueuedForForegroundExecution, 0);
  objc_storeStrong((id *)&self->_discoveryItemsBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_foregroundActiveResourcesBackgroundQueue, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end