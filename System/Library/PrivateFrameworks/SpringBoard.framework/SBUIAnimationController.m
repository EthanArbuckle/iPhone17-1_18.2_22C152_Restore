@interface SBUIAnimationController
+ (BOOL)isPendingAlertItemsWithReason:(id)a3;
+ (void)_addAlertItemsPendingReason:(id)a3;
+ (void)_removeAlertItemsPendingReason:(id)a3;
- (BOOL)__animationShouldStart;
- (BOOL)__wantsInitialProgressStateChange;
- (BOOL)_canBeInterrupted;
- (BOOL)_isNullAnimation;
- (BOOL)_shouldDismissBanner;
- (BOOL)_waitsForActivatingSceneContentAvailableIfNecessary;
- (BOOL)_willAnimate;
- (BOOL)animating;
- (BOOL)isFinishedAnimating;
- (BOOL)isFluidSwitcherAnimationController;
- (BOOL)isInteractive;
- (BOOL)isReasonableMomentToInterrupt;
- (BOOL)isStepped;
- (BOOL)needsCATransactionActivate;
- (BOOL)shouldResignActiveForAnimation;
- (BOOL)transitionSupportsCancelling;
- (BOOL)transitionSupportsRestarting;
- (BOOL)transitionWasCancelled;
- (BOOL)transitionWasRestarted;
- (BOOL)waitingToStart;
- (BSAnimationSettings)animationSettings;
- (BSTransaction)animationTransaction;
- (BSTransaction)cleanupTransaction;
- (BSTransaction)notifyObserversTransaction;
- (NSSet)fromApplicationSceneEntities;
- (NSSet)toApplicationSceneEntities;
- (SBApplicationSceneEntity)fromApplicationSceneEntity;
- (SBApplicationSceneEntity)toApplicationSceneEntity;
- (SBUIAnimationController)init;
- (SBUIAnimationController)initWithTransitionContextProvider:(id)a3;
- (SBUIAnimationControllerTransitionContextProvider)transitionContextProvider;
- (SBViewControllerTransitionContext)transition;
- (UIView)containerView;
- (double)stepPercentage;
- (id)__alertItemsController;
- (id)__startTransactionDependencyForEntity:(id)a3;
- (id)_animationIdentifier;
- (id)_getTransitionWindow;
- (id)_progressDependencies;
- (id)_transitionAnimator;
- (id)_viewsForAnimationStepping;
- (id)animationTransactionCompletion;
- (id)coordinatingAnimationControllers;
- (int)_animationState;
- (void)__abortAnimation;
- (void)__cleanupAnimation;
- (void)__noteAnimationDidTerminate;
- (void)__reportAnimationCompletion;
- (void)__startAnimation;
- (void)_addDebugLogCategory:(id)a3;
- (void)_begin;
- (void)_cleanupEntityObservers;
- (void)_didInterruptWithReason:(id)a3;
- (void)_entityObserverProgressDidChange:(id)a3 waitForSceneContentAvailableTransactionBlock:(id)a4;
- (void)_enumerateCoordinatingAnimationsWithBlock:(id)a3;
- (void)_enumerateCoordinatingAnimationsWithSchedulingPolicy:(unint64_t)a3 block:(id)a4;
- (void)_enumerateCoordinatingChildRelationshipsWithBlock:(id)a3;
- (void)_noteAnimationDidFail;
- (void)_noteAnimationDidFinish;
- (void)_noteAnimationDidRevealApplication;
- (void)_notifyObserversOfAnimationCompletion;
- (void)_processStateDidChange:(id)a3;
- (void)_registerEntityObserversIfNecessary;
- (void)_setAnimationState:(int)a3;
- (void)_setHidden:(BOOL)a3;
- (void)_startAnimation;
- (void)_willComplete;
- (void)addCoordinatingChildTransaction:(id)a3 withSchedulingPolicy:(unint64_t)a4;
- (void)addObserver:(id)a3;
- (void)addSteppedCoordinatingChildAnimation:(id)a3;
- (void)cancelTransition;
- (void)dealloc;
- (void)delayAnimationUntilTransactionFinishes:(id)a3;
- (void)delayCleanupUntilTransactionFinishes:(id)a3;
- (void)enableSteppingWithAnimationSettings:(id)a3;
- (void)finishSteppingBackwardToStart;
- (void)finishSteppingForwardToEnd;
- (void)removeObserver:(id)a3;
- (void)restartTransition;
- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4;
- (void)setAnimationTransactionCompletion:(id)a3;
- (void)setNeedsCATransactionActivate:(BOOL)a3;
- (void)setStepPercentage:(double)a3;
- (void)setTransition:(id)a3;
- (void)setTransitionContextProvider:(id)a3;
- (void)startInteractiveTransition:(id)a3;
- (void)stopDelayingAnimationForTransaction:(id)a3;
- (void)stopDelayingCleanupForTransaction:(id)a3;
- (void)transitionDidFinish:(id)a3;
@end

@implementation SBUIAnimationController

- (void)addObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIAnimationController;
  [(SBUIAnimationController *)&v3 addObserver:a3];
}

- (void)addCoordinatingChildTransaction:(id)a3 withSchedulingPolicy:(unint64_t)a4
{
  id v12 = a3;
  if ([(SBUIAnimationController *)self hasStarted])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBUIAnimationController.m" lineNumber:293 description:@"Cannot add a coordinating child transaction to an animation controller that's already been started."];
  }
  v7 = v12;
  if (v12)
  {
    if ([v12 hasStarted])
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"SBUIAnimationController.m" lineNumber:297 description:@"Cannot add a coordinating child transaction that's already been started."];
    }
    coordinatingChildRelationships = self->_coordinatingChildRelationships;
    v9 = [[_SBUIAnimationControllerCoordinatingChildRelationship alloc] initWithCoordinatingChildTransaction:v12 schedulingPolicy:a4];
    [(NSMutableArray *)coordinatingChildRelationships addObject:v9];

    v7 = v12;
  }
}

void __33__SBUIAnimationController__begin__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 animationController:*(void *)(a1 + 32) willBeginAnimation:*(unsigned __int8 *)(a1 + 40)];
  }
}

