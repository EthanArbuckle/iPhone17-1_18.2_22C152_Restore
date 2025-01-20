@interface SBModalAlertPresentationCoordinator
- (BOOL)canShowApplicationModalAlerts;
- (BOOL)isShowingModalAlert;
- (BOOL)isShowingSystemModalAlert;
- (NSString)description;
- (SBModalAlertPresentationCoordinator)initWithSceneDeactivationManager:(id)a3;
- (SBModalAlertPresentationCoordinatorDelegate)delegate;
- (SBModalAlertPresenter)_getSpringBoardPresenter;
- (id)_fencingTransitionContext:(BOOL)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)hideApplicationModalAlertsForReason:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_addModalAlertPresenterIfNecessary:(id)a3;
- (void)_adjustApplicationSceneSettingsForModalAlertsAndFence:(BOOL)a3;
- (void)_noteSpringBoardModalAlertStateChanged:(BOOL)a3;
- (void)_removeModalAlertPresenter:(id)a3;
- (void)_setSpringBoardPresenter:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBModalAlertPresentationCoordinator

- (BOOL)canShowApplicationModalAlerts
{
  return ![(SBModalAlertPresentationCoordinator *)self isShowingSystemModalAlert];
}

- (void)_removeModalAlertPresenter:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = (SBModalAlertPresenter *)a3;
  BSDispatchQueueAssertMain();
  if (v4 && [(NSMutableSet *)self->_activeModalAlertPresenters containsObject:v4])
  {
    v5 = SBLogAlertItems();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(SBModalAlertPresenter *)v4 scene];
      v7 = [v6 identityToken];
      v8 = [v7 stringRepresentation];
      int v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Removing modal alert presenter %@", (uint8_t *)&v9, 0xCu);
    }
    [(NSMutableSet *)self->_activeModalAlertPresenters removeObject:v4];
    if (self->_springBoardModalAlertPresenter == v4) {
      [(SBModalAlertPresentationCoordinator *)self _noteSpringBoardModalAlertStateChanged:0];
    }
  }
}

- (BOOL)isShowingSystemModalAlert
{
  return [(SBModalAlertPresenter *)self->_springBoardModalAlertPresenter isShowingModalAlert];
}

- (SBModalAlertPresentationCoordinator)initWithSceneDeactivationManager:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBModalAlertPresentationCoordinator;
  v6 = [(SBModalAlertPresentationCoordinator *)&v17 init];
  if (v6)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeModalAlertPresenters = v6->_activeModalAlertPresenters;
    v6->_activeModalAlertPresenters = v7;

    int v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    hideApplicationModalAlertAssertions = v6->_hideApplicationModalAlertAssertions;
    v6->_hideApplicationModalAlertAssertions = v9;

    objc_storeStrong((id *)&v6->_sceneDeactivationManager, a3);
    objc_initWeak(&location, v6);
    id v11 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v15, &location);
    uint64_t v12 = BSLogAddStateCaptureBlockWithTitle();
    sysdiagnoseStateHandler = v6->_sysdiagnoseStateHandler;
    v6->_sysdiagnoseStateHandler = (BSInvalidatable *)v12;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v6;
}

id __72__SBModalAlertPresentationCoordinator_initWithSceneDeactivationManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

- (BOOL)isShowingModalAlert
{
  return [(NSMutableSet *)self->_activeModalAlertPresenters count] != 0;
}

- (id)hideApplicationModalAlertsForReason:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v6 = MEMORY[0x1E4F14428];
  id v7 = MEMORY[0x1E4F14428];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __75__SBModalAlertPresentationCoordinator_hideApplicationModalAlertsForReason___block_invoke;
  v13 = &unk_1E6AF4FB8;
  objc_copyWeak(&v14, &location);
  v8 = (void *)[v5 initWithIdentifier:@"HideApplicationModalAlertsAssertion" forReason:v4 queue:v6 invalidationBlock:&v10];

  -[NSMutableSet addObject:](self->_hideApplicationModalAlertAssertions, "addObject:", v8, v10, v11, v12, v13);
  if ([(NSMutableSet *)self->_hideApplicationModalAlertAssertions count] == 1) {
    [(SBModalAlertPresentationCoordinator *)self _adjustApplicationSceneSettingsForModalAlertsAndFence:1];
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __75__SBModalAlertPresentationCoordinator_hideApplicationModalAlertsForReason___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[6] removeObject:v5];
    if (![v4[6] count] && (objc_msgSend(v4, "isShowingSystemModalAlert") & 1) == 0) {
      [v4 _adjustApplicationSceneSettingsForModalAlertsAndFence:0];
    }
  }
}

- (void)_addModalAlertPresenterIfNecessary:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (SBModalAlertPresenter *)a3;
  BSDispatchQueueAssertMain();
  if (v4 && ([(NSMutableSet *)self->_activeModalAlertPresenters containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_activeModalAlertPresenters addObject:v4];
    id v5 = SBLogAlertItems();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(SBModalAlertPresenter *)v4 scene];
      id v7 = [v6 identityToken];
      v8 = [v7 stringRepresentation];
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Adding modal alert presenter for %@", (uint8_t *)&v9, 0xCu);
    }
    if (self->_springBoardModalAlertPresenter == v4) {
      [(SBModalAlertPresentationCoordinator *)self _noteSpringBoardModalAlertStateChanged:1];
    }
  }
}

