@interface NSObject(SBSceneLayoutStatusBarAssertionProvidingAdditions)
- (uint64_t)SB_conformsToSceneLayoutMedusaStatusBarAssertionProviding;
- (uint64_t)SB_conformsToSceneLayoutStatusBarAssertionProviding;
@end

@implementation NSObject(SBSceneLayoutStatusBarAssertionProvidingAdditions)

- (uint64_t)SB_conformsToSceneLayoutMedusaStatusBarAssertionProviding
{
  return 0;
}

- (uint64_t)SB_conformsToSceneLayoutStatusBarAssertionProviding
{
  return 0;
}

@end