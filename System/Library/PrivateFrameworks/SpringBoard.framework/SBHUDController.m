@interface SBHUDController
+ (id)_defaultCrossfadeAnimatorForHUDController:(id)a3;
- (BOOL)anyHUDsVisible;
- (NSString)description;
- (SBFZStackParticipant)zStackParticipant;
- (SBHUDController)init;
- (SBHUDSettings)settings;
- (SBWindowScene)windowScene;
- (UIWindow)HUDWindow;
- (_SBHUDHostViewController)hudViewController;
- (id)HUDSessionForViewController:(id)a3 identifier:(id)a4;
- (id)acquireHUDHiddenAssertionForIdentifier:(id)a3 withReason:(id)a4;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)knownHUDControllerForIdentifier:(id)a3;
- (id)knownHUDs;
- (id)presentedHUDControllerForIdentifier:(id)a3;
- (id)presentedHUDs;
- (id)presentingHUDs;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_createHUDWindowIfNeeded;
- (void)_dismissHUD:(id)a3 animated:(BOOL)a4;
- (void)_finishedTransitionForHUD:(id)a3 intendedState:(int64_t)a4 finalState:(int64_t)a5;
- (void)_hideWindowIfPossible;
- (void)_notificationFiredToDismissHUDs:(id)a3;
- (void)_presentHUD:(id)a3 animated:(BOOL)a4;
- (void)_setupStateCapture;
- (void)_tearDown;
- (void)dealloc;
- (void)dismissHUDs:(BOOL)a3;
- (void)hudViewController:(id)a3 didDismissHUD:(id)a4;
- (void)hudViewController:(id)a3 didPresentHUD:(id)a4;
- (void)hudViewController:(id)a3 willDismissHUD:(id)a4;
- (void)hudViewController:(id)a3 willPresentHUD:(id)a4;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)windowSceneDidConnect:(id)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBHUDController

- (id)presentedHUDControllerForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SBHUDController *)self presentedHUDs];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__SBHUDController_presentedHUDControllerForIdentifier___block_invoke;
  v10[3] = &unk_1E6B00290;
  id v11 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "bs_filter:", v10);
  v8 = [v7 anyObject];

  return v8;
}

- (id)presentedHUDs
{
  v2 = [(SBHUDController *)self hudViewController];
  v3 = v2;
  if (v2) {
    v2 = (void *)v2[123];
  }
  id v4 = v2;

  return v4;
}

- (_SBHUDHostViewController)hudViewController
{
  return self->_hudViewController;
}

