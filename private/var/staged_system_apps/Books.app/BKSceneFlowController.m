@interface BKSceneFlowController
+ (BOOL)isStateRestorationDisabledForThisLaunch;
- (BKAppLaunchCoordinator)launchCoordinator;
- (BKCriticalAlertCoordinating)criticalAlertCoordinator;
- (BKSceneController)accountSceneController;
- (BKSceneController)endOfBookSceneController;
- (BKSceneController)primarySceneController;
- (BKSceneControlling)lastCurrentSceneController;
- (BKSceneFlowController)initWithLaunchCoordinator:(id)a3 criticalAlertCoordinator:(id)a4;
- (BOOL)_areConnectionOptionsForIntents:(id)a3;
- (BOOL)_canReparentRootBar;
- (BOOL)_hasLaunchActionsInConnectionOptions:(id)a3;
- (BOOL)_isStateRestorationAndCanRestoreToAuxiliaryScene:(id)a3;
- (NSArray)bookSceneControllers;
- (NSDictionary)currentEndOfBookSceneOptions;
- (NSMutableArray)pendingAccountSceneCompletionBlocks;
- (NSMutableArray)pendingBookSceneRequestAssetIDs;
- (NSMutableArray)pendingEndOfBookSceneCompletionBlocks;
- (NSMutableArray)pendingPrimarySceneCompletionBlocks;
- (NSMutableDictionary)pendingBookSceneCompletionBlocksByAssetID;
- (NSMutableDictionary)pendingUserActivitiesMap;
- (id)_existingBookSceneSessionForRequestAssetID:(id)a3;
- (id)_existingSceneSessionForPrimaryScene;
- (id)_lastKnownBookPresentingSceneInfoForSceneSession:(id)a3;
- (id)_lastKnownStateRestorationUserInfoForSceneSession:(id)a3;
- (id)_rootViewControllerForViewController:(id)a3;
- (id)anySceneController;
- (id)currentSceneController;
- (id)defaultSceneControllerForTransaction:(id)a3;
- (id)sceneControllerForSceneType:(unint64_t)a3 assetID:(id)a4;
- (id)sceneControllerForViewController:(id)a3;
- (id)sceneControllerForWindow:(id)a3;
- (id)sceneHostingAllViewControllersConformingToProtocol:(id)a3;
- (id)sceneInfoPresentingAssetID:(id)a3;
- (int64_t)closeTypeForForegroundedScene;
- (int64_t)closeTypeForSceneController:(id)a3;
- (void)_attachDebugViewControllerToSceneIfNeeded:(id)a3;
- (void)_consumePendingBookSceneRequestAssetID:(id)a3;
- (void)_finishSceneRequest:(id)a3;
- (void)_flushPendingSceneRequestCompletion:(id)a3;
- (void)_handleErrorForCompletionBlocks:(id)a3;
- (void)_handleSceneConnectionOptionsActions:(id)a3 sceneController:(id)a4;
- (void)_reparentRootBarTo:(id)a3;
- (void)_setupSizeRestrictionsForWindowScene:(id)a3 sceneType:(unint64_t)a4;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
- (void)destroySceneForAssetID:(id)a3;
- (void)didDisconnectScene:(id)a3;
- (void)enumerateSceneController:(id)a3 includeHidden:(BOOL)a4;
- (void)enumerateSceneInfo:(id)a3;
- (void)handleCloseAssetForSceneController:(id)a3 assetPresentingViewController:(id)a4 animated:(BOOL)a5;
- (void)requestAccountScene:(id)a3;
- (void)requestBookSceneWithAssetID:(id)a3 bringExistingToFront:(BOOL)a4 completion:(id)a5;
- (void)requestBookSceneWithAssetID:(id)a3 completion:(id)a4;
- (void)requestEndOfBookSceneWithOptions:(id)a3 completion:(id)a4;
- (void)requestPrimaryOrBookScene:(id)a3;
- (void)requestPrimaryScene:(BOOL)a3 completion:(id)a4;
- (void)requestPrimaryScene:(id)a3;
- (void)requestSceneWithAssetID:(id)a3 bringExistingToFront:(BOOL)a4 completion:(id)a5;
- (void)requestSceneWithAssetID:(id)a3 completion:(id)a4;
- (void)requestTabBarSceneController:(id)a3;
- (void)routeScene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setAccountSceneController:(id)a3;
- (void)setBookSceneControllers:(id)a3;
- (void)setCriticalAlertCoordinator:(id)a3;
- (void)setCurrentEndOfBookSceneOptions:(id)a3;
- (void)setEndOfBookSceneController:(id)a3;
- (void)setLastCurrentSceneController:(id)a3;
- (void)setLaunchCoordinator:(id)a3;
- (void)setPendingAccountSceneCompletionBlocks:(id)a3;
- (void)setPendingBookSceneCompletionBlocksByAssetID:(id)a3;
- (void)setPendingBookSceneRequestAssetIDs:(id)a3;
- (void)setPendingEndOfBookSceneCompletionBlocks:(id)a3;
- (void)setPendingPrimarySceneCompletionBlocks:(id)a3;
- (void)setPendingUserActivitiesMap:(id)a3;
- (void)setPrimarySceneController:(id)a3;
- (void)updateAllAssetPresenterCloseStateTypes;
@end

@implementation BKSceneFlowController

- (BOOL)_areConnectionOptionsForIntents:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_100014A6C(v3);

  return v3 & 1;
}

- (BKSceneController)primarySceneController
{
  primarySceneController = self->_primarySceneController;
  if (!primarySceneController)
  {
    v4 = [BKSceneController alloc];
    id v5 = [(BKSceneFlowController *)self launchCoordinator];
    v6 = [(BKSceneFlowController *)self criticalAlertCoordinator];
    v7 = [(BKSceneController *)v4 initWithSceneType:1 launchCoordinator:v5 criticalAlertCoordinator:v6];
    v8 = self->_primarySceneController;
    self->_primarySceneController = v7;

    primarySceneController = self->_primarySceneController;
  }

  return primarySceneController;
}

