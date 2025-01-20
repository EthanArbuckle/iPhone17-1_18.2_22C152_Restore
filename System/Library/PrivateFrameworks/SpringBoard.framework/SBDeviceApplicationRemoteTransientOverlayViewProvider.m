@interface SBDeviceApplicationRemoteTransientOverlayViewProvider
- (BOOL)contentWantsSimplifiedOrientationBehavior;
- (BOOL)defaultShouldAutorotateForTransientOverlayViewController:(id)a3;
- (BOOL)handlesSceneBackedRemoteTransientOverlaysOnly;
- (BOOL)isKeyboardVisibleForSpringBoardForTransientOverlayViewController:(id)a3;
- (BOOL)isPresentingOnBehalfOfApplication:(id)a3;
- (BOOL)isPresentingOnBehalfOfSceneIdentityTokenString:(id)a3;
- (BOOL)isPresentingOnBehalfOfScenePersistentIdentifier:(id)a3;
- (BOOL)isPresentingTransientOverlay:(id)a3;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldFollowSceneOrientation;
- (BOOL)transientOverlayViewControllerIsForegroundActive:(id)a3;
- (BOOL)wantsResignActiveAssertion;
- (SBDeviceApplicationRemoteTransientOverlayViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4 handlesSceneBackedRemoteTransientOverlaysOnly:(BOOL)a5;
- (SBWindowScene)windowScene;
- (id)_realOverlayViewController;
- (int64_t)defaultPreferredInterfaceOrientationForPresentationForTransientOverlayViewController:(id)a3;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredStatusBarStyle;
- (int64_t)priority;
- (unint64_t)defaultSupportedInterfaceOrientationsForTransientOverlayViewController:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_activateIfPossible;
- (void)_deactivateIfPossible;
- (void)_dismissRemoteOverlayVC:(id)a3;
- (void)_handleAppSwitcherWillPresent:(id)a3;
- (void)_handleCoverSheetDidPresent:(id)a3;
- (void)_preventKeyboardFocusForPresentedRemoteViewControllerIfNeeded:(id)a3;
- (void)_redirectKeyboardFocusToPresentedRemoteViewController:(id)a3;
- (void)_stopPreventingKeyboardFocusForRemoteViewController:(id)a3;
- (void)_stopRedirectingKeyboardFocusToRemoteViewController:(id)a3;
- (void)dealloc;
- (void)dismissRemoteTransientOverlayViewController:(id)a3;
- (void)noteDisplayModeChange:(int64_t)a3;
- (void)presentRemoteTransientOverlayViewController:(id)a3 presentationRequest:(id)a4;
- (void)transientOverlayViewControllerDidUpdateHIDEventDeferringDisabled:(id)a3;
- (void)transientOverlayViewControllerNeedsSceneDeactivationUpdate:(id)a3;
- (void)transientOverlayViewControllerNeedsStatusBarAppearanceUpdate:(id)a3;
- (void)willDoBoundsPreservingRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4;
@end

@implementation SBDeviceApplicationRemoteTransientOverlayViewProvider

- (void)noteDisplayModeChange:(int64_t)a3
{
  v5 = +[_SBActiveRemoteTransientOverlayViewProviderRegistry sharedInstance];
  id v6 = v5;
  if (a3 == 4) {
    [v5 registerViewProvider:self];
  }
  else {
    [v5 unregisterViewProvider:self];
  }
}

- (SBDeviceApplicationRemoteTransientOverlayViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4 handlesSceneBackedRemoteTransientOverlaysOnly:(BOOL)a5
{
  v11.receiver = self;
  v11.super_class = (Class)SBDeviceApplicationRemoteTransientOverlayViewProvider;
  id v6 = [(SBDeviceApplicationSceneOverlayViewProvider *)&v11 initWithSceneHandle:a3 delegate:a4];
  v7 = v6;
  if (v6)
  {
    v6->_handlesSceneBackedRemoteTransientOverlaysOnly = a5;
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__handleCoverSheetDidPresent_ name:@"SBCoverSheetDidPresentNotification" object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v7 selector:sel__handleAppSwitcherWillPresent_ name:@"SBUIAppSwitcherWillRevealNotification" object:0];
  }
  return v7;
}

- (BOOL)handlesSceneBackedRemoteTransientOverlaysOnly
{
  return self->_handlesSceneBackedRemoteTransientOverlaysOnly;
}

- (void)_activateIfPossible
{
  if ([(NSMutableArray *)self->_activePresentationContexts count] == 1)
  {
    v3 = [[SBDeviceApplicationRemoteTransientOverlayContainerViewController alloc] initWithViewProvider:self];
    containerVC = self->_containerVC;
    self->_containerVC = v3;

    v5.receiver = self;
    v5.super_class = (Class)SBDeviceApplicationRemoteTransientOverlayViewProvider;
    [(SBDeviceApplicationSceneOverlayViewProvider *)&v5 _activateIfPossible];
  }
}

- (void)dealloc
{
  v3 = +[_SBActiveRemoteTransientOverlayViewProviderRegistry sharedInstance];
  [v3 unregisterViewProvider:self];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"SBCoverSheetDidPresentNotification" object:0];

  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"SBUIAppSwitcherWillRevealNotification" object:0];

  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationRemoteTransientOverlayViewProvider;
  [(SBDeviceApplicationSceneOverlayViewProvider *)&v6 dealloc];
}

