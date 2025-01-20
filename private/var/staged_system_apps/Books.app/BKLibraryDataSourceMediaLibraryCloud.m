@interface BKLibraryDataSourceMediaLibraryCloud
+ (id)cloudAudiobooksDataSource;
- (BKLibraryDataSourceMediaLibraryCloud)initWithIdentifier:(id)a3;
- (BKLibraryManager)libraryManager;
- (BKMediaLibraryCache)mediaLibraryCache;
- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5;
- (BOOL)canMakeAssetsLocal;
- (BOOL)canRedownloadAssets;
- (BOOL)examineURL:(id)a3 completion:(id)a4;
- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (BOOL)isEnabled;
- (BOOL)prioritizeImport:(id)a3 completion:(id)a4;
- (BOOL)updateURL:(id)a3 completion:(id)a4;
- (NSString)dataSourceIdentifier;
- (NSString)identifier;
- (int64_t)coverSourceRank;
- (int64_t)rank;
- (void)_addAssetIDsToCacheManager:(id)a3;
- (void)_purchaseSucceeded:(id)a3;
- (void)_removeAssetIDsFromCacheManager:(id)a3;
- (void)accountControllerDidAttemptToRedeemCode:(id)a3;
- (void)assetForLibraryAsset:(id)a3 completion:(id)a4;
- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)dealloc;
- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5;
- (void)fetchAssetIDsWithCompletion:(id)a3;
- (void)fetchAssetsWithCompletion:(id)a3;
- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4;
- (void)fetchReadyPurchaseItemStoreIDs:(id)a3 completion:(id)a4;
- (void)mediaLibraryCacheAddedBookletAssets:(id)a3 removedBookletAssets:(id)a4;
- (void)mediaLibraryCacheAddedCloudAssets:(id)a3 updatedCloudAssets:(id)a4 removedCloudAssets:(id)a5;
- (void)mediaLibraryCacheRequestsReload:(id)a3;
- (void)mostRecentPurchaseDate:(id)a3;
- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setDataSourceIdentifier:(id)a3;
- (void)setLibraryManager:(id)a3;
- (void)setMediaLibraryCache:(id)a3;
- (void)setRank:(int64_t)a3;
- (void)updatePurchaseItemsWithCompletion:(id)a3;
@end

@implementation BKLibraryDataSourceMediaLibraryCloud

- (int64_t)rank
{
  return self->_rank;
}

- (void)mediaLibraryCacheAddedCloudAssets:(id)a3 updatedCloudAssets:(id)a4 removedCloudAssets:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = BKLibraryDataSourceMediaLibraryLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134218496;
    id v19 = [v8 count];
    __int16 v20 = 2048;
    id v21 = [v10 count];
    __int16 v22 = 2048;
    id v23 = [v9 count];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cloud library changed adding %lu, removing %lu, updating %lu audiobooks.", (uint8_t *)&v18, 0x20u);
  }

  if ([v10 count])
  {
    v12 = [(BKLibraryDataSourceMediaLibraryCloud *)self libraryManager];
    [v12 libraryDataSource:self removedAssets:v10];

    [(BKLibraryDataSourceMediaLibraryCloud *)self _removeAssetIDsFromCacheManager:v10];
  }
  if ([v8 count])
  {
    v13 = [(BKLibraryDataSourceMediaLibraryCloud *)self libraryManager];
    [v13 libraryDataSource:self addedAssets:v8];

    [(BKLibraryDataSourceMediaLibraryCloud *)self _addAssetIDsToCacheManager:v8];
  }
  if ([v9 count])
  {
    v14 = +[BCCacheManager defaultCacheManager];
    v15 = [v9 valueForKey:@"assetID"];
    v16 = +[NSSet setWithArray:v15];
    [v14 incrementVersionForIdentifiers:v16];

    v17 = [(BKLibraryDataSourceMediaLibraryCloud *)self libraryManager];
    [v17 libraryDataSource:self updatedAssets:v9];
  }
}

