@interface MSDContentServer
- (BOOL)localHubReachable;
- (BOOL)shouldTryLocalHub:(id)a3;
- (MSDContentServer)init;
- (MSDContentServer)initWithCellularAccess:(BOOL)a3;
- (MSDContentServerObserver)observer;
- (MSDDownloadFileRequest)cachingHubRequest;
- (NSDictionary)cachedFDC;
- (NSMapTable)sessionTable;
- (NSMutableArray)pendingRequests;
- (NSString)localHubURLSchema;
- (double)cachingHubRetryInterval;
- (double)nextRetryTime;
- (double)reachabilityLastUpdatedTime;
- (id)getSessionForRequest:(id)a3;
- (id)getSessionWithMinRequestLoad;
- (int64_t)concurrentSession;
- (int64_t)maxConcurrentRequests;
- (int64_t)numConcurrentRequests;
- (int64_t)requestPerSession;
- (os_unfair_lock_s)cachingHubRetryLock;
- (os_unfair_lock_s)requestDispatchLock;
- (unint64_t)signpostId;
- (void)allocateRequest:(id)a3 forSession:(id)a4;
- (void)downloadFile:(id)a3;
- (void)freeRequest:(id)a3 forSession:(id)a4;
- (void)handleCompletionForDownloadRequest:(id)a3 withResponse:(id)a4 forSession:(id)a5;
- (void)initServer;
- (void)launchRequest:(id)a3 toSession:(id)a4;
- (void)limitConcurrentRequests;
- (void)setCachedFDC:(id)a3;
- (void)setCachingHubRequest:(id)a3;
- (void)setCachingHubRetryInterval:(double)a3;
- (void)setCachingHubRetryLock:(os_unfair_lock_s)a3;
- (void)setConcurrentSession:(int64_t)a3;
- (void)setLocalHubReachable:(BOOL)a3;
- (void)setLocalHubURLSchema:(id)a3;
- (void)setMaxConcurrentRequests:(int64_t)a3;
- (void)setNextRetryTime:(double)a3;
- (void)setNumConcurrentRequests:(int64_t)a3;
- (void)setObserver:(id)a3;
- (void)setPendingRequests:(id)a3;
- (void)setReachabilityLastUpdatedTime:(double)a3;
- (void)setRequestDispatchLock:(os_unfair_lock_s)a3;
- (void)setRequestPerSession:(int64_t)a3;
- (void)setSessionTable:(id)a3;
- (void)setSignpostId:(unint64_t)a3;
- (void)updateLocalHubReachability:(BOOL)a3 withRequest:(id)a4 andResponse:(id)a5;
@end

@implementation MSDContentServer

- (MSDContentServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)MSDContentServer;
  v2 = [(MSDContentServer *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(MSDContentServer *)v2 initServer];
    if ([(MSDContentServer *)v3 concurrentSession] >= 1)
    {
      uint64_t v4 = 0;
      do
      {
        v5 = objc_alloc_init(MSDCDNSession);
        v6 = [(MSDContentServer *)v3 sessionTable];
        id v7 = objc_alloc_init((Class)NSMutableArray);
        [v6 setObject:v7 forKey:v5];

        ++v4;
      }
      while (v4 < [(MSDContentServer *)v3 concurrentSession]);
    }
    v8 = v3;
  }

  return v3;
}

- (MSDContentServer)initWithCellularAccess:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSDContentServer;
  uint64_t v4 = [(MSDContentServer *)&v12 init];
  v5 = v4;
  if (v4)
  {
    [(MSDContentServer *)v4 initServer];
    if ([(MSDContentServer *)v5 concurrentSession] >= 1)
    {
      uint64_t v6 = 0;
      do
      {
        id v7 = [(MSDSession *)[MSDCDNSession alloc] initWithCellularAccess:v3];
        v8 = [(MSDContentServer *)v5 sessionTable];
        id v9 = objc_alloc_init((Class)NSMutableArray);
        [v8 setObject:v9 forKey:v7];

        ++v6;
      }
      while (v6 < [(MSDContentServer *)v5 concurrentSession]);
    }
    objc_super v10 = v5;
  }

  return v5;
}

