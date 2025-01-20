@interface RMUILog
+ (OS_os_log)configurationInterface;
+ (OS_os_log)pluginViewModelProvider;
+ (OS_os_log)profilesViewModelProvider;
@end

@implementation RMUILog

+ (OS_os_log)configurationInterface
{
  if (configurationInterface_onceToken != -1) {
    dispatch_once(&configurationInterface_onceToken, &__block_literal_global);
  }
  v2 = (void *)configurationInterface_result;

  return (OS_os_log *)v2;
}

uint64_t __57__RMUILog_configurationInterface__configurationInterface__block_invoke()
{
  configurationInterface_result = (uint64_t)os_log_create("com.apple.remotemanagementd", "configurationInterface");

  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)profilesViewModelProvider
{
  if (profilesViewModelProvider_onceToken != -1) {
    dispatch_once(&profilesViewModelProvider_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)profilesViewModelProvider_result;

  return (OS_os_log *)v2;
}

uint64_t __63__RMUILog_profilesViewModelProvider__profilesViewModelProvider__block_invoke()
{
  profilesViewModelProvider_result = (uint64_t)os_log_create("com.apple.remotemanagementd", "profilesViewModelProvider");

  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)pluginViewModelProvider
{
  if (pluginViewModelProvider_onceToken != -1) {
    dispatch_once(&pluginViewModelProvider_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)pluginViewModelProvider_result;

  return (OS_os_log *)v2;
}

uint64_t __59__RMUILog_pluginViewModelProvider__pluginViewModelProvider__block_invoke()
{
  pluginViewModelProvider_result = (uint64_t)os_log_create("com.apple.remotemanagementd", "pluginViewModelProvider");

  return MEMORY[0x270F9A758]();
}

@end