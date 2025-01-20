@interface UIApplicationProcessIsDruid
@end

@implementation UIApplicationProcessIsDruid

void ___UIApplicationProcessIsDruid_block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB25B4F3 = [v0 isEqualToString:@"com.apple.DragUI.druid"];
}

@end