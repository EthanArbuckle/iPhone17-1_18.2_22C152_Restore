@interface PhotosWindowSceneDelegate
+ (void)_showContactsPromptIfNecessary;
- (BOOL)_canProceedWithPhotoLibraryInGoodState;
- (BOOL)_isUserActivityExpired:(id)a3;
- (BOOL)didRecieveSpotlightSearchActivity;
- (NSDate)lastDidEnterBackgroundDate;
- (NSURL)pendingCloudKitShareURLToOpen;
- (NSURL)pendingURLToOpen;
- (NSUserActivity)pendingUserActivity;
- (PXActionProvider)lemonadeRootViewController;
- (PXCollectionActionReceiver)collectionActionReceiver;
- (PXImportViewControllerInstanceHost)importViewControllerInstanceHost;
- (PXLibraryFilterState)libraryFilterState;
- (PXProgrammaticNavigationDestination)px_navigationDestination;
- (PXProgrammaticNavigationRequest)pendingProgrammaticNavigationRequestToOpen;
- (PXSplitViewController)splitViewController;
- (PhotosAppSpec)spec;
- (PhotosWindowSceneDelegate)init;
- (UIViewController)rootViewController;
- (UIWindow)mainWindow;
- (double)actionPerformerBottomPaddingForPresentingToast:(id)a3;
- (double)screenScale;
- (id)actionMenuElementsForObjects:(id)a3 allowedActionTypes:(id)a4;
- (id)actionPerformerHostViewControllerForPresentingToast:(id)a3;
- (id)nextExistingParticipantOnRouteToDestination:(id)a3;
- (id)presentationEnvironmentForActionPerformer:(id)a3;
- (id)shortcutURLForShortcutItem:(id)a3;
- (id)stateRestorationActivityForScene:(id)a3;
- (id)undoManagerForActionPerformer:(id)a3;
- (id)userActivityURLForUserActivity:(id)a3;
- (int64_t)activationOptions;
- (unint64_t)routingOptionsForDestination:(id)a3;
- (void)_ensureLemonadeRootViewControllerExists;
- (void)_ensureSplitViewControllerExistsIfNeeded;
- (void)_executePendingRequestsIfNeeded;
- (void)_handleFetchedMomentShare:(id)a3 forURL:(id)a4 error:(id)a5;
- (void)_openItemProviderCollections:(id)a3;
- (void)_openMomentShareWithURL:(id)a3;
- (void)_openSpotlightSearchActivity:(id)a3;
- (void)_openUniversalLinkActivity:(id)a3;
- (void)_retryProgrammaticNavigationToDestination:(id)a3;
- (void)_scene:(id)a3 openItemProviders:(id)a4;
- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)openCloudKitShareWithURL:(id)a3;
- (void)openRoutingURL:(id)a3;
- (void)openUserActivity:(id)a3;
- (void)performActionWithType:(id)a3 objects:(id)a4 parameters:(id)a5;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setActivationOptions:(int64_t)a3;
- (void)setDidRecieveSpotlightSearchActivity:(BOOL)a3;
- (void)setLastDidEnterBackgroundDate:(id)a3;
- (void)setLemonadeRootViewController:(id)a3;
- (void)setMainWindow:(id)a3;
- (void)setPendingCloudKitShareURLToOpen:(id)a3;
- (void)setPendingProgrammaticNavigationRequestToOpen:(id)a3;
- (void)setPendingURLToOpen:(id)a3;
- (void)setPendingUserActivity:(id)a3;
- (void)setSpec:(id)a3;
- (void)setSplitViewController:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)setupAppUI;
- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)windowScene:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4;
@end

@implementation PhotosWindowSceneDelegate

- (PhotosWindowSceneDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)PhotosWindowSceneDelegate;
  v2 = [(PhotosWindowSceneDelegate *)&v5 init];
  if (v2)
  {
    v3 = +[PUTabbedLibrarySettings sharedInstance];
    [v3 addDeferredKeyObserver:v2];
  }
  return v2;
}

- (BOOL)_canProceedWithPhotoLibraryInGoodState
{
  v3 = -[PhotosApplication px_photoLibrary]_0();
  id v19 = 0;
  unsigned __int8 v4 = [v3 shouldMobileSlideShowLaunchWithError:&v19];
  id v5 = v19;
  if ((v4 & 1) == 0)
  {
    if (!+[PLModelMigrator shouldPromptUserForLibrarySchemaMismatch])
    {
      v18 = PLUIGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v5;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Photos library open failed with error %@", buf, 0xCu);
      }

      exit(0);
    }
    v6 = [v5 userInfo];
    v7 = [v6 objectForKeyedSubscript:NSDebugDescriptionErrorKey];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v5 debugDescription];
    }
    v10 = v9;

    v11 = +[UIAlertController alertControllerWithTitle:@"Photos library open failed" message:v10 preferredStyle:0];
    dispatch_time_t v12 = dispatch_time(0, 10000000000);
    dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, &stru_1000625B8);
    v13 = objc_opt_new();
    v14 = [(PhotosWindowSceneDelegate *)self mainWindow];
    [v14 setRootViewController:v13];

    v15 = [(PhotosWindowSceneDelegate *)self mainWindow];
    v16 = [v15 rootViewController];
    [v16 presentViewController:v11 animated:1 completion:0];
  }
  return v4;
}

