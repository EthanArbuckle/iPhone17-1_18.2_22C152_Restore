@interface BKLibraryAssetIsNewManager
- (AEAnnotationProvider)annotationProvider;
- (BKLibraryAssetIsNewManager)initWithLibraryManager:(id)a3 annotationProvider:(id)a4 queue:(id)a5;
- (BKLibraryAssetIsNewManagerDelegate)delegate;
- (BKLibraryManager)libraryManager;
- (BOOL)_resetNextForSeriesID:(id)a3 inMOC:(id)a4;
- (BOOL)audiobookProgressMigrationComplete;
- (BUCoalescingCallBlock)coalescedMigrateAudiobookProgress;
- (BUCoalescingCallBlock)coalescedResetNextInSeries;
- (NSMutableSet)markedAssets;
- (NSMutableSet)seriesIDsToResetNext;
- (OS_dispatch_queue)markedAssetsQueue;
- (OS_dispatch_queue)processEPUBIDQueue;
- (OS_dispatch_queue)processSeriesBooksQueue;
- (OS_dispatch_queue)workerQueue;
- (void)_alternateProgressInfoForLocalAssetIDs:(id)a3 cloudAssetIDs:(id)a4 completion:(id)a5;
- (void)_mediaLibraryDidChange:(id)a3;
- (void)_migrateAudiobookProgressIfNeeded;
- (void)dealloc;
- (void)libraryOwnershipDidChange:(id)a3;
- (void)migrateAudiobookProgressIfNeeded;
- (void)mocDidSave:(id)a3;
- (void)p_processEpubIDForAssetIDs:(id)a3;
- (void)p_processEpubIDForLibraryAssets:(id)a3 handlingEpubID:(id)a4 foundAssetHandler:(id)a5;
- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)resetIsNewForAssetIDs:(id)a3;
- (void)resetIsNewIfNeeded;
- (void)resetProgressHighWaterMarkForAssetIDs:(id)a3;
- (void)resetSeriesContainerSortAuthorForAssetIDs:(id)a3;
- (void)setAudiobookProgressMigrationComplete:(BOOL)a3;
- (void)setCoalescedMigrateAudiobookProgress:(id)a3;
- (void)setCoalescedResetNextInSeries:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMarkedAssets:(id)a3;
- (void)setMarkedAssetsQueue:(id)a3;
- (void)setProcessEPUBIDQueue:(id)a3;
- (void)setProcessSeriesBooksQueue:(id)a3;
- (void)setSeriesIDsToResetNext:(id)a3;
- (void)setWorkerQueue:(id)a3;
- (void)updateLibraryAssetEpubIDsHandling:(id)a3 foundAssetHandler:(id)a4;
- (void)updateStaleEpubIDs;
@end

@implementation BKLibraryAssetIsNewManager

- (void)setDelegate:(id)a3
{
  self->_delegate = (BKLibraryAssetIsNewManagerDelegate *)a3;
}

