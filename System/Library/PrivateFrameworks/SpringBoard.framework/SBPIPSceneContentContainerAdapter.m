@interface SBPIPSceneContentContainerAdapter
- (BOOL)_hitTestTouch:(id)a3 inWindow:(id)a4;
- (BOOL)_hostedSceneIsPresentingKeyboard;
- (BOOL)_tapInEnvironmentCanDismiss:(int64_t)a3;
- (BOOL)containerViewController:(id)a3 shouldHandleStashingForTransitionContext:(id)a4;
- (BOOL)containerViewControllerShouldRequireMedusaKeyboard:(id)a3;
- (BOOL)isStashTabHiddenForContainerViewController:(id)a3;
- (BOOL)keyboardDismissalManager:(id)a3 shouldPreventDismissalForTouch:(id)a4 inWindow:(id)a5;
- (BOOL)stashableWrapper:(id)a3 didReceivedTapGesture:(id)a4;
- (SBPIPContainerViewController)containerViewController;
- (SBPIPSceneContentContainerAdapter)initWithSceneContentViewController:(id)a3 contentViewLayoutSettings:(id)a4 stashSettings:(id)a5 shadowSettings:(id)a6 interactionSettings:(id)a7 keyboardArbiterManager:(id)a8 keyboardFocusController:(id)a9 keyboardSuppressionManager:(id)a10 keyboardDismissalManager:(id)a11 deactivationManager:(id)a12 transitionCoordinator:(id)a13 delegate:(id)a14;
- (SBPIPSceneContentProviding)sceneContentViewController;
- (id)_hostedAppSceneHandle;
- (id)bundleIdentifierForContainerViewController:(id)a3;
- (id)contentViewControllerForContainerViewController:(id)a3;
- (id)hostedAppSceneHandleForContainerViewController:(id)a3;
- (id)scenePersistenceIdentifierForContainerViewController:(id)a3;
- (int)processIdentifierForContainerViewController:(id)a3;
- (int64_t)_effectiveEnvironmentModeForTransitionContext:(id)a3;
- (void)_dismissKeyboardIfNecessaryForTransitionContext:(id)a3;
- (void)_updateDisplayLayoutElementKeyboardFocus:(BOOL)a3;
- (void)containerViewController:(id)a3 didSettleOnStashState:(BOOL)a4;
- (void)containerViewController:(id)a3 didUpdateStashProgress:(double)a4;
- (void)containerViewController:(id)a3 didUpdateStashState:(BOOL)a4 springSettings:(id)a5;
- (void)containerViewController:(id)a3 handleDestructionRequestForSceneHandle:(id)a4;
- (void)containerViewController:(id)a3 wantsStashTabHidden:(BOOL)a4 left:(BOOL)a5 springSettings:(id)a6 completion:(id)a7;
- (void)containerViewController:(id)a3 willBeginInteractionWithGestureRecognizer:(id)a4;
- (void)containerViewController:(id)a3 willUpdateStashState:(BOOL)a4;
- (void)containerViewControllerDidEndInteraction:(id)a3 targetWindowScene:(id)a4;
- (void)containerViewControllerDidEndSizeChange:(id)a3;
- (void)containerViewControllerPanGestureDidEnd:(id)a3;
- (void)containerViewControllerWillBeginSizeChange:(id)a3 behavior:(int)a4;
- (void)dealloc;
- (void)invalidate;
- (void)keyboardFocusController:(id)a3 externalSceneDidAcquireFocus:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)loadSubviewsForContainerViewController:(id)a3;
- (void)sceneHandle:(id)a3 didUpdatePairingStatusForExternalSceneIdentifiers:(id)a4;
- (void)setContainerViewController:(id)a3;
@end

@implementation SBPIPSceneContentContainerAdapter

