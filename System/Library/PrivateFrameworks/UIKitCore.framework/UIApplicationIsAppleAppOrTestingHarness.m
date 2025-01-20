@interface UIApplicationIsAppleAppOrTestingHarness
@end

@implementation UIApplicationIsAppleAppOrTestingHarness

void ___UIApplicationIsAppleAppOrTestingHarness_block_invoke()
{
  v0 = +[UIApplication displayIdentifier];
  byte_1EB25C0B1 = [v0 hasPrefix:@"com.apple."];

  id v1 = +[UIApplication displayIdentifier];
  byte_1EB25C0B2 = [v1 isEqualToString:@"com.ios.uikit.TestingHarness"];
}

@end