@interface UIApplicationProcessIsCarPlayApp
@end

@implementation UIApplicationProcessIsCarPlayApp

void ___UIApplicationProcessIsCarPlayApp_block_invoke()
{
  if ([(id)UIApp isFrontBoard])
  {
    _UIMainBundleIdentifier();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    byte_1EB25B4F7 = [v0 isEqualToString:@"com.apple.CarPlayApp"];
  }
  else
  {
    byte_1EB25B4F7 = 0;
  }
}

@end