@interface LICacheClearScheduler
+ (id)transactionDescription:(id)a3;
- (BOOL)holdTransaction;
- (BOOL)timerFired;
- (LICacheClearScheduler)initWithObject:(id)a3 delay:(double)a4 holdTransaction:(BOOL)a5 clearHandler:(id)a6;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)memoryPreasure;
- (OS_dispatch_source)timer;
- (OS_os_transaction)transaction;
- (double)delay;
- (id)clearHandler;
- (id)object;
- (unint64_t)memoryPreasureState;
- (void)_queue_clearCache;
- (void)setDelay:(double)a3;
- (void)setHoldTransaction:(BOOL)a3;
- (void)setMemoryPreasure:(id)a3;
- (void)setMemoryPreasureState:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimerFired:(BOOL)a3;
- (void)setTransaction:(id)a3;
@end

@implementation LICacheClearScheduler

- (LICacheClearScheduler)initWithObject:(id)a3 delay:(double)a4 holdTransaction:(BOOL)a5 clearHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v31.receiver = self;
  v31.super_class = (Class)LICacheClearScheduler;
  id v12 = [(LICacheClearScheduler *)&v31 init];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    v14 = (void *)*((void *)v12 + 9);
    *((void *)v12 + 9) = v13;

    *((double *)v12 + 3) = a4;
    objc_initWeak(&location, v12);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("delayed evitor queue", v15);
    v17 = (void *)*((void *)v12 + 8);
    *((void *)v12 + 8) = v16;

    *((unsigned char *)v12 + 9) = a5;
    *((unsigned char *)v12 + 8) = 0;
    v18 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)v12 + 8));
    dispatch_time_t v19 = dispatch_time(0, (uint64_t)(*((double *)v12 + 3) * 1000000000.0));
    dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __75__LICacheClearScheduler_initWithObject_delay_holdTransaction_clearHandler___block_invoke;
    handler[3] = &unk_264187DA8;
    v20 = v18;
    v28 = v20;
    objc_copyWeak(&v29, &location);
    dispatch_source_set_event_handler(v20, handler);
    [v12 setTimer:v20];
    dispatch_resume(v20);
    *((void *)v12 + 6) = 1;
    v21 = dispatch_source_create(MEMORY[0x263EF83D8], 0, 7uLL, *((dispatch_queue_t *)v12 + 8));
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __75__LICacheClearScheduler_initWithObject_delay_holdTransaction_clearHandler___block_invoke_2;
    v24[3] = &unk_264187DD0;
    objc_copyWeak(&v26, &location);
    id v22 = v12;
    id v25 = v22;
    dispatch_source_set_event_handler(v21, v24);
    [v22 setMemoryPreasure:v21];
    dispatch_resume(v21);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v29);

    objc_destroyWeak(&location);
  }

  return (LICacheClearScheduler *)v12;
}

void __75__LICacheClearScheduler_initWithObject_delay_holdTransaction_clearHandler___block_invoke(uint64_t a1)
{
  v1 = (id *)a1;
  dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v1 += 5;
  id WeakRetained = objc_loadWeakRetained(v1);
  [WeakRetained setTimerFired:1];

  id v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_queue_clearCache");
}

void __75__LICacheClearScheduler_initWithObject_delay_holdTransaction_clearHandler___block_invoke_2(id *a1)
{
  v1 = a1;
  v2 = [a1[4] memoryPreasure];
  uintptr_t mask = dispatch_source_get_mask(v2);
  v1 += 5;
  id WeakRetained = objc_loadWeakRetained(v1);
  [WeakRetained setMemoryPreasureState:mask];

  id v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "_queue_clearCache");
}

