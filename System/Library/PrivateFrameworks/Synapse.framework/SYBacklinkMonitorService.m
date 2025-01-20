@interface SYBacklinkMonitorService
- (BOOL)_forTesting;
- (BOOL)hasKeepAliveTransaction;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)_handles;
- (NSMutableOrderedSet)_pendingOperations;
- (NSXPCListener)_listener;
- (OS_dispatch_queue)_serviceQueue;
- (OS_os_transaction)_keepAliveTransaction;
- (SYBacklinkMonitorOperation)_activeOperation;
- (SYBacklinkMonitorOperation)_longerLivedOperation;
- (SYBacklinkMonitorService)init;
- (SYBacklinkMonitorServiceTestingDelegate)testingDelegate;
- (SYNotesActivationObserver)_notesObserver;
- (id)_listenerEndpoint;
- (id)initForTesting:(BOOL)a3;
- (void)_createAndScheduleOperationForHandle:(id)a3 withUserActivity:(id)a4 context:(id)a5;
- (void)_evaluateAndBeginPendingOperations;
- (void)_notesActivationDidChange:(BOOL)a3;
- (void)_updateKeepAliveTransaction;
- (void)backlinkMonitorOperation:(id)a3 shouldUpdateFilterCache:(id)a4;
- (void)backlinkMonitorOperationDidFinish:(id)a3;
- (void)beginListeningToConnections;
- (void)dealloc;
- (void)handleDidDisconnect:(id)a3;
- (void)scheduleOperationForHandle:(id)a3 withUserActivity:(id)a4 context:(id)a5;
- (void)setTestingDelegate:(id)a3;
- (void)set_activeOperation:(id)a3;
- (void)set_handles:(id)a3;
- (void)set_keepAliveTransaction:(id)a3;
- (void)set_listener:(id)a3;
- (void)set_longerLivedOperation:(id)a3;
- (void)set_notesObserver:(id)a3;
- (void)set_pendingOperations:(id)a3;
- (void)set_serviceQueue:(id)a3;
@end

@implementation SYBacklinkMonitorService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SYBacklinkMonitorService.m", 228, @"Invalid parameter not satisfying: %@", @"newConnection" object file lineNumber description];
  }
  id v9 = [(SYBacklinkMonitorService *)self _listener];

  if (v9 == v7)
  {
    v10 = [(SYBacklinkMonitorService *)self _serviceQueue];
    v11 = +[SYBacklinkMonitorServiceHandle handleWithConnection:v8 queue:v10];

    [v11 setDelegate:self];
    handles = self->__handles;
    v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v11, "processIdentifier"));
    [(NSMutableDictionary *)handles setObject:v11 forKey:v13];

    [v8 resume];
  }
  v14 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = [v8 processIdentifier];
    v16 = @"No";
    if (v9 == v7) {
      v16 = @"Yes";
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v20 = v15;
    __int16 v21 = 2112;
    v22 = v16;
    _os_log_impl(&dword_1C2C5F000, v14, OS_LOG_TYPE_INFO, "BacklinkService: Listener should accept connection from pid %ld: %@", buf, 0x16u);
  }

  return v9 == v7;
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (NSXPCListener)_listener
{
  return self->__listener;
}

void __43__SYBacklinkMonitorService_initForTesting___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notesActivationDidChange:a2];
}

- (void)_notesActivationDidChange:(BOOL)a3
{
  if (a3)
  {
    [(NSMutableOrderedSet *)self->__pendingOperations removeAllObjects];
    handles = self->__handles;
    [(NSMutableDictionary *)handles enumerateKeysAndObjectsUsingBlock:&__block_literal_global_4];
  }
}

- (SYBacklinkMonitorService)init
{
  return (SYBacklinkMonitorService *)[(SYBacklinkMonitorService *)self initForTesting:0];
}

- (id)initForTesting:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)SYBacklinkMonitorService;
  v4 = [(SYBacklinkMonitorService *)&v19 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.synapse.UserActivityService", v5);
    serviceQueue = v4->__serviceQueue;
    v4->__serviceQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    handles = v4->__handles;
    v4->__handles = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:3];
    pendingOperations = v4->__pendingOperations;
    v4->__pendingOperations = (NSMutableOrderedSet *)v10;

    objc_initWeak(&location, v4);
    v12 = [SYNotesActivationObserver alloc];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __43__SYBacklinkMonitorService_initForTesting___block_invoke;
    v16[3] = &unk_1E6463C78;
    objc_copyWeak(&v17, &location);
    uint64_t v13 = [(SYNotesActivationObserver *)v12 initWithHandler:v16];
    notesObserver = v4->__notesObserver;
    v4->__notesObserver = (SYNotesActivationObserver *)v13;

    v4->__forTesting = a3;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(SYBacklinkMonitorService *)self _listener];
  [v3 setDelegate:0];

  v4 = [(SYBacklinkMonitorService *)self _listener];
  [v4 invalidate];

  [(SYBacklinkMonitorService *)self set_listener:0];
  v5.receiver = self;
  v5.super_class = (Class)SYBacklinkMonitorService;
  [(SYBacklinkMonitorService *)&v5 dealloc];
}

