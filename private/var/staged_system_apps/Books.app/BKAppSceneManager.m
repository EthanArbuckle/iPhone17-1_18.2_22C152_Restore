@interface BKAppSceneManager
+ (NSArray)supportedAudibleImportTypes;
+ (NSArray)supportedAudiobookImportTypes;
+ (NSArray)supportedFileImportTypes;
- (BCTransaction)initialUserTransaction;
- (BCTransactionQueue)userTransactionQueue;
- (BKAppImportCoordinator)importCoordinator;
- (BKAppLaunchCoordinator)launchCoordinator;
- (BKAppSceneManager)initWithLaunchCoordinator:(id)a3 importCoordinator:(id)a4;
- (BKAppStoreReviewManager)appStoreReviewManager;
- (BKAppURLHandling)urlHandler;
- (BKBookFlowController)bookFlowController;
- (BKCriticalAlertCoordinating)criticalAlertCoordinator;
- (BKEngagementManager)engagementManager;
- (BKJSAAppWindowProvider)windowProvider;
- (BKJSALibraryManager)jsaLibraryManager;
- (BKJSStoreFlowController)storeFlowController;
- (BKLibraryCollectionsFlowController)libraryCollectionsFlowController;
- (BKMinifiedFlowController)minifiedFlowController;
- (BKRootBarCoordinating)rootBarCoordinator;
- (BKSceneFlowController)sceneFlowController;
- (BKServiceCenter)serviceCenter;
- (BKWelcomePresenting)welcomePresenter;
- (BKWelcomeScreenManager)welcomeScreenManager;
- (BOOL)_isRunningWelcomeFlow;
- (BOOL)isPresentingWelcome;
- (BOOL)pushLargeCoverForInitialHandleURLBookOpen;
- (BOOL)pushLargeCoverForNextHandleURLBookOpen;
- (BOOL)shouldOpenLastBook;
- (BOOL)tabsAreLoaded;
- (BSUIJetActionHandling)jetActionHandler;
- (BUAssertion)pendingCriticalAlertAssertion;
- (NSMutableArray)pendingWelcomePresenterDismissCompletionBlocks;
- (NSString)figaroPageContext;
- (OS_dispatch_queue)urlHandlingQueue;
- (double)minifiedFlowControllerMinibarBottomGuideWithViewController:(id)a3;
- (id)_audibleURLsInURLs:(id)a3;
- (id)_findImportEligibleURLsAtURL:(id)a3;
- (id)_lastKnownStateRestorationUserInfoForSceneSession:(id)a3;
- (id)_primarySceneControllerObject;
- (id)_welcomeItems;
- (id)anySceneController;
- (id)appGroupIdentifierForBridge:(id)a3;
- (id)classRegistrations;
- (id)currentSceneController;
- (id)defaultSceneControllerForTransaction:(id)a3;
- (id)flowControllers;
- (id)mainFlowController;
- (id)mainLibrary;
- (id)minifiedFlowControllerMinibarContainingViewController;
- (id)minifiedFlowControllerPresentedAssetID:(id)a3;
- (id)minifiedFlowControllerTabBarView;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)navigationControllerForItem:(id)a3;
- (id)newBookSceneControllerProviderWithRequestAssetID:(id)a3;
- (id)newShowAssetTransactionWithOriginatingSceneController:(id)a3 targetSceneDescriptor:(id)a4;
- (id)newShowURLTransactionWithOriginatingSceneController:(id)a3 targetSceneDescriptor:(id)a4;
- (id)newTransactionWithName:(id)a3 originatingSceneController:(id)a4 targetSceneDescriptor:(id)a5;
- (id)objectRegistrationsForBridge:(id)a3;
- (id)primarySceneController;
- (id)rootBarCoordinatorForSceneController:(id)a3;
- (id)sceneControllerForViewController:(id)a3;
- (id)sceneControllerForWindow:(id)a3;
- (id)sceneInfoPresentingAssetID:(id)a3;
- (id)windowFromSceneType:(unint64_t)a3 assetID:(id)a4;
- (id)windowProviderForBridge:(id)a3;
- (void)_afterSceneWillConnect:(id)a3;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_applicationWillResignActiveNotification:(id)a3;
- (void)_bagDidUpdate:(id)a3;
- (void)_bridgeDidReload:(id)a3;
- (void)_didFinishSceneStateRestoration:(id)a3;
- (void)_enqueueDismissWelcomePresenter:(id)a3;
- (void)_openExternalURL:(id)a3 sourceApplication:(id)a4;
- (void)_retrieveTabsWithCompletion:(id)a3;
- (void)_sceneForReportingErrorWithContentType:(signed __int16)a3 assetID:(id)a4 completion:(id)a5;
- (void)_setCurrentWelcomePresenterIfNeeded:(id)a3;
- (void)_setWelcomePresenterIfNoneExists:(id)a3 shouldPresent:(BOOL)a4;
- (void)_setupMinibarContainerView;
- (void)_setupURLHandler;
- (void)_setupWelcomeScreenWithPresenterIfNeeded:(id)a3;
- (void)_showMainViewController;
- (void)_showMainViewControllerOrWelcomeScreen;
- (void)_showMainViewControllerOrWelcomeScreenNow;
- (void)_welcomePresenterDidDisconnect:(id)a3;
- (void)analyticsForceEndSession;
- (void)analyticsVisibilityDidDisappear;
- (void)analyticsVisibilityUpdate;
- (void)analyticsVisibilityWillDisappear;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
- (void)attemptToPresentStoreReview;
- (void)carPlayScene:(id)a3 didConnectInterfaceController:(id)a4;
- (void)dealloc;
- (void)destroySceneForAssetID:(id)a3;
- (void)enumerateSceneController:(id)a3 includeHidden:(BOOL)a4;
- (void)enumerateSceneInfo:(id)a3;
- (void)forceTransaction:(id)a3 ontoPrimarySceneWithContinuation:(id)a4;
- (void)handleApplicationURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 likelyUserInitiated:(id)a6 canImport:(BOOL)a7 openAfterImport:(BOOL)a8 importInPlace:(BOOL)a9 showLibraryAllCollection:(BOOL)a10 switchToLibrary:(BOOL)a11 transaction:(id)a12 completion:(id)a13;
- (void)handleApplicationURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 likelyUserInitiated:(id)a6 transaction:(id)a7;
- (void)handleImportURLs:(id)a3 openAfterImport:(BOOL)a4 importInPlace:(BOOL)a5 showLibraryAllCollection:(BOOL)a6 switchToLibrary:(BOOL)a7 transaction:(id)a8 perURLCompletion:(id)a9 completion:(id)a10;
- (void)handleImportURLs:(id)a3 transaction:(id)a4 perURLCompletion:(id)a5 completion:(id)a6;
- (void)minifiedFlowControllerHandleAssetPresentationError:(id)a3 assetID:(id)a4 isRetry:(BOOL)a5;
- (void)minifiedFlowControllerRequestShowStoreForStoreID:(id)a3 fromViewController:(id)a4;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)processAccountSwitchWithCompletion:(id)a3;
- (void)reloadStandardItemsWithAnimated:(BOOL)a3 completion:(id)a4;
- (void)requestAccountInfoScene;
- (void)requestBookSceneWithAssetID:(id)a3 completion:(id)a4;
- (void)requestEndOfBookSceneWithOptions:(id)a3 completion:(id)a4;
- (void)requestPrimaryOrBookScene:(id)a3;
- (void)requestPrimaryScene:(id)a3;
- (void)requestSceneWithAssetID:(id)a3 completion:(id)a4;
- (void)requestTabBarSceneController:(id)a3;
- (void)restrictionsForBookStoreAllowedChanged:(BOOL)a3;
- (void)routeScene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)saveStateClosing:(BOOL)a3;
- (void)setAppStoreReviewManager:(id)a3;
- (void)setBookFlowController:(id)a3;
- (void)setCriticalAlertCoordinator:(id)a3;
- (void)setEngagementManager:(id)a3;
- (void)setImportCoordinator:(id)a3;
- (void)setInitialUserTransaction:(id)a3;
- (void)setJetActionHandler:(id)a3;
- (void)setJsaLibraryManager:(id)a3;
- (void)setLaunchCoordinator:(id)a3;
- (void)setLibraryCollectionsFlowController:(id)a3;
- (void)setPendingCriticalAlertAssertion:(id)a3;
- (void)setPendingWelcomePresenterDismissCompletionBlocks:(id)a3;
- (void)setPushLargeCoverForInitialHandleURLBookOpen:(BOOL)a3;
- (void)setPushLargeCoverForNextHandleURLBookOpen:(BOOL)a3;
- (void)setRootBarCoordinator:(id)a3;
- (void)setSceneFlowController:(id)a3;
- (void)setScriptDataSource:(id)a3 completion:(id)a4;
- (void)setServiceCenter:(id)a3;
- (void)setStoreFlowController:(id)a3;
- (void)setTabsAreLoaded:(BOOL)a3;
- (void)setUrlHandler:(id)a3;
- (void)setUrlHandlingQueue:(id)a3;
- (void)setUserTransactionQueue:(id)a3;
- (void)setWelcomePresenter:(id)a3;
- (void)setWelcomeScreenManager:(id)a3;
- (void)setWindowProvider:(id)a3;
- (void)startJavascriptAppWithLibrary:(id)a3 libraryItemStateProvider:(id)a4 downloadProgressCenter:(id)a5 serviceCenter:(id)a6 storeController:(id)a7 engagementManager:(id)a8 jetActionHandler:(id)a9;
- (void)viewControllerForItem:(id)a3 completion:(id)a4;
@end

