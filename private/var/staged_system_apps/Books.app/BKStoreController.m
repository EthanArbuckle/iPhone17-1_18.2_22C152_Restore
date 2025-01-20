@interface BKStoreController
- (BKLibraryAssetProvider)libraryAssetProvider;
- (BKLibraryBookUpdateCountOperation)updateCountOperation;
- (BKLibraryDownloadQueueManager)downloadQueueManager;
- (BKStoreController)initWithLibrary:(id)a3 downloadQueueManager:(id)a4;
- (BOOL)allowCitationForProtectedBooks;
- (BOOL)citationAllowedForStoreFrontID:(unint64_t)a3;
- (BOOL)isAssetDownloadableWithStoreId:(id)a3;
- (BOOL)isReportConcernEnabled;
- (NSOperationQueue)operationQueue;
- (NSSet)storeIDsWithAvailableUpdates;
- (NSURL)bookmarkGetAllUrl;
- (NSURL)bookmarkSetAllUrl;
- (NSURL)tellAFriendEmailBodyURLBase;
- (OS_dispatch_queue)updateQueue;
- (id)assetDownloadProgressWithStoreId:(id)a3;
- (id)bookUrlForStoreId:(id)a3;
- (id)storesAllowingCitation;
- (unint64_t)lastBookUpdateCheck;
- (void)_bagInvalidated:(id)a3;
- (void)_notifyStoreIDsWithAvailableUpdatesChanged;
- (void)_operationDidFinish:(id)a3 result:(id)a4;
- (void)bumpLastBookUpdateCheck;
- (void)canCheckForBookUpdatesWithCompletion:(id)a3;
- (void)cancelDownloadingAssetWithStoreId:(id)a3;
- (void)clearAvailableUpdatesForStoreIDAndRefreshUpdateCount:(id)a3;
- (void)coverForAssetWithStoreId:(id)a3 supplementalAssetID:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)downloadQueueReload;
- (void)getStoreIDsWithAvailableUpdatesWithCompletion:(id)a3;
- (void)libraryOperationDidComplete:(id)a3;
- (void)openEBookProductPageForStoreID:(id)a3;
- (void)refreshUpdateCountAsync;
- (void)setDownloadQueueManager:(id)a3;
- (void)setLibraryAssetProvider:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setStoreIDsWithAvailableUpdates:(id)a3;
- (void)setUpdateCountOperation:(id)a3;
- (void)setUpdateQueue:(id)a3;
- (void)startAllowingRefreshUpdateCount;
- (void)startOrResumeDownloadingAssetWithStoreId:(id)a3;
@end

@implementation BKStoreController

- (BKStoreController)initWithLibrary:(id)a3 downloadQueueManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)BKStoreController;
  v8 = [(BKStoreController *)&v29 init];
  v9 = v8;
  if (v8)
  {
    [(BKStoreController *)v8 setLibraryAssetProvider:v6];
    dispatch_queue_t v10 = dispatch_queue_create("BKStoreController.storeIDsWithAvailableUpdates", 0);
    storeIDsWithAvailableUpdatesSync = v9->_storeIDsWithAvailableUpdatesSync;
    v9->_storeIDsWithAvailableUpdatesSync = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("BKStoreController.storeIDsWithAssetVersionUpdatePendingSync", 0);
    storeIDsWithAssetVersionUpdatePendingSync = v9->_storeIDsWithAssetVersionUpdatePendingSync;
    v9->_storeIDsWithAssetVersionUpdatePendingSync = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("BKStoreController.bagSnapshotAccessQueue", v14);
    bagSnapshotAccessQueue = v9->_bagSnapshotAccessQueue;
    v9->_bagSnapshotAccessQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_queue_attr_make_initially_inactive(v17);
    dispatch_queue_t v19 = dispatch_queue_create("BKStoreController.updateQueue", v18);
    updateQueue = v9->_updateQueue;
    v9->_updateQueue = (OS_dispatch_queue *)v19;

    storeIDsCompletions = v9->_storeIDsCompletions;
    v9->_storeIDsCompletions = (NSArray *)&__NSArray0__struct;

    uint64_t v22 = +[NSMutableSet set];
    storeIDsWithAssetVersionUpdatePending = v9->_storeIDsWithAssetVersionUpdatePending;
    v9->_storeIDsWithAssetVersionUpdatePending = (NSMutableSet *)v22;

    [(BKStoreController *)v9 _bagInvalidated:0];
    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v9 selector:"_bagInvalidated:" name:AMSBagInvalidatedNotification object:0];

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v9 selector:"libraryOperationDidComplete:" name:BKLibraryOperationCompleteNotification object:0];

    [(BKStoreController *)v9 setDownloadQueueManager:v7];
    v26 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v9->_operationQueue;
    v9->_operationQueue = v26;

    [(NSOperationQueue *)v9->_operationQueue setMaxConcurrentOperationCount:1];
  }

  return v9;
}

