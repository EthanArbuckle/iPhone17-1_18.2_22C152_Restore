@interface MTLoggingAnalyticsFilterManager
@end

@implementation MTLoggingAnalyticsFilterManager

void __MTLoggingAnalyticsFilterManager_block_invoke(id a1)
{
  MTLoggingAnalyticsFilterManager::__logObj = (uint64_t)os_log_create("com.apple.Multitouch.SessionFilter", "AnalyticsFilterManager");

  _objc_release_x1();
}

@end