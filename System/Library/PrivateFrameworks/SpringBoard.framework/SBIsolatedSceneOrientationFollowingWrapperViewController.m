@interface SBIsolatedSceneOrientationFollowingWrapperViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isSceneStatusBarHidden;
- (CGRect)_boundsForOverlayRootView;
- (SBDeviceApplicationSceneOverlayView)overlayView;
- (SBIsolatedSceneOrientationFollowingWrapperOrientationDelegate)orientationDelegate;
- (SBIsolatedSceneOrientationFollowingWrapperViewController)initWithContentViewController:(id)a3 sceneHandle:(id)a4 windowScene:(id)a5 orientationDelegate:(id)a6 rendersWhileLocked:(BOOL)a7;
- (id)participantAssociatedWindows:(id)a3;
- (int64_t)_hostOrientation;
- (int64_t)currentInterfaceOrientation;
- (void)_containerViewDidSetAllowsTouchPassthrough:(BOOL)a3;
- (void)_containerViewDidSetBounds:(CGRect)a3;
- (void)_containerViewDidSetCenter:(CGPoint)a3;
- (void)_containerViewDidSetHostOrientation:(int64_t)a3;
- (void)_updateOrientationResolutionPolicyWithContainerTraitsParticipant:(id)a3;
- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5;
- (void)dealloc;
- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4;
- (void)loadView;
- (void)setOrientationDelegate:(id)a3;
- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBIsolatedSceneOrientationFollowingWrapperViewController

- (SBIsolatedSceneOrientationFollowingWrapperViewController)initWithContentViewController:(id)a3 sceneHandle:(id)a4 windowScene:(id)a5 orientationDelegate:(id)a6 rendersWhileLocked:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBIsolatedSceneOrientationFollowingWrapperViewController;
  v17 = [(SBIsolatedSceneOrientationFollowingWrapperViewController *)&v20 initWithNibName:0 bundle:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sceneHandle, a4);
    objc_storeStrong((id *)&v18->_contentViewController, a3);
    objc_storeWeak((id *)&v18->_orientationDelegate, v16);
    v18->_sceneInterfaceOrientationMode = [(SBDeviceApplicationSceneHandle *)v18->_sceneHandle _interfaceOrientationMode];
    v18->_rendersWhileLocked = a7;
    objc_storeWeak((id *)&v18->_windowScene, v15);
  }

  return v18;
}

- (void)dealloc
{
  [(UIView *)self->_hostedOverlayView removeFromSuperview];
  hostedOverlayView = self->_hostedOverlayView;
  self->_hostedOverlayView = 0;

  [(SBWindowSelfHostWrapper *)self->_appOverlayHostWrapper stopHosting];
  [(SBWindow *)self->_appOverlayWindow setHidden:1];
  [(BSInvalidatable *)self->_traitsResolutionPolicySpecifier invalidate];
  [(TRAParticipant *)self->_traitsParticipant invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SBIsolatedSceneOrientationFollowingWrapperViewController;
  [(SBIsolatedSceneOrientationFollowingWrapperViewController *)&v4 dealloc];
}

- (void)_updateOrientationResolutionPolicyWithContainerTraitsParticipant:(id)a3
{
  id v4 = a3;
  v5 = [(SBApplicationSceneHandle *)self->_sceneHandle application];
  int v6 = [v5 classicAppPhoneAppRunningOnPad];

  if (v6)
  {
    v7 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoDeviceOrientation];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4FAFFB0];
    if (v4)
    {
      v9 = [v4 uniqueIdentifier];
      v10 = [v8 resolutionPolicyInfoForAssociatedParticipantWithUniqueID:v9];
      traitsOrientationResolutionPolicy = self->_traitsOrientationResolutionPolicy;
      self->_traitsOrientationResolutionPolicy = v10;

      goto LABEL_7;
    }
    v7 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoOrientationBelow];
  }
  v9 = self->_traitsOrientationResolutionPolicy;
  self->_traitsOrientationResolutionPolicy = v7;
