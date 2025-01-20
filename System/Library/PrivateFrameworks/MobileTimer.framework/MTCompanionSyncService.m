@interface MTCompanionSyncService
+ (BOOL)shouldRetryForError:(id)a3;
- (BOOL)resume:(id *)a3;
- (BOOL)service:(id)a3 startReceivingSession:(id)a4 error:(id *)a5;
- (BOOL)service:(id)a3 startSendingSession:(id)a4 error:(id *)a5;
- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5;
- (MTCompanionSyncService)initWithSyncStatusProvider:(id)a3;
- (MTCompanionSyncSession)receivingSession;
- (MTCompanionSyncSession)sendingSession;
- (MTExponentialBackOffTimer)retryTimer;
- (MTSyncServiceDelegate)delegate;
- (MTSyncStatusProvider)syncStatusProvider;
- (NAScheduler)serializer;
- (NSMutableDictionary)pendingRequests;
- (NSString)description;
- (OS_dispatch_queue)serialQueue;
- (SYService)service;
- (id)requestSync:(unint64_t)a3;
- (id)service:(id)a3 willPreferSession:(id)a4 overSession:(id)a5;
- (void)_requestSync:(unint64_t)a3;
- (void)_retryRequest;
- (void)service:(id)a3 receivingSessionEnded:(id)a4 error:(id)a5;
- (void)service:(id)a3 sendingSessionEnded:(id)a4 error:(id)a5;
- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setPendingRequests:(id)a3;
- (void)setReceivingSession:(id)a3;
- (void)setRetryTimer:(id)a3;
- (void)setSendingSession:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setService:(id)a3;
- (void)setSyncStatusProvider:(id)a3;
- (void)suspend;
- (void)syncStatusProvider:(id)a3 didChangeSyncStatus:(unint64_t)a4;
@end

@implementation MTCompanionSyncService

