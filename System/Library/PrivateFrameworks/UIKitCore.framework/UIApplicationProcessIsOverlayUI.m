@interface UIApplicationProcessIsOverlayUI
@end

@implementation UIApplicationProcessIsOverlayUI

void ___UIApplicationProcessIsOverlayUI_block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB25B4EF = [v0 isEqualToString:@"com.apple.UIKit.OverlayUI"];
}

@end