@interface SBSceneLayoutWorkspaceTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)_overrideInterfaceOrientationForOrientationMismatch:(int64_t *)a3;
- (BOOL)_runningOnManagedDisplay;
- (BOOL)_sceneEntities:(id)a3 hasEntityRepresentingSceneID:(id)a4;
- (BOOL)_shouldKeepSceneForSceneHandleForeground:(id)a3;
- (BOOL)canInterruptForTransitionRequest:(id)a3;
- (BOOL)isReadyForSynchronizedCommit;
- (BOOL)isTransitioning;
- (BOOL)synchronizedTransactionGroup:(id)a3 shouldFailForSynchronizedTransaction:(id)a4;
- (FBSynchronizedTransactionDelegate)synchronizationDelegate;
- (NSSet)fromApplicationSceneEntities;
- (NSSet)sceneUpdateTransactions;
- (NSSet)toApplicationSceneEntities;
- (SBSceneLayoutWorkspaceTransaction)initWithTransitionRequest:(id)a3 delegate:(id)a4;
- (SBSceneLayoutWorkspaceTransactionDelegate)delegate;
- (SBWorkspaceApplicationSceneTransitionContext)transitionContext;
- (id)_collectSceneIDsOfExternallyHostedApps;
- (id)_defaultDisplayLayoutTransitionReason;
- (id)sceneManager;
- (unint64_t)options;
- (void)_begin;
- (void)_beginLayoutTransition;
- (void)_captureAppsForTransition;
- (void)_childTransactionDidComplete:(id)a3;
- (void)_completeTransition;
- (void)_didComplete;
- (void)_evaluateTransitionCompletion;
- (void)_performTransition;
- (void)_prepareLayoutTransition;
- (void)_prepareScenesForSceneUpdates;
- (void)_prepareScenesForTransition;
- (void)_sendActivationResultWithError:(id)a3;
- (void)_updateKeyboardContextMaskStyles:(BOOL)a3;
- (void)_updatePreferredDisplayLayoutTransitionReason:(id)a3;
- (void)_updateScenesForTransitionCompletion;
- (void)_willBegin;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
- (void)dealloc;
- (void)performSynchronizedCommit;
- (void)setDelegate:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setSynchronizationDelegate:(id)a3;
- (void)synchronizedTransaction:(id)a3 didCommitSynchronizedTransactions:(id)a4;
- (void)synchronizedTransaction:(id)a3 willCommitSynchronizedTransactions:(id)a4;
- (void)synchronizedTransactionReadyToCommit:(id)a3;
- (void)transaction:(id)a3 didCommitSceneUpdate:(id)a4;
- (void)transaction:(id)a3 didCreateScene:(id)a4;
- (void)transaction:(id)a3 didLaunchProcess:(id)a4;
- (void)transaction:(id)a3 willCommitSceneUpdate:(id)a4;
- (void)transaction:(id)a3 willLaunchProcess:(id)a4;
- (void)transaction:(id)a3 willUpdateScene:(id)a4;
@end

@implementation SBSceneLayoutWorkspaceTransaction

- (id)_collectSceneIDsOfExternallyHostedApps
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([(SBSceneLayoutWorkspaceTransaction *)self _runningOnManagedDisplay])
  {
    v4 = +[SBCoverSheetPresentationManager sharedInstance];
    int v5 = [v4 isVisible];

    if (v5)
    {
      v6 = +[SBLockScreenManager sharedInstance];
      v7 = [v6 lockScreenEnvironment];
      v8 = [v7 applicationHoster];
      [v3 addObject:v8];
    }
    v9 = +[SBCoverSheetPresentationManager sharedInstance];
    v10 = [v9 secureAppViewController];
    if ([v9 isVisible] && v10) {
      [v3 addObject:v10];
    }
    v11 = +[SBWorkspace mainWorkspace];
    v12 = [v11 inCallPresentationManager];
    if (v12) {
      [v3 addObject:v12];
    }
    v13 = [v11 pipCoordinator];
    [v3 addObject:v13];
    v14 = +[SBUIController sharedInstanceIfExists];
    v15 = [v14 iconController];
    v16 = [v15 leftOfHomeAppViewController];

    if (v16) {
      [v3 addObject:v16];
    }
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__SBSceneLayoutWorkspaceTransaction__collectSceneIDsOfExternallyHostedApps__block_invoke;
  v22[3] = &unk_1E6B058C0;
  id v18 = v17;
  id v23 = v18;
  [v3 enumerateObjectsUsingBlock:v22];
  if (SBSpotlightIsVisible())
  {
    v19 = +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController];
    v20 = [v19 sceneIdentifier];
    [v18 addObject:v20];
  }
  return v18;
}

- (void)_captureAppsForTransition
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBWorkspaceTransaction *)self windowScene];
  v4 = [v3 switcherController];

  int v5 = [(SBWorkspaceTransaction *)self transitionRequest];
  v6 = [v5 originatingProcess];

  v7 = +[SBApplicationController sharedInstanceIfExists];
  v8 = objc_msgSend(v7, "applicationWithPid:", objc_msgSend(v6, "pid"));

  if (v8)
  {
    v9 = [v8 bundleIdentifier];
    v10 = SBSDisplayLayoutTransitionReasonForSourceApplication();
    [(SBSceneLayoutWorkspaceTransaction *)self _updatePreferredDisplayLayoutTransitionReason:v10];
  }
  uint64_t v11 = 344;
  [(NSMutableSet *)self->_scenesToBackground removeAllObjects];
  [(NSMutableSet *)self->_fromAppSceneEntities removeAllObjects];
  [(NSMutableSet *)self->_toAppSceneEntities removeAllObjects];
  [(NSMutableSet *)self->_foregroundingAppSceneEntities removeAllObjects];
  [(NSMutableSet *)self->_backgroundingAppSceneEntities removeAllObjects];
  if (SBFIsMoreForegroundAppsAvailable())
  {
    v12 = [v4 _sceneEntitiesToForeground];
    v13 = (NSMutableSet *)[v12 mutableCopy];
    foregroundingAppSceneEntities = self->_foregroundingAppSceneEntities;
    self->_foregroundingAppSceneEntities = v13;
  }
  else
  {
    v15 = [(SBWorkspaceApplicationSceneTransitionContext *)self->_transitionContext applicationSceneEntities];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke;
    v58[3] = &unk_1E6B057F8;
    v58[4] = self;
    [v15 enumerateObjectsUsingBlock:v58];
  }
  v16 = [(SBWorkspaceApplicationSceneTransitionContext *)self->_transitionContext previousApplicationSceneEntities];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_2;
  v57[3] = &unk_1E6B057F8;
  v57[4] = self;
  [v16 enumerateObjectsUsingBlock:v57];

  id v17 = [(SBSceneLayoutWorkspaceTransaction *)self _collectSceneIDsOfExternallyHostedApps];
  id v18 = [(SBWorkspaceApplicationSceneTransitionContext *)self->_transitionContext applicationSceneEntities];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_3;
  v54[3] = &unk_1E6B05820;
  id v19 = v17;
  id v55 = v19;
  v56 = self;
  [v18 enumerateObjectsUsingBlock:v54];

  unint64_t v20 = 0x1E4F1C000uLL;
  v21 = [MEMORY[0x1E4F1CA80] set];
  if (SBFIsMoreForegroundAppsAvailable())
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v22 = self->_fromAppSceneEntities;
    uint64_t v23 = [(NSMutableSet *)v22 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v41 = 344;
      v42 = v8;
      v25 = v6;
      v26 = v4;
      uint64_t v27 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v51 != v27) {
            objc_enumerationMutation(v22);
          }
          v29 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * i), "sceneHandle", v41);
          [v21 addObject:v29];
        }
        uint64_t v24 = [(NSMutableSet *)v22 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v24);
      v4 = v26;
      v6 = v25;
      uint64_t v11 = v41;
      v8 = v42;
      unint64_t v20 = 0x1E4F1C000;
    }
  }
  else
  {
    if (![(SBSceneLayoutWorkspaceTransaction *)self _runningOnManagedDisplay]) {
      goto LABEL_19;
    }
    v22 = [v4 layoutStateApplicationSceneHandles];
    if ([(NSMutableSet *)v22 count]) {
      [v21 unionSet:v22];
    }
  }