LABEL_7:

  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v13 = WeakRetained;
  if (self->_traitsResolutionPolicySpecifier)
  {
    id v14 = [WeakRetained traitsArbiter];
    id v15 = objc_alloc(MEMORY[0x1E4FAFF78]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __125__SBIsolatedSceneOrientationFollowingWrapperViewController__updateOrientationResolutionPolicyWithContainerTraitsParticipant___block_invoke_2;
    v20[3] = &unk_1E6B00EF8;
    v20[4] = self;
    id v16 = (void *)[v15 initWithBuilder:v20];
    [v14 setNeedsUpdateArbitrationWithContext:v16];
  }
  else
  {
    objc_initWeak(&location, self);
    v17 = [v13 traitsPipelineManager];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __125__SBIsolatedSceneOrientationFollowingWrapperViewController__updateOrientationResolutionPolicyWithContainerTraitsParticipant___block_invoke;
    v21[3] = &unk_1E6AFC590;
    objc_copyWeak(&v22, &location);
    v18 = (BSInvalidatable *)[v17 newBlockBasedOrientationPolicySpecifier:v21 forRole:@"SBTraitsParticipantRoleDeviceApplicationSceneViewOverlay"];
    traitsResolutionPolicySpecifier = self->_traitsResolutionPolicySpecifier;
    self->_traitsResolutionPolicySpecifier = v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __125__SBIsolatedSceneOrientationFollowingWrapperViewController__updateOrientationResolutionPolicyWithContainerTraitsParticipant___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && [v5 containsObject:WeakRetained[127]]) {
    [v4[127] setOrientationResolutionPolicyInfo:v4[129]];
  }
}

void __125__SBIsolatedSceneOrientationFollowingWrapperViewController__updateOrientationResolutionPolicyWithContainerTraitsParticipant___block_invoke_2(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setReason:@"Isolated scene overlay window updating policy"];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1016) uniqueIdentifier];
  v6[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 setRequestingParticipantsUniqueIdentifiers:v5];

  [v3 setForceOrientationResolution:1];
}

