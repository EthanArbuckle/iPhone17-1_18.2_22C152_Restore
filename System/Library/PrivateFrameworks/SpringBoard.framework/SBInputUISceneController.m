@interface SBInputUISceneController
+ (BOOL)_shouldControlInputUIScene;
+ (id)_setupInfo;
- (BOOL)isVisibleForSpringBoard;
- (SBInputUISceneController)initWithSceneWorkspaceIdentifier:(id)a3 clientProcessIdentity:(id)a4 sceneVendingPolicy:(int64_t)a5 traitsRole:(id)a6 jobLabel:(id)a7 level:(double)a8;
- (UIWindow)hostingWindow;
- (id)_currentDisplayConfiguration;
- (id)_currentTraitsPipelineManager;
- (id)_targetSceneForFocusedSceneTokenString:(id)a3;
- (id)_targetSceneForKeyboardFocusContext:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)_createInputUIScene;
- (void)_evaluateAvailablePresenters:(id)a3 forSceneControllers:(id)a4;
- (void)_setupDefaultPresentationForTargetHostingGraph:(id)a3 targetScene:(id)a4;
- (void)_updateDefaultPresenterForTargetScene:(id)a3 contextID:(unsigned int)a4;
- (void)_userSwipedToKillFromSwitcher:(id)a3;
- (void)dealloc;
- (void)focusContextDidChange:(id)a3;
- (void)terminateWithReason:(id)a3;
@end

@implementation SBInputUISceneController

