@interface FBSScene(SBContinuitySessionSceneParticipant)
- (id)continuitySessionSceneParticipant;
@end

@implementation FBSScene(SBContinuitySessionSceneParticipant)

- (id)continuitySessionSceneParticipant
{
  v2 = [a1 continuitySessionParticipantClientComponent];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
LABEL_5:
    v7 = v4;
    goto LABEL_7;
  }
  v5 = [a1 settings];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v4 = [a1 settings];
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

@end