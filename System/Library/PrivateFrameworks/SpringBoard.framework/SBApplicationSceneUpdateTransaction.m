@interface SBApplicationSceneUpdateTransaction
- (BOOL)_isReadyToLaunch;
- (BOOL)shouldSendActivationResult;
- (NSString)sceneIdentifier;
- (SBApplicationSceneEntity)applicationSceneEntity;
- (SBApplicationSceneUpdateTransaction)initWithApplicationSceneEntity:(id)a3 transitionRequest:(id)a4;
- (SBApplicationSceneUpdateTransaction)initWithApplicationSceneEntity:(id)a3 transitionRequest:(id)a4 delegate:(id)a5;
- (UIApplicationSceneSettings)sceneSettings;
- (id)_createUpdateTransactionForPreflightCompletion;
- (id)_customizedDescriptionProperties;
- (void)_didComplete;
- (void)_performSynchronizedCommit:(id)a3;
- (void)_sceneResizeLayoutDidFinish:(id)a3;
- (void)_sendActivationResultWithError:(id)a3;
- (void)_willBegin;
- (void)_willFailWithReason:(id)a3;
- (void)setShouldSendActivationResult:(BOOL)a3;
@end

@implementation SBApplicationSceneUpdateTransaction

- (void)_didComplete
{
  v6.receiver = self;
  v6.super_class = (Class)SBApplicationSceneUpdateTransaction;
  [(FBApplicationUpdateScenesTransaction *)&v6 _didComplete];
  v3 = [(SBApplicationSceneEntity *)self->_applicationSceneEntity sceneHandle];
  [v3 setSceneUpdateInProgress:0];

  v4 = SBWTErrorCreateForTransaction(self);
  [(SBApplicationSceneUpdateTransaction *)self _sendActivationResultWithError:v4];

  if (!self->_requiresPreflight)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sceneUpdateTransaction:finishedApplyingUpdate:", self, -[SBApplicationSceneUpdateTransaction isFailed](self, "isFailed") ^ 1);
  }
}

- (void)_sendActivationResultWithError:(id)a3
{
  id v4 = a3;
  if (self->_shouldSendActivationResult)
  {
    v8 = v4;
    BOOL v5 = [(SBWorkspaceApplicationSceneTransitionContext *)self->_transitionContext needsToSendActivationResult];
    id v4 = v8;
    if (v5)
    {
      [(SBWorkspaceApplicationSceneTransitionContext *)self->_transitionContext sendActivationResultError:v8];
      int v6 = [(SBApplicationSceneUpdateTransaction *)self isAuditHistoryEnabled];
      id v4 = v8;
      if (v6)
      {
        v7 = [v8 localizedFailureReason];
        -[SBApplicationSceneUpdateTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", @"Sent activation result; error = %@",
          v7);

        id v4 = v8;
      }
    }
  }
}

- (void)_willBegin
{
  v15.receiver = self;
  v15.super_class = (Class)SBApplicationSceneUpdateTransaction;
  [(FBApplicationUpdateScenesTransaction *)&v15 _willBegin];
  if (self->_requiresPreflight)
  {
    v3 = [(SBWorkspaceTransitionContext *)self->_transitionContext request];
    uint64_t v4 = [v3 source];

    if (v4 != 14)
    {
      if ([(SBApplicationSceneUpdateTransaction *)self isAuditHistoryEnabled]) {
        [(SBApplicationSceneUpdateTransaction *)self _addAuditHistoryItem:@"running preflight for %@", self->_sceneIdentifier];
      }
      objc_initWeak(&location, self);
      privacyPreflightController = self->_privacyPreflightController;
      applicationIdentity = self->_applicationIdentity;
      sceneIdentifier = self->_sceneIdentifier;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke;
      v12[3] = &unk_1E6B0C128;
      v12[4] = self;
      objc_copyWeak(&v13, &location);
      [(SBPrivacyPreflightController *)privacyPreflightController preflightLaunchForApplication:applicationIdentity sceneIdentifier:sceneIdentifier withCompletionHandler:v12];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v8 = [(SBApplicationSceneEntity *)self->_applicationSceneEntity sceneHandle];
    [v8 setSceneUpdateInProgress:1];

    v9 = [(SBWorkspaceTransitionRequest *)self->_request applicationContext];
    int v10 = [v9 isInLiveResize];

    if (v10)
    {
      [(SBApplicationSceneUpdateTransaction *)self addMilestone:@"SBApplicationSceneUpdateTransactionLiveResizeFinishedMilestone"];
      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 addObserver:self selector:sel__sceneResizeLayoutDidFinish_ name:@"SBSceneResizeLayoutDidFinishNotification" object:0];
    }
  }
}

