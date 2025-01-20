@interface SBCameraActivationManager
- (id)initWithWorkspace:(void *)a3 lockScreenManager:;
- (uint64_t)activateCameraWithURL:(unint64_t)a3 fromSource:(void *)a4 completion:;
- (uint64_t)activateCaptureApplicationWithBundleID:(void *)a3 URL:(unint64_t)a4 fromSource:(void *)a5 withPreludeAnimationToken:(void *)a6 completion:;
- (uint64_t)workspace;
@end

@implementation SBCameraActivationManager

- (id)initWithWorkspace:(void *)a3 lockScreenManager:
{
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  if (!a1) {
    goto LABEL_6;
  }
  if (!v6)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"workspace != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBCameraActivationManager initWithWorkspace:lockScreenManager:](sel_initWithWorkspace_lockScreenManager_, (uint64_t)a1, (uint64_t)v11);
    }
LABEL_12:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D87DA0E0);
  }
  if (!v7)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"lockScreenManager != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBCameraActivationManager initWithWorkspace:lockScreenManager:](sel_initWithWorkspace_lockScreenManager_, (uint64_t)a1, (uint64_t)v11);
    }
    goto LABEL_12;
  }
  v12.receiver = a1;
  v12.super_class = (Class)SBCameraActivationManager;
  v9 = (id *)objc_msgSendSuper2(&v12, sel_init);
  a1 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a2);
    objc_storeStrong(a1 + 2, a3);
  }
LABEL_6:

  return a1;
}

- (uint64_t)activateCameraWithURL:(unint64_t)a3 fromSource:(void *)a4 completion:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    v9 = SBLogCameraActivation();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = SBMainWorkspaceTransitionSourceDescription(a3);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = a1;
      __int16 v25 = 2114;
      v26 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) activating camera from source: %{public}@", buf, 0x16u);
    }
    if (!v7)
    {
      id v7 = [MEMORY[0x1E4F1CB10] URLWithString:@"camera://"];
    }
    v11 = *(void **)(a1 + 8);
    id v12 = *(id *)(a1 + 16);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__SBCameraActivationManager_activateCameraWithURL_fromSource_completion___block_invoke;
    v16[3] = &unk_1E6AF9578;
    unint64_t v20 = a3;
    char v21 = (a3 - 32 < 0x27) & (0x4800000001uLL >> (a3 - 32));
    uint64_t v18 = a1;
    id v19 = v8;
    id v17 = v12;
    id v13 = v12;
    id v14 = v11;
    unsigned __int8 v22 = SBMainWorkspaceActivateApplicationFromURL(v14, v7, 0, v16);
  }
  else
  {
    unsigned __int8 v22 = 0;
  }

  return v22;
}

- (uint64_t)workspace
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

void __73__SBCameraActivationManager_activateCameraWithURL_fromSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEventLabel:@"CameraActivation"];
  [v3 setSource:*(void *)(a1 + 56)];
  if (*(unsigned char *)(a1 + 64)) {
    [v3 modifyApplicationContext:&__block_literal_global_38];
  }
  if (*(void *)(a1 + 48))
  {
    char v4 = [*(id *)(a1 + 32) willAttemptToHandleTransitionRequest:v3];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__SBCameraActivationManager_activateCameraWithURL_fromSource_completion___block_invoke_4;
    v8[3] = &unk_1E6AF9550;
    char v11 = v4;
    id v6 = *(void **)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    v8[4] = *(void *)(a1 + 40);
    uint64_t v10 = v5;
    id v9 = v6;
    id v7 = (id)[v3 addCompletionHandler:v8];
  }
}

void __73__SBCameraActivationManager_activateCameraWithURL_fromSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 applicationSceneEntities];
  objc_msgSend(v2, "bs_each:", &__block_literal_global_34);
}

void __73__SBCameraActivationManager_activateCameraWithURL_fromSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setFlag:1 forActivationSetting:35];
  if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]()) {
    int v2 = +[SBCaptureHardwareButton isCaptureFeatureEnabled]();
  }
  else {
    int v2 = 0;
  }
  if ((LCSFeatureEnabled() & 1) != 0 || v2) {
    [v3 setFlag:1 forActivationSetting:36];
  }
}

