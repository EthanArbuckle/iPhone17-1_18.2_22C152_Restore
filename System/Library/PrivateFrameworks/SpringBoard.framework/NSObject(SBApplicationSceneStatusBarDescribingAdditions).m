@interface NSObject(SBApplicationSceneStatusBarDescribingAdditions)
- (uint64_t)SB_conformsToSBApplicationSceneStatusBarDescriberProviding;
- (uint64_t)SB_conformsToSBApplicationSceneStatusBarDescribing;
@end

@implementation NSObject(SBApplicationSceneStatusBarDescribingAdditions)

- (uint64_t)SB_conformsToSBApplicationSceneStatusBarDescribing
{
  return 0;
}

- (uint64_t)SB_conformsToSBApplicationSceneStatusBarDescriberProviding
{
  return 0;
}

@end