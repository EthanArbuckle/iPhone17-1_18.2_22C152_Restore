@interface SBInCallPresentationManager
+ (BOOL)isSpecializedAPISupported;
- (BOOL)_hasPendingDismissalOfSceneHandleWithPersistenceIdentifier:(id)a3;
- (BOOL)_isManagingSceneOrSceneHandleWithPersistenceIdentifier:(id)a3;
- (BOOL)_shouldSuppressNonModalCalls;
- (BOOL)canHandleOpenApplicationRequestForApplication:(id)a3;
- (BOOL)canHostAnApp;
- (BOOL)disablesSystemVolumeHUDForCategory:(id)a3;
- (BOOL)disallowsLockHardwareButtonDoublePress;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)hasFullscreenActiveCallInSwitcher;
- (BOOL)hasOverrideAppSceneEntityForLaunchingApplication:(id)a3;
- (BOOL)inCallClientPresentationSession:(id)a3 canRestoreToPreviousEntity:(id)a4;
- (BOOL)inCallClientPresentationSessionAmbientPresentationActive:(id)a3;
- (BOOL)isHostingAnApp;
- (BOOL)supportsBecomingVisibleWhenUnlockingFromSource:(int)a3 wakingDisplay:(BOOL)a4;
- (BOOL)supportsHandlingDeviceLock;
- (BOOL)supportsHandlingUILockForWindowedAccessoryAttach;
- (SBHideSharePlayContentFromSharedScreenController)hideSharePlayContentFromSharedScreenController;
- (SBInCallPresentationManager)initWithWindowSceneManager:(id)a3 applicationController:(id)a4 bannerManager:(id)a5;
- (SBInCallPresentationManagerDelegate)delegate;
- (SBInCallPresentationSession)_lastPresentationSession;
- (SBWindowSceneManager)windowSceneManager;
- (UIEdgeInsets)inCallClientPresentationSessionResolvedPIPDodgingInsets:(id)a3;
- (id)_hostedPresentationSessions;
- (id)_newClientPresentationSessionWithSceneHandle:(id)a3;
- (id)_sessionForSceneWithIdentifier:(id)a3;
- (id)acquireNonModalSuppressionAssertionForReason:(id)a3;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (id)inCallClientPresentationSession:(id)a3 acquireHideSharePlayContentFromClonedDisplaysAssertionForReason:(id)a4;
- (id)overrideAppSceneEntityForLaunchingApplication:(id)a3;
- (id)scenesForBacklightSession;
- (id)sessionForSceneIdentifier:(id)a3;
- (int64_t)inCallClientPresentationSessionInterfaceOrientationForBannerPresentation:(id)a3;
- (int64_t)inCallClientPresentationSessionInterfaceOrientationForTransientOverlayPresentation:(id)a3;
- (void)_applicationDidExit:(id)a3;
- (void)_dismissAllPresentations;
- (void)_dismissAllPresentationsForApplication:(id)a3;
- (void)_dismissClientWithIdentifier:(id)a3 animated:(BOOL)a4 analyticsSource:(id)a5 reason:(id)a6 completion:(id)a7;
- (void)_evaluateNonModalSuppressionAssertions;
- (void)_ringerButtonDown:(id)a3;
- (void)_runZombieChecksForScene:(id)a3;
- (void)_runZombieChecksForSceneHandle:(id)a3;
- (void)ensureSwitcherInclusionForRestoringFromPIPForSceneWithPersistenceIdentifier:(id)a3 completion:(id)a4;
- (void)handleAccessoryAttachWithCompletion:(id)a3;
- (void)handleDeviceLockFromSource:(int)a3;
- (void)handleOpenApplicationRequest:(id)a3 clientWorkspace:(id)a4 actions:(id)a5 origin:(id)a6 options:(id)a7 withResult:(id)a8;
- (void)handlePresentationForActivityContinuationIdentifier:(id)a3;
- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3;
- (void)inCallClientPresentationSession:(id)a3 callConnectedStatusChangedForPresentableViewController:(id)a4;
- (void)inCallClientPresentationSession:(id)a3 handleDestroySceneActionWithReason:(int64_t)a4 analyticsSource:(id)a5 completion:(id)a6;
- (void)inCallClientPresentationSessionInvalidateBacklightEnvironment:(id)a3;
- (void)inCallClientPresentationSessionSceneWasDestroyed:(id)a3;
- (void)inCallPresentationRequestServer:(id)a3 clientWithIdentifier:(id)a4 requestsPresentationWithConfiguration:(id)a5 completion:(id)a6;
- (void)reactivateInCallForReason:(int64_t)a3;
- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4;
- (void)sceneManager:(id)a3 didAddScene:(id)a4;
- (void)sceneManager:(id)a3 willMoveScene:(id)a4 toSceneManager:(id)a5;
- (void)sceneManagerDidInvalidate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBInCallPresentationManager

- (void)sceneManager:(id)a3 didAddScene:(id)a4
{
}

- (BOOL)isHostingAnApp
{
  v2 = [(SBInCallPresentationManager *)self _hostedPresentationSessions];
  char v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", &__block_literal_global_177);

  return v3;
}

- (id)_hostedPresentationSessions
{
  char v3 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession allValues];
  if (v3) {
    v4 = v3;
  }
  else {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v5 = [(NSMutableArray *)self->_pendingInvalidationSessions arrayByAddingObjectsFromArray:v4];
  v6 = v5;
  if (!v5) {
    v5 = v3;
  }
  id v7 = v5;

  return v7;
}

