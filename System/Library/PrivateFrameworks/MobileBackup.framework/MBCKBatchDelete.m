@interface MBCKBatchDelete
- (BOOL)canceled;
- (BOOL)deleteIncrementally;
- (BOOL)retryWhenNetworkDisconnected;
- (MBCKBatchDelete)initWithOperationTracker:(id)a3;
- (MBCKOperationPolicy)ckOperationPolicy;
- (MBCKOperationTracker)ckOperationTracker;
- (NSError)deleteError;
- (NSMutableArray)deleteErrors;
- (NSMutableDictionary)deleteInfosByRecordID;
- (NSMutableOrderedSet)deleteInfos;
- (OS_dispatch_group)deleteGroup;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_semaphore)deleteSemaphore;
- (unint64_t)currentBatchCount;
- (void)_deleteRecordsWithCompletion:(id)a3;
- (void)_finishBatchedDeletesWithCompletion:(id)a3;
- (void)_flush;
- (void)_flushBatchedDeletes:(unint64_t)a3;
- (void)_handleCompletionForDeleteInfo:(id)a3 operation:(id)a4 error:(id)a5;
- (void)_performCallbacksForDeleteInfo:(id)a3 error:(id)a4;
- (void)_scheduleBatchDeleteOperationForDeleteInfos:(id)a3;
- (void)_sendBatchDeleteOperationForDeleteInfos:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)deleteRecordWithID:(id)a3 completion:(id)a4;
- (void)deleteRecordsWithCompletion:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCkOperationPolicy:(id)a3;
- (void)setCkOperationTracker:(id)a3;
- (void)setCurrentBatchCount:(unint64_t)a3;
- (void)setDeleteError:(id)a3;
- (void)setDeleteErrors:(id)a3;
- (void)setDeleteGroup:(id)a3;
- (void)setDeleteIncrementally:(BOOL)a3;
- (void)setDeleteInfos:(id)a3;
- (void)setDeleteInfosByRecordID:(id)a3;
- (void)setRetryWhenNetworkDisconnected:(BOOL)a3;
@end

@implementation MBCKBatchDelete

- (MBCKBatchDelete)initWithOperationTracker:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKBatchDelete initWithOperationTracker:]", "MBCKBatchDelete.m", 56, "tracker");
  }
  v5 = v4;
  uint64_t v6 = [v4 ckOperationPolicy];
  if (!v6) {
    __assert_rtn("-[MBCKBatchDelete initWithOperationTracker:]", "MBCKBatchDelete.m", 58, "policy");
  }
  v7 = (void *)v6;
  v21.receiver = self;
  v21.super_class = (Class)MBCKBatchDelete;
  v8 = [(MBCKBatchDelete *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_ckOperationTracker, v5);
    objc_storeStrong((id *)&v9->_ckOperationPolicy, v7);
    *(_WORD *)&v9->_deleteIncrementally = 257;
    uint64_t v10 = objc_opt_new();
    deleteInfos = v9->_deleteInfos;
    v9->_deleteInfos = (NSMutableOrderedSet *)v10;

    uint64_t v12 = objc_opt_new();
    deleteInfosByRecordID = v9->_deleteInfosByRecordID;
    v9->_deleteInfosByRecordID = (NSMutableDictionary *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.backupd.batchDelete", v15);
    callbackQueue = v9->_callbackQueue;
    v9->_callbackQueue = (OS_dispatch_queue *)v16;

    dispatch_group_t v18 = dispatch_group_create();
    deleteGroup = v9->_deleteGroup;
    v9->_deleteGroup = (OS_dispatch_group *)v18;

    atomic_store(0, (unsigned int *)&v9->_pendingOperationsCount);
    atomic_store(0, (unsigned __int8 *)&v9->_started);
  }
  return v9;
}

- (void)dealloc
{
  if ([(NSMutableOrderedSet *)self->_deleteInfos count]) {
    __assert_rtn("-[MBCKBatchDelete dealloc]", "MBCKBatchDelete.m", 76, "_deleteInfos.count == 0");
  }
  v3.receiver = self;
  v3.super_class = (Class)MBCKBatchDelete;
  [(MBCKBatchDelete *)&v3 dealloc];
}