- (id)shortcutURLForShortcutItem:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 type];
  if ([v4 isEqualToString:@"com.apple.photos.shortcuts.recentphoto"])
  {
    CFStringRef v5 = @"photos://lastasset";
LABEL_14:
    v8 = +[NSURL URLWithString:v5];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"com.apple.photos.shortcuts.bulletin"])
  {
    v6 = [v3 userInfo];
    v7 = [v6 objectForKeyedSubscript:kNotificationKeyDefaultURL];
    if (v7)
    {
      v8 = +[NSURL URLWithString:v7];
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"com.apple.photos.shortcuts.search"])
  {
    CFStringRef v5 = @"photos://contentmode?id=search";
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"com.apple.photos.shortcuts.oneyearago"])
  {
    CFStringRef v5 = @"photos://oneyearago";
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"com.apple.photos.shortcuts.favorites"])
  {
    CFStringRef v5 = @"photos://album?name=favorites";
    goto LABEL_14;
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (void)_executePendingRequestsIfNeeded
{
  id v7 = [(PhotosWindowSceneDelegate *)self pendingURLToOpen];
  if (v7)
  {
    [(PhotosWindowSceneDelegate *)self setPendingURLToOpen:0];
    [(PhotosWindowSceneDelegate *)self openRoutingURL:v7];
  }
  id v3 = [(PhotosWindowSceneDelegate *)self pendingUserActivity];
  if (v3)
  {
    [(PhotosWindowSceneDelegate *)self setPendingUserActivity:0];
    [(PhotosWindowSceneDelegate *)self openUserActivity:v3];
  }
  unsigned __int8 v4 = [(PhotosWindowSceneDelegate *)self pendingProgrammaticNavigationRequestToOpen];
  if (v4)
  {
    [(PhotosWindowSceneDelegate *)self setPendingProgrammaticNavigationRequestToOpen:0];
    CFStringRef v5 = [(PhotosWindowSceneDelegate *)self rootViewController];
    PXProgrammaticNavigationRequestExecute();
  }
  v6 = [(PhotosWindowSceneDelegate *)self pendingCloudKitShareURLToOpen];
  if (v6)
  {
    [(PhotosWindowSceneDelegate *)self setPendingCloudKitShareURLToOpen:0];
    [(PhotosWindowSceneDelegate *)self openCloudKitShareWithURL:v6];
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  unsigned __int8 v4 = PLUserStatusGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting activation options", v6, 2u);
  }

  [(PhotosWindowSceneDelegate *)self setActivationOptions:0];
  if ([(PhotosWindowSceneDelegate *)self didRecieveSpotlightSearchActivity])
  {
    [(PhotosWindowSceneDelegate *)self setDidRecieveSpotlightSearchActivity:0];
  }
  else
  {
    CFStringRef v5 = +[PXSearchParsecAnalyticsSession sharedSession];
    [v5 reportPhotosAppLaunchedOrEnteredForegroundWithPreviousSearchText:0 previousSearchTokens:0];
  }
}

+ (void)_showContactsPromptIfNecessary
{
  v2 = PLWindowSceneDelegateGetLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  unsigned __int8 v4 = v2;
  CFStringRef v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "ShowContactsPromptIfNecessary", "", buf, 2u);
  }

  if (PLIsChinaSKU())
  {
    v6 = +[PXPeopleUtilities sharedContactStore];
    [v6 requestAccessForEntityType:0 completionHandler:&stru_1000625D8];
  }
  id v7 = v5;
  v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v3, "ShowContactsPromptIfNecessary", "", v9, 2u);
  }
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v6 = a3;
  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:PXLemonadeWindowSceneDidUpdateNotification object:v6];
}

- (void)_ensureSplitViewControllerExistsIfNeeded
{
  os_signpost_id_t v3 = PLWindowSceneDelegateGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  CFStringRef v5 = v3;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CreateSidebarViewController", "", buf, 2u);
  }

  id v7 = +[PUTabbedLibrarySettings sharedInstance];
  unsigned int v8 = [v7 isSidebarEnabled];

  id v9 = [(PhotosWindowSceneDelegate *)self splitViewController];

  if (!v9 && v8)
  {
    -[PhotosApplication px_photoLibrary]_0();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = [(PhotosWindowSceneDelegate *)self lemonadeRootViewController];
    dispatch_time_t v12 = self;
    id v13 = [objc_alloc((Class)PUSidebarViewController) initWithNavigationRoot:v12 photoLibrary:v10 libraryFilterState:v12->_libraryFilterState];
    v14 = [v13 navigationItem];
    [v14 setLargeTitleDisplayMode:2];

    [v13 setActionProviderDelegate:v12];
    collectionActionReceiver = v12->_collectionActionReceiver;
    v12->_collectionActionReceiver = (PXCollectionActionReceiver *)v13;
    id v16 = v13;

    id v17 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v16];
    v18 = [v17 navigationBar];
    [v18 setPrefersLargeTitles:1];
    id v19 = [objc_alloc((Class)PXSplitViewController) initWithSidebarNavigationController:v17 contentViewController:v11 compactViewController:v11];
    [(PhotosWindowSceneDelegate *)v12 setSplitViewController:v19];

    v20 = [(PhotosWindowSceneDelegate *)v12 splitViewController];
    [v20 registerChangeObserver:v16];

    id v21 = [(PhotosWindowSceneDelegate *)v12 splitViewController];

    [v21 px_enableExtendedTraitCollection];
LABEL_11:

    goto LABEL_12;
  }
  v22 = [(PhotosWindowSceneDelegate *)self splitViewController];
  if (!v22) {
    LOBYTE(v8) = 1;
  }

  if ((v8 & 1) == 0)
  {
    id v10 = objc_alloc_init((Class)UIViewController);
    v11 = [(PhotosWindowSceneDelegate *)self splitViewController];
    [v11 setViewController:v10 forColumn:2];
    [v11 setViewController:v10 forColumn:3];
    [(PhotosWindowSceneDelegate *)self setSplitViewController:0];
    goto LABEL_11;
  }
LABEL_12:
  v23 = v6;
  v24 = v23;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v4, "CreateSidebarViewController", "", v25, 2u);
  }
}

