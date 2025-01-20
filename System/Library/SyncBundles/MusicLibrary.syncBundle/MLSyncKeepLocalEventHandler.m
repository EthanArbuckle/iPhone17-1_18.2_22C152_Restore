@interface MLSyncKeepLocalEventHandler
+ (id)_collectionPropertiesToFetch;
+ (id)_trackPropertiesToFetch;
+ (id)hasDownloadingStatusPredicate;
+ (id)hasPendingDownloadPredicate;
+ (id)hasTrackDataAndNotManuallyPinnedPredicate;
+ (id)hasTrackDataOrPendingDownloadPredicate;
+ (id)hasTrackDataPredicate;
+ (id)isDownloadablePredicate;
+ (id)keepLocalAndDownloadingButNotDownloadablePredicate;
+ (id)keepLocalAndMissingTrackDataPredicate;
+ (id)keepLocalCancelledOrDisabledAndIsDownloadingOrPausedPredicate;
+ (id)keepLocalCancelledPredicate;
+ (id)keepLocalDisabledAndHasTrackDataOrDownloadAndIsRedownloadablePredicate;
+ (id)keepLocalDisabledPredicate;
+ (id)keepLocalEnabledPredicate;
+ (id)keepLocalNotDisabledPredicate;
+ (id)keepLocalOffPredicate;
+ (id)keepLocalWithMissingTrackDataAndIsDownloadablePredicateForIdentifier:(int64_t)a3;
+ (id)missingTrackDataPredicate;
+ (id)trackMatchingItemIdentifierPredicate:(int64_t)a3;
- (BOOL)_canDownloadTrackWithPersistentID:(int64_t)a3 andProperties:(id)a4;
- (BOOL)_canRunKeepLocalEvaluationByEnqueuingAssets:(BOOL)a3;
- (BOOL)_containerIsSmartLimited:(id)a3;
- (BOOL)_isSupportedMediaTypeFromTrackProperties:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MLSyncKeepLocalEventHandler)initWithQueue:(id)a3 library:(id)a4;
- (OS_dispatch_queue)queue;
- (id)_allTracksDisabledForCollection:(id)a3;
- (id)_anyTracksQueryForCollection:(id)a3;
- (id)_assetsFromTrackPersistentIds:(id)a3 andProperties:(id)a4 isManualDownload:(BOOL)a5 inForeground:(BOOL)a6;
- (id)_inMyLibraryPredicate;
- (id)_runKeepLocalEvaluationForAlbumWithPersistentId:(int64_t)a3 musicLibrary:(id)a4;
- (id)_runKeepLocalEvaluationForContainerWithPersistentId:(int64_t)a3 musicLibrary:(id)a4;
- (id)_runKeepLocalEvaluationForTrackWithPersistentId:(int64_t)a3 musicLibrary:(id)a4;
- (id)_searchableKeepLocalCollectionClasses;
- (id)_trackQueryForEntityCollection:(id)a3 predicate:(id)a4;
- (id)runDefaultKeepLocalEvaluationWithMusicLibrary:(id)a3;
- (id)runKeepLocalEvaluationForItem:(int64_t)a3 entityType:(int64_t)a4 newKeepLocalStatus:(int)a5 musicLibrary:(id)a6;
- (id)setKeepLocalForAllMusicItemsWithLibrary:(id)a3;
- (int64_t)sizeOfMediaItemsDownloadedForAutomaticallyPinnedCollectionsWithMusicLibrary:(id)a3;
- (unint64_t)_keepLocalStatusReasonForATAssetDownloadPauseReason:(unint64_t)a3;
- (void)_addTrackWithPersistentId:(int64_t)a3 andProperties:(id)a4 withKeepLocalValue:(int)a5 toResult:(id)a6;
- (void)_cancelDownloadsForTracksWithPersistentIDs:(id)a3 withError:(id)a4;
- (void)_handleAccountsChangedNotification:(id)a3;
- (void)_handleImportFinishedNotification:(id)a3;
- (void)_handleInitiateDownloadsNotification:(id)a3;
- (void)_handleKeepLocalEvaluationOperationCompletedWithResult:(id)a3 inBackground:(BOOL)a4 andGetEnqueuedDownloads:(id *)a5 cancelledDownloads:(id *)a6;
- (void)_handleKeepLocalSessionEvent:(id)a3;
- (void)_handleKeepLocalSessionPeriodicEvent:(id)a3;
- (void)_notifyObserversWithDownloadsToEnqueue:(id)a3 downloadsPending:(id)a4 downloadsToCancel:(id)a5 trackProperties:(id)a6;
- (void)_performKeepLocalEvaluationOnCollection:(id)a3 withProperties:(id)a4 fromLibrary:(id)a5 toResult:(id)a6;
- (void)_pruneActiveDownloads;
- (void)cancelDownloads;
- (void)cancelDownloadsForMediaTypes:(id)a3;
- (void)downloadLibraryWithCompletionBlock:(id)a3;
- (void)enqueueAssetForDownload:(int64_t)a3 withCompletionBlock:(id)a4;
- (void)handleKeepLocalStatusChanged:(int)a3 forLibraryIdentifier:(int64_t)a4 entityType:(int)a5 withCompletionBlock:(id)a6;
- (void)start;
- (void)startKeepLocalSessionInBackground:(BOOL)a3;
- (void)startKeepLocalSessionInBackground:(BOOL)a3 enqueueAssets:(BOOL)a4 forceNoDelay:(BOOL)a5 withCompletion:(id)a6;
- (void)startKeepLocalSessionInBackground:(BOOL)a3 enqueueAssets:(BOOL)a4 withCompletion:(id)a5;
- (void)startKeepLocalSessionInBackground:(BOOL)a3 forLibraryIdentifier:(int64_t)a4 entityType:(int64_t)a5 newKeepLocalStatus:(int)a6;
- (void)startKeepLocalSessionToDownloadLibraryWithCompletion:(id)a3;
- (void)stop;
@end

@implementation MLSyncKeepLocalEventHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nanoSyncSettings, 0);
  objc_storeStrong((id *)&self->_keepLocalObservers, 0);
  objc_storeStrong((id *)&self->_keepLocalTaskConnection, 0);
  objc_storeStrong((id *)&self->_environmentMonitor, 0);
  objc_storeStrong((id *)&self->_eventScheduler, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v7 processIdentifier];
  v9 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    __int16 v24 = 1024;
    unsigned int v25 = v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ got connection from pid %i", buf, 0x12u);
  }

  v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MLSyncKeepLocalRequestListener];
  [v7 setExportedInterface:v10];

  [v7 setExportedObject:self];
  v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MLSyncKeepLocalObserver];
  [v7 setRemoteObjectInterface:v11];
  callbackQueue = self->_callbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5F970;
  block[3] = &unk_9A930;
  block[4] = self;
  id v13 = v7;
  id v21 = v13;
  dispatch_barrier_async(callbackQueue, block);
  objc_initWeak((id *)buf, v13);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_5F97C;
  v17[3] = &unk_9AB08;
  v17[4] = self;
  unsigned int v19 = v8;
  objc_copyWeak(&v18, (id *)buf);
  [v13 setInterruptionHandler:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_5FAB4;
  v15[3] = &unk_9AB30;
  v15[4] = self;
  unsigned int v16 = v8;
  [v13 setInvalidationHandler:v15];
  [v13 resume];
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)downloadLibraryWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = +[MLSyncClientKeepLocalEventHandlerWrapper sharedInstance];
  id v6 = [v5 keepLocalEventHandler];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_5FC40;
  v8[3] = &unk_9AAE0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 startKeepLocalSessionToDownloadLibraryWithCompletion:v8];
}

- (void)enqueueAssetForDownload:(int64_t)a3 withCompletionBlock:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ got request to enqueue %lld for immediate download with ATC", buf, 0x16u);
  }

  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v15 = sub_5FEE4;
  unsigned int v16 = sub_5FEF4;
  id v17 = 0;
  id v9 = +[ATAssetLinkController sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_5FEFC;
  v11[3] = &unk_9AAB8;
  id v13 = buf;
  v10 = v8;
  v12 = v10;
  [v9 enqueueAssetForStoreDownload:a3 withCompletion:v11];

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (v6) {
    v6[2](v6, *(void *)(*(void *)&buf[8] + 40));
  }

  _Block_object_dispose(buf, 8);
}

- (void)cancelDownloadsForMediaTypes:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableSet set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = sub_6B9B8((__int16)[*(id *)(*((void *)&v16 + 1) + 8 * (void)v10) longLongValue]);
        [v5 addObject:v11];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v8);
  }

  v12 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 2114;
    v23 = v5;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling all downloads with assetType=%{public}@", buf, 0x16u);
  }

  id v13 = +[NSPredicate predicateWithFormat:@"assetType IN %@", v5];
  v14 = +[NSError errorWithDomain:@"ATError" code:2 userInfo:0];
  v15 = +[ATAssetLinkController sharedInstance];
  [v15 cancelAllAssetsMatchingPredicate:v13 excludeActiveDownloads:0 withError:v14 completion:0];
}

- (void)cancelDownloads
{
  +[NSPredicate predicateWithFormat:@"enqueueSource=%d", 2];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[NSError errorWithDomain:@"ATError" code:31 userInfo:0];
  v3 = +[ATAssetLinkController sharedInstance];
  [v3 cancelAllAssetsMatchingPredicate:v4 excludeActiveDownloads:0 withError:v2 completion:0];
}

- (void)handleKeepLocalStatusChanged:(int)a3 forLibraryIdentifier:(int64_t)a4 entityType:(int)a5 withCompletionBlock:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  if (a4 && a5 <= 4 && ((1 << a5) & 0x13) != 0 && (v8 + 2) <= 3)
  {
    uint64_t v11 = a5;
    v12 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v20 = self;
      __int16 v21 = 2048;
      int64_t v22 = a4;
      __int16 v23 = 1024;
      int v24 = a5;
      __int16 v25 = 1024;
      int v26 = v8;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling keep local operation for item identifier:%lld, entity type:%d, new keep local status:%d", buf, 0x22u);
    }

    id v13 = +[MLSyncClientKeepLocalEventHandlerWrapper sharedInstance];
    v14 = [v13 keepLocalEventHandler];
    [v14 startKeepLocalSessionInBackground:0 forLibraryIdentifier:a4 entityType:v11 newKeepLocalStatus:v8];
  }
  else
  {
    v15 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v20 = self;
      __int16 v21 = 2048;
      int64_t v22 = a4;
      __int16 v23 = 1024;
      int v24 = a5;
      __int16 v25 = 1024;
      int v26 = v8;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "%{public}@ not scheduling keep local operation for item identifier:%lld, entity type:%d, keep local status:%d", buf, 0x22u);
    }

    id v13 = +[NSError errorWithDomain:@"ATError" code:23 userInfo:0];
  }

  if (v10)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_60474;
    block[3] = &unk_9A850;
    id v18 = v10;
    dispatch_async(callbackQueue, block);
  }
}

