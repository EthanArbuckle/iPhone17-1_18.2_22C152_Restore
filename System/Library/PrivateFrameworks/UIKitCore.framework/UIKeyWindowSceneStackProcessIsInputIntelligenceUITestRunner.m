@interface UIKeyWindowSceneStackProcessIsInputIntelligenceUITestRunner
@end

@implementation UIKeyWindowSceneStackProcessIsInputIntelligenceUITestRunner

void ___UIKeyWindowSceneStackProcessIsInputIntelligenceUITestRunner_block_invoke()
{
  if (os_variant_has_internal_diagnostics())
  {
    _UIMainBundleIdentifier();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_930 = [v0 isEqualToString:@"com.apple.InputIntelligenceUITests-iOS-All.xctrunner"];
  }
  else
  {
    _MergedGlobals_930 = 0;
  }
}

@end