- (void)mediaLibraryCacheAddedBookletAssets:(id)a3 removedBookletAssets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BKLibraryDataSourceMediaLibraryLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218240;
    id v12 = [v6 count];
    __int16 v13 = 2048;
    id v14 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cloud library changed adding %lu, removing %lu booklets.", (uint8_t *)&v11, 0x16u);
  }

  if ([v7 count])
  {
    id v9 = [(BKLibraryDataSourceMediaLibraryCloud *)self libraryManager];
    [v9 libraryDataSource:self removedAssets:v7];

    [(BKLibraryDataSourceMediaLibraryCloud *)self _removeAssetIDsFromCacheManager:v7];
  }
  if ([v6 count])
  {
    id v10 = [(BKLibraryDataSourceMediaLibraryCloud *)self libraryManager];
    [v10 libraryDataSource:self addedAssets:v6];

    [(BKLibraryDataSourceMediaLibraryCloud *)self _addAssetIDsToCacheManager:v6];
  }
}

- (BKLibraryDataSourceMediaLibraryCloud)initWithIdentifier:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  v5 = BKLibraryDataSourceMediaLibraryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1007ED49C((uint64_t)v4, v5);
  }

  v14.receiver = self;
  v14.super_class = (Class)BKLibraryDataSourceMediaLibraryCloud;
  id v6 = [(BKLibraryDataSourceMediaLibraryCloud *)&v14 init];
  if (v6)
  {
    id v7 = (NSString *)[v4 copy];
    dataSourceIdentifier = v6->_dataSourceIdentifier;
    v6->_dataSourceIdentifier = v7;

    uint64_t v9 = +[BKMediaLibraryCache sharedCache];
    mediaLibraryCache = v6->_mediaLibraryCache;
    v6->_mediaLibraryCache = (BKMediaLibraryCache *)v9;

    [(BKMediaLibraryCache *)v6->_mediaLibraryCache addObserver:v6];
    int v11 = +[JSAAccountController sharedController];
    [v11 addObserver:v6];

    id v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v6 selector:"_purchaseSucceeded:" name:BLDownloadQueuePurchaseSucceededNotification object:0];
  }
  kdebug_trace();

  return v6;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setLibraryManager:(id)a3
{
}

- (NSString)identifier
{
  return self->_dataSourceIdentifier;
}

+ (id)cloudAudiobooksDataSource
{
  v2 = [[BKLibraryDataSourceMediaLibraryCloud alloc] initWithIdentifier:@"com.apple.ibooks.datasource.audiobooks.cloud"];

  return v2;
}

- (void)dealloc
{
  v3 = BKLibraryDataSourceMediaLibraryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1007EF03C();
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:BLDownloadQueuePurchaseSucceededNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryDataSourceMediaLibraryCloud;
  [(BKLibraryDataSourceMediaLibraryCloud *)&v5 dealloc];
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)mostRecentPurchaseDate:(id)a3
{
  id v4 = a3;
  +[BCStopWatch stopwatch];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C8000;
  v7[3] = &unk_100A467D8;
  v7[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [(BKLibraryDataSourceMediaLibraryCloud *)self fetchAssetIDsWithCompletion:v7];
}

- (void)mediaLibraryCacheRequestsReload:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourceMediaLibraryCloud *)self libraryManager];
  [v5 reloadDataSource:self completion:v4];
}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourceMediaLibraryCloud *)self mediaLibraryCache];
  [v5 fetchAssetIDsOfType:1 includeBooklets:1 completion:v4];
}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKLibraryDataSourceMediaLibraryCloud *)self mediaLibraryCache];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C8540;
  v10[3] = &unk_100A46800;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchAssetsWithIDs:v7 type:1 includeBooklets:1 completion:v10];
}

- (void)fetchAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourceMediaLibraryCloud *)self mediaLibraryCache];
  [v5 fetchAssetsOfType:1 includeBooklets:1 completion:v4];
}

- (void)_addAssetIDsToCacheManager:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 assetID:v16];
        if (v12) {
          [v11 assetID];
        }
        else {
        __int16 v13 = [v11 temporaryAssetID];
        }

        objc_super v14 = +[BKCoverCacheURLSchemeHandler urlStringForAssetID:v13 dataSourceID:self->_dataSourceIdentifier];
        [v5 setObject:v14 forKeyedSubscript:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    v15 = +[BCCacheManager defaultCacheManager];
    [v15 addURLs:v5 priority:3 quality:202 expiresAfter:0];
  }
}

- (void)_removeAssetIDsFromCacheManager:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 assetID:v16];
        if (v12) {
          [v11 assetID];
        }
        else {
        __int16 v13 = [v11 temporaryAssetID];
        }

        objc_super v14 = +[BKCoverCacheURLSchemeHandler urlStringForAssetID:v13 dataSourceID:self->_dataSourceIdentifier];
        [v5 setObject:v14 forKeyedSubscript:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    v15 = +[BCCacheManager defaultCacheManager];
    [v15 removeURLs:v5 priority:3 quality:202];
  }
}