- (void)focusContextDidChange:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __50__SBInputUISceneController_focusContextDidChange___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v2 = SBLogInputUI();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v70 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Focused scene identity did change to: %{public}@", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) sceneIdentity];
  v5 = [*(id *)(*(void *)(a1 + 40) + 152) identityToken];
  int v6 = [v4 isEqual:v5];

  if (!v6)
  {
    char v9 = objc_opt_respondsToSelector();
    v10 = *(void **)(a1 + 32);
    if (v9)
    {
      v11 = [v10 layeringSceneIdentity];
      v12 = SBLogInputUI();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v70 = v11;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Client overrides preferred layering scene identity: %{public}@", buf, 0xCu);
      }

      uint64_t v13 = [*(id *)(a1 + 32) contextID];
      if (v11)
      {
        v14 = v11;
        v7 = v14;
LABEL_13:
        v15 = *(void **)(a1 + 32);
        if (!v15) {
          goto LABEL_18;
        }
        if (v13 || v14)
        {
          if (([v15 isEqual:*(void *)(*(void *)(a1 + 40) + 176)] & 1) == 0)
          {
            ++*(void *)(*(void *)(a1 + 40) + 200);
            objc_storeStrong((id *)(*(void *)(a1 + 40) + 176), *(id *)(a1 + 32));
            uint64_t v27 = [*(id *)(a1 + 40) _targetSceneForKeyboardFocusContext:*(void *)(a1 + 32)];
            uint64_t v28 = *(void *)(a1 + 40);
            v29 = *(void **)(v28 + 160);
            *(void *)(v28 + 160) = v27;

            if (!*(void *)(*(void *)(a1 + 40) + 160))
            {
              v30 = [(id)SBApp windowSceneManager];
              v31 = [v30 activeDisplayWindowScene];

              v32 = [MEMORY[0x1E4F62490] sharedInstance];
              v33 = [v31 _FBSScene];
              v34 = [v33 identityToken];
              uint64_t v35 = [v32 sceneFromIdentityToken:v34];
              uint64_t v36 = *(void *)(a1 + 40);
              v37 = *(void **)(v36 + 160);
              *(void *)(v36 + 160) = v35;
            }
            if (!v13)
            {
              v38 = *(void **)(a1 + 40);
              if (v38[20])
              {
                v39 = [v38 defaultPresenter];
                v40 = [v39 hostingWindowForScene:*(void *)(*(void *)(a1 + 40) + 152)];
                int v41 = [v40 _contextId];

                long long v67 = 0u;
                long long v68 = 0u;
                long long v65 = 0u;
                long long v66 = 0u;
                v42 = [*(id *)(*(void *)(a1 + 40) + 160) clientSettings];
                v43 = [v42 layers];
                v44 = [v43 reverseObjectEnumerator];

                uint64_t v45 = [v44 countByEnumeratingWithState:&v65 objects:v75 count:16];
                if (v45)
                {
                  uint64_t v46 = v45;
                  uint64_t v47 = *(void *)v66;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v46; ++i)
                    {
                      if (*(void *)v66 != v47) {
                        objc_enumerationMutation(v44);
                      }
                      v49 = *(void **)(*((void *)&v65 + 1) + 8 * i);
                      if ([v49 contextID]
                        && [v49 contextID] != v41)
                      {
                        uint64_t v13 = [v49 contextID];
                        goto LABEL_36;
                      }
                    }
                    uint64_t v46 = [v44 countByEnumeratingWithState:&v65 objects:v75 count:16];
                    if (v46) {
                      continue;
                    }
                    break;
                  }
                }
                uint64_t v13 = 0;
LABEL_36:
              }
              else
              {
                uint64_t v13 = 0;
              }
            }
            v50 = SBLogInputUI();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              v62 = *(void **)(a1 + 32);
              v63 = *(void **)(*(void *)(a1 + 40) + 160);
              *(_DWORD *)buf = 138543874;
              v70 = v62;
              __int16 v71 = 2114;
              v72 = v63;
              __int16 v73 = 1024;
              int v74 = v13;
              _os_log_error_impl(&dword_1D85BA000, v50, OS_LOG_TYPE_ERROR, "Couldn't find a targetScene for the given focusContext[%{public}@]. Fall back to scene[%{public}@] and contextID[%x] ", buf, 0x1Cu);
            }

            v51 = *(void **)(a1 + 40);
            uint64_t v52 = v51[20];
            if (v52)
            {
              [v51 _updateDefaultPresenterForTargetScene:v52 contextID:v13];
              uint64_t v53 = [*(id *)(a1 + 40) _currentTraitsPipelineManager];
              uint64_t v54 = *(void *)(a1 + 40);
              v55 = *(void **)(v54 + 184);
              *(void *)(v54 + 184) = v53;

              [*(id *)(*(void *)(a1 + 40) + 184) setKeyboardFocusContext:*(void *)(a1 + 32)];
              v56 = SBLogInputUI();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
              {
                v57 = [v14 stringRepresentation];
                v58 = [*(id *)(*(void *)(a1 + 40) + 160) identifier];
                *(_DWORD *)buf = 138543618;
                v70 = v57;
                __int16 v71 = 2114;
                v72 = v58;
                _os_log_impl(&dword_1D85BA000, v56, OS_LOG_TYPE_DEFAULT, "Target scene for focused identity[%{public}@]: %{public}@", buf, 0x16u);
              }
              v59 = *(void **)(a1 + 40);
              v60 = (void *)v59[18];
              v61 = [v59 _currentDisplayConfiguration];
              [v60 setTargetDisplayConfiguration:v61];

              [*(id *)(*(void *)(a1 + 40) + 144) setSceneContentVisible:1];
            }
            goto LABEL_43;
          }
          if (!*(void *)(a1 + 32))
          {
LABEL_18:
            uint64_t v16 = *(void *)(a1 + 40);
            if (*(void *)(v16 + 176))
            {
              [*(id *)(v16 + 216) invalidate];
              [*(id *)(*(void *)(a1 + 40) + 144) setSceneContentVisible:0];
              uint64_t v17 = *(void *)(a1 + 40);
              v18 = *(void **)(v17 + 168);
              *(void *)(v17 + 168) = 0;

              uint64_t v19 = *(void *)(a1 + 40);
              v20 = *(void **)(v19 + 160);
              *(void *)(v19 + 160) = 0;

              uint64_t v21 = *(void *)(a1 + 40);
              v22 = *(void **)(v21 + 176);
              *(void *)(v21 + 176) = 0;

              uint64_t v23 = *(void *)(a1 + 40);
              v24 = *(void **)(v23 + 184);
              *(void *)(v23 + 184) = 0;

              uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 200);
              dispatch_time_t v26 = dispatch_time(0, 4000000000);
              v64[0] = MEMORY[0x1E4F143A8];
              v64[1] = 3221225472;
              v64[2] = __50__SBInputUISceneController_focusContextDidChange___block_invoke_57;
              v64[3] = &unk_1E6AF4A70;
              v64[4] = *(void *)(a1 + 40);
              v64[5] = v25;
              dispatch_after(v26, MEMORY[0x1E4F14428], v64);
            }
          }
        }
