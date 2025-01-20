@interface CloudLibrary
+ (id)logCategory;
+ (id)oversizeLogCategory;
- (BOOL)_isEnabledWithURLBag:(id)a3;
- (BOOL)failedToConnect;
- (BOOL)loginRequestInFlight;
- (CloudLibrary)init;
- (CloudLibraryConnection)underlyingConnection;
- (CloudPendingChangesCoordinator)pendingChangesCoordinator;
- (ICConnectionConfiguration)configuration;
- (NSString)libraryIdentifier;
- (OS_dispatch_group)connectionGroup;
- (OS_dispatch_queue)asynchronousRequestsAccessQueue;
- (OS_dispatch_queue)connectionQueue;
- (id)_bagKey;
- (id)_initWithConfiguration:(id)a3 pendingChangesCoordinator:(id)a4;
- (id)_userIdentity;
- (id)connectionCompletionHandler;
- (void)_connectToLibraryWithCompletionHandler:(id)a3 allowRetry:(BOOL)a4 forceBagReload:(BOOL)a5;
- (void)_continueConnectingToLibraryWithCompletionHandler:(id)a3;
- (void)_enqueueFailedOperation:(id)a3;
- (void)_enqueuePendingOperation:(id)a3;
- (void)_ensureConnectionWithCompletionHandler:(id)a3;
- (void)_executeBlockForAllOperations:(id)a3;
- (void)_performPendingOperations;
- (void)addBackgroundOperation:(id)a3 priority:(int)a4;
- (void)addOperation:(id)a3 priority:(int)a4;
- (void)cancelAllOperations;
- (void)dealloc;
- (void)decreasePriorityForAllOperations;
- (void)increasePriorityForAllOperations;
- (void)setAsynchronousRequestsAccessQueue:(id)a3;
- (void)setConnectionCompletionHandler:(id)a3;
- (void)setConnectionGroup:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setFailedToConnect:(BOOL)a3;
- (void)setLoginRequestInFlight:(BOOL)a3;
- (void)setUnderlyingConnection:(id)a3;
@end

@implementation CloudLibrary

- (void)_ensureConnectionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CloudLibrary *)self connectionQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007570;
  v7[3] = &unk_1001BEC48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)addOperation:(id)a3 priority:(int)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(CloudLibrary *)self libraryIdentifier];
    [v6 setLibraryIdentifier:v7];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000872C;
    v8[3] = &unk_1001BBB28;
    v8[4] = self;
    id v9 = v6;
    int v10 = a4;
    [(CloudLibrary *)self _ensureConnectionWithCompletionHandler:v8];
  }
}

- (CloudLibraryConnection)underlyingConnection
{
  return self->_underlyingConnection;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (BOOL)failedToConnect
{
  return self->_failedToConnect;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (OS_dispatch_group)connectionGroup
{
  return self->_connectionGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_asynchronousRequestsAccessQueue, 0);
  objc_storeStrong((id *)&self->_connectionGroup, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_pendingChangesCoordinator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_underlyingConnection, 0);

  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
}

- (void)setConnectionCompletionHandler:(id)a3
{
}

- (id)connectionCompletionHandler
{
  return self->_connectionCompletionHandler;
}

- (void)setAsynchronousRequestsAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)asynchronousRequestsAccessQueue
{
  return self->_asynchronousRequestsAccessQueue;
}

- (void)setLoginRequestInFlight:(BOOL)a3
{
  self->_loginRequestInFlight = a3;
}

- (BOOL)loginRequestInFlight
{
  return self->_loginRequestInFlight;
}

- (void)setConnectionGroup:(id)a3
{
}

- (void)setConnectionQueue:(id)a3
{
}

- (void)setFailedToConnect:(BOOL)a3
{
  self->_failedToConnect = a3;
}

- (CloudPendingChangesCoordinator)pendingChangesCoordinator
{
  return self->_pendingChangesCoordinator;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setUnderlyingConnection:(id)a3
{
}

- (void)_executeBlockForAllOperations:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(id)objc_opt_class() logCategory];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2048;
      v17 = self;
      id v6 = v15;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %p -  _executeBlockForAllOperations", buf, 0x16u);
    }
    v7 = +[ICDServer server];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100080930;
    v12[3] = &unk_1001BBC18;
    v12[4] = self;
    id v8 = v4;
    id v13 = v8;
    [v7 enumerateOperationsUsingBlock:v12];

    id v9 = +[ICDServer server];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100080B54;
    v10[3] = &unk_1001BBC18;
    v10[4] = self;
    id v11 = v8;
    [v9 enumerateBackgroundOperationsUsingBlock:v10];
  }
}

