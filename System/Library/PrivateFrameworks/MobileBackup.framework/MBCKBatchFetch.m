@interface MBCKBatchFetch
- (BOOL)_handleCompletionForFetchInfo:(id)a3 record:(id)a4 error:(id)a5;
- (BOOL)canceled;
- (BOOL)fetchIncrementally;
- (BOOL)finishWithError:(id *)a3;
- (BOOL)retryWhenNetworkDisconnected;
- (BOOL)useGlobalThreadLimit;
- (BOOL)usePrivilegedBatchRecordFetch;
- (MBCKBatchFetch)initWithOperationTracker:(id)a3;
- (MBCKOperationPolicy)ckOperationPolicy;
- (MBCKOperationTracker)ckOperationTracker;
- (NSError)fetchError;
- (NSMutableDictionary)fetchInfosByRecordID;
- (NSMutableOrderedSet)fetchInfos;
- (OS_dispatch_group)fetchGroup;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_semaphore)fetchSemaphore;
- (unint64_t)currentBatchAssetSize;
- (unint64_t)currentBatchCount;
- (void)_fetchRecordsWithCompletion:(id)a3;
- (void)_finishBatchedFetchesWithCompletion:(id)a3;
- (void)_flush;
- (void)_flushBatchedFetches:(unint64_t)a3;
- (void)_performCallbacksForFetchInfo:(id)a3 record:(id)a4 error:(id)a5;
- (void)_scheduleBatchFetchOperationForFetchInfos:(id)a3;
- (void)_sendBatchFetchOperationForFetchInfos:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)fetchRecordWithID:(id)a3 assetSize:(int64_t)a4 completion:(id)a5;
- (void)fetchRecordWithID:(id)a3 completion:(id)a4;
- (void)fetchRecordsWithCompletion:(id)a3;
- (void)fetchRecordsWithIDs:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)setCallbackQueue:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCkOperationPolicy:(id)a3;
- (void)setCkOperationTracker:(id)a3;
- (void)setCurrentBatchAssetSize:(unint64_t)a3;
- (void)setCurrentBatchCount:(unint64_t)a3;
- (void)setFetchError:(id)a3;
- (void)setFetchGroup:(id)a3;
- (void)setFetchIncrementally:(BOOL)a3;
- (void)setFetchInfos:(id)a3;
- (void)setFetchInfosByRecordID:(id)a3;
- (void)setFetchSemaphore:(id)a3;
- (void)setRetryWhenNetworkDisconnected:(BOOL)a3;
- (void)setUseGlobalThreadLimit:(BOOL)a3;
- (void)setUsePrivilegedBatchRecordFetch:(BOOL)a3;
@end

@implementation MBCKBatchFetch

- (MBCKBatchFetch)initWithOperationTracker:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKBatchFetch initWithOperationTracker:]", "MBCKBatchFetch.m", 79, "tracker");
  }
  v5 = v4;
  uint64_t v6 = [v4 ckOperationPolicy];
  if (!v6) {
    __assert_rtn("-[MBCKBatchFetch initWithOperationTracker:]", "MBCKBatchFetch.m", 81, "policy");
  }
  v7 = (void *)v6;
  v21.receiver = self;
  v21.super_class = (Class)MBCKBatchFetch;
  v8 = [(MBCKBatchFetch *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_ckOperationTracker, v5);
    objc_storeStrong((id *)&v9->_ckOperationPolicy, v7);
    *(_WORD *)&v9->_fetchIncrementally = 257;
    v9->_usePrivilegedBatchRecordFetch = 0;
    uint64_t v10 = objc_opt_new();
    fetchInfos = v9->_fetchInfos;
    v9->_fetchInfos = (NSMutableOrderedSet *)v10;

    uint64_t v12 = objc_opt_new();
    fetchInfosByRecordID = v9->_fetchInfosByRecordID;
    v9->_fetchInfosByRecordID = (NSMutableDictionary *)v12;

    dispatch_group_t v14 = dispatch_group_create();
    fetchGroup = v9->_fetchGroup;
    v9->_fetchGroup = (OS_dispatch_group *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.backupd.batchFetch", v17);
    callbackQueue = v9->_callbackQueue;
    v9->_callbackQueue = (OS_dispatch_queue *)v18;

    atomic_store(0, (unsigned int *)&v9->_pendingOperationsCount);
    atomic_store(0, (unsigned __int8 *)&v9->_started);
  }
  return v9;
}

- (void)dealloc
{
  if ([(NSMutableOrderedSet *)self->_fetchInfos count]) {
    __assert_rtn("-[MBCKBatchFetch dealloc]", "MBCKBatchFetch.m", 100, "_fetchInfos.count == 0");
  }
  v3.receiver = self;
  v3.super_class = (Class)MBCKBatchFetch;
  [(MBCKBatchFetch *)&v3 dealloc];
}

