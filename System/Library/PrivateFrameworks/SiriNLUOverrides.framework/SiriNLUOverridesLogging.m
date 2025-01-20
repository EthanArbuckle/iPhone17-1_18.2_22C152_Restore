@interface SiriNLUOverridesLogging
+ (BOOL)debugEnabled;
+ (void)SiriNLUOverridesLogInitIfNeeded;
@end

@implementation SiriNLUOverridesLogging

+ (void)SiriNLUOverridesLogInitIfNeeded
{
  if (SiriNLUOverridesLogInitIfNeeded_once != -1) {
    dispatch_once(&SiriNLUOverridesLogInitIfNeeded_once, &__block_literal_global);
  }
}

+ (BOOL)debugEnabled
{
  return os_log_type_enabled((os_log_t)OverridesLogContext, OS_LOG_TYPE_DEBUG);
}

uint64_t __58__SiriNLUOverridesLogging_SiriNLUOverridesLogInitIfNeeded__block_invoke()
{
  OverridesLogContext = (uint64_t)os_log_create((const char *)OverridesLoggingSubsystem, (const char *)OverridesLoggingCategory);
  return MEMORY[0x270F9A758]();
}

@end