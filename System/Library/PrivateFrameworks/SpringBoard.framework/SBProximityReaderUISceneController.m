@interface SBProximityReaderUISceneController
+ (id)_setupInfo;
- (BOOL)_isHandlingBackgroundActivity:(id)a3;
- (BOOL)handleBackgroundActivity:(id)a3 handler:(id)a4;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)isProximityReaderBlocked;
- (SBProximityReaderUISceneController)initWithSceneWorkspaceIdentifier:(id)a3 clientProcessIdentity:(id)a4 sceneVendingPolicy:(int64_t)a5 traitsRole:(id)a6 jobLabel:(id)a7 level:(double)a8;
- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4;
- (void)_addHandlingBackgroundActivity:(id)a3;
- (void)_handleActionForHomeAffordanceView:(id)a3;
- (void)_removeHandlingBackgroundActivity:(id)a3;
- (void)_updateHomeAffordance:(BOOL)a3 window:(id)a4;
- (void)addProximityReaderObserver:(id)a3;
- (void)dealloc;
- (void)removeProximityReaderObserver:(id)a3;
- (void)scenePresenter:(id)a3 didPresentScene:(id)a4;
- (void)scenePresenter:(id)a3 updateHomeAffordance:(BOOL)a4 forScene:(id)a5;
- (void)scenePresenter:(id)a3 willDismissScene:(id)a4;
- (void)setDefaultPresenter:(id)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBProximityReaderUISceneController

- (SBProximityReaderUISceneController)initWithSceneWorkspaceIdentifier:(id)a3 clientProcessIdentity:(id)a4 sceneVendingPolicy:(int64_t)a5 traitsRole:(id)a6 jobLabel:(id)a7 level:(double)a8
{
  v21.receiver = self;
  v21.super_class = (Class)SBProximityReaderUISceneController;
  v8 = [(SBSystemUISceneController *)&v21 initWithSceneWorkspaceIdentifier:a3 clientProcessIdentity:a4 sceneVendingPolicy:a5 traitsRole:a6 jobLabel:a7 level:a8];
  v9 = v8;
  if (v8)
  {
    v8->_presenting = 0;
    v10 = [(id)SBApp lockOutController];
    uint64_t v11 = objc_opt_class();
    id v12 = v10;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    lockOutController = v9->_lockOutController;
    v9->_lockOutController = v14;

    [(SBFDeviceLockOutController *)v9->_lockOutController setProximityReaderBlockProvider:v9];
    v16 = +[SBSceneManagerCoordinator sharedInstance];
    v17 = [v16 sceneDeactivationManager];
    uint64_t v18 = [v17 newAssertionWithReason:7];
    sceneDeactivationAssertion = v9->_sceneDeactivationAssertion;
    v9->_sceneDeactivationAssertion = (UIApplicationSceneDeactivationAssertion *)v18;
  }
  return v9;
}

- (void)dealloc
{
  [(SBFDeviceLockOutController *)self->_lockOutController setProximityReaderBlockProvider:0];
  [(UIApplicationSceneDeactivationAssertion *)self->_sceneDeactivationAssertion relinquish];
  sceneDeactivationAssertion = self->_sceneDeactivationAssertion;
  self->_sceneDeactivationAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBProximityReaderUISceneController;
  [(SBSystemUISceneController *)&v4 dealloc];
}

+ (id)_setupInfo
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"class";
  v5[0] = objc_opt_class();
  v5[1] = MEMORY[0x1E4F1CC38];
  v4[1] = @"enabled";
  v4[2] = @"traitsRole";
  v4[3] = @"presentationStyle";
  v5[2] = @"SBTraitsParticipantRoleSystemUIScene";
  v5[3] = &unk_1F334B6D8;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

- (void)setDefaultPresenter:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBProximityReaderUISceneController;
  [(SBSystemUISceneController *)&v5 setDefaultPresenter:v4];
  [v4 setShouldPublishAsDisplayLayoutElement:1];
  if (objc_opt_respondsToSelector()) {
    [v4 setPresentingDelegate:self];
  }
}

