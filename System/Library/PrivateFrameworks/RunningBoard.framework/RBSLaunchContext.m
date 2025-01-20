@interface RBSLaunchContext
@end

@implementation RBSLaunchContext

void __67__RBSLaunchContext_RBLaunchChecks___recordPassesEligibilityChecks___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  v8 = *(void **)(a1 + 32);
  id v9 = a2;
  v10 = [v8 objectForKey:v9 ofClass:objc_opt_class()];

  if (v10
    && ([*(id *)(a1 + 40) _deviceIsEligibleForDomain:v7 bundleID:*(void *)(a1 + 48)] & 1) == 0)
  {
    v11 = rbs_process_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __67__RBSLaunchContext_RBLaunchChecks___recordPassesEligibilityChecks___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
  }
}

uint64_t __59__RBSLaunchContext_RBLaunchChecks___sharedPreflightManager__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.runningboardservices.regulatory", v1);
    v3 = (void *)_sharedPreflightManager_queue;
    _sharedPreflightManager_queue = (uint64_t)v2;

    id v4 = objc_alloc(MEMORY[0x263F610A8]);
    uint64_t v0 = [v4 initWithTargetQueue:_sharedPreflightManager_queue];
  }
  _sharedPreflightManager_preflightManager = v0;
  return MEMORY[0x270F9A758]();
}

uint64_t __58__RBSLaunchContext_RBLaunchChecks___needsEligibilityCheck__block_invoke()
{
  _needsEligibilityCheck_allowed = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26DAB16C8];
  return MEMORY[0x270F9A758]();
}

void __67__RBSLaunchContext_RBLaunchChecks___recordPassesEligibilityChecks___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_226AB3000, v0, v1, "device is ineligible for domain %@", v2, v3, v4, v5, v6);
}

@end