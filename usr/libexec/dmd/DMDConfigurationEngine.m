@interface DMDConfigurationEngine
- (CATOperation)initializationOperation;
- (CATOperationQueue)queue;
- (DMDActivationPredicateObserverManager)activationPredicateObserverManager;
- (DMDConfigurationDatabase)database;
- (DMDConfigurationEngine)initWithDatabase:(id)a3 policyPersistence:(id)a4 activationManager:(id)a5;
- (DMDConfigurationEngineDelegate)delegate;
- (DMDDeviceStateProvider)deviceStateProvider;
- (DMDEngineDatabaseInitializationOperation)databaseInitializationOperation;
- (DMDEventSubscriptionManager)eventSubscriptionManager;
- (DMDPolicyPersistence)policyPersistence;
- (DMDTaskOperationProvider)taskOperationProvider;
- (NSError)initializationError;
- (NSMutableDictionary)organizationControllerByIdentifier;
- (NSString)description;
- (id)engineProcessingOperation:(id)a3 assetResolverForOrganizationWithIdentifier:(id)a4;
- (id)engineProcessingOperation:(id)a3 enqueuedOperationsForOrganizationWithIdentifier:(id)a4;
- (void)_cleanupOrphanedPolicies;
- (void)_updateOrganizationControllers;
- (void)activationPredicateObserverManager:(id)a3 didObserveChangeForPredicateWithIdentifier:(id)a4;
- (void)configurationSourceController:(id)a3 fetchEventsWithCompletionHandler:(id)a4;
- (void)configurationSourceController:(id)a3 fetchStatusUpdatesWithCompletionHandler:(id)a4;
- (void)databaseInitializationOperationDidFinish;
- (void)declarationModificationOperationDidFinish:(id)a3 completionHandler:(id)a4;
- (void)delegateDidResume;
- (void)delegateWillSuspend;
- (void)enqueueDatabaseModificationOperation:(id)a3 completionHandler:(id)a4;
- (void)enqueueDeclarationProcessingOperationIfNeeded;
- (void)enqueueOperation:(id)a3;
- (void)enqueueOperations:(id)a3;
- (void)handleConfigurationSourceRegistrationRequest:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5;
- (void)handleCreateConfigurationOrganizationRequest:(id)a3 completionHandler:(id)a4;
- (void)handleDeactivateConfigurationOrganizationRequest:(id)a3 completionHandler:(id)a4;
- (void)handleFetchConfigurationOrganizationsRequest:(id)a3 completionHandler:(id)a4;
- (void)handleFetchDeclarationsRequest:(id)a3 completionHandler:(id)a4;
- (void)handleFetchStreamEvents:(id)a3 completionHandler:(id)a4;
- (void)handleInstallSubscriptionRequest:(id)a3 completionHandler:(id)a4;
- (void)handleRemoveSubscriptionRequest:(id)a3 completionHandler:(id)a4;
- (void)handleSetDeclarationsRequest:(id)a3 completionHandler:(id)a4;
- (void)handleUpdateCommandsRequest:(id)a3 completionHandler:(id)a4;
- (void)handleUpdateDeclarationsRequest:(id)a3 completionHandler:(id)a4;
- (void)initializationOperationDidFinish:(id)a3;
- (void)processDeclarationsForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)processStatusForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)refreshStatusForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)registerConfigurationSourceOperation:(id)a3 didUpdateRegistrationForConfigurationSource:(id)a4;
- (void)resume;
- (void)sendEvents:(id)a3 organizationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setActivationPredicateObserverManager:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setDatabaseInitializationOperation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceStateProvider:(id)a3;
- (void)setEventSubscriptionManager:(id)a3;
- (void)setInitializationError:(id)a3;
- (void)setInitializationOperation:(id)a3;
- (void)setOrganizationControllerByIdentifier:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTaskOperationProvider:(id)a3;
- (void)suspend;
- (void)updateEventSubscriptions;
- (void)updateOrganizationControllers;
@end

@implementation DMDConfigurationEngine