- (PXSplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = PLWindowSceneDelegateGetLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  unsigned int v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SceneWillEnterForeground", "", buf, 2u);
  }

  if ([(PhotosWindowSceneDelegate *)self _canProceedWithPhotoLibraryInGoodState])
  {
    [(PhotosWindowSceneDelegate *)self setupAppUI];
    id v9 = +[UIApplication sharedApplication];
    [v9 noteSceneWillEnterForeground:v4];
  }
  id v10 = [(PhotosWindowSceneDelegate *)self lastDidEnterBackgroundDate];
  v11 = +[PXKitSettings sharedInstance];
  [v11 viewResetTimeoutDuration];
  double v13 = v12;

  if (v10)
  {
    v14 = +[NSDate date];
    [v14 timeIntervalSinceDate:v10];
    double v16 = v15;

    if (v16 > v13)
    {
      id v17 = +[NSNotificationCenter defaultCenter];
      [v17 postNotificationName:PXPhotosResetViewNotificationName object:self];
    }
  }
  v18 = v8;
  id v19 = v18;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, v6, "SceneWillEnterForeground", "", v20, 2u);
  }
}

- (void)setupAppUI
{
  if (PFProcessIsLaunchedToExecuteTests()) {
    PXPhotosApplicationStartedLaunchingForTesting();
  }
  [(PhotosWindowSceneDelegate *)self _ensureLemonadeRootViewControllerExists];
  [(PhotosWindowSceneDelegate *)self _ensureSplitViewControllerExistsIfNeeded];
  os_signpost_id_t v3 = [(PhotosWindowSceneDelegate *)self splitViewController];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PhotosWindowSceneDelegate *)self lemonadeRootViewController];
  }
  os_signpost_id_t v6 = v5;

  id v7 = PLWindowSceneDelegateGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  id v9 = v7;
  id v10 = v9;
  if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v14 = [(PhotosWindowSceneDelegate *)self mainWindow];
    [v14 setRootViewController:v6];

    double v15 = [(PhotosWindowSceneDelegate *)self mainWindow];
    [v15 becomeFirstResponder];

    double v16 = v10;
  }
  else
  {
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AddLibraryViewControllerToWindow", "", buf, 2u);
    }

    v11 = [(PhotosWindowSceneDelegate *)self mainWindow];
    [v11 setRootViewController:v6];

    double v12 = [(PhotosWindowSceneDelegate *)self mainWindow];
    [v12 becomeFirstResponder];

    double v13 = v10;
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)id v19 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v8, "AddLibraryViewControllerToWindow", "", v19, 2u);
    }
  }

  [(PhotosWindowSceneDelegate *)self _executePendingRequestsIfNeeded];
  +[PhotosWindowSceneDelegate _showContactsPromptIfNecessary];
  id v17 = +[PXDiagnosticsController sharedController];
  v18 = [(PhotosWindowSceneDelegate *)self mainWindow];
  [v17 setupOnInternalDevicesWithWindow:v18];
}

- (UIWindow)mainWindow
{
  return self->_mainWindow;
}

- (void)_ensureLemonadeRootViewControllerExists
{
  os_signpost_id_t v3 = PLWindowSceneDelegateGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  id v5 = v3;
  os_signpost_id_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)double v16 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CreateLemonadeRootViewController", "", v16, 2u);
  }

  id v7 = [(PhotosWindowSceneDelegate *)self lemonadeRootViewController];

  if (!v7)
  {
    os_signpost_id_t v8 = -[PhotosApplication px_photoLibrary]_0();
    id v9 = PXLemonadeViewControllerFactory();
    id v10 = [v9 viewControllerWithPhotoLibrary:v8];
    [(PhotosWindowSceneDelegate *)self setLemonadeRootViewController:v10];

    v11 = [(PhotosWindowSceneDelegate *)self lemonadeRootViewController];
    [v11 setActionProviderDelegate:self];
  }
  double v12 = v6;
  double v13 = v12;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)double v16 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v4, "CreateLemonadeRootViewController", "", v16, 2u);
  }

  if (PLHasInternalUI())
  {
    uint64_t v14 = CPAnalyticsEventTabIdentifierChanged;
    uint64_t v17 = CPAnalyticsPayloadTabIdentifierDescriptionKey;
    CFStringRef v18 = @"Lemonade";
    double v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    +[CPAnalytics sendEvent:v14 withPayload:v15];
  }
}

- (PXActionProvider)lemonadeRootViewController
{
  return self->_lemonadeRootViewController;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = PLWindowSceneDelegateGetLog();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  double v13 = v11;
  uint64_t v14 = v13;
  unint64_t v47 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SceneWillConnectToSession", "", buf, 2u);
  }
  os_signpost_id_t spid = v12;

  [(PhotosWindowSceneDelegate *)self setActivationOptions:PXCloudQuotaUpsellSheetManagerActivationOptionsForSceneConnectionOptions()];
  double v15 = [v9 userActivities];
  double v16 = [v15 anyObject];

  uint64_t v17 = [v9 URLContexts];
  CFStringRef v18 = [v17 anyObject];
  id v19 = [v18 URL];
  v20 = v19;
  if (v19)
  {
    id v48 = v19;
  }
  else
  {
    id v21 = [v9 shortcutItem];
    id v48 = [(PhotosWindowSceneDelegate *)self shortcutURLForShortcutItem:v21];
  }
  v22 = [v9 _itemProviderCollections];
  v23 = [v9 cloudKitShareMetadata];
  v24 = [v10 stateRestorationActivity];

  if (v16)
  {
    v25 = self;
    v26 = v16;
LABEL_9:
    [(PhotosWindowSceneDelegate *)v25 openUserActivity:v26];
    goto LABEL_16;
  }
  if ([v22 count])
  {
    [(PhotosWindowSceneDelegate *)self _openItemProviderCollections:v22];
  }
  else if (v48)
  {
    [(PhotosWindowSceneDelegate *)self openRoutingURL:"openRoutingURL:"];
  }
  else if (v23)
  {
    v27 = [v23 share];
    v28 = [v27 URL];
    [(PhotosWindowSceneDelegate *)self openCloudKitShareWithURL:v28];
  }
  else if (v24)
  {
    v25 = self;
    v26 = v24;
    goto LABEL_9;
  }
