@interface ICContentTasteRequestHandler
- (ICContentTasteRequestHandler)initWithConfiguration:(id)a3;
- (id)description;
- (void)_postContentTasteChanges:(id)a3 withCompletionHandler:(id)a4;
- (void)_postPendingContentTasteChangesByAddingChange:(id)a3 completionHandler:(id)a4;
- (void)_schedulePostingContentTasteForFailedItems;
- (void)_scheduleUpdatingContentTasteWithNewExpirationDate;
- (void)cancelAllOperationsAndClearPendingChangesWithCompletionHandler:(id)a3;
- (void)updateContentTasteForItem:(id)a3 invalidatingLocalCache:(BOOL)a4 completionHandler:(id)a5;
- (void)updateContentTasteForReason:(int64_t)a3 invalidatingLocalCache:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation ICContentTasteRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultContentTasteRefreshIdentifier, 0);
  objc_storeStrong((id *)&self->_responseExpirationDate, 0);
  objc_storeStrong((id *)&self->_pendingChangesCoordinator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_postContentTasteChanges:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste_Oversize");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v67 = self;
    __int16 v68 = 1024;
    *(_DWORD *)v69 = [v6 count];
    *(_WORD *)&v69[4] = 2114;
    *(void *)&v69[6] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ change count=%d, contentTasteChange=%{public}@", buf, 0x1Cu);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v9 = v6;
  id v58 = [v9 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (!v58)
  {

    unsigned int v11 = 0;
    char v33 = 0;
    id v54 = 0;
    v31 = v9;
    goto LABEL_38;
  }
  LOBYTE(v11) = 0;
  char v53 = 0;
  id v54 = 0;
  uint64_t v57 = *(void *)v63;
  id obj = v9;
  *(void *)&long long v10 = 138543874;
  long long v48 = v10;
  id v56 = v7;
  do
  {
    v12 = 0;
    do
    {
      if (*(void *)v63 != v57) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v12);
      v14 = objc_msgSend(v13, "objectForKey:", @"ContentTastePendingChangesCoordinatorOperationIdentifierKey", v48);
      v15 = [v13 objectForKey:@"ContentTastePendingChangesCoordinatorPendingChangesKey"];
      v16 = [v15 objectForKey:@"ContentTastePendingChangesCoordinatorContentTasteItemKey"];

      v17 = [v13 objectForKey:@"ContentTastePendingChangesCoordinatorPendingChangesKey"];
      v18 = [v17 objectForKey:@"ContentTastePendingChangesCoordinatorInvalidateCacheKey"];
      id v19 = [v18 BOOLValue];

      if (v11) {
        unsigned int v11 = 1;
      }
      else {
        unsigned int v11 = [v14 isEqualToString:@"ICContentTasteRequestHandlerRetryTaskIdentifier"];
      }
      v20 = [[ICCloudContentTasteUpdateOperation alloc] initWithContentTasteUpdateItem:v16 invalidateLocalCache:v19 configuration:self->_configuration operationIdentifier:v14];
      [(ICCloudContentTasteUpdateOperation *)v20 main];
      v21 = [(ICCloudContentTasteUpdateOperation *)v20 error];
      v22 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = objc_retainBlock(v7);
        *(_DWORD *)buf = 138544386;
        v67 = self;
        __int16 v68 = 2048;
        *(void *)v69 = v20;
        *(_WORD *)&v69[8] = 2114;
        *(void *)&v69[10] = v14;
        __int16 v70 = 2048;
        id v71 = v23;
        __int16 v72 = 2114;
        v73 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@  Operation=%p (identifier=%{public}@ finished with completion=%p, error=%{public}@", buf, 0x34u);

        id v7 = v56;
      }

      [(ICContentTastePendingChangesCoordinator *)self->_pendingChangesCoordinator contentTasteUpdateOperation:v20 finishedByInvalidatingCache:v19 error:v21];
      if (v21)
      {
        char v53 = 1;
        if (!v7) {
          goto LABEL_16;
        }
LABEL_15:
        v24 = dispatch_get_global_queue(0, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000A26E8;
        block[3] = &unk_1001BEC48;
        id v61 = v7;
        id v60 = v21;
        dispatch_async(v24, block);

        goto LABEL_16;
      }
      v25 = [(ICCloudContentTasteUpdateOperation *)v20 contentTasteUpdateResponse];
      v26 = [v25 expirationDate];

      id v27 = v54;
      if (v54)
      {
        if (v26)
        {
          [v26 timeIntervalSinceDate:v54];
          if (v28 > 3600.0)
          {
            id v27 = v26;

            v29 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v51 = +[NSLocale currentLocale];
              id v55 = [v27 descriptionWithLocale:v51];
              v50 = +[NSLocale currentLocale];
              v49 = [v27 descriptionWithLocale:v50];
              *(_DWORD *)buf = v48;
              v67 = self;
              __int16 v68 = 2114;
              *(void *)v69 = v55;
              *(_WORD *)&v69[8] = 2114;
              *(void *)&v69[10] = v49;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@  response expiration date changed. previous date = %{public}@, updated date = %{public}@", buf, 0x20u);
            }
          }
        }
      }
      else
      {
        id v27 = v26;
      }

      id v54 = v27;
      id v7 = v56;
      if (v56) {
        goto LABEL_15;
      }
LABEL_16:

      v12 = (char *)v12 + 1;
    }
    while (v58 != v12);
    id v30 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
    id v58 = v30;
  }
  while (v30);
  v31 = obj;

  responseExpirationDate = self->_responseExpirationDate;
  char v33 = v53;
  if (!responseExpirationDate && v54
    || responseExpirationDate && v54 && (objc_msgSend(v54, "timeIntervalSinceDate:"), v34 > 3600.0))
  {
    v35 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = self->_responseExpirationDate;
      v37 = +[NSLocale currentLocale];
      v38 = [(NSDate *)v36 descriptionWithLocale:v37];
      v39 = +[NSLocale currentLocale];
      v40 = [v54 descriptionWithLocale:v39];
      *(_DWORD *)buf = v48;
      v67 = self;
      __int16 v68 = 2114;
      *(void *)v69 = v38;
      *(_WORD *)&v69[8] = 2114;
      *(void *)&v69[10] = v40;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}@  response expiration date changed. old date = %{public}@, new date = %{public}@", buf, 0x20u);

      id v7 = v56;
    }

    objc_storeStrong((id *)&self->_responseExpirationDate, v54);
    [(ICContentTasteRequestHandler *)self _scheduleUpdatingContentTasteWithNewExpirationDate];
    if ((v53 & 1) == 0) {
      goto LABEL_47;
    }