void __61__SBUIAnimationController_initWithTransitionContextProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "__reportAnimationCompletion");
  v4[2](v4, 1);
}

- (void)_notifyObserversOfAnimationCompletion
{
  if ((self->_animationState - 5) <= 0xFFFFFFFD)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = [NSString stringWithFormat:@"(%@ or %@)", @"finished", @"cleanedUp"];
    v6 = _SBUIAnimationStateDescription(self->_animationState);
    [v4 handleFailureInMethod:a2, self, @"SBUIAnimationController.m", 741, @" %s : unexpected animation state : expected=%@ actual=%@", "-[SBUIAnimationController _notifyObserversOfAnimationCompletion]", v5, v6 object file lineNumber description];
  }
  if (!self->_didNotifyObserversOfCompletion)
  {
    self->_didNotifyObserversOfCompletion = 1;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__SBUIAnimationController__notifyObserversOfAnimationCompletion__block_invoke;
    v7[3] = &unk_1E6AF4C80;
    v7[4] = self;
    [(SBUIAnimationController *)self _enumerateObserversWithBlock:v7];
  }
}

- (void)__reportAnimationCompletion
{
  if (self->_animationState != 2)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = _SBUIAnimationStateDescription(self->_animationState);
    [v4 handleFailureInMethod:a2, self, @"SBUIAnimationController.m", 805, @" %s : unexpected animation state : expected=%@ actual=%@", "-[SBUIAnimationController __reportAnimationCompletion]", @"running", v5 object file lineNumber description];
  }
  self->_animationState = 3;
  [(SBUIAnimationController *)self _notifyObserversOfAnimationCompletion];
}

void __61__SBUIAnimationController_initWithTransitionContextProvider___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "__cleanupAnimation");
  v4[2](v4, 1);
}

- (void)transitionDidFinish:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBUIAnimationController *)self transition];

  if (v5 == v4)
  {
    if ([v4 transitionWasCancelled])
    {
      v6 = [MEMORY[0x1E4F1CA48] array];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __47__SBUIAnimationController_transitionDidFinish___block_invoke;
      v31[3] = &unk_1E6B01E88;
      id v7 = v6;
      id v32 = v7;
      [(SBUIAnimationController *)self _enumerateCoordinatingChildRelationshipsWithBlock:v31];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      obuint64_t j = v7;
      uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
      if (v20)
      {
        uint64_t v19 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            v22 = [v21 coordinatingChildTransaction];
            v9 = [v22 coordinatingAnimationControllers];
            long long v23 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v33 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v24;
              do
              {
                for (uint64_t j = 0; j != v11; ++j)
                {
                  if (*(void *)v24 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  v14 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                  v15 = [v14 notifyObserversTransaction];
                  [v15 removeChildTransaction:self->_notifyObserversTransaction];

                  cleanupTransaction = self->_cleanupTransaction;
                  v17 = [v14 cleanupTransaction];
                  [(BSBlockTransaction *)cleanupTransaction removeChildTransaction:v17];
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v33 count:16];
              }
              while (v11);
            }
            [(BSBlockTransaction *)self->_animationTransaction removeChildTransaction:v22];
            [(NSMutableArray *)self->_coordinatingChildRelationships removeObject:v21];
          }
          uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
        }
        while (v20);
      }
    }
    [(SBUIAnimationController *)self __noteAnimationDidTerminate];
  }
}

- (void)__noteAnimationDidTerminate
{
  int animationState = self->_animationState;
  if ((animationState - 1) >= 2)
  {
    if ((animationState - 3) < 2) {
      return;
    }
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithFormat:@"(%@ or %@)", @"waiting", @"running"];
    id v7 = _SBUIAnimationStateDescription(self->_animationState);
    [v5 handleFailureInMethod:a2, self, @"SBUIAnimationController.m", 790, @" %s : unexpected animation state : expected=%@ actual=%@", "-[SBUIAnimationController __noteAnimationDidTerminate]", v6, v7 object file lineNumber description];
  }
  v8 = [(SBUIAnimationController *)self animationTransactionCompletion];
  if (v8)
  {
    [(SBUIAnimationController *)self setAnimationTransactionCompletion:0];
    v8[2](v8, 1);
  }
  else if (([(BSBlockTransaction *)self->_animationTransaction hasStarted] & 1) == 0)
  {
    [(SBUIAnimationController *)self failWithReason:@"Animation completed before it started"];
  }
}

void __61__SBUIAnimationController_initWithTransitionContextProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _animationState] == 1)
  {
    if (objc_msgSend(WeakRetained, "__animationShouldStart"))
    {
      [WeakRetained setAnimationTransactionCompletion:v6];
      [WeakRetained _prepareAnimation];
      objc_msgSend(WeakRetained, "__startAnimation");
      goto LABEL_7;
    }
    id v5 = (void (*)(void))v6[2];
  }
  else
  {
    id v5 = (void (*)(void))v6[2];
  }
  v5();
LABEL_7:
}

- (void)setAnimationTransactionCompletion:(id)a3
{
}

- (int)_animationState
{
  return self->_animationState;
}

- (BOOL)__animationShouldStart
{
  return self->_animationState == 1;
}

- (id)animationTransactionCompletion
{
  return self->_animationTransactionCompletion;
}

- (void)_noteAnimationDidFinish
{
  id v3 = SBLogWorkspace();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "[SBUIAnimationController] noteAnimationDidFinish: Animation succeeded.", v5, 2u);
  }

  id v4 = [(SBUIAnimationController *)self transition];
  if ([v4 isTransitioning]) {
    [v4 completeTransition:1];
  }
  else {
    [(SBUIAnimationController *)self __noteAnimationDidTerminate];
  }
}

- (void)__startAnimation
{
  if (self->_animationState != 1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = _SBUIAnimationStateDescription(self->_animationState);
    [v5 handleFailureInMethod:a2, self, @"SBUIAnimationController.m", 358, @" %s : unexpected animation state : expected=%@ actual=%@", "-[SBUIAnimationController __startAnimation]", @"waiting", v6 object file lineNumber description];
  }
  [(SBUIAnimationController *)self _setAnimationState:2];
  id v7 = [(SBUIAnimationController *)self transition];
  id v3 = [(SBUIAnimationController *)self _transitionAnimator];
  [v7 setAnimator:v3];

  if ([(SBUIAnimationController *)self isStepped]) {
    [v7 setInteractor:self];
  }
  [v7 startTransition];
}

