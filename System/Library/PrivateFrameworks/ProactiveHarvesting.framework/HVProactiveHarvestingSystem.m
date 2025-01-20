@interface HVProactiveHarvestingSystem
+ (void)startWithConfigurationAsset:(id)a3;
@end

@implementation HVProactiveHarvestingSystem

+ (void)startWithConfigurationAsset:(id)a3
{
  id v3 = a3;
  v4 = hv_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_226C41000, v4, OS_LOG_TYPE_DEFAULT, "HVProactiveHarvestingSystem: start", v6, 2u);
  }

  if (v3) {
    +[HVContentAdmission registerConfigurationAsset:v3];
  }
  +[HVScheduledTasks registerScheduledTasks];
  +[HVXPCInternalServerDelegate start];
  +[HVXPCSysdiagnoseServerDelegate start];
  id v5 = +[HVDonationReceiver defaultReceiver];
}

@end