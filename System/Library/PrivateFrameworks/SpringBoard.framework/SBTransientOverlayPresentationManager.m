@interface SBTransientOverlayPresentationManager
- (BOOL)activePresentationPreventsDragAndDrop;
- (BOOL)canActivePresentationBecomeFirstResponder;
- (BOOL)canActivePresentationBecomeLocalFirstResponder;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)hasActivePresentation;
- (BOOL)hasActivePresentationForWindowScene:(id)a3;
- (BOOL)hasActivePresentationFromBundleIdentifier:(id)a3;
- (BOOL)hasActivePresentationFromProcess:(id)a3;
- (BOOL)hasActiveSpotlightPresentation;
- (BOOL)hasIdleTimerBehaviors;
- (BOOL)hasPresentationAboveWindowLevel:(double)a3;
- (BOOL)isPresentingViewController:(id)a3;
- (BOOL)isTopmostPresentationFromSceneWithIdentityTokenString:(id)a3;
- (BOOL)isTopmostPresentedViewController:(id)a3;
- (BOOL)prefersStatusBarActivityItemVisible;
- (BOOL)shouldDisableControlCenter;
- (BOOL)shouldDisableCoverSheetGesture;
- (BOOL)shouldDisableSiri;
- (BOOL)shouldUseSceneBasedKeyboardFocusForActivePresentation;
- (SBBannerManager)bannerManager;
- (SBCoverSheetPresentationManager)coverSheetPresentationManager;
- (SBIdleTimerCoordinating)idleTimerCoordinator;
- (SBTransientOverlayPresentationManager)initWithWindowSceneManager:(id)a3 alertItemsController:(id)a4 lockStateAggregator:(id)a5 reachabilityManager:(id)a6;
- (SBTransientOverlayScenePresenterDelegate)presenterDelegate;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)defaultDisplayConfigurationForTransientOverlayPresentation;
- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5;
- (id)keyboardFocusTargetForSBWindowScene:(id)a3;
- (id)topmostPresentedViewController;
- (id)transientOverlayPresenterForWindowScene:(id)a3;
- (int64_t)presentedViewControllerCount;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)performDismissalRequest:(id)a3;
- (void)performPresentationRequest:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setBannerManager:(id)a3;
- (void)setCoverSheetPresentationManager:(id)a3;
- (void)setIdleTimerCoordinator:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)transientOverlayScenePresenter:(id)a3 didDismissViewController:(id)a4 wasTopmostPresentation:(BOOL)a5;
- (void)transientOverlayScenePresenter:(id)a3 willPresentViewController:(id)a4;
- (void)windowSceneDidConnect:(id)a3;
- (void)windowSceneDidDisconnect:(id)a3;
@end

@implementation SBTransientOverlayPresentationManager

- (id)transientOverlayPresenterForWindowScene:(id)a3
{
  return [(NSMapTable *)self->_presentersByWindowScene objectForKey:a3];
}

- (BOOL)hasIdleTimerBehaviors
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) hasIdleTimerBehaviors])
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

- (BOOL)hasActivePresentation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) hasActivePresentation])
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

- (SBTransientOverlayPresentationManager)initWithWindowSceneManager:(id)a3 alertItemsController:(id)a4 lockStateAggregator:(id)a5 reachabilityManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBTransientOverlayPresentationManager;
  v15 = [(SBTransientOverlayPresentationManager *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_windowSceneManager, a3);
    objc_storeStrong((id *)&v16->_alertItemsController, a4);
    objc_storeStrong((id *)&v16->_lockStateAggregator, a5);
    objc_storeStrong((id *)&v16->_reachabilityManager, a6);
    v17 = [[SBIdleTimerCoordinatorHelper alloc] initWithSourceProvider:v16];
    idleTimerCoordinatorHelper = v16->_idleTimerCoordinatorHelper;
    v16->_idleTimerCoordinatorHelper = v17;
  }
  return v16;
}