- (SBViewControllerTransitionContext)transition
{
  return self->_transition;
}

- (BOOL)isStepped
{
  return self->_stepper != 0;
}

- (id)_transitionAnimator
{
  if (self->_stepper) {
    v2 = [[SBUIAnimationControllerSteppedAnimator alloc] initWithAnimationController:self stepper:self->_stepper];
  }
  else {
    v2 = [[SBUIAnimationControllerAnimator alloc] initWithAnimationController:self];
  }
  return v2;
}

- (void)__cleanupAnimation
{
  int animationState = self->_animationState;
  if ((animationState - 5) <= 0xFFFFFFFD)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = [NSString stringWithFormat:@"(%@ or %@)", @"finished", @"cleanedUp"];
    v13 = _SBUIAnimationStateDescription(self->_animationState);
    [v11 handleFailureInMethod:a2, self, @"SBUIAnimationController.m", 815, @" %s : unexpected animation state : expected=%@ actual=%@", "-[SBUIAnimationController __cleanupAnimation]", v12, v13 object file lineNumber description];

    int animationState = self->_animationState;
  }
  if (animationState == 3)
  {
    id v4 = [(SBUIAnimationController *)self transition];
    int v5 = [v4 isTransitioning];

    if (v5) {
      [(SBUIAnimationController *)self _noteAnimationDidFail];
    }
    [(SBUIAnimationController *)self _setHidden:1];
    [(UIView *)self->_transitionContainer removeFromSuperview];
    [(SBAnimationStepper *)self->_stepper invalidate];
    [(SBUIAnimationController *)self _cleanupAnimation];
    [(SBUIAnimationController *)self _cleanupEntityObservers];
    v6 = [(SBUIAnimationController *)self __alertItemsController];
    id v7 = [(SBUIAnimationController *)self _animationIdentifier];
    [v6 setForceAlertsToPend:0 forReason:v7];

    v8 = objc_opt_class();
    v9 = [(SBUIAnimationController *)self _animationIdentifier];
    [v8 _removeAlertItemsPendingReason:v9];

    [MEMORY[0x1E4F42D58] _synchronizeDrawing];
    self->_int animationState = 4;
  }
}

