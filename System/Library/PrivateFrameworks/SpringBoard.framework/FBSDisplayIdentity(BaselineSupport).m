@interface FBSDisplayIdentity(BaselineSupport)
- (uint64_t)_sb_requiresBaselineController;
@end

@implementation FBSDisplayIdentity(BaselineSupport)

- (uint64_t)_sb_requiresBaselineController
{
  uint64_t result = [a1 isRootIdentity];
  if (result)
  {
    if (([a1 isAirPlayDisplay] & 1) != 0
      || ([a1 isRestrictedAirPlayDisplay] & 1) != 0
      || ([a1 isiPodOnlyDisplay] & 1) != 0)
    {
      return 1;
    }
    else
    {
      return [a1 isMusicOnlyDisplay];
    }
  }
  return result;
}

@end