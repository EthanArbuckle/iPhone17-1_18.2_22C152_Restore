@interface MNXPCTransactionManager
+ (id)sharedInstance;
- (void)addHighMemoryThresholdRequest:(id)a3;
- (void)removeHighMemoryThresholdRequest:(id)a3 afterDelay:(double)a4;
@end

@implementation MNXPCTransactionManager

+ (id)sharedInstance
{
  if (qword_1EB59C1D0 != -1) {
    dispatch_once(&qword_1EB59C1D0, &__block_literal_global_29);
  }
  v2 = (void *)_MergedGlobals_34;
  return v2;
}

uint64_t __41__MNXPCTransactionManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MNXPCTransactionManager);
  uint64_t v1 = _MergedGlobals_34;
  _MergedGlobals_34 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)addHighMemoryThresholdRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__MNXPCTransactionManager_addHighMemoryThresholdRequest___block_invoke;
  v6[3] = &unk_1E60F6668;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  MNRunAsynchronouslyOnMainThread(v6);
}

void __57__MNXPCTransactionManager_addHighMemoryThresholdRequest___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    if (!*(void *)(*(void *)(a1 + 32) + 16))
    {
      uint64_t v2 = [MEMORY[0x1E4F28D30] hashTableWithOptions:2];
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(void **)(v3 + 16);
      *(void *)(v3 + 16) = v2;
    }
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(id)objc_opt_class() description];
      int v12 = 136315138;
      uint64_t v13 = [v6 UTF8String];
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "navd > XPC transaction | Enter request from %s", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
    if ([*(id *)(*(void *)(a1 + 32) + 16) count] == 1)
    {
      uint64_t v7 = os_transaction_create();
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = *(void **)(v8 + 8);
      *(void *)(v8 + 8) = v7;

      v10 = MNGetMNXPCTransactionManagerLog();
      if (os_signpost_enabled(v10))
      {
        LOWORD(v12) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B542B000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EnteredHighMemoryThreshold", "", (uint8_t *)&v12, 2u);
      }

      v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "navd entered high memory threshold", (uint8_t *)&v12, 2u);
      }
    }
  }
}

- (void)removeHighMemoryThresholdRequest:(id)a3 afterDelay:(double)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__MNXPCTransactionManager_removeHighMemoryThresholdRequest_afterDelay___block_invoke;
  v8[3] = &unk_1E60F7138;
  v8[4] = self;
  id v9 = v6;
  double v10 = a4;
  id v7 = v6;
  MNRunAsynchronouslyOnMainThread(v8);
}

void __71__MNXPCTransactionManager_removeHighMemoryThresholdRequest_afterDelay___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [(id)objc_opt_class() description];
      *(_DWORD *)buf = 136315138;
      uint64_t v7 = [v3 UTF8String];
      _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEFAULT, "navd > XPC transaction |     Exit request from %s", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__MNXPCTransactionManager_removeHighMemoryThresholdRequest_afterDelay___block_invoke_7;
    block[3] = &unk_1E60F6B98;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
}

void __71__MNXPCTransactionManager_removeHighMemoryThresholdRequest_afterDelay___block_invoke_7(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    uint64_t v2 = (void *)MEMORY[0x1BA99B140]();
    uint64_t v3 = *(void *)(a1 + 32);
    dispatch_time_t v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;

    id v5 = [MEMORY[0x1E4F28F80] processInfo];
    int v6 = objc_msgSend(v5, "_navigation_isNavd");

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F64AC8] modernLoader];
      [v7 clearAllCaches];
    }
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 8);
    *(void *)(v8 + 8) = 0;

    double v10 = MNGetMNXPCTransactionManagerLog();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ExitedHighMemoryThreshold", "", buf, 2u);
    }

    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v12 = 0;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "navd exited high memory threhold", v12, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesters, 0);
  objc_storeStrong((id *)&self->_xpcTransaction, 0);
}

@end