- (OS_dispatch_semaphore)deleteSemaphore
{
  if (qword_100482738 != -1) {
    dispatch_once(&qword_100482738, &stru_100416D30);
  }
  v2 = (void *)qword_100482730;
  return (OS_dispatch_semaphore *)v2;
}

- (void)deleteRecordWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void *))a4;
  v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v35 = v6;
    __int16 v36 = 2114;
    v37 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Adding a delete for %{public}@ to %{public}@", buf, 0x16u);
    uint64_t v33 = (uint64_t)v6;
    _MBLog();
  }

  if (v6)
  {
    unsigned __int8 v16 = atomic_load((unsigned __int8 *)&self->_started);
    if (v16)
    {
      v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "You can't add a new recordID to an already started batch", buf, 2u);
      }
    }
    dispatch_group_t v18 = _MBAssert((v16 & 1) == 0, @"You can't add a new recordID to an already started batch", v10, v11, v12, v13, v14, v15, v33);
    if (v18)
    {
      if (v7) {
        v7[2](v7, v6, v18);
      }
      goto LABEL_29;
    }
    v19 = self;
    objc_sync_enter(v19);
    v20 = [(MBCKBatchDelete *)v19 deleteInfosByRecordID];
    objc_super v21 = [v20 objectForKeyedSubscript:v6];

    if (v21)
    {
      if (!v7)
      {
        char v25 = 0;
        v26 = v21;
        goto LABEL_26;
      }
      v22 = [v21 callbacks];
      id v23 = [v7 copy];
      id v24 = objc_retainBlock(v23);
      [v22 addObject:v24];

      char v25 = 0;
      v26 = v21;
    }
    else
    {
      v26 = objc_opt_new();
      [v26 setState:0];
      if (v7)
      {
        v27 = [v26 callbacks];
        id v28 = [v7 copy];
        id v29 = objc_retainBlock(v28);
        [v27 addObject:v29];
      }
      [v26 setRecordID:v6];
      v30 = [(MBCKBatchDelete *)v19 ckOperationPolicy];
      v22 = v30;
      if (!v30) {
        __assert_rtn("-[MBCKBatchDelete deleteRecordWithID:completion:]", "MBCKBatchDelete.m", 128, "policy");
      }
      id v31 = [v30 maxBatchCount];
      if ([(MBCKBatchDelete *)v19 deleteIncrementally]
        && [(MBCKBatchDelete *)v19 currentBatchCount]
        && (id)[(MBCKBatchDelete *)v19 currentBatchCount] >= v31)
      {
        [(MBCKBatchDelete *)v19 setCurrentBatchCount:0];
        char v25 = 1;
      }
      else
      {
        char v25 = 0;
      }
      [(MBCKBatchDelete *)v19 setCurrentBatchCount:(char *)[(MBCKBatchDelete *)v19 currentBatchCount] + 1];
      v32 = [(MBCKBatchDelete *)v19 deleteInfosByRecordID];
      [v32 setObject:v26 forKeyedSubscript:v6];

      id v23 = [(MBCKBatchDelete *)v19 deleteInfos];
      [v23 addObject:v26];
    }

LABEL_26:
    objc_sync_exit(v19);

    if (((v21 == 0) & v25) == 1) {
      [(MBCKBatchDelete *)v19 _flushBatchedDeletes:1];
    }
    dispatch_group_t v18 = 0;
    goto LABEL_29;
  }
  if (v7)
  {
    dispatch_group_t v18 = +[MBError errorWithCode:1 format:@"You can't delete a nil recordID"];
    v7[2](v7, 0, v18);
LABEL_29:
  }
}

- (void)_flush
{
  [(MBCKBatchDelete *)self _flushBatchedDeletes:-1];
}

