@interface UIApplicationProcessIsUIKitester
@end

@implementation UIApplicationProcessIsUIKitester

void ___UIApplicationProcessIsUIKitester_block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB25B4F4 = [v0 isEqualToString:@"com.apple.UIKitester"];
}

@end