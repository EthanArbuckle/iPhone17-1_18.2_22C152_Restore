@interface PhotosApplication
+ (void)_donateTipsAppPhotosSignals;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)hiddenAlbumIsVisible;
- (CAMNebulaDaemonProxyManager)_nebulaDaemonProxyManager;
- (NSUndoManager)fallbackUndoManager;
- (PXActionManager)assetActionManager;
- (PXAlertController)iPhotoMigrationAlertController;
- (PXCollectionActionReceiver)keyCollectionActionReceiver;
- (PXRootLibraryNavigationController)lemonadeRootViewController;
- (PXUndoActionsInvalidator)undoActionsInvalidator;
- (UIScene)applicationScene;
- (UIViewController)contentViewController;
- (UIViewController)keyRootViewController;
- (id)_newImportViewController;
- (id)importViewControllerForImportSource:(id)a3;
- (id)importViewControllerInstanceHost;
- (id)keySpec;
- (id)photosWindowSceneDelegate;
- (id)px_photoLibrary;
- (id)stateCaptureDictionary;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (void)_beginUndoActionsInvalidator;
- (void)_dequeueNextImportDevice;
- (void)_displayAndRemovePhoneInvitationFailures;
- (void)_performActionType:(id)a3 completionHandler:(id)a4;
- (void)_satisfyAppIntentsURLNavigationPerformerRequestsIfNecessary;
- (void)_setNebulaDaemonProxyManager:(id)a3;
- (void)_showAppleMusicPromptsIfNecessaryWithCompletion:(id)a3;
- (void)_showCloudPhotoLibraryExitPromptIfNecessary;
- (void)_showSyncReminderPromptIfNecessary;
- (void)_showUserNotificationsPromptIfNecessaryWithCompletion:(id)a3;
- (void)_showWelcomeViewControllersIfNecessaryWithCompletion:(id)a3;
- (void)_tearDownImportViewController;
- (void)_userDidTakeScreenshot:(id)a3;
- (void)addAssetsToAlbum:(id)a3;
- (void)addAssetsToLastUsedAlbum:(id)a3;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)copy:(id)a3;
- (void)copyAdjustments:(id)a3;
- (void)copyAdjustmentsSkippingOptions:(id)a3;
- (void)copyEditsFromSelectedAssetWithCompletionHandler:(id)a3;
- (void)duplicateAssets:(id)a3;
- (void)favoriteAssets:(id)a3;
- (void)find:(id)a3;
- (void)handleImportCompleteAlertResponse:(__CFUserNotification *)a3 flags:(unint64_t)a4;
- (void)handleOAuthRedirectURL:(id)a3;
- (void)hideAssets:(id)a3;
- (void)importController:(id)a3 addedImportSource:(id)a4;
- (void)importController:(id)a3 removedImportSource:(id)a4;
- (void)invalidateActionManagerProvider;
- (void)makeKeyPhoto:(id)a3;
- (void)mergeDuplicates:(id)a3;
- (void)mergeDuplicatesWithoutConfirmation:(id)a3;
- (void)navigateToURLDestination:(id)a3 completionHandler:(id)a4;
- (void)noteSceneWillEnterForeground:(id)a3;
- (void)pasteAdjustments:(id)a3;
- (void)pasteEditsOnSelectedAssetsWithCompletionHandler:(id)a3;
- (void)performEditRequestWithAdjustments:(id)a3 completionHandler:(id)a4;
- (void)performNebuladCrashRecoveryIfNeededForceEndLastTimelapseSession:(BOOL)a3;
- (void)photosPreferencesChanged;
- (void)prepareForApplicationDidBecomeActive;
- (void)prepareForApplicationDidEnterBackground;
- (void)prepareForApplicationWillEnterForeground;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)printAssets:(id)a3;
- (void)provideImageForPerson:(id)a3 size:(CGSize)a4 completionHandler:(id)a5;
- (void)providePhotoLibrary:(id)a3;
- (void)redo:(id)a3;
- (void)revertAdjustments:(id)a3;
- (void)setHiddenAlbumIsVisible:(BOOL)a3;
- (void)setIPhotoMigrationAlertController:(id)a3;
- (void)setUndoActionsInvalidator:(id)a3;
- (void)shareAssets:(id)a3;
- (void)showInternalSettings:(id)a3;
- (void)trashAssets:(id)a3;
- (void)trashAssetsWithoutConfirmation:(id)a3;
- (void)undo:(id)a3;
- (void)updateShowHiddenAlbumCachedValue;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
- (void)validateCommand:(id)a3;
@end

@implementation PhotosApplication

- (void)photosPreferencesChanged
{
  v3.receiver = self;
  v3.super_class = (Class)PhotosApplication;
  [(PhotosApplication *)&v3 photosPreferencesChanged];
  [(PhotosApplication *)self updateShowHiddenAlbumCachedValue];
}

- (void)updateShowHiddenAlbumCachedValue
{
  uint64_t IsHiddenAlbumVisible = PXPreferencesIsHiddenAlbumVisible();

  [(PhotosApplication *)self setHiddenAlbumIsVisible:IsHiddenAlbumVisible];
}

- (void)setHiddenAlbumIsVisible:(BOOL)a3
{
  self->_hiddenAlbumIsVisible = a3;
}

- (void)_satisfyAppIntentsURLNavigationPerformerRequestsIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  self->_canSatisfyAppIntentsURLNavigationRequests = 1;
  id v3 = [(NSMutableArray *)self->_appIntentsURLNavigationRequests count];
  v4 = PLAppIntentsGetLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = [(NSMutableArray *)self->_appIntentsURLNavigationRequests count];
      int v8 = 134217984;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Perform %lu deferred App Intents URL navigation request(s)", (uint8_t *)&v8, 0xCu);
    }

    v4 = [(NSMutableArray *)self->_appIntentsURLNavigationRequests copy];
    appIntentsURLNavigationRequests = self->_appIntentsURLNavigationRequests;
    self->_appIntentsURLNavigationRequests = 0;

    [v4 enumerateObjectsUsingBlock:&stru_1000628E8];
  }
  else if (v5)
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ignore deferred App Intents URL navigation for zero requests", (uint8_t *)&v8, 2u);
  }
}

- (id)photosWindowSceneDelegate
{
  v4 = [(PhotosApplication *)self applicationScene];
  BOOL v5 = [v4 delegate];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = +[NSAssertionHandler currentHandler];
      v7 = (objc_class *)objc_opt_class();
      int v8 = NSStringFromClass(v7);
      id v9 = [v5 px_descriptionForAssertionMessage];
      [v6 handleFailureInMethod:a2, self, @"PhotosApplication.m", 870, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"scene.delegate", v8, v9 object file lineNumber description];
    }
  }
  else
  {
    v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(PhotosApplication *)self connectedScenes];
      *(_DWORD *)buf = 134217984;
      id v14 = [v11 count];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "photosWindowSceneDelegate is nil as no application scene with appropriate delegate was found out of %tu scene(s)", buf, 0xCu);
    }
  }

  return v5;
}

- (void)prepareForApplicationDidBecomeActive
{
  v2.receiver = self;
  v2.super_class = (Class)PhotosApplication;
  [(PhotosApplication *)&v2 prepareForApplicationDidBecomeActive];
  if (qword_100073320 != -1) {
    dispatch_once(&qword_100073320, &stru_100062730);
  }
}

- (void)noteSceneWillEnterForeground:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!self->_canSatisfyAppIntentsURLNavigationRequests)
  {
    v4 = PLAppIntentsGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000032B4;
    block[3] = &unk_1000646C0;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)prepareForApplicationWillEnterForeground
{
  v11.receiver = self;
  v11.super_class = (Class)PhotosApplication;
  [(PhotosApplication *)&v11 prepareForApplicationWillEnterForeground];
  id v3 = [(PhotosApplication *)self photosWindowSceneDelegate];
  id v4 = [v3 activationOptions];

  dispatch_time_t v5 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022C34;
  block[3] = &unk_1000626C8;
  block[4] = self;
  void block[5] = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  px_dispatch_on_main_queue_when_idle_after_delay();
  id v6 = [(PUImportViewController *)self->_importViewController importSource];

  if (v6)
  {
    v7 = [(PhotosApplication *)self importViewControllerInstanceHost];
    importViewController = self->_importViewController;
    id v9 = [(PUImportViewController *)importViewController importSource];
    [v7 setImportViewController:importViewController forImportSource:v9];
  }
}

