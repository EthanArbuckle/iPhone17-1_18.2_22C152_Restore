@interface _UIOClientAction
- (void)handleClientActionToOverlayService:(id)a3;
@end

@implementation _UIOClientAction

- (void)handleClientActionToOverlayService:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    v5 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    v8 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v8);
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 2048;
    v12 = self;
    _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "_UIOClientAction subclass <%@: %p> did not override -handleClientActionToOverlayService:", (uint8_t *)&v9, 0x16u);
  }
  else
  {
    v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &handleClientActionToOverlayService____s_category) + 8);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      return;
    }
    v5 = v4;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 2048;
    v12 = self;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "_UIOClientAction subclass <%@: %p> did not override -handleClientActionToOverlayService:", (uint8_t *)&v9, 0x16u);
  }

LABEL_5:
}

@end