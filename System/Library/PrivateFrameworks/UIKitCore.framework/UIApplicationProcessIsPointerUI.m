@interface UIApplicationProcessIsPointerUI
@end

@implementation UIApplicationProcessIsPointerUI

void ___UIApplicationProcessIsPointerUI_block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB25B4F2 = [v0 isEqualToString:@"com.apple.PointerUI.pointeruid"];
}

@end