- (SBPIPSceneContentContainerAdapter)initWithSceneContentViewController:(id)a3 contentViewLayoutSettings:(id)a4 stashSettings:(id)a5 shadowSettings:(id)a6 interactionSettings:(id)a7 keyboardArbiterManager:(id)a8 keyboardFocusController:(id)a9 keyboardSuppressionManager:(id)a10 keyboardDismissalManager:(id)a11 deactivationManager:(id)a12 transitionCoordinator:(id)a13 delegate:(id)a14
{
  id v55 = a3;
  id v56 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v54 = a7;
  id v46 = a8;
  id v53 = a8;
  id v52 = a9;
  id v51 = a10;
  id v50 = a11;
  v22 = v20;
  id v23 = a12;
  id v49 = a13;
  v24 = v19;
  id v25 = a14;
  v57.receiver = self;
  v57.super_class = (Class)SBPIPSceneContentContainerAdapter;
  v26 = [(SBPIPSceneContentContainerAdapter *)&v57 init];
  v27 = v26;
  if (v26)
  {
    objc_storeWeak((id *)&v26->_delegate, v25);
    objc_storeStrong((id *)&v27->_interactionSettings, v21);
    objc_storeStrong((id *)&v27->_sceneContentViewController, a3);
    v28 = [SBPIPStashableWrapperViewController alloc];
    sceneContentViewController = v27->_sceneContentViewController;
    [v56 defaultCornerRadius];
    uint64_t v30 = -[SBPIPStashableWrapperViewController initWithContentViewController:cornerRadius:stashVisualSettings:shadowSettings:](v28, "initWithContentViewController:cornerRadius:stashVisualSettings:shadowSettings:", sceneContentViewController, v24, v22);
    stashableWrappingViewController = v27->_stashableWrappingViewController;
    v27->_stashableWrappingViewController = (SBPIPStashableWrapperViewController *)v30;

    [(SBPIPStashableWrapperViewController *)v27->_stashableWrappingViewController setDelegate:v27];
    [v56 minimumStashedTabSize];
    v27->_minimumStashTabSize.width = v32;
    v27->_minimumStashTabSize.height = v33;
    uint64_t v34 = [v23 newAssertionWithReason:12];
    sceneDeactivationAssertion = v27->_sceneDeactivationAssertion;
    v27->_sceneDeactivationAssertion = (UIApplicationSceneDeactivationAssertion *)v34;

    objc_storeStrong((id *)&v27->_keyboardArbiterManager, v46);
    objc_storeStrong((id *)&v27->_keyboardFocusController, a9);
    uint64_t v36 = [(SBKeyboardFocusControlling *)v27->_keyboardFocusController addKeyboardFocusObserver:v27];
    keyboardFocusObserver = v27->_keyboardFocusObserver;
    v27->_keyboardFocusObserver = (BSInvalidatable *)v36;

    objc_storeStrong((id *)&v27->_keyboardSuppressionManager, a10);
    objc_storeStrong((id *)&v27->_transitionCoordinator, a13);
    [(SBLayoutStateTransitionCoordinator *)v27->_transitionCoordinator addObserver:v27];
    objc_storeStrong((id *)&v27->_keyboardDismissalManager, a11);
    v38 = [(SBPIPSceneContentContainerAdapter *)v27 _hostedAppSceneHandle];
    [v38 addObserver:v27];

    v39 = [(SBLayoutStateTransitionCoordinator *)v27->_transitionCoordinator windowScene];
    v40 = [v39 layoutStateProvider];
    v41 = [v40 layoutState];
    uint64_t v42 = [v41 unlockedEnvironmentMode];

    if ([(SBPIPSceneContentContainerAdapter *)v27 _tapInEnvironmentCanDismiss:v42])
    {
      uint64_t v43 = [(SBKeyboardDismissalManager *)v27->_keyboardDismissalManager registerKeyboardDismissalParticipant:v27];
      keyboardDismissalParticipantHandle = v27->_keyboardDismissalParticipantHandle;
      v27->_keyboardDismissalParticipantHandle = (BSInvalidatable *)v43;
    }
  }

  return v27;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBPIPSceneContentContainerAdapter.m" lineNumber:108 description:@"Attempting to dealloc without invalidating."];
  }
  v4 = SBLogPIP();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)SBPIPSceneContentContainerAdapter;
  [(SBPIPSceneContentContainerAdapter *)&v7 dealloc];
}

- (id)bundleIdentifierForContainerViewController:(id)a3
{
  v3 = [(SBPIPSceneContentContainerAdapter *)self _hostedAppSceneHandle];
  v4 = [v3 application];
  v5 = [v4 bundleIdentifier];

  return v5;
}

