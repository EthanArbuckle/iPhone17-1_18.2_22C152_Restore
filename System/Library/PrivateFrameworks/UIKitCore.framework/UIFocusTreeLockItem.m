@interface UIFocusTreeLockItem
@end

@implementation UIFocusTreeLockItem

uint64_t __63___UIFocusTreeLockItem_initWithEnvironment_finalUnlockHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 64))
  {
    if (os_variant_has_internal_diagnostics())
    {
      v5 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 56);
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        uint64_t v11 = *(void *)(a1 + 32);
        double v12 = Current - *(double *)(v11 + 72);
        int v13 = 138412802;
        uint64_t v14 = v9;
        __int16 v15 = 2048;
        double v16 = v12;
        __int16 v17 = 2112;
        uint64_t v18 = v11;
        _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "Locked environment %@ was deallocated after being locked for %.2f seconds. This should never happen. Additional info:\n%@", (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_FocusTreeLockVerboseLogging_block_invoke___s_category)+ 8);
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        return [*(id *)(a1 + 32) _cleanup:1];
      }
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 56);
      v5 = v3;
      CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent();
      uint64_t v7 = *(void *)(a1 + 32);
      double v8 = v6 - *(double *)(v7 + 72);
      int v13 = 138412802;
      uint64_t v14 = v4;
      __int16 v15 = 2048;
      double v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v7;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Locked environment %@ was deallocated after being locked for %.2f seconds. This should never happen. Additional info:\n%@", (uint8_t *)&v13, 0x20u);
    }
  }
  return [*(id *)(a1 + 32) _cleanup:1];
}

@end