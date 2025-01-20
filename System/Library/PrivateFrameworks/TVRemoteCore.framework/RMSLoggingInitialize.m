@interface RMSLoggingInitialize
@end

@implementation RMSLoggingInitialize

void ___RMSLoggingInitialize_block_invoke()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CPLoggingSetMaxConsoleLevel();
  CPLoggingSetLogName();
  if (MGGetBoolAnswer())
  {
    v0 = NSString;
    v7 = @"/";
    v8 = @"var";
    v9 = @"mobile";
    v10 = @"Library";
    v11 = @"Logs";
    v12 = @"TVRemoteMediaServices";
    v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:6];
    v2 = [v0 pathWithComponents:v1];
  }
  else
  {
    v1 = (__CFString *)CPLoggingCopyLogDirectory();
    v3 = NSString;
    v7 = v1;
    v8 = @"TVRemoteMediaServices";
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:2];
    v2 = [v3 pathWithComponents:v4];
  }
  CPLoggingSetLogDirectory();
  CFRelease(v2);
  CPLoggingSetCreateLogFormatBlock();
  _RMSInitializeLogLevel();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_RMSLogLevelChangedHandler, @"com.apple.TVRemoteMediaServices.LogLevelChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, 0, (CFNotificationCallback)_RMSLogLevelChangedHandler, @"com.apple.ManagedConfiguration.profileListChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

CFStringRef ___RMSLoggingInitialize_block_invoke_2(int a1, int a2, CFDateRef date, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (_RMSLogDateFormat_once != -1) {
    dispatch_once(&_RMSLogDateFormat_once, &__block_literal_global_37_0);
  }
  CFStringRef StringWithDate = CFDateFormatterCreateStringWithDate(0, (CFDateFormatterRef)_RMSLogDateFormat_dateFormatter, date);
  CFStringRef v13 = StringWithDate;
  if ((a2 - 3) > 4) {
    v14 = @"Unknown";
  }
  else {
    v14 = off_2647AF0C0[a2 - 3];
  }
  CFStringRef v15 = CFStringCreateWithFormat(0, 0, @"%@ [%@] %@", StringWithDate, v14, a10);
  CFRelease(v13);
  return v15;
}

@end