- (DMDConfigurationEngine)initWithDatabase:(id)a3 policyPersistence:(id)a4 activationManager:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v28 = +[NSAssertionHandler currentHandler];
    [v28 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 76, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v34.receiver = self;
  v34.super_class = (Class)DMDConfigurationEngine;
  v13 = [(DMDConfigurationEngine *)&v34 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_database, a3);
    uint64_t v15 = objc_opt_new();
    queue = v14->_queue;
    v14->_queue = (CATOperationQueue *)v15;

    v17 = +[NSString stringWithFormat:@"%@.%p.configuration-engine", objc_opt_class(), v14];
    [(CATOperationQueue *)v14->_queue setName:v17];

    [(CATOperationQueue *)v14->_queue setMaxConcurrentOperationCount:1];
    [(CATOperationQueue *)v14->_queue setSuspended:1];
    uint64_t v18 = objc_opt_new();
    organizationControllerByIdentifier = v14->_organizationControllerByIdentifier;
    v14->_organizationControllerByIdentifier = (NSMutableDictionary *)v18;

    objc_storeStrong((id *)&v14->_activationPredicateObserverManager, a5);
    [(DMDActivationPredicateObserverManager *)v14->_activationPredicateObserverManager setDelegate:v14];
    uint64_t v20 = objc_opt_new();
    databaseInitializationOperation = v14->_databaseInitializationOperation;
    v14->_databaseInitializationOperation = (DMDEngineDatabaseInitializationOperation *)v20;

    [(DMDEngineDatabaseOperation *)v14->_databaseInitializationOperation setDatabase:v10];
    objc_storeStrong((id *)&v14->_policyPersistence, a4);
    uint64_t v22 = objc_opt_new();
    eventSubscriptionManager = v14->_eventSubscriptionManager;
    v14->_eventSubscriptionManager = (DMDEventSubscriptionManager *)v22;

    objc_initWeak(&location, v14);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10002B750;
    v31[3] = &unk_1000CA7D8;
    objc_copyWeak(&v32, &location);
    [(DMDEventSubscriptionManager *)v14->_eventSubscriptionManager setEventsHandler:v31];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10002BA08;
    v29[3] = &unk_1000CA800;
    objc_copyWeak(&v30, &location);
    uint64_t v24 = +[DMDBlockOperation blockOperationWithBlock:v29];
    initializationOperation = v14->_initializationOperation;
    v14->_initializationOperation = (CATOperation *)v24;

    [(CATOperation *)v14->_initializationOperation addTarget:v14 selector:"initializationOperationDidFinish:" forOperationEvents:6];
    [(CATOperation *)v14->_initializationOperation addDependency:v14->_databaseInitializationOperation];
    [(CATOperationQueue *)v14->_queue addOperation:v14->_databaseInitializationOperation];
    v26 = +[NSOperationQueue mainQueue];
    [v26 addOperation:v14->_initializationOperation];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (NSString)description
{
  v3 = [(DMDConfigurationEngine *)self database];
  v4 = [(DMDConfigurationEngine *)self queue];
  v5 = [v4 operations];
  v8 = [(DMDConfigurationEngine *)self organizationControllerByIdentifier];
  v6 = DMFObjectDescription();

  return (NSString *)v6;
}

- (void)setDeviceStateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_deviceStateProvider, a3);
  id v5 = a3;
  id v6 = [(DMDConfigurationEngine *)self databaseInitializationOperation];
  [v6 setDeviceStateProvider:v5];
}