- (SBApplicationSceneUpdateTransaction)initWithApplicationSceneEntity:(id)a3 transitionRequest:(id)a4
{
  return [(SBApplicationSceneUpdateTransaction *)self initWithApplicationSceneEntity:a3 transitionRequest:a4 delegate:0];
}

- (BOOL)_isReadyToLaunch
{
  return !self->_requiresPreflight;
}

- (void)_performSynchronizedCommit:(id)a3
{
  applicationSceneEntity = self->_applicationSceneEntity;
  id v5 = a3;
  int v6 = [(SBApplicationSceneEntity *)applicationSceneEntity application];
  v7 = [(SBWorkspaceTransitionRequest *)self->_request displayConfiguration];
  id v8 = (id)[v6 _prepareInitializationContextIfNecessaryForLaunchOnDisplayConfiguration:v7];

  v9.receiver = self;
  v9.super_class = (Class)SBApplicationSceneUpdateTransaction;
  [(FBSynchronizedTransactionGroup *)&v9 _performSynchronizedCommit:v5];

  if (self->_shouldSendActivationResult)
  {
    if ([(SBWorkspaceApplicationSceneTransitionContext *)self->_transitionContext needsToSendActivationResult])
    {
      [(SBApplicationSceneUpdateTransaction *)self _sendActivationResultWithError:0];
    }
  }
}

- (SBApplicationSceneUpdateTransaction)initWithApplicationSceneEntity:(id)a3 transitionRequest:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id obj = a4;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 applicationContext];
  if (v10)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_21:
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"SBApplicationSceneUpdateTransaction.m", 67, @"Invalid parameter not satisfying: %@", @"applicationSceneEntity" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_22;
  }
  v52 = [MEMORY[0x1E4F28B00] currentHandler];
  [v52 handleFailureInMethod:a2, self, @"SBApplicationSceneUpdateTransaction.m", 66, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

  if (!v9) {
    goto LABEL_21;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_22:
  v54 = [MEMORY[0x1E4F28B00] currentHandler];
  [v54 handleFailureInMethod:a2, self, @"SBApplicationSceneUpdateTransaction.m", 68, @"Invalid parameter not satisfying: %@", @"transitionContext" object file lineNumber description];

LABEL_4:
  [v10 finalize];
  id v13 = [v9 sceneHandle];
  v14 = [v9 application];
  objc_super v15 = [v14 info];
  [v15 processIdentity];
  uint64_t v17 = v16 = self;

  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __97__SBApplicationSceneUpdateTransaction_initWithApplicationSceneEntity_transitionRequest_delegate___block_invoke;
  v62[3] = &unk_1E6B02A88;
  id v18 = v13;
  id v63 = v18;
  id v19 = v10;
  id v64 = v19;
  id v20 = v9;
  id v65 = v20;
  v61.receiver = v16;
  v61.super_class = (Class)SBApplicationSceneUpdateTransaction;
  v60 = (void *)v17;
  v21 = [(FBApplicationUpdateScenesTransaction *)&v61 initWithProcessIdentity:v17 executionContextProvider:v62];
  v22 = v21;
  if (v21)
  {
    SEL v56 = a2;
    id v58 = v11;
    objc_storeWeak((id *)&v21->_delegate, v11);
    objc_storeStrong((id *)&v22->_request, obj);
    objc_storeStrong((id *)&v22->_transitionContext, v12);
    uint64_t v23 = [v20 copy];
    applicationSceneEntity = v22->_applicationSceneEntity;
    v22->_applicationSceneEntity = (SBApplicationSceneEntity *)v23;

    v25 = [v20 activationSettings];
    v22->_suspendedActivation = [v25 BOOLForActivationSetting:3];

    uint64_t v26 = [v18 sceneIdentifier];
    sceneIdentifier = v22->_sceneIdentifier;
    v22->_sceneIdentifier = (NSString *)v26;

    v28 = [v18 sceneIfExists];
    v29 = [v28 identity];

    v30 = +[SBSceneManagerCoordinator sharedInstance];
    v31 = [v19 displayIdentity];
    v32 = [v30 sceneManagerForDisplayIdentity:v31];

    uint64_t v33 = [v18 sceneManager];
    v34 = (void *)v33;
    if (v29 && v32 && v33 && (BSEqualObjects() & 1) == 0) {
      [v34 transferOwnershipOfSceneWithIdentity:v29 toSceneManager:v32];
    }
    v57 = v34;
    v35 = [v19 applicationContext];
    uint64_t v36 = [v18 _createParametersFromTransitionContext:v35 entity:v20];
    sceneParameters = v22->_sceneParameters;
    v22->_sceneParameters = (FBSMutableSceneParameters *)v36;

    v38 = [v19 applicationContext];
    uint64_t v39 = [v18 _createApplicationSceneTransitionContextFromContext:v38 entity:v20];
    sceneTransitionContext = v22->_sceneTransitionContext;
    v22->_sceneTransitionContext = (UIApplicationSceneTransitionContext *)v39;

    if (v22->_suspendedActivation || ([v12 waitsForSceneUpdates] & 1) == 0) {
      [(FBApplicationUpdateScenesTransaction *)v22 setWaitsForSceneCommits:0];
    }
    v41 = [(SBApplicationSceneEntity *)v22->_applicationSceneEntity application];
    v42 = [v41 info];
    uint64_t v43 = [v42 applicationIdentity];
    applicationIdentity = v22->_applicationIdentity;
    v22->_applicationIdentity = (LSApplicationIdentity *)v43;

    if (!v22->_applicationIdentity)
    {
      v55 = [MEMORY[0x1E4F28B00] currentHandler];
      [v55 handleFailureInMethod:v56, v22, @"SBApplicationSceneUpdateTransaction.m", 104, @"failed to find LSApplicationIDentity for scene entity: %@", v20 object file lineNumber description];
    }
    uint64_t v45 = [(id)SBApp privacyPreflightController];
    privacyPreflightController = v22->_privacyPreflightController;
    v22->_privacyPreflightController = (SBPrivacyPreflightController *)v45;

    v47 = [(FBSMutableSceneParameters *)v22->_sceneParameters settings];
    int v48 = [v47 isForeground];

    if (v48) {
      BOOL v49 = [(SBPrivacyPreflightController *)v22->_privacyPreflightController requiresPreflightForApplication:v22->_applicationIdentity];
    }
    else {
      BOOL v49 = 0;
    }
    v22->_requiresPreflight = v49;
    [(FBApplicationUpdateScenesTransaction *)v22 updateSceneWithIdentifier:v22->_sceneIdentifier parameters:v22->_sceneParameters transitionContext:v22->_sceneTransitionContext];
    v50 = [(UIApplicationSceneTransitionContext *)v22->_sceneTransitionContext animationFence];
    [v50 invalidate];

    id v11 = v58;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_privacyPreflightController, 0);
  objc_storeStrong((id *)&self->_sceneTransitionContext, 0);
  objc_storeStrong((id *)&self->_sceneParameters, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_applicationIdentity, 0);
  objc_storeStrong((id *)&self->_applicationSceneEntity, 0);
}

id __97__SBApplicationSceneUpdateTransaction_initWithApplicationSceneEntity_transitionRequest_delegate___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) applicationContext];
  uint64_t v4 = [v2 _createProcessExecutionContextFromContext:v3 entity:*(void *)(a1 + 48)];

  return v4;
}

