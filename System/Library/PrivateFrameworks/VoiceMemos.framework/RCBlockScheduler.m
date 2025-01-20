@interface RCBlockScheduler
- (NSDate)date;
- (OS_dispatch_queue)queue;
- (RCBlockScheduler)init;
- (double)interval;
- (void)resume;
- (void)scheduleBlock:(id)a3;
- (void)setInterval:(double)a3;
- (void)setQueue:(id)a3;
- (void)suspend;
@end

@implementation RCBlockScheduler

- (RCBlockScheduler)init
{
  v12.receiver = self;
  v12.super_class = (Class)RCBlockScheduler;
  id v2 = [(RCBlockScheduler *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    dispatch_group_t v5 = dispatch_group_create();
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    dispatch_queue_t v7 = dispatch_queue_create(0, 0);
    v8 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v7;

    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v2 + 3));
    v10 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v9;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 4), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler(*((dispatch_source_t *)v2 + 4), &__block_literal_global_8);
    *((unsigned char *)v2 + 56) = 1;
  }
  return (RCBlockScheduler *)v2;
}

- (void)suspend
{
  if (!self->_suspended)
  {
    dispatch_suspend((dispatch_object_t)self->_timer);
    self->_suspended = 1;
  }
}

- (void)resume
{
  if (self->_suspended)
  {
    dispatch_resume((dispatch_object_t)self->_timer);
    self->_suspended = 0;
  }
}

- (void)scheduleBlock:(id)a3
{
  id v4 = a3;
  schedulerQueue = self->_schedulerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__RCBlockScheduler_scheduleBlock___block_invoke;
  v7[3] = &unk_1E6496F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(schedulerQueue, v7);
}

void __34__RCBlockScheduler_scheduleBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = (void *)MEMORY[0x1C8778060](*(void *)(a1 + 40));
  [v2 addObject:v3];

  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(void *)(v4 + 48))
  {
    id v5 = *(id *)(v4 + 72);
    id v6 = *(id *)(*(void *)(a1 + 32) + 16);
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__6;
    v39[4] = __Block_byref_object_dispose__6;
    id v40 = (id)MEMORY[0x1C8778060](*(void *)(a1 + 40));
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __34__RCBlockScheduler_scheduleBlock___block_invoke_1;
    v37[3] = &unk_1E64963A0;
    id v7 = v6;
    id v38 = v7;
    id v8 = (void *)MEMORY[0x1C8778060](v37);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __34__RCBlockScheduler_scheduleBlock___block_invoke_2;
    v34[3] = &unk_1E6496EF0;
    id v35 = v8;
    v36 = v39;
    id v9 = v8;
    v10 = (void *)MEMORY[0x1C8778060](v34);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __34__RCBlockScheduler_scheduleBlock___block_invoke_3;
    v33[3] = &unk_1E64963A0;
    v33[4] = *(void *)(a1 + 32);
    v11 = (void *)MEMORY[0x1C8778060](v33);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __34__RCBlockScheduler_scheduleBlock___block_invoke_4;
    v28[3] = &unk_1E6496F18;
    v28[4] = *(void *)(a1 + 32);
    id v29 = v7;
    id v30 = v5;
    id v31 = v10;
    id v32 = v11;
    id v12 = v11;
    id v13 = v10;
    id v14 = v5;
    id v15 = v7;
    v16 = (void *)MEMORY[0x1C8778060](v28);
    uint64_t v17 = *(void *)(a1 + 32);
    v18 = *(NSObject **)(v17 + 32);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __34__RCBlockScheduler_scheduleBlock___block_invoke_5;
    v25[3] = &unk_1E6496F40;
    id v26 = v16;
    v27 = v39;
    v25[4] = v17;
    id v19 = v16;
    dispatch_source_set_event_handler(v18, v25);
    uint64_t v20 = MEMORY[0x1C8778060](v12);
    uint64_t v21 = *(void *)(a1 + 32);
    v22 = *(void **)(v21 + 48);
    *(void *)(v21 + 48) = v20;

    v23 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    dispatch_time_t v24 = dispatch_time(0, 0);
    dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, 0);

    _Block_object_dispose(v39, 8);
  }
}

void __34__RCBlockScheduler_scheduleBlock___block_invoke_1(uint64_t a1)
{
}

uint64_t __34__RCBlockScheduler_scheduleBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
}

void __34__RCBlockScheduler_scheduleBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 32);
  dispatch_time_t v3 = dispatch_time(*(void *)(v1 + 40), (uint64_t)(*(double *)(v1 + 64) * 1000000000.0));
  dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
}

void __34__RCBlockScheduler_scheduleBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  *(void *)(*(void *)(a1 + 32) + 40) = dispatch_time(0, 0);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  dispatch_async(*(dispatch_queue_t *)(a1 + 48), *(dispatch_block_t *)(a1 + 56));
  id v5 = *(NSObject **)(a1 + 40);
  id v6 = *(NSObject **)(a1 + 48);
  id v7 = *(void **)(a1 + 64);
  dispatch_group_notify(v5, v6, v7);
}

void __34__RCBlockScheduler_scheduleBlock___block_invoke_5(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) firstObject];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[4];
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    [*(id *)(v5 + 8) removeObjectAtIndex:0];
    id v6 = *(void (**)(void))(a1[5] + 16);
    v6();
  }
  else
  {
    id v7 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = 0;

    id v8 = *(NSObject **)(a1[4] + 32);
    dispatch_source_set_timer(v8, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_schedulerBlock, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_schedulerQueue, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end