- (void)resume
{
  if (!+[NSThread isMainThread])
  {
    id v6 = +[NSAssertionHandler currentHandler];
    v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 150, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002BC9C;
  v8[3] = &unk_1000CA508;
  v8[4] = self;
  v4 = +[NSBlockOperation blockOperationWithBlock:v8];
  [v4 setQueuePriority:8];
  [(DMDConfigurationEngine *)self enqueueOperation:v4];
  id v5 = [(DMDConfigurationEngine *)self queue];
  [v5 setSuspended:0];
}

- (void)suspend
{
  if (!+[NSThread isMainThread])
  {
    id v5 = +[NSAssertionHandler currentHandler];
    id v6 = NSStringFromSelector(a2);
    [v5 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 165, @"%@ must be called from the main thread", v6 object file lineNumber description];
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002BE44;
  v7[3] = &unk_1000CA508;
  v7[4] = self;
  v4 = +[DMDBlockOperation blockOperationWithBlock:v7];
  [v4 setQueuePriority:8];
  [(DMDConfigurationEngine *)self enqueueOperation:v4];
}

- (void)handleCreateConfigurationOrganizationRequest:(id)a3 completionHandler:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, void *))a4;
  v7 = [(DMDConfigurationEngine *)self initializationError];
  if (v7)
  {
    v6[2](v6, v7);
  }
  else
  {
    v8 = objc_opt_new();
    v9 = [(DMDConfigurationEngine *)self database];
    [v8 setDatabase:v9];

    [v8 setRequest:v13];
    id v10 = [v13 organizationIdentifier];
    id v11 = [v13 organizationDisplayName];
    id v12 = +[NSString stringWithFormat:@"Create organization %@ “%@” ", v10, v11];
    [v8 setName:v12];

    [v8 setQueuePriority:4];
    [(DMDConfigurationEngine *)self enqueueDatabaseModificationOperation:v8 completionHandler:v6];
  }
}

- (void)handleDeactivateConfigurationOrganizationRequest:(id)a3 completionHandler:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void *))a4;
  v7 = [(DMDConfigurationEngine *)self initializationError];
  if (v7)
  {
    v6[2](v6, v7);
  }
  else
  {
    v8 = objc_opt_new();
    v9 = [(DMDConfigurationEngine *)self database];
    [v8 setDatabase:v9];

    [v8 setRequest:v11];
    id v10 = +[NSString stringWithFormat:@"Deactivate organization for %@", v11];
    [v8 setName:v10];

    [v8 setQueuePriority:4];
    [(DMDConfigurationEngine *)self enqueueDatabaseModificationOperation:v8 completionHandler:v6];
  }
}

- (void)handleFetchConfigurationOrganizationsRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = +[NSOperationQueue mainQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002C204;
  v8[3] = &unk_1000CA828;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 addOperationWithBlock:v8];
}

- (void)handleFetchStreamEvents:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  v8 = [(DMDConfigurationEngine *)self initializationError];
  if (v8)
  {
    v7[2](v7, 0, v8);
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002C530;
    v10[3] = &unk_1000CA878;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    id v9 = +[DMDBlockOperation blockOperationWithBlock:v10];
    [v9 setQueuePriority:4];
    [(DMDConfigurationEngine *)self enqueueOperation:v9];
  }
}

- (void)handleConfigurationSourceRegistrationRequest:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = [(DMDConfigurationEngine *)self initializationError];
  if (v10)
  {
    v9[2](v9, v10);
  }
  else
  {
    id v11 = objc_opt_new();
    [v11 setRequest:v13];
    [v11 setClientIdentifier:v8];
    id v12 = [(DMDConfigurationEngine *)self database];
    [v11 setDatabase:v12];

    [v11 setDelegate:self];
    [v11 setQueuePriority:4];
    [(DMDConfigurationEngine *)self enqueueDatabaseModificationOperation:v11 completionHandler:v9];
  }
}

- (void)handleSetDeclarationsRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(DMDConfigurationEngine *)self initializationError];
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    id v9 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v6 organizationIdentifier];
      int v13 = 138543362;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Engine enqueuing operation to set declarations from %{public}@", (uint8_t *)&v13, 0xCu);
    }
    id v11 = objc_opt_new();
    id v12 = [(DMDConfigurationEngine *)self database];
    [v11 setDatabase:v12];

    [v11 setRequest:v6];
    [v11 setQueuePriority:4];
    [(DMDConfigurationEngine *)self enqueueDatabaseModificationOperation:v11 completionHandler:v7];
  }
}

- (void)handleUpdateDeclarationsRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(DMDConfigurationEngine *)self initializationError];
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    id v9 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v6 organizationIdentifier];
      int v13 = 138543362;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Engine enqueuing operation to update declarations from %{public}@", (uint8_t *)&v13, 0xCu);
    }
    id v11 = objc_opt_new();
    id v12 = [(DMDConfigurationEngine *)self database];
    [v11 setDatabase:v12];

    [v11 setRequest:v6];
    [v11 setQueuePriority:4];
    [(DMDConfigurationEngine *)self enqueueDatabaseModificationOperation:v11 completionHandler:v7];
  }
}

