@interface UIViewController(TeaBridge)
+ (uint64_t)ts_performWithoutDeferringTransitions:()TeaBridge;
- (uint64_t)ts_isVideoPlayerPresentedFullScreen;
- (uint64_t)ts_setAppearanceTransitionsAreDisabled:()TeaBridge;
@end

@implementation UIViewController(TeaBridge)

+ (uint64_t)ts_performWithoutDeferringTransitions:()TeaBridge
{
  return objc_msgSend(MEMORY[0x1E4FB1EC0], "_performWithoutDeferringTransitions:");
}

- (uint64_t)ts_setAppearanceTransitionsAreDisabled:()TeaBridge
{
  uint64_t v5 = [a1 appearanceTransitionsAreDisabled];
  [a1 setAppearanceTransitionsAreDisabled:a3];
  return v5;
}

- (uint64_t)ts_isVideoPlayerPresentedFullScreen
{
  v2 = [a1 presentedViewController];

  if (!v2) {
    return 0;
  }
  v3 = [a1 presentedViewController];
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);

  uint64_t v6 = [v5 isEqualToString:@"AVFullScreenViewController"];
  return v6;
}

@end