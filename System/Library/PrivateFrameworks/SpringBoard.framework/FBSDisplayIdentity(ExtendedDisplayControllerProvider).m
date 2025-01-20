@interface FBSDisplayIdentity(ExtendedDisplayControllerProvider)
- (uint64_t)_sb_supportsExtendedDisplayMode;
@end

@implementation FBSDisplayIdentity(ExtendedDisplayControllerProvider)

- (uint64_t)_sb_supportsExtendedDisplayMode
{
  if ([a1 connectionType] == 1)
  {
    int v2 = 0;
  }
  else
  {
    v3 = +[SBDefaults localDefaults];
    v4 = [v3 externalDisplayDefaults];
    int v5 = [v4 allowWirelessDisplaysForExtendedDisplayMode];

    int v2 = v5 ^ 1;
  }
  if (![a1 isExternal]
    || ![a1 isAirPlayDisplay]
    || ([a1 isCarDisplay] & 1) != 0
    || (([a1 isCarInstrumentsDisplay] | v2) & 1) != 0)
  {
    return 0;
  }
  return [a1 isRootIdentity];
}

@end