- (void)handleFetchDeclarationsRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [(DMDConfigurationEngine *)self initializationError];
  if (v8)
  {
    v7[2](v7, 0, v8);
  }
  else
  {
    id v9 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v6 organizationIdentifier];
      int v13 = 138543362;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Engine enqueuing operation to fetch declarations for %{public}@", (uint8_t *)&v13, 0xCu);
    }
    id v11 = objc_opt_new();
    id v12 = [(DMDConfigurationEngine *)self database];
    [v11 setDatabase:v12];

    [v11 setRequest:v6];
    [v11 setCompletionHandler:v7];
    [v11 setQueuePriority:4];
    [(DMDConfigurationEngine *)self enqueueOperation:v11];
  }
}

- (void)processDeclarationsForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(DMDConfigurationEngine *)self initializationError];
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_10002CEB8;
    uint64_t v15 = &unk_1000CA878;
    v16 = self;
    id v9 = v6;
    id v17 = v9;
    uint64_t v18 = v7;
    id v10 = +[NSBlockOperation blockOperationWithBlock:&v12];
    id v11 = +[NSString stringWithFormat:@"Process Declarations for %@", v9, v12, v13, v14, v15, v16];
    [v10 setName:v11];

    [v10 setQueuePriority:4];
    [(DMDConfigurationEngine *)self enqueueOperation:v10];
  }
}

- (void)processStatusForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(DMDConfigurationEngine *)self initializationError];
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    id v9 = objc_opt_new();
    id v10 = [(DMDConfigurationEngine *)self database];
    [v9 setDatabase:v10];

    [v9 setOrganizationIdentifier:v6];
    [v9 setQueuePriority:4];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002D378;
    v11[3] = &unk_1000CA250;
    id v12 = v7;
    [(DMDConfigurationEngine *)self enqueueDatabaseModificationOperation:v9 completionHandler:v11];
  }
}

- (void)refreshStatusForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [(DMDConfigurationEngine *)self initializationError];
  if (v8)
  {
    v7[2](v7, 0, v8);
  }
  else
  {
    id v9 = objc_opt_new();
    id v10 = [(DMDConfigurationEngine *)self database];
    [v9 setDatabase:v10];

    [v9 setOrganizationIdentifier:v6];
    [v9 setQueuePriority:4];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002D538;
    v12[3] = &unk_1000CA8C8;
    id v13 = v9;
    v14 = v7;
    id v11 = v9;
    [(DMDConfigurationEngine *)self enqueueDatabaseModificationOperation:v11 completionHandler:v12];
  }
}

- (void)handleUpdateCommandsRequest:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [(DMDConfigurationEngine *)self initializationError];
  if (v7)
  {
    v6[2](v6, v7);
  }
  else
  {
    id v8 = objc_opt_new();
    id v9 = [(DMDConfigurationEngine *)self database];
    [v8 setDatabase:v9];

    [v8 setRequest:v10];
    [v8 setQueuePriority:4];
    [(DMDConfigurationEngine *)self enqueueDatabaseModificationOperation:v8 completionHandler:v6];
  }
}

- (void)handleInstallSubscriptionRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DMDConfigurationEngine *)self database];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002D790;
  v11[3] = &unk_1000CA8F0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 performBackgroundTask:v11];
}

- (void)handleRemoveSubscriptionRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DMDConfigurationEngine *)self database];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002DB5C;
  v11[3] = &unk_1000CA918;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBackgroundTask:v11];
}

- (void)sendEvents:(id)a3 organizationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *))a5;
  if (!v10)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 487, @"Invalid parameter not satisfying: %@", @"organizationIdentifier" object file lineNumber description];
  }
  id v12 = [(DMDConfigurationEngine *)self initializationError];
  if (v12)
  {
    v11[2](v11, v12);
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002DF80;
    v17[3] = &unk_1000CA940;
    v17[4] = self;
    id v13 = v10;
    id v18 = v13;
    uint64_t v20 = v11;
    id v19 = v9;
    id v14 = +[DMDBlockOperation blockOperationWithBlock:v17];
    uint64_t v15 = +[NSString stringWithFormat:@"Send Events for %@", v13];
    [v14 setName:v15];

    [v14 setQueuePriority:4];
    [(DMDConfigurationEngine *)self enqueueOperation:v14];
  }
}

