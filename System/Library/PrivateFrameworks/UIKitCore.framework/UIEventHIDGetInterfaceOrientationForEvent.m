@interface UIEventHIDGetInterfaceOrientationForEvent
@end

@implementation UIEventHIDGetInterfaceOrientationForEvent

void ___UIEventHIDGetInterfaceOrientationForEvent_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    v4 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    v5 = [*(id *)(a1 + 32) _orientationDebugDescription];
    v6 = [NSNumber numberWithUnsignedInt:IOHIDEventGetType()];
    int v7 = 138412546;
    v8 = v5;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "Unexpected window orientation: %@, event type: %@", (uint8_t *)&v7, 0x16u);
  }
  else
  {
    v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_11)+ 8);
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      return;
    }
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = [v3 _orientationDebugDescription];
    v6 = [NSNumber numberWithUnsignedInt:IOHIDEventGetType()];
    int v7 = 138412546;
    v8 = v5;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Unexpected window orientation: %@, event type: %@", (uint8_t *)&v7, 0x16u);
  }

LABEL_5:
}

@end