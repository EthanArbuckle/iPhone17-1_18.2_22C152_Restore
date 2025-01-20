@interface MBCKBatchSave
- (BOOL)canceled;
- (BOOL)finishWithError:(id *)a3;
- (BOOL)retryWhenNetworkDisconnected;
- (BOOL)saveIncrementally;
- (MBCKBatchSave)initWithOperationTracker:(id)a3;
- (MBCKOperationPolicy)ckOperationPolicy;
- (MBCKOperationTracker)ckOperationTracker;
- (MBCKThroughputEstimator)throughputEstimator;
- (NSError)saveError;
- (NSMutableArray)timers;
- (NSMutableDictionary)saveInfosByRecordID;
- (NSMutableOrderedSet)saveInfos;
- (OS_dispatch_group)saveGroup;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_semaphore)saveSemaphore;
- (id)_createModifyOperationForSaveInfos:(id)a3;
- (unint64_t)currentBatchAssetSize;
- (unint64_t)currentBatchCount;
- (unint64_t)currentBatchSize;
- (void)_finishBatchedSavesWithCompletion:(id)a3;
- (void)_flush;
- (void)_flushBatchedSaves:(unint64_t)a3;
- (void)_handleCompletionForSaveInfo:(id)a3 operation:(id)a4 record:(id)a5 saveInfos:(id)a6 error:(id)a7;
- (void)_handleCompletionForSaveInfos:(id)a3 operation:(id)a4 savedRecords:(id)a5 operationError:(id)a6;
- (void)_performCallbacksForSaveInfo:(id)a3 record:(id)a4 error:(id)a5;
- (void)_saveRecordsWithCompletion:(id)a3;
- (void)_scheduleBatchSaveOperationForSaveInfos:(id)a3;
- (void)_sendBatchSaveOperationForSaveInfos:(id)a3 savePolicy:(int64_t)a4 batchSize:(unint64_t)a5 batchAssetsSize:(unint64_t)a6;
- (void)cancel;
- (void)dealloc;
- (void)saveRecord:(id)a3 assetSize:(int64_t)a4 delegate:(id)a5 completion:(id)a6;
- (void)saveRecord:(id)a3 delegate:(id)a4 completion:(id)a5;
- (void)saveRecordsWithCompletion:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCkOperationPolicy:(id)a3;
- (void)setCkOperationTracker:(id)a3;
- (void)setCurrentBatchAssetSize:(unint64_t)a3;
- (void)setCurrentBatchCount:(unint64_t)a3;
- (void)setCurrentBatchSize:(unint64_t)a3;
- (void)setRetryWhenNetworkDisconnected:(BOOL)a3;
- (void)setSaveError:(id)a3;
- (void)setSaveGroup:(id)a3;
- (void)setSaveIncrementally:(BOOL)a3;
- (void)setSaveInfos:(id)a3;
- (void)setSaveInfosByRecordID:(id)a3;
- (void)setThroughputEstimator:(id)a3;
- (void)setTimers:(id)a3;
@end

@implementation MBCKBatchSave

- (MBCKBatchSave)initWithOperationTracker:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKBatchSave initWithOperationTracker:]", "MBCKBatchSave.m", 79, "tracker");
  }
  v5 = v4;
  uint64_t v6 = [v4 ckOperationPolicy];
  if (!v6) {
    __assert_rtn("-[MBCKBatchSave initWithOperationTracker:]", "MBCKBatchSave.m", 81, "policy");
  }
  v7 = (void *)v6;
  v24.receiver = self;
  v24.super_class = (Class)MBCKBatchSave;
  v8 = [(MBCKBatchSave *)&v24 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_ckOperationTracker, v5);
    objc_storeStrong((id *)&v9->_ckOperationPolicy, v7);
    *(_WORD *)&v9->_saveIncrementally = 257;
    uint64_t v10 = objc_opt_new();
    saveInfos = v9->_saveInfos;
    v9->_saveInfos = (NSMutableOrderedSet *)v10;

    uint64_t v12 = objc_opt_new();
    saveInfosByRecordID = v9->_saveInfosByRecordID;
    v9->_saveInfosByRecordID = (NSMutableDictionary *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.backupd.batchSave", v15);
    callbackQueue = v9->_callbackQueue;
    v9->_callbackQueue = (OS_dispatch_queue *)v16;

    dispatch_group_t v18 = dispatch_group_create();
    saveGroup = v9->_saveGroup;
    v9->_saveGroup = (OS_dispatch_group *)v18;

    atomic_store(0, (unsigned int *)&v9->_pendingOperationsCount);
    atomic_store(0, (unsigned __int8 *)&v9->_started);
    v20 = [[MBCKThroughputEstimator alloc] initWithSamplingPeriod:30 maximumNumberOfPeriods:60.0];
    throughputEstimator = v9->_throughputEstimator;
    v9->_throughputEstimator = v20;

    v22 = objc_opt_new();
    [(MBCKBatchSave *)v9 setTimers:v22];
  }
  return v9;
}

- (void)dealloc
{
  if ([(NSMutableOrderedSet *)self->_saveInfos count]) {
    __assert_rtn("-[MBCKBatchSave dealloc]", "MBCKBatchSave.m", 101, "_saveInfos.count == 0");
  }
  v3.receiver = self;
  v3.super_class = (Class)MBCKBatchSave;
  [(MBCKBatchSave *)&v3 dealloc];
}

- (OS_dispatch_semaphore)saveSemaphore
{
  if (qword_1004824D8 != -1) {
    dispatch_once(&qword_1004824D8, &stru_100413B08);
  }
  v2 = (void *)qword_1004824D0;
  return (OS_dispatch_semaphore *)v2;
}

- (void)saveRecord:(id)a3 delegate:(id)a4 completion:(id)a5
{
}