- (id)scenePersistenceIdentifierForContainerViewController:(id)a3
{
  v3 = [(SBPIPSceneContentContainerAdapter *)self _hostedAppSceneHandle];
  v4 = [v3 persistenceIdentifier];

  return v4;
}

- (id)contentViewControllerForContainerViewController:(id)a3
{
  return self->_stashableWrappingViewController;
}

- (int)processIdentifierForContainerViewController:(id)a3
{
  v3 = [(SBPIPSceneContentContainerAdapter *)self _hostedAppSceneHandle];
  v4 = [v3 sceneIfExists];
  v5 = [v4 clientProcess];

  if (v5) {
    int v6 = [v5 pid];
  }
  else {
    int v6 = -1;
  }

  return v6;
}

- (void)setContainerViewController:(id)a3
{
  id obj = a3;
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);

  int v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_containerViewController, obj);
    int v6 = obj;
  }
}

- (id)hostedAppSceneHandleForContainerViewController:(id)a3
{
  return (id)[(SBPIPSceneContentProviding *)self->_sceneContentViewController sceneHandle];
}

- (void)containerViewController:(id)a3 handleDestructionRequestForSceneHandle:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained contentContainerAdapter:self handleDestructionRequestForSceneHandle:v6];
}

- (BOOL)containerViewControllerShouldRequireMedusaKeyboard:(id)a3
{
  BOOL v4 = [(SBPIPInteractionSettings *)self->_interactionSettings usesKeyboards];
  v5 = [(SBPIPSceneContentContainerAdapter *)self _hostedAppSceneHandle];
  id v6 = [v5 sceneIfExists];
  objc_super v7 = v6;
  if (v6)
  {
    v8 = [v6 settings];
    char v9 = [v8 isForeground];

    uint64_t v10 = [v7 uiSettings];
    __int16 v11 = [v10 deactivationReasons];

    if ((v11 & 0x100) != 0) {
      char v12 = 0;
    }
    else {
      char v12 = v9;
    }
  }
  else
  {
    char v12 = 1;
  }
  BOOL v13 = v4 & v12;

  return v13;
}

- (SBPIPContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  return (SBPIPContainerViewController *)WeakRetained;
}

- (void)containerViewControllerWillBeginSizeChange:(id)a3 behavior:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  stashableWrappingViewController = self->_stashableWrappingViewController;
  BOOL v7 = a4 != 0;
  id v8 = a3;
  [(SBPIPStashableWrapperViewController *)stashableWrappingViewController setInteractivelyResizing:v7];
  [(SBPIPSceneContentProviding *)self->_sceneContentViewController containerViewControllerWillBeginSizeChange:v8 behavior:v4];
}

- (void)containerViewControllerDidEndSizeChange:(id)a3
{
  stashableWrappingViewController = self->_stashableWrappingViewController;
  id v5 = a3;
  [(SBPIPStashableWrapperViewController *)stashableWrappingViewController setInteractivelyResizing:0];
  [(SBPIPSceneContentProviding *)self->_sceneContentViewController containerViewControllerDidEndSizeChange:v5];
}

- (void)containerViewController:(id)a3 willBeginInteractionWithGestureRecognizer:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained contentContainerAdapter:self willBeginInteractionWithGestureRecognizer:v6];
}

- (void)containerViewControllerDidEndInteraction:(id)a3 targetWindowScene:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained contentContainerAdapterDidEndInteraction:self targetWindowScene:v7];

  [(SBPIPSceneContentProviding *)self->_sceneContentViewController containerViewControllerDidEndInteraction:v9 targetWindowScene:v7];
}

- (void)containerViewControllerPanGestureDidEnd:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained contentContainerAdapterPanGestureDidEnd:self];
}

- (BOOL)containerViewController:(id)a3 shouldHandleStashingForTransitionContext:(id)a4
{
  return [(SBPIPSceneContentProviding *)self->_sceneContentViewController containerViewController:a3 shouldHandleStashingForTransitionContext:a4];
}

