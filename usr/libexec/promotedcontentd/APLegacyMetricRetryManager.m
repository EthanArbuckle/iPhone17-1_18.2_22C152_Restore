@interface APLegacyMetricRetryManager
+ (int64_t)_resultForResponseStatusCode:(int64_t)a3 error:(id)a4;
+ (int64_t)resultForResponse:(id)a3 error:(id)a4;
- (APBackoffTimer)backoffLevels;
- (APLegacyMetricRetryManager)init;
- (APLegacyMetricRetryManager)initWithSecureFileManager:(id)a3;
- (APStorageManager)secureFileManager;
- (NSMutableDictionary)failedRequests;
- (OS_dispatch_queue)queue;
- (id)_failedPath:(id)a3;
- (id)_findPotentiallyDeliverableRequest;
- (id)_pendingPath:(id)a3;
- (void)_completeServerRequestId:(id)a3 serverFailureCount:(int64_t)a4 result:(int64_t)a5;
- (void)_loadFailedRequestsCache;
- (void)_makeRequest:(id)a3 serverFailureCount:(int64_t)a4 responseCallback:(id)a5;
- (void)_markRequestAsFailed:(id)a3;
- (void)_markRequestsAsSucceeded:(id)a3;
- (void)_moveAllPendingRequestsToFailed;
- (void)_registerMetricRequest:(id)a3;
- (void)_removePendingRequest:(id)a3;
- (void)_retryFailedIfAvailable;
- (void)_sendRequest:(id)a3 responseCallback:(id)a4;
- (void)backoffTimerFired;
- (void)completeServerRequestId:(id)a3 result:(int64_t)a4;
- (void)completeServerRequestId:(id)a3 serverFailureCount:(int64_t)a4 result:(int64_t)a5;
- (void)registerMetricRequest:(id)a3;
- (void)setBackoffLevels:(id)a3;
- (void)setFailedRequests:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSecureFileManager:(id)a3;
- (void)start;
@end

@implementation APLegacyMetricRetryManager

- (APLegacyMetricRetryManager)init
{
  id v3 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"l"];
  v4 = [(APLegacyMetricRetryManager *)self initWithSecureFileManager:v3];

  return v4;
}

- (APLegacyMetricRetryManager)initWithSecureFileManager:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)APLegacyMetricRetryManager;
  v6 = [(APLegacyMetricRetryManager *)&v15 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ap.legacyRetryManager.queue", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = +[NSSet setWithObject:objc_opt_class()];
    +[APSupportedSecureEncodedClass addClasses:v9];
    objc_storeStrong((id *)&v6->_secureFileManager, a3);
    v10 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
    failedRequests = v6->_failedRequests;
    v6->_failedRequests = v10;

    v12 = (APBackoffTimer *)[objc_alloc((Class)APBackoffTimer) initWithSchedule:0 name:@"LegacyRetryManager"];
    backoffLevels = v6->_backoffLevels;
    v6->_backoffLevels = v12;

    [(APBackoffTimer *)v6->_backoffLevels setDelegate:v6];
  }

  return v6;
}

