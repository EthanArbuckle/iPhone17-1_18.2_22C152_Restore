@interface SBWorkspaceTransitionRequest
- (BOOL)isFinalized;
- (BOOL)isMainWorkspaceTransitionRequest;
- (BSProcessHandle)originatingProcess;
- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBSDisplayIdentity)displayIdentity;
- (NSSet)fromApplicationSceneEntities;
- (NSSet)toApplicationSceneEntities;
- (NSString)description;
- (NSString)eventLabel;
- (NSUUID)uniqueID;
- (SBWorkspace)workspace;
- (SBWorkspaceApplicationSceneTransitionContext)applicationContext;
- (SBWorkspaceTransientOverlayTransitionContext)transientOverlayContext;
- (SBWorkspaceTransitionRequest)init;
- (id)_initWithWorkspace:(id)a3 displayConfiguration:(id)a4;
- (id)compactDescriptionBuilder;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)layoutStateForApplicationTransitionContext:(id)a3;
- (id)previousLayoutStateForApplicationTransitionContext:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)declineWithReason:(id)a3;
- (void)finalize;
- (void)modifyApplicationContext:(id)a3;
- (void)modifyTransientOverlayContext:(id)a3;
- (void)setApplicationContext:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setEventLabel:(id)a3;
- (void)setEventLabelWithFormat:(id)a3;
- (void)setOriginatingProcess:(id)a3;
- (void)setTransientOverlayContext:(id)a3;
@end

@implementation SBWorkspaceTransitionRequest

- (SBWorkspaceTransientOverlayTransitionContext)transientOverlayContext
{
  return self->_transientOverlayContext;
}

- (void)finalize
{
  if (!self->_finalized)
  {
    self->_finalized = 1;
    if (!self->_displayConfiguration)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"SBWorkspaceTransitionRequest.m" lineNumber:129 description:@"must have a display"];
    }
    if (!self->_workspace)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"SBWorkspaceTransitionRequest.m" lineNumber:130 description:@"must have a workspace"];
    }
    v4 = [(SBWorkspaceTransitionRequest *)self applicationContext];
    [v4 setRequest:self];

    id v7 = [(SBWorkspaceTransitionRequest *)self applicationContext];
    [v7 finalize];
  }
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  return [(SBLayoutStateTransitionCoordinator *)self->_layoutStateTransitionCoordinator previousLayoutStateForApplicationTransitionContext:a3];
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  return [(SBLayoutStateTransitionCoordinator *)self->_layoutStateTransitionCoordinator layoutStateForApplicationTransitionContext:a3];
}

- (FBSDisplayIdentity)displayIdentity
{
  return (FBSDisplayIdentity *)[(FBSDisplayConfiguration *)self->_displayConfiguration identity];
}

- (BSProcessHandle)originatingProcess
{
  return self->_originatingProcess;
}

- (SBWorkspaceApplicationSceneTransitionContext)applicationContext
{
  return self->_applicationContext;
}

- (NSString)eventLabel
{
  return self->_eventLabel;
}

- (SBWorkspace)workspace
{
  return self->_workspace;
}

- (void)setEventLabel:(id)a3
{
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void)setTransientOverlayContext:(id)a3
{
}

- (id)compactDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_eventLabel withName:@"eventLabel" skipIfNil:1];
  v5 = [(FBSDisplayConfiguration *)self->_displayConfiguration identity];
  id v6 = (id)[v3 appendObject:v5 withName:@"display"];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__SBWorkspaceTransitionRequest_compactDescriptionBuilder__block_invoke;
  v11[3] = &unk_1E6AF5290;
  v11[4] = self;
  id v7 = v3;
  id v12 = v7;
  [v7 appendBodySectionWithName:0 multilinePrefix:0 block:v11];
  v8 = v12;
  id v9 = v7;

  return v9;
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (void)declineWithReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_finalized)
  {
    v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(SBWorkspaceTransitionRequest *)self succinctDescription];
      *(_DWORD *)buf = 138543618;
      v10 = v6;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Transition request %{public}@ was declined: %{public}@", buf, 0x16u);
    }
    id v7 = [(SBWorkspaceTransitionRequest *)self applicationContext];
    v8 = FBSOpenApplicationErrorCreate();
    objc_msgSend(v7, "sendActivationResultError:", v8, v4);
  }
}

- (void)modifyApplicationContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    applicationContext = self->_applicationContext;
    id v7 = v4;
    if (!applicationContext)
    {
      id v6 = +[SBWorkspaceTransitionContext context];
      [(SBWorkspaceTransitionRequest *)self setApplicationContext:v6];

      id v4 = v7;
      applicationContext = self->_applicationContext;
    }
    (*((void (**)(id, SBWorkspaceApplicationSceneTransitionContext *))v4 + 2))(v7, applicationContext);
    id v4 = v7;
  }
}

