@interface SBSecureAppWindow
+ (BOOL)sb_autorotates;
@end

@implementation SBSecureAppWindow

+ (BOOL)sb_autorotates
{
  return SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleSecureApp") ^ 1;
}

@end