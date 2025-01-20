@interface UIWindow(SafeAreaPropagation)
- (void)_sb_recursiveUpdateContentOverlayInsetsFromParentIfNecessary;
@end

@implementation UIWindow(SafeAreaPropagation)

- (void)_sb_recursiveUpdateContentOverlayInsetsFromParentIfNecessary
{
  id v1 = [a1 rootViewController];
  objc_msgSend(v1, "_sb_recursiveUpdateContentOverlayInsetsFromParentIfNecessary");
}

@end