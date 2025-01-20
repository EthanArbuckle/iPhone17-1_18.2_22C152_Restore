@interface SBMirroringDisplayProfileFactory
- (BOOL)displayProfile:(id)a3 shouldConnectToDisplay:(id)a4;
- (id)createProfile;
@end

@implementation SBMirroringDisplayProfileFactory

- (id)createProfile
{
  return (id)[MEMORY[0x1E4F9F778] mirroringMainDisplayProfileWithDelegate:self];
}

- (BOOL)displayProfile:(id)a3 shouldConnectToDisplay:(id)a4
{
  v4 = objc_msgSend(a4, "identity", a3);
  if ([v4 isRootIdentity])
  {
    if (([v4 isAirPlayDisplay] & 1) != 0
      || ([v4 isRestrictedAirPlayDisplay] & 1) != 0
      || ([v4 isiPodOnlyDisplay] & 1) != 0)
    {
      char v5 = 1;
    }
    else
    {
      char v5 = [v4 isMusicOnlyDisplay];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

@end