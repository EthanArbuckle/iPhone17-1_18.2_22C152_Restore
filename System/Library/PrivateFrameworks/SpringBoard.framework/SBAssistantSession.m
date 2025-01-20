@interface SBAssistantSession
- (BOOL)commandeerCaptureDropletPreludeForVisionInvocation:(id)a3;
- (BOOL)contentObscuresScreen;
- (BOOL)isActive;
- (BOOL)isHidingOtherWindows;
- (BOOL)isPendingAlerts;
- (BOOL)isProvidingCoverSheetBehavior;
- (BOOL)isVisible;
- (BOOL)shouldAllowBiometricAutoUnlock;
- (BSCompoundAssertion)elevatedSiriEffectsViewControllerAssertion;
- (BSEventQueue)operationQueue;
- (BSInvalidatable)deferOrientationUpdatesAssertion;
- (BSInvalidatable)displayLayoutAssertion;
- (BSInvalidatable)hideApplicationModalAlertsAssertion;
- (BSInvalidatable)suspendWallpaperAnimationAssertion;
- (NSString)coverSheetIdentifier;
- (SBAssistantAccessoryWindow)assistantAccessoryWindow;
- (SBAssistantContext)context;
- (SBAssistantGestureConfiguration)gestureConfiguration;
- (SBAssistantGestureManager)gestureManager;
- (SBAssistantRootViewController)assistantRootViewController;
- (SBAssistantSession)initWithWindowScene:(id)a3 operationQueue:(id)a4 gestureConfiguration:(id)a5;
- (SBAssistantSessionDelegate)delegate;
- (SBAssistantSessionPresentationContext)presentationContext;
- (SBAssistantWindow)assistantWindow;
- (SBHardwareButtonLaunchZoomUpAnimationToken)externalDropletZoomUpToken;
- (SBWindowScene)windowScene;
- (SiriPresentationSpringBoardMainScreenViewController)siriPresentationViewController;
- (UIApplicationSceneDeactivationAssertion)resignActiveAssertion;
- (UIViewController)siriEffectsViewController;
- (id)_newTraitsOrientationPolicySpecifier;
- (id)acquireElevatedSiriEffectsViewControllerAssertionWithReason:(id)a3;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (unint64_t)restrictedCapabilities;
- (void)_didChangePresentationContext;
- (void)_dockFrameDidChange:(id)a3;
- (void)_notifyDidChangePresentationContext;
- (void)_notifySiriPresentationViewControllerDidAppear;
- (void)_notifySiriPresentationViewControllerDidDisappear;
- (void)_notifySiriPresentationViewControllerWillAppear;
- (void)_notifySiriPresentationViewControllerWillDisappear;
- (void)_operationQueue_dismissPresentables:(unint64_t)a3 withAnimationFactory:(id)a4 siriDismissalOptions:(id)a5 completion:(id)a6;
- (void)_restoreOrientation;
- (void)_setDisplayLayoutElementActive:(BOOL)a3;
- (void)_setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)_siriPresentationViewControllerDidAppear:(BOOL)a3;
- (void)_siriPresentationViewControllerDidDisappear:(BOOL)a3;
- (void)_siriPresentationViewControllerWillAppear:(BOOL)a3;
- (void)_siriPresentationViewControllerWillDisappear:(BOOL)a3;
- (void)_toggleModalAlertHidingAssertion:(BOOL)a3;
- (void)_updateAssistantAccessoryWindowWindowLevel;
- (void)_updateDockViewFrame:(CGRect)a3;
- (void)_updateOrbLocation:(id)a3;
- (void)_updateOrientationLock;
- (void)assertWindowLevel:(double)a3;
- (void)assistantGestureManagerDidRecognizeDismissGesture:(id)a3 preferredDismissalOptions:(id)a4;
- (void)dealloc;
- (void)dismissSiriEffectsViewControllerWithCompletion:(id)a3;
- (void)dismissSiriPresentationViewControllerWithAnimationFactory:(id)a3 siriDismissalOptions:(id)a4 completion:(id)a5;
- (void)endWithAnimationFactory:(id)a3 siriDismissalOptions:(id)a4 completion:(id)a5;
- (void)noteKeyboardWillAppear;
- (void)noteKeyboardWillDisappear;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentSiriEffectsViewController:(id)a3 completion:(id)a4;
- (void)presentSiriPresentationViewController:(id)a3 withAnimationFactory:(id)a4 siriPresentationOptions:(id)a5 completion:(id)a6;
- (void)requestTamaleLaunchAnimationLayerProviderWithCompletion:(id)a3;
- (void)setAssistantAccessoryWindow:(id)a3;
- (void)setAssistantWindow:(id)a3;
- (void)setDeferOrientationUpdatesAssertion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLayoutAssertion:(id)a3;
- (void)setElevatedSiriEffectsViewControllerAssertion:(id)a3;
- (void)setExternalDropletZoomUpToken:(id)a3;
- (void)setGestureConfiguration:(id)a3;
- (void)setGestureManager:(id)a3;
- (void)setHideApplicationModalAlertsAssertion:(id)a3;
- (void)setHidingOtherWindows:(BOOL)a3;
- (void)setPendingAlerts:(BOOL)a3;
- (void)setPresentationContext:(id)a3;
- (void)setProvidingCoverSheetBehavior:(BOOL)a3;
- (void)setSiriEffectsViewController:(id)a3;
- (void)setSiriPresentationViewController:(id)a3;
- (void)setSuspendWallpaperAnimationAssertion:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)siriStartedHostingSceneWithIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (void)siriStoppedHostingSceneWithIdentifier:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation SBAssistantSession

- (SBAssistantSession)initWithWindowScene:(id)a3 operationQueue:(id)a4 gestureConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SBAssistantSession;
  v11 = [(SBAssistantSession *)&v21 init];
  if (v11)
  {
    v12 = objc_alloc_init(SBAssistantSessionPresentationContext);
    presentationContext = v11->_presentationContext;
    v11->_presentationContext = v12;

    objc_storeWeak((id *)&v11->_windowScene, v8);
    objc_storeStrong((id *)&v11->_operationQueue, a4);
    uint64_t v14 = +[SBAssistantContext contextForWindowScene:v8];
    context = v11->_context;
    v11->_context = (SBAssistantContext *)v14;

    v16 = +[SBSceneManagerCoordinator sharedInstance];
    v17 = [v16 sceneDeactivationManager];
    uint64_t v18 = [v17 newAssertionWithReason:4];
    resignActiveAssertion = v11->_resignActiveAssertion;
    v11->_resignActiveAssertion = (UIApplicationSceneDeactivationAssertion *)v18;

    objc_storeStrong((id *)&v11->_gestureConfiguration, a5);
  }

  return v11;
}

- (void)dealloc
{
  [(BSCompoundAssertion *)self->_elevatedSiriEffectsViewControllerAssertion invalidate];
  elevatedSiriEffectsViewControllerAssertion = self->_elevatedSiriEffectsViewControllerAssertion;
  self->_elevatedSiriEffectsViewControllerAssertion = 0;

  if ([(UIApplicationSceneDeactivationAssertion *)self->_resignActiveAssertion isAcquired]) {
    [(UIApplicationSceneDeactivationAssertion *)self->_resignActiveAssertion relinquish];
  }
  resignActiveAssertion = self->_resignActiveAssertion;
  self->_resignActiveAssertion = 0;

  if (self->_hidingOtherWindows)
  {
    v5 = [(SBAssistantContext *)self->_context windowHidingManager];
    [v5 stopHidingWindowsForContext:self];

    self->_hidingOtherWindows = 0;
  }
  if (self->_pendingAlerts)
  {
    v6 = [(SBAssistantContext *)self->_context alertItemsController];
    [v6 setForceAlertsToPend:0 forReason:@"AssistantSession"];

    self->_pendingAlerts = 0;
  }
  if (self->_providingCoverSheetBehavior)
  {
    v7 = [(SBAssistantContext *)self->_context coverSheetViewController];
    [v7 unregisterExternalBehaviorProvider:self];

    self->_providingCoverSheetBehavior = 0;
  }
  [(BSInvalidatable *)self->_displayLayoutAssertion invalidate];
  displayLayoutAssertion = self->_displayLayoutAssertion;
  self->_displayLayoutAssertion = 0;

  [(BSInvalidatable *)self->_suspendWallpaperAnimationAssertion invalidate];
  suspendWallpaperAnimationAssertion = self->_suspendWallpaperAnimationAssertion;
  self->_suspendWallpaperAnimationAssertion = 0;

  [(BSInvalidatable *)self->_hideApplicationModalAlertsAssertion invalidate];
  hideApplicationModalAlertsAssertion = self->_hideApplicationModalAlertsAssertion;
  self->_hideApplicationModalAlertsAssertion = 0;

  [(BSInvalidatable *)self->_deferOrientationUpdatesAssertion invalidate];
  deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
  self->_deferOrientationUpdatesAssertion = 0;

  [(BSInvalidatable *)self->_traitsOrientationPolicySpecifier invalidate];
  traitsOrientationPolicySpecifier = self->_traitsOrientationPolicySpecifier;
  self->_traitsOrientationPolicySpecifier = 0;

  [(BSInvalidatable *)self->_hostedLayoutElementAssertion invalidate];
  hostedLayoutElementAssertion = self->_hostedLayoutElementAssertion;
  self->_hostedLayoutElementAssertion = 0;

  v14.receiver = self;
  v14.super_class = (Class)SBAssistantSession;
  [(SBAssistantSession *)&v14 dealloc];
}