- (void)routeScene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v8;
  id v12 = v10;
  objc_opt_class();
  uint64_t v77 = BUDynamicCast();
  HIDWORD(v74) = [(BKSceneFlowController *)self _areConnectionOptionsForIntents:v12];
  v13 = [v8 session];
  uint64_t v14 = [v13 persistentIdentifier];

  v15 = BCSceneLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = [v11 delegate];
    *(_DWORD *)buf = 138544130;
    uint64_t v88 = v14;
    __int16 v89 = 2114;
    v90 = v16;
    __int16 v91 = 2114;
    id v92 = v12;
    __int16 v93 = 1024;
    int v94 = HIDWORD(v74);
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "route scene willConnectToSession: sceneIdentifier=%{public}@, sceneDelegate=%{public}@, connectionOptions=%{public}@, forIntent=%d", buf, 0x26u);
  }
  v78 = (void *)v14;
  id v79 = v12;
  if (+[BKSceneUtilities hasMultiWindowEnabled])
  {
    v80 = v11;
    v17 = [v12 userActivities];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v18 = [v17 countByEnumeratingWithState:&v82 objects:v86 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v83;
      uint64_t v21 = BCContinuationActivityReadBookType;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v83 != v20) {
            objc_enumerationMutation(v17);
          }
          v23 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          v24 = [v23 activityType];
          unsigned int v25 = [v24 isEqualToString:v21];

          if (v25)
          {
            v26 = [(BKSceneFlowController *)self pendingUserActivitiesMap];
            v27 = [v9 persistentIdentifier];
            [v26 setObject:v23 forKeyedSubscript:v27];
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v82 objects:v86 count:16];
      }
      while (v19);
    }

    id v12 = v79;
    v11 = v80;
  }
  v28 = [(BKSceneFlowController *)self pendingUserActivitiesMap];
  v29 = [v9 persistentIdentifier];
  uint64_t v30 = [v28 objectForKeyedSubscript:v29];

  if (+[BKSceneUtilities connectionOptions:v12 hasActivityType:@"BKAccountInfoSceneActivityType"])
  {
    unsigned int v31 = 1;
  }
  else
  {
    v32 = [v9 stateRestorationActivity];
    v33 = [v32 activityType];
    unsigned int v31 = [v33 isEqualToString:@"com.apple.iBooks.sceneStateRestorationForAccountInfo"];
  }
  if (+[BKSceneUtilities connectionOptions:v12 hasActivityType:@"BKEndOfBookSceneActivityType"])
  {
    unsigned int v34 = 1;
  }
  else
  {
    v35 = [v9 stateRestorationActivity];
    v36 = [v35 activityType];
    unsigned int v34 = [v36 isEqualToString:@"com.apple.iBooks.sceneStateRestorationForEndOfBook"];
  }
  v37 = [(BKSceneFlowController *)self pendingBookSceneRequestAssetIDs];
  v76 = (void *)v30;
  BOOL v38 = ((unint64_t)[v37 count] | v30) == 0;

  v39 = [(BKSceneFlowController *)self pendingPrimarySceneCompletionBlocks];
  id v40 = [v39 count];

  unsigned int v41 = [(BKSceneFlowController *)self _isStateRestorationAndCanRestoreToAuxiliaryScene:v9];
  unsigned int v42 = [(BKSceneFlowController *)self _hasLaunchActionsInConnectionOptions:v12];
  unsigned int v43 = 0;
  LODWORD(v74) = v42;
  if (v41 && (v42 & 1) == 0) {
    unsigned int v43 = +[BKSceneUtilities hasMultiWindowEnabled];
  }
  objc_opt_class();
  v44 = [v11 delegate];
  v81 = BUDynamicCast();

  if (v31)
  {
    v45 = [(BKSceneFlowController *)self accountSceneController];
    v46 = v79;
    v47 = (void *)v77;
    goto LABEL_30;
  }
  v46 = v79;
  v47 = (void *)v77;
  if (v34)
  {
    uint64_t v48 = [(BKSceneFlowController *)self endOfBookSceneController];
LABEL_29:
    v45 = (BKSceneController *)v48;
    goto LABEL_30;
  }
  if (HIDWORD(v74)) {
    goto LABEL_28;
  }
  if (v38)
  {
    v67 = [(BKSceneFlowController *)self primarySceneController];
    v68 = [v67 scene];
    v69 = v68;
    unsigned int v70 = v40 ? 0 : v43;

    if (!v69 && !v70)
    {
LABEL_28:
      uint64_t v48 = [(BKSceneFlowController *)self primarySceneController];
      goto LABEL_29;
    }
  }
  v71 = [BKSceneController alloc];
  v72 = [(BKSceneFlowController *)self launchCoordinator];
  v73 = [(BKSceneFlowController *)self criticalAlertCoordinator];
  v45 = [(BKSceneController *)v71 initWithSceneType:0 launchCoordinator:v72 criticalAlertCoordinator:v73];

LABEL_30:
  [(BKSceneFlowController *)self _setupSizeRestrictionsForWindowScene:v47 sceneType:[(_BKBaseSceneController *)v45 sceneType]];
  [v81 setSceneController:v45];
  [(BKSceneController *)v45 scene:v11 willConnectToSession:v9 options:v46];
  if (![(_BKBaseSceneController *)v45 sceneType])
  {
    objc_opt_class();
    v49 = BUDynamicCast();
    v50 = [(BKSceneFlowController *)self bookSceneControllers];
    v51 = [v50 arrayByAddingObject:v49];
    [(BKSceneFlowController *)self setBookSceneControllers:v51];

    [(BKSceneFlowController *)self _consumePendingBookSceneRequestAssetID:v49];
    v52 = [(BKSceneFlowController *)self pendingUserActivitiesMap];
    v53 = [v52 objectForKeyedSubscript:v78];

    if (v53)
    {
      v54 = [(BKSceneFlowController *)self pendingUserActivitiesMap];
      [v54 removeObjectForKey:v78];

      [v49 handleCreateSceneUserActivityWhenReady:v53];
    }
  }
  [(BKSceneFlowController *)self _handleSceneConnectionOptionsActions:v46 sceneController:v45];
  v55 = +[NSUserDefaults standardUserDefaults];
  v56 = [v55 dictionaryForKey:@"PPTStateRestoration"];

  if (!v56) {
    goto LABEL_39;
  }
  id v57 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.iBooks.sceneStateRestoration"];
  [v57 setUserInfo:v56];
  v58 = BCSceneLog();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    v59 = [v9 stateRestorationActivity];
    v60 = [v59 userInfo];
    v61 = [v57 userInfo];
    *(_DWORD *)buf = 138412546;
    uint64_t v88 = (uint64_t)v60;
    __int16 v89 = 2112;
    v90 = v61;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Overriding scene restoration activity: %@ with: %@", buf, 0x16u);

    v47 = (void *)v77;
    v46 = v79;
  }

  if (v57)
  {
    id v62 = v57;
    v63 = v62;
  }
  else
  {
LABEL_39:
    id v62 = [v9 stateRestorationActivity];
    v63 = 0;
  }
  if ([(_BKBaseSceneController *)v45 isStateRestorationDisabled]
    || (([(BKSceneController *)v45 rootBarCoordinator],
         (v64 = objc_claimAutoreleasedReturnValue()) != 0)
      ? (char v65 = v75)
      : (char v65 = 0),
        (v64, (v65 & 1) != 0) || !v62))
  {
    [(BKSceneFlowController *)self _finishSceneRequest:v11];
  }
  else
  {
    v66 = [v62 activityType];
    [(_BKBaseSceneController *)v45 scene:v11 willContinueUserActivityWithType:v66];

    [(_BKBaseSceneController *)v45 scene:v11 continueUserActivity:v62];
  }
  [(BKSceneFlowController *)self _attachDebugViewControllerToSceneIfNeeded:v11];
}

- (void)requestTabBarSceneController:(id)a3
{
  id v4 = a3;
  id v5 = [(BKSceneFlowController *)self launchCoordinator];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100051454;
  v7[3] = &unk_100A44AF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 appLaunchCoordinatorOnConditionMask:64 blockID:@"requestTabBarSceneController" performBlock:v7];
}

- (BKAppLaunchCoordinator)launchCoordinator
{
  return self->_launchCoordinator;
}

- (void)enumerateSceneController:(id)a3 includeHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    char v25 = 0;
    v7 = [(BKSceneFlowController *)self primarySceneController];
    id v8 = [v7 scene];

    if (!v8 && !v4) {
      goto LABEL_7;
    }
    id v9 = objc_retainBlock(v6);
    id v10 = v9;
    if (v9) {
      (*((void (**)(id, void *, char *))v9 + 2))(v9, v7, &v25);
    }

    if (!v25)
    {
LABEL_7:
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v11 = [(BKSceneFlowController *)self bookSceneControllers];
      id v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v22;
LABEL_9:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
          v17 = [v16 scene];

          if (v17 || v4)
          {
            id v19 = objc_retainBlock(v6);
            uint64_t v20 = v19;
            if (v19) {
              (*((void (**)(id, void *, char *))v19 + 2))(v19, v16, &v25);
            }

            if (v25) {
              break;
            }
          }
          if (v13 == (id)++v15)
          {
            id v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
            if (v13) {
              goto LABEL_9;
            }
            break;
          }
        }
      }
    }
  }
}