- (BOOL)handleHomeButtonPress
{
  unint64_t v3 = [(SBSUIFeaturePolicyHostComponent *)self->_featurePolicyComponent desiredHardwareButtonEvents];
  if ((v3 & 0x10) != 0)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA7C70]) initWithButtonEvents:16 withHandler:&__block_literal_global_398];
    featurePolicyComponent = self->_featurePolicyComponent;
    v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    [(SBSUIFeaturePolicyHostComponent *)featurePolicyComponent sendActions:v6];
  }
  return (v3 >> 4) & 1;
}

- (BOOL)handleLockButtonPress
{
  char v3 = [(SBSUIFeaturePolicyHostComponent *)self->_featurePolicyComponent desiredHardwareButtonEvents];
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA7C70]) initWithButtonEvents:1 withHandler:&__block_literal_global_27_1];
    featurePolicyComponent = self->_featurePolicyComponent;
    v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    [(SBSUIFeaturePolicyHostComponent *)featurePolicyComponent sendActions:v6];
  }
  return v3 & 1;
}

- (BOOL)handleBackgroundActivity:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SBProximityReaderUISceneController *)self _isHandlingBackgroundActivity:v6]
    || (-[SBSUIFeaturePolicyHostComponent desiredBackgroundActivities](self->_featurePolicyComponent, "desiredBackgroundActivities"), v8 = objc_claimAutoreleasedReturnValue(), int v9 = [v8 containsObject:v6], v8, !v9))
  {
    BOOL v14 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    id v10 = objc_alloc(MEMORY[0x1E4FA7C38]);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __71__SBProximityReaderUISceneController_handleBackgroundActivity_handler___block_invoke;
    v19 = &unk_1E6AF4CE8;
    objc_copyWeak(&v22, &location);
    id v20 = v6;
    id v21 = v7;
    uint64_t v11 = (void *)[v10 initWithBackgroundActivityIdentifier:v20 handler:&v16];
    featurePolicyComponent = self->_featurePolicyComponent;
    v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", v11, v16, v17, v18, v19);
    [(SBSUIFeaturePolicyHostComponent *)featurePolicyComponent sendActions:v13];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    BOOL v14 = 1;
  }

  return v14;
}

void __71__SBProximityReaderUISceneController_handleBackgroundActivity_handler___block_invoke(id *a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_super v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__SBProximityReaderUISceneController_handleBackgroundActivity_handler___block_invoke_2;
    v6[3] = &unk_1E6AF69D0;
    char v9 = a2;
    v6[4] = WeakRetained;
    id v7 = a1[4];
    id v8 = a1[5];
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __71__SBProximityReaderUISceneController_handleBackgroundActivity_handler___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 56))
  {
    v1 = (void *)result;
    [*(id *)(result + 32) _addHandlingBackgroundActivity:*(void *)(result + 40)];
    (*(void (**)(void))(v1[6] + 16))();
    v2 = (void *)v1[4];
    uint64_t v3 = v1[5];
    return [v2 _removeHandlingBackgroundActivity:v3];
  }
  return result;
}

