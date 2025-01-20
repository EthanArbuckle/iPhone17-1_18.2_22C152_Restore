@interface BKLibraryAssetDetailsManager
- (AEAnnotationProvider)annotationProvider;
- (BCCloudAssetDetailManager)cloudAssetDetailManager;
- (BCCloudReadingNowDetailManager)cloudReadingNowDetailManager;
- (BCManagedObjectIDMonitor)libraryAssetMonitor;
- (BKLibraryAssetDetailsManager)initWithLibraryManager:(id)a3;
- (BKLibraryManager)libraryManager;
- (BOOL)enableCloudMerge;
- (BOOL)enableReadingNowSync;
- (BOOL)processingAssetDetailChanges;
- (BOOL)processingReadingNowChanges;
- (BOOL)receivedAssetDetailChangesNotification;
- (BOOL)receivedReadingNowChangesNotification;
- (OS_dispatch_queue)enableCloudMergeQueue;
- (OS_dispatch_queue)getChangesQueue;
- (void)_BCCloudAssetDetailManagerChanged:(id)a3;
- (void)_BCCloudReadingNowDetailManagerChanged:(id)a3;
- (void)_checkForChangesFromCloudAssetDetailManagerInMOC:(id)a3 reason:(id)a4;
- (void)_checkForChangesFromCloudReadingNowDetailManagerInMOC:(id)a3 reason:(id)a4;
- (void)_updateAssetDetailCloudVersionFromCloudSyncVersions:(id)a3 inMOC:(id)a4 fetchAgain:(BOOL)a5;
- (void)_updateGlobalAnnotationsFromDetails:(id)a3 annotationProvider:(id)a4;
- (void)dealloc;
- (void)managedBooksMapWithAssetIDs:(id)a3 completion:(id)a4;
- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4;
- (void)p_syncAllAssetDetailChangesToCloudInMOC:(id)a3;
- (void)p_syncAllReadingNowChangesToCloudInMOC:(id)a3;
- (void)p_syncAssetDetailsForAssets:(id)a3 inMOC:(id)a4;
- (void)p_syncReadingNowDetailsForAssets:(id)a3 inMOC:(id)a4;
- (void)setAnnotationProvider:(id)a3;
- (void)setCloudAssetDetailManager:(id)a3;
- (void)setCloudReadingNowDetailManager:(id)a3;
- (void)setEnableCloudMerge:(BOOL)a3;
- (void)setEnableCloudMergeQueue:(id)a3;
- (void)setEnableReadingNowSync:(BOOL)a3;
- (void)setGetChangesQueue:(id)a3;
- (void)setLibraryAssetMonitor:(id)a3;
- (void)setLibraryManager:(id)a3;
- (void)setProcessingAssetDetailChanges:(BOOL)a3;
- (void)setProcessingReadingNowChanges:(BOOL)a3;
- (void)setReceivedAssetDetailChangesNotification:(BOOL)a3;
- (void)setReceivedReadingNowChangesNotification:(BOOL)a3;
- (void)updateAssetDetailsWithGlobalAnnotations:(id)a3 completion:(id)a4;
@end

@implementation BKLibraryAssetDetailsManager

- (BKLibraryAssetDetailsManager)initWithLibraryManager:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BKLibraryAssetDetailsManager;
  v5 = [(BKLibraryAssetDetailsManager *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_libraryManager, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.iBooks.BKLibraryAssetDetailsManager", v7);
    enableCloudMergeQueue = v6->_enableCloudMergeQueue;
    v6->_enableCloudMergeQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.iBooks.BKLibraryAssetDetailsManager.getChanges", v10);
    getChangesQueue = v6->_getChangesQueue;
    v6->_getChangesQueue = (OS_dispatch_queue *)v11;

    v13 = +[NSDistributedNotificationCenter defaultCenter];
    [v13 addObserver:v6 selector:"_BCCloudAssetDetailManagerChanged:" name:BCCloudAssetDetailManagerChanged object:0];

    v14 = +[NSDistributedNotificationCenter defaultCenter];
    [v14 addObserver:v6 selector:"_BCCloudReadingNowDetailManagerChanged:" name:BCCloudReadingNowDetailManagerChanged object:0];

    v15 = +[BCCloudAssetManager sharedManager];
    v16 = [v15 assetDetailManager];
    objc_storeWeak((id *)&v6->_cloudAssetDetailManager, v16);

    v17 = +[BCCloudAssetManager sharedManager];
    v18 = [v17 readingNowDetailManager];
    objc_storeWeak((id *)&v6->_cloudReadingNowDetailManager, v18);
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self name:BCCloudAssetDetailManagerChanged object:0];

  id v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 removeObserver:self name:BCCloudReadingNowDetailManagerChanged object:0];

  objc_storeWeak((id *)&self->_libraryManager, 0);
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryAssetDetailsManager;
  [(BKLibraryAssetDetailsManager *)&v5 dealloc];
}

