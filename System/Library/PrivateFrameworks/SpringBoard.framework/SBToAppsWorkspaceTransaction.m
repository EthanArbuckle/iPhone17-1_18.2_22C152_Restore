@interface SBToAppsWorkspaceTransaction
+ (BOOL)canInterruptTransaction:(id)a3 forTransitionRequest:(id)a4;
- (BOOL)_beginAnimation;
- (BOOL)_canBeInterrupted;
- (BOOL)_hasPostAnimationTasks;
- (BOOL)_hasPreAnimationTasks;
- (BOOL)_isGoingToHomeScreenForTransitionRequest:(id)a3;
- (BOOL)_shouldFailForChildTransaction:(id)a3;
- (BOOL)_shouldResignActiveForAnimation;
- (BOOL)_shouldSerialDismissOverlays;
- (BOOL)_transitionWasCancelled;
- (BOOL)isGoingToCoverSheet;
- (BOOL)isGoingToLauncher;
- (BOOL)isGoingToMainSwitcher;
- (BOOL)shouldAnimateOrientationChangeOnCompletion;
- (BOOL)shouldPerformToAppStateCleanupOnCompletion;
- (BOOL)shouldPlaceOutgoingScenesUnderLockOnCompletion;
- (BOOL)shouldWatchdog:(id *)a3;
- (BOOL)toAndFromAppsDiffer;
- (BOOL)transaction:(id)a3 shouldKeepSceneForeground:(id)a4 withReason:(id *)a5;
- (NSSet)allLayoutTransactions;
- (NSSet)allTransitionRequests;
- (NSSet)ancillaryLayoutTransactions;
- (NSSet)ancillaryTransitionRequests;
- (NSSet)fromApplicationSceneEntities;
- (NSSet)toApplicationSceneEntities;
- (SBFloatingDockBehaviorAssertion)floatingDockBehaviorAssertion;
- (SBSceneLayoutWorkspaceTransaction)layoutTransaction;
- (SBToAppsWorkspaceTransaction)initWithTransitionRequest:(id)a3;
- (double)watchdogTimeout;
- (id)_customizedDescriptionProperties;
- (id)_homeScreenAppearanceController;
- (id)_iconManager;
- (id)_milestoneForLayoutTransaction:(id)a3;
- (id)_setupAnimation;
- (id)_transitionContext;
- (id)animationController;
- (id)createSceneEntityForHandle:(id)a3;
- (int64_t)_isGoingToHomeScreenInMainDisplayWindowScene;
- (unint64_t)_concurrentOverlayDismissalOptions;
- (unint64_t)_serialOverlayPreDismissalOptions;
- (void)_acquireResignActiveAssertion;
- (void)_beginAnimationIfNecessary;
- (void)_captureApplicationState;
- (void)_checkForAnimationCompletion;
- (void)_childTransactionDidComplete:(id)a3;
- (void)_clearAnimation;
- (void)_completeCurrentTransition;
- (void)_configureAnimation;
- (void)_delayTransitionCompletionForRequester:(id)a3;
- (void)_didComplete;
- (void)_didInterruptWithReason:(id)a3;
- (void)_fireAndClearResultBlockIfNecessaryForFailure:(BOOL)a3;
- (void)_logForInterruptAttemptReason:(id)a3;
- (void)_noteAnimationFinished;
- (void)_relinquishResignActiveAssertion;
- (void)_setShouldSerialDismissOverlays:(BOOL)a3;
- (void)_stopDelayingTransitionCompletionForRequester:(id)a3;
- (void)_willBegin;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
- (void)activateApplications;
- (void)animationController:(id)a3 willBeginAnimation:(BOOL)a4;
- (void)animationControllerDidFinishAnimation:(id)a3;
- (void)animationControllerDidRevealApplication:(id)a3;
- (void)dealloc;
- (void)performToAppStateCleanup;
- (void)setFloatingDockBehaviorAssertion:(id)a3;
- (void)synchronizedTransactionReadyToCommit:(id)a3;
- (void)transaction:(id)a3 didEndLayoutTransitionWithContinuation:(id)a4;
- (void)transaction:(id)a3 performTransitionWithCompletion:(id)a4;
- (void)transactionWillBeginLayoutTransition:(id)a3;
@end

@implementation SBToAppsWorkspaceTransaction

- (BOOL)isGoingToCoverSheet
{
  v3 = +[SBLockScreenManager sharedInstance];
  char v4 = [v3 isUILocked];

  v5 = [(SBWorkspaceTransaction *)self transitionRequest];
  v6 = [v5 transientOverlayContext];

  if (v6) {
    BOOL v7 = [v6 transitionType] == 1;
  }
  else {
    BOOL v7 = 0;
  }
  BOOL v8 = v4 & v7;

  return v8;
}

- (NSSet)allLayoutTransactions
{
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_layoutTransaction];
  char v4 = [v3 setByAddingObjectsFromSet:self->_ancillaryLayoutTransactions];

  return (NSSet *)v4;
}