- (BOOL)hasOverrideAppSceneEntityForLaunchingApplication:(id)a3
{
  char v3 = [(SBInCallPresentationManager *)self overrideAppSceneEntityForLaunchingApplication:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)overrideAppSceneEntityForLaunchingApplication:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) overrideAppSceneEntityForLaunchingApplication:v4];
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)canHandleOpenApplicationRequestForApplication:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:@"com.apple.InCallService"])
  {
    v5 = [v3 processState];
    char v6 = [v5 isRunning];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_runZombieChecksForScene:(id)a3
{
  id v4 = a3;
  v5 = [v4 settings];
  char v6 = [v5 displayConfiguration];
  id v10 = [v6 identity];

  uint64_t v7 = +[SBSceneManagerCoordinator sharedInstance];
  uint64_t v8 = [v7 sceneManagerForDisplayIdentity:v10];

  v9 = [v8 existingSceneHandleForScene:v4];

  if (v9) {
    [(SBInCallPresentationManager *)self _runZombieChecksForSceneHandle:v9];
  }
}

- (void)_runZombieChecksForSceneHandle:(id)a3
{
  id v4 = a3;
  v5 = [v4 application];
  char v6 = [v5 bundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.InCallService"];

  if (v7)
  {
    uint64_t v8 = [v4 sceneIfExists];

    if (v8)
    {
      v9 = [v4 persistenceIdentifier];
      BOOL v10 = [(SBInCallPresentationManager *)self _hasPendingDismissalOfSceneHandleWithPersistenceIdentifier:v9];

      v11 = [v4 persistenceIdentifier];
      if (v11
        && !v10
        && ![(SBInCallPresentationManager *)self _isManagingSceneOrSceneHandleWithPersistenceIdentifier:v11])
      {
        v12 = SBLogInCallPresentation();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[SBInCallPresentationManager _runZombieChecksForSceneHandle:]((uint64_t)v4, v12, v13, v14, v15, v16, v17, v18);
        }
      }
    }
  }
}

- (SBInCallPresentationManager)initWithWindowSceneManager:(id)a3 applicationController:(id)a4 bannerManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)SBInCallPresentationManager;
  v12 = [(SBInCallPresentationManager *)&v33 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_windowSceneManager, a3);
    objc_storeStrong((id *)&v13->_applicationController, a4);
    uint64_t v14 = objc_alloc_init(SBInCallPresentationRequestServer);
    presentationRequestServer = v13->_presentationRequestServer;
    v13->_presentationRequestServer = v14;

    [(SBInCallPresentationRequestServer *)v13->_presentationRequestServer setDelegate:v13];
    [(SBInCallPresentationRequestServer *)v13->_presentationRequestServer activate];
    uint64_t v16 = objc_alloc_init(SBInCallBannerAuthority);
    inCallBannerAuthority = v13->_inCallBannerAuthority;
    v13->_inCallBannerAuthority = v16;

    uint64_t v18 = v13->_inCallBannerAuthority;
    v19 = +[SBInCallBannerPresentableViewController requesterIdentifier];
    [v11 registerAuthority:v18 forRequesterIdentifier:v19];

    v20 = objc_alloc_init(SBExpanseBannerAuthority);
    expanseBannerAuthority = v13->_expanseBannerAuthority;
    v13->_expanseBannerAuthority = v20;

    [v11 registerAuthority:v13->_expanseBannerAuthority forRequesterIdentifier:@"com.apple.ConversationKit"];
    v22 = [MEMORY[0x1E4F628D8] storeForApplication:@"com.apple.InCallService"];
    [v22 removeAllSceneDataStores];

    v23 = [MEMORY[0x1E4F62490] sharedInstance];
    [v23 addObserver:v13];

    v24 = [(id)SBApp backlightEnvironmentSessionProvider];
    [v24 registerBacklightEnvironmentSceneProvider:v13];

    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v13 selector:sel__ringerButtonDown_ name:*MEMORY[0x1E4FA7A98] object:0];

    objc_initWeak(&location, v13);
    v26 = (void *)MEMORY[0x1E4F4F6E8];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __94__SBInCallPresentationManager_initWithWindowSceneManager_applicationController_bannerManager___block_invoke;
    v30[3] = &unk_1E6AF92D8;
    objc_copyWeak(&v31, &location);
    uint64_t v27 = [v26 assertionWithIdentifier:@"Non Modal Call Suppression Assertion" stateDidChangeHandler:v30];
    nonModalSuppressionAssertions = v13->_nonModalSuppressionAssertions;
    v13->_nonModalSuppressionAssertions = (BSCompoundAssertion *)v27;

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __94__SBInCallPresentationManager_initWithWindowSceneManager_applicationController_bannerManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _evaluateNonModalSuppressionAssertions];
}

- (id)acquireNonModalSuppressionAssertionForReason:(id)a3
{
  return (id)[(BSCompoundAssertion *)self->_nonModalSuppressionAssertions acquireForReason:a3];
}

- (BOOL)_shouldSuppressNonModalCalls
{
  return [(BSCompoundAssertion *)self->_nonModalSuppressionAssertions isActive];
}

- (void)_evaluateNonModalSuppressionAssertions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBInCallPresentationManager *)self _shouldSuppressNonModalCalls];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setNonModalPresentationsSuppressed:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)inCallClientPresentationSession:(id)a3 handleDestroySceneActionWithReason:(int64_t)a4 analyticsSource:(id)a5 completion:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  long long v11 = (void (**)(id, uint64_t))a6;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__58;
  v32 = __Block_byref_object_dispose__58;
  id v33 = 0;
  clientIdentifierToPresentationSession = self->_clientIdentifierToPresentationSession;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __125__SBInCallPresentationManager_inCallClientPresentationSession_handleDestroySceneActionWithReason_analyticsSource_completion___block_invoke;
  v25 = &unk_1E6B02B40;
  id v13 = v9;
  id v26 = v13;
  uint64_t v27 = &v28;
  [(NSMutableDictionary *)clientIdentifierToPresentationSession enumerateKeysAndObjectsUsingBlock:&v22];
  if (v29[5])
  {
    uint64_t v14 = SBLogInCallPresentation();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_msgSend(v13, "sceneHandle", v22, v23, v24, v25);
      id v16 = [v15 sceneIdentifier];
      uint64_t v17 = SBSUIInCallWindowSceneSessionDestructionReasonDescription();
      *(_DWORD *)buf = 138543874;
      id v35 = v16;
      __int16 v36 = 2114;
      v37 = v17;
      __int16 v38 = 2114;
      id v39 = v10;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Dismissing client with scene identifier %{public}@ from destroy scene action request with reason %{public}@, analyticsSource: %{public}@", buf, 0x20u);
    }
    [(SBInCallPresentationManager *)self _dismissClientWithIdentifier:v29[5] animated:1 analyticsSource:v10 reason:@"client request" completion:v11];
  }
  else
  {
    uint64_t v18 = SBLogInCallPresentation();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v13, "sceneHandle", v22, v23, v24, v25);
      id v20 = [v19 sceneIdentifier];
      v21 = SBSUIInCallWindowSceneSessionDestructionReasonDescription();
      *(_DWORD *)buf = 138543618;
      id v35 = v20;
      __int16 v36 = 2114;
      v37 = v21;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Failed to find client identifier for scene identifier %{public}@ to handle destroy scene action with reason %{public}@", buf, 0x16u);
    }
    if (v11) {
      v11[2](v11, 1);
    }
  }

  _Block_object_dispose(&v28, 8);
}

