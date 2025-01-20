@interface SBStartupTransitionController
- (NSString)description;
- (SBStartupTransition)startupTransition;
- (SBStartupTransitionContextPersistence)_transitionContextPersistence;
- (SBStartupTransitionController)initWithInitialRestartState:(id)a3;
- (SBStartupTransitionFactory)_transitionFactory;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_saveContextFromTransitionContext:(id)a3;
- (void)_setTransitionContextPersistence:(id)a3;
- (void)_setTransitionFactory:(id)a3;
- (void)initializeAndRunStartupTransition:(id)a3;
- (void)transactionDidBegin:(id)a3;
- (void)transactionDidComplete:(id)a3;
@end

@implementation SBStartupTransitionController

- (SBStartupTransition)startupTransition
{
  return self->_transition;
}

- (SBStartupTransitionController)initWithInitialRestartState:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBStartupTransitionController;
  v6 = [(SBStartupTransitionController *)&v15 init];
  if (v6)
  {
    v7 = SBLogWorkspace();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Startup transition controller initialized with initial state: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_initialRestartState, a3);
    v8 = [[SBStartupTransitionFactory alloc] initWithInitialRestartState:v6->_initialRestartState];
    transitionFactory = v6->_transitionFactory;
    v6->_transitionFactory = v8;

    v10 = [SBStartupTransitionContextPersistence alloc];
    v11 = [(SBInitialRestartState *)v6->_initialRestartState bootDefaults];
    uint64_t v12 = [(SBStartupTransitionContextPersistence *)v10 initWithBootDefaults:v11 loginSession:[(SBInitialRestartState *)v6->_initialRestartState isLoginSession]];
    transitionContextPersistence = v6->_transitionContextPersistence;
    v6->_transitionContextPersistence = (SBStartupTransitionContextPersistence *)v12;
  }
  return v6;
}

- (void)initializeAndRunStartupTransition:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v33 = (void (**)(id, BSTransactionBlockObserver *, SBStartupTransition *))a3;
  kdebug_trace();
  BSDispatchQueueAssertMain();
  if (self->_ranOnce)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"SBStartupTransitionController.m", 60, @"We've already run once, and can't run the startup transition again." object file lineNumber description];
  }
  self->_ranOnce = 1;
  v34 = [(SBStartupTransitionContextPersistence *)self->_transitionContextPersistence readTransitionContext];
  id v5 = v34;
  if ([v34 hasUserSwitchOverlayMismatch])
  {
    v6 = [v34 overlay];
    v7 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.5];
    [v6 dismissWithAnimation:v7];

    id v5 = v34;
  }
  unint64_t v46 = 0;
  v8 = [(SBStartupTransitionFactory *)self->_transitionFactory transitionForContext:v5 outDestination:&v46];
  transition = self->_transition;
  self->_transition = v8;

  if (!self->_transition)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"SBStartupTransitionController.m" lineNumber:72 description:@"A startup transition is required."];
  }
  objc_initWeak(&location, self);
  v10 = self->_transition;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __67__SBStartupTransitionController_initializeAndRunStartupTransition___block_invoke;
  v43[3] = &unk_1E6B00B08;
  objc_copyWeak(&v44, &location);
  v43[4] = self;
  [(SBStartupTransition *)v10 registerBlockObserver:v43];
  v11 = [MEMORY[0x1E4F4F258] dismissActions];
  renderOverlayDismissActions = self->_renderOverlayDismissActions;
  self->_renderOverlayDismissActions = v11;

  if ([(NSSet *)self->_renderOverlayDismissActions count] >= 2)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v14 = self->_renderOverlayDismissActions;
    uint64_t v15 = [(NSSet *)v14 countByEnumeratingWithState:&v39 objects:v54 count:16];
    if (v15)
    {
      char v16 = 0;
      uint64_t v17 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v20 = [v19 overlayDescriptor];
          int v21 = [v20 isInterstitial];

          if (v21) {
            [v13 addObject:v19];
          }
          else {
            char v16 = 1;
          }
        }
        uint64_t v15 = [(NSSet *)v14 countByEnumeratingWithState:&v39 objects:v54 count:16];
      }
      while (v15);

      if ((v16 & 1) == 0 || ![v13 count]) {
        goto LABEL_29;
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v22 = v13;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v53 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v36 != v24) {
              objc_enumerationMutation(v22);
            }
            [*(id *)(*((void *)&v35 + 1) + 8 * j) dismiss];
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v53 count:16];
        }
        while (v23);
      }

      v14 = [MEMORY[0x1E4F1CA80] setWithSet:self->_renderOverlayDismissActions];
      [(NSSet *)v14 minusSet:v22];
      v26 = [MEMORY[0x1E4F1CAD0] setWithSet:v14];
      v27 = self->_renderOverlayDismissActions;
      self->_renderOverlayDismissActions = v26;
    }