- (void)saveRecord:(id)a3 assetSize:(int64_t)a4 delegate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, id, void *))a6;
  v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = [v10 recordID];
    *(_DWORD *)buf = 138543618;
    id v56 = v15;
    __int16 v57 = 2114;
    v58 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Adding a save for %{public}@ to %{public}@", buf, 0x16u);

    v51 = [v10 recordID];
    _MBLog();
  }
  if (v10)
  {
    unsigned __int8 v22 = atomic_load((unsigned __int8 *)&self->_started);
    if (v22)
    {
      v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "You can't add a new recordID to an already started batch", buf, 2u);
      }
    }
    objc_super v24 = _MBAssert((v22 & 1) == 0, @"You can't add a new recordID to an already started batch", v16, v17, v18, v19, v20, v21, (uint64_t)v51);
    if (v24)
    {
      if (v12) {
        v12[2](v12, v10, v24);
      }
    }
    else
    {
      v25 = self;
      objc_sync_enter(v25);
      v54 = [v10 recordID];
      v26 = [(MBCKBatchSave *)v25 saveInfosByRecordID];
      v27 = [v26 objectForKeyedSubscript:v54];

      if (v27)
      {
        v34 = MBGetDefaultLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v10;
          _os_log_fault_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "You can't try to save the same record twice: %@", buf, 0xCu);
        }
      }
      objc_super v24 = _MBAssert(v27 == 0, @"You can't try to save the same record twice: %@", v28, v29, v30, v31, v32, v33, (uint64_t)v10);
      if (v24)
      {
        if (v12) {
          v12[2](v12, 0, v24);
        }
        char v35 = 0;
      }
      else
      {
        v36 = [(MBCKBatchSave *)v25 ckOperationPolicy];
        if (!v36) {
          __assert_rtn("-[MBCKBatchSave saveRecord:assetSize:delegate:completion:]", "MBCKBatchSave.m", 148, "policy");
        }
        v53 = v36;
        id v37 = [v36 recordSavePolicy];
        if (objc_opt_respondsToSelector()) {
          id v37 = [v11 savePolicy];
        }
        v38 = objc_opt_new();
        [v38 setState:0];
        [v38 setSavePolicy:v37];
        [v38 setDelegate:v11];
        [v38 setRecord:v10];
        objc_msgSend(v38, "setRecordSize:", objc_msgSend(v10, "size"));
        [v38 setCompletion:v12];
        [v38 setUploadProgress:0.0];
        v39 = [v54 recordName];
        v52 = [v39 componentsSeparatedByString:@":"];

        if (a4)
        {
          [v38 setAssetSize:a4];
        }
        else if ([v52 count] == (id)5)
        {
          v40 = [v52 objectAtIndexedSubscript:0];
          unsigned int v41 = [v40 isEqualToString:@"F"];

          if (v41)
          {
            v42 = [v52 objectAtIndexedSubscript:3];
            objc_msgSend(v38, "setAssetSize:", objc_msgSend(v42, "integerValue"));
          }
        }
        id v43 = [v53 maxBatchCount];
        v44 = (char *)[v53 maxBatchSize];
        v45 = (char *)[v53 maxBatchSaveAssetSize];
        if ([(MBCKBatchSave *)v25 saveIncrementally]
          && ([(MBCKBatchSave *)v25 currentBatchCount]
           && (id)[(MBCKBatchSave *)v25 currentBatchCount] >= v43
           || [(MBCKBatchSave *)v25 currentBatchSize]
           && (v46 = [(MBCKBatchSave *)v25 currentBatchSize],
               &v46[(void)[v38 recordSize]] >= v44)
           || [(MBCKBatchSave *)v25 currentBatchAssetSize]
           && (v47 = (char *)[v38 assetSize],
               &v47[[(MBCKBatchSave *)v25 currentBatchAssetSize]] >= v45)))
        {
          [(MBCKBatchSave *)v25 setCurrentBatchSize:0];
          [(MBCKBatchSave *)v25 setCurrentBatchCount:0];
          [(MBCKBatchSave *)v25 setCurrentBatchAssetSize:0];
          char v35 = 1;
        }
        else
        {
          char v35 = 0;
        }
        [(MBCKBatchSave *)v25 setCurrentBatchCount:(char *)[(MBCKBatchSave *)v25 currentBatchCount] + 1];
        -[MBCKBatchSave setCurrentBatchSize:](v25, "setCurrentBatchSize:", (char *)[v38 recordSize] + -[MBCKBatchSave currentBatchSize](v25, "currentBatchSize"));
        -[MBCKBatchSave setCurrentBatchAssetSize:](v25, "setCurrentBatchAssetSize:", (char *)[v38 assetSize] + -[MBCKBatchSave currentBatchAssetSize](v25, "currentBatchAssetSize"));
        v48 = [(MBCKBatchSave *)v25 saveInfosByRecordID];
        v49 = [v10 recordID];
        [v48 setObject:v38 forKeyedSubscript:v49];

        v50 = [(MBCKBatchSave *)v25 saveInfos];
        [v50 addObject:v38];
      }
      objc_sync_exit(v25);

      if (((v24 == 0) & v35) == 1)
      {
        [(MBCKBatchSave *)v25 _flushBatchedSaves:1];
        objc_super v24 = 0;
      }
    }
  }
  else
  {
    objc_super v24 = +[MBError errorWithCode:1 format:@"You can't save a nil record"];
    if (v11) {
      [v11 recordWasSaved:0 withError:v24];
    }
    if (v12) {
      v12[2](v12, 0, v24);
    }
  }
}

- (void)_flush
{
  [(MBCKBatchSave *)self _flushBatchedSaves:-1];
}

