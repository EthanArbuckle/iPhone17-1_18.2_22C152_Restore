@interface PAProcessStateMonitor
+ (id)sharedInstance;
- (id)startMonitoringVisibilityStateForBundleIdentifiers:(id)a3 onQueue:(id)a4 withDelegate:(id)a5;
@end

@implementation PAProcessStateMonitor

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_instance_0;

  return v2;
}

uint64_t __39__PAProcessStateMonitor_sharedInstance__block_invoke()
{
  sharedInstance_instance_0 = objc_alloc_init(PAProcessStateMonitor);

  return MEMORY[0x1F41817F8]();
}

- (id)startMonitoringVisibilityStateForBundleIdentifiers:(id)a3 onQueue:(id)a4 withDelegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    objc_initWeak(&location, v9);
    v10 = (void *)MEMORY[0x1E4F96418];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __97__PAProcessStateMonitor_startMonitoringVisibilityStateForBundleIdentifiers_onQueue_withDelegate___block_invoke;
    v13[3] = &unk_1E5D70EE8;
    id v14 = v7;
    id v15 = v8;
    objc_copyWeak(&v16, &location);
    v11 = [v10 monitorWithConfiguration:v13];
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __97__PAProcessStateMonitor_startMonitoringVisibilityStateForBundleIdentifiers_onQueue_withDelegate___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifiers:*(void *)(a1 + 32)];
  v12[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v3 setPredicates:v5];

  v6 = [MEMORY[0x1E4F96448] descriptor];
  v11 = @"com.apple.frontboard.visibility";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  [v6 setEndowmentNamespaces:v7];

  [v3 setStateDescriptor:v6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__PAProcessStateMonitor_startMonitoringVisibilityStateForBundleIdentifiers_onQueue_withDelegate___block_invoke_2;
  v8[3] = &unk_1E5D70EC0;
  id v9 = *(id *)(a1 + 40);
  objc_copyWeak(&v10, (id *)(a1 + 48));
  [v3 setUpdateHandler:v8];
  objc_destroyWeak(&v10);
}

void __97__PAProcessStateMonitor_startMonitoringVisibilityStateForBundleIdentifiers_onQueue_withDelegate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = [a3 bundle];
  id v8 = [v7 identifier];

  if (v8)
  {
    id v9 = [v6 state];
    id v10 = [v9 endowmentNamespaces];
    int v11 = [v10 containsObject:@"com.apple.frontboard.visibility"];

    if (v11) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
    v13 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__PAProcessStateMonitor_startMonitoringVisibilityStateForBundleIdentifiers_onQueue_withDelegate___block_invoke_3;
    block[3] = &unk_1E5D70E98;
    objc_copyWeak(v16, (id *)(a1 + 40));
    v16[1] = (id)v12;
    id v15 = v8;
    dispatch_async(v13, block);

    objc_destroyWeak(v16);
  }
}

void __97__PAProcessStateMonitor_startMonitoringVisibilityStateForBundleIdentifiers_onQueue_withDelegate___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setVisibilityState:*(void *)(a1 + 48) forBundleID:*(void *)(a1 + 32)];
}

@end