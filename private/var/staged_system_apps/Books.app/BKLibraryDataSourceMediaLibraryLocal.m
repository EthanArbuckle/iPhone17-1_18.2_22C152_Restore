@interface BKLibraryDataSourceMediaLibraryLocal
+ (id)localAudiobooksDataSource;
- (BKLibraryDataSourceMediaLibraryLocal)initWithIdentifier:(id)a3;
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
- (void)_removeAssetIDsFromCacheManager:(id)a3;
- (void)assetAccountIdentifiersForAssetID:(id)a3 storeID:(id)a4 path:(id)a5 completion:(id)a6;
- (void)assetForLibraryAsset:(id)a3 completion:(id)a4;
- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)dealloc;
- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5;
- (void)fetchAssetIDsWithCompletion:(id)a3;
- (void)fetchAssetsWithCompletion:(id)a3;
- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4;
- (void)mediaLibraryCacheAddedLocalAssets:(id)a3 updatedLocalAssets:(id)a4 removedLocalAssets:(id)a5;
- (void)mediaLibraryCacheRequestsReload:(id)a3;
- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setDataSourceIdentifier:(id)a3;
- (void)setLibraryManager:(id)a3;
- (void)setMediaLibraryCache:(id)a3;
- (void)setRank:(int64_t)a3;
@end

@implementation BKLibraryDataSourceMediaLibraryLocal

- (int64_t)rank
{
  return self->_rank;
}

- (void)mediaLibraryCacheAddedLocalAssets:(id)a3 updatedLocalAssets:(id)a4 removedLocalAssets:(id)a5
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
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Local library changed adding %lu, removing %lu, updating %lu.", (uint8_t *)&v18, 0x20u);
  }

  if ([v10 count])
  {
    v12 = [(BKLibraryDataSourceMediaLibraryLocal *)self libraryManager];
    [v12 libraryDataSource:self removedAssets:v10];

    [(BKLibraryDataSourceMediaLibraryLocal *)self _removeAssetIDsFromCacheManager:v10];
  }
  if ([v8 count])
  {
    v13 = [(BKLibraryDataSourceMediaLibraryLocal *)self libraryManager];
    [v13 libraryDataSource:self addedAssets:v8];

    [(BKLibraryDataSourceMediaLibraryLocal *)self _addAssetIDsToCacheManager:v8];
  }
  if ([v9 count])
  {
    v14 = +[BCCacheManager defaultCacheManager];
    v15 = [v9 valueForKey:@"assetID"];
    v16 = +[NSSet setWithArray:v15];
    [v14 incrementVersionForIdentifiers:v16];

    v17 = [(BKLibraryDataSourceMediaLibraryLocal *)self libraryManager];
    [v17 libraryDataSource:self updatedAssets:v9];
  }
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setLibraryManager:(id)a3
{
}

- (BKLibraryDataSourceMediaLibraryLocal)initWithIdentifier:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  v5 = BKLibraryDataSourceMediaLibraryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1007ED49C((uint64_t)v4, v5);
  }

  v12.receiver = self;
  v12.super_class = (Class)BKLibraryDataSourceMediaLibraryLocal;
  v6 = [(BKLibraryDataSourceMediaLibraryLocal *)&v12 init];
  if (v6)
  {
    v7 = (NSString *)[v4 copy];
    dataSourceIdentifier = v6->_dataSourceIdentifier;
    v6->_dataSourceIdentifier = v7;

    uint64_t v9 = +[BKMediaLibraryCache sharedCache];
    mediaLibraryCache = v6->_mediaLibraryCache;
    v6->_mediaLibraryCache = (BKMediaLibraryCache *)v9;

    [(BKMediaLibraryCache *)v6->_mediaLibraryCache addObserver:v6];
  }
  kdebug_trace();

  return v6;
}

- (NSString)identifier
{
  return self->_dataSourceIdentifier;
}

+ (id)localAudiobooksDataSource
{
  v2 = [[BKLibraryDataSourceMediaLibraryLocal alloc] initWithIdentifier:@"com.apple.ibooks.datasource.audiobooks"];

  return v2;
}

- (void)dealloc
{
  v3 = BKLibraryDataSourceMediaLibraryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1007ED514(v3);
  }

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryDataSourceMediaLibraryLocal;
  [(BKLibraryDataSourceMediaLibraryLocal *)&v4 dealloc];
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)mediaLibraryCacheRequestsReload:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourceMediaLibraryLocal *)self libraryManager];
  [v5 reloadDataSource:self completion:v4];
}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourceMediaLibraryLocal *)self mediaLibraryCache];
  [v5 fetchAssetIDsOfType:0 completion:v4];
}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKLibraryDataSourceMediaLibraryLocal *)self mediaLibraryCache];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100157740;
  v10[3] = &unk_100A46800;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchAssetsWithIDs:v7 type:0 completion:v10];
}

