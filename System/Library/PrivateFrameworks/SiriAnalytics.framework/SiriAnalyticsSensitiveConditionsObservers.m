@interface SiriAnalyticsSensitiveConditionsObservers
- (SiriAnalyticsSensitiveConditionsObservers)initWithQueue:(id)a3;
- (void)addSensitiveConditionsObserver:(id)a3;
- (void)pollAllObserversWithCompletion:(id)a3;
@end

@implementation SiriAnalyticsSensitiveConditionsObservers

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)pollAllObserversWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__SiriAnalyticsSensitiveConditionsObservers_pollAllObserversWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __76__SiriAnalyticsSensitiveConditionsObservers_pollAllObserversWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v2 = SiriAnalyticsLogContextSensitiveConditions;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextSensitiveConditions, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 136315394;
    v22 = "-[SiriAnalyticsSensitiveConditionsObservers pollAllObserversWithCompletion:]_block_invoke";
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    _os_log_debug_impl(&dword_1A2B39000, v2, OS_LOG_TYPE_DEBUG, "%s observers: %@", buf, 0x16u);
  }
  v3 = dispatch_group_create();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v9)
        {
          dispatch_group_enter(v3);
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __76__SiriAnalyticsSensitiveConditionsObservers_pollAllObserversWithCompletion___block_invoke_1;
          v14[3] = &unk_1E5AC05B0;
          v15 = v3;
          [v9 pollConditionStateWithCompletion:v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__SiriAnalyticsSensitiveConditionsObservers_pollAllObserversWithCompletion___block_invoke_2;
  v12[3] = &unk_1E5AC06A0;
  id v13 = *(id *)(a1 + 40);
  dispatch_group_notify(v3, v10, v12);
}

void __76__SiriAnalyticsSensitiveConditionsObservers_pollAllObserversWithCompletion___block_invoke_1(uint64_t a1)
{
}

uint64_t __76__SiriAnalyticsSensitiveConditionsObservers_pollAllObserversWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addSensitiveConditionsObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__SiriAnalyticsSensitiveConditionsObservers_addSensitiveConditionsObserver___block_invoke;
  v7[3] = &unk_1E5AC0530;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __76__SiriAnalyticsSensitiveConditionsObservers_addSensitiveConditionsObserver___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v2 = SiriAnalyticsLogContextSensitiveConditions;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextSensitiveConditions, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 136315394;
    v10 = "-[SiriAnalyticsSensitiveConditionsObservers addSensitiveConditionsObserver:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1A2B39000, v2, OS_LOG_TYPE_INFO, "%s Registering sensitive conditions observer: %@", (uint8_t *)&v9, 0x16u);
  }
  id v4 = *(void **)(*(void *)(a1 + 40) + 16);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v5;

    id v4 = *(void **)(*(void *)(a1 + 40) + 16);
  }
  return [v4 addObject:*(void *)(a1 + 32)];
}

- (SiriAnalyticsSensitiveConditionsObservers)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriAnalyticsSensitiveConditionsObservers;
  uint64_t v6 = [(SiriAnalyticsSensitiveConditionsObservers *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

@end