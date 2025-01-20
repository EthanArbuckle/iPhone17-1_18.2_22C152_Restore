@interface STUIStatusBarVisualProvider_Pad_ForcedCellular
+ (BOOL)hasCellularCapability;
@end

@implementation STUIStatusBarVisualProvider_Pad_ForcedCellular

+ (BOOL)hasCellularCapability
{
  return 1;
}

@end