LABEL_19:
  if ([(SBSceneLayoutWorkspaceTransaction *)self _runningOnManagedDisplay])
  {
    v43 = v8;
    uint64_t v30 = v11;
    v31 = v6;
    v32 = v4;
    v33 = +[SBSceneManagerCoordinator sharedInstance];
    v34 = [(SBWorkspaceTransaction *)self displayIdentity];
    v35 = [v33 sceneManagerForDisplayIdentity:v34];
    v36 = [v35 externalForegroundApplicationSceneHandles];

    if ([v36 count]) {
      [v21 unionSet:v36];
    }

    v4 = v32;
    v6 = v31;
    uint64_t v11 = v30;
    v8 = v43;
    unint64_t v20 = 0x1E4F1C000uLL;
  }
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_4;
  v47[3] = &unk_1E6B05848;
  id v48 = v19;
  v49 = self;
  id v37 = v19;
  v38 = [v21 objectsPassingTest:v47];
  id v39 = objc_alloc_init(*(Class *)(v20 + 2688));
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_5;
  v44[3] = &unk_1E6B05870;
  id v45 = v39;
  v46 = self;
  id v40 = v39;
  [v38 enumerateObjectsUsingBlock:v44];
  [*(id *)((char *)&self->super.super.super.super.isa + v11) unionSet:v40];
}

- (BOOL)_runningOnManagedDisplay
{
  v2 = [(SBWorkspaceTransaction *)self displayIdentity];
  BOOL v3 = objc_msgSend(v2, "sb_displayWindowingMode") == 1;

  return v3;
}

- (void)synchronizedTransaction:(id)a3 willCommitSynchronizedTransactions:(id)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_synchronizationDelegate);
  v7[0] = self;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [WeakRetained synchronizedTransaction:self willCommitSynchronizedTransactions:v6];
}

- (void)_didComplete
{
  v4 = SBWTErrorCreateForTransaction(self);
  [(SBSceneLayoutWorkspaceTransaction *)self _sendActivationResultWithError:v4];

  [(SBSceneLayoutWorkspaceTransaction *)self _completeTransition];
  objc_storeWeak((id *)&self->_delegate, 0);
  [(BSInvalidatable *)self->_displayLayoutTransitionAssertion invalidate];
  displayLayoutTransitionAssertion = self->_displayLayoutTransitionAssertion;
  self->_displayLayoutTransitionAssertion = 0;

  if (self->_scenesBackgroundedStatusAssertion)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 239, @"Invalid parameter not satisfying: %@", @"_scenesBackgroundedStatusAssertion == nil" object file lineNumber description];
  }
  v7.receiver = self;
  v7.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  [(SBWorkspaceTransaction *)&v7 _didComplete];
}

void __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v3 = (id *)(a1 + 32);
  int v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _sendActivationResultWithError:0];

  v5[2](v5, 1);
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  return 1;
}

void __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_3(uint64_t a1, void *a2)
{
  id v10 = a2;
  BOOL v3 = [v10 sceneHandle];
  v4 = *(void **)(a1 + 32);
  int v5 = [v10 sceneHandle];
  v6 = [v5 sceneIdentifier];
  LOBYTE(v4) = [v4 containsObject:v6];

  if ((v4 & 1) == 0) {
    [*(id *)(*(void *)(a1 + 40) + 312) addObject:v10];
  }
  objc_super v7 = [v3 application];
  v8 = [v7 bundleIdentifier];
  int v9 = [v8 isEqualToString:@"com.apple.InCallService"];

  if (v9)
  {
    [*(id *)(*(void *)(a1 + 40) + 312) addObject:v10];
    if (SBFIsMoreForegroundAppsAvailable()) {
      [*(id *)(*(void *)(a1 + 40) + 328) addObject:v10];
    }
  }
}

- (void)_sendActivationResultWithError:(id)a3
{
  id v4 = a3;
  if ([(SBWorkspaceApplicationSceneTransitionContext *)self->_transitionContext needsToSendActivationResult])
  {
    if ([(SBSceneLayoutWorkspaceTransaction *)self isAuditHistoryEnabled]) {
      -[SBSceneLayoutWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", @"Sent activation result; success = %d",
    }
        v4 == 0);
    [(SBWorkspaceApplicationSceneTransitionContext *)self->_transitionContext sendActivationResultError:v4];
  }
}

void __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v3 = (id *)(a1 + 32);
  int v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _prepareLayoutTransition];

  v5[2](v5, 1);
}

- (void)_prepareLayoutTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained transactionWillBeginLayoutTransition:self];

  id v4 = [(SBWorkspaceTransaction *)self windowScene];
  id v5 = [v4 displayLayoutPublisher];

  [v5 flush];
}

- (void)_willBegin
{
  v10.receiver = self;
  v10.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  [(SBSceneLayoutWorkspaceTransaction *)&v10 _willBegin];
  id v4 = [(SBWorkspaceTransaction *)self windowScene];
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 217, @"No window scene to get a publisher: %@", self object file lineNumber description];
  }
  id v5 = [v4 displayLayoutPublisher];
  if (!v5)
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 217, @"No publisher for window scene: %@; self: %@",
      v4,
      self);
  }
  v6 = [v5 transitionAssertionWithReason:self->_preferredDisplayLayoutTransitionReason];
  displayLayoutTransitionAssertion = self->_displayLayoutTransitionAssertion;
  self->_displayLayoutTransitionAssertion = v6;
}

uint64_t __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 328) addObject:a2];
}

- (void)_begin
{
  v3.receiver = self;
  v3.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  [(SBSceneLayoutWorkspaceTransaction *)&v3 _begin];
  [(SBSceneLayoutWorkspaceTransaction *)self _performTransition];
}

- (void)synchronizedTransactionReadyToCommit:(id)a3
{
  if ([(SBSceneLayoutWorkspaceTransaction *)self isAuditHistoryEnabled]) {
    [(SBSceneLayoutWorkspaceTransaction *)self _addAuditHistoryItem:@"Scene updates ready to commit."];
  }
  [(SBSceneLayoutSynchronizeTransitionTransaction *)self->_synchronizeSendActivationResultTransaction synchronize];
  [(SBSceneLayoutSynchronizeTransitionTransaction *)self->_synchronizePrepareTransitionTransaction synchronize];
  id v5 = [(SBSceneLayoutWorkspaceTransaction *)self synchronizationDelegate];
  if (v5)
  {
    [(SBSceneLayoutWorkspaceTransaction *)self addMilestone:*MEMORY[0x1E4F623C0]];
    if ([(SBSceneLayoutWorkspaceTransaction *)self isAuditHistoryEnabled])
    {
      id v4 = [MEMORY[0x1E4F4F718] descriptionForObject:v5];
      [(SBSceneLayoutWorkspaceTransaction *)self _addAuditHistoryItem:@"Deferring commit to synchronization delegate: %@", v4];
    }
    [v5 synchronizedTransactionReadyToCommit:self];
  }
  else
  {
    [(FBSynchronizedTransactionGroup *)self->_sceneUpdateTransactionGroup performSynchronizedCommit];
  }
}