LABEL_43:

        goto LABEL_44;
      }
    }
    else
    {
      uint64_t v13 = [v10 contextID];
    }
    v14 = [*(id *)(a1 + 32) sceneIdentity];
    v7 = 0;
    goto LABEL_13;
  }
  v7 = SBLogInputUI();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v70 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Can't focus InputUI on itself: %{public}@. Note: this can happen in case InputUI scene is used for AutoFill purposes, when InputUI is otherwise not used for keyboard hosting ones.", buf, 0xCu);
  }
LABEL_44:
}

+ (id)_setupInfo
{
  v7[6] = *MEMORY[0x1E4F143B8];
  v6[0] = @"class";
  v7[0] = objc_opt_class();
  v6[1] = @"enabled";
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_shouldControlInputUIScene"));
  v7[1] = v3;
  v7[2] = @"com.apple.InputUI";
  v6[2] = @"jobLabel";
  v6[3] = @"traitsRole";
  v7[3] = @"SBTraitsParticipantRoleInputUI";
  v7[4] = &unk_1F3349758;
  v6[4] = @"vendingStrategy";
  v6[5] = @"workspaceID";
  v7[5] = @"com.apple.SpringBoard.SceneWorkspace.InputUI";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:6];

  return v4;
}

+ (BOOL)_shouldControlInputUIScene
{
  if (([MEMORY[0x1E4F42B08] usesInputSystemUI] & 1) != 0
    || (int v2 = [MEMORY[0x1E4F42B08] usesInputSystemUIForAutoFillOnly]) != 0)
  {
    LOBYTE(v2) = objc_opt_respondsToSelector();
  }
  return v2 & 1;
}

- (SBInputUISceneController)initWithSceneWorkspaceIdentifier:(id)a3 clientProcessIdentity:(id)a4 sceneVendingPolicy:(int64_t)a5 traitsRole:(id)a6 jobLabel:(id)a7 level:(double)a8
{
  v12.receiver = self;
  v12.super_class = (Class)SBInputUISceneController;
  v8 = [(SBSystemUISceneController *)&v12 initWithSceneWorkspaceIdentifier:a3 clientProcessIdentity:a4 sceneVendingPolicy:a5 traitsRole:a6 jobLabel:a7 level:a8];
  char v9 = v8;
  if (v8)
  {
    v11 = v8;
    BSDispatchMain();
  }
  return v9;
}

void __128__SBInputUISceneController_initWithSceneWorkspaceIdentifier_clientProcessIdentity_sceneVendingPolicy_traitsRole_jobLabel_level___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__userSwipedToKillFromSwitcher_ name:@"SBUserSwipedToKillRecentAppLayoutNotification" object:0];
  [*(id *)(a1 + 32) _createInputUIScene];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBInputUISceneController;
  [(SBSystemUISceneController *)&v4 dealloc];
}

- (void)_createInputUIScene
{
  BSDispatchQueueAssertMain();
  id v15 = objc_alloc_init(MEMORY[0x1E4F42D88]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F42788]);
  [v15 setSpecification:v3];

  objc_super v4 = NSString;
  v5 = [(SBSystemUISceneController *)self jobLabel];
  int v6 = [v4 stringWithFormat:@"SystemUIScene-[%@]", v5];
  [v15 setIdentifier:v6];

  v7 = [SBSingleSceneController alloc];
  v8 = [(SBSystemUISceneController *)self sceneWorkspaceController];
  char v9 = [(SBSystemUISceneController *)self clientProcessIdentity];
  v10 = [(SBSystemUISceneController *)self traitsRole];
  v11 = [(SBSingleSceneController *)v7 initWithSceneWorkspaceController:v8 sceneRequestOptions:v15 clientIdentity:v9 traitsRole:v10 level:1.79769313e308];
  sceneController = self->_sceneController;
  self->_sceneController = v11;

  [(SBSingleSceneController *)self->_sceneController setShouldActivateForDisplayConfiguration:1];
  [(SBSingleSceneController *)self->_sceneController setShouldForegroundForDisplayConfiguration:1];
  [(SBSingleSceneController *)self->_sceneController setShouldBeKeptActiveWhileForeground:1];
  uint64_t v13 = [(SBSingleSceneController *)self->_sceneController scene];
  inputUIScene = self->_inputUIScene;
  self->_inputUIScene = v13;
}