- (NSArray)bookSceneControllers
{
  return self->_bookSceneControllers;
}

- (id)currentSceneController
{
  id v3 = [(BKSceneFlowController *)self lastCurrentSceneController];
  BOOL v4 = [v3 scene];
  unsigned int v5 = [v4 _isKeyWindowScene];

  if (v5)
  {
    id v6 = [(BKSceneFlowController *)self lastCurrentSceneController];
    goto LABEL_12;
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = sub_100007050;
  long long v23 = sub_100007204;
  id v24 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100015484;
  v18[3] = &unk_100A48080;
  v18[4] = &v19;
  [(BKSceneFlowController *)self enumerateSceneController:v18 includeHidden:0];
  if (!v20[5])
  {
    v7 = BCSceneLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "keyWindowScene not found. Returning a sceneController as fallback.", v17, 2u);
    }

    id v8 = [(BKSceneFlowController *)self primarySceneController];
    id v9 = [v8 scene];

    if (v9)
    {
      uint64_t v10 = [(BKSceneFlowController *)self primarySceneController];
      v11 = (void *)v20[5];
      v20[5] = v10;
LABEL_10:

      goto LABEL_11;
    }
    id v12 = [(BKSceneFlowController *)self bookSceneControllers];
    id v13 = [v12 count];

    if (v13)
    {
      v11 = [(BKSceneFlowController *)self bookSceneControllers];
      uint64_t v14 = [v11 objectAtIndexedSubscript:0];
      uint64_t v15 = (void *)v20[5];
      v20[5] = v14;

      goto LABEL_10;
    }
  }
LABEL_11:
  [(BKSceneFlowController *)self setLastCurrentSceneController:v20[5]];
  id v6 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

LABEL_12:

  return v6;
}

- (BKSceneControlling)lastCurrentSceneController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastCurrentSceneController);

  return (BKSceneControlling *)WeakRetained;
}

- (id)_lastKnownStateRestorationUserInfoForSceneSession:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSDictionary);
  if (([(id)objc_opt_class() isStateRestorationDisabledForThisLaunch] & 1) == 0)
  {
    unsigned int v5 = [v3 stateRestorationActivity];
    uint64_t v6 = [v5 userInfo];

    id v4 = (id)v6;
  }

  return v4;
}

+ (BOOL)isStateRestorationDisabledForThisLaunch
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"BKDisableSceneStateRestoration"];

  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    unsigned int v4 = [UIApp launchedToTest];
    if (v4) {
      LOBYTE(v4) = +[BCPPTConfig hasExtendedLaunchTypeSet] ^ 1;
    }
  }
  return v4;
}

- (void)_flushPendingSceneRequestCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BKSceneFlowController *)self primarySceneController];
  id v6 = [v5 scene];

  if (v6 == v4)
  {
    v27 = [(BKSceneFlowController *)self pendingPrimarySceneCompletionBlocks];
    id v28 = [v27 copy];

    v29 = [(BKSceneFlowController *)self pendingPrimarySceneCompletionBlocks];
    [v29 removeAllObjects];

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v13 = v28;
    id v30 = [v13 countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v68;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v68 != v32) {
            objc_enumerationMutation(v13);
          }
          unsigned int v34 = (void (**)(id, void *))objc_retainBlock(*(id *)(*((void *)&v67 + 1) + 8 * i));
          if (v34)
          {
            v35 = [(BKSceneFlowController *)self primarySceneController];
            v34[2](v34, v35);
          }
        }
        id v31 = [v13 countByEnumeratingWithState:&v67 objects:v74 count:16];
      }
      while (v31);
    }
    goto LABEL_47;
  }
  v7 = [(BKSceneFlowController *)self accountSceneController];
  id v8 = [v7 scene];

  if (v8 == v4)
  {
    v36 = [(BKSceneFlowController *)self pendingAccountSceneCompletionBlocks];
    id v37 = [v36 copy];

    BOOL v38 = [(BKSceneFlowController *)self pendingAccountSceneCompletionBlocks];
    [v38 removeAllObjects];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v13 = v37;
    id v39 = [v13 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v64;
      do
      {
        for (j = 0; j != v40; j = (char *)j + 1)
        {
          if (*(void *)v64 != v41) {
            objc_enumerationMutation(v13);
          }
          unsigned int v43 = (void (**)(id, void *))objc_retainBlock(*(id *)(*((void *)&v63 + 1) + 8 * (void)j));
          if (v43)
          {
            v44 = [(BKSceneFlowController *)self accountSceneController];
            v43[2](v43, v44);
          }
        }
        id v40 = [v13 countByEnumeratingWithState:&v63 objects:v73 count:16];
      }
      while (v40);
    }
    goto LABEL_47;
  }
  id v9 = [(BKSceneFlowController *)self endOfBookSceneController];
  id v10 = [v9 scene];

  if (v10 == v4)
  {
    v45 = [(BKSceneFlowController *)self pendingEndOfBookSceneCompletionBlocks];
    id v46 = [v45 copy];

    v47 = [(BKSceneFlowController *)self pendingEndOfBookSceneCompletionBlocks];
    [v47 removeAllObjects];

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v13 = v46;
    id v48 = [v13 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v60;
      do
      {
        for (k = 0; k != v49; k = (char *)k + 1)
        {
          if (*(void *)v60 != v50) {
            objc_enumerationMutation(v13);
          }
          v52 = (void (**)(id, void *))objc_retainBlock(*(id *)(*((void *)&v59 + 1) + 8 * (void)k));
          if (v52)
          {
            v53 = [(BKSceneFlowController *)self endOfBookSceneController];
            v52[2](v52, v53);
          }
        }
        id v49 = [v13 countByEnumeratingWithState:&v59 objects:v72 count:16];
      }
      while (v49);
    }
LABEL_47:
    v11 = v13;
    goto LABEL_48;
  }
  objc_opt_class();
  v11 = BUDynamicCast();
  objc_opt_class();
  id v12 = [v11 controller];
  BUDynamicCast();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v14 = [v13 sceneInfo];
  uint64_t v15 = BUProtocolCast();

  v16 = [v15 openBookAssetID];
  if (v16)
  {
    v17 = [(BKSceneFlowController *)self pendingBookSceneCompletionBlocksByAssetID];
    id v18 = [v17 objectForKeyedSubscript:v16];

    if (v18)
    {
      uint64_t v19 = [(BKSceneFlowController *)self pendingBookSceneCompletionBlocksByAssetID];
      [v19 removeObjectForKey:v16];

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v54 = v18;
      id v20 = v18;
      id v21 = [v20 countByEnumeratingWithState:&v55 objects:v71 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v56;
        do
        {
          for (m = 0; m != v22; m = (char *)m + 1)
          {
            if (*(void *)v56 != v23) {
              objc_enumerationMutation(v20);
            }
            id v25 = objc_retainBlock(*(id *)(*((void *)&v55 + 1) + 8 * (void)m));
            v26 = v25;
            if (v25) {
              (*((void (**)(id, id))v25 + 2))(v25, v13);
            }
          }
          id v22 = [v20 countByEnumeratingWithState:&v55 objects:v71 count:16];
        }
        while (v22);
      }

      id v18 = v54;
    }
  }
LABEL_48:
}

- (NSMutableArray)pendingPrimarySceneCompletionBlocks
{
  return self->_pendingPrimarySceneCompletionBlocks;
}

- (void)updateAllAssetPresenterCloseStateTypes
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100078598;
  v2[3] = &unk_100A482A8;
  v2[4] = self;
  [(BKSceneFlowController *)self enumerateSceneController:v2 includeHidden:1];
}

- (void)setLastCurrentSceneController:(id)a3
{
}

- (NSMutableDictionary)pendingUserActivitiesMap
{
  return self->_pendingUserActivitiesMap;
}

