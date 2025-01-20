@interface UIMutableApplicationSceneClientSettings(SBApplicationSceneHandle)
- (uint64_t)sb_effectiveInterfaceOrientation;
@end

@implementation UIMutableApplicationSceneClientSettings(SBApplicationSceneHandle)

- (uint64_t)sb_effectiveInterfaceOrientation
{
  uint64_t result = [a1 interfaceOrientation];
  if ((unint64_t)(result - 1) >= 4) {
    return 1;
  }
  return result;
}

@end