- (void)beginListeningToConnections
{
  v3 = [(SYBacklinkMonitorService *)self _listener];

  if (!v3)
  {
    BOOL v4 = [(SYBacklinkMonitorService *)self _forTesting];
    objc_super v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "BacklinkService: Starting Backlink Monitor Service with anonymous listener for testing", buf, 2u);
      }

      uint64_t v7 = [MEMORY[0x1E4F29290] anonymousListener];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "BacklinkService: Starting Backlink Monitor Service", v13, 2u);
      }

      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.synapse.backlink-service"];
    }
    uint64_t v8 = (void *)v7;
    [(SYBacklinkMonitorService *)self set_listener:v7];

    id v9 = [(SYBacklinkMonitorService *)self _listener];
    uint64_t v10 = [(SYBacklinkMonitorService *)self _serviceQueue];
    [v9 _setQueue:v10];

    v11 = [(SYBacklinkMonitorService *)self _listener];
    [v11 setDelegate:self];

    v12 = [(SYBacklinkMonitorService *)self _listener];
    [v12 resume];
  }
}

uint64_t __54__SYBacklinkMonitorService__notesActivationDidChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setFilterCache:0];
}

- (void)_createAndScheduleOperationForHandle:(id)a3 withUserActivity:(id)a4 context:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SYBacklinkMonitorService *)self _pendingOperations];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = [(SYBacklinkMonitorService *)self _pendingOperations];
      int v15 = [v14 firstObject];
      int v25 = 134218240;
      v26 = v15;
      __int16 v27 = 2048;
      id v28 = v9;
      _os_log_impl(&dword_1C2C5F000, v13, OS_LOG_TYPE_INFO, "BacklinkService: cancelling pending operation %p for user activity info %p.", (uint8_t *)&v25, 0x16u);
    }
    v16 = [(SYBacklinkMonitorService *)self _pendingOperations];
    [v16 removeAllObjects];
  }
  id v17 = [(SYBacklinkMonitorService *)self _pendingOperations];
  v18 = [SYBacklinkMonitorOperation alloc];
  objc_super v19 = [(SYBacklinkMonitorService *)self _serviceQueue];
  uint64_t v20 = -[SYBacklinkMonitorOperation initWithDelegate:processingQueue:inputUserActivityInfo:processIdentifier:](v18, "initWithDelegate:processingQueue:inputUserActivityInfo:processIdentifier:", self, v19, v9, [v8 processIdentifier]);
  [v17 addObject:v20];

  LODWORD(v17) = [v10 needsCacheUpdate];
  if (v17 && ![(SYBacklinkMonitorService *)self _forTesting])
  {
    __int16 v21 = [(SYBacklinkMonitorService *)self _pendingOperations];
    v22 = [SYBacklinkMonitorFilterCacheOperation alloc];
    uint64_t v23 = [(SYBacklinkMonitorService *)self _serviceQueue];
    v24 = -[SYBacklinkMonitorOperation initWithDelegate:processingQueue:inputUserActivityInfo:processIdentifier:](v22, "initWithDelegate:processingQueue:inputUserActivityInfo:processIdentifier:", self, v23, v9, [v8 processIdentifier]);
    [v21 addObject:v24];
  }
  [(SYBacklinkMonitorService *)self _updateKeepAliveTransaction];
  [(SYBacklinkMonitorService *)self _evaluateAndBeginPendingOperations];
}

- (void)_evaluateAndBeginPendingOperations
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(SYBacklinkMonitorService *)self _pendingOperations];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    BOOL v6 = [(SYBacklinkMonitorService *)self _pendingOperations];
    uint64_t v7 = [v6 firstObject];

    if (!v7)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"SYBacklinkMonitorService.m" lineNumber:139 description:@"No pending operation to make active"];
    }
    [(SYBacklinkMonitorService *)self set_activeOperation:v7];
    id v8 = [(SYBacklinkMonitorService *)self _pendingOperations];
    [v8 removeObjectAtIndex:0];

    [(SYBacklinkMonitorService *)self _updateKeepAliveTransaction];
    id v9 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v7 inputUserActivityInfo];
      int v13 = 134218240;
      v14 = v7;
      __int16 v15 = 2048;
      v16 = v10;
      _os_log_impl(&dword_1C2C5F000, v9, OS_LOG_TYPE_DEFAULT, "BacklinkService: will begin operation %p for activity info %p.", (uint8_t *)&v13, 0x16u);
    }
    v11 = [(SYBacklinkMonitorService *)self testingDelegate];
    [v11 backlinkMonitorService:self willBeginOperation:v7];

    [v7 beginProcessing];
  }
}

- (void)_updateKeepAliveTransaction
{
  v3 = [(SYBacklinkMonitorService *)self _pendingOperations];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(SYBacklinkMonitorService *)self _activeOperation];
    BOOL v4 = v5 != 0;
  }
  BOOL v6 = [(SYBacklinkMonitorService *)self _keepAliveTransaction];

  if (!v4 || v6)
  {
    if (v6) {
      char v7 = v4;
    }
    else {
      char v7 = 1;
    }
    if ((v7 & 1) == 0)
    {
      [(SYBacklinkMonitorService *)self set_keepAliveTransaction:0];
    }
  }
  else
  {
    id v8 = (id)os_transaction_create();
    [(SYBacklinkMonitorService *)self set_keepAliveTransaction:v8];
  }
}