- (void)dealloc
{
  [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper removeProvider:self];
  v3.receiver = self;
  v3.super_class = (Class)SBTransientOverlayPresentationManager;
  [(SBTransientOverlayPresentationManager *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        long long v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        long long v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      [(NSHashTable *)observers addObject:v9];
      id v4 = v9;
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  if (v5) {
    [(NSHashTable *)self->_observers removeObject:v5];
  }
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (void)setCoverSheetPresentationManager:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_coverSheetPresentationManager, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setCoverSheetPresentationManager:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  return [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper targetCoordinator];
}

- (void)setIdleTimerCoordinator:(id)a3
{
}

- (BOOL)shouldDisableControlCenter
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) shouldDisableControlCenter])
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

- (BOOL)shouldDisableCoverSheetGesture
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) shouldDisableCoverSheetGesture])
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

- (BOOL)shouldDisableSiri
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) shouldDisableSiri])
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

- (id)topmostPresentedViewController
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) topmostPresentedViewController];
        if (v7)
        {
          long long v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  long long v8 = 0;
LABEL_11:

  return v8;
}

- (id)defaultDisplayConfigurationForTransientOverlayPresentation
{
  v2 = [(SBWindowSceneManager *)self->_windowSceneManager activeDisplayWindowScene];
  uint64_t v3 = [v2 _fbsDisplayConfiguration];

  return v3;
}

- (void)windowSceneDidConnect:(id)a3
{
  id v4 = a3;
  presentersByWindowScene = self->_presentersByWindowScene;
  id v17 = v4;
  if (!presentersByWindowScene)
  {
    v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v7 = self->_presentersByWindowScene;
    self->_presentersByWindowScene = v6;

    id v4 = v17;
    presentersByWindowScene = self->_presentersByWindowScene;
  }
  long long v8 = [(NSMapTable *)presentersByWindowScene objectForKey:v4];

  if (!v8)
  {
    long long v9 = [SBTransientOverlayScenePresenter alloc];
    alertItemsController = self->_alertItemsController;
    lockStateAggregator = self->_lockStateAggregator;
    long long v12 = [v17 zStackResolver];
    long long v13 = [(SBTransientOverlayScenePresenter *)v9 initWithWindowScene:v17 alertItemsController:alertItemsController lockStateAggregator:lockStateAggregator zStackResolver:v12 reachabilityManager:self->_reachabilityManager];

    [(SBTransientOverlayScenePresenter *)v13 addObserver:self];
    [(SBTransientOverlayScenePresenter *)v13 setCoverSheetPresentationManager:self->_coverSheetPresentationManager];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);
    [(SBTransientOverlayScenePresenter *)v13 setDelegate:WeakRetained];

    [(SBTransientOverlayScenePresenter *)v13 setBannerManager:self->_bannerManager];
    uint64_t v15 = +[SBWorkspace mainWorkspace];
    uint64_t v16 = [v15 inCallPresentationManager];
    [(SBTransientOverlayScenePresenter *)v13 setInCallPresentationManager:v16];

    [(SBTransientOverlayScenePresenter *)v13 setIdleTimerCoordinator:self];
    [(NSMapTable *)self->_presentersByWindowScene setObject:v13 forKey:v17];
  }
}

- (void)windowSceneDidDisconnect:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_presentersByWindowScene objectForKey:v4];
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = [v5 presentedViewControllers];
    long long v8 = +[SBTransientOverlayDismissalRequest dismissalRequestForAllViewControllersInWindowScene:v4];
    [v8 setAnimated:0];
    id v24 = v4;
    [(NSMapTable *)self->_presentersByWindowScene removeObjectForKey:v4];
    v25 = v8;
    [v6 performDismissalRequest:v8 outerCompletionHandler:0];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          long long v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
          uint64_t v14 = objc_opt_class();
          uint64_t v15 = SBSafeCast(v14, v13);
          uint64_t v16 = v15;
          if (v15)
          {
            id v17 = [v15 pairedRemoteTransientOverlay];
            v18 = v17;
            if (v17)
            {
              v19 = self;
              presentersByWindowScene = self->_presentersByWindowScene;
              v21 = [v17 _sbWindowScene];
              v22 = [(NSMapTable *)presentersByWindowScene objectForKey:v21];

              if (v22)
              {
                uint64_t v23 = +[SBTransientOverlayDismissalRequest dismissalRequestForViewController:v18];

                [v22 performDismissalRequest:v23 outerCompletionHandler:0];
                v25 = (void *)v23;
                v6 = v22;
              }
              else
              {
                v6 = 0;
              }
              self = v19;
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v10);
    }

    id v4 = v24;
  }
}