- (void)_performCallbacksForDeleteInfo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v23 = a4;
  if ([v6 state] == (id)3)
  {
    dispatch_group_t v18 = +[NSAssertionHandler currentHandler];
    v19 = [v6 recordID];
    v20 = +[NSThread callStackSymbols];
    [v18 handleFailureInMethod:a2, self, @"MBCKBatchDelete.m", 154, @"We've already finished Deleting record %@: %@", v19, v20 object file lineNumber description];
  }
  v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = [v6 recordID];
    *(_DWORD *)buf = 138543362;
    v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Performing callbacks for delete of record %{public}@", buf, 0xCu);

    objc_super v21 = [v6 recordID];
    _MBLog();
  }
  [v6 setState:3];
  [v6 setError:v23];
  v9 = [v6 callbacks];
  [v6 setCallbacks:0];
  uint64_t v10 = [v6 recordID];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v17 = [(MBCKBatchDelete *)self callbackQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10023326C;
        block[3] = &unk_100416D58;
        uint64_t v27 = v16;
        id v25 = v10;
        id v26 = v23;
        dispatch_async(v17, block);
      }
      id v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }
}

- (void)_finishBatchedDeletesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MBCKBatchDelete *)v5 deleteInfos];
  id v7 = [v6 count];

  objc_sync_exit(v5);
  if (v7)
  {
    [(MBCKBatchDelete *)v5 _deleteRecordsWithCompletion:v4];
  }
  else
  {
    if ([(MBCKBatchDelete *)v5 canceled]) {
      +[MBError errorWithCode:202 format:@"Batch delete canceled"];
    }
    else {
    v8 = [(MBCKBatchDelete *)v5 deleteError];
    }
    v9 = MBGetDefaultLog();
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v17 = v5;
        __int16 v18 = 2112;
        v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed %{public}@: %@", buf, 0x16u);
        _MBLog();
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Finished %{public}@", buf, 0xCu);
      _MBLog();
    }

    if (v4)
    {
      id v11 = [(MBCKBatchDelete *)v5 callbackQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100233518;
      block[3] = &unk_100413A50;
      id v15 = v4;
      id v14 = v8;
      dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v11, v12);
    }
  }
}

- (void)_handleCompletionForDeleteInfo:(id)a3 operation:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    __assert_rtn("-[MBCKBatchDelete _handleCompletionForDeleteInfo:operation:error:]", "MBCKBatchDelete.m", 194, "deleteInfo");
  }
  if (!v9) {
    __assert_rtn("-[MBCKBatchDelete _handleCompletionForDeleteInfo:operation:error:]", "MBCKBatchDelete.m", 195, "operation");
  }
  id v11 = v10;
  if ([v8 state] != (id)3)
  {
    dispatch_block_t v12 = [v8 recordID];
    id v13 = [v8 deleteAttempts];
    [v8 setError:v11];
    if (v11)
    {
      id v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v43 = v12;
        __int16 v44 = 2112;
        double v45 = *(double *)&v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Handling delete error for record %{public}@: %@", buf, 0x16u);
        v40 = v12;
        v41 = v11;
        _MBLog();
      }

      id v15 = [(MBCKBatchDelete *)self ckOperationPolicy];
      if (!v15) {
        __assert_rtn("-[MBCKBatchDelete _handleCompletionForDeleteInfo:operation:error:]", "MBCKBatchDelete.m", 206, "policy");
      }
      uint64_t v16 = v15;
      [v15 retryAfterInterval];
      double v18 = v17;
      v19 = [v11 domain];
      unsigned int v20 = [v19 isEqualToString:CKErrorDomain];

      if (v20)
      {
        double v21 = fmax(v18, 1.0);
        id v22 = [v11 code];
        switch((unint64_t)v22)
        {
          case 2uLL:
            id v23 = [v11 userInfo];
            id v24 = [v23 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];
            id v25 = [v24 objectForKeyedSubscript:v12];

            if (v25)
            {
              [(MBCKBatchDelete *)self _handleCompletionForDeleteInfo:v8 operation:v9 error:v25];
              goto LABEL_52;
            }
            v39 = MBGetDefaultLog();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v43 = v12;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "No partial error found for record %{public}@", buf, 0xCu);
              _MBLog();
            }

            break;
          case 3uLL:
            long long v29 = MBGetDefaultLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v43 = v12;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Delete of record %{public}@ hit a network unavailable error", buf, 0xCu);
              v40 = v12;
              _MBLog();
            }

            if (+[MBError isNetworkDisconnectedError:v11]
              && ![(MBCKBatchDelete *)self retryWhenNetworkDisconnected])
            {
              break;
            }
            double v30 = (double)arc4random_uniform(5u);
            double v31 = 10.0;
            goto LABEL_31;
          case 4uLL:
            v32 = MBGetDefaultLog();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v43 = v12;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Delete of record %{public}@ hit a network failure error", buf, 0xCu);
              v40 = v12;
              _MBLog();
            }

            double v30 = (double)arc4random_uniform(5u);
            double v31 = 1.0;
