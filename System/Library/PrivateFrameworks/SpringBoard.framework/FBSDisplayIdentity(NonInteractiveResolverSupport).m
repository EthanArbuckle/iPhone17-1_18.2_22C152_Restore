@interface FBSDisplayIdentity(NonInteractiveResolverSupport)
- (BOOL)_sb_requiresAppRunningFirst;
- (BOOL)_sb_requiresUserAuthenticationFirst;
- (uint64_t)_sb_nonInteractiveAvailableWithSwitcher:()NonInteractiveResolverSupport applicationController:authenticationState:;
@end

@implementation FBSDisplayIdentity(NonInteractiveResolverSupport)

- (uint64_t)_sb_nonInteractiveAvailableWithSwitcher:()NonInteractiveResolverSupport applicationController:authenticationState:
{
  id v7 = a4;
  uint64_t v8 = [a1 type];
  if (v8 == 5)
  {
    v10 = [v7 musicApplication];
LABEL_9:
    v9 = v10;
    v11 = [v10 processState];
    HasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication = [v11 isRunning];

LABEL_10:
    goto LABEL_12;
  }
  if (v8 == 4)
  {
    v10 = [v7 iPodOutApplication];
    goto LABEL_9;
  }
  if (v8 != 1)
  {
    HasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication = 0;
    goto LABEL_12;
  }
  if (HasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication)
  {
    if (![a1 isRestrictedAirPlayDisplay])
    {
      HasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication = 1;
      goto LABEL_12;
    }
    v9 = objc_msgSend(v7, "applicationWithPid:", objc_msgSend(a1, "pid"));
    HasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication = SBWorkspaceHasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication(v9);
    goto LABEL_10;
  }
LABEL_12:

  return HasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication;
}

- (BOOL)_sb_requiresUserAuthenticationFirst
{
  return [a1 type] == 1;
}

- (BOOL)_sb_requiresAppRunningFirst
{
  return ([a1 type] & 0xFFFFFFFFFFFFFFFELL) == 4;
}

@end