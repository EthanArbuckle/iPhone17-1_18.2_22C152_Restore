@interface UIMutableApplicationSceneSettings(SBApplicationSceneHandle)
- (BOOL)sb_isEligbleForDeviceOrientationUpdates;
@end

@implementation UIMutableApplicationSceneSettings(SBApplicationSceneHandle)

- (BOOL)sb_isEligbleForDeviceOrientationUpdates
{
  return ([a1 deactivationReasons] & 8) == 0;
}

@end