- (void)loadSubviewsForContainerViewController:(id)a3
{
  -[SBPIPStashableWrapperViewController setMinimumStashTabSize:](self->_stashableWrappingViewController, "setMinimumStashTabSize:", a3, self->_minimumStashTabSize.width, self->_minimumStashTabSize.height);
  stashableWrappingViewController = self->_stashableWrappingViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[SBPIPStashableWrapperViewController setStashed:animated:](stashableWrappingViewController, "setStashed:animated:", [WeakRetained initialStashStateForContentContainerAdapter:self], 0);
}

- (void)containerViewController:(id)a3 willUpdateStashState:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained contentContainerAdapter:self willUpdateStashState:v4];
}

- (void)containerViewController:(id)a3 didSettleOnStashState:(BOOL)a4
{
}

- (void)containerViewController:(id)a3 didUpdateStashState:(BOOL)a4 springSettings:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  [(SBPIPStashableWrapperViewController *)self->_stashableWrappingViewController setStashed:v5];
  if (!v5) {
    [(SBPIPStashableWrapperViewController *)self->_stashableWrappingViewController setStashTabHidden:1 left:0 withSpringBehavior:v7 completion:0];
  }
}

- (void)containerViewController:(id)a3 wantsStashTabHidden:(BOOL)a4 left:(BOOL)a5 springSettings:(id)a6 completion:(id)a7
{
}

- (void)containerViewController:(id)a3 didUpdateStashProgress:(double)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = WeakRetained;
  if (!WeakRetained
    || [WeakRetained contentContainerAdapterShouldUpdateUIForStashing:self])
  {
    [(SBPIPStashableWrapperViewController *)self->_stashableWrappingViewController setStashProgress:a4];
  }
  int IsOne = BSFloatIsOne();
  sceneDeactivationAssertion = self->_sceneDeactivationAssertion;
  if (IsOne)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__SBPIPSceneContentContainerAdapter_containerViewController_didUpdateStashProgress___block_invoke;
    v15[3] = &unk_1E6AF9A10;
    v15[4] = self;
    [(UIApplicationSceneDeactivationAssertion *)sceneDeactivationAssertion acquireWithPredicate:v15 transitionContext:0];
    keyboardSuppressionManager = self->_keyboardSuppressionManager;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __84__SBPIPSceneContentContainerAdapter_containerViewController_didUpdateStashProgress___block_invoke_2;
    v14[3] = &unk_1E6AF9A10;
    v14[4] = self;
    __int16 v11 = [(SBKeyboardSuppressionManager *)keyboardSuppressionManager acquireKeyboardSuppressionAssertionWithReason:@"SBSystemNotesKeyboardSuppressionStashed" predicate:v14 displayIdentity:0];
    keyboardSuppressionAssertion = self->_keyboardSuppressionAssertion;
    self->_keyboardSuppressionAssertion = v11;
LABEL_10:

    goto LABEL_11;
  }
  if ([(UIApplicationSceneDeactivationAssertion *)sceneDeactivationAssertion isAcquired]) {
    [(UIApplicationSceneDeactivationAssertion *)self->_sceneDeactivationAssertion relinquish];
  }
  BOOL v13 = self->_keyboardSuppressionAssertion;
  if (v13)
  {
    [(BSInvalidatable *)v13 invalidate];
    keyboardSuppressionAssertion = self->_keyboardSuppressionAssertion;
    self->_keyboardSuppressionAssertion = 0;
    goto LABEL_10;
  }
LABEL_11:
}

uint64_t __84__SBPIPSceneContentContainerAdapter_containerViewController_didUpdateStashProgress___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 _hostedAppSceneHandle];
  BOOL v5 = [v4 sceneIfExists];
  uint64_t v6 = [v5 isEqual:v3];

  return v6;
}

uint64_t __84__SBPIPSceneContentContainerAdapter_containerViewController_didUpdateStashProgress___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 _hostedAppSceneHandle];
  BOOL v5 = [v4 sceneIfExists];
  uint64_t v6 = [v5 isEqual:v3];

  return v6;
}

- (BOOL)isStashTabHiddenForContainerViewController:(id)a3
{
  return [(SBPIPStashableWrapperViewController *)self->_stashableWrappingViewController isStashTabHidden];
}

- (BOOL)stashableWrapper:(id)a3 didReceivedTapGesture:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained setStashed:0];
  char v5 = [WeakRetained isStashed] ^ 1;

  return v5;
}

