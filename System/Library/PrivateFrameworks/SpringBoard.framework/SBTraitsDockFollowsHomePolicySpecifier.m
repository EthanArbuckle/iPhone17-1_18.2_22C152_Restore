@interface SBTraitsDockFollowsHomePolicySpecifier
- (id)roleA;
- (id)roleB;
@end

@implementation SBTraitsDockFollowsHomePolicySpecifier

- (id)roleB
{
  return @"SBTraitsParticipantRoleHomeScreen";
}

- (id)roleA
{
  return @"SBTraitsParticipantRoleFloatingDock";
}

@end