@interface BCBatteryDevice(SpringBoard)
+ (id)localizedBatteryDetailTextForBatteryLevel:()SpringBoard;
- (uint64_t)sb_supportsDetailedBatteryMetrics;
@end

@implementation BCBatteryDevice(SpringBoard)

+ (id)localizedBatteryDetailTextForBatteryLevel:()SpringBoard
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  [v2 setNumberStyle:3];
  double v4 = a1 / 100.0;
  *(float *)&double v4 = a1 / 100.0;
  v5 = [NSNumber numberWithFloat:v4];
  v6 = [v2 stringFromNumber:v5];

  return v6;
}

- (uint64_t)sb_supportsDetailedBatteryMetrics
{
  uint64_t result = [a1 isInternal];
  if (result)
  {
    id v2 = +[SBUIController sharedInstance];
    uint64_t v3 = [v2 supportsDetailedBatteryCapacity];

    return v3;
  }
  return result;
}

@end