LABEL_16:
  v29 = +[UIDevice currentDevice];
  v30 = +[PhotosAppSpec specForIdiom:](PhotosAppSpec, "specForIdiom:", [v29 userInterfaceIdiom]);
  [(PhotosWindowSceneDelegate *)self setSpec:v30];

  id v31 = objc_alloc((Class)UIWindow);
  id v32 = v8;
  if (!v32)
  {
    v37 = +[NSAssertionHandler currentHandler];
    v38 = (objc_class *)objc_opt_class();
    v44 = NSStringFromClass(v38);
    [v37 handleFailureInMethod:a2, self, @"PhotosWindowSceneDelegate.m", 168, @"%@ should be an instance inheriting from %@, but it is nil", @"scene", v44 object file lineNumber description];
LABEL_26:

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v43 = +[NSAssertionHandler currentHandler];
    v39 = (objc_class *)objc_opt_class();
    uint64_t v40 = NSStringFromClass(v39);
    v42 = [v32 px_descriptionForAssertionMessage];
    v44 = (void *)v40;
    uint64_t v41 = v40;
    v37 = v43;
    [v43 handleFailureInMethod:a2, self, @"PhotosWindowSceneDelegate.m", 168, @"%@ should be an instance inheriting from %@, but it is %@", @"scene", v41, v42 object file lineNumber description];

    goto LABEL_26;
  }
LABEL_18:
  id v33 = [v31 initWithWindowScene:v32];
  [(PhotosWindowSceneDelegate *)self setMainWindow:v33];

  v34 = [(PhotosWindowSceneDelegate *)self mainWindow];
  [v34 makeKeyAndVisible];

  v35 = v14;
  v36 = v35;
  if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)v49 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_END, spid, "SceneWillConnectToSession", "", v49, 2u);
  }
}

- (void)setSpec:(id)a3
{
}

- (void)setMainWindow:(id)a3
{
}

- (void)setLemonadeRootViewController:(id)a3
{
}

- (void)setActivationOptions:(int64_t)a3
{
  self->_activationOptions = a3;
}

- (NSUserActivity)pendingUserActivity
{
  return self->_pendingUserActivity;
}

- (NSURL)pendingURLToOpen
{
  return self->_pendingURLToOpen;
}

- (PXProgrammaticNavigationRequest)pendingProgrammaticNavigationRequestToOpen
{
  return self->_pendingProgrammaticNavigationRequestToOpen;
}

- (NSURL)pendingCloudKitShareURLToOpen
{
  return self->_pendingCloudKitShareURLToOpen;
}

- (NSDate)lastDidEnterBackgroundDate
{
  return self->_lastDidEnterBackgroundDate;
}

- (BOOL)didRecieveSpotlightSearchActivity
{
  return self->_didRecieveSpotlightSearchActivity;
}

- (int64_t)activationOptions
{
  return self->_activationOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_pendingCloudKitShareURLToOpen, 0);
  objc_storeStrong((id *)&self->_pendingURLToOpen, 0);
  objc_storeStrong((id *)&self->_pendingProgrammaticNavigationRequestToOpen, 0);
  objc_storeStrong((id *)&self->_pendingUserActivity, 0);
  objc_storeStrong((id *)&self->_lastDidEnterBackgroundDate, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_mainWindow, 0);
  objc_storeStrong((id *)&self->_collectionActionReceiver, 0);
  objc_storeStrong((id *)&self->_lemonadeRootViewController, 0);

  objc_storeStrong((id *)&self->_spec, 0);
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)setDidRecieveSpotlightSearchActivity:(BOOL)a3
{
  self->_didRecieveSpotlightSearchActivity = a3;
}

- (void)setPendingCloudKitShareURLToOpen:(id)a3
{
}

- (void)setPendingURLToOpen:(id)a3
{
}

- (void)setPendingProgrammaticNavigationRequestToOpen:(id)a3
{
}

- (void)setPendingUserActivity:(id)a3
{
}

- (void)setLastDidEnterBackgroundDate:(id)a3
{
}

- (void)setSplitViewController:(id)a3
{
}

- (PXCollectionActionReceiver)collectionActionReceiver
{
  return self->_collectionActionReceiver;
}

- (PhotosAppSpec)spec
{
  return self->_spec;
}

- (PXImportViewControllerInstanceHost)importViewControllerInstanceHost
{
  os_signpost_id_t v3 = [(PhotosWindowSceneDelegate *)self lemonadeRootViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___PXImportViewControllerInstanceHost];

  if (v4)
  {
    id v5 = [(PhotosWindowSceneDelegate *)self lemonadeRootViewController];
  }
  else
  {
    id v5 = 0;
  }

  return (PXImportViewControllerInstanceHost *)v5;
}

- (PXProgrammaticNavigationDestination)px_navigationDestination
{
  return 0;
}

- (id)nextExistingParticipantOnRouteToDestination:(id)a3
{
  unsigned int v4 = [(PhotosWindowSceneDelegate *)self splitViewController];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(PhotosWindowSceneDelegate *)self lemonadeRootViewController];
  }
  id v7 = v6;

  return v7;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [(PhotosWindowSceneDelegate *)self nextExistingParticipantOnRouteToDestination:v12];
  id v10 = v9;
  if (v9)
  {
    [v9 navigateToDestination:v12 options:a4 completionHandler:v8];
  }
  else
  {
    id v11 = [objc_alloc((Class)PXProgrammaticNavigationRequest) initWithDestination:v12 options:a4 completionHandler:v8];
    [(PhotosWindowSceneDelegate *)self setPendingProgrammaticNavigationRequestToOpen:v11];
  }
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  return 1;
}

- (id)actionPerformerHostViewControllerForPresentingToast:(id)a3
{
  unsigned int v4 = [(PhotosWindowSceneDelegate *)self rootViewController];
  id v5 = [v4 px_topmostPresentedViewController];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(PhotosWindowSceneDelegate *)self rootViewController];
  }
  id v8 = v7;

  return v8;
}