- (void)setLibraryAssetProvider:(id)a3
{
}

- (void)setDownloadQueueManager:(id)a3
{
}

- (void)refreshUpdateCountAsync
{
  updateQueue = self->_updateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094BC8;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(updateQueue, block);
}

- (void)downloadQueueReload
{
  id v2 = [(BKStoreController *)self downloadQueueManager];
  [v2 reloadDownloadQueue];
}

- (BKLibraryDownloadQueueManager)downloadQueueManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadQueueManager);

  return (BKLibraryDownloadQueueManager *)WeakRetained;
}

- (void)_bagInvalidated:(id)a3
{
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029B60;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(bagSnapshotAccessQueue, block);
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  dispatch_sync((dispatch_queue_t)self->_storeIDsWithAvailableUpdatesSync, &stru_100A43F18);
  storeIDsWithAvailableUpdates = self->_storeIDsWithAvailableUpdates;
  self->_storeIDsWithAvailableUpdates = 0;

  storeIDsWithAssetVersionUpdatePendingSync = self->_storeIDsWithAssetVersionUpdatePendingSync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094B44;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_sync(storeIDsWithAssetVersionUpdatePendingSync, block);
  dispatch_activate((dispatch_object_t)self->_updateQueue);
  v6.receiver = self;
  v6.super_class = (Class)BKStoreController;
  [(BKStoreController *)&v6 dealloc];
}

- (void)startAllowingRefreshUpdateCount
{
  v3 = BKStoreBookUpdateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startAllowingRefreshUpdateCount", v4, 2u);
  }

  dispatch_activate((dispatch_object_t)self->_updateQueue);
}

- (void)openEBookProductPageForStoreID:(id)a3
{
  id v3 = a3;
  v4 = +[BKAppDelegate sceneManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100095244;
  v6[3] = &unk_100A44030;
  id v7 = v3;
  id v5 = v3;
  [v4 requestPrimaryScene:v6];
}

- (id)bookUrlForStoreId:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  dispatch_queue_t v19 = sub_100006F44;
  v20 = sub_10000718C;
  id v21 = 0;
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095440;
  block[3] = &unk_100A44058;
  block[4] = self;
  void block[5] = &v16;
  dispatch_sync(bagSnapshotAccessQueue, block);
  objc_super v6 = (void *)v17[5];
  id v7 = v4;
  id v8 = v6;
  id v9 = [v7 length];
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    v13 = 0;
  }
  else
  {
    v11 = [v8 absoluteString];
    dispatch_queue_t v12 = [v11 stringByAppendingFormat:@"?id=%@", v7];
    v13 = +[NSURL URLWithString:v12];
  }
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (BOOL)isAssetDownloadableWithStoreId:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = [(BKStoreController *)self libraryAssetProvider];
  objc_super v6 = [v5 libraryAssetOnMainQueueWithStoreID:v4];

  if ([v5 isDownloadableFromLibraryAsset:v6]) {
    unsigned int v7 = +[BKReachability isOffline] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)startOrResumeDownloadingAssetWithStoreId:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = +[BKLibraryAssetStatusController sharedController];
  objc_super v6 = [v5 statusForAssetID:v4];

  if ([v6 canResume])
  {
    unsigned int v7 = BCBookDownloadLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resuming download of asset with ID %{private}@", buf, 0xCu);
    }

    id v8 = +[BKLibraryAssetStatusController sharedController];
    [v8 resumeDownloadOfAsset:v4];
  }
  else
  {
    id v9 = [(BKStoreController *)self libraryAssetProvider];
    id v8 = [v9 libraryAssetOnMainQueueWithStoreID:v4];

    BOOL v10 = BCBookDownloadLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting download of asset with ID %{private}@", buf, 0xCu);
    }

    v11 = [(BKStoreController *)self libraryAssetProvider];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100095754;
    v12[3] = &unk_100A44080;
    id v13 = v4;
    [v11 resolveLibraryAsset:v8 completion:v12];
  }
}

