@interface UIApplicationProcessIsSpringBoard
@end

@implementation UIApplicationProcessIsSpringBoard

void ___UIApplicationProcessIsSpringBoard_block_invoke()
{
  if ([(id)UIApp isFrontBoard])
  {
    _UIMainBundleIdentifier();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    byte_1EB25B4F0 = [v0 isEqualToString:@"com.apple.springboard"];
  }
  else
  {
    byte_1EB25B4F0 = 0;
  }
}

@end