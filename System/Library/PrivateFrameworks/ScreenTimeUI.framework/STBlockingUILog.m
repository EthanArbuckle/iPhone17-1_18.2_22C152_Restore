@interface STBlockingUILog
+ (OS_os_log)log;
@end

@implementation STBlockingUILog

+ (OS_os_log)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global);
  }
  v2 = (void *)log_log;

  return (OS_os_log *)v2;
}

uint64_t __22__STBlockingUILog_log__block_invoke()
{
  log_log = (uint64_t)os_log_create("com.apple.ScreenTimeUI", "blockingUI");

  return MEMORY[0x270F9A758]();
}

@end