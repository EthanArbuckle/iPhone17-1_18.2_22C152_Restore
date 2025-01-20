@interface PSPointerSystemClientController
- (PSPointerSystemClientController)init;
- (PSPointerSystemClientControllerDelegate)delegate;
- (id)_sceneIdentifierForIdentifierPrefix:(id)a3 displayConfiguration:(id)a4;
- (void)_invalidateSceneForIdentifierPrefix:(id)a3 displayConfiguration:(id)a4;
- (void)_prepareSceneForIdentifierPrefix:(id)a3 displayConfiguration:(id)a4;
- (void)_setRootWindowTransform:(CGAffineTransform *)a3 sceneForIdentifierPrefix:(id)a4 displayConfiguration:(id)a5;
- (void)invalidateScenesForPointerForDisplayConfiguration:(id)a3;
- (void)prepareScenesForPointerForDisplayConfiguration:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneWillDeactivate:(id)a3 withError:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setRootWindowTransform:(CGAffineTransform *)a3 forDisplayConfiguration:(id)a4;
- (void)workspace:(id)a3 clientDidConnectWithHandshake:(id)a4;
- (void)workspace:(id)a3 didAddScene:(id)a4;
@end

@implementation PSPointerSystemClientController

- (PSPointerSystemClientController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PSPointerSystemClientController;
  v2 = [(PSPointerSystemClientController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F96408] identityForDaemonJobLabel:@"com.apple.PointerUI.pointeruid"];
    pointerUIDProcessIdentity = v2->_pointerUIDProcessIdentity;
    v2->_pointerUIDProcessIdentity = (RBSProcessIdentity *)v3;
  }
  return v2;
}

- (void)prepareScenesForPointerForDisplayConfiguration:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [v4 hardwareIdentifier];
    int v7 = 138543618;
    v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1D941E000, v5, OS_LOG_TYPE_DEFAULT, "Preparing scenes for display with hardware identifier: %{public}@ displayConfiguration: %@", (uint8_t *)&v7, 0x16u);
  }
  [(PSPointerSystemClientController *)self _prepareSceneForIdentifierPrefix:@"com.apple.PointerUI.pointeruid.pointerRenderingScene" displayConfiguration:v4];
  [(PSPointerSystemClientController *)self _prepareSceneForIdentifierPrefix:@"com.apple.PointerUI.pointeruid.systemPointerScene" displayConfiguration:v4];
}

- (void)_prepareSceneForIdentifierPrefix:(id)a3 displayConfiguration:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_sceneWorkspace)
  {
    v8 = (FBSceneWorkspace *)[objc_alloc(MEMORY[0x1E4F624B0]) initWithIdentifier:@"PSPointerClientControllerWorkspaceIdentifier"];
    sceneWorkspace = self->_sceneWorkspace;
    self->_sceneWorkspace = v8;

    [(FBSceneWorkspace *)self->_sceneWorkspace setDelegate:self];
  }
  id v10 = [(PSPointerSystemClientController *)self _sceneIdentifierForIdentifierPrefix:v6 displayConfiguration:v7];
  uint64_t v11 = [(FBSceneWorkspace *)self->_sceneWorkspace sceneWithIdentifier:v10];
  v12 = PSLogCommon();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      v37 = v10;
      _os_log_impl(&dword_1D941E000, v12, OS_LOG_TYPE_DEFAULT, "Activating existing scene with identifier: %{public}@", buf, 0xCu);
    }

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke_14;
    v26[3] = &unk_1E6B627E8;
    id v27 = v7;
    id v14 = v7;
    [v11 updateSettingsWithBlock:v26];
    [v11 activateWithTransitionContext:0];
    [v11 setDelegate:self];
    v15 = [(PSPointerSystemClientController *)self delegate];
    [v15 pointerClientController:self sceneDidActivate:v11];

    v16 = v27;
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      v37 = v10;
      _os_log_impl(&dword_1D941E000, v12, OS_LOG_TYPE_DEFAULT, "Creating new scene with identifier: %{public}@", buf, 0xCu);
    }

    v17 = objc_opt_new();
    if ([v10 containsString:@"com.apple.PointerUI.pointeruid.pointerRenderingScene"])double v18 = -1000.0; {
    else
    }
      double v18 = 10000015.5;
    [v17 setPreferredLevel:v18];
    [v17 setPreferredInterfaceOrientation:1];
    id v14 = [MEMORY[0x1E4F629C0] settings];
    [v14 setDisplayConfiguration:v7];
    [v7 bounds];
    objc_msgSend(v14, "setFrame:");
    [v14 setLevel:v18];
    [v14 setInterfaceOrientation:1];
    [v14 setForeground:1];
    v19 = (void *)MEMORY[0x1E4F629B8];
    v20 = [MEMORY[0x1E4F62AB0] specification];
    v16 = [v19 parametersForSpecification:v20];

    [v16 setSettings:v14];
    [v16 setClientSettings:v17];
    v21 = self->_pointerUIDProcessIdentity;
    v22 = self->_sceneWorkspace;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke;
    v33[3] = &unk_1E6B62770;
    id v34 = v10;
    v35 = v21;
    v23 = v21;
    uint64_t v11 = [(FBSceneWorkspace *)v22 createScene:v33];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke_2;
    v28[3] = &unk_1E6B627C0;
    id v29 = v17;
    id v30 = v7;
    double v31 = v18;
    uint64_t v32 = 1;
    id v24 = v7;
    id v25 = v17;
    [v11 configureParameters:v28];
    [v11 addExtension:objc_opt_class()];
    [v11 activateWithTransitionContext:0];
  }
}