- (BKLibraryAssetIsNewManager)initWithLibraryManager:(id)a3 annotationProvider:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v47.receiver = self;
  v47.super_class = (Class)BKLibraryAssetIsNewManager;
  v12 = [(BKLibraryAssetIsNewManager *)&v47 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workerQueue, a5);
    objc_storeStrong((id *)&v13->_libraryManager, a3);
    objc_storeStrong((id *)&v13->_annotationProvider, a4);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.iBooksX.BKLibraryAssetIsNewManager", v14);
    markedAssetsQueue = v13->_markedAssetsQueue;
    v13->_markedAssetsQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.iBooksX.BKLibraryAssetIsNewManager.processEPUBID", v18);
    processEPUBIDQueue = v13->_processEPUBIDQueue;
    v13->_processEPUBIDQueue = (OS_dispatch_queue *)v19;

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.iBooksX.BKLibraryAssetIsNewManager.processSeriesBooks", v18);
    processSeriesBooksQueue = v13->_processSeriesBooksQueue;
    v13->_processSeriesBooksQueue = (OS_dispatch_queue *)v21;

    v23 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    markedAssets = v13->_markedAssets;
    v13->_markedAssets = v23;

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v13 selector:"mocDidSave:" name:NSManagedObjectContextDidSaveNotification object:0];

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v13 selector:"libraryOwnershipDidChange:" name:BKLibraryOwnershipDidChangeNotification object:0];

    v27 = +[BKAudiobookPlayer sharedInstance];
    [v27 addObserver:v13];

    objc_initWeak(&location, v13);
    id v28 = objc_alloc((Class)BUCoalescingCallBlock);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1001770A8;
    v43[3] = &unk_100A48CB0;
    objc_copyWeak(&v45, &location);
    v29 = v13;
    v44 = v29;
    v30 = (BUCoalescingCallBlock *)[v28 initWithNotifyBlock:v43 blockDescription:@"BKLibraryAssetIsNewManager coalescedResetNextInSeries"];
    coalescedResetNextInSeries = v29->_coalescedResetNextInSeries;
    v29->_coalescedResetNextInSeries = v30;

    uint64_t v32 = objc_opt_new();
    seriesIDsToResetNext = v29->_seriesIDsToResetNext;
    v29->_seriesIDsToResetNext = (NSMutableSet *)v32;

    if ([(BKLibraryAssetIsNewManager *)v29 audiobookProgressMigrationComplete])
    {
      v34 = sub_100078290();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "No need to migrate audiobook progress, migration is complete", buf, 2u);
      }
    }
    else
    {
      id v35 = objc_alloc((Class)BUCoalescingCallBlock);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100177490;
      v40[3] = &unk_100A451B8;
      objc_copyWeak(&v41, &location);
      v36 = (BUCoalescingCallBlock *)[v35 initWithNotifyBlock:v40 blockDescription:@"BKLibraryAssetIsNewManager coalescedMigrateAudiobookProgress"];
      coalescedMigrateAudiobookProgress = v29->_coalescedMigrateAudiobookProgress;
      v29->_coalescedMigrateAudiobookProgress = v36;

      [(BUCoalescingCallBlock *)v29->_coalescedMigrateAudiobookProgress setCoalescingDelay:30.0];
      [(BUCoalescingCallBlock *)v29->_coalescedMigrateAudiobookProgress setMaximumDelay:300.0];
      v38 = +[NSNotificationCenter defaultCenter];
      [v38 addObserver:v29 selector:"_mediaLibraryDidChange:" name:MPMediaLibraryDidChangeNotification object:0];

      objc_destroyWeak(&v41);
    }

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }
  return v13;
}

- (BOOL)audiobookProgressMigrationComplete
{
  v2 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = (uint64_t)[v2 integerForKey:@"AudiobookProgressMigrationGenerationCompleted"];

  return v3 > 1;
}

- (void)setAudiobookProgressMigrationComplete:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  id v6 = v4;
  if (v3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setInteger:v5 forKey:@"AudiobookProgressMigrationGenerationCompleted"];
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSManagedObjectContextDidSaveNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:MPMediaLibraryDidChangeNotification object:0];

  uint64_t v5 = +[BKAudiobookPlayer sharedInstance];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryAssetIsNewManager;
  [(BKLibraryAssetIsNewManager *)&v6 dealloc];
}

