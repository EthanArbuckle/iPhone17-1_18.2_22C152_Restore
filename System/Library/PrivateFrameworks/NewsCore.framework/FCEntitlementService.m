@interface FCEntitlementService
- (BOOL)requestInProgress;
- (FCCoreConfigurationManager)configurationManager;
- (FCEntitlementService)initWithConfigurationManager:(id)a3;
- (NFMutexLock)accessLock;
- (NSMutableArray)blocks;
- (NSTimer)entitlementRequestTimer;
- (void)_performEntitlementWithIgnoreCache:(BOOL)a3 requestTimeoutDuration:(int64_t)a4 completion:(id)a5;
- (void)clearTimer;
- (void)performEntitlementWithIgnoreCache:(BOOL)a3 completion:(id)a4;
- (void)setAccessLock:(id)a3;
- (void)setBlocks:(id)a3;
- (void)setEntitlementRequestTimer:(id)a3;
- (void)setRequestInProgress:(BOOL)a3;
- (void)startTimerWithTimeoutDuration:(double)a3;
@end

@implementation FCEntitlementService

uint64_t __69__FCEntitlementService_performEntitlementWithIgnoreCache_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v5 = [a2 entitlementsRequestTimeoutDurationInSeconds];
  uint64_t v6 = *(void *)(a1 + 40);
  return [v3 _performEntitlementWithIgnoreCache:v4 requestTimeoutDuration:v5 completion:v6];
}

- (void)performEntitlementWithIgnoreCache:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(FCEntitlementService *)self configurationManager];
  v8 = dispatch_get_global_queue(25, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__FCEntitlementService_performEntitlementWithIgnoreCache_completion___block_invoke;
  v10[3] = &unk_1E5B543A0;
  BOOL v12 = a3;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 fetchConfigurationIfNeededWithCompletionQueue:v8 completion:v10];
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

void __54__FCEntitlementService_startTimerWithTimeoutDuration___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel_clearTimer selector:0 userInfo:0 repeats:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) setEntitlementRequestTimer:v2];
}

- (void)startTimerWithTimeoutDuration:(double)a3
{
  uint64_t v5 = [(FCEntitlementService *)self entitlementRequestTimer];

  if (!v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__FCEntitlementService_startTimerWithTimeoutDuration___block_invoke;
    v6[3] = &unk_1E5B51AE8;
    v6[4] = self;
    *(double *)&v6[5] = a3;
    FCPerformBlockOnMainThread(v6);
  }
}

void __93__FCEntitlementService__performEntitlementWithIgnoreCache_requestTimeoutDuration_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = (void *)FCPurchaseLog;
  if (v8)
  {
    if (!os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    v10 = v9;
    *(_DWORD *)buf = 138412802;
    uint64_t v31 = objc_opt_class();
    __int16 v32 = 2114;
    uint64_t v33 = (uint64_t)v7;
    __int16 v34 = 2114;
    id v35 = v8;
    _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "%@ failed to fetch entitlements with entitlements:%{public}@, error: %{public}@", buf, 0x20u);
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    v10 = v9;
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "fc_millisecondTimeIntervalUntilNow");
    *(_DWORD *)buf = 138412802;
    uint64_t v31 = v11;
    __int16 v32 = 2048;
    uint64_t v33 = v12;
    __int16 v34 = 2114;
    id v35 = v7;
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "%@ Entitlements response received in %llums with entitlements: %{public}@", buf, 0x20u);
  }

LABEL_7:
  v13 = [*(id *)(a1 + 32) accessLock];
  [v13 lock];

  v14 = [*(id *)(a1 + 32) blocks];
  v15 = (void *)[v14 copy];

  if ([*(id *)(a1 + 32) requestInProgress])
  {
    v16 = [*(id *)(a1 + 32) entitlementRequestTimer];
    [v16 invalidate];

    [*(id *)(a1 + 32) setEntitlementRequestTimer:0];
    v17 = [*(id *)(a1 + 32) blocks];
    [v17 removeAllObjects];

    [*(id *)(a1 + 32) setRequestInProgress:0];
  }
  v18 = [*(id *)(a1 + 32) accessLock];
  [v18 unlock];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v19 = v15;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        if (v24) {
          (*(void (**)(uint64_t, id, uint64_t, id))(v24 + 16))(v24, v7, a3, v8);
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v21);
  }
}

