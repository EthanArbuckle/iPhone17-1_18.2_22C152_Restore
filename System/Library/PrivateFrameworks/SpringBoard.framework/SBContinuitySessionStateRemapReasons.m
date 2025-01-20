@interface SBContinuitySessionStateRemapReasons
@end

@implementation SBContinuitySessionStateRemapReasons

id ___SBContinuitySessionStateRemapReasons_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 isEqualToString:@"block.embedded-display.uiBlocked"] & 1) != 0
    || [v2 isEqualToString:@"block.sos.active"])
  {
    v3 = (void **)MEMORY[0x1E4FA7EA0];
LABEL_12:
    v5 = *v3;
    goto LABEL_13;
  }
  if (([v2 isEqualToString:@"block.embedded-display.uiUnlocked"] & 1) != 0
    || ([v2 isEqualToString:@"block.inCall"] & 1) != 0
    || ([v2 isEqualToString:@"block.keybag-unlocked"] & 1) != 0
    || ([v2 isEqualToString:@"block.lockScreen.searchPresented"] & 1) != 0
    || ([v2 isEqualToString:@"block.embedded-display.secureAppUsage"] & 1) != 0
    || ([v2 isEqualToString:@"block.airplayMirroring"] & 1) != 0
    || (int v4 = [v2 isEqualToString:@"block.userInitiatedRemoteTransientOverlayPresented"],
        v5 = v2,
        v4))
  {
    v3 = (void **)MEMORY[0x1E4FA7E98];
    goto LABEL_12;
  }
LABEL_13:
  id v6 = v5;

  return v6;
}

@end