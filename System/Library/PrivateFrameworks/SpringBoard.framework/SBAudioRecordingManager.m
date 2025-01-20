@interface SBAudioRecordingManager
- (BOOL)_callProviderAttributionExistsForAttribution:(id)a3 callDescriptors:(id)a4;
- (SBApplication)nowRecordingApplication;
- (SBAudioRecordingManager)init;
- (SBSBackgroundActivityAssertion)backgroundActivityAssertion;
- (double)_verificationDelayForApplication:(id)a3;
- (int)_pidForAttribution:(id)a3;
- (void)_coverSheetDidPresent:(id)a3;
- (void)_removeBackgroundActivityAssertion;
- (void)_verifyBackgroundAudioActivityForApplication:(id)a3 withDelay:(BOOL)a4;
- (void)dealloc;
- (void)setBackgroundActivityAssertion:(id)a3;
- (void)setNowRecordingAppForActiveAudioRecordingAttributions:(id)a3 callDescriptors:(id)a4;
- (void)verifyBackgroundAudioActivityForApplication:(id)a3;
@end

@implementation SBAudioRecordingManager

- (void)setNowRecordingAppForActiveAudioRecordingAttributions:(id)a3 callDescriptors:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v12 = +[SBApplicationController sharedInstance];
        v13 = [v11 bundleIdentifier];
        v14 = [v12 applicationWithBundleIdentifier:v13];

        if ([(SBAudioRecordingManager *)self _callProviderAttributionExistsForAttribution:v11 callDescriptors:v7])
        {
        }
        else if (v14)
        {
          goto LABEL_12;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }
  v14 = 0;
LABEL_12:

  char v15 = BSEqualObjects();
  if (v14)
  {
    objc_storeStrong((id *)&self->_nowRecordingApplication, v14);
    [v14 setNowRecordingApplication:1];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 1;
    v16 = +[SBSceneManagerCoordinator sharedInstance];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __97__SBAudioRecordingManager_setNowRecordingAppForActiveAudioRecordingAttributions_callDescriptors___block_invoke;
    v21[3] = &unk_1E6B0C840;
    id v17 = v14;
    id v22 = v17;
    v23 = &v24;
    [v16 enumerateSceneManagersWithBlock:v21];

    if (*((unsigned char *)v25 + 24)) {
      [(SBAudioRecordingManager *)self _verifyBackgroundAudioActivityForApplication:v17 withDelay:1];
    }

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    [(SBApplication *)self->_nowRecordingApplication setNowRecordingApplication:0];
    nowRecordingApplication = self->_nowRecordingApplication;
    self->_nowRecordingApplication = 0;

    [(SBAudioRecordingManager *)self _removeBackgroundActivityAssertion];
  }
  if ((v15 & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 postNotificationName:@"SBNowRecordingAppDidChangeNotification" object:self];
  }
}

- (void)_removeBackgroundActivityAssertion
{
  backgroundActivityAssertion = self->_backgroundActivityAssertion;
  if (backgroundActivityAssertion)
  {
    [(SBSBackgroundActivityAssertion *)backgroundActivityAssertion invalidate];
    v4 = self->_backgroundActivityAssertion;
    self->_backgroundActivityAssertion = 0;
  }
}

- (BOOL)_callProviderAttributionExistsForAttribution:(id)a3 callDescriptors:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v13 = [SBActivityAttribution alloc];
        v14 = objc_msgSend(v12, "callProviderAttribution", (void)v19);
        char v15 = [(SBActivityAttribution *)v13 initWithSTActivityAttribution:v14];

        if (v15)
        {
          int v16 = [(SBAudioRecordingManager *)self _pidForAttribution:v6];
          if (v16 == [(SBAudioRecordingManager *)self _pidForAttribution:v15])
          {

            BOOL v17 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 0;
LABEL_12:

  return v17;
}

void __97__SBAudioRecordingManager_setNowRecordingAppForActiveAudioRecordingAttributions_callDescriptors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = objc_msgSend(a2, "externalForegroundApplicationSceneHandles", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) application];
        int v9 = [v8 isEqual:*(void *)(a1 + 32)];

        if (v9)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (SBApplication)nowRecordingApplication
{
  return self->_nowRecordingApplication;
}