- (void)setEnableCloudMerge:(BOOL)a3
{
  objc_super v5 = [(BKLibraryAssetDetailsManager *)self enableCloudMergeQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_489FC;
  v6[3] = &unk_D21D8;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)setEnableReadingNowSync:(BOOL)a3
{
  if (self->_enableReadingNowSync != a3)
  {
    self->_enableReadingNowSync = a3;
    if (a3)
    {
      id v4 = [(BKLibraryAssetDetailsManager *)self libraryManager];
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_49184;
      v5[3] = &unk_D16B0;
      v5[4] = self;
      [v4 performNamed:@"setEnableReadingNowSync" workerQueueBlockAndWait:v5];
    }
  }
}

- (void)p_syncAllAssetDetailChangesToCloudInMOC:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v5 setReturnsObjectsAsFaults:0];
  v6 = +[BKLibraryManager predicateForExcludingContainerLibraryAssets];
  [v5 setPredicate:v6];

  id v10 = 0;
  BOOL v7 = [v4 executeFetchRequest:v5 error:&v10];
  id v8 = v10;
  if (v8)
  {
    v9 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_91DA0();
    }
  }
  else
  {
    [(BKLibraryAssetDetailsManager *)self p_syncAssetDetailsForAssets:v7 inMOC:v4];
  }
}

- (void)p_syncAssetDetailsForAssets:(id)a3 inMOC:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v30 = self;
    id v8 = [(BKLibraryAssetDetailsManager *)self libraryManager];
    id v31 = v7;
    v9 = [v8 cloudSyncVersionsForDataType:@"BCAssetDetail" inContext:v7];

    [v9 setLocalVersion:[v9 localVersion] + 1];
    id v29 = [v9 localVersion];
    id v10 = +[NSMutableDictionary dictionary];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v11 = v6;
    id v12 = [v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v39;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ([v16 hasImportantAssetDetails])
          {
            v17 = [v16 assetDetailRepresentation];
            v18 = [v16 assetID];

            if (v18)
            {
              v19 = [v16 assetID];
              [v10 setObject:v17 forKey:v19];
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v13);
    }

    if ([v10 count])
    {
      objc_super v20 = +[BULogUtilities shared];
      unsigned int v21 = [v20 verboseLoggingEnabled];

      if (v21)
      {
        v22 = BKLibraryAssetDetailsDevelopmentLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = [v10 count];
          *(_DWORD *)buf = 134217984;
          id v43 = v23;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "\"\\\"BCAssetDetail found %lu details to sync\\\"\"", buf, 0xCu);
        }
      }
    }
    if ([v10 count])
    {
      v24 = [v10 allKeys];
      v25 = +[AEAnnotation predicateForGlobalAnnotationsWithAssetIDs:v24];
      v26 = [(BKLibraryAssetDetailsManager *)v30 annotationProvider];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_49654;
      v33[3] = &unk_D2BB0;
      id v34 = v10;
      v35 = v30;
      id v36 = v24;
      id v37 = v29;
      id v27 = v24;
      [v26 onAnnotationsMatchingPredicate:v25 performBlock:v33];
    }
    else
    {
      v28 = [(BKLibraryAssetDetailsManager *)v30 libraryManager];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_49EB0;
      v32[3] = &unk_D2B60;
      v32[4] = v30;
      v32[5] = v29;
      [v28 performBlockOnWorkerQueue:v32];
    }
    id v7 = v31;
  }
}