LABEL_41:
    if (v11)
    {
      int64_t backOffIndex = self->_backOffIndex;
      if (backOffIndex <= 4) {
        self->_int64_t backOffIndex = backOffIndex + 1;
      }
    }
    v46 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v47 = self->_backOffIndex;
      *(_DWORD *)buf = 138544130;
      v67 = self;
      __int16 v68 = 1024;
      *(_DWORD *)v69 = 1;
      *(_WORD *)&v69[4] = 1024;
      *(_DWORD *)&v69[6] = v11;
      *(_WORD *)&v69[10] = 1024;
      *(_DWORD *)&v69[12] = v47;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}@  scheduleRetry=%{BOOL}u, isRetryTask=%{BOOL}u, _backOffIndex=%d", buf, 0x1Eu);
    }

    [(ICContentTasteRequestHandler *)self _schedulePostingContentTasteForFailedItems];
    goto LABEL_47;
  }
LABEL_38:
  v41 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = self->_responseExpirationDate;
    v43 = +[NSLocale currentLocale];
    v44 = [(NSDate *)v42 descriptionWithLocale:v43];
    *(_DWORD *)buf = 138543618;
    v67 = self;
    __int16 v68 = 2114;
    *(void *)v69 = v44;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}@  retaining _responseExpirationDate=%{public}@", buf, 0x16u);
  }
  if (v33) {
    goto LABEL_41;
  }
LABEL_47:
}

- (void)_postPendingContentTasteChangesByAddingChange:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc((Class)ICAsyncBlockOperation);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_1000A27F0;
  v16 = &unk_1001BC1D0;
  id v17 = v7;
  v18 = self;
  id v19 = v8;
  SEL v20 = a2;
  id v10 = v8;
  id v11 = v7;
  id v12 = [v9 initWithStartHandler:&v13];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v12, v13, v14, v15, v16);
}

