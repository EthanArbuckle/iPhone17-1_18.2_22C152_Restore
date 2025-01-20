@interface FBSSceneSettings(SBApplicationSceneHandle)
- (uint64_t)sb_isEligbleForDeviceOrientationUpdates;
@end

@implementation FBSSceneSettings(SBApplicationSceneHandle)

- (uint64_t)sb_isEligbleForDeviceOrientationUpdates
{
  return 0;
}

@end