- (void)_begin
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  if (self->_animationState)
  {
    v65 = [MEMORY[0x1E4F28B00] currentHandler];
    v66 = _SBUIAnimationStateDescription(self->_animationState);
    [v65 handleFailureInMethod:a2, self, @"SBUIAnimationController.m", 458, @" %s : unexpected animation state : expected=%@ actual=%@", "-[SBUIAnimationController _begin]", @"none", v66 object file lineNumber description];
  }
  id v3 = [(SBUIAnimationController *)self _getTransitionWindow];
  transitionWindow = self->_transitionWindow;
  self->_transitionWindow = v3;

  id v5 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(UIWindow *)self->_transitionWindow bounds];
  v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
  transitionContainer = self->_transitionContainer;
  self->_transitionContainer = v6;

  [(UIView *)self->_transitionContainer setUserInteractionEnabled:0];
  [(UIView *)self->_transitionContainer setHidden:1];
  v8 = [(UIWindow *)self->_transitionWindow rootViewController];
  v9 = self->_transitionWindow;
  if (v8)
  {
    uint64_t v10 = [(UIWindow *)v9 rootViewController];
    uint64_t v11 = [v10 view];
  }
  else
  {
    uint64_t v11 = v9;
  }

  [(UIWindow *)v11 addSubview:self->_transitionContainer];
  BOOL v12 = [(SBUIAnimationController *)self _willAnimate];
  BOOL v13 = v12;
  if (v12)
  {
    v14 = [(SBUIAnimationController *)self __alertItemsController];
    v15 = [(SBUIAnimationController *)self _animationIdentifier];
    [v14 setForceAlertsToPend:1 forReason:v15];

    v16 = objc_opt_class();
    v17 = [(SBUIAnimationController *)self _animationIdentifier];
    [v16 _addAlertItemsPendingReason:v17];
  }
  v18 = SBLogWorkspace();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = NSStringFromBOOL();
    *(_DWORD *)buf = 138543362;
    v103 = v19;
    _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, "[SBUIAnimationController] begin: willAnimate: %{public}@", buf, 0xCu);
  }
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __33__SBUIAnimationController__begin__block_invoke;
  v95[3] = &unk_1E6B01E60;
  v95[4] = self;
  BOOL v96 = v13;
  [(SBUIAnimationController *)self _enumerateObserversWithBlock:v95];
  [MEMORY[0x1E4F39CF8] activate];
  v69 = v11;
  if (self->_stepper)
  {
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    uint64_t v20 = [(SBUIAnimationController *)self _viewsForAnimationStepping];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v91 objects:v101 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v92 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v91 + 1) + 8 * i);
          [(SBAnimationStepper *)self->_stepper startSteppingAnimationsInView:v25];
          if ([(SBUIAnimationController *)self isAuditHistoryEnabled])
          {
            long long v26 = [MEMORY[0x1E4F4F718] descriptionForObject:v25];
            [(SBUIAnimationController *)self _addAuditHistoryItem:@"Stepping animations in view: %@", v26];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v91 objects:v101 count:16];
      }
      while (v22);
    }
  }
  [(SBUIAnimationController *)self _setHidden:0];
  [MEMORY[0x1E4F42D58] _synchronizeDrawing];
  [(SBUIAnimationController *)self _willSetupStartDependencies];
  long long v27 = [MEMORY[0x1E4F1CA80] set];
  long long v28 = [(SBUIAnimationController *)self _progressDependencies];
  if (v28) {
    [v27 unionSet:v28];
  }
  v68 = [(SBUIAnimationController *)self toApplicationSceneEntities];
  long long v29 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
  v67 = v28;
  if ([v68 count]
    && [(SBUIAnimationController *)self _waitsForActivatingSceneContentAvailableIfNecessary])
  {
    v72 = [MEMORY[0x1E4F1CA80] set];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    obuint64_t j = v68;
    uint64_t v30 = [obj countByEnumeratingWithState:&v87 objects:v100 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v88 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void *)(*((void *)&v87 + 1) + 8 * j);
          uint64_t v35 = [(SBUIAnimationController *)self __startTransactionDependencyForEntity:v34];
          if (v35)
          {
            v36 = v27;
            [v27 addObject:v34];
            long long v85 = 0u;
            long long v86 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            v37 = [(SBUIAnimationController *)self _debugLogCategories];
            uint64_t v38 = [v37 countByEnumeratingWithState:&v83 objects:v99 count:16];
            if (v38)
            {
              uint64_t v39 = v38;
              uint64_t v40 = *(void *)v84;
              do
              {
                for (uint64_t k = 0; k != v39; ++k)
                {
                  if (*(void *)v84 != v40) {
                    objc_enumerationMutation(v37);
                  }
                  [v35 _addDebugLogCategory:*(void *)(*((void *)&v83 + 1) + 8 * k)];
                }
                uint64_t v39 = [v37 countByEnumeratingWithState:&v83 objects:v99 count:16];
              }
              while (v39);
            }

            [(NSSet *)v72 addObject:v35];
            long long v27 = v36;
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v87 objects:v100 count:16];
      }
      while (v31);
    }

    long long v29 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
    startTransactionDependencies = self->_startTransactionDependencies;
    self->_startTransactionDependencies = v72;

    uint64_t v11 = v69;
    long long v28 = v67;
  }
  objc_storeStrong((id *)&self->_entitiesToObserve, v27);
  if ([(NSSet *)self->_entitiesToObserve count]
    && [(SBUIAnimationController *)self __wantsInitialProgressStateChange])
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v80 = 0u;
    long long v79 = 0u;
    v43 = self->_entitiesToObserve;
    uint64_t v44 = [(NSSet *)v43 countByEnumeratingWithState:&v79 objects:v98 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v80;
      do
      {
        for (uint64_t m = 0; m != v45; ++m)
        {
          if (*(void *)v80 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = *(void **)(*((void *)&v79 + 1) + 8 * m);
          v49 = [v48 application];
          v50 = [v49 processState];
          [(SBUIAnimationController *)self _application:v49 processStateDidChange:v50];

          v51 = [v48 sceneHandle];
          v52 = [v51 sceneIfExists];
          v53 = v52;
          if (v52) {
            uint64_t v54 = [v52 contentState];
          }
          else {
            uint64_t v54 = 0;
          }
          [(SBUIAnimationController *)self _sceneHandle:v51 didUpdateContentState:v54];
        }
        uint64_t v45 = [(NSSet *)v43 countByEnumeratingWithState:&v79 objects:v98 count:16];
      }
      while (v45);
    }

    uint64_t v11 = v69;
    long long v28 = v67;
    long long v29 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
  }
  [(SBUIAnimationController *)self _willBeginWaitingForStartDependencies];
  [(SBUIAnimationController *)self _setAnimationState:1];
  uint64_t v55 = v29[809];
  if ([*(id *)((char *)&self->super.super.super.isa + v55) count])
  {
    id obja = v27;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v56 = *(id *)((char *)&self->super.super.super.isa + v55);
    uint64_t v57 = [v56 countByEnumeratingWithState:&v75 objects:v97 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v76;
      do
      {
        for (uint64_t n = 0; n != v58; ++n)
        {
          if (*(void *)v76 != v59) {
            objc_enumerationMutation(v56);
          }
          v61 = *(void **)(*((void *)&v75 + 1) + 8 * n);
          v62 = SBLogWorkspace();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            v63 = [v61 _descriptionProem];
            *(_DWORD *)buf = 138543362;
            v103 = v63;
            _os_log_impl(&dword_1D85BA000, v62, OS_LOG_TYPE_INFO, "Monitoring animation start dependency: %{public}@", buf, 0xCu);
          }
          [v61 addChildTransaction:self->_animationTransaction withSchedulingPolicy:1];
          [(SBUIAnimationController *)self addChildTransaction:v61 withSchedulingPolicy:0];
        }
        uint64_t v58 = [v56 countByEnumeratingWithState:&v75 objects:v97 count:16];
      }
      while (v58);
    }

    uint64_t v11 = v69;
    long long v27 = obja;
    long long v28 = v67;
  }
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __33__SBUIAnimationController__begin__block_invoke_104;
  v74[3] = &unk_1E6B01E88;
  v74[4] = self;
  [(SBUIAnimationController *)self _enumerateCoordinatingChildRelationshipsWithBlock:v74];
  [(SBUIAnimationController *)self _registerEntityObserversIfNecessary];
  v73.receiver = self;
  v73.super_class = (Class)SBUIAnimationController;
  [(SBUIAnimationController *)&v73 _begin];
}

- (id)_animationIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)_setAnimationState:(int)a3
{
  self->_int animationState = a3;
}

- (void)_setHidden:(BOOL)a3
{
}

- (id)__alertItemsController
{
  return +[SBAlertItemsController sharedInstance];
}

- (NSSet)toApplicationSceneEntities
{
  return (NSSet *)[(SBUIAnimationControllerTransitionContextProvider *)self->_transitionContextProvider toApplicationSceneEntities];
}