void __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setIdentifier:v3];
  v5 = [FBSSceneClientIdentity identityForProcessIdentity:*(void *)(a1 + 40)];
  [v4 setClientIdentity:v5];

  id v6 = [MEMORY[0x1E4F62AB0] specification];
  [v4 setSpecification:v6];
}

void __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setClientSettings:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke_3;
  v5[3] = &unk_1E6B62798;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  [v4 updateSettingsWithBlock:v5];
}

void __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setDisplayConfiguration:v3];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setLevel:*(double *)(a1 + 40)];
  [v4 setInterfaceOrientation:*(void *)(a1 + 48)];
  [v4 setForeground:1];
}

void __89__PSPointerSystemClientController__prepareSceneForIdentifierPrefix_displayConfiguration___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setDisplayConfiguration:v3];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void)invalidateScenesForPointerForDisplayConfiguration:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 hardwareIdentifier];
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1D941E000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating scenes for display with hardware identifier: %{public}@ displayConfiguration: %@", (uint8_t *)&v7, 0x16u);
  }
  [(PSPointerSystemClientController *)self _invalidateSceneForIdentifierPrefix:@"com.apple.PointerUI.pointeruid.pointerRenderingScene" displayConfiguration:v4];
  [(PSPointerSystemClientController *)self _invalidateSceneForIdentifierPrefix:@"com.apple.PointerUI.pointeruid.systemPointerScene" displayConfiguration:v4];
}

- (void)_invalidateSceneForIdentifierPrefix:(id)a3 displayConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_sceneWorkspace)
  {
    uint64_t v8 = [(PSPointerSystemClientController *)self _sceneIdentifierForIdentifierPrefix:v6 displayConfiguration:v7];
    __int16 v9 = [(FBSceneWorkspace *)self->_sceneWorkspace sceneWithIdentifier:v8];
    id v10 = v9;
    if (v9)
    {
      [v9 invalidate];
    }
    else
    {
      uint64_t v11 = PSLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PSPointerSystemClientController _invalidateSceneForIdentifierPrefix:displayConfiguration:]((uint64_t)v6, v11);
      }
    }
  }
  else
  {
    uint64_t v8 = PSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PSPointerSystemClientController _invalidateSceneForIdentifierPrefix:displayConfiguration:]((uint64_t)v6, v7, v8);
    }
  }
}

- (id)_sceneIdentifierForIdentifierPrefix:(id)a3 displayConfiguration:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 hardwareIdentifier];
  if (v6) {
    id v7 = (__CFString *)v6;
  }
  else {
    id v7 = @"Main";
  }
  uint64_t v8 = [NSString stringWithFormat:@"%@.%@", v5, v7];

  return v8;
}

- (void)setRootWindowTransform:(CGAffineTransform *)a3 forDisplayConfiguration:(id)a4
{
  long long v6 = *(_OWORD *)&a3->c;
  long long v9 = *(_OWORD *)&a3->a;
  long long v10 = v6;
  long long v11 = *(_OWORD *)&a3->tx;
  id v7 = a4;
  [(PSPointerSystemClientController *)self _setRootWindowTransform:&v9 sceneForIdentifierPrefix:@"com.apple.PointerUI.pointeruid.pointerRenderingScene" displayConfiguration:v7];
  long long v8 = *(_OWORD *)&a3->c;
  long long v9 = *(_OWORD *)&a3->a;
  long long v10 = v8;
  long long v11 = *(_OWORD *)&a3->tx;
  [(PSPointerSystemClientController *)self _setRootWindowTransform:&v9 sceneForIdentifierPrefix:@"com.apple.PointerUI.pointeruid.systemPointerScene" displayConfiguration:v7];
}