- (id)_assetsFromTrackPersistentIds:(id)a3 andProperties:(id)a4 isManualDownload:(BOOL)a5 inForeground:(BOOL)a6
{
  BOOL v52 = a5;
  BOOL v53 = a6;
  id v8 = a3;
  id v50 = a4;
  BOOL v42 = sub_6EDBC(8);
  BOOL v38 = sub_6EDBC(4);
  BOOL v36 = sub_6EDBC(2);
  uint64_t v9 = +[ICDeviceInfo currentDeviceInfo];
  unsigned int v10 = [v9 isWatch];

  if (v10)
  {
    int v48 = _os_feature_enabled_impl() ^ 1;
    int v49 = _os_feature_enabled_impl();
  }
  else
  {
    int v48 = 0;
    int v49 = 1;
  }
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v8;
  id v51 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v51)
  {
    uint64_t v47 = *(void *)v56;
    uint64_t v46 = ML3EntityPropertyKeepLocalStatus;
    uint64_t v45 = ML3EntityPropertyKeepLocalConstraints;
    uint64_t v37 = ML3EntityPropertyKeepLocal;
    uint64_t v44 = ML3TrackPropertyMediaType;
    uint64_t v43 = ML3TrackPropertyIsStoreRedownloadable;
    unsigned int v40 = v10 & v52;
    *(void *)&long long v11 = 138543618;
    long long v35 = v11;
    do
    {
      for (i = 0; i != v51; i = (char *)i + 1)
      {
        if (*(void *)v56 != v47) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        v14 = objc_msgSend(v50, "objectForKey:", v13, v35);
        v15 = [v14 objectForKey:v46];
        unsigned int v16 = [v15 integerValue];

        long long v17 = [v14 objectForKey:v45];
        unint64_t v18 = (unint64_t)[v17 integerValue];

        uint64_t v19 = v48 | (v18 >> 2) & 1;
        if (!(v48 & 1 | (v18 >> 2) & 1) && !v53)
        {
          if (v16 == 4) {
            uint64_t v19 = v19;
          }
          else {
            uint64_t v19 = (v18 >> 4) & 1;
          }
        }
        BOOL v20 = v52;
        if (!v53)
        {
          __int16 v21 = [v14 objectForKey:v37];
          unsigned int v22 = [v21 integerValue];

          BOOL v20 = v52;
          if (v22 != 1)
          {
            __int16 v23 = _ATLogCategorySyncBundle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v35;
              v60 = self;
              __int16 v61 = 2112;
              v62 = v13;
              _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ setting allowDownloadOnConstrainedNetwork=NO for background container item download with id=%@", buf, 0x16u);
            }

            BOOL v20 = 0;
          }
        }
        int v24 = self;
        __int16 v25 = [v14 objectForKey:v44];
        unsigned int v26 = [v25 integerValue];

        if (!v49)
        {
          uint64_t v27 = 0;
          goto LABEL_31;
        }
        if (v38 & (v26 >> 2) & 1) != 0 || (v36 & (v26 >> 1))
        {
          uint64_t v27 = (v18 & 2) == 0;
          if ((v18 & 2) != 0) {
            goto LABEL_31;
          }
LABEL_28:
          if (!v53 && v16 == 5) {
            uint64_t v27 = (v18 & 8) == 0;
          }
          goto LABEL_31;
        }
        int v28 = !v42;
        if ((v26 & 8) == 0) {
          int v28 = 1;
        }
        int v29 = v28 | (v18 >> 1) & 1;
        uint64_t v27 = v29 ^ 1u;
        if ((v29 & 1) == 0) {
          goto LABEL_28;
        }
LABEL_31:
        v30 = [v14 objectForKey:v43];
        unsigned int v31 = [v30 BOOLValue];

        self = v24;
        v32 = sub_6BA60(v14, (uint64_t)[v13 longLongValue], v24->_library);
        v33 = v32;
        if (v32)
        {
          [v32 setIsForeground:v53];
          [v33 setIsPrioritized:v40];
          [v33 setEnqueueSource:2];
          [v33 setAllowDownloadOnConstrainedNetwork:v20];
          [v33 setPowerRequired:v19];
          [v33 setCanUseCellularData:v27];
          [v33 setCanProxyUseCellularData:v42];
          self = v24;
          [v33 setIsRetry:v16 == 5];
          [v33 setBypassStore:v31 ^ 1];
          [v41 addObject:v33];
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_609B8;
          v54[3] = &unk_9AA90;
          v54[4] = v24;
          [v33 setCompletionBlock:v54];
        }
      }
      id v51 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v51);
  }

  return v41;
}

- (unint64_t)_keepLocalStatusReasonForATAssetDownloadPauseReason:(unint64_t)a3
{
  return a3 & 0xC | (16 * ((a3 >> 1) & 1)) & 0xFFFFFFFFFFFFFF9ELL | ((a3 & 1) << 6) | (32 * ((a3 >> 4) & 1)) | (a3 >> 5) & 1;
}

- (void)_notifyObserversWithDownloadsToEnqueue:(id)a3 downloadsPending:(id)a4 downloadsToCancel:(id)a5 trackProperties:(id)a6
{
  id v9 = a3;
  id v36 = a4;
  id v39 = a5;
  id v38 = a6;
  unsigned int v10 = +[NSMutableArray array];
  long long v11 = +[NSMutableArray array];
  v12 = +[NSMutableArray array];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v13 = v9;
  id v14 = [v13 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v61;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v61 != v16) {
          objc_enumerationMutation(v13);
        }
        unint64_t v18 = objc_msgSend(*(id *)(*((void *)&v60 + 1) + 8 * i), "identifier", v36);
        uint64_t v19 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v18 longLongValue]);
        [v10 addObject:v19];
      }
      id v15 = [v13 countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v15);
  }
  id v41 = v13;

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v20 = v39;
  id v21 = [v20 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v57;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v57 != v23) {
          objc_enumerationMutation(v20);
        }
        __int16 v25 = objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * (void)j), "identifier", v36);
        unsigned int v26 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v25 longLongValue]);
        [v11 addObject:v26];
      }
      id v22 = [v20 countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v22);
  }
  unsigned int v40 = v20;

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v27 = v36;
  id v28 = [v27 countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v53;
    do
    {
      for (k = 0; k != v29; k = (char *)k + 1)
      {
        if (*(void *)v53 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * (void)k), "identifier", v36);
        v33 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v32 longLongValue]);
        [v12 addObject:v33];
      }
      id v29 = [v27 countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v29);
  }

  if ([v41 count] || objc_msgSend(v40, "count"))
  {
    callbackQueue = self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_61018;
    block[3] = &unk_9AA18;
    void block[4] = self;
    id v50 = v10;
    id v51 = v11;
    dispatch_async(callbackQueue, block);
  }
  if (objc_msgSend(v11, "count", v36) || objc_msgSend(v41, "count") || objc_msgSend(v27, "count"))
  {
    library = self->_library;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_61134;
    v42[3] = &unk_9AA68;
    id v43 = v11;
    uint64_t v44 = self;
    id v45 = v41;
    id v46 = v10;
    id v47 = v27;
    id v48 = v38;
    [(ML3MusicLibrary *)library performDatabaseTransactionWithBlock:v42];
  }
}

- (void)_handleKeepLocalEvaluationOperationCompletedWithResult:(id)a3 inBackground:(BOOL)a4 andGetEnqueuedDownloads:(id *)a5 cancelledDownloads:(id *)a6
{
  BOOL v83 = a4;
  id v6 = a3;
  v85 = +[ICEnvironmentMonitor sharedMonitor];
  id v7 = (char *)[v85 networkType];
  unsigned int v80 = [v85 isCharging];
  unsigned int v79 = [v85 isNetworkConstrained];
  char IsCellular = ICEnvironmentNetworkTypeIsCellular();
  id v8 = +[ICDeviceInfo currentDeviceInfo];
  unsigned int v9 = [v8 isWatch];

  if (v9)
  {
    unsigned int v10 = +[ATUserDefaults sharedInstance];
    long long v11 = [v10 minimumNetworkLinkQualityForDownloads];

    uint64_t v78 = [v11 unsignedIntValue];
  }
  else
  {
    uint64_t v78 = 0;
  }
  v12 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v6 manualDownloads];
    id v14 = [v13 count];
    id v15 = [v6 automaticDownloads];
    id v16 = [v15 count];
    CFStringRef v17 = @"Unknown";
    if ((uint64_t)v7 > 99)
    {
      if ((uint64_t)v7 > 1000)
      {
        if (v7 == &stru_3D8.segname[1])
        {
          CFStringRef v17 = @"Bridged WiFi";
        }
        else if (v7 == (char *)&stru_790.flags)
        {
          CFStringRef v17 = @"Wired Ethernet";
        }
        else if (v7 == (char *)&stru_B98.addr)
        {
          CFStringRef v17 = @"Other";
        }
        goto LABEL_8;
      }
      if (v7 != (char *)&stru_20.flags)
      {
        if (v7 == (char *)&stru_1A8.reserved3)
        {
          CFStringRef v17 = @"Bluetooth";
        }
        else if (v7 == stru_3D8.segname)
        {
          CFStringRef v17 = @"WiFi";
        }
        goto LABEL_8;
      }
    }
    else if ((unint64_t)(v7 - 1) >= 8)
    {
LABEL_8:
      id v18 = [v85 currentNetworkLinkQuality];
      [v85 currentNetworkLinkQuality];
      uint64_t v19 = ICEnvironmentNetworkLinkQualityDescription();
      *(_DWORD *)buf = 138545410;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&unsigned char buf[24] = v16;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v80;
      __int16 v129 = 2114;
      CFStringRef v130 = v17;
      __int16 v131 = 1024;
      unsigned int v132 = v79;
      __int16 v133 = 2048;
      id v134 = v18;
      __int16 v135 = 2114;
      v136 = v19;
      __int16 v137 = 2048;
      uint64_t v138 = v78;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing %lu manual and %lu automatic keep-local results. isCharging = %{BOOL}u, networkType = %{public}@, isConstrained = %{BOOL}u, networkLinkQuality = %lu (%{public}@), minimumNetworkLinkQuality = %lu", buf, 0x54u);

      goto LABEL_9;
    }
    CFStringRef v17 = @"Cellular";
    goto LABEL_8;
  }