- (void)_performCallbacksForSaveInfo:(id)a3 record:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 state] == (id)3)
  {
    objc_super v24 = +[NSAssertionHandler currentHandler];
    v25 = [v9 record];
    v26 = [v25 recordID];
    v27 = +[NSThread callStackSymbols];
    [v24 handleFailureInMethod:a2, self, @"MBCKBatchSave.m", 207, @"We've already finished saving record %@: %@", v26, v27 object file lineNumber description];
  }
  uint64_t v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = [v9 record];
    v14 = [v13 recordID];
    *(_DWORD *)buf = 138543362;
    id v37 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Performing callbacks for save of record %{public}@", buf, 0xCu);

    v15 = [v9 record];
    uint64_t v28 = [v15 recordID];
    _MBLog();
  }
  [v9 setState:3];
  [v9 setError:v11];
  if (!v10)
  {
    id v10 = [v9 record];
  }
  uint64_t v16 = objc_msgSend(v9, "completion", v28);
  [v9 setCompletion:0];
  uint64_t v17 = [v9 delegate];
  [v9 setDelegate:0];
  uint64_t v18 = [(MBCKBatchSave *)self callbackQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011FD20;
  block[3] = &unk_100413B30;
  id v30 = v11;
  id v31 = v9;
  uint64_t v32 = self;
  id v33 = v17;
  id v34 = v10;
  id v35 = v16;
  id v19 = v16;
  id v20 = v10;
  id v21 = v17;
  id v22 = v9;
  id v23 = v11;
  dispatch_async(v18, block);
}

- (void)_handleCompletionForSaveInfo:(id)a3 operation:(id)a4 record:(id)a5 saveInfos:(id)a6 error:(id)a7
{
  id v12 = a3;
  unint64_t v13 = (unint64_t)a4;
  id v14 = a5;
  id v15 = a6;
  unint64_t v16 = (unint64_t)a7;
  if (!v12) {
    __assert_rtn("-[MBCKBatchSave _handleCompletionForSaveInfo:operation:record:saveInfos:error:]", "MBCKBatchSave.m", 237, "saveInfo");
  }
  uint64_t v17 = (void *)v16;
  if (!(v13 | v16)) {
    __assert_rtn("-[MBCKBatchSave _handleCompletionForSaveInfo:operation:record:saveInfos:error:]", "MBCKBatchSave.m", 238, "operation || error");
  }
  if (!v15) {
    __assert_rtn("-[MBCKBatchSave _handleCompletionForSaveInfo:operation:record:saveInfos:error:]", "MBCKBatchSave.m", 239, "saveInfos");
  }
  if ([v12 state] != (id)3)
  {
    uint64_t v18 = [v12 record];
    id v19 = [v18 recordID];

    id v20 = [v12 saveAttempts];
    [v12 setError:v17];
    if (!v17)
    {
      v36 = MBGetDefaultLog();
      id v37 = v36;
      if (v20 == (id)1)
      {
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_98;
        }
        *(_DWORD *)buf = 138543362;
        v110 = v19;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Saved record %{public}@", buf, 0xCu);
      }
      else
      {
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_98;
        }
        *(_DWORD *)buf = 138543618;
        v110 = v19;
        __int16 v111 = 2048;
        double v112 = *(double *)&v20;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Saved record %{public}@ after %lu attempts", buf, 0x16u);
      }
LABEL_97:
      _MBLog();
      goto LABEL_98;
    }
    id v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v110 = v19;
      __int16 v111 = 2112;
      double v112 = *(double *)&v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Handling save error for record %{public}@: %@", buf, 0x16u);
      v84 = v19;
      v86 = v17;
      _MBLog();
    }

    uint64_t v22 = [(MBCKBatchSave *)self ckOperationTracker];
    if (!v22) {
      __assert_rtn("-[MBCKBatchSave _handleCompletionForSaveInfo:operation:record:saveInfos:error:]", "MBCKBatchSave.m", 250, "tracker");
    }
    id v23 = (void *)v22;
    objc_super v24 = [(MBCKBatchSave *)self ckOperationPolicy];
    if (!v24) {
      __assert_rtn("-[MBCKBatchSave _handleCompletionForSaveInfo:operation:record:saveInfos:error:]", "MBCKBatchSave.m", 252, "policy");
    }
    unint64_t v100 = (unint64_t)v20;
    v101 = v23;
    v102 = v24;
    [v24 retryAfterInterval];
    double v26 = fmax(v25, 1.0);
    v27 = [v17 domain];
    unsigned int v28 = [v27 isEqualToString:CKErrorDomain];

    if (!v28)
    {
      if ((+[MBError isError:v17 withCode:304] & 1) == 0)
      {
        BOOL v30 = +[MBError isRetryableXPCError:v17];
        if (v30) {
          double v26 = 5.0;
        }
LABEL_57:
        if (objc_msgSend((id)v13, "atomic", v84, v86, v87, v88, v89))
        {
          v93 = v15;
          id v56 = [v12 record];
          [v56 recordID];
          __int16 v57 = v98 = self;
          [v57 zoneID];
          v58 = id v95 = v14;
          +[CKRecordZone defaultRecordZone];
          v59 = v91 = v19;
          v60 = [v59 zoneID];
          unsigned __int8 v61 = [v58 isEqual:v60];

          id v19 = v91;
          id v14 = v95;

          self = v98;
          if (v61)
          {
LABEL_59:
            id v15 = v93;
            if (!v30) {
              goto LABEL_95;
            }
            goto LABEL_82;
          }
          id v15 = v93;
          if (!v30 && +[MBError isCKError:v17 withCode:14])
          {
LABEL_95:

            id v37 = MBGetDefaultLog();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              v110 = v19;
              __int16 v111 = 2048;
              double v112 = *(double *)&v100;
              __int16 v113 = 2112;
              unint64_t v114 = (unint64_t)v17;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to save record %{public}@ after %lu attempts, error:%@", buf, 0x20u);
              goto LABEL_97;
            }
LABEL_98:

            [(MBCKBatchSave *)self _performCallbacksForSaveInfo:v12 record:v14 error:v17];
LABEL_99:

            goto LABEL_100;
          }
          long long v105 = 0u;
          long long v106 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          id v62 = v93;
          id v63 = [v62 countByEnumeratingWithState:&v103 objects:v108 count:16];
          if (v63)
          {
            id v64 = v63;
            int v65 = 0;
            char v66 = 0;
            uint64_t v67 = *(void *)v104;
            do
            {
              for (i = 0; i != v64; i = (char *)i + 1)
              {
                if (*(void *)v104 != v67) {
                  objc_enumerationMutation(v62);
                }
                id v69 = *(id *)(*((void *)&v103 + 1) + 8 * i);
                if (v69 != v12)
                {
                  id v70 = [v69 state];
                  if (v70 == (id)1)
                  {
                    char v66 = 1;
                  }
                  else if (v70 == (id)3)
                  {
                    int v65 = 1;
                  }
                }
              }
              id v64 = [v62 countByEnumeratingWithState:&v103 objects:v108 count:16];
            }
            while (v64);

            if (v30 || (v66 & 1) == 0)
            {
              id v14 = v95;
              self = v98;
              id v19 = v91;
              if ((v30 & v65) == 1)
              {
                v71 = MBGetDefaultLog();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v110 = v91;
                  _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Not retrying %{public}@", buf, 0xCu);
                  _MBLog();
                }
                id v15 = v93;
LABEL_94:

                goto LABEL_95;
              }
              goto LABEL_59;
            }
            v82 = MBGetDefaultLog();
            id v15 = v93;
            id v14 = v95;
            id v19 = v91;
            self = v98;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v110 = v91;
              _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Forcing retry for %{public}@", buf, 0xCu);
              v85 = v91;
              _MBLog();
            }

LABEL_82:
            if (v100 > (unint64_t)objc_msgSend(v102, "maxRetryAttempts", v85)) {
              goto LABEL_95;
            }
            v72 = [v17 userInfo];
            v73 = [v72 objectForKeyedSubscript:CKErrorRetryAfterKey];

            if (v73)
            {
              [v73 doubleValue];
              double v26 = v74;
            }
            v99 = v73;
            double v75 = fmax(v26, 0.0);
            v76 = [v12 delegate];
            if ((objc_opt_respondsToSelector() & 1) == 0
              || ([v76 shouldRetrySaveWithRetryAfterInterval:v19 recordID:v17 error:v75] & 1) != 0)
            {
              v77 = v19;
              v78 = MBGetDefaultLog();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v110 = v77;
                __int16 v111 = 2048;
                double v112 = v75;
                __int16 v113 = 2048;
                unint64_t v114 = v100;
                _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Retrying save of record %{public}@ in %0.3fs after %lu attempts", buf, 0x20u);
                _MBLog();
              }

              v79 = +[NSDate dateWithTimeIntervalSinceNow:v75];
              [v12 setRetryDate:v79];

              [v12 setState:1];
              id v19 = v77;
              id v35 = v101;
              id v34 = v99;
LABEL_90:

              goto LABEL_99;
            }
            v80 = self;
            v81 = MBGetDefaultLog();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v110 = v19;
              __int16 v111 = 2048;
              double v112 = v75;
              _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Not retrying save of record %{public}@ in %0.3fs per delegate", buf, 0x16u);
              _MBLog();
            }

            self = v80;
            v71 = v99;
            goto LABEL_94;
          }

          self = v98;
        }
        if (!v30) {
          goto LABEL_95;
        }
        goto LABEL_82;
      }
      double v26 = 2.0;