LABEL_31:
            double v21 = fmax(v21, v30 + v31);
            goto LABEL_40;
          case 5uLL:
            break;
          case 6uLL:
            long long v28 = MBGetDefaultLog();
            if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              goto LABEL_35;
            }
            *(_DWORD *)buf = 138543362;
            v43 = v12;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Delete of record %{public}@ hit a service unavailable error", buf, 0xCu);
            v40 = v12;
            goto LABEL_34;
          case 7uLL:
            uint64_t v33 = MBGetDefaultLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v43 = v12;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Delete of record %{public}@ was rate limited", buf, 0xCu);
              v40 = v12;
              _MBLog();
            }

            if (!+[MBError isNetworkDisconnectedError:v11]
              || [(MBCKBatchDelete *)self retryWhenNetworkDisconnected])
            {
              goto LABEL_40;
            }
            break;
          default:
            if (v22 != (id)23) {
              break;
            }
            long long v28 = MBGetDefaultLog();
            if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              goto LABEL_35;
            }
            *(_DWORD *)buf = 138543362;
            v43 = v12;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Delete of record %{public}@ got a zone busy error", buf, 0xCu);
            v40 = v12;
LABEL_34:
            _MBLog();
LABEL_35:

            goto LABEL_40;
        }
      }
      else if (([v9 atomic] & 1) == 0)
      {
        double v21 = 5.0;
        if (+[MBError isRetryableXPCError:v11])
        {
LABEL_40:
          if (v13 <= objc_msgSend(v16, "maxRetryAttempts", v40, v41))
          {
            v34 = [v11 userInfo];
            id v25 = [v34 objectForKeyedSubscript:CKErrorRetryAfterKey];

            if (v25)
            {
              [v25 doubleValue];
              double v21 = v35;
            }
            double v36 = fmax(v21, 0.0);
            v37 = MBGetDefaultLog();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v43 = v12;
              __int16 v44 = 2048;
              double v45 = v36;
              __int16 v46 = 2048;
              id v47 = v13;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Retrying delete of record %{public}@ in %0.3fs after %lu attempts", buf, 0x20u);
              _MBLog();
            }

            v38 = +[NSDate dateWithTimeIntervalSinceNow:v36];
            [v8 setRetryDate:v38];

            [v8 setState:1];
LABEL_52:

            goto LABEL_45;
          }
        }
      }

      uint64_t v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v43 = v12;
        __int16 v44 = 2048;
        double v45 = *(double *)&v13;
        __int16 v46 = 2112;
        id v47 = v11;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to delete record %{public}@ after %lu attempts, error:%@", buf, 0x20u);
        goto LABEL_43;
      }
LABEL_44:

      [(MBCKBatchDelete *)self _performCallbacksForDeleteInfo:v8 error:v11];
