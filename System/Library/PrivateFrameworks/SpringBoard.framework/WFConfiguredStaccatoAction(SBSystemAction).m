@interface WFConfiguredStaccatoAction(SBSystemAction)
- (SBLinkSystemAction)sb_newSystemActionWithInstanceIdentity:()SBSystemAction;
@end

@implementation WFConfiguredStaccatoAction(SBSystemAction)

- (SBLinkSystemAction)sb_newSystemActionWithInstanceIdentity:()SBSystemAction
{
  id v4 = a3;
  v5 = [(SBSystemAction *)[SBLinkSystemAction alloc] initWithConfiguredAction:a1 instanceIdentity:v4];

  return v5;
}

@end