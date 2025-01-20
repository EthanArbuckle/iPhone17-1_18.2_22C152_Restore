@interface FBSDisplayIdentity(NonInteractiveSupport)
- (uint64_t)sb_physicalDisplaySupportingNonInteractiveDisplayMode;
@end

@implementation FBSDisplayIdentity(NonInteractiveSupport)

- (uint64_t)sb_physicalDisplaySupportingNonInteractiveDisplayMode
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