- (NSMutableArray)pendingBookSceneRequestAssetIDs
{
  return self->_pendingBookSceneRequestAssetIDs;
}

- (BKSceneFlowController)initWithLaunchCoordinator:(id)a3 criticalAlertCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)BKSceneFlowController;
  id v9 = [(BKSceneFlowController *)&v23 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_launchCoordinator, a3);
    objc_storeStrong((id *)&v10->_criticalAlertCoordinator, a4);
    bookSceneControllers = v10->_bookSceneControllers;
    v10->_bookSceneControllers = (NSArray *)&__NSArray0__struct;

    uint64_t v12 = objc_opt_new();
    pendingPrimarySceneCompletionBlocks = v10->_pendingPrimarySceneCompletionBlocks;
    v10->_pendingPrimarySceneCompletionBlocks = (NSMutableArray *)v12;

    uint64_t v14 = objc_opt_new();
    pendingBookSceneRequestAssetIDs = v10->_pendingBookSceneRequestAssetIDs;
    v10->_pendingBookSceneRequestAssetIDs = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    pendingBookSceneCompletionBlocksByAssetID = v10->_pendingBookSceneCompletionBlocksByAssetID;
    v10->_pendingBookSceneCompletionBlocksByAssetID = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    pendingEndOfBookSceneCompletionBlocks = v10->_pendingEndOfBookSceneCompletionBlocks;
    v10->_pendingEndOfBookSceneCompletionBlocks = (NSMutableArray *)v18;

    id v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingUserActivitiesMap = v10->_pendingUserActivitiesMap;
    v10->_pendingUserActivitiesMap = v20;
  }
  return v10;
}

- (BKCriticalAlertCoordinating)criticalAlertCoordinator
{
  return self->_criticalAlertCoordinator;
}

- (int64_t)closeTypeForSceneController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  unsigned int v5 = BUDynamicCast();

  id v6 = [v5 rootBarCoordinator];

  if (v6)
  {
    int64_t v7 = 2;
  }
  else if ([(BKSceneFlowController *)self _canReparentRootBar])
  {
    int64_t v7 = 4;
  }
  else
  {
    int64_t v7 = 3;
  }

  return v7;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  id v5 = a4;
  id v19 = objc_alloc_init((Class)NSMutableSet);
  id v6 = +[BKBasePresentingViewController lastKnownSuccessfullyOpenBookID];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [(BKSceneFlowController *)self _lastKnownBookPresentingSceneInfoForSceneSession:*(void *)(*((void *)&v20 + 1) + 8 * (void)v11)];
        uint64_t v13 = [v12 openBookAssetID];
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          uint64_t v15 = [v12 openBookAssetID];
          unsigned __int8 v16 = [v6 isEqualToString:v15];

          if ((v16 & 1) == 0)
          {
            v17 = [v12 openBookAssetID];
            [v19 addObject:v17];
          }
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  uint64_t v18 = +[BKLastOpenBookManager sharedInstance];
  [v18 removeSucessfullyOpenedBookAssetIDs:v19];
}

- (void)_setupSizeRestrictionsForWindowScene:(id)a3 sceneType:(unint64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    id v10 = v5;
    if (a4)
    {
      if (a4 == 3)
      {
        id v8 = [v5 sizeRestrictions];
        id v7 = v8;
        double v9 = 801.0;
      }
      else
      {
        if (a4 == 2)
        {
          id v6 = [v5 sizeRestrictions];
          [v6 setMinimumSize:450.0, 450.0];

          id v7 = [v10 sizeRestrictions];
          [v7 setMaximumSize:450.0, 450.0];
LABEL_10:

          id v5 = v10;
          goto LABEL_11;
        }
        id v8 = [v5 sizeRestrictions];
        id v7 = v8;
        double v9 = 1001.0;
      }
    }
    else
    {
      id v8 = [v5 sizeRestrictions];
      id v7 = v8;
      double v9 = 500.0;
    }
    [v8 setMinimumSize:v9, 530.0];
    goto LABEL_10;
  }
LABEL_11:
}

- (id)_lastKnownBookPresentingSceneInfoForSceneSession:(id)a3
{
  id v4 = a3;
  id v5 = [(BKSceneFlowController *)self _lastKnownStateRestorationUserInfoForSceneSession:v4];
  if (v5)
  {
    id v6 = +[_BKBaseSceneController sceneInfoFromSceneSession:v4];
    id v7 = BUProtocolCast();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_isStateRestorationAndCanRestoreToAuxiliaryScene:(id)a3
{
  id v4 = a3;
  id v5 = [v4 stateRestorationActivity];

  if (v5)
  {
    id v6 = [(BKSceneFlowController *)self _lastKnownBookPresentingSceneInfoForSceneSession:v4];
    id v7 = v6;
    if (v6) {
      LOBYTE(v5) = [v6 supportsOpeningToAuxiliaryScene];
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  return (char)v5;
}

- (BOOL)_hasLaunchActionsInConnectionOptions:(id)a3
{
  id v3 = a3;
  id v4 = [v3 shortcutItem];
  id v5 = [v3 URLContexts];
  id v6 = [v3 userActivities];
  id v7 = [v3 notificationResponse];

  BOOL v8 = v4 || [v5 count] || [v6 count] || v7;
  return v8;
}

- (void)_handleSceneConnectionOptionsActions:(id)a3 sceneController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = BCSceneLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Incoming scene connection: %@", buf, 0xCu);
  }

  BOOL v8 = [v6 scene];
  uint64_t v9 = [v5 shortcutItem];
  if (v9) {
    [v6 windowScene:v8 performActionForShortcutItem:v9 completionHandler:&stru_100A481E0];
  }
  id v25 = (void *)v9;
  id v10 = +[NSUserDefaults standardUserDefaults];
  v11 = [v10 stringForKey:@"PPTLaunchURL"];

  if (v11)
  {
    uint64_t v12 = +[NSURL URLWithString:v11];
    [v6 openURL:v12 options:&__NSDictionary0__struct];
  }
  else
  {
    uint64_t v13 = [v5 URLContexts];
    id v14 = [v13 count];

    if (!v14) {
      goto LABEL_10;
    }
    uint64_t v12 = [v5 URLContexts];
    [v6 scene:v8 openURLContexts:v12];
  }

LABEL_10:
  uint64_t v15 = [v5 userActivities];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v21 = [v20 activityType];
        [v6 scene:v8 willContinueUserActivityWithType:v21];

        [v6 scene:v8 continueUserActivity:v20];
      }
      id v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }
  long long v22 = [v5 notificationResponse];
  if (v22)
  {
    long long v23 = BCSceneLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Incoming notification during scene connection: %@", buf, 0xCu);
    }

    id v24 = +[BKNotificationManager sharedInstance];
    [v24 handleNotificationResponse:v22];
  }
}

- (void)_finishSceneRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BUDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  id v5 = [v8 controller];
  id v6 = BUDynamicCast();

  if (![v6 sceneType])
  {
    objc_opt_class();
    id v7 = BUDynamicCast();
    [(BKSceneFlowController *)self _consumePendingBookSceneRequestAssetID:v7];
  }
  [(BKSceneFlowController *)self _flushPendingSceneRequestCompletion:v8];
}