void __125__SBInCallPresentationManager_inCallClientPresentationSession_handleDestroySceneActionWithReason_analyticsSource_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

- (void)inCallClientPresentationSessionSceneWasDestroyed:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__58;
  uint64_t v23 = __Block_byref_object_dispose__58;
  id v24 = 0;
  clientIdentifierToPresentationSession = self->_clientIdentifierToPresentationSession;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __80__SBInCallPresentationManager_inCallClientPresentationSessionSceneWasDestroyed___block_invoke;
  id v16 = &unk_1E6B02B40;
  id v6 = v4;
  id v17 = v6;
  uint64_t v18 = &v19;
  [(NSMutableDictionary *)clientIdentifierToPresentationSession enumerateKeysAndObjectsUsingBlock:&v13];
  if (v20[5])
  {
    uint64_t v7 = SBLogInCallPresentation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_msgSend(v6, "sceneHandle", v13, v14, v15, v16);
      id v9 = [v8 sceneIdentifier];
      *(_DWORD *)buf = 138543362;
      id v26 = v9;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Dismissing client with scene identifier %{public}@ due to scene destruction", buf, 0xCu);
    }
    [(SBInCallPresentationManager *)self _dismissClientWithIdentifier:v20[5] animated:0 analyticsSource:*MEMORY[0x1E4FA7E50] reason:@"inCallClientPresentationSessionSceneWasDestroyed" completion:0];
  }
  else
  {
    id v10 = SBLogInCallPresentation();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = objc_msgSend(v6, "sceneHandle", v13, v14, v15, v16);
      long long v12 = [v11 sceneIdentifier];
      *(_DWORD *)buf = 138543362;
      id v26 = v12;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Already removed client identifier %{public}@ from set of presentation sessions which means we think we already have handled inCallClientPresentationSessionSceneWasDestroyed and can safely do nothing.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v19, 8);
}

void __80__SBInCallPresentationManager_inCallClientPresentationSessionSceneWasDestroyed___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

- (void)inCallClientPresentationSessionInvalidateBacklightEnvironment:(id)a3
{
  objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 invalidateBacklightScenesForProvider:self];
}

- (int64_t)inCallClientPresentationSessionInterfaceOrientationForBannerPresentation:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v7 = [v5 windowScene];

  int64_t v8 = [WeakRetained inCallPresentationManager:self interfaceOrientationForBannerPresentationInWindowScene:v7];
  return v8;
}

- (int64_t)inCallClientPresentationSessionInterfaceOrientationForTransientOverlayPresentation:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v7 = [v5 windowScene];

  int64_t v8 = [WeakRetained inCallPresentationManager:self interfaceOrientationForTransientOverlayPresentationInWindowScene:v7];
  return v8;
}

- (void)inCallClientPresentationSession:(id)a3 callConnectedStatusChangedForPresentableViewController:(id)a4
{
}

- (id)inCallClientPresentationSession:(id)a3 acquireHideSharePlayContentFromClonedDisplaysAssertionForReason:(id)a4
{
  id v5 = a4;
  id v6 = [(SBInCallPresentationManager *)self hideSharePlayContentFromSharedScreenController];
  uint64_t v7 = [v6 acquireHideSharePlayContentFromClonedDisplaysAssertionForReason:v5];

  return v7;
}

- (BOOL)inCallClientPresentationSession:(id)a3 canRestoreToPreviousEntity:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 sceneHandle];
  int64_t v8 = [v6 deviceApplicationSceneEntity];

  id v9 = [v8 sceneHandle];

  id v10 = [v9 application];
  long long v11 = [v7 application];
  if (([v10 isEqual:v11] & 1) == 0)
  {

    goto LABEL_5;
  }
  long long v12 = [v9 persistenceIdentifier];
  uint64_t v13 = [v7 persistenceIdentifier];
  char v14 = [v12 isEqualToString:v13];

  if (v14)
  {
LABEL_5:
    char v16 = 1;
    goto LABEL_6;
  }
  uint64_t v15 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession allValues];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__SBInCallPresentationManager_inCallClientPresentationSession_canRestoreToPreviousEntity___block_invoke;
  v18[3] = &unk_1E6B02B68;
  id v19 = v9;
  char v16 = objc_msgSend(v15, "bs_containsObjectPassingTest:", v18);

LABEL_6:
  return v16;
}

uint64_t __90__SBInCallPresentationManager_inCallClientPresentationSession_canRestoreToPreviousEntity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 sceneHandle];
  if ([v4 isEqual:*(void *)(a1 + 32)]) {
    uint64_t v5 = [v3 canBeRestored];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)inCallClientPresentationSessionAmbientPresentationActive:(id)a3
{
  id v3 = [(SBInCallPresentationManager *)self windowSceneManager];
  id v4 = [v3 activeDisplayWindowScene];
  uint64_t v5 = [v4 ambientPresentationController];
  char v6 = [v5 isPresented];

  return v6;
}