- (SBAssistantRootViewController)assistantRootViewController
{
  v2 = [(SBAssistantSession *)self assistantWindow];
  v3 = [v2 assistantRootViewController];

  return (SBAssistantRootViewController *)v3;
}

- (BOOL)isActive
{
  v3 = [(SBAssistantSession *)self presentationContext];
  if ([v3 isAnyAssistantPresentablePresented])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(SBAssistantSession *)self operationQueue];
    v6 = [v5 pendingEvents];
    BOOL v4 = [v6 count] != 0;
  }
  return v4;
}

- (SBAssistantSessionPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_presentationContext, a3);
    [(SBAssistantSession *)self _didChangePresentationContext];
  }
}

- (void)assertWindowLevel:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogSiri();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = _SBFLoggingMethodProem();
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %f", (uint8_t *)&v8, 0x16u);
  }
  v7 = [(SBAssistantSession *)self assistantWindow];
  [v7 setWindowLevel:a3];

  [(SBAssistantSession *)self _updateAssistantAccessoryWindowWindowLevel];
}

- (BOOL)shouldAllowBiometricAutoUnlock
{
  v2 = [(SBAssistantSession *)self presentationContext];
  v3 = [v2 siriPresentationOptions];

  if (v3) {
    char v4 = [v3 shouldAllowBiometricAutoUnlock];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)contentObscuresScreen
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_3:
      return [(SBAssistantSession *)self isVisible];
    }
  }
  else
  {
    char v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 != 1) {
      goto LABEL_3;
    }
  }
  if ([(SBAssistantSession *)self isVisible])
  {
    v6 = [(SBAssistantSession *)self gestureManager];
    int v7 = [v6 gesturesImplyFullscreenContent] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)noteKeyboardWillAppear
{
  v3 = [(SBAssistantSession *)self presentationContext];
  id v4 = (id)[v3 mutableCopy];

  [v4 setKeyboardVisible:1];
  [(SBAssistantSession *)self setPresentationContext:v4];
}

- (void)noteKeyboardWillDisappear
{
  v3 = [(SBAssistantSession *)self presentationContext];
  id v4 = (id)[v3 mutableCopy];

  [v4 setKeyboardVisible:0];
  [(SBAssistantSession *)self setPresentationContext:v4];
}

- (void)siriStartedHostingSceneWithIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_displayLayoutAssertion)
  {
    int v8 = [(SBAssistantSession *)self windowScene];
    id v9 = [v8 displayLayoutPublisher];

    __int16 v10 = (void *)[objc_alloc(MEMORY[0x1E4FA6A68]) initWithIdentifier:v6];
    [v10 setLevel:(uint64_t)(*MEMORY[0x1E4F43CF8] + 25.0)];
    [v10 setLayoutRole:6];
    [v10 setUIApplicationElement:1];
    [v10 setBundleIdentifier:v7];
    hostedLayoutElement = self->_hostedLayoutElement;
    self->_hostedLayoutElement = (SBSDisplayLayoutElement *)v10;
    id v12 = v10;

    v13 = [v9 addElement:v12];
    hostedLayoutElementAssertion = self->_hostedLayoutElementAssertion;
    self->_hostedLayoutElementAssertion = v13;
  }
  else
  {
    v15 = SBLogSiri();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBAssistantSession siriStartedHostingSceneWithIdentifier:bundleIdentifier:](v15);
    }
  }
}

- (void)siriStoppedHostingSceneWithIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!self->_hostedLayoutElementAssertion)
  {
    objc_super v14 = SBLogSiri();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[SBAssistantSession siriStoppedHostingSceneWithIdentifier:bundleIdentifier:]((uint64_t)self, (uint64_t)a2, v14);
    }
    goto LABEL_10;
  }
  id v9 = [(SBSDisplayLayoutElement *)self->_hostedLayoutElement identifier];
  if (([v9 isEqualToString:v7] & 1) == 0)
  {

LABEL_8:
    objc_super v14 = SBLogSiri();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = _SBFLoggingMethodProem();
      int v16 = 138543874;
      v17 = v15;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_error_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_ERROR, "%{public}@ - assistant session requested scene hosting to stop with mismatched sceneIdentifier: %@ and bundleIdentifier: %@, ignoring", (uint8_t *)&v16, 0x20u);
    }
LABEL_10:

    goto LABEL_11;
  }
  __int16 v10 = [(SBSDisplayLayoutElement *)self->_hostedLayoutElement bundleIdentifier];
  int v11 = [v10 isEqualToString:v8];

  if (!v11) {
    goto LABEL_8;
  }
  [(BSInvalidatable *)self->_hostedLayoutElementAssertion invalidate];
  hostedLayoutElementAssertion = self->_hostedLayoutElementAssertion;
  self->_hostedLayoutElementAssertion = 0;

  hostedLayoutElement = self->_hostedLayoutElement;
  self->_hostedLayoutElement = 0;

LABEL_11:
}

- (BOOL)commandeerCaptureDropletPreludeForVisionInvocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SBLogSiri();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Commandeering capture droplet", (uint8_t *)buf, 2u);
  }

  externalDropletZoomUpToken = self->_externalDropletZoomUpToken;
  if (externalDropletZoomUpToken)
  {
    [(SBHardwareButtonLaunchZoomUpAnimationToken *)externalDropletZoomUpToken invalidate];
    id v7 = self->_externalDropletZoomUpToken;
    self->_externalDropletZoomUpToken = 0;
  }
  id v8 = [v4 associatedBezelEffectsCoordinator];
  id v9 = [v8 commandeerDropletAnimationWithToken:v4];
  __int16 v10 = self->_externalDropletZoomUpToken;
  self->_externalDropletZoomUpToken = v9;

  int v11 = self->_externalDropletZoomUpToken;
  if (v11)
  {
    [(SBAssistantWindow *)self->_assistantWindow windowLevel];
    [(SBHardwareButtonLaunchZoomUpAnimationToken *)self->_externalDropletZoomUpToken setRequestedDropletWindowLevel:v12 + -1.0];
    objc_initWeak(buf, self);
    v13 = self->_externalDropletZoomUpToken;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__SBAssistantSession_commandeerCaptureDropletPreludeForVisionInvocation___block_invoke;
    v16[3] = &unk_1E6AF80B8;
    objc_copyWeak(&v17, buf);
    [(SBHardwareButtonLaunchZoomUpAnimationToken *)v13 appendZoomUpCompletionBlock:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(buf);
  }
  else
  {
    objc_super v14 = SBLogSiri();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Did not receive a zoom up token for commandeering the capture droplet", (uint8_t *)buf, 2u);
    }
  }
  return v11 != 0;
}

void __73__SBAssistantSession_commandeerCaptureDropletPreludeForVisionInvocation___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = SBLogSiri();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Droplet zoom up complete", v6, 2u);
    }

    [WeakRetained[21] invalidate];
    id v5 = WeakRetained[21];
    WeakRetained[21] = 0;

    if (objc_opt_respondsToSelector()) {
      [WeakRetained[8] visionIntelligenceDropletLaunchAnimationDidFinish:a2 retargeted:0];
    }
  }
}