- (void)invalidate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_invalidated)
  {
    BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBPIPSceneContentContainerAdapter.m" lineNumber:264 description:@"Attempting to -invalidate twice; this is unsupported."];
  }
  BOOL v4 = SBLogPIP();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = _SBFLoggingMethodProem();
    int v14 = 138543362;
    v15 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidating", (uint8_t *)&v14, 0xCu);
  }
  self->_invalidated = 1;
  uint64_t v6 = [(SBPIPSceneContentContainerAdapter *)self _hostedAppSceneHandle];
  id v7 = [v6 sceneIdentifier];
  if (v7)
  {
    id v8 = [v6 application];
    id v9 = SBLogPIP();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v8 bundleIdentifier];
      int v14 = 138543618;
      v15 = v10;
      __int16 v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Removing our sceneIdentifier from %{public}@ dataStore; sceneIdentifier: %{public}@",
        (uint8_t *)&v14,
        0x16u);
    }
    __int16 v11 = [v8 _dataStore];
    [v11 removeSceneStoreForIdentifier:v7];
  }
  [(SBLayoutStateTransitionCoordinator *)self->_transitionCoordinator removeObserver:self];
  [(UIApplicationSceneDeactivationAssertion *)self->_sceneDeactivationAssertion relinquish];
  [(BSInvalidatable *)self->_keyboardSuppressionAssertion invalidate];
  [(BSInvalidatable *)self->_keyboardFocusObserver invalidate];
  keyboardFocusObserver = self->_keyboardFocusObserver;
  self->_keyboardFocusObserver = 0;

  [(BSInvalidatable *)self->_keyboardDismissalParticipantHandle invalidate];
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  keyboardDismissalParticipantHandle = self->_keyboardDismissalParticipantHandle;
  if (keyboardDismissalParticipantHandle)
  {
    [(BSInvalidatable *)keyboardDismissalParticipantHandle invalidate];
    id v8 = self->_keyboardDismissalParticipantHandle;
    self->_keyboardDismissalParticipantHandle = 0;
  }
  if ([(SBPIPSceneContentContainerAdapter *)self _tapInEnvironmentCanDismiss:[(SBPIPSceneContentContainerAdapter *)self _effectiveEnvironmentModeForTransitionContext:v6]])
  {
    id v9 = [(SBKeyboardDismissalManager *)self->_keyboardDismissalManager registerKeyboardDismissalParticipant:self];
    uint64_t v10 = self->_keyboardDismissalParticipantHandle;
    self->_keyboardDismissalParticipantHandle = v9;
  }
}

- (void)sceneHandle:(id)a3 didUpdatePairingStatusForExternalSceneIdentifiers:(id)a4
{
  uint64_t v5 = objc_msgSend(a3, "isPairedWithExternalSceneWithIdentifier:", *MEMORY[0x1E4F71DE8], a4);
  [(SBPIPSceneContentContainerAdapter *)self _updateDisplayLayoutElementKeyboardFocus:v5];
}

- (void)keyboardFocusController:(id)a3 externalSceneDidAcquireFocus:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "identifier", a3);
  id v6 = [(SBPIPSceneContentContainerAdapter *)self _hostedAppSceneHandle];
  id v7 = [v6 sceneIdentifier];
  uint64_t v8 = [v5 isEqual:v7];

  [(SBPIPSceneContentContainerAdapter *)self _updateDisplayLayoutElementKeyboardFocus:v8];
}

- (BOOL)keyboardDismissalManager:(id)a3 shouldPreventDismissalForTouch:(id)a4 inWindow:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(SBPIPSceneContentContainerAdapter *)self _hostedSceneIsPresentingKeyboard]) {
    BOOL v9 = [(SBPIPSceneContentContainerAdapter *)self _hitTestTouch:v7 inWindow:v8];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_hitTestTouch:(id)a3 inWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBPIPSceneContentContainerAdapter *)self containerViewController];
  BOOL v9 = [v8 contentViewController];
  uint64_t v10 = [v9 viewIfLoaded];

  if (v10)
  {
    id v11 = [v7 screen];
    char v12 = [v11 fixedCoordinateSpace];

    BOOL v13 = [v6 view];
    [v6 locationInView:v13];
    objc_msgSend(v7, "convertPoint:toCoordinateSpace:", v12);
    double v15 = v14;
    double v17 = v16;

    objc_msgSend(v10, "convertPoint:fromCoordinateSpace:", v12, v15, v17);
    uint64_t v18 = objc_msgSend(v10, "hitTest:withEvent:", 0);
    BOOL v19 = v18 != 0;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (void)_updateDisplayLayoutElementKeyboardFocus:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__SBPIPSceneContentContainerAdapter__updateDisplayLayoutElementKeyboardFocus___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__SBSDisplayLayoutElement_8l;
  BOOL v6 = a3;
  [WeakRetained updateDisplayLayoutElementWithBuilder:v5];
}