- (UIScene)applicationScene
{
  [(PhotosApplication *)self connectedScenes];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v8 = [v7 session];
        id v9 = [v8 role];
        unsigned int v10 = [v9 isEqualToString:UIWindowSceneSessionRoleApplication];

        if (v10)
        {
          objc_super v11 = [v7 delegate];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v13 = v7;

            goto LABEL_12;
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_12:

  return (UIScene *)v13;
}

- (id)px_photoLibrary
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100073310);
  v0 = (void *)qword_100073318;
  if (!qword_100073318)
  {
    v1 = +[PLPhotoLibraryPathManager systemLibraryURL];
    if (PLMobileSlideShowPhotoLibraryTestingMode() == 2)
    {
      id v2 = objc_alloc_init((Class)PHPhotoLibraryManager);
      id v3 = +[PHPhotoLibraryCreationOptions creationOptionsForUserLibrary];
      [v3 setInternalCreateOptions:211];
      id v13 = 0;
      id v4 = [v2 createPhotoLibraryWithURL:v1 options:v3 error:&v13];
      id v5 = v13;
      if (v4)
      {
        id v6 = PLBackendGetLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = +[NSBundle mainBundle];
          int v8 = [v7 bundleIdentifier];
          *(_DWORD *)buf = 138412546;
          long long v15 = v8;
          __int16 v16 = 2112;
          long long v17 = v1;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "created test photo library for %@ at %@", buf, 0x16u);
        }
      }
      else
      {
        +[NSException raise:NSInternalInconsistencyException, @"Unable to create test photo library: %@", v5 format];
      }
    }
    id v9 = [objc_alloc((Class)PHPhotoLibrary) initWithPhotoLibraryURL:v1];
    unsigned int v10 = (void *)qword_100073318;
    qword_100073318 = (uint64_t)v9;

    v0 = (void *)qword_100073318;
  }
  id v11 = v0;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100073310);

  return v11;
}

- (void)applicationDidFinishLaunching:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PhotosApplication;
  [(PhotosApplication *)&v20 applicationDidFinishLaunching:a3];
  PXAppIntentsAddPhotoLibraryProviderDependency();
  PXAppIntentsAddURLNavigationPerformerDependency();
  PXAppIntentsAddPersonImageProviderDependency();
  PXAppIntentsAddPendingEditsRequestProviderDependency();
  [(PhotosApplication *)self ppt_prepareApplicationForTesting];
  PXApplicationAudioSessionSetCategory();
  id v4 = +[PHImportController sharedInstance];
  [v4 enableDeviceImport];
  [v4 addImportControllerObserver:self];
  id v5 = +[NSNotificationCenter defaultCenter];
  id v6 = +[NSUbiquitousKeyValueStore defaultStore];
  v7 = +[PXPreloadScheduler sharedScheduler];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000230A4;
  v18[3] = &unk_1000646C0;
  id v8 = v6;
  id v19 = v8;
  [v7 scheduleTaskWithQoS:1 block:v18];

  [v5 addObserver:self selector:"_userDidTakeScreenshot:" name:UIApplicationUserDidTakeScreenshotNotification object:0];
  id v9 = (PFStateCaptureHandler *)[objc_alloc((Class)PFStateCaptureHandler) initWithProvider:self];
  stateCaptureHandler = self->_stateCaptureHandler;
  self->_stateCaptureHandler = v9;

  id v11 = +[UNUserNotificationCenter currentNotificationCenter];
  [v11 setDelegate:self];
  v12 = +[NSBundle mainBundle];
  +[CPAnalytics setupWithConfigurationFilename:@"CPAnalyticsConfig-Photos" inBundle:v12];

  id v13 = [(PhotosApplication *)self px_photoLibrary];
  +[CPAnalytics setupSystemPropertyProvidersForLibrary:v13];

  +[CPAnalytics startAppTracking];
  +[CPAnalytics startViewTracking];
  +[UIApplication pu_prepareCPAnalytics];
  id v14 = +[PXPreloadScheduler sharedScheduler];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000230B4;
  v17[3] = &unk_1000646C0;
  v17[4] = self;
  [v14 scheduleTaskWithQoS:1 block:v17];

  long long v15 = +[PXPreloadScheduler sharedScheduler];
  [v15 scheduleDeferredTaskWithQoS:2 block:&stru_100062678];

  if (PFProcessIsLaunchedToExecuteTests())
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100023104;
    v16[3] = &unk_1000646C0;
    v16[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
  }
}

- (void)_displayAndRemovePhoneInvitationFailures
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000354C;
  v2[3] = &unk_1000627E8;
  v2[4] = self;
  +[PLPhotoSharingHelper handlePhoneInvitationFailuresWithCompletionBlock:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoActionsInvalidator, 0);
  objc_storeStrong((id *)&self->_iPhotoMigrationAlertController, 0);
  objc_storeStrong((id *)&self->__nebulaDaemonProxyManager, 0);
  objc_storeStrong((id *)&self->_appIntentsURLNavigationRequests, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandler, 0);
  objc_destroyWeak((id *)&self->_actionManagerProvider);
  objc_storeStrong((id *)&self->_importDeviceQueue, 0);

  objc_storeStrong((id *)&self->_importViewController, 0);
}

- (void)setUndoActionsInvalidator:(id)a3
{
}

- (PXUndoActionsInvalidator)undoActionsInvalidator
{
  return self->_undoActionsInvalidator;
}

- (BOOL)hiddenAlbumIsVisible
{
  return self->_hiddenAlbumIsVisible;
}

- (void)setIPhotoMigrationAlertController:(id)a3
{
}

- (PXAlertController)iPhotoMigrationAlertController
{
  return self->_iPhotoMigrationAlertController;
}

- (void)_setNebulaDaemonProxyManager:(id)a3
{
}

- (CAMNebulaDaemonProxyManager)_nebulaDaemonProxyManager
{
  return self->__nebulaDaemonProxyManager;
}

- (void)_performActionType:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = a3;
  [(PhotosApplication *)self invalidateActionManagerProvider];
  id v9 = [(PhotosApplication *)self assetActionManager];
  if ([v9 canPerformActionType:v7])
  {
    id v8 = [v9 actionPerformerForActionType:v7];

    [v8 performActionWithCompletionHandler:v6];
  }
  else
  {
    id v8 = +[NSError px_genericErrorWithDebugDescription:@"Cannot perform action: \"%@\"", v7];

    v6[2](v6, 0, v8);
  }
}

- (void)pasteEditsOnSelectedAssetsWithCompletionHandler:(id)a3
{
  unsigned int v10 = a3;
  id v4 = [(PhotosApplication *)self contentViewController];
  id v5 = [v4 view];
  id v6 = [v5 window];
  id v7 = [v6 _responderForKeyEvents];

  if (v7)
  {
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v8 = [(PhotosApplication *)v7 nextResponder];

      id v7 = (PhotosApplication *)v8;
      if (!v8) {
        goto LABEL_4;
      }
    }
    if (v7 == self) {
      [(PhotosApplication *)self invalidateActionManagerProvider];
    }
    [(PhotosApplication *)v7 performSelector:"pasteAdjustments:" withObject:0];
    id v9 = (void (*)(void))v10[2];
  }
  else
  {
LABEL_4:
    id v7 = +[NSError px_genericErrorWithDebugDescription:@"Cannot perform action: PasteEdits"];
    id v9 = (void (*)(void))v10[2];
  }
  v9();
}