- (void)requestTamaleLaunchAnimationLayerProviderWithCompletion:(id)a3
{
  if (self->_externalDropletZoomUpToken)
  {
    id v4 = (void (**)(id, id))a3;
    id v5 = [SBAssistantLaunchAnimationLayerProvider alloc];
    id v6 = [(SBHardwareButtonLaunchZoomUpAnimationToken *)self->_externalDropletZoomUpToken animatingDroplet];
    id v7 = [v6 layer];
    id v9 = [(SBAssistantLaunchAnimationLayerProvider *)v5 initWithDropletLayer:v7];

    v4[2](v4, v9);
  }
  else
  {
    id v8 = (void (*)(void))*((void *)a3 + 2);
    id v9 = (SBAssistantLaunchAnimationLayerProvider *)a3;
    v8();
  }
}

- (void)assistantGestureManagerDidRecognizeDismissGesture:(id)a3 preferredDismissalOptions:(id)a4
{
  id v5 = a4;
  id v6 = [(SBAssistantSession *)self delegate];
  [v6 assistantSession:self requestsDismissalWithDismissalOptions:v5];
}

- (void)presentSiriPresentationViewController:(id)a3 withAnimationFactory:(id)a4 siriPresentationOptions:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke;
  v25 = &unk_1E6B01968;
  id v30 = v14;
  SEL v31 = a2;
  v26 = self;
  id v27 = v11;
  id v28 = v12;
  id v29 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v14;
  id v19 = (void *)MEMORY[0x1D948C7A0](&v22);
  __int16 v20 = objc_msgSend(MEMORY[0x1E4F4F748], "eventWithName:handler:", @"Siri Content Presentation", v19, v22, v23, v24, v25, v26);
  id v21 = [(SBAssistantSession *)self operationQueue];
  [v21 executeOrInsertEvent:v20 atPosition:1];
}

void __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke(id *a1)
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543362;
    v107 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  id v4 = [a1[4] presentationContext];
  if ([v4 isAssistantPresented])
  {
    id v5 = SBLogSiri();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Siri content presentation request received while already presented - ignoring", buf, 2u);
    }

    (*((void (**)(void))a1[8] + 2))();
  }
  else
  {
    id v6 = [a1[4] operationQueue];
    id v7 = [v6 acquireLockForReason:@"Siri Content Presentation"];

    objc_storeStrong((id *)a1[4] + 8, a1[5]);
    id v8 = [SBAssistantWindow alloc];
    id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 23);
    uint64_t v10 = [(SBAssistantWindow *)v8 initWithWindowScene:WeakRetained role:@"SBTraitsParticipantRoleAssistant" debugName:@"Siri Content"];
    id v11 = a1[4];
    id v12 = (void *)v11[7];
    v11[7] = v10;

    id v13 = [*((id *)a1[4] + 7) assistantRootViewController];
    [v13 setSiriPresentationViewController:a1[5]];

    id v14 = [[SBAssistantGestureManager alloc] initWithAssistantWindow:*((void *)a1[4] + 7) gestureConfiguration:*((void *)a1[4] + 15) context:*((void *)a1[4] + 13)];
    id v15 = a1[4];
    id v16 = (void *)v15[16];
    v15[16] = v14;

    objc_msgSend(*((id *)a1[4] + 16), "setDelegate:");
    id v17 = [a1[4] assistantRootViewController];
    id v18 = [a1[4] context];
    id v19 = [v18 controlCenterController];

    __int16 v20 = [a1[4] context];
    id v21 = [v20 lockScreenEnvironment];
    uint64_t v22 = [v21 rootViewController];

    uint64_t v23 = [a1[4] context];
    v74 = [v23 wallpaperController];

    v77 = v19;
    int v76 = [v19 isPresented];
    v24 = [a1[4] context];
    v25 = [v24 iconController];
    int v75 = [v25 areAnyIconViewContextMenusShowing];

    v26 = [a1[4] context];
    id v27 = [v26 lockScreenManager];
    if ([v27 isUILocked])
    {
      [a1[4] context];
      v29 = id v28 = v7;
      id v30 = [v29 transientOverlayPresenter];
      int v31 = [v30 hasActivePresentation];

      id v7 = v28;
      int v32 = (v22 != 0) & ~v31;
    }
    else
    {

      int v32 = 0;
    }
    v33 = [a1[5] view];
    [a1[6] duration];
    BOOL v35 = fabs(v34) >= 2.22044605e-16;
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_76;
    v96[3] = &unk_1E6B00FD0;
    id v97 = v4;
    id v36 = a1[7];
    id v37 = a1[4];
    id v98 = v36;
    id v99 = v37;
    BOOL v103 = v35;
    id v38 = v17;
    id v100 = v38;
    id v39 = v33;
    id v101 = v39;
    id v102 = a1[5];
    v40 = (void (**)(void))MEMORY[0x1D948C7A0](v96);
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_2;
    v89[3] = &unk_1E6AF6E00;
    id v90 = a1[5];
    id v41 = v38;
    id v42 = a1[4];
    id v72 = v41;
    id v91 = v41;
    id v92 = v42;
    BOOL v95 = v35;
    id v94 = a1[8];
    id v71 = v7;
    id v93 = v71;
    v43 = (void *)MEMORY[0x1D948C7A0](v89);
    v44 = dispatch_group_create();
    v45 = (void *)MEMORY[0x1D948C7A0](v43);
    UIKeyboardForceOrderOutAutomaticAnimated();
    v73 = v4;
    v70 = v43;
    if (((v76 | v75) & 1) == 0)
    {
      [v77 dismissAnimated:1];
      if (v32)
      {
        if (SBScreenIsBlanked())
        {
          [MEMORY[0x1E4F39CF8] begin];
          v46 = [v74 requireWallpaperWithReason:@"AssistantSession"];
          [MEMORY[0x1E4F39CF8] commit];
          [MEMORY[0x1E4F39CF8] flush];
        }
        else
        {
          v46 = [v74 requireWallpaperWithReason:@"AssistantSession"];
        }
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_3;
        v86[3] = &unk_1E6AF5A78;
        id v88 = v43;
        id v47 = v46;
        id v87 = v47;
        uint64_t v48 = MEMORY[0x1D948C7A0](v86);

        id v49 = a1[7];
        if (!v49 || [v49 wakeScreen])
        {
          v50 = [a1[4] context];
          v51 = [v50 lockScreenManager];
          v104 = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
          [NSNumber numberWithBool:1];
          id v69 = v47;
          v53 = uint64_t v52 = v48;
          v105 = v53;
          v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
          [v51 unlockUIFromSource:12 withOptions:v54];

          uint64_t v48 = v52;
          id v47 = v69;
        }
        v55 = [a1[4] context];
        v56 = [v55 lockScreenManager];
        [v56 setPasscodeVisible:0 animated:1];

        v45 = (void *)v48;
      }
    }
    v40[2](v40);
    v57 = [a1[4] context];
    v58 = [v57 iconController];
    v59 = [v58 iconManager];

    if (((v76 | v75) & 1) != 0
      || [v59 areAnyIconShareSheetsShowing])
    {
      [v39 setAlpha:0.0];
      if (v76)
      {
        dispatch_group_enter(v44);
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_4;
        v84[3] = &unk_1E6AF4AC0;
        v85 = v44;
        [v77 dismissAnimated:1 completion:v84];
      }
      else if (v75)
      {
        v60 = [a1[4] context];
        v61 = [v60 iconController];
        [v61 dismissAppIconForceTouchControllers:0];
      }
      else if ([v59 areAnyIconShareSheetsShowing])
      {
        [v59 dismissIconShareSheets];
      }
    }
    else
    {
      [v39 setAlpha:1.0];
    }
    dispatch_group_enter(v44);
    v62 = (void *)MEMORY[0x1E4F4F898];
    id v63 = a1[6];
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_5;
    v82[3] = &unk_1E6AF4AC0;
    id v83 = v39;
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_6;
    v80[3] = &unk_1E6AF5350;
    v64 = v44;
    v81 = v64;
    id v65 = v39;
    [v62 animateWithFactory:v63 actions:v82 completion:v80];
    dispatch_group_enter(v64);
    id v67 = a1[5];
    id v66 = a1[6];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_7;
    v78[3] = &unk_1E6AF5350;
    v79 = v64;
    v68 = v64;
    [v67 animatedAppearanceWithFactory:v66 completion:v78];
    dispatch_group_notify(v68, MEMORY[0x1E4F14428], v45);

    id v4 = v73;
  }
}

