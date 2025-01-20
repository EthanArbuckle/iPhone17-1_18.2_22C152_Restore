@interface MB
@end

@implementation MB

void ___generateUART_MB_AIDB_AccessoryConnectionStatisticsEvent_block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    v8 = @"com.apple.accessories.connection.statistics";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "CoreAnalytics event: %@\neventDict: %@", (uint8_t *)&v7, 0x16u);
  }

  AnalyticsSendEvent();
  AnalyticsSendEvent();
  if (systemInfo_isInternalBuild())
  {
    v6 = +[ACCAnalytics loggerForUser:0];
    [v6 logACCAnalyticsForEventNamed:@"accessoryConnectionStatistics" withAttributes:*(void *)(a1 + 32)];
  }
}

@end