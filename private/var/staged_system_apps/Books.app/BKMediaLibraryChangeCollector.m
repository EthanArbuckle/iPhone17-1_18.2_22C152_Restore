@interface BKMediaLibraryChangeCollector
+ (void)logAssets:(id)a3 message:(id)a4;
- (BKMediaLibraryAssetCache)assetCache;
- (BKMediaLibraryChangeCollector)initWithAssetCache:(id)a3;
- (NSMutableDictionary)added;
- (NSMutableDictionary)removed;
- (NSMutableDictionary)updated;
- (NSMutableSet)afterChangesCacheIDSet;
- (NSMutableSet)beforeChangesCacheIDSet;
- (void)finalizeChangeProcessing;
- (void)setAdded:(id)a3;
- (void)setAfterChangesCacheIDSet:(id)a3;
- (void)setAssetCache:(id)a3;
- (void)setBeforeChangesCacheIDSet:(id)a3;
- (void)setRemoved:(id)a3;
- (void)setUpdated:(id)a3;
@end

@implementation BKMediaLibraryChangeCollector

- (BKMediaLibraryChangeCollector)initWithAssetCache:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BKMediaLibraryChangeCollector;
  v6 = [(BKMediaLibraryChangeCollector *)&v18 init];
  if (v6)
  {
    uint64_t v7 = +[NSMutableDictionary dictionary];
    added = v6->_added;
    v6->_added = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    updated = v6->_updated;
    v6->_updated = (NSMutableDictionary *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionary];
    removed = v6->_removed;
    v6->_removed = (NSMutableDictionary *)v11;

    objc_storeStrong((id *)&v6->_assetCache, a3);
    uint64_t v13 = [v5 mutableCacheIDSet];
    beforeChangesCacheIDSet = v6->_beforeChangesCacheIDSet;
    v6->_beforeChangesCacheIDSet = (NSMutableSet *)v13;

    uint64_t v15 = objc_opt_new();
    afterChangesCacheIDSet = v6->_afterChangesCacheIDSet;
    v6->_afterChangesCacheIDSet = (NSMutableSet *)v15;
  }
  return v6;
}

- (void)finalizeChangeProcessing
{
  v3 = [(BKMediaLibraryChangeCollector *)self beforeChangesCacheIDSet];
  v4 = [(BKMediaLibraryChangeCollector *)self afterChangesCacheIDSet];
  [v3 minusSet:v4];

  id v5 = [(BKMediaLibraryChangeCollector *)self beforeChangesCacheIDSet];
  v6 = +[NSSet setWithSet:v5];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001FE17C;
  v22[3] = &unk_100A4BE08;
  v22[4] = self;
  [v6 enumerateObjectsUsingBlock:v22];
  uint64_t v7 = [(BKMediaLibraryChangeCollector *)self removed];
  id v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = BKLibraryDataSourceMediaLibraryLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1007F0514(self);
    }

    v10 = [(BKMediaLibraryChangeCollector *)self removed];
    uint64_t v11 = [v10 allValues];
    +[BKMediaLibraryChangeCollector logAssets:v11 message:@"removing"];
  }
  v12 = [(BKMediaLibraryChangeCollector *)self added];
  id v13 = [v12 count];

  if (v13)
  {
    v14 = BKLibraryDataSourceMediaLibraryLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1007F0450(self);
    }

    uint64_t v15 = [(BKMediaLibraryChangeCollector *)self added];
    v16 = [v15 allValues];
    +[BKMediaLibraryChangeCollector logAssets:v16 message:@"adding"];
  }
  v17 = [(BKMediaLibraryChangeCollector *)self updated];
  id v18 = [v17 count];

  if (v18)
  {
    v19 = BKLibraryDataSourceMediaLibraryLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_1007F038C(self);
    }

    v20 = [(BKMediaLibraryChangeCollector *)self updated];
    v21 = [v20 allValues];
    +[BKMediaLibraryChangeCollector logAssets:v21 message:@"updating"];
  }
}

- (NSMutableSet)beforeChangesCacheIDSet
{
  return self->_beforeChangesCacheIDSet;
}

- (NSMutableSet)afterChangesCacheIDSet
{
  return self->_afterChangesCacheIDSet;
}

- (NSMutableDictionary)updated
{
  return self->_updated;
}

- (NSMutableDictionary)removed
{
  return self->_removed;
}

- (NSMutableDictionary)added
{
  return self->_added;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removed, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_added, 0);
  objc_storeStrong((id *)&self->_afterChangesCacheIDSet, 0);
  objc_storeStrong((id *)&self->_beforeChangesCacheIDSet, 0);

  objc_storeStrong((id *)&self->_assetCache, 0);
}

+ (void)logAssets:(id)a3 message:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v10);
        v12 = BKLibraryDataSourceMediaLibraryLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          id v13 = [v11 assetID];
          v14 = [v11 title];
          *(_DWORD *)buf = 138543874;
          id v20 = v6;
          __int16 v21 = 2112;
          v22 = v13;
          __int16 v23 = 2112;
          v24 = v14;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}@ assetID: %@, title: %@", buf, 0x20u);
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v8);
  }
}

- (BKMediaLibraryAssetCache)assetCache
{
  return self->_assetCache;
}

- (void)setAssetCache:(id)a3
{
}

- (void)setBeforeChangesCacheIDSet:(id)a3
{
}

- (void)setAfterChangesCacheIDSet:(id)a3
{
}

- (void)setAdded:(id)a3
{
}

- (void)setUpdated:(id)a3
{
}

- (void)setRemoved:(id)a3
{
}

@end