void __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_76(uint64_t a1)
{
  id v17 = (id)[*(id *)(a1 + 32) mutableCopy];
  [v17 setSiriPresentationOptions:*(void *)(a1 + 40)];
  [v17 setAssistantPresented:1];
  [*(id *)(a1 + 48) setPresentationContext:v17];
  [*(id *)(a1 + 48) _siriPresentationViewControllerWillAppear:*(unsigned __int8 *)(a1 + 80)];
  v2 = [*(id *)(a1 + 56) clippingView];
  v3 = [*(id *)(a1 + 56) contentView];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 184));
  id v5 = [WeakRetained screen];
  [v5 _referenceBounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  id v14 = [*(id *)(a1 + 48) assistantWindow];
  unint64_t v15 = [v14 interfaceOrientation] - 3;

  if (v15 >= 2) {
    double v16 = v11;
  }
  else {
    double v16 = v13;
  }
  if (v15 >= 2) {
    double v11 = v13;
  }
  objc_msgSend(v2, "setFrame:", v7, v9, v16, v11);
  objc_msgSend(v3, "setFrame:", v7, v9, v16, v11);
  objc_msgSend(*(id *)(a1 + 64), "setFrame:", v7, v9, v16, v11);
  [*(id *)(a1 + 72) beginAppearanceTransition:1 animated:*(unsigned __int8 *)(a1 + 80)];
  [*(id *)(a1 + 56) addChildViewController:*(void *)(a1 + 72)];
  [v3 addSubview:*(void *)(a1 + 64)];
  [*(id *)(a1 + 48) _setStatusBarHidden:0 animated:0];
}

uint64_t __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) requestStatusBarVisible:1 animated:0 completion:0];
  [*(id *)(a1 + 32) didMoveToParentViewController:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) endAppearanceTransition];
  [*(id *)(a1 + 48) _siriPresentationViewControllerDidAppear:*(unsigned __int8 *)(a1 + 72)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  v2 = *(void **)(a1 + 56);
  return [v2 relinquish];
}

uint64_t __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 invalidate];
}

void __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_4(uint64_t a1)
{
}

uint64_t __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_6(uint64_t a1)
{
}

void __116__SBAssistantSession_presentSiriPresentationViewController_withAnimationFactory_siriPresentationOptions_completion___block_invoke_7(uint64_t a1)
{
}

- (void)dismissSiriPresentationViewControllerWithAnimationFactory:(id)a3 siriDismissalOptions:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __112__SBAssistantSession_dismissSiriPresentationViewControllerWithAnimationFactory_siriDismissalOptions_completion___block_invoke;
  v18[3] = &unk_1E6AF6260;
  id v21 = v11;
  SEL v22 = a2;
  v18[4] = self;
  id v19 = v9;
  id v20 = v10;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  unint64_t v15 = (void *)MEMORY[0x1D948C7A0](v18);
  double v16 = [MEMORY[0x1E4F4F748] eventWithName:@"Siri Content Dismissal" handler:v15];
  id v17 = [(SBAssistantSession *)self operationQueue];
  [v17 executeOrInsertEvent:v16 atPosition:1];
}

uint64_t __112__SBAssistantSession_dismissSiriPresentationViewControllerWithAnimationFactory_siriDismissalOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = _SBFLoggingMethodProem();
    int v5 = 138543362;
    double v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_operationQueue_dismissPresentables:withAnimationFactory:siriDismissalOptions:completion:", 1, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)presentSiriEffectsViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__SBAssistantSession_presentSiriEffectsViewController_completion___block_invoke;
  v13[3] = &unk_1E6AFCAC8;
  id v14 = v6;
  id v15 = v7;
  v13[4] = self;
  id v8 = v6;
  id v9 = v7;
  id v10 = (void *)MEMORY[0x1D948C7A0](v13);
  id v11 = [MEMORY[0x1E4F4F748] eventWithName:@"Siri Effects Presentation" handler:v10];
  id v12 = [(SBAssistantSession *)self operationQueue];
  [v12 executeOrInsertEvent:v11 atPosition:1];
}

void __66__SBAssistantSession_presentSiriEffectsViewController_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentationContext];
  if ([v2 isAssistantAccessoryPresented])
  {
    v3 = SBLogSiri();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Siri effects presentation request received while already presented - ignoring", (uint8_t *)buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v4 = (void *)[v2 mutableCopy];
    [v4 setAssistantAccessoryPresented:1];
    [*(id *)(a1 + 32) setPresentationContext:v4];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
    int v5 = [SBAssistantAccessoryWindow alloc];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 184));
    id v7 = [(SBWindow *)v5 initWithWindowScene:WeakRetained rootViewController:*(void *)(a1 + 40) role:@"SBTraitsParticipantRoleAssistantAccessory" debugName:@"Siri Effects"];

    [(SBWindow *)v7 setHidden:0];
    [(SBAssistantAccessoryWindow *)v7 layoutIfNeeded];
    id v8 = [*(id *)(a1 + 32) context];
    id v9 = [v8 windowHidingManager];
    [v9 setAlpha:v7 forWindow:1.0];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), v7);
    objc_initWeak(buf, *(id *)(a1 + 32));
    id v10 = (void *)MEMORY[0x1E4F4F6E8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__SBAssistantSession_presentSiriEffectsViewController_completion___block_invoke_94;
    v14[3] = &unk_1E6AF92D8;
    objc_copyWeak(&v15, buf);
    uint64_t v11 = [v10 assertionWithIdentifier:@"Elevated Siri Effects" stateDidChangeHandler:v14];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 88);
    *(void *)(v12 + 88) = v11;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
}

void __66__SBAssistantSession_presentSiriEffectsViewController_completion___block_invoke_94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAssistantAccessoryWindowWindowLevel];
}

- (void)dismissSiriEffectsViewControllerWithCompletion:(id)a3
{
  id v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__SBAssistantSession_dismissSiriEffectsViewControllerWithCompletion___block_invoke;
  v10[3] = &unk_1E6AF76F8;
  id v11 = v5;
  SEL v12 = a2;
  v10[4] = self;
  id v6 = v5;
  id v7 = (void *)MEMORY[0x1D948C7A0](v10);
  id v8 = [MEMORY[0x1E4F4F748] eventWithName:@"Siri Effects Dismissal" handler:v7];
  id v9 = [(SBAssistantSession *)self operationQueue];
  [v9 executeOrInsertEvent:v8 atPosition:1];
}

uint64_t __69__SBAssistantSession_dismissSiriEffectsViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = _SBFLoggingMethodProem();
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_operationQueue_dismissPresentables:withAnimationFactory:siriDismissalOptions:completion:", 2, 0, 0, *(void *)(a1 + 40));
}

- (id)acquireElevatedSiriEffectsViewControllerAssertionWithReason:(id)a3
{
  id v4 = a3;
  int v5 = [(SBAssistantSession *)self elevatedSiriEffectsViewControllerAssertion];
  id v6 = [v5 acquireForReason:v4];

  return v6;
}

- (void)endWithAnimationFactory:(id)a3 siriDismissalOptions:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__SBAssistantSession_endWithAnimationFactory_siriDismissalOptions_completion___block_invoke;
  v17[3] = &unk_1E6AF6260;
  id v20 = v11;
  SEL v21 = a2;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  id v15 = (void *)MEMORY[0x1D948C7A0](v17);
  double v16 = [MEMORY[0x1E4F4F748] eventWithName:@"end Siri Session" handler:v15];
  [(BSEventQueue *)self->_operationQueue executeOrInsertEvent:v16 atPosition:1];
}

