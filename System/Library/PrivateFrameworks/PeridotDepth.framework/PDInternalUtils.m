@interface PDInternalUtils
+ (id)currTimeAsString;
@end

@implementation PDInternalUtils

+ (id)currTimeAsString
{
  v2 = [MEMORY[0x263EFF910] date];
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [v3 setDateFormat:@"yyyy-MM-dd_HH-mm-ss-SSS"];
  v4 = [v3 stringFromDate:v2];

  return v4;
}

@end