- (void)downloadFile:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[MSDContentServer getSessionForRequest:](self, "getSessionForRequest:");
  if (v4) {
    [(MSDContentServer *)self launchRequest:v5 toSession:v4];
  }
}

- (void)launchRequest:(id)a3 toSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_1000C1BC4;
  v44[4] = sub_1000C1BD4;
  id v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = sub_1000C1BC4;
  v42[4] = sub_1000C1BD4;
  id v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = sub_1000C1BC4;
  v40[4] = sub_1000C1BD4;
  id v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_1000C1BC4;
  v38[4] = sub_1000C1BD4;
  id v39 = 0;
  v8 = objc_alloc_init(MSDServerRetryPolicyContext);
  id v9 = [v6 downloadCredentials];
  [(MSDServerRetryPolicyContext *)v8 setFdc:v9];

  objc_super v10 = [v6 originServer];
  [(MSDServerRetryPolicyContext *)v8 setOriginServer:v10];

  [(MSDServerRetryPolicyContext *)v8 setTryCachingHub:[(MSDContentServer *)self shouldTryLocalHub:v6]];
  v11 = [(MSDContentServer *)self localHubURLSchema];
  [(MSDServerRetryPolicyContext *)v8 setCachedLocalURL:v11];

  objc_super v12 = objc_alloc_init(MSDCDNSessionTaskInfo);
  v13 = [v6 fileInfo];
  v14 = [v13 fileHash];
  [(MSDCDNSessionTaskInfo *)v12 setFileHash:v14];

  [(MSDSessionTaskInfo *)v12 setMaxRetry:3];
  v15 = [v6 savePath];
  [(MSDSessionTaskInfo *)v12 setSavePath:v15];

  v16 = [[MSDContentServerURLRetryPolicy alloc] initWithContext:v8];
  v17 = +[NSDate date];
  [v17 timeIntervalSince1970];
  [v6 setDispatchTime:];

  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_1000C1BDC;
  v27 = &unk_1001542D8;
  v34 = v44;
  v28 = self;
  id v18 = v6;
  id v29 = v18;
  v35 = v40;
  v36 = v42;
  v19 = v16;
  v30 = v19;
  v20 = v12;
  v31 = v20;
  id v21 = v7;
  id v32 = v21;
  v37 = v38;
  v22 = v8;
  v33 = v22;
  v23 = objc_retainBlock(&v24);
  -[MSDSessionTaskInfo setHandler:](v20, "setHandler:", v23, v24, v25, v26, v27, v28);
  ((void (*)(void ***, void, void))v23[2])(v23, 0, 0);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
}

- (void)initServer
{
  [(MSDContentServer *)self setLocalHubReachable:1];
  [(MSDContentServer *)self setLocalHubURLSchema:0];
  [(MSDContentServer *)self setCachedFDC:0];
  [(MSDContentServer *)self setNextRetryTime:0.0];
  [(MSDContentServer *)self setReachabilityLastUpdatedTime:0.0];
  [(MSDContentServer *)self setCachingHubRequest:0];
  [(MSDContentServer *)self setRequestDispatchLock:0];
  [(MSDContentServer *)self setCachingHubRetryLock:0];
  [(MSDContentServer *)self setCachingHubRetryInterval:600.0];
  [(MSDContentServer *)self setConcurrentSession:2];
  [(MSDContentServer *)self setRequestPerSession:6];
  [(MSDContentServer *)self setNumConcurrentRequests:0];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [(MSDContentServer *)self setPendingRequests:v3];

  uint64_t v4 = +[NSMapTable strongToStrongObjectsMapTable];
  [(MSDContentServer *)self setSessionTable:v4];

  id v5 = sub_1000687C8();
  [(MSDContentServer *)self setSignpostId:os_signpost_id_generate(v5)];

  if (os_variant_has_internal_content())
  {
    id v6 = +[MSDTestPreferences sharedInstance];
    uint64_t v7 = (uint64_t)[v6 concurrentSession];

    if (v7 >= 1)
    {
      v8 = sub_100068600();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134217984;
        double v17 = *(double *)&v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Override default number of concurrent download session: %ld", (uint8_t *)&v16, 0xCu);
      }

      [(MSDContentServer *)self setConcurrentSession:v7];
    }
    id v9 = +[MSDTestPreferences sharedInstance];
    uint64_t v10 = (uint64_t)[v9 concurrentDownloadRequest];

    if (v10 >= 1)
    {
      v11 = sub_100068600();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134217984;
        double v17 = *(double *)&v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Override default number of concurrent requests per session: %ld", (uint8_t *)&v16, 0xCu);
      }

      [(MSDContentServer *)self setRequestPerSession:v10];
    }
    objc_super v12 = +[MSDTestPreferences sharedInstance];
    [v12 cachingHubRetryInterval];
    double v14 = v13;

    if (v14 > 0.0)
    {
      v15 = sub_100068600();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134217984;
        double v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Override default caching hub retry interval: %lf", (uint8_t *)&v16, 0xCu);
      }

      [(MSDContentServer *)self setCachingHubRetryInterval:v14];
    }
  }
  [(MSDContentServer *)self setMaxConcurrentRequests:[(MSDContentServer *)self requestPerSession]* [(MSDContentServer *)self concurrentSession]];
}

