@interface MBCKRestoreFilePrefetchEngine
- (BOOL)_updateCacheWithFile:(id)a3;
- (BOOL)setUpWithError:(id *)a3;
- (MBCKCache)cache;
- (MBCKDevice)device;
- (MBCKOperationTracker)ckOperationTracker;
- (MBCKRestoreEngine)parentEngine;
- (MBCKRestoreFilePrefetchEngine)initWithRestoreEngine:(id)a3;
- (MBDomainManager)domainManager;
- (NSMutableArray)batchRecordIDs;
- (OS_dispatch_group)group;
- (OS_dispatch_semaphore)concurrencySemaphore;
- (int64_t)concurrencyLimit;
- (unint64_t)batchSize;
- (unint64_t)maxBatchAssetSize;
- (unint64_t)maxBatchCount;
- (void)_prefetchBatch;
- (void)dealloc;
- (void)prefetchRecord:(id)a3;
- (void)setBatchRecordIDs:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setCache:(id)a3;
- (void)setCkOperationTracker:(id)a3;
- (void)setConcurrencyLimit:(int64_t)a3;
- (void)setConcurrencySemaphore:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDomainManager:(id)a3;
- (void)setGroup:(id)a3;
- (void)setMaxBatchAssetSize:(unint64_t)a3;
- (void)setMaxBatchCount:(unint64_t)a3;
- (void)setParentEngine:(id)a3;
- (void)waitForPrefetchCompletion;
@end

@implementation MBCKRestoreFilePrefetchEngine

- (MBCKRestoreFilePrefetchEngine)initWithRestoreEngine:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKRestoreFilePrefetchEngine initWithRestoreEngine:]", "MBCKRestoreFilePrefetchEngine.m", 45, "engine");
  }
  v5 = v4;
  uint64_t v6 = [v4 ckOperationTracker];
  if (!v6) {
    __assert_rtn("-[MBCKRestoreFilePrefetchEngine initWithRestoreEngine:]", "MBCKRestoreFilePrefetchEngine.m", 47, "tracker");
  }
  v7 = (void *)v6;
  v24.receiver = self;
  v24.super_class = (Class)MBCKRestoreFilePrefetchEngine;
  v8 = [(MBCKRestoreFilePrefetchEngine *)&v24 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_ckOperationTracker, v7);
    objc_storeWeak((id *)&v9->_parentEngine, v5);
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    batchRecordIDs = v9->_batchRecordIDs;
    v9->_batchRecordIDs = v10;

    dispatch_group_t v12 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v12;

    if ([v5 isForegroundRestore]) {
      intptr_t v14 = 4;
    }
    else {
      intptr_t v14 = 1;
    }
    v9->_concurrencyLimit = v14;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(v14);
    concurrencySemaphore = v9->_concurrencySemaphore;
    v9->_concurrencySemaphore = (OS_dispatch_semaphore *)v15;

    uint64_t v17 = [v5 domainManager];
    domainManager = v9->_domainManager;
    v9->_domainManager = (MBDomainManager *)v17;

    uint64_t v19 = [v5 device];
    device = v9->_device;
    v9->_device = (MBCKDevice *)v19;

    v21 = +[MBBehaviorOptions sharedOptions];
    v9->_maxBatchCount = (unint64_t)[v21 maxBatchCount];

    v22 = +[MBBehaviorOptions sharedOptions];
    v9->_maxBatchAssetSize = (unint64_t)[v22 maxBatchFetchAssetSize];
  }
  return v9;
}

- (void)dealloc
{
  [(MBCKCache *)self->_cache close];
  v3.receiver = self;
  v3.super_class = (Class)MBCKRestoreFilePrefetchEngine;
  [(MBCKRestoreFilePrefetchEngine *)&v3 dealloc];
}

- (BOOL)setUpWithError:(id *)a3
{
  v5 = [(MBCKRestoreFilePrefetchEngine *)self parentEngine];
  if (!v5) {
    __assert_rtn("-[MBCKRestoreFilePrefetchEngine setUpWithError:]", "MBCKRestoreFilePrefetchEngine.m", 69, "parentEngine");
  }
  uint64_t v6 = v5;
  uint64_t v7 = [v5 serviceAccount];
  if (!v7) {
    __assert_rtn("-[MBCKRestoreFilePrefetchEngine setUpWithError:]", "MBCKRestoreFilePrefetchEngine.m", 71, "account");
  }
  v8 = (void *)v7;
  v9 = +[MBCKManager sharedInstance];
  v10 = [v9 openCacheWithAccount:v8 accessType:1 error:a3];
  cache = self->_cache;
  self->_cache = v10;

  BOOL v12 = self->_cache != 0;
  return v12;
}

