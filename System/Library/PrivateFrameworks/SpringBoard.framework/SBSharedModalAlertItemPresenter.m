@interface SBSharedModalAlertItemPresenter
- (SBAlertItem)currentlyPresentedAlertItem;
- (SBModalViewControllerStack)_modalViewControllerStack;
- (SBSharedModalAlertItemPresenter)initWithLockOutProvider:(id)a3 systemGestureManager:(id)a4 reachabilityManager:(id)a5 alertLayoutPresentationVerifier:(id)a6 windowScene:(id)a7;
- (SBSharedModalAlertItemPresenter)initWithLockOutProvider:(id)a3 systemGestureManager:(id)a4 reachabilityManager:(id)a5 alertLayoutPresentationVerifier:(id)a6 windowScene:(id)a7 enableGestures:(BOOL)a8;
- (SBWindowScene)windowScene;
- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4;
- (void)_performActionForAlertController:(id)a3 invokeActionBlock:(id)a4 dismissControllerBlock:(id)a5;
- (void)_setModalViewControllerStack:(id)a3;
- (void)_updateBarSwipeViewWithAlertController:(id)a3;
- (void)_updateHomeGestureParticipant;
- (void)alertControllerDidDisappear:(id)a3;
- (void)dealloc;
- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)handleReachabilityYOffsetDidChange;
- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3;
- (void)homeGrabberViewDidReceiveClick:(id)a3;
- (void)invalidate;
- (void)modalViewControllerStack:(id)a3 didDismissViewController:(id)a4;
- (void)modalViewControllerStack:(id)a3 didPresentViewController:(id)a4;
- (void)modalViewControllerStack:(id)a3 willDismissViewController:(id)a4 animated:(BOOL)a5;
- (void)modalViewControllerStack:(id)a3 willPresentViewController:(id)a4;
- (void)presentAlertItem:(id)a3 isLocked:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBSharedModalAlertItemPresenter

- (SBSharedModalAlertItemPresenter)initWithLockOutProvider:(id)a3 systemGestureManager:(id)a4 reachabilityManager:(id)a5 alertLayoutPresentationVerifier:(id)a6 windowScene:(id)a7
{
  return [(SBSharedModalAlertItemPresenter *)self initWithLockOutProvider:a3 systemGestureManager:a4 reachabilityManager:a5 alertLayoutPresentationVerifier:a6 windowScene:a7 enableGestures:1];
}

- (SBSharedModalAlertItemPresenter)initWithLockOutProvider:(id)a3 systemGestureManager:(id)a4 reachabilityManager:(id)a5 alertLayoutPresentationVerifier:(id)a6 windowScene:(id)a7 enableGestures:(BOOL)a8
{
  BOOL v8 = a8;
  id v39 = a3;
  id v15 = a4;
  id v38 = a5;
  id v16 = a6;
  id v17 = a7;
  v40.receiver = self;
  v40.super_class = (Class)SBSharedModalAlertItemPresenter;
  v18 = [(SBSharedModalAlertItemPresenter *)&v40 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_lockOutProvider, a3);
    objc_storeStrong((id *)&v19->_systemGestureManager, a4);
    uint64_t v20 = objc_msgSend(v17, "zStackResolver", v38, v39);
    zStackResolver = v19->_zStackResolver;
    v19->_zStackResolver = (SBFZStackResolver *)v20;

    int v22 = SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleAlert");
    v23 = off_1E6AECC18;
    if (!v22) {
      v23 = off_1E6AEF5C8;
    }
    uint64_t v24 = [objc_alloc(*v23) initWithWindowScene:v17 role:@"SBTraitsParticipantRoleAlert" debugName:@"SBAlertItemWindow" alertLayoutPresentationVerifier:v16];
    window = v19->_window;
    v19->_window = (SBWindow *)v24;

    [(SBWindow *)v19->_window setOpaque:0];
    v26 = v19->_window;
    v27 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBWindow *)v26 setBackgroundColor:v27];

    [(SBWindow *)v19->_window setWindowLevel:*MEMORY[0x1E4F43F18]];
    [(SBWindow *)v19->_window setHidden:1];
    objc_storeStrong((id *)&v19->_alertLayoutPresentationVerifier, a6);
    [v16 setAlertItemWindow:v19->_window];
    [v16 setAlertPresenter:v19];
    objc_storeStrong((id *)&v19->_reachabilityManager, a5);
    [(SBReachabilityManager *)v19->_reachabilityManager addObserver:v19];
    v28 = [SBBarSwipeAffordanceView alloc];
    [(SBWindow *)v19->_window bounds];
    v29 = -[SBBarSwipeAffordanceView initWithFrame:systemGestureManager:enableGestures:](v28, "initWithFrame:systemGestureManager:enableGestures:", v15, v8);
    [(SBBarSwipeAffordanceView *)v29 setAutoresizingMask:18];
    [(SBBarSwipeAffordanceView *)v29 setDelegate:v19];
    [(SBBarSwipeAffordanceView *)v29 setPointerClickDelegate:v19];
    [(SBBarSwipeAffordanceView *)v29 addObserver:v19];
    [(SBBarSwipeAffordanceView *)v29 setActive:0];
    [(SBBarSwipeAffordanceView *)v29 setUserInteractionEnabled:0];
    [(SBWindow *)v19->_window addSubview:v29];
    v30 = [(SBBarSwipeAffordanceView *)v29 layer];
    [v30 setZPosition:1.0];

    barSwipeView = v19->_barSwipeView;
    v19->_barSwipeView = v29;
    v32 = v29;

    v33 = [SBModalViewControllerStack alloc];
    v34 = [(SBWindow *)v19->_window rootViewController];
    uint64_t v35 = [(SBModalViewControllerStack *)v33 initWithPresentingViewController:v34];
    modalViewControllerStack = v19->_modalViewControllerStack;
    v19->_modalViewControllerStack = (SBModalViewControllerStack *)v35;

    [(SBModalViewControllerStack *)v19->_modalViewControllerStack setDelegate:v19];
  }

  return v19;
}

