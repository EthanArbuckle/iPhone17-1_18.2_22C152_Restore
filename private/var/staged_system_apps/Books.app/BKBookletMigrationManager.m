@interface BKBookletMigrationManager
- (BKBookletMigrationDownloadFlowState)flowState;
- (BKBookletMigrationDownloadQueue)migrationDownloadQueue;
- (BKBookletMigrationManager)initWithPurchaseItemMigrationController:(id)a3;
- (BKBookletMigrationStore)store;
- (BKPurchaseItemMigrationControlling)purchaseItemMigrationController;
- (BOOL)_shouldRunDownloadFlowState:(id)a3;
- (BOOL)_shouldStart;
- (NSMutableDictionary)migrationInfos;
- (id)_downloadFlowState;
- (id)_fetchOwnedAudiobookAssetIDsIncludeLocalOnly:(BOOL)a3;
- (id)_loadMigrationInfos;
- (id)_migrationInfo;
- (id)_predicateForRedownloadableAssets;
- (void)_persistDownloadFlowState:(id)a3;
- (void)_persistMigrationInfo:(id)a3;
- (void)_privacyAcknowledgementChanged:(id)a3;
- (void)_resetEverythingIfNeeded;
- (void)_runDownloadFlowFromState:(id)a3;
- (void)_setDownloadFlowStage:(unint64_t)a3;
- (void)_setDownloadFlowState:(id)a3 persist:(BOOL)a4;
- (void)bookletMigrationDownloadQueueDidBecomeEmpty;
- (void)migrateIfNeeded;
- (void)setFlowState:(id)a3;
- (void)setMigrationDownloadQueue:(id)a3;
- (void)setMigrationInfos:(id)a3;
- (void)setPurchaseItemMigrationController:(id)a3;
- (void)setStore:(id)a3;
- (void)wq_checkGDPRPrivacyAcknowledgementBeforeForceReloadPurchaseItems;
- (void)wq_runDownloadFlowStageForceReloadPurchaseItems;
- (void)wq_runDownloadFlowStageInitial;
- (void)wq_runDownloadFlowStageQuery;
- (void)wq_runDownloadFlowStageQueued;
- (void)wq_runDownloadFlowStageWait;
- (void)wq_runDownloadFlowStageWaitGDPRPrivacyAcknowledgement;
@end

@implementation BKBookletMigrationManager

- (BKBookletMigrationManager)initWithPurchaseItemMigrationController:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BKBookletMigrationManager;
  v5 = [(BKBookletMigrationManager *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_purchaseItemMigrationController, v4);
    v7 = objc_alloc_init(BKBookletMigrationStore);
    store = v6->_store;
    v6->_store = v7;

    v9 = [[BKBookletMigrationDownloadFlowState alloc] initWithStage:0];
    flowState = v6->_flowState;
    v6->_flowState = v9;

    v11 = [[BKBookletMigrationDownloadQueue alloc] initWithStore:v6->_store];
    migrationDownloadQueue = v6->_migrationDownloadQueue;
    v6->_migrationDownloadQueue = v11;

    [(BKBookletMigrationDownloadQueue *)v6->_migrationDownloadQueue setObserver:v6];
    uint64_t v13 = [(BKBookletMigrationManager *)v6 _loadMigrationInfos];
    migrationInfos = v6->_migrationInfos;
    v6->_migrationInfos = (NSMutableDictionary *)v13;

    v6->_accessLock._os_unfair_lock_opaque = 0;
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v17 = dispatch_queue_create("BKBookletMigrationManager.workQueue", v16);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v17;
  }
  return v6;
}

- (id)_loadMigrationInfos
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"BKBookletMigration.infos"];
  id v4 = [v3 mutableCopy];

  if (!v4) {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
  }

  return v4;
}

- (void)migrateIfNeeded
{
  [(BKBookletMigrationManager *)self _resetEverythingIfNeeded];
  if ([(BKBookletMigrationManager *)self _shouldStart])
  {
    id v3 = [(BKBookletMigrationManager *)self _downloadFlowState];
    [(BKBookletMigrationManager *)self _setDownloadFlowState:v3 persist:0];
  }
}