- (void)fetchAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourceMediaLibraryLocal *)self mediaLibraryCache];
  [v5 fetchAssetsOfType:0 completion:v4];
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
        objc_super v12 = objc_msgSend(v11, "assetID", (void)v16);
        v13 = +[BKCoverCacheURLSchemeHandler urlStringForAssetID:v12 dataSourceID:self->_dataSourceIdentifier];
        v14 = [v11 assetID];
        [v5 setObject:v13 forKeyedSubscript:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    v15 = +[BCCacheManager defaultCacheManager];
    [v15 addURLs:v5 priority:3 quality:206 expiresAfter:0];
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
        objc_super v12 = [v11 assetID:v16];
        v13 = +[BKCoverCacheURLSchemeHandler urlStringForAssetID:v12 dataSourceID:self->_dataSourceIdentifier];
        v14 = [v11 assetID];
        [v5 setObject:v13 forKeyedSubscript:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    v15 = +[BCCacheManager defaultCacheManager];
    [v15 removeURLs:v5 priority:3 quality:206];
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
  id v9 = [(BKLibraryDataSourceMediaLibraryLocal *)self mediaLibraryCache];
  [v9 bookCoverForLibraryAssetProperties:v8 type:0 completion:v7];
}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = BKLibraryDataSourceMediaLibraryLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v16 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Deleting %lu media library assets", buf, 0xCu);
  }

  id v11 = [(BKLibraryDataSourceMediaLibraryLocal *)self mediaLibraryCache];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100157D74;
  v13[3] = &unk_100A48788;
  v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  [v11 deleteAssets:v8 type:0 exhaustive:v6 completion:v13];
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
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
    id v5 = v6;
  }
}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKLibraryDataSourceMediaLibraryLocal *)self mediaLibraryCache];
  [v8 assetForLibraryAsset:v7 type:0 completion:v6];
}

- (BOOL)prioritizeImport:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)canRedownloadAssets
{
  return 0;
}

- (BOOL)canMakeAssetsLocal
{
  return 0;
}

- (void)assetAccountIdentifiersForAssetID:(id)a3 storeID:(id)a4 path:(id)a5 completion:(id)a6
{
  id v7 = a4;
  id v8 = a6;
  if ([v7 length])
  {
    id v9 = +[MPMediaQuery bk_audiobooksQuery];
    if (v9 && [v7 length])
    {
      id v10 = +[MPMediaPropertyPredicate predicateWithValue:v7 forProperty:MPMediaItemPropertyStorePlaylistID];
      id v11 = +[MPMediaPropertyPredicate predicateWithValue:v7 forProperty:MPMediaItemPropertyStoreID];
      v59[0] = v10;
      v59[1] = v11;
      id v12 = +[NSArray arrayWithObjects:v59 count:2];
      v13 = +[MPMediaCompoundAnyPredicate predicateMatchingPredicates:v12];
      [v9 addFilterPredicate:v13];

      [v9 setGroupingType:1];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id obj = [v9 collections];
      id v48 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v48)
      {
        v39 = v11;
        v40 = v10;
        v41 = v9;
        id v42 = v8;
        uint64_t v47 = *(void *)v54;
        uint64_t v46 = MPMediaItemPropertyStoreAccountID;
        uint64_t v45 = MPMediaItemPropertyStoreDownloaderAccountID;
        uint64_t v44 = MPMediaItemPropertyStoreFamilyAccountID;
        do
        {
          for (i = 0; i != v48; i = (char *)i + 1)
          {
            if (*(void *)v54 != v47) {
              objc_enumerationMutation(obj);
            }
            v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            id v16 = [v15 items:v39, v40, v41, v42];
            id v17 = [v16 countByEnumeratingWithState:&v49 objects:v57 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v50;
LABEL_11:
              uint64_t v20 = 0;
              while (1)
              {
                if (*(void *)v50 != v19) {
                  objc_enumerationMutation(v16);
                }
                id v21 = *(void **)(*((void *)&v49 + 1) + 8 * v20);
                __int16 v22 = [v21 bk_storeID];
                id v23 = [v22 stringValue];
                unsigned __int8 v24 = [v7 isEqualToString:v23];

                if (v24) {
                  break;
                }
                if (v18 == (id)++v20)
                {
                  id v18 = [v16 countByEnumeratingWithState:&v49 objects:v57 count:16];
                  if (v18) {
                    goto LABEL_11;
                  }
                  goto LABEL_17;
                }
              }
              objc_opt_class();
              v25 = [v21 valueForProperty:v46];
              v26 = BUDynamicCast();

              objc_opt_class();
              v27 = [v21 valueForProperty:v45];
              v28 = BUDynamicCast();

              objc_opt_class();
              v29 = [v21 valueForProperty:v44];
              v30 = BUDynamicCast();

              v31 = objc_opt_new();
              v32 = [v26 bkdsml_nonZeroString];
              [v31 setPurchasedDSID:v32];

              v33 = [v28 bkdsml_nonZeroString];
              [v31 setDownloadedDSID:v33];

              v34 = [v30 bkdsml_nonZeroString];
              [v31 setFamilyID:v34];

              if (v31) {
                goto LABEL_22;
              }
            }
            else
            {
LABEL_17:
            }
          }
          id v48 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v48);
        v31 = 0;
LABEL_22:
        id v9 = v41;
        id v8 = v42;
        id v11 = v39;
        id v10 = v40;
      }
      else
      {
        v31 = 0;
      }
    }
    else
    {
      v31 = 0;
    }
    id v37 = objc_retainBlock(v8);
    v38 = v37;
    if (v37) {
      (*((void (**)(id, void *, void))v37 + 2))(v37, v31, 0);
    }
  }
  else
  {
    id v35 = objc_retainBlock(v8);
    v36 = v35;
    if (v35) {
      (*((void (**)(id, void, void))v35 + 2))(v35, 0, 0);
    }
  }
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