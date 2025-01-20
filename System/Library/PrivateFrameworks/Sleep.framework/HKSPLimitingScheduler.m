@interface HKSPLimitingScheduler
- (HKSPLimitingScheduler)initWithScheduler:(id)a3;
- (HKSPLimitingScheduler)initWithScheduler:(id)a3 mutexGenerator:(id)a4;
- (HKSPLimitingScheduler)initWithScheduler:(id)a3 mutexGenerator:(id)a4 ignoreDelays:(BOOL)a5;
- (void)_withLock:(id)a3;
- (void)scheduleTask:(id)a3;
@end

@implementation HKSPLimitingScheduler

- (void)scheduleTask:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 identifier];
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F29128] UUID];
    v5 = [v6 UUIDString];

    v7 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2112;
      v20 = v5;
      id v13 = v18;
      _os_log_debug_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@] generating identifier %@ for task", buf, 0x16u);
    }
  }
  v8 = HKSPLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v18 = v11;
    __int16 v19 = 2112;
    v20 = v5;
    id v12 = v11;
    _os_log_debug_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] request to perform %@ task", buf, 0x16u);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __38__HKSPLimitingScheduler_scheduleTask___block_invoke;
  v14[3] = &unk_1E5D33B50;
  v14[4] = self;
  id v15 = v5;
  id v16 = v4;
  id v9 = v4;
  id v10 = v5;
  [(HKSPLimitingScheduler *)self _withLock:v14];
}

- (void)_withLock:(id)a3
{
}

void __38__HKSPLimitingScheduler_scheduleTask___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 40)];
  v3 = HKSPLogForCategory(0);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      id v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      id v12 = v10;
      _os_log_debug_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] %@ task already in progress", buf, 0x16u);
    }
  }
  else
  {
    if (v4)
    {
      id v13 = objc_opt_class();
      uint64_t v15 = *(void *)(a1 + 40);
      v14 = *(void **)(a1 + 48);
      id v16 = v13;
      [v14 delay];
      *(_DWORD *)buf = 138543874;
      v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      __int16 v25 = 2048;
      uint64_t v26 = v17;
      _os_log_debug_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] enqueuing %@ task with %f second delay", buf, 0x20u);
    }
    [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    if (*(unsigned char *)(v5 + 32))
    {
      double v7 = 0.0;
    }
    else
    {
      [*(id *)(a1 + 48) delay];
      double v7 = v8;
      uint64_t v5 = *(void *)(a1 + 32);
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __38__HKSPLimitingScheduler_scheduleTask___block_invoke_278;
    v18[3] = &unk_1E5D33B50;
    v18[4] = v5;
    id v19 = *(id *)(a1 + 40);
    id v20 = *(id *)(a1 + 48);
    id v9 = (id)[v6 afterDelay:v18 performBlock:v7];
  }
}

- (HKSPLimitingScheduler)initWithScheduler:(id)a3 mutexGenerator:(id)a4 ignoreDelays:(BOOL)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a4;
  v20.receiver = self;
  v20.super_class = (Class)HKSPLimitingScheduler;
  id v10 = [(HKSPLimitingScheduler *)&v20 init];
  if (v10)
  {
    uint64_t v11 = v9[2](v9);
    uint64_t v12 = HKSPOrderPreservingScheduler(v8, v11);
    orderPreservingScheduler = v10->_orderPreservingScheduler;
    v10->_orderPreservingScheduler = (NAScheduler *)v12;

    uint64_t v14 = v9[2](v9);
    mutexProvider = v10->_mutexProvider;
    v10->_mutexProvider = (HKSPMutexProvider *)v14;

    id v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    identifiers = v10->_identifiers;
    v10->_identifiers = v16;

    v10->_ignoreDelays = a5;
    id v18 = v10;
  }

  return v10;
}

- (HKSPLimitingScheduler)initWithScheduler:(id)a3 mutexGenerator:(id)a4
{
  return [(HKSPLimitingScheduler *)self initWithScheduler:a3 mutexGenerator:a4 ignoreDelays:0];
}

uint64_t __38__HKSPLimitingScheduler_scheduleTask___block_invoke_279(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

void __38__HKSPLimitingScheduler_scheduleTask___block_invoke_278(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v2 = HKSPLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    id v7 = v5;
    _os_log_debug_impl(&dword_1A7E74000, v2, OS_LOG_TYPE_DEBUG, "[%{public}@] performing %@ task", buf, 0x16u);
  }
  v3 = *(void **)(a1 + 32);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __38__HKSPLimitingScheduler_scheduleTask___block_invoke_279;
  uint64_t v14 = &unk_1E5D31AA8;
  uint64_t v15 = v3;
  id v16 = *(id *)(a1 + 40);
  [v3 _withLock:&v11];
  objc_msgSend(*(id *)(a1 + 48), "execute", v11, v12, v13, v14, v15);
  BOOL v4 = HKSPLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v8 = objc_opt_class();
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    id v10 = v8;
    _os_log_debug_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] finished %@ task", buf, 0x16u);
  }
}

- (HKSPLimitingScheduler)initWithScheduler:(id)a3
{
  id v4 = a3;
  id v5 = &__block_literal_global_21;
  uint64_t v6 = [(HKSPLimitingScheduler *)self initWithScheduler:v4 mutexGenerator:&__block_literal_global_21];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_storeStrong((id *)&self->_orderPreservingScheduler, 0);
}

@end