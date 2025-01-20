@interface NSArray(SensorKitUI)
+ (uint64_t)skui_sortedServices:()SensorKitUI;
@end

@implementation NSArray(SensorKitUI)

+ (uint64_t)skui_sortedServices:()SensorKitUI
{
  return [a3 sortedArrayUsingSelector:sel_sr_localizedServiceCompare_];
}

@end