- (BOOL)hasPresentationAboveWindowLevel:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) hasPresentationAboveWindowLevel:a3])
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)canActivePresentationBecomeLocalFirstResponder
{
  uint64_t v3 = [(SBWindowSceneManager *)self->_windowSceneManager activeDisplayWindowScene];
  if (v3)
  {
    id v4 = [(NSMapTable *)self->_presentersByWindowScene objectForKey:v3];
    char v5 = [v4 canActivePresentationBecomeLocalFirstResponder];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)canActivePresentationBecomeFirstResponder
{
  v2 = [(SBTransientOverlayPresentationManager *)self topmostPresentedViewController];
  char v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (BOOL)activePresentationPreventsDragAndDrop
{
  BOOL v3 = [(SBTransientOverlayPresentationManager *)self hasActivePresentation];
  if (v3)
  {
    id v4 = [(SBTransientOverlayPresentationManager *)self topmostPresentedViewController];
    char v5 = [v4 shouldPreventDragAndDrop];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (int64_t)presentedViewControllerCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) presentedViewControllerCount];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)shouldUseSceneBasedKeyboardFocusForActivePresentation
{
  uint64_t v3 = [(SBWindowSceneManager *)self->_windowSceneManager activeDisplayWindowScene];
  if (v3)
  {
    uint64_t v4 = [(NSMapTable *)self->_presentersByWindowScene objectForKey:v3];
    char v5 = [v4 shouldUseSceneBasedKeyboardFocusForActivePresentation];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isPresentingViewController:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v5 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isPresentingViewController:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isTopmostPresentedViewController:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v5 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4
          && ([*(id *)(*((void *)&v10 + 1) + 8 * i) isTopmostPresentedViewController:v4] & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)hasActivePresentationFromProcess:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v5 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) hasActivePresentationFromProcess:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)hasActivePresentationFromBundleIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v5 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) hasActivePresentationFromBundleIdentifier:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)hasActivePresentationForWindowScene:(id)a3
{
  uint64_t v3 = [(SBTransientOverlayPresentationManager *)self transientOverlayPresenterForWindowScene:a3];
  char v4 = [v3 hasActivePresentation];

  return v4;
}

- (BOOL)isTopmostPresentationFromSceneWithIdentityTokenString:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v5 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isTopmostPresentationFromSceneWithIdentityTokenString:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)keyboardFocusTargetForSBWindowScene:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_presentersByWindowScene objectForKey:a3];
  id v4 = [v3 keyboardFocusTargetForTopmostPresentingScene];

  return v4;
}

- (BOOL)hasActiveSpotlightPresentation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) hasActiveSpotlightPresentation])
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

- (BOOL)prefersStatusBarActivityItemVisible
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) prefersStatusBarActivityItemVisible])
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

- (void)performDismissalRequest:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  switch([v4 requestType])
  {
    case 0:
      uint64_t v5 = [v4 completionHandler];
      uint64_t v6 = v5;
      if (v5) {
        (*(void (**)(uint64_t))(v5 + 16))(v5);
      }
      goto LABEL_22;
    case 1:
      uint64_t v6 = [v4 viewController];
      long long v7 = [v6 _sbWindowScene];
      if (v7)
      {
        long long v8 = [(NSMapTable *)self->_presentersByWindowScene objectForKey:v7];
        [v8 performDismissalRequest:v4 outerCompletionHandler:0];
      }
      else
      {
        uint64_t v16 = [v4 completionHandler];
        long long v8 = (void *)v16;
        if (v16) {
          (*(void (**)(uint64_t))(v16 + 16))(v16);
        }
      }

      goto LABEL_22;
    case 2:
      uint64_t v6 = dispatch_group_create();
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v9 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            dispatch_group_enter(v6);
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __65__SBTransientOverlayPresentationManager_performDismissalRequest___block_invoke;
            v20[3] = &unk_1E6AF4AC0;
            v21 = v6;
            [v14 performDismissalRequest:v4 outerCompletionHandler:v20];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v11);
      }

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __65__SBTransientOverlayPresentationManager_performDismissalRequest___block_invoke_2;
      v18[3] = &unk_1E6AF4AC0;
      id v19 = v4;
      dispatch_group_notify(v6, MEMORY[0x1E4F14428], v18);

      goto LABEL_22;
    case 3:
      uint64_t v6 = [v4 windowScene];
      if (v6)
      {
        uint64_t v15 = [(NSMapTable *)self->_presentersByWindowScene objectForKey:v6];
        [v15 performDismissalRequest:v4 outerCompletionHandler:0];
      }
      else
      {
        uint64_t v17 = [v4 completionHandler];
        uint64_t v15 = (void *)v17;
        if (v17) {
          (*(void (**)(uint64_t))(v17 + 16))(v17);
        }
      }