+ (BOOL)canInterruptTransaction:(id)a3 forTransitionRequest:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  BOOL v8 = SBSafeCast(v7, v6);
  v9 = (void *)[v8 copyMainWorkspaceTransitionRequest];
  if (![v5 isInterrupted])
  {
    v12 = [v9 applicationContext];
    int v13 = [v12 isBackground];

    if (v13)
    {
      v14 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v14);
      [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  request is for background activation", v11, v5];
      goto LABEL_15;
    }
    v15 = +[SBSetupManager sharedInstance];
    if ([v15 isInSetupMode])
    {
      v16 = +[SBSetupManager sharedInstance];
      char v17 = [v16 isInSetupModeReadyToExit];

      if ((v17 & 1) == 0)
      {
        v18 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v18);
        [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because: we are in setup mode", v11, v5];
        goto LABEL_15;
      }
    }
    else
    {
    }
    v19 = [v5 transitionRequest];
    uint64_t v20 = [v19 source];

    if (v20 == 31)
    {
      v21 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v21);
      [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because: we are in a startup transition", v11, v5];
      goto LABEL_15;
    }
    if ([v9 source] == 44)
    {
      v22 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v22);
      [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because: transitions from app clip placeholders must be pended", v11, v5];
      goto LABEL_15;
    }
    v23 = [v5 transitionRequest];
    uint64_t v24 = [v23 source];

    if (v24 == 45)
    {
      v25 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v25);
      [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because: view morph animations are not interruptible", v11, v5];
      goto LABEL_15;
    }
    v28 = [v5 animationController];
    v29 = v28;
    if (v5 && v28)
    {
      if (([v28 isInterruptible] & 1) == 0)
      {
        v45 = (objc_class *)objc_opt_class();
        v46 = NSStringFromClass(v45);
        v47 = (objc_class *)objc_opt_class();
        v48 = NSStringFromClass(v47);
        [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  transaction animation isn't interruptible : animationController=<%@:%p>", v46, v5, v48, v29];

        goto LABEL_38;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v76 = 0;
        v77 = &v76;
        uint64_t v78 = 0x2020000000;
        char v79 = 0;
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __77__SBToAppsWorkspaceTransaction_canInterruptTransaction_forTransitionRequest___block_invoke;
        v75[3] = &unk_1E6AF4C30;
        v75[4] = &v76;
        [v29 _enumerateCoordinatingAnimationsWithBlock:v75];
        if (!*((unsigned char *)v77 + 24))
        {
          v57 = (objc_class *)objc_opt_class();
          v58 = NSStringFromClass(v57);
          [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  transaction animation isnt switcher animation and doesn't have switcher animation as a child", v58, v5];

          _Block_object_dispose(&v76, 8);
          goto LABEL_38;
        }
        _Block_object_dispose(&v76, 8);
      }
    }
    if (v9 && [v9 source] == 14)
    {
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  rotation", v31, v5];

LABEL_38:
      BOOL v26 = 0;
LABEL_39:

      goto LABEL_16;
    }
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v32 = [v5 _childWorkspaceTransactions];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v71 objects:v80 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v72;
      while (2)
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v72 != v34) {
            objc_enumerationMutation(v32);
          }
          v36 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          if (([v36 canInterruptForTransitionRequest:v6] & 1) == 0)
          {
            v39 = (objc_class *)objc_opt_class();
            v40 = NSStringFromClass(v39);
            v41 = (objc_class *)objc_opt_class();
            v42 = NSStringFromClass(v41);
            [v5 _logForInterruptAttemptReason:@"<%@:%p> NOT Interruptible due to child transaction not being interruptible: <%@:%p>", v40, v5, v42, v36];

            v43 = (objc_class *)objc_opt_class();
            v44 = NSStringFromClass(v43);
            [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  children aren't interruptible", v44, v5];

            goto LABEL_38;
          }
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v71 objects:v80 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }

    if ([v9 source] == 27)
    {
      v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  cannot interrupt for drag and drop requests", v38, v5];

      goto LABEL_38;
    }
    if ([v9 source] == 48)
    {
      v49 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v49);
      [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  cannot interrupt for InCall scene update requests", v50, v5];

      goto LABEL_38;
    }
    v51 = [v5 transitionRequest];
    v52 = [v51 applicationContext];

    v70 = [v52 previousLayoutState];
    v69 = [v52 layoutState];
    if ([v70 unlockedEnvironmentMode] == 3 && objc_msgSend(v69, "unlockedEnvironmentMode") == 1)
    {
      v53 = [v9 applicationContext];
      v54 = [v53 layoutState];
      if ([v54 unlockedEnvironmentMode] == 2)
      {
        v55 = (objc_class *)objc_opt_class();
        v56 = NSStringFromClass(v55);
        [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  zoom down animation cannot be interrupted by home -> switcher transition", v56, v5];

LABEL_50:
        BOOL v26 = 0;
LABEL_57:

        goto LABEL_39;
      }
    }
    v59 = [v9 transientOverlayContext];

    if (v59)
    {
      v60 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v60);
      [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because: The transition request contains a transient overlay context ", v53, v5];
      goto LABEL_50;
    }
    v61 = [v9 workspace];
    v53 = [v61 transactionForTransitionRequest:v9];

    uint64_t v62 = objc_opt_class();
    v63 = SBSafeCast(v62, v53);
    v64 = v63;
    if (v63)
    {
      v65 = [v63 _setupAnimation];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v66 = (objc_class *)objc_opt_class();
        v67 = NSStringFromClass(v66);
        [v5 _logForInterruptAttemptReason:@"<%@:%p> interruptible because:  next request is switcher-controllable", v67, v5];

        BOOL v26 = 1;
LABEL_56:

        goto LABEL_57;
      }
    }
    v68 = (objc_class *)objc_opt_class();
    v65 = NSStringFromClass(v68);
    [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  other", v65, v5];
    BOOL v26 = 0;
    goto LABEL_56;
  }
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v5 _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  already interrupted", v11, v5];
LABEL_15:

  BOOL v26 = 0;
LABEL_16:

  return v26;
}

- (void)_didComplete
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [(SBToAppsWorkspaceTransaction *)self _relinquishResignActiveAssertion];
  v3 = [(SBWorkspaceTransaction *)self transitionRequest];
  char v4 = [v3 workspace];

  if ([(SBToAppsWorkspaceTransaction *)self isGoingToLauncher]
    && ([v4 transientOverlayPresentationManager],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 hasActivePresentation],
        v5,
        (v6 & 1) == 0))
  {
    BOOL v8 = +[SBPasscodeController sharedInstance];
    [v8 checkPasscodeCompliance];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:*MEMORY[0x1E4FA7A50] object:self userInfo:0];

    pid_hibernate();
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FA62D0] sharedInstance];
    [v7 dismissAppIconForceTouchControllers:0];
  }
  v10 = +[SBSetupManager sharedInstance];
  if (([v10 isInSetupMode] & 1) == 0)
  {
LABEL_14:

    goto LABEL_15;
  }
  v11 = +[SBSetupManager sharedInstance];
  int v12 = [v11 updateInSetupMode];

  if (v12)
  {
    int v13 = +[SBSetupManager sharedInstance];
    char v14 = [v13 isInSetupModeReadyToExit];

    if ((v14 & 1) == 0)
    {
      v15 = [(SBWorkspaceTransaction *)self windowScene];
      v10 = [v15 switcherController];

      v16 = [v10 layoutState];
      char v17 = [v16 elementWithRole:1];

      v18 = [v17 workspaceEntity];
      v19 = [v18 deviceApplicationSceneEntity];
      uint64_t v20 = [v19 sceneHandle];

      v21 = [(SBWorkspaceTransaction *)self transitionRequest];
      v22 = [v21 workspace];

      v23 = [v22 transientOverlayPresentationManager];
      char v24 = [v23 hasActivePresentation];

      if ((v24 & 1) == 0)
      {
        v25 = [v20 application];
        BOOL v26 = [v25 info];
        char v27 = [v26 isLaunchableDuringSetup];

        if ((v27 & 1) == 0)
        {
          v28 = SBLogCommon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v38 = self;
            __int16 v39 = 1024;
            int v40 = 0;
            __int16 v41 = 2112;
            v42 = v20;
            _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "Activating setup because in setup mode at end of transaction %@. hasActiveTransientOverlayPresentation = %{BOOL}u activeApplicationSceneHandle = %@. Forcibly launching setup.", buf, 0x1Cu);
          }

          v29 = +[SBApplicationController sharedInstance];
          v30 = [v29 setupApplication];
          SBWorkspaceActivateApplication(v30);
        }
      }

      goto LABEL_14;
    }
  }
LABEL_15:
  v31 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
  int v32 = objc_msgSend(v31, "bs_containsObjectPassingTest:", &__block_literal_global_322);

  if (v32) {
    [(id)SBApp _performBlockAfterCATransactionCommits:&__block_literal_global_136_1];
  }
  v36.receiver = self;
  v36.super_class = (Class)SBToAppsWorkspaceTransaction;
  [(SBMainWorkspaceTransaction *)&v36 _didComplete];
  if (self->_coordinatedLayoutStateTransitionContext)
  {
    uint64_t v33 = [(SBWorkspaceTransaction *)self windowScene];
    uint64_t v34 = [v33 switcherController];

    v35 = [v34 switcherCoordinator];
    [v35 cleanUpAfterCoordinatedLayoutStateTransitionWithContext:self->_coordinatedLayoutStateTransitionContext];
  }
}

- (void)_relinquishResignActiveAssertion
{
}

- (void)_logForInterruptAttemptReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    uint64_t v7 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v12];
    if ([(SBToAppsWorkspaceTransaction *)self isAuditHistoryEnabled]) {
      [(SBToAppsWorkspaceTransaction *)self _addAuditHistoryItem:@"%@", v7];
    }
    BOOL v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
    }
  }
}

- (id)animationController
{
  return self->_animationController;
}

- (void)_fireAndClearResultBlockIfNecessaryForFailure:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(SBToAppsWorkspaceTransaction *)self _transitionContext];
  if ([v6 needsToSendActivationResult])
  {
    if (v3)
    {
      id v5 = SBWTErrorCreate(self, (void *)1, 0);
      [v6 sendActivationResultError:v5];
    }
    else
    {
      [v6 sendActivationResultError:0];
    }
    if ([(SBToAppsWorkspaceTransaction *)self isAuditHistoryEnabled]) {
      -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", @"Sent activation result; success = %d",
    }
        !v3);
  }
}

- (id)_transitionContext
{
  return [(SBWorkspaceTransitionRequest *)self->super.super._transitionRequest applicationContext];
}

- (NSSet)ancillaryTransitionRequests
{
  return self->_ancillaryTransitionRequests;
}

- (void)_beginAnimationIfNecessary
{
  animationController = self->_animationController;
  if (animationController)
  {
    [(SBUIAnimationController *)animationController addObserver:self];
    id v4 = self->_animationController;
    [(SBToAppsWorkspaceTransaction *)self addChildTransaction:v4];
  }
  else if ([(SBToAppsWorkspaceTransaction *)self isAuditHistoryEnabled])
  {
    [(SBToAppsWorkspaceTransaction *)self _addAuditHistoryItem:@"No animation specified."];
  }
}

- (BOOL)isGoingToLauncher
{
  v2 = self;
  BOOL v3 = [(SBWorkspaceTransaction *)self transitionRequest];
  LOBYTE(v2) = [(SBToAppsWorkspaceTransaction *)v2 _isGoingToHomeScreenForTransitionRequest:v3];

  return (char)v2;
}

- (BOOL)_isGoingToHomeScreenForTransitionRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 applicationContext];

  uint64_t v7 = [v6 layoutState];
  BOOL v8 = SBSafeCast(v5, v7);

  uint64_t v9 = [v8 unlockedEnvironmentMode];
  BOOL IsValid = SBPeekConfigurationIsValid([v8 peekConfiguration]);
  if (v9 != 1 && !IsValid) {
    LOBYTE(v12) = 0;
  }
  else {
    BOOL v12 = ![(SBToAppsWorkspaceTransaction *)self isGoingToCoverSheet];
  }

  return v12;
}

- (BOOL)isGoingToMainSwitcher
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SBWorkspaceTransaction *)self transitionRequest];
  uint64_t v5 = [v4 applicationContext];
  id v6 = [v5 layoutState];
  uint64_t v7 = SBSafeCast(v3, v6);

  LOBYTE(v4) = [v7 unlockedEnvironmentMode] == 2;
  return (char)v4;
}

- (void)animationController:(id)a3 willBeginAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v8 = (SBUIAnimationController *)a3;
  if ([(SBToAppsWorkspaceTransaction *)self isAuditHistoryEnabled])
  {
    id v6 = [MEMORY[0x1E4F4F718] descriptionForObject:v8];
    [(SBToAppsWorkspaceTransaction *)self _addAuditHistoryItem:@"Animation will begin: %@", v6];
  }
  if (self->_animationController == v8)
  {
    [(SBToAppsWorkspaceTransaction *)self _animationWillBegin:v4];
  }
  else if ([(SBToAppsWorkspaceTransaction *)self isAuditHistoryEnabled])
  {
    uint64_t v7 = [MEMORY[0x1E4F4F718] descriptionForObject:v8];
    [(SBToAppsWorkspaceTransaction *)self _addAuditHistoryItem:@"!!!! Animation began that we weren't tracking: %@", v7];
  }
}