uint64_t __78__SBAssistantSession_endWithAnimationFactory_siriDismissalOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = SBLogSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = _SBFLoggingMethodProem();
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_operationQueue_dismissPresentables:withAnimationFactory:siriDismissalOptions:completion:", 3, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_operationQueue_dismissPresentables:(unint64_t)a3 withAnimationFactory:(id)a4 siriDismissalOptions:(id)a5 completion:(id)a6
{
  char v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(void))a6;
  id v13 = [(SBAssistantSession *)self presentationContext];
  id v14 = v13;
  if (v8)
  {
    int v15 = [v13 isAssistantPresented];
    if ((v8 & 2) != 0)
    {
LABEL_3:
      char v16 = [v14 isAssistantAccessoryPresented];
      if (v15) {
        goto LABEL_11;
      }
      goto LABEL_7;
    }
  }
  else
  {
    int v15 = 0;
    if ((v8 & 2) != 0) {
      goto LABEL_3;
    }
  }
  char v16 = 0;
  if (v15)
  {
LABEL_11:
    id v18 = [(SBAssistantSession *)self operationQueue];
    id v30 = [v18 acquireLockForReason:@"Siri Dismissal"];

    id v19 = self->_siriPresentationViewController;
    [v10 duration];
    id v21 = v10;
    id v22 = v11;
    BOOL v23 = fabs(v20) >= 2.22044605e-16;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __111__SBAssistantSession__operationQueue_dismissPresentables_withAnimationFactory_siriDismissalOptions_completion___block_invoke;
    v42[3] = &unk_1E6B01990;
    char v46 = v15;
    char v47 = v16;
    id v43 = v14;
    v44 = self;
    BOOL v48 = v23;
    v24 = v19;
    v45 = v24;
    v25 = (void (**)(void))MEMORY[0x1D948C7A0](v42);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __111__SBAssistantSession__operationQueue_dismissPresentables_withAnimationFactory_siriDismissalOptions_completion___block_invoke_2;
    v33[3] = &unk_1E6B019B8;
    char v39 = v15;
    v26 = v24;
    double v34 = v26;
    BOOL v35 = self;
    BOOL v40 = v23;
    id v11 = v22;
    id v10 = v21;
    id v36 = v11;
    char v41 = v16;
    id v38 = v12;
    id v27 = v30;
    id v37 = v27;
    id v28 = (void *)MEMORY[0x1D948C7A0](v33);
    id v29 = dispatch_group_create();
    v25[2](v25);
    if (v15)
    {
      dispatch_group_enter(v29);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __111__SBAssistantSession__operationQueue_dismissPresentables_withAnimationFactory_siriDismissalOptions_completion___block_invoke_3;
      v31[3] = &unk_1E6AF5350;
      int v32 = v29;
      [(SiriPresentationSpringBoardMainScreenViewController *)v26 animatedDisappearanceWithFactory:v10 completion:v31];
    }
    dispatch_group_notify(v29, MEMORY[0x1E4F14428], v28);

    goto LABEL_14;
  }
LABEL_7:
  if (v16) {
    goto LABEL_11;
  }
  id v17 = SBLogSiri();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Siri dismissal request received with nothing to dismiss - ignoring", buf, 2u);
  }

  v12[2](v12);
LABEL_14:
}

void __111__SBAssistantSession__operationQueue_dismissPresentables_withAnimationFactory_siriDismissalOptions_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  v3 = v2;
  id v4 = v2;
  if (*(unsigned char *)(a1 + 56))
  {
    [v2 setSiriPresentationOptions:0];
    [v4 setAssistantPresented:0];
    v3 = v4;
  }
  if (*(unsigned char *)(a1 + 57))
  {
    [v3 setAssistantAccessoryPresented:0];
    v3 = v4;
  }
  [*(id *)(a1 + 40) setPresentationContext:v3];
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 40) _siriPresentationViewControllerWillDisappear:*(unsigned __int8 *)(a1 + 58)];
    [*(id *)(a1 + 48) beginAppearanceTransition:0 animated:*(unsigned __int8 *)(a1 + 58)];
    [*(id *)(a1 + 48) willMoveToParentViewController:0];
    [*(id *)(a1 + 40) _setStatusBarHidden:1 animated:0];
  }
}

uint64_t __111__SBAssistantSession__operationQueue_dismissPresentables_withAnimationFactory_siriDismissalOptions_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    v2 = [*(id *)(a1 + 32) view];
    [v2 removeFromSuperview];

    [*(id *)(a1 + 32) removeFromParentViewController];
    [*(id *)(a1 + 32) endAppearanceTransition];
    [*(id *)(a1 + 40) _siriPresentationViewControllerDidDisappear:*(unsigned __int8 *)(a1 + 73)];
    v3 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 48)) {
      objc_msgSend(v3, "dismissWithOptions:");
    }
    else {
      [v3 dismiss];
    }
    [*(id *)(*(void *)(a1 + 40) + 56) setHidden:1];
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = 0;

    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = 0;
  }
  if (*(unsigned char *)(a1 + 74))
  {
    [*(id *)(*(void *)(a1 + 40) + 72) setHidden:1];
    [*(id *)(*(void *)(a1 + 40) + 72) setRootViewController:0];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(v8 + 72);
    *(void *)(v8 + 72) = 0;

    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(void **)(v10 + 80);
    *(void *)(v10 + 80) = 0;

    [*(id *)(*(void *)(a1 + 40) + 88) invalidate];
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = *(void **)(v12 + 88);
    *(void *)(v12 + 88) = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  id v14 = *(void **)(a1 + 56);
  return [v14 relinquish];
}

void __111__SBAssistantSession__operationQueue_dismissPresentables_withAnimationFactory_siriDismissalOptions_completion___block_invoke_3(uint64_t a1)
{
}

- (void)_siriPresentationViewControllerWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v5 = SBLogSiri();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = _SBFLoggingMethodProem();
    int v32 = 138543362;
    v33 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v32, 0xCu);
  }
  if ([(SBAssistantSessionPresentationContext *)self->_presentationContext modality] == 3)
  {
    uint64_t v7 = [(SBAssistantSession *)self windowScene];
    uint64_t v8 = [v7 switcherController];
    [v8 dismissMainAndFloatingSwitchersWithSource:8 animated:1];
  }
  [(SBAssistantSession *)self _notifySiriPresentationViewControllerWillAppear];
  [(SBAssistantSession *)self setVisible:1];
  if (!self->_traitsOrientationPolicySpecifier)
  {
    id v9 = [(SBAssistantSession *)self _newTraitsOrientationPolicySpecifier];
    traitsOrientationPolicySpecifier = self->_traitsOrientationPolicySpecifier;
    self->_traitsOrientationPolicySpecifier = v9;
  }
  id v11 = [(SBAssistantSession *)self assistantWindow];
  uint64_t v12 = [(SBAssistantSession *)self context];
  id v13 = [v12 windowHidingManager];
  [v13 setAlpha:v11 forWindow:1.0];

  [v11 setHidden:0];
  [v11 makeKeyAndVisible];
  id v14 = [(SBAssistantSession *)self presentationContext];
  int v15 = [v14 siriPresentationOptions];
  int v16 = [v15 shouldDeactivateScenesBelow];

  if (v16)
  {
    id v17 = [(SBAssistantSession *)self resignActiveAssertion];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    id v19 = [WeakRetained _fbsDisplayIdentity];
    objc_msgSend(v17, "sb_acquireForDisplayIdentity:", v19);
  }
  [(SBAssistantSession *)self _setDisplayLayoutElementActive:1];
  [(SBAssistantSession *)self _updateOrientationLock];
  double v20 = [(SBAssistantSession *)self siriPresentationViewController];
  [v20 addObserver:self forKeyPath:@"supportedInterfaceOrientations" options:0 context:0];

  [(SBAssistantSession *)self _toggleModalAlertHidingAssertion:1];
  id v21 = [(SBAssistantSession *)self context];
  id v22 = [v21 alertItemsController];
  [v22 setForceAlertsToPend:1 forReason:@"AssistantSession"];

  BOOL v23 = [(SBAssistantSession *)self context];
  v24 = [v23 alertItemsController];
  [v24 moveActiveUnlockedAlertsToPendingWithAnimation:v3 completion:0];

  [(SBAssistantSession *)self setPendingAlerts:1];
  v25 = [(SBAssistantSession *)self context];
  v26 = [v25 coverSheetViewController];
  [v26 registerExternalBehaviorProvider:self];

  [(SBAssistantSession *)self setProvidingCoverSheetBehavior:1];
  id v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v28 = [(SBAssistantSession *)self context];
  id v29 = [v28 floatingDockController];
  [v27 addObserver:self selector:sel__dockFrameDidChange_ name:@"SBFloatingDockControllerFrameDidChangeNotification" object:v29];

  id v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int v31 = [(SBAssistantSession *)self assistantRootViewController];
  [v30 addObserver:self selector:sel__updateOrbLocation_ name:@"SBAssistantCanRepositionOrbIfNecessary" object:v31];

  [(SBAssistantSession *)self _updateOrbLocation:0];
}