- (void)_performTransition
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  if ([(SBSceneLayoutWorkspaceTransaction *)self isComplete])
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 479, @"Invalid parameter not satisfying: %@", @"![self isComplete]" object file lineNumber description];
  }
  if (self->_isTransitioning)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 480, @"Invalid parameter not satisfying: %@", @"!_isTransitioning" object file lineNumber description];
  }
  if (self->_waitingForSynchronizedCommit)
  {
    id v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 481, @"Invalid parameter not satisfying: %@", @"_waitingForSynchronizedCommit == NO" object file lineNumber description];
  }
  if (!self->_transitionContext)
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 482, @"Invalid parameter not satisfying: %@", @"_transitionContext != nil" object file lineNumber description];
  }
  if (self->_scenesBackgroundedStatusAssertion)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 483, @"Invalid parameter not satisfying: %@", @"_scenesBackgroundedStatusAssertion == nil" object file lineNumber description];
  }
  if (self->_synchronizePrepareTransitionTransaction)
  {
    id v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 484, @"Invalid parameter not satisfying: %@", @"_synchronizePrepareTransitionTransaction == nil" object file lineNumber description];
  }
  p_synchronizeSendActivationResultTransaction = (id *)&self->_synchronizeSendActivationResultTransaction;
  if (self->_synchronizeSendActivationResultTransaction)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 485, @"Invalid parameter not satisfying: %@", @"_synchronizeSendActivationResultTransaction == nil" object file lineNumber description];
  }
  p_synchronizeBeginTransitionTransaction = (id *)&self->_synchronizeBeginTransitionTransaction;
  if (self->_synchronizeBeginTransitionTransaction)
  {
    long long v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 486, @"Invalid parameter not satisfying: %@", @"_synchronizeBeginTransitionTransaction == nil" object file lineNumber description];
  }
  if (self->_synchronizeAddSlavesTransaction)
  {
    long long v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 487, @"Invalid parameter not satisfying: %@", @"_synchronizeAddSlavesTransaction == nil" object file lineNumber description];
  }
  if (self->_sceneUpdateTransactionGroup)
  {
    long long v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 488, @"Invalid parameter not satisfying: %@", @"_sceneUpdateTransactionGroup == nil" object file lineNumber description];
  }
  if ([(SBSceneLayoutWorkspaceTransaction *)self isAuditHistoryEnabled])
  {
    id v4 = NSStringFromSBWorkspaceSceneLayoutTransitionOptions(self->_options);
    id v5 = [(SBSceneLayoutWorkspaceTransaction *)self transitionContext];
    v6 = [v5 layoutState];
    objc_super v7 = [v6 succinctDescription];
    [(SBSceneLayoutWorkspaceTransaction *)self _addAuditHistoryItem:@"------ PERFORM TRANSITION - config=%@ : %@", v4, v7];
  }
  self->_isTransitioning = 1;
  self->_transitionFailed = 0;
  self->_delegateTransitionComplete = 0;
  [(SBSceneLayoutWorkspaceTransaction *)self addMilestone:@"transitioning"];
  [(NSMutableSet *)self->_updateTransactions removeAllObjects];
  [(SBSceneLayoutWorkspaceTransaction *)self _captureAppsForTransition];
  self->_performSceneUpdates = (self->_options & 1) == 0;
  [(SBSceneLayoutWorkspaceTransaction *)self _prepareScenesForSceneUpdates];
  if ([(SBSceneLayoutWorkspaceTransaction *)self isAuditHistoryEnabled]) {
    [(SBSceneLayoutWorkspaceTransaction *)self _addAuditHistoryItem:@"Starting layout transition."];
  }
  v8 = [(SBWorkspaceTransaction *)self layoutStateTransitionCoordinator];
  [v8 beginTransitionForWorkspaceTransaction:self];

  if (self->_performSceneUpdates)
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    int v9 = self->_foregroundingAppSceneEntities;
    uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v68 objects:v73 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v69 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = [[SBApplicationSceneUpdateTransaction alloc] initWithApplicationSceneEntity:*(void *)(*((void *)&v68 + 1) + 8 * i) transitionRequest:self->super._transitionRequest];
          v14 = v13;
          if (v13)
          {
            [(FBApplicationUpdateScenesTransaction *)v13 addObserver:self];
            [(NSMutableSet *)self->_updateTransactions addObject:v14];
          }
        }
        uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v68 objects:v73 count:16];
      }
      while (v10);
    }
  }
  objc_initWeak(&location, self);
  id v15 = objc_alloc(MEMORY[0x1E4F4F6C0]);
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke;
  v65[3] = &unk_1E6B01DC8;
  objc_copyWeak(&v66, &location);
  v16 = (void *)[v15 initWithBlock:v65];
  [v16 setDebugName:@"prepareTransition"];
  id v17 = objc_alloc(MEMORY[0x1E4F4F6C0]);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_2;
  v63[3] = &unk_1E6B01DC8;
  objc_copyWeak(&v64, &location);
  id v18 = (void *)[v17 initWithBlock:v63];
  [v18 setDebugName:@"sendActivationResult"];
  id v19 = objc_alloc(MEMORY[0x1E4F4F6C0]);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_3;
  v61[3] = &unk_1E6B01DC8;
  objc_copyWeak(&v62, &location);
  unint64_t v20 = (void *)[v19 initWithBlock:v61];
  [v20 setDebugName:@"beginTransition"];
  [(SBSceneLayoutWorkspaceTransaction *)self addMilestone:@"slaves"];
  id v21 = objc_alloc(MEMORY[0x1E4F4F6C0]);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_4;
  v59[3] = &unk_1E6B01DC8;
  objc_copyWeak(&v60, &location);
  v22 = (void *)[v21 initWithBlock:v59];
  [v22 setDebugName:@"addSlaves"];
  if ([(NSMutableSet *)self->_updateTransactions count])
  {
    uint64_t v23 = (FBSynchronizedTransactionGroup *)objc_alloc_init(MEMORY[0x1E4F624C0]);
    sceneUpdateTransactionGroup = self->_sceneUpdateTransactionGroup;
    self->_sceneUpdateTransactionGroup = v23;

    self->_waitingForSynchronizedCommit = 1;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v25 = self->_updateTransactions;
    uint64_t v26 = [(NSMutableSet *)v25 countByEnumeratingWithState:&v55 objects:v72 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v56 != v27) {
            objc_enumerationMutation(v25);
          }
          [(FBSynchronizedTransactionGroup *)self->_sceneUpdateTransactionGroup addSynchronizedTransaction:*(void *)(*((void *)&v55 + 1) + 8 * j)];
        }
        uint64_t v26 = [(NSMutableSet *)v25 countByEnumeratingWithState:&v55 objects:v72 count:16];
      }
      while (v26);
    }

    if ((self->_options & 2) != 0)
    {
      if ([(SBSceneLayoutWorkspaceTransaction *)self isAuditHistoryEnabled]) {
        [(SBSceneLayoutWorkspaceTransaction *)self _addAuditHistoryItem:@"Layout transition will NOT synchronize with scene updates."];
      }
      v33 = [[SBSceneLayoutSynchronizeTransitionTransaction alloc] initWithDebugName:@"synchronizeSendActivationResultTransition"];
      id v34 = *p_synchronizeSendActivationResultTransaction;
      id *p_synchronizeSendActivationResultTransaction = v33;

      [*p_synchronizeSendActivationResultTransaction addChildTransaction:v18 withSchedulingPolicy:1];
    }
    else
    {
      if ([(SBSceneLayoutWorkspaceTransaction *)self isAuditHistoryEnabled]) {
        [(SBSceneLayoutWorkspaceTransaction *)self _addAuditHistoryItem:@"Layout transition will synchronize with scene updates."];
      }
      v29 = [[SBSceneLayoutSynchronizeTransitionTransaction alloc] initWithDebugName:@"synchronizePrepareTransition"];
      synchronizePrepareTransitionTransaction = self->_synchronizePrepareTransitionTransaction;
      self->_synchronizePrepareTransitionTransaction = v29;

      [(SBSceneLayoutSynchronizeTransitionTransaction *)self->_synchronizePrepareTransitionTransaction addChildTransaction:v16 withSchedulingPolicy:1];
      [(SBSceneLayoutWorkspaceTransaction *)self addChildTransaction:self->_synchronizePrepareTransitionTransaction];
      v31 = [[SBSceneLayoutSynchronizeTransitionTransaction alloc] initWithDebugName:@"synchronizeBeginTransition"];
      id v32 = *p_synchronizeBeginTransitionTransaction;
      id *p_synchronizeBeginTransitionTransaction = v31;

      [*p_synchronizeBeginTransitionTransaction addChildTransaction:v20 withSchedulingPolicy:1];
      p_synchronizeSendActivationResultTransaction = (id *)&self->_synchronizeBeginTransitionTransaction;
    }
    [(SBSceneLayoutWorkspaceTransaction *)self addChildTransaction:*p_synchronizeSendActivationResultTransaction];
    v35 = [[SBSceneLayoutSynchronizeTransitionTransaction alloc] initWithDebugName:@"synchronizeAddSlaves"];
    synchronizeAddSlavesTransaction = self->_synchronizeAddSlavesTransaction;
    self->_synchronizeAddSlavesTransaction = v35;

    [(SBSceneLayoutSynchronizeTransitionTransaction *)self->_synchronizeAddSlavesTransaction addChildTransaction:v22 withSchedulingPolicy:1];
    [(SBSceneLayoutWorkspaceTransaction *)self addChildTransaction:self->_synchronizeAddSlavesTransaction];
  }
  else if ([(SBSceneLayoutWorkspaceTransaction *)self isAuditHistoryEnabled])
  {
    [(SBSceneLayoutWorkspaceTransaction *)self _addAuditHistoryItem:@"Layout transition will run without scene updates."];
  }
  id v37 = +[SBSceneManagerCoordinator sharedInstance];
  v38 = [(SBWorkspaceTransaction *)self displayIdentity];
  id v39 = [v37 sceneManagerForDisplayIdentity:v38];
  id v40 = [v39 assertBackgroundedStatusForScenes:self->_scenesToBackground];
  scenesBackgroundedStatusAssertion = self->_scenesBackgroundedStatusAssertion;
  self->_scenesBackgroundedStatusAssertion = v40;

  [v20 addChildTransaction:v22 withSchedulingPolicy:1];
  [v16 addChildTransaction:v18 withSchedulingPolicy:1];
  [v16 addChildTransaction:v20 withSchedulingPolicy:1];
  [(SBSceneLayoutWorkspaceTransaction *)self addChildTransaction:v16];
  v42 = self->_sceneUpdateTransactionGroup;
  if (v42)
  {
    [(FBSynchronizedTransactionGroup *)v42 setSynchronizationDelegate:self];
    [(SBSceneLayoutWorkspaceTransaction *)self addChildTransaction:self->_sceneUpdateTransactionGroup];
  }

  objc_destroyWeak(&v60);
  objc_destroyWeak(&v62);

  objc_destroyWeak(&v64);
  objc_destroyWeak(&v66);
  objc_destroyWeak(&location);
}