- (SBToAppsWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 applicationContext];
  if (!v6)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"SBToAppsWorkspaceTransaction.m", 125, @"Invalid parameter not satisfying: %@", @"context != nil" object file lineNumber description];
  }
  if ([v6 isBackground])
  {
    BOOL v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SBToAppsWorkspaceTransaction.m", 126, @"Invalid parameter not satisfying: %@", @"![context isBackground]" object file lineNumber description];
  }
  uint64_t v7 = (void *)[v5 copyMainWorkspaceTransitionRequest];
  BOOL v8 = +[SBMainWorkspaceTransitionRequest ancillaryTransitionRequestsForTransitionRequest:v7];

  if ([v8 count])
  {
    if (([v5 isFinalized] & 1) == 0)
    {
      [v5 setCrossingDisplays:1];
      [v5 finalize];
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          char v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          [v14 setCrossingDisplays:1];
          [v14 finalize];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v11);
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)SBToAppsWorkspaceTransaction;
  v15 = [(SBMainWorkspaceTransaction *)&v29 initWithTransitionRequest:v5];
  if (v15)
  {
    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    layoutTransitionCompletions = v15->_layoutTransitionCompletions;
    v15->_layoutTransitionCompletions = v16;

    v18 = [[SBSceneLayoutWorkspaceTransaction alloc] initWithTransitionRequest:v5 delegate:v15];
    layoutTransaction = v15->_layoutTransaction;
    v15->_layoutTransaction = v18;

    [(SBSceneLayoutWorkspaceTransaction *)v15->_layoutTransaction setSynchronizationDelegate:v15];
    [(SBSceneLayoutWorkspaceTransaction *)v15->_layoutTransaction addObserver:v15];
    objc_storeStrong((id *)&v15->_ancillaryTransitionRequests, v8);
    ancillaryTransitionRequests = v15->_ancillaryTransitionRequests;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __58__SBToAppsWorkspaceTransaction_initWithTransitionRequest___block_invoke;
    v27[3] = &unk_1E6B09FA8;
    v21 = v15;
    v28 = v21;
    uint64_t v22 = [(NSSet *)ancillaryTransitionRequests bs_map:v27];
    ancillaryLayoutTransactions = v21->_ancillaryLayoutTransactions;
    v21->_ancillaryLayoutTransactions = (NSSet *)v22;

    v21->_applicationStateNeedsCapture = 1;
    [(SBToAppsWorkspaceTransaction *)v21 _captureApplicationState];
    v21->_shouldSerialDismissOverlays = 1;
  }
  return v15;
}

- (void)transaction:(id)a3 didEndLayoutTransitionWithContinuation:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = (void (**)(void))a4;
  if (![(NSSet *)self->_ancillaryLayoutTransactions containsObject:v7])
  {
    SEL v45 = a2;
    self->_applicationStateNeedsCapture = 1;
    id v9 = [MEMORY[0x1E4F1CA80] set];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v10 = [v7 sceneUpdateTransactions];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v54 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          if ([v15 isFailed])
          {
            [v9 addObject:v15];
            [(SBToAppsWorkspaceTransaction *)self _handleApplicationUpdateScenesTransactionFailed:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v12);
    }

    if ([(SBToAppsWorkspaceTransaction *)self shouldPerformToAppStateCleanupOnCompletion])
    {
      [(SBToAppsWorkspaceTransaction *)self performToAppStateCleanup];
    }
    -[SBToAppsWorkspaceTransaction _fireAndClearResultBlockIfNecessaryForFailure:](self, "_fireAndClearResultBlockIfNecessaryForFailure:", [v9 count] != 0);
    [(SBToAppsWorkspaceTransaction *)self _endTransition];
    id layoutTransitionContinuation = self->_layoutTransitionContinuation;
    self->_id layoutTransitionContinuation = 0;

    if ([(SBToAppsWorkspaceTransaction *)self isAuditHistoryEnabled]) {
      [(SBToAppsWorkspaceTransaction *)self _addAuditHistoryItem:@"------ Layout transition completed!"];
    }
    if (![v9 count] || (objc_msgSend(v7, "isInterrupted") & 1) != 0)
    {
      if (v8) {
        ((void (*)(void (**)(void), void, void))v8[2])(v8, 0, 0);
      }
      goto LABEL_46;
    }
    uint64_t v43 = v7;
    v44 = v8;
    v48 = [MEMORY[0x1E4F1CA80] set];
    v47 = [MEMORY[0x1E4F1CA80] set];
    v46 = [MEMORY[0x1E4F1CA80] set];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v17 = v9;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          v23 = [v22 applicationSceneEntity];
          [v48 addObject:v23];

          char v24 = [v22 process];
          v25 = [v24 exitContext];
          uint64_t v26 = [v24 applicationInfo];
          char v27 = (void *)v26;
          if (v25) {
            BOOL v28 = v26 == 0;
          }
          else {
            BOOL v28 = 1;
          }
          if (!v28)
          {
            char v29 = [v25 exitReason];
            long long v30 = v47;
            if ((v29 & 0x20) != 0
              || (v29 & 1) != 0
              && ([v25 terminationRequest],
                  long long v31 = objc_claimAutoreleasedReturnValue(),
                  v31,
                  long long v30 = v46,
                  !v31))
            {
              [v30 addObject:v27];
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v19);
    }

    if ([v47 count]
      && ![(SBAppRepairTransaction *)self->_appRepairTransaction isComplete])
    {
      id v7 = v43;
      if (self->_appRepairTransaction)
      {
        v42 = [MEMORY[0x1E4F28B00] currentHandler];
        [v42 handleFailureInMethod:v45 object:self file:@"SBToAppsWorkspaceTransaction.m" lineNumber:1216 description:@"can't run this twice"];
      }
      uint64_t v35 = (void *)[v44 copy];
      id v36 = self->_layoutTransitionContinuation;
      self->_id layoutTransitionContinuation = v35;

      uint64_t v34 = self->_animationController;
      [(SBToAppsWorkspaceTransaction *)self _clearAnimation];
      [(SBUIAnimationController *)v34 failWithReason:@"App Repair"];
      v37 = [[SBAppRepairTransaction alloc] initWithApplicationInfos:v47];
      appRepairTransaction = self->_appRepairTransaction;
      self->_appRepairTransaction = v37;

      [(SBToAppsWorkspaceTransaction *)self addChildTransaction:self->_appRepairTransaction];
      goto LABEL_45;
    }
    id v7 = v43;
    if (self->_retriedAfterVoluntaryExit || ![v46 count])
    {
      long long v32 = objc_alloc_init(SBMainWorkspaceLayoutStateContingencyPlan);
      long long v33 = [v43 transitionContext];
      uint64_t v34 = [(SBMainWorkspaceLayoutStateContingencyPlan *)v32 transitionContextForLayoutContext:v33 failedEntities:v48];

      if (v34) {
        goto LABEL_40;
      }
    }
    else
    {
      self->_retriedAfterVoluntaryExit = 1;
      if ([(SBToAppsWorkspaceTransaction *)self isAuditHistoryEnabled])
      {
        __int16 v39 = [v46 anyObject];
        int v40 = [v39 bundleIdentifier];
        [(SBToAppsWorkspaceTransaction *)self _addAuditHistoryItem:@"Retrying after voluntary exit of %@", v40];
      }
      uint64_t v34 = +[SBWorkspaceTransitionContext context];
      if (v34) {
        goto LABEL_40;
      }
    }
    __int16 v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:v45 object:self file:@"SBToAppsWorkspaceTransaction.m" lineNumber:1209 description:@"we better have a follow-up transition"];

LABEL_40:
    [(SBUIAnimationController *)v34 setAnimationDisabled:1];
    if (v44) {
      v44[2]();
    }
LABEL_45:

    BOOL v8 = v44;
LABEL_46:

    goto LABEL_47;
  }
  if (v8) {
    ((void (*)(void (**)(void), void, void))v8[2])(v8, 0, 0);
  }
LABEL_47:
}

- (void)synchronizedTransactionReadyToCommit:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(SBToAppsWorkspaceTransaction *)self allLayoutTransactions];
  int v5 = [v4 containsObject:v7];

  if (v5)
  {
    [v7 performSynchronizedCommit];
    id v6 = [(SBToAppsWorkspaceTransaction *)self _milestoneForLayoutTransaction:v7];
    [(SBToAppsWorkspaceTransaction *)self removeMilestone:v6];
  }
}

- (double)watchdogTimeout
{
  return 30.0;
}

