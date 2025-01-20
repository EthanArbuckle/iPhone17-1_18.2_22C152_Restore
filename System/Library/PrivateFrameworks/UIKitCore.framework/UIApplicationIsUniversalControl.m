@interface UIApplicationIsUniversalControl
@end

@implementation UIApplicationIsUniversalControl

void ___UIApplicationIsUniversalControl_block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB25B4EB = [v0 isEqualToString:@"com.apple.universalcontrol"];
}

@end