- (void)setSynchronizationDelegate:(id)a3
{
}

- (SBSceneLayoutWorkspaceTransaction)initWithTransitionRequest:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [v7 applicationContext];
  if (!v9)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 165, @"Invalid parameter not satisfying: %@", @"context != nil" object file lineNumber description];
  }
  if ([v9 isBackground])
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"SBSceneLayoutWorkspaceTransaction.m", 166, @"Invalid parameter not satisfying: %@", @"![context isBackground]" object file lineNumber description];
  }
  v31.receiver = self;
  v31.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  uint64_t v10 = [(SBWorkspaceTransaction *)&v31 initWithTransitionRequest:v7];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_transitionContext, v9);
    objc_storeWeak((id *)&v11->_delegate, v8);
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    updateTransactions = v11->_updateTransactions;
    v11->_updateTransactions = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    toAppSceneEntities = v11->_toAppSceneEntities;
    v11->_toAppSceneEntities = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    fromAppSceneEntities = v11->_fromAppSceneEntities;
    v11->_fromAppSceneEntities = v16;

    id v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    foregroundingAppSceneEntities = v11->_foregroundingAppSceneEntities;
    v11->_foregroundingAppSceneEntities = v18;

    unint64_t v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    backgroundingAppSceneEntities = v11->_backgroundingAppSceneEntities;
    v11->_backgroundingAppSceneEntities = v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    scenesToBackground = v11->_scenesToBackground;
    v11->_scenesToBackground = v22;

    if (([v9 waitsForSceneUpdates] & 1) == 0) {
      v11->_options |= 4uLL;
    }
    if (SBFIsMoreForegroundAppsAvailable())
    {
      uint64_t v24 = [(SBWorkspaceTransaction *)v11 windowScene];
      v25 = [v24 switcherController];
      [v25 _prepareForSceneLayoutTransitionWithTransitionContext:v9];
    }
    uint64_t v26 = [(SBSceneLayoutWorkspaceTransaction *)v11 _defaultDisplayLayoutTransitionReason];
    preferredDisplayLayoutTransitionReason = v11->_preferredDisplayLayoutTransitionReason;
    v11->_preferredDisplayLayoutTransitionReason = (NSString *)v26;

    [(SBSceneLayoutWorkspaceTransaction *)v11 _captureAppsForTransition];
  }

  return v11;
}

- (id)_defaultDisplayLayoutTransitionReason
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(SBWorkspaceTransaction *)self transitionRequest];
  id v7 = [v6 uniqueID];
  id v8 = [v3 stringWithFormat:@"%@:%@", v5, v7];

  return v8;
}

- (void)_completeTransition
{
  if (!self->_isTransitioning) {
    return;
  }
  if ([(SBSceneLayoutWorkspaceTransaction *)self isAuditHistoryEnabled])
  {
    id v4 = NSStringFromBOOL();
    [(SBSceneLayoutWorkspaceTransaction *)self _addAuditHistoryItem:@"------ TRANSITION COMPLETE with success: %@", v4];
  }
  if (self->_waitingForSynchronizedCommit)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"SBSceneLayoutWorkspaceTransaction.m" lineNumber:610 description:@"the transition can't complete if we're still waiting for the synchronize"];
  }
  id v5 = [(SBWorkspaceTransaction *)self layoutStateTransitionCoordinator];
  [v5 willEndTransition];

  [(SBSceneLayoutWorkspaceTransaction *)self _updateScenesForTransitionCompletion];
  [(NSMutableSet *)self->_scenesToBackground removeAllObjects];
  [(SBSceneBackgroundedStatusAssertion *)self->_scenesBackgroundedStatusAssertion invalidate];
  scenesBackgroundedStatusAssertion = self->_scenesBackgroundedStatusAssertion;
  self->_scenesBackgroundedStatusAssertion = 0;

  sceneUpdateTransactionGroup = self->_sceneUpdateTransactionGroup;
  if (sceneUpdateTransactionGroup)
  {
    [(FBSynchronizedTransactionGroup *)sceneUpdateTransactionGroup setSynchronizationDelegate:0];
    id v8 = self->_sceneUpdateTransactionGroup;
    self->_sceneUpdateTransactionGroup = 0;
  }
  synchronizePrepareTransitionTransaction = self->_synchronizePrepareTransitionTransaction;
  self->_synchronizePrepareTransitionTransaction = 0;

  synchronizeSendActivationResultTransaction = self->_synchronizeSendActivationResultTransaction;
  self->_synchronizeSendActivationResultTransaction = 0;

  synchronizeBeginTransitionTransaction = self->_synchronizeBeginTransitionTransaction;
  self->_synchronizeBeginTransitionTransaction = 0;

  synchronizeAddSlavesTransaction = self->_synchronizeAddSlavesTransaction;
  self->_synchronizeAddSlavesTransaction = 0;

  self->_isTransitioning = 0;
  v13 = [(FBSynchronizedTransactionGroup *)self->_sceneUpdateTransactionGroup allErrors];
  v14 = v13;
  if (self->_transitionFailed)
  {
    id v15 = objc_msgSend(v13, "bs_firstObjectPassingTest:", &__block_literal_global_226);
  }
  else
  {
    id v15 = 0;
  }
  v16 = [(SBWorkspaceTransaction *)self layoutStateTransitionCoordinator];
  [v16 endTransitionWithError:v15];

  if (self->_performSceneUpdates
    && ([(SBSceneLayoutWorkspaceTransaction *)self isInterrupted] & 1) == 0)
  {
    id v17 = (void *)SBApp;
    id v18 = [(SBWorkspaceTransaction *)self displayIdentity];
    [v17 noteSceneLayoutDidUpdateOnDisplayWithIdentity:v18];
  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __56__SBSceneLayoutWorkspaceTransaction__completeTransition__block_invoke_2;
  v26[3] = &unk_1E6B05908;
  v26[5] = v27;
  v26[6] = a2;
  v26[4] = self;
  id v19 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v26);
  unint64_t v20 = self->_transitionContext;
  id v21 = [(SBSceneLayoutWorkspaceTransaction *)self delegate];
  v22 = v21;
  if (!v21) {
    goto LABEL_18;
  }
  if ((self->_options & 8) != 0)
  {
    [v21 transaction:self didEndLayoutTransitionWithContinuation:0];
LABEL_18:
    v19[2](v19, 0, 0);
    goto LABEL_19;
  }
  [v21 transaction:self didEndLayoutTransitionWithContinuation:v19];
LABEL_19:
  if ([(NSMutableSet *)self->_backgroundingAppSceneEntities count])
  {
    uint64_t v23 = +[SBSceneDisconnectionManager sharedManager];
    [v23 _beginSceneCleanupWithBackgroundedSceneEntities:self->_backgroundingAppSceneEntities];

    uint64_t v24 = [(id)SBApp hungApplicationInteractionObserver];
    [v24 observeBackgroundingApplicationSceneEntities:self->_backgroundingAppSceneEntities withTransitionContext:v20];
  }
  _Block_object_dispose(v27, 8);
}

