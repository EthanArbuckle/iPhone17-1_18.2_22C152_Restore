@interface UIDisplayObserver
@end

@implementation UIDisplayObserver

void __36___UIDisplayObserver_sharedObserver__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_1068;
  _MergedGlobals_1068 = (uint64_t)v1;
}

void __74___UIDisplayObserver_displayMonitor_didConnectIdentity_withConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(a1 + 32) pendingCarDisplays];
  v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v5)
  {
    if (a2)
    {
      [*(id *)(a1 + 32) connectDisplayWithConfiguration:v5];
    }
    else
    {
      v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("DisplayObserver", &_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_0)+ 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        int v9 = 138543362;
        uint64_t v10 = v7;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Timed out waiting for CarPlay session with display: %{public}@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  v8 = [*(id *)(a1 + 32) pendingCarDisplays];
  [v8 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

@end