- (SBHUDController)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBHUDController;
  v2 = [(SBHUDController *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[SBHUDDomain rootSettings];
    settings = v2->_settings;
    v2->_settings = (SBHUDSettings *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28BD0] set];
    hudHiddenAssertions = v2->_hudHiddenAssertions;
    v2->_hudHiddenAssertions = (NSCountedSet *)v5;

    [(PTSettings *)v2->_settings addKeyObserver:v2];
    [(SBHUDController *)v2 _setupStateCapture];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__notificationFiredToDismissHUDs_ name:*MEMORY[0x1E4FA7A10] object:0];
    [v7 addObserver:v2 selector:sel__notificationFiredToDismissHUDs_ name:@"SBLockScreenUIRelockedNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  [(SBHUDController *)self _tearDown];
  v3.receiver = self;
  v3.super_class = (Class)SBHUDController;
  [(SBHUDController *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)[(SBHUDController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHUDController *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBHUDController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_windowScene withName:@"windowScene"];
  id v6 = (id)[v4 appendObject:self->_settings withName:@"settings"];
  id v7 = (id)[v4 appendObject:self->_hudHiddenAssertions withName:@"hudHiddenAssertions"];
  id v8 = (id)[v4 appendPointer:self->_hudViewController withName:@"hudViewController"];
  objc_super v9 = [(SBHUDController *)self presentedHUDs];
  uint64_t v10 = [v9 allObjects];
  id v11 = (void *)v10;
  uint64_t v12 = MEMORY[0x1E4F1CBF0];
  if (v10) {
    uint64_t v13 = v10;
  }
  else {
    uint64_t v13 = MEMORY[0x1E4F1CBF0];
  }
  [v4 appendArraySection:v13 withName:@"presentedHUDs" skipIfEmpty:1];

  v14 = [(SBHUDController *)self knownHUDs];
  uint64_t v15 = [v14 allObjects];
  v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = v12;
  }
  [v4 appendArraySection:v17 withName:@"knownHUDs" skipIfEmpty:1];

  return v4;
}

- (void)_setupStateCapture
{
  if (!self->_stateCaptureHandle)
  {
    objc_initWeak(&location, self);
    id v3 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v6, &location);
    BSLogAddStateCaptureBlockWithTitle();
    id v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    stateCaptureHandle = self->_stateCaptureHandle;
    self->_stateCaptureHandle = v4;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

id __37__SBHUDController__setupStateCapture__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

- (id)presentingHUDs
{
  v2 = [(SBHUDController *)self hudViewController];
  id v3 = v2;
  if (v2) {
    v2 = (void *)v2[124];
  }
  id v4 = v2;

  return v4;
}

- (id)knownHUDs
{
  id v3 = [(SBHUDController *)self presentedHUDs];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v5 = [(SBHUDController *)self presentingHUDs];
  if (v5)
  {
    id v6 = [v4 setByAddingObjectsFromSet:v5];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CAD0] set];
    id v6 = [v4 setByAddingObjectsFromSet:v7];
  }
  if (!v3) {

  }
  return v6;
}

- (BOOL)anyHUDsVisible
{
  v2 = [(SBHUDController *)self presentedHUDs];
  id v3 = objc_msgSend(v2, "bs_filter:", &__block_literal_global_133);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

uint64_t __33__SBHUDController_anyHUDsVisible__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isVisible];
}

uint64_t __55__SBHUDController_presentedHUDControllerForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)knownHUDControllerForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHUDController *)self knownHUDs];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__SBHUDController_knownHUDControllerForIdentifier___block_invoke;
  v10[3] = &unk_1E6B00290;
  id v11 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "bs_filter:", v10);
  id v8 = [v7 anyObject];

  return v8;
}

uint64_t __51__SBHUDController_knownHUDControllerForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)HUDSessionForViewController:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBHUDController *)self knownHUDControllerForIdentifier:v6];
  objc_super v9 = +[_SBHUDModel HUDModelForController:self viewController:v7 identifier:v6];

  if ([v8 isEqual:v9]) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v9;
  }
  id v11 = v10;

  return v11;
}

- (id)acquireHUDHiddenAssertionForIdentifier:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = (objc_class *)MEMORY[0x1E4F4F838];
  id v8 = a4;
  id v9 = [v7 alloc];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __69__SBHUDController_acquireHUDHiddenAssertionForIdentifier_withReason___block_invoke;
  uint64_t v17 = &unk_1E6AFD050;
  v18 = self;
  id v19 = v6;
  id v10 = v6;
  id v11 = (void *)[v9 initWithIdentifier:v10 forReason:v8 invalidationBlock:&v14];

  -[NSCountedSet addObject:](self->_hudHiddenAssertions, "addObject:", v10, v14, v15, v16, v17, v18);
  uint64_t v12 = [(SBHUDController *)self knownHUDControllerForIdentifier:v10];
  [v12 dismissAnimated:0];

  return v11;
}

uint64_t __69__SBHUDController_acquireHUDHiddenAssertionForIdentifier_withReason___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