- (void)_attachDebugViewControllerToSceneIfNeeded:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  if ([v4 BOOLForKey:@"BKShowDebugMenu"])
  {
    unsigned int v5 = +[JSADevice isInternalBuild];

    if (v5)
    {
      objc_opt_class();
      id v6 = BUDynamicCast();
      objc_initWeak(&location, v6);

      objc_copyWeak(&v10, &location);
      id v7 = objc_loadWeakRetained(&location);
      id v8 = [v7 statusBarManager:^(NSInteger arg0, NSInteger arg1, NSInteger arg2, NSInteger arg3, NSInteger arg4, NSInteger arg5, NSInteger arg6, NSInteger arg7, NSInteger arg8, NSInteger arg9, NSInteger arg10, NSInteger arg11, NSInteger arg12, NSInteger arg13, NSInteger arg14, NSInteger arg15, NSInteger arg16, NSInteger arg17, NSInteger arg18, NSInteger arg19, NSInteger arg20, NSInteger arg21, NSInteger arg22, NSInteger arg23, NSInteger arg24, NSInteger arg25, NSInteger arg26, NSInteger arg27, NSInteger arg28, NSInteger arg29, NSInteger arg30, NSInteger arg31, NSInteger arg32, NSInteger arg33, NSInteger arg34, NSInteger arg35, NSInteger arg36, NSInteger arg37, NSInteger arg38, NSInteger arg39, NSInteger arg40, NSInteger arg41, NSInteger arg42, NSInteger arg43, NSInteger arg44, NSInteger arg45, NSInteger arg46, NSInteger arg47, NSInteger arg48, NSInteger arg49, NSInteger arg50, NSInteger arg51, NSInteger arg52, NSInteger arg53, NSInteger arg54, NSInteger arg55, NSInteger arg56, NSInteger arg57, NSInteger arg58, NSInteger arg59, NSInteger arg60, NSInteger arg61, NSInteger arg62, NSInteger arg63, NSInteger arg64, NSInteger arg65, NSInteger arg66, NSInteger arg67, NSInteger arg68, NSInteger arg69, NSInteger arg70, NSInteger arg71, NSInteger arg72, NSInteger arg73, NSInteger arg74, NSInteger arg75, NSInteger arg76, NSInteger arg77, NSInteger arg78, NSInteger arg79, NSInteger arg80, NSInteger arg81, NSInteger arg82, NSInteger arg83, NSInteger arg84, NSInteger arg85, NSInteger arg86, NSInteger arg87, NSInteger arg88, NSInteger arg89, NSInteger arg90, NSInteger arg91, NSInteger arg92, NSInteger arg93, NSInteger arg94, NSInteger arg95, NSInteger arg96, NSInteger arg97, NSInteger arg98, NSInteger arg99, NSInteger arg100, NSInteger arg101, NSInteger arg102, NSInteger arg103, NSInteger arg104, NSInteger arg105, NSInteger arg106, NSInteger arg107, NSInteger arg108, NSInteger arg109, NSInteger arg110, NSInteger arg111, NSInteger arg112, NSInteger arg113, NSInteger arg114, NSInteger arg115, NSInteger arg116, NSInteger arg117, NSInteger arg118, NSInteger arg119, NSInteger arg120, NSInteger arg121, NSInteger arg122, NSInteger arg123, NSInteger arg124, NSInteger arg125, NSInteger arg126, NSInteger arg127, NSInteger arg128, NSInteger arg129, NSInteger arg130, NSInteger arg131, NSInteger arg132, NSInteger arg133, NSInteger arg134, NSInteger arg135, NSInteger arg136, NSInteger arg137, NSInteger arg138, NSInteger arg139, NSInteger arg140, NSInteger arg141, NSInteger arg142, NSInteger arg143, NSInteger arg144, NSInteger arg145, NSInteger arg146, NSInteger arg147, NSInteger arg148, NSInteger arg149, NSInteger arg150, NSInteger arg151, NSInteger arg152, NSInteger arg153, NSInteger arg154, NSInteger arg155, NSInteger arg156, NSInteger arg157, NSInteger arg158, NSInteger arg159, NS
      [v8 setDebugMenuHandler:&v9];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

- (id)defaultSceneControllerForTransaction:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 targetSceneController];

  if (v5) {
    [v4 targetSceneController];
  }
  else {
  id v6 = [v4 originatingSceneController];
  }

  id v7 = BUProtocolCast();

  if (!v7)
  {
    id v8 = BCSceneLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "sceneController not found in tx. Returning currentSceneController as fallback.", v10, 2u);
    }

    id v7 = [(BKSceneFlowController *)self currentSceneController];
  }

  return v7;
}

- (id)anySceneController
{
  id v3 = [(BKSceneFlowController *)self currentSceneController];
  id v4 = [v3 scene];

  if (v4)
  {
    unsigned int v5 = [(BKSceneFlowController *)self currentSceneController];
  }
  else
  {
    id v6 = [(BKSceneFlowController *)self endOfBookSceneController];
    id v7 = [v6 scene];

    if (v7)
    {
      unsigned int v5 = [(BKSceneFlowController *)self endOfBookSceneController];
    }
    else
    {
      id v8 = [(BKSceneFlowController *)self accountSceneController];
      uint64_t v9 = [v8 scene];

      if (v9)
      {
        unsigned int v5 = [(BKSceneFlowController *)self accountSceneController];
      }
      else
      {
        unsigned int v5 = 0;
      }
    }
  }

  return v5;
}

- (id)_rootViewControllerForViewController:(id)a3
{
  id v3 = a3;
  id v4 = [v3 parentViewController];
  if (v4
    || ([v3 presentingViewController],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        0,
        id v4 = (void *)v5,
        id v6 = v3,
        v5))
  {
    id v6 = v3;
    do
    {
      id v7 = v6;
      id v6 = v4;

      id v8 = [v6 parentViewController];
      uint64_t v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [v6 presentingViewController];
      }
      id v4 = v10;
    }
    while (v4);
  }

  return v6;
}

- (id)sceneControllerForViewController:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100007050;
  id v25 = sub_100007204;
  id v26 = 0;
  uint64_t v5 = [v4 viewIfLoaded];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 window];

    if (v7)
    {
      id v8 = [v6 window];
      uint64_t v9 = [(BKSceneFlowController *)self sceneControllerForWindow:v8];
      id v10 = (void *)v22[5];
      v22[5] = v9;
    }
  }
  v11 = (void *)v22[5];
  if (!v11)
  {
    uint64_t v12 = [(BKSceneFlowController *)self _rootViewControllerForViewController:v4];
    uint64_t v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 _bk_sceneController];
      uint64_t v15 = (void *)v22[5];
      v22[5] = v14;
    }
    if (!v22[5])
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100142054;
      v18[3] = &unk_100A480A8;
      id v19 = v13;
      long long v20 = &v21;
      [(BKSceneFlowController *)self enumerateSceneController:v18 includeHidden:1];
    }
    v11 = (void *)v22[5];
  }
  id v16 = v11;

  _Block_object_dispose(&v21, 8);

  return v16;
}

- (id)sceneControllerForWindow:(id)a3
{
  id v3 = [a3 windowScene];
  objc_opt_class();
  id v4 = BUDynamicCast();
  uint64_t v5 = [v4 controller];
  id v6 = BUProtocolCast();

  return v6;
}