- (void)copyEditsFromSelectedAssetWithCompletionHandler:(id)a3
{
  unsigned int v10 = a3;
  id v4 = [(PhotosApplication *)self contentViewController];
  id v5 = [v4 view];
  id v6 = [v5 window];
  id v7 = [v6 _responderForKeyEvents];

  if (v7)
  {
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v8 = [(PhotosApplication *)v7 nextResponder];

      id v7 = (PhotosApplication *)v8;
      if (!v8) {
        goto LABEL_4;
      }
    }
    if (v7 == self) {
      [(PhotosApplication *)self invalidateActionManagerProvider];
    }
    [(PhotosApplication *)v7 performSelector:"copyAdjustmentsSkippingOptions:" withObject:0];
    id v9 = (void (*)(void))v10[2];
  }
  else
  {
LABEL_4:
    id v7 = +[NSError px_genericErrorWithDebugDescription:@"Cannot perform action: CopyEdits"];
    id v9 = (void (*)(void))v10[2];
  }
  v9();
}

- (void)performEditRequestWithAdjustments:(id)a3 completionHandler:(id)a4
{
  id v17 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (v17)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PhotosApplication.m", 1059, @"Invalid parameter not satisfying: %@", @"adjustments" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  long long v15 = +[NSAssertionHandler currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PhotosApplication.m", 1060, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  uint64_t v8 = [(PhotosApplication *)self keyRootViewController];
  if (+[PUPhotoEditPendingEditsRequest canPerformEditsWithRootViewController:v8])
  {
    id v9 = [objc_alloc((Class)PUPhotoEditPendingEditsRequest) initWithAdjustments:v17 rootViewController:v8];
    [v9 submitWithCompletionHandler:v7];
    goto LABEL_14;
  }
  id v9 = [v17 firstObject];
  if (!v9)
  {
    __int16 v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PhotosApplication.m", 1074, @"Invalid parameter not satisfying: %@", @"adjustment" object file lineNumber description];
  }
  id v10 = [v9 category];
  if (v10 == (id)8)
  {
    unsigned int v12 = [v9 clockwise];
    id v11 = &PXAssetActionTypeEditRotateRight;
    if (!v12) {
      id v11 = &PXAssetActionTypeEditRotateLeft;
    }
    goto LABEL_12;
  }
  if (!v10)
  {
    id v11 = &PXAssetActionTypeEditAdjustAutoEnhance;
LABEL_12:
    [(PhotosApplication *)self _performActionType:*v11 completionHandler:v7];
    goto LABEL_14;
  }
  id v13 = +[NSError px_genericErrorWithDebugDescription:@"Unsupported category: %ld", v10];
  v7[2](v7, 0, v13);

LABEL_14:
}

- (void)provideImageForPerson:(id)a3 size:(CGSize)a4 completionHandler:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a5;
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!v11)
  {
    long long v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PhotosApplication.m", 1044, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    id v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PhotosApplication.m", 1045, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  unsigned int v12 = [(PhotosApplication *)self photosWindowSceneDelegate];
  [v12 screenScale];
  double v14 = v13;

  id v15 = [objc_alloc((Class)PXPeopleFaceCropFetchOptions) initWithPerson:v11 targetSize:width displayScale:height];
  [v15 setDeliveryMode:2];
  __int16 v16 = +[PXPeopleFaceCropManager sharedManager];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001F618;
  v20[3] = &unk_100062910;
  id v21 = v10;
  id v17 = v10;
  [v16 requestFaceCropForOptions:v15 resultHandler:v20];
}

- (void)navigateToURLDestination:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!v8)
  {
    long long v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PhotosApplication.m", 968, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001F890;
  v20[3] = &unk_1000628A8;
  id v9 = v7;
  id v21 = v9;
  v22 = self;
  SEL v24 = a2;
  id v10 = v8;
  id v23 = v10;
  id v11 = objc_retainBlock(v20);
  unsigned int v12 = v11;
  if (self->_canSatisfyAppIntentsURLNavigationRequests)
  {
    ((void (*)(void *))v11[2])(v11);
  }
  else
  {
    double v13 = PLAppIntentsGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Defer App Intents URL navigation request", buf, 2u);
    }

    appIntentsURLNavigationRequests = self->_appIntentsURLNavigationRequests;
    if (!appIntentsURLNavigationRequests)
    {
      id v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      __int16 v16 = self->_appIntentsURLNavigationRequests;
      self->_appIntentsURLNavigationRequests = v15;

      appIntentsURLNavigationRequests = self->_appIntentsURLNavigationRequests;
    }
    id v17 = objc_retainBlock(v12);
    [(NSMutableArray *)appIntentsURLNavigationRequests addObject:v17];
  }
}

- (void)providePhotoLibrary:(id)a3
{
  id v5 = (void (**)(id, id))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!v5)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PhotosApplication.m", 958, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  -[PhotosApplication px_photoLibrary]_0();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v7);
}

- (PXCollectionActionReceiver)keyCollectionActionReceiver
{
  id v2 = [(PhotosApplication *)self photosWindowSceneDelegate];
  id v3 = [v2 collectionActionReceiver];

  return (PXCollectionActionReceiver *)v3;
}

- (id)importViewControllerInstanceHost
{
  id v2 = [(PhotosApplication *)self photosWindowSceneDelegate];
  id v3 = [v2 importViewControllerInstanceHost];

  return v3;
}

- (UIViewController)keyRootViewController
{
  id v2 = [(PhotosApplication *)self photosWindowSceneDelegate];
  id v3 = [v2 rootViewController];

  return (UIViewController *)v3;
}

- (PXRootLibraryNavigationController)lemonadeRootViewController
{
  id v2 = [(PhotosApplication *)self photosWindowSceneDelegate];
  [v2 lemonadeRootViewController];

  id v3 = [v2 lemonadeRootViewController];

  return (PXRootLibraryNavigationController *)v3;
}

- (id)keySpec
{
  id v2 = [(PhotosApplication *)self photosWindowSceneDelegate];
  id v3 = [v2 spec];

  return v3;
}

- (id)importViewControllerForImportSource:(id)a3
{
  return self->_importViewController;
}

- (void)performNebuladCrashRecoveryIfNeededForceEndLastTimelapseSession:(BOOL)a3
{
  if (qword_100073330 != -1) {
    dispatch_once(&qword_100073330, &stru_100062830);
  }
  objc_initWeak(&location, self);
  id v5 = qword_100073328;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FFAC;
  block[3] = &unk_100062858;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_async(v5, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)importController:(id)a3 removedImportSource:(id)a4
{
  id v5 = a4;
  id v6 = PLCameraConnectionKitGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "_importDeviceRemoved", buf, 2u);
  }

  id v7 = [v5 uuid];
  BOOL v8 = [(PUImportViewController *)self->_importViewController importSource];
  id v9 = [v8 uuid];

  if ([v7 isEqualToString:v9])
  {
    [(PhotosApplication *)self _dequeueNextImportDevice];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = self->_importDeviceQueue;
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
LABEL_7:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
        __int16 v16 = [v15 uuid];
        if ([v16 isEqualToString:v7]) {
          break;
        }

        if (v12 == (id)++v14)
        {
          id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
          if (v12) {
            goto LABEL_7;
          }
          goto LABEL_16;
        }
      }
      id v17 = v15;

      if (!v17) {
        goto LABEL_17;
      }
      [(NSMutableArray *)self->_importDeviceQueue removeObject:v17];
      id v10 = v17;
    }
LABEL_16:
  }
LABEL_17:
}