- (void)p_syncAllReadingNowChangesToCloudInMOC:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v5 setReturnsObjectsAsFaults:0];
  id v6 = +[BKLibraryManager predicateForExcludingContainerLibraryAssets];
  [v5 setPredicate:v6];

  id v11 = 0;
  id v7 = [v4 executeFetchRequest:v5 error:&v11];
  id v8 = v11;
  v9 = BKLibraryAssetDetailsLog();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_91DA0();
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_91F34();
    }

    [(BKLibraryAssetDetailsManager *)self p_syncReadingNowDetailsForAssets:v7 inMOC:v4];
  }
}

- (void)p_syncReadingNowDetailsForAssets:(id)a3 inMOC:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_0, "Books/sync-ReadingNow", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4A14C;
  block[3] = &unk_D1A38;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  os_activity_apply(v8, block);
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  id v6 = [v5 context];
  id v7 = BUDynamicCast();

  id v8 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_92294();
  }

  if (!v7) {
    goto LABEL_9;
  }
  if ([v7 sessionContextType] == 2) {
    goto LABEL_9;
  }
  if ([v7 sessionContextType] == 3) {
    goto LABEL_9;
  }
  if ([v7 sessionContextType] == 1) {
    goto LABEL_9;
  }
  id v9 = [v7 persistentStoreCoordinator];
  id v10 = [(BKLibraryAssetDetailsManager *)self libraryManager];
  id v11 = [v10 persistentStoreCoordinator];
  unsigned int v12 = [v9 hasStoreInCommonWith:v11];

  if (!v12)
  {
LABEL_9:
    id v14 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_92174(v7, self, v14);
    }
  }
  else
  {
    id v13 = [(BKLibraryAssetDetailsManager *)self enableCloudMergeQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_4A9C8;
    v15[3] = &unk_D1418;
    v15[4] = self;
    id v16 = v5;
    dispatch_async(v13, v15);
  }
}

- (void)_BCCloudAssetDetailManagerChanged:(id)a3
{
  id v4 = [(BKLibraryAssetDetailsManager *)self getChangesQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4B8BC;
  block[3] = &unk_D1520;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)_updateAssetDetailCloudVersionFromCloudSyncVersions:(id)a3 inMOC:(id)a4 fetchAgain:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(BKLibraryAssetDetailsManager *)self libraryManager];
  [v10 updateCloudVersionFromCloudSyncVersions:v9 inContext:v8];

  if (v5)
  {
    [(BKLibraryAssetDetailsManager *)self _checkForChangesFromCloudAssetDetailManagerInMOC:v8 reason:@"fetchAgain"];
  }
  else
  {
    id v11 = [(BKLibraryAssetDetailsManager *)self getChangesQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4BB58;
    block[3] = &unk_D1520;
    void block[4] = self;
    dispatch_async(v11, block);
  }
}

- (void)_updateGlobalAnnotationsFromDetails:(id)a3 annotationProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 bu_dictionaryUsingPropertyAsKey:@"assetID"];
  if ([v7 count])
  {
    id v8 = +[BULogUtilities shared];
    unsigned int v9 = [v8 verboseLoggingEnabled];

    if (v9)
    {
      id v10 = BKLibraryAssetDetailsDevelopmentLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v5;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "\"\\\"_updateGlobalAnnotationsFromDetails with assetDetails: %@\\\"\"", buf, 0xCu);
      }
    }
    id v11 = [v7 allKeys];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_4BE70;
    v12[3] = &unk_D2C50;
    id v13 = v7;
    [v6 modifyGlobalAnnotationsWithAssetIDs:v11 type:2 performBlock:v12];
  }
}

- (void)_checkForChangesFromCloudAssetDetailManagerInMOC:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKLibraryAssetDetailsManager *)self libraryManager];
  unsigned int v9 = [(BKLibraryAssetDetailsManager *)self annotationProvider];
  id v10 = [v8 cloudSyncVersionsForDataType:@"BCAssetDetail" inContext:v7];

  id v11 = [v10 mutableCopy];
  unsigned int v12 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = v11;
    __int16 v21 = 2114;
    id v22 = v6;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "_checkForChangesFromCloudAssetDetailManagerInMOC cloudSyncVersions:%{public}@, reason:%{public}@", buf, 0x16u);
  }

  id v13 = [(BKLibraryAssetDetailsManager *)self cloudAssetDetailManager];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_4CA70;
  v16[3] = &unk_D2CC8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  [v13 getAssetDetailChangesSince:v11 completion:v16];
}