- (void)fetchRecordWithID:(id)a3 completion:(id)a4
{
}

- (void)fetchRecordWithID:(id)a3 assetSize:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v9) {
    __assert_rtn("-[MBCKBatchFetch fetchRecordWithID:assetSize:completion:]", "MBCKBatchFetch.m", 110, "completion");
  }
  uint64_t v10 = (void (**)(void, void, void, void))v9;
  uint64_t v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v55 = v8;
    __int16 v56 = 2114;
    v57 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Adding a fetch for %{public}@ to %{public}@", buf, 0x16u);
    uint64_t v51 = (uint64_t)v8;
    _MBLog();
  }

  if (v8)
  {
    unsigned __int8 v19 = atomic_load((unsigned __int8 *)&self->_started);
    if (v19)
    {
      v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "You can't add a new recordID to an already started batch", buf, 2u);
      }
    }
    objc_super v21 = _MBAssert((v19 & 1) == 0, @"You can't add a new recordID to an already started batch", v13, v14, v15, v16, v17, v18, v51);
    if (v21)
    {
      ((void (**)(void, id, void, void *))v10)[2](v10, v8, 0, v21);
    }
    else
    {
      v22 = self;
      objc_sync_enter(v22);
      v23 = [(MBCKBatchFetch *)v22 fetchSemaphore];
      BOOL v24 = v23 == 0;

      if (v24)
      {
        v25 = +[MBBehaviorOptions sharedOptions];
        int v26 = [v25 maxBatchFetchConcurrentFetchRecordsOperationsWithDefaultValue:6];

        if (v26 <= 1) {
          unsigned int v27 = 1;
        }
        else {
          unsigned int v27 = v26;
        }
        if (v26) {
          intptr_t v28 = v27;
        }
        else {
          intptr_t v28 = 0x7FFFFFFFLL;
        }
        if (v22->_useGlobalThreadLimit)
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1001267AC;
          block[3] = &unk_100413CC0;
          int v53 = v28;
          if (qword_100482508 != -1) {
            dispatch_once(&qword_100482508, block);
          }
          [(MBCKBatchFetch *)v22 setFetchSemaphore:qword_100482500];
        }
        else
        {
          dispatch_semaphore_t v29 = dispatch_semaphore_create(v28);
          [(MBCKBatchFetch *)v22 setFetchSemaphore:v29];
        }
      }
      v30 = [(MBCKBatchFetch *)v22 fetchInfosByRecordID];
      v31 = [v30 objectForKeyedSubscript:v8];

      if (v31)
      {
        v32 = [v31 callbacks];
        id v33 = [v10 copy];
        id v34 = objc_retainBlock(v33);
        [v32 addObject:v34];

        char v35 = 0;
        v36 = v31;
      }
      else
      {
        v36 = objc_opt_new();
        [v36 setState:0];
        v37 = [v36 callbacks];
        id v38 = [v10 copy];
        id v39 = objc_retainBlock(v38);
        [v37 addObject:v39];

        [v36 setRecordID:v8];
        if (a4)
        {
          [v36 setAssetSize:a4];
        }
        else
        {
          v40 = [v36 recordID];
          v41 = [v40 recordName];
          v42 = [v41 componentsSeparatedByString:@":"];

          if ([v42 count] == (id)5)
          {
            v43 = [v42 objectAtIndexedSubscript:0];
            unsigned int v44 = [v43 isEqualToString:@"F"];

            if (v44)
            {
              v45 = [v42 objectAtIndexedSubscript:3];
              objc_msgSend(v36, "setAssetSize:", objc_msgSend(v45, "integerValue"));
            }
          }
        }
        v46 = [(MBCKBatchFetch *)v22 ckOperationPolicy];
        v32 = v46;
        if (!v46) {
          __assert_rtn("-[MBCKBatchFetch fetchRecordWithID:assetSize:completion:]", "MBCKBatchFetch.m", 168, "policy");
        }
        id v47 = [v46 maxBatchCount];
        v48 = (char *)[v32 maxBatchFetchAssetSize];
        if ([(MBCKBatchFetch *)v22 fetchIncrementally]
          && [(MBCKBatchFetch *)v22 currentBatchCount]
          && ((id)[(MBCKBatchFetch *)v22 currentBatchCount] >= v47
           || (v49 = [(MBCKBatchFetch *)v22 currentBatchAssetSize],
               &v49[(void)[v36 assetSize]] >= v48)))
        {
          [(MBCKBatchFetch *)v22 setCurrentBatchCount:0];
          [(MBCKBatchFetch *)v22 setCurrentBatchAssetSize:0];
          char v35 = 1;
        }
        else
        {
          char v35 = 0;
        }
        [(MBCKBatchFetch *)v22 setCurrentBatchCount:(char *)[(MBCKBatchFetch *)v22 currentBatchCount] + 1];
        -[MBCKBatchFetch setCurrentBatchAssetSize:](v22, "setCurrentBatchAssetSize:", (char *)[v36 assetSize] + -[MBCKBatchFetch currentBatchAssetSize](v22, "currentBatchAssetSize"));
        v50 = [(MBCKBatchFetch *)v22 fetchInfosByRecordID];
        [v50 setObject:v36 forKeyedSubscript:v8];

        id v33 = [(MBCKBatchFetch *)v22 fetchInfos];
        [v33 addObject:v36];
      }

      objc_sync_exit(v22);
      if (((v31 == 0) & v35) == 1) {
        [(MBCKBatchFetch *)v22 _flushBatchedFetches:1];
      }
      objc_super v21 = 0;
    }
  }
  else
  {
    objc_super v21 = +[MBError errorWithCode:1 format:@"You can't fetch a nil recordID"];
    ((void (**)(void, void, void, void *))v10)[2](v10, 0, 0, v21);
  }
}