- (BOOL)isVisibleForSpringBoard
{
  id v3 = [MEMORY[0x1E4F963E8] currentProcess];
  objc_super v4 = [(FBScene *)self->_targetScene clientHandle];
  v5 = [v4 processHandle];
  char v6 = [v5 isEqual:v3];

  return v6;
}

- (UIWindow)hostingWindow
{
  uint64_t v3 = objc_opt_class();
  objc_super v4 = [(SBSingleSceneController *)self->_sceneController presenter];
  v5 = SBSafeCast(v3, v4);

  char v6 = [(SBSingleSceneController *)self->_sceneController scene];
  v7 = [v5 hostingWindowForScene:v6];

  return (UIWindow *)v7;
}

- (void)terminateWithReason:(id)a3
{
  id v4 = a3;
  v5 = [(SBSystemUISceneController *)self clientProcessIdentity];
  char v6 = [MEMORY[0x1E4F62448] sharedInstanceIfExists];
  v7 = [v6 processForIdentity:v5];

  if ([v7 isRunning])
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F96488]) initWithExplanation:v4];
    [v8 setReportType:0];
    [v8 setExceptionDomain:10];
    [v8 setExceptionCode:439025681];
    [v8 setMaximumTerminationResistance:50];
    LODWORD(v9) = BSPthreadCurrentEffectiveQualityOfService();
    if (v9 <= 0x19) {
      intptr_t v9 = 25;
    }
    else {
      intptr_t v9 = v9;
    }
    v10 = dispatch_get_global_queue(v9, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__SBInputUISceneController_terminateWithReason___block_invoke;
    block[3] = &unk_1E6AF4E00;
    id v13 = v5;
    id v14 = v8;
    id v15 = v4;
    id v11 = v8;
    dispatch_async(v10, block);
  }
}

void __48__SBInputUISceneController_terminateWithReason___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F96430] predicateMatchingIdentity:a1[4]];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F96490]) initWithPredicate:v2 context:a1[5]];
  id v9 = 0;
  char v4 = [v3 execute:&v9];
  id v5 = v9;
  char v6 = SBLogInputUI();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[6];
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ termination succeeded", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __48__SBInputUISceneController_terminateWithReason___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v7);
  }
}

- (void)_evaluateAvailablePresenters:(id)a3 forSceneControllers:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_targetScene)
  {
    v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v30 = v7;
      id v31 = v6;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v34;
      do
      {
        id v13 = v8;
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v13);
          }
          id v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v16 = [v15 parentSceneIdentityToken];
          uint64_t v17 = self;
          v18 = [(FBScene *)self->_targetScene identityToken];
          int v19 = [v16 isEqual:v18];

          if (v19)
          {
            if (objc_opt_respondsToSelector())
            {
              if ([v15 isVisibleOnScreen]) {
                v20 = v15;
              }
              else {
                v20 = v11;
              }
              id v21 = v20;

              uint64_t v11 = v21;
            }
            self = v17;
            [v32 addObject:v15];
          }
          else
          {
            self = v17;
          }
        }
        id v8 = v13;
        uint64_t v10 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v10);

      id v7 = v30;
      id v6 = v31;
      if (v11)
      {
        id v22 = v11;
        uint64_t v23 = v22;
        goto LABEL_22;
      }
    }
    else
    {
    }
    uint64_t v24 = [v32 lastObject];
    if (!v24)
    {
      uint64_t v27 = [(FBScene *)self->_targetScene identityToken];
      int v28 = [v27 isEqual:self->_lastExternallyPresentedSceneToken];

      if (v28)
      {
        objc_storeWeak((id *)&self->_currentExternalPresenter, 0);
        id v22 = 0;
        uint64_t v23 = 0;
      }
      else
      {
        lastExternallyPresentedSceneToken = self->_lastExternallyPresentedSceneToken;
        self->_lastExternallyPresentedSceneToken = 0;

        objc_storeWeak((id *)&self->_currentExternalPresenter, 0);
        uint64_t v23 = [(SBSystemUISceneController *)self defaultPresenter];
        id v22 = 0;
      }
      goto LABEL_23;
    }
    uint64_t v23 = (void *)v24;
    id v22 = 0;