- (void)dismissHUDs:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(SBHUDController *)self knownHUDs];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) dismissAnimated:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_presentHUD:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  hudHiddenAssertions = self->_hudHiddenAssertions;
  uint64_t v8 = [v6 identifier];
  uint64_t v9 = [(NSCountedSet *)hudHiddenAssertions countForObject:v8];

  if (v9)
  {
    long long v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = [v6 identifier];
      long long v12 = @"s";
      *(_DWORD *)buf = 138412802;
      v18 = v11;
      if (v9 == 1) {
        long long v12 = &stru_1F3084718;
      }
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[SBHUDController] ignoring request to present HUD with identifier '%@' due to %lu outstanding assertion%@", buf, 0x20u);
    }
    goto LABEL_18;
  }
  uint64_t v13 = [(SBHUDController *)self windowScene];

  if (v13)
  {
    [(SBHUDController *)self _createHUDWindowIfNeeded];
    long long v10 = [(SBHUDController *)self HUDWindow];
    if ([v10 isHidden]) {
      [v10 makeKeyAndVisible];
    }
    uint64_t v14 = [(SBHUDController *)self hudViewController];
    if (-[_SBHUDHostViewController isHUDBeingDismissed:](v14, (uint64_t)v6))
    {
      -[_SBHUDHostViewController reverseHUDDismissal:](v14, (uint64_t)v6);
    }
    else if (([v6 isPresented] & 1) != 0 || objc_msgSend(v6, "isPresenting"))
    {
      [v6 rescheduleDismissalTimer];
      goto LABEL_17;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __40__SBHUDController__presentHUD_animated___block_invoke;
    v15[3] = &unk_1E6B002B8;
    v15[4] = self;
    id v16 = v6;
    -[_SBHUDHostViewController presentHUD:animated:completion:](v14, v16, v4, v15);

LABEL_17:
    goto LABEL_18;
  }
  long long v10 = SBLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[SBHUDController _presentHUD:animated:](v6, v10);
  }
LABEL_18:
}

uint64_t __40__SBHUDController__presentHUD_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _finishedTransitionForHUD:*(void *)(a1 + 40) intendedState:0 finalState:a2];
}

- (void)_dismissHUD:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(SBHUDController *)self hudViewController];
  uint64_t v8 = v7;
  if (v7
    && ([v7 _transitionContextMatchingHUD:v6 withinContainer:v7[126]],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    -[_SBHUDHostViewController reverseHUDPresentation:](v8, (uint64_t)v6);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__SBHUDController__dismissHUD_animated___block_invoke;
    v10[3] = &unk_1E6B002B8;
    void v10[4] = self;
    id v11 = v6;
    -[_SBHUDHostViewController dismissHUD:animated:completion:](v8, v11, v4, v10);
  }
}

uint64_t __40__SBHUDController__dismissHUD_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _finishedTransitionForHUD:*(void *)(a1 + 40) intendedState:1 finalState:a2];
}

- (void)_finishedTransitionForHUD:(id)a3 intendedState:(int64_t)a4 finalState:(int64_t)a5
{
  id v8 = a3;
  if (a5 != a4) {
    [v8 invalidateDismissalTimer];
  }
  if (!a5) {
    [v8 rescheduleDismissalTimer];
  }
  [(SBFZStackParticipant *)self->_zStackParticipant setNeedsUpdatePreferencesWithReason:@"SBHUDController finishedTransitionForHUD"];
  [(SBHUDController *)self _hideWindowIfPossible];
}

- (void)windowSceneDidConnect:(id)a3
{
  objc_storeStrong((id *)&self->_windowScene, a3);
  id v5 = a3;
  id v8 = [v5 zStackResolver];
  id v6 = [v8 acquireParticipantWithIdentifier:18 delegate:self];
  zStackParticipant = self->_zStackParticipant;
  self->_zStackParticipant = v6;
}