- (void)_prepareScenesForSceneUpdates
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (self->_performSceneUpdates
    && [(SBSceneLayoutWorkspaceTransaction *)self _runningOnManagedDisplay])
  {
    id v45 = self;
    objc_super v3 = [(SBWorkspaceTransaction *)self windowScene];
    v47 = [v3 switcherController];

    uint64_t v4 = [v47 isChamoisWindowingUIEnabled];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    obuint64_t j = v45->_foregroundingAppSceneEntities;
    uint64_t v5 = [(NSMutableSet *)obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (!v5) {
      goto LABEL_29;
    }
    uint64_t v6 = *(void *)v56;
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v44 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v56 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v11 = [v10 layoutRole];
        v12 = [v10 sceneHandle];
        [v12 setLayoutRole:v11];

        v13 = [v10 sceneHandle];
        int v14 = [v13 isDeviceApplicationSceneHandle];

        if (v14)
        {
          uint64_t v15 = objc_opt_class();
          v16 = [(SBSceneLayoutWorkspaceTransaction *)v45 transitionContext];
          id v17 = [v16 layoutState];
          id v18 = SBSafeCast(v15, v17);

          if (v11 == 1 || v11 == 2)
          {
            uint64_t v23 = [v47 coordinateSpaceForLayoutState:v18];
            uint64_t v24 = [v18 elementWithRole:v11];
            v25 = [v47 coordinateSpaceForLayoutElement:v24 layoutState:v18];

            [v47 statusBarAvoidanceFrameForLayoutRole:v11 layoutState:v18];
            objc_msgSend(v23, "convertRect:toCoordinateSpace:", v25);
            CGFloat v27 = v26;
            CGFloat v29 = v28;
            CGFloat v31 = v30;
            CGFloat v33 = v32;
            [v25 bounds];
            v63.origin.double x = v34;
            v63.origin.double y = v35;
            v63.size.double width = v36;
            v63.size.double height = v37;
            v61.origin.double x = v27;
            v61.origin.double y = v29;
            v61.size.double width = v31;
            v61.size.double height = v33;
            CGRect v62 = CGRectIntersection(v61, v63);
            double x = v62.origin.x;
            double y = v62.origin.y;
            double width = v62.size.width;
            double height = v62.size.height;

            if (v4) {
              goto LABEL_14;
            }
            if (v11 != 1) {
              goto LABEL_19;
            }
            if ([v18 isFullScreen]) {
              uint64_t v40 = 0xFFFFLL;
            }
            else {
              uint64_t v40 = 1;
            }
          }
          else
          {
            double y = v43;
            double x = v44;
            double width = v7;
            double height = v8;
            if (!v4)
            {
LABEL_19:
              uint64_t v41 = 0xFFFFLL;
              if (v11 == 4) {
                uint64_t v41 = 0;
              }
              if (v11 == 3) {
                uint64_t v41 = 0;
              }
              if (v11 == 2) {
                uint64_t v40 = 2;
              }
              else {
                uint64_t v40 = v41;
              }
              goto LABEL_26;
            }
LABEL_14:
            uint64_t v51 = 0;
            long long v52 = &v51;
            uint64_t v53 = 0x2020000000;
            uint64_t v54 = 0;
            v38 = [v18 appLayout];
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __66__SBSceneLayoutWorkspaceTransaction__prepareScenesForSceneUpdates__block_invoke;
            v48[3] = &unk_1E6B05950;
            v48[4] = v10;
            id v39 = v38;
            id v49 = v39;
            long long v50 = &v51;
            [v39 enumerate:v48];
            uint64_t v40 = v52[3];

            _Block_object_dispose(&v51, 8);
          }
LABEL_26:
          v42 = [v10 sceneHandle];
          [v42 setStatusBarParts:v40];
          objc_msgSend(v42, "setStatusBarAvoidanceFrame:", x, y, width, height);
          [v42 setWantsEnhancedWindowingEnabled:v4];

          continue;
        }
      }
      uint64_t v5 = [(NSMutableSet *)obj countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (!v5)
      {
LABEL_29:

        return;
      }
    }
  }
}

void __56__SBSceneLayoutWorkspaceTransaction__completeTransition__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v14 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"SBSceneLayoutWorkspaceTransaction.m" lineNumber:648 description:@"can't call this more than once"];

    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v6 + 24) = 1;
  if ([*(id *)(a1 + 32) isAuditHistoryEnabled])
  {
    double v7 = *(void **)(a1 + 32);
    double v8 = NSStringFromBOOL();
    [v7 _addAuditHistoryItem:@"Transition continuation called with follow-up transition: %@.", v8];
  }
  int v9 = *(id **)(a1 + 32);
  if (v9[35] == v14)
  {
    if (v14) {
      goto LABEL_7;
    }
  }
  else
  {
    objc_storeStrong(v9 + 35, a2);
    int v9 = *(id **)(a1 + 32);
    if (v9[35])
    {
LABEL_7:
      if ([v9 isComplete] & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "isInterrupted"))
      {
        if ([*(id *)(a1 + 32) isAuditHistoryEnabled]) {
          [*(id *)(a1 + 32) _addAuditHistoryItem:@"Ignoring continuation because we have already completed."];
        }
      }
      else
      {
        *(void *)(*(void *)(a1 + 32) + 216) = a3;
        [*(id *)(*(void *)(a1 + 32) + 176) setApplicationContext:*(void *)(*(void *)(a1 + 32) + 280)];
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = (void *)v10[35];
        v12 = [v10 layoutStateTransitionCoordinator];
        [v11 setDelegate:v12];

        [*(id *)(*(void *)(a1 + 32) + 280) finalize];
        [*(id *)(a1 + 32) _performTransition];
      }
      goto LABEL_16;
    }
  }
  if ([v9 isAuditHistoryEnabled]) {
    [*(id *)(a1 + 32) _addAuditHistoryItem:@"Scene layout completed."];
  }
  [*(id *)(a1 + 32) satisfyMilestone:@"transitioning"];
LABEL_16:
}

void __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v3 = (id *)(a1 + 32);
  uint64_t v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_5;
    v6[3] = &unk_1E6AF4AC0;
    v6[4] = WeakRetained;
    [MEMORY[0x1E4F62490] synchronizeChanges:v6];
  }
  [WeakRetained satisfyMilestone:@"slaves"];
  v4[2](v4, 1);
}

- (NSSet)sceneUpdateTransactions
{
  return &self->_updateTransactions->super;
}

- (FBSynchronizedTransactionDelegate)synchronizationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_synchronizationDelegate);
  return (FBSynchronizedTransactionDelegate *)WeakRetained;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

void __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v3 = (id *)(a1 + 32);
  uint64_t v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _beginLayoutTransition];

  v5[2](v5, 1);
}

- (void)_beginLayoutTransition
{
  [(SBSceneLayoutWorkspaceTransaction *)self _prepareScenesForTransition];
  objc_super v3 = [(SBSceneLayoutWorkspaceTransaction *)self delegate];
  if (v3)
  {
    [(SBSceneLayoutWorkspaceTransaction *)self addMilestone:@"waitingForDelegate"];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __59__SBSceneLayoutWorkspaceTransaction__beginLayoutTransition__block_invoke;
    v4[3] = &unk_1E6AF4AC0;
    v4[4] = self;
    [v3 transaction:self performTransitionWithCompletion:v4];
  }
  else
  {
    self->_waitForSceneUpdates = 1;
    [(SBSceneLayoutWorkspaceTransaction *)self _evaluateTransitionCompletion];
  }
}

- (SBSceneLayoutWorkspaceTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSceneLayoutWorkspaceTransactionDelegate *)WeakRetained;
}