- (void)performToAppStateCleanup
{
  id v15 = [(SBToAppsWorkspaceTransaction *)self _homeScreenAppearanceController];
  uint64_t v3 = [(SBWorkspaceTransaction *)self transitionRequest];
  if ([v3 source] == 8)
  {
    BOOL v4 = [(SBWorkspaceTransaction *)self transitionRequest];
    int v5 = [v4 applicationContext];
    char v6 = [v5 retainsSiri];

    if (v6) {
      goto LABEL_5;
    }
    uint64_t v3 = +[SBAssistantController sharedInstance];
    [v3 dismissAssistantViewInEverySceneIfNecessaryWithAnimation:0];
  }

LABEL_5:
  int64_t v7 = [(SBToAppsWorkspaceTransaction *)self _isGoingToHomeScreenInMainDisplayWindowScene];
  if (v7)
  {
    if (v7 == 1)
    {
      [v15 beginRequiringContentForReason:@"SBUIHomeScreenActiveContentRequirementReason"];
      BOOL v8 = [(SBToAppsWorkspaceTransaction *)self shouldAnimateOrientationChangeOnCompletion];
      if ([(SBWorkspaceTransaction *)self isMainDisplayTransaction])
      {
        id v9 = (void *)SBApp;
        uint64_t v10 = [(SBToAppsWorkspaceTransaction *)self _transitionContext];
        uint64_t v11 = [v10 layoutState];
        objc_msgSend(v9, "updateNativeOrientationWithOrientation:updateMirroredDisplays:animated:logMessage:", objc_msgSend(v11, "interfaceOrientation"), 1, v8, @"ToApps -performToAppStateCleanup");
      }
      uint64_t v12 = [(SBToAppsWorkspaceTransaction *)self _iconManager];
      uint64_t v13 = [v12 iconToReveal];

      if (v13) {
        [v12 tryScrollToIconToRevealAnimated:1];
      }
    }
  }
  else
  {
    [v15 endRequiringContentForReason:@"SBUIHomeScreenActiveContentRequirementReason"];
  }
  char v14 = [(SBToAppsWorkspaceTransaction *)self floatingDockBehaviorAssertion];
  [v14 invalidate];

  [(SBToAppsWorkspaceTransaction *)self setFloatingDockBehaviorAssertion:0];
}

- (void)transaction:(id)a3 performTransitionWithCompletion:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = (void (**)(void))a4;
  if ([(SBToAppsWorkspaceTransaction *)self isAuditHistoryEnabled]) {
    [(SBToAppsWorkspaceTransaction *)self _addAuditHistoryItem:@"Performing layout transition now."];
  }
  BOOL v8 = [(NSSet *)self->_ancillaryLayoutTransactions containsObject:v6];
  layoutTransitionCompletions = self->_layoutTransitionCompletions;
  if (v8)
  {
    if ([(NSMutableSet *)self->_layoutTransitionCompletions count])
    {
      uint64_t v10 = self->_layoutTransitionCompletions;
      uint64_t v11 = (void *)[v7 copy];
      uint64_t v12 = (void *)MEMORY[0x1D948C7A0]();
      [(NSMutableSet *)v10 addObject:v12];

      goto LABEL_35;
    }
    v7[2](v7);
    goto LABEL_36;
  }
  uint64_t v13 = (void *)[v7 copy];
  char v14 = (void *)MEMORY[0x1D948C7A0]();
  [(NSMutableSet *)layoutTransitionCompletions addObject:v14];

  id v15 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
  uint64_t v16 = [v15 count];

  if (!v16) {
    goto LABEL_26;
  }
  v44 = v7;
  id v45 = v6;
  id v17 = [(SBWorkspaceTransaction *)self windowScene];
  uint64_t v18 = [v17 sceneManager];
  uint64_t v43 = self;
  uint64_t v19 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
  uint64_t v20 = objc_msgSend(v19, "bs_map:", &__block_literal_global_181_1);

  v42 = v17;
  v21 = [v17 switcherController];
  uint64_t v22 = [v21 windowManagementStyle];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v20;
  uint64_t v23 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (!v23) {
    goto LABEL_25;
  }
  uint64_t v24 = v23;
  uint64_t v25 = *(void *)v49;
  do
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(void *)v49 != v25) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = *(void *)(*((void *)&v48 + 1) + 8 * i);
      BOOL v28 = +[SBSceneManager existingSceneHandleForSceneIdentity:v27];
      uint64_t v29 = objc_opt_class();
      id v30 = v28;
      if (v29)
      {
        if (objc_opt_isKindOfClass()) {
          long long v31 = v30;
        }
        else {
          long long v31 = 0;
        }
      }
      else
      {
        long long v31 = 0;
      }
      id v32 = v31;

      [v32 setWantsEnhancedWindowingEnabled:v22 == 2];
      long long v33 = [v30 sceneManager];
      if (v33)
      {
        if (BSEqualObjects()) {
          goto LABEL_23;
        }
        uint64_t v34 = v33;
      }
      else
      {
        if (!v30) {
          goto LABEL_23;
        }
        uint64_t v34 = v18;
      }
      [v34 transferOwnershipOfSceneWithIdentity:v27 toSceneManager:v18];
LABEL_23:
    }
    uint64_t v24 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  }
  while (v24);
LABEL_25:

  int64_t v7 = v44;
  id v6 = v45;
  self = v43;
LABEL_26:
  uint64_t v11 = [v6 transitionContext];
  [(SBToAppsWorkspaceTransaction *)self _synchronizeWithSceneUpdates];
  [(SBToAppsWorkspaceTransaction *)self _configureAnimation];
  [(SBToAppsWorkspaceTransaction *)self _isGoingToHomeScreenInMainDisplayWindowScene];
  if (BSSettingFlagIsYes())
  {
    uint64_t v35 = [(SBToAppsWorkspaceTransaction *)self _homeScreenAppearanceController];
    [v35 beginRequiringContentForReason:@"SBUIHomeScreenActiveContentRequirementReason"];
  }
  id v36 = [v11 previousLayoutState];
  v37 = [v11 layoutState];
  char v38 = [v36 isEqual:v37];

  if (v38)
  {
    BOOL v39 = [(SBToAppsWorkspaceTransaction *)self _beginAnimation];
    int v40 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __76__SBToAppsWorkspaceTransaction_transaction_performTransitionWithCompletion___block_invoke_2;
    v47[3] = &unk_1E6B057F8;
    v47[4] = self;
    [v40 enumerateObjectsUsingBlock:v47];

    if (!v39) {
      goto LABEL_35;
    }
LABEL_34:
    [(SBToAppsWorkspaceTransaction *)self _checkForAnimationCompletion];
    goto LABEL_35;
  }
  uint64_t v41 = [v11 interfaceOrientation];
  if (v41) {
    [(id)SBApp noteInterfaceOrientationChanged:v41 duration:0 updateMirroredDisplays:@"ToApps performing transition" logMessage:0.0];
  }
  if ([(SBToAppsWorkspaceTransaction *)self _beginAnimation]) {
    goto LABEL_34;
  }
LABEL_35:

LABEL_36:
}

- (int64_t)_isGoingToHomeScreenInMainDisplayWindowScene
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [(SBToAppsWorkspaceTransaction *)self allTransitionRequests];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [v8 displayIdentity];
        if ([v9 isMainDisplay])
        {

LABEL_13:
          [(SBToAppsWorkspaceTransaction *)self _isGoingToHomeScreenForTransitionRequest:v8];
          int64_t v12 = BSSettingFlagForBool();
          goto LABEL_14;
        }
        uint64_t v10 = [v8 displayIdentity];
        char v11 = [v10 isContinuityDisplay];

        if (v11) {
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_14:

  return v12;
}

- (NSSet)allTransitionRequests
{
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithObject:self->super.super._transitionRequest];
  uint64_t v4 = [v3 setByAddingObjectsFromSet:self->_ancillaryTransitionRequests];

  return (NSSet *)v4;
}