- (void)inCallPresentationRequestServer:(id)a3 clientWithIdentifier:(id)a4 requestsPresentationWithConfiguration:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v12 = [v10 sceneBundleIdentifier];
  uint64_t v13 = [(SBApplicationController *)self->_applicationController applicationWithBundleIdentifier:v12];
  id v19 = v9;
  id v20 = v10;
  uint64_t v21 = v12;
  uint64_t v22 = v11;
  id v14 = v12;
  id v15 = v10;
  id v16 = v13;
  id v17 = v11;
  id v18 = v9;
  BSDispatchMain();
}

void __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];

  if (v2)
  {
    id v3 = SBLogInCallPresentation();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v69 = v4;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Skipping presentation for client with identifier %{public}@ because there is already a presentation session", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 72);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
    return;
  }
  char v6 = *(void **)(a1 + 48);
  if (v6)
  {
    uint64_t v7 = [v6 processState];
    char v8 = [v7 isRunning];

    if (v8)
    {
      id v9 = *(void **)(*(void *)(a1 + 32) + 56);
      id v10 = [*(id *)(a1 + 48) bundleIdentifier];
      LOBYTE(v9) = [v9 containsObject:v10];

      if ((v9 & 1) == 0)
      {
        id v11 = *(void **)(*(void *)(a1 + 32) + 56);
        if (!v11)
        {
          uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
          uint64_t v13 = *(void *)(a1 + 32);
          id v14 = *(void **)(v13 + 56);
          *(void *)(v13 + 56) = v12;

          id v11 = *(void **)(*(void *)(a1 + 32) + 56);
        }
        id v15 = [*(id *)(a1 + 48) bundleIdentifier];
        [v11 addObject:v15];

        id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v16 addObserver:*(void *)(a1 + 32) selector:sel__applicationDidExit_ name:@"SBApplicationDidExitNotification" object:*(void *)(a1 + 48)];
      }
      id v17 = [*(id *)(*(void *)(a1 + 32) + 104) activeDisplayWindowScene];
      id v18 = [v17 sceneManager];

      if ([*(id *)(a1 + 56) isUserInitiated]) {
        BOOL v19 = [*(id *)(a1 + 56) preferredPresentationMode] == 3;
      }
      else {
        BOOL v19 = 0;
      }
      id v26 = [v18 displayIdentity];
      if ([v26 isContinuityDisplay])
      {
        int v27 = [*(id *)(a1 + 56) shouldPreferContinuityDisplayForFullScreenPresentation] ^ 1 | v19;

        if (v27 != 1) {
          goto LABEL_28;
        }
        id v26 = [*(id *)(*(void *)(a1 + 32) + 104) embeddedDisplayWindowScene];
        uint64_t v28 = [v26 sceneManager];

        id v18 = (void *)v28;
      }

LABEL_28:
      if (([*(id *)(*(void *)(a1 + 32) + 64) containsObject:v18] & 1) == 0)
      {
        [v18 addObserver:*(void *)(a1 + 32)];
        [*(id *)(*(void *)(a1 + 32) + 64) addObject:v18];
      }
      uint64_t v29 = *(void *)(a1 + 48);
      uint64_t v30 = (void *)[v18 newSceneIdentityForApplication:v29];
      id v31 = [v18 displayIdentity];
      v32 = +[SBApplicationSceneHandleRequest defaultRequestForApplication:v29 sceneIdentity:v30 displayIdentity:v31];

      id v33 = [v32 sceneDefinition];
      v34 = (void *)[v33 mutableCopy];

      id v35 = [MEMORY[0x1E4FA7BA8] specification];
      [v34 setSpecification:v35];

      [v32 setSceneDefinition:v34];
      uint64_t v36 = [*(id *)(a1 + 56) preferredPresentationMode];
      uint64_t v37 = objc_opt_class();
      __int16 v38 = [v18 fetchOrCreateApplicationSceneHandleForRequest:v32];
      id v39 = SBSafeCast(v37, v38);

      if (v39)
      {
        if ((v36 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          uint64_t v40 = +[SBLockScreenManager sharedInstanceIfExists];
          char v41 = [v40 isUILocked];

          if ((v41 & 1) == 0)
          {
            v42 = +[SBAssistantController sharedInstanceIfExists];
            [v42 dismissAssistantViewInEverySceneIfNecessary];
          }
        }
        v43 = (void *)[*(id *)(a1 + 32) _newClientPresentationSessionWithSceneHandle:v39];
        objc_msgSend(v43, "setNonModalPresentationsSuppressed:", objc_msgSend(*(id *)(a1 + 32), "_shouldSuppressNonModalCalls"));
        if (v43)
        {
          v44 = *(void **)(*(void *)(a1 + 32) + 40);
          if (!v44)
          {
            uint64_t v45 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
            uint64_t v46 = *(void *)(a1 + 32);
            v47 = *(void **)(v46 + 40);
            *(void *)(v46 + 40) = v45;

            v44 = *(void **)(*(void *)(a1 + 32) + 40);
          }
          [v44 setObject:v43 forKey:*(void *)(a1 + 40)];
          [v43 setDelegate:*(void *)(a1 + 32)];
          [*(id *)(a1 + 56) preferredBannerHeight];
          objc_msgSend(v43, "setPreferredBannerHeight:");
          v48 = SBLogInCallPresentation();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v49 = [v39 sceneIdentifier];
            v50 = SBSInCallPresentationModeDescription();
            *(_DWORD *)buf = 138543618;
            v69 = v49;
            __int16 v70 = 2114;
            v71 = v50;
            _os_log_impl(&dword_1D85BA000, v48, OS_LOG_TYPE_DEFAULT, "Requesting client presentation session presentation for scene identifier: %{public}@ with initial presentation mode: %{public}@", buf, 0x16u);
          }
          [v43 setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:v36 != 3];
          v51 = [(id)SBApp backlightEnvironmentSessionProvider];
          [v51 invalidateBacklightScenesForProvider:*(void *)(a1 + 32)];

          uint64_t v52 = *MEMORY[0x1E4FA7E40];
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_41;
          v62[3] = &unk_1E6AF6A70;
          uint64_t v53 = *(void *)(a1 + 56);
          id v63 = *(id *)(a1 + 48);
          id v54 = v43;
          uint64_t v55 = *(void *)(a1 + 32);
          v56 = *(void **)(a1 + 40);
          id v64 = v54;
          uint64_t v65 = v55;
          id v66 = v56;
          id v67 = *(id *)(a1 + 72);
          [v54 presentWithRequestedConfiguration:v53 animated:1 analyticsSource:v52 completion:v62];

          v57 = v63;
        }
        else
        {
          v60 = SBLogInCallPresentation();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_cold_3();
          }

          uint64_t v61 = *(void *)(a1 + 72);
          if (!v61) {
            goto LABEL_49;
          }
          v57 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBInCallPresentationManagerErrorDomain" code:-2004 userInfo:0];
          (*(void (**)(uint64_t, void *))(v61 + 16))(v61, v57);
        }
      }
      else
      {
        v58 = SBLogInCallPresentation();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
          __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_cold_2();
        }

        uint64_t v59 = *(void *)(a1 + 72);
        if (!v59) {
          goto LABEL_50;
        }
        v43 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBInCallPresentationManagerErrorDomain" code:-2003 userInfo:0];
        (*(void (**)(uint64_t, void *))(v59 + 16))(v59, v43);
      }
