@interface SBSLockScreenContentAction(InProcess)
- (uint64_t)applicationSceneEntity;
- (uint64_t)hostableEntity;
- (uint64_t)isInProcessAction;
- (void)setApplicationSceneEntity:()InProcess;
- (void)setHostableEntity:()InProcess;
@end

@implementation SBSLockScreenContentAction(InProcess)

- (uint64_t)isInProcessAction
{
  return 0;
}

- (uint64_t)applicationSceneEntity
{
  return 0;
}

- (void)setApplicationSceneEntity:()InProcess
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"SBInProcessSecureAppAction.m" lineNumber:48 description:@"Can't set an application scene entity on an SBSLockScreenContentAction."];
}

- (uint64_t)hostableEntity
{
  return 0;
}

- (void)setHostableEntity:()InProcess
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"SBInProcessSecureAppAction.m" lineNumber:56 description:@"Can't set an application scene entity on an SBSLockScreenContentAction."];
}

@end