- (void)backlinkMonitorOperationDidFinish:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SYBacklinkMonitorService *)self _activeOperation];

  if (v5 == v4)
  {
    BOOL v6 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      char v7 = [v4 inputUserActivityInfo];
      int v11 = 134218240;
      id v12 = v4;
      __int16 v13 = 2048;
      v14 = v7;
      _os_log_impl(&dword_1C2C5F000, v6, OS_LOG_TYPE_DEFAULT, "BacklinkService: operation finished %p for activity info %p.", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v8 = [v4 type];
    id v9 = v4;
    if (v8 != 1)
    {
      if (objc_msgSend(v4, "type", v4) != 2)
      {
LABEL_8:
        [(SYBacklinkMonitorService *)self set_activeOperation:0];
        [(SYBacklinkMonitorService *)self _updateKeepAliveTransaction];
        id v10 = [(SYBacklinkMonitorService *)self testingDelegate];
        [v10 backlinkMonitorService:self didFinishOperation:v4];

        [(SYBacklinkMonitorService *)self _evaluateAndBeginPendingOperations];
        goto LABEL_9;
      }
      id v9 = 0;
    }
    [(SYBacklinkMonitorService *)self set_longerLivedOperation:v9];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)backlinkMonitorOperation:(id)a3 shouldUpdateFilterCache:(id)a4
{
  handles = self->__handles;
  BOOL v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(a3, "processIdentifier"));
  id v9 = [(NSMutableDictionary *)handles objectForKey:v8];

  [v9 setFilterCache:v7];
}

- (void)scheduleOperationForHandle:(id)a3 withUserActivity:(id)a4 context:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  int v11 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 134217984;
    id v14 = v8;
    _os_log_impl(&dword_1C2C5F000, v11, OS_LOG_TYPE_INFO, "BacklinkService: Received request to process activity change. Activity info: %p.", (uint8_t *)&v13, 0xCu);
  }

  [(SYBacklinkMonitorService *)self _createAndScheduleOperationForHandle:v10 withUserActivity:v8 context:v9];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SYRemoteCurrentActivityDidChange", 0, 0, 1u);
}

- (void)handleDidDisconnect:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    id v9 = v4;
    _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_INFO, "BacklinkService: Received handle disconnect: %p.", (uint8_t *)&v8, 0xCu);
  }

  BOOL v6 = [(SYBacklinkMonitorService *)self _handles];
  id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
  [v6 removeObjectForKey:v7];
}

- (id)_listenerEndpoint
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2;
  int v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  v3 = [(SYBacklinkMonitorService *)self _serviceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__SYBacklinkMonitorService__listenerEndpoint__block_invoke;
  v6[3] = &unk_1E6463A88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __45__SYBacklinkMonitorService__listenerEndpoint__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _listener];
  uint64_t v2 = [v5 endpoint];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasKeepAliveTransaction
{
  uint64_t v2 = [(SYBacklinkMonitorService *)self _keepAliveTransaction];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)set_serviceQueue:(id)a3
{
}

- (void)set_listener:(id)a3
{
}

- (OS_os_transaction)_keepAliveTransaction
{
  return self->__keepAliveTransaction;
}

- (void)set_keepAliveTransaction:(id)a3
{
}

- (SYNotesActivationObserver)_notesObserver
{
  return self->__notesObserver;
}

- (void)set_notesObserver:(id)a3
{
}

- (NSMutableDictionary)_handles
{
  return self->__handles;
}

- (void)set_handles:(id)a3
{
}

- (SYBacklinkMonitorOperation)_activeOperation
{
  return self->__activeOperation;
}

- (void)set_activeOperation:(id)a3
{
}

- (SYBacklinkMonitorOperation)_longerLivedOperation
{
  return self->__longerLivedOperation;
}

- (void)set_longerLivedOperation:(id)a3
{
}

- (NSMutableOrderedSet)_pendingOperations
{
  return self->__pendingOperations;
}

- (void)set_pendingOperations:(id)a3
{
}

- (BOOL)_forTesting
{
  return self->__forTesting;
}

- (SYBacklinkMonitorServiceTestingDelegate)testingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);
  return (SYBacklinkMonitorServiceTestingDelegate *)WeakRetained;
}

- (void)setTestingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->__pendingOperations, 0);
  objc_storeStrong((id *)&self->__longerLivedOperation, 0);
  objc_storeStrong((id *)&self->__activeOperation, 0);
  objc_storeStrong((id *)&self->__handles, 0);
  objc_storeStrong((id *)&self->__notesObserver, 0);
  objc_storeStrong((id *)&self->__keepAliveTransaction, 0);
  objc_storeStrong((id *)&self->__listener, 0);
  objc_storeStrong((id *)&self->__serviceQueue, 0);
}

@end