- (void)importController:(id)a3 addedImportSource:(id)a4
{
  id v5 = a4;
  id v6 = PLCameraConnectionKitGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "_importDeviceAdded", buf, 2u);
  }

  id v7 = [v5 uuid];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v8 = self->_importDeviceQueue;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      id v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v12) uuid:(void)v19];
        unsigned __int8 v14 = [v13 isEqualToString:v7];

        if (v14)
        {

          goto LABEL_16;
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  importDeviceQueue = self->_importDeviceQueue;
  if (!importDeviceQueue)
  {
    __int16 v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v17 = self->_importDeviceQueue;
    self->_importDeviceQueue = v16;

    importDeviceQueue = self->_importDeviceQueue;
  }
  -[NSMutableArray addObject:](importDeviceQueue, "addObject:", v5, (void)v19);
  long long v18 = [(PUImportViewController *)self->_importViewController importSource];

  if (!v18) {
    [(PhotosApplication *)self _dequeueNextImportDevice];
  }
LABEL_16:
}

- (void)_showAppleMusicPromptsIfNecessaryWithCompletion:(id)a3
{
  id v5 = (void (**)(void))a3;
  id v3 = +[PXStorySettings sharedInstance];
  id v4 = [v3 appleMusicPromptTrigger];

  if (v4) {
    v5[2]();
  }
  else {
    +[PXAppleMusicPrompter showPromptsIfNeededWithCompletion:v5];
  }
}

- (void)_showWelcomeViewControllersIfNecessaryWithCompletion:(id)a3
{
  id v6 = (void (**)(void))a3;
  if ([(PhotosApplication *)self launchedToTest])
  {
    v6[2]();
  }
  else
  {
    id v4 = [(PhotosApplication *)self keyRootViewController];
    id v5 = +[PUWelcomeViewControllersManager defaultManager];
    [v5 presentWelcomeViewControllersIfNecessaryFromViewController:v4 completion:v6];
  }
}

- (void)_showSyncReminderPromptIfNecessary
{
  v26 = [(PhotosApplication *)self px_photoLibrary];
  if (![v26 isCloudPhotoLibraryEnabled]) {
    goto LABEL_10;
  }
  id v3 = [v26 cplStatus];
  id v4 = [v3 lastSuccessfulSyncDate];
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 objectForKey:@"CPLSyncReminderLastPromptDate"];

  id v7 = +[NSDate date];
  BOOL v8 = v7;
  if (!v4)
  {
    BOOL v10 = 1;
    if (v6) {
      goto LABEL_4;
    }
LABEL_6:
    BOOL v12 = 0;
    goto LABEL_7;
  }
  [v7 timeIntervalSinceDate:v4];
  BOOL v10 = v9 <= 604800.0;
  if (!v6) {
    goto LABEL_6;
  }
LABEL_4:
  [v8 timeIntervalSinceDate:v6];
  BOOL v12 = v11 <= 604800.0;
LABEL_7:
  if (!v10 && !v12)
  {
    uint64_t v13 = +[NSCalendar currentCalendar];
    SEL v24 = [v13 components:16 fromDate:v4 toDate:v8 options:0];

    v25 = v3;
    id v14 = [v24 day];
    id v15 = +[NSUserDefaults standardUserDefaults];
    [v15 setObject:v8 forKey:@"CPLSyncReminderLastPromptDate"];

    __int16 v16 = PULocalizedString();
    id v23 = v14;
    id v17 = PFLocalizedStringWithValidatedFormat();
    long long v18 = PULocalizedString();
    long long v19 = PULocalizedString();
    long long v20 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v17, v18, 1, v23);
    long long v21 = +[UIAlertAction actionWithTitle:v19 style:1 handler:0];
    [v20 addAction:v21];

    long long v22 = [(PhotosApplication *)self px_firstKeyWindow];
    [v22 pl_presentViewController:v20 animated:1];

    id v3 = v25;
  }

LABEL_10:

  _objc_release_x1();
}

- (void)_showCloudPhotoLibraryExitPromptIfNecessary
{
  if ((PXCPLIsInTestReadonlyMode() & 1) == 0)
  {
    id v3 = [(PhotosApplication *)self px_photoLibrary];
    id v4 = [v3 cplStatus];
    id v5 = [v4 exitDeleteTime];
    id v6 = v5;
    if (!v5)
    {
LABEL_14:

      return;
    }
    [v5 timeIntervalSince1970];
    BOOL v8 = +[NSString stringWithFormat:@"CPLExitWarningPromptShownforExitDate:%f", v7];
    double v9 = +[NSUserDefaults standardUserDefaults];
    BOOL v10 = [v9 dictionaryForKey:v8];
    id v11 = [v10 mutableCopy];

    if (!v11) {
      id v11 = (id)objc_opt_new();
    }
    uint64_t v12 = PXCPLNumberOfCalendarDaysUntilDate();
    uint64_t v13 = v12;
    if (v12 < 8)
    {
      if (v12 < 2)
      {
        if (v12 != 1)
        {
LABEL_13:

          goto LABEL_14;
        }
        CFStringRef v14 = @"1";
      }
      else
      {
        CFStringRef v14 = @"7";
      }
    }
    else
    {
      CFStringRef v14 = @"30";
    }
    id v15 = [v11 objectForKeyedSubscript:v14];

    if (!v15)
    {
      [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:v14];
      __int16 v16 = +[NSUserDefaults standardUserDefaults];
      [v16 setObject:v11 forKey:v8];

      v30 = PULocalizedString();
      v29 = PULocalizedString();
      v28 = PFLocalizedStringWithValidatedFormat();
      v27 = PFLocalizedStringWithValidatedFormat();
      v26 = PULocalizedString();
      v25 = PULocalizedString();
      id v17 = (objc_class *)objc_opt_class();
      long long v18 = NSStringFromClass(v17);
      long long v19 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v28, v27, 1, v13);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100020F94;
      v34[3] = &unk_100062810;
      uint64_t v36 = v13;
      id v20 = v18;
      id v35 = v20;
      long long v21 = +[UIAlertAction actionWithTitle:v25 style:0 handler:v34];
      [v19 addAction:v21];

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100020FE0;
      v31[3] = &unk_100062810;
      id v32 = v20;
      uint64_t v33 = v13;
      id v22 = v20;
      id v23 = +[UIAlertAction actionWithTitle:v26 style:0 handler:v31];
      [v19 addAction:v23];

      SEL v24 = [(PhotosApplication *)self px_firstKeyWindow];
      [v24 pl_presentViewController:v19 animated:1];
    }
    goto LABEL_13;
  }
}

- (void)handleOAuthRedirectURL:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2050000000;
  id v4 = (void *)qword_100073338;
  uint64_t v17 = qword_100073338;
  if (!qword_100073338)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = sub_100021338;
    long long v19 = &unk_1000643A0;
    id v20 = &v14;
    sub_100021338((uint64_t)buf);
    id v4 = (void *)v15[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v14, 8);
  id v6 = [v5 sharedInstance:v14];
  unsigned int v7 = [v6 handleOAuthRedirectURL:v3];
  BOOL v8 = PLUIGetLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      BOOL v10 = [v3 scheme];
      id v11 = [v3 path];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handled OAuth Redirect url %@:%@", buf, 0x16u);
    }
  }
  else if (v9)
  {
    uint64_t v12 = [v3 scheme];
    uint64_t v13 = [v3 path];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to handle OAuth Redirect url %@:%@", buf, 0x16u);
  }
}

- (void)handleImportCompleteAlertResponse:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
}

- (void)_tearDownImportViewController
{
  id v5 = [(PUImportViewController *)self->_importViewController importSource];
  [(PUImportViewController *)self->_importViewController setImportSource:0];
  importViewController = self->_importViewController;
  self->_importViewController = 0;

  id v4 = [(PhotosApplication *)self importViewControllerInstanceHost];
  [v4 setImportViewController:0 forImportSource:v5];
}

