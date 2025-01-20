@interface UIApplication(UIAccessibilityInitialization)
- (uint64_t)_accessibilityIsSystemAppServer;
- (uint64_t)_accessibilitySystemAppServerIsReady;
- (uint64_t)_accessibilityUpdateIsSystemAppServer;
@end

@implementation UIApplication(UIAccessibilityInitialization)

- (uint64_t)_accessibilityIsSystemAppServer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__UIApplication_UIAccessibilityInitialization___accessibilityIsSystemAppServer__block_invoke;
  block[3] = &unk_1E59B9300;
  block[4] = a1;
  if (_accessibilityIsSystemAppServer_onceToken != -1) {
    dispatch_once(&_accessibilityIsSystemAppServer_onceToken, block);
  }
  return IsSystemAppServer;
}

- (uint64_t)_accessibilityUpdateIsSystemAppServer
{
  uint64_t result = AXProcessIsSystemApplication();
  IsSystemAppServer = result;
  return result;
}

- (uint64_t)_accessibilitySystemAppServerIsReady
{
  return 1;
}

@end