- (void)_configureAnimation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBSceneLayoutWorkspaceTransaction *)self->_layoutTransaction transitionContext];
  [(SBToAppsWorkspaceTransaction *)self _clearAnimation];
  if ([v3 animationDisabled])
  {
    if (![(SBToAppsWorkspaceTransaction *)self isAuditHistoryEnabled]) {
      goto LABEL_9;
    }
    uint64_t v4 = @"Skipping animation.";
  }
  else
  {
    uint64_t v5 = [(SBToAppsWorkspaceTransaction *)self _setupAnimation];
    animationController = self->_animationController;
    self->_animationController = v5;

    if (![(SBToAppsWorkspaceTransaction *)self isAuditHistoryEnabled]) {
      goto LABEL_9;
    }
    if (self->_animationController)
    {
      int64_t v7 = objc_msgSend(MEMORY[0x1E4F4F718], "descriptionForObject:");
      [(SBToAppsWorkspaceTransaction *)self _addAuditHistoryItem:@"Subclass specified animation: %@.", v7];

      goto LABEL_9;
    }
    uint64_t v20 = @"(none)";
    uint64_t v4 = @"Subclass specified animation: %@.";
  }
  -[SBToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", v4, v20);
LABEL_9:
  if (!self->_dismissedOverlays)
  {
    self->_dismissedOverlays = 1;
    if (self->_shouldSerialDismissOverlays)
    {
      unint64_t v13 = [(SBToAppsWorkspaceTransaction *)self _serialOverlayPreDismissalOptions];
      if (+[SBDismissOverlaysAnimationController willDismissOverlaysForDismissOptions:v13])
      {
        long long v14 = [[SBDismissOverlaysAnimationController alloc] initWithTransitionContextProvider:self->super.super._transitionRequest options:v13];
        p_super = &v14->super;
        long long v16 = self->_animationController;
        if (v16) {
          [(SBUIAnimationController *)v14 addCoordinatingChildTransaction:v16 withSchedulingPolicy:1];
        }
        long long v17 = self->_animationController;
        self->_animationController = p_super;
      }
    }
    else
    {
      unint64_t v13 = 0;
    }
    unint64_t v18 = [(SBToAppsWorkspaceTransaction *)self _concurrentOverlayDismissalOptions] & ~v13;
    if (v18
      && +[SBDismissOverlaysAnimationController willDismissOverlaysForDismissOptions:v18])
    {
      uint64_t v19 = [[SBDismissOverlaysAnimationController alloc] initWithTransitionContextProvider:self->super.super._transitionRequest options:v18];
      if (self->_animationController) {
        [(SBUIAnimationController *)self->_animationController addCoordinatingChildTransaction:v19 withSchedulingPolicy:0];
      }
      else {
        objc_storeStrong((id *)&self->_animationController, v19);
      }
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v8 = [(SBToAppsWorkspaceTransaction *)self allLayoutTransactions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SBUIAnimationController *)self->_animationController delayCleanupUntilTransactionFinishes:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
}

- (void)_childTransactionDidComplete:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (SBAppRepairTransaction *)a3;
  uint64_t v5 = v4;
  if (self->_appRepairTransaction != v4)
  {
    uint64_t v6 = [(SBToAppsWorkspaceTransaction *)self allLayoutTransactions];
    int v7 = [v6 containsObject:v5];

    if (v7)
    {
      BOOL v8 = [(SBToAppsWorkspaceTransaction *)self _milestoneForLayoutTransaction:v5];
      [(SBToAppsWorkspaceTransaction *)self removeMilestone:v8];
    }
    goto LABEL_35;
  }
  if ([(SBAppRepairTransaction *)v4 isFailed]) {
    char v9 = 0;
  }
  else {
    char v9 = [(SBAppRepairTransaction *)v5 isInterrupted] ^ 1;
  }
  if ([(SBToAppsWorkspaceTransaction *)self isAuditHistoryEnabled])
  {
    uint64_t v10 = NSStringFromBOOL();
    [(SBToAppsWorkspaceTransaction *)self _addAuditHistoryItem:@"App repair completed. Success = %@.", v10];
  }
  uint64_t v11 = [(SBSceneLayoutWorkspaceTransaction *)self->_layoutTransaction transitionContext];
  int64_t v12 = v11;
  if ((v9 & 1) == 0)
  {
    long long v15 = [MEMORY[0x1E4F1CA80] set];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v16 = [(SBAppRepairTransaction *)self->_appRepairTransaction appInfos];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [*(id *)(*((void *)&v39 + 1) + 8 * i) bundleIdentifier];
          long long v22 = [v12 applicationSceneEntityForBundleID:v21];

          if (v22) {
            [v15 addObject:v22];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v18);
    }

    long long v23 = objc_alloc_init(SBMainWorkspaceLayoutStateContingencyPlan);
    long long v24 = [(SBSceneLayoutWorkspaceTransaction *)self->_layoutTransaction transitionContext];
    long long v14 = [(SBMainWorkspaceLayoutStateContingencyPlan *)v23 transitionContextForLayoutContext:v24 failedEntities:v15];

    uint64_t v25 = [(SBAppRepairTransaction *)v5 error];
    uint64_t v26 = [v25 domain];
    if ([v26 isEqualToString:*MEMORY[0x1E4F4F648]])
    {
      uint64_t v27 = [v25 code];

      if (v27 == 1)
      {
        uint64_t v28 = 0;
        goto LABEL_25;
      }
    }
    else
    {
    }
    uint64_t v28 = 1;
LABEL_25:
    [v14 setAnimationDisabled:v28];
    if ([v15 count]
      && ([v25 userInfo],
          uint64_t v29 = objc_claimAutoreleasedReturnValue(),
          [v29 objectForKeyedSubscript:*MEMORY[0x1E4F4F650]],
          id v30 = objc_claimAutoreleasedReturnValue(),
          int v31 = [v30 isEqualToString:@"appRepairRequiresNetwork"],
          v30,
          v29,
          v31))
    {
      id v32 = [SBVPPAppRequiresHealingAlertItem alloc];
      long long v33 = [v15 anyObject];
      uint64_t v34 = [v33 application];
      unint64_t v13 = [(SBVPPAppRequiresHealingAlertItem *)v32 initWithApplication:v34];
    }
    else
    {
      unint64_t v13 = 0;
    }

    goto LABEL_30;
  }
  [v11 setAnimationDisabled:1];
  unint64_t v13 = 0;
  long long v14 = v12;
LABEL_30:
  if (self->_layoutTransitionContinuation)
  {
    uint64_t v35 = (void (**)(void, void, void))MEMORY[0x1D948C7A0]();
    id layoutTransitionContinuation = self->_layoutTransitionContinuation;
    self->_id layoutTransitionContinuation = 0;

    ((void (**)(void, void *, uint64_t))v35)[2](v35, v14, 2);
  }
  if (v13)
  {
    v37 = +[SBAlertItemsController sharedInstance];
    [v37 activateAlertItem:v13];
  }
LABEL_35:
  v38.receiver = self;
  v38.super_class = (Class)SBToAppsWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v38 _childTransactionDidComplete:v5];
}

- (void)dealloc
{
  [(SBToAppsWorkspaceTransaction *)self _fireAndClearResultBlockIfNecessaryForFailure:1];
  [(SBToAppsWorkspaceTransaction *)self _clearAnimation];
  [(UIApplicationSceneDeactivationAssertion *)self->_resignActiveAssertion relinquish];
  uint64_t v3 = [(SBToAppsWorkspaceTransaction *)self floatingDockBehaviorAssertion];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SBToAppsWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v4 dealloc];
}

- (void)_clearAnimation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_animationController)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = [(SBToAppsWorkspaceTransaction *)self allLayoutTransactions];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [(SBUIAnimationController *)self->_animationController stopDelayingCleanupForTransaction:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    [(SBUIAnimationController *)self->_animationController removeObserver:self];
    animationController = self->_animationController;
    self->_animationController = 0;
  }
}

- (SBFloatingDockBehaviorAssertion)floatingDockBehaviorAssertion
{
  return self->_floatingDockBehaviorAssertion;
}

