@interface UIApplicationIsWidgetServer
@end

@implementation UIApplicationIsWidgetServer

void ___UIApplicationIsWidgetServer_block_invoke()
{
  v0 = _UIMainBundleIdentifier();
  int v1 = [v0 isEqualToString:UIKeyboardWidgetServerBundleIdentifier];

  if (v1) {
    byte_1EB25B4E7 = 1;
  }
}

@end