@implementation BKAppSceneManager

- (id)_primarySceneControllerObject
{
  objc_opt_class();
  v3 = [(BKAppSceneManager *)self primarySceneController];
  v4 = BUDynamicCast();

  return v4;
}

- (void)_setupURLHandler
{
  v3 = [BKAppURLHandler alloc];
  v4 = [(BKAppSceneManager *)self mainLibrary];
  v6 = [(BKAppURLHandler *)v3 initWithLibraryAssetProvider:v4];

  [(BKAppURLHandler *)v6 setDelegate:self];
  [(BKAppSceneManager *)self setUrlHandler:v6];
  v5 = [(BKAppSceneManager *)self urlHandlingQueue];
  dispatch_activate(v5);
}

- (void)_retrieveTabsWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Asking bag for tabs", buf, 2u);
  }

  v5 = +[BUBag defaultBag];
  v6 = [v5 booksTabs];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001FA6C;
  v8[3] = &unk_100A47EB8;
  id v9 = v3;
  id v7 = v3;
  [v6 jsa_valueWithCompletion:v8];
}

- (void)reloadStandardItemsWithAnimated:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000106B0;
  v14[3] = &unk_100A449F0;
  objc_copyWeak(&v16, &location);
  id v6 = v5;
  id v15 = v6;
  id v7 = objc_retainBlock(v14);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100026998;
  v10[3] = &unk_100A47E68;
  objc_copyWeak(&v13, &location);
  v8 = v7;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  [(BKAppSceneManager *)self _retrieveTabsWithCompletion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)setScriptDataSource:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = byte_100B4A450;
  if (byte_100B4A450 == 1)
  {
    id v9 = +[JSAHotReloadController sharedController];
    unsigned int v10 = [v9 isHotReloading] ^ 1;
  }
  else
  {
    unsigned int v10 = 1;
  }
  id v11 = [(id)qword_100B4A448 value];
  id v12 = [v11 context];
  id v13 = [v12 virtualMachine];
  [v13 removeManagedReference:qword_100B4A448 withOwner:self];

  uint64_t v14 = +[JSManagedValue managedValueWithValue:v6 andOwner:self];
  id v15 = (void *)qword_100B4A448;
  qword_100B4A448 = v14;

  if ((v8 & 1) == 0)
  {
    id v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:self selector:"_bagDidUpdate:" name:AMSBagChangedNotification object:0];

    byte_100B4A450 = 1;
  }
  if (v10)
  {
    v17 = JSALog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136446210;
      v21 = "-[BKAppSceneManager(BKTabBarControllerJSApp) setScriptDataSource:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s Reloading RootBarItems due to new JS", (uint8_t *)&v20, 0xCu);
    }

    [(BKAppSceneManager *)self reloadStandardItemsWithAnimated:1 completion:v7];
  }
  else
  {
    id v18 = objc_retainBlock(v7);
    v19 = v18;
    if (v18) {
      (*((void (**)(id))v18 + 2))(v18);
    }
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a3;
  id v8 = a4;
  id v9 = [v16 viewIfLoaded];
  uint64_t v10 = [v9 window];
  if (v10)
  {
    id v11 = (void *)v10;
    id v12 = [v16 parentViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [v8 transitionCoordinator];

      if (!v13) {
        goto LABEL_7;
      }
      id v9 = [(BKAppSceneManager *)self rootBarCoordinator];
      [v9 dismissCardStackForCurrentlySelected];
    }
    else
    {
    }
  }

LABEL_7:
  uint64_t v14 = [(BKAppSceneManager *)self _primarySceneControllerObject];
  id v15 = [v14 mainFlowController];
  [v15 navigationController:v16 willShowViewController:v8 animated:v5];
}

- (id)classRegistrations
{
  v4[0] = @"AdjustGoalModalViewController";
  v5[0] = objc_opt_class();
  v4[1] = @"AlertController";
  v5[1] = objc_opt_class();
  v4[2] = @"CloudRatingsManager";
  v5[2] = objc_opt_class();
  v4[3] = @"ContentTasteController";
  v5[3] = objc_opt_class();
  v4[4] = @"ContextMenuProvider";
  v5[4] = objc_opt_class();
  v4[5] = @"ContinueReadingBooksProvider";
  v5[5] = objc_opt_class();
  v4[6] = @"DynamicArray";
  v5[6] = objc_opt_class();
  v4[7] = @"DynamicValue";
  v5[7] = objc_opt_class();
  v4[8] = @"FeedDataRequest";
  v5[8] = objc_opt_class();
  v4[9] = @"FeedViewController";
  v5[9] = objc_opt_class();
  v4[10] = @"GoalPickerViewController";
  v5[10] = objc_opt_class();
  v4[11] = @"LanguageUtilities";
  v5[11] = objc_opt_class();
  v4[12] = @"LibraryProvider";
  v5[12] = objc_opt_class();
  v4[13] = @"NoticeViewController";
  v5[13] = objc_opt_class();
  v4[14] = @"NotificationManager";
  v5[14] = objc_opt_class();
  v4[15] = @"OSFeatureFlags";
  v5[15] = objc_opt_class();
  v4[16] = @"PPT";
  v5[16] = objc_opt_class();
  v4[17] = @"PreviouslyReadBooksProvider";
  v5[17] = objc_opt_class();
  v4[18] = @"PurchaseManager";
  v5[18] = objc_opt_class();
  v4[19] = @"QueryableLibraryItemStateWorker";
  v5[19] = objc_opt_class();
  v4[20] = @"ReadingNowConfiguration";
  v5[20] = objc_opt_class();
  v4[21] = @"RecentBooksProvider";
  v5[21] = objc_opt_class();
  v4[22] = @"RemoteConfigurationManager";
  v5[22] = objc_opt_class();
  v4[23] = @"SearchFeedViewController";
  v5[23] = objc_opt_class();
  v4[24] = @"ScreenShotViewController";
  v5[24] = objc_opt_class();
  v4[25] = @"SharedWithYouProvider";
  v5[25] = objc_opt_class();
  v4[26] = @"StoreServices";
  v5[26] = objc_opt_class();
  v4[27] = @"Transaction";
  v5[27] = objc_opt_class();
  v4[28] = @"VCStack";
  v5[28] = objc_opt_class();
  v4[29] = @"VideoStateProvider";
  v5[29] = objc_opt_class();
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:30];

  return v2;
}

- (void)viewControllerForItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  if ([v5 isLibraryCollection])
  {
    id v7 = [v5 identifier];
    id v8 = +[BKLibraryBookshelfController libraryViewControllerWithIdentifier:v7];
    v6[2](v6, v8);

    goto LABEL_23;
  }
  if (qword_100B4A448)
  {
    id v9 = [v5 tabBarTitle];
    uint64_t v10 = [v5 identifier];
    id v11 = +[BKRootBarItemsProvider HomeIdentifier];
    unsigned int v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      v41[0] = BSUIFeedOptionsKeyContextMenuProvider;
      id v13 = +[BKContextMenuProvider sharedProvider];
      v42[0] = v13;
      v41[1] = @"identifier";
      uint64_t v14 = [v5 identifier];
      v42[1] = v14;
      v42[2] = &__kCFBooleanTrue;
      v41[2] = @"isInitialFeed";
      v41[3] = @"isRootFeed";
      v42[3] = &__kCFBooleanTrue;
      v42[4] = &__kCFBooleanTrue;
      v41[4] = @"deferUIUpdateUntilInitialContentReady";
      v41[5] = @"reading-now-homepage";
      v42[5] = &__kCFBooleanTrue;
      v41[6] = @"tab";
      id v15 = [v5 identifier];
      v42[6] = v15;
      v42[7] = v9;
      v41[7] = @"title";
      v41[8] = @"url";
      id v16 = [v5 url];
      v17 = v16;
      if (!v16)
      {
        v17 = +[NSNull null];
      }
      v42[8] = v17;
      id v18 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:9];
      if (!v16) {

      }
      id v19 = [objc_alloc((Class)BSUIFeedViewController) initWithOptions:v18];
      int v20 = JSALog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v38 = v19;
        __int16 v39 = 2114;
        id v40 = v5;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "VC %{public}@ for %{public}@", buf, 0x16u);
      }

      v6[2](v6, v19);
    }
    else
    {
      if (!qword_100B4A448)
      {
        v29 = JSALog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v38 = v5;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "No VC for now due to lack of JS data source: %{public}@", buf, 0xCu);
        }

        v6[2](v6, 0);
        goto LABEL_22;
      }
      v35[0] = @"identifier";
      v22 = [v5 identifier];
      v36[0] = v22;
      v35[1] = @"isDefault";
      v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isPlaceholder]);
      v36[1] = v23;
      v35[2] = @"url";
      v24 = [v5 url];
      v25 = v24;
      if (!v24)
      {
        v25 = +[NSNull null];
      }
      v35[3] = @"title";
      v36[2] = v25;
      v36[3] = v9;
      v26 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];
      if (!v24) {

      }
      id v27 = (id)qword_100B4A448;
      v28 = dispatch_get_global_queue(33, 0);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10013F734;
      v30[3] = &unk_100A45980;
      id v31 = v27;
      id v32 = v26;
      id v33 = v5;
      v34 = v6;
      id v18 = v26;
      id v19 = v27;
      dispatch_async(v28, v30);
    }