- (void)activateApplications
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v3 = [(SBToAppsWorkspaceTransaction *)self allLayoutTransactions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = [(SBToAppsWorkspaceTransaction *)self _milestoneForLayoutTransaction:*(void *)(*((void *)&v19 + 1) + 8 * v7)];
        [(SBToAppsWorkspaceTransaction *)self addMilestone:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  long long v9 = [(SBToAppsWorkspaceTransaction *)self layoutTransaction];
  [(SBToAppsWorkspaceTransaction *)self addChildTransaction:v9];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v10 = [(SBToAppsWorkspaceTransaction *)self ancillaryLayoutTransactions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(SBToAppsWorkspaceTransaction *)self addChildTransaction:*(void *)(*((void *)&v15 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (id)_milestoneForLayoutTransaction:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@-%p", *MEMORY[0x1E4F623C0], a3];
}

- (SBSceneLayoutWorkspaceTransaction)layoutTransaction
{
  return self->_layoutTransaction;
}

- (NSSet)ancillaryLayoutTransactions
{
  return self->_ancillaryLayoutTransactions;
}

- (void)_checkForAnimationCompletion
{
  if (!self->_animationController) {
    [(SBToAppsWorkspaceTransaction *)self _noteAnimationFinished];
  }
}

- (BOOL)_beginAnimation
{
  if ([(SBToAppsWorkspaceTransaction *)self _hasPreAnimationTasks])
  {
    [(SBToAppsWorkspaceTransaction *)self addMilestone:@"SBWaitingForPreAnimationTasksMilestone"];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__SBToAppsWorkspaceTransaction__beginAnimation__block_invoke;
    v6[3] = &unk_1E6AF4AC0;
    v6[4] = self;
    [(SBToAppsWorkspaceTransaction *)self _performPreAnimationTasksWithCompletion:v6];
  }
  else
  {
    [(SBToAppsWorkspaceTransaction *)self removeMilestone:@"SBWaitingForPreAnimationTasksMilestone"];
  }
  int v3 = [(SBToAppsWorkspaceTransaction *)self isWaitingForMilestone:@"SBWaitingForPreAnimationTasksMilestone"];
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47__SBToAppsWorkspaceTransaction__beginAnimation__block_invoke_2;
    v5[3] = &unk_1E6AF4AC0;
    v5[4] = self;
    [(SBToAppsWorkspaceTransaction *)self listenForSatisfiedMilestone:@"SBWaitingForPreAnimationTasksMilestone" withBlock:v5];
  }
  else
  {
    [(SBToAppsWorkspaceTransaction *)self _beginAnimationIfNecessary];
  }
  return v3 ^ 1;
}

- (void)transactionWillBeginLayoutTransition:(id)a3
{
  id v4 = a3;
  if (![(NSSet *)self->_ancillaryLayoutTransactions containsObject:v4])
  {
    if ([(SBToAppsWorkspaceTransaction *)self isAuditHistoryEnabled]) {
      [(SBToAppsWorkspaceTransaction *)self _addAuditHistoryItem:@"------ Will begin layout transition."];
    }
    uint64_t v5 = [v4 transitionContext];
    uint64_t v6 = [v5 previousLayoutState];
    uint64_t v7 = [v5 layoutState];
    char v8 = [v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      long long v9 = [(SBToAppsWorkspaceTransaction *)self _iconManager];
      [v9 setEditing:0];
    }
    if ([(SBToAppsWorkspaceTransaction *)self _shouldResignActiveForAnimation]) {
      [(SBToAppsWorkspaceTransaction *)self _acquireResignActiveAssertion];
    }
    [(SBToAppsWorkspaceTransaction *)self _captureApplicationState];
    uint64_t v40 = 0;
    long long v41 = &v40;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = 0;
    long long v10 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __69__SBToAppsWorkspaceTransaction_transactionWillBeginLayoutTransition___block_invoke;
    v39[3] = &unk_1E6AF5B90;
    v39[4] = &v40;
    [v10 enumerateObjectsUsingBlock:v39];

    v11.n128_u64[0] = v41[3];
    v11.n128_f32[0] = v11.n128_f64[0];
    SBSetMinimumBrightnessLevel(1, v11, v12);
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [v5 layoutState];
    long long v15 = SBSafeCast(v13, v14);

    uint64_t v16 = objc_opt_class();
    long long v17 = [v5 previousLayoutState];
    long long v18 = SBSafeCast(v16, v17);

    uint64_t v19 = [v15 elements];
    long long v20 = [v18 elements];
    char v21 = BSEqualObjects();
    objc_super v38 = (void *)v19;
    uint64_t v22 = [v15 unlockedEnvironmentMode];
    if (v22 == [v18 unlockedEnvironmentMode]) {
      char v23 = v21;
    }
    else {
      char v23 = 0;
    }
    long long v24 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
    uint64_t v25 = [v24 count];

    if (v25 && !self->_underLockScreenInForeground && !self->_gestureInitiated)
    {
      char v26 = self->_touchCancellationDisabled ? 1 : v23;
      if ((v26 & 1) == 0)
      {
        uint64_t v27 = dispatch_get_global_queue(0, 0);
        dispatch_async(v27, &__block_literal_global_174);
      }
    }
    uint64_t v28 = v38;
    if ([v15 unlockedEnvironmentMode] == 3 && objc_msgSend(v18, "unlockedEnvironmentMode") == 3)
    {
      uint64_t v29 = [v15 interfaceOrientation];
      uint64_t v30 = [v18 interfaceOrientation];
    }
    else
    {
      uint64_t v29 = [(id)SBApp activeInterfaceOrientation];
      uint64_t v30 = [(id)SBApp interfaceOrientationForCurrentDeviceOrientation:0];
    }
    if (!((v29 == v30) | v21 & 1))
    {
      int v31 = [(SBToAppsWorkspaceTransaction *)self floatingDockBehaviorAssertion];
      [v31 invalidate];

      id v32 = [(SBWorkspaceTransaction *)self windowScene];
      long long v33 = [v32 floatingDockController];
      uint64_t v34 = [SBFloatingDockBehaviorAssertion alloc];
      uint64_t v35 = (objc_class *)objc_opt_class();
      id v36 = NSStringFromClass(v35);
      v37 = [(SBFloatingDockBehaviorAssertion *)v34 initWithFloatingDockController:v33 visibleProgress:1 animated:0 gesturePossible:10 atLevel:v36 reason:0 withCompletion:0.0];

      [(SBToAppsWorkspaceTransaction *)self setFloatingDockBehaviorAssertion:v37];
      uint64_t v28 = v38;
    }
    [(SBToAppsWorkspaceTransaction *)self _beginTransition];

    _Block_object_dispose(&v40, 8);
  }
}

- (void)_captureApplicationState
{
  if (self->_applicationStateNeedsCapture)
  {
    self->_applicationStateNeedsCapture = 0;
    self->_underLockScreenInForeground = 0;
    int v3 = [(SBWorkspaceTransaction *)self transitionRequest];
    self->_gestureInitiated = [v3 source] == 11;

    self->_preactivationForegroundRunningApplicationCount = 0;
    id v4 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__SBToAppsWorkspaceTransaction__captureApplicationState__block_invoke;
    v16[3] = &unk_1E6B057F8;
    v16[4] = self;
    [v4 enumerateObjectsUsingBlock:v16];

    self->_toAndFromApplicationsDiffer = 0;
    uint64_t v5 = [(SBToAppsWorkspaceTransaction *)self fromApplicationSceneEntities];
    uint64_t v6 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
    uint64_t v7 = [v6 count];
    if ([v5 count] == v7)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __56__SBToAppsWorkspaceTransaction__captureApplicationState__block_invoke_2;
      v13[3] = &unk_1E6B05820;
      id v8 = v6;
      id v14 = v8;
      long long v15 = self;
      [v5 enumerateObjectsUsingBlock:v13];
      if (self->_toAndFromApplicationsDiffer || [v8 count] != 1)
      {
        __n128 v11 = 0;
      }
      else
      {
        long long v9 = [v8 anyObject];
        long long v10 = [v9 sceneHandle];
        __n128 v11 = [v10 sceneIfExists];
      }
      __n128 v12 = [v11 uiSettings];
      self->_touchCancellationDisabled = [v12 deviceOrientationEventsEnabled];
    }
    else
    {
      self->_toAndFromApplicationsDiffer = 1;
    }
  }
}

- (NSSet)toApplicationSceneEntities
{
  return [(SBSceneLayoutWorkspaceTransaction *)self->_layoutTransaction toApplicationSceneEntities];
}

- (NSSet)fromApplicationSceneEntities
{
  return [(SBSceneLayoutWorkspaceTransaction *)self->_layoutTransaction fromApplicationSceneEntities];
}

- (BOOL)_shouldResignActiveForAnimation
{
  int v3 = [(SBSceneLayoutWorkspaceTransaction *)self->_layoutTransaction transitionContext];
  char v4 = [v3 animationDisabled];

  if (v4) {
    return 0;
  }
  animationController = self->_animationController;
  return [(SBUIAnimationController *)animationController shouldResignActiveForAnimation];
}

- (id)_homeScreenAppearanceController
{
  v2 = [(SBWorkspaceTransaction *)self windowScene];
  int v3 = [v2 homeScreenController];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[SBUIController sharedInstance];
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)setFloatingDockBehaviorAssertion:(id)a3
{
}

- (id)_iconManager
{
  v2 = [(SBWorkspaceTransaction *)self windowScene];
  int v3 = [v2 homeScreenController];

  id v4 = [v3 iconManager];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = +[SBIconController sharedInstance];
    id v6 = [v7 iconManager];
  }
  return v6;
}

- (void)animationControllerDidFinishAnimation:(id)a3
{
  id v6 = (SBUIAnimationController *)a3;
  if ([(SBToAppsWorkspaceTransaction *)self isAuditHistoryEnabled])
  {
    id v4 = [MEMORY[0x1E4F4F718] descriptionForObject:v6];
    [(SBToAppsWorkspaceTransaction *)self _addAuditHistoryItem:@"Animation did finish: %@", v4];
  }
  if (self->_animationController == v6)
  {
    [(SBToAppsWorkspaceTransaction *)self _animationDidFinish];
    [(SBToAppsWorkspaceTransaction *)self _noteAnimationFinished];
  }
  else if ([(SBToAppsWorkspaceTransaction *)self isAuditHistoryEnabled])
  {
    uint64_t v5 = [MEMORY[0x1E4F4F718] descriptionForObject:v6];
    [(SBToAppsWorkspaceTransaction *)self _addAuditHistoryItem:@"!!!! Animation completed that we weren't tracking: %@", v5];
  }
}

- (void)_noteAnimationFinished
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SBToAppsWorkspaceTransaction__noteAnimationFinished__block_invoke;
  v5[3] = &unk_1E6AF4AC0;
  v5[4] = self;
  int v3 = (void (**)(void))MEMORY[0x1D948C7A0](v5, a2);
  if ([(SBToAppsWorkspaceTransaction *)self _hasPostAnimationTasks])
  {
    [(SBToAppsWorkspaceTransaction *)self addMilestone:@"SBWaitingForPostAnimationTasksMilestone"];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __54__SBToAppsWorkspaceTransaction__noteAnimationFinished__block_invoke_2;
    v4[3] = &unk_1E6AF4AC0;
    v4[4] = self;
    [(SBToAppsWorkspaceTransaction *)self _performPostAnimationTasksWithCompletion:v4];
  }
  else
  {
    [(SBToAppsWorkspaceTransaction *)self removeMilestone:@"SBWaitingForPostAnimationTasksMilestone"];
  }
  if ([(SBToAppsWorkspaceTransaction *)self isWaitingForMilestone:@"SBWaitingForPostAnimationTasksMilestone"])[(SBToAppsWorkspaceTransaction *)self listenForSatisfiedMilestone:@"SBWaitingForPostAnimationTasksMilestone" withBlock:v3]; {
  else
  }
    v3[2](v3);
}

