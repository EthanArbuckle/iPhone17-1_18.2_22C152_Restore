@interface UIViewControllerUseContentScrollViewAPI
@end

@implementation UIViewControllerUseContentScrollViewAPI

void ___UIViewControllerUseContentScrollViewAPI_block_invoke()
{
  _MergedGlobals_136 = _UIBarsApplyChromelessEverywhere();
  if ((_MergedGlobals_136 & 1) == 0 && dyld_program_sdk_at_least())
  {
    v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v1 = [v0 objectForKey:@"UIViewControllerUseContentScrollViewAPI"];

    if (v1
      || (_UIKitPreferencesOnce(),
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 objectForKey:@"UIViewControllerUseContentScrollViewAPI"],
          v1 = objc_claimAutoreleasedReturnValue(),
          v2,
          v1))
    {
      char v3 = [v1 BOOLValue];
    }
    else
    {
      char v3 = 1;
    }
    _MergedGlobals_136 = v3;
  }
}

@end