- (void)cancelDownloadingAssetWithStoreId:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v4 = BCBookDownloadLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138477827;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cancelling download of asset with ID %{private}@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = +[BKLibraryAssetStatusController sharedController];
  [v5 cancelDownloadOfAsset:v3];
}

- (id)assetDownloadProgressWithStoreId:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v4 = +[BKLibraryAssetStatusController sharedController];
  id v5 = [v4 statusForAssetID:v3];

  if ([v5 state] == (id)4)
  {
    if ([v5 fileSize])
    {
      +[NSNumber numberWithDouble:][v5 bytesDownloaded]/[v5 fileSize];
      int v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v6 = &off_100A82BA0;
    }
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)coverForAssetWithStoreId:(id)a3 supplementalAssetID:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  if (!+[NSThread isMainThread])
  {
    id v8 = BCImageCacheLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1007E775C(v8);
    }

    BCReportAssertionFailureWithMessage();
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100095AEC;
  v10[3] = &unk_100A440A8;
  id v11 = v7;
  id v9 = v7;
  +[BKLibraryManager fetchImageForAssetID:size:includeSpine:includeShadow:coverEffectsEnvironment:completion:](BKLibraryManager, "fetchImageForAssetID:size:includeSpine:includeShadow:coverEffectsEnvironment:completion:", v6, 1, 1, 0, v10, 256.0, 256.0);
}

- (void)bumpLastBookUpdateCheck
{
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095BDC;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_sync(bagSnapshotAccessQueue, block);
}

- (unint64_t)lastBookUpdateCheck
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100095CE8;
  v5[3] = &unk_100A44058;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(bagSnapshotAccessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setStoreIDsWithAvailableUpdates:(id)a3
{
  id v4 = a3;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100006F44;
  v36 = sub_10000718C;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  objc_super v29 = sub_100006F44;
  v30 = sub_10000718C;
  id v31 = 0;
  storeIDsWithAvailableUpdatesSync = self->_storeIDsWithAvailableUpdatesSync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096068;
  block[3] = &unk_100A440D0;
  block[4] = self;
  id v6 = v4;
  id v22 = v6;
  v23 = &v38;
  v24 = &v32;
  v25 = &v26;
  dispatch_sync(storeIDsWithAvailableUpdatesSync, block);
  id v7 = BKStoreBookUpdateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = +[NSNumber numberWithBool:*((unsigned __int8 *)v39 + 24)];
    uint64_t v9 = [v6 allObjects];
    BOOL v10 = [v9 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138412546;
    v44 = v8;
    __int16 v45 = 2112;
    v46 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting storeIdsWithAvailableUpdates, changed=%@: [%@]", buf, 0x16u);
  }
  self->_hasSetStoreIDsWithAvailableUpdates = 1;
  if (*((unsigned char *)v39 + 24))
  {
    [(BKStoreController *)self _notifyStoreIDsWithAvailableUpdatesChanged];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = (id)v27[5];
    id v12 = [v11 countByEnumeratingWithState:&v17 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = objc_retainBlock(*(id *)(*((void *)&v17 + 1) + 8 * i));
          uint64_t v16 = v15;
          if (v15) {
            (*((void (**)(id, uint64_t))v15 + 2))(v15, v33[5]);
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v17 objects:v42 count:16];
      }
      while (v12);
    }
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
}

- (void)libraryOperationDidComplete:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  storeIDsWithAssetVersionUpdatePendingSync = self->_storeIDsWithAssetVersionUpdatePendingSync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000962C0;
  block[3] = &unk_100A44058;
  block[4] = self;
  void block[5] = &v16;
  dispatch_sync(storeIDsWithAssetVersionUpdatePendingSync, block);
  if (*((unsigned char *)v17 + 24))
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v6 = self->_storeIDsWithAssetVersionUpdatePendingSync;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100096300;
    v7[3] = &unk_100A440F8;
    id v8 = v4;
    uint64_t v9 = self;
    BOOL v10 = &v11;
    dispatch_sync(v6, v7);
    if (*((unsigned char *)v12 + 24)) {
      [(BKStoreController *)self refreshUpdateCountAsync];
    }

    _Block_object_dispose(&v11, 8);
  }
  _Block_object_dispose(&v16, 8);
}