uint64_t __54__SBToAppsWorkspaceTransaction__noteAnimationFinished__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 256) count];
  if (!result)
  {
    int v3 = *(void **)(a1 + 32);
    return [v3 _completeCurrentTransition];
  }
  return result;
}

- (void)_completeCurrentTransition
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_layoutTransitionCompletions count])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    int v3 = (void *)[(NSMutableSet *)self->_layoutTransitionCompletions copy];
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
          (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [(NSMutableSet *)self->_layoutTransitionCompletions removeAllObjects];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_ancillaryTransitionRequests, 0);
  objc_storeStrong((id *)&self->_ancillaryLayoutTransactions, 0);
  objc_storeStrong((id *)&self->_layoutTransaction, 0);
  objc_storeStrong((id *)&self->_completionDelayRequesters, 0);
  objc_storeStrong((id *)&self->_coordinatedLayoutStateTransitionContext, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_appRepairTransaction, 0);
  objc_storeStrong(&self->_layoutTransitionContinuation, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_layoutTransitionCompletions, 0);
}

- (void)_willBegin
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v45 = [(SBWorkspaceTransitionRequest *)self->super.super._transitionRequest applicationContext];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  int v3 = self;
  obuint64_t j = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
  uint64_t v4 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v49 != v6) {
          objc_enumerationMutation(obj);
        }
        long long v8 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        long long v9 = [v8 application];
        long long v10 = [(id)SBApp privacyPreflightController];
        long long v11 = [v9 info];
        __n128 v12 = [v11 applicationIdentity];
        int v13 = [v10 requiresPreflightForApplication:v12];

        id v14 = [v9 processState];

        if (!v14 && (v13 & 1) == 0)
        {
          long long v15 = [v8 sceneHandle];
          uint64_t v16 = [v15 _createProcessExecutionContextFromContext:v45 entity:v8];

          if (v16)
          {
            long long v17 = [(SBWorkspaceTransitionRequest *)v3->super.super._transitionRequest displayConfiguration];
            id v18 = (id)[v9 _prepareInitializationContextIfNecessaryForLaunchOnDisplayConfiguration:v17];

            uint64_t v19 = [MEMORY[0x1E4F62448] sharedInstance];
            [v19 launchProcessWithContext:v16];
          }
          goto LABEL_13;
        }
        if (v13 && [(SBToAppsWorkspaceTransaction *)v3 isAuditHistoryEnabled])
        {
          uint64_t v16 = [v9 bundleIdentifier];
          [(SBToAppsWorkspaceTransaction *)v3 _addAuditHistoryItem:@"%@ requires preflight. Skipping prelaunch.", v16];
LABEL_13:
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v5);
  }

  long long v20 = [(SBWorkspaceTransaction *)v3 transitionRequest];
  char v21 = [v20 isCrossingDisplays];

  if (v21)
  {
    uint64_t v22 = [(SBToAppsWorkspaceTransaction *)v3 fromApplicationSceneEntities];
    char v23 = [v22 valueForKey:@"displayItemRepresentation"];

    long long v24 = [(SBToAppsWorkspaceTransaction *)v3 toApplicationSceneEntities];
    uint64_t v25 = [v24 valueForKey:@"displayItemRepresentation"];

    char v26 = (void *)[v25 mutableCopy];
    [v26 minusSet:v23];

    uint64_t v27 = [(SBWorkspaceTransaction *)v3 windowScene];
    uint64_t v28 = [v27 switcherController];

    uint64_t v29 = [(SBWorkspaceTransaction *)v3 transitionRequest];
    uint64_t v30 = [v29 applicationContext];
    int v31 = [v30 layoutState];
    id v32 = [v31 appLayout];

    long long v33 = +[SBApplicationController sharedInstance];
    uint64_t v34 = +[SBSwitcherCoordinatedLayoutStateTransitionContext coordinatedLayoutStateTransitionContextForMovingDisplayItems:v26 toSwitcherController:v28 toAppLayout:v32 withApplicationController:v33];
    coordinatedLayoutStateTransitionContext = v3->_coordinatedLayoutStateTransitionContext;
    v3->_coordinatedLayoutStateTransitionContext = (SBSwitcherCoordinatedLayoutStateTransitionContext *)v34;
  }
  if (v3->_coordinatedLayoutStateTransitionContext)
  {
    id v36 = [(SBWorkspaceTransaction *)v3 windowScene];
    v37 = [v36 switcherController];

    objc_super v38 = [v37 switcherCoordinator];
    [v38 prepareForCoordinatedLayoutStateTransitionWithContext:v3->_coordinatedLayoutStateTransitionContext];
  }
  v47.receiver = v3;
  v47.super_class = (Class)SBToAppsWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v47 _willBegin];
  long long v39 = [(SBWorkspaceTransaction *)v3 transitionRequest];
  uint64_t v40 = [v39 workspace];

  if ([(SBToAppsWorkspaceTransaction *)v3 isGoingToLauncher])
  {
    long long v41 = [v40 transientOverlayPresentationManager];
    char v42 = [v41 hasActivePresentation];

    if ((v42 & 1) == 0)
    {
      if (!v3->_gestureInitiated)
      {
        uint64_t v43 = +[SBWallpaperController sharedInstance];
        [v43 activateOrientationSource:2];
      }
      uint64_t v44 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v44 postNotificationName:*MEMORY[0x1E4FA7A58] object:v3 userInfo:0];
    }
  }
}

void __69__SBToAppsWorkspaceTransaction_transactionWillBeginLayoutTransition___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 application];
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v4 = [v6 info];
  [v4 minimumBrightnessLevel];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = fmax(v3, v5);
}

id __76__SBToAppsWorkspaceTransaction_transaction_performTransitionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F62A60];
  double v3 = [a2 sceneHandle];
  uint64_t v4 = [v3 sceneIdentifier];
  float v5 = [v2 identityForIdentifier:v4];

  return v5;
}

uint64_t __44__SBToAppsWorkspaceTransaction__didComplete__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 application];
  double v3 = [v2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:@"com.apple.purplebuddy"];

  return v4;
}

void __56__SBToAppsWorkspaceTransaction__captureApplicationState__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  double v3 = [v6 application];
  uint64_t v4 = [v3 processState];
  int v5 = [v4 isRunning];

  if (v5) {
    ++*(void *)(*(void *)(a1 + 32) + 272);
  }
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 264) && [v6 BOOLForActivationSetting:60]) {
    *(unsigned char *)(*(void *)(a1 + 32) + 264) = 1;
  }
}

SBSceneLayoutWorkspaceTransaction *__58__SBToAppsWorkspaceTransaction_initWithTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[SBSceneLayoutWorkspaceTransaction alloc] initWithTransitionRequest:v3 delegate:*(void *)(a1 + 32)];

  [(SBSceneLayoutWorkspaceTransaction *)v4 setSynchronizationDelegate:*(void *)(a1 + 32)];
  return v4;
}

- (BOOL)shouldPerformToAppStateCleanupOnCompletion
{
  id v3 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
  if ([v3 count]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(SBToAppsWorkspaceTransaction *)self isGoingToLauncher];
  }

  return v4;
}

- (BOOL)shouldPlaceOutgoingScenesUnderLockOnCompletion
{
  return 0;
}

- (BOOL)shouldAnimateOrientationChangeOnCompletion
{
  return 1;
}

- (BOOL)toAndFromAppsDiffer
{
  return self->_toAndFromApplicationsDiffer;
}

- (void)_acquireResignActiveAssertion
{
  resignActiveAssertion = self->_resignActiveAssertion;
  if (!resignActiveAssertion)
  {
    BOOL v4 = +[SBSceneManagerCoordinator sharedInstance];
    int v5 = [v4 sceneDeactivationManager];
    id v6 = (UIApplicationSceneDeactivationAssertion *)[v5 newAssertionWithReason:5];
    uint64_t v7 = self->_resignActiveAssertion;
    self->_resignActiveAssertion = v6;

    resignActiveAssertion = self->_resignActiveAssertion;
  }
  id v9 = [(SBWorkspaceTransaction *)self transitionRequest];
  long long v8 = [v9 displayIdentity];
  [(UIApplicationSceneDeactivationAssertion *)resignActiveAssertion sb_acquireForDisplayIdentity:v8];
}

