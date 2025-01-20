@interface BKMediaLibraryCache
+ (BKMediaLibraryCache)sharedCache;
- (BKMediaLibraryAssetCache)cloudAssetCache;
- (BKMediaLibraryAssetCache)localAssetCache;
- (BKMediaLibraryBookletAssetCache)bookletAssetCache;
- (BKMediaLibraryCache)init;
- (BOOL)_processAudiobookCollection:(id)a3 fromMediaLibraryChangedNotification:(BOOL)a4;
- (BUCoalescingCallBlock)coalescedReload;
- (NSHashTable)observers;
- (OS_dispatch_queue)dispatchQueue;
- (id)_assetCacheForType:(unint64_t)a3;
- (id)_cacheID:(id)a3;
- (id)_calcSyncAnchor;
- (id)_syncAnchor;
- (id)_syncValidity;
- (id)allBookletAssetIDs;
- (id)description;
- (id)dq_assetFromCacheID:(id)a3 cloudAsset:(BOOL)a4;
- (void)_mediaLibraryDidChange:(id)a3;
- (void)_notifyObserversOfReload:(id)a3;
- (void)_recordSyncAnchor:(id)a3;
- (void)_recordSyncValidity:(id)a3;
- (void)addObserver:(id)a3;
- (void)assetForLibraryAsset:(id)a3 type:(unint64_t)a4 completion:(id)a5;
- (void)bookCoverForLibraryAssetProperties:(id)a3 type:(unint64_t)a4 completion:(id)a5;
- (void)deleteAssets:(id)a3 type:(unint64_t)a4 exhaustive:(BOOL)a5 completion:(id)a6;
- (void)dq_cacheAsset:(id)a3 cacheID:(id)a4;
- (void)dq_cacheAssetsFromSubCollection:(id)a3 assetCache:(id)a4 includeBooklets:(BOOL)a5;
- (void)dq_performInitialFetch;
- (void)dq_processAndCacheBookletItem:(id)a3 parentItem:(id)a4 dataSourceIdentifier:(id)a5;
- (void)dq_processChangesSince:(id)a3 completion:(id)a4;
- (void)dq_processEntity:(id)a3 cloudChangeCollector:(id)a4 localChangeCollector:(id)a5;
- (void)dq_uncacheAllAssets;
- (void)dq_uncacheAsset:(id)a3 cacheID:(id)a4;
- (void)fetchAssetIDsOfType:(unint64_t)a3 completion:(id)a4;
- (void)fetchAssetIDsOfType:(unint64_t)a3 includeBooklets:(BOOL)a4 completion:(id)a5;
- (void)fetchAssetsOfType:(unint64_t)a3 completion:(id)a4;
- (void)fetchAssetsOfType:(unint64_t)a3 includeBooklets:(BOOL)a4 completion:(id)a5;
- (void)fetchAssetsWithIDs:(id)a3 type:(unint64_t)a4 completion:(id)a5;
- (void)fetchAssetsWithIDs:(id)a3 type:(unint64_t)a4 includeBooklets:(BOOL)a5 completion:(id)a6;
- (void)removeObserver:(id)a3;
- (void)setBookletAssetCache:(id)a3;
- (void)setCloudAssetCache:(id)a3;
- (void)setCoalescedReload:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setLocalAssetCache:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation BKMediaLibraryCache

+ (BKMediaLibraryCache)sharedCache
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078E5C;
  block[3] = &unk_100A43EF8;
  block[4] = a1;
  if (qword_100B4A5B0 != -1) {
    dispatch_once(&qword_100B4A5B0, block);
  }
  v2 = (void *)qword_100B4A5A8;

  return (BKMediaLibraryCache *)v2;
}