LABEL_22:

    goto LABEL_23;
  }
  v21 = JSALog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v38 = v5;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No VC for now due to lack of JS data source: %{public}@", buf, 0xCu);
  }

  v6[2](v6, 0);
LABEL_23:
}

- (void)startJavascriptAppWithLibrary:(id)a3 libraryItemStateProvider:(id)a4 downloadProgressCenter:(id)a5 serviceCenter:(id)a6 storeController:(id)a7 engagementManager:(id)a8 jetActionHandler:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = JSALog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Starting JS App", buf, 2u);
  }

  [(BKAppSceneManager *)self setServiceCenter:v19];
  kdebug_trace();
  v24 = +[BSUITemplate manager];
  v25 = [v24 dynamicRegistry];
  v26 = [v21 stateCenter];

  [v25 registerStateProvider:v26 forKind:@"libraryItem"];
  id v27 = [v24 resourceRegistry];
  v28 = +[BKCoverResourceProvider sharedInstance];
  [v27 registerImageProvider:v28 forKind:@"libraryItem"];

  v29 = [v24 resourceRegistry];
  v30 = [(BKAppSceneManager *)self minifiedFlowController];
  id v31 = [v30 currentBookProvider];
  [v29 registerImageProvider:v31 forKind:@"currentBookSnapshot"];

  id v32 = [v24 dynamicRegistry];
  [v32 registerProgressProvider:v20 forKind:@"downloadProgress"];

  id v33 = [v24 dynamicRegistry];
  v34 = objc_alloc_init(BKLibraryAudiobookProgressCenter);
  [v33 registerProgressProvider:v34 forKind:@"audiobookProgress"];

  kdebug_trace();
  [(BKAppSceneManager *)self _setupURLHandler];
  v35 = +[JSABridge sharedInstance];
  v36 = [(BKAppSceneManager *)self classRegistrations];
  [v35 bootstrapWithObjectRegistrations:v36];

  v37 = [[BKJSAAppWindowProvider alloc] initWithSceneManager:self];
  [(BKAppSceneManager *)self setWindowProvider:v37];

  id v38 = [[BKJSALibraryManager alloc] initWithLibraryAssetProvider:v22 presentersProvider:self storeController:v18];
  [(BKAppSceneManager *)self setJsaLibraryManager:v38];

  [(BKAppSceneManager *)self setEngagementManager:v17];
  [(BKAppSceneManager *)self setJetActionHandler:v16];

  __int16 v39 = +[JSABridge sharedInstance];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10000E5F8;
  v41[3] = &unk_100A43D60;
  v41[4] = self;
  [v39 initializeEnvironmentWithDataSource:self completion:v41];

  id v40 = +[NSNotificationCenter defaultCenter];
  [v40 addObserver:self selector:"_bridgeDidReload:" name:JSABridgeDidReloadNotification object:0];
}

- (id)objectRegistrationsForBridge:(id)a3
{
  v4 = [BKJSAAppController alloc];
  id v5 = [(BKAppSceneManager *)self jetActionHandler];
  id v6 = [(BKJSAAppController *)v4 initWithSceneManager:self jetActionHandler:v5];

  id v7 = [(BKAppSceneManager *)self minifiedPresenter];
  v37 = [v7 currentBookProvider];

  v36 = [(BKAppSceneManager *)self jsaLibraryManager];
  id v8 = [(BKAppSceneManager *)self serviceCenter];
  id v9 = [v8 priceTrackingService];

  uint64_t v10 = [(BKAppSceneManager *)self serviceCenter];
  v35 = [v10 readingActivityService];

  uint64_t v11 = +[BCRCDataContainer defaultContainer];
  unsigned int v12 = [(BKAppSceneManager *)self serviceCenter];
  v34 = [v12 yearInReviewEligibilityService];

  id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v15 = dispatch_queue_create("TransactionController+JS.workQueue", v14);

  dispatch_queue_t v33 = v15;
  id v16 = [objc_alloc((Class)TUITransactionController) initWithQueue:v15];
  id v17 = objc_alloc_init(BKBookRecommendationProvider);
  id v18 = objc_alloc_init(BKGenreRecommendationProvider);
  id v19 = objc_alloc_init(BKMediaTypeRecommendationProvider);
  id v32 = +[BKTVAppService shared];
  if (!v6 || !v37 || !v36 || !v9 || !v35 || !v11 || !v16 || !v17 || !v18 || !v19 || !v34)
  {
    id v20 = JSALog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138414082;
      v41 = v6;
      __int16 v42 = 2112;
      v43 = v37;
      __int16 v44 = 2112;
      v45 = v36;
      __int16 v46 = 2112;
      v47 = v9;
      __int16 v48 = 2112;
      v49 = v35;
      __int16 v50 = 2112;
      uint64_t v51 = v11;
      __int16 v52 = 2112;
      id v53 = v16;
      __int16 v54 = 2112;
      v55 = v34;
      _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Some of the JS native objects are nil. appController: %@, currentBookProvider: %@, jsaLibraryManager: %@,, priceTrackingService: %@ readingActivityService: %@, remoteConfigDataContainer: %@, transactionController: %@, yearInReviewEligibilityService: %@", buf, 0x52u);
    }
  }
  v38[0] = @"appController";
  v38[1] = @"bookRecommendationProvider";
  v39[0] = v6;
  v39[1] = v17;
  v39[2] = v37;
  v38[2] = @"currentBookProvider";
  v38[3] = @"engagementEventController";
  [(BKAppSceneManager *)self engagementManager];
  id v21 = v19;
  id v22 = v28 = v19;
  [v22 eventController];
  v23 = id v31 = v6;
  v39[3] = v23;
  v39[4] = v18;
  v30 = v18;
  v38[4] = @"genreRecommendationProvider";
  v38[5] = @"libraryInterface";
  v39[5] = v36;
  v39[6] = v21;
  v38[6] = @"mediaTypeRecommendationProvider";
  v38[7] = @"priceTrackingService";
  v39[7] = v9;
  v39[8] = v35;
  v38[8] = @"readingActivityStateProvider";
  v38[9] = @"remoteConfigDataContainer";
  v39[9] = v11;
  v38[10] = @"sessionDonor";
  [(BKAppSceneManager *)self engagementManager];
  v24 = v29 = (void *)v11;
  v25 = [v24 sessionDonor];
  v39[10] = v25;
  v39[11] = v16;
  v38[11] = @"transactionController";
  v38[12] = @"TVAppService";
  v38[13] = @"yearInReviewEligibilityService";
  v39[12] = v32;
  v39[13] = v34;
  v26 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:14];

  return v26;
}

- (BKServiceCenter)serviceCenter
{
  return self->_serviceCenter;
}

- (BKEngagementManager)engagementManager
{
  return self->_engagementManager;
}

- (id)mainFlowController
{
  objc_opt_class();
  id v3 = [(BKAppSceneManager *)self primarySceneController];
  v4 = BUDynamicCast();

  id v5 = [v4 mainFlowController];

  return v5;
}

- (id)primarySceneController
{
  v2 = [(BKAppSceneManager *)self sceneFlowController];
  id v3 = [v2 primarySceneController];

  return v3;
}

- (BKSceneFlowController)sceneFlowController
{
  return self->_sceneFlowController;
}

- (void)requestTabBarSceneController:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppSceneManager *)self sceneFlowController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100051510;
  v7[3] = &unk_100A481C0;
  id v8 = v4;
  id v6 = v4;
  [v5 requestTabBarSceneController:v7];
}