- (void)initializationOperationDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(DMDConfigurationEngine *)self initializationOperation];

  if (v5 == v4)
  {
    [(DMDConfigurationEngine *)self setInitializationOperation:0];
  }
}

- (void)databaseInitializationOperationDidFinish
{
  v3 = [(DMDConfigurationEngine *)self databaseInitializationOperation];
  id v4 = [v3 error];

  [(DMDConfigurationEngine *)self setDatabaseInitializationOperation:0];
  if (v4)
  {
    id v5 = [v4 userInfo];
    id v6 = [v5 mutableCopy];

    [v6 removeObjectForKey:DMFErrorFailedConfigurationDatabaseStoreKey];
    [v6 removeObjectForKey:NSUnderlyingErrorKey];
    id v7 = [v4 domain];
    id v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v7, [v4 code], v6);
    [(DMDConfigurationEngine *)self setInitializationError:v8];

    id v9 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100080F54(v4);
    }

    id v10 = [(DMDConfigurationEngine *)self queue];
    [v10 cancelAllOperations];

    id v11 = [(DMDConfigurationEngine *)self queue];
    [v11 setSuspended:1];

    [(DMDConfigurationEngine *)self delegateWillSuspend];
  }
  else
  {
    [(DMDConfigurationEngine *)self updateOrganizationControllers];
    [(DMDConfigurationEngine *)self updateEventSubscriptions];
    [(DMDConfigurationEngine *)self _cleanupOrphanedPolicies];
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"_updateOrganizationControllers" name:@"DMDConfigurationOrganizationsDidChangeNotification" object:0];
  }
}

- (void)enqueueDatabaseModificationOperation:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v6 = objc_retainBlock(a4);
  [v7 addTarget:self selector:"declarationModificationOperationDidFinish:completionHandler:" forOperationEvents:6 userInfo:v6];

  [(DMDConfigurationEngine *)self enqueueOperation:v7];
}

- (void)declarationModificationOperationDidFinish:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v7 = a4;
    id v8 = [a3 error];
    (*((void (**)(id, void *))a4 + 2))(v7, v8);
  }

  [(DMDConfigurationEngine *)self enqueueDeclarationProcessingOperationIfNeeded];
}

- (void)enqueueDeclarationProcessingOperationIfNeeded
{
  id v4 = [(DMDConfigurationEngine *)self queue];

  if (!v4)
  {
    id v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"DMDConfigurationEngine.m" lineNumber:582 description:@"Cannot enqueue an operation if we failed to initialize the database."];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [(DMDConfigurationEngine *)self queue];
  id v6 = [v5 operations];

  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v27;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(v6);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v7) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    id v10 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Engine enqueuing operation to process pending declarations in database", (uint8_t *)buf, 2u);
    }

    id v11 = objc_opt_new();
    [v11 setQueuePriority:0];
    id v12 = [(DMDConfigurationEngine *)self database];
    [v11 setDatabase:v12];

    [v11 setDelegate:self];
    id v13 = [(DMDConfigurationEngine *)self deviceStateProvider];
    [v11 setDeviceStateProvider:v13];

    id v14 = [(DMDConfigurationEngine *)self taskOperationProvider];
    [v11 setTaskOperationProvider:v14];

    uint64_t v15 = [(DMDConfigurationEngine *)self activationPredicateObserverManager];
    [v11 setActivationPredicateObserverManager:v15];

    objc_initWeak(buf, self);
    id v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_10002EA20;
    uint64_t v22 = &unk_1000CA968;
    id v6 = v11;
    id v23 = v6;
    objc_copyWeak(&v24, buf);
    v16 = +[DMDBlockOperation blockOperationWithBlock:&v19];
    [v6 setQueuePriority:0, v19, v20, v21, v22];
    [v16 addDependency:v6];
    v30[0] = v6;
    v30[1] = v16;
    id v17 = +[NSArray arrayWithObjects:v30 count:2];
    [(DMDConfigurationEngine *)self enqueueOperations:v17];

    objc_destroyWeak(&v24);
    objc_destroyWeak(buf);
  }
}