- (id)_calcSyncAnchor
{
  v3 = +[MPMediaLibrary defaultMediaLibrary];
  v4 = [(BKMediaLibraryCache *)self _syncValidity];
  v5 = [v3 _syncValidity];
  v6 = v5;
  if (v4 && v5 && ![v5 compare:v4])
  {
    v10 = BKLibraryDataSourceMediaLibraryLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1007EEF3C();
    }

    v8 = [(BKMediaLibraryCache *)self _syncAnchor];
  }
  else
  {
    [(BKMediaLibraryCache *)self _recordSyncValidity:v6];
    [(BKMediaLibraryCache *)self _recordSyncAnchor:@"0"];
    v7 = BKLibraryDataSourceMediaLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1007EEFB4();
    }

    v8 = @"0";
  }

  return v8;
}

- (id)_syncValidity
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 stringForKey:@"LibraryDataSourceMediaLibrary.SyncValidity"];

  return v3;
}

- (id)_syncAnchor
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 stringForKey:@"LibraryDataSourceMediaLibrary.SyncAnchor"];

  return v3;
}

- (void)dq_processChangesSince:(id)a3 completion:(id)a4
{
  id v39 = a3;
  id v38 = a4;
  v6 = BKLibraryDataSourceMediaLibraryLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1007EEA28();
  }

  v7 = [BKMediaLibraryChangeCollector alloc];
  v8 = [(BKMediaLibraryCache *)self cloudAssetCache];
  v9 = [(BKMediaLibraryChangeCollector *)v7 initWithAssetCache:v8];

  v10 = [BKMediaLibraryChangeCollector alloc];
  v11 = [(BKMediaLibraryCache *)self localAssetCache];
  v12 = [(BKMediaLibraryChangeCollector *)v10 initWithAssetCache:v11];

  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = sub_1000070E0;
  v68 = sub_10000724C;
  id v69 = 0;
  v13 = +[NSMutableArray array];
  v14 = +[NSMutableArray array];
  v15 = +[MPMediaLibrary defaultMediaLibrary];
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1001BABCC;
  v61[3] = &unk_100A4A1C8;
  v61[4] = self;
  id v16 = v13;
  id v62 = v16;
  v63 = &v64;
  [v15 enumerateEntityChangesAfterSyncAnchor:v39 usingBlock:v61];
  v36 = v15;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v16;
  id v17 = [obj countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v58;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v58 != v18) {
          objc_enumerationMutation(obj);
        }
        [(BKMediaLibraryCache *)self dq_processEntity:*(void *)(*((void *)&v57 + 1) + 8 * i) cloudChangeCollector:v9 localChangeCollector:v12];
      }
      id v17 = [obj countByEnumeratingWithState:&v57 objects:v73 count:16];
    }
    while (v17);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v43 = v14;
  id v20 = [v43 countByEnumeratingWithState:&v53 objects:v72 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v54;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v54 != v21) {
          objc_enumerationMutation(v43);
        }
        [(BKMediaLibraryCache *)self dq_processEntity:*(void *)(*((void *)&v53 + 1) + 8 * (void)j) cloudChangeCollector:v9 localChangeCollector:v12];
      }
      id v20 = [v43 countByEnumeratingWithState:&v53 objects:v72 count:16];
    }
    while (v20);
  }

  v23 = +[MPMediaQuery bk_audiobooksQuery];
  [v23 setIgnoreSystemFilterPredicates:1];
  v37 = v23;
  if (v23)
  {
    [v23 setGroupingType:1];
    [v23 collections];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    id v24 = [v40 countByEnumeratingWithState:&v49 objects:v71 count:16];
    if (v24)
    {
      uint64_t v41 = *(void *)v50;
      do
      {
        id v42 = v24;
        for (k = 0; k != v42; k = (char *)k + 1)
        {
          if (*(void *)v50 != v41) {
            objc_enumerationMutation(v40);
          }
          v26 = *(void **)(*((void *)&v49 + 1) + 8 * (void)k);
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          v27 = [v26 items];
          id v28 = [v27 countByEnumeratingWithState:&v45 objects:v70 count:16];
          if (v28)
          {
            uint64_t v29 = *(void *)v46;
            do
            {
              for (m = 0; m != v28; m = (char *)m + 1)
              {
                if (*(void *)v46 != v29) {
                  objc_enumerationMutation(v27);
                }
                v31 = *(void **)(*((void *)&v45 + 1) + 8 * (void)m);
                v32 = [(BKMediaLibraryCache *)self _cacheID:v31];
                if (objc_msgSend(v31, "bk_isJaliscoAsset")) {
                  [(BKMediaLibraryChangeCollector *)v9 afterChangesCacheIDSet];
                }
                else {
                v33 = [(BKMediaLibraryChangeCollector *)v12 afterChangesCacheIDSet];
                }
                [v33 addObject:v32];
              }
              id v28 = [v27 countByEnumeratingWithState:&v45 objects:v70 count:16];
            }
            while (v28);
          }
        }
        id v24 = [v40 countByEnumeratingWithState:&v49 objects:v71 count:16];
      }
      while (v24);
    }

    [(BKMediaLibraryChangeCollector *)v9 finalizeChangeProcessing];
    [(BKMediaLibraryChangeCollector *)v12 finalizeChangeProcessing];
  }
  if (v65[5]) {
    -[BKMediaLibraryCache _recordSyncAnchor:](self, "_recordSyncAnchor:");
  }
  id v34 = objc_retainBlock(v38);
  v35 = v34;
  if (v34) {
    (*((void (**)(id, BKMediaLibraryChangeCollector *, BKMediaLibraryChangeCollector *, void))v34 + 2))(v34, v9, v12, 0);
  }

  _Block_object_dispose(&v64, 8);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (BKMediaLibraryAssetCache)localAssetCache
{
  return self->_localAssetCache;
}