LABEL_49:

LABEL_50:
      goto LABEL_51;
    }
    id v24 = SBLogInCallPresentation();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v69 = v25;
      _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Skipping presentation for client with identifier %{public}@ because it is no longer running", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _dismissAllPresentationsForApplication:*(void *)(a1 + 48)];
    uint64_t v21 = *(void *)(a1 + 72);
    if (v21)
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = -2003;
      goto LABEL_22;
    }
  }
  else
  {
    id v20 = SBLogInCallPresentation();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_cold_1(v20);
    }

    uint64_t v21 = *(void *)(a1 + 72);
    if (v21)
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = -2002;
LABEL_22:
      id v18 = [v22 errorWithDomain:@"SBInCallPresentationManagerErrorDomain" code:v23 userInfo:0];
      (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v18);
LABEL_51:
    }
  }
}

void __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_41(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) processState];
  char v3 = [v2 isRunning];

  id v4 = SBLogInCallPresentation();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Successfully presented %@", buf, 0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 64);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Immediately dismissing session %{public}@ because the application is no longer running", buf, 0xCu);
    }

    id v9 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *MEMORY[0x1E4FA7E50];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_45;
    v12[3] = &unk_1E6AF5AA0;
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 64);
    [v9 _dismissClientWithIdentifier:v10 animated:0 analyticsSource:v11 reason:@"shouldImmediatelyDismiss" completion:v12];
  }
}

void __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_45(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogInCallPresentation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Immediately dismissed session %{public}@ with success %{BOOL}u", (uint8_t *)&v8, 0x12u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBInCallPresentationManagerErrorDomain" code:-2004 userInfo:0];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (UIEdgeInsets)inCallClientPresentationSessionResolvedPIPDodgingInsets:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v4 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v11) preferredPIPDodgingInsets];
        UIEdgeInsetsMax();
        double v4 = v12;
        double v3 = v13;
        double v6 = v14;
        double v5 = v15;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  double v16 = v4;
  double v17 = v3;
  double v18 = v6;
  double v19 = v5;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (BOOL)canHostAnApp
{
  return 1;
}

uint64_t __45__SBInCallPresentationManager_isHostingAnApp__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHostingAnApp];
}

- (id)hostedAppSceneHandle
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  double v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"SBInCallPresentationManager.m", 362, @"%@ should never be called", v5 object file lineNumber description];

  return 0;
}

- (id)hostedAppSceneHandles
{
  v2 = [(SBInCallPresentationManager *)self _hostedPresentationSessions];
  double v3 = objc_msgSend(v2, "bs_compactMap:", &__block_literal_global_57_1);
  double v4 = objc_msgSend(v3, "bs_flatten");

  return v4;
}

uint64_t __52__SBInCallPresentationManager_hostedAppSceneHandles__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hostedAppSceneHandles];
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = [(SBInCallPresentationManager *)self _hostedPresentationSessions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) hostedAppWillRotateToInterfaceOrientation:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4
{
}

- (void)sceneManagerDidInvalidate:(id)a3
{
}

- (void)sceneManager:(id)a3 willMoveScene:(id)a4 toSceneManager:(id)a5
{
  id v9 = a5;
  uint64_t v7 = [a4 identifier];
  uint64_t v8 = [(SBInCallPresentationManager *)self sessionForSceneIdentifier:v7];

  if (v8 && ([(NSMutableSet *)self->_observedSceneManagers containsObject:v9] & 1) == 0)
  {
    [v9 addObserver:self];
    [(NSMutableSet *)self->_observedSceneManagers addObject:v9];
  }
}

- (id)scenesForBacklightSession
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v4 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 sceneHandle];
        long long v11 = [v10 sceneIfExists];

        if (v11 && [v9 isShowingOnEmbeddedDisplay]) {
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (BOOL)isSpecializedAPISupported
{
  return 1;
}

- (id)sessionForSceneIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession objectEnumerator];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v10 = [v9 sceneHandle];
        long long v11 = [v10 sceneIdentifier];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)supportsHandlingDeviceLock
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) supportsHandlingDeviceLock])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)disallowsLockHardwareButtonDoublePress
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) disallowsLockHardwareButtonDoublePress])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)supportsBecomingVisibleWhenUnlockingFromSource:(int)a3 wakingDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * i) supportsBecomingVisibleWhenUnlockingFromSource:v5 wakingDisplay:v4])
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (void)handleAccessoryAttachWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * v9) handleAccessoryAttachWithCompletion:v4])
        {

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v4[2](v4, 0);
LABEL_11:
}