- (void)_continueConnectingToLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [[CloudLibraryConnection alloc] initWithConfiguration:self->_configuration];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100080E3C;
  v8[3] = &unk_1001BBBF0;
  id v9 = v5;
  id v10 = v4;
  v8[4] = self;
  id v6 = v5;
  id v7 = v4;
  [(CloudLibraryConnection *)v6 connectWithCompletionHandler:v8];
}

- (void)_connectToLibraryWithCompletionHandler:(id)a3 allowRetry:(BOOL)a4 forceBagReload:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(id)objc_opt_class() logCategory];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CloudLibrary %p - Loading URL bag...", buf, 0xCu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100081308;
  v16[3] = &unk_1001BE6B0;
  v16[4] = self;
  id v10 = [objc_alloc((Class)ICStoreRequestContext) initWithBlock:v16];
  id v11 = +[ICURLBagProvider sharedBagProvider];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100081378;
  v13[3] = &unk_1001BBBA0;
  v13[4] = self;
  id v14 = v8;
  BOOL v15 = a4;
  id v12 = v8;
  [v11 getBagForRequestContext:v10 forceRefetch:v5 withCompletionHandler:v13];
}

- (void)_enqueuePendingOperation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CloudLibrary *)self pendingChangesCoordinator];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() logCategory];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      int v15 = 134218498;
      __int16 v16 = self;
      __int16 v17 = 2114;
      v18 = v8;
      __int16 v19 = 2048;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CloudLibrary %p - Enqueuing unserviceable operation to the pending changes coordinator: <%{public}@: %p>", (uint8_t *)&v15, 0x20u);
    }
    [v5 addPendingChange:v4];
  }
  [v4 cancel];
  [v4 setStatus:3];
  id v9 = +[NSError ic_cloudClientErrorWithCode:2003 userInfo:0];
  [v4 setError:v9];

  id v10 = [v4 completionBlock];

  if (v10)
  {
    id v11 = [(id)objc_opt_class() logCategory];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      int v15 = 134218498;
      __int16 v16 = self;
      __int16 v17 = 2114;
      v18 = v13;
      __int16 v19 = 2048;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CloudLibrary %p - Calling completion block on non-executing, cancelled operation: <%{public}@: %p>", (uint8_t *)&v15, 0x20u);
    }
    id v14 = [v4 completionBlock];
    v14[2]();
  }
}

- (void)_enqueueFailedOperation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CloudLibrary *)self pendingChangesCoordinator];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() logCategory];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      int v9 = 134218498;
      id v10 = self;
      __int16 v11 = 2114;
      id v12 = v8;
      __int16 v13 = 2048;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CloudLibrary %p - Enqueuing failed operation to the pending changes coordinator: <%{public}@: %p>", (uint8_t *)&v9, 0x20u);
    }
    [v5 addPendingChange:v4];
  }
}

- (void)_performPendingOperations
{
  v3 = [(CloudLibrary *)self pendingChangesCoordinator];
  if (v3)
  {
    id v4 = [(id)objc_opt_class() logCategory];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218498;
      id v7 = self;
      __int16 v8 = 2114;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2048;
      __int16 v11 = v3;
      id v5 = v9;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CloudLibrary %p - Performing pending changes with coordinator: <%{public}@ %p>", (uint8_t *)&v6, 0x20u);
    }
    [v3 processPendingChangesUsingLibrary:self];
  }
}

- (BOOL)_isEnabledWithURLBag:(id)a3
{
  return 1;
}

- (id)_bagKey
{
  return 0;
}

- (id)_userIdentity
{
  return +[ICUserIdentity autoupdatingActiveAccount];
}

- (void)cancelAllOperations
{
  v3 = [(id)objc_opt_class() logCategory];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    id v9 = self;
    id v4 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %p - cancelAllOperations", buf, 0x16u);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100082004;
  v5[3] = &unk_1001BBB50;
  v5[4] = self;
  [(CloudLibrary *)self _executeBlockForAllOperations:v5];
}