- (int64_t)coverSourceRank
{
  return 3;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(BKLibraryDataSourceMediaLibraryCloud *)self mediaLibraryCache];
  [v9 bookCoverForLibraryAssetProperties:v8 type:1 completion:v7];
}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, uint64_t, void))v5 + 2))(v5, 1, 0);
    id v5 = v6;
  }
}

- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5
{
  return 0;
}

- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  return 0;
}

- (BOOL)updateURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)examineURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = BKLibraryDataSourceMediaLibraryLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1007EF07C();
  }

  id v12 = [(BKLibraryDataSourceMediaLibraryCloud *)self mediaLibraryCache];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001C8BDC;
  v16[3] = &unk_100A4A620;
  id v17 = v8;
  long long v18 = self;
  id v19 = v9;
  id v20 = v10;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  [v12 assetForLibraryAsset:v15 type:1 completion:v16];
}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKLibraryDataSourceMediaLibraryCloud *)self mediaLibraryCache];
  [v8 assetForLibraryAsset:v7 type:1 completion:v6];
}

- (BOOL)prioritizeImport:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)canRedownloadAssets
{
  return 1;
}

- (BOOL)canMakeAssetsLocal
{
  return 1;
}

- (void)_purchaseSucceeded:(id)a3
{
  v3 = [a3 userInfo];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:BLDownloadQueuePropertyIsPurchase];
    objc_opt_class();
    id v6 = BUDynamicCast();
    if ([v6 BOOLValue])
    {
      objc_opt_class();
      id v7 = [v4 objectForKeyedSubscript:BLDownloadQueuePropertyStoreItemIdentifier];
      uint64_t v8 = BUDynamicCast();
      id v9 = (void *)v8;
      id v10 = &off_100A82EE8;
      if (v8) {
        id v10 = (_UNKNOWN **)v8;
      }
      id v11 = v10;

      id v12 = BKLibraryDataSourceMediaLibraryLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Purchased completed, updating media library jalisco with adamId %@", (uint8_t *)&v14, 0xCu);
      }

      id v13 = +[MPCloudController sharedCloudController];
      [v13 updateJaliscoMediaLibraryWithReason:1 completionHandler:&stru_100A4A640];
    }
  }
  else
  {
    id v5 = BKLibraryItemStateProviderLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1007EF148();
    }
  }
}

- (void)accountControllerDidAttemptToRedeemCode:(id)a3
{
  id v3 = +[MPCloudController sharedCloudController];
  [v3 updateJaliscoMediaLibraryWithReason:1 completionHandler:&stru_100A4A660];
}

- (void)fetchReadyPurchaseItemStoreIDs:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v16 = a4;
  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
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
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v11);
        uint64_t v13 = BUStoreIdFromObject();
        if (v13)
        {
          int v14 = +[NSNumber numberWithUnsignedLongLong:v13];
          [v6 addObject:v14];
        }
        else
        {
          int v14 = BKLibraryDataSourceMediaLibraryLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 141558274;
            uint64_t v24 = 1752392040;
            __int16 v25 = 2112;
            uint64_t v26 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "fetchReadyPurchaseItemStoreIDs - Failed to parse '%{mask.hash}@'", buf, 0x16u);
          }
        }

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v9);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001C9800;
  v17[3] = &unk_100A4A688;
  id v18 = v16;
  id v15 = v16;
  +[BKMusicLibraryUtilities storeIDsWithNonEmptyPurchasedToken:v6 completion:v17];
}

- (void)updatePurchaseItemsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[MPCloudController sharedCloudController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001C9A14;
  v6[3] = &unk_100A44638;
  id v7 = v3;
  id v5 = v3;
  [v4 updateJaliscoMediaLibraryWithReason:1 completionHandler:v6];
}

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (NSString)dataSourceIdentifier
{
  return self->_dataSourceIdentifier;
}

- (void)setDataSourceIdentifier:(id)a3
{
}

- (BKMediaLibraryCache)mediaLibraryCache
{
  return self->_mediaLibraryCache;
}

- (void)setMediaLibraryCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibraryCache, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);

  objc_destroyWeak((id *)&self->_libraryManager);
}

@end