- (void)_resetEverythingIfNeeded
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  if ([v3 BOOLForKey:@"BKBookletMigration.resetEverything"])
  {
    id v4 = BKBookletMigrationLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reset everything", buf, 2u);
    }

    [v3 removeObjectForKey:@"BKBookletMigration.infos"];
    [v3 removeObjectForKey:@"BKBookletMigration.resetEverything"];
    v5 = [(BKBookletMigrationManager *)self _loadMigrationInfos];
    [(BKBookletMigrationManager *)self setMigrationInfos:v5];

    id v6 = objc_alloc_init((Class)NSSet);
    v7 = [(BKBookletMigrationManager *)self store];
    id v15 = 0;
    unsigned int v8 = [v7 removeAllMigrationInfosExcludingStates:v6 error:&v15];
    id v9 = v15;

    v10 = BKBookletMigrationLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        v12 = "Removed all booklet migration infos";
        uint64_t v13 = v10;
        uint32_t v14 = 2;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
    else if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v9;
      v12 = "Error removing all booklet migration infos, error: %@";
      uint64_t v13 = v10;
      uint32_t v14 = 12;
      goto LABEL_9;
    }
  }
}

- (id)_migrationInfo
{
  id v3 = +[BUAccountsProvider sharedProvider];
  id v4 = [v3 activeStoreAccount];
  v5 = [v4 ams_DSID];
  id v6 = [v5 stringValue];

  if (!v6
    || ([(BKBookletMigrationManager *)self migrationInfos],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:v6],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    id v8 = objc_alloc_init((Class)NSDictionary);
  }
  id v9 = [v8 objectForKeyedSubscript:@"stage"];
  unsigned int v10 = [v9 unsignedIntValue];

  if (!v10)
  {
    id v11 = objc_alloc_init((Class)NSDictionary);

    id v8 = v11;
  }

  return v8;
}

- (id)_downloadFlowState
{
  v2 = [(BKBookletMigrationManager *)self _migrationInfo];
  id v3 = [v2 objectForKeyedSubscript:@"stage"];
  int v4 = [v3 unsignedIntValue];
  v5 = (BKBookletMigrationDownloadFlowState *)v4;

  if (v4 > 399)
  {
    if (v4 != 400 && v4 != 800 && v4 != 600) {
      goto LABEL_11;
    }
  }
  else if (v4 && v4 != 200 && v4 != 300)
  {
LABEL_11:
    id v6 = BKBookletMigrationLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Loaded flow state: Encountered unknown value: %lu", (uint8_t *)&v10, 0xCu);
    }
    v5 = 0;
    goto LABEL_14;
  }
  id v6 = BKBookletMigrationLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Loaded flow state: Loaded value: %lu", (uint8_t *)&v10, 0xCu);
  }
LABEL_14:

  v7 = [[BKBookletMigrationDownloadFlowState alloc] initWithStage:v5];
  id v8 = BKBookletMigrationLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Loaded flow state: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  return v7;
}

- (void)_persistMigrationInfo:(id)a3
{
  id v4 = a3;
  v5 = +[BUAccountsProvider sharedProvider];
  id v6 = [v5 activeStoreAccount];
  v7 = [v6 ams_DSID];
  id v8 = [v7 stringValue];

  if (v8)
  {
    id v9 = [(BKBookletMigrationManager *)self migrationInfos];
    [v9 setObject:v4 forKeyedSubscript:v8];

    int v10 = +[NSUserDefaults standardUserDefaults];
    id v11 = [(BKBookletMigrationManager *)self migrationInfos];
    [v10 setObject:v11 forKey:@"BKBookletMigration.infos"];
  }
  else
  {
    v12 = BKBookletMigrationLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1007EC664(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)_persistDownloadFlowState:(id)a3
{
  id v4 = a3;
  v5 = BKBookletMigrationLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Persisting flow state: %{public}@", buf, 0xCu);
  }

  id v6 = [NSNumber numberWithUnsignedInteger:[v4 stage]];
  v8[1] = @"version";
  v9[0] = v6;
  v9[1] = &off_100A82D80;
  v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  [(BKBookletMigrationManager *)self _persistMigrationInfo:v7];
}

- (BOOL)_shouldStart
{
  if (+[BKReachability isOffline])
  {
    v2 = BKBookletMigrationLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v3 = "Device is offline, skipping booklet migration";
      id v4 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
    }
  }
  else
  {
    v5 = +[BUAccountsProvider sharedProvider];
    id v6 = [v5 activeStoreAccount];
    v7 = [v6 ams_DSID];

    if (v7) {
      return 1;
    }
    v2 = BKBookletMigrationLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      id v3 = "Not signed in to store, skipping booklet migration";
      id v4 = (uint8_t *)&v9;
      goto LABEL_8;
    }
  }

  return 0;
}