- (void)dealloc
{
  [(SBReachabilityManager *)self->_reachabilityManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBSharedModalAlertItemPresenter;
  [(SBSharedModalAlertItemPresenter *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(SBModalViewControllerStack *)self->_modalViewControllerStack viewControllers];
  objc_super v3 = objc_msgSend(v2, "bs_map:", &__block_literal_global_213);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
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
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "deactivateForReason:", 4, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

uint64_t __45__SBSharedModalAlertItemPresenter_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 alertItem];
}

- (SBWindowScene)windowScene
{
  return [(UIWindow *)self->_window _sbWindowScene];
}

- (SBAlertItem)currentlyPresentedAlertItem
{
  v2 = [(SBModalViewControllerStack *)self->_modalViewControllerStack topViewController];
  objc_super v3 = [v2 alertItem];

  return (SBAlertItem *)v3;
}

- (void)presentAlertItem:(id)a3 isLocked:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a6;
  BSDispatchQueueAssertMain();
  if (!v11)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBSharedModalAlertItemPresenter.m", 266, @"Invalid parameter not satisfying: %@", @"alertItem" object file lineNumber description];
  }
  v13 = objc_msgSend(v11, "_prepareNewAlertControllerWithLockedState:requirePasscodeForActions:", v8, -[SBFLockOutStatusProvider isLockedOut](self->_lockOutProvider, "isLockedOut"));
  if (!v13)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBSharedModalAlertItemPresenter.m", 270, @"Attempt to present an alert item without an alertController - alertItem: %@", v11 object file lineNumber description];
  }
  [v13 setCoordinatedActionPerformingDelegate:self];
  modalViewControllerStack = self->_modalViewControllerStack;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__SBSharedModalAlertItemPresenter_presentAlertItem_isLocked_animated_completion___block_invoke;
  v18[3] = &unk_1E6AF5A50;
  id v19 = v12;
  id v15 = v12;
  [(SBModalViewControllerStack *)modalViewControllerStack addViewController:v13 animated:v7 completion:v18];
}

uint64_t __81__SBSharedModalAlertItemPresenter_presentAlertItem_isLocked_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  BSDispatchQueueAssertMain();
  if (!v9)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBSharedModalAlertItemPresenter.m", 283, @"Invalid parameter not satisfying: %@", @"alertItem" object file lineNumber description];
  }
  id v11 = [v9 _alertController];
  if (!v11)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBSharedModalAlertItemPresenter.m", 287, @"Attempting to dismiss an alert item without an alertController - alertItem: %@", v9 object file lineNumber description];
  }
  modalViewControllerStack = self->_modalViewControllerStack;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__SBSharedModalAlertItemPresenter_dismissAlertItem_animated_completion___block_invoke;
  v17[3] = &unk_1E6AF5AA0;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  [(SBModalViewControllerStack *)modalViewControllerStack removeViewController:v11 animated:v6 completion:v17];
}

uint64_t __72__SBSharedModalAlertItemPresenter_dismissAlertItem_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) doCleanupAfterDeactivationAnimation];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    objc_super v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)modalViewControllerStack:(id)a3 willPresentViewController:(id)a4
{
  -[SBWindow setHidden:](self->_window, "setHidden:", 0, a4);
  [(SBFWindow *)self->_window makeKeyWindow];
  [(SBSharedModalAlertItemPresenter *)self _updateHomeGestureParticipant];
}

- (void)modalViewControllerStack:(id)a3 didPresentViewController:(id)a4
{
  id v5 = a4;
  [v5 setAlertControllerDelegate:self];
  id v6 = [v5 alertItem];
  [v6 _setPresented:1];
  [(SBSharedModalAlertItemPresenter *)self _updateBarSwipeViewWithAlertController:v5];

  [(SBAlertLayoutPresentationVerifier *)self->_alertLayoutPresentationVerifier scheduleAlertLayoutVerificationForReason:@"didPresent alertController"];
}

