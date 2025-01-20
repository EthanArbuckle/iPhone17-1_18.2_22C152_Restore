@interface PCLog
+ (OS_os_log)interfaceManager;
+ (OS_os_log)timer;
+ (OS_os_log)usabilityMonitor;
+ (OS_os_log)wakeManager;
+ (id)logWithCategory:(const char *)a3;
@end

@implementation PCLog

+ (OS_os_log)timer
{
  if (timer_onceToken != -1) {
    dispatch_once(&timer_onceToken, &__block_literal_global_6_0);
  }
  v2 = (void *)timer___log;
  return (OS_os_log *)v2;
}

+ (OS_os_log)wakeManager
{
  if (wakeManager_onceToken != -1) {
    dispatch_once(&wakeManager_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)wakeManager___log;
  return (OS_os_log *)v2;
}

+ (id)logWithCategory:(const char *)a3
{
  os_log_t v3 = os_log_create("com.apple.PersistentConnection", a3);
  return v3;
}

+ (OS_os_log)usabilityMonitor
{
  if (usabilityMonitor_onceToken != -1) {
    dispatch_once(&usabilityMonitor_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)usabilityMonitor___log;
  return (OS_os_log *)v2;
}

uint64_t __25__PCLog_usabilityMonitor__block_invoke()
{
  usabilityMonitor___log = (uint64_t)os_log_create("com.apple.PersistentConnection", "usabilityMonitor");
  return MEMORY[0x1F41817F8]();
}

uint64_t __20__PCLog_wakeManager__block_invoke()
{
  wakeManager___log = (uint64_t)os_log_create("com.apple.PersistentConnection", "wakeManager");
  return MEMORY[0x1F41817F8]();
}

uint64_t __14__PCLog_timer__block_invoke()
{
  timer___log = (uint64_t)os_log_create("com.apple.PersistentConnection", "timer");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)interfaceManager
{
  if (interfaceManager_onceToken != -1) {
    dispatch_once(&interfaceManager_onceToken, &__block_literal_global_9_0);
  }
  v2 = (void *)interfaceManager___log;
  return (OS_os_log *)v2;
}

uint64_t __25__PCLog_interfaceManager__block_invoke()
{
  interfaceManager___log = (uint64_t)os_log_create("com.apple.PersistentConnection", "interfaceManager");
  return MEMORY[0x1F41817F8]();
}

@end