- (void)_siriPresentationViewControllerDidAppear:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = SBLogSiri();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = _SBFLoggingMethodProem();
    int v15 = 138543362;
    int v16 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v6 = [(SBAssistantSession *)self context];
  uint64_t v7 = [v6 alertItemsController];
  [v7 setForceAlertsToPend:0 forReason:@"AssistantSession"];

  uint64_t v8 = [(SBAssistantSession *)self context];
  id v9 = [v8 orientationAccomodation];
  uint64_t v10 = [(SBAssistantSession *)self siriPresentationViewController];
  objc_msgSend(v9, "noteInterfaceOrientationChanged:force:logMessage:", objc_msgSend(v10, "interfaceOrientation"), 0, @"Updating interface orientation to match Siri's activation orientation");

  [(SBAssistantSession *)self _notifySiriPresentationViewControllerDidAppear];
  id v11 = [(SBAssistantSession *)self gestureManager];
  uint64_t v12 = [(SBAssistantSession *)self context];
  id v13 = [v12 transientOverlayPresenter];
  id v14 = [v13 topmostPresentedViewController];
  [v11 setTopmostTransientViewControllerAtPresentation:v14];
}

- (void)_siriPresentationViewControllerWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = SBLogSiri();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = _SBFLoggingMethodProem();
    int v18 = 138543362;
    id v19 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v18, 0xCu);
  }
  [(SBAssistantSession *)self setVisible:0];
  if ([(SBAssistantSession *)self isHidingOtherWindows])
  {
    uint64_t v7 = [(SBAssistantSession *)self context];
    uint64_t v8 = [v7 windowHidingManager];
    [v8 stopHidingWindowsForContext:self];

    id v9 = [(SBAssistantSession *)self suspendWallpaperAnimationAssertion];
    [v9 invalidate];

    [(SBAssistantSession *)self setSuspendWallpaperAnimationAssertion:0];
    [(SBAssistantSession *)self setHidingOtherWindows:0];
  }
  [(SBAssistantSession *)self _notifySiriPresentationViewControllerWillDisappear];
  [(SBAssistantSession *)self _restoreOrientation];
  uint64_t v10 = [(SBAssistantSession *)self resignActiveAssertion];
  int v11 = [v10 isAcquired];

  if (v11)
  {
    uint64_t v12 = [(SBAssistantSession *)self resignActiveAssertion];
    [v12 relinquish];
  }
  id v13 = [(SBAssistantSession *)self context];
  id v14 = [v13 alertItemsController];
  [v14 setForceAlertsToPend:1 forReason:@"AssistantSession"];

  int v15 = [(SBAssistantSession *)self context];
  int v16 = [v15 alertItemsController];
  [v16 moveActiveUnlockedAlertsToPendingWithAnimation:v3 completion:0];

  uint64_t v17 = [(SBAssistantSession *)self siriPresentationViewController];
  [v17 removeObserver:self forKeyPath:@"supportedInterfaceOrientations"];
}

- (void)_siriPresentationViewControllerDidDisappear:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = SBLogSiri();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = _SBFLoggingMethodProem();
    int v17 = 138543362;
    int v18 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v6 = [(SBAssistantSession *)self assistantWindow];
  uint64_t v7 = [v6 rootViewController];
  uint64_t v8 = [v7 presentedViewController];

  if (v8)
  {
    id v9 = [v6 rootViewController];
    [v9 dismissViewControllerAnimated:0 completion:0];
  }
  [v6 resignAsKeyWindow];
  [v6 setHidden:1];
  uint64_t v10 = [(SBAssistantSession *)self deferOrientationUpdatesAssertion];
  [v10 invalidate];

  [(SBAssistantSession *)self setDeferOrientationUpdatesAssertion:0];
  [(BSInvalidatable *)self->_traitsOrientationPolicySpecifier invalidate];
  traitsOrientationPolicySpecifier = self->_traitsOrientationPolicySpecifier;
  self->_traitsOrientationPolicySpecifier = 0;

  if ([(SBAssistantSession *)self isPendingAlerts])
  {
    uint64_t v12 = [(SBAssistantSession *)self context];
    id v13 = [v12 alertItemsController];
    [v13 setForceAlertsToPend:0 forReason:@"AssistantSession"];

    [(SBAssistantSession *)self setPendingAlerts:0];
  }
  [(SBAssistantSession *)self _toggleModalAlertHidingAssertion:0];
  [(SBAssistantSession *)self _setDisplayLayoutElementActive:0];
  if ([(SBAssistantSession *)self isProvidingCoverSheetBehavior])
  {
    id v14 = [(SBAssistantSession *)self context];
    int v15 = [v14 coverSheetViewController];
    [v15 unregisterExternalBehaviorProvider:self];

    [(SBAssistantSession *)self setProvidingCoverSheetBehavior:0];
  }
  [(SBHardwareButtonLaunchZoomUpAnimationToken *)self->_externalDropletZoomUpToken invalidate];
  externalDropletZoomUpToken = self->_externalDropletZoomUpToken;
  self->_externalDropletZoomUpToken = 0;

  [(SBAssistantSession *)self _notifySiriPresentationViewControllerDidDisappear];
}

- (void)_didChangePresentationContext
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBAssistantSession *)self presentationContext];
  uint64_t v4 = [v3 siriPresentationOptions];
  int v5 = [v4 hideOtherWindowsDuringAppearance];

  if (v5)
  {
    [(SBAssistantSession *)self setHidingOtherWindows:1];
    uint64_t v6 = [(SBAssistantSession *)self context];
    uint64_t v7 = [v6 windowHidingManager];
    [v7 startHidingWindowsExclusivelyFromLevel:self toLevel:@"AssistantSession" forContext:*MEMORY[0x1E4F43F20] + -3.0 + -1.0 reason:*MEMORY[0x1E4F43CF8] + 25.0];

    uint64_t v8 = [(SBAssistantSession *)self suspendWallpaperAnimationAssertion];
    [v8 invalidate];

    id v9 = [(SBAssistantSession *)self context];
    uint64_t v10 = [v9 wallpaperController];
    int v11 = [v10 suspendWallpaperAnimationForReason:@"AssistantSession"];
    [(SBAssistantSession *)self setSuspendWallpaperAnimationAssertion:v11];
  }
  else
  {
    [(SBAssistantSession *)self setHidingOtherWindows:0];
    uint64_t v12 = [(SBAssistantSession *)self context];
    id v13 = [v12 windowHidingManager];
    [v13 stopHidingWindowsForContext:self];

    id v14 = [(SBAssistantSession *)self suspendWallpaperAnimationAssertion];
    [v14 invalidate];

    [(SBAssistantSession *)self setSuspendWallpaperAnimationAssertion:0];
  }
  int v15 = [(SBAssistantSession *)self presentationContext];
  int v16 = [v15 siriPresentationOptions];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    int v18 = [(SBAssistantSession *)self presentationContext];
    uint64_t v19 = [v18 siriPresentationOptions];
    uint64_t v20 = [v19 launchActions];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v26, "isValid", (void)v28))
          {
            if ([v26 canSendResponse]
              && [v26 isAssistantVisionIntelligenceActivationRequestAction])
            {
              id v27 = +[BSActionResponse response];
              [v26 sendResponse:v27];
            }
            [v26 invalidate];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v23);
    }
  }
  [(SBAssistantSession *)self _notifyDidChangePresentationContext];
}

- (void)_notifySiriPresentationViewControllerWillAppear
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  BOOL v3 = [(SBAssistantSession *)self delegate];
  [v3 assistantSession:self viewWillAppearInWindowScene:WeakRetained];

  uint64_t v4 = [(SBAssistantSession *)self gestureManager];
  [v4 assistantSession:self viewWillAppearInWindowScene:WeakRetained];
}

- (void)_notifySiriPresentationViewControllerDidAppear
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  BOOL v3 = [(SBAssistantSession *)self delegate];
  [v3 assistantSession:self viewDidAppearInWindowScene:WeakRetained];

  uint64_t v4 = [(SBAssistantSession *)self gestureManager];
  [v4 assistantSession:self viewDidAppearInWindowScene:WeakRetained];
}