- (BOOL)_shouldRunDownloadFlowState:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 stage] >= 0xC9)
  {
    id v6 = BKBookletMigrationLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      id v9 = [v4 stage];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "stopping booklet migration download at stage: %lu", (uint8_t *)&v8, 0xCu);
    }

    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = [(BKBookletMigrationManager *)self _shouldStart];
  }

  return v5;
}

- (void)_setDownloadFlowStage:(unint64_t)a3
{
  id v4 = [[BKBookletMigrationDownloadFlowState alloc] initWithStage:a3];
  [(BKBookletMigrationManager *)self _setDownloadFlowState:v4 persist:1];
}

- (void)_setDownloadFlowState:(id)a3 persist:(BOOL)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100133F68;
  v7[3] = &unk_100A44818;
  int v8 = self;
  id v6 = a3;
  id v9 = v6;
  BOOL v10 = a4;
  os_unfair_lock_lock(&v8->_accessLock);
  sub_100133F68((uint64_t)v7);
  os_unfair_lock_unlock(&self->_accessLock);
  if ([(BKBookletMigrationManager *)self _shouldRunDownloadFlowState:v6]) {
    [(BKBookletMigrationManager *)self _runDownloadFlowFromState:v6];
  }
}

- (void)_runDownloadFlowFromState:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100134050;
  v7[3] = &unk_100A43DD8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)wq_runDownloadFlowStageInitial
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);

  [(BKBookletMigrationManager *)self _setDownloadFlowStage:150];
}

- (void)wq_runDownloadFlowStageWaitGDPRPrivacyAcknowledgement
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_privacyAcknowledgementChanged:" name:BAPrivacyAcknowledgementChanged object:0];

  [(BKBookletMigrationManager *)self wq_checkGDPRPrivacyAcknowledgementBeforeForceReloadPurchaseItems];
}

- (void)wq_checkGDPRPrivacyAcknowledgementBeforeForceReloadPurchaseItems
{
  if (BUIsGDPRAcknowledgementNeededForBooks())
  {
    id v3 = BKBookletMigrationLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "GDPR privacy acknowledgement needed", v5, 2u);
    }
  }
  else
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:BAPrivacyAcknowledgementChanged object:0];

    [(BKBookletMigrationManager *)self _setDownloadFlowStage:200];
  }
}

- (void)_privacyAcknowledgementChanged:(id)a3
{
  id v4 = BKBookletMigrationLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "GDPR privacy acknowledgement changed", buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100134558;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (id)_fetchOwnedAudiobookAssetIDsIncludeLocalOnly:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[BKLibraryManager defaultManager];
  id v6 = objc_alloc((Class)NSMutableArray);
  v7 = +[BKLibraryManager predicateForAllOwnedAudiobooks];
  id v8 = [(BKBookletMigrationManager *)self _predicateForRedownloadableAssets];
  id v9 = [v6 initWithObjects:v7, v8, 0];

  if (v3)
  {
    BOOL v10 = [v5 predicateForLocalLibraryAssets];
    [v9 addObject:v10];
  }
  id v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];
  v12 = [v5 assetIDsOfStoreAssetsWithPredicate:v11];

  return v12;
}

- (id)_predicateForRedownloadableAssets
{
  return +[NSPredicate predicateWithFormat:@"(%K == NULL) AND (%K == YES)", @"expectedDate", @"canRedownload"];
}