- (BOOL)prefersStatusBarHidden
{
  v2 = [(NSMutableArray *)self->_activePresentationContexts lastObject];
  v3 = [v2 remoteViewController];
  char v4 = [v3 prefersStatusBarHidden];

  return v4;
}

- (int64_t)preferredStatusBarStyle
{
  v2 = [(NSMutableArray *)self->_activePresentationContexts lastObject];
  v3 = [v2 remoteViewController];
  int64_t v4 = [v3 preferredStatusBarStyle];

  return v4;
}

- (BOOL)contentWantsSimplifiedOrientationBehavior
{
  return self->_handlesSceneBackedRemoteTransientOverlaysOnly;
}

- (int64_t)priority
{
  v3 = [(id)SBApp privacyPreflightController];
  int64_t v4 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
  objc_super v5 = [v4 application];
  objc_super v6 = [v5 info];
  v7 = [v6 applicationIdentity];
  int v8 = [v3 requiresPreflightForApplication:v7];

  if (v8) {
    return 4;
  }
  else {
    return 2;
  }
}

- (BOOL)wantsResignActiveAssertion
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = self->_activePresentationContexts;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v8 = objc_msgSend(v7, "remoteViewController", (void)v14);
        char v9 = [v8 isPresentedByBundleIdentifier:@"com.apple.PDUIApp"];

        if ((v9 & 1) == 0)
        {
          v10 = [v7 remoteViewController];
          objc_super v11 = [v10 preferredSceneDeactivationReasonValue];

          if (v11) {
            continue;
          }
        }
        BOOL v12 = 0;
        goto LABEL_13;
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v12 = 1;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v12 = 1;
  }
LABEL_13:

  return v12;
}