- (void)scenePresenter:(id)a3 didPresentScene:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 definition];
  char v9 = [v8 specification];
  id v10 = [v9 uiSceneSessionRole];

  uint64_t v11 = objc_opt_new();
  id v12 = [v11 uiSceneSessionRole];
  int v13 = [v10 isEqual:v12];

  if (v13)
  {
    self->_presenting = 1;
    uint64_t v14 = objc_opt_class();
    v15 = [v7 componentForExtension:v14 ofClass:objc_opt_class()];
    uint64_t v16 = objc_opt_class();
    id v17 = v15;
    if (v16)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
    v19 = v18;

    statusBarComponent = self->_statusBarComponent;
    self->_statusBarComponent = v19;

    if (objc_opt_respondsToSelector())
    {
      id v21 = self->_statusBarComponent;
      id v22 = v6;
      [(SBSUIStatusBarSceneHostComponent *)v21 setDelegate:v22];
      [v22 statusBarSceneHostComponent:self->_statusBarComponent didChangePreferredStatusBarVisibilityWithAnimationSettings:0];
    }
    uint64_t v23 = objc_opt_class();
    v24 = [v7 componentForExtension:v23 ofClass:objc_opt_class()];
    uint64_t v25 = objc_opt_class();
    id v26 = v24;
    if (v25)
    {
      if (objc_opt_isKindOfClass()) {
        v27 = v26;
      }
      else {
        v27 = 0;
      }
    }
    else
    {
      v27 = 0;
    }
    v28 = v27;

    featurePolicyComponent = self->_featurePolicyComponent;
    self->_featurePolicyComponent = v28;

    if (objc_opt_respondsToSelector())
    {
      v30 = self->_featurePolicyComponent;
      id v31 = v6;
      [(SBSUIFeaturePolicyHostComponent *)v30 setDelegate:v31];
      [v31 featurePolicyHostComponentDidChangeAllowsMenuButtonDismissal:self->_featurePolicyComponent];
      [v31 featurePolicyHostComponentDidChangeDesiredHardwareButtonEvents:self->_featurePolicyComponent];
      [v31 featurePolicyHostComponentDidChangeDesiredBackgroundActivities:self->_featurePolicyComponent];
    }
    uint64_t v32 = objc_opt_class();
    v33 = [v7 componentForExtension:v32 ofClass:objc_opt_class()];
    uint64_t v34 = objc_opt_class();
    id v35 = v33;
    if (v34)
    {
      if (objc_opt_isKindOfClass()) {
        v36 = v35;
      }
      else {
        v36 = 0;
      }
    }
    else
    {
      v36 = 0;
    }
    v37 = v36;

    idleTimerComponent = self->_idleTimerComponent;
    self->_idleTimerComponent = v37;

    if (objc_opt_respondsToSelector())
    {
      v39 = self->_idleTimerComponent;
      id v40 = v6;
      [(SBSUIIdleTimerSceneHostComponent *)v39 setDelegate:v40];
      [v40 idleTimerSceneHostComponentDidChangeShouldDisableIdleTimer:self->_idleTimerComponent];
    }
    if (!self->_suppressSystemGesturesAssertion)
    {
      v41 = +[SBSystemGestureManager deviceHardwareButtonGestureTypes];
      v42 = (void *)[v41 mutableCopy];

      [v42 addObject:&unk_1F334B6F0];
      v43 = +[SBSystemGestureManager mainDisplayManager];
      v44 = [v43 acquireSystemGestureDisableAssertionForReason:@"Prox Reader UI Presentation" exceptSystemGestureTypes:v42];
      suppressSystemGesturesAssertion = self->_suppressSystemGesturesAssertion;
      self->_suppressSystemGesturesAssertion = v44;
    }
    if (!self->_bannerSuppressionAssertion)
    {
      v46 = [(id)SBApp bannerManager];
      v47 = [v46 acquireBannerSuppressionAssertionForReason:@"Prox Reader UI Presentation"];
      bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
      self->_bannerSuppressionAssertion = v47;
    }
    if (!self->_suppressSystemApertureAssertion)
    {
      v49 = [(id)SBApp systemApertureControllerForMainDisplay];
      v50 = [v49 systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility];
      suppressSystemApertureAssertion = self->_suppressSystemApertureAssertion;
      self->_suppressSystemApertureAssertion = v50;
    }
    sceneDeactivationAssertion = self->_sceneDeactivationAssertion;
    v53 = [v7 settings];
    v54 = [v53 displayIdentity];
    [(UIApplicationSceneDeactivationAssertion *)sceneDeactivationAssertion sb_acquireForDisplayIdentity:v54];

    if (!self->_captureButtonSuppressionAssertion)
    {
      v55 = [(id)SBApp captureButtonRestrictionCoordinator];
      v56 = [v55 inhibitCaptureButtonActionAssertionWithReason:@"Prox Reader UI Presentation"];
      captureButtonSuppressionAssertion = self->_captureButtonSuppressionAssertion;
      self->_captureButtonSuppressionAssertion = v56;
    }
    v58 = +[SBAlertItemsController sharedInstance];
    [v58 setForceAlertsToPend:1 forReason:@"Prox Reader UI Presentation"];
    [v58 moveActiveUnlockedAlertsToPendingWithAnimation:1 completion:0];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v59 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v60 = [v59 countByEnumeratingWithState:&v64 objects:v68 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v65;
      do
      {
        uint64_t v63 = 0;
        do
        {
          if (*(void *)v65 != v62) {
            objc_enumerationMutation(v59);
          }
          [*(id *)(*((void *)&v64 + 1) + 8 * v63++) proximityReaderBlockStatusChanged:self];
        }
        while (v61 != v63);
        uint64_t v61 = [v59 countByEnumeratingWithState:&v64 objects:v68 count:16];
      }
      while (v61);
    }
  }
}

