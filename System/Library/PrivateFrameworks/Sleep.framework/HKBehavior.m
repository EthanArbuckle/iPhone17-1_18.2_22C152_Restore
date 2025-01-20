@interface HKBehavior
@end

@implementation HKBehavior

void __84___HKBehavior_HKSPSleep__hksp_activePairedDeviceHasSleepAppInstalledWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_error_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_ERROR, "failed to fetch installed applications: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end