- (BOOL)_willAnimate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  char v9 = ![(SBUIAnimationController *)self _isNullAnimation];
  if (*((unsigned char *)v7 + 24))
  {
    BOOL v3 = 1;
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__SBUIAnimationController__willAnimate__block_invoke;
    v5[3] = &unk_1E6AF4C30;
    v5[4] = &v6;
    [(SBUIAnimationController *)self _enumerateCoordinatingAnimationsWithBlock:v5];
    BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_registerEntityObserversIfNecessary
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(NSSet *)self->_entitiesToObserve count] && self->_animationState != 3)
  {
    v14 = [MEMORY[0x1E4F1CA80] set];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    obuint64_t j = self->_entitiesToObserve;
    uint64_t v3 = [(NSSet *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v16;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v16 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
          uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
          char v9 = [v7 application];
          [v8 addObserver:self selector:sel__processStateDidChange_ name:@"SBApplicationProcessStateDidChange" object:v9];

          uint64_t v10 = [v7 sceneHandle];
          uint64_t v11 = v10;
          if (v10)
          {
            [v10 addObserver:self];
            [(NSSet *)v14 addObject:v11];
          }

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [(NSSet *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v4);
    }

    sceneHandlesBeingObserved = self->_sceneHandlesBeingObserved;
    self->_sceneHandlesBeingObserved = v14;
  }
}

- (id)_progressDependencies
{
  return 0;
}

- (BOOL)_isNullAnimation
{
  uint64_t v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (id)_getTransitionWindow
{
  return 0;
}

- (void)_enumerateCoordinatingChildRelationshipsWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void, char *))a3;
  if (v4)
  {
    char v14 = 0;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = self->_coordinatingChildRelationships;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
        if (v14) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

+ (void)_addAlertItemsPendingReason:(id)a3
{
  uint64_t v3 = _addAlertItemsPendingReason__onceToken;
  id v4 = a3;
  id v6 = v4;
  if (v3 == -1)
  {
    id v5 = v4;
  }
  else
  {
    dispatch_once(&_addAlertItemsPendingReason__onceToken, &__block_literal_global_87_0);
    id v5 = v6;
  }
  [(id)__animationControllerPendingAlertItemsReasons addObject:v5];
}

- (void)dealloc
{
  if ((self->_animationState & 0xFFFFFFFB) != 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithFormat:@"(%@ or %@)", @"none", @"cleanedUp"];
    uint64_t v7 = _SBUIAnimationStateDescription(self->_animationState);
    [v5 handleFailureInMethod:a2, self, @"SBUIAnimationController.m", 179, @" %s : unexpected animation state : expected=%@ actual=%@", "-[SBUIAnimationController dealloc]", v6, v7 object file lineNumber description];
  }
  uint64_t v3 = SBLogWorkspace();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "[SBUIAnimationController] dealloc", buf, 2u);
  }

  [(SBUIAnimationController *)self _cleanupEntityObservers];
  [(UIView *)self->_transitionContainer removeFromSuperview];
  v8.receiver = self;
  v8.super_class = (Class)SBUIAnimationController;
  [(SBUIAnimationController *)&v8 dealloc];
}

- (void)_cleanupEntityObservers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_sceneHandlesBeingObserved;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "removeObserver:", self, (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  objc_super v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:@"SBApplicationProcessStateDidChange" object:0];
}

+ (void)_removeAlertItemsPendingReason:(id)a3
{
}

void __33__SBUIAnimationController__begin__block_invoke_104(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 coordinatingChildTransaction];
  uint64_t v5 = [v4 coordinatingAnimationControllers];
  long long v27 = v3;
  uint64_t v6 = [v3 schedulingPolicy];
  uint64_t v7 = *(void **)(a1 + 32);
  objc_super v8 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
  if (v6 == 1)
  {
    uint64_t v7 = (void *)v7[20];
    long long v9 = v4;
    uint64_t v10 = 1;
  }
  else
  {
    long long v9 = v4;
    uint64_t v10 = 0;
  }
  objc_msgSend(v7, "addChildTransaction:withSchedulingPolicy:", v9, v10, v4);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v5;
  uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    uint64_t v14 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
    long long v15 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
    uint64_t v28 = a1;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (!v6)
        {
          long long v18 = *(void **)(*(void *)(a1 + 32) + v8[802]);
          [*(id *)(*((void *)&v30 + 1) + 8 * i) animationTransaction];
          uint64_t v19 = v15;
          uint64_t v20 = v14;
          v22 = uint64_t v21 = v8;
          [v18 addChildTransaction:v22 withSchedulingPolicy:0];

          objc_super v8 = v21;
          uint64_t v14 = v20;
          long long v15 = v19;
          uint64_t v6 = 0;
          a1 = v28;
        }
        uint64_t v23 = [v17 notifyObserversTransaction];
        [v23 addChildTransaction:*(void *)(*(void *)(a1 + 32) + v14[803]) withSchedulingPolicy:1];

        long long v24 = *(void **)(*(void *)(a1 + 32) + v15[804]);
        uint64_t v25 = [v17 cleanupTransaction];
        [v24 addChildTransaction:v25 withSchedulingPolicy:0];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v12);
  }
}

- (BSTransaction)notifyObserversTransaction
{
  return (BSTransaction *)self->_notifyObserversTransaction;
}

- (id)coordinatingAnimationControllers
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:self];
}

- (BSTransaction)cleanupTransaction
{
  return (BSTransaction *)self->_cleanupTransaction;
}

- (BSTransaction)animationTransaction
{
  return (BSTransaction *)self->_animationTransaction;
}

- (BOOL)_waitsForActivatingSceneContentAvailableIfNecessary
{
  return 0;
}

