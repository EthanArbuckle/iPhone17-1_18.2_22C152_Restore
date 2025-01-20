@interface UIApplicationProcessIsSpotlight
@end

@implementation UIApplicationProcessIsSpotlight

void ___UIApplicationProcessIsSpotlight_block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB25B4F1 = [v0 isEqualToString:@"com.apple.Spotlight"];
}

@end