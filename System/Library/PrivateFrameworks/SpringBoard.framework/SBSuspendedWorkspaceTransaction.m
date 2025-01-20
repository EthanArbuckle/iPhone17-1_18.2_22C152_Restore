@interface SBSuspendedWorkspaceTransaction
- (void)_addSceneEntityToAppRecency:(id)a3;
- (void)_begin;
- (void)_childTransactionDidComplete:(id)a3;
- (void)_didComplete;
- (void)_sendActivationResultWithError:(id)a3;
- (void)transaction:(id)a3 willLaunchProcess:(id)a4;
@end

@implementation SBSuspendedWorkspaceTransaction

- (void)transaction:(id)a3 willLaunchProcess:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ([(NSMutableSet *)self->_outstandingProcessLaunchTransactions containsObject:v12])
  {
    [(NSMutableSet *)self->_outstandingProcessLaunchTransactions removeObject:v12];
    if (([v6 isRunning] & 1) == 0)
    {
      anyLaunchError = self->_anyLaunchError;
      if (anyLaunchError)
      {
        v8 = anyLaunchError;
        v9 = self->_anyLaunchError;
        self->_anyLaunchError = v8;
      }
      else
      {
        v9 = [v6 exitContext];
        v10 = [v9 createError];
        v11 = self->_anyLaunchError;
        self->_anyLaunchError = v10;
      }
    }
    if (![(NSMutableSet *)self->_outstandingProcessLaunchTransactions count]) {
      [(SBSuspendedWorkspaceTransaction *)self _sendActivationResultWithError:self->_anyLaunchError];
    }
  }
}

- (void)_childTransactionDidComplete:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  if (!v9
    || ![(NSMutableSet *)self->_incompleteProcessLaunchTransactions containsObject:v9])
  {
    goto LABEL_50;
  }
  [(NSMutableSet *)self->_incompleteProcessLaunchTransactions removeObject:v9];
  v10 = [v9 process];
  int v11 = [v10 pid];
  if (v11 >= 1)
  {
    unsigned int v71 = v11;
    id v12 = [(NSMapTable *)self->_launchTransactionToSceneEntityMap objectForKey:v9];
    v13 = [v12 sceneHandle];
    if (!v13)
    {
      v63 = [MEMORY[0x1E4F28B00] currentHandler];
      [v63 handleFailureInMethod:a2 object:self file:@"SBSuspendedWorkspaceTransaction.m" lineNumber:90 description:@"should have stored a scene handle"];
    }
    v74 = [(SBWorkspaceTransaction *)self transitionRequest];
    v14 = [v74 applicationContext];
    v75 = [(NSError *)v13 _createApplicationSceneTransitionContextFromContext:v14 entity:v12];
    v15 = [v75 animationFence];

    if (v15)
    {
      v64 = [MEMORY[0x1E4F28B00] currentHandler];
      [v64 handleFailureInMethod:a2 object:self file:@"SBSuspendedWorkspaceTransaction.m" lineNumber:101 description:@"suspended launches cannot contain animation fences"];
    }
    v72 = v13;
    v73 = v14;
    if ([v14 isSceneless])
    {
      v65 = v10;
      id v66 = v9;
      if ([(SBSuspendedWorkspaceTransaction *)self isAuditHistoryEnabled]) {
        [(SBSuspendedWorkspaceTransaction *)self _addAuditHistoryItem:@"launched scene-less"];
      }
      v68 = self;
      v69 = v12;
      id v67 = v7;
      v16 = [v75 actions];
      v17 = (void *)[v16 mutableCopy];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v79 objects:v84 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v80;
        unint64_t v22 = 0x1E4F42000uLL;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v80 != v21) {
              objc_enumerationMutation(v18);
            }
            v24 = *(void **)(*((void *)&v79 + 1) + 8 * i);
            if ([v24 UIActionType] == 1 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              id v25 = objc_alloc(*(Class *)(v22 + 3104));
              v26 = [v24 url];
              v27 = [v24 workspaceOriginatingProcess];
              if (v27)
              {
                v28 = (void *)[v25 initWithURL:v26 workspaceOriginatingProcess:v27];
              }
              else
              {
                [v75 originatingProcess];
                id v29 = v18;
                v31 = v30 = v17;
                v28 = (void *)[v25 initWithURL:v26 workspaceOriginatingProcess:v31];

                v17 = v30;
                id v18 = v29;
                unint64_t v22 = 0x1E4F42000;
              }

              [v17 removeObject:v24];
              [v17 addObject:v28];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v79 objects:v84 count:16];
        }
        while (v20);
      }

      uint64_t v32 = [MEMORY[0x1E4F96478] targetWithPid:v71];
      v33 = [MEMORY[0x1E4F96308] attributeWithCompletionPolicy:1];
      v83[0] = v33;
      v34 = [MEMORY[0x1E4F96338] grantWithUserInteractivity];
      v83[1] = v34;
      v35 = [MEMORY[0x1E4F96390] grantWithForegroundPriority];
      v83[2] = v35;
      v36 = [MEMORY[0x1E4F96460] grantWithResistance:40];
      v83[3] = v36;
      [MEMORY[0x1E4F96350] grant];
      v38 = v37 = v17;
      v83[4] = v38;
      v39 = [MEMORY[0x1E4F96470] withReason:9];
      v83[5] = v39;
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:6];

      v41 = (void *)v32;
      v42 = (void *)[objc_alloc(MEMORY[0x1E4F96318]) initWithExplanation:@"SBHandleScenelessWorkspaceAction" target:v32 attributes:v40];
      [v42 acquireWithError:0];
      dispatch_time_t v43 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__SBSuspendedWorkspaceTransaction__childTransactionDidComplete___block_invoke;
      block[3] = &unk_1E6AF4AC0;
      id v78 = v42;
      id v44 = v42;
      dispatch_after(v43, MEMORY[0x1E4F14428], block);
      v10 = v65;
      v45 = [v65 workspace];
      [v45 sendActions:v37];

      v46 = [v69 application];
      v47 = [v46 _dataStore];
      v48 = [v69 uniqueIdentifier];
      [v47 removeSceneStoreForIdentifier:v48];

      id v12 = v69;
      id v7 = v67;
      self = v68;
      id v9 = v66;
    }
    else
    {
      v51 = [(NSError *)v13 sceneIdentifier];
      v52 = [(NSError *)v13 sceneIfExists];
      if (v52)
      {
        if ([(SBSuspendedWorkspaceTransaction *)self isAuditHistoryEnabled]) {
          [(SBSuspendedWorkspaceTransaction *)self _addAuditHistoryItem:@"sent transition to scene %@", v51];
        }
        v53 = [v52 settings];
        [v52 updateSettings:v53 withTransitionContext:v75];
      }
      else
      {
        v56 = [v74 applicationContext];
        v70 = v12;
        v53 = [(NSError *)v13 _createParametersFromTransitionContext:v56 entity:v12];

        if ([(SBSuspendedWorkspaceTransaction *)self isAuditHistoryEnabled]) {
          [(SBSuspendedWorkspaceTransaction *)self _addAuditHistoryItem:@"created scene %@", v51, v75];
        }
        v57 = [MEMORY[0x1E4F62490] sharedInstance];
        v58 = [v10 workspace];
        id v59 = (id)[v57 createSceneWithIdentifier:v51 parameters:v53 clientProvider:v58 transitionContext:v75];

        v60 = [v73 applicationSceneEntityForLayoutRole:4];
        v61 = v60;
        if (v60)
        {
          v62 = [v60 activationSettings];
          if ([v62 _settingsAreValidToMoveContentToNewScene]) {
            [(SBSuspendedWorkspaceTransaction *)self _addSceneEntityToAppRecency:v61];
          }
        }
        id v12 = v70;
      }
    }
    v55 = v72;
    goto LABEL_46;
  }
  p_anyLaunchError = &self->_anyLaunchError;
  anyLaunchError = self->_anyLaunchError;
  if (!anyLaunchError)
  {
    id v12 = [v10 exitContext];
    uint64_t v54 = [v12 createError];
    v55 = *p_anyLaunchError;
    *p_anyLaunchError = (NSError *)v54;
LABEL_46:

    goto LABEL_47;
  }
  objc_storeStrong((id *)&self->_anyLaunchError, anyLaunchError);