LABEL_45:

      goto LABEL_46;
    }
    id v26 = MBGetDefaultLog();
    uint64_t v27 = v26;
    if (v13 == (id)1)
    {
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_44;
      }
      *(_DWORD *)buf = 138543362;
      v43 = v12;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Deleted record %{public}@", buf, 0xCu);
    }
    else
    {
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_44;
      }
      *(_DWORD *)buf = 138543618;
      v43 = v12;
      __int16 v44 = 2048;
      double v45 = *(double *)&v13;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Deleted record %{public}@ after %lu attempts", buf, 0x16u);
    }
LABEL_43:
    _MBLog();
    goto LABEL_44;
  }
LABEL_46:
}

- (void)_sendBatchDeleteOperationForDeleteInfos:(id)a3
{
  id v4 = a3;
  v5 = [(MBCKBatchDelete *)self ckOperationTracker];
  if (!v5) {
    __assert_rtn("-[MBCKBatchDelete _sendBatchDeleteOperationForDeleteInfos:]", "MBCKBatchDelete.m", 272, "tracker");
  }
  id v6 = [(MBCKBatchDelete *)self ckOperationPolicy];
  if (!v6) {
    __assert_rtn("-[MBCKBatchDelete _sendBatchDeleteOperationForDeleteInfos:]", "MBCKBatchDelete.m", 274, "policy");
  }
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    double v31 = self;
    __int16 v32 = 2048;
    uint64_t v33 = (MBCKBatchDelete *)[v4 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deleting a batch for %{public}@, c:%lu", buf, 0x16u);
    [v4 count];
    _MBLog();
  }

  id v8 = [v4 valueForKey:@"recordID"];
  id v9 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:0 recordIDsToDelete:v8];
  objc_initWeak(&location, v9);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1002341A0;
  v26[3] = &unk_100413BA8;
  objc_copyWeak(&v28, &location);
  v26[4] = self;
  id v10 = v4;
  id v27 = v10;
  [v9 setModifyRecordsCompletionBlock:v26];
  int pendingOperationsCount = self->_pendingOperationsCount;
  dispatch_block_t v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v9 operationID];
      id v15 = [v8 count];
      *(_DWORD *)buf = 138544130;
      double v31 = v14;
      __int16 v32 = 2114;
      uint64_t v33 = self;
      __int16 v34 = 2048;
      id v35 = v15;
      __int16 v36 = 2048;
      uint64_t v37 = pendingOperationsCount;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Created operation %{public}@ for %{public}@, c:%lu, o:%ld", buf, 0x2Au);
    }
    uint64_t v16 = [v9 operationID];
    [v8 count];
    _MBLog();
  }
  double v17 = [(MBCKBatchDelete *)self deleteGroup];
  dispatch_group_enter(v17);

  double v18 = [(MBCKBatchDelete *)self callbackQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100234684;
  block[3] = &unk_100411608;
  void block[4] = self;
  id v23 = v5;
  id v24 = v9;
  id v25 = v6;
  id v19 = v6;
  id v20 = v9;
  id v21 = v5;
  dispatch_async(v18, block);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)_scheduleBatchDeleteOperationForDeleteInfos:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    __assert_rtn("-[MBCKBatchDelete _scheduleBatchDeleteOperationForDeleteInfos:]", "MBCKBatchDelete.m", 339, "deleteInfos.count");
  }
  v5 = [(MBCKBatchDelete *)self deleteGroup];
  dispatch_group_enter(v5);

  id v6 = +[NSDate now];
  id v7 = [(MBCKBatchDelete *)self deleteSemaphore];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  id v8 = +[NSDate now];
  [v8 timeIntervalSinceDate:v6];
  uint64_t v10 = v9;

  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v37 = self;
    __int16 v38 = 2048;
    double v39 = COERCE_DOUBLE([v4 count]);
    __int16 v40 = 2048;
    uint64_t v41 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Preparing to delete a batch for %{public}@, c:%lu, tq:%.3fs", buf, 0x20u);
    uint64_t v28 = v10;
    id v26 = self;
    id v27 = [v4 count];
    _MBLog();
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v13)
  {

LABEL_20:
    -[MBCKBatchDelete _sendBatchDeleteOperationForDeleteInfos:](self, "_sendBatchDeleteOperationForDeleteInfos:", v12, v26, v27);
    id v15 = [(MBCKBatchDelete *)self deleteGroup];
    dispatch_group_leave(v15);
    goto LABEL_21;
  }
  id v14 = v13;
  id v15 = 0;
  uint64_t v16 = *(void *)v32;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v32 != v16) {
        objc_enumerationMutation(v12);
      }
      double v18 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "retryDate", v26, v27, v28);
      id v19 = v18;
      if (v18)
      {
        if (v15)
        {
          uint64_t v20 = [v15 laterDate:v18];

          id v15 = v20;
        }
        else
        {
          id v15 = v18;
        }
      }
    }
    id v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v14);

  if (!v15) {
    goto LABEL_20;
  }
  [v15 timeIntervalSinceNow];
  double v22 = fmax(v21, 0.0);
  id v23 = MBGetDefaultLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v37 = self;
    __int16 v38 = 2048;
    double v39 = v22;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Scheduling a batch for %{public}@ in %0.3fs", buf, 0x16u);
    _MBLog();
  }

  dispatch_time_t v24 = dispatch_time(0, (uint64_t)(v22 * 1000000000.0));
  id v25 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100234B7C;
  block[3] = &unk_1004110B0;
  void block[4] = self;
  id v30 = v12;
  dispatch_after(v24, v25, block);