- (void)_updateScenesForTransitionCompletion
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (self->_performSceneUpdates)
  {
    [(SBSceneLayoutWorkspaceTransaction *)self _updateKeyboardContextMaskStyles:0];
    objc_super v3 = [(SBWorkspaceTransaction *)self windowScene];
    uint64_t v4 = [v3 medusaHostedKeyboardWindowController];
    [v4 updateMedusaHostedKeyboardWindow];

    if ([(SBSceneLayoutWorkspaceTransaction *)self isInterrupted]
      && (interruptingTransitionRequest = self->_interruptingTransitionRequest) != 0)
    {
      uint64_t v6 = [(SBWorkspaceTransitionRequest *)interruptingTransitionRequest applicationContext];
      double v7 = [v6 applicationSceneEntities];
      double v8 = objc_msgSend(v7, "bs_map:", &__block_literal_global_210);
    }
    else
    {
      double v8 = 0;
    }
    double v26 = [(SBSceneLayoutWorkspaceTransaction *)self _collectSceneIDsOfExternallyHostedApps];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    int v9 = self->_scenesToBackground;
    uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v15 = [v14 identifier];
          if ([v14 isValid]
            && ([v8 containsObject:v15] & 1) == 0
            && ([v26 containsObject:v15] & 1) == 0)
          {
            [v14 updateUISettingsWithBlock:&__block_literal_global_213];
            v16 = [v14 uiPresentationManager];
            [v16 modifyDefaultPresentationContext:&__block_literal_global_216];
          }
        }
        uint64_t v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v11);
    }

    if (SBFIsMoreForegroundAppsAvailable())
    {
      id v17 = [(SBWorkspaceTransaction *)self windowScene];
      id v18 = [v17 switcherController];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v19 = self->_foregroundingAppSceneEntities;
      uint64_t v20 = [(NSMutableSet *)v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = [*(id *)(*((void *)&v30 + 1) + 8 * j) sceneHandle];
            v25 = [v24 sceneIfExists];

            if (v25)
            {
              v27[0] = MEMORY[0x1E4F143A8];
              v27[1] = 3221225472;
              v27[2] = __73__SBSceneLayoutWorkspaceTransaction__updateScenesForTransitionCompletion__block_invoke_4;
              void v27[3] = &unk_1E6B03DC8;
              id v28 = v18;
              id v29 = v25;
              [v29 updateSettingsWithBlock:v27];
            }
          }
          uint64_t v21 = [(NSMutableSet *)v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v21);
      }
    }
  }
}

- (void)_prepareScenesForTransition
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self->_performSceneUpdates
    && [(SBSceneLayoutWorkspaceTransaction *)self _runningOnManagedDisplay])
  {
    [(SBSceneLayoutWorkspaceTransaction *)self _updateKeyboardContextMaskStyles:1];
    double v4 = *MEMORY[0x1E4F437F8];
    double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    double v7 = self->_foregroundingAppSceneEntities;
    uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      double v11 = v5;
      double v12 = v6;
      double v13 = v3;
      double v14 = v4;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v17 = objc_msgSend(v16, "sceneHandle", (void)v29);
          id v18 = [v17 sceneIfExists];

          if ([v18 isValid])
          {
            uint64_t v19 = [v16 layoutRole];
            if (SBLayoutRoleIsValidForSplitView(v19))
            {
              uint64_t v20 = [v18 clientSettings];
              if ([v20 isUISubclass])
              {
                [v20 primaryWindowOverlayInsets];
                if (v19 == 1)
                {
                  double v11 = v24;
                  double v12 = v23;
                }
                else
                {
                  double v5 = v24;
                  double v6 = v23;
                  double v3 = v22;
                  double v4 = v21;
                }
                if (v19 == 1)
                {
                  double v13 = v22;
                  double v14 = v21;
                }
              }
            }
          }
        }
        uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = v5;
      double v12 = v6;
      double v13 = v3;
      double v14 = v4;
    }

    v25 = [(id)SBApp windowSceneManager];
    double v26 = [(SBWorkspaceTransaction *)self displayIdentity];
    CGFloat v27 = [v25 windowSceneForDisplayIdentity:v26];
    id v28 = [v27 pictureInPictureManager];

    objc_msgSend(v28, "applyPictureInPictureInsets:forSource:", 2, v14, v13, v12, v11);
    objc_msgSend(v28, "applyPictureInPictureInsets:forSource:", 3, v4, v3, v6, v5);
  }
}

- (void)_updateKeyboardContextMaskStyles:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  double v5 = +[SBPlatformController sharedInstance];
  int v6 = [v5 isMedusaCapable];

  if (v6)
  {
    double v7 = [(SBSceneLayoutWorkspaceTransaction *)self transitionContext];
    uint64_t v8 = [v7 previousLayoutState];

    uint64_t v9 = [(SBSceneLayoutWorkspaceTransaction *)self transitionContext];
    uint64_t v10 = [v9 layoutState];

    long long v33 = v8;
    double v11 = [v8 elements];
    double v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F1CAD0] set];
    }
    double v14 = v13;

    uint64_t v15 = [v10 elements];
    v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1CAD0] set];
    }
    id v18 = v17;
    long long v32 = v10;

    uint64_t v19 = [v18 setByAddingObjectsFromSet:v14];
    uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
    if ((unint64_t)[v18 count] >= 2) {
      [v20 unionSet:v18];
    }
    if (v3 && (unint64_t)[v14 count] >= 2) {
      [v20 unionSet:v14];
    }
    long long v31 = v14;
    double v21 = objc_msgSend(v19, "bs_map:", &__block_literal_global_204, v19);
    double v22 = objc_msgSend(v20, "bs_map:", &__block_literal_global_204);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v23 = v21;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v22 containsObject:v28]) {
            uint64_t v29 = 2;
          }
          else {
            uint64_t v29 = 26;
          }
          [v28 setKeyboardContextMaskStyle:v29];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v25);
    }
  }
}

void __75__SBSceneLayoutWorkspaceTransaction__collectSceneIDsOfExternallyHostedApps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isHostingAnApp])
  {
    double v4 = [v3 hostedAppSceneHandles];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __75__SBSceneLayoutWorkspaceTransaction__collectSceneIDsOfExternallyHostedApps__block_invoke_2;
    v5[3] = &unk_1E6B05898;
    id v6 = *(id *)(a1 + 32);
    [v4 enumerateObjectsUsingBlock:v5];
  }
}

- (void)_childTransactionDidComplete:(id)a3
{
  double v4 = (FBSynchronizedTransactionGroup *)a3;
  if (self->_sceneUpdateTransactionGroup == v4) {
    [(SBSceneLayoutWorkspaceTransaction *)self _evaluateTransitionCompletion];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  [(SBSceneLayoutWorkspaceTransaction *)&v5 _childTransactionDidComplete:v4];
}

- (NSSet)toApplicationSceneEntities
{
  return (NSSet *)self->_toAppSceneEntities;
}

- (NSSet)fromApplicationSceneEntities
{
  return (NSSet *)self->_fromAppSceneEntities;
}

- (SBWorkspaceApplicationSceneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)_evaluateTransitionCompletion
{
  if (!self->_waitingForSynchronizedCommit
    && (!self->_waitForSceneUpdates
     || (sceneUpdateTransactionGroup = self->_sceneUpdateTransactionGroup) == 0
     || [(FBSynchronizedTransactionGroup *)sceneUpdateTransactionGroup isComplete])
    && ([(SBSceneLayoutWorkspaceTransaction *)self isWaitingForMilestone:@"waitingForDelegate"] & 1) == 0)
  {
    [(SBSceneLayoutWorkspaceTransaction *)self _completeTransition];
  }
}

uint64_t __59__SBSceneLayoutWorkspaceTransaction__beginLayoutTransition__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) satisfyMilestone:@"waitingForDelegate"];
  *(unsigned char *)(*(void *)(a1 + 32) + 244) = (*(void *)(*(void *)(a1 + 32) + 216) & 4) == 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 304);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "setWaitsForSceneCommits:", *(unsigned __int8 *)(*(void *)(a1 + 32) + 244), (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 32) _evaluateTransitionCompletion];
}

void __55__SBSceneLayoutWorkspaceTransaction__performTransition__block_invoke_5(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) sceneManager];
  uint64_t v3 = [*(id *)(a1 + 32) transitionRequest];
  uint64_t v4 = [v2 childTransactionsForTransitionRequest:v3];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(a1 + 32), "addChildTransaction:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)sceneManager
{
  v4.receiver = self;
  v4.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  id v2 = [(SBWorkspaceTransaction *)&v4 sceneManager];
  return v2;
}