- (void)scenePresenter:(id)a3 willDismissScene:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  objc_super v5 = objc_msgSend(a4, "definition", a3);
  id v6 = [v5 specification];
  id v7 = [v6 uiSceneSessionRole];

  id v8 = objc_opt_new();
  char v9 = [v8 uiSceneSessionRole];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    self->_presenting = 0;
    [(SBSUIStatusBarSceneHostComponent *)self->_statusBarComponent setDelegate:0];
    statusBarComponent = self->_statusBarComponent;
    self->_statusBarComponent = 0;

    [(SBSUIFeaturePolicyHostComponent *)self->_featurePolicyComponent setDelegate:0];
    featurePolicyComponent = self->_featurePolicyComponent;
    self->_featurePolicyComponent = 0;

    [(SBSUIIdleTimerSceneHostComponent *)self->_idleTimerComponent setDelegate:0];
    idleTimerComponent = self->_idleTimerComponent;
    self->_idleTimerComponent = 0;

    [(BSInvalidatable *)self->_suppressSystemGesturesAssertion invalidate];
    suppressSystemGesturesAssertion = self->_suppressSystemGesturesAssertion;
    self->_suppressSystemGesturesAssertion = 0;

    [(BSInvalidatable *)self->_bannerSuppressionAssertion invalidate];
    bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
    self->_bannerSuppressionAssertion = 0;

    [(BSInvalidatable *)self->_suppressSystemApertureAssertion invalidate];
    suppressSystemApertureAssertion = self->_suppressSystemApertureAssertion;
    self->_suppressSystemApertureAssertion = 0;

    [(UIApplicationSceneDeactivationAssertion *)self->_sceneDeactivationAssertion relinquish];
    [(BSInvalidatable *)self->_captureButtonSuppressionAssertion invalidate];
    captureButtonSuppressionAssertion = self->_captureButtonSuppressionAssertion;
    self->_captureButtonSuppressionAssertion = 0;

    uint64_t v18 = +[SBAlertItemsController sharedInstance];
    [v18 setForceAlertsToPend:0 forReason:@"Prox Reader UI Presentation"];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v19 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v25;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * v23++) proximityReaderBlockStatusChanged:self];
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v21);
    }
  }
}

- (void)scenePresenter:(id)a3 updateHomeAffordance:(BOOL)a4 forScene:(id)a5
{
  BOOL v5 = a4;
  id v12 = a5;
  id v8 = a3;
  uint64_t v9 = objc_opt_class();
  int v10 = SBSafeCast(v9, v8);

  if (v10)
  {
    uint64_t v11 = [v10 hostingWindowForScene:v12];
    [(SBProximityReaderUISceneController *)self _updateHomeAffordance:v5 window:v11];
  }
}

- (BOOL)isProximityReaderBlocked
{
  return self->_presenting;
}

- (void)addProximityReaderObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeProximityReaderObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  homeAffordanceViewController = self->_homeAffordanceViewController;
  id v5 = a4;
  objc_msgSend(v5, "setActivationPolicyForParticipantsBelow:", -[SBBarSwipeAffordanceViewController activationPolicyForParticipantsBelow](homeAffordanceViewController, "activationPolicyForParticipantsBelow"));
}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  if (a4 == 1) {
    return 17;
  }
  else {
    return 0;
  }
}

- (void)_addHandlingBackgroundActivity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    handlingBackgroundActivities = self->_handlingBackgroundActivities;
    id v8 = v4;
    if (!handlingBackgroundActivities)
    {
      id v6 = [MEMORY[0x1E4F1CA80] set];
      id v7 = self->_handlingBackgroundActivities;
      self->_handlingBackgroundActivities = v6;

      handlingBackgroundActivities = self->_handlingBackgroundActivities;
    }
    [(NSMutableSet *)handlingBackgroundActivities addObject:v8];
    id v4 = v8;
  }
}

- (void)_removeHandlingBackgroundActivity:(id)a3
{
  if (a3) {
    -[NSMutableSet removeObject:](self->_handlingBackgroundActivities, "removeObject:");
  }
}

