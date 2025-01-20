@interface FRPrivateDataUpdateCoordinator
- (FCAsyncSerialQueue)updateQueue;
- (FRPrivateDataUpdateCoordinator)init;
- (FRPrivateDataUpdateCoordinator)initWithNetworkReachability:(id)a3;
- (NSArray)privateDataControllers;
- (void)_updatePrivateDataControllersWithCompletion:(id)a3;
- (void)markAllPrivateDataControllersAsNeedingUpdate;
- (void)networkReachabilityDidChange:(id)a3;
- (void)privateDataControllerDidBecomeDirty:(id)a3;
- (void)setPrivateDataControllers:(id)a3;
- (void)setUpdateQueue:(id)a3;
- (void)updatePrivateDataControllersWithCompletion:(id)a3;
@end

@implementation FRPrivateDataUpdateCoordinator

- (FRPrivateDataUpdateCoordinator)initWithNetworkReachability:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FRPrivateDataUpdateCoordinator;
  v5 = [(FRPrivateDataUpdateCoordinator *)&v9 init];
  if (v5)
  {
    v6 = (FCAsyncSerialQueue *)objc_alloc_init((Class)FCAsyncSerialQueue);
    updateQueue = v5->_updateQueue;
    v5->_updateQueue = v6;

    [v4 addObserver:v5];
  }

  return v5;
}

- (void)setPrivateDataControllers:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = self->_privateDataControllers;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      objc_super v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v9) removeStateObserver:self];
        objc_super v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  v10 = (NSArray *)[v4 copy];
  privateDataControllers = self->_privateDataControllers;
  self->_privateDataControllers = v10;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v16) addStateObserver:self];
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  [(FRPrivateDataUpdateCoordinator *)self _updatePrivateDataControllersWithCompletion:0];
}

- (void)_updatePrivateDataControllersWithCompletion:(id)a3
{
  long long v19 = (void (**)(void))a3;
  +[NSThread isMainThread];
  id v4 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = [(FRPrivateDataUpdateCoordinator *)self privateDataControllers];
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v10 isDirty])
        {
          uint64_t v11 = ++qword_1000EE180;
          id v12 = (void *)FCPrivateDataLog;
          if (os_log_type_enabled(FCPrivateDataLog, OS_LOG_TYPE_DEFAULT))
          {
            id v13 = v12;
            id v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            uint64_t v15 = v5;
            long long v17 = v16 = self;
            *(_DWORD *)buf = 138543618;
            v28 = v17;
            __int16 v29 = 2048;
            uint64_t v30 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "update coordinator will get in line to trigger sync, target=%{public}@, instance=%lu", buf, 0x16u);

            self = v16;
            v5 = v15;
          }
          dispatch_group_enter(v4);
          long long v18 = [(FRPrivateDataUpdateCoordinator *)self updateQueue];
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_1000574A8;
          v20[3] = &unk_1000C9598;
          v20[4] = v10;
          uint64_t v22 = v11;
          long long v21 = v4;
          [v18 enqueueBlockForMainThread:v20];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v7);
  }

  if (v19)
  {
    if (FCDispatchGroupIsEmpty()) {
      v19[2](v19);
    }
    else {
      dispatch_group_notify(v4, (dispatch_queue_t)&_dispatch_main_q, v19);
    }
  }
}

- (NSArray)privateDataControllers
{
  return self->_privateDataControllers;
}

- (void)updatePrivateDataControllersWithCompletion:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  [(FRPrivateDataUpdateCoordinator *)self _updatePrivateDataControllersWithCompletion:v4];
}

- (FRPrivateDataUpdateCoordinator)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v6 = "-[FRPrivateDataUpdateCoordinator init]";
    __int16 v7 = 2080;
    uint64_t v8 = "FRPrivateDataUpdateCoordinator.m";
    __int16 v9 = 1024;
    int v10 = 21;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRPrivateDataUpdateCoordinator init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)markAllPrivateDataControllersAsNeedingUpdate
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(FRPrivateDataUpdateCoordinator *)self privateDataControllers];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) markAsDirty];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)privateDataControllerDidBecomeDirty:(id)a3
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_updatePrivateDataControllersWithCompletion:" object:0];

  [(FRPrivateDataUpdateCoordinator *)self performSelector:"_updatePrivateDataControllersWithCompletion:" withObject:0 afterDelay:1.0];
}

- (void)networkReachabilityDidChange:(id)a3
{
  if ([a3 isNetworkReachable])
  {
    [(FRPrivateDataUpdateCoordinator *)self updatePrivateDataControllersWithCompletion:0];
  }
}

- (FCAsyncSerialQueue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateQueue, 0);

  objc_storeStrong((id *)&self->_privateDataControllers, 0);
}

@end