LABEL_21:
}

- (void)_flushBatchedDeletes:(unint64_t)a3
{
  if (!a3) {
    __assert_rtn("-[MBCKBatchDelete _flushBatchedDeletes:]", "MBCKBatchDelete.m", 372, "flushCount");
  }
  unint64_t v3 = a3;
  v5 = [(MBCKBatchDelete *)self ckOperationPolicy];
  long long v33 = v5;
  if (!v5) {
    __assert_rtn("-[MBCKBatchDelete _flushBatchedDeletes:]", "MBCKBatchDelete.m", 374, "policy");
  }
  id v35 = [v5 maxBatchCount];
  unsigned int v34 = [(MBCKBatchDelete *)self deleteIncrementally];
  __int16 v36 = objc_opt_new();
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(MBCKBatchDelete *)v6 deleteInfos];
  id v8 = [v7 array];

  long long v32 = v8;
  long long v31 = [v8 sortedArrayWithOptions:16 usingComparator:&stru_100416D78];
  uint64_t v9 = [v31 objectEnumerator];
  uint64_t v10 = 0;
  id v11 = 0;
  id v12 = 0;
  while (1)
  {
    id v13 = objc_msgSend(v9, "nextObject", v29, v30);

    id v14 = [v12 count];
    id v15 = v14;
    if (!v13 && !v14) {
      break;
    }
    uint64_t v16 = v10;
    if (v13)
    {
      if ([v13 state])
      {
        uint64_t v16 = v10;
        goto LABEL_30;
      }
      double v17 = [v13 recordID];
      uint64_t v16 = [v17 zoneID];

      if (!v15)
      {
LABEL_27:
        objc_msgSend(v13, "setState:", 2, v29, v30);
        objc_msgSend(v13, "setDeleteAttempts:", (char *)objc_msgSend(v13, "deleteAttempts") + 1);
        if (!v12) {
          id v12 = objc_opt_new();
        }
        [v12 addObject:v13];
        goto LABEL_30;
      }
      if (v10)
      {
        unsigned int v18 = [v10 isEqual:v16];
        if (v15 >= v35) {
          char v19 = v34;
        }
        else {
          char v19 = 0;
        }
        if (v18 && (v19 & 1) == 0) {
          goto LABEL_27;
        }
      }
      else
      {
        if (v15 >= v35) {
          unsigned int v20 = v34;
        }
        else {
          unsigned int v20 = 0;
        }
        if (v20 != 1) {
          goto LABEL_27;
        }
      }
    }
    if (!v12 || !v15) {
      __assert_rtn("-[MBCKBatchDelete _flushBatchedDeletes:]", "MBCKBatchDelete.m", 416, "batch && batchCount");
    }
    double v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      id v43 = v15;
      __int16 v44 = 2114;
      double v45 = v10;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Flushing %lu batched deletes, zoneID:%{public}@", buf, 0x16u);
      id v29 = v15;
      id v30 = v10;
      _MBLog();
    }

    [v36 addObject:v12];
    double v22 = [(MBCKBatchDelete *)v6 deleteGroup];
    dispatch_group_enter(v22);

    id v12 = 0;
    if (!--v3) {
      goto LABEL_32;
    }
    if (v13) {
      goto LABEL_27;
    }