- (void)fetchRecordsWithIDs:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    __assert_rtn("-[MBCKBatchFetch fetchRecordsWithIDs:progress:completion:]", "MBCKBatchFetch.m", 191, "recordIDs");
  }
  if (!v9) {
    __assert_rtn("-[MBCKBatchFetch fetchRecordsWithIDs:progress:completion:]", "MBCKBatchFetch.m", 192, "progress");
  }
  if (!v10) {
    __assert_rtn("-[MBCKBatchFetch fetchRecordsWithIDs:progress:completion:]", "MBCKBatchFetch.m", 193, "completion");
  }
  id v17 = v10;
  unsigned __int8 v19 = v9;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  id v33 = 0;
  uint64_t v16 = v8;
  id v33 = [v8 count];
  if (v31[3])
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = sub_100126B0C;
    v28[4] = sub_100126B38;
    id v29 = objc_retainBlock(v17);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v8;
    id v11 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_100126B40;
          v20[3] = &unk_100413CE8;
          v22 = v28;
          id v21 = v9;
          v23 = &v30;
          [(MBCKBatchFetch *)self fetchRecordWithID:v14 completion:v20];
        }
        id v11 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v11);
    }

    _Block_object_dispose(v28, 8);
    uint64_t v15 = v17;
  }
  else
  {
    uint64_t v15 = v17;
    (*((void (**)(id, void))v17 + 2))(v17, 0);
  }
  _Block_object_dispose(&v30, 8);
}

- (void)_flush
{
  [(MBCKBatchFetch *)self _flushBatchedFetches:-1];
}

- (void)_performCallbacksForFetchInfo:(id)a3 record:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v26 = a4;
  id v25 = a5;
  if ([v8 state] == (id)3)
  {
    v20 = +[NSAssertionHandler currentHandler];
    id v21 = [v8 recordID];
    v22 = +[NSThread callStackSymbols];
    [v20 handleFailureInMethod:a2, self, @"MBCKBatchFetch.m", 238, @"We've already finished fetching record %@: %@", v21, v22 object file lineNumber description];
  }
  id v9 = [v8 recordID];
  id v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Performing callbacks for fetch of record %{public}@", buf, 0xCu);
    v23 = v9;
    _MBLog();
  }

  [v8 setState:3];
  id v11 = [v8 callbacks];
  [v8 setCallbacks:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v18 = [(MBCKBatchFetch *)self callbackQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100126FF4;
        block[3] = &unk_100413D10;
        uint64_t v31 = v17;
        id v28 = v9;
        id v29 = v26;
        id v30 = v25;
        dispatch_block_t v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        dispatch_async(v18, v19);
      }
      id v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v14);
  }
}

- (void)_finishBatchedFetchesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(MBCKBatchFetch *)v5 fetchInfos];
  id v7 = [v6 count];

  objc_sync_exit(v5);
  if (v7)
  {
    [(MBCKBatchFetch *)v5 _fetchRecordsWithCompletion:v4];
  }
  else
  {
    if ([(MBCKBatchFetch *)v5 canceled]) {
      +[MBError errorWithCode:202 format:@"Batch fetch canceled"];
    }
    else {
    id v8 = [(MBCKBatchFetch *)v5 fetchError];
    }
    id v9 = MBGetDefaultLog();
    id v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v17 = v5;
        __int16 v18 = 2112;
        dispatch_block_t v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed %{public}@: %@", buf, 0x16u);
        _MBLog();
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Finished %{public}@", buf, 0xCu);
      _MBLog();
    }

    if (v4)
    {
      id v11 = [(MBCKBatchFetch *)v5 callbackQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001272A0;
      block[3] = &unk_100413A50;
      id v15 = v4;
      id v14 = v8;
      dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v11, v12);
    }
  }
}