- (void)willDoBoundsPreservingRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self handlesSceneBackedRemoteTransientOverlaysOnly])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v7 = self->_activePresentationContexts;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          BOOL v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "remoteViewController", (void)v13);
          [v12 _doBoundsPreservingRotationFromInterfaceOrientation:a3 toInterfaceOrientation:a4];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)presentRemoteTransientOverlayViewController:(id)a3 presentationRequest:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  if (!self->_activePresentationContexts)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    activePresentationContexts = self->_activePresentationContexts;
    self->_activePresentationContexts = v7;
  }
  if (![(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self isPresentingTransientOverlay:v23])
  {
    uint64_t v9 = [v6 presentationTarget];
    uint64_t v10 = objc_alloc_init(SBDeviceApplicationRemoteTransientOverlayPresentationContext);
    [(SBDeviceApplicationRemoteTransientOverlayPresentationContext *)v10 setRemoteViewController:v23];
    [(SBDeviceApplicationRemoteTransientOverlayPresentationContext *)v10 setPresentationTarget:v9];
    if ([v6 shouldStashPictureInPictureIfNeeded])
    {
      uint64_t v11 = [(id)SBApp windowSceneManager];
      BOOL v12 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
      long long v13 = [v11 windowSceneForSceneHandle:v12];

      long long v14 = [v13 pictureInPictureManager];
      long long v15 = [v14 acquireStashAssertionForReason:6 identifier:@"EmbeddedRemoteTransientOverlayPresentation"];

      [(SBDeviceApplicationRemoteTransientOverlayPresentationContext *)v10 setPIPStashAssertion:v15];
    }
    [(NSMutableArray *)self->_activePresentationContexts addObject:v10];
    [(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self _activateIfPossible];
    [v23 setPresentationPrefersStatusBarHidden:1 initialStatusBarSettings:0];
    [v23 setPresentationEmbeddedInTargetScene:1];
    [v23 setTransientOverlayDelegate:self];
    long long v16 = [v9 targetPredicate];
    long long v17 = [v16 process];
    uint64_t v18 = v17;
    if (v17) {
      objc_msgSend(v23, "_setMediaOverridePID:", objc_msgSend(v17, "pid"));
    }
    [v23 beginAppearanceTransition:1 animated:0];
    [(SBDeviceApplicationRemoteTransientOverlayContainerViewController *)self->_containerVC addChildViewController:v23];
    uint64_t v19 = [v23 view];
    v20 = [(SBDeviceApplicationRemoteTransientOverlayContainerViewController *)self->_containerVC view];
    [v20 bounds];
    objc_msgSend(v19, "setFrame:");

    v21 = [(SBDeviceApplicationRemoteTransientOverlayContainerViewController *)self->_containerVC view];
    v22 = [v23 view];
    [v21 addSubview:v22];

    [v23 didMoveToParentViewController:self->_containerVC];
    [v23 endAppearanceTransition];
    [(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self _redirectKeyboardFocusToPresentedRemoteViewController:v23];
  }
}

- (void)dismissRemoteTransientOverlayViewController:(id)a3
{
  id v4 = a3;
  if ([(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self isPresentingTransientOverlay:v4])
  {
    [(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self _dismissRemoteOverlayVC:v4];
    activePresentationContexts = self->_activePresentationContexts;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __101__SBDeviceApplicationRemoteTransientOverlayViewProvider_dismissRemoteTransientOverlayViewController___block_invoke;
    v6[3] = &unk_1E6B0B320;
    id v7 = v4;
    [(NSMutableArray *)activePresentationContexts removeObjectAtIndex:[(NSMutableArray *)activePresentationContexts indexOfObjectPassingTest:v6]];
    if (![(NSMutableArray *)self->_activePresentationContexts count])
    {
      self->_needsDeactivationWithNoActiveTransientOverlays = 1;
      [(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self _deactivateIfPossible];
      self->_needsDeactivationWithNoActiveTransientOverlays = 0;
    }
  }
}

BOOL __101__SBDeviceApplicationRemoteTransientOverlayViewProvider_dismissRemoteTransientOverlayViewController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 remoteViewController];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (BOOL)isPresentingTransientOverlay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  activePresentationContexts = self->_activePresentationContexts;
  if (activePresentationContexts)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86__SBDeviceApplicationRemoteTransientOverlayViewProvider_isPresentingTransientOverlay___block_invoke;
    v8[3] = &unk_1E6B0B320;
    id v9 = v4;
    LOBYTE(activePresentationContexts) = [(NSMutableArray *)activePresentationContexts indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;
  }
  return (char)activePresentationContexts;
}

BOOL __86__SBDeviceApplicationRemoteTransientOverlayViewProvider_isPresentingTransientOverlay___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 remoteViewController];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (SBWindowScene)windowScene
{
  uint64_t v3 = [(SBDeviceApplicationSceneOverlayViewProvider *)self delegate];
  BOOL v4 = [v3 windowSceneForOverlayViewProvider:self];

  return (SBWindowScene *)v4;
}

- (BOOL)isPresentingOnBehalfOfApplication:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
  id v6 = [v5 application];
  if ([v6 isSameExecutableAsApplication:v4])
  {
    char v7 = 1;
  }
  else
  {
    activePresentationContexts = self->_activePresentationContexts;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91__SBDeviceApplicationRemoteTransientOverlayViewProvider_isPresentingOnBehalfOfApplication___block_invoke;
    v10[3] = &unk_1E6B0B348;
    id v11 = v4;
    char v7 = [(NSMutableArray *)activePresentationContexts bs_containsObjectPassingTest:v10];
  }
  return v7;
}

uint64_t __91__SBDeviceApplicationRemoteTransientOverlayViewProvider_isPresentingOnBehalfOfApplication___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 remoteViewController];
  id v4 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v5 = [v3 isPresentedByBundleIdentifier:v4];

  return v5;
}

