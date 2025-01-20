@interface UIApplicationIsKeyboardMediaService
@end

@implementation UIApplicationIsKeyboardMediaService

void ___UIApplicationIsKeyboardMediaService_block_invoke()
{
  v0 = _UIMainBundleIdentifier();
  int v1 = [v0 isEqualToString:UIKeyboardMediaServiceBundleIdentifier];

  if (v1) {
    byte_1EB25B4E6 = 1;
  }
}

@end