- (BOOL)_handleCompletionForFetchInfo:(id)a3 record:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    __assert_rtn("-[MBCKBatchFetch _handleCompletionForFetchInfo:record:error:]", "MBCKBatchFetch.m", 277, "fetchInfo");
  }
  id v11 = v10;
  if ([v8 state] != (id)3)
  {
    id v13 = [v8 recordID];
    id v14 = [v8 fetchAttempts];
    if (v11)
    {
      id v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v50 = v13;
        __int16 v51 = 2112;
        double v52 = *(double *)&v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Handling fetch error for record %{public}@: %@", buf, 0x16u);
        v45 = v13;
        id v47 = v11;
        _MBLog();
      }

      uint64_t v16 = [(MBCKBatchFetch *)self ckOperationTracker];
      if (!v16) {
        __assert_rtn("-[MBCKBatchFetch _handleCompletionForFetchInfo:record:error:]", "MBCKBatchFetch.m", 287, "tracker");
      }
      uint64_t v17 = (void *)v16;
      __int16 v18 = [(MBCKBatchFetch *)self ckOperationPolicy];
      if (!v18) {
        __assert_rtn("-[MBCKBatchFetch _handleCompletionForFetchInfo:record:error:]", "MBCKBatchFetch.m", 289, "policy");
      }
      dispatch_block_t v19 = v18;
      v48 = v17;
      [v18 retryAfterInterval];
      double v21 = v20;
      v22 = [v11 domain];
      unsigned int v23 = [v22 isEqualToString:CKErrorDomain];

      if (v23)
      {
        double v24 = fmax(v21, 1.0);
        id v25 = [v11 code];
        switch((unint64_t)v25)
        {
          case 2uLL:
            id v26 = [v11 userInfo];
            long long v27 = [v26 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];
            id v28 = [v27 objectForKeyedSubscript:v13];

            if (v28)
            {
              BOOL v12 = [(MBCKBatchFetch *)self _handleCompletionForFetchInfo:v8 record:v9 error:v28];
              goto LABEL_51;
            }
            unsigned int v44 = MBGetDefaultLog();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v50 = v13;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "No partial error found for record %{public}@", buf, 0xCu);
              _MBLog();
            }

            break;
          case 3uLL:
            long long v32 = MBGetDefaultLog();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v50 = v13;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Fetch of record %{public}@ hit a network unavailable error", buf, 0xCu);
              v45 = v13;
              _MBLog();
            }

            if (+[MBError isNetworkDisconnectedError:v11]
              && ![(MBCKBatchFetch *)self retryWhenNetworkDisconnected])
            {
              break;
            }
            double v33 = (double)arc4random_uniform(5u);
            double v34 = 10.0;
            goto LABEL_32;
          case 4uLL:
            long long v35 = MBGetDefaultLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v50 = v13;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Fetch of record %{public}@ hit a network failure error", buf, 0xCu);
              v45 = v13;
              _MBLog();
            }

            double v33 = (double)arc4random_uniform(5u);
            double v34 = 1.0;
LABEL_32:
            double v24 = fmax(v24, v33 + v34);
            goto LABEL_41;
          case 5uLL:
            break;
          case 6uLL:
            uint64_t v31 = MBGetDefaultLog();
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              goto LABEL_36;
            }
            *(_DWORD *)buf = 138543362;
            v50 = v13;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Fetch of record %{public}@ hit a service unavailable error", buf, 0xCu);
            v45 = v13;
            goto LABEL_35;
          case 7uLL:
            v36 = MBGetDefaultLog();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v50 = v13;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Fetch of record %{public}@ was rate limited", buf, 0xCu);
              v45 = v13;
              _MBLog();
            }

            if (!+[MBError isNetworkDisconnectedError:v11]
              || [(MBCKBatchFetch *)self retryWhenNetworkDisconnected])
            {
              goto LABEL_41;
            }
            break;
          default:
            if (v25 != (id)23) {
              break;
            }
            uint64_t v31 = MBGetDefaultLog();
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              goto LABEL_36;
            }
            *(_DWORD *)buf = 138543362;
            v50 = v13;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Fetch of record %{public}@ got a zone busy error", buf, 0xCu);
            v45 = v13;