- (void)_dequeueNextImportDevice
{
  id v3 = [(NSMutableArray *)self->_importDeviceQueue firstObject];
  id v4 = PLCameraConnectionKitGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    BOOL v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "_dequeueNextImportDevice: %@", (uint8_t *)&v8, 0xCu);
  }

  if (v3)
  {
    [(NSMutableArray *)self->_importDeviceQueue removeObjectAtIndex:0];
    if (self->_importViewController) {
      [(PhotosApplication *)self _tearDownImportViewController];
    }
    id v5 = [(PhotosApplication *)self _newImportViewController];
    importViewController = self->_importViewController;
    self->_importViewController = v5;

    [(PUImportViewController *)self->_importViewController setImportSource:v3];
    unsigned int v7 = [(PhotosApplication *)self importViewControllerInstanceHost];
    [v7 setImportViewController:self->_importViewController forImportSource:v3];
  }
  else
  {
    [(PhotosApplication *)self _tearDownImportViewController];
  }
}

- (id)_newImportViewController
{
  id v3 = [(PhotosApplication *)self keySpec];
  if (!v3)
  {
    id v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_newImportViewController: PhotosAppSpec from keySpec is nil; it may be too early to access our connected scene. "
        "Instantiating a PhotosAppSpec from our current interface idiom as a fallback.",
        v11,
        2u);
    }

    id v5 = +[UIDevice currentDevice];
    id v3 = +[PhotosAppSpec specForIdiom:](PhotosAppSpec, "specForIdiom:", [v5 userInterfaceIdiom]);
  }
  id v6 = objc_alloc((Class)PUImportViewController);
  unsigned int v7 = [v3 importViewControllerSpec];
  int v8 = [(PhotosApplication *)self px_photoLibrary];
  id v9 = [v6 initWithSpec:v7 photoLibrary:v8];

  return v9;
}

- (void)_beginUndoActionsInvalidator
{
  id v2 = [(PhotosApplication *)self px_photoLibrary];
  id v3 = [v2 librarySpecificFetchOptions];
  id v4 = +[PHAssetCollection fetchAssetCollectionsWithType:2 subtype:1000000201 options:v3];
  id v5 = [v4 firstObject];

  id v6 = v5;
  px_dispatch_on_main_queue();
}

- (void)_userDidTakeScreenshot:(id)a3
{
  if (![(PhotosApplication *)self applicationState])
  {
    id v7 = +[UIApplication pu_debugCurrentAsset];
    if (v7)
    {
      id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v4 = v7;
      }
      else {
        id v4 = 0;
      }
      [v3 setObject:v4 forKeyedSubscript:CPAnalyticsPayloadAssetsKey];
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      [v3 setObject:v6 forKeyedSubscript:CPAnalyticsPayloadClassNameKey];

      +[CPAnalytics sendEvent:CPAnalyticsEventScreenshotTaken withPayload:v3];
    }
  }
}

- (id)stateCaptureDictionary
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100021D44;
  BOOL v10 = sub_100021D54;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100021D5C;
  v5[3] = &unk_1000643A0;
  v5[4] = &v6;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);
  uint64_t v2 = v7[5];
  CFStringRef v12 = @"currentAssetUUID";
  uint64_t v13 = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, void))a5;
  id v9 = [v7 request];
  BOOL v10 = [v9 content];
  id v11 = [v10 userInfo];
  CFStringRef v12 = [v11 objectForKeyedSubscript:kNotificationKeySuppresionContexts];

  if ([v12 count]) {
    +[NSSet setWithArray:v12];
  }
  else {
  uint64_t v13 = +[NSSet set];
  }
  uint64_t v14 = [(PhotosApplication *)self notificationSuppressionContexts];
  unsigned int v15 = [v14 intersectsSet:v13];

  if (v15)
  {
    uint64_t v16 = PLUIGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Suppressing notification: %@", (uint8_t *)&v17, 0xCu);
    }

    v8[2](v8, 0);
  }
  else
  {
    v8[2](v8, 27);
  }
}

- (void)_showUserNotificationsPromptIfNecessaryWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[UNUserNotificationCenter currentNotificationCenter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100022038;
  v6[3] = &unk_100062AF0;
  id v7 = v3;
  id v5 = v3;
  [v4 requestAuthorizationWithOptions:7 completionHandler:v6];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PhotosApplication;
  [(PhotosApplication *)&v5 pressesBegan:a3 withEvent:a4];
  [(PhotosApplication *)self invalidateActionManagerProvider];
}

- (void)prepareForApplicationDidEnterBackground
{
  v2.receiver = self;
  v2.super_class = (Class)PhotosApplication;
  [(PhotosApplication *)&v2 prepareForApplicationDidEnterBackground];
  +[PhotosAppShortcutsProviderWrapper updateAppShortcutParameters];
}

- (void)invalidateActionManagerProvider
{
}

- (PXActionManager)assetActionManager
{
  id v3 = [(PhotosApplication *)self contentViewController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionManagerProvider);

  if (WeakRetained) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    uint64_t v6 = [v3 view];
    id v7 = [v6 window];
    id v8 = [v7 _responderForKeyEvents];

    if (v8)
    {
      while ((objc_opt_respondsToSelector() & 1) == 0)
      {
        uint64_t v9 = [v8 nextResponder];

        id v8 = (id)v9;
        if (!v9) {
          goto LABEL_10;
        }
      }
      id v8 = v8;
    }
LABEL_10:
    objc_storeWeak((id *)&self->_actionManagerProvider, v8);
  }
  id v10 = objc_loadWeakRetained((id *)&self->_actionManagerProvider);
  if (v10)
  {
    id v11 = (PhotosApplication *)objc_loadWeakRetained((id *)&self->_actionManagerProvider);
    if (v11 == self)
    {
      uint64_t v13 = 0;
    }
    else
    {
      id v12 = objc_loadWeakRetained((id *)&self->_actionManagerProvider);
      uint64_t v13 = [v12 assetActionManager];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return (PXActionManager *)v13;
}

- (NSUndoManager)fallbackUndoManager
{
  objc_super v2 = [(PhotosApplication *)self contentViewController];
  id v3 = [v2 undoManager];

  return (NSUndoManager *)v3;
}

- (UIViewController)contentViewController
{
  objc_super v2 = [(PhotosApplication *)self keyRootViewController];
  id v3 = [v2 view];
  id v4 = [v3 window];
  if (v4)
  {
LABEL_7:
  }
  else
  {
    while (1)
    {
      uint64_t v6 = [v2 presentedViewController];

      if (!v6) {
        break;
      }
      BOOL v5 = [v2 presentedViewController];

      id v3 = [v5 view];
      id v4 = [v3 window];
      objc_super v2 = v5;
      if (v4)
      {
        objc_super v2 = v5;
        goto LABEL_7;
      }
    }
  }

  return (UIViewController *)v2;
}

+ (void)_donateTipsAppPhotosSignals
{
  objc_super v2 = +[PHPhotoLibrary px_systemPhotoLibrary];
  id v7 = [v2 librarySpecificFetchOptions];

  id v3 = +[PHCollection fetchTopLevelUserCollectionsWithOptions:v7];
  id v4 = [v3 count];

  if (v4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 3;
  }
  +[PXTipsAppDonation donateSignalForEvent:v5];
  if (PLIsCloudPhotoLibraryEnabledForCurrentUser()) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 5;
  }
  +[PXTipsAppDonation donateSignalForEvent:v6];
}

- (void)showInternalSettings:(id)a3
{
}

- (void)revertAdjustments:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = [v3 actionPerformerForActionType:PXAssetActionTypeRevertAdjustments];

  [v4 performActionWithCompletionHandler:0];
}

- (void)pasteAdjustments:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = [v3 actionPerformerForActionType:PXAssetActionTypePasteAdjustments];

  [v4 performActionWithCompletionHandler:0];
}

- (void)copyAdjustmentsSkippingOptions:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = [v3 actionPerformerForActionType:PXAssetActionTypeCopyAdjustmentsSkippingOptions];

  [v4 performActionWithCompletionHandler:0];
}

- (void)copyAdjustments:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = [v3 actionPerformerForActionType:PXAssetActionTypeCopyAdjustments];

  [v4 performActionWithCompletionHandler:0];
}

- (void)mergeDuplicatesWithoutConfirmation:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = [v3 actionPerformerForActionType:PXAssetActionTypeMergeDuplicatesWithoutConfirmation];

  [v4 performActionWithCompletionHandler:0];
}

