@interface PLActivityScheduler
+ (id)sharedInstance;
- (NSMutableDictionary)activities;
- (OS_dispatch_queue)workQueue;
- (PLActivityScheduler)init;
- (id)lastCompletedDateWithIdentifier:(id)a3;
- (void)cancelActivityWithIdentifier:(id)a3;
- (void)scheduleActivityWithIdentifier:(id)a3 withCriteria:(id)a4 withMustRunCriterion:(id)a5 withQueue:(id)a6 withInterruptBlock:(id)a7 withActivityBlock:(id)a8;
- (void)setActivities:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation PLActivityScheduler

void __55__PLActivityScheduler_lastCompletedDateWithIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activities];
  id v5 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v5)
  {
    v3 = [v5 lastCompletedDate];
  }
  else
  {
    v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v3);
  v4 = v5;
  if (v5)
  {

    v4 = v5;
  }
}

- (NSMutableDictionary)activities
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PLActivityScheduler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

- (id)lastCompletedDateWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v5 = [(PLActivityScheduler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PLActivityScheduler_lastCompletedDateWithIdentifier___block_invoke;
  block[3] = &unk_1E62539E0;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_async_and_wait(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

uint64_t __37__PLActivityScheduler_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (PLActivityScheduler)init
{
  v8.receiver = self;
  v8.super_class = (Class)PLActivityScheduler;
  v2 = [(PLActivityScheduler *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    activities = v2->_activities;
    v2->_activities = (NSMutableDictionary *)v3;

    uint64_t v5 = +[PLUtilities workQueueForClass:objc_opt_class()];
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)scheduleActivityWithIdentifier:(id)a3 withCriteria:(id)a4 withMustRunCriterion:(id)a5 withQueue:(id)a6 withInterruptBlock:(id)a7 withActivityBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = +[PowerlogCore sharedCore];
  v21 = [v20 storage];
  char v22 = [v21 storageLocked];

  if ((v22 & 1) == 0)
  {
    v23 = [[PLActivity alloc] initWithIdentifier:v14 withCriteria:v15 withMustRunCriterion:v16 withQueue:v17 withInterruptBlock:v18 withActivityBlock:v19];
    if (v23)
    {
      v24 = [(PLActivityScheduler *)self workQueue];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __135__PLActivityScheduler_scheduleActivityWithIdentifier_withCriteria_withMustRunCriterion_withQueue_withInterruptBlock_withActivityBlock___block_invoke;
      v25[3] = &unk_1E62539B8;
      v25[4] = self;
      v26 = v23;
      dispatch_async_and_wait(v24, v25);
    }
  }
}

uint64_t __135__PLActivityScheduler_scheduleActivityWithIdentifier_withCriteria_withMustRunCriterion_withQueue_withInterruptBlock_withActivityBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) activities];
  id v4 = [*(id *)(a1 + 40) identifier];
  [v3 setObject:v2 forKeyedSubscript:v4];

  uint64_t v5 = *(void **)(a1 + 40);
  return [v5 setEnabled:1];
}

- (void)cancelActivityWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = +[PowerlogCore sharedCore];
    id v6 = [v5 storage];
    char v7 = [v6 storageLocked];

    if ((v7 & 1) == 0)
    {
      objc_super v8 = [(PLActivityScheduler *)self workQueue];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __52__PLActivityScheduler_cancelActivityWithIdentifier___block_invoke;
      v9[3] = &unk_1E62539B8;
      v9[4] = self;
      id v10 = v4;
      dispatch_async_and_wait(v8, v9);
    }
  }
}

void __52__PLActivityScheduler_cancelActivityWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activities];
  id v5 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = v5;
  if (v5)
  {
    [v5 setEnabled:0];
    id v4 = [*(id *)(a1 + 32) activities];
    [v4 removeObjectForKey:*(void *)(a1 + 40)];

    uint64_t v3 = v5;
  }
}

- (void)setActivities:(id)a3
{
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_activities, 0);
}

@end