LABEL_56:
      BOOL v30 = 1;
      goto LABEL_57;
    }
    uint64_t v29 = (uint64_t)[v17 code];
    BOOL v30 = 0;
    if (v29 <= 21)
    {
      switch(v29)
      {
        case 2:
          id v31 = self;
          uint64_t v32 = [v17 userInfo];
          id v33 = [v32 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];
          id v34 = [v33 objectForKeyedSubscript:v19];

          if (v34)
          {
            [(MBCKBatchSave *)v31 _handleCompletionForSaveInfo:v12 operation:v13 record:v14 saveInfos:v15 error:v34];
            id v35 = v101;
            goto LABEL_90;
          }
          v83 = MBGetDefaultLog();
          self = v31;
          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v110 = v19;
            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "No partial error found for record %{public}@", buf, 0xCu);
            v84 = v19;
            _MBLog();
          }

LABEL_108:
          BOOL v30 = 0;
          break;
        case 3:
          id v43 = MBGetDefaultLog();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v110 = v19;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Save of record %{public}@ hit a network unavailable error", buf, 0xCu);
            v84 = v19;
            _MBLog();
          }

          if (+[MBError isNetworkDisconnectedError:v17]
            && ![(MBCKBatchSave *)self retryWhenNetworkDisconnected])
          {
            goto LABEL_108;
          }
          double v44 = (double)arc4random_uniform(5u);
          double v45 = 10.0;
