@interface BKMediaLibraryAssetCache
- (BKMediaLibraryAssetCache)initWithDataSourceIdentifier:(id)a3;
- (NSArray)cachedAssetIDs;
- (NSArray)cachedAssets;
- (NSMutableDictionary)assetCacheByAssetID;
- (NSMutableDictionary)assetCacheByCacheID;
- (NSString)dataSourceIdentifier;
- (id)assetFromAssetID:(id)a3;
- (id)assetFromCacheID:(id)a3;
- (id)assetsFromAssetIDs:(id)a3;
- (id)description;
- (id)mutableCacheIDSet;
- (void)assetForLibraryAsset:(id)a3 completion:(id)a4;
- (void)cacheAsset:(id)a3 cacheID:(id)a4;
- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5;
- (void)fetchBookCoverForAssetProperties:(id)a3 completion:(id)a4;
- (void)setAssetCacheByAssetID:(id)a3;
- (void)setAssetCacheByCacheID:(id)a3;
- (void)uncacheAllAssets;
- (void)uncacheAsset:(id)a3 cacheID:(id)a4;
@end

@implementation BKMediaLibraryAssetCache

- (id)mutableCacheIDSet
{
  v2 = [(BKMediaLibraryAssetCache *)self assetCacheByCacheID];
  v3 = [v2 allKeys];
  v4 = +[NSMutableSet setWithArray:v3];

  return v4;
}

- (NSMutableDictionary)assetCacheByCacheID
{
  return self->_assetCacheByCacheID;
}

- (void)uncacheAllAssets
{
  v3 = [(BKMediaLibraryAssetCache *)self assetCacheByAssetID];
  [v3 removeAllObjects];

  id v4 = [(BKMediaLibraryAssetCache *)self assetCacheByCacheID];
  [v4 removeAllObjects];
}

- (NSMutableDictionary)assetCacheByAssetID
{
  return self->_assetCacheByAssetID;
}

- (BKMediaLibraryAssetCache)initWithDataSourceIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKMediaLibraryAssetCache;
  v5 = [(BKMediaLibraryAssetCache *)&v13 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    dataSourceIdentifier = v5->_dataSourceIdentifier;
    v5->_dataSourceIdentifier = v6;

    uint64_t v8 = objc_opt_new();
    assetCacheByAssetID = v5->_assetCacheByAssetID;
    v5->_assetCacheByAssetID = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    assetCacheByCacheID = v5->_assetCacheByCacheID;
    v5->_assetCacheByCacheID = (NSMutableDictionary *)v10;
  }
  return v5;
}

- (NSArray)cachedAssets
{
  v2 = [(BKMediaLibraryAssetCache *)self assetCacheByAssetID];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSArray)cachedAssetIDs
{
  v2 = [(BKMediaLibraryAssetCache *)self assetCacheByAssetID];
  v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (id)assetFromCacheID:(id)a3
{
  id v4 = a3;
  v5 = [(BKMediaLibraryAssetCache *)self assetCacheByCacheID];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)assetFromAssetID:(id)a3
{
  id v4 = a3;
  v5 = [(BKMediaLibraryAssetCache *)self assetCacheByAssetID];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)assetsFromAssetIDs:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [(BKMediaLibraryAssetCache *)self assetCacheByAssetID];
        objc_super v13 = [v12 objectForKeyedSubscript:v11];

        if (v13) {
          [v5 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)cacheAsset:(id)a3 cacheID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v11 assetID];

  if (v7)
  {
    id v8 = [(BKMediaLibraryAssetCache *)self assetCacheByAssetID];
    uint64_t v9 = [v11 assetID];
    [v8 setObject:v11 forKeyedSubscript:v9];
  }
  uint64_t v10 = [(BKMediaLibraryAssetCache *)self assetCacheByCacheID];
  [v10 setObject:v11 forKeyedSubscript:v6];
}

- (void)uncacheAsset:(id)a3 cacheID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v11 assetID];

  if (v7)
  {
    id v8 = [(BKMediaLibraryAssetCache *)self assetCacheByAssetID];
    uint64_t v9 = [v11 assetID];
    [v8 setObject:0 forKeyedSubscript:v9];
  }
  uint64_t v10 = [(BKMediaLibraryAssetCache *)self assetCacheByCacheID];
  [v10 setObject:0 forKeyedSubscript:v6];
}

- (void)fetchBookCoverForAssetProperties:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectForKey:@"assetID"];
  if ([v7 length])
  {
    id v8 = [(BKMediaLibraryAssetCache *)self assetFromAssetID:v7];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 representativeItem];
      id v11 = [v10 artworkCatalog];

      if (v11)
      {
        [v11 setFittingSize:1.79769313e308, 1.79769313e308];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_100155240;
        v29[3] = &unk_100A46550;
        id v30 = v7;
        id v31 = v6;
        [v11 requestImageWithCompletion:v29];

        v12 = v30;
      }
      else
      {
        v21 = BKLibraryDataSourceMediaLibraryLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1007ED28C((uint64_t)v7, v21, v22, v23, v24, v25, v26, v27);
        }

        id v28 = objc_retainBlock(v6);
        v12 = v28;
        if (v28) {
          (*((void (**)(id, void, void, void))v28 + 2))(v28, 0, 0, 0);
        }
      }
    }
    else
    {
      v14 = BKLibraryDataSourceMediaLibraryLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1007ED220((uint64_t)v7, v14, v15, v16, v17, v18, v19, v20);
      }

      id v11 = (void (**)(void, void, void, void))objc_retainBlock(v6);
      if (!v11) {
        goto LABEL_16;
      }
      v12 = +[NSError errorWithDomain:kBKLibraryDataSourceDomain code:kBKLibraryDataSourceErrorAssetIDNotInCacheError userInfo:0];
      ((void (**)(void, void, void, void *))v11)[2](v11, 0, 0, v12);
    }

