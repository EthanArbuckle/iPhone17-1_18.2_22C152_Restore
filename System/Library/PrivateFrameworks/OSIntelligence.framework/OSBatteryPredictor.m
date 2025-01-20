@interface OSBatteryPredictor
@end

@implementation OSBatteryPredictor

void __27___OSBatteryPredictor_init__block_invoke(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __27___OSBatteryPredictor_init__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void __27___OSBatteryPredictor_init__block_invoke_49(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __27___OSBatteryPredictor_init__block_invoke_49_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v11 = [v2 connection];
  [v11 invalidate];
}

void __27___OSBatteryPredictor_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __27___OSBatteryPredictor_init__block_invoke_49_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end