- (id)sceneInfoPresentingAssetID:(id)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_100007050;
  uint64_t v14 = sub_100007204;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001422B8;
  v7[3] = &unk_100A480D0;
  id v4 = a3;
  id v8 = v4;
  uint64_t v9 = &v10;
  [(BKSceneFlowController *)self enumerateSceneInfo:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (void)destroySceneForAssetID:(id)a3
{
  id v5 = [(BKSceneFlowController *)self sceneInfoPresentingAssetID:a3];
  id v3 = +[BKSceneUtilities sharedInstance];
  id v4 = [v5 sceneSession];
  [v3 destroySceneWithSceneSession:v4 withAnimationType:1];
}

- (void)enumerateSceneInfo:(id)a3
{
  id v4 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100007050;
  v36 = sub_100007204;
  id v37 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100142708;
  v24[3] = &unk_100A480F8;
  id v26 = &v32;
  id v5 = v4;
  id v25 = v5;
  long long v27 = &v28;
  [(BKSceneFlowController *)self enumerateSceneController:v24 includeHidden:0];
  if (!*((unsigned char *)v29 + 24))
  {
    id v6 = +[UIApplication sharedApplication];
    id v7 = [v6 openSessions];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v13 = [v12 role];
          unsigned int v14 = [v13 isEqualToString:UIWindowSceneSessionRoleApplication];

          if (v14)
          {
            id v15 = [v12 persistentIdentifier];
            if (([(id)v33[5] containsObject:v15] & 1) == 0)
            {
              id v16 = +[_BKBaseSceneController sceneInfoFromSceneSession:v12];
              id v17 = objc_retainBlock(v5);
              uint64_t v18 = v17;
              if (v17) {
                (*((void (**)(id, void *, uint64_t *))v17 + 2))(v17, v16, v29 + 3);
              }

              BOOL v19 = *((unsigned char *)v29 + 24) == 0;
              if (!v19)
              {

                goto LABEL_17;
              }
            }
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v20 objects:v38 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
}

- (BKSceneController)accountSceneController
{
  accountSceneController = self->_accountSceneController;
  if (!accountSceneController)
  {
    id v4 = [BKSceneController alloc];
    id v5 = [(BKSceneFlowController *)self launchCoordinator];
    id v6 = [(BKSceneFlowController *)self criticalAlertCoordinator];
    id v7 = [(BKSceneController *)v4 initWithSceneType:2 launchCoordinator:v5 criticalAlertCoordinator:v6];
    id v8 = self->_accountSceneController;
    self->_accountSceneController = v7;

    accountSceneController = self->_accountSceneController;
  }

  return accountSceneController;
}

- (BKSceneController)endOfBookSceneController
{
  endOfBookSceneController = self->_endOfBookSceneController;
  if (!endOfBookSceneController)
  {
    id v4 = [BKSceneController alloc];
    id v5 = [(BKSceneFlowController *)self launchCoordinator];
    id v6 = [(BKSceneFlowController *)self criticalAlertCoordinator];
    id v7 = [(BKSceneController *)v4 initWithSceneType:3 launchCoordinator:v5 criticalAlertCoordinator:v6];
    id v8 = self->_endOfBookSceneController;
    self->_endOfBookSceneController = v7;

    endOfBookSceneController = self->_endOfBookSceneController;
  }

  return endOfBookSceneController;
}

- (id)sceneControllerForSceneType:(unint64_t)a3 assetID:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0uLL:
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = [(BKSceneFlowController *)self bookSceneControllers];
      id v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (!v8) {
        goto LABEL_19;
      }
      uint64_t v10 = *(void *)v22;
      *(void *)&long long v9 = 138412290;
      long long v20 = v9;
      break;
    case 1uLL:
      uint64_t v18 = [(BKSceneFlowController *)self primarySceneController];
      goto LABEL_17;
    case 2uLL:
      uint64_t v18 = [(BKSceneFlowController *)self accountSceneController];
      goto LABEL_17;
    case 3uLL:
      uint64_t v18 = [(BKSceneFlowController *)self endOfBookSceneController];
LABEL_17:
      id v8 = (id)v18;
      goto LABEL_20;
    default:
      id v8 = 0;
      goto LABEL_20;
  }
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      uint64_t v13 = [v12 sceneInfo:v20];
      unsigned int v14 = BUProtocolCast();

      id v15 = BCSceneLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v20;
        id v26 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "sceneControllerForSceneType with assetID=%@", buf, 0xCu);
      }

      id v16 = [v14 openBookAssetID];
      unsigned int v17 = [v16 isEqualToString:v6];

      if (v17)
      {
        id v8 = v12;

        goto LABEL_19;
      }
    }
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_19:

LABEL_20:

  return v8;
}

- (void)requestPrimaryOrBookScene:(id)a3
{
  id v11 = a3;
  id v4 = [(BKSceneFlowController *)self currentSceneController];

  if (v4
    && ([(BKSceneFlowController *)self currentSceneController],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 sceneType],
        v5,
        !v6))
  {
    id v7 = [(BKSceneFlowController *)self currentSceneController];
    id v8 = [v7 sceneInfo];
    long long v9 = BUProtocolCast();

    uint64_t v10 = [v9 openBookAssetID];
    [(BKSceneFlowController *)self requestBookSceneWithAssetID:v10 completion:v11];
  }
  else
  {
    [(BKSceneFlowController *)self requestPrimaryScene:v11];
  }
}

- (void)requestPrimaryScene:(id)a3
{
}

- (void)requestPrimaryScene:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = BCSceneLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "requestPrimaryScene", (uint8_t *)buf, 2u);
  }

  unsigned int v8 = +[BKSceneUtilities hasMultiWindowEnabled];
  if ((v8 & 1) == 0)
  {
    long long v9 = [(BKSceneFlowController *)self currentSceneController];
    uint64_t v10 = [(BKSceneFlowController *)self primarySceneController];

    if (v9 != v10 && [(BKSceneFlowController *)self _canReparentRootBar]) {
      [(BKSceneFlowController *)self _reparentRootBarTo:v9];
    }
  }
  id v11 = [(BKSceneFlowController *)self primarySceneController];
  uint64_t v12 = [v11 scene];

  uint64_t v13 = [(BKSceneFlowController *)self pendingPrimarySceneCompletionBlocks];
  id v14 = [v13 count];

  if (!a3 && v12)
  {
    if (v14)
    {
      id v15 = [(BKSceneFlowController *)self pendingPrimarySceneCompletionBlocks];
      id v16 = objc_retainBlock(v6);
      [v15 addObject:v16];
    }
    else
    {
      id v15 = (void (**)(void, void))objc_retainBlock(v6);
      if (!v15)
      {
LABEL_23:

        goto LABEL_24;
      }
      id v16 = [(BKSceneFlowController *)self primarySceneController];
      ((void (**)(void, void *))v15)[2](v15, v16);
    }

    goto LABEL_23;
  }
  unsigned int v17 = [(BKSceneFlowController *)self pendingPrimarySceneCompletionBlocks];
  id v18 = objc_retainBlock(v6);
  [v17 addObject:v18];

  if (!v14)
  {
    BOOL v19 = [v12 session];
    long long v20 = v19;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      id v21 = [(BKSceneFlowController *)self _existingSceneSessionForPrimaryScene];
    }
    id v15 = (void (**)(void, void))v21;

    if (v8)
    {
      objc_initWeak(buf, self);
      long long v22 = +[BKSceneUtilities sharedInstance];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100142F88;
      v23[3] = &unk_100A44C38;
      objc_copyWeak(&v24, buf);
      [v22 requestWindowForSceneSession:v15 userActivity:0 errorHandler:v23];

      objc_destroyWeak(&v24);
      objc_destroyWeak(buf);
    }
    if (v12) {
      [(BKSceneFlowController *)self _finishSceneRequest:v12];
    }
    goto LABEL_23;
  }
LABEL_24:
}

- (void)requestBookSceneWithAssetID:(id)a3 completion:(id)a4
{
}