- (BKMediaLibraryAssetCache)cloudAssetCache
{
  return self->_cloudAssetCache;
}

- (void)dq_uncacheAllAssets
{
  v3 = [(BKMediaLibraryCache *)self localAssetCache];
  [v3 uncacheAllAssets];

  id v4 = [(BKMediaLibraryCache *)self cloudAssetCache];
  [v4 uncacheAllAssets];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(BKMediaLibraryCache *)self dispatchQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100060650;
    v6[3] = &unk_100A43DD8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)_mediaLibraryDidChange:(id)a3
{
  id v4 = [(BKMediaLibraryCache *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061534;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v4, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BKMediaLibraryCache)init
{
  v29.receiver = self;
  v29.super_class = (Class)BKMediaLibraryCache;
  v2 = [(BKMediaLibraryCache *)&v29 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.BKMediaLibraryCache.dispatchQueue", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSHashTable hashTableWithOptions:517];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v6;

    v8 = [[BKMediaLibraryAssetCache alloc] initWithDataSourceIdentifier:@"com.apple.ibooks.datasource.audiobooks.cloud"];
    cloudAssetCache = v2->_cloudAssetCache;
    v2->_cloudAssetCache = v8;

    v10 = [[BKMediaLibraryAssetCache alloc] initWithDataSourceIdentifier:@"com.apple.ibooks.datasource.audiobooks"];
    localAssetCache = v2->_localAssetCache;
    v2->_localAssetCache = v10;

    v12 = objc_alloc_init(BKMediaLibraryBookletAssetCache);
    bookletAssetCache = v2->_bookletAssetCache;
    v2->_bookletAssetCache = v12;

    objc_initWeak(&location, v2);
    id v14 = objc_alloc((Class)BUCoalescingCallBlock);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001B93FC;
    v26[3] = &unk_100A451B8;
    objc_copyWeak(&v27, &location);
    v15 = (BUCoalescingCallBlock *)[v14 initWithNotifyBlock:v26 blockDescription:@"BKMediaLibraryCache"];
    coalescedReload = v2->_coalescedReload;
    v2->_coalescedReload = v15;

    [(BUCoalescingCallBlock *)v2->_coalescedReload setCoalescingDelay:10.0];
    id v17 = +[MPMediaLibrary defaultMediaLibrary];
    uint64_t v18 = +[MPMediaPropertyPredicate predicateWithValue:&off_100A82EA0 forProperty:MPMediaItemPropertyMediaType];
    [v17 addLibraryFilterPredicate:v18];

    v19 = +[NSRunLoop mainRunLoop];
    +[MPMediaLibrary setRunLoopForNotifications:v19];

    id v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v2 selector:"_mediaLibraryDidChange:" name:MPMediaLibraryDidChangeNotification object:0];

    uint64_t v21 = +[MPMediaLibrary defaultMediaLibrary];
    [v21 beginGeneratingLibraryChangeNotifications];

    v22 = v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000790A4;
    block[3] = &unk_100A43F68;
    objc_copyWeak(&v25, &location);
    dispatch_async(v22, block);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dq_performInitialFetch
{
  kdebug_trace();
  v3 = BKLibraryDataSourceMediaLibraryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1007EE9E4(v3);
  }

  dispatch_queue_t v4 = +[MPMediaLibrary defaultMediaLibrary];
  v5 = [v4 _syncValidity];
  [(BKMediaLibraryCache *)self _recordSyncValidity:v5];
  [(BKMediaLibraryCache *)self dq_uncacheAllAssets];
  uint64_t v6 = +[MPMediaQuery bk_audiobooksQuery];
  [v6 setIgnoreSystemFilterPredicates:1];
  if (v6)
  {
    v31 = v5;
    v32 = v4;
    id v7 = +[MPMediaLibrary defaultMediaLibrary];
    [v6 setGroupingType:1];
    objc_super v29 = v7;
    v8 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v7 currentEntityRevision]);
    id v28 = [v8 stringValue];

    v30 = v6;
    [v6 collections];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v36 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v36)
    {
      uint64_t v34 = *(void *)v43;
      v35 = self;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v43 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = v9;
          v10 = *(void **)(*((void *)&v42 + 1) + 8 * v9);
          v11 = +[NSMutableDictionary dictionary];
          v12 = +[NSMutableDictionary dictionary];
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          v13 = [v10 bk_items];
          id v14 = [v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v39;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v39 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                uint64_t v19 = [v18 bk_storeID];
                id v20 = (void *)v19;
                uint64_t v21 = &off_100A82EB8;
                if (v19) {
                  uint64_t v21 = (_UNKNOWN **)v19;
                }
                v22 = v21;

                if (objc_msgSend(v18, "bk_isJaliscoAsset")) {
                  v23 = v11;
                }
                else {
                  v23 = v12;
                }
                id v24 = v23;
                id v25 = [v24 objectForKeyedSubscript:v22];
                if (!v25)
                {
                  id v25 = [[BKAudiobookCollection alloc] initWithStoreID:v22];
                  [v24 setObject:v25 forKeyedSubscript:v22];
                }
                [(BKAudiobookCollection *)v25 addItem:v18];
              }
              id v15 = [v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }
            while (v15);
          }

          self = v35;
          v26 = [(BKMediaLibraryCache *)v35 cloudAssetCache];
          [(BKMediaLibraryCache *)v35 dq_cacheAssetsFromSubCollection:v11 assetCache:v26 includeBooklets:1];

          id v27 = [(BKMediaLibraryCache *)v35 localAssetCache];
          [(BKMediaLibraryCache *)v35 dq_cacheAssetsFromSubCollection:v12 assetCache:v27 includeBooklets:0];

          uint64_t v9 = v37 + 1;
        }
        while ((id)(v37 + 1) != v36);
        id v36 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v36);
    }

    v5 = v31;
    dispatch_queue_t v4 = v32;
    uint64_t v6 = v30;
    if (v28)
    {
      [(BKMediaLibraryCache *)self _recordSyncAnchor:v28];
    }
  }
  kdebug_trace();
}

