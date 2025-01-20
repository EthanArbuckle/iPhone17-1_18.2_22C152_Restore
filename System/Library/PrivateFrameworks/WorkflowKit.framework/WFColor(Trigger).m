@interface WFColor(Trigger)
+ (id)batteryOutlineColor;
@end

@implementation WFColor(Trigger)

+ (id)batteryOutlineColor
{
  v0 = (void *)MEMORY[0x1E4FB45E0];
  v1 = (void *)MEMORY[0x1E4F28B50];
  NSClassFromString(&cfstr_Wftrigger.isa);
  v2 = [v1 bundleForClass:objc_opt_class()];
  v3 = [v0 colorNamed:@"BatteryTriggerIconOutlineColor" inBundle:v2];

  return v3;
}

@end