- (BOOL)isPresentingOnBehalfOfSceneIdentityTokenString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
  id v6 = [v5 sceneIfExists];
  char v7 = [v6 identityToken];
  uint64_t v8 = [v7 stringRepresentation];
  char v9 = [v8 isEqualToString:v4];

  return v9;
}

- (BOOL)isPresentingOnBehalfOfScenePersistentIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
  id v6 = [v5 persistenceIdentifier];
  char v7 = [v6 isEqualToString:v4];

  return v7;
}

- (BOOL)shouldFollowSceneOrientation
{
  return 0;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  v2 = [(NSMutableArray *)self->_activePresentationContexts lastObject];
  uint64_t v3 = [v2 remoteViewController];
  int64_t v4 = [v3 preferredInterfaceOrientationForPresentation];

  return v4;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(NSMutableArray *)self->_activePresentationContexts lastObject];
  uint64_t v3 = [v2 remoteViewController];
  unint64_t v4 = [v3 supportedInterfaceOrientations];

  return v4;
}

- (unint64_t)defaultSupportedInterfaceOrientationsForTransientOverlayViewController:(id)a3
{
  return 26;
}

- (int64_t)defaultPreferredInterfaceOrientationForPresentationForTransientOverlayViewController:(id)a3
{
  return 0;
}

- (BOOL)defaultShouldAutorotateForTransientOverlayViewController:(id)a3
{
  return 0;
}

- (BOOL)isKeyboardVisibleForSpringBoardForTransientOverlayViewController:(id)a3
{
  return 0;
}

- (void)transientOverlayViewControllerNeedsSceneDeactivationUpdate:(id)a3
{
  id v4 = [(SBDeviceApplicationSceneOverlayViewProvider *)self delegate];
  [v4 overlayViewProviderNeedsUpdateResignActiveAssertions:self];
}

- (void)transientOverlayViewControllerNeedsStatusBarAppearanceUpdate:(id)a3
{
  id v4 = [(SBDeviceApplicationSceneOverlayViewProvider *)self delegate];
  [v4 overlayViewProviderNeedsStatusBarAppearanceUpdate:self];
}

- (BOOL)transientOverlayViewControllerIsForegroundActive:(id)a3
{
  return 0;
}