- (void)clearAvailableUpdatesForStoreIDAndRefreshUpdateCount:(id)a3
{
  id v4 = a3;
  id v5 = [(BKStoreController *)self storeIDsWithAvailableUpdates];
  id v6 = [v5 mutableCopy];

  [v6 removeObject:v4];
  id v7 = [v6 copy];
  [(BKStoreController *)self setStoreIDsWithAvailableUpdates:v7];

  id v8 = BKStoreBookUpdateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removed %@ from storeIDsWithAvailableUpdates", buf, 0xCu);
  }

  storeIDsWithAssetVersionUpdatePendingSync = self->_storeIDsWithAssetVersionUpdatePendingSync;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000965F8;
  v11[3] = &unk_100A43DD8;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_sync(storeIDsWithAssetVersionUpdatePendingSync, v11);
}

- (void)_notifyStoreIDsWithAvailableUpdatesChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096678;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (NSSet)storeIDsWithAvailableUpdates
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100006F44;
  id v10 = sub_10000718C;
  id v11 = 0;
  storeIDsWithAvailableUpdatesSync = self->_storeIDsWithAvailableUpdatesSync;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000967CC;
  v5[3] = &unk_100A44058;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(storeIDsWithAvailableUpdatesSync, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (void)getStoreIDsWithAvailableUpdatesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasSetStoreIDsWithAvailableUpdates)
  {
    if (v4)
    {
      *(void *)long long v17 = 0;
      uint64_t v18 = v17;
      uint64_t v19 = 0x3032000000;
      long long v20 = sub_100006F44;
      id v21 = sub_10000718C;
      id v22 = 0;
      storeIDsWithAvailableUpdatesSync = self->_storeIDsWithAvailableUpdatesSync;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100096AB4;
      block[3] = &unk_100A44058;
      block[4] = self;
      void block[5] = v17;
      dispatch_sync(storeIDsWithAvailableUpdatesSync, block);
      id v7 = BKStoreBookUpdateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [*((id *)v18 + 5) allObjects];
        uint64_t v9 = [v8 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412290;
        v24 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Returning these items with update: [%@]", buf, 0xCu);
      }
      id v10 = objc_retainBlock(v5);
      id v11 = v10;
      if (v10) {
        (*((void (**)(id, void))v10 + 2))(v10, *((void *)v18 + 5));
      }

      _Block_object_dispose(v17, 8);
    }
  }
  else
  {
    id v12 = BKStoreBookUpdateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Fetching updated items before they were ready, queued up in _storeIDsCompletions.", v17, 2u);
    }

    uint64_t v13 = self->_storeIDsWithAvailableUpdatesSync;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100096B00;
    v14[3] = &unk_100A44120;
    v14[4] = self;
    id v15 = v5;
    dispatch_sync(v13, v14);
  }
}

- (void)_operationDidFinish:(id)a3 result:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_updateQueue);
  uint64_t v6 = +[NSMutableSet set];
  if ([v5 count])
  {
    [(BKStoreController *)self bumpLastBookUpdateCheck];
    id v7 = [v5 objectForKey:@"items"];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v8)
    {
      id v9 = v8;
      v27 = self;
      id v28 = v5;
      uint64_t v10 = *(void *)v37;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v36 + 1) + 8 * i) objectForKeyedSubscript:@"item-id" v27, v28];
          uint64_t v13 = [v12 adamIDStringValue];
          if (v13)
          {
            id v14 = BKStoreBookUpdateLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Adding storeId (%@) from server response to storeIdsWithAvailableUpdates", buf, 0xCu);
            }

            [v6 addObject:v13];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v9);
      self = v27;
      id v5 = v28;
    }
  }
  else
  {
    id v7 = BKStoreBookUpdateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No results", buf, 2u);
    }
  }

  id v15 = [(BKStoreController *)self libraryAssetProvider];
  uint64_t v16 = [v15 storeIDsForDownloadingBooks];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        [v6 removeObject:*(void *)(*((void *)&v32 + 1) + 8 * (void)j)];
      }
      id v19 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v19);
  }

  id v22 = BKStoreBookUpdateLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = [v6 allObjects];
    v24 = [v23 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138412290;
    v42 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Fetching items to filter out unowned ones: [%@]", buf, 0xCu);
  }
  v25 = +[BLJaliscoDAAPClient sharedClient];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100096F50;
  v29[3] = &unk_100A44148;
  id v30 = v6;
  id v31 = self;
  id v26 = v6;
  [v25 fetchItemsForStoreIDs:v26 completion:v29];
}