- (void)_notifySiriPresentationViewControllerWillDisappear
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  BOOL v3 = [(SBAssistantSession *)self delegate];
  [v3 assistantSession:self viewWillDisappearInWindowScene:WeakRetained];

  uint64_t v4 = [(SBAssistantSession *)self gestureManager];
  [v4 assistantSession:self viewWillDisappearInWindowScene:WeakRetained];
}

- (void)_notifySiriPresentationViewControllerDidDisappear
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  BOOL v3 = [(SBAssistantSession *)self delegate];
  [v3 assistantSession:self viewDidDisappearInWindowScene:WeakRetained];

  uint64_t v4 = [(SBAssistantSession *)self gestureManager];
  [v4 assistantSession:self viewDidDisappearInWindowScene:WeakRetained];
}

- (void)_notifyDidChangePresentationContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  BOOL v3 = [(SBAssistantSession *)self delegate];
  [v3 assistantSession:self didChangePresentationInWindowScene:WeakRetained];

  uint64_t v4 = [(SBAssistantSession *)self gestureManager];
  [v4 assistantSession:self didChangePresentationInWindowScene:WeakRetained];
}

- (void)_setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__SBAssistantSession__setStatusBarHidden_animated___block_invoke;
    v6[3] = &unk_1E6AF5D38;
    v6[4] = self;
    BOOL v7 = a3;
    [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v6 options:0 animations:0.35 completion:0.0];
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__SBAssistantSession__setStatusBarHidden_animated___block_invoke_2;
    v4[3] = &unk_1E6AF5D38;
    v4[4] = self;
    BOOL v5 = a3;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v4];
  }
}

void __51__SBAssistantSession__setStatusBarHidden_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) siriPresentationViewController];
  [v2 requestStatusBarVisible:*(unsigned char *)(a1 + 40) == 0 animated:0 completion:0];
}

void __51__SBAssistantSession__setStatusBarHidden_animated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) siriPresentationViewController];
  [v2 requestStatusBarVisible:*(unsigned char *)(a1 + 40) == 0 animated:0 completion:0];
}

- (void)_toggleModalAlertHidingAssertion:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBAssistantSession *)self hideApplicationModalAlertsAssertion];

  if (v5)
  {
    uint64_t v6 = [(SBAssistantSession *)self hideApplicationModalAlertsAssertion];
    [v6 invalidate];

    [(SBAssistantSession *)self setHideApplicationModalAlertsAssertion:0];
  }
  if (v3)
  {
    id v9 = [(SBAssistantSession *)self context];
    BOOL v7 = [v9 modalAlertPresentationCoordinator];
    uint64_t v8 = [v7 hideApplicationModalAlertsForReason:@"AssistantSession"];
    [(SBAssistantSession *)self setHideApplicationModalAlertsAssertion:v8];
  }
}

- (void)_updateOrbLocation:(id)a3
{
  uint64_t v4 = [(SBAssistantSession *)self context];
  BOOL v5 = [v4 floatingDockController];
  [v5 floatingDockScreenFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[SBAssistantSession _updateDockViewFrame:](self, "_updateDockViewFrame:", v7, v9, v11, v13);
}

- (void)_dockFrameDidChange:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKey:@"SBFloatingDockControllerFrame"];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[SBAssistantSession _updateDockViewFrame:](self, "_updateDockViewFrame:", v7, v9, v11, v13);
}

- (void)_updateDockViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  double v9 = [WeakRetained screen];
  id v30 = [v9 fixedCoordinateSpace];

  double v10 = [(SBAssistantSession *)self siriPresentationViewController];
  double v11 = [v10 view];
  double v12 = [v11 coordinateSpace];

  objc_msgSend(v30, "convertRect:toCoordinateSpace:", v12, x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = [(SBAssistantSession *)self context];
  uint64_t v22 = [v21 coverSheetPresentationManager];
  int v23 = [v22 isPresented];

  uint64_t v24 = [(SBAssistantSession *)self siriPresentationViewController];
  v25 = v24;
  if (v23)
  {
    double v26 = *MEMORY[0x1E4F1DB28];
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v29 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    double v26 = v14;
    double v27 = v16;
    double v28 = v18;
    double v29 = v20;
  }
  objc_msgSend(v24, "setDockFrame:", v26, v27, v28, v29);
}

- (void)_setDisplayLayoutElementActive:(BOOL)a3
{
  displayLayoutAssertion = self->_displayLayoutAssertion;
  if (a3)
  {
    if (displayLayoutAssertion) {
      return;
    }
    id v5 = objc_alloc(MEMORY[0x1E4FA6A68]);
    id v14 = (id)[v5 initWithIdentifier:*MEMORY[0x1E4F625C0]];
    [v14 setLevel:(uint64_t)(*MEMORY[0x1E4F43CF8] + 25.0)];
    [v14 setFillsDisplayBounds:1];
    [v14 setLayoutRole:4];
    double v6 = [(SBAssistantSession *)self context];
    double v7 = [v6 displayLayoutPublisher];
    double v8 = [v7 addElement:v14];
    double v9 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = v8;
  }
  else
  {
    if (!displayLayoutAssertion && !self->_hostedLayoutElementAssertion) {
      return;
    }
    double v10 = [(SBAssistantSession *)self context];
    double v11 = [v10 displayLayoutPublisher];
    id v14 = [v11 transitionAssertionWithReason:@"Siri Dismissal"];

    [(BSInvalidatable *)self->_displayLayoutAssertion invalidate];
    double v12 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = 0;

    [(BSInvalidatable *)self->_hostedLayoutElementAssertion invalidate];
    hostedLayoutElementAssertion = self->_hostedLayoutElementAssertion;
    self->_hostedLayoutElementAssertion = 0;

    [v14 invalidate];
  }
}

- (id)_newTraitsOrientationPolicySpecifier
{
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  uint64_t v4 = [WeakRetained traitsPipelineManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SBAssistantSession__newTraitsOrientationPolicySpecifier__block_invoke;
  v7[3] = &unk_1E6AFC590;
  objc_copyWeak(&v8, &location);
  id v5 = (void *)[v4 newBlockBasedOrientationPolicySpecifier:v7 forRole:@"SBTraitsParticipantRoleAssistant"];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

void __58__SBAssistantSession__newTraitsOrientationPolicySpecifier__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = objc_msgSend(a2, "bs_firstObjectPassingTest:", &__block_literal_global_156);
  if (v3)
  {
    id v9 = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = [WeakRetained presentationContext];

    double v6 = [v5 siriPresentationOptions];
    uint64_t v7 = [v6 rotationStyle];

    if (v7 == 1) {
      [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoDeviceOrientation];
    }
    else {
    id v8 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoOrientationBelow];
    }
    [v9 setOrientationResolutionPolicyInfo:v8];

    BOOL v3 = v9;
  }
}

uint64_t __58__SBAssistantSession__newTraitsOrientationPolicySpecifier__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 role];
  uint64_t v3 = [v2 isEqualToString:@"SBTraitsParticipantRoleAssistant"];

  return v3;
}

- (void)_updateOrientationLock
{
  uint64_t v3 = [(SBAssistantSession *)self context];
  uint64_t v4 = [v3 lockScreenManager];
  if ([v4 isUILocked])
  {
    id v5 = [(SBAssistantSession *)self context];
    id v11 = [v5 coverSheetViewController];
  }
  else
  {
    id v11 = [(SBAssistantSession *)self siriPresentationViewController];
  }

  if ([v11 shouldAutorotate] && objc_msgSend(v11, "supportedInterfaceOrientations") != 2)
  {
    double v10 = [(SBAssistantSession *)self deferOrientationUpdatesAssertion];
    [v10 invalidate];

    [(SBAssistantSession *)self setDeferOrientationUpdatesAssertion:0];
  }
  else
  {
    double v6 = [(SBAssistantSession *)self deferOrientationUpdatesAssertion];
    [v6 invalidate];

    uint64_t v7 = [(SBAssistantSession *)self context];
    id v8 = [v7 orientationAccomodation];
    id v9 = [v8 deviceOrientationUpdateDeferralAssertionWithReason:@"AssistantSession"];
    [(SBAssistantSession *)self setDeferOrientationUpdatesAssertion:v9];
  }
}