LABEL_22:
    uint64_t v25 = [(FBScene *)self->_targetScene identityToken];
    dispatch_time_t v26 = self->_lastExternallyPresentedSceneToken;
    self->_lastExternallyPresentedSceneToken = v25;

    objc_storeWeak((id *)&self->_currentExternalPresenter, v23);
LABEL_23:
    [(SBSingleSceneController *)self->_sceneController setPresenter:v23];
  }
}

void __50__SBInputUISceneController_focusContextDidChange___block_invoke_57(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40) == *(void *)(v1 + 200))
  {
    [*(id *)(v1 + 184) setKeyboardFocusContext:0];
    [*(id *)(*(void *)(a1 + 32) + 144) setTargetDisplayConfiguration:0];
    uint64_t v3 = SBLogInputUI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v4 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "InputUI scene was backgrounded", v4, 2u);
    }
  }
}

- (id)_targetSceneForKeyboardFocusContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sceneIdentity];
  id v6 = v5;
  if (v5)
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__11;
    v18 = __Block_byref_object_dispose__11;
    id v7 = [v5 stringRepresentation];
    id v19 = [(SBInputUISceneController *)self _targetSceneForFocusedSceneTokenString:v7];

    id v8 = (void *)v15[5];
    if (!v8)
    {
      uint64_t v9 = objc_alloc_init(SBKeyboardFocusVisibilityGraphNavigator);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64__SBInputUISceneController__targetSceneForKeyboardFocusContext___block_invoke;
      v13[3] = &unk_1E6AF98D8;
      v13[4] = self;
      v13[5] = &v14;
      [(SBKeyboardFocusVisibilityGraphNavigator *)v9 reverseEnumerateChainContainingSceneIdentityToken:v6 block:v13];

      id v8 = (void *)v15[5];
      if (!v8)
      {
        uint64_t v10 = SBLogInputUI();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[SBInputUISceneController _targetSceneForKeyboardFocusContext:]((uint64_t)v4, v10);
        }

        id v8 = (void *)v15[5];
      }
    }
    id v11 = v8;
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __64__SBInputUISceneController__targetSceneForKeyboardFocusContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) _targetSceneForFocusedSceneTokenString:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (id)_targetSceneForFocusedSceneTokenString:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = [(id)SBApp systemUIScenesCoordinator];
    id v5 = [v4 sceneFromIdentityTokenStringRepresentation:v3];

    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F62490] sharedInstance];
      id v5 = [v6 sceneFromIdentityTokenStringRepresentation:v3];

      if (!v5)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v7 = [(id)SBApp windowSceneManager];
        id v8 = [v7 connectedWindowScenes];

        id obj = v8;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          id v5 = 0;
          uint64_t v11 = *(void *)v25;
          do
          {
            uint64_t v12 = 0;
            id v13 = v5;
            do
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(obj);
              }
              uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
              id v15 = +[SBSceneManagerCoordinator sharedInstance];
              uint64_t v16 = [v14 _fbsDisplayIdentity];
              uint64_t v17 = [v15 sceneManagerForDisplayIdentity:v16];
              v18 = [v17 externalForegroundApplicationSceneHandles];

              v22[0] = MEMORY[0x1E4F143A8];
              v22[1] = 3221225472;
              v22[2] = __67__SBInputUISceneController__targetSceneForFocusedSceneTokenString___block_invoke;
              v22[3] = &unk_1E6AF9928;
              id v23 = v3;
              id v19 = objc_msgSend(v18, "bs_firstObjectPassingTest:", v22);
              id v5 = [v19 sceneIfExists];

              ++v12;
              id v13 = v5;
            }
            while (v10 != v12);
            uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v10);
        }
        else
        {
          id v5 = 0;
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

BOOL __67__SBInputUISceneController__targetSceneForFocusedSceneTokenString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 sceneIfExists];
  id v4 = [v3 clientSettings];
  id v5 = [v4 layers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__SBInputUISceneController__targetSceneForFocusedSceneTokenString___block_invoke_2;
  v9[3] = &unk_1E6AF9900;
  id v10 = *(id *)(a1 + 32);
  uint64_t v6 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);
  BOOL v7 = v6 != 0;

  return v7;
}

