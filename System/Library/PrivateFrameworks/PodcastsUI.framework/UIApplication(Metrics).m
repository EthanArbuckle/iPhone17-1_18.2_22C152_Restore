@interface UIApplication(Metrics)
- (id)_metricsQueue;
- (void)recordAppCloseEvent:()Metrics;
- (void)recordAppOpenEvent:()Metrics;
- (void)recordMemoryWarning:()Metrics;
- (void)subscribeToLifecycleEventNotifications;
- (void)unsubscribeFromLifecycleEventNotifications;
@end

@implementation UIApplication(Metrics)

- (void)recordAppOpenEvent:()Metrics
{
  id v4 = a3;
  v5 = [v4 name];
  v6 = [v4 object];
  if (v5 == (void *)*MEMORY[0x1E4F91EE8])
  {
    v11 = 0;
    v9 = 0;
    uint64_t v12 = 1;
  }
  else
  {
    v7 = [v4 userInfo];
    v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB26A8]];

    if (v8)
    {
      v9 = [v8 absoluteString];
      v10 = [v4 userInfo];
      v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB26A0]];

      uint64_t v12 = 2;
    }
    else
    {
      v11 = 0;
      v9 = 0;
      if ([v6 applicationState] == 2) {
        uint64_t v12 = 3;
      }
      else {
        uint64_t v12 = 0;
      }
    }
  }
  v13 = [a1 _metricsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__UIApplication_Metrics__recordAppOpenEvent___block_invoke;
  block[3] = &unk_1E6E20B70;
  id v18 = v9;
  uint64_t v19 = v12;
  id v17 = v11;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v13, block);
}

- (id)_metricsQueue
{
  if (_metricsQueue_onceToken != -1) {
    dispatch_once(&_metricsQueue_onceToken, &__block_literal_global_17);
  }
  v0 = (void *)_metricsQueue_metricsQueue;

  return v0;
}

- (void)subscribeToLifecycleEventNotifications
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:a1 selector:sel_recordAppOpenEvent_ name:*MEMORY[0x1E4F91ED8] object:0];

  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:a1 selector:sel_recordAppOpenEvent_ name:*MEMORY[0x1E4F91EE8] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:a1 selector:sel_recordAppCloseEvent_ name:*MEMORY[0x1E4F91ED0] object:0];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:a1 selector:sel_recordAppCloseEvent_ name:*MEMORY[0x1E4F91EF8] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:a1 selector:sel_recordMemoryWarning_ name:*MEMORY[0x1E4F91EE0] object:0];
}

- (void)unsubscribeFromLifecycleEventNotifications
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:a1];
}

- (void)recordAppCloseEvent:()Metrics
{
  id v5 = [a3 name];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F91F20]) initWithReason:v5 == (id)*MEMORY[0x1E4F91ED0]];
  [MEMORY[0x1E4F91F18] recordEvent:v3];
  if ([MEMORY[0x1E4F91FC8] isRunningOnTV]) {
    id v4 = (id)[MEMORY[0x1E4F91F18] flushImmediately];
  }
}

- (void)recordMemoryWarning:()Metrics
{
  v1 = [a1 _metricsQueue];
  dispatch_async(v1, &__block_literal_global_18);
}

@end