- (void)mocDidSave:(id)a3
{
  id v81 = a3;
  v82 = [v81 object];
  BOOL v3 = [v82 persistentStoreCoordinator];
  v4 = [(BKLibraryAssetIsNewManager *)self annotationProvider];
  uint64_t v5 = [v4 persistentStoreCoordinator];

  if (v3 != v5)
  {
    objc_super v6 = [v82 persistentStoreCoordinator];
    v7 = [(BKLibraryAssetIsNewManager *)self libraryManager];
    v8 = [v7 persistentStoreCoordinator];
    if (v6 != v8)
    {

      goto LABEL_103;
    }
    objc_opt_class();
    v38 = BUDynamicCast();
    unsigned int v39 = [v38 sessionContextType];

    if (v39 == 4) {
      goto LABEL_103;
    }
    v78 = [v81 userInfo];
    v77 = +[NSMutableSet set];
    v76 = [v78 objectForKey:];
    v75 = [v78 objectForKey:];
    if ([v76 count]) {
      [v77 unionSet:v76];
    }
    if ([v75 count]) {
      [v77 unionSet:v75];
    }
    v80 = +[NSMutableArray array];
    if ([v77 count])
    {
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id v40 = v77;
      id v41 = [v40 countByEnumeratingWithState:&v98 objects:v115 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v99;
        do
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(void *)v99 != v42) {
              objc_enumerationMutation(v40);
            }
            v44 = [*(id *)(*((void *)&v98 + 1) + 8 * i) entity];
            id v45 = [v44 name];
            unsigned int v46 = [v45 isEqualToString:@"BKLibraryAsset"];

            if (v46)
            {
              objc_opt_class();
              objc_super v47 = BUDynamicCast();
              if (![v47 isLocal]
                || ([v47 isAudiobook] & 1) != 0)
              {
                goto LABEL_68;
              }
              v48 = [v47 epubID];
              if (!v48
                || ([v47 epubID],
                    v84 = objc_claimAutoreleasedReturnValue(),
                    ([v84 isEqualToString:&stru_100A70340] & 1) != 0))
              {
                v49 = [v47 path];
                if (v49)
                {
                  v50 = [v47 path];
                  id v51 = [v50 length];

                  if (v48)
                  {

                    if (!v51) {
                      goto LABEL_68;
                    }
LABEL_66:
                    v48 = [v47 assetID];
                    [v80 addObject:v48];
LABEL_67:
                  }
                  else if (v51)
                  {
                    goto LABEL_66;
                  }
LABEL_68:

                  continue;
                }
                if (!v48) {
                  goto LABEL_68;
                }
              }

              goto LABEL_67;
            }
          }
          id v41 = [v40 countByEnumeratingWithState:&v98 objects:v115 count:16];
        }
        while (v41);
      }

      if ([v80 count])
      {
        [(BKLibraryAssetIsNewManager *)self p_processEpubIDForAssetIDs:v80];
        [(BKLibraryAssetIsNewManager *)self resetIsNewForAssetIDs:v80];
      }
    }

    v52 = [(BKLibraryAssetIsNewManager *)self delegate];
    unsigned __int8 v53 = [v52 isSyncingEnabledForIsNewManager:self];

    if (v53)
    {
      id v54 = [v78 objectForKey:NSUpdatedObjectsKey];
      if (![v54 count])
      {
LABEL_102:

        goto LABEL_103;
      }
      id v86 = +[NSMutableSet set];
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v54 = v54;
      id v55 = [v54 countByEnumeratingWithState:&v90 objects:v113 count:16];
      if (v55)
      {
        uint64_t v56 = *(void *)v91;
        do
        {
          for (j = 0; j != v55; j = (char *)j + 1)
          {
            if (*(void *)v91 != v56) {
              objc_enumerationMutation(v54);
            }
            id v58 = *(id *)(*((void *)&v90 + 1) + 8 * (void)j);
            objc_opt_class();
            v59 = BUDynamicCast();
            if (([v59 isDeleted] & 1) == 0)
            {
              v60 = [v59 seriesID];
              BOOL v61 = v60 == 0;

              if (!v61)
              {
                v62 = [v59 seriesID];
                [v86 addObject:v62];
              }
            }
          }
          id v55 = [v54 countByEnumeratingWithState:&v90 objects:v113 count:16];
        }
        while (v55);
      }

      if ([v86 count])
      {
        v63 = [(BKLibraryAssetIsNewManager *)self processSeriesBooksQueue];
        v88[0] = _NSConcreteStackBlock;
        v88[1] = 3221225472;
        v88[2] = sub_100178360;
        v88[3] = &unk_100A43DD8;
        v88[4] = self;
        id v87 = v86;
        id v89 = v87;
        dispatch_async(v63, v88);

        goto LABEL_102;
      }
    }
    else
    {
      id v54 = [v78 objectForKey:NSInsertedObjectsKey];
      if (![v54 count]) {
        goto LABEL_102;
      }
      id v86 = objc_alloc_init((Class)NSMutableSet);
      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v54 = v54;
      id v64 = [v54 countByEnumeratingWithState:&v94 objects:v114 count:16];
      if (v64)
      {
        uint64_t v65 = *(void *)v95;
        do
        {
          for (k = 0; k != v64; k = (char *)k + 1)
          {
            if (*(void *)v95 != v65) {
              objc_enumerationMutation(v54);
            }
            v67 = [*(id *)(*((void *)&v94 + 1) + 8 * (void)k) entity];
            v68 = [v67 name];
            unsigned int v69 = [v68 isEqualToString:@"BKLibraryAsset"];

            if (v69)
            {
              objc_opt_class();
              v70 = BUDynamicCast();
              v71 = [v70 assetID];

              if (v71)
              {
                v72 = [v70 assetID];
                [v86 addObject:v72];
              }
            }
          }
          id v64 = [v54 countByEnumeratingWithState:&v94 objects:v114 count:16];
        }
        while (v64);
      }

      if ([v86 count])
      {
        v73 = [v86 allObjects];
        [(BKLibraryAssetIsNewManager *)self resetIsNewForAssetIDs:v73];

        v74 = [v86 allObjects];
        [(BKLibraryAssetIsNewManager *)self resetProgressHighWaterMarkForAssetIDs:v74];
      }
    }

    goto LABEL_102;
  }
  v85 = [v81 userInfo];
  id v9 = [v85 objectForKey:NSInsertedObjectsKey];
  id v10 = +[NSPredicate predicateWithFormat:@"SELF isKindOfClass: %@", objc_opt_class()];
  v79 = [v9 filteredSetUsingPredicate:v10];

  if ([v79 count])
  {
    id v11 = objc_alloc_init((Class)NSMutableSet);
    id v12 = objc_alloc_init((Class)NSMutableSet);
    uint64_t v118 = 0;
    v119 = &v118;
    uint64_t v120 = 0x3032000000;
    v121 = sub_100007090;
    v122 = sub_100007224;
    id v123 = 0;
    v13 = [(BKLibraryAssetIsNewManager *)self markedAssetsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001782A8;
    block[3] = &unk_100A44058;
    block[5] = &v118;
    block[4] = self;
    dispatch_sync(v13, block);

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v14 = v79;
    id v15 = [v14 countByEnumeratingWithState:&v108 objects:v117 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v109;
      do
      {
        for (m = 0; m != v15; m = (char *)m + 1)
        {
          if (*(void *)v109 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = *(id *)(*((void *)&v108 + 1) + 8 * (void)m);
          if (([v18 isDeleted] & 1) == 0)
          {
            dispatch_queue_t v19 = [v18 annotationAssetID];
            if (([(id)v119[5] containsObject:v19] & 1) == 0) {
              [v11 addObject:v19];
            }
            if ([v18 annotationType] == 3) {
              [v12 addObject:v19];
            }
          }
        }
        id v15 = [v14 countByEnumeratingWithState:&v108 objects:v117 count:16];
      }
      while (v15);
    }

    v20 = [(BKLibraryAssetIsNewManager *)self markedAssetsQueue];
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = sub_10017830C;
    v106[3] = &unk_100A43DD8;
    v106[4] = self;
    id v21 = v11;
    id v107 = v21;
    dispatch_async(v20, v106);

    if ([v21 count])
    {
      v22 = [v21 allObjects];
      [(BKLibraryAssetIsNewManager *)self resetIsNewForAssetIDs:v22];
    }
    if ([v12 count])
    {
      v23 = [v12 allObjects];
      [(BKLibraryAssetIsNewManager *)self resetProgressHighWaterMarkForAssetIDs:v23];
    }
    _Block_object_dispose(&v118, 8);
  }
  v24 = [v85 objectForKey:NSUpdatedObjectsKey];
  v25 = +[NSPredicate predicateWithFormat:@"SELF isKindOfClass: %@", objc_opt_class()];
  v26 = [v24 filteredSetUsingPredicate:v25];

  if ([v26 count])
  {
    id v27 = objc_alloc_init((Class)NSMutableSet);
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v28 = v26;
    id v29 = [v28 countByEnumeratingWithState:&v102 objects:v116 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v103;
      do
      {
        for (n = 0; n != v29; n = (char *)n + 1)
        {
          if (*(void *)v103 != v30) {
            objc_enumerationMutation(v28);
          }
          id v32 = *(id *)(*((void *)&v102 + 1) + 8 * (void)n);
          if ([v32 annotationType] == 3)
          {
            v33 = [v32 annotationAssetID];
            [v32 readingProgress];
            if (v34 < 0.0 || ([v32 readingProgress], v35 > 1.0))
            {
              v36 = sub_100078290();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
                sub_1007EDBCC((uint8_t *)&v118, v32, (double *)((char *)&v118 + 4), v36);
              }
            }
            [v27 addObject:v33];
          }
        }
        id v29 = [v28 countByEnumeratingWithState:&v102 objects:v116 count:16];
      }
      while (v29);
    }

    if ([v27 count])
    {
      v37 = [v27 allObjects];
      [(BKLibraryAssetIsNewManager *)self resetProgressHighWaterMarkForAssetIDs:v37];
    }
  }

LABEL_103:
}

