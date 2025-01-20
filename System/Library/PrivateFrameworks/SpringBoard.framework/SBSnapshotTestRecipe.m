@interface SBSnapshotTestRecipe
- (id)title;
- (void)_sendRequestWithType:(unint64_t)a3;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBSnapshotTestRecipe

- (id)title
{
  return @"Snapshot Testing";
}

- (void)handleVolumeIncrease
{
}

- (void)handleVolumeDecrease
{
}

- (void)_sendRequestWithType:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController];
  v5 = [v4 layoutStatePrimaryElement];
  v6 = [v5 workspaceEntity];
  v7 = [v6 applicationSceneEntity];
  v8 = [v7 sceneHandle];

  v9 = [v8 sceneIfExists];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 settings];
    v12 = (void *)MEMORY[0x1E4F62A98];
    v13 = [v10 identifier];
    v14 = [v10 settings];
    v15 = [v12 contextWithSceneID:v13 settings:v14];

    [v15 setName:@"SBSnapshotTestRecipe"];
    v16 = [v11 displayConfiguration];
    [v16 pointScale];
    objc_msgSend(v15, "setScale:");

    [v11 bounds];
    objc_msgSend(v15, "setFrame:");
    v17 = SBLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = @"invalidate";
      if (a3 == 1) {
        v18 = @"perform";
      }
      int v20 = 138412546;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[SBSnapshotTestRecipe] Sending %@ request with %@", (uint8_t *)&v20, 0x16u);
    }

    if (a3 == 2)
    {
      v19 = [v8 application];
      [v19 deleteSnapshotForContext:v15];
    }
    else
    {
      if (a3 != 1)
      {
LABEL_13:

        goto LABEL_14;
      }
      v19 = [v8 application];
      [v19 saveSnapshotForSceneHandle:v8 context:v15 completion:0];
    }

    goto LABEL_13;
  }
  v11 = SBLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[SBSnapshotTestRecipe] No active app main scene. Ignoring.", (uint8_t *)&v20, 2u);
  }
LABEL_14:
}

@end