- (MTCompanionSyncService)initWithSyncStatusProvider:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MTCompanionSyncService;
  v6 = [(MTCompanionSyncService *)&v33 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)+[MTScheduler defaultPriority], -1);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MTCompanionSyncService.serialqueue", v7);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F7A0F0] schedulerWithDispatchQueue:v6->_serialQueue];
    serializer = v6->_serializer;
    v6->_serializer = (NAScheduler *)v10;

    objc_storeStrong((id *)&v6->_syncStatusProvider, a3);
    id location = 0;
    p_id location = &location;
    uint64_t v36 = 0x2050000000;
    id v12 = (id)getSYServiceClass_softClass;
    uint64_t v37 = getSYServiceClass_softClass;
    if (!getSYServiceClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v42 = __getSYServiceClass_block_invoke;
      v43 = &unk_1E5914EC0;
      v44 = &location;
      __getSYServiceClass_block_invoke((uint64_t)&buf);
      id v12 = p_location[3];
    }
    v13 = (objc_class *)v12;
    _Block_object_dispose(&location, 8);
    id v14 = [v13 alloc];
    id location = 0;
    p_id location = &location;
    uint64_t v36 = 0x2020000000;
    v15 = (id *)getSYServiceOptionDiskBufferProtectionClassSymbolLoc_ptr;
    uint64_t v37 = getSYServiceOptionDiskBufferProtectionClassSymbolLoc_ptr;
    if (!getSYServiceOptionDiskBufferProtectionClassSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v42 = __getSYServiceOptionDiskBufferProtectionClassSymbolLoc_block_invoke;
      v43 = &unk_1E5914EC0;
      v44 = &location;
      v16 = (void *)CompanionSyncLibrary();
      v17 = dlsym(v16, "SYServiceOptionDiskBufferProtectionClass");
      *((void *)v44[1] + 3) = v17;
      getSYServiceOptionDiskBufferProtectionClassSymbolLoc_ptr = *((void *)v44[1] + 3);
      v15 = (id *)p_location[3];
    }
    _Block_object_dispose(&location, 8);
    if (!v15) {
      -[MTCompanionSyncService initWithSyncStatusProvider:]();
    }
    id v18 = *v15;
    id v38 = v18;
    v40[0] = &unk_1EEE11E68;
    id location = 0;
    p_id location = &location;
    uint64_t v36 = 0x2020000000;
    v19 = (id *)getIDSSendMessageOptionBypassDuetKeySymbolLoc_ptr;
    uint64_t v37 = getIDSSendMessageOptionBypassDuetKeySymbolLoc_ptr;
    if (!getIDSSendMessageOptionBypassDuetKeySymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v42 = __getIDSSendMessageOptionBypassDuetKeySymbolLoc_block_invoke;
      v43 = &unk_1E5914EC0;
      v44 = &location;
      __getIDSSendMessageOptionBypassDuetKeySymbolLoc_block_invoke((uint64_t)&buf);
      v19 = (id *)p_location[3];
    }
    _Block_object_dispose(&location, 8);
    if (!v19) {
      -[MTCompanionSyncService initWithSyncStatusProvider:]();
    }
    id v39 = *v19;
    v40[1] = MEMORY[0x1E4F1CC38];
    v20 = (void *)MEMORY[0x1E4F1C9E8];
    id v21 = v39;
    v22 = [v20 dictionaryWithObjects:v40 forKeys:&v38 count:2];
    uint64_t v23 = [v14 initWithService:@"com.apple.private.alloy.mobiletimersync" priority:0 asMasterStore:1 options:v22];
    service = v6->_service;
    v6->_service = (SYService *)v23;

    [(SYService *)v6->_service setDelegate:v6 queue:v6->_serialQueue];
    uint64_t v25 = objc_opt_new();
    pendingRequests = v6->_pendingRequests;
    v6->_pendingRequests = (NSMutableDictionary *)v25;

    objc_initWeak(&location, v6);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __53__MTCompanionSyncService_initWithSyncStatusProvider___block_invoke;
    v31[3] = &unk_1E5915428;
    objc_copyWeak(&v32, &location);
    uint64_t v27 = +[MTExponentialBackOffTimer timerWithInitialTime:2 backoffFactor:v31 fireBlock:v6->_serialQueue queue:2.0];
    retryTimer = v6->_retryTimer;
    v6->_retryTimer = (MTExponentialBackOffTimer *)v27;

    v29 = MTLogForCategory(6);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_19CC95000, v29, OS_LOG_TYPE_DEFAULT, "Initialized %{public}@", (uint8_t *)&buf, 0xCu);
    }

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __53__MTCompanionSyncService_initWithSyncStatusProvider___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = MTLogForCategory(6);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [WeakRetained retryTimer];
    int v4 = 138543618;
    id v5 = WeakRetained;
    __int16 v6 = 2114;
    v7 = v3;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ retry timer fired (%{public}@)", (uint8_t *)&v4, 0x16u);
  }
  [WeakRetained _retryRequest];
}

- (BOOL)resume:(id *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = MTLogForCategory(6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming service", (uint8_t *)&v7, 0xCu);
  }

  return [(SYService *)self->_service resume:a3];
}

- (void)suspend
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    __int16 v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ suspending service", (uint8_t *)&v5, 0xCu);
  }

  [(SYService *)self->_service suspend];
  int v4 = [(MTCompanionSyncService *)self retryTimer];
  [v4 reset];
}

- (id)requestSync:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v5 = +[MTCompanionSyncRequest requestWithType:](MTCompanionSyncRequest, "requestWithType:");
  __int16 v6 = MTLogForCategory(6);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    v16 = self;
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ requests sync %{public}@", buf, 0x16u);
  }

  serializer = self->_serializer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__MTCompanionSyncService_requestSync___block_invoke;
  v12[3] = &unk_1E5915258;
  v12[4] = self;
  unint64_t v14 = a3;
  id v8 = v5;
  id v13 = v8;
  [(NAScheduler *)serializer performBlock:v12];
  [(MTCompanionSyncService *)self _requestSync:a3];
  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __38__MTCompanionSyncService_requestSync___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 64);
  v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
  int v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__MTCompanionSyncService_requestSync___block_invoke_2;
    v8[3] = &unk_1E5915AA8;
    id v9 = *(id *)(a1 + 40);
    [v4 addCompletionBlock:v8];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    __int16 v6 = *(void **)(*(void *)(a1 + 32) + 64);
    uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
}

