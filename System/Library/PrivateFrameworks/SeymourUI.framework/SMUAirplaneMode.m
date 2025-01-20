@interface SMUAirplaneMode
+ (id)smu_settingsURL;
@end

@implementation SMUAirplaneMode

+ (id)smu_settingsURL
{
  return (id)[MEMORY[0x263F5FAD0] preferencesURL];
}

@end