- (void)_createHUDWindowIfNeeded
{
  id v9 = [(SBHUDController *)self windowScene];
  if (!v9)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBHUDController.m" lineNumber:346 description:@"windowScene cannot be nil"];
  }
  BOOL v4 = [(SBHUDController *)self HUDWindow];
  if (!v4)
  {
    id v5 = (_SBHUDHostViewController *)-[_SBHUDHostViewController initWithHUDController:]([_SBHUDHostViewController alloc], self);
    hudViewController = self->_hudViewController;
    self->_hudViewController = v5;

    uint64_t v7 = self->_hudViewController;
    if (v7) {
      objc_storeWeak((id *)&v7->_delegate, self);
    }
    BOOL v4 = [(SBFTouchPassThroughWindow *)[SBHUDWindow alloc] initWithWindowScene:v9 role:@"SBTraitsParticipantRoleHUD" debugName:@"HUDWindow"];
    [(SBHUDWindow *)v4 setRootViewController:self->_hudViewController];
    [(SBHUDWindow *)v4 setOpaque:0];
    [(SBHUDWindow *)v4 setWindowLevel:*MEMORY[0x1E4F43958]];
    objc_storeStrong((id *)&self->_HUDWindow, v4);
  }
}

- (void)_hideWindowIfPossible
{
  id v8 = [(SBHUDController *)self presentedHUDs];
  if (![v8 count])
  {

LABEL_6:
    HUDWindow = self->_HUDWindow;
    [(UIWindow *)HUDWindow setHidden:1];
    return;
  }
  uint64_t v3 = [(SBHUDController *)self hudViewController];
  if (v3)
  {
    BOOL v4 = (id *)v3;
    uint64_t v5 = [*(id *)(v3 + 1008) count];
    uint64_t v6 = [v4[127] count];

    if (!(v6 + v5)) {
      return;
    }
    goto LABEL_6;
  }
}

- (void)_tearDown
{
  hudViewController = self->_hudViewController;
  if (hudViewController)
  {
    objc_storeWeak((id *)&hudViewController->_delegate, 0);
    hudViewController = self->_hudViewController;
  }
  self->_hudViewController = 0;

  [(UIWindow *)self->_HUDWindow setHidden:1];
  HUDWindow = self->_HUDWindow;
  self->_HUDWindow = 0;

  [(BSInvalidatable *)self->_stateCaptureHandle invalidate];
  stateCaptureHandle = self->_stateCaptureHandle;
  self->_stateCaptureHandle = 0;
}

- (void)_notificationFiredToDismissHUDs:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[SBHUDController] Dismissing all HUDs because of notification: %@", (uint8_t *)&v6, 0xCu);
  }

  [(SBHUDController *)self dismissHUDs:1];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__45;
  uint64_t v14 = __Block_byref_object_dispose__45;
  id v15 = 0;
  uint64_t v8 = [(SBHUDController *)self presentedHUDs];
  if ([v8 count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__SBHUDController_zStackParticipant_updatePreferences___block_invoke;
    v9[3] = &unk_1E6B002E0;
    v9[4] = &v10;
    [v8 enumerateObjectsUsingBlock:v9];
  }
  [v7 setPhysicalButtonSceneTargets:v11[5]];

  _Block_object_dispose(&v10, 8);
}

void __55__SBHUDController_zStackParticipant_updatePreferences___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 HUDViewController];
  uint64_t v9 = [v3 physicalButtonSceneTargets];

  id v4 = (void *)v9;
  if (v9)
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v5 addObjectsFromArray:v9];
    id v4 = (void *)v9;
  }
}

- (void)hudViewController:(id)a3 willDismissHUD:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (objc_opt_respondsToSelector()) {
    [v5 hudViewController:v7 willDismissHUD:v5];
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"SBHUDControllerWillDismissHUDNotificationName" object:v5];
}

- (void)hudViewController:(id)a3 didDismissHUD:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [v6 hudViewController:v8 didDismissHUD:v6];
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"SBHUDControllerDidDismissHUDNotificationName" object:v6];

  [(SBHUDController *)self _hideWindowIfPossible];
}

- (void)hudViewController:(id)a3 didPresentHUD:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (objc_opt_respondsToSelector()) {
    [v5 hudViewController:v7 didPresentHUD:v5];
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"SBHUDControllerDidPresentHUDNotificationName" object:v5];
}

- (void)hudViewController:(id)a3 willPresentHUD:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (objc_opt_respondsToSelector()) {
    [v5 hudViewController:v7 willPresentHUD:v5];
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"SBHUDControllerWillPresentHUDNotificationName" object:v5];
}