LABEL_35:
            _MBLog();
LABEL_36:

            goto LABEL_41;
        }
      }
      else
      {
        double v24 = 2.0;
        if ((+[MBError isError:v11 withCode:304] & 1) != 0
          || (double v24 = 5.0, +[MBError isRetryableXPCError:v11]))
        {
LABEL_41:
          if (v14 <= objc_msgSend(v19, "maxRetryAttempts", v45, v47))
          {
            v37 = [v11 userInfo];
            id v28 = [v37 objectForKeyedSubscript:CKErrorRetryAfterKey];

            if (v28)
            {
              [v28 doubleValue];
              double v24 = v38;
            }
            double v39 = fmax(v24, 0.0);
            v40 = MBGetDefaultLog();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              v41 = [v8 recordID];
              *(_DWORD *)buf = 138543874;
              v50 = v41;
              __int16 v51 = 2048;
              double v52 = v39;
              __int16 v53 = 2048;
              id v54 = v14;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Retrying fetch of record %{public}@ after %0.3fs and %lu attempts", buf, 0x20u);

              v46 = [v8 recordID];
              _MBLog();
            }
            v42 = +[NSDate dateWithTimeIntervalSinceNow:v39];
            [v8 setRetryDate:v42];

            [v8 setState:1];
            BOOL v12 = 0;
LABEL_51:

            goto LABEL_52;
          }
        }
      }

      [v8 setError:v11];
      id v30 = MBGetDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v50 = v13;
        __int16 v51 = 2048;
        double v52 = *(double *)&v14;
        __int16 v53 = 2112;
        id v54 = v11;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to fetch record %{public}@ after %lu attempts, error:%@", buf, 0x20u);
        goto LABEL_44;
      }
LABEL_45:

      [(MBCKBatchFetch *)self _performCallbacksForFetchInfo:v8 record:v9 error:v11];
      BOOL v12 = 1;
LABEL_52:

      goto LABEL_53;
    }
    [v8 setError:0];
    id v29 = MBGetDefaultLog();
    id v30 = v29;
    if (v14 == (id)1)
    {
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_45;
      }
      *(_DWORD *)buf = 138543362;
      v50 = v13;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Fetched record %{public}@", buf, 0xCu);
    }
    else
    {
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_45;
      }
      *(_DWORD *)buf = 138543618;
      v50 = v13;
      __int16 v51 = 2048;
      double v52 = *(double *)&v14;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Fetched record %{public}@ after %lu attempts", buf, 0x16u);
    }
LABEL_44:
    _MBLog();
    goto LABEL_45;
  }
  BOOL v12 = 1;
LABEL_53:

  return v12;
}