- (void)enqueueOperation:(id)a3
{
  id v5 = a3;
  id v6 = [(DMDConfigurationEngine *)self queue];

  if (!v6)
  {
    uint64_t v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"DMDConfigurationEngine.m" lineNumber:617 description:@"Cannot enqueue an operation if we failed to initialize the database."];

    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 618, @"Invalid parameter not satisfying: %@", @"operation" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = v5;
  id v7 = +[NSArray arrayWithObjects:&v10 count:1];
  [(DMDConfigurationEngine *)self enqueueOperations:v7];
}

- (void)enqueueOperations:(id)a3
{
  id v5 = a3;
  id v6 = [(DMDConfigurationEngine *)self queue];

  if (!v6)
  {
    uint64_t v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"DMDConfigurationEngine.m" lineNumber:623 description:@"Cannot enqueue an operation if we failed to initialize the database."];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v11);
        id v13 = [(DMDConfigurationEngine *)self initializationOperation];
        if (v13) {
          [v12 addDependency:v13];
        }

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v14 = [(DMDConfigurationEngine *)self queue];
  [v14 addOperations:v7 waitUntilFinished:0];
}

- (void)_updateOrganizationControllers
{
}

- (void)updateOrganizationControllers
{
  if (!+[NSThread isMainThread])
  {
    v25 = +[NSAssertionHandler currentHandler];
    long long v26 = NSStringFromSelector(a2);
    [v25 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 638, @"%@ must be called from the main thread", v26 object file lineNumber description];
  }
  long long v28 = +[DMDConfigurationOrganization fetchRequest];
  id v4 = [(DMDConfigurationEngine *)self database];
  id v5 = [v4 viewContext];
  id v38 = 0;
  id v6 = [v5 executeFetchRequest:v28 error:&v38];
  id v27 = v38;

  if (!v6)
  {
    id v7 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10008105C(v27);
    }
  }
  id obj = [(DMDConfigurationEngine *)self organizationControllerByIdentifier];
  objc_sync_enter(obj);
  id v8 = [(DMDConfigurationEngine *)self organizationControllerByIdentifier];
  id v9 = [v8 allKeys];
  id v10 = [v9 mutableCopy];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v35;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = [[DMDConfigurationOrganizationController alloc] initWithOrganization:*(void *)(*((void *)&v34 + 1) + 8 * (void)v14) delegate:self];
        long long v16 = [(DMDConfigurationEngine *)self organizationControllerByIdentifier];
        long long v17 = [(DMDConfigurationOrganizationController *)v15 identifier];
        [v16 setObject:v15 forKeyedSubscript:v17];

        long long v18 = [(DMDConfigurationOrganizationController *)v15 identifier];
        [v10 removeObject:v18];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v12);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v19 = v10;
  id v20 = [v19 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v31;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v22);
        id v24 = [(DMDConfigurationEngine *)self organizationControllerByIdentifier];
        [v24 removeObjectForKey:v23];

        uint64_t v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v19 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v20);
  }

  objc_sync_exit(obj);
}

- (void)updateEventSubscriptions
{
  if (!+[NSThread isMainThread])
  {
    id v14 = +[NSAssertionHandler currentHandler];
    uint64_t v15 = NSStringFromSelector(a2);
    [v14 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 665, @"%@ must be called from the main thread", v15 object file lineNumber description];
  }
  id v4 = +[DMDEventSubscriptionRegistration fetchRequest];
  [v4 setRelationshipKeyPathsForPrefetching:&off_1000D2BA0];
  id v5 = [(DMDConfigurationEngine *)self database];
  id v6 = [v5 viewContext];
  id v17 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v17];
  id v8 = v17;

  if (!v7)
  {
    id v9 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100081168(v8);
    }
  }
  id v10 = [(DMDConfigurationEngine *)self eventSubscriptionManager];
  id v16 = v8;
  unsigned __int8 v11 = [v10 setEventSubscriptionRegistrations:v7 error:&v16];
  id v12 = v16;

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000810E4(v12);
    }
  }
}