- (void)_recordSyncValidity:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = BKLibraryDataSourceMediaLibraryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1007EEED4();
  }

  v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setObject:v3 forKey:@"LibraryDataSourceMediaLibrary.SyncValidity"];
}

- (void)_recordSyncAnchor:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = BKLibraryDataSourceMediaLibraryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1007EEE6C();
  }

  v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setObject:v3 forKey:@"LibraryDataSourceMediaLibrary.SyncAnchor"];
}

- (id)_assetCacheForType:(unint64_t)a3
{
  if (a3 == 1) {
    [(BKMediaLibraryCache *)self cloudAssetCache];
  }
  else {
  id v3 = [(BKMediaLibraryCache *)self localAssetCache];
  }

  return v3;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(BKMediaLibraryCache *)self dispatchQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001B9550;
    v6[3] = &unk_100A43DD8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)fetchAssetIDsOfType:(unint64_t)a3 completion:(id)a4
{
}

- (void)fetchAssetIDsOfType:(unint64_t)a3 includeBooklets:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001B96A0;
  v11[3] = &unk_100A4A128;
  id v12 = v8;
  unint64_t v13 = a3;
  BOOL v14 = a4;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(dispatchQueue, v11);
}

- (id)allBookletAssetIDs
{
  v2 = [(BKMediaLibraryCache *)self bookletAssetCache];
  id v3 = [v2 allBookletAssetIDs];

  return v3;
}