- (void)_delayTransitionCompletionForRequester:(id)a3
{
  id v4 = a3;
  completionDelayRequesters = self->_completionDelayRequesters;
  id v8 = v4;
  if (!completionDelayRequesters)
  {
    id v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    uint64_t v7 = self->_completionDelayRequesters;
    self->_completionDelayRequesters = v6;

    id v4 = v8;
    completionDelayRequesters = self->_completionDelayRequesters;
  }
  [(NSCountedSet *)completionDelayRequesters addObject:v4];
}

- (void)_stopDelayingTransitionCompletionForRequester:(id)a3
{
  [(NSCountedSet *)self->_completionDelayRequesters removeObject:a3];
  if (![(NSCountedSet *)self->_completionDelayRequesters count])
  {
    completionDelayRequesters = self->_completionDelayRequesters;
    self->_completionDelayRequesters = 0;

    [(SBToAppsWorkspaceTransaction *)self _completeCurrentTransition];
  }
}

- (BOOL)_transitionWasCancelled
{
  return 0;
}

- (unint64_t)_concurrentOverlayDismissalOptions
{
  return 0;
}

- (unint64_t)_serialOverlayPreDismissalOptions
{
  return -1;
}

- (BOOL)_shouldSerialDismissOverlays
{
  return self->_shouldSerialDismissOverlays;
}

- (void)_setShouldSerialDismissOverlays:(BOOL)a3
{
  self->_shouldSerialDismissOverlays = a3;
}

- (id)_setupAnimation
{
  return 0;
}

- (BOOL)_hasPreAnimationTasks
{
  return 0;
}

- (BOOL)_hasPostAnimationTasks
{
  return 0;
}

uint64_t __47__SBToAppsWorkspaceTransaction__beginAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) satisfyMilestone:@"SBWaitingForPreAnimationTasksMilestone"];
}

uint64_t __47__SBToAppsWorkspaceTransaction__beginAnimation__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _beginAnimationIfNecessary];
  v2 = *(void **)(a1 + 32);
  return [v2 _checkForAnimationCompletion];
}

uint64_t __54__SBToAppsWorkspaceTransaction__noteAnimationFinished__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) satisfyMilestone:@"SBWaitingForPostAnimationTasksMilestone"];
}

void __56__SBToAppsWorkspaceTransaction__captureApplicationState__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__SBToAppsWorkspaceTransaction__captureApplicationState__block_invoke_3;
  v9[3] = &unk_1E6B09FD0;
  id v7 = v5;
  id v10 = v7;
  id v8 = [v6 objectsPassingTest:v9];
  if (![v8 count])
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 280) = 1;
    *a3 = 1;
  }
}

uint64_t __56__SBToAppsWorkspaceTransaction__captureApplicationState__block_invoke_3(uint64_t a1, void *a2)
{
  return SBWorkspaceEntitiesAreAnalagous(*(void **)(a1 + 32), a2);
}

void __77__SBToAppsWorkspaceTransaction_canInterruptTransaction_forTransitionRequest___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (BOOL)_canBeInterrupted
{
  v2 = +[SBSetupManager sharedInstance];
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

void __44__SBToAppsWorkspaceTransaction__didComplete__block_invoke_2()
{
  id v0 = +[SBSetupManager sharedInstance];
  [v0 postLaunchCompleteNotificationForSetup];
}

- (void)_willFailWithReason:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBToAppsWorkspaceTransaction;
  id v4 = a3;
  [(SBToAppsWorkspaceTransaction *)&v5 _willFailWithReason:v4];
  -[SBAppRepairTransaction failWithReason:](self->_appRepairTransaction, "failWithReason:", v4, v5.receiver, v5.super_class);
}

- (void)_willInterruptWithReason:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBToAppsWorkspaceTransaction;
  id v4 = a3;
  [(SBToAppsWorkspaceTransaction *)&v5 _willInterruptWithReason:v4];
  -[SBAppRepairTransaction failWithReason:](self->_appRepairTransaction, "failWithReason:", v4, v5.receiver, v5.super_class);

  [(SBToAppsWorkspaceTransaction *)self _delayTransitionCompletionForRequester:@"SBDelayForInterruptionReason"];
}

- (BOOL)_shouldFailForChildTransaction:(id)a3
{
  if (self->_appRepairTransaction == a3) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBToAppsWorkspaceTransaction;
  return -[SBToAppsWorkspaceTransaction _shouldFailForChildTransaction:](&v4, sel__shouldFailForChildTransaction_);
}

- (void)_didInterruptWithReason:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBToAppsWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v4 _didInterruptWithReason:a3];
  [(SBToAppsWorkspaceTransaction *)self _fireAndClearResultBlockIfNecessaryForFailure:1];
  [(SBToAppsWorkspaceTransaction *)self _stopDelayingTransitionCompletionForRequester:@"SBDelayForInterruptionReason"];
}

- (id)_customizedDescriptionProperties
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)SBToAppsWorkspaceTransaction;
  id v3 = [(SBWorkspaceTransaction *)&v29 _customizedDescriptionProperties];
  if (!v3)
  {
    id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  objc_super v4 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          __n128 v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) succinctDescription];
          [(__CFString *)v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = @"(SpringBoard)";
  }
  [v3 setObject:v6 forKey:@"To Application Scene Entities"];
  int v13 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = [(SBToAppsWorkspaceTransaction *)self fromApplicationSceneEntities];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [*(id *)(*((void *)&v21 + 1) + 8 * j) succinctDescription];
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v16);
  }

  if ([v13 count]) {
    [v3 setObject:v13 forKey:@"From Application Scene Entities"];
  }

  return v3;
}

- (id)createSceneEntityForHandle:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v4 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:v3];
  }
  else {
    objc_super v4 = 0;
  }

  return v4;
}

uint64_t __76__SBToAppsWorkspaceTransaction_transaction_performTransitionWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleApplicationDidNotChange:a2];
}

- (BOOL)transaction:(id)a3 shouldKeepSceneForeground:(id)a4 withReason:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = [(SBWorkspaceTransaction *)self transitionRequest];
  uint64_t v9 = [v8 applicationContext];
  uint64_t v10 = [v9 layoutState];
  long long v11 = [v10 elements];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __81__SBToAppsWorkspaceTransaction_transaction_shouldKeepSceneForeground_withReason___block_invoke;
  long long v20 = &unk_1E6AF8260;
  id v12 = v7;
  id v21 = v12;
  int v13 = objc_msgSend(v11, "bs_containsObjectPassingTest:", &v17);
  if (v13)
  {
    id v14 = NSString;
    uint64_t v15 = [v12 identifier];
    *a5 = [v14 stringWithFormat:@"Keeping %@ foreground because it's part of the transition request", v15, v17, v18, v19, v20];
  }
  return v13;
}

uint64_t __81__SBToAppsWorkspaceTransaction_transaction_shouldKeepSceneForeground_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  objc_super v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (BOOL)shouldWatchdog:(id *)a3
{
  if (!self->_appRepairTransaction)
  {
    id v6 = &v15;
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__91;
    uint64_t v19 = __Block_byref_object_dispose__91;
    id v20 = 0;
    id v7 = [(SBToAppsWorkspaceTransaction *)self toApplicationSceneEntities];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__SBToAppsWorkspaceTransaction_shouldWatchdog___block_invoke;
    v14[3] = &unk_1E6AF5B90;
    v14[4] = &v15;
    [v7 enumerateObjectsUsingBlock:v14];

    v13.receiver = self;
    v13.super_class = (Class)SBToAppsWorkspaceTransaction;
    if ([(SBToAppsWorkspaceTransaction *)&v13 shouldWatchdog:a3])
    {
      BOOL v4 = v16[5] == 0;
      if (!a3) {
        goto LABEL_15;
      }
    }
    else
    {
      BOOL v4 = 0;
      if (!a3)
      {
LABEL_15:
        _Block_object_dispose(&v15, 8);

        return v4;
      }
    }
    if (!v4)
    {
      uint64_t v8 = (void *)v16[5];
      if (v8)
      {
        uint64_t v9 = NSString;
        uint64_t v10 = [v8 uniqueIdentifier];
        long long v11 = v10;
        if (!v10)
        {
          id v6 = [MEMORY[0x1E4F28F80] processInfo];
          long long v11 = [v6 processName];
        }
        *a3 = [v9 stringWithFormat:@"\"%@\" is being debugged", v11];
        if (!v10)
        {
        }
      }
    }
    goto LABEL_15;
  }
  BOOL v4 = 0;
  if (a3) {
    *a3 = @"performing app repair";
  }
  return v4;
}

void __47__SBToAppsWorkspaceTransaction_shouldWatchdog___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v8 = v4;
    uint64_t v5 = [v4 application];
    id v6 = [v5 processState];
    int v7 = [v6 isBeingDebugged];

    id v4 = v8;
    if (v7)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      id v4 = v8;
    }
  }
}

- (void)animationControllerDidRevealApplication:(id)a3
{
  if (self->_animationController == a3) {
    [(SBToAppsWorkspaceTransaction *)self _animationDidRevealApplication];
  }
}

@end