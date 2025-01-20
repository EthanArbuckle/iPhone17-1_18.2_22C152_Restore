@interface FBSSceneTransitionContext(UIApplicationSceneTransitionContext)
- (uint64_t)isUISubclass;
@end

@implementation FBSSceneTransitionContext(UIApplicationSceneTransitionContext)

- (uint64_t)isUISubclass
{
  return 0;
}

@end