- (void)wq_runDownloadFlowStageForceReloadPurchaseItems
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(BKBookletMigrationManager *)self purchaseItemMigrationController];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001349B4;
  v23[3] = &unk_100A43D60;
  v23[4] = self;
  id v4 = objc_retainBlock(v23);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001349C0;
  v22[3] = &unk_100A43D60;
  v22[4] = self;
  BOOL v5 = objc_retainBlock(v22);
  if (v3)
  {
    if (objc_opt_respondsToSelector())
    {
      id v6 = [(BKBookletMigrationManager *)self _fetchOwnedAudiobookAssetIDsIncludeLocalOnly:0];
      v7 = +[NSSet setWithArray:v6];
      id v8 = BKBookletMigrationLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "About to update purchase items with assetIDs: %@", buf, 0xCu);
      }

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100134AD0;
      v18[3] = &unk_100A44638;
      uint64_t v19 = v4;
      [v3 reloadPurchaseItemStoreIDs:v7 completion:v18];
    }
    else
    {
      uint64_t v17 = BKBookletMigrationLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "About to update purchase items", buf, 2u);
      }

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100134AC0;
      v20[3] = &unk_100A44638;
      v21 = v5;
      [v3 updatePurchaseItemsWithCompletion:v20];
    }
  }
  else
  {
    id v9 = BKBookletMigrationLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1007EC69C(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    ((void (*)(void *))v4[2])(v4);
  }
}

- (void)wq_runDownloadFlowStageWait
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  [v3 doubleForKey:@"BKBookletMigration.stopAndWaitStartTime"];
  double v5 = v4;
  id v6 = +[NSDate now];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  double v9 = v8 - v5;
  uint64_t v10 = BKBookletMigrationLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9 <= 150.0)
  {
    if (v11)
    {
      int v12 = 134217984;
      double v13 = 150.0 - v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Stopping migration download for now. Will retry stage query on next launch after %.1f seconds.", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v11)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Finished waiting. Resuming migration download", (uint8_t *)&v12, 2u);
    }

    [v3 removeObjectForKey:@"BKBookletMigration.stopAndWaitStartTime"];
    [(BKBookletMigrationManager *)self _setDownloadFlowStage:400];
  }
}

- (void)wq_runDownloadFlowStageQuery
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = +[BKLibraryManager defaultManager];
  double v4 = [(BKBookletMigrationManager *)self _fetchOwnedAudiobookAssetIDsIncludeLocalOnly:1];
  double v5 = BKBookletMigrationLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = [v4 count];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "local audiobooks %lu assetIDs: %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v28 = sub_100006FF4;
  v29 = sub_1000071E4;
  id v6 = v4;
  id v30 = v6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100134F80;
  v24[3] = &unk_100A47BF0;
  v26 = buf;
  v24[4] = self;
  id v7 = v3;
  id v25 = v7;
  double v8 = objc_retainBlock(v24);
  double v9 = [(BKBookletMigrationManager *)self purchaseItemMigrationController];
  if (![v6 count])
  {
    BOOL v11 = BKBookletMigrationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No local audiobooks to consider", v23, 2u);
    }
    goto LABEL_10;
  }
  if (!v9)
  {
    BOOL v11 = BKBookletMigrationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1007EC69C(v11, v12, v13, v14, v15, v16, v17, v18);
    }
LABEL_10:

    ((void (*)(void *, uint64_t))v8[2])(v8, 1);
    goto LABEL_11;
  }
  +[NSSet setWithArray:v6];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001351F8;
  v19[3] = &unk_100A47C18;
  v22 = buf;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v10;
  v21 = v8;
  [v9 fetchReadyPurchaseItemStoreIDs:v10 completion:v19];

LABEL_11:
  _Block_object_dispose(buf, 8);
}

- (void)wq_runDownloadFlowStageQueued
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = [(BKBookletMigrationManager *)self migrationDownloadQueue];
  [v3 reloadFromStore];
}

- (void)bookletMigrationDownloadQueueDidBecomeEmpty
{
}

- (BKBookletMigrationStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (BKBookletMigrationDownloadFlowState)flowState
{
  return self->_flowState;
}

- (void)setFlowState:(id)a3
{
}

- (BKBookletMigrationDownloadQueue)migrationDownloadQueue
{
  return self->_migrationDownloadQueue;
}

- (void)setMigrationDownloadQueue:(id)a3
{
}

- (NSMutableDictionary)migrationInfos
{
  return self->_migrationInfos;
}

- (void)setMigrationInfos:(id)a3
{
}

- (BKPurchaseItemMigrationControlling)purchaseItemMigrationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_purchaseItemMigrationController);

  return (BKPurchaseItemMigrationControlling *)WeakRetained;
}

- (void)setPurchaseItemMigrationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_purchaseItemMigrationController);
  objc_storeStrong((id *)&self->_migrationInfos, 0);
  objc_storeStrong((id *)&self->_migrationDownloadQueue, 0);
  objc_storeStrong((id *)&self->_flowState, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end