LABEL_9:

  id v20 = [v6 manualDownloads];
  id v21 = [v20 count];
  id v22 = [v6 automaticDownloads];
  BOOL v23 = (char *)[v22 count] + (void)v21 == 0;

  if (v23)
  {
    int v24 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ Found no new assets to download", buf, 0xCu);
    }
  }
  else
  {
    v82 = [v6 trackProperties];
    __int16 v25 = [v6 manualDownloads];
    v76 = [(MLSyncKeepLocalEventHandler *)self _assetsFromTrackPersistentIds:v25 andProperties:v82 isManualDownload:1 inForeground:!v83];

    unsigned int v26 = [v6 automaticDownloads];
    v75 = [(MLSyncKeepLocalEventHandler *)self _assetsFromTrackPersistentIds:v26 andProperties:v82 isManualDownload:0 inForeground:0];

    id v27 = +[ATAssetLinkController sharedInstance];
    v84 = [v27 filteredAssetsToDownloadForAssets:v76];

    id v28 = +[ATAssetLinkController sharedInstance];
    id v29 = [v28 filteredAssetsToDownloadForAssets:v75];

    uint64_t v30 = _ATLogCategorySyncBundle_Oversize();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = [v84 count];
      id v32 = [v29 count];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v31;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&unsigned char buf[24] = v32;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Keep Local evaluation produced %lu manual and %lu automatic downloads after filtering", buf, 0x20u);
    }

    if ([v84 count] || objc_msgSend(v29, "count"))
    {
      v33 = +[NSMutableDictionary dictionary];
      uint64_t v114 = 0;
      v115 = &v114;
      uint64_t v116 = 0x2020000000;
      id v117 = 0;
      v34 = +[ICStorageManager sharedManager];
      id v35 = [v34 storageSpaceAvailable];

      id v117 = v35;
      int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"OptimizeStorage", @"com.apple.Music", 0);
      if (AppBooleanValue)
      {
        uint64_t v37 = (char *)[v6 totalSizeOfManualDownloads];
        id v38 = &v37[(void)[v6 totalSizeOfAutomaticDownloads]];
      }
      else
      {
        id v38 = (char *)[v6 totalSizeOfManualDownloads];
      }
      id v39 = _ATLogCategorySyncBundle();
      v77 = v29;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = [v6 totalSizeOfManualDownloads];
        id v41 = [v6 totalSizeOfAutomaticDownloads];
        CFStringRef v42 = (const __CFString *)v115[3];
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = AppBooleanValue != 0;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = v40;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = v41;
        __int16 v129 = 2048;
        CFStringRef v130 = v42;
        _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ checking storage limits for downloads. optimizeStorageEnabled=%d, totalSizeOfManualDownloads=%lld, totalSizeOfAutomaticDownloads=%lld, available=%lld", buf, 0x30u);
      }

      if ((unint64_t)v38 > v115[3])
      {
        id v43 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = self;
          _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ not enough free space for  downloads - clearing purgeable space from media library", buf, 0xCu);
        }

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        *(void *)&unsigned char buf[24] = 0;
        *(void *)&unsigned char buf[24] = [(ML3MusicLibrary *)self->_library clearPurgeableStorageAmount:&v38[-v115[3]] withUrgency:AppBooleanValue != 0];
        unint64_t v44 = v115[3] + *(void *)(*(void *)&buf[8] + 24);
        v115[3] = v44;
        if ((unint64_t)v38 > v44)
        {
          id v45 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v120 = 138543362;
            v121 = self;
            _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ still not enough free space for  downloads - asking CacheDelete to help us out", v120, 0xCu);
          }

          dispatch_semaphore_t v46 = dispatch_semaphore_create(0);
          v127[0] = @"/private/var";
          v126[0] = @"CACHE_DELETE_VOLUME";
          v126[1] = @"CACHE_DELETE_AMOUNT";
          id v47 = +[NSNumber numberWithUnsignedLongLong:&v38[-v115[3]]];
          v126[2] = @"CACHE_DELETE_PURGE_TIMEOUT";
          v127[1] = v47;
          v127[2] = &off_9CB40;
          id v48 = +[NSDictionary dictionaryWithObjects:v127 forKeys:v126 count:3];

          v107 = _NSConcreteStackBlock;
          uint64_t v108 = 3221225472;
          v109 = sub_62864;
          v110 = &unk_9A9A8;
          v112 = buf;
          v113 = &v114;
          int v49 = v46;
          v111 = v49;
          CacheDeletePurgeSpaceWithInfo();
          dispatch_semaphore_wait(v49, 0xFFFFFFFFFFFFFFFFLL);
          id v50 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v51 = *(void *)(*(void *)&buf[8] + 24);
            uint64_t v52 = v115[3];
            *(_DWORD *)v120 = 138543874;
            v121 = self;
            __int16 v122 = 2048;
            uint64_t v123 = v51;
            __int16 v124 = 2048;
            uint64_t v125 = v52;
            _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ CacheDelete freed %lld bytes, available storage = %lld", v120, 0x20u);
          }
        }
        _Block_object_dispose(buf, 8);
      }
      long long v53 = (char *)[v6 totalSizeOfAutomaticDownloads];
      long long v54 = &v53[(void)[v6 totalSizeOfManualDownloads]];
      if ((unint64_t)v54 > v115[3])
      {
        long long v55 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          long long v56 = (char *)[v6 totalSizeOfAutomaticDownloads];
          id v57 = [v6 totalSizeOfManualDownloads];
          uint64_t v58 = v115[3];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = &v56[(void)v57];
          *(_WORD *)&buf[22] = 2048;
          *(void *)&unsigned char buf[24] = v58;
          _os_log_impl(&dword_0, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ not enough free space for all downloads. needed=%lld, available=%lld", buf, 0x20u);
        }
      }
      long long v59 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v84 count] + (void)objc_msgSend(v29, "count"));
      long long v60 = +[NSMutableArray array];
      v73 = +[NSMutableArray array];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      *(void *)&unsigned char buf[24] = 0;
      v95[0] = _NSConcreteStackBlock;
      v95[1] = 3221225472;
      v95[2] = sub_628F0;
      v95[3] = &unk_9A9D0;
      v101 = buf;
      v102 = &v114;
      v95[4] = self;
      char v104 = v80;
      char v105 = v79;
      char v106 = IsCellular;
      id v96 = v85;
      uint64_t v103 = v78;
      id v61 = v60;
      id v97 = v61;
      id v81 = v33;
      id v98 = v81;
      id v62 = v59;
      id v99 = v62;
      long long v63 = v82;
      v100 = v63;
      v64 = objc_retainBlock(v95);
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v65 = v84;
      id v66 = [v65 countByEnumeratingWithState:&v91 objects:v119 count:16];
      if (v66)
      {
        uint64_t v67 = *(void *)v92;
        do
        {
          for (i = 0; i != v66; i = (char *)i + 1)
          {
            if (*(void *)v92 != v67) {
              objc_enumerationMutation(v65);
            }
            ((void (*)(void *, void))v64[2])(v64, *(void *)(*((void *)&v91 + 1) + 8 * i));
          }
          id v66 = [v65 countByEnumeratingWithState:&v91 objects:v119 count:16];
        }
        while (v66);
      }

      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v69 = v77;
      id v70 = [v69 countByEnumeratingWithState:&v87 objects:v118 count:16];
      if (v70)
      {
        uint64_t v71 = *(void *)v88;
        do
        {
          for (j = 0; j != v70; j = (char *)j + 1)
          {
            if (*(void *)v88 != v71) {
              objc_enumerationMutation(v69);
            }
            ((void (*)(void *, void))v64[2])(v64, *(void *)(*((void *)&v87 + 1) + 8 * (void)j));
          }
          id v70 = [v69 countByEnumeratingWithState:&v87 objects:v118 count:16];
        }
        while (v70);
      }

      id v29 = v77;
      [(MLSyncKeepLocalEventHandler *)self _notifyObserversWithDownloadsToEnqueue:v62 downloadsPending:v61 downloadsToCancel:v73 trackProperties:v63];

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v114, 8);
    }
    int v24 = v82;
  }
}