- (void)_sendBatchFetchOperationForFetchInfos:(id)a3
{
  id v4 = a3;
  v36 = [(MBCKBatchFetch *)self ckOperationTracker];
  if (!v36) {
    __assert_rtn("-[MBCKBatchFetch _sendBatchFetchOperationForFetchInfos:]", "MBCKBatchFetch.m", 363, "tracker");
  }
  v5 = [(MBCKBatchFetch *)self ckOperationPolicy];
  if (!v5) {
    __assert_rtn("-[MBCKBatchFetch _sendBatchFetchOperationForFetchInfos:]", "MBCKBatchFetch.m", 365, "policy");
  }
  v37 = [v4 valueForKey:@"recordID"];
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  char v58 = 0;
  if (self->_usePrivilegedBatchRecordFetch)
  {
    uint64_t v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (uint64_t (*)(uint64_t, uint64_t))[v4 count];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = @"PrivilegedBatchRecordFetch";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2048;
        v60 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Performing a %@ for %{public}@, c:%lu", buf, 0x20u);
      }

      [v4 count];
      _MBLog();
    }

    id v9 = +[NSPredicate predicateWithFormat:@"recordID IN %@", v37];
    id v10 = [objc_alloc((Class)CKQuery) initWithRecordType:@"PrivilegedBatchRecordFetch" predicate:v9];
    id v11 = [objc_alloc((Class)CKQueryOperation) initWithQuery:v10];
    if ([v5 fetchAssets])
    {
      BOOL v12 = objc_opt_new();
      [v12 setSparseAware:&__kCFBooleanTrue];
      CFStringRef v62 = @"contents";
      v63 = v12;
      id v13 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      [v11 setAssetTransferOptionsByKey:v13];
    }
  }
  else
  {
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v4 count];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fetching a batch for %{public}@, c:%lu", buf, 0x16u);
      }

      [v4 count];
      _MBLog();
    }

    id v11 = [objc_alloc((Class)CKFetchRecordsOperation) initWithRecordIDs:v37];
    if ([v5 fetchAssets]) {
      objc_msgSend(v11, "setShouldFetchAssetContent:", objc_msgSend(v5, "fetchAssets"));
    }
  }
  objc_initWeak(&location, v11);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1001283F0;
  v52[3] = &unk_100413D38;
  id v54 = v57;
  v52[4] = self;
  objc_copyWeak(&v55, &location);
  id v17 = v4;
  id v53 = v17;
  __int16 v18 = objc_retainBlock(v52);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100128640;
  v48[3] = &unk_100413D60;
  v50 = v57;
  objc_copyWeak(&v51, &location);
  v48[4] = self;
  id v35 = v17;
  id v49 = v35;
  dispatch_block_t v19 = objc_retainBlock(v48);
  if (self->_usePrivilegedBatchRecordFetch)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v60 = sub_100128E40;
    *(void *)&long long v61 = sub_100128E50;
    *((void *)&v61 + 1) = objc_opt_new();
    id v20 = v11;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100128E58;
    v45[3] = &unk_100413D88;
    id v47 = buf;
    v46 = v18;
    [v20 setRecordMatchedBlock:v45];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100128F04;
    v42[3] = &unk_100413DB0;
    v43 = v19;
    unsigned int v44 = buf;
    [v20 setQueryCompletionBlock:v42];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v21 = v11;
    [v21 setPerRecordCompletionBlock:v18];
    [v21 setFetchRecordsCompletionBlock:v19];
  }
  int pendingOperationsCount = self->_pendingOperationsCount;
  unsigned int v23 = MBGetDefaultLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = pendingOperationsCount;
    id v25 = v23;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [v11 operationID];
      long long v27 = (uint64_t (*)(uint64_t, uint64_t))[v37 count];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2048;
      v60 = v27;
      LOWORD(v61) = 2048;
      *(void *)((char *)&v61 + 2) = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Created operation %{public}@ for %{public}@, c:%lu, o:%ld", buf, 0x2Au);
    }
    id v28 = [v11 operationID];
    [v37 count];
    _MBLog();
  }
  id v29 = [(MBCKBatchFetch *)self fetchGroup];
  dispatch_group_enter(v29);

  id v30 = [(MBCKBatchFetch *)self callbackQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100128F20;
  block[3] = &unk_100411608;
  void block[4] = self;
  id v39 = v36;
  id v40 = v11;
  id v41 = v5;
  id v31 = v5;
  id v32 = v11;
  id v33 = v36;
  dispatch_block_t v34 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v30, v34);

  objc_destroyWeak(&v51);
  objc_destroyWeak(&v55);

  objc_destroyWeak(&location);
  _Block_object_dispose(v57, 8);
}

- (void)_scheduleBatchFetchOperationForFetchInfos:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    __assert_rtn("-[MBCKBatchFetch _scheduleBatchFetchOperationForFetchInfos:]", "MBCKBatchFetch.m", 504, "fetchInfos.count");
  }
  v5 = [(MBCKBatchFetch *)self fetchGroup];
  dispatch_group_enter(v5);

  uint64_t v6 = +[NSDate now];
  id v7 = [(MBCKBatchFetch *)self fetchSemaphore];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  id v8 = +[NSDate now];
  id v30 = (void *)v6;
  [v8 timeIntervalSinceDate:v6];
  uint64_t v10 = v9;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = 0;
    id v15 = 0;
    uint64_t v16 = *(void *)v34;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v11);
        }
        __int16 v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        dispatch_block_t v19 = [v18 retryDate];
        id v20 = v19;
        if (v19)
        {
          if (v15)
          {
            uint64_t v21 = [v15 laterDate:v19];

            id v15 = (id)v21;
          }
          else
          {
            id v15 = v19;
          }
        }
        v14 += (uint64_t)[v18 assetSize];
      }
      id v13 = [v11 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v14 = 0;
    id v15 = 0;
  }

  v22 = MBGetDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = [v11 count];
    *(_DWORD *)buf = 138544130;
    double v38 = self;
    __int16 v39 = 2048;
    double v40 = *(double *)&v23;
    __int16 v41 = 2048;
    uint64_t v42 = v14;
    __int16 v43 = 2048;
    uint64_t v44 = v10;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Preparing to fetch a batch for %{public}@, c:%lu, sz:%llu, tq:%.3fs", buf, 0x2Au);
    [v11 count];
    _MBLog();
  }

  if (v15)
  {
    [v15 timeIntervalSinceNow];
    double v25 = fmax(v24, 0.0);
    id v26 = MBGetDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      double v38 = self;
      __int16 v39 = 2048;
      double v40 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Scheduling a batch for %{public}@ in %0.3fs", buf, 0x16u);
      _MBLog();
    }

    dispatch_time_t v27 = dispatch_time(0, (uint64_t)(v25 * 1000000000.0));
    id v28 = dispatch_get_global_queue(17, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100129448;
    block[3] = &unk_1004110B0;
    void block[4] = self;
    id v32 = v11;
    dispatch_after(v27, v28, block);
  }
  else
  {
    [(MBCKBatchFetch *)self _sendBatchFetchOperationForFetchInfos:v11];
    id v29 = [(MBCKBatchFetch *)self fetchGroup];
    dispatch_group_leave(v29);
  }
}