- (id)flowControllers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(BKAppSceneManager *)self sceneFlowController];
  if (v4) {
    [v3 addObject:v4];
  }

  id v5 = [(BKAppSceneManager *)self storeFlowController];
  if (v5) {
    [v3 addObject:v5];
  }

  id v6 = [(BKAppSceneManager *)self minifiedFlowController];
  if (v6) {
    [v3 addObject:v6];
  }

  id v7 = [(BKAppSceneManager *)self bookFlowController];
  if (v7) {
    [v3 addObject:v7];
  }

  id v8 = [(BKAppSceneManager *)self libraryCollectionsFlowController];
  if (v8) {
    [v3 addObject:v8];
  }

  id v9 = [(BKAppSceneManager *)self jetActionHandler];
  if (v9) {
    [v3 addObject:v9];
  }

  return v3;
}

- (BKJSStoreFlowController)storeFlowController
{
  storeFlowController = self->_storeFlowController;
  if (!storeFlowController)
  {
    id v4 = objc_alloc_init(BKJSStoreFlowController);
    id v5 = self->_storeFlowController;
    self->_storeFlowController = v4;

    storeFlowController = self->_storeFlowController;
  }

  return storeFlowController;
}

- (BKMinifiedFlowController)minifiedFlowController
{
  return self->_minifiedFlowController;
}

- (BKLibraryCollectionsFlowController)libraryCollectionsFlowController
{
  libraryCollectionsFlowController = self->_libraryCollectionsFlowController;
  if (!libraryCollectionsFlowController)
  {
    id v4 = [BKLibraryCollectionsFlowController alloc];
    id v5 = +[BKLibraryManager defaultManager];
    id v6 = [(BKLibraryCollectionsFlowController *)v4 initWithLibraryAssetProvider:v5];
    id v7 = self->_libraryCollectionsFlowController;
    self->_libraryCollectionsFlowController = v6;

    libraryCollectionsFlowController = self->_libraryCollectionsFlowController;
  }

  return libraryCollectionsFlowController;
}

- (BSUIJetActionHandling)jetActionHandler
{
  return self->_jetActionHandler;
}

- (BKBookFlowController)bookFlowController
{
  bookFlowController = self->_bookFlowController;
  if (!bookFlowController)
  {
    id v4 = [BKBookFlowController alloc];
    id v5 = +[BKLibraryManager defaultManager];
    id v6 = [(BKBookFlowController *)v4 initWithLibraryAssetProvider:v5];
    id v7 = self->_bookFlowController;
    self->_bookFlowController = v6;

    id v8 = [(BKAppSceneManager *)self sceneFlowController];
    [(BKBookFlowController *)self->_bookFlowController setSceneHosting:v8];

    id v9 = [(BKAppSceneManager *)self minifiedFlowController];
    [(BKBookFlowController *)self->_bookFlowController setMinifiedPresenter:v9];

    uint64_t v10 = [(BKAppSceneManager *)self storePresenter];
    [(BKBookFlowController *)self->_bookFlowController setStorePresenter:v10];

    bookFlowController = self->_bookFlowController;
  }

  return bookFlowController;
}

- (id)currentSceneController
{
  v2 = [(BKAppSceneManager *)self sceneFlowController];
  id v3 = [v2 currentSceneController];

  return v3;
}

- (id)navigationControllerForItem:(id)a3
{
  id v4 = a3;
  [v4 isLibraryCollection];
  id v5 = objc_opt_new();
  [v5 setDelegate:self];
  [v5 setIsRoot:1];
  id v6 = [(BKAppSceneManager *)self primarySceneController];
  id v7 = [v6 bk_window];

  id v8 = [v7 rootViewController];
  id v9 = [v8 ba_effectiveAnalyticsTracker];
  uint64_t v10 = [v4 suggestedTrackerName];
  uint64_t v11 = [v9 chainWithName:v10];

  [v5 ba_setAnalyticsTracker:v11];
  unsigned int v12 = [v4 identifier];

  int64_t v13 = +[BKRootBarItemsProvider tabTypeFor:v12];
  [v11 pushTabDataWithType:v13 file:@"/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAppSceneManager+BKTabBarControllerJSApp.m" line:202];

  return v5;
}

- (void)routeScene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(BKAppSceneManager *)self sceneFlowController];
  [v11 routeScene:v10 willConnectToSession:v9 options:v8];

  unsigned int v12 = [(BKAppSceneManager *)self launchCoordinator];
  LOBYTE(v10) = [v12 appLaunchCoordinatorIsConditionSatisfied:6];

  if ((v10 & 1) == 0)
  {
    id v13 = [(BKAppSceneManager *)self launchCoordinator];
    [v13 signalConditionSatisfied:6];
  }
}

- (BKAppLaunchCoordinator)launchCoordinator
{
  return self->_launchCoordinator;
}

- (BOOL)shouldOpenLastBook
{
  if ([UIApp launchedToTest])
  {
    LOBYTE(v3) = +[BCPPTConfig extendedLaunchTestDestinationIsBook];
  }
  else
  {
    id v4 = +[BKAppDelegate delegate];
    if ([v4 suppressOpenLastBook])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      id v5 = [(BKAppSceneManager *)self primarySceneController];
      unsigned int v3 = [v5 willAttemptBookReopen] ^ 1;
    }
  }
  return v3;
}

- (id)rootBarCoordinatorForSceneController:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppSceneManager *)self rootBarCoordinator];

  if (!v5)
  {
    id v6 = [BKRootBarCoordinator alloc];
    id v7 = [(BKAppSceneManager *)self viewControllerProvider];
    id v8 = [(BKRootBarCoordinator *)v6 initWithSceneController:v4 presentersProvider:self viewControllerProvider:v7];
    [(BKAppSceneManager *)self setRootBarCoordinator:v8];

    id v9 = +[JSABridge sharedInstance];
    +[JSAMetricsAppLaunchEvent updateRequiredBlockingBagLoad:0];
  }
  id v10 = [(BKAppSceneManager *)self rootBarCoordinator];

  return v10;
}

- (BKRootBarCoordinating)rootBarCoordinator
{
  return self->_rootBarCoordinator;
}

- (id)windowProviderForBridge:(id)a3
{
  return [(BKAppSceneManager *)self windowProvider];
}

- (BKJSAAppWindowProvider)windowProvider
{
  return self->_windowProvider;
}

- (BKWelcomePresenting)welcomePresenter
{
  return self->_welcomePresenter;
}

- (BCTransactionQueue)userTransactionQueue
{
  return self->_userTransactionQueue;
}

- (OS_dispatch_queue)urlHandlingQueue
{
  return self->_urlHandlingQueue;
}

- (void)setWindowProvider:(id)a3
{
}

- (void)setWelcomePresenter:(id)a3
{
}

- (void)setUrlHandler:(id)a3
{
}

- (void)setTabsAreLoaded:(BOOL)a3
{
  self->_tabsAreLoaded = a3;
}

- (void)setServiceCenter:(id)a3
{
}

- (void)setRootBarCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_rootBarCoordinator, a3);

  [(BKAppSceneManager *)self _setupMinibarContainerView];
}

- (void)setPushLargeCoverForNextHandleURLBookOpen:(BOOL)a3
{
  self->_pushLargeCoverForNextHandleURLBookOpen = a3;
}

- (void)setPendingCriticalAlertAssertion:(id)a3
{
}

- (void)setJsaLibraryManager:(id)a3
{
}

- (void)setJetActionHandler:(id)a3
{
}

- (void)setInitialUserTransaction:(id)a3
{
}

- (void)setEngagementManager:(id)a3
{
}

- (BUAssertion)pendingCriticalAlertAssertion
{
  return self->_pendingCriticalAlertAssertion;
}

- (id)newTransactionWithName:(id)a3 originatingSceneController:(id)a4 targetSceneDescriptor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(BKAppSceneManager *)self userTransactionQueue];
  id v12 = [v11 newTransactionWithName:v10 info:0 context:0 originatingSceneController:v9 targetSceneDescriptor:v8];

  return v12;
}

- (id)newShowURLTransactionWithOriginatingSceneController:(id)a3 targetSceneDescriptor:(id)a4
{
  return [(BKAppSceneManager *)self newTransactionWithName:BCTransactionNameShowURL originatingSceneController:a3 targetSceneDescriptor:a4];
}

- (id)minifiedFlowControllerPresentedAssetID:(id)a3
{
  id v4 = [(BKAppSceneManager *)self primarySceneController];
  id v5 = [(BKAppSceneManager *)self bookFlowController];
  id v6 = [v5 bookPresenterCurrentlyOpenBookForSingleScene:v4];
  id v7 = [v6 assetPresenterAssetID];

  return v7;
}