uint64_t __38__MTCompanionSyncService_requestSync___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) complete:a2];
}

- (void)_requestSync:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    int v4 = MTLogForCategory(6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 138543362;
      id v8 = self;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "%{public}@ setHasChangesAvailable", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v5 = [(MTCompanionSyncService *)self service];
    [v5 setHasChangesAvailable];
  }
  __int16 v6 = [(MTCompanionSyncService *)self retryTimer];
  [v6 reset];
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  serialQueue = self->_serialQueue;
  id v9 = a4;
  id v10 = a3;
  dispatch_assert_queue_V2(serialQueue);
  [v9 setTargetQueue:self->_serialQueue];
  if ([v9 isSending]) {
    BOOL v11 = [(MTCompanionSyncService *)self service:v10 startSendingSession:v9 error:a5];
  }
  else {
    BOOL v11 = [(MTCompanionSyncService *)self service:v10 startReceivingSession:v9 error:a5];
  }
  BOOL v12 = v11;

  return v12;
}

- (BOOL)service:(id)a3 startSendingSession:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [(NSMutableDictionary *)self->_pendingRequests objectForKeyedSubscript:&unk_1EEE11E80];
  id v8 = MTLogForCategory(6);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543874;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ wants to start sending session %{public}@ for request %{public}@", (uint8_t *)&v17, 0x20u);
  }

  id v9 = [MTCompanionSyncSession alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v11 = [(MTCompanionSyncSession *)v9 initWithSession:v6 request:v7 delegate:WeakRetained];
  [(MTCompanionSyncService *)self setSendingSession:v11];

  uint64_t v12 = [(MTSyncStatusProvider *)self->_syncStatusProvider syncStatus];
  id v13 = MTLogForCategory(6);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12 == 1)
  {
    if (v14)
    {
      v15 = [(MTCompanionSyncService *)self sendingSession];
      int v17 = 138543618;
      id v18 = self;
      __int16 v19 = 2114;
      id v20 = v15;
      _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ starting sending session %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }
  else if (v14)
  {
    int v17 = 138543362;
    id v18 = self;
    _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ not ok to sync yet", (uint8_t *)&v17, 0xCu);
  }

  return v12 == 1;
}

- (BOOL)service:(id)a3 startReceivingSession:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MTLogForCategory(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = self;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ starting receiving session %{public}@", (uint8_t *)&v12, 0x16u);
  }

  id v8 = [MTCompanionSyncSession alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = [(MTCompanionSyncSession *)v8 initWithSession:v6 delegate:WeakRetained];
  [(MTCompanionSyncService *)self setReceivingSession:v10];

  return 1;
}

- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5
{
  serialQueue = self->_serialQueue;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2(serialQueue);
  if ([v10 isSending]) {
    [(MTCompanionSyncService *)self service:v11 sendingSessionEnded:v10 error:v9];
  }
  else {
    [(MTCompanionSyncService *)self service:v11 receivingSessionEnded:v10 error:v9];
  }
}

- (void)service:(id)a3 sendingSessionEnded:(id)a4 error:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = MTLogForCategory(6);
  int v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138543874;
      __int16 v21 = self;
      __int16 v22 = 2114;
      id v23 = v9;
      __int16 v24 = 2114;
      id v25 = v10;
      _os_log_error_impl(&dword_19CC95000, v12, OS_LOG_TYPE_ERROR, "%{public}@ finished sending session %{public}@ with error %{public}@", (uint8_t *)&v20, 0x20u);
    }

    id v13 = [NSString stringWithFormat:@"Companion sync sending session failed"];
    +[MTAnalytics sendCriticalEvent:v13];

    if ([(id)objc_opt_class() shouldRetryForError:v10])
    {
      __int16 v14 = [(MTCompanionSyncService *)self retryTimer];
      [v14 start];
      goto LABEL_12;
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543618;
      __int16 v21 = self;
      __int16 v22 = 2114;
      id v23 = v9;
      _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ finished sending session %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }
  id v15 = [(MTCompanionSyncService *)self sendingSession];
  __int16 v14 = [v15 request];

  uint64_t v16 = MTLogForCategory(6);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543874;
    __int16 v21 = self;
    __int16 v22 = 2114;
    id v23 = v14;
    __int16 v24 = 2114;
    id v25 = v10;
    _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ finished request %{public}@ with error %{public}@", (uint8_t *)&v20, 0x20u);
  }

  [v14 complete:v10];
  pendingRequests = self->_pendingRequests;
  id v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v14, "requestType"));
  [(NSMutableDictionary *)pendingRequests removeObjectForKey:v18];

  [(MTCompanionSyncService *)self setSendingSession:0];
  __int16 v19 = [(MTCompanionSyncService *)self retryTimer];
  [v19 reset];