- (void)loadView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v3 = (objc_class *)objc_opt_class();
  id v4 = [[SBSceneOrientationFollowingWindowRootViewController alloc] initWithHostingViewController:self];
  id v5 = (SBIsolatedSceneOrientationFollowingWindow *)[[v3 alloc] initWithWindowScene:WeakRetained rootViewController:v4 role:@"SBTraitsParticipantRoleDeviceApplicationSceneViewOverlay" debugName:@"Scene Orientation-following Window"];
  appOverlayWindow = self->_appOverlayWindow;
  self->_appOverlayWindow = v5;

  [(SBIsolatedSceneOrientationFollowingWindow *)self->_appOverlayWindow setWindowLevel:-3.40282347e38];
  [(SBWindow *)self->_appOverlayWindow setHidden:0];
  [(SBIsolatedSceneOrientationFollowingWindow *)self->_appOverlayWindow setUserInteractionEnabled:1];
  v7 = [WeakRetained traitsArbiter];
  v8 = [v7 acquireParticipantWithRole:@"SBTraitsParticipantRoleDeviceApplicationSceneViewOverlay" delegate:self];
  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = v8;

  v10 = [(SBIsolatedSceneOrientationFollowingWrapperViewController *)self orientationDelegate];
  v11 = [v10 initialTraitsParticipantForOverlayContainer];

  [(SBIsolatedSceneOrientationFollowingWrapperViewController *)self _updateOrientationResolutionPolicyWithContainerTraitsParticipant:v11];
  [(TRAParticipant *)self->_traitsParticipant setNeedsUpdatePreferencesWithReason:@"register prefs"];
  [(TRAParticipant *)self->_traitsParticipant updatePreferencesIfNeeded];
  char v12 = [WeakRetained isContinuityDisplayWindowScene];
  id v13 = self->_appOverlayWindow;
  if (v12)
  {
    id v14 = [(SBIsolatedSceneOrientationFollowingWindow *)self->_appOverlayWindow layer];
    id v15 = CALayerGetContext();

    id v16 = (void *)MEMORY[0x1E4F42D90];
    v17 = [WeakRetained _FBSScene];
    v18 = [v16 _screenForScene:v17];
    [v18 _referenceBounds];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    v27 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F43218]), "initWithFrame:pid:contextID:", getpid(), objc_msgSend(v15, "contextId"), v20, v22, v24, v26);
    hostedOverlayView = self->_hostedOverlayView;
    self->_hostedOverlayView = v27;
  }
  else
  {
    v29 = NSString;
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    v32 = [v29 stringWithFormat:@"%@-%@", v31, self];
    v33 = [(UIWindow *)v13 sb_hostWrapperForUseInOrientation:1 hostRequester:v32];
    appOverlayHostWrapper = self->_appOverlayHostWrapper;
    self->_appOverlayHostWrapper = v33;

    v35 = [(SBWindowSelfHostWrapper *)self->_appOverlayHostWrapper hostView];
    id v15 = self->_hostedOverlayView;
    self->_hostedOverlayView = v35;
  }

  v36 = [SBIsolatedSceneOrientationFollowingContainerView alloc];
  v37 = -[SBIsolatedSceneOrientationFollowingContainerView initWithFrame:wrapperViewController:](v36, "initWithFrame:wrapperViewController:", self, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  containerView = self->_containerView;
  self->_containerView = v37;

  [(SBIsolatedSceneOrientationFollowingContainerView *)self->_containerView addSubview:self->_hostedOverlayView];
  [(SBIsolatedSceneOrientationFollowingWrapperViewController *)self setView:self->_containerView];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBIsolatedSceneOrientationFollowingWrapperViewController;
  -[SBIsolatedSceneOrientationFollowingWrapperViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  id v5 = [(SBIsolatedSceneOrientationFollowingWindow *)self->_appOverlayWindow overlayRootViewController];
  int v6 = [v5 view];
  v7 = [(UIViewController *)self->_contentViewController view];
  [(UIViewController *)self->_contentViewController beginAppearanceTransition:1 animated:v3];
  [v5 addChildViewController:self->_contentViewController];
  [v6 bounds];
  objc_msgSend(v7, "setFrame:");
  [v5 setOverlayContentView:v7];
  [(UIViewController *)self->_contentViewController didMoveToParentViewController:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBIsolatedSceneOrientationFollowingWrapperViewController;
  [(SBIsolatedSceneOrientationFollowingWrapperViewController *)&v4 viewDidAppear:a3];
  [(UIViewController *)self->_contentViewController endAppearanceTransition];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBIsolatedSceneOrientationFollowingWrapperViewController;
  -[SBIsolatedSceneOrientationFollowingWrapperViewController viewWillDisappear:](&v9, sel_viewWillDisappear_);
  id v5 = [(UIViewController *)self->_contentViewController parentViewController];
  int v6 = [(SBIsolatedSceneOrientationFollowingWindow *)self->_appOverlayWindow overlayRootViewController];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    self->_contentViewControllerBeingRemoved = 1;
    [(UIViewController *)self->_contentViewController beginAppearanceTransition:0 animated:v3];
    [(UIViewController *)self->_contentViewController willMoveToParentViewController:0];
    objc_super v8 = [(UIViewController *)self->_contentViewController view];
    [v8 removeFromSuperview];

    [(UIViewController *)self->_contentViewController removeFromParentViewController];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBIsolatedSceneOrientationFollowingWrapperViewController;
  [(SBIsolatedSceneOrientationFollowingWrapperViewController *)&v11 viewDidDisappear:a3];
  [(UIView *)self->_hostedOverlayView removeFromSuperview];
  hostedOverlayView = self->_hostedOverlayView;
  self->_hostedOverlayView = 0;

  [(SBWindowSelfHostWrapper *)self->_appOverlayHostWrapper stopHosting];
  appOverlayHostWrapper = self->_appOverlayHostWrapper;
  self->_appOverlayHostWrapper = 0;

  [(SBWindow *)self->_appOverlayWindow setHidden:1];
  if (self->_contentViewControllerBeingRemoved)
  {
    [(UIViewController *)self->_contentViewController endAppearanceTransition];
    int v6 = [(SBIsolatedSceneOrientationFollowingWindow *)self->_appOverlayWindow overlayRootViewController];
    [v6 setOverlayContentView:0];
  }
  appOverlayWindow = self->_appOverlayWindow;
  self->_appOverlayWindow = 0;

  [(BSInvalidatable *)self->_traitsResolutionPolicySpecifier invalidate];
  traitsResolutionPolicySpecifier = self->_traitsResolutionPolicySpecifier;
  self->_traitsResolutionPolicySpecifier = 0;

  [(TRAParticipant *)self->_traitsParticipant invalidate];
  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;

  traitsOrientationResolutionPolicy = self->_traitsOrientationResolutionPolicy;
  self->_traitsOrientationResolutionPolicy = 0;

  [(SBIsolatedSceneOrientationFollowingWrapperViewController *)self setView:0];
}

- (int64_t)currentInterfaceOrientation
{
  return [(SBIsolatedSceneOrientationFollowingWindow *)self->_appOverlayWindow _windowInterfaceOrientation];
}

- (BOOL)_canShowWhileLocked
{
  return self->_rendersWhileLocked;
}

- (SBDeviceApplicationSceneOverlayView)overlayView
{
  [(SBIsolatedSceneOrientationFollowingWrapperViewController *)self loadViewIfNeeded];
  containerView = self->_containerView;
  return (SBDeviceApplicationSceneOverlayView *)containerView;
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v5 = a4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __100__SBIsolatedSceneOrientationFollowingWrapperViewController_updatePreferencesForParticipant_updater___block_invoke;
  v6[3] = &unk_1E6AFC568;
  v6[4] = self;
  [v5 updateOrientationPreferencesWithBlock:v6];
  if (-[TRAOrientationResolutionPolicyInfo resolutionPolicy](self->_traitsOrientationResolutionPolicy, "resolutionPolicy") == 2)[v5 updateZOrderLevelPreferencesWithBlock:&__block_literal_global_146]; {
}
  }

void __100__SBIsolatedSceneOrientationFollowingWrapperViewController_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(*(void *)(a1 + 32) + 1088);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if ([WeakRetained shouldFollowSceneOrientation]) {
    uint64_t v4 = 30;
  }
  else {
    uint64_t v4 = [WeakRetained supportedInterfaceOrientations];
  }
  [v3 setSupportedOrientations:v4];
  objc_msgSend(v3, "setPreferredOrientation:", objc_msgSend(WeakRetained, "preferredInterfaceOrientationForPresentation"));
}

uint64_t __100__SBIsolatedSceneOrientationFollowingWrapperViewController_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPreferredZOrderLevel:*MEMORY[0x1E4F43CF8] + 5.0];
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  id v14 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "sbf_currentOrientation");
  if (self->_initialOrientationHasBeenApplied)
  {
    objc_super v8 = [v14 orientationActuationContext];
    objc_super v9 = [v8 animationSettings];
    [v9 duration];
    double v11 = v10;

    BOOL v12 = !self->_initialOrientationHasBeenApplied;
  }
  else
  {
    double v11 = 0.0;
    BOOL v12 = 1;
  }
  [(SBIsolatedSceneOrientationFollowingWindow *)self->_appOverlayWindow _legacySetRotatableViewOrientation:v7 duration:v12 force:v11];
  uint64_t v13 = objc_msgSend(v6, "sbf_previousOrientation");

  if (v13 != v7) {
    [(SBIsolatedSceneOrientationFollowingContainerView *)self->_containerView notifyObserversViewRotatedToOrientation:v7];
  }
  self->_initialOrientationHasBeenApplied = 1;
}

- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __120__SBIsolatedSceneOrientationFollowingWrapperViewController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke;
  v12[3] = &unk_1E6AF4E00;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [v10 appendBodySectionWithName:@"Associated Windows" multilinePrefix:a5 block:v12];
}

void __120__SBIsolatedSceneOrientationFollowingWrapperViewController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) participantAssociatedWindows:*(void *)(a1 + 40)];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v17 + 1) + 8 * v3);
        id v5 = *(void **)(a1 + 48);
        id v6 = NSString;
        uint64_t v7 = (objc_class *)objc_opt_class();
        id v8 = NSStringFromClass(v7);
        id v9 = [v4 _debugName];
        if ([v4 isHidden]) {
          id v10 = @"NO";
        }
        else {
          id v10 = @"YES";
        }
        [v4 interfaceOrientation];
        id v11 = BSInterfaceOrientationDescription();
        BOOL v12 = [v4 rootViewController];
        objc_msgSend(v6, "stringWithFormat:", @"<%@: %p; %@>; Visible:%@; Orientation:%@; Root VC: %@",
          v8,
          v4,
          v9,
          v10,
          v11,
        id v13 = v12);
        [v5 appendString:v13 withName:0];

        ++v3;
      }
      while (v2 != v3);
      uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v2);
  }
}

