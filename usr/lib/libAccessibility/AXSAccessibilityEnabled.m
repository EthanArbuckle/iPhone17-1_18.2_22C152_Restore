@interface AXSAccessibilityEnabled
@end

@implementation AXSAccessibilityEnabled

void ___AXSAccessibilityEnabled_block_invoke()
{
  dispatch_time_t v0 = dispatch_time(0, 500000000);
  dispatch_after(v0, MEMORY[0x1E4F14428], &__block_literal_global_2827);
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v2 = [v1 bundleIdentifier];
  _AXSAccessibilityEnabled_isPreBoard = [v2 isEqualToString:@"com.apple.PreBoard"];

  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v4 bundleIdentifier];
  _AXSAccessibilityEnabled_isCheckerBoard = [v3 isEqualToString:@"com.apple.CheckerBoard"];
}

@end