@interface SWCServiceSettings
@end

@implementation SWCServiceSettings

void __41___SWCServiceSettings_notificationCenter__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28EB8]);
  v3 = (void *)_MergedGlobals_0;
  _MergedGlobals_0 = (uint64_t)v2;

  if (_SWCServerIsUsingTestListener())
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:*(void *)(a1 + 32) selector:sel_serviceSettingsDidChange_ name:@"com.apple.swc.internalUseOnly.serviceSettingsDidChangeNotification" object:0];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v4 addObserver:*(void *)(a1 + 32) selector:sel_serviceSettingsDidChange_ name:@"com.apple.swc.internalUseOnly.serviceSettingsDidChangeNotification" object:0 suspensionBehavior:4];
  }
}

void __65___SWCServiceSettings_serviceSettingsWithServiceSpecifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __65___SWCServiceSettings_serviceSettingsWithServiceSpecifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t __58___SWCServiceSettings_objectForKey_ofClass_valuesOfClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void __44___SWCServiceSettings_commitReturningError___block_invoke(uint64_t a1, void *a2)
{
}

void __44___SWCServiceSettings_commitReturningError___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1[5] + 8);
  if (v11)
  {
    *(unsigned char *)(v6 + 24) = 1;
    uint64_t v7 = (void **)(a1[4] + 32);
    v8 = v11;
  }
  else
  {
    *(unsigned char *)(v6 + 24) = 0;
    uint64_t v7 = (void **)(*(void *)(a1[6] + 8) + 40);
    v8 = v5;
  }
  id v9 = v8;
  v10 = *v7;
  *uint64_t v7 = v9;
}

void __65___SWCServiceSettings_postChangeNotificationForServiceSpecifier___block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("_SWCServiceSettings notification queue", v2);
  v1 = (void *)qword_1EB67B070;
  qword_1EB67B070 = (uint64_t)v0;
}

void __65___SWCServiceSettings_postChangeNotificationForServiceSpecifier___block_invoke_2(uint64_t a1)
{
  if (_SWCServerIsUsingTestListener())
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"com.apple.swc.internalUseOnly.serviceSettingsDidChangeNotification" object:0 userInfo:*(void *)(a1 + 32)];
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v2 postNotificationName:@"com.apple.swc.internalUseOnly.serviceSettingsDidChangeNotification" object:0 userInfo:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  }
}

void __71___SWCServiceSettings_Removal__removeObjectsForKeys_serviceType_error___block_invoke(uint64_t a1, void *a2)
{
}

void __71___SWCServiceSettings_Removal__removeObjectsForKeys_serviceType_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __76___SWCServiceSettings_Removal__removeObjectsForKeys_serviceSpecifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __76___SWCServiceSettings_Removal__removeObjectsForKeys_serviceSpecifier_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

@end