@interface SBHomeScreenEntity
- (BOOL)isHomeScreenEntity;
- (SBHomeScreenEntity)init;
- (int64_t)_mainDisplayPreferredInterfaceOrientation;
- (int64_t)layoutRole;
@end

@implementation SBHomeScreenEntity

- (SBHomeScreenEntity)init
{
  return [(SBWorkspaceEntity *)self initWithIdentifier:@"com.apple.SpringBoard.workspace-entity.builtin.home-screen" displayChangeSettings:0];
}

- (int64_t)layoutRole
{
  return 1;
}

- (BOOL)isHomeScreenEntity
{
  return 1;
}

- (int64_t)_mainDisplayPreferredInterfaceOrientation
{
  return [(id)SBApp interfaceOrientationForCurrentDeviceOrientation:0];
}

@end