uint64_t __67__SBInputUISceneController__targetSceneForFocusedSceneTokenString___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isKeyboardProxyLayer])
  {
    id v3 = [v2 keyboardOwner];
    id v4 = [v3 stringRepresentation];
    uint64_t v5 = BSEqualObjects();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_updateDefaultPresenterForTargetScene:(id)a3 contextID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBInputUISceneController.m", 353, @"Invalid parameter not satisfying: %@", @"targetScene" object file lineNumber description];

    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  id v8 = [MEMORY[0x1E4F42D80] sceneHostingGraph];
  objc_initWeak(&location, self);
  [(BSInvalidatable *)self->_hostingGraphObservationInvalidatable invalidate];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__SBInputUISceneController__updateDefaultPresenterForTargetScene_contextID___block_invoke;
  v13[3] = &unk_1E6AF9950;
  objc_copyWeak(&v15, &location);
  id v14 = v7;
  uint64_t v9 = [v8 observeLocalWindowGraphHostingContextID:v4 withHandler:v13];
  hostingGraphObservationInvalidatable = self->_hostingGraphObservationInvalidatable;
  self->_hostingGraphObservationInvalidatable = v9;

  uint64_t v11 = [v8 localWindowGraphHostingContextID:v4];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

LABEL_6:
  [(SBInputUISceneController *)self _setupDefaultPresentationForTargetHostingGraph:v11 targetScene:v7];
  [(SBSystemUISceneController *)self _setNeedsPresentersEvaluation];
}

void __76__SBInputUISceneController__updateDefaultPresenterForTargetScene_contextID___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = (id *)(a1 + 40);
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    [WeakRetained _setupDefaultPresentationForTargetHostingGraph:v4 targetScene:*(void *)(a1 + 32)];

    [WeakRetained _setNeedsPresentersEvaluation];
  }
}

- (void)_setupDefaultPresentationForTargetHostingGraph:(id)a3 targetScene:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"SBInputUISceneController.m", 377, @"Invalid parameter not satisfying: %@", @"targetScene" object file lineNumber description];
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v9 = [v7 reverseObjectEnumerator];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v46;
LABEL_5:
    uint64_t v14 = 0;
    id v15 = v12;
    while (1)
    {
      if (*(void *)v46 != v13) {
        objc_enumerationMutation(v9);
      }
      uint64_t v16 = *(void **)(*((void *)&v45 + 1) + 8 * v14);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v12 = v16;
      if ((isKindOfClass & 1) == 0) {
        break;
      }

      ++v14;
      id v15 = v12;
      if (v11 == v14)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v11) {
          goto LABEL_5;
        }
        id v15 = v12;
        id v12 = 0;
        break;
      }
    }
  }
  else
  {
    id v15 = 0;
    id v12 = 0;
  }

  v18 = [v8 settings];
  id v19 = objc_msgSend(v18, "sb_displayConfigurationForSceneManagers");

  v20 = [v12 windowScene];
  id v21 = [(SBSystemUISceneController *)self defaultPresenter];

  if (v21)
  {
    id v22 = [(SBSystemUISceneController *)self defaultPresenter];
    id v23 = [v22 targetWindowScene];

    if (v12)
    {
      if ([v20 isEqual:v23]) {
        goto LABEL_26;
      }
      long long v24 = [(SBSystemUISceneController *)self defaultPresenter];
      id v25 = (id)[v24 dismissScene:self->_inputUIScene];

      long long v26 = [[SBSystemUISceneDefaultPresenter alloc] initWithWindowHostingPresentationOnWindowScene:v20];
    }
    else
    {
      id v44 = v8;
      id v29 = v7;
      id v30 = [(SBSystemUISceneController *)self defaultPresenter];
      id v31 = [v30 targetDisplayConfiguration];
      char v32 = [v31 isEqual:v19];

      if (v32)
      {
        id v7 = v29;
        id v8 = v44;
        goto LABEL_26;
      }
      long long v33 = [(SBSystemUISceneController *)self defaultPresenter];
      id v34 = (id)[v33 dismissScene:self->_inputUIScene];

      long long v26 = [[SBSystemUISceneDefaultPresenter alloc] initWithTargetDisplayConfiguration:v19];
      id v7 = v29;
      id v8 = v44;
    }
    [(SBSystemUISceneController *)self setDefaultPresenter:v26];
  }
  else
  {
    long long v27 = [SBSystemUISceneDefaultPresenter alloc];
    if (v12) {
      uint64_t v28 = [(SBSystemUISceneDefaultPresenter *)v27 initWithWindowHostingPresentationOnWindowScene:v20];
    }
    else {
      uint64_t v28 = [(SBSystemUISceneDefaultPresenter *)v27 initWithTargetDisplayConfiguration:v19];
    }
    id v23 = (void *)v28;
    [(SBSystemUISceneController *)self setDefaultPresenter:v28];
  }