LABEL_29:
  }
  if (v33) {
    v33[2](v33, self->_transitionObserver, self->_transition);
  }
  v28 = SBLogWorkspace();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = NSStringFromStartupTransitionDestination(v46);
    v30 = self->_transition;
    *(_DWORD *)buf = 138543874;
    v48 = v29;
    __int16 v49 = 2114;
    v50 = v30;
    __int16 v51 = 2114;
    v52 = v34;
    _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "Startup transition destination: %{public}@, with transition: %{public}@ (context=%{public}@).", buf, 0x20u);
  }
  [(SBStartupTransition *)self->_transition begin];
  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
}

void __67__SBStartupTransitionController_initializeAndRunStartupTransition___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__SBStartupTransitionController_initializeAndRunStartupTransition___block_invoke_2;
  v12[3] = &unk_1E6B00AE0;
  id v8 = WeakRetained;
  id v13 = v8;
  [v7 addTransactionDidBeginBlock:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__SBStartupTransitionController_initializeAndRunStartupTransition___block_invoke_3;
  v10[3] = &unk_1E6B00AE0;
  id v11 = v8;
  id v9 = v8;
  [v7 addTransactionDidCompleteBlock:v10];
}

uint64_t __67__SBStartupTransitionController_initializeAndRunStartupTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transactionDidBegin:a2];
}

uint64_t __67__SBStartupTransitionController_initializeAndRunStartupTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transactionDidComplete:a2];
}

- (void)_saveContextFromTransitionContext:(id)a3
{
}

- (NSString)description
{
  return (NSString *)[(SBStartupTransitionController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBStartupTransitionController *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBStartupTransitionController *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBStartupTransitionController *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__SBStartupTransitionController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v10 = v5;
  id v11 = self;
  id v6 = (id)[v5 modifyBody:v9];
  id v7 = v5;

  return v7;
}

id __71__SBStartupTransitionController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"startupTransition"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"initialResetState"];
}

- (void)transactionDidBegin:(id)a3
{
  id v5 = (SBStartupTransition *)a3;
  id v8 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBStartupTransitionController.m", 175, @"Invalid parameter not satisfying: %@", @"transition" object file lineNumber description];

    id v5 = 0;
  }
  if (self->_transition != v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBStartupTransitionController.m" lineNumber:176 description:@"Startup transition differs from what we expect."];
  }
  [(SBStartupTransitionContextPersistence *)self->_transitionContextPersistence saveContext:0];
}

- (void)transactionDidComplete:(id)a3
{
  id v5 = (SBStartupTransition *)a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBStartupTransitionController.m", 183, @"Invalid parameter not satisfying: %@", @"transition" object file lineNumber description];
  }
  if (self->_transition != v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBStartupTransitionController.m" lineNumber:184 description:@"Startup transition differs from what we expect."];
  }
  id v6 = SBLogWorkspace();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Startup transition completed.", buf, 2u);
  }

  transition = self->_transition;
  self->_transition = 0;

  transitionObserver = self->_transitionObserver;
  self->_transitionObserver = 0;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SBStartupTransitionController_transactionDidComplete___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __56__SBStartupTransitionController_transactionDidComplete___block_invoke(uint64_t a1)
{
  v1 = (void *)*MEMORY[0x1E4F43630];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__SBStartupTransitionController_transactionDidComplete___block_invoke_2;
  v3[3] = &unk_1E6AF4AC0;
  v3[4] = *(void *)(a1 + 32);
  return [v1 _performBlockAfterCATransactionCommits:v3];
}

uint64_t __56__SBStartupTransitionController_transactionDidComplete___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    uint64_t v5 = *MEMORY[0x1E4F3A490];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v1);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "overlayDescriptor", (void)v14);
        int v9 = [v8 isInterstitial];

        id v10 = (void *)MEMORY[0x1E4F4F680];
        if (v9)
        {
          id v11 = [MEMORY[0x1E4F39C10] functionWithName:v5];
          uint64_t v12 = [v10 settingsWithDuration:v11 timingFunction:0.75];
          [v7 dismissWithAnimation:v12];
        }
        else
        {
          id v11 = [MEMORY[0x1E4F4F680] settingsWithDuration:1.0];
          [v7 dismissWithAnimation:v11];
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }

  return kdebug_trace();
}

- (SBStartupTransitionContextPersistence)_transitionContextPersistence
{
  return self->_transitionContextPersistence;
}

- (void)_setTransitionContextPersistence:(id)a3
{
}

- (SBStartupTransitionFactory)_transitionFactory
{
  return self->_transitionFactory;
}

- (void)_setTransitionFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderOverlayDismissActions, 0);
  objc_storeStrong((id *)&self->_transitionObserver, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_transitionFactory, 0);
  objc_storeStrong((id *)&self->_transitionContextPersistence, 0);
  objc_storeStrong((id *)&self->_initialRestartState, 0);
}

@end