LABEL_38:
          double v26 = fmax(v26, v44 + v45);
          goto LABEL_56;
        case 4:
          v46 = MBGetDefaultLog();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v110 = v19;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Save of record %{public}@ hit a network failure error", buf, 0xCu);
            v84 = v19;
            _MBLog();
          }

          double v44 = (double)arc4random_uniform(5u);
          double v45 = 1.0;
          goto LABEL_38;
        case 6:
          v47 = MBGetDefaultLog();
          if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            goto LABEL_55;
          }
          *(_DWORD *)buf = 138543362;
          v110 = v19;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Save of record %{public}@ hit a service unavailable error", buf, 0xCu);
          v84 = v19;
          goto LABEL_54;
        case 7:
          v48 = MBGetDefaultLog();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v110 = v19;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Save of record %{public}@ was rate limited", buf, 0xCu);
            v84 = v19;
            _MBLog();
          }

          if (!+[MBError isNetworkDisconnectedError:v17]) {
            goto LABEL_56;
          }
          BOOL v30 = [(MBCKBatchSave *)self retryWhenNetworkDisconnected];
          goto LABEL_57;
        case 14:
          v49 = [v12 delegate];
          if (objc_opt_respondsToSelector())
          {
            v97 = [v12 record];
            v50 = [v17 userInfo];
            v94 = [v50 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey];

            v51 = [v17 userInfo];
            uint64_t v52 = [v51 objectForKeyedSubscript:CKRecordChangedErrorAncestorRecordKey];

            v90 = v49;
            v92 = (void *)v52;
            v53 = [v49 handleMergeConflictWithOperationTracker:v101 attemptedRecord:v97 serverRecord:v94 originalRecord:v52];
            BOOL v30 = v53 != 0;
            v54 = MBGetDefaultLog();
            BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
            if (v53)
            {
              if (v55)
              {
                *(_DWORD *)buf = 138544386;
                v110 = v19;
                __int16 v111 = 2112;
                double v112 = *(double *)&v97;
                __int16 v113 = 2112;
                unint64_t v114 = (unint64_t)v94;
                __int16 v115 = 2112;
                v116 = v92;
                __int16 v117 = 2112;
                v118 = v53;
                _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Merged record %{public}@, attemptedRecord:%@, serverRecord:%@, originalRecord:%@, mergedRecord:%@", buf, 0x34u);
                v88 = v92;
                v89 = v53;
                v86 = v97;
                v87 = v94;
                v84 = v19;
                _MBLog();
              }

              [v12 setRecord:v53];
              double v26 = 0.01;
            }
            else
            {
              if (v55)
              {
                *(_DWORD *)buf = 138543362;
                v110 = v19;
                _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Save delegate didn't want to merge record %{public}@", buf, 0xCu);
                v84 = v19;
                _MBLog();
              }
            }
            v49 = v90;
          }
          else
          {
            BOOL v30 = 0;
          }

          goto LABEL_57;
        default:
          goto LABEL_57;
      }
      goto LABEL_57;
    }
    if (v29 == 22)
    {
      v47 = MBGetDefaultLog();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
LABEL_55:

        goto LABEL_56;
      }
      *(_DWORD *)buf = 138543362;
      v110 = v19;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Save of record %{public}@ hit an atomic failure", buf, 0xCu);
      v84 = v19;
    }
    else
    {
      if (v29 != 23)
      {
        if (v29 == 26)
        {
          v96 = self;
          uint64_t v38 = [v101 databaseManager];
          if (!v38) {
            __assert_rtn("-[MBCKBatchSave _handleCompletionForSaveInfo:operation:record:saveInfos:error:]", "MBCKBatchSave.m", 289, "databaseManager");
          }
          v39 = (void *)v38;
          v40 = [v101 account];
          unsigned int v41 = [v101 ckOperationGroup];
          v42 = [v101 xpcActivity];
          uint64_t v107 = 0;
          [v39 setUpSyncZoneWithAccount:v40 policy:v102 operationGroup:v41 xpcActivity:v42 error:&v107];

          BOOL v30 = 1;
          self = v96;
        }
        goto LABEL_57;
      }
      v47 = MBGetDefaultLog();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        goto LABEL_55;
      }
      *(_DWORD *)buf = 138543362;
      v110 = v19;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Save of record %{public}@ got a zone busy error", buf, 0xCu);
      v84 = v19;
    }
LABEL_54:
    _MBLog();
    goto LABEL_55;
  }
LABEL_100:
}

- (void)_finishBatchedSavesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(MBCKBatchSave *)v5 saveInfos];
  id v7 = [v6 count];

  objc_sync_exit(v5);
  if (v7)
  {
    [(MBCKBatchSave *)v5 _saveRecordsWithCompletion:v4];
  }
  else
  {
    if ([(MBCKBatchSave *)v5 canceled]) {
      +[MBError errorWithCode:202 format:@"Batch save canceled"];
    }
    else {
    v8 = [(MBCKBatchSave *)v5 saveError];
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
        id v19 = v8;
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
      id v11 = [(MBCKBatchSave *)v5 callbackQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100121108;
      block[3] = &unk_100413A50;
      id v15 = v4;
      id v14 = v8;
      dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v11, v12);
    }
  }
}

- (id)_createModifyOperationForSaveInfos:(id)a3
{
  id v4 = a3;
  v5 = [v4 valueForKey:@"record"];
  uint64_t v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [v5 count];
    v8 = [v5 valueForKey:@"recordID"];
    *(_DWORD *)buf = 134218498;
    id v19 = v7;
    __int16 v20 = 2114;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Creating batch of %lu records for %{public}@, recordIDs:%{public}@", buf, 0x20u);

    [v5 count];
    dispatch_block_t v12 = [v5 valueForKey:@"recordID"];
    _MBLog();
  }
  id v9 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v5 recordIDsToDelete:0];
  objc_initWeak((id *)buf, v9);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100121410;
  v17[3] = &unk_100413B58;
  v17[4] = self;
  [v9 setPerRecordProgressBlock:v17];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100121768;
  v16[3] = &unk_100413B80;
  v16[4] = self;
  [v9 setRecordsInFlightBlock:v16];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001219C0;
  v13[3] = &unk_100411278;
  objc_copyWeak(&v15, (id *)buf);
  v13[4] = self;
  id v10 = v4;
  id v14 = v10;
  [v9 setPerRecordSaveBlock:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

  return v9;
}