- (void)start
{
  objc_initWeak(&location, self);
  id v3 = (void *)os_transaction_create();
  v4 = [(APLegacyMetricRetryManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A16B4;
  block[3] = &unk_100234B28;
  objc_copyWeak(&v8, &location);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)registerMetricRequest:(id)a3
{
  id v4 = a3;
  id v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = sub_1000E8480((uint64_t)v4);
    id v7 = [v6 UUIDString];
    *(_DWORD *)buf = 138543362;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Registering server request %{public}@.", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v8 = (void *)os_transaction_create();
  v9 = [(APLegacyMetricRetryManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A190C;
  block[3] = &unk_10022E368;
  objc_copyWeak(&v15, (id *)buf);
  id v13 = v4;
  id v14 = v8;
  id v10 = v8;
  id v11 = v4;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)completeServerRequestId:(id)a3 result:(int64_t)a4
{
}

- (void)completeServerRequestId:(id)a3 serverFailureCount:(int64_t)a4 result:(int64_t)a5
{
  id v8 = a3;
  v9 = APLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = v8;
    __int16 v20 = 2048;
    int64_t v21 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Completed server request %{public}@ with result '%ld'", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v10 = (void *)os_transaction_create();
  id v11 = [(APLegacyMetricRetryManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A1B44;
  block[3] = &unk_100235110;
  objc_copyWeak(v17, (id *)buf);
  v17[1] = (id)a4;
  v17[2] = (id)a5;
  id v15 = v8;
  id v16 = v10;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);
}

- (id)_pendingPath:(id)a3
{
  return [@"p" stringByAppendingPathComponent:a3];
}

- (id)_failedPath:(id)a3
{
  return [@"f" stringByAppendingPathComponent:a3];
}

- (void)_registerMetricRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000E8480((uint64_t)v4);
  v6 = [v5 UUIDString];
  id v7 = [(APLegacyMetricRetryManager *)self _pendingPath:v6];

  id v8 = [(APLegacyMetricRetryManager *)self secureFileManager];
  id v13 = 0;
  LODWORD(v6) = [v8 storeObject:v4 atPath:v7 error:&v13];
  id v9 = v13;

  if (!v6 || v9)
  {
    id v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = sub_1000E8480((uint64_t)v4);
      id v12 = [v11 UUIDString];
      *(_DWORD *)buf = 138543618;
      id v15 = v12;
      __int16 v16 = 2114;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to save server request %{public}@. %{public}@", buf, 0x16u);
    }
  }
}

- (void)_completeServerRequestId:(id)a3 serverFailureCount:(int64_t)a4 result:(int64_t)a5
{
  id v8 = a3;
  if (a5 == 1)
  {
    id v10 = [(APLegacyMetricRetryManager *)self _findPotentiallyDeliverableRequest];
    if (a4 < 2)
    {
      [(APLegacyMetricRetryManager *)self _markRequestAsFailed:v8];
      __int16 v16 = [(APLegacyMetricRetryManager *)self failedRequests];
      id v17 = [v16 count];

      if ((unint64_t)v17 <= 9)
      {
        v18 = +[NSNumber numberWithInteger:a4 + 1];
        id v19 = [(APLegacyMetricRetryManager *)self failedRequests];
        [v19 setObject:v18 forKeyedSubscript:v8];
      }
    }
    else
    {
      id v11 = APLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v23 = 138543362;
        id v24 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Giving up on request %{public}@. Exceeded maximum retry attempts.", (uint8_t *)&v23, 0xCu);
      }

      [(APLegacyMetricRetryManager *)self _removePendingRequest:v8];
    }
    if (v10)
    {
      [(APLegacyMetricRetryManager *)self _sendRequest:v10 responseCallback:0];
LABEL_19:

      goto LABEL_20;
    }
  }
  else
  {
    if (a5 == 2)
    {
      [(APLegacyMetricRetryManager *)self _markRequestsAsSucceeded:v8];
      id v9 = APLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v23 = 138543362;
        id v24 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Detected a successful transmission %{public}@.", (uint8_t *)&v23, 0xCu);
      }

      [(APLegacyMetricRetryManager *)self _retryFailedIfAvailable];
      id v10 = [(APLegacyMetricRetryManager *)self backoffLevels];
      [v10 reset];
      goto LABEL_19;
    }
    [(APLegacyMetricRetryManager *)self _markRequestAsFailed:v8];
    id v12 = [(APLegacyMetricRetryManager *)self failedRequests];
    id v13 = [v12 count];

    if ((unint64_t)v13 <= 9)
    {
      id v14 = +[NSNumber numberWithInteger:a4];
      id v15 = [(APLegacyMetricRetryManager *)self failedRequests];
      [v15 setObject:v14 forKeyedSubscript:v8];
    }
  }
  __int16 v20 = [(APLegacyMetricRetryManager *)self backoffLevels];
  int64_t v21 = [(APLegacyMetricRetryManager *)self queue];
  unsigned __int8 v22 = [v20 scheduleNextLevelWithQueue:v21];

  if ((v22 & 1) == 0)
  {
    id v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error: Couldn't schedule Backoff Timer for Legacy Metric Retry Manager.", (uint8_t *)&v23, 2u);
    }
    goto LABEL_19;
  }
LABEL_20:
}