- (void)_pruneActiveDownloads
{
  v3 = +[NSMutableSet set];
  v33 = +[MLSyncKeepLocalEventHandler keepLocalCancelledOrDisabledAndIsDownloadingOrPausedPredicate];
  id v4 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:](ML3Track, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", self->_library);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_633F0;
  v45[3] = &unk_9ABC0;
  id v5 = v3;
  id v46 = v5;
  id v32 = v4;
  [v4 enumeratePersistentIDsUsingBlock:v45];
  if ([v5 count])
  {
    id v6 = _ATLogCategorySyncBundle_Oversize();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [v5 count];
      *(_DWORD *)buf = 138543874;
      uint64_t v51 = self;
      __int16 v52 = 1024;
      unsigned int v53 = v7;
      __int16 v54 = 2114;
      id v55 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling downloads for %d tracks because they are marked ML3EntityKeepLocalCancelled: %{public}@", buf, 0x1Cu);
    }

    id v8 = [v5 allObjects];
    unsigned int v9 = +[NSError errorWithDomain:@"ATError" code:2 userInfo:0];
    [(MLSyncKeepLocalEventHandler *)self _cancelDownloadsForTracksWithPersistentIDs:v8 withError:v9];
  }
  unsigned int v10 = +[NSMutableArray array];
  id v31 = +[MLSyncKeepLocalEventHandler keepLocalDisabledAndHasTrackDataOrDownloadAndIsRedownloadablePredicate];
  long long v11 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:](ML3Track, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", self->_library);
  uint64_t v12 = ML3EntityPropertyKeepLocalStatus;
  uint64_t v49 = ML3EntityPropertyKeepLocalStatus;
  id v13 = +[NSArray arrayWithObjects:&v49 count:1];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_63450;
  v42[3] = &unk_9A958;
  id v29 = v5;
  id v43 = v29;
  id v14 = v10;
  id v44 = v14;
  uint64_t v30 = v11;
  [v11 enumeratePersistentIDsAndProperties:v13 usingBlock:v42];

  if ([v14 count])
  {
    id v15 = _ATLogCategorySyncBundle_Oversize();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = [v14 count];
      *(_DWORD *)buf = 138543874;
      uint64_t v51 = self;
      __int16 v52 = 1024;
      unsigned int v53 = v16;
      __int16 v54 = 2114;
      id v55 = v14;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing assets for %d tracks because they are marked ML3EntityKeepLocalDisabled: %{public}@", buf, 0x1Cu);
    }

    +[ML3Track unlinkRedownloadableAssetsFromLibrary:self->_library persistentIDs:v14];
    library = self->_library;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_634D4;
    v39[3] = &unk_9ABE8;
    id v40 = v14;
    id v41 = self;
    [(ML3MusicLibrary *)library performDatabaseTransactionWithBlock:v39];
  }
  id v18 = +[NSMutableArray array];
  uint64_t v19 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyHasNonPurgeableAsset value:&off_9CB10 comparison:1];
  id v20 = +[ML3ComparisonPredicate predicateWithProperty:ML3EntityPropertyKeepLocal value:&off_9CB28 comparison:1];
  v48[0] = v19;
  v48[1] = v20;
  id v21 = +[NSArray arrayWithObjects:v48 count:2];
  id v22 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v21];

  BOOL v23 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:self->_library predicate:v22 orderingTerms:0];
  uint64_t v47 = v12;
  int v24 = +[NSArray arrayWithObjects:&v47 count:1];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_63950;
  v37[3] = &unk_9A980;
  id v25 = v18;
  id v38 = v25;
  [v23 enumeratePersistentIDsAndProperties:v24 usingBlock:v37];

  if ([v25 count])
  {
    unsigned int v26 = _ATLogCategorySyncBundle_Oversize();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v27 = [v25 count];
      *(_DWORD *)buf = 138543874;
      uint64_t v51 = self;
      __int16 v52 = 1024;
      unsigned int v53 = v27;
      __int16 v54 = 2114;
      id v55 = v25;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Clearing keep-local for %d tracks because they are marked ML3EntityKeepLocalCancelled but have downloaded assets: %{public}@", buf, 0x1Cu);
    }

    id v28 = self->_library;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_639B0;
    v34[3] = &unk_9ABE8;
    id v35 = v25;
    id v36 = self;
    [(ML3MusicLibrary *)v28 performDatabaseTransactionWithBlock:v34];
  }
}

- (void)_handleAccountsChangedNotification:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_63BD0;
  block[3] = &unk_9AF48;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_canRunKeepLocalEvaluationByEnqueuingAssets:(BOOL)a3
{
  if (self->_startupCompleted)
  {
    if (self->_stop)
    {
      id v4 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        long long v11 = self;
        id v5 = "%{public}@ keep-local evaluations are stopped";
LABEL_10:
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      BOOL v6 = a3;
      if (CFPreferencesGetAppBooleanValue(@"PinningDisabled", @"com.apple.mobileipod", 0))
      {
        id v4 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 138543362;
          long long v11 = self;
          id v5 = "%{public}@ not starting a keep-local evaluation because pinning is disabled";
          goto LABEL_10;
        }
      }
      else
      {
        if (v6)
        {
          id v8 = +[ICDeviceSetupStatusMonitor sharedMonitor];
          unsigned __int8 v9 = [v8 isDeviceSetupComplete];

          if ((v9 & 1) == 0)
          {
            id v4 = _ATLogCategorySyncBundle();
            if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_11;
            }
            int v10 = 138543362;
            long long v11 = self;
            id v5 = "%{public}@ not starting a keep-local evaluation because device has not finished buddy";
            goto LABEL_10;
          }
        }
        if ((ICSystemApplicationIsInstalled() & 1) != 0
          || (ICSystemApplicationIsInstalled() & 1) != 0
          || (ICSystemApplicationIsInstalled() & 1) != 0)
        {
          return 1;
        }
        id v4 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 138543362;
          long long v11 = self;
          id v5 = "%{public}@ not starting a keep-local evaluation because there are no supported media apps installed";
          goto LABEL_10;
        }
      }
    }
  }
  else
  {
    id v4 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      long long v11 = self;
      id v5 = "%{public}@ not starting a keep-local evaluation because atc hasn't finished starting up";
      goto LABEL_10;
    }
  }
LABEL_11:

  return 0;
}

- (void)_handleImportFinishedNotification:(id)a3
{
}

- (void)_handleKeepLocalSessionPeriodicEvent:(id)a3
{
}

- (void)_handleKeepLocalSessionEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  BOOL v6 = [v5 objectForKey:@"isBackground"];
  id v7 = [v6 BOOLValue];

  id v8 = [v4 userInfo];

  unsigned __int8 v9 = [v8 objectForKey:@"enqueueAssets"];
  id v10 = [v9 BOOLValue];

  [(MLSyncKeepLocalEventHandler *)self startKeepLocalSessionInBackground:v7 enqueueAssets:v10 withCompletion:0];
}

- (void)_handleInitiateDownloadsNotification:(id)a3
{
}

- (void)_cancelDownloadsForTracksWithPersistentIDs:(id)a3 withError:(id)a4
{
  id v6 = a3;
  callbackQueue = self->_callbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_64220;
  block[3] = &unk_9A930;
  void block[4] = self;
  id v8 = v6;
  id v19 = v8;
  id v9 = a4;
  dispatch_sync(callbackQueue, block);
  id v10 = [v8 valueForKey:@"stringValue"];
  long long v11 = +[NSPredicate predicateWithFormat:@"enqueueSource=%d and identifier IN %@", 2, v10];

  uint64_t v12 = +[ATAssetLinkController sharedInstance];
  [v12 cancelAllAssetsMatchingPredicate:v11 excludeActiveDownloads:0 withError:v9 completion:0];

  library = self->_library;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_64350;
  v15[3] = &unk_9ABE8;
  id v16 = v8;
  CFStringRef v17 = self;
  id v14 = v8;
  [(ML3MusicLibrary *)library performDatabaseTransactionWithBlock:v15];
}

- (void)startKeepLocalSessionInBackground:(BOOL)a3 forLibraryIdentifier:(int64_t)a4 entityType:(int64_t)a5 newKeepLocalStatus:(int)a6
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_644AC;
  v7[3] = &unk_9A8C8;
  int v8 = a6;
  BOOL v9 = a3;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a5;
  dispatch_async(queue, v7);
}

- (void)startKeepLocalSessionToDownloadLibraryWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_64848;
  v7[3] = &unk_9AAE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startKeepLocalSessionInBackground:(BOOL)a3 enqueueAssets:(BOOL)a4 forceNoDelay:(BOOL)a5 withCompletion:(id)a6
{
  id v10 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_64B00;
  block[3] = &unk_9A878;
  BOOL v15 = a4;
  BOOL v16 = a3;
  BOOL v17 = a5;
  void block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(queue, block);
}

- (void)startKeepLocalSessionInBackground:(BOOL)a3 enqueueAssets:(BOOL)a4 withCompletion:(id)a5
{
}

- (void)startKeepLocalSessionInBackground:(BOOL)a3
{
}

- (void)stop
{
  v3 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping keep local event handler", (uint8_t *)&v6, 0xCu);
  }

  self->_stop = 1;
  [(NSXPCListener *)self->_keepLocalTaskConnection invalidate];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobileipod.keeplocalstatechanged", 0);
}

- (void)start
{
  v3 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    BOOL v16 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ AirTraffic startup complete - register for keep-local notifications", buf, 0xCu);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_handleImportFinishedNotification:" name:ML3MusicLibraryEntitiesAddedOrRemovedNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_handleInitiateDownloadsNotification:" name:ATInitiateDownloadSessionsNotification object:0];

  int v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_handleKeepLocalSessionEvent:" name:@"MLKeepLocalSessionEvent" object:0];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_handleKeepLocalSessionPeriodicEvent:" name:@"MLKeepLocalSessionPeriodicEvent" object:0];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_handleAccountsChangedNotification:" name:ICUserIdentityStoreDidChangeNotification object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_6527C, @"com.apple.mobileipod.keeplocalstatechanged", 0, CFNotificationSuspensionBehaviorDrop);
  if (([(ATEventScheduler *)self->_eventScheduler hasScheduledEvent:@"MLKeepLocalSessionPeriodicEvent"] & 1) == 0)[(ATEventScheduler *)self->_eventScheduler scheduleRecurringEvent:@"MLKeepLocalSessionPeriodicEvent" withInterval:0 afterDelay:86400.0 withUserData:86400.0]; {
  [(ATEventScheduler *)self->_eventScheduler scheduleEvent:@"MLKeepLocalSessionEvent" afterDelay:0 withUserData:60.0];
  }
  id v10 = objc_alloc((Class)MSVXPCListener);
  long long v11 = (NSXPCListener *)[v10 initWithMachServiceName:ATMachKeepLocalRequestHandlerServiceName];
  keepLocalTaskConnection = self->_keepLocalTaskConnection;
  self->_keepLocalTaskConnection = v11;

  [(NSXPCListener *)self->_keepLocalTaskConnection setDelegate:self];
  [(NSXPCListener *)self->_keepLocalTaskConnection resume];
  id v13 = +[ICDeviceSetupStatusMonitor sharedMonitor];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_65270;
  v14[3] = &unk_9AF48;
  v14[4] = self;
  [v13 performBlockAfterDeviceSetup:v14];

  self->_startupCompleted = 1;
}