void __73__SBCameraActivationManager_activateCameraWithURL_fromSource_completion___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56)) {
    char v4 = @"Cover Sheet";
  }
  else {
    char v4 = @"Unlocked";
  }
  uint64_t v5 = v4;
  id v6 = SBLogCameraActivation();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = SBMainWorkspaceTransitionSourceDescription(*(void *)(a1 + 48));
    int v9 = 138544130;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v8;
    __int16 v15 = 1024;
    int v16 = a2;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) activated %@ camera from source %{public}@ successfully: %{BOOL}u", (uint8_t *)&v9, 0x26u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (uint64_t)activateCaptureApplicationWithBundleID:(void *)a3 URL:(unint64_t)a4 fromSource:(void *)a5 withPreludeAnimationToken:(void *)a6 completion:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = a2;
  uint64_t v12 = a3;
  id v28 = a5;
  id v13 = a6;
  if (a1)
  {
    if (!(v11 | v12))
    {
      uint64_t v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"camera://"];
    }
    id v14 = SBLogCameraActivation();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = SBMainWorkspaceTransitionSourceDescription(a4);
      *(_DWORD *)buf = 138543874;
      unint64_t v42 = v11;
      __int16 v43 = 2114;
      uint64_t v44 = v12;
      __int16 v45 = 2114;
      v46 = v15;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "(Activating capture application \"%{public}@\" (with url: %{public}@) from source: %{public}@", buf, 0x20u);
    }
    id v16 = *(id *)(a1 + 8);
    id v17 = *(id *)(a1 + 16);
    uint64_t v27 = (void *)v12;
    if (v11)
    {
      uint64_t v18 = +[SBApplicationController sharedInstance];
      id v19 = [v18 applicationWithBundleIdentifier:v11];

      id v20 = 0;
    }
    else
    {
      id v39 = 0;
      id v19 = SBWorkspaceApplicationForURLWithError((void *)v12, 0, &v39);
      id v20 = v39;
    }
    char v21 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:v19];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __120__SBCameraActivationManager_activateCaptureApplicationWithBundleID_URL_fromSource_withPreludeAnimationToken_completion___block_invoke;
    v29[3] = &unk_1E6AF95A0;
    char v38 = (a4 - 32 < 0x27) & (0x4800000001uLL >> (a4 - 32));
    unint64_t v37 = a4;
    v30 = v21;
    unsigned __int8 v22 = v28;
    id v31 = v28;
    id v32 = v20;
    id v33 = (id)v11;
    uint64_t v35 = a1;
    id v36 = v13;
    id v34 = v17;
    id v23 = v17;
    id v24 = v20;
    __int16 v25 = v21;
    unsigned __int8 v40 = [v16 requestTransitionWithOptions:0 displayConfiguration:0 builder:v29 validator:&__block_literal_global_55_1];
  }
  else
  {
    uint64_t v27 = (void *)v12;
    unsigned __int8 v40 = 0;
    unsigned __int8 v22 = v28;
  }

  return v40;
}

void __120__SBCameraActivationManager_activateCaptureApplicationWithBundleID_URL_fromSource_withPreludeAnimationToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEventLabel:@"CameraCaptureActivation"];
  [v3 setSource:*(void *)(a1 + 88)];
  char v4 = [MEMORY[0x1E4F4F7F8] processHandle];
  [v3 setOriginatingProcess:v4];

  if (*(unsigned char *)(a1 + 96))
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __120__SBCameraActivationManager_activateCaptureApplicationWithBundleID_URL_fromSource_withPreludeAnimationToken_completion___block_invoke_2;
    v17[3] = &unk_1E6AF5638;
    id v18 = *(id *)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    [v3 modifyApplicationContext:v17];
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      [*(id *)(a1 + 32) setObject:v5 forActivationSetting:5];
    }
    [*(id *)(a1 + 32) setFlag:1 forActivationSetting:35];
    if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]()) {
      int v6 = +[SBCaptureHardwareButton isCaptureFeatureEnabled]();
    }
    else {
      int v6 = 0;
    }
    if ((LCSFeatureEnabled() & 1) != 0 || v6)
    {
      [*(id *)(a1 + 32) setFlag:1 forActivationSetting:36];
      uint64_t v7 = +[SBCaptureApplicationCenter sharedInstance];
      char v8 = [v7 shouldInstallLaunchMonitoringForCaptureApplicationBundleIdentfier:*(void *)(a1 + 56)];

      if ((v8 & 1) == 0) {
        [*(id *)(a1 + 32) setFlag:1 forActivationSetting:38];
      }
    }
  }
  if (*(void *)(a1 + 80))
  {
    char v9 = [*(id *)(a1 + 64) willAttemptToHandleTransitionRequest:v3];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __120__SBCameraActivationManager_activateCaptureApplicationWithBundleID_URL_fromSource_withPreludeAnimationToken_completion___block_invoke_3;
    v13[3] = &unk_1E6AF9550;
    char v16 = v9;
    unint64_t v11 = *(void **)(a1 + 80);
    uint64_t v10 = *(void *)(a1 + 88);
    v13[4] = *(void *)(a1 + 72);
    uint64_t v15 = v10;
    id v14 = v11;
    id v12 = (id)[v3 addCompletionHandler:v13];
  }
}

void __120__SBCameraActivationManager_activateCaptureApplicationWithBundleID_URL_fromSource_withPreludeAnimationToken_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setActivatingEntity:*(void *)(a1 + 32)];
  if (*(void *)(a1 + 40))
  {
    id v3 = +[SBConsumableTokenWrapper consumableTokenWrapperWithToken:](SBConsumableTokenWrapper, "consumableTokenWrapperWithToken:");
    [v4 setPreludeAnimationTokenWrapper:v3];
  }
}

void __120__SBCameraActivationManager_activateCaptureApplicationWithBundleID_URL_fromSource_withPreludeAnimationToken_completion___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56)) {
    id v4 = @"Cover Sheet";
  }
  else {
    id v4 = @"Unlocked";
  }
  uint64_t v5 = v4;
  int v6 = SBLogCameraActivation();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    char v8 = SBMainWorkspaceTransitionSourceDescription(*(void *)(a1 + 48));
    int v9 = 138544130;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v8;
    __int16 v15 = 1024;
    int v16 = a2;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) activated %@ camera from source %{public}@ successfully: %{BOOL}u", (uint8_t *)&v9, 0x26u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __120__SBCameraActivationManager_activateCaptureApplicationWithBundleID_URL_fromSource_withPreludeAnimationToken_completion___block_invoke_52()
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
}

- (void)initWithWorkspace:(uint64_t)a3 lockScreenManager:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  int v9 = @"SBCameraActivationManager.m";
  __int16 v10 = 1024;
  int v11 = 60;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithWorkspace:(uint64_t)a3 lockScreenManager:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  int v9 = @"SBCameraActivationManager.m";
  __int16 v10 = 1024;
  int v11 = 61;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end