- (void)_BCCloudReadingNowDetailManagerChanged:(id)a3
{
  id v4 = _os_activity_create(&dword_0, "Books/process-ReadingNowDetailManagerChanged", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4D028;
  block[3] = &unk_D1520;
  void block[4] = self;
  os_activity_apply(v4, block);
}

- (void)_checkForChangesFromCloudReadingNowDetailManagerInMOC:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_0, "Books/BKLibrary-checkForReadingNowChange", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4D2C0;
  block[3] = &unk_D1A38;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  os_activity_apply(v8, block);
}

- (void)updateAssetDetailsWithGlobalAnnotations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKLibraryAssetDetailsManager *)self libraryManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_4DB28;
  v11[3] = &unk_D1B28;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlockOnWorkerQueue:v11];
}

- (void)managedBooksMapWithAssetIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKLibraryAssetDetailsManager *)self libraryManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_4E480;
  v11[3] = &unk_D1B28;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlockOnWorkerQueue:v11];
}

- (BOOL)enableCloudMerge
{
  return self->_enableCloudMerge;
}

- (BOOL)enableReadingNowSync
{
  return self->_enableReadingNowSync;
}

- (AEAnnotationProvider)annotationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationProvider);

  return (AEAnnotationProvider *)WeakRetained;
}

- (void)setAnnotationProvider:(id)a3
{
}

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (void)setLibraryManager:(id)a3
{
}

- (BCCloudAssetDetailManager)cloudAssetDetailManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudAssetDetailManager);

  return (BCCloudAssetDetailManager *)WeakRetained;
}

- (void)setCloudAssetDetailManager:(id)a3
{
}

- (BCCloudReadingNowDetailManager)cloudReadingNowDetailManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudReadingNowDetailManager);

  return (BCCloudReadingNowDetailManager *)WeakRetained;
}

- (void)setCloudReadingNowDetailManager:(id)a3
{
}

- (BCManagedObjectIDMonitor)libraryAssetMonitor
{
  return self->_libraryAssetMonitor;
}

- (void)setLibraryAssetMonitor:(id)a3
{
}

- (OS_dispatch_queue)enableCloudMergeQueue
{
  return self->_enableCloudMergeQueue;
}

- (void)setEnableCloudMergeQueue:(id)a3
{
}

- (OS_dispatch_queue)getChangesQueue
{
  return self->_getChangesQueue;
}

- (void)setGetChangesQueue:(id)a3
{
}

- (BOOL)processingAssetDetailChanges
{
  return self->_processingAssetDetailChanges;
}

- (void)setProcessingAssetDetailChanges:(BOOL)a3
{
  self->_processingAssetDetailChanges = a3;
}

- (BOOL)receivedAssetDetailChangesNotification
{
  return self->_receivedAssetDetailChangesNotification;
}

- (void)setReceivedAssetDetailChangesNotification:(BOOL)a3
{
  self->_receivedAssetDetailChangesNotification = a3;
}

- (BOOL)processingReadingNowChanges
{
  return self->_processingReadingNowChanges;
}

- (void)setProcessingReadingNowChanges:(BOOL)a3
{
  self->_processingReadingNowChanges = a3;
}

- (BOOL)receivedReadingNowChangesNotification
{
  return self->_receivedReadingNowChangesNotification;
}

- (void)setReceivedReadingNowChangesNotification:(BOOL)a3
{
  self->_receivedReadingNowChangesNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getChangesQueue, 0);
  objc_storeStrong((id *)&self->_enableCloudMergeQueue, 0);
  objc_storeStrong((id *)&self->_libraryAssetMonitor, 0);
  objc_destroyWeak((id *)&self->_cloudReadingNowDetailManager);
  objc_destroyWeak((id *)&self->_cloudAssetDetailManager);
  objc_destroyWeak((id *)&self->_libraryManager);

  objc_destroyWeak((id *)&self->_annotationProvider);
}

@end