- (id)minifiedFlowControllerMinibarContainingViewController
{
  v2 = [(BKAppSceneManager *)self rootBarCoordinator];
  unsigned int v3 = [v2 rootViewController];

  return v3;
}

- (id)mainLibrary
{
  return +[BKLibraryManager defaultManager];
}

- (BKJSALibraryManager)jsaLibraryManager
{
  return self->_jsaLibraryManager;
}

- (BKAppSceneManager)initWithLaunchCoordinator:(id)a3 importCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)BKAppSceneManager;
  id v9 = [(BKAppSceneManager *)&v33 init];
  if (v9)
  {
    id v10 = objc_alloc_init(BKCriticalAlertCoordinator);
    criticalAlertCoordinator = v9->_criticalAlertCoordinator;
    v9->_criticalAlertCoordinator = (BKCriticalAlertCoordinating *)v10;

    id v12 = [[BKSceneFlowController alloc] initWithLaunchCoordinator:v7 criticalAlertCoordinator:v9->_criticalAlertCoordinator];
    sceneFlowController = v9->_sceneFlowController;
    v9->_sceneFlowController = v12;

    uint64_t v14 = objc_alloc_init(BKMinifiedFlowController);
    minifiedFlowController = v9->_minifiedFlowController;
    v9->_minifiedFlowController = v14;

    id v16 = [(BKAppSceneManager *)v9 sceneFlowController];
    [(BKMinifiedFlowController *)v9->_minifiedFlowController setSceneHosting:v16];

    [(BKMinifiedFlowController *)v9->_minifiedFlowController setDelegate:v9];
    objc_storeStrong((id *)&v9->_launchCoordinator, a3);
    objc_storeStrong((id *)&v9->_importCoordinator, a4);
    id v17 = (BCTransactionQueue *)+[BCTransactionQueue newWithOptions:1 queue:&_dispatch_main_q];
    userTransactionQueue = v9->_userTransactionQueue;
    v9->_userTransactionQueue = v17;

    id v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v20 = dispatch_queue_attr_make_initially_inactive(v19);
    dispatch_queue_t v21 = dispatch_queue_create("BKAppSceneManager.urlHandlingQueue", v20);
    urlHandlingQueue = v9->_urlHandlingQueue;
    v9->_urlHandlingQueue = (OS_dispatch_queue *)v21;

    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v9 selector:"_applicationDidBecomeActiveNotification:" name:UIApplicationDidBecomeActiveNotification object:0];

    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v9 selector:"_applicationWillResignActiveNotification:" name:UIApplicationWillResignActiveNotification object:0];

    *(_WORD *)&v9->_pushLargeCoverForInitialHandleURLBookOpen = 257;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100078568;
    block[3] = &unk_100A43D60;
    v25 = v9;
    id v32 = v25;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    v26 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingWelcomePresenterDismissCompletionBlocks = v25->_pendingWelcomePresenterDismissCompletionBlocks;
    v25->_pendingWelcomePresenterDismissCompletionBlocks = v26;

    v28 = +[BURestrictionsProvider sharedInstance];
    [v28 addObserver:v25];

    v29 = +[NSNotificationCenter defaultCenter];
    [v29 addObserver:v25 selector:"_afterSceneWillConnect:" name:UISceneWillConnectNotification object:0];
  }
  return v9;
}

- (void)enumerateSceneController:(id)a3 includeHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BKAppSceneManager *)self sceneFlowController];
  [v7 enumerateSceneController:v6 includeHidden:v4];
}

- (BKCriticalAlertCoordinating)criticalAlertCoordinator
{
  return self->_criticalAlertCoordinator;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKAppSceneManager *)self sceneFlowController];
  [v8 application:v7 didDiscardSceneSessions:v6];
}

- (BKAppStoreReviewManager)appStoreReviewManager
{
  appStoreReviewManager = self->_appStoreReviewManager;
  if (!appStoreReviewManager)
  {
    BOOL v4 = objc_alloc_init(BKAppStoreReviewManager);
    id v5 = self->_appStoreReviewManager;
    self->_appStoreReviewManager = v4;

    appStoreReviewManager = self->_appStoreReviewManager;
  }

  return appStoreReviewManager;
}

- (void)analyticsVisibilityUpdate
{
}

- (id)_welcomeItems
{
  v2 = objc_opt_new();
  unsigned int v3 = objc_alloc_init(BKWelcomeGDPRItem);
  [v2 addObject:v3];

  BOOL v4 = objc_alloc_init(BKWelcomeNotificationWarmingItem);
  [v2 addObject:v4];

  return v2;
}

- (void)_showMainViewController
{
  unsigned int v3 = BCSceneLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_showMainViewController", buf, 2u);
  }

  kdebug_trace();
  unsigned __int8 v4 = [(BKWelcomeScreenManager *)self->_welcomeScreenManager didShowWelcome];
  id v5 = [(BKAppSceneManager *)self launchCoordinator];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000A6E8;
  v6[3] = &unk_100A46710;
  v6[4] = self;
  unsigned __int8 v7 = v4;
  [v5 signalConditionSatisfied:2 notifyWithTimeout:@"showMainViewController" blockID:v6 block:3.0];
}

- (void)_showMainViewControllerOrWelcomeScreen
{
  if (self->_welcomeScreenManager)
  {
    [(BKAppSceneManager *)self _showMainViewControllerOrWelcomeScreenNow];
  }
  else
  {
    unsigned int v3 = [(BKAppSceneManager *)self launchCoordinator];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1001CD84C;
    v4[3] = &unk_100A44268;
    v4[4] = self;
    [v3 appLaunchCoordinatorOnConditionMask:2112 blockID:@"_showMainViewControllerOrWelcomeScreen" performBlock:v4];
  }
}

- (void)_showMainViewControllerOrWelcomeScreenNow
{
  unsigned int v3 = BCSceneLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_showMainViewControllerOrWelcomeScreenNow", buf, 2u);
  }

  kdebug_trace();
  welcomeScreenManager = self->_welcomeScreenManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F174;
  v5[3] = &unk_100A4A968;
  v5[4] = self;
  [(BKWelcomeScreenManager *)welcomeScreenManager runWithCompletion:v5];
}

- (void)_setupWelcomeScreenWithPresenterIfNeeded:(id)a3
{
  id v4 = a3;
  if (!self->_welcomeScreenManager)
  {
    id v5 = [(BKAppSceneManager *)self launchCoordinator];
    unsigned __int8 v6 = [v5 appLaunchCoordinatorIsConditionSatisfied:2];

    if ((v6 & 1) == 0)
    {
      unsigned __int8 v7 = BCSceneLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_setupWelcomeScreenWithPresenterIfNeeded: welcomePresenter: %{public}@", buf, 0xCu);
      }

      id v8 = +[UIApplication sharedApplication];
      BOOL v9 = [v8 userInterfaceLayoutDirection] == (id)1;

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100023AA8;
      v12[3] = &unk_100A4A940;
      v12[4] = self;
      BOOL v14 = v9;
      id v13 = v4;
      id v10 = objc_retainBlock(v12);
      uint64_t v11 = [(BKAppSceneManager *)self _welcomeItems];
      ((void (*)(void *, void *))v10[2])(v10, v11);
    }
  }
}

- (void)_setupMinibarContainerView
{
  unsigned int v3 = [(BKAppSceneManager *)self launchCoordinator];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100026DDC;
  v4[3] = &unk_100A44268;
  v4[4] = self;
  [v3 appLaunchCoordinatorOnConditionMask:65 blockID:@"_setupMinibarContainerView" performBlock:v4];
}

- (void)_setWelcomePresenterIfNoneExists:(id)a3 shouldPresent:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  unsigned __int8 v6 = [(BKAppSceneManager *)self welcomePresenter];

  if (!v6)
  {
    [(BKAppSceneManager *)self setWelcomePresenter:v9];
    if (v4)
    {
      unsigned __int8 v7 = [(BKAppSceneManager *)self welcomePresenter];
      id v8 = [(BKWelcomeScreenManager *)self->_welcomeScreenManager navigationController];
      [v7 presentWelcomeViewController:v8 completion:0];
    }
  }
}

- (void)_setCurrentWelcomePresenterIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(BKAppSceneManager *)self _isRunningWelcomeFlow])
  {
    id v5 = [(BKAppSceneManager *)self welcomePresenter];

    if (v5 != v4)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1001CD7BC;
      v6[3] = &unk_100A43DD8;
      v6[4] = self;
      id v7 = v4;
      [(BKAppSceneManager *)self _enqueueDismissWelcomePresenter:v6];
    }
  }
}

- (id)_lastKnownStateRestorationUserInfoForSceneSession:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppSceneManager *)self sceneFlowController];
  unsigned __int8 v6 = [v5 _lastKnownStateRestorationUserInfoForSceneSession:v4];

  return v6;
}