- (double)actionPerformerBottomPaddingForPresentingToast:(id)a3
{
  return 0.0;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  os_signpost_id_t v3 = [(PhotosWindowSceneDelegate *)self rootViewController];
  unsigned int v4 = +[PXViewControllerPresenter defaultPresenterWithViewController:v3];

  return v4;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  os_signpost_id_t v3 = [(PhotosWindowSceneDelegate *)self rootViewController];
  unsigned int v4 = [v3 undoManager];

  return v4;
}

- (void)performActionWithType:(id)a3 objects:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[PXActionManagerFactory actionManagerForObjects:a4];
  [v10 setPerformerDelegate:self];
  id v11 = [v10 actionTypeForGenericType:v8];
  if (v11
    && ([v10 actionPerformerForActionType:v11 parameters:v9],
        (id v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v13 = v12;
    [v12 performActionWithCompletionHandler:0];
  }
  else
  {
    double v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "unable to get an action performer for type '%@' and parameters %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (id)actionMenuElementsForObjects:(id)a3 allowedActionTypes:(id)a4
{
  id v6 = a4;
  id v7 = +[PXActionManagerFactory actionManagerForObjects:a3];
  [v7 setAllowedActionTypes:v6];

  [v7 setPerformerDelegate:self];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001BE68;
  v11[3] = &unk_100063D78;
  id v12 = v7;
  id v8 = v7;
  id v9 = [v8 contextMenuElementsWithHandler:v11];

  return v9;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v8 = a4;
  uint64_t v5 = +[PUTabbedLibrarySettings sharedInstance];
  if (v5)
  {
    id v6 = (void *)v5;
    unsigned int v7 = [v8 isEqualToString:@"sidebarEnabled"];

    if (v7) {
      [(PhotosWindowSceneDelegate *)self setupAppUI];
    }
  }
}

- (id)userActivityURLForUserActivity:(id)a3
{
  id v5 = a3;
  id v6 = [v5 userInfo];
  unsigned int v7 = [v6 objectForKeyedSubscript:@"localIdentifier"];
  id v8 = [v5 activityType];
  unsigned int v9 = [v8 isEqualToString:CSSearchableItemActionType];

  if (v9)
  {
    id v10 = [v6 objectForKeyedSubscript:CSSearchableItemActivityIdentifier];
    id v11 = PLPhotosSearchGetLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        id v48 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Photos Spotlight Search: will navigate to 1up for assetID: %@", buf, 0xCu);
      }

      +[NSString stringWithFormat:@"photos://contentmode?id=photos&assetuuid=%@&oneUp=1", v10];
      goto LABEL_24;
    }
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Photos Spotlight Search: unexpectedly received CSSearchableItemActionType without an assetUUID, navigating to photolibrary tab", buf, 2u);
    }

    CFStringRef v13 = @"photos://contentmode?id=photos";
    goto LABEL_23;
  }
  if (v7)
  {
    id v10 = +[PHObject uuidFromLocalIdentifier:v7];
    if (v10)
    {
      +[NSString stringWithFormat:@"photos://asset?uuid=%@", v10];
LABEL_24:
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    goto LABEL_49;
  }
  int v14 = [v6 objectForKeyedSubscript:@"contentMode"];
  id v10 = v14;
  if (v14)
  {
    unsigned int v15 = [v14 intValue];
    if (v15 == 12)
    {
      CFStringRef v16 = @"search";
      goto LABEL_22;
    }
    if (v15 == 10)
    {
      CFStringRef v16 = @"photos";
LABEL_22:
      CFStringRef v45 = v16;
      CFStringRef v13 = @"photos://contentmode?id=%@";
LABEL_23:
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v45);
      goto LABEL_24;
    }
LABEL_49:
    v22 = 0;
    goto LABEL_25;
  }
  id v17 = [v5 activityType];
  unsigned int v18 = [v17 isEqualToString:@"com.apple.mobileslideshow.album"];

  if (v18)
  {
    id v19 = [v6 objectForKeyedSubscript:@"collectionSubtype"];
    uint64_t v20 = [v6 objectForKeyedSubscript:@"uuid"];
    id v21 = (void *)v20;
    if (v20 && v19)
    {
      v44 = +[NSAssertionHandler currentHandler];
      [v44 handleFailureInMethod:a2 object:self file:@"PhotosWindowSceneDelegate.m" lineNumber:616 description:@"Conflicting parameters; prioritizing uuid"];
    }
    else if (!v20)
    {
      if (v19)
      {
        id v32 = +[PHAssetCollection px_builtInAlbumNameForSubtype:](PHAssetCollection, "px_builtInAlbumNameForSubtype:", (int)[v19 intValue]);
        if (v32)
        {
          +[NSString stringWithFormat:@"photos://album?name=%@", v32];
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
      }
      else
      {
        v22 = 0;
      }
      goto LABEL_52;
    }
    +[NSString stringWithFormat:@"photos://album?uuid=%@", v21];
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_52:

    goto LABEL_53;
  }
  v25 = [v5 activityType];
  unsigned int v26 = [v25 isEqualToString:@"com.apple.mobileslideshow.people"];

  if (v26)
  {
    v27 = [v6 objectForKeyedSubscript:@"identifier"];

    if (v27)
    {
      v28 = [v6 objectForKeyedSubscript:@"identifier"];
      v29 = +[NSString stringWithFormat:@"?identifier=%@", v28];

      v22 = [@"photos://people" stringByAppendingString:v29];
    }
    else
    {
      v22 = @"photos://people";
    }
    goto LABEL_25;
  }
  v30 = [v5 activityType];
  int v31 = [v30 isEqualToString:@"com.apple.mobileslideshow.places"];

  if (v31)
  {
    v22 = @"photos://places";
    goto LABEL_25;
  }
  id v33 = [v5 activityType];
  unsigned int v34 = [v33 isEqualToString:@"com.apple.mobileslideshow.memory"];

  if (v34)
  {
    id v19 = [v6 objectForKeyedSubscript:@"identifier"];
    if ([v19 length])
    {
      +[NSString stringWithFormat:@"photos://memory?identifier=%@", v19];
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v35 = [v5 activityType];
    unsigned int v36 = [v35 isEqualToString:@"com.apple.mobileslideshow.oneUp"];

    if (!v36) {
      goto LABEL_49;
    }
    id v19 = [v6 objectForKeyedSubscript:@"collectionType"];
    v37 = [v6 objectForKeyedSubscript:@"collectionSubtype"];
    unsigned int v38 = [v19 intValue];
    uint64_t v39 = (int)[v37 intValue];
    if (v38 == 1 && (v39 == 101 || v39 == 2))
    {
      uint64_t v40 = [v6 objectForKeyedSubscript:@"selectedUUIDs"];
      uint64_t v41 = [v40 objectAtIndexedSubscript:0];
      v42 = [v6 objectForKeyedSubscript:@"albumUUID"];
      +[NSString stringWithFormat:@"photos://asset?uuid=%@&albumuuid=%@", v41, v42];
    }
    else
    {
      uint64_t v40 = +[PHAssetCollection px_builtInAlbumNameForSubtype:v39];
      uint64_t v41 = [v6 objectForKeyedSubscript:@"selectedUUIDs"];
      uint64_t v43 = [v41 objectAtIndexedSubscript:0];
      v42 = (void *)v43;
      if (v40) {
        +[NSString stringWithFormat:@"photos://asset?uuid=%@&albumname=%@", v43, v40];
      }
      else {
        +[NSString stringWithFormat:@"photos://asset?uuid=%@", v43, v46];
      }
    }
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_53:

LABEL_25:
  if (v22)
  {
    v23 = +[NSURL URLWithString:v22];
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)_handleFetchedMomentShare:(id)a3 forURL:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = [v8 uuid];
    BOOL v12 = PLSharingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Did fetch moment share: %{public}@", buf, 0xCu);
    }

    CFStringRef v13 = PLSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Will open iCloud Link with UUID: %{public}@", buf, 0xCu);
    }

    id v14 = [objc_alloc((Class)PXProgrammaticNavigationDestination) initWithObject:v8 revealMode:1];
    id v15 = objc_alloc((Class)PXProgrammaticNavigationRequest);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001C93C;
    v24[3] = &unk_100062570;
    id v25 = v11;
    id v26 = v9;
    id v16 = v11;
    id v17 = [v15 initWithDestination:v14 options:0 completionHandler:v24];
    unsigned int v18 = [(PhotosWindowSceneDelegate *)self rootViewController];
    PXProgrammaticNavigationRequestExecute();
  }
  else
  {
    id v19 = PLSharingGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to fetch moment share with error: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    uint64_t v20 = [(PhotosWindowSceneDelegate *)self rootViewController];
    id v21 = +[PXViewControllerPresenter defaultPresenterWithViewController:v20];

    objc_copyWeak(&v23, (id *)buf);
    id v22 = v9;
    PXMomentSharePresentRetryAlertForFetchFailure();

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_openItemProviderCollections:(id)a3
{
  id v4 = a3;
  id v5 = +[NSURL URLWithString:@"photos://album?name=camera-roll"];
  [(PhotosWindowSceneDelegate *)self openRoutingURL:v5];

  id v6 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 addObjectsFromArray:*(void *)(*((void *)&v19 + 1) + 8 * (void)v11)];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v9);
  }

  BOOL v12 = PLUIGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v6 count];
    *(_DWORD *)buf = 134218242;
    id v24 = v13;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "About to import %lu item providers (%@).", buf, 0x16u);
  }

  id v14 = +[PXImportManager defaultManager];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001CCE0;
  v16[3] = &unk_100062548;
  id v17 = @"photos://album?name=camera-roll";
  unsigned int v18 = self;
  id v15 = [v14 importItemProviders:v6 completionHandler:v16];
}

