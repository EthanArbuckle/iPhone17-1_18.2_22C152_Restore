@interface NSBundle(SSSAdditions)
+ (uint64_t)_screenshotServicesServiceBundle;
@end

@implementation NSBundle(SSSAdditions)

+ (uint64_t)_screenshotServicesServiceBundle
{
  return [MEMORY[0x263F086E0] bundleWithIdentifier:ScreenshotServicesServiceBundleIdentifier];
}

@end