- (void)fetchAssetsWithIDs:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001B98D8;
  v13[3] = &unk_100A47670;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)fetchAssetsWithIDs:(id)a3 type:(unint64_t)a4 includeBooklets:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B9A40;
  block[3] = &unk_100A4A150;
  void block[4] = self;
  id v16 = v10;
  BOOL v19 = a5;
  id v17 = v11;
  unint64_t v18 = a4;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(dispatchQueue, block);
}

- (void)fetchAssetsOfType:(unint64_t)a3 includeBooklets:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001B9D48;
  v11[3] = &unk_100A4A128;
  id v12 = v8;
  unint64_t v13 = a3;
  BOOL v14 = a4;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(dispatchQueue, v11);
}

- (void)fetchAssetsOfType:(unint64_t)a3 completion:(id)a4
{
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001B9F40;
  v13[3] = &unk_100A47670;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)deleteAssets:(id)a3 type:(unint64_t)a4 exhaustive:(BOOL)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = [a3 valueForKey:@"assetID"];
  uint64_t v12 = [v11 bu_arrayByRemovingNSNulls];
  unint64_t v13 = (void *)v12;
  id v14 = &__NSArray0__struct;
  if (v12) {
    id v14 = (void *)v12;
  }
  id v15 = v14;

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BA0B8;
  block[3] = &unk_100A4A150;
  void block[4] = self;
  id v20 = v15;
  BOOL v23 = a5;
  id v21 = v10;
  unint64_t v22 = a4;
  id v17 = v10;
  id v18 = v15;
  dispatch_async(dispatchQueue, block);
}

- (void)assetForLibraryAsset:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v9 assetID];
  id v11 = (void *)v10;
  uint64_t v12 = &stru_100A70340;
  if (v10) {
    uint64_t v12 = (__CFString *)v10;
  }
  unint64_t v13 = v12;

  id v14 = [v9 storeID];
  unsigned __int8 v15 = [v9 isSupplementalContent];

  dispatchQueue = self->_dispatchQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001BA254;
  v20[3] = &unk_100A4A178;
  unsigned __int8 v25 = v15;
  v20[4] = self;
  id v21 = v14;
  id v23 = v8;
  unint64_t v24 = a4;
  unint64_t v22 = v13;
  id v17 = v13;
  id v18 = v8;
  id v19 = v14;
  dispatch_async(dispatchQueue, v20);
}