+ (id)transactionDescription:(id)a3
{
  id v3 = a3;
  if (v3 && (uint64_t v4 = os_transaction_copy_description()) != 0)
  {
    id v5 = (void *)v4;
    v6 = [NSString stringWithUTF8String:v4];
    free(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)object
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__LICacheClearScheduler_object__block_invoke;
  v5[3] = &unk_264187DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__LICacheClearScheduler_object__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  uint64_t v2 = a1 + 40;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
  if (*((unsigned char *)*v1 + 9))
  {
    if (*((void *)*v1 + 7))
    {
      if (_LIDefaultLog_onceToken_0 != -1) {
        dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_93);
      }
      id v3 = (void *)_LIDefaultLog_log_0;
      if (os_log_type_enabled((os_log_t)_LIDefaultLog_log_0, OS_LOG_TYPE_DEBUG)) {
        __31__LICacheClearScheduler_object__block_invoke_cold_3((uint64_t)v1, v3);
      }
      os_transaction_needs_more_time();
    }
    else
    {
      uint64_t v4 = os_transaction_create();
      id v5 = (void *)*((void *)*v1 + 7);
      *((void *)*v1 + 7) = v4;

      if (_LIDefaultLog_onceToken_0 != -1) {
        dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_93);
      }
      uint64_t v6 = (void *)_LIDefaultLog_log_0;
      if (os_log_type_enabled((os_log_t)_LIDefaultLog_log_0, OS_LOG_TYPE_DEBUG)) {
        __31__LICacheClearScheduler_object__block_invoke_cold_2((uint64_t)v1, v6);
      }
    }
  }
  *((unsigned char *)*v1 + 8) = 0;
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(*((double *)*v1 + 3) * 1000000000.0));
  uint64_t v8 = [*v1 timer];
  dispatch_source_set_timer(v8, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  if (_LIDefaultLog_onceToken_0 != -1) {
    dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_93);
  }
  v9 = _LIDefaultLog_log_0;
  if (os_log_type_enabled((os_log_t)_LIDefaultLog_log_0, OS_LOG_TYPE_DEBUG)) {
    __31__LICacheClearScheduler_object__block_invoke_cold_1(v2, v9);
  }
}

- (void)_queue_clearCache
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = "YES";
  if (!*(unsigned char *)(a1 + 8)) {
    id v3 = "NO";
  }
  int v4 = 134218242;
  uint64_t v5 = v2;
  __int16 v6 = 2080;
  dispatch_time_t v7 = v3;
  _os_log_debug_impl(&dword_210A5A000, a2, OS_LOG_TYPE_DEBUG, "Evaluating eviction state: memmory preasure state: %lx, timer fired: %s", (uint8_t *)&v4, 0x16u);
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTimer:(id)a3
{
}

- (BOOL)timerFired
{
  return self->_timerFired;
}

- (void)setTimerFired:(BOOL)a3
{
  self->_timerFired = a3;
}

- (OS_dispatch_source)memoryPreasure
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMemoryPreasure:(id)a3
{
}

- (unint64_t)memoryPreasureState
{
  return self->_memoryPreasureState;
}

- (void)setMemoryPreasureState:(unint64_t)a3
{
  self->_memoryPreasureState = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTransaction:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueue:(id)a3
{
}

- (BOOL)holdTransaction
{
  return self->_holdTransaction;
}

- (void)setHoldTransaction:(BOOL)a3
{
  self->_holdTransaction = a3;
}

- (id)clearHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clearHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_memoryPreasure, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_object, 0);
}

void __31__LICacheClearScheduler_object__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_210A5A000, a2, OS_LOG_TYPE_DEBUG, "Object get: Delaying eviction for %lx", (uint8_t *)&v3, 0xCu);
}

void __31__LICacheClearScheduler_object__block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "transactionDescription:");
  OUTLINED_FUNCTION_0(&dword_210A5A000, v5, v6, "Created transaction %@", v7, v8, v9, v10, 2u);
}

void __31__LICacheClearScheduler_object__block_invoke_cold_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "transactionDescription:");
  OUTLINED_FUNCTION_0(&dword_210A5A000, v5, v6, "Extending transaction %@", v7, v8, v9, v10, 2u);
}

@end