- (void)handleCompletionForDownloadRequest:(id)a3 withResponse:(id)a4 forSession:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_requestDispatchLock);
  [(MSDContentServer *)self freeRequest:v17 forSession:v9];
  uint64_t v10 = [(MSDContentServer *)self numConcurrentRequests];
  if (v10 < [(MSDContentServer *)self maxConcurrentRequests]
    && ([(MSDContentServer *)self pendingRequests],
        v11 = objc_claimAutoreleasedReturnValue(),
        [v11 firstObject],
        objc_super v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        v12))
  {
    double v13 = [(MSDContentServer *)self pendingRequests];
    [v13 removeObjectAtIndex:0];

    [(MSDContentServer *)self allocateRequest:v12 forSession:v9];
    os_unfair_lock_unlock(&self->_requestDispatchLock);
    [(MSDContentServer *)self launchRequest:v12 toSession:v9];
  }
  else
  {
    os_unfair_lock_unlock(&self->_requestDispatchLock);
  }
  double v14 = [(MSDContentServer *)self observer];

  if (v14)
  {
    v15 = [(MSDContentServer *)self observer];
    [v15 requestComplete:v17 withResponse:v8];
  }
  else
  {
    int v16 = [v17 completion];

    if (!v16) {
      goto LABEL_10;
    }
    v15 = [v17 completion];
    ((void (**)(void, id))v15)[2](v15, v8);
  }

LABEL_10:
}

- (id)getSessionForRequest:(id)a3
{
  p_requestDispatchLock = &self->_requestDispatchLock;
  id v5 = a3;
  os_unfair_lock_lock(p_requestDispatchLock);
  uint64_t v6 = [(MSDContentServer *)self numConcurrentRequests];
  if (v6 >= [(MSDContentServer *)self maxConcurrentRequests])
  {
    id v8 = [(MSDContentServer *)self pendingRequests];
    [v8 addObject:v5];

    uint64_t v7 = 0;
    id v5 = v8;
  }
  else
  {
    uint64_t v7 = [(MSDContentServer *)self getSessionWithMinRequestLoad];
    [(MSDContentServer *)self allocateRequest:v5 forSession:v7];
  }

  os_unfair_lock_unlock(p_requestDispatchLock);

  return v7;
}

- (void)allocateRequest:(id)a3 forSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDContentServer *)self sessionTable];
  id v9 = [v8 objectForKey:v6];

  [v9 addObject:v7];
  [(MSDContentServer *)self setNumConcurrentRequests:(char *)[(MSDContentServer *)self numConcurrentRequests] + 1];
}

- (void)freeRequest:(id)a3 forSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDContentServer *)self sessionTable];
  id v9 = [v8 objectForKey:v6];

  [v9 removeObject:v7];
  [(MSDContentServer *)self setNumConcurrentRequests:(char *)[(MSDContentServer *)self numConcurrentRequests] - 1];
}

