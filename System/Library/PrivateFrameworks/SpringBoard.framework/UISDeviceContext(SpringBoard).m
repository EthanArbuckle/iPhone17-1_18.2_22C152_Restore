@interface UISDeviceContext(SpringBoard)
+ (id)sb_defaultContext;
@end

@implementation UISDeviceContext(SpringBoard)

+ (id)sb_defaultContext
{
  v0 = [MEMORY[0x1E4FB3400] defaultContext];
  SBHScreenTypeForCurrentDevice();
  SBHDisplayCornerRadiusForScreenType();
  v1 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v0 setDeviceInfoValue:v1 forKey:*MEMORY[0x1E4FB34D8]];

  return v0;
}

@end