- (void)prefetchRecord:(id)a3
{
  id v4 = a3;
  if ([v4 downloaded])
  {
    v5 = [v4 stashedAssetPath];
    if (v5)
    {
    }
    else
    {
      uint64_t v6 = [v4 stashedResourcePath];

      if (!v6) {
        goto LABEL_32;
      }
    }
  }
  if ([v4 downloaded])
  {
    uint64_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v4 stashedAssetPath];
      *(_DWORD *)buf = 138412802;
      id v33 = v4;
      if ([v4 stashedAssetIsDecrypted]) {
        v9 = "YES";
      }
      else {
        v9 = "NO";
      }
      __int16 v34 = 2112;
      v35 = v8;
      __int16 v36 = 2080;
      v37 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Prefetch: Attempting to prefetch a file(%@) already downloaded, stashedAssetPath:%@, stashedAssetIsDecrypted:%s", buf, 0x20u);

      v10 = [v4 stashedAssetPath];
      if ([v4 stashedAssetIsDecrypted]) {
        v11 = "YES";
      }
      else {
        v11 = "NO";
      }
      v30 = v10;
      v31 = v11;
      id v28 = v4;
      _MBLog();
    }
  }
  BOOL v12 = self->_batchRecordIDs;
  objc_sync_enter(v12);
  if ((unint64_t)[(NSMutableArray *)self->_batchRecordIDs count] + 1 > self->_maxBatchCount
    || (unint64_t batchSize = self->_batchSize,
        id v14 = [v4 size],
        (char *)[v4 resourcesSize] + (unint64_t)v14 + batchSize >= (char *)self->_maxBatchAssetSize))
  {
    [(MBCKRestoreFilePrefetchEngine *)self _prefetchBatch];
  }
  if (objc_msgSend(v4, "resourcesSize", v28)) {
    goto LABEL_35;
  }
  cache = self->_cache;
  v22 = [v4 signature];
  v23 = -[MBCKCache fileAssetMetadataForSignature:volumeType:](cache, "fileAssetMetadataForSignature:volumeType:", v22, [v4 volumeType]);
  LOBYTE(cache) = v23 == 0;

  if (cache)
  {
LABEL_35:
    if (_os_feature_enabled_impl())
    {
      dispatch_semaphore_t v15 = [v4 signature];
      if (!v15 && [v4 size])
      {
        v16 = MBGetDefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v4;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Prefetch: Found a file with non-zero size and no signature: %@", buf, 0xCu);
          id v29 = v4;
          _MBLog();
        }
      }
    }
    uint64_t v17 = (char *)objc_msgSend(v4, "size", v29);
    v18 = &v17[(void)[v4 resourcesSize]];
    batchRecordIDs = self->_batchRecordIDs;
    self->_batchSize += (unint64_t)v18;
    v20 = [v4 recordIDString];
    [(NSMutableArray *)batchRecordIDs addObject:v20];
  }
  else
  {
    objc_super v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v4;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Prefetch: Skipping prefetch of file(%@) because a previous batch already stashed file contents for this file", buf, 0xCu);
      _MBLog();
    }

    [(MBCKRestoreFilePrefetchEngine *)self _updateCacheWithFile:v4];
    v20 = [(MBCKRestoreFilePrefetchEngine *)self parentEngine];
    v25 = (char *)[v4 size];
    id v26 = [v4 resourcesSize];
    v27 = [v20 progressModel];
    [v27 finishedTransferringItem:v4 size:&v25[(void)v26]];
  }
  objc_sync_exit(v12);

LABEL_32:
}

- (void)waitForPrefetchCompletion
{
  objc_super v3 = self->_batchRecordIDs;
  objc_sync_enter(v3);
  if ([(NSMutableArray *)self->_batchRecordIDs count]) {
    [(MBCKRestoreFilePrefetchEngine *)self _prefetchBatch];
  }
  objc_sync_exit(v3);

  dispatch_group_wait((dispatch_group_t)self->_group, 0xFFFFFFFFFFFFFFFFLL);
  cache = self->_cache;
  [(MBCKCache *)cache flush];
}