- (void)mergeDuplicates:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = [v3 actionPerformerForActionType:PXAssetActionTypeMergeDuplicates];

  [v4 performActionWithCompletionHandler:0];
}

- (void)trashAssetsWithoutConfirmation:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = PLUIActionsGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trashing assets without confirmation", v7, 2u);
  }

  uint64_t v5 = PXAssetActionTypeTrashNoConfirm;
  if (([v3 canPerformActionType:PXAssetActionTypeTrashNoConfirm] & 1) != 0
    || (uint64_t v5 = PXAssetActionTypeDelete, [v3 canPerformActionType:PXAssetActionTypeDelete]))
  {
    uint64_t v6 = [v3 actionPerformerForActionType:v5];
    [v6 performActionWithCompletionHandler:0];
  }
}

- (void)trashAssets:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  uint64_t v4 = PXAssetActionTypeRemove;
  id v6 = v3;
  if (([v3 canPerformActionType:PXAssetActionTypeRemove] & 1) != 0
    || (uint64_t v4 = PXAssetActionTypeTrash,
        ([v6 canPerformActionType:PXAssetActionTypeTrash] & 1) != 0)
    || (uint64_t v4 = PXAssetActionTypeDelete, [v6 canPerformActionType:PXAssetActionTypeDelete]))
  {
    uint64_t v5 = [v6 actionPerformerForActionType:v4];
    [v5 performActionWithCompletionHandler:0];
  }
}

- (void)makeKeyPhoto:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  uint64_t v4 = PXAssetActionTypeAlbumMakeKeyPhoto;
  id v6 = v3;
  if (([v3 canPerformActionType:PXAssetActionTypeAlbumMakeKeyPhoto] & 1) != 0
    || (uint64_t v4 = PXAssetActionTypePersonMakeKeyPhoto,
        ([v6 canPerformActionType:PXAssetActionTypePersonMakeKeyPhoto] & 1) != 0)
    || (uint64_t v4 = PXAssetActionTypeStoryMakeKeyPhoto,
        [v6 canPerformActionType:PXAssetActionTypeStoryMakeKeyPhoto]))
  {
    uint64_t v5 = [v6 actionPerformerForActionType:v4];
    [v5 performActionWithCompletionHandler:0];
  }
}

- (void)favoriteAssets:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = [v3 actionPerformerForActionType:PXAssetActionTypeToggleFavorite];

  [v4 performActionWithCompletionHandler:0];
}

- (void)hideAssets:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = [v3 actionPerformerForActionType:PXAssetActionTypeHide];

  [v4 performActionWithCompletionHandler:0];
}

- (void)duplicateAssets:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = [v3 actionPerformerForActionType:PXAssetActionTypeDuplicate];

  [v4 performActionWithCompletionHandler:0];
}

- (void)addAssetsToLastUsedAlbum:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = [v3 actionPerformerForActionType:PXAssetActionTypeAddToLastUsedAlbum];

  [v4 performActionWithCompletionHandler:0];
}

- (void)addAssetsToAlbum:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = [v3 actionPerformerForActionType:PXAssetActionTypeAddToAlbum];

  [v4 performActionWithCompletionHandler:0];
}

- (void)shareAssets:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = [v3 actionPerformerForActionType:PXAssetActionTypeShare];

  [v4 performActionWithCompletionHandler:0];
}

- (void)printAssets:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = [v3 actionPerformerForActionType:PXAssetActionTypePrint];

  [v4 performActionWithCompletionHandler:0];
}

- (void)copy:(id)a3
{
  id v3 = [(PhotosApplication *)self assetActionManager];
  id v4 = [v3 actionPerformerForActionType:PXAssetActionTypeCopy];

  [v4 performActionWithCompletionHandler:0];
}

- (void)redo:(id)a3
{
  id v3 = [(PhotosApplication *)self fallbackUndoManager];
  [v3 redo];
}

- (void)undo:(id)a3
{
  id v3 = [(PhotosApplication *)self fallbackUndoManager];
  [v3 undo];
}

- (void)find:(id)a3
{
  id v6 = [objc_alloc((Class)PXProgrammaticNavigationDestination) initWithType:14 revealMode:1];
  id v4 = [objc_alloc((Class)PXProgrammaticNavigationRequest) initWithDestination:v6 options:0 completionHandler:0];
  uint64_t v5 = [(PhotosApplication *)self keyRootViewController];
  PXProgrammaticNavigationRequestExecute();
}

- (void)validateCommand:(id)a3
{
  id v9 = a3;
  if ([v9 action] == "find:")
  {
    uint64_t v5 = PXLocalizedString();
    [v9 setDiscoverabilityTitle:v5];
  }
  else
  {
    if ([v9 action] == "undo:")
    {
      uint64_t v5 = [(PhotosApplication *)self fallbackUndoManager];
      uint64_t v7 = [v5 undoMenuItemTitle];
    }
    else if ([v9 action] == "redo:")
    {
      uint64_t v5 = [(PhotosApplication *)self fallbackUndoManager];
      uint64_t v7 = [v5 redoMenuItemTitle];
    }
    else
    {
      if ([v9 action] == "hideAssets:")
      {
        id v4 = [(PhotosApplication *)self assetActionManager];
        uint64_t v5 = v4;
        id v6 = &PXAssetActionTypeHide;
      }
      else if ([v9 action] == "favoriteAssets:")
      {
        id v4 = [(PhotosApplication *)self assetActionManager];
        uint64_t v5 = v4;
        id v6 = &PXAssetActionTypeToggleFavorite;
      }
      else
      {
        if ([v9 action] != "addAssetsToLastUsedAlbum:") {
          goto LABEL_16;
        }
        id v4 = [(PhotosApplication *)self assetActionManager];
        uint64_t v5 = v4;
        id v6 = &PXAssetActionTypeAddToLastUsedAlbum;
      }
      uint64_t v7 = [v4 localizedTitleForActionType:*v6 useCase:1];
    }
    id v8 = (void *)v7;
    [v9 setDiscoverabilityTitle:v7];
  }
LABEL_16:
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if ("newAlbum:" == a3 || "newSharedAlbum:" == a3 || "newSmartAlbum:" == a3 || "newFolder:" == a3)
  {
    uint64_t v7 = [(PhotosApplication *)self keyCollectionActionReceiver];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PhotosApplication;
    uint64_t v7 = -[PhotosApplication targetForAction:withSender:](&v9, "targetForAction:withSender:");
  }

  return v7;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PhotosApplication *)self assetActionManager];
  id v8 = v7;
  if ("undo:" == a3)
  {
    id v10 = [(PhotosApplication *)self fallbackUndoManager];
    unsigned __int8 v11 = [v10 canUndo];
LABEL_21:
    BOOL v12 = v11;

    goto LABEL_44;
  }
  if ("redo:" == a3)
  {
    id v10 = [(PhotosApplication *)self fallbackUndoManager];
    unsigned __int8 v11 = [v10 canRedo];
    goto LABEL_21;
  }
  if ("copy:" == a3)
  {
    uint64_t v13 = &PXAssetActionTypeCopy;
    goto LABEL_42;
  }
  if ("printAssets:" == a3)
  {
    uint64_t v13 = &PXAssetActionTypePrint;
    goto LABEL_42;
  }
  if ("makeKeyPhoto:" == a3)
  {
    if (([v7 canPerformActionType:PXAssetActionTypeAlbumMakeKeyPhoto] & 1) == 0
      && ([v8 canPerformActionType:PXAssetActionTypePersonMakeKeyPhoto] & 1) == 0)
    {
      uint64_t v13 = &PXAssetActionTypeStoryMakeKeyPhoto;
      goto LABEL_42;
    }
  }
  else
  {
    if ("shareAssets:" == a3)
    {
      uint64_t v13 = &PXAssetActionTypeShare;
      goto LABEL_42;
    }
    if ("addAssetsToAlbum:" == a3)
    {
      uint64_t v13 = &PXAssetActionTypeAddToAlbum;
      goto LABEL_42;
    }
    if ("addAssetsToLastUsedAlbum:" == a3)
    {
      uint64_t v13 = &PXAssetActionTypeAddToLastUsedAlbum;
      goto LABEL_42;
    }
    if ("duplicateAssets:" == a3)
    {
      uint64_t v13 = &PXAssetActionTypeDuplicate;
      goto LABEL_42;
    }
    if ("hideAssets:" == a3)
    {
      uint64_t v13 = &PXAssetActionTypeHide;
      goto LABEL_42;
    }
    if ("favoriteAssets:" == a3)
    {
      uint64_t v13 = &PXAssetActionTypeToggleFavorite;
      goto LABEL_42;
    }
    if ("trashAssets:" != a3)
    {
      if ("copyAdjustments:" == a3)
      {
        uint64_t v13 = &PXAssetActionTypeCopyAdjustments;
      }
      else if ("copyAdjustmentsSkippingOptions:" == a3)
      {
        uint64_t v13 = &PXAssetActionTypeCopyAdjustmentsSkippingOptions;
      }
      else if ("pasteAdjustments:" == a3)
      {
        uint64_t v13 = &PXAssetActionTypePasteAdjustments;
      }
      else if ("revertAdjustments:" == a3)
      {
        uint64_t v13 = &PXAssetActionTypeRevertAdjustments;
      }
      else
      {
        if ("mergeDuplicates:" != a3)
        {
          v15.receiver = self;
          v15.super_class = (Class)PhotosApplication;
          unsigned __int8 v9 = [(PhotosApplication *)&v15 canPerformAction:a3 withSender:v6];
LABEL_43:
          BOOL v12 = v9;
          goto LABEL_44;
        }
        uint64_t v13 = &PXAssetActionTypeMergeDuplicates;
      }
LABEL_42:
      unsigned __int8 v9 = [v8 canPerformActionType:*v13];
      goto LABEL_43;
    }
    if (([v7 canPerformActionType:PXAssetActionTypeRemove] & 1) == 0
      && ([v8 canPerformActionType:PXAssetActionTypeTrash] & 1) == 0)
    {
      uint64_t v13 = &PXAssetActionTypeDelete;
      goto LABEL_42;
    }
  }
  BOOL v12 = 1;