- (void)libraryOwnershipDidChange:(id)a3
{
  id v3 = a3;
  v26 = objc_opt_new();
  v23 = v3;
  v24 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v4 = [v3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:BKLibraryOwnershipAssetsKey];

  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v28 = *(void *)v30;
    uint64_t v27 = BKLibraryOwnershipOldDatasourceKey;
    uint64_t v8 = BKLibraryOwnershipNewDatasourceKey;
    uint64_t v9 = BKLibraryOwnershipAssetIDKey;
    uint64_t v10 = BKLibraryOwnershipNewStateKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v13 = [v12 objectForKeyedSubscript:v27];
        uint64_t v14 = [v12 objectForKeyedSubscript:v8];
        id v15 = (void *)v14;
        if (v13) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = v14 == 0;
        }
        if (!v16)
        {
          v17 = [v12 objectForKeyedSubscript:v9];
          if (v17) {
            [v24 addObject:v17];
          }
        }
        id v18 = [v12 objectForKeyedSubscript:v10];
        unsigned int v19 = [v18 integerValue];

        unsigned int v20 = v19 << 16;
        if (v19 << 16 == 0x10000 || v20 == 0x40000 || v20 == 0x20000)
        {
          id v21 = [v12 objectForKeyedSubscript:v9];
          [v26 addObject:v21];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }

  if ([v26 count])
  {
    [(BKLibraryAssetIsNewManager *)self resetIsNewForAssetIDs:v26];
    [(BKLibraryAssetIsNewManager *)self resetSeriesContainerSortAuthorForAssetIDs:v26];
  }
}