- (SBAudioRecordingManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBAudioRecordingManager;
  v2 = [(SBAudioRecordingManager *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__coverSheetDidPresent_ name:@"SBCoverSheetDidPresentNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBAudioRecordingManager;
  [(SBAudioRecordingManager *)&v4 dealloc];
}

- (void)verifyBackgroundAudioActivityForApplication:(id)a3
{
}

- (void)_verifyBackgroundAudioActivityForApplication:(id)a3 withDelay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke;
  uint64_t v15 = &unk_1E6AF5290;
  id v7 = v6;
  id v16 = v7;
  BOOL v17 = self;
  uint64_t v8 = MEMORY[0x1D948C7A0](&v12);
  int v9 = (void *)v8;
  if (v4)
  {
    -[SBAudioRecordingManager _verificationDelayForApplication:](self, "_verificationDelayForApplication:", v7, v12, v13, v14, v15);
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    dispatch_after(v11, MEMORY[0x1E4F14428], v9);
  }
  else
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
}

void __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) bundleIdentifier];
  v21[0] = @"com.apple.camera";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  if ([v3 containsObject:v2])
  {
    BOOL v4 = SBLogStatusBarish();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v2;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Skipping verification of background audio activity for %{public}@ because this app is exempt", buf, 0xCu);
    }
  }
  else
  {
    BOOL v4 = [*(id *)(a1 + 32) info];
    int v5 = [v4 hasHiddenTag];
    int v6 = [*(id *)(a1 + 32) isSystemApplication];
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      int v8 = [*(id *)(a1 + 32) isNowRecordingApplication];
      int v9 = SBLogStatusBarish();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        double v10 = [*(id *)(a1 + 32) bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        v18 = v10;
        __int16 v19 = 1026;
        int v20 = v8;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Verify background audio activity for %{public}@, Recording: %{public}d", buf, 0x12u);
      }
      v14 = [*(id *)(a1 + 40) backgroundActivityAssertion];
      if (v14) {
        int v11 = 0;
      }
      else {
        int v11 = v8;
      }
      if (v11 == 1)
      {
        uint64_t v12 = [*(id *)(a1 + 32) processState];
        uint64_t v13 = [v12 pid];

        v14 = [MEMORY[0x1E4FA6A18] assertionWithBackgroundActivityIdentifier:*MEMORY[0x1E4FA9668] forPID:v13 exclusive:1 showsWhenForeground:0];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke_12;
        v16[3] = &unk_1E6AF4AC0;
        v16[4] = *(void *)(a1 + 40);
        [v14 acquireWithHandler:&__block_literal_global_417 invalidationHandler:v16];
        objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), v14);
      }
    }
    else
    {
      v14 = SBLogStatusBarish();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v2;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Skipping verification of background audio activity for %{public}@ because this app is a hidden system app", buf, 0xCu);
      }
    }
  }
}

void __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke_10(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v2 = SBLogStatusBarish();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke_10_cold_1(v2);
    }
  }
}

void __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke_12(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke_2;
  block[3] = &unk_1E6AF4AC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeBackgroundActivityAssertion];
}

- (double)_verificationDelayForApplication:(id)a3
{
  int v3 = [a3 isFaceTime];
  double result = 1.5;
  if (v3) {
    return 2.0;
  }
  return result;
}

- (int)_pidForAttribution:(id)a3
{
  if (a3) {
    objc_msgSend(a3, "auditToken", (unsigned __int128)0, (unsigned __int128)0);
  }
  return BSPIDForAuditToken();
}

- (void)_coverSheetDidPresent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v4 = SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "application", (void)v10);
        if (SBWorkspaceUnlockedEnvironmentLayoutStateHasMatchingApplication(v9)) {
          [(SBAudioRecordingManager *)self _verifyBackgroundAudioActivityForApplication:v9 withDelay:0];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (SBSBackgroundActivityAssertion)backgroundActivityAssertion
{
  return self->_backgroundActivityAssertion;
}

- (void)setBackgroundActivityAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivityAssertion, 0);
  objc_storeStrong((id *)&self->_nowRecordingApplication, 0);
}

void __82__SBAudioRecordingManager__verifyBackgroundAudioActivityForApplication_withDelay___block_invoke_10_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Failed to acquire background audio status bar style override", v1, 2u);
}

@end