@interface UIEventDeferringManagerIsAvailableForScene
@end

@implementation UIEventDeferringManagerIsAvailableForScene

void ___UIEventDeferringManagerIsAvailableForScene_block_invoke()
{
  v0 = _UIMainBundleIdentifier();
  char v1 = [v0 isEqualToString:@"com.apple.CarPlayApp"];

  _UIEventDeferringManagerIsAvailableForScene_allowForProcess = v1 ^ 1;
}

@end