- (void)transientOverlayViewControllerDidUpdateHIDEventDeferringDisabled:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      char v7 = v6;
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    if ([v8 hidEventDeferringDisabled])
    {
      [(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self _stopRedirectingKeyboardFocusToRemoteViewController:v8];
      [(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self _preventKeyboardFocusForPresentedRemoteViewControllerIfNeeded:v8];
    }
    else
    {
      [(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self _stopPreventingKeyboardFocusForRemoteViewController:v8];
      char v9 = [(NSMapTable *)self->_keyboardFocusRedirectionsByRemoteVC objectForKey:v8];

      if (v9)
      {
        uint64_t v10 = SBLogTransientOverlay();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138543362;
          id v12 = v6;
          _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Not redirecting key focus to embedded remote alert %{public}@ because it already has an assertion.", (uint8_t *)&v11, 0xCu);
        }
      }
      else
      {
        [(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self _redirectKeyboardFocusToPresentedRemoteViewController:v8];
      }
    }
  }
}

- (void)_deactivateIfPossible
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_activePresentationContexts count]
    || self->_needsDeactivationWithNoActiveTransientOverlays)
  {
    if ([(NSMutableArray *)self->_activePresentationContexts count])
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v3 = self->_activePresentationContexts;
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v13 != v6) {
              objc_enumerationMutation(v3);
            }
            id v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) remoteViewController];
            [(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self _dismissRemoteOverlayVC:v8];
          }
          uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v5);
      }

      [(NSMutableArray *)self->_activePresentationContexts removeAllObjects];
    }
    v11.receiver = self;
    v11.super_class = (Class)SBDeviceApplicationRemoteTransientOverlayViewProvider;
    [(SBDeviceApplicationSceneOverlayViewProvider *)&v11 _deactivateIfPossible];
    containerVC = self->_containerVC;
    self->_containerVC = 0;

    activePresentationContexts = self->_activePresentationContexts;
    self->_activePresentationContexts = 0;
  }
}

- (id)_realOverlayViewController
{
  return self->_containerVC;
}

- (void)_dismissRemoteOverlayVC:(id)a3
{
  id v5 = a3;
  [v5 beginAppearanceTransition:0 animated:0];
  [v5 willMoveToParentViewController:0];
  uint64_t v4 = [v5 view];
  [v4 removeFromSuperview];

  [v5 removeFromParentViewController];
  [v5 endAppearanceTransition];
  [(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self _stopRedirectingKeyboardFocusToRemoteViewController:v5];
  [(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self _stopPreventingKeyboardFocusForRemoteViewController:v5];
  [v5 setTransientOverlayDelegate:0];
}

- (void)_redirectKeyboardFocusToPresentedRemoteViewController:(id)a3
{
  id v25 = a3;
  id v5 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
  uint64_t v6 = [v5 application];
  char v7 = [v6 processState];
  uint64_t v8 = [v7 pid];
  char v9 = [v5 sceneIfExists];
  uint64_t v10 = [v9 identityToken];
  objc_super v11 = (void *)v10;
  if (v9 && !v10)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBDeviceApplicationRemoteTransientOverlayViewProvider.m", 393, @"no sceneIdentityToken on sceneHandle %@", v5 object file lineNumber description];
  }
  else
  {
    if (!v10) {
      goto LABEL_8;
    }
    v22 = v5;
    id v23 = v7;
    v24 = v6;
    uint64_t v12 = [v25 serviceProcessIdentifier];
    long long v13 = [v25 clientSceneIdentityToken];
    long long v14 = +[SBWorkspace mainWorkspace];
    long long v15 = [v14 keyboardFocusController];
    long long v16 = [(SBDeviceApplicationSceneOverlayViewProvider *)self delegate];
    uint64_t v17 = [v16 hostWindowForOverlayViewProvider:self];
    uint64_t v18 = [v15 redirectFocusForReason:@"remoteTransientOverlay-identityToken" fromProcessIdentifier:v8 fromSceneIdentityToken:v11 toProcessIdentifier:v12 toSceneIdentityToken:v13 inContainingWindow:v17];

    keyboardFocusRedirectionsByRemoteVC = self->_keyboardFocusRedirectionsByRemoteVC;
    if (!keyboardFocusRedirectionsByRemoteVC)
    {
      v20 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      v21 = self->_keyboardFocusRedirectionsByRemoteVC;
      self->_keyboardFocusRedirectionsByRemoteVC = v20;

      keyboardFocusRedirectionsByRemoteVC = self->_keyboardFocusRedirectionsByRemoteVC;
    }
    [(NSMapTable *)keyboardFocusRedirectionsByRemoteVC setObject:v18 forKey:v25];

    char v7 = v23;
    uint64_t v6 = v24;
    id v5 = v22;
  }

LABEL_8:
}

- (void)_stopRedirectingKeyboardFocusToRemoteViewController:(id)a3
{
  id v6 = a3;
  uint64_t v4 = -[NSMapTable objectForKey:](self->_keyboardFocusRedirectionsByRemoteVC, "objectForKey:");
  id v5 = v4;
  if (v4)
  {
    [v4 invalidate];
    [(NSMapTable *)self->_keyboardFocusRedirectionsByRemoteVC removeObjectForKey:v6];
  }
}

- (void)_preventKeyboardFocusForPresentedRemoteViewControllerIfNeeded:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 clientSceneIdentityToken];
  if (v5)
  {
    keyboardFocusPreventionAssertionsByRemoteVC = self->_keyboardFocusPreventionAssertionsByRemoteVC;
    if (!keyboardFocusPreventionAssertionsByRemoteVC)
    {
      char v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      uint64_t v8 = self->_keyboardFocusPreventionAssertionsByRemoteVC;
      self->_keyboardFocusPreventionAssertionsByRemoteVC = v7;

      keyboardFocusPreventionAssertionsByRemoteVC = self->_keyboardFocusPreventionAssertionsByRemoteVC;
    }
    char v9 = [(NSMapTable *)keyboardFocusPreventionAssertionsByRemoteVC objectForKey:v4];

    if (!v9)
    {
      uint64_t v12 = +[SBWorkspace mainWorkspace];
      long long v13 = [v12 keyboardFocusController];
      long long v14 = [v13 preventFocusForSceneWithIdentityToken:v5 reason:@"embedded remote transient overlay disabling event deferral"];

      [(NSMapTable *)self->_keyboardFocusPreventionAssertionsByRemoteVC setObject:v14 forKey:v4];
      goto LABEL_12;
    }
    uint64_t v10 = SBLogTransientOverlay();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v4;
      objc_super v11 = "Not taking new key focus prevention assertion for embedded remote alert %{public}@ because it already has one.";
LABEL_9:
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = SBLogTransientOverlay();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v4;
      objc_super v11 = "Not taking key focus prevention assertion for embedded remote alert %{public}@ because it doesn't have a scene identity.";
      goto LABEL_9;
    }
  }