- (void)dealloc
{
  [(SBSceneBackgroundedStatusAssertion *)self->_scenesBackgroundedStatusAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  [(SBSceneLayoutWorkspaceTransaction *)&v3 dealloc];
}

- (void)performSynchronizedCommit
{
  if ([(SBSceneLayoutWorkspaceTransaction *)self isAuditHistoryEnabled]) {
    [(SBSceneLayoutWorkspaceTransaction *)self _addAuditHistoryItem:@"Delegate says perform commit now."];
  }
  [(FBSynchronizedTransactionGroup *)self->_sceneUpdateTransactionGroup performSynchronizedCommit];
  uint64_t v3 = *MEMORY[0x1E4F623C0];
  [(SBSceneLayoutWorkspaceTransaction *)self satisfyMilestone:v3];
}

uint64_t __95__SBSceneLayoutWorkspaceTransaction_synchronizedTransaction_didCommitSynchronizedTransactions___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 264) synchronize];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 360));
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = [*(id *)(v3 + 288) synchronizedTransactions];
  [WeakRetained synchronizedTransaction:v3 didCommitSynchronizedTransactions:v4];

  [*(id *)(*(void *)(a1 + 32) + 272) synchronize];
  *(unsigned char *)(*(void *)(a1 + 32) + 245) = 0;
  id v5 = *(void **)(a1 + 32);
  return [v5 _evaluateTransitionCompletion];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_synchronizationDelegate);
  objc_storeStrong((id *)&self->_interruptingTransitionRequest, 0);
  objc_storeStrong((id *)&self->_scenesToBackground, 0);
  objc_storeStrong((id *)&self->_backgroundingAppSceneEntities, 0);
  objc_storeStrong((id *)&self->_foregroundingAppSceneEntities, 0);
  objc_storeStrong((id *)&self->_fromAppSceneEntities, 0);
  objc_storeStrong((id *)&self->_toAppSceneEntities, 0);
  objc_storeStrong((id *)&self->_updateTransactions, 0);
  objc_storeStrong((id *)&self->_scenesBackgroundedStatusAssertion, 0);
  objc_storeStrong((id *)&self->_sceneUpdateTransactionGroup, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_synchronizeAddSlavesTransaction, 0);
  objc_storeStrong((id *)&self->_synchronizeBeginTransitionTransaction, 0);
  objc_storeStrong((id *)&self->_synchronizeSendActivationResultTransaction, 0);
  objc_storeStrong((id *)&self->_synchronizePrepareTransitionTransaction, 0);
  objc_storeStrong((id *)&self->_preferredDisplayLayoutTransitionReason, 0);
  objc_storeStrong((id *)&self->_displayLayoutTransitionAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __71__SBSceneLayoutWorkspaceTransaction_transaction_willCommitSceneUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transaction:*(void *)(a1 + 32) willCommitSceneUpdate:*(void *)(a1 + 40)];
  }
}

void __70__SBSceneLayoutWorkspaceTransaction_transaction_didCommitSceneUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transaction:*(void *)(a1 + 32) didCommitSceneUpdate:*(void *)(a1 + 40)];
  }
}

void __67__SBSceneLayoutWorkspaceTransaction_transaction_willLaunchProcess___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transaction:*(void *)(a1 + 32) willLaunchProcess:*(void *)(a1 + 40)];
  }
}

void __66__SBSceneLayoutWorkspaceTransaction_transaction_didLaunchProcess___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transaction:*(void *)(a1 + 32) didLaunchProcess:*(void *)(a1 + 40)];
  }
}

void __64__SBSceneLayoutWorkspaceTransaction_transaction_didCreateScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transaction:*(void *)(a1 + 32) didCreateScene:*(void *)(a1 + 40)];
  }
}

- (void)synchronizedTransaction:(id)a3 didCommitSynchronizedTransactions:(id)a4
{
  if ([(SBSceneLayoutWorkspaceTransaction *)self isAuditHistoryEnabled]) {
    [(SBSceneLayoutWorkspaceTransaction *)self _addAuditHistoryItem:@"Synchronizing with scene updates NOW."];
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95__SBSceneLayoutWorkspaceTransaction_synchronizedTransaction_didCommitSynchronizedTransactions___block_invoke;
  v5[3] = &unk_1E6AF4AC0;
  void v5[4] = self;
  [MEMORY[0x1E4F62490] synchronizeChanges:v5];
}

- (void)transaction:(id)a3 willCommitSceneUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__SBSceneLayoutWorkspaceTransaction_transaction_willCommitSceneUpdate___block_invoke;
  v10[3] = &unk_1E6B05998;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBSceneLayoutWorkspaceTransaction *)self _enumerateObserversWithBlock:v10];
}

- (void)transaction:(id)a3 didLaunchProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__SBSceneLayoutWorkspaceTransaction_transaction_didLaunchProcess___block_invoke;
  v10[3] = &unk_1E6B05998;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBSceneLayoutWorkspaceTransaction *)self _enumerateObserversWithBlock:v10];
}

- (void)transaction:(id)a3 didCreateScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__SBSceneLayoutWorkspaceTransaction_transaction_didCreateScene___block_invoke;
  v10[3] = &unk_1E6B05998;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBSceneLayoutWorkspaceTransaction *)self _enumerateObserversWithBlock:v10];
}

- (void)transaction:(id)a3 didCommitSceneUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SBSceneLayoutWorkspaceTransaction_transaction_didCommitSceneUpdate___block_invoke;
  v10[3] = &unk_1E6B05998;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBSceneLayoutWorkspaceTransaction *)self _enumerateObserversWithBlock:v10];
}

- (void)transaction:(id)a3 willLaunchProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[(NSMutableSet *)self->_updateTransactions count] <= 1
    && [(NSMutableSet *)self->_updateTransactions containsObject:v6])
  {
    if ([v7 isRunning])
    {
      [(SBSceneLayoutWorkspaceTransaction *)self _sendActivationResultWithError:0];
    }
    else
    {
      id v8 = [v7 exitContext];
      id v9 = [v8 createError];
      [(SBSceneLayoutWorkspaceTransaction *)self _sendActivationResultWithError:v9];
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__SBSceneLayoutWorkspaceTransaction_transaction_willLaunchProcess___block_invoke;
  v12[3] = &unk_1E6B05998;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SBSceneLayoutWorkspaceTransaction *)self _enumerateObserversWithBlock:v12];
}

- (BOOL)_canBeInterrupted
{
  id v2 = +[SBSetupManager sharedInstance];
  if ([v2 isInSetupMode])
  {
    id v3 = +[SBSetupManager sharedInstance];
    char v4 = [v3 isInSetupModeReadyToExit];
  }
  else
  {
    char v4 = 1;
  }

  return v4;
}

- (void)_willInterruptWithReason:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  [(SBSceneLayoutWorkspaceTransaction *)&v5 _willInterruptWithReason:a3];
  self->_transitionFailed = 1;
  char v4 = [(SBWorkspaceTransaction *)self _transitionRequestForInterruption];
  if (v4) {
    objc_storeStrong((id *)&self->_interruptingTransitionRequest, v4);
  }
}

- (void)_willFailWithReason:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSceneLayoutWorkspaceTransaction;
  [(SBSceneLayoutWorkspaceTransaction *)&v4 _willFailWithReason:a3];
  self->_transitionFailed = 1;
}

uint64_t __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 320) addObject:a2];
}

uint64_t __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [v3 sceneIdentifier];
  if (([*(id *)(a1 + 32) containsObject:v4] & 1) != 0
    || ([*(id *)(a1 + 40) _sceneEntities:*(void *)(*(void *)(a1 + 40) + 328) hasEntityRepresentingSceneID:v4] & 1) != 0)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 40) _shouldKeepSceneForSceneHandleForeground:v3] ^ 1;
  }

  return v5;
}

void __62__SBSceneLayoutWorkspaceTransaction__captureAppsForTransition__block_invoke_5(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 sceneIfExists];
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
    objc_super v4 = [v3 clientProcess];
    uint64_t v5 = [v4 bundleIdentifier];

    id v6 = [*(id *)(*(void *)(a1 + 40) + 280) previousApplicationSceneEntityForBundleID:v5];
    if (v6
      || (id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 208)),
          [WeakRetained createSceneEntityForHandle:v11],
          id v6 = objc_claimAutoreleasedReturnValue(),
          WeakRetained,
          v6))
    {
      [*(id *)(*(void *)(a1 + 40) + 336) addObject:v6];
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = v8[40];
      id v10 = [v11 sceneIdentifier];
      LOBYTE(v8) = [v8 _sceneEntities:v9 hasEntityRepresentingSceneID:v10];

      if ((v8 & 1) == 0) {
        [*(id *)(*(void *)(a1 + 40) + 320) addObject:v6];
      }
    }
  }
}