- (NSMutableArray)blocks
{
  return self->_blocks;
}

- (NSTimer)entitlementRequestTimer
{
  return self->_entitlementRequestTimer;
}

- (void)setEntitlementRequestTimer:(id)a3
{
}

- (void)_performEntitlementWithIgnoreCache:(BOOL)a3 requestTimeoutDuration:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(FCEntitlementService *)self accessLock];
  [v9 lock];

  v10 = [(FCEntitlementService *)self blocks];
  uint64_t v11 = _Block_copy(v8);

  [v10 addObject:v11];
  if ([(FCEntitlementService *)self requestInProgress])
  {
    uint64_t v12 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEBUG))
    {
      v18 = v12;
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = objc_opt_class();
      _os_log_debug_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEBUG, "%@ Entitlements request in progress returning early", buf, 0xCu);
    }
    id v13 = [(FCEntitlementService *)self accessLock];
    [v13 unlock];
  }
  else
  {
    [(FCEntitlementService *)self startTimerWithTimeoutDuration:(double)a4];
    [(FCEntitlementService *)self setRequestInProgress:1];
    v14 = [MEMORY[0x1E4F1C9C8] date];
    v15 = FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v6;
      _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "Fetching Entitlements with ignoreCaches: %d", buf, 8u);
    }
    v16 = [MEMORY[0x1E4F4BCF0] sharedInstance];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __93__FCEntitlementService__performEntitlementWithIgnoreCache_requestTimeoutDuration_completion___block_invoke;
    uint64_t v22 = &unk_1E5B543C8;
    v23 = self;
    id v24 = v14;
    id v13 = v14;
    [v16 getSubscriptionEntitlementsForSegment:0 ignoreCaches:v6 withResultHandler:&v19];

    v17 = [(FCEntitlementService *)self accessLock];
    [v17 unlock];
  }
}

- (NFMutexLock)accessLock
{
  return self->_accessLock;
}

- (BOOL)requestInProgress
{
  return self->_requestInProgress;
}

- (void)setRequestInProgress:(BOOL)a3
{
  self->_requestInProgress = a3;
}

- (FCEntitlementService)initWithConfigurationManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCEntitlementService;
  BOOL v6 = [(FCEntitlementService *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    blocks = v6->_blocks;
    v6->_blocks = (NSMutableArray *)v7;

    id v9 = (NFMutexLock *)objc_alloc_init(MEMORY[0x1E4F81BE0]);
    accessLock = v6->_accessLock;
    v6->_accessLock = v9;

    objc_storeStrong((id *)&v6->_configurationManager, a3);
  }

  return v6;
}

- (void)clearTimer
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = objc_opt_class();
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%@ clearing the timer", buf, 0xCu);
  }
  id v5 = [(FCEntitlementService *)self accessLock];
  [v5 lock];

  BOOL v6 = [(FCEntitlementService *)self blocks];
  uint64_t v7 = (void *)[v6 copy];

  id v8 = [(FCEntitlementService *)self blocks];
  [v8 removeAllObjects];

  id v9 = [(FCEntitlementService *)self entitlementRequestTimer];
  [v9 invalidate];

  [(FCEntitlementService *)self setEntitlementRequestTimer:0];
  [(FCEntitlementService *)self setRequestInProgress:0];
  v10 = [(FCEntitlementService *)self accessLock];
  [v10 unlock];

  uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EntitlementsProviderErrorDomain" code:3001 userInfo:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * v16);
        if (v17) {
          (*(void (**)(uint64_t, void, void, void *))(v17 + 16))(v17, 0, 0, v11);
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (void)setBlocks:(id)a3
{
}

- (void)setAccessLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_entitlementRequestTimer, 0);
}

@end