- (void)_schedulePostingContentTasteForFailedItems
{
  if (self->_retryState)
  {
    v3 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@  we already have a retry operation scheduled", buf, 0xCu);
    }
  }
  else
  {
    self->_int64_t retryState = 1;
    v4 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int64_t backOffIndex = self->_backOffIndex;
      int v6 = dword_100152578[backOffIndex];
      int64_t retryState = self->_retryState;
      *(_DWORD *)buf = 138544130;
      id v12 = self;
      __int16 v13 = 1024;
      int v14 = retryState;
      __int16 v15 = 1024;
      int v16 = backOffIndex;
      __int16 v17 = 1024;
      int v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@  setting retryState=%d, _backOffIndex%d, backOffSeconds=%d", buf, 0x1Eu);
    }

    dispatch_time_t v8 = dispatch_time(0, 1000000000 * dword_100152578[self->_backOffIndex]);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A2E08;
    block[3] = &unk_1001BEC20;
    void block[4] = self;
    dispatch_after(v8, queue, block);
  }
}

- (void)_scheduleUpdatingContentTasteWithNewExpirationDate
{
  [(NSDate *)self->_responseExpirationDate timeIntervalSince1970];
  uint64_t v4 = v3;
  [(NSDate *)self->_responseExpirationDate timeIntervalSinceNow];
  double v6 = v5;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_int64(v7, XPC_ACTIVITY_DELAY, (uint64_t)v6);
  xpc_dictionary_set_int64(v7, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_15_MIN);
  xpc_dictionary_set_string(v7, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  [(NSDate *)self->_responseExpirationDate timeIntervalSince1970];
  xpc_dictionary_set_double(v7, "MediaContentTasteResponseExpirationTimeKey", v8);
  id v9 = [(NSString *)self->_defaultContentTasteRefreshIdentifier UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000A3048;
  handler[3] = &unk_1001BC1A8;
  id v12 = v7;
  __int16 v13 = self;
  uint64_t v14 = v4;
  id v10 = v7;
  xpc_activity_register(v9, XPC_ACTIVITY_CHECK_IN, handler);
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  double v5 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
  double v6 = [v5 accountDSID];
  xpc_object_t v7 = +[NSString stringWithFormat:@"%@ %p [dsid=%@]", v4, self, v6];

  return v7;
}

- (void)cancelAllOperationsAndClearPendingChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A3420;
  v7[3] = &unk_1001BEC48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)updateContentTasteForItem:(id)a3 invalidatingLocalCache:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A3730;
  v13[3] = &unk_1001BC180;
  BOOL v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)updateContentTasteForReason:(int64_t)a3 invalidatingLocalCache:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A3984;
  v11[3] = &unk_1001BC158;
  BOOL v14 = a4;
  id v12 = v8;
  int64_t v13 = a3;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (ICContentTasteRequestHandler)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ICContentTasteRequestHandler;
  double v5 = [(ICContentTasteRequestHandler *)&v23 init];
  if (v5)
  {
    id v6 = (ICConnectionConfiguration *)[v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = v6;

    id v8 = [(ICConnectionConfiguration *)v5->_configuration userIdentity];
    id v9 = [v8 accountDSID];

    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.amp.iTunesCloud.ICContentTasteRequestHandler-%lu", [v9 hash]);
    uint64_t v11 = +[NSString stringWithFormat:@"%@.default", v10];
    defaultContentTasteRefreshIdentifier = v5->_defaultContentTasteRefreshIdentifier;
    v5->_defaultContentTasteRefreshIdentifier = (NSString *)v11;

    id v13 = +[NSString stringWithFormat:@"%@.queue", v10];
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v14;

    BOOL v16 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v16;

    int v18 = v5->_operationQueue;
    id v19 = +[NSString stringWithFormat:@"%@.operationQueue", v10];
    [(NSOperationQueue *)v18 setName:v19];

    [(NSOperationQueue *)v5->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v5->_operationQueue setQualityOfService:25];
    [(NSOperationQueue *)v5->_operationQueue setUnderlyingQueue:v5->_queue];
    SEL v20 = [[ICContentTastePendingChangesCoordinator alloc] initWithConfiguration:v4];
    pendingChangesCoordinator = v5->_pendingChangesCoordinator;
    v5->_pendingChangesCoordinator = v20;

    v5->_int64_t backOffIndex = 0;
    v5->_int64_t retryState = 0;
    v5->_isHandlerValid = 1;
    [(ICContentTasteRequestHandler *)v5 _schedulePostingContentTasteForFailedItems];
  }
  return v5;
}

@end