void __75__SBSceneLayoutWorkspaceTransaction__collectSceneIDsOfExternallyHostedApps__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 sceneIdentifier];
  [v2 addObject:v3];
}

- (BOOL)_sceneEntities:(id)a3 hasEntityRepresentingSceneID:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "sceneHandle", (void)v15);
        id v12 = [v11 sceneIdentifier];
        char v13 = [v12 isEqualToString:v6];

        if (v13)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (BOOL)_shouldKeepSceneForSceneHandleForeground:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [a3 sceneIfExists];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v11 = 0;
    char v6 = [WeakRetained transaction:self shouldKeepSceneForeground:v4 withReason:&v11];
    id v7 = v11;
    if (v7)
    {
      uint64_t v8 = SBLogTransaction();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = [v4 identifier];
        *(_DWORD *)buf = 138543618;
        char v13 = v9;
        __int16 v14 = 2114;
        id v15 = v7;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Keeping scene %{public}@ foreground for reason:\n%{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

uint64_t __56__SBSceneLayoutWorkspaceTransaction__completeTransition__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 userInfo];
  id v3 = [v2 objectForKey:*MEMORY[0x1E4F4F650]];
  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F623C8]];

  return v4;
}

id __70__SBSceneLayoutWorkspaceTransaction__updateKeyboardContextMaskStyles___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 workspaceEntity];
  id v3 = [v2 deviceApplicationSceneEntity];
  uint64_t v4 = [v3 sceneHandle];

  return v4;
}

uint64_t __66__SBSceneLayoutWorkspaceTransaction__prepareScenesForSceneUpdates__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v13 = a3;
  char v6 = [v13 uniqueIdentifier];
  id v7 = [*(id *)(a1 + 32) uniqueIdentifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 40) layoutAttributesForItem:v13];
    BOOL IsOccluded = SBDisplayItemLayoutAttributesOcclusionStateIsOccluded([v9 occlusionState]);
    uint64_t v11 = [v9 sizingPolicy];
    if (!IsOccluded && v11 == 2)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0xFFFFLL;
      *a4 = 1;
    }
  }
  return MEMORY[0x1F4181820]();
}

id __73__SBSceneLayoutWorkspaceTransaction__updateScenesForTransitionCompletion__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 sceneHandle];
  id v3 = [v2 sceneIdentifier];

  return v3;
}

void __73__SBSceneLayoutWorkspaceTransaction__updateScenesForTransitionCompletion__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setForeground:0];
  id v3 = [v2 ignoreOcclusionReasons];

  [v3 removeAllObjects];
}

uint64_t __73__SBSceneLayoutWorkspaceTransaction__updateScenesForTransitionCompletion__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setPresentedLayerTypes:26];
}

void __73__SBSceneLayoutWorkspaceTransaction__updateScenesForTransitionCompletion__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  objc_msgSend(v5, "setJetsamMode:", objc_msgSend(v3, "_jetsamModeForScene:", v4));
  objc_msgSend(v5, "setActivityMode:", objc_msgSend(*(id *)(a1 + 32), "_activityModeForScene:", *(void *)(a1 + 40)));
}

- (BOOL)_overrideInterfaceOrientationForOrientationMismatch:(int64_t *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  char v6 = self->_updateTransactions;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    SEL v29 = a2;
    long long v30 = a3;
    long long v32 = self;
    obuint64_t j = v6;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v35;
    uint64_t v31 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v13 = [v12 applicationSceneEntity];
        __int16 v14 = [MEMORY[0x1E4F62490] sharedInstance];
        id v15 = [v12 sceneIdentifier];
        uint64_t v16 = [v14 sceneWithIdentifier:v15];

        long long v17 = [v12 sceneSettings];
        long long v18 = [v12 sceneSettings];
        uint64_t v19 = [v18 interfaceOrientation];

        uint64_t v20 = [v16 uiClientSettings];
        uint64_t v21 = objc_msgSend(v20, "sb_effectiveInterfaceOrientation");

        if ([v16 isValid] && objc_msgSend(v17, "isUISubclass"))
        {
          if (([v17 deviceOrientationEventsEnabled] & 1) == 0)
          {
            if ([(SBSceneLayoutWorkspaceTransaction *)v32 isAuditHistoryEnabled]) {
              [(SBSceneLayoutWorkspaceTransaction *)v32 _addAuditHistoryItem:@"Don't need to do any orientation override, the settings don't have orientation events enabled"];
            }

            return 0;
          }
          if (v19 != v21)
          {
            if (v9 && v9 != v21)
            {
              uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
              uint64_t v26 = BSInterfaceOrientationDescription();
              CGFloat v27 = BSInterfaceOrientationDescription();
              [v25 handleFailureInMethod:v29, v32, @"SBSceneLayoutWorkspaceTransaction.m", 934, @"Multiple override interface orientations don't make sense (%@ vs %@)", v26, v27 object file lineNumber description];
            }
            if ([(SBSceneLayoutWorkspaceTransaction *)v32 isAuditHistoryEnabled])
            {
              double v22 = BSInterfaceOrientationDescription();
              id v23 = [v13 application];
              uint64_t v24 = [v23 bundleIdentifier];
              [(SBSceneLayoutWorkspaceTransaction *)v32 _addAuditHistoryItem:@"Scene Layout Transaction needs to override orientation to %@ for %@", v22, v24];

              uint64_t v10 = v31;
            }
            int64_t v9 = v21;
          }
        }
      }
      uint64_t v8 = [(NSMutableSet *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v8) {
        continue;
      }
      break;
    }

    BOOL result = v9 != 0;
    if (v30)
    {
      if (v9)
      {
        *long long v30 = v9;
        return 1;
      }
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (void)_updatePreferredDisplayLayoutTransitionReason:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  uint64_t v11 = v4;
  if (!v4)
  {
    uint64_t v4 = [(SBSceneLayoutWorkspaceTransaction *)self _defaultDisplayLayoutTransitionReason];
  }
  if (v4 != self->_preferredDisplayLayoutTransitionReason)
  {
    id v5 = (NSString *)[(NSString *)v4 copy];
    preferredDisplayLayoutTransitionReason = self->_preferredDisplayLayoutTransitionReason;
    self->_preferredDisplayLayoutTransitionReason = v5;

    if (self->_displayLayoutTransitionAssertion)
    {
      uint64_t v7 = [(SBWorkspaceTransaction *)self windowScene];
      uint64_t v8 = [v7 displayLayoutPublisher];

      int64_t v9 = [v8 transitionAssertionWithReason:self->_preferredDisplayLayoutTransitionReason];
      [(BSInvalidatable *)self->_displayLayoutTransitionAssertion invalidate];
      displayLayoutTransitionAssertion = self->_displayLayoutTransitionAssertion;
      self->_displayLayoutTransitionAssertion = v9;
    }
  }
}

- (void)transaction:(id)a3 willUpdateScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SBSceneLayoutWorkspaceTransaction_transaction_willUpdateScene___block_invoke;
  v10[3] = &unk_1E6B05998;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBSceneLayoutWorkspaceTransaction *)self _enumerateObserversWithBlock:v10];
}

void __65__SBSceneLayoutWorkspaceTransaction_transaction_willUpdateScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transaction:*(void *)(a1 + 32) willUpdateScene:*(void *)(a1 + 40)];
  }
}

- (BOOL)isReadyForSynchronizedCommit
{
  sceneUpdateTransactionGroup = self->_sceneUpdateTransactionGroup;
  return !sceneUpdateTransactionGroup
      || [(FBSynchronizedTransactionGroup *)sceneUpdateTransactionGroup isReadyForSynchronizedCommit];
}

- (BOOL)synchronizedTransactionGroup:(id)a3 shouldFailForSynchronizedTransaction:(id)a4
{
  id v5 = a4;
  self->_transitionFailed = 1;
  if ([(SBSceneLayoutWorkspaceTransaction *)self isAuditHistoryEnabled])
  {
    id v6 = [MEMORY[0x1E4F4F718] descriptionForObject:v5];
    [(SBSceneLayoutWorkspaceTransaction *)self _addAuditHistoryItem:@"Update transaction failed: %@", v6];
  }
  return 0;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

@end