- (MLSyncKeepLocalEventHandler)initWithQueue:(id)a3 library:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MLSyncKeepLocalEventHandler;
  BOOL v9 = [(MLSyncKeepLocalEventHandler *)&v23 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.amp.MusicLibrarySyncBundle.MLSyncKeepLocalEventHandler.callBackQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    callbackQueue = v9->_callbackQueue;
    v9->_callbackQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = +[ATEventScheduler sharedInstance];
    eventScheduler = v9->_eventScheduler;
    v9->_eventScheduler = (ATEventScheduler *)v12;

    uint64_t v14 = +[ICEnvironmentMonitor sharedMonitor];
    environmentMonitor = v9->_environmentMonitor;
    v9->_environmentMonitor = (ICEnvironmentMonitor *)v14;

    uint64_t v16 = +[NSMutableSet set];
    keepLocalObservers = v9->_keepLocalObservers;
    v9->_keepLocalObservers = (NSMutableSet *)v16;

    v9->_startupCompleted = 0;
    uint64_t v25 = 0;
    unsigned int v26 = &v25;
    uint64_t v27 = 0x2050000000;
    id v18 = (void *)qword_A4B40;
    uint64_t v28 = qword_A4B40;
    if (!qword_A4B40)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_6545C;
      v24[3] = &unk_9AB58;
      v24[4] = &v25;
      sub_6545C((uint64_t)v24);
      id v18 = (void *)v26[3];
    }
    id v19 = v18;
    _Block_object_dispose(&v25, 8);
    uint64_t v20 = [v19 sharedDefaults];
    nanoSyncSettings = v9->_nanoSyncSettings;
    v9->_nanoSyncSettings = (NMSyncDefaults *)v20;

    objc_storeStrong((id *)&v9->_library, a4);
    objc_storeStrong((id *)&v9->_queue, a3);
  }

  return v9;
}

- (id)_allTracksDisabledForCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(MLSyncKeepLocalEventHandler *)self _inMyLibraryPredicate];
  int v6 = [(id)objc_opt_class() trackForeignPersistentID];
  id v7 = [v4 persistentID];

  id v8 = +[ML3ComparisonPredicate predicateWithProperty:v6 equalToInt64:v7];

  BOOL v9 = +[ML3MusicLibrary autoupdatingSharedLibrary];
  v14[0] = v8;
  v14[1] = v5;
  dispatch_queue_t v10 = +[NSArray arrayWithObjects:v14 count:2];
  long long v11 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v10];
  uint64_t v12 = +[ML3Track queryWithLibrary:v9 predicate:v11];

  return v12;
}

- (id)_anyTracksQueryForCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(MLSyncKeepLocalEventHandler *)self _inMyLibraryPredicate];
  int v6 = [(id)objc_opt_class() trackForeignPersistentID];
  id v7 = [v4 persistentID];

  id v8 = +[ML3ComparisonPredicate predicateWithProperty:v6 equalToInt64:v7];

  BOOL v9 = +[ML3MusicLibrary autoupdatingSharedLibrary];
  v14[0] = v8;
  v14[1] = v5;
  dispatch_queue_t v10 = +[NSArray arrayWithObjects:v14 count:2];
  long long v11 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v10];
  uint64_t v12 = +[ML3Track queryWithLibrary:v9 predicate:v11];

  return v12;
}

- (id)_trackQueryForEntityCollection:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MLSyncKeepLocalEventHandler *)self _inMyLibraryPredicate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
    dispatch_queue_t v10 = [v9 valueForProperty:ML3ContainerPropertySmartIsLimited];
    if ([v10 BOOLValue])
    {
      long long v11 = [v9 limitingProperty];

      if (!v11)
      {
LABEL_6:
        uint64_t v12 = +[ML3Track containerQueryWithContainer:v9 predicate:v7];
LABEL_9:

        goto LABEL_11;
      }
      dispatch_queue_t v10 = v7;
      id v7 = 0;
    }

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [(id)objc_opt_class() trackForeignPersistentID];
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", v13, [v6 persistentID]);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v14 = +[ML3MusicLibrary autoupdatingSharedLibrary];
    v19[0] = v9;
    v19[1] = v8;
    v19[2] = v7;
    BOOL v15 = +[NSArray arrayWithObjects:v19 count:3];
    uint64_t v16 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v15];
    BOOL v17 = +[ML3Track albumsByAlbumArtistDefaultOrderingTerms];
    uint64_t v12 = +[ML3Track queryWithLibrary:v14 predicate:v16 orderingTerms:v17];

    goto LABEL_9;
  }
  +[NSException raise:NSInternalInconsistencyException, @"Unexpected entity type %@", objc_opt_class() format];
  uint64_t v12 = 0;
LABEL_11:

  return v12;
}

- (id)_inMyLibraryPredicate
{
  if (qword_A4C88 != -1) {
    dispatch_once(&qword_A4C88, &stru_9AEB8);
  }
  v2 = (void *)qword_A4C80;

  return v2;
}

- (BOOL)_isSupportedMediaTypeFromTrackProperties:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:ML3TrackPropertyMediaType];
  unsigned int v5 = [v4 integerValue];

  if (MSVDeviceIsWatch())
  {
    char v6 = v5 == 8;
  }
  else if ((v5 & 8) != 0)
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [v3 objectForKey:ML3TrackPropertyIsMusicShow];
    unsigned __int8 v8 = [v7 BOOLValue];

    if ((v5 & 0xA00) != 0) {
      char v6 = v8;
    }
    else {
      char v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_containerIsSmartLimited:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForProperty:ML3ContainerPropertySmartIsLimited];
  if ([v4 BOOLValue])
  {
    unsigned int v5 = [v3 limitingProperty];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_searchableKeepLocalCollectionClasses
{
  if (qword_A4B78 != -1) {
    dispatch_once(&qword_A4B78, &stru_9AD38);
  }
  v2 = (void *)qword_A4B70;

  return v2;
}

- (void)_addTrackWithPersistentId:(int64_t)a3 andProperties:(id)a4 withKeepLocalValue:(int)a5 toResult:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if ([(MLSyncKeepLocalEventHandler *)self _canDownloadTrackWithPersistentID:a3 andProperties:v10])
  {
    int v49 = a5;
    uint64_t v12 = ML3TrackPropertyTotalSize;
    id v13 = [v10 objectForKey:ML3TrackPropertyTotalSize];
    id v14 = [v13 unsignedLongLongValue];

    uint64_t v15 = ML3EntityPropertyKeepLocalConstraints;
    uint64_t v16 = [v10 objectForKey:ML3EntityPropertyKeepLocalConstraints];
    unint64_t v17 = (unint64_t)[v16 integerValue];

    id v50 = [v10 mutableCopy];
    if (!v14)
    {
      id v18 = [v10 objectForKey:ML3TrackPropertyMediaType];
      unsigned int v19 = [v18 unsignedLongValue];

      uint64_t v20 = [v10 objectForKey:ML3TrackPropertyTotalTime];
      id v21 = [v20 unsignedLongValue];

      if ((v19 & 4) != 0)
      {
        unint64_t v22 = 52428800;
      }
      else if (v21)
      {
        unint64_t v22 = (unint64_t)((double)(unint64_t)v21 * 35.8260224);
      }
      else
      {
        unint64_t v22 = 7340032;
      }
      objc_super v23 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        __int16 v52 = self;
        __int16 v53 = 2048;
        int64_t v54 = a3;
        __int16 v55 = 1024;
        *(_DWORD *)long long v56 = v19;
        *(_WORD *)&v56[4] = 2048;
        *(void *)&v56[6] = v22;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Estimating the size of track %lld media_type %u to %llu", buf, 0x26u);
      }

      int v24 = +[NSNumber numberWithUnsignedLongLong:v22];
      [v50 setObject:v24 forKey:v12];
    }
    uint64_t v25 = [v11 getTrackPropertiesForPersistentID:a3];
    unsigned int v26 = v25;
    if (!v25)
    {
      LOBYTE(v28) = v17;
      uint64_t v30 = v50;
      goto LABEL_31;
    }
    uint64_t v27 = [v25 objectForKeyedSubscript:v15];
    unint64_t v28 = (unint64_t)[v27 longLongValue];

    unint64_t v29 = v28 & v17;
    uint64_t v30 = v50;
    if (v29 == v28) {
      goto LABEL_31;
    }
    id v31 = +[NSNumber numberWithUnsignedInteger:v29];
    [v50 setObject:v31 forKeyedSubscript:v15];

    [v11 updateTrackProperties:v50 forPersistendID:a3];
    id v32 = _ATLogCategorySyncBundle();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
LABEL_30:

      LOBYTE(v28) = v29;
LABEL_31:
      if (![v11 addTrackWithPersistentId:a3 properties:v30 downloadType:v49 == 1])
      {
LABEL_52:

        goto LABEL_53;
      }
      id v40 = _ATLogCategorySyncBundle();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
LABEL_51:

        goto LABEL_52;
      }
      if (v49 == 1) {
        id v41 = "manual";
      }
      else {
        id v41 = "automatic";
      }
      id v42 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
      if (v28)
      {
        id v45 = +[NSString stringWithFormat:@"inexpensive"];
        [v42 addObject:v45];

        if ((v28 & 2) == 0)
        {
LABEL_38:
          if ((v28 & 4) == 0) {
            goto LABEL_39;
          }
          goto LABEL_46;
        }
      }
      else if ((v28 & 2) == 0)
      {
        goto LABEL_38;
      }
      id v46 = +[NSString stringWithFormat:@"wifi"];
      [v42 addObject:v46];

      if ((v28 & 4) == 0)
      {
LABEL_39:
        if ((v28 & 8) == 0) {
          goto LABEL_40;
        }
        goto LABEL_47;
      }
LABEL_46:
      uint64_t v47 = +[NSString stringWithFormat:@"power"];
      [v42 addObject:v47];

      if ((v28 & 8) == 0)
      {
LABEL_40:
        if ((v28 & 0x10) == 0)
        {
LABEL_42:
          if ([v42 count])
          {
            id v44 = [v42 componentsJoinedByString:@", "];
          }
          else
          {
            id v44 = @"None";
          }

          *(_DWORD *)buf = 138544130;
          __int16 v52 = self;
          __int16 v53 = 2048;
          int64_t v54 = a3;
          __int16 v55 = 2080;
          *(void *)long long v56 = v41;
          *(_WORD *)&v56[8] = 2114;
          *(void *)&v56[10] = v44;
          _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding track (%lld) for %s download with constraints [%{public}@]", buf, 0x2Au);

          uint64_t v30 = v50;
          goto LABEL_51;
        }
LABEL_41:
        id v43 = +[NSString stringWithFormat:@"power-updates"];
        [v42 addObject:v43];

        goto LABEL_42;
      }