- (void)_prefetchBatch
{
  v2 = [(MBCKRestoreFilePrefetchEngine *)self ckOperationTracker];
  v32 = v2;
  if (!v2) {
    __assert_rtn("-[MBCKRestoreFilePrefetchEngine _prefetchBatch]", "MBCKRestoreFilePrefetchEngine.m", 125, "tracker");
  }
  v30 = [v2 account];
  if (!v30) {
    __assert_rtn("-[MBCKRestoreFilePrefetchEngine _prefetchBatch]", "MBCKRestoreFilePrefetchEngine.m", 127, "serviceAccount");
  }
  objc_super v3 = self->_cache;
  if (!v3) {
    __assert_rtn("-[MBCKRestoreFilePrefetchEngine _prefetchBatch]", "MBCKRestoreFilePrefetchEngine.m", 129, "cache");
  }
  v27 = v3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_concurrencySemaphore, 0xFFFFFFFFFFFFFFFFLL);
  id v29 = [(NSMutableArray *)self->_batchRecordIDs count];
  unint64_t batchSize = self->_batchSize;
  id v4 = [v32 defaultZoneID];
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v29];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v6 = self->_batchRecordIDs;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v45;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [objc_alloc((Class)CKRecordID) initWithRecordName:*(void *)(*((void *)&v44 + 1) + 8 * i) zoneID:v4];
        id v11 = [objc_alloc((Class)CKReference) initWithRecordID:v10 action:0];
        [v5 addObject:v11];
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_batchRecordIDs removeAllObjects];
  self->_unint64_t batchSize = 0;
  BOOL v12 = +[NSPredicate predicateWithFormat:@"recordID IN %@", v5];
  id v13 = objc_alloc((Class)CKQuery);
  id v14 = +[MBCKModel privilegedQueryType];
  id v28 = [v13 initWithRecordType:v14 predicate:v12];

  id v15 = [objc_alloc((Class)CKQueryOperation) initWithQuery:v28];
  [v15 setZoneID:v4];
  v16 = [v30 persona];
  LODWORD(v13) = [v16 shouldRestoreFilesSparse];

  if (v13)
  {
    uint64_t v17 = objc_opt_new();
    [v17 setSparseAware:&__kCFBooleanTrue];
    CFStringRef v54 = @"contents";
    v55 = v17;
    v18 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    [v15 setAssetTransferOptionsByKey:v18];
  }
  objc_initWeak(&location, v15);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  uint64_t v19 = [(MBCKRestoreFilePrefetchEngine *)self parentEngine];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10024823C;
  v36[3] = &unk_1004170E0;
  v41 = v42;
  v20 = v27;
  v37 = v20;
  v38 = self;
  id v31 = v30;
  id v39 = v31;
  id v21 = v19;
  id v40 = v21;
  [v15 setRecordFetchedBlock:v36];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100248990;
  v34[3] = &unk_100417108;
  objc_copyWeak(v35, &location);
  v35[1] = v29;
  v34[5] = v42;
  v34[4] = self;
  [v15 setQueryCompletionBlock:v34];
  v22 = MBGetDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_super v24 = [v15 operationID];
      *(_DWORD *)buf = 138543874;
      v49 = v24;
      __int16 v50 = 2048;
      id v51 = v29;
      __int16 v52 = 2048;
      unint64_t v53 = batchSize;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Prefetch: Starting operation:%{public}@, records:%lu, size:%llu", buf, 0x20u);
    }
    v25 = [v15 operationID];
    _MBLog();
  }
  dispatch_group_enter((dispatch_group_t)self->_group);
  [v32 addDatabaseOperation:v15];
  objc_destroyWeak(v35);

  _Block_object_dispose(v42, 8);
  objc_destroyWeak(&location);
}

- (BOOL)_updateCacheWithFile:(id)a3
{
  id v4 = a3;
  id v5 = [(MBCKRestoreFilePrefetchEngine *)self cache];
  uint64_t v6 = [v4 signature];
  id v7 = objc_msgSend(v5, "fileAssetMetadataForSignature:volumeType:", v6, objc_msgSend(v4, "volumeType"));

  uint64_t v8 = [v7 stashedAssetPath];
  if (v8) {
    [v4 setStashedAssetPath:v8];
  }
  if ([v4 stashedAssetIsDecrypted]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = (uint64_t)[v7 stashedAssetIsDecrypted];
  }
  [v4 setStashedAssetIsDecrypted:v9];
  uint64_t v10 = [v7 decodedAssetPath];
  if (v10) {
    [v4 setDecodedAssetPath:v10];
  }
  if (v8
    || ([v4 stashedResourcePath],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = v10 | v11,
        (id)v11,
        v12))
  {
    id v13 = [v5 updateFile:v4];
    LOBYTE(v12) = v13 == 0;
  }
  return v12;
}

- (MBCKRestoreEngine)parentEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentEngine);
  return (MBCKRestoreEngine *)WeakRetained;
}

- (void)setParentEngine:(id)a3
{
}

- (MBCKOperationTracker)ckOperationTracker
{
  return self->_ckOperationTracker;
}

- (void)setCkOperationTracker:(id)a3
{
}

- (MBCKCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (NSMutableArray)batchRecordIDs
{
  return self->_batchRecordIDs;
}

- (void)setBatchRecordIDs:(id)a3
{
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_unint64_t batchSize = a3;
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (OS_dispatch_semaphore)concurrencySemaphore
{
  return self->_concurrencySemaphore;
}

- (void)setConcurrencySemaphore:(id)a3
{
}

- (int64_t)concurrencyLimit
{
  return self->_concurrencyLimit;
}

- (void)setConcurrencyLimit:(int64_t)a3
{
  self->_concurrencyLimit = a3;
}

- (MBDomainManager)domainManager
{
  return self->_domainManager;
}

- (void)setDomainManager:(id)a3
{
}

- (MBCKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (unint64_t)maxBatchCount
{
  return self->_maxBatchCount;
}

- (void)setMaxBatchCount:(unint64_t)a3
{
  self->_maxBatchCount = a3;
}

- (unint64_t)maxBatchAssetSize
{
  return self->_maxBatchAssetSize;
}

- (void)setMaxBatchAssetSize:(unint64_t)a3
{
  self->_maxBatchAssetSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_domainManager, 0);
  objc_storeStrong((id *)&self->_concurrencySemaphore, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_batchRecordIDs, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_ckOperationTracker, 0);
  objc_destroyWeak((id *)&self->_parentEngine);
}

@end