- (id)participantAssociatedWindows:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (self->_appOverlayWindow)
  {
    v5[0] = self->_appOverlayWindow;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)_containerViewDidSetCenter:(CGPoint)a3
{
  hostedOverlayView = self->_hostedOverlayView;
  [(SBIsolatedSceneOrientationFollowingContainerView *)self->_containerView center];
  -[UIView setCenter:](hostedOverlayView, "setCenter:");
}

- (void)_containerViewDidSetBounds:(CGRect)a3
{
  uint64_t v4 = [(SBIsolatedSceneOrientationFollowingWindow *)self->_appOverlayWindow rootViewController];
  id v7 = [v4 view];

  [v7 setNeedsLayout];
  if ([(SBIsolatedSceneOrientationFollowingContainerView *)self->_containerView shouldLayoutOverlayImmediatelyForContainerGeometryChange])
  {
    id v5 = [(SBIsolatedSceneOrientationFollowingWindow *)self->_appOverlayWindow rootViewController];
    id v6 = [v5 view];
    [v6 layoutIfNeeded];
  }
}

- (void)_containerViewDidSetHostOrientation:(int64_t)a3
{
  [(TRAParticipant *)self->_traitsParticipant setNeedsUpdatePreferencesWithReason:@"scene view updated hostOrientation"];
  traitsParticipant = self->_traitsParticipant;
  [(TRAParticipant *)traitsParticipant updatePreferencesIfNeeded];
}

- (void)_containerViewDidSetAllowsTouchPassthrough:(BOOL)a3
{
  appOverlayHostWrapper = self->_appOverlayHostWrapper;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __103__SBIsolatedSceneOrientationFollowingWrapperViewController__containerViewDidSetAllowsTouchPassthrough___block_invoke;
  v4[3] = &__block_descriptor_33_e43_v16__0__UIMutableScenePresentationContext_8l;
  BOOL v5 = a3;
  [(SBWindowSelfHostWrapper *)appOverlayHostWrapper modifyPresentationContext:v4];
}

uint64_t __103__SBIsolatedSceneOrientationFollowingWrapperViewController__containerViewDidSetAllowsTouchPassthrough___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShouldPassthroughHitTestEventsIfTransparent:*(unsigned __int8 *)(a1 + 32)];
}

- (int64_t)_hostOrientation
{
  return [(SBIsolatedSceneOrientationFollowingContainerView *)self->_containerView hostOrientation];
}

- (BOOL)_isSceneStatusBarHidden
{
  uint64_t v2 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle statusBarStateProvider];
  char v3 = [v2 statusBarHidden];

  return v3;
}

- (CGRect)_boundsForOverlayRootView
{
  [(SBIsolatedSceneOrientationFollowingContainerView *)self->_containerView bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = v5;
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  int64_t v10 = [(SBIsolatedSceneOrientationFollowingContainerView *)self->_containerView hostOrientation];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_orientationDelegate);
  if ([WeakRetained shouldFollowSceneOrientation])
  {
    BOOL v12 = (unint64_t)(v10 - 3) < 2;
LABEL_4:
    double v14 = v4;
    goto LABEL_6;
  }
  uint64_t v13 = [WeakRetained supportedInterfaceOrientations];
  BOOL v12 = (unint64_t)(v10 - 3) < 2;
  if (((1 << v10) & (unint64_t)~v13) == 0) {
    goto LABEL_4;
  }
  double v14 = v7;
  double v7 = v4;
LABEL_6:
  if (v12)
  {
    double v6 = v14;
    double v4 = v7;
  }

  double v15 = v8;
  double v16 = v9;
  double v17 = v4;
  double v18 = v6;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (SBIsolatedSceneOrientationFollowingWrapperOrientationDelegate)orientationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_orientationDelegate);
  return (SBIsolatedSceneOrientationFollowingWrapperOrientationDelegate *)WeakRetained;
}

- (void)setOrientationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_orientationDelegate);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_hostedOverlayView, 0);
  objc_storeStrong((id *)&self->_appOverlayHostWrapper, 0);
  objc_storeStrong((id *)&self->_traitsOrientationResolutionPolicy, 0);
  objc_storeStrong((id *)&self->_traitsResolutionPolicySpecifier, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_appOverlayWindow, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
}

@end