- (id)getSessionWithMinRequestLoad
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(MSDContentServer *)self sessionTable];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [(MSDContentServer *)self sessionTable];
        objc_super v12 = [v11 objectForKey:v10];

        if ((unint64_t)[v12 count] < v8)
        {
          unint64_t v8 = (unint64_t)[v12 count];
          id v13 = v10;

          id v6 = v13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)limitConcurrentRequests
{
  p_requestDispatchLock = &self->_requestDispatchLock;
  os_unfair_lock_lock(&self->_requestDispatchLock);
  if ([(MSDContentServer *)self requestPerSession] >= 2)
  {
    [(MSDContentServer *)self setRequestPerSession:(char *)[(MSDContentServer *)self requestPerSession] - 1];
    [(MSDContentServer *)self setMaxConcurrentRequests:[(MSDContentServer *)self requestPerSession]* [(MSDContentServer *)self concurrentSession]];
    id v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1000DE3D8(self, v4);
    }
  }
  os_unfair_lock_unlock(p_requestDispatchLock);
}

- (BOOL)shouldTryLocalHub:(id)a3
{
  id v4 = a3;
  id v5 = [v4 downloadCredentials];
  id v6 = [v4 originServer];
  uint64_t v7 = [v5 localCredentialForOriginServer:v6];

  os_unfair_lock_lock(&self->_cachingHubRetryLock);
  unsigned int v8 = [(MSDContentServer *)self localHubReachable];
  BOOL v9 = v8;
  if (v7 && (v8 & 1) == 0)
  {
    uint64_t v10 = [(MSDContentServer *)self cachingHubRequest];

    if (v10)
    {
LABEL_4:
      LOBYTE(v9) = 0;
      goto LABEL_18;
    }
    uint64_t v11 = [(MSDContentServer *)self cachedFDC];
    if (v11
      && (objc_super v12 = (void *)v11,
          [(MSDContentServer *)self cachedFDC],
          id v13 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v14 = [v7 isEqualToDictionary:v13],
          v13,
          v12,
          (v14 & 1) != 0))
    {
      long long v15 = +[NSDate date];
      [v15 timeIntervalSince1970];
      double v17 = v16;
      [(MSDContentServer *)self nextRetryTime];
      double v19 = v18;

      if (v17 <= v19) {
        goto LABEL_4;
      }
      v20 = sub_100068600();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = +[NSDate date];
        [v21 timeIntervalSince1970];
        v23 = v22;
        [(MSDContentServer *)self cachingHubRetryInterval];
        int v27 = 134218240;
        id v28 = v23;
        __int16 v29 = 2048;
        uint64_t v30 = v24;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Trying local caching hub at %lf after %lf s", (uint8_t *)&v27, 0x16u);
      }
    }
    else
    {
      v20 = sub_100068600();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Request local FDC is new, retrying local caching hub", (uint8_t *)&v27, 2u);
      }
    }

    [(MSDContentServer *)self setCachingHubRequest:v4];
    uint64_t v25 = sub_100068600();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138543362;
      id v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Launching request %{public}@ to retry caching hub", (uint8_t *)&v27, 0xCu);
    }

    BOOL v9 = 1;
  }
  if (v7 && v9) {
    [(MSDContentServer *)self setCachedFDC:v7];
  }
LABEL_18:
  os_unfair_lock_unlock(&self->_cachingHubRetryLock);

  return v9;
}

