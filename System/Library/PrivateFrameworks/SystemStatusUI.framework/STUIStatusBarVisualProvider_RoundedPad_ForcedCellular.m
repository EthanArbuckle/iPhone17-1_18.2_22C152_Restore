@interface STUIStatusBarVisualProvider_RoundedPad_ForcedCellular
+ (BOOL)hasCellularCapability;
@end

@implementation STUIStatusBarVisualProvider_RoundedPad_ForcedCellular

+ (BOOL)hasCellularCapability
{
  return 1;
}

@end