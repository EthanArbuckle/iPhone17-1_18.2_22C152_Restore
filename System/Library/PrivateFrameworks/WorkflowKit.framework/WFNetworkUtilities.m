@interface WFNetworkUtilities
+ (BOOL)isAirplaneModeEnabled;
@end

@implementation WFNetworkUtilities

+ (BOOL)isAirplaneModeEnabled
{
  v2 = softLinkSCPreferencesCreate(*MEMORY[0x1E4F1CF80], @"com.apple.wifikit", @"com.apple.radios.plist");
  Value = softLinkSCPreferencesGetValue((uint64_t)v2, @"AirplaneMode");
  return [Value BOOLValue];
}

@end