- (void)updateLocalHubReachability:(BOOL)a3 withRequest:(id)a4 andResponse:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_cachingHubRetryLock);
  [v8 dispatchTime];
  double v11 = v10;
  [(MSDContentServer *)self reachabilityLastUpdatedTime];
  double v13 = v12;
  uint64_t v14 = [(MSDContentServer *)self cachingHubRequest];
  if (v14
    && (long long v15 = (void *)v14,
        [(MSDContentServer *)self cachingHubRequest],
        id v16 = (id)objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v16 == v8))
  {
    double v18 = sub_100068600();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138543618;
      id v33 = v8;
      __int16 v34 = 1024;
      LODWORD(v35) = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request %{public}@ complete with local hub reachability=%d", (uint8_t *)&v32, 0x12u);
    }

    [(MSDContentServer *)self setCachingHubRequest:0];
    BOOL v17 = v6;
  }
  else
  {
    BOOL v17 = !v6;
  }
  if (v11 > v13 && v17)
  {
    v20 = sub_100068600();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      [(MSDContentServer *)self reachabilityLastUpdatedTime];
      v22 = v21;
      [v8 dispatchTime];
      int v32 = 134218754;
      id v33 = v22;
      __int16 v34 = 2114;
      id v35 = v8;
      __int16 v36 = 2048;
      uint64_t v37 = v23;
      __int16 v38 = 1024;
      BOOL v39 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Reachability last updated by request dispatched at: %lf; request %{public}@ dispatched at %lf changing local hub"
        " reachability={public}%d",
        (uint8_t *)&v32,
        0x26u);
    }

    [(MSDContentServer *)self setLocalHubReachable:v6];
    [v8 dispatchTime];
    -[MSDContentServer setReachabilityLastUpdatedTime:](self, "setReachabilityLastUpdatedTime:");
    uint64_t v24 = [v9 localHubError];
    uint64_t v25 = [v24 localizedDescription];
    v26 = +[MSDTargetDevice sharedInstance];
    [v26 setLocalHubFailureReason:v25];

    int v27 = +[MSDMailProcessor sharedInstance];
    [v27 reportCachingHubFailed];
  }
  if (![(MSDContentServer *)self localHubReachable])
  {
    id v28 = +[NSDate date];
    [v28 timeIntervalSince1970];
    double v30 = v29;
    [(MSDContentServer *)self cachingHubRetryInterval];
    [(MSDContentServer *)self setNextRetryTime:v30 + v31];
  }
  os_unfair_lock_unlock(&self->_cachingHubRetryLock);
}

- (MSDContentServerObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (NSString)localHubURLSchema
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalHubURLSchema:(id)a3
{
}

- (BOOL)localHubReachable
{
  return self->_localHubReachable;
}

- (void)setLocalHubReachable:(BOOL)a3
{
  self->_localHubReachable = a3;
}

- (NSDictionary)cachedFDC
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCachedFDC:(id)a3
{
}

- (double)nextRetryTime
{
  return self->_nextRetryTime;
}

- (void)setNextRetryTime:(double)a3
{
  self->_nextRetryTime = a3;
}

- (double)reachabilityLastUpdatedTime
{
  return self->_reachabilityLastUpdatedTime;
}

- (void)setReachabilityLastUpdatedTime:(double)a3
{
  self->_reachabilityLastUpdatedTime = a3;
}

- (double)cachingHubRetryInterval
{
  return self->_cachingHubRetryInterval;
}

- (void)setCachingHubRetryInterval:(double)a3
{
  self->_cachingHubRetryInterval = a3;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (MSDDownloadFileRequest)cachingHubRequest
{
  return self->_cachingHubRequest;
}

- (void)setCachingHubRequest:(id)a3
{
}

- (os_unfair_lock_s)cachingHubRetryLock
{
  return self->_cachingHubRetryLock;
}

- (void)setCachingHubRetryLock:(os_unfair_lock_s)a3
{
  self->_cachingHubRetryLock = a3;
}

- (os_unfair_lock_s)requestDispatchLock
{
  return self->_requestDispatchLock;
}

- (void)setRequestDispatchLock:(os_unfair_lock_s)a3
{
  self->_requestDispatchLock = a3;
}

- (int64_t)requestPerSession
{
  return self->_requestPerSession;
}

- (void)setRequestPerSession:(int64_t)a3
{
  self->_requestPerSession = a3;
}

- (int64_t)concurrentSession
{
  return self->_concurrentSession;
}

- (void)setConcurrentSession:(int64_t)a3
{
  self->_concurrentSession = a3;
}

- (int64_t)maxConcurrentRequests
{
  return self->_maxConcurrentRequests;
}

- (void)setMaxConcurrentRequests:(int64_t)a3
{
  self->_maxConcurrentRequests = a3;
}

- (int64_t)numConcurrentRequests
{
  return self->_numConcurrentRequests;
}

- (void)setNumConcurrentRequests:(int64_t)a3
{
  self->_numConcurrentRequests = a3;
}

- (NSMapTable)sessionTable
{
  return self->_sessionTable;
}

- (void)setSessionTable:(id)a3
{
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_sessionTable, 0);
  objc_storeStrong((id *)&self->_cachingHubRequest, 0);
  objc_storeStrong((id *)&self->_cachedFDC, 0);
  objc_storeStrong((id *)&self->_localHubURLSchema, 0);

  objc_storeStrong((id *)&self->_observer, 0);
}

@end