- (void)increasePriorityForAllOperations
{
  v3 = [(id)objc_opt_class() logCategory];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    id v9 = self;
    id v4 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %p -  increasePriorityForAllOperations", buf, 0x16u);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100082248;
  v5[3] = &unk_1001BBB50;
  v5[4] = self;
  [(CloudLibrary *)self _executeBlockForAllOperations:v5];
}

- (void)decreasePriorityForAllOperations
{
  v3 = [(id)objc_opt_class() logCategory];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    id v9 = self;
    id v4 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %p -  decreasePriorityForAllOperations", buf, 0x16u);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008248C;
  v5[3] = &unk_1001BBB50;
  v5[4] = self;
  [(CloudLibrary *)self _executeBlockForAllOperations:v5];
}

- (void)addBackgroundOperation:(id)a3 priority:(int)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [(CloudLibrary *)self libraryIdentifier];
    [v6 setLibraryIdentifier:v7];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100082678;
    v8[3] = &unk_1001BBB28;
    v8[4] = self;
    id v9 = v6;
    int v10 = a4;
    [(CloudLibrary *)self _ensureConnectionWithCompletionHandler:v8];
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CloudLibrary;
  [(CloudLibrary *)&v2 dealloc];
}

- (id)_initWithConfiguration:(id)a3 pendingChangesCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)CloudLibrary;
  __int16 v8 = [(CloudLibrary *)&v30 init];
  if (v8)
  {
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    libraryIdentifier = v8->_libraryIdentifier;
    v8->_libraryIdentifier = (NSString *)v10;

    id v12 = (ICConnectionConfiguration *)[v6 copy];
    configuration = v8->_configuration;
    v8->_configuration = v12;

    id v14 = [(ICConnectionConfiguration *)v8->_configuration userIdentity];
    int v15 = [(ICConnectionConfiguration *)v8->_configuration userIdentityStore];
    __int16 v16 = [(CloudLibrary *)v8 _bagKey];
    [(ICConnectionConfiguration *)v8->_configuration setLibraryBagKey:v16];

    objc_storeStrong((id *)&v8->_pendingChangesCoordinator, a4);
    id v17 = +[NSString stringWithFormat:@"com.apple.itunescloudd.%@.connection", objc_opt_class()];
    dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], 0);
    [(CloudLibrary *)v8 setConnectionQueue:v18];

    dispatch_group_t v19 = dispatch_group_create();
    [(CloudLibrary *)v8 setConnectionGroup:v19];

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.itunescloudd.asyncrequests", 0);
    [(CloudLibrary *)v8 setAsynchronousRequestsAccessQueue:v20];

    id v29 = 0;
    v21 = [v15 getPropertiesForUserIdentity:v14 error:&v29];
    id v22 = v29;
    if (v22)
    {
      v23 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_msgSend(v22, "msv_description");
        *(_DWORD *)buf = 138543874;
        v32 = v8;
        __int16 v33 = 2114;
        v34 = v14;
        __int16 v35 = 2114;
        v36 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load identity properties for %{public}@ error=%{public}@", buf, 0x20u);
      }
    }
    if (!v21
      || ([v21 DSID],
          v25 = objc_claimAutoreleasedReturnValue(),
          id v26 = [v25 longLongValue],
          v25,
          !v26))
    {
      v27 = [(id)objc_opt_class() logCategory];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v32 = v8;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "CloudLibrary %p - No active account, returning nil library (which will suspend operation queue).", buf, 0xCu);
      }

      __int16 v8 = 0;
    }
  }
  return v8;
}

- (CloudLibrary)init
{
  return 0;
}

+ (id)oversizeLogCategory
{
  id v4 = +[CloudLibrary instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v7 = +[NSAssertionHandler currentHandler];
    __int16 v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, a1, @"CloudLibrary.m", 50, @"Subclass %@ must implement -%@ defined in %@.", v9, v10, @"CloudLibrary" object file lineNumber description];
  }
  id v5 = &_os_log_default;
  return &_os_log_default;
}

+ (id)logCategory
{
  id v4 = +[CloudLibrary instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v7 = +[NSAssertionHandler currentHandler];
    __int16 v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, a1, @"CloudLibrary.m", 45, @"Subclass %@ must implement -%@ defined in %@.", v9, v10, @"CloudLibrary" object file lineNumber description];
  }
  id v5 = &_os_log_default;
  return &_os_log_default;
}

@end