@interface VUIPreference
+ (BOOL)ignoreHTTPCache;
+ (void)setupJSCoreConsoleLogging;
@end

@implementation VUIPreference

+ (void)setupJSCoreConsoleLogging
{
  if (setupJSCoreConsoleLogging_onceToken != -1) {
    dispatch_once(&setupJSCoreConsoleLogging_onceToken, &__block_literal_global_12);
  }
}

+ (BOOL)ignoreHTTPCache
{
  if (ignoreHTTPCache_onceToken != -1) {
    dispatch_once(&ignoreHTTPCache_onceToken, &__block_literal_global_12);
  }
  return ignoreHTTPCache_sIgnoreHTTPCache;
}

uint64_t __42__VUIPreference_setupJSCoreConsoleLogging__block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"LogJSConsole", @"com.apple.ITMLKit", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    return JSRemoteInspectorSetLogToSystemConsole();
  }
  return result;
}

void __32__VUIPreference_ignoreHTTPCache__block_invoke()
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"IgnoreHTTPCache", @"com.apple.ITMLKit", 0);
  ignoreHTTPCache_sIgnoreHTTPCache = AppBooleanValue != 0;
  if (!AppBooleanValue)
  {
    v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    ignoreHTTPCache_sIgnoreHTTPCache = [v1 BOOLForKey:@"IgnoreLocalHTTPCache"];

    if (!ignoreHTTPCache_sIgnoreHTTPCache)
    {
      v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
      v3 = (void *)SecTaskCopyValueForEntitlement(v2, @"get-task-allow", 0);
      CFRelease(v2);
      if (objc_opt_respondsToSelector()) {
        char v4 = [v3 BOOLValue];
      }
      else {
        char v4 = 0;
      }
      ignoreHTTPCache_sIgnoreHTTPCache = v4;
    }
  }
  v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __32__VUIPreference_ignoreHTTPCache__block_invoke_cold_1(v5);
  }
}

void __32__VUIPreference_ignoreHTTPCache__block_invoke_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = ignoreHTTPCache_sIgnoreHTTPCache;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Setting [%d] for Ignore HTTP Cache", (uint8_t *)v1, 8u);
}

@end