LABEL_47:
      id v48 = +[NSString stringWithFormat:@"wifi-updates"];
      [v42 addObject:v48];

      if ((v28 & 0x10) == 0) {
        goto LABEL_42;
      }
      goto LABEL_41;
    }
    id v33 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
    if (v29)
    {
      id v36 = +[NSString stringWithFormat:@"inexpensive"];
      [v33 addObject:v36];

      if ((v29 & 2) == 0)
      {
LABEL_16:
        if ((v29 & 4) == 0) {
          goto LABEL_17;
        }
        goto LABEL_25;
      }
    }
    else if ((v29 & 2) == 0)
    {
      goto LABEL_16;
    }
    uint64_t v37 = +[NSString stringWithFormat:@"wifi"];
    [v33 addObject:v37];

    if ((v29 & 4) == 0)
    {
LABEL_17:
      if ((v29 & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_26;
    }
LABEL_25:
    id v38 = +[NSString stringWithFormat:@"power"];
    [v33 addObject:v38];

    if ((v29 & 8) == 0)
    {
LABEL_18:
      if ((v29 & 0x10) == 0)
      {
LABEL_20:
        if ([v33 count])
        {
          id v35 = [v33 componentsJoinedByString:@", "];
        }
        else
        {
          id v35 = @"None";
        }
        uint64_t v30 = v50;

        *(_DWORD *)buf = 138543874;
        __int16 v52 = self;
        __int16 v53 = 2048;
        int64_t v54 = a3;
        __int16 v55 = 2114;
        *(void *)long long v56 = v35;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating track (%lld) with new constraints [%{public}@]", buf, 0x20u);

        goto LABEL_30;
      }
LABEL_19:
      v34 = +[NSString stringWithFormat:@"power-updates"];
      [v33 addObject:v34];

      goto LABEL_20;
    }
LABEL_26:
    id v39 = +[NSString stringWithFormat:@"wifi-updates"];
    [v33 addObject:v39];

    if ((v29 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_53:
}

- (BOOL)_canDownloadTrackWithPersistentID:(int64_t)a3 andProperties:(id)a4
{
  id v7 = a4;
  unsigned __int8 v8 = [v7 objectForKey:ML3EntityPropertyKeepLocal];
  id v9 = [v8 integerValue];

  if (v9 == (id)-1)
  {
    id v14 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v7 objectForKeyedSubscript:ML3TrackPropertyTitle];
      int v26 = 138543874;
      uint64_t v27 = self;
      __int16 v28 = 2048;
      int64_t v29 = a3;
      __int16 v30 = 2114;
      id v31 = v15;
      uint64_t v16 = "%{public}@ Track %lld (%{public}@) is marked as disabled - ignoring";
      goto LABEL_17;
    }
LABEL_18:

    BOOL v24 = 0;
    goto LABEL_19;
  }
  id v10 = [v7 objectForKey:ML3TrackPropertyStoreSagaID];
  id v11 = [v10 longLongValue];
  if (v11
    || ([v7 objectForKey:ML3TrackPropertySubscriptionStoreItemID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 longLongValue]))
  {
    uint64_t v12 = [v7 objectForKey:ML3TrackPropertyStoreCloudAssetAvailable];
    unsigned __int8 v13 = [v12 BOOLValue];

    if (!v11) {
    if ((v13 & 1) == 0)
    }
    {
      id v14 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v7 objectForKeyedSubscript:ML3TrackPropertyTitle];
        int v26 = 138543874;
        uint64_t v27 = self;
        __int16 v28 = 2048;
        int64_t v29 = a3;
        __int16 v30 = 2114;
        id v31 = v15;
        uint64_t v16 = "%{public}@ Track %lld (%{public}@) has cloud asset unavailable - ignoring";
LABEL_17:
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v26, 0x20u);

        goto LABEL_18;
      }
      goto LABEL_18;
    }
  }
  else
  {
  }
  unint64_t v17 = [v7 objectForKey:ML3TrackPropertyMediaType];
  unsigned __int16 v18 = (unsigned __int16)[v17 unsignedIntValue];

  int v19 = v18 & 0xA00;
  uint64_t v20 = [v7 objectForKey:ML3TrackPropertyNeedsRestore];
  unsigned __int8 v21 = [v20 BOOLValue];

  unint64_t v22 = [v7 objectForKey:ML3TrackPropertyIsMusicShow];
  unsigned __int8 v23 = [v22 BOOLValue];

  BOOL v24 = 1;
  if (v19 && (v21 & 1) == 0 && (v23 & 1) == 0)
  {
    id v14 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v7 objectForKeyedSubscript:ML3TrackPropertyTitle];
      int v26 = 138543874;
      uint64_t v27 = self;
      __int16 v28 = 2048;
      int64_t v29 = a3;
      __int16 v30 = 2114;
      id v31 = v15;
      uint64_t v16 = "%{public}@ Track %lld (%{public}@) is a non-Restore, non-Music show or movie - ignoring";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
LABEL_19:

  return v24;
}

- (void)_performKeepLocalEvaluationOnCollection:(id)a3 withProperties:(id)a4 fromLibrary:(id)a5 toResult:(id)a6
{
  id v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v45 = a6;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  char v74 = 1;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  char v70 = 0;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  uint64_t v59 = 0;
  long long v60 = &v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  id v46 = v11;
  unsigned __int8 v13 = [v11 objectForKeyedSubscript:ML3EntityPropertyKeepLocalConstraints];
  id v14 = [v13 longLongValue];

  uint64_t v15 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
    if (v14)
    {
      unint64_t v17 = +[NSString stringWithFormat:@"inexpensive"];
      [v16 addObject:v17];
    }
    if ((v14 & 2) != 0)
    {
      unsigned __int16 v18 = +[NSString stringWithFormat:@"wifi"];
      [v16 addObject:v18];
    }
    if ((v14 & 4) != 0)
    {
      int v19 = +[NSString stringWithFormat:@"power"];
      [v16 addObject:v19];
    }
    if ((v14 & 8) != 0)
    {
      uint64_t v20 = +[NSString stringWithFormat:@"wifi-updates"];
      [v16 addObject:v20];
    }
    if ((v14 & 0x10) != 0)
    {
      unsigned __int8 v21 = +[NSString stringWithFormat:@"power-updates"];
      [v16 addObject:v21];
    }
    if ([v16 count])
    {
      unint64_t v22 = [v16 componentsJoinedByString:@", "];
    }
    else
    {
      unint64_t v22 = @"None";
    }

    *(_DWORD *)buf = 138543874;
    unsigned int v79 = self;
    __int16 v80 = 2114;
    id v81 = v10;
    __int16 v82 = 2114;
    BOOL v83 = v22;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Evaluating keep-local on %{public}@ with constraints [%{public}@]", buf, 0x20u);
  }
  uint64_t v23 = ML3EntityPropertyKeepLocal;
  BOOL v24 = [v46 objectForKeyedSubscript:ML3EntityPropertyKeepLocal];
  unsigned int v25 = [v24 integerValue];

  uint64_t v44 = ML3EntityPropertyKeepLocalStatus;
  int v26 = objc_msgSend(v46, "objectForKeyedSubscript:");
  unsigned int v27 = [v26 integerValue];

  __int16 v28 = +[MLSyncKeepLocalEventHandler _trackPropertiesToFetch];
  int64_t v29 = [(id)objc_opt_class() missingTrackDataPredicate];
  __int16 v30 = [(MLSyncKeepLocalEventHandler *)self _trackQueryForEntityCollection:v10 predicate:v29];

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_67180;
  v47[3] = &unk_9ACD8;
  __int16 v53 = &v63;
  id v31 = v12;
  id v48 = v31;
  id v32 = v28;
  id v49 = v32;
  id v33 = v10;
  id v50 = v33;
  uint64_t v51 = self;
  int64_t v54 = &v67;
  __int16 v55 = &v71;
  long long v56 = &v59;
  id v57 = v14;
  unsigned int v58 = v25;
  id v34 = v45;
  id v52 = v34;
  [v30 enumeratePersistentIDsUsingBlock:v47];
  id v35 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    id v36 = (__CFString *)v60[3];
    *(_DWORD *)buf = 138543874;
    unsigned int v79 = self;
    __int16 v80 = 2048;
    id v81 = v36;
    __int16 v82 = 2114;
    BOOL v83 = v33;
    _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %lu tracks to download for %{public}@", buf, 0x20u);
  }

  if (*((unsigned char *)v68 + 24))
  {
    if (v60[3])
    {
      if ((v27 & 0xFFFFFFFD) == 0)
      {
        uint64_t v37 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          unsigned int v79 = self;
          __int16 v80 = 2114;
          id v81 = v33;
          _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ Marking %{public}@ as downloading", buf, 0x16u);
        }

        v75[0] = v44;
        v75[1] = ML3EntityPropertyKeepLocalStatusReason;
        id v38 = +[NSArray arrayWithObjects:v75 count:2];
        [(__CFString *)v33 setValues:&off_9D1D8 forProperties:v38];
LABEL_45:
      }
    }
    else if (v27 - 1 <= 1)
    {
      id v43 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        unsigned int v79 = self;
        __int16 v80 = 2114;
        id v81 = v33;
        _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ Marking %{public}@ as none", buf, 0x16u);
      }

      v76[0] = v44;
      v76[1] = ML3EntityPropertyKeepLocalStatusReason;
      id v38 = +[NSArray arrayWithObjects:v76 count:2];
      [(__CFString *)v33 setValues:&off_9D1C0 forProperties:v38];
      goto LABEL_45;
    }
  }
  else
  {
    if (*((unsigned char *)v64 + 24))
    {
      if (*((unsigned char *)v72 + 24))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(MLSyncKeepLocalEventHandler *)self _containerIsSmartLimited:v33])
          {
            id v39 = _ATLogCategorySyncBundle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              unsigned int v79 = self;
              __int16 v80 = 2114;
              id v81 = v33;
              _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ de-Up-Pinning %{public}@ because all tracks are marked as disabled", buf, 0x16u);
            }

            [(__CFString *)v33 setValue:&off_9CBA0 forProperty:v23];
          }
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v40 = [(MLSyncKeepLocalEventHandler *)self _anyTracksQueryForCollection:v33];
      if (([v40 hasEntities] & 1) == 0)
      {
        id v41 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          unsigned int v79 = self;
          __int16 v80 = 2114;
          id v81 = v33;
          _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ Disabling pinning for %{public}@ because it has no tracks", buf, 0x16u);
        }

        [(__CFString *)v33 setValue:&off_9CBA0 forProperty:v23];
      }
    }
    if (v27 != 2)
    {
      id v42 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        unsigned int v79 = self;
        __int16 v80 = 2114;
        id v81 = v33;
        _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ Marking %{public}@ as complete", buf, 0x16u);
      }

      v77[0] = v44;
      v77[1] = ML3EntityPropertyKeepLocalStatusReason;
      id v38 = +[NSArray arrayWithObjects:v77 count:2];
      [(__CFString *)v33 setValues:&off_9D1A8 forProperties:v38];
      goto LABEL_45;
    }
  }

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
}