- (void)_notifyObserversOfReload:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  uint64_t v6 = [(BKMediaLibraryCache *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BA440;
  block[3] = &unk_100A43DD8;
  void block[4] = self;
  dispatch_group_t v13 = v5;
  id v7 = v5;
  dispatch_async(v6, block);

  id v8 = [(BKMediaLibraryCache *)self dispatchQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001BA5BC;
  v10[3] = &unk_100A442B8;
  id v11 = v4;
  id v9 = v4;
  dispatch_group_notify(v7, v8, v10);
}

- (void)dq_cacheAssetsFromSubCollection:(id)a3 assetCache:(id)a4 includeBooklets:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v9 = [a3 allValues];
  id v10 = [v9 countByEnumeratingWithState:&v51 objects:v64 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v52;
    uint64_t v43 = MPMediaItemPropertyBooklets;
    *(void *)&long long v11 = 138412290;
    long long v38 = v11;
    uint64_t v42 = *(void *)v52;
    BOOL v41 = v5;
    long long v40 = v9;
    do
    {
      id v14 = 0;
      id v44 = v12;
      do
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(v9);
        }
        unsigned __int8 v15 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v14);
        unint64_t v16 = [v15 items:v38];
        id v17 = [v16 firstObject];

        uint64_t v18 = [(BKMediaLibraryCache *)self _cacheID:v17];
        id v19 = (void *)v18;
        if (v18)
        {
          long long v45 = (void *)v18;
          id v20 = [v15 items];
          unsigned int v21 = [(BKMediaLibraryCache *)self _processAudiobookCollection:v20 fromMediaLibraryChangedNotification:0];

          long long v46 = v17;
          if (v21)
          {
            unint64_t v22 = [v8 dataSourceIdentifier];
            id v23 = +[BKMediaLibraryAsset newAssetFromRepresentativeMediaItem:v17 withDataSourceIdentifier:v22];

            unint64_t v24 = BKLibraryDataSourceMediaLibraryLog();
            unsigned __int8 v25 = v24;
            if (v23)
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                long long v39 = [v23 assetID];
                v35 = [v23 title];
                uint64_t v36 = [v23 dataSourceIdentifier];
                *(_DWORD *)buf = 138413058;
                long long v57 = v45;
                __int16 v58 = 2112;
                long long v59 = v39;
                __int16 v60 = 2112;
                v61 = v35;
                __int16 v62 = 2112;
                uint64_t v63 = v36;
                uint64_t v37 = (void *)v36;
                _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "item added on fetch (cacheID: %@, assetID: %@, title: %@ ds:%@)", buf, 0x2Au);

                id v12 = v44;
              }

              id v19 = v45;
              [(BKMediaLibraryCache *)self dq_cacheAsset:v23 cacheID:v45];
              if (v5)
              {
                unsigned __int8 v25 = [v46 valueForProperty:v43];
                long long v47 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                long long v50 = 0u;
                id v26 = [v25 countByEnumeratingWithState:&v47 objects:v55 count:16];
                if (v26)
                {
                  id v27 = v26;
                  uint64_t v28 = *(void *)v48;
                  do
                  {
                    for (i = 0; i != v27; i = (char *)i + 1)
                    {
                      if (*(void *)v48 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      uint64_t v30 = *(void *)(*((void *)&v47 + 1) + 8 * i);
                      v31 = [v8 dataSourceIdentifier];
                      [(BKMediaLibraryCache *)self dq_processAndCacheBookletItem:v30 parentItem:v23 dataSourceIdentifier:v31];
                    }
                    id v27 = [v25 countByEnumeratingWithState:&v47 objects:v55 count:16];
                  }
                  while (v27);
                  BOOL v5 = v41;
                  id v9 = v40;
                  uint64_t v13 = v42;
                  id v12 = v44;
                }
                goto LABEL_24;
              }
LABEL_26:

              id v17 = v46;
              goto LABEL_27;
            }
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v38;
              long long v57 = v45;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Unable to create asset for (cacheID: %@)", buf, 0xCu);
            }
LABEL_24:
          }
          else
          {
            id v23 = BKLibraryDataSourceMediaLibraryLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              v32 = [v46 bk_assetID];
              v33 = [v46 albumTitle];
              uint64_t v34 = [v8 dataSourceIdentifier];
              *(_DWORD *)buf = 138413058;
              id v19 = v45;
              long long v57 = v45;
              __int16 v58 = 2112;
              long long v59 = v32;
              __int16 v60 = 2112;
              v61 = v33;
              __int16 v62 = 2112;
              uint64_t v63 = (uint64_t)v34;
              _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Skipping partial asset that is not entirely local (cacheID: %@, assetID: %@, title: %@ ds:%@)", buf, 0x2Au);

              uint64_t v13 = v42;
              id v12 = v44;
              goto LABEL_26;
            }
          }
          id v19 = v45;
          goto LABEL_26;
        }
