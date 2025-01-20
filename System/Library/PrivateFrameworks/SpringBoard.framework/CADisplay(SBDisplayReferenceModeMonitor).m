@interface CADisplay(SBDisplayReferenceModeMonitor)
- (id)sb_referenceModeObserverUniqueIdentifier;
@end

@implementation CADisplay(SBDisplayReferenceModeMonitor)

- (id)sb_referenceModeObserverUniqueIdentifier
{
  v2 = [a1 uniqueId];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "displayId"));
    id v4 = [v5 description];
  }
  return v4;
}

@end