- (void)_mediaLibraryDidChange:(id)a3
{
  v4 = [(BKLibraryAssetIsNewManager *)self coalescedMigrateAudiobookProgress];

  if (v4)
  {
    uint64_t v5 = sub_100078290();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received a notification that the media library did change.  Signalling the coalesced migration block", v7, 2u);
    }

    id v6 = [(BKLibraryAssetIsNewManager *)self coalescedMigrateAudiobookProgress];
    [v6 signalWithCompletion:&stru_100A48CF0];
  }
}

- (void)resetIsNewIfNeeded
{
}

- (void)resetSeriesContainerSortAuthorForAssetIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(BKLibraryAssetIsNewManager *)self libraryManager];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10017882C;
    v6[3] = &unk_100A44E38;
    id v7 = v4;
    uint64_t v8 = self;
    [v5 performBlockOnWorkerQueue:v6];
  }
}

- (void)resetIsNewForAssetIDs:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (!v4 || v5)
  {
    id v6 = [(BKLibraryAssetIsNewManager *)self workerQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100178BA0;
    v7[3] = &unk_100A43DD8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

- (void)resetProgressHighWaterMarkForAssetIDs:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (!v4 || v5)
  {
    id v6 = [(BKLibraryAssetIsNewManager *)self workerQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100179A88;
    v7[3] = &unk_100A43DD8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

- (void)p_processEpubIDForLibraryAssets:(id)a3 handlingEpubID:(id)a4 foundAssetHandler:(id)a5
{
  id v8 = a3;
  id v31 = a4;
  id v30 = a5;
  uint64_t v9 = [(BKLibraryAssetIsNewManager *)self processEPUBIDQueue];
  dispatch_assert_queue_V2(v9);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v35;
    uint64_t v32 = AEHelperStringMetadataBookIdUrlIdentifierKey;
    id v33 = v10;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v16 = [v15 path];
        if (v16)
        {
          v17 = (void *)v16;
          id v18 = [v15 path];
          if ([v18 length])
          {
            unsigned int v19 = [v15 epubID];

            if (!v19)
            {
              id v21 = [v15 path];
              v22 = +[NSURL fileURLWithPath:v21];

              v23 = +[AEPluginRegistry sharedInstance];
              v24 = [v23 pluginForURL:v22];

              if (v24)
              {
                v25 = [v24 helperForURL:v22 withOptions:0];
                if (v25)
                {
                  objc_opt_class();
                  v26 = [v25 helperMetadataForKey:v32 needsCoordination:1];
                  uint64_t v27 = BUDynamicCast();

                  if ([v27 length])
                  {
                    [v15 setDifferentString:v27 forKey:@"epubID"];
                    id v10 = v33;
                    if ([v27 isEqualToString:v31])
                    {
                      id v28 = objc_retainBlock(v30);
                      long long v29 = v28;
                      if (v28) {
                        (*((void (**)(id))v28 + 2))(v28);
                      }
                    }
                  }
                  else
                  {
                    [v15 setDifferentString:&stru_100A70340 forKey:@"epubID"];
                    id v10 = v33;
                  }
                }
              }
            }
          }
          else
          {
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v12);
  }
}

- (void)p_processEpubIDForAssetIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryAssetIsNewManager *)self processEPUBIDQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017A66C;
  v7[3] = &unk_100A43DD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updateStaleEpubIDs
{
  id v3 = [(BKLibraryAssetIsNewManager *)self workerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017A860;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)updateLibraryAssetEpubIDsHandling:(id)a3 foundAssetHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKLibraryAssetIsNewManager *)self processEPUBIDQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017A948;
  block[3] = &unk_100A45338;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (BOOL)_resetNextForSeriesID:(id)a3 inMOC:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
    id v9 = +[BKLibraryManager predicateToExcludeUnownedLibraryAssets];
    v91[0] = v9;
    id v10 = [(BKLibraryAssetIsNewManager *)self libraryManager];
    id v11 = [v10 predicateForLibraryAssetsWithSeriesID:v6];
    v91[1] = v11;
    id v12 = +[NSArray arrayWithObjects:v91 count:2];
    id v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];
    [v8 setPredicate:v13];

    uint64_t v14 = off_100A3C000;
    id v15 = +[NSSortDescriptor sortDescriptorWithKey:@"seriesSortKey" ascending:0];
    long long v90 = v15;
    uint64_t v16 = +[NSArray arrayWithObjects:&v90 count:1];
    [v8 setSortDescriptors:v16];

    [v8 setReturnsObjectsAsFaults:0];
    [v8 setFetchLimit:1];
    id v84 = 0;
    v17 = [v7 executeFetchRequest:v8 error:&v84];
    id v18 = v84;
    if (![v17 count])
    {
      LOBYTE(v42) = 0;
LABEL_35:

      BOOL v39 = v42 & 1;
      goto LABEL_36;
    }
    v71 = v17;
    unsigned int v19 = [v17 firstObject];
    id v76 = v7;
    id v70 = v18;
    id v72 = v6;
    v73 = v19;
    if (!v19
      || (unsigned int v20 = v19,
          [v19 seriesSortKey],
          id v21 = objc_claimAutoreleasedReturnValue(),
          v21,
          !v21))
    {
      id v40 = self;
      id v41 = 0;
      LOBYTE(v42) = 0;
      uint64_t v27 = off_100A3C000;
LABEL_21:
      v44 = [(BKLibraryAssetIsNewManager *)v40 libraryManager];
      uint64_t v45 = [v44 predicateForLibraryAssetsWithSeriesID:v6];

      uint64_t v46 = +[BKLibraryManager predicateForNextInSeriesLibraryAssets];
      objc_super v47 = v27[230];
      v67 = (void *)v46;
      unsigned int v69 = (void *)v45;
      v87[0] = v45;
      v87[1] = v46;
      v48 = [(__objc2_class *)v14[222] arrayWithObjects:v87 count:2];
      v49 = [(__objc2_class *)v47 andPredicateWithSubpredicates:v48];

      if (v41)
      {
        v50 = [v41 assetID];
        id v7 = v76;
        id v51 = +[NSPredicate predicateWithFormat:@"%K != %@", @"assetID", v50];

        v52 = v27[230];
        v86[0] = v49;
        v86[1] = v51;
        unsigned __int8 v53 = [(__objc2_class *)v14[222] arrayWithObjects:v86 count:2];
        uint64_t v54 = [(__objc2_class *)v52 andPredicateWithSubpredicates:v53];

        v49 = (void *)v54;
      }
      id v55 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
      [v55 setPredicate:v49];
      [v55 setFetchBatchSize:50];
      id v82 = 0;
      uint64_t v56 = [v7 executeFetchRequest:v55 error:&v82];
      id v57 = v82;
      id v58 = v57;
      if (v56)
      {
        id v66 = v57;
        v75 = v41;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v59 = v56;
        id v60 = [v59 countByEnumeratingWithState:&v78 objects:v85 count:16];
        if (v60)
        {
          id v61 = v60;
          uint64_t v62 = *(void *)v79;
          do
          {
            for (i = 0; i != v61; i = (char *)i + 1)
            {
              if (*(void *)v79 != v62) {
                objc_enumerationMutation(v59);
              }
              id v64 = *(void **)(*((void *)&v78 + 1) + 8 * i);
              if ([v64 seriesNextFlag])
              {
                [v64 setSeriesNextFlag:0];
                LOBYTE(v42) = 1;
              }
            }
            id v61 = [v59 countByEnumeratingWithState:&v78 objects:v85 count:16];
          }
          while (v61);
        }

        id v6 = v72;
        id v41 = v75;
        id v7 = v76;
        id v58 = v66;
      }

      id v18 = v70;
      v17 = v71;
      goto LABEL_35;
    }
    v22 = [(BKLibraryAssetIsNewManager *)self libraryManager];
    v23 = [v22 predicateForLibraryAssetsWithSeriesID:v6];
    v89[0] = v23;
    v24 = [v20 seriesSortKey];
    v25 = +[NSPredicate predicateWithFormat:@"%K > %@", @"seriesSortKey", v24];
    v89[1] = v25;
    uint64_t v26 = +[NSArray arrayWithObjects:v89 count:2];

    uint64_t v27 = off_100A3C000;
    v68 = (void *)v26;
    id v28 = +[NSCompoundPredicate andPredicateWithSubpredicates:v26];
    [v8 setPredicate:v28];

    long long v29 = +[NSSortDescriptor sortDescriptorWithKey:@"seriesSortKey" ascending:1];
    v88[0] = v29;
    id v30 = +[NSSortDescriptor sortDescriptorWithKey:@"assetID" ascending:1];
    v88[1] = v30;
    id v31 = +[NSArray arrayWithObjects:v88 count:2];
    [v8 setSortDescriptors:v31];

    uint64_t v83 = 0;
    uint64_t v32 = [v7 executeFetchRequest:v8 error:&v83];
    if ([v32 count])
    {
      v74 = [v32 firstObject];
      if (v74)
      {
        id v33 = v73;
        unsigned int v34 = [v73 isSample];
        long long v35 = [v73 bookHighWaterMarkProgress];
        id v6 = v72;
        if (v35)
        {
          long long v36 = [v73 bookHighWaterMarkProgress];
          [v36 floatValue];
          BOOL v38 = v37 > 0.8;

          id v33 = v73;
        }
        else
        {
          BOOL v38 = 0;
        }

        if ([v33 isNew])
        {
          v43 = v74;
          uint64_t v42 = 0;
          id v7 = v76;
          uint64_t v27 = off_100A3C000;
          uint64_t v14 = off_100A3C000;
          if (([v74 seriesNextFlag] & 1) == 0)
          {
            id v40 = self;
            goto LABEL_20;
          }
        }
        else
        {
          v43 = v74;
          uint64_t v42 = v38 & (([v74 isCloud] | v34) ^ 1);
          id v7 = v76;
          uint64_t v27 = off_100A3C000;
          uint64_t v14 = off_100A3C000;
          if ([v74 seriesNextFlag] == v42)
          {
            id v40 = self;
            LOBYTE(v42) = 0;
            goto LABEL_20;
          }
        }
        id v40 = self;
        [v43 setSeriesNextFlag:v42];
        LOBYTE(v42) = 1;
        goto LABEL_20;
      }
    }
    id v40 = self;
    v74 = 0;
    LOBYTE(v42) = 0;
    id v6 = v72;
    uint64_t v14 = off_100A3C000;
LABEL_20:

    id v41 = v74;
    goto LABEL_21;
  }
  BOOL v39 = 0;
LABEL_36:

  return v39;
}