- (BOOL)_isHandlingBackgroundActivity:(id)a3
{
  return [(NSMutableSet *)self->_handlingBackgroundActivities containsObject:a3];
}

- (void)_updateHomeAffordance:(BOOL)a3 window:(id)a4
{
  int v4 = a3;
  id v27 = a4;
  int v6 = [(SBBarSwipeAffordanceViewController *)self->_homeAffordanceViewController wantsToBeActiveAffordance];
  id v7 = v27;
  if (v6 != v4)
  {
    homeAffordanceViewController = self->_homeAffordanceViewController;
    if (v4)
    {
      if (!homeAffordanceViewController)
      {
        uint64_t v9 = [SBBarSwipeAffordanceViewController alloc];
        int v10 = [v27 _sbWindowScene];
        uint64_t v11 = objc_opt_class();
        id v12 = v10;
        if (v11)
        {
          if (objc_opt_isKindOfClass()) {
            int v13 = v12;
          }
          else {
            int v13 = 0;
          }
        }
        else
        {
          int v13 = 0;
        }
        id v15 = v13;

        uint64_t v16 = [(SBBarSwipeAffordanceViewController *)v9 initWithZStackParticipantIdentifier:20 windowScene:v15];
        id v17 = self->_homeAffordanceViewController;
        self->_homeAffordanceViewController = v16;

        [(SBBarSwipeAffordanceViewController *)self->_homeAffordanceViewController setPointerClickDelegate:self];
        [(SBBarSwipeAffordanceViewController *)self->_homeAffordanceViewController setDelegate:self];
        uint64_t v18 = [(SBBarSwipeAffordanceViewController *)self->_homeAffordanceViewController view];
        [v18 setDelegate:self];

        v19 = [(SBBarSwipeAffordanceViewController *)self->_homeAffordanceViewController view];
        [v19 addObserver:self];

        id v7 = v27;
      }
      uint64_t v20 = [v7 rootViewController];
      uint64_t v21 = objc_opt_class();
      id v22 = v20;
      if (v21)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v23 = v22;
        }
        else {
          uint64_t v23 = 0;
        }
      }
      else
      {
        uint64_t v23 = 0;
      }
      id v24 = v23;

      [v24 addChildViewController:self->_homeAffordanceViewController];
      long long v25 = [v24 view];
      long long v26 = [(SBBarSwipeAffordanceViewController *)self->_homeAffordanceViewController view];
      [v25 addOverlayView:v26];

      [(SBBarSwipeAffordanceViewController *)self->_homeAffordanceViewController didMoveToParentViewController:v24];
      [(SBBarSwipeAffordanceViewController *)self->_homeAffordanceViewController setWantsToBeActiveAffordance:1];
    }
    else
    {
      [(SBBarSwipeAffordanceViewController *)homeAffordanceViewController setWantsToBeActiveAffordance:0];
      [(SBBarSwipeAffordanceViewController *)self->_homeAffordanceViewController willMoveToParentViewController:0];
      uint64_t v14 = [(SBBarSwipeAffordanceViewController *)self->_homeAffordanceViewController view];
      [v14 removeFromSuperview];

      [(SBBarSwipeAffordanceViewController *)self->_homeAffordanceViewController removeFromParentViewController];
    }
    id v7 = v27;
  }
}

- (void)_handleActionForHomeAffordanceView:(id)a3
{
  id v4 = [a3 _sbWindowScene];
  [(SBSystemUISceneController *)self _invalidateSceneControllersForWindowScene:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceViewController, 0);
  objc_storeStrong((id *)&self->_handlingBackgroundActivities, 0);
  objc_storeStrong((id *)&self->_idleTimerComponent, 0);
  objc_storeStrong((id *)&self->_featurePolicyComponent, 0);
  objc_storeStrong((id *)&self->_statusBarComponent, 0);
  objc_storeStrong((id *)&self->_lockOutController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_captureButtonSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_sceneDeactivationAssertion, 0);
  objc_storeStrong((id *)&self->_suppressSystemApertureAssertion, 0);
  objc_storeStrong((id *)&self->_bannerSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_suppressSystemGesturesAssertion, 0);
}

@end