LABEL_26:

  if (v12) {
    long long v35 = v12;
  }
  else {
    long long v35 = v15;
  }
  id v36 = v35;
  v37 = [(SBSystemUISceneController *)self defaultPresenter];
  uint64_t v38 = NSNumber;
  if (v36)
  {
    [v36 windowLevel];
    double v40 = v39 + 1.1;
  }
  else
  {
    double v40 = 1.79769313e308;
  }
  int v41 = [v38 numberWithDouble:v40];
  [v37 setPreferredWindowLevel:v41];

  v42 = SBLogInputUI();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v50 = v7;
    __int16 v51 = 2114;
    id v52 = v12;
    _os_log_impl(&dword_1D85BA000, v42, OS_LOG_TYPE_DEFAULT, "localWindowsGraphForFocusedContextID[%{public}@] targetWindow[%{public}@]", buf, 0x16u);
  }
}

- (id)_currentTraitsPipelineManager
{
  id v3 = [(id)SBApp windowSceneManager];
  id v4 = [(SBInputUISceneController *)self _currentDisplayConfiguration];
  uint64_t v5 = [v4 identity];
  uint64_t v6 = [v3 windowSceneForDisplayIdentity:v5];
  id v7 = [v6 traitsPipelineManager];

  return v7;
}

- (id)_currentDisplayConfiguration
{
  id v3 = [(SBSystemUISceneController *)self defaultPresenter];
  id v4 = [v3 targetWindowScene];

  uint64_t v5 = [(SBSystemUISceneController *)self defaultPresenter];
  uint64_t v6 = [v5 targetDisplayConfiguration];

  if (v4)
  {
    id v7 = [v4 _sbDisplayConfiguration];
LABEL_5:
    id v8 = v7;
    goto LABEL_6;
  }
  if (v6)
  {
    id v7 = v6;
    goto LABEL_5;
  }
  uint64_t v10 = [(FBScene *)self->_targetScene settings];
  id v8 = objc_msgSend(v10, "sb_displayConfigurationForSceneManagers");

LABEL_6:
  return v8;
}

- (void)_userSwipedToKillFromSwitcher:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBSystemUISceneController *)self clientProcessIdentity];
  uint64_t v6 = [MEMORY[0x1E4F62448] sharedInstanceIfExists];
  id v7 = [v6 processForIdentity:v5];

  if ([v7 isRunning])
  {
    objc_initWeak(&location, self);
    id v8 = (void *)MEMORY[0x1E4FA7C30];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__SBInputUISceneController__userSwipedToKillFromSwitcher___block_invoke;
    v14[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v15, &location);
    uint64_t v9 = [v8 userSwipedToKillActionWithTimeoutHandler:v14];
    uint64_t v10 = SBLogInputUI();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Sending SBSUIUserSwipedToKillAction", v13, 2u);
    }

    uint64_t v11 = [v7 workspace];
    id v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    [v11 sendActions:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __58__SBInputUISceneController__userSwipedToKillFromSwitcher___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained terminateWithReason:@"SBSUIUserSwipedToKillAction InputUI timeout"];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBInputUISceneController;
  id v4 = [(SBSystemUISceneController *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendObject:self->_sceneController withName:@"InputUI Scene Controller"];
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingGraphObservationInvalidatable, 0);
  objc_destroyWeak((id *)&self->_currentExternalPresenter);
  objc_storeStrong((id *)&self->_currentTraitsPipelineManager, 0);
  objc_storeStrong((id *)&self->_focusContext, 0);
  objc_storeStrong((id *)&self->_lastExternallyPresentedSceneToken, 0);
  objc_storeStrong((id *)&self->_targetScene, 0);
  objc_storeStrong((id *)&self->_inputUIScene, 0);
  objc_storeStrong((id *)&self->_sceneController, 0);
}

void __48__SBInputUISceneController_terminateWithReason___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "%{public}@ termination failed with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_targetSceneForKeyboardFocusContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Couldn't find a target scene for focused context: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end