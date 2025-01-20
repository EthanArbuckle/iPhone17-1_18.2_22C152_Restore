@interface BKMediaLibraryBookletAssetCache
- (BKMediaLibraryBookletAssetCache)init;
- (NSMutableDictionary)bookletAssetIdToBookletAssetMapping;
- (NSMutableDictionary)parentAssetIdToBookletAssetIdMapping;
- (id)allBookletAssetIDs;
- (id)allBookletAssets;
- (id)bookletAssetForAssetID:(id)a3;
- (id)bookletAssetsForParentAssetID:(id)a3;
- (id)popBookletAssetsForParentAssetID:(id)a3;
- (id)popBookletAssetsWithAssetIDs:(id)a3 forParentAssetID:(id)a4;
- (void)addBookletAsset:(id)a3;
- (void)setBookletAssetIdToBookletAssetMapping:(id)a3;
- (void)setParentAssetIdToBookletAssetIdMapping:(id)a3;
@end

@implementation BKMediaLibraryBookletAssetCache

- (BKMediaLibraryBookletAssetCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKMediaLibraryBookletAssetCache;
  v2 = [(BKMediaLibraryBookletAssetCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    bookletAssetIdToBookletAssetMapping = v2->_bookletAssetIdToBookletAssetMapping;
    v2->_bookletAssetIdToBookletAssetMapping = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    parentAssetIdToBookletAssetIdMapping = v2->_parentAssetIdToBookletAssetIdMapping;
    v2->_parentAssetIdToBookletAssetIdMapping = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)allBookletAssetIDs
{
  v2 = [(BKMediaLibraryBookletAssetCache *)self bookletAssetIdToBookletAssetMapping];
  uint64_t v3 = [v2 allKeys];

  return v3;
}

- (id)allBookletAssets
{
  v2 = [(BKMediaLibraryBookletAssetCache *)self bookletAssetIdToBookletAssetMapping];
  uint64_t v3 = [v2 allValues];

  return v3;
}

- (id)bookletAssetForAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKMediaLibraryBookletAssetCache *)self bookletAssetIdToBookletAssetMapping];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)bookletAssetsForParentAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKMediaLibraryBookletAssetCache *)self parentAssetIdToBookletAssetIdMapping];
  v19 = v4;
  v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v12);
        v14 = [(BKMediaLibraryBookletAssetCache *)self bookletAssetIdToBookletAssetMapping];
        v15 = [v14 objectForKeyedSubscript:v13];

        if (v15)
        {
          [v7 addObject:v15];
        }
        else
        {
          v16 = BKLibraryDataSourceMediaLibraryLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Could not find a booklet with assetID %@", buf, 0xCu);
          }
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v10);
  }

  id v17 = [v7 copy];

  return v17;
}

- (void)addBookletAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKMediaLibraryBookletAssetCache *)self bookletAssetIdToBookletAssetMapping];
  v6 = [v4 storeID];
  [v5 setObject:v4 forKeyedSubscript:v6];

  id v7 = [v4 parentAsset];
  id v8 = [v7 assetID];

  if (v8)
  {
    id v9 = [(BKMediaLibraryBookletAssetCache *)self parentAssetIdToBookletAssetIdMapping];
    id v10 = [v9 objectForKey:v8];

    if (v10)
    {
      uint64_t v11 = [v4 storeID];
      [v10 addObject:v11];
    }
    else
    {
      id v13 = objc_alloc((Class)NSMutableSet);
      uint64_t v11 = [v4 storeID];
      id v14 = [v13 initWithObjects:v11, 0];
      v15 = [(BKMediaLibraryBookletAssetCache *)self parentAssetIdToBookletAssetIdMapping];
      [v15 setObject:v14 forKeyedSubscript:v8];
    }
  }
  else
  {
    v12 = BKLibraryDataSourceMediaLibraryLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1007E814C((uint64_t)v4, v12);
    }
  }
}

- (id)popBookletAssetsForParentAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKMediaLibraryBookletAssetCache *)self parentAssetIdToBookletAssetIdMapping];
  v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = [v6 copy];

  id v8 = [(BKMediaLibraryBookletAssetCache *)self popBookletAssetsWithAssetIDs:v7 forParentAssetID:v4];

  return v8;
}

- (id)popBookletAssetsWithAssetIDs:(id)a3 forParentAssetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKMediaLibraryBookletAssetCache *)self parentAssetIdToBookletAssetIdMapping];
  long long v23 = v7;
  id v9 = [v8 objectForKeyedSubscript:v7];

  id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v6 count]];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v17 = [(BKMediaLibraryBookletAssetCache *)self bookletAssetIdToBookletAssetMapping];
        v18 = [v17 objectForKeyedSubscript:v16];

        if (v18)
        {
          [v10 addObject:v18];
          v19 = [(BKMediaLibraryBookletAssetCache *)self bookletAssetIdToBookletAssetMapping];
          [v19 removeObjectForKey:v16];

          [v9 removeObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  if (![v9 count])
  {
    long long v20 = [(BKMediaLibraryBookletAssetCache *)self parentAssetIdToBookletAssetIdMapping];
    [v20 removeObjectForKey:v23];
  }
  id v21 = [v10 copy];

  return v21;
}

- (NSMutableDictionary)bookletAssetIdToBookletAssetMapping
{
  return self->_bookletAssetIdToBookletAssetMapping;
}

- (void)setBookletAssetIdToBookletAssetMapping:(id)a3
{
}

- (NSMutableDictionary)parentAssetIdToBookletAssetIdMapping
{
  return self->_parentAssetIdToBookletAssetIdMapping;
}

- (void)setParentAssetIdToBookletAssetIdMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentAssetIdToBookletAssetIdMapping, 0);

  objc_storeStrong((id *)&self->_bookletAssetIdToBookletAssetMapping, 0);
}

@end