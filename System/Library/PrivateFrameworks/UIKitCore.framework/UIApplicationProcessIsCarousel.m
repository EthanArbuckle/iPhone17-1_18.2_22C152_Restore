@interface UIApplicationProcessIsCarousel
@end

@implementation UIApplicationProcessIsCarousel

void ___UIApplicationProcessIsCarousel_block_invoke()
{
  if ([(id)UIApp isFrontBoard])
  {
    _UIMainBundleIdentifier();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    byte_1EB25B4F5 = [v0 isEqualToString:@"com.apple.Carousel"];
  }
  else
  {
    byte_1EB25B4F5 = 0;
  }
}

@end