- (void)_flushBatchedFetches:(unint64_t)a3
{
  if (!a3) {
    __assert_rtn("-[MBCKBatchFetch _flushBatchedFetches:]", "MBCKBatchFetch.m", 539, "flushCount");
  }
  unint64_t v3 = a3;
  v5 = [(MBCKBatchFetch *)self ckOperationPolicy];
  long long v35 = v5;
  uint64_t v6 = v5;
  if (!v5) {
    __assert_rtn("-[MBCKBatchFetch _flushBatchedFetches:]", "MBCKBatchFetch.m", 541, "policy");
  }
  id v36 = [v5 maxBatchCount];
  long long v34 = (char *)[v6 maxBatchFetchAssetSize];
  unsigned int v37 = [(MBCKBatchFetch *)self fetchIncrementally];
  double v38 = objc_opt_new();
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [(MBCKBatchFetch *)v7 fetchInfos];
  uint64_t v9 = [v8 objectEnumerator];

  uint64_t v10 = 0;
  uint64_t v11 = 0;
  while (1)
  {
    id v12 = objc_msgSend(v9, "nextObject", v33);
    id v13 = [v10 count];
    id v14 = v13;
    if (!v12 && !v13)
    {
      id v12 = 0;
      goto LABEL_39;
    }
    if (!v12)
    {
      id v21 = 0;
      goto LABEL_12;
    }
    if ([v12 state]) {
      goto LABEL_35;
    }
    id v15 = [v12 recordID];
    uint64_t v16 = [v15 recordName];
    id v17 = [v16 componentsSeparatedByString:@":"];

    if ([v17 count] == (id)5
      && ([v17 objectAtIndexedSubscript:0],
          __int16 v18 = objc_claimAutoreleasedReturnValue(),
          unsigned int v19 = [v18 isEqualToString:@"F"],
          v18,
          v19))
    {
      id v20 = [v17 objectAtIndexedSubscript:3];
      id v21 = [v20 integerValue];
    }
    else
    {
      id v21 = 0;
    }
    unsigned int v24 = v37;
    if (!v14) {
      unsigned int v24 = 0;
    }
    if (v24 != 1)
    {
LABEL_27:

      goto LABEL_28;
    }
    if (v14 >= v36) {
      break;
    }
    if (!v11) {
      goto LABEL_27;
    }

    if ((char *)v21 + v11 >= v34) {
      goto LABEL_12;
    }
LABEL_28:
    double v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      id v26 = v25;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        dispatch_time_t v27 = [v12 recordID];
        *(_DWORD *)buf = 138543362;
        v45 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Adding record %{public}@ to fetch batch", buf, 0xCu);
      }
      long long v33 = [v12 recordID];
      _MBLog();
    }
    [v12 setState:2];
    objc_msgSend(v12, "setFetchAttempts:", (char *)objc_msgSend(v12, "fetchAttempts") + 1);
    if (!v10) {
      uint64_t v10 = objc_opt_new();
    }
    objc_msgSend(v10, "addObject:", v12, v33);
    v11 += (uint64_t)v21;
LABEL_35:
  }
LABEL_12:
  if (!v10 || !v14) {
    __assert_rtn("-[MBCKBatchFetch _flushBatchedFetches:]", "MBCKBatchFetch.m", 578, "batch && batchCount");
  }
  v22 = MBGetDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v45 = v14;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Flushing %lu batched fetches", buf, 0xCu);
    long long v33 = v14;
    _MBLog();
  }

  [v38 addObject:v10];
  id v23 = [(MBCKBatchFetch *)v7 fetchGroup];
  dispatch_group_enter(v23);

  if (--v3)
  {
    uint64_t v11 = 0;
    uint64_t v10 = 0;
    if (!v12) {
      goto LABEL_35;
    }
    goto LABEL_28;
  }
  uint64_t v10 = 0;
