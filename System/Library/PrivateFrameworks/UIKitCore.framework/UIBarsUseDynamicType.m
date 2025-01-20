@interface UIBarsUseDynamicType
@end

@implementation UIBarsUseDynamicType

void ___UIBarsUseDynamicType_block_invoke()
{
  if (dyld_program_sdk_at_least()) {
    _MergedGlobals_5_2 = 1;
  }
  v0 = _UIKitUserDefaults();
  id v2 = [v0 objectForKey:@"BarUseDynamicType"];

  v1 = v2;
  if (v2)
  {
    _MergedGlobals_5_2 = [v2 BOOLValue];
    v1 = v2;
  }
}

@end