- (NSString)description
{
  return (NSString *)[(SBModalAlertPresentationCoordinator *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBModalAlertPresentationCoordinator *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBModalAlertPresentationCoordinator *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBModalAlertPresentationCoordinator *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__SBModalAlertPresentationCoordinator_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v10 = v5;
  uint64_t v11 = self;
  id v6 = (id)[v5 modifyBody:v9];
  id v7 = v5;

  return v7;
}

id __77__SBModalAlertPresentationCoordinator_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"systemModalAlertPresenter" skipIfNil:1];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"activeModalAlertPresenters"];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"sceneDeactivationAssertion" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"hideAllApplicationModalAlertsAssertions"];
}

- (void)_noteSpringBoardModalAlertStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssertMain();
  hideApplicationModalAlertsAssertionWhileSBModalAlertsActive = self->_hideApplicationModalAlertsAssertionWhileSBModalAlertsActive;
  if (v3)
  {
    if (hideApplicationModalAlertsAssertionWhileSBModalAlertsActive
      || self->_systemModalAlertsActiveSceneDeactivationAssertion)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"SBModalAlertPresentationCoordinator.m" lineNumber:182 description:@"We shouldn't have any assertions at this point."];
    }
    id v7 = [(SBModalAlertPresentationCoordinator *)self hideApplicationModalAlertsForReason:@"SystemModalAlertActive"];
    v8 = self->_hideApplicationModalAlertsAssertionWhileSBModalAlertsActive;
    self->_hideApplicationModalAlertsAssertionWhileSBModalAlertsActive = v7;

    int v9 = (UIApplicationSceneDeactivationAssertion *)[(UIApplicationSceneDeactivationManager *)self->_sceneDeactivationManager newAssertionWithReason:13];
    systemModalAlertsActiveSceneDeactivationAssertion = self->_systemModalAlertsActiveSceneDeactivationAssertion;
    self->_systemModalAlertsActiveSceneDeactivationAssertion = v9;

    uint64_t v11 = self->_systemModalAlertsActiveSceneDeactivationAssertion;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __78__SBModalAlertPresentationCoordinator__noteSpringBoardModalAlertStateChanged___block_invoke;
    v17[3] = &unk_1E6AF9A10;
    v17[4] = self;
    [(UIApplicationSceneDeactivationAssertion *)v11 acquireWithPredicate:v17 transitionContext:0];
  }
  else
  {
    [(BSInvalidatable *)hideApplicationModalAlertsAssertionWhileSBModalAlertsActive invalidate];
    uint64_t v12 = self->_hideApplicationModalAlertsAssertionWhileSBModalAlertsActive;
    self->_hideApplicationModalAlertsAssertionWhileSBModalAlertsActive = 0;

    [(UIApplicationSceneDeactivationAssertion *)self->_systemModalAlertsActiveSceneDeactivationAssertion relinquish];
    v13 = self->_systemModalAlertsActiveSceneDeactivationAssertion;
    self->_systemModalAlertsActiveSceneDeactivationAssertion = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v15 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained modalAlertPresentationCoordinator:self didChangeShowingSystemModalAlert:v3];
  }
}

uint64_t __78__SBModalAlertPresentationCoordinator__noteSpringBoardModalAlertStateChanged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v5 = [WeakRetained modalAlertPresentationCoordinatorRequestedForegroundScenes:*(void *)(a1 + 32)];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "sceneIfExists", (void)v12);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v3)
        {
          uint64_t v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_fencingTransitionContext:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssertMain();
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
    if (v4)
    {
      id v5 = [MEMORY[0x1E4F42790] transitionContext];
      [v5 setAnimationFence:v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)_adjustApplicationSceneSettingsForModalAlertsAndFence:(BOOL)a3
{
  BOOL v20 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained modalAlertPresentationCoordinatorRequestedForegroundScenes:self];

  BOOL v19 = [(SBModalAlertPresentationCoordinator *)self isShowingSystemModalAlert];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      long long v12 = v9;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        int v9 = [*(id *)(*((void *)&v21 + 1) + 8 * v11) sceneIfExists];

        if (v9)
        {
          long long v13 = [(SBModalAlertPresentationCoordinator *)self _fencingTransitionContext:v20];
          uint64_t v14 = objc_opt_class();
          long long v15 = [v9 settings];
          v16 = (void *)[v15 mutableCopy];
          uint64_t v17 = SBSafeCast(v14, v16);

          if (v17)
          {
            if (v19)
            {
              [v17 setCanShowAlerts:0];
              unint64_t v18 = [v17 deactivationReasons] | 0x2000;
            }
            else
            {
              objc_msgSend(v17, "setCanShowAlerts:", -[NSMutableSet count](self->_hideApplicationModalAlertAssertions, "count") == 0);
              unint64_t v18 = [v17 deactivationReasons] & 0xFFFFFFFFFFFFDFFFLL;
            }
            [v17 setDeactivationReasons:v18];
            [v9 updateSettings:v17 withTransitionContext:v13];
          }
        }
        ++v11;
        long long v12 = v9;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
}

- (SBModalAlertPresentationCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBModalAlertPresentationCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBModalAlertPresenter)_getSpringBoardPresenter
{
  return self->_springBoardModalAlertPresenter;
}

- (void)_setSpringBoardPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sysdiagnoseStateHandler, 0);
  objc_storeStrong((id *)&self->_hideApplicationModalAlertsAssertionWhileSBModalAlertsActive, 0);
  objc_storeStrong((id *)&self->_hideApplicationModalAlertAssertions, 0);
  objc_storeStrong((id *)&self->_systemModalAlertsActiveSceneDeactivationAssertion, 0);
  objc_storeStrong((id *)&self->_springBoardModalAlertPresenter, 0);
  objc_storeStrong((id *)&self->_activeModalAlertPresenters, 0);
  objc_storeStrong((id *)&self->_sceneDeactivationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end