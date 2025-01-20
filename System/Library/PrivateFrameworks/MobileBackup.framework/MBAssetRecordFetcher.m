@interface MBAssetRecordFetcher
+ (id)assetFetcherWithOperationTracker:(id)a3 device:(id)a4 error:(id *)a5;
- (BOOL)disposeWithError:(id *)a3;
- (BOOL)finishWithError:(id *)a3;
- (BOOL)requestAsset:(id)a3 error:(id *)a4;
- (MBAssetFetchSummary)fetchSummary;
- (MBAssetReceiver)delegate;
- (MBCKDevice)device;
- (MBCKOperationTracker)tracker;
- (id)_decrypterFor:(id)a3 error:(id *)a4;
- (id)_initWithTracker:(id)a3 device:(id)a4;
- (void)_handleAssetFetchResponseFor:(id)a3 decrypter:(id)a4 record:(id)a5 withFetchError:(id)a6;
- (void)_trackFetchError:(id)a3;
- (void)begin;
- (void)setDelegate:(id)a3;
@end

@implementation MBAssetRecordFetcher

+ (id)assetFetcherWithOperationTracker:(id)a3 device:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("+[MBAssetRecordFetcher assetFetcherWithOperationTracker:device:error:]", "MBAssetRecordFetcher.m", 56, "tracker");
  }
  v8 = v7;
  if (!v7) {
    __assert_rtn("+[MBAssetRecordFetcher assetFetcherWithOperationTracker:device:error:]", "MBAssetRecordFetcher.m", 57, "device");
  }
  id v9 = [[MBAssetRecordFetcher alloc] _initWithTracker:v6 device:v7];

  return v9;
}

- (id)_initWithTracker:(id)a3 device:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn("-[MBAssetRecordFetcher _initWithTracker:device:]", "MBAssetRecordFetcher.m", 63, "tracker");
  }
  id v9 = v8;
  if (!v8) {
    __assert_rtn("-[MBAssetRecordFetcher _initWithTracker:device:]", "MBAssetRecordFetcher.m", 64, "device");
  }
  uint64_t v10 = [v8 assetIDPrefix];
  if (!v10) {
    __assert_rtn("-[MBAssetRecordFetcher _initWithTracker:device:]", "MBAssetRecordFetcher.m", 67, "assetIDPrefix");
  }
  v11 = (void *)v10;
  v23.receiver = self;
  v23.super_class = (Class)MBAssetRecordFetcher;
  v12 = [(MBAssetRecordFetcher *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tracker, a3);
    objc_storeStrong((id *)&v13->_device, a4);
    objc_storeStrong((id *)&v13->_assetIDPrefix, v11);
    v14 = objc_alloc_init(MBAssetFetchSummary);
    summary = v13->_summary;
    v13->_summary = v14;

    uint64_t v16 = +[NSMutableArray array];
    errors = v13->_errors;
    v13->_errors = (NSMutableArray *)v16;

    atomic_store(0, &v13->_errorCount);
    v18 = +[MBBehaviorOptions sharedOptions];
    v19 = [v18 restoreAssetIDsToFailFetchingRegex];
    uint64_t v20 = +[MBErrorInjector errorInjectorForRegex:v19];
    errorInjector = v13->_errorInjector;
    v13->_errorInjector = (MBErrorInjector *)v20;
  }
  return v13;
}

- (void)begin
{
  v3 = +[NSDate now];
  [(MBAssetFetchSummary *)self->_summary setStart:v3];

  atomic_store(0, &self->_registeredAssetCount);
  atomic_store(0, &self->_bytesFetched);
  v4 = [[MBCKBatchFetch alloc] initWithOperationTracker:self->_tracker];
  batchFetch = self->_batchFetch;
  self->_batchFetch = v4;

  [(MBCKBatchFetch *)self->_batchFetch setUsePrivilegedBatchRecordFetch:1];
  id v6 = self->_batchFetch;
  [(MBCKBatchFetch *)v6 setUseGlobalThreadLimit:0];
}

- (BOOL)disposeWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBAssetRecordFetcher disposeWithError:]", "MBAssetRecordFetcher.m", 100, "error");
  }
  [(MBCKBatchFetch *)self->_batchFetch cancel];
  [(MBAssetRecordFetcher *)self setDelegate:0];
  return 1;
}

- (BOOL)finishWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBAssetRecordFetcher finishWithError:]", "MBAssetRecordFetcher.m", 109, "error");
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  objc_super v23 = sub_100064768;
  v24 = sub_100064778;
  id v25 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  batchFetch = self->_batchFetch;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_100064780;
  v17 = &unk_100410FC8;
  v19 = &v20;
  id v7 = v5;
  v18 = v7;
  [(MBCKBatchFetch *)batchFetch fetchRecordsWithCompletion:&v14];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = self->_batchFetch;
  self->_batchFetch = 0;

  id v9 = +[NSDate now];
  [(MBAssetFetchSummary *)self->_summary setEnd:v9];

  unint64_t v10 = atomic_load(&self->_registeredAssetCount);
  [(MBAssetFetchSummary *)self->_summary setFetchedAssetCount:v10];
  unint64_t v11 = atomic_load(&self->_bytesFetched);
  [(MBAssetFetchSummary *)self->_summary setFetchedAssetBytes:v11];
  v12 = (void *)v21[5];
  if (v12) {
    *a3 = v12;
  }

  _Block_object_dispose(&v20, 8);
  return v12 == 0;
}