- (id)_findPotentiallyDeliverableRequest
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000A212C;
  id v10 = sub_1000A213C;
  id v11 = 0;
  v2 = [(APLegacyMetricRetryManager *)self failedRequests];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A2144;
  v5[3] = &unk_100235138;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_retryFailedIfAvailable
{
  id v3 = [(APLegacyMetricRetryManager *)self failedRequests];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = [(APLegacyMetricRetryManager *)self failedRequests];
    uint64_t v6 = [v5 keyEnumerator];
    id v7 = [v6 nextObject];

    [(APLegacyMetricRetryManager *)self _sendRequest:v7 responseCallback:0];
  }
}

- (void)_markRequestsAsSucceeded:(id)a3
{
  id v4 = a3;
  id v5 = [(APLegacyMetricRetryManager *)self _pendingPath:v4];
  uint64_t v6 = [(APLegacyMetricRetryManager *)self secureFileManager];
  id v10 = 0;
  unsigned int v7 = [v6 removeObjectAtPath:v5 error:&v10];
  id v8 = v10;

  if (!v7 || v8)
  {
    id v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v12 = v4;
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to complete a request %{public}@. %{public}@", buf, 0x16u);
    }
  }
}

- (void)_markRequestAsFailed:(id)a3
{
  id v4 = a3;
  id v5 = [(APLegacyMetricRetryManager *)self secureFileManager];
  uint64_t v6 = [(APLegacyMetricRetryManager *)self _pendingPath:v4];
  unsigned int v7 = [(APLegacyMetricRetryManager *)self _failedPath:v4];
  id v11 = 0;
  unsigned int v8 = [v5 moveItemAtPath:v6 toPath:v7 error:&v11];
  id v9 = v11;

  if (!v8 || v9)
  {
    id v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = v4;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to fail a request %{public}@. %{public}@", buf, 0x16u);
    }
  }
}

- (void)_removePendingRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(APLegacyMetricRetryManager *)self secureFileManager];
  uint64_t v6 = [(APLegacyMetricRetryManager *)self _pendingPath:v4];
  id v10 = 0;
  unsigned int v7 = [v5 removeObjectAtPath:v6 error:&v10];
  id v8 = v10;

  if (!v7 || v8)
  {
    id v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v12 = v4;
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to remove pending request %{public}@. %{public}@", buf, 0x16u);
    }
  }
}

- (void)_moveAllPendingRequestsToFailed
{
  id v3 = [(APLegacyMetricRetryManager *)self secureFileManager];
  id v15 = 0;
  id v4 = [v3 contentsOfDirectoryAtPath:@"p" error:&v15];
  id v5 = v15;

  if (!v4 || v5)
  {
    uint64_t v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable list pending requests. %{public}@", buf, 0xCu);
    }
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          -[APLegacyMetricRetryManager _markRequestAsFailed:](self, "_markRequestAsFailed:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        }
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_loadFailedRequestsCache
{
  id v3 = [(APLegacyMetricRetryManager *)self secureFileManager];
  id v4 = [v3 contentsOfDirectoryAtPath:@"f" error:0];

  if ([v4 count])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000A28FC;
    v8[3] = &unk_100235160;
    v8[4] = self;
    [v4 enumerateObjectsUsingBlock:v8];
    id v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [(APLegacyMetricRetryManager *)self failedRequests];
      id v7 = [v6 count];
      *(_DWORD *)buf = 134217984;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Loaded %lu failed items.", buf, 0xCu);
    }
  }
}

