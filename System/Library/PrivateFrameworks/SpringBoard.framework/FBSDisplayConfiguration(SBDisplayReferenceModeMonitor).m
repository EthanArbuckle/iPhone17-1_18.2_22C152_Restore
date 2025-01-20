@interface FBSDisplayConfiguration(SBDisplayReferenceModeMonitor)
- (id)sb_referenceModeObserverUniqueIdentifier;
@end

@implementation FBSDisplayConfiguration(SBDisplayReferenceModeMonitor)

- (id)sb_referenceModeObserverUniqueIdentifier
{
  v1 = [a1 caDisplay];
  v2 = objc_msgSend(v1, "sb_referenceModeObserverUniqueIdentifier");

  return v2;
}

@end