- (id)_runKeepLocalEvaluationForAlbumWithPersistentId:(int64_t)a3 musicLibrary:(id)a4
{
  id v6 = a4;
  id v7 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = self;
    __int16 v15 = 2048;
    int64_t v16 = a3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Evaluating keep-local rules for album:%lld", (uint8_t *)&v13, 0x16u);
  }

  id v8 = [objc_alloc((Class)ML3Album) initWithPersistentID:a3 inLibrary:v6];
  id v9 = +[MLSyncKeepLocalEventHandler _collectionPropertiesToFetch];
  id v10 = [v8 getValuesForProperties:v9];
  id v11 = objc_alloc_init(MLSyncKeepLocalEvaluationResult);
  [(MLSyncKeepLocalEventHandler *)self _performKeepLocalEvaluationOnCollection:v8 withProperties:v10 fromLibrary:v6 toResult:v11];

  return v11;
}

- (id)_runKeepLocalEvaluationForContainerWithPersistentId:(int64_t)a3 musicLibrary:(id)a4
{
  id v6 = a4;
  id v7 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = self;
    __int16 v15 = 2048;
    int64_t v16 = a3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Evaluating keep-local rules for playlist:%lld", (uint8_t *)&v13, 0x16u);
  }

  id v8 = +[ML3Container newWithPersistentID:a3 inLibrary:v6];
  id v9 = +[MLSyncKeepLocalEventHandler _collectionPropertiesToFetch];
  id v10 = [v8 getValuesForProperties:v9];
  id v11 = objc_alloc_init(MLSyncKeepLocalEvaluationResult);
  [(MLSyncKeepLocalEventHandler *)self _performKeepLocalEvaluationOnCollection:v8 withProperties:v10 fromLibrary:v6 toResult:v11];

  return v11;
}

- (id)_runKeepLocalEvaluationForTrackWithPersistentId:(int64_t)a3 musicLibrary:(id)a4
{
  id v6 = a4;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x3032000000;
  unsigned __int8 v21 = sub_67978;
  unint64_t v22 = sub_67988;
  uint64_t v23 = objc_alloc_init(MLSyncKeepLocalEvaluationResult);
  id v7 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    unsigned int v25 = self;
    __int16 v26 = 2048;
    int64_t v27 = a3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Evaluating keep-local rules for track:%lld", buf, 0x16u);
  }

  id v8 = [(id)objc_opt_class() keepLocalWithMissingTrackDataAndIsDownloadablePredicateForIdentifier:a3];
  id v9 = +[ML3Track queryWithLibrary:v6 predicate:v8];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_67990;
  v13[3] = &unk_9ACB0;
  int64_t v17 = a3;
  id v10 = v6;
  id v14 = v10;
  __int16 v15 = self;
  int64_t v16 = &v18;
  [v9 enumeratePersistentIDsUsingBlock:v13];
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v11;
}

- (int64_t)sizeOfMediaItemsDownloadedForAutomaticallyPinnedCollectionsWithMusicLibrary:(id)a3
{
  id v4 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ sizeOfMediaItemsDownloadedForAutomaticallyPinnedCollections=%lld", (uint8_t *)&v6, 0x16u);
  }

  return 0;
}

- (id)setKeepLocalForAllMusicItemsWithLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)MSVXPCTransaction) initWithName:@"setKeepLocalForAllMusicItemsWithLibrary"];
  [v5 beginTransaction];
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_67978;
  id v36 = sub_67988;
  uint64_t v37 = objc_alloc_init(MLSyncKeepLocalEvaluationResult);
  unsigned __int8 v21 = +[MLSyncKeepLocalEventHandler _trackPropertiesToFetch];
  int v6 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyMediaType value:&off_9CC18 comparison:10];
  id v7 = [(MLSyncKeepLocalEventHandler *)self _inMyLibraryPredicate];
  v44[0] = v7;
  __int16 v8 = +[MLSyncKeepLocalEventHandler isDownloadablePredicate];
  v44[1] = v8;
  v44[2] = v6;
  uint64_t v9 = +[MLSyncKeepLocalEventHandler hasTrackDataOrPendingDownloadPredicate];
  id v10 = +[ML3NegationPredicate predicateWithPredicate:v9];
  v44[3] = v10;
  id v11 = +[NSArray arrayWithObjects:v44 count:4];
  id v12 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v11];

  int v13 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:v4 predicate:v12 orderingTerms:0];
  +[NSMutableSet set];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_67F90;
  v30[3] = &unk_9ABC0;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v31 = v14;
  [v13 enumeratePersistentIDsUsingBlock:v30];
  __int16 v15 = _ATLogCategorySyncBundle_Oversize();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v39 = self;
    __int16 v40 = 1024;
    int v41 = 1;
    __int16 v42 = 2114;
    id v43 = v14;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Manually setting keep local=%d on %{public}@ tracks", buf, 0x1Cu);
  }

  if ([v14 count])
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_67FF0;
    v27[3] = &unk_9ABE8;
    id v16 = v14;
    id v28 = v16;
    id v17 = v4;
    id v29 = v17;
    [v17 performDatabaseTransactionWithBlock:v27];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_680D4;
    v22[3] = &unk_9AC88;
    id v23 = v17;
    id v24 = v21;
    unsigned int v25 = self;
    __int16 v26 = &v32;
    [v16 enumerateObjectsUsingBlock:v22];
  }
  [v5 endTransaction];
  id v19 = (id)v33[5];

  _Block_object_dispose(&v32, 8);

  return v19;
}

- (id)runDefaultKeepLocalEvaluationWithMusicLibrary:(id)a3
{
  id v68 = a3;
  id v3 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Evaluating default keep-local rules", (uint8_t *)&buf, 0xCu);
  }

  id v61 = [objc_alloc((Class)MSVXPCTransaction) initWithName:@"RunDefaultKeepLocalRulesOperation"];
  [v61 beginTransaction];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v119 = 0x3032000000;
  v120 = sub_67978;
  v121 = sub_67988;
  __int16 v122 = objc_alloc_init(MLSyncKeepLocalEvaluationResult);
  id v4 = +[MLSyncKeepLocalEventHandler _trackPropertiesToFetch];
  uint64_t v65 = +[MLSyncKeepLocalEventHandler _collectionPropertiesToFetch];
  id v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v108 = 138543362;
    v109 = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Searching for keep-local tracks", v108, 0xCu);
  }

  long long v60 = [(id)objc_opt_class() keepLocalAndMissingTrackDataPredicate];
  uint64_t v6 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyNeedsRestore equalToInt64:1];
  +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyStoreItemID value:&off_9CBA0 comparison:2];
  v56 = __int16 v55 = (void *)v6;
  v117[0] = v6;
  v117[1] = v56;
  id v7 = +[NSArray arrayWithObjects:v117 count:2];
  uint64_t v62 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v7];

  v116[0] = v60;
  v116[1] = v62;
  __int16 v8 = +[NSArray arrayWithObjects:v116 count:2];
  uint64_t v59 = +[ML3AnyCompoundPredicate predicateMatchingPredicates:v8];

  uint64_t v9 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:v68 predicate:v59 orderingTerms:0];
  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472;
  v104[2] = sub_68F30;
  v104[3] = &unk_9AB98;
  id v10 = v4;
  id v105 = v10;
  char v106 = self;
  p_long long buf = &buf;
  [v9 enumeratePersistentIDsAndProperties:v10 usingBlock:v104];
  id v11 = +[NSMutableArray array];
  [(id)objc_opt_class() keepLocalAndDownloadingButNotDownloadablePredicate];
  id v52 = v10;
  v54 = __int16 v53 = v9;
  v115[0] = v54;
  id v12 = +[ML3NegationPredicate predicateWithPredicate:v62];
  v115[1] = v12;
  int v13 = +[NSArray arrayWithObjects:v115 count:2];
  unsigned int v58 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v13];

  id v57 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:v68 predicate:v58 orderingTerms:0];
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_69044;
  v102[3] = &unk_9ABC0;
  id v63 = v11;
  id v103 = v63;
  [v57 enumeratePersistentIDsUsingBlock:v102];
  id v14 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v108 = 138543618;
    v109 = self;
    __int16 v110 = 2114;
    *(void *)v111 = v63;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Clearing keep-local downloading status for tracks no longer downloadable: %{public}@", v108, 0x16u);
  }

  if ([v63 count])
  {
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472;
    v99[2] = sub_690A4;
    v99[3] = &unk_9ABE8;
    id v100 = v63;
    id v101 = v68;
    [v101 performDatabaseTransactionWithBlock:v99];
  }
  __int16 v15 = objc_opt_new();
  char v66 = objc_opt_new();
  id v16 = [(MLSyncKeepLocalEventHandler *)self _searchableKeepLocalCollectionClasses];
  id v17 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v108 = 138543618;
    v109 = self;
    __int16 v110 = 2114;
    *(void *)v111 = v16;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Searching for keep local collections in %{public}@", v108, 0x16u);
  }

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id obj = v16;
  id v18 = [obj countByEnumeratingWithState:&v95 objects:v114 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v96;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v96 != v19) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v21 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        id v23 = [(id)objc_opt_class() keepLocalEnabledPredicate];
        id v24 = [v21 queryWithLibrary:v68 predicate:v23];

        v89[0] = _NSConcreteStackBlock;
        v89[1] = 3221225472;
        v89[2] = sub_69178;
        v89[3] = &unk_9AC10;
        id v25 = v65;
        id v90 = v25;
        long long v94 = v21;
        id v91 = v68;
        id v92 = v66;
        id v93 = v15;
        [v24 enumeratePersistentIDsAndProperties:v25 usingBlock:v89];
      }
      id v18 = [obj countByEnumeratingWithState:&v95 objects:v114 count:16];
    }
    while (v18);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v26 = v15;
  id v27 = [v26 countByEnumeratingWithState:&v85 objects:v113 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v86;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v86 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v85 + 1) + 8 * (void)j);
        uint64_t v32 = [v66 objectForKeyedSubscript:v30];
        [(MLSyncKeepLocalEventHandler *)self _performKeepLocalEvaluationOnCollection:v30 withProperties:v32 fromLibrary:v68 toResult:*(void *)(*((void *)&buf + 1) + 40)];
      }
      id v27 = [v26 countByEnumeratingWithState:&v85 objects:v113 count:16];
    }
    while (v27);
  }

  id v33 = objc_opt_new();
  uint64_t v34 = objc_opt_new();
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_6927C;
  v82[3] = &unk_9AC38;
  id v35 = v33;
  id v83 = v35;
  id v36 = v34;
  id v84 = v36;
  [v68 databaseConnectionAllowingWrites:0 withBlock:v82];
  if ([v35 count] || objc_msgSend(v36, "count"))
  {
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    void v77[2] = sub_693C4;
    v77[3] = &unk_9AC60;
    id v78 = v35;
    unsigned int v79 = self;
    id v80 = v68;
    id v81 = v36;
    [v80 performDatabaseTransactionWithBlock:v77];
  }
  uint64_t v37 = +[NSMutableArray array];
  uint64_t v38 = +[ML3ComparisonPredicate predicateWithProperty:ML3EntityPropertyKeepLocalStatus value:&off_9CBD0 comparison:2];
  +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyHasNonPurgeableAsset value:&off_9CC00 comparison:1];
  v51 = id v50 = (void *)v38;
  v112[0] = v51;
  v112[1] = v38;
  id v39 = +[NSArray arrayWithObjects:v112 count:2];
  __int16 v40 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v39];

  int v41 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:v68 predicate:v40 orderingTerms:0];
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  void v75[2] = sub_695C4;
  v75[3] = &unk_9ABC0;
  id v42 = v37;
  id v76 = v42;
  [v41 enumeratePersistentIDsUsingBlock:v75];
  if ([v42 count])
  {
    id v43 = _ATLogCategorySyncBundle_Oversize();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v44 = [v42 count];
      *(_DWORD *)uint64_t v108 = 138543874;
      v109 = self;
      __int16 v110 = 1024;
      *(_DWORD *)v111 = v44;
      *(_WORD *)&v111[4] = 2114;
      *(void *)&v111[6] = v42;
      _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating keep-local-status to complete for %d tracks because they have downloaded assets: %{public}@", v108, 0x1Cu);
    }

    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_69624;
    v72[3] = &unk_9ABE8;
    id v73 = v42;
    id v74 = v68;
    [v74 performDatabaseTransactionWithBlock:v72];
  }
  id v45 = +[ICDeviceInfo currentDeviceInfo];
  unsigned int v46 = [v45 isWatch];

  if (v46)
  {
    uint64_t v47 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v108 = 138543362;
      v109 = self;
      _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ Checking if we should perform a keep-local reset", v108, 0xCu);
    }

    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_696F8;
    v69[3] = &unk_9ABE8;
    id v70 = v68;
    uint64_t v71 = self;
    [v70 performDatabaseTransactionWithBlock:v69];
  }
  [v61 endTransaction];
  id v48 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v48;
}