- (void)_openMomentShareWithURL:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = PLSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will fetch moment share for URL: %@", buf, 0xCu);
  }

  objc_copyWeak(&v7, &location);
  id v6 = v4;
  PXFetchMomentShareForURL();

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)openCloudKitShareWithURL:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v6 = PLSharingGetLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    BOOL v12 = "Asked to open a *nil* cloud-kit share URL";
    id v13 = v6;
    uint32_t v14 = 2;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    goto LABEL_16;
  }
  int v5 = PXIsSharedLibraryURL();
  if ((v5 & 1) == 0 && (PXIsCMMURL() & 1) == 0)
  {
    id v6 = PLSharingGetLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    BOOL v12 = "Asked to open an unknown type of cloud-kit share URL: %@";
    id v13 = v6;
    uint32_t v14 = 12;
    goto LABEL_14;
  }
  id v6 = [(PhotosWindowSceneDelegate *)self rootViewController];
  if (v6)
  {
    if (v5)
    {
      id v7 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will open Shared Library invitation with URL: %@", buf, 0xCu);
      }

      id v8 = objc_alloc((Class)PXSharedLibrarySourceLibraryInfoPhotoKit);
      id v9 = -[PhotosApplication px_photoLibrary]_0();
      id v10 = [v8 initWithPhotoLibrary:v9];

      id v11 = +[PXViewControllerPresenter defaultPresenterWithViewController:v6];
      id v15 = v4;
      PXSharedLibraryHandleSharedLibraryURL();
    }
    else
    {
      [(PhotosWindowSceneDelegate *)self _openMomentShareWithURL:v4];
    }
  }
  else
  {
    [(PhotosWindowSceneDelegate *)self setPendingCloudKitShareURLToOpen:v4];
  }
LABEL_16:
}

