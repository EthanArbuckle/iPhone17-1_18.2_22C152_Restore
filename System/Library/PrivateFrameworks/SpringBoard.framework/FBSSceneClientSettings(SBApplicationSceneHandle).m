@interface FBSSceneClientSettings(SBApplicationSceneHandle)
- (uint64_t)sb_effectiveInterfaceOrientation;
@end

@implementation FBSSceneClientSettings(SBApplicationSceneHandle)

- (uint64_t)sb_effectiveInterfaceOrientation
{
  return 1;
}

@end