+ (id)_defaultCrossfadeAnimatorForHUDController:(id)a3
{
  id v3 = a3;
  id v4 = [SBUIAnimationPropertyAnimator alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke;
  v8[3] = &unk_1E6B00358;
  id v9 = v3;
  id v5 = v3;
  id v6 = [(SBUIAnimationPropertyAnimator *)v4 initWithPropertyAnimatorGenerator:v8];

  return v6;
}

id __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 viewControllerForKey:*MEMORY[0x1E4F43EB0]];
  id v5 = [v3 viewControllerForKey:*MEMORY[0x1E4F43EC0]];
  id v6 = [*(id *)(a1 + 32) settings];
  [v6 defaultHUDPresentationAnimationDuration];
  double v8 = v7;

  id v9 = [v4 view];
  uint64_t v10 = [v5 view];
  id v11 = [v3 containerView];
  uint64_t v12 = (void *)MEMORY[0x1E4F42FF0];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke_2;
  v34[3] = &unk_1E6B00308;
  id v13 = v9;
  id v35 = v13;
  id v14 = v3;
  id v36 = v14;
  id v37 = v4;
  id v15 = v10;
  id v38 = v15;
  id v39 = v5;
  id v40 = v11;
  id v16 = v11;
  id v17 = v5;
  id v18 = v4;
  [v12 performWithoutAnimation:v34];
  id v19 = objc_alloc(MEMORY[0x1E4F43008]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke_3;
  v31[3] = &unk_1E6AF5290;
  id v20 = v13;
  id v32 = v20;
  id v21 = v15;
  id v33 = v21;
  v22 = (void *)[v19 initWithDuration:0 curve:v31 animations:v8];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke_4;
  v27[3] = &unk_1E6B00330;
  id v28 = v20;
  id v29 = v21;
  id v30 = v14;
  id v23 = v14;
  id v24 = v21;
  id v25 = v20;
  [v22 addCompletion:v27];

  return v22;
}

uint64_t __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) initialFrameForViewController:*(void *)(a1 + 48)];
  objc_msgSend(v2, "setFrame:");
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v3 = *(void **)(a1 + 56);
  [*(id *)(a1 + 40) initialFrameForViewController:*(void *)(a1 + 64)];
  objc_msgSend(v3, "setFrame:");
  [*(id *)(a1 + 56) setAlpha:0.0];
  id v4 = *(void **)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v4 addSubview:v5];
}

uint64_t __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

uint64_t __61__SBHUDController__defaultCrossfadeAnimatorForHUDController___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (a2 == 1)
    {
      [*(id *)(a1 + 32) setAlpha:1.0];
      [*(id *)(a1 + 40) setAlpha:0.0];
      [*(id *)(a1 + 40) removeFromSuperview];
    }
  }
  else
  {
    [*(id *)(a1 + 32) removeFromSuperview];
    [*(id *)(a1 + 40) setAlpha:1.0];
  }
  id v3 = *(void **)(a1 + 48);
  uint64_t v4 = [v3 transitionWasCancelled] ^ 1;
  return [v3 completeTransition:v4];
}

- (id)animationControllerForDismissedController:(id)a3
{
  uint64_t v4 = objc_opt_class();
  return (id)[v4 _defaultCrossfadeAnimatorForHUDController:self];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6 = objc_opt_class();
  return (id)[v6 _defaultCrossfadeAnimatorForHUDController:self];
}

- (SBWindowScene)windowScene
{
  return self->_windowScene;
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (UIWindow)HUDWindow
{
  return self->_HUDWindow;
}

- (SBHUDSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_hudViewController, 0);
  objc_storeStrong((id *)&self->_HUDWindow, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_hudHiddenAssertions, 0);
}

- (void)_presentHUD:(void *)a1 animated:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 identifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "[SBHUDController] ignoring request to present HUD with identifier '%@' due to windowScene being nil", (uint8_t *)&v4, 0xCu);
}

@end