@interface SBFSceneWorkspaceController
- (BOOL)enumerateScenesWithBlock:(id)a3;
- (NSString)debugDescription;
- (NSString)sceneWorkspaceIdentifier;
- (SBFSceneWorkspaceController)initWithIdentifier:(id)a3 delegate:(id)a4;
- (SBFSceneWorkspaceControllerDelegate)delegate;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)sceneFromIdentityToken:(id)a3;
- (id)sceneFromIdentityTokenStringRepresentation:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)createSceneForProcessIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)invalidate;
@end

@implementation SBFSceneWorkspaceController

- (BOOL)enumerateScenesWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, BOOL *))a3;
  BOOL v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(FBSceneWorkspace *)self->_sceneWorkspace allScenes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v9), &v16);
      if (v16) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  BOOL v10 = v16;
  return v10;
}

- (SBFSceneWorkspaceController)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBFSceneWorkspaceController.m", 28, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  BOOL v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SBFSceneWorkspaceController.m", 29, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)SBFSceneWorkspaceController;
  BOOL v10 = [(SBFSceneWorkspaceController *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F624B0]) initWithIdentifier:v7];
    sceneWorkspace = v11->_sceneWorkspace;
    v11->_sceneWorkspace = (FBSceneWorkspace *)v12;

    [(FBSceneWorkspace *)v11->_sceneWorkspace setDelegate:v9];
  }

  return v11;
}

- (NSString)sceneWorkspaceIdentifier
{
  return (NSString *)[(FBSceneWorkspace *)self->_sceneWorkspace identifier];
}

- (void)createSceneForProcessIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void *, void))a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBFSceneWorkspaceController.m", 44, @"Invalid parameter not satisfying: %@", @"processIdentity" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SBFSceneWorkspaceController.m", 45, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

LABEL_3:
  sceneWorkspace = self->_sceneWorkspace;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84__SBFSceneWorkspaceController_createSceneForProcessIdentity_withOptions_completion___block_invoke;
  v23[3] = &unk_1E548CDB8;
  id v13 = v10;
  id v24 = v13;
  id v25 = v9;
  id v14 = v9;
  long long v15 = [(FBSceneWorkspace *)sceneWorkspace createScene:v23];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__SBFSceneWorkspaceController_createSceneForProcessIdentity_withOptions_completion___block_invoke_2;
  v21[3] = &unk_1E548CDE0;
  id v22 = v13;
  id v16 = v13;
  [v15 configureParameters:v21];
  objc_super v17 = SBLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [(SBFSceneWorkspaceController *)self sceneWorkspaceIdentifier];
    *(_DWORD *)buf = 134218498;
    v27 = self;
    __int16 v28 = 2114;
    v29 = v18;
    __int16 v30 = 2114;
    v31 = v15;
    _os_log_impl(&dword_18B52E000, v17, OS_LOG_TYPE_DEFAULT, "SceneWorkspace[%p-%{public}@] di create App scene: %{public}@", buf, 0x20u);
  }
  if (v11) {
    v11[2](v11, v15, 0);
  }
}

void __84__SBFSceneWorkspaceController_createSceneForProcessIdentity_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 identifier];
  [v4 setIdentifier:v5];

  uint64_t v6 = [*(id *)(a1 + 32) specification];
  [v4 setSpecification:v6];

  id v7 = [FBSSceneClientIdentity identityForProcessIdentity:*(void *)(a1 + 40)];
  [v4 setClientIdentity:v7];
}

void __84__SBFSceneWorkspaceController_createSceneForProcessIdentity_withOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 initialClientSettings];
  [v3 setClientSettings:v4];
}

- (id)sceneFromIdentityToken:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBFSceneWorkspaceController.m", 65, @"Invalid parameter not satisfying: %@", @"token" object file lineNumber description];
  }
  uint64_t v6 = [v5 stringRepresentation];
  id v7 = [(SBFSceneWorkspaceController *)self sceneFromIdentityTokenStringRepresentation:v6];

  return v7;
}

- (id)sceneFromIdentityTokenStringRepresentation:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBFSceneWorkspaceController.m", 70, @"Invalid parameter not satisfying: %@", @"tokenString" object file lineNumber description];
  }
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__0;
  objc_super v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__SBFSceneWorkspaceController_sceneFromIdentityTokenStringRepresentation___block_invoke;
  v10[3] = &unk_1E548CE08;
  id v6 = v5;
  id v11 = v6;
  uint64_t v12 = &v13;
  [(SBFSceneWorkspaceController *)self enumerateScenesWithBlock:v10];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __74__SBFSceneWorkspaceController_sceneFromIdentityTokenStringRepresentation___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  id v6 = [v9 identityToken];
  id v7 = [v6 stringRepresentation];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(FBSceneWorkspace *)self->_sceneWorkspace allScenes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 setDelegate:0];
        [v8 invalidate];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(FBSceneWorkspace *)self->_sceneWorkspace setDelegate:0];
  [(FBSceneWorkspace *)self->_sceneWorkspace invalidate];
}

- (NSString)debugDescription
{
  return (NSString *)[(SBFSceneWorkspaceController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBFSceneWorkspaceController *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v4 = [(SBFSceneWorkspaceController *)self sceneWorkspaceIdentifier];
  [v3 appendString:v4 withName:@"identifier"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBFSceneWorkspaceController *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(SBFSceneWorkspaceController *)self succinctDescriptionBuilder];
  uint64_t v5 = [(FBSceneWorkspace *)self->_sceneWorkspace delegate];
  id v6 = (id)[v4 appendObject:v5 withName:@"FB workspace Delegate"];

  if ([(FBSceneWorkspace *)self->_sceneWorkspace conformsToProtocol:&unk_1ED8B7038])sceneWorkspace = self->_sceneWorkspace; {
  else
  }
    sceneWorkspace = 0;
  int v8 = [(FBSceneWorkspace *)sceneWorkspace succinctDescription];
  id v9 = (id)[v4 appendObject:v8 withName:@"FB workspace minus scenes"];

  return v4;
}

- (SBFSceneWorkspaceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFSceneWorkspaceControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneWorkspace, 0);
}

@end