- (BOOL)_isRunningWelcomeFlow
{
  if (self->_welcomeScreenManager)
  {
    v2 = [(BKAppSceneManager *)self launchCoordinator];
    unsigned int v3 = [v2 appLaunchCoordinatorIsConditionSatisfied:2] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000785F4;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_afterSceneWillConnect:(id)a3
{
  unsigned int v3 = [a3 object];
  id v4 = [v3 session];
  id v5 = [v4 persistentIdentifier];

  unsigned __int8 v6 = BCSceneLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v3 delegate];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_afterSceneWillConnect: sceneIdentifier: %{public}@, sceneDelegate: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_bagDidUpdate:(id)a3
{
  id v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    unsigned __int8 v6 = "-[BKAppSceneManager(BKTabBarControllerJSApp) _bagDidUpdate:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s Reloading RootBarItems due to bag change", (uint8_t *)&v5, 0xCu);
  }

  [(BKAppSceneManager *)self reloadStandardItemsWithAnimated:1 completion:&stru_100A47ED8];
}

- (void)restrictionsForBookStoreAllowedChanged:(BOOL)a3
{
  id v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    unsigned __int8 v6 = "-[BKAppSceneManager(BKTabBarControllerJSApp) restrictionsForBookStoreAllowedChanged:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s Reloading RootBarItems due to BookStore restriction change", (uint8_t *)&v5, 0xCu);
  }

  [(BKAppSceneManager *)self reloadStandardItemsWithAnimated:1 completion:&stru_100A47EF8];
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(BKAppSceneManager *)self _primarySceneControllerObject];
  BOOL v14 = [v13 mainFlowController];
  dispatch_queue_t v15 = [v14 navigationController:v12 animationControllerForOperation:a4 fromViewController:v11 toViewController:v10];

  return v15;
}

- (void)requestAccountInfoScene
{
  id v2 = [(BKAppSceneManager *)self sceneFlowController];
  [v2 requestAccountScene:0];
}

- (void)handleApplicationURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 likelyUserInitiated:(id)a6 transaction:(id)a7
{
  BYTE2(v7) = 1;
  LOWORD(v7) = 0;
  -[BKAppSceneManager handleApplicationURL:sourceApplication:annotation:likelyUserInitiated:canImport:openAfterImport:importInPlace:showLibraryAllCollection:switchToLibrary:transaction:completion:](self, "handleApplicationURL:sourceApplication:annotation:likelyUserInitiated:canImport:openAfterImport:importInPlace:showLibraryAllCollection:switchToLibrary:transaction:completion:", a3, a4, a5, a6, 0, 1, v7, a7, 0);
}

- (void)handleApplicationURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 likelyUserInitiated:(id)a6 canImport:(BOOL)a7 openAfterImport:(BOOL)a8 importInPlace:(BOOL)a9 showLibraryAllCollection:(BOOL)a10 switchToLibrary:(BOOL)a11 transaction:(id)a12 completion:(id)a13
{
  id v31 = a3;
  id v30 = a4;
  id v27 = a5;
  id v24 = a6;
  id v25 = a12;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10014EF54;
  v48[3] = &unk_100A48430;
  id v32 = a13;
  id v49 = v32;
  id v17 = objc_retainBlock(v48);
  objc_initWeak(&location, self);
  id v18 = [(BKAppSceneManager *)self urlHandlingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014EFD0;
  block[3] = &unk_100A484D0;
  objc_copyWeak(&v41, &location);
  id v34 = v31;
  id v35 = v30;
  id v36 = v27;
  id v37 = v25;
  BOOL v42 = a7;
  BOOL v43 = a8;
  BOOL v44 = a9;
  BOOL v45 = a10;
  BOOL v46 = a11;
  id v38 = self;
  id v39 = v24;
  id v40 = v17;
  id v29 = v24;
  id v19 = v17;
  id v20 = v25;
  id v21 = v27;
  id v22 = v30;
  id v23 = v31;
  dispatch_async(v18, block);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

- (void)handleImportURLs:(id)a3 transaction:(id)a4 perURLCompletion:(id)a5 completion:(id)a6
{
}

- (void)handleImportURLs:(id)a3 openAfterImport:(BOOL)a4 importInPlace:(BOOL)a5 showLibraryAllCollection:(BOOL)a6 switchToLibrary:(BOOL)a7 transaction:(id)a8 perURLCompletion:(id)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = [(BKAppSceneManager *)self urlHandlingQueue];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10014F9FC;
  v25[3] = &unk_100A48520;
  id v26 = v16;
  id v27 = self;
  BOOL v31 = a7;
  BOOL v32 = a6;
  BOOL v33 = a4;
  BOOL v34 = a5;
  id v28 = v17;
  id v29 = v18;
  id v30 = v19;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  dispatch_async(v20, v25);
}

+ (NSArray)supportedFileImportTypes
{
  if (qword_100B4A488 != -1) {
    dispatch_once(&qword_100B4A488, &stru_100A48540);
  }
  id v2 = (void *)qword_100B4A480;

  return (NSArray *)v2;
}

+ (NSArray)supportedAudiobookImportTypes
{
  if (qword_100B4A498 != -1) {
    dispatch_once(&qword_100B4A498, &stru_100A48560);
  }
  id v2 = (void *)qword_100B4A490;

  return (NSArray *)v2;
}

+ (NSArray)supportedAudibleImportTypes
{
  if (qword_100B4A4A8 != -1) {
    dispatch_once(&qword_100B4A4A8, &stru_100A48580);
  }
  id v2 = (void *)qword_100B4A4A0;

  return (NSArray *)v2;
}

- (id)_audibleURLsInURLs:(id)a3
{
  id v3 = a3;
  id v23 = +[NSMutableArray array];
  NSURLResourceKey v45 = NSURLContentTypeKey;
  id v4 = +[NSArray arrayWithObjects:&v45 count:1];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v34;
    *(void *)&long long v6 = 141558530;
    long long v22 = v6;
    uint64_t v24 = *(void *)v34;
    id v25 = v4;
    do
    {
      id v9 = 0;
      id v26 = v7;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v9);
        unsigned int v11 = [v10 startAccessingSecurityScopedResource:v22];
        id v32 = 0;
        id v12 = [v10 resourceValuesForKeys:v4 error:&v32];
        id v13 = v32;
        if (v13)
        {
          BOOL v14 = BKLibraryBookImportLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            uint64_t v39 = 1752392040;
            __int16 v40 = 2112;
            id v41 = v10;
            __int16 v42 = 2112;
            id v43 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "_audibleURLsinURLs: resourceValuesForKeys failed. url: %{mask.hash}@ error: %@", buf, 0x20u);
          }
        }
        else
        {
          BOOL v14 = [v12 objectForKeyedSubscript:NSURLContentTypeKey];
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          dispatch_queue_t v15 = +[BKAppSceneManager supportedAudibleImportTypes];
          id v16 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v29;
            while (2)
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v29 != v18) {
                  objc_enumerationMutation(v15);
                }
                if ([v14 conformsToType:*(void *)(*((void *)&v28 + 1) + 8 * i)])
                {
                  [v23 addObject:v10];
                  goto LABEL_19;
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
LABEL_19:

          uint64_t v8 = v24;
          id v4 = v25;
          id v7 = v26;
        }

        if (v11) {
          [v10 stopAccessingSecurityScopedResource];
        }

        id v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
    }
    while (v7);
  }

  id v20 = [v23 copy];

  return v20;
}

- (id)_findImportEligibleURLsAtURL:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  id v5 = [v3 startAccessingSecurityScopedResource];
  int v6 = (int)v5;
  if (sub_10015095C((uint64_t)v5, v3))
  {
    [v4 addObject:v3];
  }
  else if (objc_msgSend(v3, "bu_isFolder"))
  {
    id v7 = +[NSFileManager defaultManager];
    uint64_t v8 = [v7 enumeratorAtURL:v3 includingPropertiesForKeys:&__NSArray0__struct options:2 errorHandler:&stru_100A485C0];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          [v14 startAccessingSecurityScopedResource:v19];
          int v16 = (int)v15;
          if (sub_10015095C((uint64_t)v15, v14)) {
            [v4 addObject:v14];
          }
          if (v16) {
            [v14 stopAccessingSecurityScopedResource];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
  }
  if (v6) {
    [v3 stopAccessingSecurityScopedResource];
  }
  id v17 = [v4 copy:v19];

  return v17;
}

