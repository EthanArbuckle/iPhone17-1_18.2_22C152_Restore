@interface UIIsPrivateMainBundle
@end

@implementation UIIsPrivateMainBundle

void ___UIIsPrivateMainBundle_block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1293 = [v0 hasPrefix:@"com.apple."];
}

@end