- (void)modalViewControllerStack:(id)a3 willDismissViewController:(id)a4 animated:(BOOL)a5
{
  id v11 = a4;
  alertLayoutPresentationVerifier = self->_alertLayoutPresentationVerifier;
  id v9 = a3;
  [(SBAlertLayoutPresentationVerifier *)alertLayoutPresentationVerifier scheduleAlertLayoutVerificationForReason:@"willDismiss alertController"];
  [v11 setAlertControllerDelegate:0];
  [(SBSharedModalAlertItemPresenter *)self _updateHomeGestureParticipant];
  id v10 = [v9 topViewController];

  [(SBSharedModalAlertItemPresenter *)self _updateBarSwipeViewWithAlertController:v10];
  if (!v10 && !a5)
  {
    [(SBFWindow *)self->_window resignAsKeyWindow];
    [(SBWindow *)self->_window setHidden:1];
  }
}

- (void)modalViewControllerStack:(id)a3 didDismissViewController:(id)a4
{
  id v5 = objc_msgSend(a4, "alertItem", a3);
  [v5 _setPresented:0];

  id v6 = [(SBModalViewControllerStack *)self->_modalViewControllerStack topViewController];

  if (!v6)
  {
    [(SBFWindow *)self->_window resignAsKeyWindow];
    [(SBWindow *)self->_window setHidden:1];
    [(SBSharedModalAlertItemPresenter *)self _updateHomeGestureParticipant];
  }
}

- (void)_performActionForAlertController:(id)a3 invokeActionBlock:(id)a4 dismissControllerBlock:(id)a5
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)alertControllerDidDisappear:(id)a3
{
  id v9 = a3;
  id v5 = [(SBModalViewControllerStack *)self->_modalViewControllerStack viewControllers];
  int v6 = [v5 containsObject:v9];

  if (v6)
  {
    BOOL v7 = [v9 alertItem];
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBSharedModalAlertItemPresenter.m", 384, @"Unexpectedly dismissed alert controller (%@), please file a radar to PEP SpringBoard about this bad citizen: %@", v9, v7 object file lineNumber description];
  }
}

- (void)handleReachabilityYOffsetDidChange
{
  [(SBReachabilityManager *)self->_reachabilityManager effectiveReachabilityYOffset];
  window = self->_window;
  CGAffineTransformMakeTranslation(&v5, 0.0, v4 * -0.5);
  [(SBWindow *)window setTransform:&v5];
}

- (void)_updateHomeGestureParticipant
{
  objc_super v3 = [(SBModalViewControllerStack *)self->_modalViewControllerStack topViewController];

  zStackParticipant = self->_zStackParticipant;
  if (v3) {
    BOOL v5 = zStackParticipant == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    BOOL v7 = [(SBFZStackResolver *)self->_zStackResolver acquireParticipantWithIdentifier:24 delegate:self];
    BOOL v8 = self->_zStackParticipant;
    self->_zStackParticipant = v7;

    id v9 = self->_zStackParticipant;
    [(SBSharedModalAlertItemPresenter *)self zStackParticipantDidChange:v9];
  }
  else
  {
    if (zStackParticipant) {
      BOOL v6 = v3 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      [(SBFZStackParticipant *)zStackParticipant invalidate];
      id v10 = self->_zStackParticipant;
      self->_zStackParticipant = 0;
    }
  }
}

- (void)_updateBarSwipeViewWithAlertController:(id)a3
{
  id v6 = a3;
  barSwipeView = self->_barSwipeView;
  if ([(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture])
  {
    BOOL v5 = [v6 alertItem];
    -[SBBarSwipeAffordanceView setActive:](barSwipeView, "setActive:", [v5 allowMenuButtonDismissal]);
  }
  else
  {
    [(SBBarSwipeAffordanceView *)barSwipeView setActive:0];
  }
}

- (void)zStackParticipantDidChange:(id)a3
{
  id v4 = [(SBModalViewControllerStack *)self->_modalViewControllerStack topViewController];
  [(SBSharedModalAlertItemPresenter *)self _updateBarSwipeViewWithAlertController:v4];
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1D8FD1DE0[a4 - 1];
  }
}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
  id v3 = [(SBSharedModalAlertItemPresenter *)self currentlyPresentedAlertItem];
  [v3 deactivate];
}

- (void)homeGrabberViewDidReceiveClick:(id)a3
{
  id v4 = a3;
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant)
  {
    id v8 = v4;
    int v6 = [(SBFZStackParticipant *)zStackParticipant ownsHomeGesture];
    id v4 = v8;
    if (v6)
    {
      BOOL v7 = [(SBSharedModalAlertItemPresenter *)self currentlyPresentedAlertItem];
      [v7 deactivate];

      id v4 = v8;
    }
  }
}

- (SBModalViewControllerStack)_modalViewControllerStack
{
  return self->_modalViewControllerStack;
}

- (void)_setModalViewControllerStack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_modalViewControllerStack, 0);
  objc_storeStrong((id *)&self->_barSwipeView, 0);
  objc_storeStrong((id *)&self->_alertLayoutPresentationVerifier, 0);
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_zStackResolver, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_lockOutProvider, 0);
}

@end