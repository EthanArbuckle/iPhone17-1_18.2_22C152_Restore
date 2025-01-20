@interface SBAmbientFollowsRawDeviceOrientationPolicySpecifier
- (id)targetRole;
@end

@implementation SBAmbientFollowsRawDeviceOrientationPolicySpecifier

- (id)targetRole
{
  return @"SBTraitsParticipantRoleAmbient";
}

@end