LABEL_47:
  if (![(NSMutableSet *)self->_incompleteProcessLaunchTransactions count])
  {
    [(SBSuspendedWorkspaceTransaction *)self _sendActivationResultWithError:self->_anyLaunchError];
    [(SBSuspendedWorkspaceTransaction *)self removeMilestone:@"waitForLaunches"];
  }

LABEL_50:
  v76.receiver = self;
  v76.super_class = (Class)SBSuspendedWorkspaceTransaction;
  [(SBSuspendedWorkspaceTransaction *)&v76 _childTransactionDidComplete:v7];
}

- (void)_didComplete
{
  v4.receiver = self;
  v4.super_class = (Class)SBSuspendedWorkspaceTransaction;
  [(SBMainWorkspaceTransaction *)&v4 _didComplete];
  v3 = SBWTErrorCreateForTransaction(self);
  [(SBSuspendedWorkspaceTransaction *)self _sendActivationResultWithError:v3];
}

- (void)_sendActivationResultWithError:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(SBWorkspaceTransaction *)self transitionRequest];
  id v5 = [v4 applicationContext];

  if ([v5 needsToSendActivationResult])
  {
    [v5 sendActivationResultError:v7];
    if ([(SBSuspendedWorkspaceTransaction *)self isAuditHistoryEnabled])
    {
      uint64_t v6 = [v7 localizedFailureReason];
      -[SBSuspendedWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", @"Sent activation result; error = %@",
        v6);
    }
  }
}

