@interface PPAdaptiveCoalescer
- (PPAdaptiveCoalescer)init;
- (void)coalesceRequestKey:(id)a3 handler:(id)a4 executeRequestAndInvokeHandlersBlock:(id)a5;
- (void)coalesceRequestKey:(id)a3 handler:(id)a4 executeRequestAndInvokeHandlersBlock:(id)a5 nowDate:(id)a6;
- (void)garbageCollectPendingKeysForNowDate:(id)a3;
@end

@implementation PPAdaptiveCoalescer

void __59__PPAdaptiveCoalescer_garbageCollectPendingKeysForNowDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_new();
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __59__PPAdaptiveCoalescer_garbageCollectPendingKeysForNowDate___block_invoke_2;
  v9 = &unk_1E550E2A8;
  id v10 = *(id *)(a1 + 32);
  id v11 = v4;
  id v5 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:&v6];
  objc_msgSend(v3, "removeObjectsForKeys:", v5, v6, v7, v8, v9);
}

- (void)coalesceRequestKey:(id)a3 handler:(id)a4 executeRequestAndInvokeHandlersBlock:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 date];
  [(PPAdaptiveCoalescer *)self coalesceRequestKey:v11 handler:v10 executeRequestAndInvokeHandlersBlock:v9 nowDate:v12];
}

- (void)coalesceRequestKey:(id)a3 handler:(id)a4 executeRequestAndInvokeHandlersBlock:(id)a5 nowDate:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)[a3 copyWithZone:0];
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__1845;
  v41[4] = __Block_byref_object_dispose__1846;
  id v42 = 0;
  id v42 = (id)MEMORY[0x192F975A0](v12);
  v15 = self->_lock;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __95__PPAdaptiveCoalescer_coalesceRequestKey_handler_executeRequestAndInvokeHandlersBlock_nowDate___block_invoke;
  v35[3] = &unk_1E550E320;
  v16 = v15;
  v36 = v16;
  id v17 = v14;
  id v37 = v17;
  v38 = self;
  v39 = v41;
  SEL v40 = a2;
  v18 = (void *)MEMORY[0x192F975A0](v35);
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __95__PPAdaptiveCoalescer_coalesceRequestKey_handler_executeRequestAndInvokeHandlersBlock_nowDate___block_invoke_44;
  v23[3] = &unk_1E550E348;
  id v19 = v17;
  id v24 = v19;
  v25 = self;
  id v20 = v13;
  id v26 = v20;
  id v21 = v11;
  id v27 = v21;
  v29 = &v31;
  v30 = v41;
  v22 = v18;
  id v28 = v22;
  [(_PASLock *)v16 runWithLockAcquired:v23];
  if (*((unsigned char *)v32 + 24)) {
    v22[2](v22);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v41, 8);
}

void __95__PPAdaptiveCoalescer_coalesceRequestKey_handler_executeRequestAndInvokeHandlersBlock_nowDate___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__34;
  id v21 = __Block_byref_object_dispose__35;
  id v22 = 0;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __95__PPAdaptiveCoalescer_coalesceRequestKey_handler_executeRequestAndInvokeHandlersBlock_nowDate___block_invoke_36;
  id v12 = &unk_1E550E2F8;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 48);
  id v13 = v3;
  uint64_t v14 = v5;
  v15 = &v17;
  uint64_t v16 = v4;
  [v2 runWithLockAcquired:&v9];
  uint64_t v6 = pp_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = objc_msgSend((id)v18[5], "count", v9, v10, v11, v12);
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v7;
    __int16 v25 = 2048;
    uint64_t v26 = v8;
    _os_log_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_DEFAULT, "PPAdaptiveCoalescer: executing request for key %@ (handlers: %tu)", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) + 16))();
  _Block_object_dispose(&v17, 8);
}

void __95__PPAdaptiveCoalescer_coalesceRequestKey_handler_executeRequestAndInvokeHandlersBlock_nowDate___block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
  }
  else
  {
    [*(id *)(a1 + 40) garbageCollectPendingKeysForNowDate:*(void *)(a1 + 48)];
    uint64_t v6 = [[PPAdaptiveCoalescerPendingKeyState alloc] initWithKey:*(void *)(a1 + 32)];
    [v3 setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];
  }

  [(PPAdaptiveCoalescerPendingKeyState *)v6 addDate:*(void *)(a1 + 48)];
  [(NSMutableArray *)v6->_handlers addObject:*(void *)(a1 + 56)];
  if ([(NSMutableArray *)v6->_handlers count] == 1)
  {
    [(PPAdaptiveCoalescerPendingKeyState *)v6 currentDelayForNowDate:*(void *)(a1 + 48)];
    double v8 = v7;
    uint64_t v9 = pp_default_log_handle();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8 == 0.0)
    {
      if (v10)
      {
        double v11 = *(double *)(a1 + 32);
        int v19 = 138412290;
        double v20 = v11;
        _os_log_impl(&dword_18CAA6000, v9, OS_LOG_TYPE_DEFAULT, "PPAdaptiveCoalescer: will run immediately for key %@ (handlers: 1)", (uint8_t *)&v19, 0xCu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    }
    else
    {
      if (v10)
      {
        uint64_t v15 = *(void *)(a1 + 32);
        int v19 = 134218242;
        double v20 = v8;
        __int16 v21 = 2112;
        uint64_t v22 = v15;
        _os_log_impl(&dword_18CAA6000, v9, OS_LOG_TYPE_DEFAULT, "PPAdaptiveCoalescer: will delay %f for key %@ (handlers: 1)", (uint8_t *)&v19, 0x16u);
      }

      uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) copy];
      uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
      v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      [MEMORY[0x1E4F93B18] runAsyncOnQueue:*(void *)(*(void *)(a1 + 40) + 16) afterDelaySeconds:*(void *)(a1 + 64) block:v8];
    }
  }
  else
  {
    id v12 = pp_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = *(double *)(a1 + 32);
      uint64_t v14 = [(NSMutableArray *)v6->_handlers count];
      int v19 = 138412546;
      double v20 = v13;
      __int16 v21 = 2048;
      uint64_t v22 = v14;
      _os_log_impl(&dword_18CAA6000, v12, OS_LOG_TYPE_DEFAULT, "PPAdaptiveCoalescer: merging request for %@ into existing pending deferred request (handlers: %tu)", (uint8_t *)&v19, 0x16u);
    }
  }
}

void __95__PPAdaptiveCoalescer_coalesceRequestKey_handler_executeRequestAndInvokeHandlersBlock_nowDate___block_invoke_36(void *a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:a1[4]];
  double v8 = (id *)v3;
  if (!v3)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a1[7], a1[5], @"PPAdaptiveCoalescer.m", 214, @"Invalid parameter not satisfying: %@", @"pendingKeyState" object file lineNumber description];

    uint64_t v3 = 0;
  }
  uint64_t v4 = [*(id *)(v3 + 16) copy];
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [v8[2] removeAllObjects];
}

- (void)garbageCollectPendingKeysForNowDate:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PPAdaptiveCoalescer_garbageCollectPendingKeysForNowDate___block_invoke;
  v7[3] = &unk_1E550E2D0;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

- (PPAdaptiveCoalescer)init
{
  v10.receiver = self;
  v10.super_class = (Class)PPAdaptiveCoalescer;
  v2 = [(PPAdaptiveCoalescer *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    uint64_t v7 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PPAdaptiveCoalescer"];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

void __59__PPAdaptiveCoalescer_garbageCollectPendingKeysForNowDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 shouldGarbageCollectForNowDate:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end