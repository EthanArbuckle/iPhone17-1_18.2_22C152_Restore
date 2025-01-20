@interface REOpportunisticTrainingScheduler
- (REOpportunisticTrainingScheduler)init;
- (void)_performAllTasks;
- (void)_queue_unschedule;
- (void)cancelPendindTasks;
- (void)dealloc;
- (void)performTask:(id)a3;
@end

@implementation REOpportunisticTrainingScheduler

- (REOpportunisticTrainingScheduler)init
{
  v11.receiver = self;
  v11.super_class = (Class)REOpportunisticTrainingScheduler;
  v2 = [(REOpportunisticTrainingScheduler *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.RelevanceEngine.REOpportunisticTrainingScheduler", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    criteria = v2->_criteria;
    v2->_criteria = v6;

    xpc_dictionary_set_BOOL(v2->_criteria, (const char *)*MEMORY[0x263EF82A0], 0);
    xpc_dictionary_set_BOOL(v2->_criteria, (const char *)*MEMORY[0x263EF8180], 1);
    xpc_dictionary_set_BOOL(v2->_criteria, (const char *)*MEMORY[0x263EF82D8], 1);
    xpc_dictionary_set_int64(v2->_criteria, (const char *)*MEMORY[0x263EF81C0], 600);
    xpc_dictionary_set_int64(v2->_criteria, (const char *)*MEMORY[0x263EF81A0], 300);
    xpc_dictionary_set_string(v2->_criteria, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    blocks = v2->_blocks;
    v2->_blocks = (NSMutableArray *)v8;
  }
  return v2;
}

- (void)dealloc
{
  [(REOpportunisticTrainingScheduler *)self _queue_unschedule];
  v3.receiver = self;
  v3.super_class = (Class)REOpportunisticTrainingScheduler;
  [(REOpportunisticTrainingScheduler *)&v3 dealloc];
}

- (void)performTask:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__REOpportunisticTrainingScheduler_performTask___block_invoke;
    v7[3] = &unk_2644BC5E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __48__REOpportunisticTrainingScheduler_performTask___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  objc_super v3 = (void *)MEMORY[0x223C31700](*(void *)(a1 + 40));
  [v2 addObject:v3];

  unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) count];
  v5 = *(unsigned char **)(a1 + 32);
  if (v4 < 0x64)
  {
    if (!v5[32])
    {
      v7 = RELogForDomain(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_21E6E6000, v7, OS_LOG_TYPE_INFO, "Scheduled training scheduler", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, *(id *)(a1 + 32));
      id v8 = (const char *)REOpportunisticTrainingSchedulerActivityName;
      v9 = *(void **)(*(void *)(a1 + 32) + 8);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __48__REOpportunisticTrainingScheduler_performTask___block_invoke_15;
      handler[3] = &unk_2644C0468;
      objc_copyWeak(&v11, buf);
      xpc_activity_register(v8, v9, handler);
      *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    [v5 _performAllTasks];
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "_queue_unschedule");
  }
}

void __48__REOpportunisticTrainingScheduler_performTask___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_super v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    xpc_activity_state_t state = xpc_activity_get_state(v3);
    v6 = RELogForDomain(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      xpc_activity_state_t v13 = state;
      _os_log_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_INFO, "Training scheduler fired with state %ld", buf, 0xCu);
    }

    if (!xpc_activity_set_state(v3, 4))
    {
      v7 = RELogForDomain(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E6E6000, v7, OS_LOG_TYPE_INFO, "Unable to continue training schedule activity", buf, 2u);
      }
    }
    id v8 = WeakRetained[2];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__REOpportunisticTrainingScheduler_performTask___block_invoke_16;
    v9[3] = &unk_2644BC688;
    v10 = v3;
    id v11 = WeakRetained;
    dispatch_async(v8, v9);
  }
}

uint64_t __48__REOpportunisticTrainingScheduler_performTask___block_invoke_16(uint64_t a1)
{
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    v2 = RELogForDomain(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v4 = 0;
      _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_INFO, "Unable to finish training schedule activity", v4, 2u);
    }
  }
  [*(id *)(a1 + 40) _performAllTasks];
  return objc_msgSend(*(id *)(a1 + 40), "_queue_unschedule");
}

- (void)_performAllTasks
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = self->_blocks;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_blocks removeAllObjects];
}

- (void)_queue_unschedule
{
  if (self->_scheduled)
  {
    xpc_activity_unregister((const char *)REOpportunisticTrainingSchedulerActivityName);
    self->_scheduled = 0;
  }
}

- (void)cancelPendindTasks
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__REOpportunisticTrainingScheduler_cancelPendindTasks__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __54__REOpportunisticTrainingScheduler_cancelPendindTasks__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unschedule");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
}

@end