- (NSURL)bookmarkGetAllUrl
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100006F44;
  uint64_t v10 = sub_10000718C;
  id v11 = 0;
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000971B0;
  v5[3] = &unk_100A44058;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(bagSnapshotAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

- (NSURL)bookmarkSetAllUrl
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100006F44;
  uint64_t v10 = sub_10000718C;
  id v11 = 0;
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100097310;
  v5[3] = &unk_100A44058;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(bagSnapshotAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

- (BOOL)allowCitationForProtectedBooks
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009742C;
  v5[3] = &unk_100A44058;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(bagSnapshotAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isReportConcernEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009754C;
  v5[3] = &unk_100A44170;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(bagSnapshotAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)storesAllowingCitation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_100006F44;
  uint64_t v10 = sub_10000718C;
  id v11 = 0;
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000976CC;
  v5[3] = &unk_100A44058;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(bagSnapshotAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)citationAllowedForStoreFrontID:(unint64_t)a3
{
  id v5 = [(BKStoreController *)self storesAllowingCitation];
  if (v5)
  {
    uint64_t v6 = +[NSNumber numberWithUnsignedLongLong:a3];
    unsigned __int8 v7 = [v5 containsObject:v6];
  }
  else
  {
    unsigned __int8 v7 = [(BKStoreController *)self allowCitationForProtectedBooks];
  }

  return v7;
}

- (void)canCheckForBookUpdatesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_100006F44;
  v26[4] = sub_10000718C;
  id v27 = 0;
  uint64_t v6 = +[BUBag defaultBag];
  unsigned __int8 v7 = [v6 availableBookUpdatesReloadFrequency];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100097AA0;
  v23[3] = &unk_100A44198;
  v25 = v26;
  uint64_t v8 = v5;
  v24 = v8;
  [v7 valueWithCompletion:v23];

  dispatch_group_enter(v8);
  char v9 = +[BUBag defaultBag];
  uint64_t v10 = +[AMSNetworkConstraints networkConstraintsForMediaType:@"ebook" withBag:v9];

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_100006F44;
  v21[4] = sub_10000718C;
  id v22 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100097B44;
  v18[3] = &unk_100A441C0;
  uint64_t v20 = v21;
  id v11 = v8;
  id v19 = v11;
  [v10 addFinishBlock:v18];
  id v12 = dispatch_get_global_queue(17, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100097BA4;
  v14[3] = &unk_100A441E8;
  uint64_t v16 = v21;
  id v17 = v26;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_group_notify(v11, v12, v14);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v26, 8);
}

- (NSURL)tellAFriendEmailBodyURLBase
{
  uint64_t v6 = 0;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_100006F44;
  uint64_t v10 = sub_10000718C;
  id v11 = 0;
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100097D9C;
  v5[3] = &unk_100A44058;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(bagSnapshotAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryAssetProvider);

  return (BKLibraryAssetProvider *)WeakRetained;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (BKLibraryBookUpdateCountOperation)updateCountOperation
{
  return self->_updateCountOperation;
}

- (void)setUpdateCountOperation:(id)a3
{
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_updateCountOperation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_downloadQueueManager);
  objc_destroyWeak((id *)&self->_libraryAssetProvider);
  objc_storeStrong((id *)&self->_snapshotBag, 0);
  objc_storeStrong((id *)&self->_bagSnapshotAccessQueue, 0);
  objc_storeStrong((id *)&self->_storeIDsWithAssetVersionUpdatePendingSync, 0);
  objc_storeStrong((id *)&self->_storeIDsWithAssetVersionUpdatePending, 0);
  objc_storeStrong((id *)&self->_storeIDsWithAvailableUpdatesSync, 0);
  objc_storeStrong((id *)&self->_storeIDsCompletions, 0);

  objc_storeStrong((id *)&self->_storeIDsWithAvailableUpdates, 0);
}

@end