- (SBUIAnimationController)initWithTransitionContextProvider:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SBUIAnimationController;
  uint64_t v6 = [(SBTransaction *)&v33 init];
  if (v6)
  {
    uint64_t v7 = (SBViewControllerTransitionContext *)objc_alloc_init(MEMORY[0x1E4FA6480]);
    transitiouint64_t n = v6->_transition;
    v6->_transitiouint64_t n = v7;

    [(SBViewControllerTransitionContext *)v6->_transition setDelegate:v6];
    objc_storeStrong((id *)&v6->_transitionContextProvider, a3);
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    coordinatingChildRelationships = v6->_coordinatingChildRelationships;
    v6->_coordinatingChildRelationships = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    steppedCoordinatingChildAnimations = v6->_steppedCoordinatingChildAnimations;
    v6->_steppedCoordinatingChildAnimations = (NSMutableArray *)v11;

    objc_initWeak(&location, v6);
    id v13 = objc_alloc(MEMORY[0x1E4F4F6C0]);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __61__SBUIAnimationController_initWithTransitionContextProvider___block_invoke;
    v30[3] = &unk_1E6B01DC8;
    objc_copyWeak(&v31, &location);
    uint64_t v14 = [v13 initWithBlock:v30];
    animationTransactiouint64_t n = v6->_animationTransaction;
    v6->_animationTransactiouint64_t n = (BSBlockTransaction *)v14;

    [(BSBlockTransaction *)v6->_animationTransaction setDebugName:@"animation"];
    [(SBUIAnimationController *)v6 addChildTransaction:v6->_animationTransaction withSchedulingPolicy:0];
    id v16 = objc_alloc(MEMORY[0x1E4F4F6C0]);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __61__SBUIAnimationController_initWithTransitionContextProvider___block_invoke_2;
    v28[3] = &unk_1E6B01DC8;
    objc_copyWeak(&v29, &location);
    uint64_t v17 = [v16 initWithBlock:v28];
    notifyObserversTransactiouint64_t n = v6->_notifyObserversTransaction;
    v6->_notifyObserversTransactiouint64_t n = (BSBlockTransaction *)v17;

    [(BSBlockTransaction *)v6->_notifyObserversTransaction setDebugName:@"notify observers"];
    [(BSBlockTransaction *)v6->_animationTransaction addChildTransaction:v6->_notifyObserversTransaction withSchedulingPolicy:1];
    id v19 = objc_alloc(MEMORY[0x1E4F4F6C0]);
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __61__SBUIAnimationController_initWithTransitionContextProvider___block_invoke_3;
    long long v26 = &unk_1E6B01DC8;
    objc_copyWeak(&v27, &location);
    uint64_t v20 = [v19 initWithBlock:&v23];
    cleanupTransactiouint64_t n = v6->_cleanupTransaction;
    v6->_cleanupTransactiouint64_t n = (BSBlockTransaction *)v20;

    [(BSBlockTransaction *)v6->_cleanupTransaction setDebugName:@"clean up", v23, v24, v25, v26];
    [(SBUIAnimationController *)v6 addChildTransaction:v6->_cleanupTransaction withSchedulingPolicy:0];
    [(BSBlockTransaction *)v6->_notifyObserversTransaction addChildTransaction:v6->_cleanupTransaction withSchedulingPolicy:1];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)_addDebugLogCategory:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBUIAnimationController;
  [(SBUIAnimationController *)&v14 _addDebugLogCategory:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_startTransactionDependencies;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_addDebugLogCategory:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)delayCleanupUntilTransactionFinishes:(id)a3
{
}

- (void)stopDelayingCleanupForTransaction:(id)a3
{
}

- (void)removeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIAnimationController;
  [(SBUIAnimationController *)&v3 removeObserver:a3];
}

void __64__SBUIAnimationController__notifyObserversOfAnimationCompletion__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 animationControllerDidFinishAnimation:*(void *)(a1 + 32)];
  }
}

- (SBUIAnimationControllerTransitionContextProvider)transitionContextProvider
{
  return self->_transitionContextProvider;
}

- (BOOL)isInteractive
{
  uint64_t v2 = [(SBUIAnimationController *)self transition];
  char v3 = [v2 isInteractive];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationTransactionCompletion, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_transitionContainer, 0);
  objc_storeStrong((id *)&self->_transitionWindow, 0);
  objc_storeStrong((id *)&self->_stepper, 0);
  objc_storeStrong((id *)&self->_steppedCoordinatingChildAnimations, 0);
  objc_storeStrong((id *)&self->_coordinatingChildRelationships, 0);
  objc_storeStrong((id *)&self->_startTransactionDependencies, 0);
  objc_storeStrong((id *)&self->_entitiesToObserve, 0);
  objc_storeStrong((id *)&self->_sceneHandlesBeingObserved, 0);
  objc_storeStrong((id *)&self->_cleanupTransaction, 0);
  objc_storeStrong((id *)&self->_notifyObserversTransaction, 0);
  objc_storeStrong((id *)&self->_animationTransaction, 0);
  objc_storeStrong((id *)&self->_transitionContextProvider, 0);
}

- (void)_willComplete
{
  v6.receiver = self;
  v6.super_class = (Class)SBUIAnimationController;
  [(SBUIAnimationController *)&v6 _willComplete];
  int animationState = self->_animationState;
  if ((animationState - 3) >= 2)
  {
    id v4 = SBLogWorkspace();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "[SBUIAnimationController] willComplete: Canceling animation", v5, 2u);
    }

    [(SBUIAnimationController *)self __abortAnimation];
    [(SBUIAnimationController *)self _notifyObserversOfAnimationCompletion];
    int animationState = self->_animationState;
  }
  if (animationState != 4) {
    [(SBUIAnimationController *)self __cleanupAnimation];
  }
}

- (SBUIAnimationController)init
{
  return [(SBUIAnimationController *)self initWithTransitionContextProvider:0];
}

- (NSSet)fromApplicationSceneEntities
{
  return (NSSet *)[(SBUIAnimationControllerTransitionContextProvider *)self->_transitionContextProvider fromApplicationSceneEntities];
}

- (SBApplicationSceneEntity)toApplicationSceneEntity
{
  uint64_t v2 = [(SBUIAnimationController *)self toApplicationSceneEntities];
  char v3 = [v2 anyObject];

  return (SBApplicationSceneEntity *)v3;
}

- (SBApplicationSceneEntity)fromApplicationSceneEntity
{
  uint64_t v2 = [(SBUIAnimationController *)self fromApplicationSceneEntities];
  char v3 = [v2 anyObject];

  return (SBApplicationSceneEntity *)v3;
}

- (BOOL)animating
{
  return (self->_animationState - 1) < 2;
}

- (BOOL)transitionSupportsCancelling
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  char v3 = [(SBUIAnimationController *)self transition];
  char v4 = [v3 supportsCancelling];

  char v11 = v4;
  if (*((unsigned char *)v9 + 24))
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__SBUIAnimationController_transitionSupportsCancelling__block_invoke;
    v7[3] = &unk_1E6AF4C30;
    v7[4] = &v8;
    [(SBUIAnimationController *)self _enumerateCoordinatingAnimationsWithSchedulingPolicy:0 block:v7];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __55__SBUIAnimationController_transitionSupportsCancelling__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 transitionSupportsCancelling];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v6 + 24)) {
    char v7 = result;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)(v6 + 24) = v7;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