- (void)_openExternalURL:(id)a3 sourceApplication:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (v16)
  {
    id v7 = [v16 scheme];
    uint64_t v8 = [v7 lowercaseString];

    if (v8
      && (([v8 isEqualToString:@"itms-books"] & 1) != 0
       || ([v8 isEqualToString:@"itms-bookss"] & 1) != 0
       || ([v8 isEqualToString:@"ibooks"] & 1) != 0
       || ([v8 isEqualToString:@"prefs"] & 1) != 0))
    {
      if (![v6 isEqualToString:@"com.apple.iBooks.BooksWidget"])
      {
LABEL_13:

        goto LABEL_14;
      }
      id v9 = +[LSApplicationWorkspace defaultWorkspace];
      [v9 openSensitiveURL:v16 withOptions:0];
    }
    else
    {
      id v10 = [(BKAppSceneManager *)self currentSceneController];
      id v9 = [v10 bk_window];

      if (!v9) {
        BCReportAssertionFailureWithMessage();
      }
      id v11 = [v9 rootViewController];
      uint64_t v12 = [v11 bc_deepestVisibleChildViewControllerIncludePresented:1];

      id v13 = [v12 ba_effectiveAnalyticsTracker];
      BOOL v14 = +[BAEventReporter sharedReporter];
      [v14 emitExitLinkTapEventWithTracker:v13 url:v16];

      id v15 = +[UIApplication sharedApplication];
      [v15 openURL:v16 options:&__NSDictionary0__struct completionHandler:0];
    }
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_bridgeDidReload:(id)a3
{
  id v3 = +[BRCConfigurationManager sharedInstance];
  [v3 resetForJavascript];

  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  id v5 = dispatch_get_global_queue(9, 0);
  dispatch_after(v4, v5, &stru_100A48628);
}

- (id)appGroupIdentifierForBridge:(id)a3
{
  id v3 = +[BUAppGroup books];
  dispatch_time_t v4 = [v3 identifier];

  return v4;
}

- (void)dealloc
{
  id v3 = [(BKAppSceneManager *)self pendingCriticalAlertAssertion];
  [v3 invalidate];

  dispatch_time_t v4 = +[BURestrictionsProvider sharedInstance];
  [v4 removeObserver:self];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  dispatch_activate((dispatch_object_t)self->_urlHandlingQueue);
  id v6 = +[BKReachability sharedReachabilityForInternetConnection];
  [v6 stopNotifier];

  id v7 = [(BKAppSceneManager *)self bookFlowController];
  [v7 setStorePresenter:0];

  uint64_t v8 = [(BKAppSceneManager *)self bookFlowController];
  [v8 setMinifiedPresenter:0];

  v9.receiver = self;
  v9.super_class = (Class)BKAppSceneManager;
  [(BKAppSceneManager *)&v9 dealloc];
}

- (id)newShowAssetTransactionWithOriginatingSceneController:(id)a3 targetSceneDescriptor:(id)a4
{
  return [(BKAppSceneManager *)self newTransactionWithName:BCTransactionNameShowAsset originatingSceneController:a3 targetSceneDescriptor:a4];
}

- (id)defaultSceneControllerForTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppSceneManager *)self sceneFlowController];
  id v6 = [v5 defaultSceneControllerForTransaction:v4];

  return v6;
}

- (id)anySceneController
{
  id v2 = [(BKAppSceneManager *)self sceneFlowController];
  id v3 = [v2 anySceneController];

  return v3;
}

- (id)sceneControllerForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppSceneManager *)self sceneFlowController];
  id v6 = [v5 sceneControllerForViewController:v4];

  return v6;
}

- (id)sceneControllerForWindow:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppSceneManager *)self sceneFlowController];
  id v6 = [v5 sceneControllerForWindow:v4];

  return v6;
}

- (void)enumerateSceneInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppSceneManager *)self sceneFlowController];
  [v5 enumerateSceneInfo:v4];
}

- (void)requestPrimaryScene:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppSceneManager *)self sceneFlowController];
  [v5 requestPrimaryScene:v4];
}

- (void)forceTransaction:(id)a3 ontoPrimarySceneWithContinuation:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001CB594;
  v8[3] = &unk_100A48120;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(BKAppSceneManager *)self requestPrimaryScene:v8];
}

- (void)requestBookSceneWithAssetID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKAppSceneManager *)self sceneFlowController];
  [v8 requestBookSceneWithAssetID:v7 completion:v6];
}

- (void)requestSceneWithAssetID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKAppSceneManager *)self sceneFlowController];
  [v8 requestSceneWithAssetID:v7 completion:v6];
}

- (void)requestEndOfBookSceneWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKAppSceneManager *)self sceneFlowController];
  [v8 requestEndOfBookSceneWithOptions:v7 completion:v6];
}

- (void)requestPrimaryOrBookScene:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppSceneManager *)self sceneFlowController];
  [v5 requestPrimaryOrBookScene:v4];
}

- (id)newBookSceneControllerProviderWithRequestAssetID:(id)a3
{
  id v4 = a3;
  id v5 = [[_BKBookSceneControllerProvider alloc] initWithSceneManager:self requestAssetID:v4];

  return v5;
}

- (id)sceneInfoPresentingAssetID:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppSceneManager *)self sceneFlowController];
  id v6 = [v5 sceneInfoPresentingAssetID:v4];

  return v6;
}

- (void)destroySceneForAssetID:(id)a3
{
  id v5 = [(BKAppSceneManager *)self sceneInfoPresentingAssetID:a3];
  id v3 = +[BKSceneUtilities sharedInstance];
  id v4 = [v5 sceneSession];
  [v3 destroySceneWithSceneSession:v4 withAnimationType:1];
}

- (id)windowFromSceneType:(unint64_t)a3 assetID:(id)a4
{
  id v6 = a4;
  id v7 = [(BKAppSceneManager *)self sceneFlowController];
  id v8 = [v7 sceneControllerForSceneType:a3 assetID:v6];

  id v9 = [v8 bk_window];

  return v9;
}

- (void)saveStateClosing:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001CBA4C;
  v3[3] = &unk_100A4A740;
  BOOL v4 = a3;
  [(BKAppSceneManager *)self enumerateSceneController:v3 includeHidden:1];
}

- (void)analyticsForceEndSession
{
  [(BKAppSceneManager *)self enumerateSceneController:&stru_100A4A780 includeHidden:0];
  id v3 = [(BKAppSceneManager *)self minifiedPresenter];
  BOOL v4 = [v3 minifiedPresenterAssetCurrentPresenters];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) minifiedAssetPresenterAssetViewControllerFuture:v12];
        id v11 = [v10 getNonBlockingError:0];
        [v11 bc_analyticsSubtreeForceEndSession];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)analyticsVisibilityWillDisappear
{
}

- (void)analyticsVisibilityDidDisappear
{
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
}

- (void)carPlayScene:(id)a3 didConnectInterfaceController:(id)a4
{
  id v5 = [(BKAppSceneManager *)self launchCoordinator];
  unsigned __int8 v6 = [v5 appLaunchCoordinatorIsConditionSatisfied:8];

  if ((v6 & 1) == 0)
  {
    id v7 = [(BKAppSceneManager *)self launchCoordinator];
    [v7 signalConditionSatisfied:8];
  }
}

- (void)_didFinishSceneStateRestoration:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppSceneManager *)self sceneFlowController];
  [v5 _didFinishSceneStateRestoration:v4];
}

- (id)minifiedFlowControllerTabBarView
{
  return 0;
}

- (double)minifiedFlowControllerMinibarBottomGuideWithViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppSceneManager *)self rootBarCoordinator];
  unsigned __int8 v6 = [v5 hostingViewController];

  id v7 = [v6 view];
  [v7 bounds];
  double Height = CGRectGetHeight(v18);
  id v9 = [v6 view];
  [v9 safeAreaInsets];
  double v11 = v10;

  if (!v4)
  {
    long long v12 = [(BKAppSceneManager *)self rootBarCoordinator];
    id v4 = [v12 selectedTopViewController];
  }
  double MinY = Height - v11;
  objc_opt_class();
  BUDynamicCast();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  long long v15 = v14;
  if (v14 && (v14 == v4 || objc_msgSend(v14, "im_isAncestorOfChildViewController:", v4)))
  {
    id v16 = [v15 tabBar];
    [v16 frame];
    double MinY = CGRectGetMinY(v19);
  }
  return MinY;
}

- (void)minifiedFlowControllerRequestShowStoreForStoreID:(id)a3 fromViewController:(id)a4
{
  id v6 = a3;
  id v9 = [(BKAppSceneManager *)self sceneControllerForViewController:a4];
  id v7 = [v9 newShowURLTransaction];
  uint64_t v8 = [(BKAppSceneManager *)self storePresenter];
  [v8 storeShowBookWithStoreID:v6 resourceType:3 transaction:v7];
}

- (void)_sceneForReportingErrorWithContentType:(signed __int16)a3 assetID:(id)a4 completion:(id)a5
{
}