- (BOOL)requestAsset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBAssetRecordFetcher requestAsset:error:]", "MBAssetRecordFetcher.m", 133, "asset");
  }
  if (!a4) {
    __assert_rtn("-[MBAssetRecordFetcher requestAsset:error:]", "MBAssetRecordFetcher.m", 134, "error");
  }
  if (!self->_batchFetch) {
    __assert_rtn("-[MBAssetRecordFetcher requestAsset:error:]", "MBAssetRecordFetcher.m", 135, "_batchFetch");
  }
  id v7 = v6;
  if (!atomic_load(&self->_errorCount))
  {
    v13 = [v6 metadata];
    id v14 = [v13 assetType];

    if (v14 == (id)2)
    {
      uint64_t v15 = [(MBAssetRecordFetcher *)self _decrypterFor:v7 error:a4];
      if (!v15) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    assetIDPrefix = self->_assetIDPrefix;
    v17 = [v7 metadata];
    v18 = [v17 recordIDSuffix];
    v19 = +[MBAssetRecord recordIDFromAssetIDPrefix:assetIDPrefix recordIDSuffix:v18];

    objc_initWeak(&location, self);
    batchFetch = self->_batchFetch;
    v21 = [v7 metadata];
    id v22 = [v21 assetSize];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100064A88;
    v25[3] = &unk_100411278;
    objc_copyWeak(&v28, &location);
    id v26 = v7;
    id v23 = v15;
    id v27 = v23;
    [(MBCKBatchFetch *)batchFetch fetchRecordWithID:v19 assetSize:v22 completion:v25];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

    BOOL v12 = 1;
    goto LABEL_12;
  }
  id v9 = self;
  objc_sync_enter(v9);
  unint64_t v10 = [(NSMutableArray *)v9->_errors lastObject];
  objc_sync_exit(v9);

  id v11 = v10;
  *a4 = v11;

LABEL_6:
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

- (void)_trackFetchError:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  atomic_fetch_add((atomic_ullong *volatile)&v4->_errorCount, 1uLL);
  [(NSMutableArray *)v4->_errors addObject:v5];
  objc_sync_exit(v4);
}

- (void)_handleAssetFetchResponseFor:(id)a3 decrypter:(id)a4 record:(id)a5 withFetchError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    __assert_rtn("-[MBAssetRecordFetcher _handleAssetFetchResponseFor:decrypter:record:withFetchError:]", "MBAssetRecordFetcher.m", 173, "asset");
  }
  id v14 = v13;
  uint64_t v15 = [(MBAssetRecordFetcher *)self delegate];
  if (v15)
  {
    if (!v14)
    {
      errorInjector = self->_errorInjector;
      if (errorInjector)
      {
        v17 = [v12 recordID];
        v18 = [v17 recordName];
        id v14 = [(MBErrorInjector *)errorInjector errorIfMatches:v18];
      }
    }
    if (v14)
    {
      [(MBAssetRecordFetcher *)self _trackFetchError:v14];
      v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v30 = v10;
        __int16 v31 = 2112;
        id v32 = v14;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=asset-fetch= Failed fetching asset record for asset %@: %@", buf, 0x16u);
        _MBLog();
      }

      [v15 fetcher:self failedFetchingAsset:v10 withFetchError:v14];
    }
    else
    {
      uint64_t v20 = +[MBAssetRecord assetRecordFromCKRecord:v12];
      v21 = [v20 recordID];
      id v22 = [v21 recordName];

      id v23 = [v20 contents];
      v24 = [v23 fileURL];
      id v25 = [v24 path];

      if (!v23 || v25)
      {
        id v27 = MBGetDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v30 = v22;
          __int16 v31 = 2048;
          id v32 = [v10 originalInode];
          __int16 v33 = 2112;
          v34 = v25;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "=asset-fetch= Fetched asset record %@ for ino: %llu at %@", buf, 0x20u);
          [v10 originalInode];
          _MBLog();
        }

        atomic_fetch_add_explicit((atomic_ullong *volatile)&self->_registeredAssetCount, 1uLL, memory_order_relaxed);
        id v28 = [v20 contents];
        atomic_fetch_add_explicit((atomic_ullong *volatile)&self->_bytesFetched, (unint64_t)[v28 size], memory_order_relaxed);

        [v15 fetcher:self didReceiveAsset:v10 decrypter:v11 path:v25];
      }
      else
      {
        id v26 = +[MBError errorWithCode:302, @"Nil fileURL for fetched asset %@", v10 format];
        [(MBAssetRecordFetcher *)self _trackFetchError:v26];
        [v15 fetcher:self failedFetchingAsset:v10 withFetchError:v26];
      }
      id v14 = 0;
    }
  }
}

- (MBAssetFetchSummary)fetchSummary
{
  return self->_summary;
}

- (id)_decrypterFor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBAssetRecordFetcher _decrypterFor:error:]", "MBAssetRecordFetcher.m", 213, "asset");
  }
  id v7 = v6;
  id v8 = [v6 metadata];
  id v9 = [v8 encryptionKey];

  if (v9)
  {
    id v10 = [[_AssetDecrypter alloc] _initWith:self asset:v7];
  }
  else
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "=asset-fetch= Missing encryption key for %@", buf, 0xCu);
      _MBLog();
    }

    if (a4)
    {
      +[MBError errorWithCode:205, @"Missing encryption key for %@", v7 format];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

- (MBAssetReceiver)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (MBAssetReceiver *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MBCKDevice)device
{
  return self->_device;
}

- (MBCKOperationTracker)tracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_assetIDPrefix, 0);
  objc_storeStrong((id *)&self->_errorInjector, 0);
  objc_storeStrong((id *)&self->_batchFetch, 0);
  objc_storeStrong((id *)&self->_summary, 0);
}

@end