LABEL_30:
    id v23 = v16;

    uint64_t v10 = v23;
    id v11 = v13;
  }
  id v13 = 0;
  uint64_t v16 = v10;
LABEL_32:
  if (objc_msgSend(v12, "count", v29, v30)) {
    __assert_rtn("-[MBCKBatchDelete _flushBatchedDeletes:]", "MBCKBatchDelete.m", 432, "!batch.count");
  }

  objc_sync_exit(v6);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v24 = v36;
  id v25 = [v24 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v38;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(v24);
        }
        [(MBCKBatchDelete *)v6 _scheduleBatchDeleteOperationForDeleteInfos:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        uint64_t v28 = [(MBCKBatchDelete *)v6 deleteGroup];
        dispatch_group_leave(v28);
      }
      id v25 = [v24 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v25);
  }
}

- (void)_deleteRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  [(MBCKBatchDelete *)self _flush];
  v5 = [(MBCKBatchDelete *)self deleteGroup];
  id v6 = dispatch_get_global_queue(17, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002351FC;
  v9[3] = &unk_1004124D8;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_group_notify(v5, v6, v8);
}

- (void)deleteRecordsWithCompletion:(id)a3
{
  id v6 = a3;
  if (atomic_exchange((atomic_uchar *volatile)&self->_started, 1u)) {
    __assert_rtn("-[MBCKBatchDelete deleteRecordsWithCompletion:]", "MBCKBatchDelete.m", 452, "!started && \"can't start a batch twice\"");
  }
  v5 = v4;
  [(MBCKBatchDelete *)self _deleteRecordsWithCompletion:v6];
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

- (BOOL)deleteIncrementally
{
  return self->_deleteIncrementally;
}

- (void)setDeleteIncrementally:(BOOL)a3
{
  self->_deleteIncrementally = a3;
}

- (BOOL)retryWhenNetworkDisconnected
{
  return self->_retryWhenNetworkDisconnected;
}

- (void)setRetryWhenNetworkDisconnected:(BOOL)a3
{
  self->_retryWhenNetworkDisconnected = a3;
}

- (MBCKOperationTracker)ckOperationTracker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ckOperationTracker);
  return (MBCKOperationTracker *)WeakRetained;
}

- (void)setCkOperationTracker:(id)a3
{
}

- (NSMutableOrderedSet)deleteInfos
{
  return self->_deleteInfos;
}

- (void)setDeleteInfos:(id)a3
{
}

- (NSMutableDictionary)deleteInfosByRecordID
{
  return self->_deleteInfosByRecordID;
}

- (void)setDeleteInfosByRecordID:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_group)deleteGroup
{
  return self->_deleteGroup;
}

- (void)setDeleteGroup:(id)a3
{
}

- (NSError)deleteError
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDeleteError:(id)a3
{
}

- (NSMutableArray)deleteErrors
{
  return self->_deleteErrors;
}

- (void)setDeleteErrors:(id)a3
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
  objc_storeStrong((id *)&self->_deleteErrors, 0);
  objc_storeStrong((id *)&self->_deleteError, 0);
  objc_storeStrong((id *)&self->_deleteGroup, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_deleteInfosByRecordID, 0);
  objc_storeStrong((id *)&self->_deleteInfos, 0);
  objc_destroyWeak((id *)&self->_ckOperationTracker);
  objc_storeStrong((id *)&self->_ckOperationPolicy, 0);
}

@end