- (void)minifiedFlowControllerHandleAssetPresentationError:(id)a3 assetID:(id)a4 isRetry:(BOOL)a5
{
  BOOL v30 = a5;
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = sub_100007110;
  v56[4] = sub_100007264;
  id v57 = 0;
  long long v28 = +[BKLibraryManager defaultManager];
  id v9 = [v28 libraryAssetOnMainQueueWithAssetID:v8];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1001CC4E0;
  v52[3] = &unk_100A4A830;
  __int16 v54 = v56;
  objc_copyWeak(&v55, &location);
  id v10 = v8;
  id v53 = v10;
  double v11 = objc_retainBlock(v52);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1001CC7C0;
  v49[3] = &unk_100A44120;
  id v12 = v9;
  id v50 = v12;
  long long v29 = v11;
  id v51 = v29;
  long long v13 = objc_retainBlock(v49);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1001CCA70;
  v45[3] = &unk_100A4A8A0;
  v47 = &stru_100A4A850;
  id v14 = v7;
  id v46 = v14;
  long long v15 = v13;
  id v48 = v15;
  id v16 = objc_retainBlock(v45);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1001CCDE0;
  v39[3] = &unk_100A4A8F0;
  id v17 = v12;
  id v40 = v17;
  CGRect v18 = v16;
  id v42 = v18;
  id v43 = &stru_100A4A850;
  id v19 = v14;
  id v41 = v19;
  long long v20 = v15;
  id v44 = v20;
  long long v21 = objc_retainBlock(v39);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1001CD038;
  v38[3] = &unk_100A44688;
  v38[4] = v56;
  long long v22 = objc_retainBlock(v38);
  id v23 = BCSceneLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v60 = v10;
    __int16 v61 = 2112;
    id v62 = v19;
    __int16 v63 = 1024;
    BOOL v64 = v30;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Asset %@ did not open, error=%@ retry=%{BOOL}d.  Fetching scene controller", buf, 0x1Cu);
  }

  id v24 = [v17 contentType];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1001CD210;
  v31[3] = &unk_100A4A918;
  objc_copyWeak(&v36, &location);
  long long v35 = v56;
  id v25 = v19;
  id v32 = v25;
  BOOL v37 = v30;
  id v26 = v21;
  id v33 = v26;
  id v27 = v22;
  id v34 = v27;
  [(BKAppSceneManager *)self _sceneForReportingErrorWithContentType:v24 assetID:v10 completion:v31];

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v55);

  _Block_object_dispose(v56, 8);
  objc_destroyWeak(&location);
}

- (NSString)figaroPageContext
{
  id v2 = [(BKAppSceneManager *)self rootBarCoordinator];
  id v3 = [v2 selectedItem];

  if ([v3 isStandardItem]) {
    [v3 identifier];
  }
  else {
  id v4 = +[BKRootBarItemsProvider LibraryAllIdentifier];
  }

  return (NSString *)v4;
}

- (BOOL)isPresentingWelcome
{
  id v2 = [(BKAppSceneManager *)self welcomePresenter];
  unsigned __int8 v3 = [v2 welcomePresenterIsPresentingWelcome];

  return v3;
}

- (void)_enqueueDismissWelcomePresenter:(id)a3
{
  id v4 = a3;
  id v5 = BCSceneLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_enqueueDismissWelcomePresenter", buf, 2u);
  }

  id v6 = [(BKAppSceneManager *)self pendingWelcomePresenterDismissCompletionBlocks];
  id v7 = [v6 count];

  id v8 = [(BKAppSceneManager *)self pendingWelcomePresenterDismissCompletionBlocks];
  id v9 = objc_retainBlock(v4);

  [v8 addObject:v9];
  if (!v7)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001CD5BC;
    v17[3] = &unk_100A43D60;
    v17[4] = self;
    id v10 = objc_retainBlock(v17);
    double v11 = [(BKAppSceneManager *)self welcomePresenter];

    if (v11)
    {
      [(BKAppSceneManager *)self welcomePresenter];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1001CD708;
      v14[3] = &unk_100A44120;
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = v10;
      id v12 = v15;
      [v12 welcomePresenterFinishOngoingModalTransitionAnimations:v14];
    }
    else
    {
      long long v13 = objc_retainBlock(v10);
      id v12 = v13;
      if (v13) {
        ((void (*)(void *))v13[2])(v13);
      }
    }
  }
}

- (void)_welcomePresenterDidDisconnect:(id)a3
{
  id v5 = a3;
  if ([(BKAppSceneManager *)self _isRunningWelcomeFlow])
  {
    id v4 = [(BKAppSceneManager *)self welcomePresenter];

    if (v4 == v5) {
      [(BKAppSceneManager *)self _setCurrentWelcomePresenterIfNeeded:0];
    }
  }
}

- (void)attemptToPresentStoreReview
{
  unsigned __int8 v3 = +[BKAudiobookPlayer sharedInstance];
  id v4 = [v3 currentAudiobook];

  if (!v4)
  {
    id v9 = [(BKAppSceneManager *)self anySceneController];
    id v5 = +[BKAppDelegate delegate];
    id v6 = [v5 keyWindowAnalyticsTracker];

    id v7 = [(BKAppSceneManager *)self appStoreReviewManager];
    id v8 = [v9 scene];
    [v7 attemptToPresentStoreReviewIn:v8 tracker:v6];
  }
}

- (void)setStoreFlowController:(id)a3
{
}

- (void)setBookFlowController:(id)a3
{
}

- (void)setAppStoreReviewManager:(id)a3
{
}

- (void)setCriticalAlertCoordinator:(id)a3
{
}

- (void)setLibraryCollectionsFlowController:(id)a3
{
}

- (BCTransaction)initialUserTransaction
{
  return self->_initialUserTransaction;
}

- (void)setLaunchCoordinator:(id)a3
{
}

- (BKAppImportCoordinator)importCoordinator
{
  return self->_importCoordinator;
}

- (void)setImportCoordinator:(id)a3
{
}

- (void)setUserTransactionQueue:(id)a3
{
}

- (BKWelcomeScreenManager)welcomeScreenManager
{
  return self->_welcomeScreenManager;
}

- (void)setWelcomeScreenManager:(id)a3
{
}

- (NSMutableArray)pendingWelcomePresenterDismissCompletionBlocks
{
  return self->_pendingWelcomePresenterDismissCompletionBlocks;
}

- (void)setPendingWelcomePresenterDismissCompletionBlocks:(id)a3
{
}

- (BKAppURLHandling)urlHandler
{
  return self->_urlHandler;
}

- (void)setUrlHandlingQueue:(id)a3
{
}

- (BOOL)pushLargeCoverForInitialHandleURLBookOpen
{
  return self->_pushLargeCoverForInitialHandleURLBookOpen;
}

- (void)setPushLargeCoverForInitialHandleURLBookOpen:(BOOL)a3
{
  self->_pushLargeCoverForInitialHandleURLBookOpen = a3;
}

- (BOOL)pushLargeCoverForNextHandleURLBookOpen
{
  return self->_pushLargeCoverForNextHandleURLBookOpen;
}

- (BOOL)tabsAreLoaded
{
  return self->_tabsAreLoaded;
}

- (void)setSceneFlowController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootBarCoordinator, 0);
  objc_storeStrong((id *)&self->_sceneFlowController, 0);
  objc_storeStrong((id *)&self->_jetActionHandler, 0);
  objc_storeStrong((id *)&self->_serviceCenter, 0);
  objc_storeStrong((id *)&self->_windowProvider, 0);
  objc_storeStrong((id *)&self->_urlHandlingQueue, 0);
  objc_storeStrong((id *)&self->_urlHandler, 0);
  objc_storeStrong((id *)&self->_pendingWelcomePresenterDismissCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_welcomePresenter, 0);
  objc_storeStrong((id *)&self->_welcomeScreenManager, 0);
  objc_storeStrong((id *)&self->_userTransactionQueue, 0);
  objc_storeStrong((id *)&self->_importCoordinator, 0);
  objc_storeStrong((id *)&self->_launchCoordinator, 0);
  objc_storeStrong((id *)&self->_initialUserTransaction, 0);
  objc_storeStrong((id *)&self->_libraryCollectionsFlowController, 0);
  objc_storeStrong((id *)&self->_pendingCriticalAlertAssertion, 0);
  objc_storeStrong((id *)&self->_criticalAlertCoordinator, 0);
  objc_storeStrong((id *)&self->_appStoreReviewManager, 0);
  objc_storeStrong((id *)&self->_engagementManager, 0);
  objc_storeStrong((id *)&self->_bookFlowController, 0);
  objc_storeStrong((id *)&self->_jsaLibraryManager, 0);
  objc_storeStrong((id *)&self->_storeFlowController, 0);

  objc_storeStrong((id *)&self->_minifiedFlowController, 0);
}

- (void)processAccountSwitchWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_10056B718((uint64_t)sub_100051634, v5);

  swift_release();
}

@end