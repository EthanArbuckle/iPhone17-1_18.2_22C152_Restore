@interface SBRestartManagerWorkspaceDataSource
- (BOOL)isUILocked;
- (id)activePrimaryApplicationBundleID;
- (void)terminateAllApplicationsForReason:(int64_t)a3 description:(id)a4 completion:(id)a5;
@end

@implementation SBRestartManagerWorkspaceDataSource

- (void)terminateAllApplicationsForReason:(int64_t)a3 description:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBRestartManagerWorkspaceDataSource.m", 20, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__SBRestartManagerWorkspaceDataSource_terminateAllApplicationsForReason_description_completion___block_invoke;
  v13[3] = &unk_1E6AF5A50;
  id v14 = v10;
  id v11 = v10;
  SBWorkspaceTerminateAllApps(a3, 0, v9, v13);
}

uint64_t __96__SBRestartManagerWorkspaceDataSource_terminateAllApplicationsForReason_description_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)activePrimaryApplicationBundleID
{
  v2 = +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController];
  v3 = [v2 layoutStatePrimaryElement];
  v4 = [v3 workspaceEntity];
  v5 = [v4 applicationSceneEntity];
  v6 = [v5 sceneHandle];
  v7 = [v6 application];
  v8 = [v7 bundleIdentifier];

  return v8;
}

- (BOOL)isUILocked
{
  v2 = +[SBLockScreenManager sharedInstanceIfExists];
  char v3 = [v2 isUILocked];

  return v3;
}

@end