LABEL_16:
    goto LABEL_17;
  }
  id v13 = objc_retainBlock(v6);
  uint64_t v9 = v13;
  if (v13) {
    (*((void (**)(id, void, void, void))v13 + 2))(v13, 0, 0, 0);
  }
LABEL_17:
}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = BKLibraryDataSourceMediaLibraryLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1007ED3EC(v9);
  }

  uint64_t v10 = +[NSMutableArray array];
  id v11 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v8 count]);
  +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v8 count]);
  v43 = _NSConcreteStackBlock;
  uint64_t v44 = 3221225472;
  v45 = sub_100155690;
  v46 = &unk_100A44238;
  v47 = self;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v48 = v12;
  id v13 = v10;
  id v49 = v13;
  id v14 = v11;
  id v50 = v14;
  [v8 enumerateObjectsUsingBlock:&v43];

  if (objc_msgSend(v13, "count", v43, v44, v45, v46, v47))
  {
    if ([v12 count])
    {
      uint64_t v15 = +[MPMediaQuery bk_audiobooksQuery];
      [v15 setIgnoreSystemFilterPredicates:1];
      if (v15)
      {
        uint64_t v16 = [v12 allObjects];
        uint64_t v17 = +[MPMediaPropertyPredicate predicateWithValue:v16 forProperty:MPMediaItemPropertyStorePlaylistID comparisonType:108];

        [v15 addFilterPredicate:v17];
        uint64_t v18 = +[MPMediaLibrary defaultMediaLibrary];
        uint64_t v19 = [v15 items];
        id v20 = [v18 removeItems:v19];

        v21 = BKLibraryDataSourceMediaLibraryLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          sub_1007ED368((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);
        }
      }
      else
      {
        LODWORD(v20) = 0;
      }
    }
    else
    {
      LODWORD(v20) = 0;
    }
    BOOL v28 = v20 != 0;
    if ([v14 count])
    {
      v29 = +[MPMediaQuery bk_audiobooksQuery];
      [v29 setIgnoreSystemFilterPredicates:1];
      if (v29)
      {
        id v30 = [v14 allObjects];
        id v31 = +[MPMediaPropertyPredicate predicateWithValue:v30 forProperty:MPMediaItemPropertyAlbumPersistentID comparisonType:108];

        [v29 addFilterPredicate:v31];
        v32 = +[MPMediaLibrary defaultMediaLibrary];
        v33 = [v29 items];
        id v20 = [v32 removeItems:v33];

        v34 = BKLibraryDataSourceMediaLibraryLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          sub_1007ED368((uint64_t)v20, v34, v35, v36, v37, v38, v39, v40);
        }
      }
      BOOL v28 = v20 != 0;
    }
  }
  else
  {
    BOOL v28 = 0;
  }
  id v41 = objc_retainBlock(v7);
  v42 = v41;
  if (v41) {
    (*((void (**)(id, BOOL, id, void))v41 + 2))(v41, v28, v13, 0);
  }
}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = [(BKMediaLibraryAssetCache *)self assetFromAssetID:v6];
    uint64_t v9 = BKLibraryDataSourceMediaLibraryLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v8 representativeItem];
      id v11 = [v10 valueForProperty:MPMediaItemPropertyAlbumPersistentID];
      int v14 = 138412802;
      id v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "assetForLibraryAsset:completion:, (asset.assetID = %@) calling completion with asset:%@, albumPersistentID: %@", (uint8_t *)&v14, 0x20u);
    }
    id v12 = (void (**)(void, void, void))objc_retainBlock(v7);

    if (v12) {
      v12[2](v12, v8, 0);
    }
    goto LABEL_10;
  }
  id v13 = BKLibraryDataSourceMediaLibraryLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "assetForLibraryAsset:completion:, (asset.assetID = %@) calling completion with nil asset", (uint8_t *)&v14, 0xCu);
  }

  id v8 = (void (**)(void, void, void))objc_retainBlock(v7);
  if (v8)
  {
    id v12 = +[NSError errorWithDomain:kBKLibraryDataSourceDomain code:kBKLibraryDataSourceErrorAssetIDNotInCacheError userInfo:0];
    v8[2](v8, 0, v12);
LABEL_10:
  }
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(BKMediaLibraryAssetCache *)self dataSourceIdentifier];
  id v6 = [(BKMediaLibraryAssetCache *)self assetCacheByAssetID];
  id v7 = [v6 allKeys];
  id v8 = [(BKMediaLibraryAssetCache *)self assetCacheByAssetID];
  uint64_t v9 = [v8 allValues];
  uint64_t v10 = +[NSString stringWithFormat:@"<%@(%p) dataSourceIdentifier=%@ cachedAssetIDs=%@ cachedAssets=%@>", v4, self, v5, v7, v9];

  return v10;
}

- (NSString)dataSourceIdentifier
{
  return self->_dataSourceIdentifier;
}

- (void)setAssetCacheByAssetID:(id)a3
{
}

- (void)setAssetCacheByCacheID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCacheByCacheID, 0);
  objc_storeStrong((id *)&self->_assetCacheByAssetID, 0);

  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
}

@end