- (void)_cleanupOrphanedPolicies
{
  v3 = (void *)os_transaction_create();
  id v4 = (void *)os_transaction_create();
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = sub_10002D01C;
  id v27 = sub_10002D02C;
  id v28 = 0;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10002D01C;
  uint64_t v21 = sub_10002D02C;
  id v22 = (id)objc_opt_new();
  id v5 = [(DMDConfigurationEngine *)self database];
  id v6 = [v5 viewContext];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002F59C;
  v16[3] = &unk_1000CA990;
  v16[4] = &v23;
  v16[5] = &v17;
  [v6 performBlockAndWait:v16];

  id v7 = [(DMDConfigurationEngine *)self policyPersistence];
  uint64_t v8 = v24[5];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002F964;
  v14[3] = &unk_1000CA9B8;
  id v9 = v3;
  id v15 = v9;
  [v7 removeOrphanedPoliciesNotBelongingToExistingOrganizationIdentifiers:v8 completionHandler:v14];
  uint64_t v10 = v18[5];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002F9C0;
  v12[3] = &unk_1000CA9B8;
  id v11 = v4;
  id v13 = v11;
  [v7 removeOrphanedPoliciesNotBelongingToExistingDeclarationIdentifiersByOrganizationIdentifier:v10 completionHandler:v12];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

- (void)activationPredicateObserverManager:(id)a3 didObserveChangeForPredicateWithIdentifier:(id)a4
{
  id v5 = [(DMDConfigurationEngine *)self initializationError];
  if (!v5)
  {
    [(DMDConfigurationEngine *)self enqueueDeclarationProcessingOperationIfNeeded];
    id v5 = 0;
  }
}

- (void)configurationSourceController:(id)a3 fetchStatusUpdatesWithCompletionHandler:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void, void *, Block_layout *))a4;
  if (!v8)
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 757, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v9 = [(DMDConfigurationEngine *)self initializationError];
  if (v9)
  {
    v8[2](v8, 0, v9, &stru_1000CA9F8);
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002FBF4;
    v12[3] = &unk_1000CA878;
    id v13 = v7;
    id v14 = self;
    id v15 = v8;
    uint64_t v10 = +[DMDBlockOperation blockOperationWithBlock:v12];
    [v10 setQueuePriority:8];
    [(DMDConfigurationEngine *)self enqueueDatabaseModificationOperation:v10 completionHandler:&stru_1000CAAB0];
  }
}

- (void)configurationSourceController:(id)a3 fetchEventsWithCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 854, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v9 = [(DMDConfigurationEngine *)self database];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100030894;
  v13[3] = &unk_1000CA8F0;
  id v15 = self;
  id v16 = v8;
  id v14 = v7;
  id v10 = v8;
  id v11 = v7;
  [v9 performBackgroundTask:v13];
}

- (id)engineProcessingOperation:(id)a3 enqueuedOperationsForOrganizationWithIdentifier:(id)a4
{
  id v4 = [(DMDConfigurationEngine *)self queue];
  id v5 = [v4 operations];

  return v5;
}

- (id)engineProcessingOperation:(id)a3 assetResolverForOrganizationWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DMDConfigurationEngine *)self organizationControllerByIdentifier];
  objc_sync_enter(v8);
  id v9 = [(DMDConfigurationEngine *)self organizationControllerByIdentifier];
  id v10 = [v9 objectForKeyedSubscript:v7];

  objc_sync_exit(v8);

  return v10;
}