- (void)openRoutingURL:(id)a3
{
  id v4 = a3;
  int v5 = [(PhotosWindowSceneDelegate *)self rootViewController];
  id v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v4 absoluteString];
    *(_DWORD *)buf = 138412290;
    long long v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Open Routing URL: %@", buf, 0xCu);
  }
  id v8 = [v4 scheme];
  id v9 = +[NSBundle mainBundle];
  id v10 = [v9 bundleIdentifier];
  id v11 = [v8 caseInsensitiveCompare:v10];

  if (v11)
  {
    if (v5)
    {
      id v12 = [objc_alloc((Class)PXProgrammaticNavigationDestination) initWithURL:v4];
      if ([v5 routingOptionsForDestination:v12])
      {
        PXLemonadeAppearanceConfigureIfNeeded();
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10001D704;
        v17[3] = &unk_1000624F8;
        id v18 = v4;
        id v19 = v12;
        long long v20 = self;
        [v5 navigateToDestination:v19 options:0 completionHandler:v17];
      }
      else if (([v8 isEqualToString:@"photos-redirect"] & 1) != 0 {
             || ![v8 isEqualToString:@"photos"])
      }
      {
        +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_retryProgrammaticNavigationToDestination:" object:v12];
        [(PhotosWindowSceneDelegate *)self performSelector:"_retryProgrammaticNavigationToDestination:" withObject:v12 afterDelay:0.3];
      }
      else
      {
        id v13 = [v4 resourceSpecifier];
        if ([v13 containsString:@"show-welcome-cpl"])
        {
          id v14 = [objc_alloc((Class)PXCloudPhotoWelcomeViewController) initWithDefaultTitle];
          id v15 = [objc_alloc((Class)PXCloudPhotoWelcomeNavigationController) initWithWelcomeController:v14];
          [v5 presentViewController:v15 animated:1 completion:0];
        }
        else if ([v13 containsString:@"edit"])
        {
          PUPhotoEditHandleURLAction();
        }
      }
    }
    else
    {
      [(PhotosWindowSceneDelegate *)self setPendingURLToOpen:v4];
    }
  }
  else
  {
    id v16 = +[UIApplication sharedApplication];
    [v16 handleOAuthRedirectURL:v4];
  }
}

- (void)_retryProgrammaticNavigationToDestination:(id)a3
{
  id v4 = a3;
  int v5 = [(PhotosWindowSceneDelegate *)self rootViewController];
  if ([v5 routingOptionsForDestination:v4])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001D9F4;
    v6[3] = &unk_1000646E8;
    id v7 = v4;
    [v5 navigateToDestination:v7 options:0 completionHandler:v6];
  }
}

- (void)_openSpotlightSearchActivity:(id)a3
{
  id v4 = a3;
  [(PhotosWindowSceneDelegate *)self setDidRecieveSpotlightSearchActivity:1];
  int v5 = +[PXSearchParsecAnalyticsSession sharedSession];
  [v5 reportPhotosAppLaunchedOrEnteredForegroundWithSpotlightSearchActivity];

  id v6 = [v4 userInfo];
  id v7 = [v6 objectForKeyedSubscript:CSSearchQueryString];

  id v8 = PLPhotosSearchGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Spotlight Search: Continuing Spotlight search query: %@", buf, 0xCu);
  }

  if (v7 && [v7 length])
  {
    id v9 = [(PhotosWindowSceneDelegate *)self rootViewController];
    id v10 = [objc_alloc((Class)PXProgrammaticNavigationDestination) initWithSearchText:v7];
    if ([v9 routingOptionsForDestination:v10])
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001DDBC;
      v12[3] = &unk_1000646E8;
      id v13 = v10;
      [v9 navigateToDestination:v13 options:0 completionHandler:v12];
    }
    else
    {
      id v11 = PLPhotosSearchGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Spotlight Search: Setting pending user activity to open: %@", buf, 0xCu);
      }

      [(PhotosWindowSceneDelegate *)self setPendingUserActivity:v4];
    }
  }
  else
  {
    id v9 = PXAssertGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Spotlight Search: Got unexpected empty string for Spotlight user activity: %@", buf, 0xCu);
    }
  }
}

- (void)_openUniversalLinkActivity:(id)a3
{
  id v5 = a3;
  id v6 = [(PhotosWindowSceneDelegate *)self rootViewController];
  id v7 = PLUIGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PhotosWindowSceneDelegate: Handling NSUserActivityTypeBrowsingWeb: %@", buf, 0xCu);
    }

    id v9 = [v5 webpageURL];
    if (PXIsRetailExperienceManagerURL())
    {
      id v10 = PLAppIntentsGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Will present PXRetailExperienceManager, deferring to workaround rdar://117412505", buf, 2u);
      }

      dispatch_time_t v11 = dispatch_time(0, 1000000000);
      dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, &stru_1000624D0);
    }
    else
    {
      id v12 = PXSharedAlbumURLHandlingInvitationTokenForURL();

      id v13 = PLUIGetLog();
      id v14 = v13;
      if (v12)
      {
        id v15 = &off_10004B000;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v21 = v9;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PhotosWindowSceneDelegate: Found shared album invitation URL: \"%@\"", buf, 0xCu);
        }

        id v14 = v6;
        if (([v14 conformsToProtocol:&OBJC_PROTOCOL___PXProgrammaticNavigationParticipant] & 1) == 0)
        {
          id v18 = +[NSAssertionHandler currentHandler];
          id v19 = [v14 px_descriptionForAssertionMessage];
          [v18 handleFailureInMethod:a2, self, @"PhotosWindowSceneDelegate.m", 339, @"%@ should be nil or conform to protocol %@, but %@ doesn't", @"rootViewController", @"PXProgrammaticNavigationParticipant", v19 object file lineNumber description];

          id v15 = &off_10004B000;
        }
        id v16 = [[PhotosURLRedirectRequest alloc] initWithDestinationURL:v9 rootController:v14];
        id v17 = PLUIGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = *((void *)v15 + 341);
          id v21 = v9;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PhotosWindowSceneDelegate: Handling shared album invitation URL: \"%@\"", buf, 0xCu);
        }

        [(PhotosURLRedirectRequest *)v16 performRequest];
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "PhotosWindowSceneDelegate: Ignoring unknown URL: \"%@\"", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PhotosWindowSceneDelegate: Deferring handling of NSUserActivityTypeBrowsingWeb: %@", buf, 0xCu);
    }

    [(PhotosWindowSceneDelegate *)self setPendingUserActivity:v5];
  }
}