LABEL_22:
      break;
    default:
      break;
  }
}

void __65__SBTransientOverlayPresentationManager_performDismissalRequest___block_invoke(uint64_t a1)
{
}

void __65__SBTransientOverlayPresentationManager_performDismissalRequest___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) completionHandler];
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }
}

- (void)performPresentationRequest:(id)a3
{
  id v8 = a3;
  if (![(NSMapTable *)self->_presentersByWindowScene count])
  {
    long long v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBTransientOverlayPresentationManager.m" lineNumber:430 description:@"The TransientOverlayPresentationManager must have at least one window scene registered..."];
  }
  uint64_t v5 = [v8 windowScene];
  if (!v5)
  {
    uint64_t v5 = [(SBWindowSceneManager *)self->_windowSceneManager activeDisplayWindowScene];
  }
  uint64_t v6 = [(NSMapTable *)self->_presentersByWindowScene objectForKey:v5];
  [v6 performPresentationRequest:v8];
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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

- (BOOL)handleHomeButtonPress
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) handleHomeButtonPress])
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

- (BOOL)handleHomeButtonDoublePress
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) handleHomeButtonDoublePress])
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

- (BOOL)handleHomeButtonLongPress
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) handleHomeButtonLongPress])
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

- (BOOL)handleLockButtonPress
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) handleLockButtonPress])
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

- (BOOL)handleVoiceCommandButtonPress
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) handleVoiceCommandButtonPress])
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

- (BOOL)handleVolumeUpButtonPress
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) handleVolumeUpButtonPress])
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

- (BOOL)handleVolumeDownButtonPress
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) handleVolumeDownButtonPress])
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

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v11 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        if (*(id *)(*((void *)&v19 + 1) + 8 * i) == v8)
        {

          uint64_t v16 = [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper proposeIdleTimerBehavior:v9 fromProvider:v8 reason:v10];
          goto LABEL_11;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper updateProvider:v8 behavior:v9 reason:v10];
LABEL_11:
  uint64_t v17 = (void *)v16;

  return v17;
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(NSMapTable *)self->_presentersByWindowScene objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 hasIdleTimerBehaviors])
        {
          id v10 = [v9 coordinatorRequestedIdleTimerBehavior:self];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = +[SBIdleTimerBehavior defaultBehavior];
LABEL_11:
  return v10;
}

- (void)transientOverlayScenePresenter:(id)a3 willPresentViewController:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 transientOverlayPresentationManager:self willPresentViewController:v5];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)transientOverlayScenePresenter:(id)a3 didDismissViewController:(id)a4 wasTopmostPresentation:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 transientOverlayPresentationManager:self didDismissViewController:v7 wasTopmostPresentation:v5];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (SBBannerManager)bannerManager
{
  return self->_bannerManager;
}

- (void)setBannerManager:(id)a3
{
}

- (SBCoverSheetPresentationManager)coverSheetPresentationManager
{
  return self->_coverSheetPresentationManager;
}

- (SBTransientOverlayScenePresenterDelegate)presenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);
  return (SBTransientOverlayScenePresenterDelegate *)WeakRetained;
}

- (void)setPresenterDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenterDelegate);
  objc_storeStrong((id *)&self->_coverSheetPresentationManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_lockStateAggregator, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_storeStrong((id *)&self->_bannerManager, 0);
  objc_storeStrong((id *)&self->_alertItemsController, 0);
  objc_storeStrong((id *)&self->_presentersByWindowScene, 0);
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
}

@end