- (id)succinctDescription
{
  v2 = [(SBWorkspaceTransitionRequest *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_eventLabel withName:@"eventLabel" skipIfNil:1];
  v5 = [(FBSDisplayConfiguration *)self->_displayConfiguration identity];
  id v6 = (id)[v3 appendObject:v5 withName:@"display"];

  return v3;
}

- (NSSet)toApplicationSceneEntities
{
  v2 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  v3 = [v2 applicationSceneEntities];

  return (NSSet *)v3;
}

- (id)_initWithWorkspace:(id)a3 displayConfiguration:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBWorkspaceTransitionRequest.m", 47, @"Invalid parameter not satisfying: %@", @"workspace" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"SBWorkspaceTransitionRequest.m", 48, @"Invalid parameter not satisfying: %@", @"displayConfiguration" object file lineNumber description];

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)SBWorkspaceTransitionRequest;
  __int16 v11 = [(SBWorkspaceTransitionRequest *)&v26 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_workspace, a3);
    objc_storeStrong((id *)&v12->_displayConfiguration, a4);
    uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v13 copy];
    uniqueID = v12->_uniqueID;
    v12->_uniqueID = (NSUUID *)v14;

    v16 = [(id)SBApp windowSceneManager];
    v17 = [v10 identity];
    v18 = [v16 windowSceneForDisplayIdentity:v17];
    uint64_t v19 = [v18 layoutStateTransitionCoordinator];
    layoutStateTransitionCoordinator = v12->_layoutStateTransitionCoordinator;
    v12->_layoutStateTransitionCoordinator = (SBLayoutStateTransitionCoordinator *)v19;

    v12->_interfaceOrientation = 0;
    v21 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
    applicationContext = v12->_applicationContext;
    v12->_applicationContext = v21;

    [(SBWorkspaceTransitionContext *)v12->_applicationContext setRequest:v12];
  }

  return v12;
}

- (void)setApplicationContext:(id)a3
{
  v5 = (SBWorkspaceApplicationSceneTransitionContext *)a3;
  applicationContext = self->_applicationContext;
  if (applicationContext != v5)
  {
    id v7 = v5;
    [(SBWorkspaceTransitionContext *)applicationContext setRequest:0];
    objc_storeStrong((id *)&self->_applicationContext, a3);
    [(SBWorkspaceTransitionContext *)self->_applicationContext setRequest:self];
    v5 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientOverlayContext, 0);
  objc_storeStrong((id *)&self->_originatingProcess, 0);
  objc_storeStrong((id *)&self->_applicationContext, 0);
  objc_storeStrong((id *)&self->_layoutStateTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_eventLabel, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

- (NSString)description
{
  return (NSString *)[(SBWorkspaceTransitionRequest *)self descriptionWithMultilinePrefix:0];
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBLayoutStateTransitionCoordinator *)self->_layoutStateTransitionCoordinator sceneEntityFrameProvider];
  if (v8)
  {
    id v9 = [v6 layoutState];
    [v8 sceneEntityFrameForWorkspaceEntity:v7 inLayoutState:v9];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

void __57__SBWorkspaceTransitionRequest_compactDescriptionBuilder__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  if (v3)
  {
    id v4 = *(void **)(a1 + 40);
    v5 = [v4 activeMultilinePrefix];
    id v6 = [v3 compactDescriptionBuilderWithMultilinePrefix:v5];
    id v7 = [v6 build];
    id v8 = (id)[v4 appendObject:v7 withName:@"applicationContext"];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v9 = *(void **)(v2 + 80);
  if (v9)
  {
    double v10 = *(void **)(a1 + 40);
    id v14 = [v10 activeMultilinePrefix];
    double v11 = [v9 compactDescriptionBuilderWithMultilinePrefix:v14];
    double v12 = [v11 build];
    id v13 = (id)[v10 appendObject:v12 withName:@"transientOverlayContext"];
  }
}

- (void)setOriginatingProcess:(id)a3
{
}

- (void)setEventLabelWithFormat:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(SBWorkspaceTransitionRequest *)self setEventLabel:v6];
}

id __70__SBWorkspaceTransitionRequest_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"displayConfiguration"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"applicationContext" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 80) withName:@"transientOverlayContext" skipIfNil:1];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBWorkspaceTransitionRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBWorkspaceTransitionRequest *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__SBWorkspaceTransitionRequest_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  double v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

- (SBWorkspaceTransitionRequest)init
{
  return (SBWorkspaceTransitionRequest *)[(SBWorkspaceTransitionRequest *)self _initWithWorkspace:0 displayConfiguration:0];
}

- (void)modifyTransientOverlayContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    transientOverlayContext = self->_transientOverlayContext;
    id v7 = v4;
    if (!transientOverlayContext)
    {
      id v6 = +[SBWorkspaceTransitionContext context];
      [(SBWorkspaceTransitionRequest *)self setTransientOverlayContext:v6];

      id v4 = v7;
      transientOverlayContext = self->_transientOverlayContext;
    }
    (*((void (**)(id, SBWorkspaceTransientOverlayTransitionContext *))v4 + 2))(v7, transientOverlayContext);
    id v4 = v7;
  }
}

- (void)setDisplayConfiguration:(id)a3
{
  id v10 = (FBSDisplayConfiguration *)a3;
  if (self->_displayConfiguration != v10)
  {
    objc_storeStrong((id *)&self->_displayConfiguration, a3);
    id v5 = [(id)SBApp windowSceneManager];
    id v6 = [(FBSDisplayConfiguration *)v10 identity];
    id v7 = [v5 windowSceneForDisplayIdentity:v6];
    id v8 = [v7 layoutStateTransitionCoordinator];
    layoutStateTransitionCoordinator = self->_layoutStateTransitionCoordinator;
    self->_layoutStateTransitionCoordinator = v8;
  }
}

- (BOOL)isMainWorkspaceTransitionRequest
{
  return 0;
}

- (NSSet)fromApplicationSceneEntities
{
  id v2 = [(SBWorkspaceTransitionRequest *)self applicationContext];
  id v3 = [v2 previousApplicationSceneEntities];

  return (NSSet *)v3;
}

@end