LABEL_12:
}

- (void)_stopPreventingKeyboardFocusForRemoteViewController:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMapTable objectForKey:](self->_keyboardFocusPreventionAssertionsByRemoteVC, "objectForKey:");
  id v5 = v4;
  if (v4)
  {
    [v4 invalidate];
    [(NSMapTable *)self->_keyboardFocusPreventionAssertionsByRemoteVC removeObjectForKey:v6];
  }
}

- (void)_handleCoverSheetDidPresent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (void *)[(NSMutableArray *)self->_activePresentationContexts copy];
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
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 presentationTarget];
        int v11 = [v10 shouldDismissOnUILock];

        if (v11)
        {
          uint64_t v12 = [v9 remoteViewController];
          [(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self dismissRemoteTransientOverlayViewController:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_handleAppSwitcherWillPresent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (void *)[(NSMutableArray *)self->_activePresentationContexts copy];
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
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 presentationTarget];
        int v11 = [v10 shouldDismissInSwitcher];

        if (v11)
        {
          uint64_t v12 = [v9 remoteViewController];
          [(SBDeviceApplicationRemoteTransientOverlayViewProvider *)self dismissRemoteTransientOverlayViewController:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardFocusPreventionAssertionsByRemoteVC, 0);
  objc_storeStrong((id *)&self->_keyboardFocusRedirectionsByRemoteVC, 0);
  objc_storeStrong((id *)&self->_containerVC, 0);
  objc_storeStrong((id *)&self->_activePresentationContexts, 0);
}

@end