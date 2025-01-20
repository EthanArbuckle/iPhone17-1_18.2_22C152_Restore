@interface NSLocale(WeatherCore)
+ (uint64_t)wc_setPreferredTemperatureUnit:()WeatherCore;
@end

@implementation NSLocale(WeatherCore)

+ (uint64_t)wc_setPreferredTemperatureUnit:()WeatherCore
{
  return objc_msgSend(MEMORY[0x1E4F1CA20], "_setPreferredTemperatureUnit:");
}

@end