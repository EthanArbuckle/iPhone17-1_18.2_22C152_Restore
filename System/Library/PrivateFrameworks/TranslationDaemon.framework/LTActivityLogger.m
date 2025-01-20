@interface LTActivityLogger
@end

@implementation LTActivityLogger

void __46___LTActivityLogger__logAssetSnapshotForDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (([v3 hasAllData] & 1) == 0)
    {
      v5 = _LTOSLogAssets();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __46___LTActivityLogger__logAssetSnapshotForDate___block_invoke_cold_2(v5);
      }
    }
    v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __46___LTActivityLogger__logAssetSnapshotForDate___block_invoke_cold_1((uint64_t)v3, v6);
    }
    id v7 = objc_loadWeakRetained(WeakRetained + 2);
    [v7 activityLogger:WeakRetained logAssetSnapshot:v3 forDate:*(void *)(a1 + 32)];
  }
}

void __46___LTActivityLogger__logAssetSnapshotForDate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2600DC000, a2, OS_LOG_TYPE_DEBUG, "Finished collecting an asset snapshot to report in analytics: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __46___LTActivityLogger__logAssetSnapshotForDate___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Failed to collect entire snapshot of asset state, we will log what we have available", v1, 2u);
}

@end