LABEL_27:

        id v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      id v12 = [v9 countByEnumeratingWithState:&v51 objects:v64 count:16];
    }
    while (v12);
  }
}

- (void)dq_processAndCacheBookletItem:(id)a3 parentItem:(id)a4 dataSourceIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v10 storeItemID]);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  long long v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v10 fileSize]);
  id v12 = [BKLibrarySupplementalAsset alloc];
  uint64_t v13 = [v18 stringValue];
  id v14 = [v10 name];
  unsigned __int8 v15 = [v10 redownloadParams];

  unint64_t v16 = [(BKLibrarySupplementalAsset *)v12 initWithParentAsset:v9 dataSourceIdentifier:v8 storeID:v13 title:v14 downloadParams:v15 size:v11];
  id v17 = [(BKMediaLibraryCache *)self bookletAssetCache];
  [v17 addBookletAsset:v16];
}

- (void)dq_processEntity:(id)a3 cloudChangeCollector:(id)a4 localChangeCollector:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [v8 entity];
  objc_opt_class();
  id v12 = BUDynamicCast();
  objc_opt_class();
  uint64_t v13 = BUDynamicCast();
  id v14 = v13;
  if (v12)
  {
    id v15 = [v12 representativeItem];
  }
  else
  {
    id v15 = v13;
  }
  unint64_t v16 = v15;
  if (v15)
  {
    id v17 = [(BKMediaLibraryCache *)self _cacheID:v15];
    if (objc_msgSend(v16, "bk_isJaliscoAsset")) {
      id v18 = v9;
    }
    else {
      id v18 = v10;
    }
    id v19 = v18;
    if (![v17 longLongValue])
    {
      id v23 = BKLibraryDataSourceMediaLibraryLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1007EEA90(v23);
      }
      goto LABEL_26;
    }
    uint64_t v37 = -[BKMediaLibraryCache dq_assetFromCacheID:cloudAsset:](self, "dq_assetFromCacheID:cloudAsset:", v17, [v16 bk_isJaliscoAsset]);
    long long v38 = v19;
    if ([v8 deletionType])
    {
      id v20 = [v19 updated];
      unsigned int v21 = [v20 objectForKeyedSubscript:v17];

      if (v21)
      {
        unint64_t v22 = BKLibraryDataSourceMediaLibraryLog();
        id v23 = v37;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          sub_1007EEE04();
        }
      }
      else
      {
        unint64_t v22 = BKLibraryDataSourceMediaLibraryLog();
        BOOL v26 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
        id v23 = v37;
        if (v37)
        {
          if (v26) {
            sub_1007EED60();
          }

          unint64_t v22 = [v38 updated];
          [v22 setObject:v37 forKeyedSubscript:v17];
        }
        else if (v26)
        {
          sub_1007EECF8();
        }
      }
      goto LABEL_25;
    }
    id v36 = v9;
    unint64_t v24 = [v19 added];
    unsigned __int8 v25 = [v24 objectForKeyedSubscript:v17];
    if (v25)
    {
    }
    else
    {
      v32 = [v19 updated];
      id v27 = [v32 objectForKeyedSubscript:v17];

      if (!v27)
      {
        uint64_t v28 = [v38 assetCache];
        v33 = [v28 dataSourceIdentifier];
        unint64_t v22 = +[BKMediaLibraryAsset newAssetFromRepresentativeMediaItem:v16 withDataSourceIdentifier:v33];

        id v9 = v36;
        if (v22)
        {
          uint64_t v34 = BKLibraryDataSourceMediaLibraryLog();
          BOOL v29 = os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG);
          if (v37)
          {
            if (v29) {
              sub_1007EEBEC();
            }

            uint64_t v30 = [v38 updated];
          }
          else
          {
            if (v29) {
              sub_1007EEB48();
            }

            uint64_t v30 = [v38 added];
          }
          [v30 setObject:v22 forKeyedSubscript:v17];

          [(BKMediaLibraryCache *)self dq_cacheAsset:v22 cacheID:v17];
        }
        else
        {
          v31 = BKLibraryDataSourceMediaLibraryLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_1007EEAD4();
          }
        }
        goto LABEL_24;
      }
    }
    unint64_t v22 = BKLibraryDataSourceMediaLibraryLog();
    id v9 = v36;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_1007EEC90();
    }