- (void)_alternateProgressInfoForLocalAssetIDs:(id)a3 cloudAssetIDs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  +[BKMediaLibraryCache sharedCache];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10017B33C;
  v14[3] = &unk_100A48E00;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  objc_copyWeak(&v18, &location);
  id v13 = v10;
  id v17 = v13;
  [v11 fetchAssetsWithIDs:v8 type:0 completion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)migrateAudiobookProgressIfNeeded
{
  id v3 = [(BKLibraryAssetIsNewManager *)self coalescedMigrateAudiobookProgress];

  if (v3)
  {
    id v4 = sub_100078290();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "migrateAudiobookProgressIfNeeded signalling coalescing call block", v6, 2u);
    }

    id v5 = [(BKLibraryAssetIsNewManager *)self coalescedMigrateAudiobookProgress];
    [v5 signalWithCompletion:&stru_100A48E20];
  }
}

- (void)_migrateAudiobookProgressIfNeeded
{
  unsigned int v3 = [(BKLibraryAssetIsNewManager *)self audiobookProgressMigrationComplete];
  id v4 = sub_100078290();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "No need to migrate audiobook progress, migration is complete", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "migrateAudiobookProgressIfNeeded will check if audiobook progress can be migrated", buf, 2u);
    }

    id v5 = [(BKLibraryAssetIsNewManager *)self libraryManager];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10017BA74;
    v6[3] = &unk_100A44840;
    void v6[4] = self;
    [v5 performBlockOnWorkerQueue:v6];
  }
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ((unint64_t)(a5 - 3) <= 1)
  {
    id v8 = [v7 currentAudiobook];
    [v7 positionInCurrentAudiobook];
    id v10 = v9;
    [v8 duration];
    id v12 = v11;
    id v13 = [v8 assetID];
    uint64_t v14 = [(BKLibraryAssetIsNewManager *)self libraryManager];
    id v15 = [v14 libraryAssetOnMainQueueWithAssetID:v13];

    unsigned int v16 = [v15 isNew];
    unsigned int v17 = [v15 isFinished];
    unsigned int v18 = [v15 isAudiobookPreview];
    objc_initWeak(&location, self);
    if (v15 && !v18 && v16 | v17 ^ 1)
    {
      unsigned int v19 = +[BKAudiobookPersistenceController sharedInstance];
      unsigned int v20 = +[BKAudiobookPlayer sharedInstance];
      id v21 = [v20 currentAudiobook];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10017C5B4;
      v22[3] = &unk_100A48EE8;
      v24[1] = v10;
      v24[2] = v12;
      char v25 = v16;
      char v26 = v17;
      v22[4] = self;
      objc_copyWeak(v24, &location);
      id v23 = v13;
      [v19 bookmarkTimeForAudiobook:v21 completion:v22];

      objc_destroyWeak(v24);
    }
    objc_destroyWeak(&location);
  }
}

