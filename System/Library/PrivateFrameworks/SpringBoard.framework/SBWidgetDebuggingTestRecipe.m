@interface SBWidgetDebuggingTestRecipe
+ (id)__systemService;
- (id)title;
- (void)_openNotificationCenter;
@end

@implementation SBWidgetDebuggingTestRecipe

- (id)title
{
  return @"Trigger NC for debugging";
}

+ (id)__systemService
{
  if (__systemService_onceToken != -1) {
    dispatch_once(&__systemService_onceToken, &__block_literal_global_73);
  }
  v2 = (void *)__systemService___systemService;
  return v2;
}

void __46__SBWidgetDebuggingTestRecipe___systemService__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F62AF8]);
  v1 = (void *)__systemService___systemService;
  __systemService___systemService = (uint64_t)v0;
}

- (void)_openNotificationCenter
{
  v3 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SBWidgetDebuggingTestRecipe__openNotificationCenter__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __54__SBWidgetDebuggingTestRecipe__openNotificationCenter__block_invoke()
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v0 = objc_msgSend((id)objc_opt_class(), "__systemService");
  uint64_t v6 = *MEMORY[0x1E4F62618];
  uint64_t v1 = *MEMORY[0x1E4F62588];
  v4[0] = *MEMORY[0x1E4F62580];
  v4[1] = v1;
  v5[0] = @"com.apple.TodayViewWidget";
  v5[1] = @"com.apple.widget-extension";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v7[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v0 openApplication:@"com.apple.springboard" options:v3 withResult:&__block_literal_global_14_0];
}

void __54__SBWidgetDebuggingTestRecipe__openNotificationCenter__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = SBLogCommon();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4) {
      __54__SBWidgetDebuggingTestRecipe__openNotificationCenter__block_invoke_2_cold_2((uint64_t)v2, v3);
    }
  }
  else if (v4)
  {
    __54__SBWidgetDebuggingTestRecipe__openNotificationCenter__block_invoke_2_cold_1(v3);
  }
}

void __54__SBWidgetDebuggingTestRecipe__openNotificationCenter__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Succeeded in launching Notification Center for testing", v1, 2u);
}

void __54__SBWidgetDebuggingTestRecipe__openNotificationCenter__block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to launch Notification Center for testing: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end