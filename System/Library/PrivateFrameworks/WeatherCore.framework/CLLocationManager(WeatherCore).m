@interface CLLocationManager(WeatherCore)
+ (uint64_t)wc_authorizationStatus;
@end

@implementation CLLocationManager(WeatherCore)

+ (uint64_t)wc_authorizationStatus
{
  return [MEMORY[0x1E4F1E600] authorizationStatusForBundleIdentifier:@"com.apple.weather"];
}

@end