- (UIApplicationSceneSettings)sceneSettings
{
  return (UIApplicationSceneSettings *)[(FBSMutableSceneParameters *)self->_sceneParameters settings];
}

void __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if ([*(id *)(a1 + 32) isAuditHistoryEnabled]) {
    [*(id *)(a1 + 32) _addAuditHistoryItem:@"after-preflight update completed"];
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained(WeakRetained + 39);
    id v9 = v8;
    if (a3)
    {
      if (a2)
      {
        if (a2 != 2)
        {
          if (a2 == 1)
          {
            id v10 = [*(id *)(a1 + 32) _createUpdateTransactionForPreflightCompletion];
            uint64_t v13 = MEMORY[0x1E4F143A8];
            uint64_t v14 = 3221225472;
            objc_super v15 = __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke_2;
            v16 = &unk_1E6B0C100;
            id v17 = v10;
            id v18 = v9;
            id v19 = v7;
            uint64_t v20 = *(void *)(a1 + 32);
            [v10 setCompletionBlock:&v13];
            if (objc_msgSend(*(id *)(a1 + 32), "isAuditHistoryEnabled", v13, v14, v15, v16)) {
              [*(id *)(a1 + 32) _addAuditHistoryItem:@"running after-preflight update"];
            }
            [v10 begin];
          }
          goto LABEL_15;
        }
      }
      else
      {
        SBWorkspaceDestroyApplicationEntity(*(void **)(*(void *)(a1 + 32) + 232));
      }
      id v8 = v9;
      v12 = v7;
      BOOL v11 = 0;
    }
    else
    {
      BOOL v11 = a2 == 1;
      v12 = v7;
    }
    [v8 sceneUpdateTransaction:v12 finishedApplyingUpdate:v11];
LABEL_15:
  }
}