- (void)requestBookSceneWithAssetID:(id)a3 bringExistingToFront:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = BCSceneLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "requestBookScene with assetID=%@", (uint8_t *)&buf, 0xCu);
  }

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100143428;
  v34[3] = &unk_100A48120;
  id v11 = v8;
  id v35 = v11;
  id v12 = v9;
  id v36 = v12;
  uint64_t v13 = objc_retainBlock(v34);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  if (a4) {
    goto LABEL_5;
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10014349C;
  v29[3] = &unk_100A48148;
  id v30 = v11;
  char v31 = self;
  uint64_t v32 = v13;
  p_long long buf = &buf;
  [(BKSceneFlowController *)self enumerateSceneInfo:v29];

  if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
LABEL_5:
    id v14 = [(BKSceneFlowController *)self pendingBookSceneCompletionBlocksByAssetID];
    id v15 = [v14 objectForKeyedSubscript:v11];

    if (!v15)
    {
      id v16 = [(BKSceneFlowController *)self pendingBookSceneCompletionBlocksByAssetID];
      id v15 = objc_alloc_init((Class)NSMutableArray);
      [v16 setObject:v15 forKeyedSubscript:v11];
    }
    id v17 = [v15 count];
    id v18 = objc_retainBlock(v13);
    [v15 addObject:v18];

    if (!v17)
    {
      BOOL v19 = [(BKSceneFlowController *)self pendingBookSceneRequestAssetIDs];
      [v19 addObject:v11];

      long long v20 = [(BKSceneFlowController *)self _existingBookSceneSessionForRequestAssetID:v11];
      if (v20)
      {
        objc_opt_class();
        id v21 = [v20 scene];
        long long v22 = BUDynamicCast();
      }
      else
      {
        long long v22 = 0;
      }
      if (+[BKSceneUtilities hasMultiWindowEnabled])
      {
        objc_initWeak(&location, self);
        long long v23 = +[BKSceneUtilities sharedInstance];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1001435D4;
        v24[3] = &unk_100A48170;
        objc_copyWeak(&v27, &location);
        id v25 = v22;
        id v26 = v11;
        [v23 requestWindowForSceneSession:v20 userActivity:0 errorHandler:v24];

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
      if (v22) {
        [(BKSceneFlowController *)self _finishSceneRequest:v22];
      }
    }
  }
  _Block_object_dispose(&buf, 8);
}

- (void)requestAccountScene:(id)a3
{
  id v4 = a3;
  id v5 = [(BKSceneFlowController *)self pendingAccountSceneCompletionBlocks];
  id v6 = [v5 count];

  id v7 = [(BKSceneFlowController *)self pendingAccountSceneCompletionBlocks];
  id v8 = objc_retainBlock(v4);
  [v7 addObject:v8];

  if (!v6)
  {
    id v9 = [(BKSceneFlowController *)self accountSceneController];
    uint64_t v10 = [v9 scene];
    id v11 = [v10 session];

    if (v11)
    {
      objc_opt_class();
      id v12 = [v11 scene];
      uint64_t v13 = BUDynamicCast();
    }
    else
    {
      uint64_t v13 = 0;
    }
    id v14 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"BKAccountInfoSceneActivityType"];
    objc_initWeak(&location, self);
    id v15 = +[BKSceneUtilities sharedInstance];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10014389C;
    v16[3] = &unk_100A48198;
    objc_copyWeak(&v17, &location);
    v16[4] = self;
    [v15 requestWindowForSceneSession:v11 userActivity:v14 errorHandler:v16];

    if (v13) {
      [(BKSceneFlowController *)self _finishSceneRequest:v13];
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)requestEndOfBookSceneWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKSceneFlowController *)self currentEndOfBookSceneOptions];
  unsigned __int8 v9 = [v8 isEqualToDictionary:v6];

  CFStringRef v31 = @"feedOptions";
  id v32 = v6;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  if ((v9 & 1) == 0)
  {
    id v11 = [(BKSceneFlowController *)self pendingEndOfBookSceneCompletionBlocks];
    [v11 removeAllObjects];

    [(BKSceneFlowController *)self setCurrentEndOfBookSceneOptions:v6];
    id v12 = [(BKSceneFlowController *)self endOfBookSceneController];
    [v12 updateEndOfBookSceneWithUserInfo:v10];
  }
  uint64_t v13 = [(BKSceneFlowController *)self pendingEndOfBookSceneCompletionBlocks];
  BOOL v14 = [v13 count] == 0;

  if (v14)
  {
    [(BKSceneFlowController *)self setCurrentEndOfBookSceneOptions:v6];
    id v17 = [(BKSceneFlowController *)self pendingEndOfBookSceneCompletionBlocks];
    id v18 = objc_retainBlock(v7);
    [v17 addObject:v18];

    BOOL v19 = [(BKSceneFlowController *)self endOfBookSceneController];
    long long v20 = [v19 scene];
    id v15 = [v20 session];

    if (v15)
    {
      objc_opt_class();
      id v21 = [v15 scene];
      id v16 = BUDynamicCast();
    }
    else
    {
      id v16 = 0;
    }
    id v22 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"BKEndOfBookSceneActivityType"];
    [v22 setUserInfo:v10];
    objc_initWeak(&location, self);
    long long v23 = +[BKSceneUtilities sharedInstance];
    id v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    id v26 = sub_100143C50;
    id v27 = &unk_100A48198;
    objc_copyWeak(&v29, &location);
    uint64_t v28 = self;
    [v23 requestWindowForSceneSession:v15 userActivity:v22 errorHandler:&v24];

    if (v16) {
      -[BKSceneFlowController _finishSceneRequest:](self, "_finishSceneRequest:", v16, v24, v25, v26, v27);
    }
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    id v15 = [(BKSceneFlowController *)self pendingEndOfBookSceneCompletionBlocks];
    id v16 = objc_retainBlock(v7);
    [v15 addObject:v16];
  }
}

- (void)_handleErrorForCompletionBlocks:(id)a3
{
  id v3 = a3;
  id v4 = [v3 copy];
  [v3 removeAllObjects];
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
      unsigned __int8 v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_retainBlock(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9));
        id v11 = v10;
        if (v10) {
          (*((void (**)(id, void))v10 + 2))(v10, 0);
        }

        unsigned __int8 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)_existingSceneSessionForPrimaryScene
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_100007050;
  unsigned __int8 v9 = sub_100007204;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100143EF0;
  v4[3] = &unk_100A480D0;
  v4[4] = self;
  v4[5] = &v5;
  [(BKSceneFlowController *)self enumerateSceneInfo:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)_existingBookSceneSessionForRequestAssetID:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = sub_100007050;
  long long v14 = sub_100007204;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100144120;
  v7[3] = &unk_100A480D0;
  id v4 = a3;
  id v8 = v4;
  unsigned __int8 v9 = &v10;
  [(BKSceneFlowController *)self enumerateSceneInfo:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (void)requestSceneWithAssetID:(id)a3 completion:(id)a4
{
}

- (void)requestSceneWithAssetID:(id)a3 bringExistingToFront:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(BKSceneFlowController *)self primarySceneController];
  id v11 = [v10 scene];

  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  if (v11)
  {
    uint64_t v12 = [(BKSceneFlowController *)self primarySceneController];
    long long v13 = [v12 sceneInfo];

    long long v14 = BUProtocolCast();
    id v15 = [v14 openBookAssetID];
    unsigned int v16 = [v15 isEqualToString:v8];

    if (v16) {
      *((unsigned char *)v24 + 24) = 1;
    }
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100144478;
    v20[3] = &unk_100A480D0;
    id v21 = v8;
    id v22 = &v23;
    [(BKSceneFlowController *)self enumerateSceneInfo:v20];
    long long v13 = v21;
  }

  if (*((unsigned char *)v24 + 24))
  {
    id v17 = v19;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100144514;
    v19[3] = &unk_100A481C0;
    v19[4] = v9;
    [(BKSceneFlowController *)self requestPrimaryScene:v6 completion:v19];
  }
  else
  {
    id v17 = v18;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100144580;
    v18[3] = &unk_100A481C0;
    void v18[4] = v9;
    [(BKSceneFlowController *)self requestBookSceneWithAssetID:v8 bringExistingToFront:v6 completion:v18];
  }

  _Block_object_dispose(&v23, 8);
}

