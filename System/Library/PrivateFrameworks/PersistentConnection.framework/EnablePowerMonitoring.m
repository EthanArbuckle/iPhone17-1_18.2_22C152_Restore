@interface EnablePowerMonitoring
@end

@implementation EnablePowerMonitoring

void ___EnablePowerMonitoring_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!sPowerMonitoringTimers)
  {
    v2 = +[PCLog timer];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D340D000, v2, OS_LOG_TYPE_DEFAULT, "PCSimpleTimer - enabling power monitoring", (uint8_t *)&v9, 2u);
    }

    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4 = (void *)sPowerMonitoringTimers;
    sPowerMonitoringTimers = (uint64_t)v3;

    if (!sPMConnection)
    {
      sPMConnection = IORegisterForSystemPower(0, (IONotificationPortRef *)&sPMPort, (IOServiceInterestCallback)_powerChangedHandler, sPMNotifier);
      if (sPMConnection)
      {
        v5 = dispatch_queue_create("PCSimpleTimer-IOPowerManagement", 0);
        IONotificationPortSetDispatchQueue((IONotificationPortRef)sPMPort, v5);
      }
    }
  }
  [(id)sPowerMonitoringTimers addObject:*(void *)(a1 + 32)];
  v6 = +[PCLog timer];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [(id)sPowerMonitoringTimers count];
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D340D000, v6, OS_LOG_TYPE_DEFAULT, "Enabling power monitoring for %{public}@ - %lu timers", (uint8_t *)&v9, 0x16u);
  }
}

@end