- (BOOL)transitionSupportsRestarting
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  char v3 = [(SBUIAnimationController *)self transition];
  char v4 = [v3 supportsRestarting];

  char v11 = v4;
  if (*((unsigned char *)v9 + 24))
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__SBUIAnimationController_transitionSupportsRestarting__block_invoke;
    v7[3] = &unk_1E6AF4C30;
    v7[4] = &v8;
    [(SBUIAnimationController *)self _enumerateCoordinatingAnimationsWithSchedulingPolicy:0 block:v7];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __55__SBUIAnimationController_transitionSupportsRestarting__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 transitionSupportsRestarting];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v6 + 24)) {
    char v7 = result;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)(v6 + 24) = v7;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

- (void)cancelTransition
{
  char v3 = [(SBUIAnimationController *)self transition];
  [v3 cancelTransition];

  [(SBUIAnimationController *)self _enumerateCoordinatingAnimationsWithSchedulingPolicy:0 block:&__block_literal_global_159];
}

uint64_t __43__SBUIAnimationController_cancelTransition__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancelTransition];
}

- (void)restartTransition
{
  char v3 = [(SBUIAnimationController *)self transition];
  [v3 restartTransition];

  [(SBUIAnimationController *)self _enumerateCoordinatingAnimationsWithSchedulingPolicy:0 block:&__block_literal_global_67];
}

uint64_t __44__SBUIAnimationController_restartTransition__block_invoke(uint64_t a1, void *a2)
{
  return [a2 restartTransition];
}

- (BOOL)transitionWasCancelled
{
  uint64_t v2 = [(SBUIAnimationController *)self transition];
  char v3 = [v2 transitionWasCancelled];

  return v3;
}

- (BOOL)transitionWasRestarted
{
  uint64_t v2 = [(SBUIAnimationController *)self transition];
  char v3 = [v2 transitionWasRestarted];

  return v3;
}

- (BSAnimationSettings)animationSettings
{
  return 0;
}

- (void)addSteppedCoordinatingChildAnimation:(id)a3
{
  id v7 = a3;
  if (![(SBUIAnimationController *)self isStepped])
  {
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBUIAnimationController.m" lineNumber:304 description:@"Cannot add a stepped coordinating child if the parent has stepping disabled."];
  }
  if (([v7 isStepped] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBUIAnimationController.m" lineNumber:305 description:@"Cannot add a stepped coordinating child if the child has stepping disabled."];
  }
  [(SBUIAnimationController *)self addCoordinatingChildTransaction:v7 withSchedulingPolicy:0];
  [(NSMutableArray *)self->_steppedCoordinatingChildAnimations addObject:v7];
}

- (void)delayAnimationUntilTransactionFinishes:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    uint64_t v8 = v4;
    char v6 = [v4 hasStarted];
    BOOL v5 = v8;
    if ((v6 & 1) == 0)
    {
      char v7 = [(BSBlockTransaction *)self->_animationTransaction hasStarted];
      BOOL v5 = v8;
      if ((v7 & 1) == 0)
      {
        [v8 addChildTransaction:self->_animationTransaction withSchedulingPolicy:1];
        BOOL v5 = v8;
      }
    }
  }
}

- (void)stopDelayingAnimationForTransaction:(id)a3
{
  if (a3) {
    [a3 removeChildTransaction:self->_animationTransaction];
  }
}

+ (BOOL)isPendingAlertItemsWithReason:(id)a3
{
  return [(id)__animationControllerPendingAlertItemsReasons containsObject:a3];
}

void __55__SBUIAnimationController__addAlertItemsPendingReason___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v1 = (void *)__animationControllerPendingAlertItemsReasons;
  __animationControllerPendingAlertItemsReasons = (uint64_t)v0;
}

- (void)__abortAnimation
{
  [(SBUIAnimationController *)self _setAnimationState:3];
  [(SBUIAnimationController *)self _abortAnimation];
}

- (BOOL)waitingToStart
{
  return [(BSBlockTransaction *)self->_animationTransaction hasStarted] ^ 1;
}

- (BOOL)isFinishedAnimating
{
  return self->_animationState > 2u;
}

- (BOOL)isReasonableMomentToInterrupt
{
  return 0;
}

- (BOOL)shouldResignActiveForAnimation
{
  return 1;
}

- (void)enableSteppingWithAnimationSettings:(id)a3
{
  if (!self->_stepper)
  {
    id v4 = a3;
    BOOL v5 = [[SBAnimationStepper alloc] initWithAnimationSettings:v4];

    stepper = self->_stepper;
    self->_stepper = v5;
  }
}

- (void)_enumerateCoordinatingAnimationsWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__SBUIAnimationController__enumerateCoordinatingAnimationsWithBlock___block_invoke;
  v6[3] = &unk_1E6B01E10;
  id v7 = v4;
  id v5 = v4;
  [(SBUIAnimationController *)self _enumerateCoordinatingChildRelationshipsWithBlock:v6];
}

void __69__SBUIAnimationController__enumerateCoordinatingAnimationsWithBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 coordinatingChildTransaction];
  char v6 = [v5 coordinatingAnimationControllers];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v13 != v10) {
        objc_enumerationMutation(v7);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
      if (*a3) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_enumerateCoordinatingAnimationsWithSchedulingPolicy:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__SBUIAnimationController__enumerateCoordinatingAnimationsWithSchedulingPolicy_block___block_invoke;
  v8[3] = &unk_1E6B01E38;
  id v9 = v6;
  unint64_t v10 = a3;
  id v7 = v6;
  [(SBUIAnimationController *)self _enumerateCoordinatingChildRelationshipsWithBlock:v8];
}

void __86__SBUIAnimationController__enumerateCoordinatingAnimationsWithSchedulingPolicy_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([v5 schedulingPolicy] == *(void *)(a1 + 40))
  {
    id v6 = [v5 coordinatingChildTransaction];
    id v7 = [v6 coordinatingAnimationControllers];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_didInterruptWithReason:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIAnimationController;
  [(SBUIAnimationController *)&v4 _didInterruptWithReason:a3];
  [(SBUIAnimationController *)self _noteAnimationDidFail];
}

