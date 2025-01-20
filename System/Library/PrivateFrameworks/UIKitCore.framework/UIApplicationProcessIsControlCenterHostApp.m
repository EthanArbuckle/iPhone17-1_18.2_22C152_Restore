@interface UIApplicationProcessIsControlCenterHostApp
@end

@implementation UIApplicationProcessIsControlCenterHostApp

void ___UIApplicationProcessIsControlCenterHostApp_block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB25B4F6 = [v0 isEqualToString:@"com.apple.ControlCenterHostApp"];
}

@end