uint64_t __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    [v3 sceneUpdateTransaction:*(void *)(a1 + 48) finishedApplyingUpdate:a2];
  }
  else if ((a2 & 1) == 0)
  {
    if ([*(id *)(a1 + 56) isAuditHistoryEnabled])
    {
      uint64_t v4 = *(void **)(a1 + 56);
      id v5 = [*(id *)(a1 + 32) error];
      [v4 _addAuditHistoryItem:@"after-preflight update failed. taking our ball and going home(screen): %@", v5];
    }
    int v6 = +[SBMainWorkspace sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke_5;
    v8[3] = &unk_1E6AFBD00;
    v8[4] = *(void *)(a1 + 56);
    [v6 requestTransitionWithOptions:4 builder:&__block_literal_global_366 validator:v8];
  }
  uint64_t result = [*(id *)(a1 + 56) isAuditHistoryEnabled];
  if (result) {
    return [*(id *)(a1 + 56) _addAuditHistoryItem:@"after-preflight update completed"];
  }
  return result;
}

uint64_t __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 modifyApplicationContext:&__block_literal_global_36_0];
}

void __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setRequestedUnlockedEnvironmentMode:1];
  id v3 = +[SBWorkspaceEntity entity];
  [v2 setActivatingEntity:v3];
}

BOOL __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 applicationContext];
  uint64_t v4 = [v3 previousLayoutState];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 232) uniqueIdentifier];
  int v6 = [v4 elementWithIdentifier:v5];

  if (!v6 && [*(id *)(a1 + 32) isAuditHistoryEnabled]) {
    [*(id *)(a1 + 32) _addAuditHistoryItem:@"our scene entity isn't in the previousLayoutState, so not bothering with going home"];
  }
  return v6 != 0;
}

- (void)_willFailWithReason:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBApplicationSceneUpdateTransaction;
  [(FBApplicationUpdateScenesTransaction *)&v5 _willFailWithReason:a3];
  uint64_t v4 = [(SBApplicationSceneEntity *)self->_applicationSceneEntity sceneHandle];
  [v4 setSceneUpdateInProgress:0];
}

- (id)_customizedDescriptionProperties
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(SBWorkspaceEntity *)self->_applicationSceneEntity succinctDescription];
  [v3 setObject:v4 forKey:@"Application"];

  objc_super v5 = NSStringFromBOOL();
  [v3 setObject:v5 forKey:@"Requires Preflight"];

  [v3 setObject:self->_sceneIdentifier forKey:@"SceneID"];
  int v6 = [(SBWorkspaceTransitionRequest *)self->_request displayIdentity];
  [v3 setObject:v6 forKey:@"Display"];

  v7 = NSStringFromBOOL();
  [v3 setObject:v7 forKey:@"Launch Suspended"];

  id v8 = [(UIApplicationSceneTransitionContext *)self->_sceneTransitionContext actions];
  if ([v8 count])
  {
    v21 = v3;
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_super v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v15 UIActionType] != 1
            || (v16 = (void *)MEMORY[0x1E4F4F718],
                [v15 url],
                id v17 = objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v16, "descriptionForObject:withObjectsAndNames:", v15, v17, &stru_1F3084718, 0),
                id v18 = objc_claimAutoreleasedReturnValue(),
                v17,
                !v18))
          {
            id v18 = [MEMORY[0x1E4F4F718] descriptionForObject:v15];
          }
          [v9 addObject:v18];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    if ((unint64_t)[v9 count] < 2)
    {
      id v19 = [v9 firstObject];
      id v3 = v21;
      [v21 setObject:v19 forKey:@"Action"];
    }
    else
    {
      id v3 = v21;
      [v21 setObject:v9 forKey:@"Actions"];
    }
  }
  return v3;
}

- (void)_sceneResizeLayoutDidFinish:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:@"SBSceneResizeLayoutDidFinishNotificationSceneIdentifierKey"];

  if ([v6 isEqualToString:self->_sceneIdentifier])
  {
    objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:@"SBSceneResizeLayoutDidFinishNotification" object:0];

    [(SBApplicationSceneUpdateTransaction *)self satisfyMilestone:@"SBApplicationSceneUpdateTransactionLiveResizeFinishedMilestone"];
  }
}

- (id)_createUpdateTransactionForPreflightCompletion
{
  id v3 = [(SBWorkspaceTransitionRequest *)self->_request workspace];
  uint64_t v4 = [(SBWorkspaceTransitionRequest *)self->_request displayConfiguration];
  objc_super v5 = [v3 createRequestWithOptions:0 displayConfiguration:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v5, "setSource:", -[SBWorkspaceTransitionRequest source](self->_request, "source"));
    }
  }
  [v5 setEventLabel:@"AfterPreflightSceneUpdateTransaction"];
  [v5 setApplicationContext:self->_transitionContext];
  [v5 finalize];
  id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithApplicationSceneEntity:self->_applicationSceneEntity transitionRequest:v5];

  return v6;
}

- (SBApplicationSceneEntity)applicationSceneEntity
{
  return self->_applicationSceneEntity;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (BOOL)shouldSendActivationResult
{
  return self->_shouldSendActivationResult;
}

- (void)setShouldSendActivationResult:(BOOL)a3
{
  self->_shouldSendActivationResult = a3;
}

@end