- (BOOL)__wantsInitialProgressStateChange
{
  return 0;
}

uint64_t __39__SBUIAnimationController__willAnimate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _willAnimate];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (id)__startTransactionDependencyForEntity:(id)a3
{
  char v3 = [a3 sceneHandle];
  if (v3) {
    objc_super v4 = [[SBWaitForSceneContentAvailableTransaction alloc] initWithSceneHandle:v3 manualListener:1];
  }
  else {
    objc_super v4 = 0;
  }

  return v4;
}

- (void)_startAnimation
{
  if (![(SBUIAnimationController *)self isStepped])
  {
    [(SBUIAnimationController *)self _noteAnimationDidFinish];
  }
}

- (BOOL)_shouldDismissBanner
{
  return 1;
}

- (id)_viewsForAnimationStepping
{
  uint64_t v2 = [(SBUIAnimationController *)self _getTransitionWindow];
  if (v2) {
    [MEMORY[0x1E4F1CAD0] setWithObject:v2];
  }
  else {
  char v3 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v3;
}

- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SBUIAnimationController_sceneHandle_didUpdateContentState___block_invoke;
  v9[3] = &unk_1E6AF6FC0;
  v9[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SBUIAnimationController_sceneHandle_didUpdateContentState___block_invoke_2;
  v8[3] = &__block_descriptor_40_e51_v16__0__SBWaitForSceneContentAvailableTransaction_8l;
  void v8[4] = a4;
  id v7 = v6;
  [(SBUIAnimationController *)self _entityObserverProgressDidChange:v9 waitForSceneContentAvailableTransactionBlock:v8];
}

uint64_t __61__SBUIAnimationController_sceneHandle_didUpdateContentState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sceneHandle:*(void *)(a1 + 40) didUpdateContentState:*(void *)(a1 + 48)];
}

uint64_t __61__SBUIAnimationController_sceneHandle_didUpdateContentState___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 noteSceneContentIsReady:*(void *)(a1 + 32) == 2];
}

- (void)_processStateDidChange:(id)a3
{
  objc_super v4 = [a3 object];
  id v5 = [v4 processState];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__SBUIAnimationController__processStateDidChange___block_invoke;
  v10[3] = &unk_1E6AF4E00;
  v10[4] = self;
  id v11 = v4;
  id v12 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__SBUIAnimationController__processStateDidChange___block_invoke_2;
  v8[3] = &unk_1E6B01ED0;
  id v9 = v12;
  id v6 = v12;
  id v7 = v4;
  [(SBUIAnimationController *)self _entityObserverProgressDidChange:v10 waitForSceneContentAvailableTransactionBlock:v8];
}

uint64_t __50__SBUIAnimationController__processStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _application:*(void *)(a1 + 40) processStateDidChange:*(void *)(a1 + 48)];
}

void __50__SBUIAnimationController__processStateDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isRunning] & 1) == 0 && (objc_msgSend(v3, "isComplete") & 1) == 0) {
    [v3 failWithReason:@"Process exited"];
  }
}

- (void)_entityObserverProgressDidChange:(id)a3 waitForSceneContentAvailableTransactionBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (void *)[(NSSet *)self->_startTransactionDependencies copy];
  if ([(NSSet *)self->_entitiesToObserve count] && self->_animationState != 3) {
    v6[2](v6);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v7[2](v7, v14);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)_noteAnimationDidRevealApplication
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__SBUIAnimationController__noteAnimationDidRevealApplication__block_invoke;
  v2[3] = &unk_1E6AF4C80;
  v2[4] = self;
  [(SBUIAnimationController *)self _enumerateObserversWithBlock:v2];
}

void __61__SBUIAnimationController__noteAnimationDidRevealApplication__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 animationControllerDidRevealApplication:*(void *)(a1 + 32)];
  }
}

- (void)_noteAnimationDidFail
{
  id v3 = SBLogWorkspace();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "[SBUIAnimationController] noteAnimationDidFail: Animation failed.", v5, 2u);
  }

  objc_super v4 = [(SBUIAnimationController *)self transition];
  if ([v4 isTransitioning]) {
    objc_msgSend(v4, "completeTransition:", objc_msgSend(v4, "transitionWasCancelled") ^ 1);
  }
  else {
    [(SBUIAnimationController *)self __noteAnimationDidTerminate];
  }
}

- (double)stepPercentage
{
  [(SBAnimationStepper *)self->_stepper stepPercentage];
  return result;
}

- (void)setStepPercentage:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(SBUIAnimationController *)self isStepped])
  {
    id v5 = [(SBUIAnimationController *)self transition];
    [v5 updateInteractiveTransition:a3];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_steppedCoordinatingChildAnimations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setStepPercentage:", a3, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)finishSteppingForwardToEnd
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(SBUIAnimationController *)self isStepped])
  {
    id v3 = [(SBUIAnimationController *)self transition];
    [v3 finishInteractiveTransition];

    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    objc_super v4 = self->_steppedCoordinatingChildAnimations;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "finishSteppingForwardToEnd", (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)finishSteppingBackwardToStart
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(SBUIAnimationController *)self isStepped])
  {
    id v3 = [(SBUIAnimationController *)self transition];
    [v3 cancelInteractiveTransition];

    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    objc_super v4 = self->_steppedCoordinatingChildAnimations;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "finishSteppingBackwardToStart", (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)startInteractiveTransition:(id)a3
{
  id v6 = a3;
  id v4 = [(SBUIAnimationController *)self transition];
  if (v4 == v6)
  {
    uint64_t v5 = [v6 animator];
    [v5 animateTransition:v6];
  }
}

void __47__SBUIAnimationController_transitionDidFinish___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 schedulingPolicy] == 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)setTransitionContextProvider:(id)a3
{
}

- (UIView)containerView
{
  return self->_transitionContainer;
}

- (void)setTransition:(id)a3
{
}

- (BOOL)needsCATransactionActivate
{
  return self->_needsCATransactionActivate;
}

- (void)setNeedsCATransactionActivate:(BOOL)a3
{
  self->_needsCATransactionActivate = a3;
}

- (BOOL)isFluidSwitcherAnimationController
{
  return 0;
}

@end