- (void)_restoreOrientation
{
  uint64_t v3 = [(SBAssistantSession *)self context];
  uint64_t v4 = [v3 orientationAccomodation];
  uint64_t v5 = [v4 homeScreenRotationStyle];

  if (!v5)
  {
    double v6 = [(SBAssistantSession *)self context];
    uint64_t v7 = [v6 orientationAccomodation];
    [v7 setStatusBarOrientation:1 forEmbeddedDisplayAnimated:0];
  }
  id v8 = [(SBAssistantSession *)self context];
  id v9 = [v8 lockScreenManager];
  char v10 = [v9 isUILocked];

  id v11 = [(SBAssistantSession *)self context];
  double v12 = v11;
  if (v10)
  {
    double v13 = [v11 orientationAccomodation];
    uint64_t v14 = [v13 homeScreenRotationStyle];

    if (v14) {
      return;
    }
    id v38 = [(SBAssistantSession *)self context];
    double v15 = [v38 orientationAccomodation];
    double v16 = v15;
    double v17 = @"AssistantController restore orientation (locked)";
  }
  else
  {
    double v18 = [v11 switcherController];
    double v19 = [v18 layoutStatePrimaryElement];
    double v20 = [v19 workspaceEntity];
    id v21 = [v20 applicationSceneEntity];
    uint64_t v22 = [v21 sceneHandle];

    int v23 = [(SBAssistantSession *)self context];
    uint64_t v24 = v23;
    if (v22)
    {
      v25 = [v23 switcherController];
      double v26 = [v25 layoutStatePrimaryElement];
      double v27 = [v26 workspaceEntity];
      double v28 = [v27 applicationSceneEntity];
      id v38 = [v28 sceneHandle];

      if (v38) {
        uint64_t v29 = [v38 statusBarOrientation];
      }
      else {
        uint64_t v29 = 1;
      }
      int v32 = [(SBAssistantSession *)self context];
      uint64_t v33 = [v32 orientationAccomodation];
      uint64_t v34 = [v33 homeScreenRotationStyle];

      if (v34)
      {
        BOOL v35 = [(SBAssistantSession *)self context];
        id v36 = [v35 orientationAccomodation];
        [v36 updateNativeOrientationWithOrientation:v29, @"AssistantController restore orientation (not locked, has app)" logMessage];
      }
      double v16 = [(SBAssistantSession *)self context];
      id v37 = [v16 orientationAccomodation];
      [v37 noteInterfaceOrientationChanged:v29, 1, @"AssistantController restore orientation (not locked, has app)" force logMessage];

      goto LABEL_17;
    }
    id v30 = [v23 orientationAccomodation];
    uint64_t v31 = [v30 homeScreenRotationStyle];

    if (v31) {
      return;
    }
    id v38 = [(SBAssistantSession *)self context];
    double v15 = [v38 orientationAccomodation];
    double v16 = v15;
    double v17 = @"AssistantController restore orientation (not locked, no app)";
  }
  [v15 noteInterfaceOrientationChanged:1 force:1 logMessage:v17];
LABEL_17:
}

- (void)_updateAssistantAccessoryWindowWindowLevel
{
  uint64_t v3 = [(SBAssistantSession *)self elevatedSiriEffectsViewControllerAssertion];
  int v4 = [v3 isActive];

  double v5 = -0.5;
  if (v4) {
    double v5 = 0.5;
  }
  double v6 = *MEMORY[0x1E4F43CF8] + 25.0 + v5 - (*MEMORY[0x1E4F43CF8] + 25.0);
  uint64_t v7 = [(SBAssistantSession *)self assistantWindow];
  [v7 windowLevel];
  double v9 = v8;

  id v10 = [(SBAssistantSession *)self assistantAccessoryWindow];
  [v10 setWindowLevel:v6 + v9];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"supportedInterfaceOrientations", a4, a5, a6))
  {
    [(SBAssistantSession *)self _updateOrientationLock];
  }
}

- (NSString)coverSheetIdentifier
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if ([(SBAssistantSession *)self isVisible]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return 0;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (SBAssistantWindow)assistantWindow
{
  return self->_assistantWindow;
}

- (void)setAssistantWindow:(id)a3
{
}

- (SiriPresentationSpringBoardMainScreenViewController)siriPresentationViewController
{
  return self->_siriPresentationViewController;
}

- (void)setSiriPresentationViewController:(id)a3
{
}

- (SBAssistantAccessoryWindow)assistantAccessoryWindow
{
  return self->_assistantAccessoryWindow;
}

- (void)setAssistantAccessoryWindow:(id)a3
{
}

- (UIViewController)siriEffectsViewController
{
  return self->_siriEffectsViewController;
}

- (void)setSiriEffectsViewController:(id)a3
{
}

- (BSCompoundAssertion)elevatedSiriEffectsViewControllerAssertion
{
  return self->_elevatedSiriEffectsViewControllerAssertion;
}

- (void)setElevatedSiriEffectsViewControllerAssertion:(id)a3
{
}

- (BSEventQueue)operationQueue
{
  return self->_operationQueue;
}

- (SBAssistantContext)context
{
  return self->_context;
}

- (UIApplicationSceneDeactivationAssertion)resignActiveAssertion
{
  return self->_resignActiveAssertion;
}

- (SBAssistantGestureConfiguration)gestureConfiguration
{
  return self->_gestureConfiguration;
}

- (void)setGestureConfiguration:(id)a3
{
}

- (SBAssistantGestureManager)gestureManager
{
  return self->_gestureManager;
}

- (void)setGestureManager:(id)a3
{
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)isHidingOtherWindows
{
  return self->_hidingOtherWindows;
}

- (void)setHidingOtherWindows:(BOOL)a3
{
  self->_hidingOtherWindows = a3;
}

- (BOOL)isPendingAlerts
{
  return self->_pendingAlerts;
}

- (void)setPendingAlerts:(BOOL)a3
{
  self->_pendingAlerts = a3;
}

- (BOOL)isProvidingCoverSheetBehavior
{
  return self->_providingCoverSheetBehavior;
}

- (void)setProvidingCoverSheetBehavior:(BOOL)a3
{
  self->_providingCoverSheetBehavior = a3;
}

- (BSInvalidatable)displayLayoutAssertion
{
  return self->_displayLayoutAssertion;
}

- (void)setDisplayLayoutAssertion:(id)a3
{
}

- (BSInvalidatable)suspendWallpaperAnimationAssertion
{
  return self->_suspendWallpaperAnimationAssertion;
}

- (void)setSuspendWallpaperAnimationAssertion:(id)a3
{
}

- (BSInvalidatable)hideApplicationModalAlertsAssertion
{
  return self->_hideApplicationModalAlertsAssertion;
}

- (void)setHideApplicationModalAlertsAssertion:(id)a3
{
}

- (BSInvalidatable)deferOrientationUpdatesAssertion
{
  return self->_deferOrientationUpdatesAssertion;
}

- (void)setDeferOrientationUpdatesAssertion:(id)a3
{
}

- (SBHardwareButtonLaunchZoomUpAnimationToken)externalDropletZoomUpToken
{
  return self->_externalDropletZoomUpToken;
}

- (void)setExternalDropletZoomUpToken:(id)a3
{
}

- (SBAssistantSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAssistantSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_externalDropletZoomUpToken, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_hideApplicationModalAlertsAssertion, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_gestureManager, 0);
  objc_storeStrong((id *)&self->_gestureConfiguration, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_elevatedSiriEffectsViewControllerAssertion, 0);
  objc_storeStrong((id *)&self->_siriEffectsViewController, 0);
  objc_storeStrong((id *)&self->_assistantAccessoryWindow, 0);
  objc_storeStrong((id *)&self->_siriPresentationViewController, 0);
  objc_storeStrong((id *)&self->_assistantWindow, 0);
  objc_storeStrong((id *)&self->_hostedLayoutElement, 0);
  objc_storeStrong((id *)&self->_hostedLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_traitsOrientationPolicySpecifier, 0);
  objc_storeStrong((id *)&self->_fluidDismissalState, 0);
}

- (void)siriStartedHostingSceneWithIdentifier:(os_log_t)log bundleIdentifier:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "displayLayoutAssertion is nil. HostedLayoutElement should only be added after displayLayoutElement", v1, 2u);
}

- (void)siriStoppedHostingSceneWithIdentifier:(NSObject *)a3 bundleIdentifier:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = _SBFLoggingMethodProem();
  int v5 = 138543362;
  double v6 = v4;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ - assistant session requested scene hosting to stop but _hostedLayoutElementAssertion is already invalidated, ignoring", (uint8_t *)&v5, 0xCu);
}

@end