- (void)handlePresentationForActivityContinuationIdentifier:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() isSpecializedAPISupported])
  {
    uint64_t v3 = [MEMORY[0x1E4FADA90] sharedInstance];
    [v3 activateInCallUIWithActivityContinuationIdentifier:v4];
  }
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) handleHeadsetButtonPress:v3])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)handleDeviceLockFromSource:(int)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogInCallPresentation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "SBLogInCallPresentationManager handling handleDeviceLockFromSource", buf, 2u);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession objectEnumerator];
  uint64_t v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([v9 supportsHandlingDeviceLock])
        {
          if (!v5)
          {
            uint64_t v5 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
          }
          [v5 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v6);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([v5 count])
  {
    *(void *)buf = 0;
    uint64_t v30 = buf;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    [v5 allObjects];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(obj);
          }
          long long v14 = *(void **)(*((void *)&v25 + 1) + 8 * j);
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __58__SBInCallPresentationManager_handleDeviceLockFromSource___block_invoke;
          v19[3] = &unk_1E6B02BF8;
          id v20 = v5;
          long long v21 = v14;
          id v24 = buf;
          id v22 = WeakRetained;
          long long v23 = self;
          [v14 handleDeviceLockFromSource:a3 completion:v19];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v11);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v15 = SBLogInCallPresentation();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBInCallPresentationManager handleDeviceLockFromSource:](v15);
    }

    [WeakRetained inCallPresentationManagerRequestsHandlingOfDeferredUILock:self];
  }
}

uint64_t __58__SBInCallPresentationManager_handleDeviceLockFromSource___block_invoke(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  uint64_t result = [*(id *)(a1 + 32) count];
  if (!result && !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v5 = SBLogInCallPresentation();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      v7[0] = 67109120;
      v7[1] = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBLogInCallPresentationManager finished handling handleDeviceLockFromSource, hasAnySessionConsumedLock: %{BOOL}u", (uint8_t *)v7, 8u);
    }

    return [*(id *)(a1 + 48) inCallPresentationManagerRequestsHandlingOfDeferredUILock:*(void *)(a1 + 56)];
  }
  return result;
}

- (void)reactivateInCallForReason:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogInCallPresentation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 2) {
      uint64_t v5 = @".invalid";
    }
    else {
      uint64_t v5 = off_1E6B02C90[a3 - 1];
    }
    int v8 = 138543362;
    BOOL v9 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Reactivating InCall for reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (!+[SBInCallPresentationManager isSpecializedAPISupported])
  {
    int v6 = +[SBWorkspace mainWorkspace];
    uint64_t v7 = [v6 inCallTransientOverlayManager];
    [v7 presentTransientOverlay];
  }
}

- (void)handleOpenApplicationRequest:(id)a3 clientWorkspace:(id)a4 actions:(id)a5 origin:(id)a6 options:(id)a7 withResult:(id)a8
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v49 = a4;
  id v13 = a5;
  id v51 = a6;
  id v14 = a7;
  v47 = (void (**)(id, void))a8;
  uint64_t v15 = SBLogInCallPresentation();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v61 = v51;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Handling open application request from origin %{public}@", buf, 0xCu);
  }

  uint64_t v16 = (void *)[v13 mutableCopy];
  v48 = v14;
  long long v17 = [v14 objectForKey:*MEMORY[0x1E4F62658]];
  int v18 = [v17 isEqualToString:*MEMORY[0x1E4FA7098]];

  if (v18)
  {
    if (!v16)
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    }
    id v19 = objc_alloc(MEMORY[0x1E4F42C20]);
    id v20 = [MEMORY[0x1E4F1CB10] URLWithString:@"facetime://?showInCallUI=1"];
    long long v21 = (void *)[v19 initWithURL:v20 workspaceOriginatingProcess:v51];

    [v16 addObject:v21];
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v22 = v13;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        if ([v27 UIActionType] == 1 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          id v28 = objc_alloc(MEMORY[0x1E4F42C20]);
          uint64_t v29 = [v27 url];
          uint64_t v30 = [v27 workspaceOriginatingProcess];
          uint64_t v31 = (void *)v30;
          if (v30) {
            id v32 = (id)v30;
          }
          else {
            id v32 = v51;
          }
          long long v33 = (void *)[v28 initWithURL:v29 workspaceOriginatingProcess:v32];

          [v16 removeObject:v27];
          [v16 addObject:v33];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v24);
  }

  long long v34 = [v50 processState];
  uint64_t v35 = [v34 pid];

  if (v35 != -1)
  {
    uint64_t v46 = [MEMORY[0x1E4F96478] targetWithPid:v35];
    long long v36 = [MEMORY[0x1E4F96308] attributeWithCompletionPolicy:1];
    v58[0] = v36;
    uint64_t v37 = [MEMORY[0x1E4F96338] grantWithUserInteractivity];
    v58[1] = v37;
    __int16 v38 = [MEMORY[0x1E4F96390] grantWithForegroundPriority];
    v58[2] = v38;
    uint64_t v39 = [MEMORY[0x1E4F96460] grantWithResistance:40];
    v58[3] = v39;
    uint64_t v40 = [MEMORY[0x1E4F96350] grant];
    v58[4] = v40;
    char v41 = [MEMORY[0x1E4F96470] withReason:9];
    v58[5] = v41;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:6];

    v43 = (void *)[objc_alloc(MEMORY[0x1E4F96318]) initWithExplanation:@"SBInCallPresentationManagerHandlingOpenApplication" target:v46 attributes:v42];
    [v43 acquireWithError:0];
    dispatch_time_t v44 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __110__SBInCallPresentationManager_handleOpenApplicationRequest_clientWorkspace_actions_origin_options_withResult___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    id v53 = v43;
    id v45 = v43;
    dispatch_after(v44, MEMORY[0x1E4F14428], block);
  }
  [v49 sendActions:v16];
  v47[2](v47, 0);
}