- (void)_setRootWindowTransform:(CGAffineTransform *)a3 sceneForIdentifierPrefix:(id)a4 displayConfiguration:(id)a5
{
  id v8 = a4;
  long long v9 = [(PSPointerSystemClientController *)self _sceneIdentifierForIdentifierPrefix:v8 displayConfiguration:a5];
  long long v10 = [(FBSceneWorkspace *)self->_sceneWorkspace sceneWithIdentifier:v9];
  long long v11 = v10;
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __105__PSPointerSystemClientController__setRootWindowTransform_sceneForIdentifierPrefix_displayConfiguration___block_invoke;
    v14[3] = &__block_descriptor_80_e33_v16__0__FBSMutableSceneSettings_8l;
    long long v12 = *(_OWORD *)&a3->c;
    long long v15 = *(_OWORD *)&a3->a;
    long long v16 = v12;
    long long v17 = *(_OWORD *)&a3->tx;
    [v10 updateSettingsWithBlock:v14];
  }
  else
  {
    BOOL v13 = PSLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PSPointerSystemClientController _setRootWindowTransform:sceneForIdentifierPrefix:displayConfiguration:]((uint64_t)v8, v13);
    }
  }
}

void __105__PSPointerSystemClientController__setRootWindowTransform_sceneForIdentifierPrefix_displayConfiguration___block_invoke(_OWORD *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    long long v4 = a1[3];
    v5[0] = a1[2];
    v5[1] = v4;
    v5[2] = a1[4];
    [v3 setRootWindowTransform:v5];
  }
}

- (void)workspace:(id)a3 didAddScene:(id)a4
{
}

- (void)workspace:(id)a3 clientDidConnectWithHandshake:(id)a4
{
  id v5 = objc_msgSend(a4, "handle", a3);
  long long v6 = [v5 identity];
  int v7 = [v6 isEqual:self->_pointerUIDProcessIdentity];

  if (v7)
  {
    id v8 = PSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v10 = 0;
      _os_log_impl(&dword_1D941E000, v8, OS_LOG_TYPE_DEFAULT, "pointeruid wants workspace handshake", v10, 2u);
    }

    long long v9 = [(FBSceneWorkspace *)self->_sceneWorkspace allScenes];
    [v9 enumerateObjectsUsingBlock:&__block_literal_global];
  }
}

void __75__PSPointerSystemClientController_workspace_clientDidConnectWithHandshake___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (([v2 isActive] & 1) == 0)
  {
    id v3 = PSLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      long long v4 = [v2 identifier];
      int v5 = 138543362;
      long long v6 = v4;
      _os_log_impl(&dword_1D941E000, v3, OS_LOG_TYPE_DEFAULT, "reactivating scene: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    [v2 activateWithTransitionContext:0];
  }
}

- (void)sceneDidActivate:(id)a3
{
  id v4 = a3;
  id v5 = [(PSPointerSystemClientController *)self delegate];
  [v5 pointerClientController:self sceneDidActivate:v4];
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  id v5 = a3;
  id v6 = [(PSPointerSystemClientController *)self delegate];
  [v6 pointerClientController:self sceneWillDeactivate:v5];
}

- (PSPointerSystemClientControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PSPointerSystemClientControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pointerUIDProcessIdentity, 0);

  objc_storeStrong((id *)&self->_sceneWorkspace, 0);
}

- (void)_invalidateSceneForIdentifierPrefix:(NSObject *)a3 displayConfiguration:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 hardwareIdentifier];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  long long v9 = v5;
  _os_log_error_impl(&dword_1D941E000, a3, OS_LOG_TYPE_ERROR, "Scene workspace is not avaialble when invalidating scene %@ for %@", (uint8_t *)&v6, 0x16u);
}

- (void)_invalidateSceneForIdentifierPrefix:(uint64_t)a1 displayConfiguration:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D941E000, a2, OS_LOG_TYPE_ERROR, "Could not find scene with %{public}@ to invalidate", (uint8_t *)&v2, 0xCu);
}

- (void)_setRootWindowTransform:(uint64_t)a1 sceneForIdentifierPrefix:(NSObject *)a2 displayConfiguration:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D941E000, a2, OS_LOG_TYPE_ERROR, "Could not find scene with %{public}@ to set root window transform", (uint8_t *)&v2, 0xCu);
}

@end