- (void)_sendRequest:(id)a3 responseCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = APLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Retrying request %{public}@.", buf, 0xCu);
  }

  uint64_t v9 = [(APLegacyMetricRetryManager *)self failedRequests];
  id v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    long long v11 = [(APLegacyMetricRetryManager *)self _pendingPath:v6];
    long long v12 = [(APLegacyMetricRetryManager *)self secureFileManager];
    long long v13 = [(APLegacyMetricRetryManager *)self _failedPath:v6];
    id v32 = 0;
    unsigned __int8 v14 = [v12 moveItemAtPath:v13 toPath:v11 error:&v32];
    id v15 = v32;

    __int16 v16 = [(APLegacyMetricRetryManager *)self failedRequests];
    id v17 = [v16 count];

    id v18 = [(APLegacyMetricRetryManager *)self failedRequests];
    id v19 = v18;
    if (v17 == (id)1)
    {
      [v18 removeAllObjects];

      [(APLegacyMetricRetryManager *)self _loadFailedRequestsCache];
    }
    else
    {
      [v18 removeObjectForKey:v6];
    }
    if (v15) {
      unsigned __int8 v21 = 0;
    }
    else {
      unsigned __int8 v21 = v14;
    }
    if (v21)
    {
      unsigned __int8 v22 = [(APLegacyMetricRetryManager *)self secureFileManager];
      id v30 = 0;
      int v23 = [v22 objectStoredAtPath:v11 error:&v30];
      __int16 v20 = v30;

      if (v23
        && !v20
        && (sub_1000E848C((uint64_t)v23), id v24 = objc_claimAutoreleasedReturnValue(), v24, v24))
      {
        -[APLegacyMetricRetryManager _makeRequest:serverFailureCount:responseCallback:](self, "_makeRequest:serverFailureCount:responseCallback:", v23, [v10 longValue], v7);
      }
      else
      {
        v29 = APLogForCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v34 = v6;
          __int16 v35 = 2114;
          v36 = v20;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Unable to restore a request %{public}@. %{public}@", buf, 0x16u);
        }

        [(APLegacyMetricRetryManager *)self _removePendingRequest:v6];
        [(APLegacyMetricRetryManager *)self _retryFailedIfAvailable];
      }
    }
    else
    {
      v25 = APLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v34 = v6;
        __int16 v35 = 2114;
        v36 = v15;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Unable to queue a request %{public}@. %{public}@", buf, 0x16u);
      }

      v26 = [(APLegacyMetricRetryManager *)self secureFileManager];
      v27 = [(APLegacyMetricRetryManager *)self _failedPath:v6];
      v31 = v15;
      [v26 removeObjectAtPath:v27 error:&v31];
      __int16 v20 = v31;

      v28 = [(APLegacyMetricRetryManager *)self failedRequests];
      [v28 removeObjectForKey:v6];

      [(APLegacyMetricRetryManager *)self _retryFailedIfAvailable];
    }
  }
  else
  {
    __int16 v20 = APLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Trying to send a request %{public}@ which is not in a list of failed requests.", buf, 0xCu);
    }
  }
}

- (void)_makeRequest:(id)a3 serverFailureCount:(int64_t)a4 responseCallback:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = (void *)os_transaction_create();
  id v11 = [[APServerRetryRequester alloc] initFromServerRequest:v8];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A2F28;
  v16[3] = &unk_100235188;
  objc_copyWeak(v21, &location);
  id v12 = v8;
  id v17 = v12;
  v21[1] = (id)a4;
  id v13 = v11;
  id v18 = v13;
  id v14 = v9;
  id v20 = v14;
  id v15 = v10;
  id v19 = v15;
  [v13 makeRequest:v16];

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)backoffTimerFired
{
  id v3 = (id)os_transaction_create();
  [(APLegacyMetricRetryManager *)self _retryFailedIfAvailable];
}

+ (int64_t)resultForResponse:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _resultForResponseStatusCode:[a3 responseStatusCode] error:v6];

  return (int64_t)v7;
}

+ (int64_t)_resultForResponseStatusCode:(int64_t)a3 error:(id)a4
{
  id v6 = [a4 domain];
  unsigned __int8 v7 = [v6 isEqualToString:NSURLErrorDomain];

  if (v7) {
    return 0;
  }
  int64_t v9 = 1;
  if (!a4) {
    int64_t v9 = 2;
  }
  if ((unint64_t)(a3 - 300) >= 0xFFFFFFFFFFFFFF9CLL) {
    return v9;
  }
  else {
    return 1;
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (APStorageManager)secureFileManager
{
  return self->_secureFileManager;
}

- (void)setSecureFileManager:(id)a3
{
}

- (APBackoffTimer)backoffLevels
{
  return self->_backoffLevels;
}

- (void)setBackoffLevels:(id)a3
{
}

- (NSMutableDictionary)failedRequests
{
  return self->_failedRequests;
}

- (void)setFailedRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedRequests, 0);
  objc_storeStrong((id *)&self->_backoffLevels, 0);
  objc_storeStrong((id *)&self->_secureFileManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end