- (void)_handleCompletionForSaveInfos:(id)a3 operation:(id)a4 savedRecords:(id)a5 operationError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v32 = a5;
  id v12 = a6;
  id v34 = v11;
  unint64_t v13 = [v11 operationID];
  id v35 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  id v33 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  obj = self;
  objc_sync_enter(obj);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = v10;
  id v15 = [v14 countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v15)
  {
    unint64_t v16 = 0;
    uint64_t v17 = *(void *)v38;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if ([v19 state] == (id)2)
        {
          if (!v12)
          {
            if (MBIsInternalInstall())
            {
              if (!v13) {
                __assert_rtn("-[MBCKBatchSave _handleCompletionForSaveInfos:operation:savedRecords:operationError:]", "MBCKBatchSave.m", 495, "operationID");
              }
              __int16 v20 = MBGetDefaultLog();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138413058;
                double v44 = v13;
                __int16 v45 = 2112;
                v46 = v19;
                __int16 v47 = 2112;
                id v48 = v14;
                __int16 v49 = 2112;
                id v50 = v32;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Received unexpected completion for operationID:%@, saveInfo:%@, saveInfos:%@, savedRecords:%@", buf, 0x2Au);
                _MBLog();
              }

              v41[0] = @"operationID";
              v41[1] = @"recordID";
              v42[0] = v13;
              id v21 = [v19 record];
              __int16 v22 = [v21 recordID];
              v42[1] = v22;
              id v23 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];

              if (!dword_1004824C8 && !atomic_fetch_add_explicit(&dword_1004824C8, 1u, memory_order_relaxed)) {
                _MBCreateDiagnosticReport(@"CKModifyRecordsOperation completed successfully without invoking perRecordCompletionBlock", v23);
              }
            }
            objc_super v24 = MBGetDefaultLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              double v44 = v13;
              __int16 v45 = 2112;
              v46 = v19;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Received unexpected completion for operationID:%@, saveInfo:%@", buf, 0x16u);
              _MBLog();
            }

            id v12 = +[MBError errorWithCode:304, @"Unexpected nil error for operation %@", v13 format];
          }
          [(MBCKBatchSave *)obj _handleCompletionForSaveInfo:v19 operation:v34 record:0 saveInfos:v14 error:v12];
          if ([v19 state] == (id)3)
          {
            double v25 = [v19 record];
            double v26 = [v25 recordID];
            [v33 addObject:v26];
          }
        }
        if ([v19 state] == (id)3)
        {
          v27 = [v19 error];
          [v35 addObject:v19];
          if (v27)
          {
            if (v12) {
              unsigned int v28 = v12;
            }
            else {
              unsigned int v28 = v27;
            }
            id v29 = v28;

            unint64_t v16 = v29;
          }
        }
        else if ([v19 state] == (id)1)
        {
          [v19 setState:0];
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v37 objects:v51 count:16];
    }
    while (v15);

    if (v16) {
      [(MBCKBatchSave *)obj setSaveError:v16];
    }
  }
  else
  {

    unint64_t v16 = 0;
  }
  BOOL v30 = [(MBCKBatchSave *)obj saveInfosByRecordID];
  [v30 removeObjectsForKeys:v33];

  id v31 = [(MBCKBatchSave *)obj saveInfos];
  [v31 removeObjectsInArray:v35];

  objc_sync_exit(obj);
}

- (void)_sendBatchSaveOperationForSaveInfos:(id)a3 savePolicy:(int64_t)a4 batchSize:(unint64_t)a5 batchAssetsSize:(unint64_t)a6
{
  id v10 = a3;
  id v11 = [(MBCKBatchSave *)self ckOperationTracker];
  if (!v11) {
    __assert_rtn("-[MBCKBatchSave _sendBatchSaveOperationForSaveInfos:savePolicy:batchSize:batchAssetsSize:]", "MBCKBatchSave.m", 527, "tracker");
  }
  id v12 = [(MBCKBatchSave *)self ckOperationPolicy];
  if (!v12) {
    __assert_rtn("-[MBCKBatchSave _sendBatchSaveOperationForSaveInfos:savePolicy:batchSize:batchAssetsSize:]", "MBCKBatchSave.m", 529, "policy");
  }
  unint64_t v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    v36 = self;
    __int16 v37 = 2048;
    int64_t v38 = a4;
    __int16 v39 = 2048;
    id v40 = [v10 count];
    __int16 v41 = 2048;
    unint64_t v42 = a5;
    __int16 v43 = 2048;
    unint64_t v44 = a6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Saving a batch for %{public}@, sp:%ld, c:%lu, sz:%lu(%llu)", buf, 0x34u);
    [v10 count];
    _MBLog();
  }

  id v14 = [(MBCKBatchSave *)self _createModifyOperationForSaveInfos:v10];
  objc_initWeak(&location, v14);
  [v14 setSavePolicy:a4];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10012246C;
  v31[3] = &unk_100413BA8;
  objc_copyWeak(&v33, &location);
  v31[4] = self;
  id v15 = v10;
  id v32 = v15;
  [v14 setModifyRecordsCompletionBlock:v31];
  int pendingOperationsCount = self->_pendingOperationsCount;
  uint64_t v17 = MBGetDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = (void *)pendingOperationsCount;
    id v19 = v17;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = [v14 operationID];
      *(_DWORD *)buf = 138543874;
      v36 = v20;
      __int16 v37 = 2114;
      int64_t v38 = (int64_t)self;
      __int16 v39 = 2048;
      id v40 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Created operation %{public}@ for %{public}@, o:%ld", buf, 0x20u);
    }
    double v26 = [v14 operationID];
    _MBLog();
  }
  id v21 = [(MBCKBatchSave *)self saveGroup];
  dispatch_group_enter(v21);

  __int16 v22 = [(MBCKBatchSave *)self callbackQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122698;
  block[3] = &unk_100411608;
  void block[4] = self;
  id v28 = v11;
  id v29 = v14;
  id v30 = v12;
  id v23 = v12;
  id v24 = v14;
  id v25 = v11;
  dispatch_async(v22, block);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

- (void)_scheduleBatchSaveOperationForSaveInfos:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    __assert_rtn("-[MBCKBatchSave _scheduleBatchSaveOperationForSaveInfos:]", "MBCKBatchSave.m", 569, "saveInfos.count");
  }
  __int16 v37 = self;
  v5 = [(MBCKBatchSave *)self saveGroup];
  dispatch_group_enter(v5);

  v36 = +[NSDate now];
  uint64_t v6 = [(MBCKBatchSave *)v37 saveSemaphore];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  id v7 = +[NSDate now];
  [v7 timeIntervalSinceDate:v36];
  uint64_t v9 = v8;

  id v10 = [v4 firstObject];
  id v11 = [v10 savePolicy];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v4;
  id v12 = 0;
  unint64_t v13 = 0;
  id v14 = 0;
  id v15 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v43;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(obj);
        }
        __int16 v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (v11 != [v18 savePolicy]) {
          __assert_rtn("-[MBCKBatchSave _scheduleBatchSaveOperationForSaveInfos:]", "MBCKBatchSave.m", 582, "savePolicy == saveInfo.savePolicy");
        }
        id v19 = [v18 retryDate];
        __int16 v20 = v19;
        if (v19)
        {
          if (v14)
          {
            uint64_t v21 = [v14 laterDate:v19];

            id v14 = (id)v21;
          }
          else
          {
            id v14 = v19;
          }
        }
        id v22 = [v18 recordSize];
        id v23 = [v18 assetSize];

        unint64_t v13 = &v13[(void)v22];
        id v12 = &v12[(void)v23];
      }
      id v15 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
    }
    while (v15);
  }

  id v24 = MBGetDefaultLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [obj count];
    *(_DWORD *)buf = 138544386;
    __int16 v47 = v37;
    __int16 v48 = 2048;
    double v49 = *(double *)&v25;
    __int16 v50 = 2048;
    v51 = v13;
    __int16 v52 = 2048;
    v53 = v12;
    __int16 v54 = 2048;
    uint64_t v55 = v9;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Preparing to save a batch for %{public}@, c:%lu, sz:%lu(%llu), tq:%.3fs", buf, 0x34u);
    [obj count];
    _MBLog();
  }

  if (v14)
  {
    [v14 timeIntervalSinceNow];
    double v27 = v26;
    id v28 = MBGetDefaultLog();
    double v29 = fmax(v27, 0.0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v47 = v37;
      __int16 v48 = 2048;
      double v49 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Scheduling a batch for %{public}@ in %0.3fs", buf, 0x16u);
      _MBLog();
    }

    id v30 = [MBOneShotTimer alloc];
    id v31 = dispatch_get_global_queue(17, 0);
    id v32 = [(MBOneShotTimer *)v30 initWithSeconds:v31 queue:v29];

    objc_initWeak((id *)buf, v32);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100122D34;
    v39[3] = &unk_100413BD0;
    objc_copyWeak(v41, (id *)buf);
    v39[4] = v37;
    id v40 = obj;
    v41[1] = v11;
    void v41[2] = v13;
    v41[3] = v12;
    [v32 setHandler:v39];
    id v33 = v37;
    objc_sync_enter(v33);
    id v34 = [(MBCKBatchSave *)v33 timers];
    [v34 addObject:v32];

    id v35 = [(MBCKBatchSave *)v33 throughputEstimator];
    [v35 incrementRetryCount];

    [v32 resume];
    objc_sync_exit(v33);

    if ([(MBCKBatchSave *)v33 canceled]) {
      [v32 cancel];
    }

    objc_destroyWeak(v41);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(MBCKBatchSave *)v37 _sendBatchSaveOperationForSaveInfos:obj savePolicy:v11 batchSize:v13 batchAssetsSize:v12];
    id v32 = [(MBCKBatchSave *)v37 saveGroup];
    dispatch_group_leave(v32);
  }
}