- (BOOL)_isUserActivityExpired:(id)a3
{
  os_signpost_id_t v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"timestamp"];

  BOOL v8 = 0;
  if (v4)
  {
    id v5 = +[NSDate date];
    [v5 timeIntervalSinceDate:v4];
    double v7 = v6;

    if (v7 > 480.0) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (void)openUserActivity:(id)a3
{
  id v4 = a3;
  id v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PhotosWindowSceneDelegate: received user activity: %@", (uint8_t *)&v13, 0xCu);
  }

  [(PhotosWindowSceneDelegate *)self setPendingUserActivity:0];
  double v6 = [v4 activityType];
  if ([v6 isEqualToString:CSQueryContinuationActionType])
  {
    [(PhotosWindowSceneDelegate *)self _openSpotlightSearchActivity:v4];
  }
  else if ([v6 isEqualToString:NSUserActivityTypeBrowsingWeb])
  {
    [(PhotosWindowSceneDelegate *)self _openUniversalLinkActivity:v4];
  }
  else
  {
    double v7 = [(PhotosWindowSceneDelegate *)self userActivityURLForUserActivity:v4];
    if (v7)
    {
      unsigned int v8 = [(PhotosWindowSceneDelegate *)self _isUserActivityExpired:v4];
      id v9 = PLUIGetLog();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          LOWORD(v13) = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "User activity expired, skipping navigation", (uint8_t *)&v13, 2u);
        }
      }
      else
      {
        if (v10)
        {
          id v12 = [v7 absoluteString];
          int v13 = 138412290;
          id v14 = v12;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PhotosWindowSceneDelegate: will navigate to URL: %@", (uint8_t *)&v13, 0xCu);
        }
        [(PhotosWindowSceneDelegate *)self openRoutingURL:v7];
      }
    }
    else
    {
      dispatch_time_t v11 = PLUIGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to open user activity (can't convert to URL): %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)windowScene:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4
{
  id v5 = a4;
  double v6 = PLUserStatusGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Noting some activation options: cloud kit share metadata", (uint8_t *)&v9, 2u);
  }

  [(PhotosWindowSceneDelegate *)self setActivationOptions:2];
  if (v5)
  {
    double v7 = [v5 share];
    unsigned int v8 = [v7 URL];
    [(PhotosWindowSceneDelegate *)self openCloudKitShareWithURL:v8];
  }
  else
  {
    double v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to open : Cloud Kit Share Metadata %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v5 = a4;
  double v6 = PLUserStatusGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Noting some activation options: user activity", v7, 2u);
  }

  [(PhotosWindowSceneDelegate *)self setActivationOptions:2];
  [(PhotosWindowSceneDelegate *)self openUserActivity:v5];
}

- (id)stateRestorationActivityForScene:(id)a3
{
  return _[a3 userActivity];
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  unsigned int v8 = (void (**)(id, BOOL))a5;
  int v9 = PLUserStatusGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Noting some activation options: shortcut item", (uint8_t *)&v12, 2u);
  }

  [(PhotosWindowSceneDelegate *)self setActivationOptions:2];
  uint64_t v10 = [(PhotosWindowSceneDelegate *)self shortcutURLForShortcutItem:v7];
  if (v10)
  {
    [(PhotosWindowSceneDelegate *)self openRoutingURL:v10];
  }
  else
  {
    dispatch_time_t v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to open shortcut (can't convert to URL): %@", (uint8_t *)&v12, 0xCu);
    }
  }
  v8[2](v8, v10 != 0);
}

- (void)_scene:(id)a3 openItemProviders:(id)a4
{
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5 = a4;
  double v6 = PLUserStatusGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Noting some activation options: URL contexts", (uint8_t *)&v10, 2u);
  }

  [(PhotosWindowSceneDelegate *)self setActivationOptions:2];
  id v7 = [v5 anyObject];
  unsigned int v8 = [v7 URL];

  if (v8)
  {
    [(PhotosWindowSceneDelegate *)self openRoutingURL:v8];
  }
  else
  {
    int v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to open URL contexts (can't convert to URL): %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = +[NSDate date];
  [(PhotosWindowSceneDelegate *)self setLastDidEnterBackgroundDate:v4];

  id v5 = +[PXSearchParsecAnalyticsSession sharedSession];
  [v5 reportPhotosAppEnteredBackground];
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = PLWindowSceneDelegateGetLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);
  double v6 = v4;
  id v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SceneDidDisconnect", "", buf, 2u);
  }

  unsigned int v8 = +[PXSearchParsecAnalyticsSession sharedSession];
  [v8 reportPhotosAppQuit];

  int v9 = [(PhotosWindowSceneDelegate *)self mainWindow];
  [v9 setHidden:1];

  [(PhotosWindowSceneDelegate *)self setMainWindow:0];
  int v10 = v7;
  id v11 = v10;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)int v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v5, "SceneDidDisconnect", "", v12, 2u);
  }
}

- (double)screenScale
{
  v2 = [(PhotosWindowSceneDelegate *)self mainWindow];
  os_signpost_id_t v3 = [v2 screen];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[UIScreen mainScreen];
  }
  double v6 = v5;

  [v6 scale];
  if (v7 == 0.0) {
    double v8 = 1.0;
  }
  else {
    double v8 = v7;
  }

  return v8;
}

- (UIViewController)rootViewController
{
  v2 = [(PhotosWindowSceneDelegate *)self mainWindow];
  os_signpost_id_t v3 = [v2 rootViewController];

  return (UIViewController *)v3;
}

@end