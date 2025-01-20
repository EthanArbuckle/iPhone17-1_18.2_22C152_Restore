@interface SBIsolatedSceneOrientationFollowingWindow
- (BOOL)_usesWindowServerHitTesting;
@end

@implementation SBIsolatedSceneOrientationFollowingWindow

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

@end