- (BKLibraryManager)libraryManager
{
  return self->_libraryManager;
}

- (AEAnnotationProvider)annotationProvider
{
  return self->_annotationProvider;
}

- (BKLibraryAssetIsNewManagerDelegate)delegate
{
  return self->_delegate;
}

- (NSMutableSet)markedAssets
{
  return self->_markedAssets;
}

- (void)setMarkedAssets:(id)a3
{
}

- (NSMutableSet)seriesIDsToResetNext
{
  return self->_seriesIDsToResetNext;
}

- (void)setSeriesIDsToResetNext:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (OS_dispatch_queue)markedAssetsQueue
{
  return self->_markedAssetsQueue;
}

- (void)setMarkedAssetsQueue:(id)a3
{
}

- (OS_dispatch_queue)processEPUBIDQueue
{
  return self->_processEPUBIDQueue;
}

- (void)setProcessEPUBIDQueue:(id)a3
{
}

- (OS_dispatch_queue)processSeriesBooksQueue
{
  return self->_processSeriesBooksQueue;
}

- (void)setProcessSeriesBooksQueue:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedResetNextInSeries
{
  return self->_coalescedResetNextInSeries;
}

- (void)setCoalescedResetNextInSeries:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedMigrateAudiobookProgress
{
  return self->_coalescedMigrateAudiobookProgress;
}

- (void)setCoalescedMigrateAudiobookProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedMigrateAudiobookProgress, 0);
  objc_storeStrong((id *)&self->_coalescedResetNextInSeries, 0);
  objc_storeStrong((id *)&self->_processSeriesBooksQueue, 0);
  objc_storeStrong((id *)&self->_processEPUBIDQueue, 0);
  objc_storeStrong((id *)&self->_markedAssetsQueue, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_seriesIDsToResetNext, 0);
  objc_storeStrong((id *)&self->_markedAssets, 0);
  objc_storeStrong((id *)&self->_annotationProvider, 0);

  objc_storeStrong((id *)&self->_libraryManager, 0);
}

@end