- (void)_begin
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  launchTransactionToSceneEntityMap = self->_launchTransactionToSceneEntityMap;
  self->_launchTransactionToSceneEntityMap = v3;

  id v5 = [(SBWorkspaceTransaction *)self transitionRequest];
  v35 = [v5 applicationContext];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v32 = v5;
  uint64_t v6 = [v5 applicationContext];
  id v7 = [v6 applicationSceneEntities];

  obuint64_t j = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v34 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v12 = [v11 sceneHandle];
        if (!v12)
        {
          uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
          [v19 handleFailureInMethod:a2 object:self file:@"SBSuspendedWorkspaceTransaction.m" lineNumber:58 description:@"must have a scene handle"];
        }
        id v13 = objc_alloc(MEMORY[0x1E4F62400]);
        v14 = [v12 application];
        v15 = [v14 info];
        v16 = [v15 processIdentity];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __41__SBSuspendedWorkspaceTransaction__begin__block_invoke;
        v41[3] = &unk_1E6B02A88;
        id v42 = v12;
        id v43 = v35;
        id v44 = v11;
        id v17 = v12;
        id v18 = (void *)[v13 initWithProcessIdentity:v16 executionContextProvider:v41];

        [(NSMapTable *)self->_launchTransactionToSceneEntityMap setObject:v11 forKey:v18];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v9);
  }

  if ([(NSMapTable *)self->_launchTransactionToSceneEntityMap count])
  {
    [(SBSuspendedWorkspaceTransaction *)self addMilestone:@"waitForLaunches"];
    uint64_t v20 = NSAllMapTableKeys(self->_launchTransactionToSceneEntityMap);
    uint64_t v21 = [MEMORY[0x1E4F1CA80] setWithArray:v20];
    outstandingProcessLaunchTransactions = self->_outstandingProcessLaunchTransactions;
    self->_outstandingProcessLaunchTransactions = v21;

    v23 = [MEMORY[0x1E4F1CA80] setWithArray:v20];
    incompleteProcessLaunchTransactions = self->_incompleteProcessLaunchTransactions;
    self->_incompleteProcessLaunchTransactions = v23;

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v25 = v20;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v38 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          [v30 addObserver:self];
          [(SBSuspendedWorkspaceTransaction *)self addChildTransaction:v30];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v27);
    }
  }
  v36.receiver = self;
  v36.super_class = (Class)SBSuspendedWorkspaceTransaction;
  [(SBSuspendedWorkspaceTransaction *)&v36 _begin];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anyLaunchError, 0);
  objc_storeStrong((id *)&self->_incompleteProcessLaunchTransactions, 0);
  objc_storeStrong((id *)&self->_outstandingProcessLaunchTransactions, 0);
  objc_storeStrong((id *)&self->_launchTransactionToSceneEntityMap, 0);
}

uint64_t __41__SBSuspendedWorkspaceTransaction__begin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createProcessExecutionContextFromContext:*(void *)(a1 + 40) entity:*(void *)(a1 + 48)];
}

uint64_t __64__SBSuspendedWorkspaceTransaction__childTransactionDidComplete___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_addSceneEntityToAppRecency:(id)a3
{
  v3 = [a3 sceneHandle];
  objc_super v4 = [v3 scene];
  id v5 = [v4 parameters];
  uint64_t v6 = (void *)[v5 mutableCopy];

  [v6 updateSettingsWithBlock:&__block_literal_global_176];
  id v7 = [v6 settings];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__SBSuspendedWorkspaceTransaction__addSceneEntityToAppRecency___block_invoke_2;
  v20[3] = &unk_1E6AF5350;
  id v21 = v4;
  id v8 = v4;
  [v8 updateSettings:v7 withTransitionContext:0 completion:v20];

  uint64_t v9 = [v3 application];
  v10 = [v9 bundleIdentifier];

  int v11 = [v3 sceneIdentifier];
  id v12 = +[SBDisplayItem applicationDisplayItemWithBundleIdentifier:v10 sceneIdentifier:v11];
  id v13 = [(id)SBApp windowSceneManager];
  v14 = [v3 displayIdentity];
  v15 = [v13 windowSceneForDisplayIdentity:v14];

  v16 = [v15 switcherController];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__SBSuspendedWorkspaceTransaction__addSceneEntityToAppRecency___block_invoke_4;
  v18[3] = &unk_1E6AFA1B8;
  id v19 = v11;
  id v17 = v11;
  [v16 addCenterRoleAppLayoutForDisplayItem:v12 completion:v18];
}

uint64_t __63__SBSuspendedWorkspaceTransaction__addSceneEntityToAppRecency___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setForeground:1];
}

uint64_t __63__SBSuspendedWorkspaceTransaction__addSceneEntityToAppRecency___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) updateSettingsWithBlock:&__block_literal_global_51_1];
  }
  return result;
}

uint64_t __63__SBSuspendedWorkspaceTransaction__addSceneEntityToAppRecency___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setForeground:0];
}

void __63__SBSuspendedWorkspaceTransaction__addSceneEntityToAppRecency___block_invoke_4(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = SBLogAppSwitcher();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Finished adding new scene identifier: %{public}@ to recent apps.", (uint8_t *)&v4, 0xCu);
  }
}

@end