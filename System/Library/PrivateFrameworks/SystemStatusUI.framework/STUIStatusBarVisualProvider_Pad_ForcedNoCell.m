@interface STUIStatusBarVisualProvider_Pad_ForcedNoCell
+ (BOOL)hasCellularCapability;
@end

@implementation STUIStatusBarVisualProvider_Pad_ForcedNoCell

+ (BOOL)hasCellularCapability
{
  return 0;
}

@end