- (void)_consumePendingBookSceneRequestAssetID:(id)a3
{
  id v9 = a3;
  id v4 = [(BKSceneFlowController *)self pendingBookSceneRequestAssetIDs];
  id v5 = [v4 count];

  if (v5)
  {
    BOOL v6 = [(BKSceneFlowController *)self pendingBookSceneRequestAssetIDs];
    uint64_t v7 = [v6 firstObject];
    [v9 setRequestAssetID:v7];

    id v8 = [(BKSceneFlowController *)self pendingBookSceneRequestAssetIDs];
    [v8 removeObjectAtIndex:0];
  }
}

- (void)didDisconnectScene:(id)a3
{
  id v4 = a3;
  id v5 = [v4 session];
  BOOL v6 = [v5 persistentIdentifier];

  uint64_t v7 = [v4 delegate];
  id v8 = (objc_class *)objc_opt_class();

  id v9 = BCSceneLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = NSStringFromClass(v8);
    *(_DWORD *)long long buf = 138543618;
    BOOL v19 = v6;
    __int16 v20 = 2114;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "didDisconnectScene: sceneIdentifier=%{public}@, sceneDelegate=%{public}@", buf, 0x16u);
  }
  [(BKSceneFlowController *)self _flushPendingSceneRequestCompletion:v4];
  id v11 = [(BKSceneFlowController *)self primarySceneController];
  id v12 = [v11 scene];

  if (v12 != v4)
  {
    long long v13 = [(BKSceneFlowController *)self bookSceneControllers];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001448AC;
    v16[3] = &unk_100A48208;
    id v17 = v4;
    long long v14 = +[NSPredicate predicateWithBlock:v16];
    id v15 = [v13 filteredArrayUsingPredicate:v14];
    [(BKSceneFlowController *)self setBookSceneControllers:v15];
  }
}

- (id)sceneHostingAllViewControllersConformingToProtocol:(id)a3
{
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_1001449D0;
  id v11 = &unk_100A48230;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  id v4 = v13;
  id v5 = v12;
  [(BKSceneFlowController *)self enumerateSceneController:&v8 includeHidden:1];
  id v6 = [v4 copy:v8, v9, v10, v11];

  return v6;
}

- (int64_t)closeTypeForForegroundedScene
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100144B28;
  v4[3] = &unk_100A48258;
  v4[4] = v9;
  v4[5] = &v5;
  [(BKSceneFlowController *)self enumerateSceneController:v4 includeHidden:0];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(v9, 8);
  return v2;
}

- (BOOL)_canReparentRootBar
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100144CCC;
  v4[3] = &unk_100A48280;
  v4[4] = &v5;
  [(BKSceneFlowController *)self enumerateSceneInfo:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_reparentRootBarTo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BUDynamicCast();
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [(BKSceneFlowController *)self primarySceneController];

  id v6 = v22;
  if (v22 != v5)
  {
    objc_opt_class();
    uint64_t v7 = [(BKSceneFlowController *)self primarySceneController];
    char v8 = BUDynamicCast();

    uint64_t v9 = [v8 rootBarCoordinator];
    uint64_t v10 = [(BKSceneFlowController *)self bookSceneControllers];
    unsigned int v11 = [v10 containsObject:v22];

    if (v11)
    {
      id v12 = [(BKSceneFlowController *)self bookSceneControllers];
      id v13 = [v12 mutableCopy];

      [v13 removeObject:v22];
      [(BKSceneFlowController *)self setBookSceneControllers:v13];
    }
    [(BKSceneFlowController *)self setPrimarySceneController:v22];
    uint64_t v14 = [v8 scene];
    if (v14)
    {
      id v15 = (void *)v14;
      unsigned int v16 = [(BKSceneFlowController *)self bookSceneControllers];
      unsigned __int8 v17 = [v16 containsObject:v8];

      if ((v17 & 1) == 0)
      {
        id v18 = [(BKSceneFlowController *)self bookSceneControllers];
        BOOL v19 = [v18 arrayByAddingObject:v8];
        [(BKSceneFlowController *)self setBookSceneControllers:v19];
      }
    }
    [v8 setRootBarCoordinator:0];
    [v22 setRootBarCoordinator:v9];
    __int16 v20 = [v22 rootBarCoordinator];
    id v21 = +[BKRootBarItemsProvider HomeIdentifier];
    [v20 selectWithIdentifier:v21 isUserAction:0];

    [(BKSceneFlowController *)self updateAllAssetPresenterCloseStateTypes];
    id v6 = v22;
  }
}

- (void)handleCloseAssetForSceneController:(id)a3 assetPresentingViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  int64_t v9 = [(BKSceneFlowController *)self closeTypeForSceneController:v11];
  switch(v9)
  {
    case 2:
      goto LABEL_6;
    case 4:
      [(BKSceneFlowController *)self _reparentRootBarTo:v11];
LABEL_6:
      [v8 im_dismissAnimated:v5];
      break;
    case 3:
      [(BKSceneFlowController *)self requestPrimaryScene:&stru_100A482E8];
      break;
  }
  [(BKSceneFlowController *)self updateAllAssetPresenterCloseStateTypes];
  uint64_t v10 = +[BKAppDelegate sceneManager];
  [v10 attemptToPresentStoreReview];
}

- (void)setLaunchCoordinator:(id)a3
{
}

- (void)setCriticalAlertCoordinator:(id)a3
{
}

- (void)setPendingPrimarySceneCompletionBlocks:(id)a3
{
}

- (NSMutableArray)pendingAccountSceneCompletionBlocks
{
  return self->_pendingAccountSceneCompletionBlocks;
}

- (void)setPendingAccountSceneCompletionBlocks:(id)a3
{
}

- (NSMutableArray)pendingEndOfBookSceneCompletionBlocks
{
  return self->_pendingEndOfBookSceneCompletionBlocks;
}

- (void)setPendingEndOfBookSceneCompletionBlocks:(id)a3
{
}

- (NSDictionary)currentEndOfBookSceneOptions
{
  return self->_currentEndOfBookSceneOptions;
}

- (void)setCurrentEndOfBookSceneOptions:(id)a3
{
}

- (void)setPendingBookSceneRequestAssetIDs:(id)a3
{
}

- (NSMutableDictionary)pendingBookSceneCompletionBlocksByAssetID
{
  return self->_pendingBookSceneCompletionBlocksByAssetID;
}

- (void)setPendingBookSceneCompletionBlocksByAssetID:(id)a3
{
}

- (void)setPendingUserActivitiesMap:(id)a3
{
}

- (void)setPrimarySceneController:(id)a3
{
}

- (void)setAccountSceneController:(id)a3
{
}

- (void)setEndOfBookSceneController:(id)a3
{
}

- (void)setBookSceneControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastCurrentSceneController);
  objc_storeStrong((id *)&self->_bookSceneControllers, 0);
  objc_storeStrong((id *)&self->_endOfBookSceneController, 0);
  objc_storeStrong((id *)&self->_accountSceneController, 0);
  objc_storeStrong((id *)&self->_primarySceneController, 0);
  objc_storeStrong((id *)&self->_pendingUserActivitiesMap, 0);
  objc_storeStrong((id *)&self->_pendingBookSceneCompletionBlocksByAssetID, 0);
  objc_storeStrong((id *)&self->_pendingBookSceneRequestAssetIDs, 0);
  objc_storeStrong((id *)&self->_currentEndOfBookSceneOptions, 0);
  objc_storeStrong((id *)&self->_pendingEndOfBookSceneCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pendingAccountSceneCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pendingPrimarySceneCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_criticalAlertCoordinator, 0);

  objc_storeStrong((id *)&self->_launchCoordinator, 0);
}

@end