@interface _DASBatteryTemperatureReader
+ (id)batteryProperties;
- (id)currentValue;
- (id)lastModifiedDate;
@end

@implementation _DASBatteryTemperatureReader

+ (id)batteryProperties
{
  CFDictionaryRef v2 = IOServiceMatching((const char *)[@"IOPMPowerSource" UTF8String]);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    CFMutableDictionaryRef properties = 0;
    if (IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0)) {
      CFMutableDictionaryRef v4 = 0;
    }
    else {
      CFMutableDictionaryRef v4 = properties;
    }
  }
  else
  {
    CFMutableDictionaryRef v4 = 0;
  }

  return v4;
}

- (id)currentValue
{
  CFDictionaryRef v2 = +[_DASBatteryTemperatureReader batteryProperties];
  v3 = os_log_create("com.apple.clas", "signals");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000F4268(v2, v3);
  }

  CFMutableDictionaryRef v4 = [v2 objectForKeyedSubscript:@"Temperature"];

  return v4;
}

- (id)lastModifiedDate
{
  return 0;
}

@end