- (void)_flushBatchedSaves:(unint64_t)a3
{
  if (!a3) {
    __assert_rtn("-[MBCKBatchSave _flushBatchedSaves:]", "MBCKBatchSave.m", 625, "flushCount");
  }
  unint64_t v3 = a3;
  v5 = [(MBCKBatchSave *)self ckOperationPolicy];
  long long v42 = v5;
  uint64_t v6 = v5;
  if (!v5) {
    __assert_rtn("-[MBCKBatchSave _flushBatchedSaves:]", "MBCKBatchSave.m", 630, "policy");
  }
  id v38 = [v5 maxBatchCount];
  __int16 v37 = (char *)[v6 maxBatchSize];
  v36 = (char *)[v6 maxBatchSaveAssetSize];
  unsigned int v40 = [(MBCKBatchSave *)self saveIncrementally];
  long long v44 = objc_opt_new();
  id v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(MBCKBatchSave *)v7 saveInfos];
  uint64_t v9 = [v8 array];

  __int16 v39 = v9;
  __int16 v41 = [v9 sortedArrayWithOptions:16 usingComparator:&stru_100413BF0];
  id v43 = [v42 recordSavePolicy];
  __int16 v47 = [v41 objectEnumerator];
  id v10 = 0;
  id v11 = 0;
  id v12 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  while (1)
  {
    unint64_t v13 = objc_msgSend(v47, "nextObject", v34);

    id v14 = [v12 count];
    id v15 = v14;
    if (!v13 && !v14)
    {
      unint64_t v13 = 0;
      uint64_t v17 = v10;
      goto LABEL_44;
    }
    if (!v13)
    {
      id v45 = 0;
      id v46 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = v10;
      goto LABEL_10;
    }
    if ([v13 state])
    {
      uint64_t v16 = 0;
      uint64_t v17 = v10;
      goto LABEL_33;
    }
    uint64_t v16 = [v13 record];
    id v22 = [v16 recordID];
    uint64_t v17 = [v22 zoneID];

    id v46 = [v13 recordSize];
    id v45 = [v13 assetSize];
    id v23 = [v13 savePolicy];
    if (!v15)
    {
      id v43 = v23;
      goto LABEL_26;
    }
    if (v43 != v23) {
      break;
    }
    if (v10)
    {
      unsigned int v24 = [v10 isEqual:v17];
      if ((v24 & v40 & 1) == 0)
      {
        if ((v24 & 1) == 0) {
          goto LABEL_10;
        }
        goto LABEL_26;
      }
    }
    else if (!v40)
    {
      goto LABEL_26;
    }
    if (v15 >= v38 || (char *)v46 + v49 > v37) {
      goto LABEL_10;
    }
    if (v48)
    {
      if ((char *)v45 + v48 > v36) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v48 = 0;
    }
LABEL_26:
    id v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      double v26 = v25;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        double v27 = [v16 recordID];
        *(_DWORD *)buf = 138543362;
        id v56 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Adding record %{public}@ to save batch", buf, 0xCu);
      }
      id v34 = [v16 recordID];
      _MBLog();
    }
    [v13 setState:2];
    objc_msgSend(v13, "setSaveAttempts:", (char *)objc_msgSend(v13, "saveAttempts") + 1);
    [v13 setUploadProgress:0.0];
    if (!v12) {
      id v12 = objc_opt_new();
    }
    objc_msgSend(v12, "addObject:", v13, v34, v35);
    v49 += (uint64_t)v46;
    v48 += (uint64_t)v45;