- (id)runKeepLocalEvaluationForItem:(int64_t)a3 entityType:(int64_t)a4 newKeepLocalStatus:(int)a5 musicLibrary:(id)a6
{
  id v9 = a6;
  id v10 = [objc_alloc((Class)MSVXPCTransaction) initWithName:@"RunKeepLocalRulesOperation"];
  [v10 beginTransaction];
  switch(a4)
  {
    case 4:
      uint64_t v11 = [(MLSyncKeepLocalEventHandler *)self _runKeepLocalEvaluationForAlbumWithPersistentId:a3 musicLibrary:v9];
      goto LABEL_7;
    case 1:
      uint64_t v11 = [(MLSyncKeepLocalEventHandler *)self _runKeepLocalEvaluationForContainerWithPersistentId:a3 musicLibrary:v9];
      goto LABEL_7;
    case 0:
      uint64_t v11 = [(MLSyncKeepLocalEventHandler *)self _runKeepLocalEvaluationForTrackWithPersistentId:a3 musicLibrary:v9];
LABEL_7:
      id v12 = (void *)v11;
      goto LABEL_11;
  }
  int v13 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138543618;
    id v16 = self;
    __int16 v17 = 1024;
    int v18 = a4;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "%{public}@ Cannot evaluate keep-local rules for invalid entity type:%d", (uint8_t *)&v15, 0x12u);
  }

  id v12 = 0;
LABEL_11:
  [v10 endTransaction];

  return v12;
}

+ (id)keepLocalAndDownloadingButNotDownloadablePredicate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_69CE0;
  block[3] = &unk_9AE18;
  void block[4] = a1;
  if (qword_A4C78 != -1) {
    dispatch_once(&qword_A4C78, block);
  }
  v2 = (void *)qword_A4C70;

  return v2;
}

+ (id)hasDownloadingStatusPredicate
{
  if (qword_A4C68 != -1) {
    dispatch_once(&qword_A4C68, &stru_9AE98);
  }
  v2 = (void *)qword_A4C60;

  return v2;
}

+ (id)isDownloadablePredicate
{
  if (qword_A4C58 != -1) {
    dispatch_once(&qword_A4C58, &stru_9AE78);
  }
  v2 = (void *)qword_A4C50;

  return v2;
}

+ (id)keepLocalCancelledOrDisabledAndIsDownloadingOrPausedPredicate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_69FEC;
  block[3] = &unk_9AE18;
  void block[4] = a1;
  if (qword_A4C48 != -1) {
    dispatch_once(&qword_A4C48, block);
  }
  v2 = (void *)qword_A4C40;

  return v2;
}

+ (id)keepLocalDisabledAndHasTrackDataOrDownloadAndIsRedownloadablePredicate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6A1BC;
  block[3] = &unk_9AE18;
  void block[4] = a1;
  if (qword_A4C38 != -1) {
    dispatch_once(&qword_A4C38, block);
  }
  v2 = (void *)qword_A4C30;

  return v2;
}

+ (id)hasTrackDataOrPendingDownloadPredicate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6A350;
  block[3] = &unk_9AE18;
  void block[4] = a1;
  if (qword_A4C28 != -1) {
    dispatch_once(&qword_A4C28, block);
  }
  v2 = (void *)qword_A4C20;

  return v2;
}

+ (id)hasPendingDownloadPredicate
{
  if (qword_A4C18 != -1) {
    dispatch_once(&qword_A4C18, &stru_9AE58);
  }
  v2 = (void *)qword_A4C10;

  return v2;
}

+ (id)keepLocalWithMissingTrackDataAndIsDownloadablePredicateForIdentifier:(int64_t)a3
{
  id v4 = [a1 trackMatchingItemIdentifierPredicate:a3];
  id v5 = objc_msgSend(a1, "missingTrackDataPredicate", v4);
  v10[1] = v5;
  uint64_t v6 = [a1 isDownloadablePredicate];
  v10[2] = v6;
  id v7 = +[NSArray arrayWithObjects:v10 count:3];
  __int16 v8 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v7];

  return v8;
}

+ (id)keepLocalAndMissingTrackDataPredicate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6A740;
  block[3] = &unk_9AE18;
  void block[4] = a1;
  if (qword_A4C08 != -1) {
    dispatch_once(&qword_A4C08, block);
  }
  v2 = (void *)qword_A4C00;

  return v2;
}

+ (id)keepLocalCancelledPredicate
{
  if (qword_A4BF8 != -1) {
    dispatch_once(&qword_A4BF8, &stru_9AE38);
  }
  v2 = (void *)qword_A4BF0;

  return v2;
}

+ (id)hasTrackDataAndNotManuallyPinnedPredicate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6A960;
  block[3] = &unk_9AE18;
  void block[4] = a1;
  if (qword_A4BE8 != -1) {
    dispatch_once(&qword_A4BE8, block);
  }
  v2 = (void *)qword_A4BE0;

  return v2;
}

+ (id)keepLocalOffPredicate
{
  if (qword_A4BD8 != -1) {
    dispatch_once(&qword_A4BD8, &stru_9ADF8);
  }
  v2 = (void *)qword_A4BD0;

  return v2;
}

+ (id)keepLocalDisabledPredicate
{
  if (qword_A4BC8 != -1) {
    dispatch_once(&qword_A4BC8, &stru_9ADD8);
  }
  v2 = (void *)qword_A4BC0;

  return v2;
}

+ (id)keepLocalNotDisabledPredicate
{
  if (qword_A4BB8 != -1) {
    dispatch_once(&qword_A4BB8, &stru_9ADB8);
  }
  v2 = (void *)qword_A4BB0;

  return v2;
}

+ (id)keepLocalEnabledPredicate
{
  if (qword_A4BA8 != -1) {
    dispatch_once(&qword_A4BA8, &stru_9AD98);
  }
  v2 = (void *)qword_A4BA0;

  return v2;
}

+ (id)hasTrackDataPredicate
{
  if (qword_A4B98 != -1) {
    dispatch_once(&qword_A4B98, &stru_9AD78);
  }
  v2 = (void *)qword_A4B90;

  return v2;
}

+ (id)missingTrackDataPredicate
{
  if (qword_A4B88 != -1) {
    dispatch_once(&qword_A4B88, &stru_9AD58);
  }
  v2 = (void *)qword_A4B80;

  return v2;
}

+ (id)trackMatchingItemIdentifierPredicate:(int64_t)a3
{
  uint64_t v3 = ML3EntityPropertyPersistentID;
  id v4 = +[NSNumber numberWithLongLong:a3];
  id v5 = +[ML3ComparisonPredicate predicateWithProperty:v3 value:v4 comparison:1];

  return v5;
}

+ (id)_collectionPropertiesToFetch
{
  if (qword_A4B68 != -1) {
    dispatch_once(&qword_A4B68, &stru_9AD18);
  }
  v2 = (void *)qword_A4B60;

  return v2;
}

+ (id)_trackPropertiesToFetch
{
  if (qword_A4B58 != -1) {
    dispatch_once(&qword_A4B58, &stru_9ACF8);
  }
  v2 = (void *)qword_A4B50;

  return v2;
}

@end