LABEL_39:

  if ([v10 count]) {
    __assert_rtn("-[MBCKBatchFetch _flushBatchedFetches:]", "MBCKBatchFetch.m", 597, "!batch.count");
  }

  objc_sync_exit(v7);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v28 = v38;
  id v29 = [v28 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v40;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(v28);
        }
        -[MBCKBatchFetch _scheduleBatchFetchOperationForFetchInfos:](v7, "_scheduleBatchFetchOperationForFetchInfos:", *(void *)(*((void *)&v39 + 1) + 8 * i), v33);
        id v32 = [(MBCKBatchFetch *)v7 fetchGroup];
        dispatch_group_leave(v32);
      }
      id v29 = [v28 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v29);
  }
}

- (void)_fetchRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  [(MBCKBatchFetch *)self _flush];
  v5 = [(MBCKBatchFetch *)self fetchGroup];
  uint64_t v6 = dispatch_get_global_queue(17, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100129B14;
  v9[3] = &unk_1004124D8;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_group_notify(v5, v6, v8);
}

- (void)fetchRecordsWithCompletion:(id)a3
{
  id v6 = a3;
  if (atomic_exchange((atomic_uchar *volatile)&self->_started, 1u)) {
    __assert_rtn("-[MBCKBatchFetch fetchRecordsWithCompletion:]", "MBCKBatchFetch.m", 617, "!started && \"can't start a batch twice\"");
  }
  v5 = v4;
  [(MBCKBatchFetch *)self _fetchRecordsWithCompletion:v6];
}

- (BOOL)finishWithError:(id *)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100128E40;
  id v15 = sub_100128E50;
  id v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100129D2C;
  v8[3] = &unk_100410FC8;
  id v10 = &v11;
  v5 = dispatch_semaphore_create(0);
  uint64_t v9 = v5;
  [(MBCKBatchFetch *)self fetchRecordsWithCompletion:v8];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v12[5];
  }
  BOOL v6 = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)cancel
{
}

- (MBCKOperationPolicy)ckOperationPolicy
{
  return self->_ckOperationPolicy;
}

- (void)setCkOperationPolicy:(id)a3
{
}

- (BOOL)fetchIncrementally
{
  return self->_fetchIncrementally;
}

- (void)setFetchIncrementally:(BOOL)a3
{
  self->_fetchIncrementally = a3;
}

- (BOOL)retryWhenNetworkDisconnected
{
  return self->_retryWhenNetworkDisconnected;
}

- (void)setRetryWhenNetworkDisconnected:(BOOL)a3
{
  self->_retryWhenNetworkDisconnected = a3;
}

- (BOOL)usePrivilegedBatchRecordFetch
{
  return self->_usePrivilegedBatchRecordFetch;
}

- (void)setUsePrivilegedBatchRecordFetch:(BOOL)a3
{
  self->_usePrivilegedBatchRecordFetch = a3;
}

- (BOOL)useGlobalThreadLimit
{
  return self->_useGlobalThreadLimit;
}

- (void)setUseGlobalThreadLimit:(BOOL)a3
{
  self->_useGlobalThreadLimit = a3;
}

- (MBCKOperationTracker)ckOperationTracker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ckOperationTracker);
  return (MBCKOperationTracker *)WeakRetained;
}

- (void)setCkOperationTracker:(id)a3
{
}

- (NSMutableOrderedSet)fetchInfos
{
  return self->_fetchInfos;
}

- (void)setFetchInfos:(id)a3
{
}

- (NSMutableDictionary)fetchInfosByRecordID
{
  return self->_fetchInfosByRecordID;
}

- (void)setFetchInfosByRecordID:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_group)fetchGroup
{
  return self->_fetchGroup;
}

- (void)setFetchGroup:(id)a3
{
}

- (OS_dispatch_semaphore)fetchSemaphore
{
  return self->_fetchSemaphore;
}

- (void)setFetchSemaphore:(id)a3
{
}

- (NSError)fetchError
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFetchError:(id)a3
{
}

- (unint64_t)currentBatchAssetSize
{
  return self->_currentBatchAssetSize;
}

- (void)setCurrentBatchAssetSize:(unint64_t)a3
{
  self->_currentBatchAssetSize = a3;
}

- (unint64_t)currentBatchCount
{
  return self->_currentBatchCount;
}

- (void)setCurrentBatchCount:(unint64_t)a3
{
  self->_currentBatchCount = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_fetchSemaphore, 0);
  objc_storeStrong((id *)&self->_fetchGroup, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_fetchInfosByRecordID, 0);
  objc_storeStrong((id *)&self->_fetchInfos, 0);
  objc_destroyWeak((id *)&self->_ckOperationTracker);
  objc_storeStrong((id *)&self->_ckOperationPolicy, 0);
}

@end