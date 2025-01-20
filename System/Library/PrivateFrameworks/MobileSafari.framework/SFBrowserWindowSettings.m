@interface SFBrowserWindowSettings
@end

@implementation SFBrowserWindowSettings

void __36___SFBrowserWindowSettings_settings__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedSettingsInstance;
  sharedSettingsInstance = (uint64_t)v1;
}

uint64_t __60___SFBrowserWindowSettings_validateWindowSettingsWithUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqual:a2];
}

void __65___SFBrowserWindowSettings__initializeSettingsDictionaryIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 mutableCopy];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v6 forKeyedSubscript:v5];
}

uint64_t __39___SFBrowserWindowSettings_synchronize__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _synchronizeNow];
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  return result;
}

@end