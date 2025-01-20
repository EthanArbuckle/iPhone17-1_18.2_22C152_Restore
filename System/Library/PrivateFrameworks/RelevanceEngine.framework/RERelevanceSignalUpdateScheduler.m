@interface RERelevanceSignalUpdateScheduler
- (id)_init;
- (void)_queue_updateBlocks;
- (void)_rescheduleTimer;
- (void)_updateBlocks;
- (void)dealloc;
- (void)scheduleEventWithIdentifier:(id)a3 updateFrequency:(double)a4 completion:(id)a5;
- (void)unscheduleEventWithIdentifier:(id)a3;
@end

@implementation RERelevanceSignalUpdateScheduler

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)RERelevanceSignalUpdateScheduler;
  v2 = [(RESingleton *)&v10 _init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.RelevanceEngine.SignalUpdateScheduler", 0);
    v4 = (void *)v2[2];
    v2[2] = v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    v6 = (void *)v2[1];
    v2[1] = v5;

    *((unsigned char *)v2 + 40) = 0;
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    v8 = RESignificantTimeChangeNotification();
    [v7 addObserver:v2 selector:sel__updateBlocks name:v8 object:0];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RERelevanceSignalUpdateScheduler;
  [(RERelevanceSignalUpdateScheduler *)&v4 dealloc];
}

- (void)scheduleEventWithIdentifier:(id)a3 updateFrequency:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = v9;
  if (v8 && v9)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __91__RERelevanceSignalUpdateScheduler_scheduleEventWithIdentifier_updateFrequency_completion___block_invoke;
    v12[3] = &unk_2644BDDD8;
    v12[4] = self;
    id v13 = v8;
    double v15 = a4;
    id v14 = v10;
    dispatch_async(queue, v12);
  }
}

void __91__RERelevanceSignalUpdateScheduler_scheduleEventWithIdentifier_updateFrequency_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v2) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Event with name %@ already specified", v3, v4, v5, v6, v7, v8, *(void *)(a1 + 40));
  }
  id v9 = objc_opt_new();
  id v13 = v9;
  double v10 = *(double *)(a1 + 56);
  if (v10 < 0.0) {
    double v10 = -v10;
  }
  [v9 setInterval:v10];
  [v13 setCompletion:*(void *)(a1 + 48)];
  v11 = [MEMORY[0x263EFF910] date];
  v12 = [v11 dateByAddingTimeInterval:-0.1];
  [v13 setLastFireDate:v12];

  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v13 forKeyedSubscript:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  [*(id *)(a1 + 32) _rescheduleTimer];
}

- (void)unscheduleEventWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__RERelevanceSignalUpdateScheduler_unscheduleEventWithIdentifier___block_invoke;
  v7[3] = &unk_2644BC688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __66__RERelevanceSignalUpdateScheduler_unscheduleEventWithIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  v2 = *(void **)(a1 + 32);
  return [v2 _rescheduleTimer];
}

- (void)_rescheduleTimer
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__RERelevanceSignalUpdateScheduler__rescheduleTimer__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

void __52__RERelevanceSignalUpdateScheduler__rescheduleTimer__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 40))
  {
    [*(id *)(v1 + 24) invalidate];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
    if ([*(id *)(*(void *)(a1 + 32) + 8) count])
    {
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2020000000;
      uint64_t v25 = 0;
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x2020000000;
      char v21 = 0;
      uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __52__RERelevanceSignalUpdateScheduler__rescheduleTimer__block_invoke_2;
      v19[3] = &unk_2644BDE00;
      v19[4] = v20;
      v19[5] = &v22;
      [v5 enumerateKeysAndObjectsUsingBlock:v19];
      unint64_t v6 = v23[3];
      uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 32);
      if (!v7)
      {
        uint64_t v8 = [MEMORY[0x263EFF910] date];
        uint64_t v9 = *(void *)(a1 + 32);
        double v10 = *(void **)(v9 + 32);
        *(void *)(v9 + 32) = v8;

        uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 32);
      }
      v11 = [v7 dateByAddingTimeInterval:(double)v6 / 1000.0];
      objc_initWeak(&location, *(id *)(a1 + 32));
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 16);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __52__RERelevanceSignalUpdateScheduler__rescheduleTimer__block_invoke_3;
      v16[3] = &unk_2644BC700;
      objc_copyWeak(&v17, &location);
      uint64_t v13 = +[REUpNextTimer timerWithFireDate:v11 queue:v12 block:v16];
      uint64_t v14 = *(void *)(a1 + 32);
      double v15 = *(void **)(v14 + 24);
      *(void *)(v14 + 24) = v13;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);

      _Block_object_dispose(v20, 8);
      _Block_object_dispose(&v22, 8);
    }
  }
}

uint64_t __52__RERelevanceSignalUpdateScheduler__rescheduleTimer__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t result = [a3 interval];
    unint64_t v7 = (unint64_t)(v6 * 1000.0);
    if (v7)
    {
      do
      {
        unint64_t v8 = v7;
        unint64_t v7 = v4 % v7;
        unint64_t v4 = v8;
      }
      while (v7);
    }
    else
    {
      unint64_t v8 = v4;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  }
  else
  {
    uint64_t result = [a3 interval];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (unint64_t)(v9 * 1000.0);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

void __52__RERelevanceSignalUpdateScheduler__rescheduleTimer__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_updateBlocks");
}

- (void)_updateBlocks
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__RERelevanceSignalUpdateScheduler__updateBlocks__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__RERelevanceSignalUpdateScheduler__updateBlocks__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateBlocks");
}

- (void)_queue_updateBlocks
{
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  [(NSDate *)v3 timeIntervalSinceReferenceDate];
  updateBlocks = self->_updateBlocks;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__RERelevanceSignalUpdateScheduler__queue_updateBlocks__block_invoke;
  v7[3] = &__block_descriptor_40_e51_v32__0__NSString_8___RESignalScheduledUpdate_16_B24l;
  v7[4] = v5;
  [(NSMutableDictionary *)updateBlocks enumerateKeysAndObjectsUsingBlock:v7];
  lastFireDate = self->_lastFireDate;
  self->_lastFireDate = v3;

  [(RERelevanceSignalUpdateScheduler *)self _rescheduleTimer];
}

void __55__RERelevanceSignalUpdateScheduler__queue_updateBlocks__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  [v12 interval];
  double v5 = v4;
  double v6 = [v12 lastFireDate];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = *(double *)(a1 + 32);
  if (v8 - v7 > v5)
  {
    do
    {
      double v9 = v7;
      double v7 = v5 + v7;
    }
    while (v7 < v8);
    double v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v9];
    [v12 setLastFireDate:v10];

    v11 = [v12 completion];
    v11[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFireDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
}

@end