uint64_t __78__SBPIPSceneContentContainerAdapter__updateDisplayLayoutElementKeyboardFocus___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHasKeyboardFocus:*(unsigned __int8 *)(a1 + 32)];
}

- (id)_hostedAppSceneHandle
{
  return (id)[(SBPIPSceneContentProviding *)self->_sceneContentViewController sceneHandle];
}

- (void)_dismissKeyboardIfNecessaryForTransitionContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(SBPIPSceneContentContainerAdapter *)self _effectiveEnvironmentModeForTransitionContext:a3] == 1&& [(SBPIPInteractionSettings *)self->_interactionSettings keyboardDismissesOnTransitionToHomescreen]&& [(SBPIPSceneContentContainerAdapter *)self _hostedSceneIsPresentingKeyboard])
  {
    BOOL v4 = SBLogSystemNotes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = _SBFLoggingMethodProem();
      int v8 = 138543362;
      BOOL v9 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing keyboard for transition to homescreen", (uint8_t *)&v8, 0xCu);
    }
    Class v6 = NSClassFromString(&cfstr_Uikeyboardarbi.isa);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(objc_class *)v6 performSelector:sel_sharedArbiterManager];
    }
    else
    {
      id v7 = 0;
    }
    [v7 forceKeyboardAway];
  }
}

- (int64_t)_effectiveEnvironmentModeForTransitionContext:(id)a3
{
  id v3 = [a3 toLayoutState];
  int64_t v4 = [v3 unlockedEnvironmentMode];

  return v4;
}

- (BOOL)_hostedSceneIsPresentingKeyboard
{
  id v3 = [(SBKeyboardFocusControlling *)self->_keyboardFocusController externalSceneWithFocus];
  int64_t v4 = [v3 identityToken];

  uint64_t v5 = [(SBPIPSceneContentContainerAdapter *)self _hostedAppSceneHandle];
  Class v6 = [v5 sceneIfExists];
  id v7 = [v6 identityToken];

  if ([v7 isEqual:v4]) {
    id v8 = v5;
  }
  else {
    id v8 = 0;
  }

  return v8 != 0;
}

- (BOOL)_tapInEnvironmentCanDismiss:(int64_t)a3
{
  BOOL v5 = [(SBPIPInteractionSettings *)self->_interactionSettings keyboardDismissesOnOutsideUserInteractionOnHomescreen];
  BOOL result = [(SBPIPInteractionSettings *)self->_interactionSettings keyboardDismissesOnOutsideUserInteractionOutsideHomescreen];
  if (a3 == 1 && v5) {
    return 1;
  }
  if (a3 == 1) {
    return 0;
  }
  return result;
}

- (SBPIPSceneContentProviding)sceneContentViewController
{
  return self->_sceneContentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionSettings, 0);
  objc_storeStrong((id *)&self->_transitionCoordinator, 0);
  objc_storeStrong((id *)&self->_keyboardSuppressionManager, 0);
  objc_storeStrong((id *)&self->_keyboardDismissalParticipantHandle, 0);
  objc_storeStrong((id *)&self->_keyboardDismissalManager, 0);
  objc_storeStrong((id *)&self->_keyboardFocusObserver, 0);
  objc_storeStrong((id *)&self->_keyboardFocusController, 0);
  objc_storeStrong((id *)&self->_keyboardArbiterManager, 0);
  objc_storeStrong((id *)&self->_keyboardSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_sceneDeactivationAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneContentViewController, 0);
  objc_storeStrong((id *)&self->_stashableWrappingViewController, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
}

@end