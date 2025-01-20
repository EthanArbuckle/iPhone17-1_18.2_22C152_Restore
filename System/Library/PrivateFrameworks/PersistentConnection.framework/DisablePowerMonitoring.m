@interface DisablePowerMonitoring
@end

@implementation DisablePowerMonitoring

void ___DisablePowerMonitoring_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = +[PCLog timer];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = [(id)sPowerMonitoringTimers count] - 1;
    _os_log_impl(&dword_1D340D000, v2, OS_LOG_TYPE_DEFAULT, "Disabling power monitoring for %{public}@ - %lu timers", (uint8_t *)&v6, 0x16u);
  }

  [(id)sPowerMonitoringTimers removeObject:*(void *)(a1 + 32)];
  if (![(id)sPowerMonitoringTimers count])
  {
    v4 = +[PCLog timer];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1D340D000, v4, OS_LOG_TYPE_DEFAULT, "PCSimpleTimer - no timers left, disabling power monitoring", (uint8_t *)&v6, 2u);
    }

    v5 = (void *)sPowerMonitoringTimers;
    sPowerMonitoringTimers = 0;

    if (sPMConnection)
    {
      IODeregisterForSystemPower(sPMNotifier);
      IONotificationPortDestroy((IONotificationPortRef)sPMPort);
      IOServiceClose(sPMConnection);
      sPMConnection = 0;
    }
  }
}

@end