uint64_t __110__SBInCallPresentationManager_handleOpenApplicationRequest_clientWorkspace_actions_origin_options_withResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)ensureSwitcherInclusionForRestoringFromPIPForSceneWithPersistenceIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v24 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v7 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v26 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
      id v13 = [v12 sceneHandle];
      id v14 = [v13 sceneIfExists];
      uint64_t v15 = [v14 settings];
      uint64_t v16 = objc_opt_class();
      id v17 = v15;
      if (v16) {
        id v18 = (objc_opt_isKindOfClass() & 1) != 0 ? v17 : 0;
      }
      else {
        id v18 = 0;
      }
      id v19 = v18;

      id v20 = [v19 persistenceIdentifier];
      char v21 = [v20 isEqualToString:v6];

      if (v21) {
        break;
      }

      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
    id v22 = v12;

    if (!v22) {
      goto LABEL_17;
    }
    uint64_t v23 = v24;
    [v22 ensureInclusionInSwitcherForRestoreFromPIPWithCompletion:v24];
  }
  else
  {
LABEL_14:

LABEL_17:
    uint64_t v23 = v24;
    (*((void (**)(id, void))v24 + 2))(v24, 0);
  }
}

- (BOOL)hasFullscreenActiveCallInSwitcher
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(SBInCallPresentationManager *)self _hostedPresentationSessions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isFullscreenCallInSwitcher])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (SBHideSharePlayContentFromSharedScreenController)hideSharePlayContentFromSharedScreenController
{
  lazy_hideSharePlayContentFromSharedScreenController = self->_lazy_hideSharePlayContentFromSharedScreenController;
  if (!lazy_hideSharePlayContentFromSharedScreenController)
  {
    uint64_t v4 = objc_alloc_init(SBHideSharePlayContentFromSharedScreenController);
    uint64_t v5 = self->_lazy_hideSharePlayContentFromSharedScreenController;
    self->_lazy_hideSharePlayContentFromSharedScreenController = v4;

    lazy_hideSharePlayContentFromSharedScreenController = self->_lazy_hideSharePlayContentFromSharedScreenController;
  }
  return lazy_hideSharePlayContentFromSharedScreenController;
}

- (BOOL)disablesSystemVolumeHUDForCategory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession allValues];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__SBInCallPresentationManager_disablesSystemVolumeHUDForCategory___block_invoke;
  v9[3] = &unk_1E6B02B68;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v9);

  return v7;
}

uint64_t __66__SBInCallPresentationManager_disablesSystemVolumeHUDForCategory___block_invoke(uint64_t a1, void *a2)
{
  return [a2 disablesSystemVolumeHUDForCategory:*(void *)(a1 + 32)];
}

- (void)_dismissAllPresentationsForApplication:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_clientIdentifierToPresentationSession copy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SBInCallPresentationManager__dismissAllPresentationsForApplication___block_invoke;
  v10[3] = &unk_1E6B02C20;
  id v6 = v4;
  uint64_t v12 = self;
  id v13 = &v14;
  id v11 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];
  if (!*((unsigned char *)v15 + 24))
  {
    char v7 = (void *)MEMORY[0x1E4F628D8];
    long long v8 = [v6 bundleIdentifier];
    long long v9 = [v7 storeForApplication:v8];
    [v9 removeAllSceneDataStores];
  }
  _Block_object_dispose(&v14, 8);
}

void __70__SBInCallPresentationManager__dismissAllPresentationsForApplication___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = [a3 sceneHandle];
  id v6 = [v5 application];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 40) _dismissClientWithIdentifier:v8 animated:1 analyticsSource:*MEMORY[0x1E4FA7E50] reason:@"_dismissAllPresentationsForApplication" completion:0];
  }
}

- (void)_dismissAllPresentations
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_clientIdentifierToPresentationSession copy];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(v3, "keyEnumerator", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    uint64_t v8 = *MEMORY[0x1E4FA7E70];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBInCallPresentationManager *)self _dismissClientWithIdentifier:*(void *)(*((void *)&v10 + 1) + 8 * v9++) animated:1 analyticsSource:v8 reason:@"_dismissAllPresentations" completion:0];
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (SBInCallPresentationSession)_lastPresentationSession
{
  v2 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession allValues];
  uint64_t v3 = [v2 lastObject];

  return (SBInCallPresentationSession *)v3;
}

- (id)_sessionForSceneWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__58;
  uint64_t v16 = __Block_byref_object_dispose__58;
  id v17 = 0;
  clientIdentifierToPresentationSession = self->_clientIdentifierToPresentationSession;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__SBInCallPresentationManager__sessionForSceneWithIdentifier___block_invoke;
  v9[3] = &unk_1E6B02C48;
  long long v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(NSMutableDictionary *)clientIdentifierToPresentationSession enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __62__SBInCallPresentationManager__sessionForSceneWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(a1 + 40);
  if (!*(void *)(*(void *)(v9 + 8) + 40))
  {
    id v10 = [v7 sceneHandle];
    long long v11 = [v10 sceneIdentifier];
    int v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

    uint64_t v9 = *(void *)(a1 + 40);
    if (v12)
    {
      objc_storeStrong((id *)(*(void *)(v9 + 8) + 40), a3);
      uint64_t v9 = *(void *)(a1 + 40);
    }
  }
  if (*(void *)(*(void *)(v9 + 8) + 40)) {
    *a4 = 1;
  }
}

- (void)_ringerButtonDown:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) handleRingerButtonDown];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_dismissClientWithIdentifier:(id)a3 animated:(BOOL)a4 analyticsSource:(id)a5 reason:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession objectForKey:v12];
  id v17 = [v16 sceneHandle];
  id v18 = [v17 sceneIdentifier];

  if (v16 && ([(NSMutableArray *)self->_pendingInvalidationSessions containsObject:v16] & 1) == 0)
  {
    pendingInvalidationSessions = self->_pendingInvalidationSessions;
    if (!pendingInvalidationSessions)
    {
      id v20 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      char v21 = self->_pendingInvalidationSessions;
      self->_pendingInvalidationSessions = v20;

      pendingInvalidationSessions = self->_pendingInvalidationSessions;
    }
    [(NSMutableArray *)pendingInvalidationSessions addObject:v16];
    id v22 = SBLogInCallPresentation();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v16;
      __int16 v31 = 2114;
      id v32 = v14;
      _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "starting to destroy %{public}@ with reason %{public}@", buf, 0x16u);
    }

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __103__SBInCallPresentationManager__dismissClientWithIdentifier_animated_analyticsSource_reason_completion___block_invoke;
    v23[3] = &unk_1E6B02C70;
    id v24 = v16;
    long long v25 = self;
    id v26 = v12;
    id v27 = v18;
    id v28 = v15;
    [v24 dismissAndFinalizeSceneDestructionAnimated:v10 analyticsSource:v13 completion:v23];
  }
  else if (v15)
  {
    (*((void (**)(id, uint64_t))v15 + 2))(v15, 1);
  }
}