LABEL_24:
    id v23 = v37;
LABEL_25:

    id v19 = v38;
LABEL_26:
  }
}

- (BOOL)_processAudiobookCollection:(id)a3 fromMediaLibraryChangedNotification:(BOOL)a4
{
  BOOL v4 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    uint64_t v10 = MPMediaItemPropertyIsLocal;
    int v11 = !v4;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v13, "bk_isJaliscoAsset", (void)v21) & 1) == 0)
        {
          id v14 = [v13 valueForProperty:v10];
          if (v14)
          {
            id v15 = v14;
            unsigned int v16 = [v14 BOOLValue];
            if (((v16 | v11) & 1) == 0)
            {
              id v19 = [(BKMediaLibraryCache *)self coalescedReload];
              [v19 signalWithCompletion:&stru_100A4A1E8];

LABEL_14:
              BOOL v18 = 0;
              goto LABEL_15;
            }
            unsigned int v17 = v16;

            if (!v17) {
              goto LABEL_14;
            }
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_15:

  return v18;
}

- (id)_cacheID:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 bk_storeID];
  if (![v4 longLongValue])
  {
    objc_opt_class();
    BOOL v5 = [v3 valueForProperty:MPMediaItemPropertyAlbumPersistentID];
    uint64_t v6 = BUDynamicCast();

    BOOL v4 = (void *)v6;
  }

  return v4;
}

- (id)dq_assetFromCacheID:(id)a3 cloudAsset:(BOOL)a4
{
  id v6 = a3;
  if (a4) {
    [(BKMediaLibraryCache *)self cloudAssetCache];
  }
  else {
  id v7 = [(BKMediaLibraryCache *)self localAssetCache];
  }
  id v8 = [v7 assetFromCacheID:v6];

  return v8;
}

- (void)dq_cacheAsset:(id)a3 cacheID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 isCloudAsset]) {
    [(BKMediaLibraryCache *)self cloudAssetCache];
  }
  else {
  id v8 = [(BKMediaLibraryCache *)self localAssetCache];
  }
  [v8 cacheAsset:v7 cacheID:v6];
}

- (void)dq_uncacheAsset:(id)a3 cacheID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 isCloudAsset]) {
    [(BKMediaLibraryCache *)self cloudAssetCache];
  }
  else {
  id v8 = [(BKMediaLibraryCache *)self localAssetCache];
  }
  [v8 uncacheAsset:v7 cacheID:v6];
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  BOOL v5 = [(BKMediaLibraryCache *)self localAssetCache];
  id v6 = [(BKMediaLibraryCache *)self cloudAssetCache];
  id v7 = +[NSString stringWithFormat:@"<%@(%p) localAudiobookCache=%@ cloudAudiobookCache=%@>", v4, self, v5, v6];

  return v7;
}

- (void)setLocalAssetCache:(id)a3
{
}

- (void)setCloudAssetCache:(id)a3
{
}

- (BKMediaLibraryBookletAssetCache)bookletAssetCache
{
  return self->_bookletAssetCache;
}

- (void)setBookletAssetCache:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedReload
{
  return self->_coalescedReload;
}

- (void)setCoalescedReload:(id)a3
{
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_coalescedReload, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bookletAssetCache, 0);
  objc_storeStrong((id *)&self->_cloudAssetCache, 0);

  objc_storeStrong((id *)&self->_localAssetCache, 0);
}

@end