- (void)registerConfigurationSourceOperation:(id)a3 didUpdateRegistrationForConfigurationSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!+[NSThread isMainThread])
  {
    long long v31 = +[NSAssertionHandler currentHandler];
    long long v32 = NSStringFromSelector(a2);
    [v31 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 917, @"%@ must be called from the main thread", v32 object file lineNumber description];
  }
  id v9 = [(DMDConfigurationEngine *)self organizationControllerByIdentifier];
  objc_sync_enter(v9);
  id v10 = [(DMDConfigurationEngine *)self organizationControllerByIdentifier];
  id v11 = [v8 organizationIdentifier];
  id v12 = [v10 objectForKeyedSubscript:v11];

  if (!v12)
  {
    id v13 = [v8 organizationIdentifier];
    id v14 = +[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:v13];

    id v15 = [(DMDConfigurationEngine *)self database];
    id v16 = [v15 viewContext];
    id v33 = 0;
    uint64_t v17 = [v16 executeFetchRequest:v14 error:&v33];
    id v18 = v33;
    uint64_t v19 = [v17 firstObject];

    id v20 = [(DMDConfigurationEngine *)self database];
    uint64_t v21 = [v20 viewContext];
    [v21 refreshObject:v19 mergeChanges:0];

    id v12 = [[DMDConfigurationOrganizationController alloc] initWithOrganization:v19 delegate:self];
    id v22 = [(DMDConfigurationEngine *)self organizationControllerByIdentifier];
    uint64_t v23 = [(DMDConfigurationOrganizationController *)v12 identifier];
    [v22 setObject:v12 forKeyedSubscript:v23];
  }
  id v24 = [v8 identifier];
  uint64_t v25 = [(DMDConfigurationOrganizationController *)v12 configurationSourceWithIdentifier:v24];

  if (v25)
  {
    long long v26 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = [v8 identifier];
      *(_DWORD *)buf = 138543362;
      long long v35 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Re-registering configuration source %{public}@", buf, 0xCu);
    }
    [v25 updateWithConfigurationSource:v8];
  }
  else
  {
    id v28 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      long long v29 = [v8 identifier];
      *(_DWORD *)buf = 138543362;
      long long v35 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Registering new configuration source %{public}@", buf, 0xCu);
    }
    id v30 = [(DMDConfigurationOrganizationController *)v12 registerConfigurationSource:v8];
  }

  objc_sync_exit(v9);
}

- (void)delegateDidResume
{
  id v3 = [(DMDConfigurationEngine *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 configurationEngineDidResume:self];
  }
}

- (void)delegateWillSuspend
{
  id v3 = [(DMDConfigurationEngine *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 configurationEngineWillSuspend:self];
  }
}

- (DMDPolicyPersistence)policyPersistence
{
  return (DMDPolicyPersistence *)objc_getProperty(self, a2, 8, 1);
}

- (DMDConfigurationEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DMDConfigurationEngineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DMDDeviceStateProvider)deviceStateProvider
{
  return self->_deviceStateProvider;
}

- (DMDTaskOperationProvider)taskOperationProvider
{
  return self->_taskOperationProvider;
}

- (void)setTaskOperationProvider:(id)a3
{
}

- (DMDActivationPredicateObserverManager)activationPredicateObserverManager
{
  return self->_activationPredicateObserverManager;
}

- (void)setActivationPredicateObserverManager:(id)a3
{
}

- (DMDConfigurationDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (CATOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSError)initializationError
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInitializationError:(id)a3
{
}

- (DMDEngineDatabaseInitializationOperation)databaseInitializationOperation
{
  return self->_databaseInitializationOperation;
}

- (void)setDatabaseInitializationOperation:(id)a3
{
}

- (CATOperation)initializationOperation
{
  return self->_initializationOperation;
}

- (void)setInitializationOperation:(id)a3
{
}

- (NSMutableDictionary)organizationControllerByIdentifier
{
  return self->_organizationControllerByIdentifier;
}

- (void)setOrganizationControllerByIdentifier:(id)a3
{
}

- (DMDEventSubscriptionManager)eventSubscriptionManager
{
  return self->_eventSubscriptionManager;
}

- (void)setEventSubscriptionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_organizationControllerByIdentifier, 0);
  objc_storeStrong((id *)&self->_initializationOperation, 0);
  objc_storeStrong((id *)&self->_databaseInitializationOperation, 0);
  objc_storeStrong((id *)&self->_initializationError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_activationPredicateObserverManager, 0);
  objc_storeStrong((id *)&self->_taskOperationProvider, 0);
  objc_storeStrong((id *)&self->_deviceStateProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_policyPersistence, 0);
}

@end