uint64_t __103__SBInCallPresentationManager__dismissClientWithIdentifier_animated_analyticsSource_reason_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = SBLogInCallPresentation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v13 = 138543618;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    int v16 = a2;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Destroyed %{public}@ with success %{BOOL}u", (uint8_t *)&v13, 0x12u);
  }

  if (a2)
  {
    [*(id *)(a1 + 32) invalidate];
    [*(id *)(*(void *)(a1 + 40) + 40) removeObjectForKey:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 40) + 48) removeObject:*(void *)(a1 + 32)];
    if (![*(id *)(*(void *)(a1 + 40) + 48) count])
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void **)(v6 + 48);
      *(void *)(v6 + 48) = 0;
    }
  }
  long long v8 = [MEMORY[0x1E4F62490] sharedInstance];
  long long v9 = [v8 sceneWithIdentifier:*(void *)(a1 + 56)];

  if (a2 && v9)
  {
    BOOL v10 = SBLogInCallPresentation();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __103__SBInCallPresentationManager__dismissClientWithIdentifier_animated_analyticsSource_reason_completion___block_invoke_cold_2();
    }
  }
  else
  {
    if (a2) {
      goto LABEL_14;
    }
    BOOL v10 = SBLogInCallPresentation();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __103__SBInCallPresentationManager__dismissClientWithIdentifier_animated_analyticsSource_reason_completion___block_invoke_cold_1();
    }
  }

LABEL_14:
  long long v11 = [(id)SBApp backlightEnvironmentSessionProvider];
  [v11 invalidateBacklightScenesForProvider:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (id)_newClientPresentationSessionWithSceneHandle:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v7 = [WeakRetained inCallPresentationManager:self createPresentationSessionWithSceneHandle:v5];

  return v7;
}

- (void)_applicationDidExit:(id)a3
{
  id v4 = [a3 object];
  [(SBInCallPresentationManager *)self _dismissAllPresentationsForApplication:v4];
}

- (BOOL)_isManagingSceneOrSceneHandleWithPersistenceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_clientIdentifierToPresentationSession allValues];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__SBInCallPresentationManager__isManagingSceneOrSceneHandleWithPersistenceIdentifier___block_invoke;
  v9[3] = &unk_1E6B02B68;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v9);

  return v7;
}

uint64_t __86__SBInCallPresentationManager__isManagingSceneOrSceneHandleWithPersistenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 sceneHandle];
  id v4 = [v3 persistenceIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (BOOL)_hasPendingDismissalOfSceneHandleWithPersistenceIdentifier:(id)a3
{
  id v4 = a3;
  pendingInvalidationSessions = self->_pendingInvalidationSessions;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__SBInCallPresentationManager__hasPendingDismissalOfSceneHandleWithPersistenceIdentifier___block_invoke;
  v8[3] = &unk_1E6B02B68;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(pendingInvalidationSessions) = [(NSMutableArray *)pendingInvalidationSessions bs_containsObjectPassingTest:v8];

  return (char)pendingInvalidationSessions;
}

uint64_t __90__SBInCallPresentationManager__hasPendingDismissalOfSceneHandleWithPersistenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 sceneHandle];
  id v4 = [v3 persistenceIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (SBInCallPresentationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBInCallPresentationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBWindowSceneManager)windowSceneManager
{
  return self->_windowSceneManager;
}

- (BOOL)supportsHandlingUILockForWindowedAccessoryAttach
{
  return self->_supportsHandlingUILockForWindowedAccessoryAttach;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lazy_hideSharePlayContentFromSharedScreenController, 0);
  objc_storeStrong((id *)&self->_nonModalSuppressionAssertions, 0);
  objc_storeStrong((id *)&self->_observedSceneManagers, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersOfObservedApplications, 0);
  objc_storeStrong((id *)&self->_pendingInvalidationSessions, 0);
  objc_storeStrong((id *)&self->_clientIdentifierToPresentationSession, 0);
  objc_storeStrong((id *)&self->_expanseBannerAuthority, 0);
  objc_storeStrong((id *)&self->_inCallBannerAuthority, 0);
  objc_storeStrong((id *)&self->_presentationRequestServer, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
}

void __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Could not find application for scene bundle ID presentation request", v1, 2u);
}

void __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Could not create a scene handle for application with bundle ID %{public}@", v2, v3, v4, v5, v6);
}

void __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Could not create a presentation session for application with bundle ID %{public}@", v2, v3, v4, v5, v6);
}

- (void)handleDeviceLockFromSource:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SBLogInCallPresentationManager finished handling handleDeviceLockFromSource, but shouldn't have claimed it could do so", v1, 2u);
}

void __103__SBInCallPresentationManager__dismissClientWithIdentifier_animated_analyticsSource_reason_completion___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_3();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_1D85BA000, v1, OS_LOG_TYPE_ERROR, "Dismissal failed for %{public}@ with sceneRemovedFromSceneManager: %{BOOL}u", v2, 0x12u);
}

void __103__SBInCallPresentationManager__dismissClientWithIdentifier_animated_analyticsSource_reason_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Failed to successfully destroy %{public}@, which should not be possible", v2, v3, v4, v5, v6);
}

- (void)_runZombieChecksForSceneHandle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end