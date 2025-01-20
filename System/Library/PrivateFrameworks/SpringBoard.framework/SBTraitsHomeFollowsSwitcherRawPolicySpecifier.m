@interface SBTraitsHomeFollowsSwitcherRawPolicySpecifier
- (BOOL)animate;
- (BOOL)force;
- (id)roleA;
- (id)roleB;
@end

@implementation SBTraitsHomeFollowsSwitcherRawPolicySpecifier

- (id)roleB
{
  return @"SBTraitsParticipantRoleSwitcherRaw";
}

- (id)roleA
{
  return @"SBTraitsParticipantRoleHomeScreen";
}

- (BOOL)force
{
  return 1;
}

- (BOOL)animate
{
  return 0;
}

@end