LABEL_33:

    id v28 = v17;
    id v10 = v28;
    id v11 = v13;
  }
  id v43 = v23;
LABEL_10:
  if (!v12 || !v15) {
    __assert_rtn("-[MBCKBatchSave _flushBatchedSaves:]", "MBCKBatchSave.m", 690, "batch && batchCount");
  }
  __int16 v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = v18;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = [v12 count];
      *(_DWORD *)buf = 134218242;
      id v56 = v20;
      __int16 v57 = 2112;
      v58 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Flushing %lu batched saves, zoneID:%@", buf, 0x16u);
    }

    id v34 = [v12 count];
    id v35 = v10;
    _MBLog();
  }

  [v44 addObject:v12];
  uint64_t v21 = [(MBCKBatchSave *)v7 saveGroup];
  dispatch_group_enter(v21);

  if (--v3)
  {
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    id v12 = 0;
    if (!v13) {
      goto LABEL_33;
    }
    goto LABEL_26;
  }

  id v12 = 0;
LABEL_44:
  if (objc_msgSend(v12, "count", v34, v35)) {
    __assert_rtn("-[MBCKBatchSave _flushBatchedSaves:]", "MBCKBatchSave.m", 713, "!batch.count");
  }

  objc_sync_exit(v7);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v29 = v44;
  id v30 = [v29 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v51;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v51 != v31) {
          objc_enumerationMutation(v29);
        }
        [(MBCKBatchSave *)v7 _scheduleBatchSaveOperationForSaveInfos:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        id v33 = [(MBCKBatchSave *)v7 saveGroup];
        dispatch_group_leave(v33);
      }
      id v30 = [v29 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v30);
  }
}

- (void)_saveRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  [(MBCKBatchSave *)self _flush];
  v5 = [(MBCKBatchSave *)self saveGroup];
  uint64_t v6 = dispatch_get_global_queue(17, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001236A0;
  v9[3] = &unk_1004124D8;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_group_notify(v5, v6, v8);
}

- (void)saveRecordsWithCompletion:(id)a3
{
  id v6 = a3;
  if (atomic_exchange((atomic_uchar *volatile)&self->_started, 1u)) {
    __assert_rtn("-[MBCKBatchSave saveRecordsWithCompletion:]", "MBCKBatchSave.m", 734, "!started && \"can't start a batch twice\"");
  }
  v5 = v4;
  [(MBCKBatchSave *)self _saveRecordsWithCompletion:v6];
}

- (void)cancel
{
  [(MBCKBatchSave *)self setCanceled:1];
  unint64_t v3 = self;
  objc_sync_enter(v3);
  id v4 = [(MBCKBatchSave *)v3 timers];
  id v5 = [v4 copy];

  objc_sync_exit(v3);
  [v5 enumerateObjectsUsingBlock:&stru_100413C30];
}

- (BOOL)finishWithError:(id *)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_10012397C;
  id v15 = sub_10012398C;
  id v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100123994;
  v8[3] = &unk_100410FC8;
  id v10 = &v11;
  id v5 = dispatch_semaphore_create(0);
  uint64_t v9 = v5;
  [(MBCKBatchSave *)self saveRecordsWithCompletion:v8];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v12[5];
  }
  BOOL v6 = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (MBCKOperationTracker)ckOperationTracker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ckOperationTracker);
  return (MBCKOperationTracker *)WeakRetained;
}

- (void)setCkOperationTracker:(id)a3
{
}

- (MBCKThroughputEstimator)throughputEstimator
{
  return self->_throughputEstimator;
}

- (void)setThroughputEstimator:(id)a3
{
}

- (MBCKOperationPolicy)ckOperationPolicy
{
  return self->_ckOperationPolicy;
}

- (void)setCkOperationPolicy:(id)a3
{
}

- (BOOL)saveIncrementally
{
  return self->_saveIncrementally;
}

- (void)setSaveIncrementally:(BOOL)a3
{
  self->_saveIncrementally = a3;
}

- (BOOL)retryWhenNetworkDisconnected
{
  return self->_retryWhenNetworkDisconnected;
}

- (void)setRetryWhenNetworkDisconnected:(BOOL)a3
{
  self->_retryWhenNetworkDisconnected = a3;
}

- (NSMutableOrderedSet)saveInfos
{
  return self->_saveInfos;
}

- (void)setSaveInfos:(id)a3
{
}

- (NSMutableDictionary)saveInfosByRecordID
{
  return self->_saveInfosByRecordID;
}

- (void)setSaveInfosByRecordID:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_group)saveGroup
{
  return self->_saveGroup;
}

- (void)setSaveGroup:(id)a3
{
}

- (NSError)saveError
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSaveError:(id)a3
{
}

- (unint64_t)currentBatchCount
{
  return self->_currentBatchCount;
}

- (void)setCurrentBatchCount:(unint64_t)a3
{
  self->_currentBatchCount = a3;
}

- (unint64_t)currentBatchSize
{
  return self->_currentBatchSize;
}

- (void)setCurrentBatchSize:(unint64_t)a3
{
  self->_currentBatchSize = a3;
}

- (unint64_t)currentBatchAssetSize
{
  return self->_currentBatchAssetSize;
}

- (void)setCurrentBatchAssetSize:(unint64_t)a3
{
  self->_currentBatchAssetSize = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (NSMutableArray)timers
{
  return self->_timers;
}

- (void)setTimers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timers, 0);
  objc_storeStrong((id *)&self->_saveError, 0);
  objc_storeStrong((id *)&self->_saveGroup, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_saveInfosByRecordID, 0);
  objc_storeStrong((id *)&self->_saveInfos, 0);
  objc_storeStrong((id *)&self->_ckOperationPolicy, 0);
  objc_storeStrong((id *)&self->_throughputEstimator, 0);
  objc_destroyWeak((id *)&self->_ckOperationTracker);
}

@end