LABEL_12:
}

+ (BOOL)shouldRetryForError:(id)a3
{
  return 1;
}

- (void)service:(id)a3 receivingSessionEnded:(id)a4 error:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = MTLogForCategory(6);
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543874;
      int v12 = self;
      __int16 v13 = 2114;
      id v14 = v7;
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_error_impl(&dword_19CC95000, v10, OS_LOG_TYPE_ERROR, "%{public}@ finished receiving session %{public}@ with error %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    int v12 = self;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ finished receiving session %{public}@", (uint8_t *)&v11, 0x16u);
  }

  [(MTCompanionSyncService *)self setReceivingSession:0];
}

- (id)service:(id)a3 willPreferSession:(id)a4 overSession:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = MTLogForCategory(6);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543874;
    int v12 = self;
    __int16 v13 = 2114;
    id v14 = v7;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ had a conflict between %{public}@ (preferred) and %{public}@ (rejected)", (uint8_t *)&v11, 0x20u);
  }

  return v7;
}

- (void)_retryRequest
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v3 = [(MTCompanionSyncService *)self sendingSession];
  int v4 = [v3 request];

  if (v4)
  {
    uint64_t v5 = MTLogForCategory(6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543618;
      id v7 = self;
      __int16 v8 = 2114;
      id v9 = v4;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ retrying %{public}@", (uint8_t *)&v6, 0x16u);
    }

    -[MTCompanionSyncService _requestSync:](self, "_requestSync:", [v4 requestType]);
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p master: %d >", objc_opt_class(), self, -[SYService isMasterStore](self->_service, "isMasterStore")];
}

- (void)syncStatusProvider:(id)a3 didChangeSyncStatus:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 == 1)
  {
    id v7 = MTLogForCategory(6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      int v11 = self;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ told it's ok to sync from %{public}@.", buf, 0x16u);
    }

    serializer = self->_serializer;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__MTCompanionSyncService_syncStatusProvider_didChangeSyncStatus___block_invoke;
    v9[3] = &unk_1E59150A8;
    v9[4] = self;
    [(NAScheduler *)serializer performBlock:v9];
  }
}

uint64_t __65__MTCompanionSyncService_syncStatusProvider_didChangeSyncStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retryRequest];
}

- (MTSyncServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MTSyncServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (SYService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (MTSyncStatusProvider)syncStatusProvider
{
  return self->_syncStatusProvider;
}

- (void)setSyncStatusProvider:(id)a3
{
}

- (MTCompanionSyncSession)sendingSession
{
  return self->_sendingSession;
}

- (void)setSendingSession:(id)a3
{
}

- (MTCompanionSyncSession)receivingSession
{
  return self->_receivingSession;
}

- (void)setReceivingSession:(id)a3
{
}

- (NSMutableDictionary)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
}

- (MTExponentialBackOffTimer)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_receivingSession, 0);
  objc_storeStrong((id *)&self->_sendingSession, 0);
  objc_storeStrong((id *)&self->_syncStatusProvider, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithSyncStatusProvider:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"SYServiceOption getSYServiceOptionDiskBufferProtectionClass(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MTCompanionSyncService.m", 27, @"%s", dlerror());

  __break(1u);
}

- (void)initWithSyncStatusProvider:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getIDSSendMessageOptionBypassDuetKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MTCompanionSyncService.m", 29, @"%s", dlerror());

  __break(1u);
}

@end