LABEL_44:

  return v12;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 system];
  uint64_t v5 = +[UIMenuSystem mainSystem];

  if (v4 == v5)
  {
    v114 = PXLocalizedString();
    v112 = +[UIKeyCommand commandWithTitle:v114 image:0 action:"newAlbum:" input:@"n" modifierFlags:0x100000 propertyList:0];
    v130[0] = v112;
    id v6 = PXLocalizedString();
    uint64_t v7 = +[UIKeyCommand commandWithTitle:v6 image:0 action:"newSharedAlbum:" input:@"n" modifierFlags:1310720 propertyList:0];
    v130[1] = v7;
    id v8 = PXLocalizedString();
    unsigned __int8 v9 = +[UIKeyCommand commandWithTitle:v8 image:0 action:"newSmartAlbum:" input:@"n" modifierFlags:1572864 propertyList:0];
    v130[2] = v9;
    id v10 = PXLocalizedString();
    unsigned __int8 v11 = +[UIKeyCommand commandWithTitle:v10 image:0 action:"newFolder:" input:@"n" modifierFlags:1179648 propertyList:0];
    v130[3] = v11;
    BOOL v12 = +[NSArray arrayWithObjects:v130 count:4];
    uint64_t v13 = 1;
    uint64_t v14 = +[UIMenu menuWithTitle:&stru_1000654D8 image:0 identifier:0 options:1 children:v12];

    v115 = (void *)v14;
    [v3 insertChildMenu:v14 atEndOfMenuForIdentifier:UIMenuFile];
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_100025794;
    v119[3] = &unk_1000629E8;
    v120 = &stru_1000629A0;
    [v3 replaceChildrenOfMenuForIdentifier:UIMenuStandardEdit fromChildrenBlock:v119];
    v116 = v3;
    v117[0] = _NSConcreteStackBlock;
    v117[1] = 3221225472;
    v117[2] = sub_100025870;
    v117[3] = &unk_1000629E8;
    v118 = &stru_1000629A0;
    [v3 replaceChildrenOfMenuForIdentifier:UIMenuFind fromChildrenBlock:v117];
    id v15 = [objc_alloc((Class)NSMutableArray) initWithCapacity:9];
    do
    {
      uint64_t v16 = +[NSNumber numberWithInteger:v13];
      int v17 = [v16 stringValue];
      id v18 = PULocalizedString();
      long long v19 = +[NSString stringWithFormat:@"%@ %@", v18, v17];

      id v20 = +[UIKeyCommand commandWithTitle:v19 image:0 action:"navigateToSegment:" input:v17 modifierFlags:0x100000 propertyList:v16];
      [v15 addObject:v20];

      ++v13;
    }
    while (v13 != 10);
    uint64_t v21 = 1;
    v113 = v15;
    v111 = +[UIMenu menuWithTitle:&stru_1000654D8 image:0 identifier:0 options:1 children:v15];
    [v3 insertChildMenu:atEndOfMenuForIdentifier:];
    id v22 = PULocalizedString();
    id v23 = +[UIKeyCommand commandWithTitle:v22 image:0 action:"navigateToPreviousTab:" input:@"[" modifierFlags:1179648 propertyList:0];
    v129[0] = v23;
    SEL v24 = PULocalizedString();
    v25 = +[UIKeyCommand commandWithTitle:v24 image:0 action:"navigateToNextTab:" input:@"]" modifierFlags:1179648 propertyList:0];
    v129[1] = v25;
    v26 = +[NSArray arrayWithObjects:v129 count:2];
    uint64_t v27 = +[UIMenu menuWithTitle:&stru_1000654D8 image:0 identifier:0 options:1 children:v26];

    v110 = (void *)v27;
    [v3 insertChildMenu:v27 atEndOfMenuForIdentifier:UIMenuView];
    v28 = PULocalizedString();
    v29 = +[UIKeyCommand commandWithTitle:v28 image:0 action:"toggleViewMode:" input:@"t" modifierFlags:0x80000 propertyList:0];
    v128 = v29;
    v30 = +[NSArray arrayWithObjects:&v128 count:1];
    uint64_t v31 = +[UIMenu menuWithTitle:&stru_1000654D8 image:0 identifier:0 options:1 children:v30];

    v109 = (void *)v31;
    [v3 insertChildMenu:v31 atEndOfMenuForIdentifier:UIMenuView];
    id v32 = [objc_alloc((Class)NSMutableArray) initWithCapacity:9];
    do
    {
      uint64_t v33 = +[NSNumber numberWithInteger:v21];
      v34 = [v33 stringValue];
      id v35 = PULocalizedString();
      uint64_t v36 = +[NSString stringWithFormat:@"%@ %@", v35, v34];

      v37 = +[UIKeyCommand commandWithTitle:v36 image:0 action:"toggleFilter:" input:v34 modifierFlags:1572864 propertyList:v33];
      [v32 addObject:v37];

      ++v21;
    }
    while (v21 != 5);
    v108 = v32;
    v107 = +[UIMenu menuWithTitle:&stru_1000654D8 image:0 identifier:0 options:1 children:v32];
    [v3 insertChildMenu:atEndOfMenuForIdentifier:];
    [v3 removeMenuForIdentifier:UIMenuTextSize];
    v38 = PXLocalizedString();
    v39 = +[UIKeyCommand commandWithTitle:v38 image:0 action:"zoomIn:" input:@"+" modifierFlags:0x100000 propertyList:&__kCFBooleanTrue];
    v127[0] = v39;
    v40 = +[UIKeyCommand keyCommandWithInput:@"=" modifierFlags:0x100000 action:"zoomIn:"];
    v127[1] = v40;
    v41 = PXLocalizedString();
    v42 = +[UIKeyCommand commandWithTitle:v41 image:0 action:"zoomOut:" input:@"-" modifierFlags:0x100000 propertyList:&__kCFBooleanTrue];
    v127[2] = v42;
    v43 = +[UIKeyCommand keyCommandWithInput:@"_" modifierFlags:0x100000 action:"zoomOut:"];
    v127[3] = v43;
    v44 = +[NSArray arrayWithObjects:v127 count:4];
    uint64_t v45 = +[UIMenu menuWithTitle:&stru_1000654D8 image:0 identifier:0 options:1 children:v44];

    v106 = (void *)v45;
    [v3 insertChildMenu:v45 atEndOfMenuForIdentifier:UIMenuView];
    if ((PLHasInternalUI() & 1) != 0 && PLHasInternalDiagnostics())
    {
      v46 = +[UIKeyCommand commandWithTitle:@"Internal Settings" image:0 action:"showInternalSettings:" input:@"," modifierFlags:1572864 propertyList:0];
      v126 = v46;
      v47 = +[NSArray arrayWithObjects:&v126 count:1];
      v48 = +[UIMenu menuWithTitle:&stru_1000654D8 image:0 identifier:0 options:1 children:v47];

      [v3 insertChildMenu:v48 atEndOfMenuForIdentifier:UIMenuView];
    }
    uint64_t v49 = PXMenuImage;
    uint64_t v50 = [v3 menuForIdentifier:PXMenuImage];
    if (!v50)
    {
      v51 = PULocalizedString();
      uint64_t v50 = +[UIMenu menuWithTitle:v51 image:0 identifier:v49 options:1 children:&__NSArray0__struct];

      [v3 insertSiblingMenu:v50 afterMenuForIdentifier:UIMenuView];
    }
    v105 = (void *)v50;
    uint64_t v52 = v49;
    uint64_t v103 = v49;
    v53 = PULocalizedString();
    v54 = +[UIKeyCommand commandWithTitle:v53 image:0 action:"rotateAssetsCounterclockwise:" input:@"r" modifierFlags:0x100000 propertyList:0];
    v125[0] = v54;
    v55 = PULocalizedString();
    v56 = +[UIKeyCommand commandWithTitle:v55 image:0 action:"rotateAssetsClockwise:" input:@"r" modifierFlags:1572864 propertyList:0];
    v125[1] = v56;
    v57 = PULocalizedString();
    v58 = +[UIKeyCommand commandWithTitle:v57 image:0 action:"autoEnhanceAssets:" input:@"e" modifierFlags:0x100000 propertyList:0];
    v125[2] = v58;
    v59 = +[NSArray arrayWithObjects:v125 count:3];
    v104 = +[UIMenu menuWithTitle:&stru_1000654D8 image:0 identifier:0 options:1 children:v59];

    [v116 insertChildMenu:v104 atEndOfMenuForIdentifier:v52];
    [v116 removeMenuForIdentifier:UIMenuTextStyle];
    v102 = PXLocalizedString();
    v101 = +[UIKeyCommand commandWithTitle:v102 image:0 action:"togglePlayback:" input:@" " modifierFlags:0x80000 propertyList:0];
    v124[0] = v101;
    v100 = PXLocalizedString();
    v99 = +[UIKeyCommand commandWithTitle:v100 image:0 action:"toggleInspector:" input:@"i" modifierFlags:0x100000 propertyList:0];
    v124[1] = v99;
    v98 = PXLocalizedString();
    v97 = +[UIKeyCommand commandWithTitle:v98 image:0 action:"shareAssets:" input:@"s" modifierFlags:0x100000 propertyList:0];
    v124[2] = v97;
    v96 = PXLocalizedString();
    v95 = +[UIKeyCommand commandWithTitle:v96 image:0 action:"addAssetsToAlbum:" input:@"a" modifierFlags:1179648 propertyList:0];
    v124[3] = v95;
    v94 = +[PXAddAssetsToLastUsedAssetCollectionAction placeholderCommandTitle];
    v93 = +[UIKeyCommand commandWithTitle:v94 image:0 action:"addAssetsToLastUsedAlbum:" input:@"a" modifierFlags:1310720 propertyList:0];
    v124[4] = v93;
    v92 = PXLocalizedString();
    v91 = +[UIKeyCommand commandWithTitle:v92 image:0 action:"hideAssets:" input:@"l" modifierFlags:0x100000 propertyList:0];
    v124[5] = v91;
    v90 = PXLocalizedString();
    v89 = +[UIKeyCommand commandWithTitle:v90 image:0 action:"makeKeyPhoto:" input:@"k" modifierFlags:1179648 propertyList:0];
    v124[6] = v89;
    v88 = PXLocalizedString();
    v87 = +[UIKeyCommand commandWithTitle:v88 image:0 action:"duplicateAssets:" input:@"d" modifierFlags:0x100000 propertyList:0];
    v124[7] = v87;
    v86 = PULocalizedString();
    v85 = +[UIKeyCommand commandWithTitle:v86 image:0 action:"printAssets:" input:@"p" modifierFlags:0x100000 propertyList:0];
    v124[8] = v85;
    v82 = PXLocalizedString();
    v84 = PXLocalizedString();
    v83 = +[UICommandAlternate alternateWithTitle:v84 action:"trashAssetsWithoutConfirmation:" modifierFlags:0x100000];
    v123 = v83;
    v81 = +[NSArray arrayWithObjects:&v123 count:1];
    v80 = +[UIKeyCommand commandWithTitle:v82 image:0 action:"trashAssets:" input:@"\b" modifierFlags:0 propertyList:0 alternates:v81];
    v124[9] = v80;
    v79 = PXLocalizedString();
    v78 = +[UIKeyCommand commandWithTitle:v79 image:0 action:"favoriteAssets:" input:@"." modifierFlags:0 propertyList:0];
    v124[10] = v78;
    v77 = PULocalizedString();
    v76 = +[UIKeyCommand commandWithTitle:v77 image:0 action:"copyAdjustments:" input:@"c" modifierFlags:1179648 propertyList:0];
    v124[11] = v76;
    v60 = PULocalizedString();
    v61 = +[UIKeyCommand commandWithTitle:v60 image:0 action:"pasteAdjustments:" input:@"v" modifierFlags:1179648 propertyList:0];
    v124[12] = v61;
    v62 = PXLocalizedString();
    id v3 = v116;
    v63 = PXLocalizedString();
    v64 = +[UICommandAlternate alternateWithTitle:v63 action:"mergeDuplicatesWithoutConfirmation:" modifierFlags:1835008];
    v122 = v64;
    v65 = +[NSArray arrayWithObjects:&v122 count:1];
    v66 = +[UIKeyCommand commandWithTitle:v62 image:0 action:"mergeDuplicates:" input:@"m" modifierFlags:1310720 propertyList:0 alternates:v65];
    v124[13] = v66;
    v67 = +[NSArray arrayWithObjects:v124 count:14];
    uint64_t v68 = +[UIMenu menuWithTitle:&stru_1000654D8 image:0 identifier:0 options:1 children:v67];

    v69 = (void *)v68;
    [v116 insertChildMenu:v68 atEndOfMenuForIdentifier:v103];
    v70 = PULocalizedString();
    v71 = +[UIKeyCommand commandWithTitle:v70 image:0 action:"toggleViewer:" input:@" " modifierFlags:0 propertyList:0];
    v121[0] = v71;
    v72 = PULocalizedString();
    v73 = +[UIKeyCommand commandWithTitle:v72 image:0 action:"toggleEditor:" input:@"\r" modifierFlags:0 propertyList:0];
    v121[1] = v73;
    v74 = +[NSArray arrayWithObjects:v121 count:2];
    v75 = +[UIMenu menuWithTitle:&stru_1000654D8 image:0 identifier:0 options:1 children:v74];

    [v116 insertChildMenu:v75 atEndOfMenuForIdentifier:v103];
  }
}

@end