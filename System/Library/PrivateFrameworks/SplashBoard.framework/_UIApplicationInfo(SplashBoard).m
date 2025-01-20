@interface _UIApplicationInfo(SplashBoard)
- (BOOL)xb_supportsUserInterfaceStyle:()SplashBoard;
- (uint64_t)xb_userInterfaceStyleForRequestedUserInterfaceStyle:()SplashBoard;
@end

@implementation _UIApplicationInfo(SplashBoard)

- (uint64_t)xb_userInterfaceStyleForRequestedUserInterfaceStyle:()SplashBoard
{
  uint64_t result = [a1 supportedUserInterfaceStyle];
  if (result == 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = a3;
  }
  if (result != 2) {
    return v5;
  }
  return result;
}

- (BOOL)xb_supportsUserInterfaceStyle:()SplashBoard
{
  uint64_t v4 = [a1 supportedUserInterfaceStyle];
  return v4 == a3 || v4 == 0;
}

@end