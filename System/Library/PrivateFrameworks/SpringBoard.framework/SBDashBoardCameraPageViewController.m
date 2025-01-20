@interface SBDashBoardCameraPageViewController
+ (BOOL)isAvailableForConfiguration;
+ (unint64_t)requiredCapabilities;
- (BOOL)_shouldCancelInteractiveDismissGesture;
- (BOOL)_shouldPrelaunchOnSwipe;
- (BOOL)_shouldPrewarmOnSwipe;
- (BOOL)canHostAnApp;
- (BOOL)dashBoardHostedAppViewController:(id)a3 shouldTransitionToMode:(int64_t)a4;
- (BOOL)handleEvent:(id)a3;
- (BOOL)handlesRotationIndependentOfCoverSheet;
- (BOOL)homeGestureInteraction:(id)a3 shouldBeginGestureRecognizerOfType:(int64_t)a4;
- (BOOL)homeGestureInteraction:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)homeGestureInteraction:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isHostingAnApp;
- (BOOL)wantsHomeGestureOwnership;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CGPoint)_convertTranslationFromContainerOrientationToContentOrientation:(CGPoint)a3;
- (CSHostableEntity)hostedEntity;
- (NSSet)actionsToDeliver;
- (SBAudioCategoryZStackPolicyAssistant)audioCategoryZStackPolicyAssistant;
- (SBDashBoardCameraPageViewControllerDelegate)cameraPageDelegate;
- (SBFFluidBehaviorSettings)alphaSettings;
- (SBFFluidBehaviorSettings)scaleSettings;
- (SBFZStackParticipant)zStackParticipant;
- (SBHomeGestureInteraction)homeGestureInteraction;
- (SBPhysicalButtonZStackPolicyAssistant)physicalButtonZStackPolicyAssistant;
- (SBSystemApertureZStackPolicyAssistant)systemApertureZStackPolicyAssistant;
- (UIViewFloatAnimatableProperty)alphaProperty;
- (UIViewFloatAnimatableProperty)scaleProperty;
- (double)_prelaunchThreshold;
- (double)_prewarmThreshold;
- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3;
- (id)_hostedContentModeDescription;
- (id)_prewarmingCameraBundleIdentifier;
- (id)_traitsArbiter;
- (id)acquireLiveContentAssertionForReason:(id)a3;
- (id)customScreenEdgePanGestureRecognizerForHomeGestureInteraction:(id)a3;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (id)pageRole;
- (id)requestedDismissalSettings;
- (int64_t)_sbAnimationUpdateModeForCoverSheetTransitionMode:(int64_t)a3;
- (int64_t)presentationAltitude;
- (int64_t)requestedDismissalType;
- (unint64_t)homeGestureInteraction:(id)a3 systemGestureTypeForType:(int64_t)a4;
- (void)_acquireTraitsParticipantIfNeeded;
- (void)_addOrRemoveGestureForCurrentSettings;
- (void)_bailIfFaceTimeCallComesIn;
- (void)_coolCameraIfNecessary;
- (void)_createProperties;
- (void)_endPrewarmBackoffPeriod;
- (void)_ensureZStackParticipant;
- (void)_invalidateCameraTraitsParticipant;
- (void)_invalidateZStackParticipantIfNeeded;
- (void)_makeApplicationStatic;
- (void)_noteUserLaunchEventTime;
- (void)_prepareForInteractiveGestureToCameraVisible:(BOOL)a3;
- (void)_prewarmCameraInteractively:(BOOL)a3;
- (void)_relinquishHiddenAssertionForHomeGrabber:(id)a3;
- (void)_requestHomeGestureOwnership;
- (void)_resetAfterInteractiveGestureToCameraVisible:(BOOL)a3;
- (void)_resetHostedEntityToDefault;
- (void)_setSceneGrabberHidden:(BOOL)a3;
- (void)_takeHiddenAssertionForHomeGrabber:(id)a3;
- (void)_transitionAppViewWithProgress:(double)a3 transitionMode:(int64_t)a4;
- (void)_updateCameraScale:(double)a3 dimmingAlpha:(double)a4;
- (void)_updateCameraScale:(double)a3 dimmingAlpha:(double)a4 transitionMode:(int64_t)a5;
- (void)_updateCameraScale:(double)a3 transitionMode:(int64_t)a4;
- (void)_updateDimmingAlpha:(double)a3 transitionMode:(int64_t)a4;
- (void)_updateForPropertyChangedForPresentation:(BOOL)a3;
- (void)_updateZStackPolicyAssistants;
- (void)accidentalActivationMitigationSessionCoordinator:(id)a3 didCancelMitigationSession:(id)a4;
- (void)accidentalActivationMitigationSessionCoordinator:(id)a3 didMitigateMitigationSession:(id)a4;
- (void)accidentalActivationMitigationSessionCoordinator:(id)a3 didStartMitigationSession:(id)a4;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)didTransitionToVisible:(BOOL)a3;
- (void)handleAction:(id)a3 fromSender:(id)a4;
- (void)homeGestureInteractionBegan:(id)a3;
- (void)homeGestureInteractionChanged:(id)a3;
- (void)homeGestureInteractionEnded:(id)a3;
- (void)homeGrabberViewDidReceiveClick:(id)a3;
- (void)hostableEntityPresenter:(id)a3 didBeginHosting:(id)a4;
- (void)hostableEntityPresenter:(id)a3 didEndHosting:(id)a4;
- (void)hostableEntityPresenter:(id)a3 didFailToActivate:(id)a4;
- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3;
- (void)loadView;
- (void)noteDefaultHostableEntityMayHaveChanged;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5;
- (void)setActionsToDeliver:(id)a3;
- (void)setAlphaProperty:(id)a3;
- (void)setAlphaSettings:(id)a3;
- (void)setAudioCategoryZStackPolicyAssistant:(id)a3;
- (void)setCameraPageDelegate:(id)a3;
- (void)setHomeGestureInteraction:(id)a3;
- (void)setHostedEntity:(id)a3;
- (void)setPhysicalButtonZStackPolicyAssistant:(id)a3;
- (void)setScaleProperty:(id)a3;
- (void)setScaleSettings:(id)a3;
- (void)setSystemApertureZStackPolicyAssistant:(id)a3;
- (void)setWantsHomeGestureOwnership:(BOOL)a3;
- (void)setZStackParticipant:(id)a3;
- (void)updateTransitionToVisible:(BOOL)a3 progress:(double)a4 mode:(int64_t)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillMoveToWindow:(id)a3;
- (void)willTransitionToVisible:(BOOL)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBDashBoardCameraPageViewController

- (BOOL)isHostingAnApp
{
  appViewController = self->_appViewController;
  if (!appViewController) {
    appViewController = self->_hostedEntityViewController;
  }
  return [appViewController isHostingAnApp];
}

- (void)aggregateBehavior:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDashBoardCameraPageViewController;
  [(CSPageViewController *)&v8 aggregateBehavior:v4];
  [v4 addRestrictedCapabilities:4104];
  [v4 addRestrictedCapabilities:64];
  [v4 setScrollingStrategy:3];
  [v4 setIdleTimerDuration:10];
  [v4 setIdleWarnMode:2];
  [v4 setIdleTimerMode:1];
  [v4 unionBehavior:self->_appViewController];
  [v4 unionBehavior:self->_hostedEntityViewController];
  if ([v4 idleTimerDuration] == 12)
  {
    [v4 setIdleTimerDuration:13];
    [v4 setIdleWarnMode:2];
  }
  v5 = [(id)SBApp accidentalActivationMitigationSessionCoordinator];
  v6 = [v5 currentSession];
  uint64_t v7 = [v6 state];

  if (v7 == 1) {
    [v4 setNotificationBehavior:1];
  }
}

- (void)hostableEntityPresenter:(id)a3 didBeginHosting:(id)a4
{
  id v13 = a3;
  hostedEntityViewController = self->_hostedEntityViewController;
  id v7 = a4;
  id v8 = [(CSHostedEntityViewController *)hostedEntityViewController hostedEntity];

  if (v7 && v8 == v7)
  {
    if ([(SBDashBoardCameraPageViewController *)self bs_isAppearingOrAppeared]) {
      [(SBDashBoardCameraPageViewController *)self _acquireTraitsParticipantIfNeeded];
    }
    v9 = [v13 sceneHandleForTraitsParticipant];
    v10 = [v9 scene];

    if (!v10)
    {
      v10 = [v13 sceneForTraitsParticipant];
    }
    v11 = [(SBTraitsOrientedContentViewController *)self->_orientedContentViewController view];
    v12 = [v10 settings];
    [v12 frame];
    objc_msgSend(v11, "setContentViewBoundsInReferenceSpace:");

    [(SBDashBoardCameraPageViewController *)self _updateZStackPolicyAssistants];
  }
}

- (void)_updateZStackPolicyAssistants
{
  v22[1] = *MEMORY[0x1E4F143B8];
  hostedEntityViewController = self->_hostedEntityViewController;
  if (hostedEntityViewController)
  {
    id v4 = [(CSHostedEntityViewController *)hostedEntityViewController sceneHandleForTraitsParticipant];
    if (v4)
    {
      uint64_t v5 = objc_opt_class();
      id v6 = v4;
      if (v5)
      {
        if (objc_opt_isKindOfClass()) {
          id v7 = v6;
        }
        else {
          id v7 = 0;
        }
      }
      else
      {
        id v7 = 0;
      }
      id v15 = v7;

      if (v15)
      {
        v18 = [(CSHostedEntityViewController *)self->_hostedEntityViewController homeGrabberViewForTraitsParticipant];
        -[SBSystemApertureZStackPolicyAssistant setForegroundExclusiveSceneHandle:homeGrabberView:]((uint64_t)self->_systemApertureZStackPolicyAssistant, v15, v18);
      }
      v22[0] = v6;
      v16 = v22;
    }
    else
    {
      uint64_t v14 = [(CSHostedEntityViewController *)self->_hostedEntityViewController sceneForTraitsParticipant];
      id v15 = (id)v14;
      if (!v14)
      {
        v19 = 0;
        goto LABEL_27;
      }
      uint64_t v21 = v14;
      v16 = &v21;
    }
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  else
  {
    id v4 = [(SBDashBoardHostedAppViewController *)self->_appViewController appView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      appViewController = self->_appViewController;
      id v9 = v4;
      v10 = [(SBDashBoardHostedAppViewController *)appViewController applicationSceneHandle];
      uint64_t v11 = objc_opt_class();
      id v12 = v10;
      if (v11)
      {
        if (objc_opt_isKindOfClass()) {
          id v13 = v12;
        }
        else {
          id v13 = 0;
        }
      }
      else
      {
        id v13 = 0;
      }
      id v17 = v13;

      id v15 = [v9 homeGrabberView];
    }
    else
    {
      id v17 = 0;
      id v15 = 0;
    }
    -[SBSystemApertureZStackPolicyAssistant setForegroundExclusiveSceneHandle:homeGrabberView:]((uint64_t)self->_systemApertureZStackPolicyAssistant, v17, v15);
    if (v17)
    {
      id v20 = v17;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    }
    else
    {
      v19 = 0;
    }
  }
LABEL_27:

  [(SBZStackForegroundSceneOrderedPolicyAssistant *)self->_audioCategoryZStackPolicyAssistant setForegroundScenes:v19];
  [(SBZStackForegroundSceneOrderedPolicyAssistant *)self->_physicalButtonZStackPolicyAssistant setForegroundScenes:v19];
}

- (NSSet)actionsToDeliver
{
  v3 = [(SBDashBoardHostedAppViewController *)self->_appViewController actionsToDeliver];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CSHostedEntityViewController *)self->_hostedEntityViewController actionsToDeliverToHostableEntity];
  }
  id v6 = v5;

  return (NSSet *)v6;
}

- (void)setActionsToDeliver:(id)a3
{
  appViewController = self->_appViewController;
  id v5 = a3;
  [(SBDashBoardHostedAppViewController *)appViewController setActionsToDeliver:v5];
  [(CSHostedEntityViewController *)self->_hostedEntityViewController setActionsToDeliverToHostableEntity:v5];
}

- (void)setHostedEntity:(id)a3
{
  id v5 = (CSHostableEntity *)a3;
  if (self->_hostedEntity != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_hostedEntity, a3);
    [(CSHostedEntityViewController *)self->_hostedEntityViewController setHostedEntity:self->_hostedEntity];
    id v5 = v6;
  }
}

- (void)setCameraPageDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraPageDelegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_cameraPageDelegate, obj);
    [(SBDashBoardCameraPageViewController *)self _resetHostedEntityToDefault];
    id v5 = obj;
  }
}

- (void)noteDefaultHostableEntityMayHaveChanged
{
  if ([(CSCoverSheetViewControllerBase *)self isDisappeared])
  {
    [(SBDashBoardCameraPageViewController *)self _resetHostedEntityToDefault];
  }
}

- (id)acquireLiveContentAssertionForReason:(id)a3
{
  return (id)[(CSHostedEntityViewController *)self->_hostedEntityViewController acquireLiveContentAssertionForReason:a3];
}

- (void)loadView
{
  v70.receiver = self;
  v70.super_class = (Class)SBDashBoardCameraPageViewController;
  [(CSCoverSheetViewControllerBase *)&v70 loadView];
  v3 = [(CSPageViewController *)self view];
  [(SBDashBoardCameraPageViewController *)self _createProperties];
  id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [v3 bounds];
  id v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  maskView = self->_maskView;
  self->_maskView = v5;

  [(UIView *)self->_maskView setClipsToBounds:1];
  id v7 = self->_maskView;
  unint64_t v8 = 0x1E4F42000uLL;
  id v9 = [MEMORY[0x1E4F428B8] blackColor];
  [(UIView *)v7 setBackgroundColor:v9];

  [(UIView *)self->_maskView setAutoresizingMask:18];
  [v3 addSubview:self->_maskView];
  v10 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  uint64_t v11 = [v10 policyAggregator];
  int v12 = [v11 allowsCapability:10];

  if (v12)
  {
    id v13 = [SBDeviceApplicationSceneEntity alloc];
    uint64_t v14 = +[SBApplicationController sharedInstance];
    id v15 = [v14 cameraApplication];
    v16 = [(SBDeviceApplicationSceneEntity *)v13 initWithApplicationForMainDisplay:v15];

    id v17 = [(SBDeviceApplicationScenePlaceholderContentContext *)[SBMutableDeviceApplicationScenePlaceholderContentContext alloc] initWithActivationSettings:v16];
    [(SBDeviceApplicationScenePlaceholderContentContext *)v17 setPrefersLiveXIB:1];
    if (LCSFeatureEnabled())
    {
      v18 = (CSHostedEntityViewController *)objc_alloc_init(MEMORY[0x1E4F5E400]);
      hostedEntityViewController = self->_hostedEntityViewController;
      self->_hostedEntityViewController = v18;

      [(CSHostedEntityViewController *)self->_hostedEntityViewController setEntityPresenterDelegate:self];
      id v20 = self->_hostedEntityViewController;
      uint64_t v21 = +[SBLockScreenManager sharedInstance];
      v22 = [v21 coverSheetViewController];
      [(CSHostedEntityViewController *)v20 setCoverSheetViewController:v22];

      if (SBFEffectiveHomeButtonType() == 2)
      {
        v23 = objc_alloc_init(SBHomeGrabberView);
        [(SBHomeGrabberView *)v23 setAutoHides:1];
        [(CSHostedEntityViewController *)self->_hostedEntityViewController setHomeGrabberView:v23];
      }
      v24 = [[SBDashBoardApplicationHostableEntity alloc] initWithApplicationSceneEntity:v16];
      hostedEntity = self->_hostedEntity;
      self->_hostedEntity = (CSHostableEntity *)v24;

      [(CSHostedEntityViewController *)self->_hostedEntityViewController setHostedEntity:self->_hostedEntity];
      [(CSHostedEntityViewController *)self->_hostedEntityViewController setPresenter:self];
      unint64_t v8 = 0x1E4F42000;
    }
    else
    {
      v26 = [[SBDashBoardHostedAppViewController alloc] initWithApplicationSceneEntity:v16];
      appViewController = self->_appViewController;
      self->_appViewController = v26;

      [(SBDashBoardHostedAppViewController *)self->_appViewController setPlaceholderContentContext:v17];
      [(SBDashBoardHostedAppViewController *)self->_appViewController setDelegate:self];
      [(CSCoverSheetViewControllerBase *)self->_appViewController setPresenter:self];
      v28 = [(SBDashBoardHostedAppViewController *)self->_appViewController applicationSceneHandle];
      [v28 addObserver:self];
    }
    v29 = self->_appViewController;
    if (!v29) {
      v29 = self->_hostedEntityViewController;
    }
    v30 = v29;
    int v31 = SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheetCamera");
    v32 = v30;
    if (v31)
    {
      v33 = [[SBTraitsOrientedContentViewController alloc] initWithNibName:0 bundle:0];
      orientedContentViewController = self->_orientedContentViewController;
      self->_orientedContentViewController = v33;

      v35 = [(SBTraitsOrientedContentViewController *)self->_orientedContentViewController view];
      v36 = [(CSPageViewController *)self view];
      [v36 bounds];
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;

      objc_msgSend(v35, "setFrame:", v38, v40, v42, v44);
      objc_msgSend(v35, "setContentViewBoundsInReferenceSpace:", v38, v40, v42, v44);
      [v35 setAutoresizingMask:18];
      v65 = self->_orientedContentViewController;
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __47__SBDashBoardCameraPageViewController_loadView__block_invoke;
      v67[3] = &unk_1E6AF53D0;
      id v68 = v35;
      v45 = v30;
      v46 = v30;
      v47 = v3;
      v48 = v16;
      v49 = v17;
      unint64_t v50 = v8;
      v51 = v45;
      v69 = v45;
      id v52 = v35;
      v53 = v51;
      unint64_t v8 = v50;
      id v17 = v49;
      v16 = v48;
      v3 = v47;
      v30 = v46;
      [(SBTraitsOrientedContentViewController *)v65 bs_addChildViewController:v53 animated:0 transitionBlock:v67];

      v32 = self->_orientedContentViewController;
    }
    objc_storeStrong((id *)&self->_appViewControllerContainerVC, v32);
    v54 = [(UIViewController *)self->_appViewControllerContainerVC view];
    [v54 _setContinuousCornerRadius:SBScreenDisplayCornerRadius()];

    appViewControllerContainerVC = self->_appViewControllerContainerVC;
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __47__SBDashBoardCameraPageViewController_loadView__block_invoke_2;
    v66[3] = &unk_1E6AF6698;
    v66[4] = self;
    [(SBDashBoardCameraPageViewController *)self bs_addChildViewController:appViewControllerContainerVC animated:0 transitionBlock:v66];
  }
  id v56 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [v3 bounds];
  v57 = (UIView *)objc_msgSend(v56, "initWithFrame:");
  tintView = self->_tintView;
  self->_tintView = v57;

  v59 = self->_tintView;
  v60 = [*(id *)(v8 + 2232) blackColor];
  [(UIView *)v59 setBackgroundColor:v60];

  [(UIView *)self->_tintView setAutoresizingMask:18];
  [(UIView *)self->_maskView addSubview:self->_tintView];
  v61 = [MEMORY[0x1E4F5E408] rootSettings];
  prototypeSettings = self->_prototypeSettings;
  self->_prototypeSettings = v61;

  v63 = (SBLockScreenDefaults *)objc_alloc_init(MEMORY[0x1E4FA60B0]);
  lockScreenDefaults = self->_lockScreenDefaults;
  self->_lockScreenDefaults = v63;
}

void __47__SBDashBoardCameraPageViewController_loadView__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) view];
  [v1 setContentView:v2];
}

void __47__SBDashBoardCameraPageViewController_loadView__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 1112);
  id v3 = [*(id *)(v1 + 1176) view];
  [v2 addSubview:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardCameraPageViewController;
  [(CSCoverSheetViewControllerBase *)&v5 viewWillAppear:a3];
  id v4 = +[SBReachabilityManager sharedInstance];
  [v4 setReachabilityTemporarilyDisabled:1 forReason:@"SBDashBoardCameraPageReason"];

  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheetCamera")) {
    [(SBDashBoardCameraPageViewController *)self _acquireTraitsParticipantIfNeeded];
  }
  if ([(SBDashBoardHostedAppViewController *)self->_appViewController mode] != 2) {
    [(SBDashBoardHostedAppViewController *)self->_appViewController setMode:1];
  }
  [(CSHostedEntityViewController *)self->_hostedEntityViewController setHostableEntityContentMode:2];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardCameraPageViewController;
  [(CSCoverSheetViewControllerBase *)&v5 viewDidAppear:a3];
  id v4 = [(id)SBApp accidentalActivationMitigationSessionCoordinator];
  [v4 addObserver:self];

  [(SBDashBoardCameraPageViewController *)self _ensureZStackParticipant];
  [(SBDashBoardCameraPageViewController *)self _addOrRemoveGestureForCurrentSettings];
  [(SBDashBoardCameraPageViewController *)self _updateZStackPolicyAssistants];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardCameraPageViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillDisappear:a3];
  [(SBDashBoardCameraPageViewController *)self setWantsHomeGestureOwnership:0];
  [(SBDashBoardCameraPageViewController *)self _addOrRemoveGestureForCurrentSettings];
  [(SBDashBoardCameraPageViewController *)self _invalidateZStackParticipantIfNeeded];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CSHostedEntityViewController *)self->_hostedEntityViewController setHostableEntityContentMode:1];
  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardCameraPageViewController;
  [(CSCoverSheetViewControllerBase *)&v7 viewDidDisappear:v3];
  objc_super v5 = [(id)SBApp accidentalActivationMitigationSessionCoordinator];
  [v5 removeObserver:self];

  [(SBDashBoardCameraPageViewController *)self _resetHostedEntityToDefault];
  [(SBDashBoardCameraPageViewController *)self _invalidateCameraTraitsParticipant];
  id v6 = +[SBReachabilityManager sharedInstance];
  [v6 setReachabilityTemporarilyDisabled:0 forReason:@"SBDashBoardCameraPageReason"];
}

- (void)viewWillMoveToWindow:(id)a3
{
  if (!a3)
  {
    [(SBDashBoardHostedAppViewController *)self->_appViewController setMode:1];
    hostedEntityViewController = self->_hostedEntityViewController;
    [(CSHostedEntityViewController *)hostedEntityViewController setHostableEntityContentMode:1];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBDashBoardCameraPageViewController;
  [(SBDashBoardCameraPageViewController *)&v12 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6)
  {
    objc_super v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = [(SBDashBoardCameraPageViewController *)self _hostedContentModeDescription];
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "View did move to window: %@, with mode: %@", buf, 0x16u);
    }
  }
  else
  {
    [(SBDashBoardHostedAppViewController *)self->_appViewController setMode:1];
    [(CSHostedEntityViewController *)self->_hostedEntityViewController setHostableEntityContentMode:1];
    orientedContentViewController = self->_orientedContentViewController;
    uint64_t v10 = objc_opt_class();
    objc_super v7 = SBSafeCast(v10, 0);
    uint64_t v11 = [v7 traitsParticipant];
    [(SBTraitsOrientedContentViewController *)orientedContentViewController setContainerParticipant:v11];
  }
}

- (void)willTransitionToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardCameraPageViewController;
  -[CSPageViewController willTransitionToVisible:](&v6, sel_willTransitionToVisible_);
  objc_super v5 = [(UIViewController *)self->_appViewControllerContainerVC view];
  [v5 setClipsToBounds:1];

  if (v3)
  {
    self->_hasWarmedCameraForThisPresentation = 0;
    self->_cameraPrewarmSucceeded = 0;
    self->_cameraPresentLargestPercent = 0;
  }
}

- (void)updateTransitionToVisible:(BOOL)a3 progress:(double)a4 mode:(int64_t)a5
{
  BOOL v7 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)SBDashBoardCameraPageViewController;
  -[CSPageViewController updateTransitionToVisible:progress:mode:](&v26, sel_updateTransitionToVisible_progress_mode_);
  if (!v7) {
    a4 = 1.0 - a4;
  }
  [(SBDashBoardCameraPageViewController *)self _transitionAppViewWithProgress:a5 transitionMode:a4];
  self->_cameraPresentLargestPercent = vcvtmd_s64_f64(a4 * 100.0);
  BOOL v10 = [(SBDashBoardCameraPageViewController *)self _shouldPrewarmOnSwipe];
  [(SBDashBoardCameraPageViewController *)self _prewarmThreshold];
  if (v7 && v10 && BSFloatGreaterThanOrEqualToFloat())
  {
    uint64_t v11 = [(CSPageViewController *)self view];
    objc_super v12 = [v11 window];

    if (v12 && ([v12 isHidden] & 1) == 0 && !self->_hasWarmedCameraForThisPresentation)
    {
      id v13 = SBLogDashBoard();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Prewarming Camera for swipe.", buf, 2u);
      }

      [(SBDashBoardCameraPageViewController *)self _prewarmCameraInteractively:a5 == 3];
      self->_hasWarmedCameraForThisPresentation = 1;
      self->_cameraPrewarmSucceeded = 0;
    }
  }
  BOOL v14 = [(SBDashBoardCameraPageViewController *)self _shouldPrelaunchOnSwipe];
  [(SBDashBoardCameraPageViewController *)self _prelaunchThreshold];
  if (v7 && v14 && BSFloatGreaterThanOrEqualToFloat())
  {
    __int16 v15 = [(CSPageViewController *)self view];
    v16 = [v15 window];

    if (v16 && ([v16 isHidden] & 1) == 0)
    {
      hostedEntityViewController = self->_hostedEntityViewController;
      if (!hostedEntityViewController)
      {
        if ([(SBDashBoardHostedAppViewController *)self->_appViewController mode] != 2)
        {
          [(SBDashBoardCameraPageViewController *)self _noteUserLaunchEventTime];
          [(SBDashBoardHostedAppViewController *)self->_appViewController setMode:2];
          SBEmitEvent(44);
        }
        goto LABEL_27;
      }
      if ([(CSHostedEntityViewController *)hostedEntityViewController hostableEntityContentMode] == 2)
      {
LABEL_27:

        goto LABEL_28;
      }
      [(SBDashBoardCameraPageViewController *)self _noteUserLaunchEventTime];
      [(CSHostedEntityViewController *)self->_hostedEntityViewController setHostableEntityContentMode:2];
      v19 = [MEMORY[0x1E4FA5E78] sharedInstance];
      [v19 emitEvent:44];
    }
    else
    {
      uint64_t v17 = +[SBPlatformController sharedInstance];
      int v18 = [v17 isInternalInstall];

      if (v18)
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        appViewController = self->_appViewController;
        if (!appViewController) {
          appViewController = self->_hostedEntityViewController;
        }
        v25 = NSStringFromSBAppViewControllerMode(2);
        [v23 handleFailureInMethod:a2, self, @"SBDashBoardCameraPageViewController.m", 376, @"Preconditions for changing the mode of <%@> to <%@> not met. Ignoring.", appViewController, v25 object file lineNumber description];
      }
      v19 = SBLogDashBoard();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = self->_appViewController;
        if (!v20) {
          id v20 = self->_hostedEntityViewController;
        }
        uint64_t v21 = NSStringFromSBAppViewControllerMode(2);
        *(_DWORD *)buf = 138412546;
        v28 = v20;
        __int16 v29 = 2112;
        v30 = v21;
        _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Preconditions for changing the mode of <%@> to <%@> not met. Ignoring.", buf, 0x16u);
      }
    }

    goto LABEL_27;
  }
LABEL_28:
  if (!v7)
  {
    if (BSFloatIsOne()) {
      [(SBDashBoardCameraPageViewController *)self _makeApplicationStatic];
    }
  }
}

- (void)didTransitionToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDashBoardCameraPageViewController;
  -[CSPageViewController didTransitionToVisible:](&v8, sel_didTransitionToVisible_);
  objc_super v5 = [(UIViewController *)self->_appViewControllerContainerVC view];
  [v5 setClipsToBounds:0];

  [(SBTraitsSceneParticipantDelegate *)self->_traitsParticipantDelegate setCanDetermineActiveOrientation:v3];
  [(TRAParticipant *)self->_traitsParticipant setNeedsUpdatePreferencesWithReason:@"did transition to visible"];
  double v6 = 0.0;
  if (v3) {
    double v6 = 1.0;
  }
  [(SBDashBoardCameraPageViewController *)self _transitionAppViewWithProgress:3 transitionMode:v6];
  [(SBDashBoardCameraPageViewController *)self _resetAfterInteractiveGestureToCameraVisible:v3];
  if (v3)
  {
    self->_cameraPrewarmSucceeded = 1;
    self->_cameraPresentLargestPercent = 100;
    [(NSTimer *)self->_prewarmCancelTimer invalidate];
    prewarmCancelTimer = self->_prewarmCancelTimer;
    self->_prewarmCancelTimer = 0;
  }
  else
  {
    [(SBDashBoardCameraPageViewController *)self _makeApplicationStatic];
  }
}

- (int64_t)requestedDismissalType
{
  return SBFEffectiveHomeButtonType() == 2;
}

- (id)requestedDismissalSettings
{
  id v2 = (void *)MEMORY[0x1E4F4F840];
  BOOL v3 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  BOOL v4 = [v2 settingsWithMass:v3 stiffness:1.0 damping:236.82201 epsilon:30.77804 timingFunction:0.01];
  objc_super v5 = (void *)[v4 mutableCopy];

  CAFrameRateRange v8 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v5, "setPreferredFrameRateRange:", *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
  [v5 setHighFrameRateReason:1114127];
  return v5;
}

- (void)_transitionAppViewWithProgress:(double)a3 transitionMode:(int64_t)a4
{
  double v6 = [(UIViewController *)self->_appViewControllerContainerVC view];
  BOOL v7 = [v6 window];
  [v7 center];
  [v7 center];
  objc_msgSend(v7, "convertPoint:toView:", self->_maskView);
  objc_msgSend(v6, "setCenter:");
  [v7 bounds];
  objc_msgSend(v6, "setBounds:");
  if (!self->_interactiveDismissalInProgress)
  {
    BSIntervalMap();
    double v9 = v8;
    BSIntervalMap();
    -[SBDashBoardCameraPageViewController _updateCameraScale:dimmingAlpha:transitionMode:](self, "_updateCameraScale:dimmingAlpha:transitionMode:", a4, v9, 1.0 - v10, 0, 1, 0x3FF0000000000000, 1, 0x3FD6666666666666, 1, 0x3FF0000000000000, 1);
  }
}

- (void)_makeApplicationStatic
{
  [(SBDashBoardHostedAppViewController *)self->_appViewController setMode:1];
  hostedEntityViewController = self->_hostedEntityViewController;
  [(CSHostedEntityViewController *)hostedEntityViewController setHostableEntityContentMode:1];
}

- (void)aggregateAppearance:(id)a3
{
  v47.receiver = self;
  v47.super_class = (Class)SBDashBoardCameraPageViewController;
  id v4 = a3;
  [(CSPageViewController *)&v47 aggregateAppearance:v4];
  objc_super v5 = objc_opt_new();
  double v6 = [v5 priority:10];
  BOOL v7 = [v6 suppressHorizontalBounce:0];
  [v4 addComponent:v7];

  double v8 = [MEMORY[0x1E4F5E3C0] dateView];
  double v9 = [v8 priority:10];
  double v10 = [v9 hidden:1];
  [v4 addComponent:v10];

  uint64_t v11 = [MEMORY[0x1E4F5E3C0] wallpaper];
  objc_super v12 = [v11 priority:10];
  id v13 = [v12 hidden:0];
  [v4 addComponent:v13];

  BOOL v14 = objc_opt_new();
  __int16 v15 = [v14 priority:10];
  v16 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
  uint64_t v17 = [v15 identifier:v16];
  int v18 = [v17 suppressTeachableMomentsAnimation:1];
  v19 = [v18 hidden:1];
  [v4 addComponent:v19];

  id v20 = objc_opt_new();
  uint64_t v21 = [v20 priority:10];
  v22 = [v21 optOutOfAlphaFadesForPageScroll:1];
  v23 = [v22 hidden:1];
  [v4 addComponent:v23];

  v24 = objc_opt_new();
  v25 = [v24 priority:10];
  objc_super v26 = [v25 shouldMatchMove:0];
  [v4 addComponent:v26];

  [(SBDashBoardCameraPageViewController *)self _setSceneGrabberHidden:[(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture] ^ 1];
  v27 = objc_opt_new();
  v28 = [v27 priority:10];
  __int16 v29 = [v28 hidden:1];
  v30 = [v29 fakeStatusBar:BSSettingFlagForBool()];
  uint64_t v31 = [v30 fakeStatusBarLevel:&unk_1F33496B0];

  [v4 addComponent:v31];
  [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  CSComponentTransitionInputsMake();
  v32 = [MEMORY[0x1E4F5E3C0] slideableContent];
  v33 = [v32 priority:10];
  v34 = [v33 transitionModifiers:8];
  memset(v46, 0, sizeof(v46));
  v35 = [v34 transitionInputs:v46];
  [v4 addComponent:v35];

  v36 = [MEMORY[0x1E4F5E3C0] tinting];
  double v37 = [v36 priority:10];

  [v37 setHidden:0];
  [v4 addComponent:v37];
  double v38 = objc_opt_new();
  double v39 = [v38 priority:10];
  double v40 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
  double v41 = [v39 identifier:v40];

  double v42 = [v41 showBackgroundWhileTransitioning:0];

  [v42 setHidden:0];
  [v4 addComponent:v42];
  double v43 = objc_opt_new();
  double v44 = [v43 priority:10];
  v45 = [v44 suppressVisibleChanges:0];
  [v4 addComponent:v45];

  [v4 unionAppearance:self->_appViewController];
  [v4 unionAppearance:self->_hostedEntityViewController];
}

- (int64_t)presentationAltitude
{
  return 1;
}

+ (unint64_t)requiredCapabilities
{
  return 4;
}

+ (BOOL)isAvailableForConfiguration
{
  return [(id)SBApp lockScreenCameraSupported];
}

- (id)pageRole
{
  return (id)*MEMORY[0x1E4F5E370];
}

- (BOOL)handleEvent:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBDashBoardCameraPageViewController;
  if ([(CSPresentationViewController *)&v12 handleEvent:v4]
    && ([v4 isConsumable] & 1) != 0)
  {
LABEL_10:
    char v5 = [v4 isConsumable];
  }
  else
  {
    char v5 = 0;
    switch(__ROR8__([v4 type] - 5, 1))
    {
      case 0:
        [(SBDashBoardCameraPageViewController *)self _bailIfFaceTimeCallComesIn];
        char v5 = 0;
        break;
      case 2:
      case 0xALL:
        [(SBDashBoardCameraPageViewController *)self _coolCameraIfNecessary];
        if ((unint64_t)(self->_cameraPresentLargestPercent - 1) <= 0x62)
        {
          uint64_t v13 = *MEMORY[0x1E4FA74C0];
          double v6 = objc_msgSend(NSNumber, "numberWithInteger:");
          v14[0] = v6;
          BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
          double v8 = (void *)MEMORY[0x1E4FA5E78];
          id v9 = v7;
          double v10 = [v8 sharedInstance];
          [v10 emitEvent:46 withPayload:v9];
        }
        char v5 = 0;
        self->_hasWarmedCameraForThisPresentation = 0;
        self->_cameraPrewarmSucceeded = 0;
        self->_cameraPresentLargestPercent = 0;
        break;
      case 6:
        [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
        goto LABEL_10;
      case 0xBLL:
        [(CSCoverSheetViewControllerBase *)self dismiss];
        goto LABEL_10;
      default:
        break;
    }
  }

  return v5;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return [a3 type] == 27;
}

- (BOOL)dashBoardHostedAppViewController:(id)a3 shouldTransitionToMode:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = a4 != 2
    || [(SBDashBoardCameraPageViewController *)self _appearState] != 1
    && ([(SBDashBoardCameraPageViewController *)self bs_isDisappearingOrDisappeared] & 1) == 0;

  return v7;
}

- (BOOL)canHostAnApp
{
  appViewController = self->_appViewController;
  if (!appViewController) {
    appViewController = self->_hostedEntityViewController;
  }
  return [appViewController canHostAnApp];
}

- (id)hostedAppSceneHandle
{
  appViewController = self->_appViewController;
  if (!appViewController) {
    appViewController = self->_hostedEntityViewController;
  }
  return (id)[appViewController hostedAppSceneHandle];
}

- (id)hostedAppSceneHandles
{
  appViewController = self->_appViewController;
  if (!appViewController) {
    appViewController = self->_hostedEntityViewController;
  }
  return (id)[appViewController hostedAppSceneHandles];
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheetCamera") & 1) == 0)
  {
    appViewController = self->_appViewController;
    if (!appViewController) {
      appViewController = self->_hostedEntityViewController;
    }
    [appViewController hostedAppWillRotateToInterfaceOrientation:a3];
  }
}

- (BOOL)handlesRotationIndependentOfCoverSheet
{
  return 1;
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v11 = a4;
  appViewController = self->_appViewController;
  id v7 = a3;
  id v8 = [(SBDashBoardHostedAppViewController *)appViewController applicationSceneHandle];

  if (v11 && v8 == v7)
  {
    if ([(SBDashBoardCameraPageViewController *)self bs_isAppearingOrAppeared]) {
      [(SBDashBoardCameraPageViewController *)self _acquireTraitsParticipantIfNeeded];
    }
    id v9 = [(SBTraitsOrientedContentViewController *)self->_orientedContentViewController view];
    double v10 = [v11 settings];
    [v10 frame];
    objc_msgSend(v9, "setContentViewBoundsInReferenceSpace:");

    [(SBDashBoardCameraPageViewController *)self _updateZStackPolicyAssistants];
  }
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  appViewController = self->_appViewController;
  id v8 = a3;
  id v9 = [(SBDashBoardHostedAppViewController *)appViewController applicationSceneHandle];

  if (a4 && v9 == v8)
  {
    [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
  }
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [v10 sceneIdentifier];
    id v8 = [(SBDashBoardHostedAppViewController *)self->_appViewController applicationSceneHandle];
    id v9 = [v8 sceneIdentifier];

    if (v7 == v9)
    {
      [(SBDashBoardCameraPageViewController *)self _invalidateCameraTraitsParticipant];
      [(SBDashBoardCameraPageViewController *)self _updateZStackPolicyAssistants];
    }
  }
}

- (void)handleAction:(id)a3 fromSender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (LCSFeatureEnabled()
    && [v6 type] == 1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [(CSCoverSheetViewControllerBase *)self dismiss];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBDashBoardCameraPageViewController;
    [(CSPageViewController *)&v8 handleAction:v6 fromSender:v7];
  }
}

- (void)hostableEntityPresenter:(id)a3 didEndHosting:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(CSHostedEntityViewController *)self->_hostedEntityViewController hostedEntity];

    if (v7 == v6)
    {
      [(SBDashBoardCameraPageViewController *)self _invalidateCameraTraitsParticipant];
      [(SBDashBoardCameraPageViewController *)self _updateZStackPolicyAssistants];
    }
  }
}

- (void)hostableEntityPresenter:(id)a3 didFailToActivate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(CSHostedEntityViewController *)self->_hostedEntityViewController hostedEntity];

    if (v7 == v6) {
      [(CSCoverSheetViewControllerBase *)self dismiss];
    }
  }
}

- (void)accidentalActivationMitigationSessionCoordinator:(id)a3 didStartMitigationSession:(id)a4
{
}

- (void)accidentalActivationMitigationSessionCoordinator:(id)a3 didCancelMitigationSession:(id)a4
{
}

- (void)accidentalActivationMitigationSessionCoordinator:(id)a3 didMitigateMitigationSession:(id)a4
{
}

- (void)_acquireTraitsParticipantIfNeeded
{
  if (!self->_traitsParticipant)
  {
    BOOL v3 = [(CSPageViewController *)self view];
    id v4 = [v3 window];

    if (v4
      && SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheetCamera"))
    {
      char v5 = [(SBDashBoardCameraPageViewController *)self _traitsArbiter];
      hostedEntityViewController = self->_hostedEntityViewController;
      if (hostedEntityViewController)
      {
        id v7 = [(CSHostedEntityViewController *)hostedEntityViewController sceneHandleForTraitsParticipant];
        if (v7)
        {
          id v8 = [[SBTraitsSceneParticipantDelegate alloc] initWithSceneHandle:v7];
          traitsParticipantDelegate = self->_traitsParticipantDelegate;
          self->_traitsParticipantDelegate = v8;
        }
        else
        {
          traitsParticipantDelegate = [(CSHostedEntityViewController *)self->_hostedEntityViewController sceneForTraitsParticipant];
          if (traitsParticipantDelegate)
          {
            BOOL v14 = [[SBTraitsSceneParticipantDelegate alloc] initWithScene:traitsParticipantDelegate];
            __int16 v15 = self->_traitsParticipantDelegate;
            self->_traitsParticipantDelegate = v14;
          }
        }
      }
      else
      {
        id v10 = [SBTraitsSceneParticipantDelegate alloc];
        id v11 = [(SBDashBoardHostedAppViewController *)self->_appViewController applicationSceneHandle];
        objc_super v12 = [(SBTraitsSceneParticipantDelegate *)v10 initWithSceneHandle:v11];
        uint64_t v13 = self->_traitsParticipantDelegate;
        self->_traitsParticipantDelegate = v12;
      }
      if (self->_traitsParticipantDelegate)
      {
        objc_msgSend(v5, "acquireParticipantWithRole:delegate:", @"SBTraitsParticipantRoleCoverSheetCamera");
        v16 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
        traitsParticipant = self->_traitsParticipant;
        self->_traitsParticipant = v16;

        [(SBTraitsSceneParticipantDelegate *)self->_traitsParticipantDelegate setArbiter:v5];
        [(SBTraitsSceneParticipantDelegate *)self->_traitsParticipantDelegate setParticipant:self->_traitsParticipant];
        int v18 = self->_traitsParticipantDelegate;
        v19 = NSNumber;
        id v20 = [(CSPageViewController *)self view];
        uint64_t v21 = [v20 window];
        [v21 windowLevel];
        v22 = objc_msgSend(v19, "numberWithDouble:");
        [(SBTraitsSceneParticipantDelegate *)v18 setPreferredSceneLevel:v22];

        [(SBTraitsOrientedContentViewController *)self->_orientedContentViewController setContentParticipant:self->_traitsParticipant];
        objc_initWeak(&location, self);
        v23 = self->_traitsParticipantDelegate;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __72__SBDashBoardCameraPageViewController__acquireTraitsParticipantIfNeeded__block_invoke;
        v27[3] = &unk_1E6AF9470;
        objc_copyWeak(&v28, &location);
        [(SBTraitsSceneParticipantDelegate *)v23 setActuateOrientationAlongsideBlock:v27];
        orientedContentViewController = self->_orientedContentViewController;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __72__SBDashBoardCameraPageViewController__acquireTraitsParticipantIfNeeded__block_invoke_2;
        v25[3] = &unk_1E6AF9498;
        objc_copyWeak(&v26, &location);
        [(SBTraitsOrientedContentViewController *)orientedContentViewController setActuateAlongsideBlock:v25];
        objc_destroyWeak(&v26);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __72__SBDashBoardCameraPageViewController__acquireTraitsParticipantIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[146] updateOrientationIfNeeded];
    id WeakRetained = v2;
  }
}

void __72__SBDashBoardCameraPageViewController__acquireTraitsParticipantIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    objc_msgSend(WeakRetained[143], "setHostedAppReferenceSize:withInterfaceOrientation:", a2, a3, a4);
    objc_msgSend(v8[142], "setHostedAppReferenceSize:withInterfaceOrientation:", a2, a3, a4);
    id WeakRetained = v8;
  }
}

- (void)_invalidateCameraTraitsParticipant
{
  [(TRAParticipant *)self->_traitsParticipant invalidate];
  [(SBTraitsSceneParticipantDelegate *)self->_traitsParticipantDelegate invalidate];
  traitsParticipantDelegate = self->_traitsParticipantDelegate;
  self->_traitsParticipantDelegate = 0;

  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;
}

- (id)_traitsArbiter
{
  id v4 = [(CSPageViewController *)self view];
  char v5 = [v4 window];

  if (v5)
  {
    id v6 = [v5 _sbWindowScene];
    id v7 = [v6 traitsArbiter];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBDashBoardCameraPageViewController.m" lineNumber:796 description:@"Unexpected nil window"];
    id v7 = 0;
  }

  return v7;
}

- (void)zStackParticipantDidChange:(id)a3
{
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v11 = a4;
  if (([(SBDashBoardCameraPageViewController *)self bs_isDisappearingOrDisappeared] & 1) == 0)
  {
    [v11 setActivationPolicyForParticipantsBelow:2];
    [v11 setSuppressSystemApertureForSystemChromeSuppression:-[SBSystemApertureZStackPolicyAssistant suppressSystemApertureForSystemChromeSuppression]((BOOL)self->_systemApertureZStackPolicyAssistant)];
    char v5 = -[SBCameraHardwareButton allCameraShutterButtonPIDs]((uint64_t)self->_systemApertureZStackPolicyAssistant);
    [v11 setAssociatedBundleIdentifiersToSuppressInSystemAperture:v5];

    id v6 = -[SBCameraHardwareButton foregroundCameraShutterButtonPIDs]((uint64_t)self->_systemApertureZStackPolicyAssistant);
    [v11 setAssociatedSceneIdentifiersToSuppressInSystemAperture:v6];

    id v7 = -[SBAudioCategoryZStackPolicyAssistant audioCategoriesDisablingVolumeHUD]((uint64_t)self->_audioCategoryZStackPolicyAssistant);
    [v11 setAudioCategoriesDisablingVolumeHUD:v7];

    id v8 = -[SBPhysicalButtonZStackPolicyAssistant physicalButtonSceneTargets]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
    [v11 setPhysicalButtonSceneTargets:v8];

    id v9 = -[SBPhysicalButtonZStackPolicyAssistant captureButtonFullFidelityEventRequestingScenes]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
    [v11 setCaptureButtonFullFidelityEventRequestingScenes:v9];

    id v10 = -[SBPhysicalButtonZStackPolicyAssistant foregroundCaptureSceneTargets]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
    [v11 setForegroundCaptureSceneTargets:v10];
  }
}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  [a3 suggestedEdgeSpacing];
  return result;
}

- (void)homeGrabberViewDidReceiveClick:(id)a3
{
  if ([(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture])
  {
    [(CSCoverSheetViewControllerBase *)self dismiss];
  }
}

- (void)setWantsHomeGestureOwnership:(BOOL)a3
{
  if (self->_wantsHomeGestureOwnership != a3)
  {
    self->_wantsHomeGestureOwnership = a3;
    if (a3) {
      [(SBDashBoardCameraPageViewController *)self _requestHomeGestureOwnership];
    }
    else {
      [(SBDashBoardCameraPageViewController *)self _invalidateZStackParticipantIfNeeded];
    }
  }
}

- (void)_requestHomeGestureOwnership
{
  [(SBDashBoardCameraPageViewController *)self _ensureZStackParticipant];
  [(SBDashBoardCameraPageViewController *)self _updateZStackPolicyAssistants];
  [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self];
}

- (void)_ensureZStackParticipant
{
  BOOL v3 = [(SBDashBoardCameraPageViewController *)self zStackParticipant];

  if (!v3)
  {
    id v4 = [(CSPageViewController *)self view];
    char v5 = [v4 window];

    id v6 = [v5 _sbWindowScene];
    id v7 = [v6 zStackResolver];
    id v8 = [v7 acquireParticipantWithIdentifier:13 delegate:self];

    [(SBDashBoardCameraPageViewController *)self setZStackParticipant:v8];
  }
  id v9 = [(SBDashBoardCameraPageViewController *)self audioCategoryZStackPolicyAssistant];

  if (!v9)
  {
    id v10 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)[SBAudioCategoryZStackPolicyAssistant alloc] initWithParticipant:self->_zStackParticipant];
    [(SBDashBoardCameraPageViewController *)self setAudioCategoryZStackPolicyAssistant:v10];
  }
  id v11 = [(SBDashBoardCameraPageViewController *)self systemApertureZStackPolicyAssistant];

  if (!v11)
  {
    objc_super v12 = -[SBSystemApertureZStackPolicyAssistant initWithParticipant:]((id *)[SBSystemApertureZStackPolicyAssistant alloc], self->_zStackParticipant);
    [(SBDashBoardCameraPageViewController *)self setSystemApertureZStackPolicyAssistant:v12];
  }
  uint64_t v13 = [(SBDashBoardCameraPageViewController *)self physicalButtonZStackPolicyAssistant];

  if (!v13)
  {
    BOOL v14 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)[SBPhysicalButtonZStackPolicyAssistant alloc] initWithParticipant:self->_zStackParticipant];
    [(SBDashBoardCameraPageViewController *)self setPhysicalButtonZStackPolicyAssistant:v14];
  }
}

- (void)_invalidateZStackParticipantIfNeeded
{
  BOOL v3 = [(SBDashBoardCameraPageViewController *)self zStackParticipant];

  if (v3)
  {
    id v4 = [(SBDashBoardCameraPageViewController *)self zStackParticipant];
    [v4 invalidate];

    [(SBDashBoardCameraPageViewController *)self setZStackParticipant:0];
    [(SBDashBoardCameraPageViewController *)self setSystemApertureZStackPolicyAssistant:0];
    [(SBDashBoardCameraPageViewController *)self setPhysicalButtonZStackPolicyAssistant:0];
    [(SBDashBoardCameraPageViewController *)self setAudioCategoryZStackPolicyAssistant:0];
  }
}

- (void)_bailIfFaceTimeCallComesIn
{
  BOOL v3 = +[SBConferenceManager sharedInstance];
  int v4 = [v3 inFaceTime];

  if (v4)
  {
    [(CSCoverSheetViewControllerBase *)self dismiss];
  }
}

- (void)_setSceneGrabberHidden:(BOOL)a3
{
  BOOL v3 = a3;
  hostedEntityViewController = self->_hostedEntityViewController;
  if (hostedEntityViewController)
  {
    id v6 = [(CSHostedEntityViewController *)hostedEntityViewController homeGrabberViewForTraitsParticipant];
    if (!v6) {
      goto LABEL_13;
    }
    id v8 = v6;
    [v6 setDelegate:self];
    [v8 setPointerClickDelegate:self];
    if (v3) {
      [(SBDashBoardCameraPageViewController *)self _takeHiddenAssertionForHomeGrabber:v8];
    }
    else {
      [(SBDashBoardCameraPageViewController *)self _relinquishHiddenAssertionForHomeGrabber:v8];
    }
    [(SBDashBoardCameraPageViewController *)self _updateZStackPolicyAssistants];
  }
  else
  {
    id v8 = [(SBDashBoardHostedAppViewController *)self->_appViewController appView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v8 homeGrabberView];
      [v7 setDelegate:self];
      [v7 setPointerClickDelegate:self];
      if (v3) {
        [(SBDashBoardCameraPageViewController *)self _takeHiddenAssertionForHomeGrabber:v7];
      }
      else {
        [(SBDashBoardCameraPageViewController *)self _relinquishHiddenAssertionForHomeGrabber:v7];
      }
      [(SBDashBoardCameraPageViewController *)self _updateZStackPolicyAssistants];
    }
  }
  id v6 = v8;
LABEL_13:
}

- (void)_noteUserLaunchEventTime
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  uint64_t v5 = mach_continuous_time();
  id v8 = objc_alloc_init(SBActivationSettings);
  id v6 = [NSNumber numberWithDouble:v4];
  [(SBActivationSettings *)v8 setObject:v6 forActivationSetting:18];

  id v7 = [NSNumber numberWithUnsignedLongLong:v5];
  [(SBActivationSettings *)v8 setObject:v7 forActivationSetting:19];

  [(SBDashBoardHostedAppViewController *)self->_appViewController setSupplementalActivationSettings:v8];
}

- (void)_takeHiddenAssertionForHomeGrabber:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4FA5F28];
  id v4 = a3;
  id v7 = [v3 rootSettings];
  uint64_t v5 = [v7 hideForHomeGestureOwnershipAnimationSettings];
  id v6 = [v5 BSAnimationSettings];

  [v4 setHidden:1 forReason:@"DashBoardCameraHomeOwnershipChanged" withAnimationSettings:v6];
  [v4 setHomeAffordanceInteractionEnabled:0];
}

- (void)_relinquishHiddenAssertionForHomeGrabber:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4FA5F28];
  id v4 = a3;
  id v7 = [v3 rootSettings];
  uint64_t v5 = [v7 unhideForHomeGestureOwnershipAnimationSettings];
  id v6 = [v5 BSAnimationSettings];

  [v4 setHidden:0 forReason:@"DashBoardCameraHomeOwnershipChanged" withAnimationSettings:v6];
  [v4 setHomeAffordanceInteractionEnabled:1];
}

- (id)_prewarmingCameraBundleIdentifier
{
  id v2 = @"com.apple.camera";
  if (_os_feature_enabled_impl())
  {

    id v2 = @"com.apple.camera.lockscreen";
  }
  return v2;
}

- (void)_prewarmCameraInteractively:(BOOL)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!self->_prewarmDebounceTimer)
  {
    BOOL v3 = a3;
    uint64_t v5 = +[SBLockScreenManager sharedInstance];
    id v6 = [v5 coverSheetViewController];

    id v7 = [v6 cameraPrewarmer];
    id v8 = [v7 currentActivePrewarmReasons];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      uint64_t v13 = *MEMORY[0x1E4F15900];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          char v15 = [*(id *)(*((void *)&v34 + 1) + 8 * i) isEqualToString:v13];
        }
        char v16 = v15;
        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v11);

      if (v16) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v17 = (id *)MEMORY[0x1E4F15910];
    if (!v3) {
      uint64_t v17 = (id *)MEMORY[0x1E4F158F8];
    }
    int v18 = NSNumber;
    id v33 = *v17;
    v19 = [v18 numberWithLongLong:mach_absolute_time()];
    id v20 = [NSNumber numberWithLongLong:mach_continuous_time()];
    uint64_t v21 = *MEMORY[0x1E4F15928];
    v38[0] = *MEMORY[0x1E4F15918];
    v38[1] = v21;
    v39[0] = v33;
    v39[1] = v19;
    v38[2] = *MEMORY[0x1E4F15938];
    v39[2] = v20;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
    v23 = [(SBDashBoardCameraPageViewController *)self _prewarmingCameraBundleIdentifier];
    AVCapturePrewarmWithOptions();

    v24 = (void *)MEMORY[0x1E4F1CB00];
    [(CSLockScreenSettings *)self->_prototypeSettings cameraPrewarmDebounceTimeInterval];
    objc_msgSend(v24, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__endPrewarmBackoffPeriod, 0, 0);
    v25 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    prewarmDebounceTimer = self->_prewarmDebounceTimer;
    self->_prewarmDebounceTimer = v25;

    v27 = (void *)MEMORY[0x1E4F1CB00];
    [(CSLockScreenSettings *)self->_prototypeSettings cameraPrewarmAutoCancelTimeInterval];
    objc_msgSend(v27, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__coolCameraIfNecessary, 0, 0);
    id v28 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    prewarmCancelTimer = self->_prewarmCancelTimer;
    self->_prewarmCancelTimer = v28;

    v30 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    uint64_t v31 = *MEMORY[0x1E4F1C4B0];
    [v30 addTimer:self->_prewarmDebounceTimer forMode:*MEMORY[0x1E4F1C4B0]];

    v32 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v32 addTimer:self->_prewarmCancelTimer forMode:v31];

LABEL_15:
  }
}

- (void)_endPrewarmBackoffPeriod
{
  [(NSTimer *)self->_prewarmDebounceTimer invalidate];
  prewarmDebounceTimer = self->_prewarmDebounceTimer;
  self->_prewarmDebounceTimer = 0;
}

- (void)_coolCameraIfNecessary
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (self->_hasWarmedCameraForThisPresentation)
  {
    if (!self->_cameraPrewarmSucceeded)
    {
      BOOL v3 = [MEMORY[0x1E4FA5E78] sharedInstance];
      [v3 emitEvent:45];
    }
    id v4 = [(SBDashBoardCameraPageViewController *)self _prewarmingCameraBundleIdentifier];
    uint64_t v7 = *MEMORY[0x1E4F15918];
    v8[0] = *MEMORY[0x1E4F15910];
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    MEMORY[0x1D9487C80](v4, v5);
  }
  [(NSTimer *)self->_prewarmCancelTimer invalidate];
  prewarmCancelTimer = self->_prewarmCancelTimer;
  self->_prewarmCancelTimer = 0;

  [(SBDashBoardCameraPageViewController *)self _makeApplicationStatic];
  [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
}

- (BOOL)_shouldPrewarmOnSwipe
{
  if ([(SBLockScreenDefaults *)self->_lockScreenDefaults useDefaultsValuesForCameraPrewarm])
  {
    lockScreenDefaults = self->_lockScreenDefaults;
    return [(SBLockScreenDefaults *)lockScreenDefaults prewarmCameraOnSwipe];
  }
  else
  {
    prototypeSettings = self->_prototypeSettings;
    return [(CSLockScreenSettings *)prototypeSettings prewarmsCameraHardwareOnSwipe];
  }
}

- (double)_prewarmThreshold
{
  if ([(SBLockScreenDefaults *)self->_lockScreenDefaults useDefaultsValuesForCameraPrewarm])
  {
    lockScreenDefaults = self->_lockScreenDefaults;
    [(SBLockScreenDefaults *)lockScreenDefaults cameraSwipePrewarmThreshold];
  }
  else
  {
    prototypeSettings = self->_prototypeSettings;
    [(CSLockScreenSettings *)prototypeSettings cameraPrewarmThresholdOnSwipe];
  }
  return result;
}

- (BOOL)_shouldPrelaunchOnSwipe
{
  if ([(SBLockScreenDefaults *)self->_lockScreenDefaults useDefaultsValuesForCameraPrewarm])
  {
    lockScreenDefaults = self->_lockScreenDefaults;
    return [(SBLockScreenDefaults *)lockScreenDefaults prelaunchCameraOnSwipe];
  }
  else
  {
    prototypeSettings = self->_prototypeSettings;
    return [(CSLockScreenSettings *)prototypeSettings prelaunchesCameraAppOnSwipe];
  }
}

- (double)_prelaunchThreshold
{
  if ([(SBLockScreenDefaults *)self->_lockScreenDefaults useDefaultsValuesForCameraPrewarm])
  {
    lockScreenDefaults = self->_lockScreenDefaults;
    [(SBLockScreenDefaults *)lockScreenDefaults cameraSwipePrelaunchThreshold];
  }
  else
  {
    prototypeSettings = self->_prototypeSettings;
    [(CSLockScreenSettings *)prototypeSettings cameraPrelaunchThresholdOnSwipe];
  }
  return result;
}

- (id)_hostedContentModeDescription
{
  if (self->_hostedEntityViewController)
  {
    [(CSHostedEntityViewController *)self->_hostedEntityViewController hostableEntityContentMode];
    NSStringFromCSHostableEntityContentMode();
  }
  else
  {
    NSStringFromSBAppViewControllerMode([(SBDashBoardHostedAppViewController *)self->_appViewController mode]);
  id v2 = };
  return v2;
}

- (void)_resetHostedEntityToDefault
{
  if (self->_hostedEntityViewController)
  {
    BOOL v3 = [(SBDashBoardCameraPageViewController *)self cameraPageDelegate];
    id v5 = [v3 defaultHostableEntityForActivationOfCamera:self];

    id v4 = v5;
    if (v5)
    {
      [(CSHostedEntityViewController *)self->_hostedEntityViewController setHostedEntity:v5];
      id v4 = v5;
    }
  }
}

- (void)_addOrRemoveGestureForCurrentSettings
{
  int v3 = [(SBDashBoardCameraPageViewController *)self _appearState];
  if (v3 && v3 != 3 && SBHomeGestureEnabled())
  {
    if (!self->_homeGestureInteraction)
    {
      id v4 = [SBHomeGestureInteraction alloc];
      id v5 = [(UIViewController *)self _sbWindowScene];
      id v6 = [v5 systemGestureManager];
      uint64_t v7 = [(SBHomeGestureInteraction *)v4 initWithSystemGestureManager:v6 delegate:self];
      homeGestureInteraction = self->_homeGestureInteraction;
      self->_homeGestureInteraction = v7;

      [(SBDashBoardCameraPageViewController *)self setWantsHomeGestureOwnership:1];
    }
  }
  else
  {
    id v9 = self->_homeGestureInteraction;
    if (v9)
    {
      [(SBHomeGestureInteraction *)v9 invalidate];
      uint64_t v10 = self->_homeGestureInteraction;
      self->_homeGestureInteraction = 0;
    }
  }
}

- (unint64_t)homeGestureInteraction:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1D8FD0B60[a4 - 1];
  }
}

- (id)customScreenEdgePanGestureRecognizerForHomeGestureInteraction:(id)a3
{
  id v4 = +[SBHomeGesturePanGestureRecognizer homeGesturePanGestureRecognizerWithTarget:0 action:0];
  [v4 setInterfaceDelegate:self];
  [v4 setEdges:15];
  [v4 setAllowedTouchTypes:&unk_1F3347910];
  return v4;
}

- (BOOL)homeGestureInteraction:(id)a3 shouldBeginGestureRecognizerOfType:(int64_t)a4
{
  id v6 = a3;
  if (([(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture] & 1) != 0
    || !self->_zStackParticipant)
  {
    BOOL v7 = 1;
    if (a4 != 1) {
      goto LABEL_21;
    }
    id v8 = [v6 gestureRecognizerForType:1];
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    if (([v8 touchedEdges] & 4) != 0)
    {
      char v28 = 1;
LABEL_20:
      _Block_object_dispose(&v25, 8);

      goto LABEL_21;
    }
    if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheetCamera"))
    {
      char v9 = [(TRAParticipant *)self->_traitsParticipant sbf_currentOrientation];
    }
    else
    {
      hostedEntityViewController = self->_hostedEntityViewController;
      if (!hostedEntityViewController)
      {
        v19 = [(SBDashBoardHostedAppViewController *)self->_appViewController appView];
        char v11 = [v19 orientation];

        goto LABEL_12;
      }
      char v9 = [(CSHostedEntityViewController *)hostedEntityViewController hostableEntityOrientation];
    }
    char v11 = v9;
LABEL_12:
    [v8 _touchInterfaceOrientation];
    uint64_t v12 = _screenRegionGivenInterfaceOrientedRegion();
    int8x8_t v13 = (int8x8_t)(1 << v11);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    uint64_t v21 = (void (*)(void *))__97__SBDashBoardCameraPageViewController_homeGestureInteraction_shouldBeginGestureRecognizerOfType___block_invoke;
    v22 = &unk_1E6AF94C0;
    v23 = &v25;
    uint64_t v24 = v12;
    BOOL v14 = v20;
    char v29 = 0;
    uint8x8_t v15 = (uint8x8_t)vcnt_s8(v13);
    v15.i16[0] = vaddlv_u8(v15);
    int v16 = v15.i32[0];
    if (v15.i32[0])
    {
      unint64_t v17 = 0;
      do
      {
        if (((1 << v17) & *(void *)&v13) != 0)
        {
          v21(v14);
          if (v29) {
            break;
          }
          --v16;
        }
        if (v17 > 0x3E) {
          break;
        }
        ++v17;
      }
      while (v16 > 0);
    }

    BOOL v7 = *((unsigned char *)v26 + 24) != 0;
    goto LABEL_20;
  }
  BOOL v7 = 0;
LABEL_21:

  return v7;
}

uint64_t __97__SBDashBoardCameraPageViewController_homeGestureInteraction_shouldBeginGestureRecognizerOfType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = _interfaceOrientedRegionGivenScreenRegion();
  if ((result & 4) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)homeGestureInteraction:(id)a3 shouldReceiveTouch:(id)a4
{
  return [(CSPageViewController *)self participantState] == 2;
}

- (BOOL)homeGestureInteraction:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)homeGestureInteractionBegan:(id)a3
{
}

- (void)homeGestureInteractionChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSPageViewController *)self view];
  [v4 translationInView:v5];
  double v7 = v6;
  double v9 = v8;

  -[SBDashBoardCameraPageViewController _convertTranslationFromContainerOrientationToContentOrientation:](self, "_convertTranslationFromContainerOrientationToContentOrientation:", v7, v9);
  BSUIConstrainValueToIntervalWithRubberBand();
  double v11 = v10;
  BSIntervalMap();
  -[SBDashBoardCameraPageViewController _updateCameraScale:dimmingAlpha:](self, "_updateCameraScale:dimmingAlpha:", v11, 1.0 - v12, 0, 1, 0x3FF0000000000000, 1, 0x3FD6666666666666, 1, 0x3FF0000000000000, 1, 0x3FEB333333333333, 1, 0x3FF0000000000000, 1);
}

- (void)homeGestureInteractionEnded:(id)a3
{
  if ([(SBDashBoardCameraPageViewController *)self _shouldCancelInteractiveDismissGesture])
  {
    [(SBDashBoardCameraPageViewController *)self _transitionAppViewWithProgress:2 transitionMode:1.0];
    double v4 = 1.0;
    double v5 = 0.0;
  }
  else
  {
    [(SBDashBoardCameraPageViewController *)self setWantsHomeGestureOwnership:0];
    [(CSCoverSheetViewControllerBase *)self dismiss];
    double v4 = 0.5;
    double v5 = 1.0;
  }
  [(SBDashBoardCameraPageViewController *)self _updateCameraScale:2 dimmingAlpha:v4 transitionMode:v5];
}

- (CGPoint)_convertTranslationFromContainerOrientationToContentOrientation:(CGPoint)a3
{
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, a3.x, a3.y);
  uint64_t v4 = [(SBDashBoardCameraPageViewController *)self interfaceOrientation];
  hostedEntityViewController = self->_hostedEntityViewController;
  if (hostedEntityViewController)
  {
    uint64_t v6 = [(CSHostedEntityViewController *)hostedEntityViewController hostableEntityOrientation];
  }
  else
  {
    double v7 = [(SBDashBoardHostedAppViewController *)self->_appViewController appView];
    uint64_t v6 = [v7 orientation];
  }
  if (v4 != v6)
  {
    memset(&v14, 0, sizeof(v14));
    SBFTransformFromOrientationToOrientation();
    memset(&t1, 0, sizeof(t1));
    CGAffineTransformInvert(&t2, &t1);
    CGAffineTransform t1 = v15;
    CGAffineTransformConcat(&v12, &t1, &t2);
    CGAffineTransform v10 = v14;
    CGAffineTransformConcat(&t1, &v10, &v12);
    CGAffineTransform v15 = t1;
  }
  double tx = v15.tx;
  double ty = v15.ty;
  result.y = ty;
  result.x = tx;
  return result;
}

- (void)_prepareForInteractiveGestureToCameraVisible:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIViewController *)self->_appViewControllerContainerVC view];
  [v5 setClipsToBounds:1];

  double v6 = 0.5;
  if (v3)
  {
    double v7 = 1.0;
  }
  else
  {
    double v6 = 1.0;
    double v7 = 0.0;
  }
  [(UIViewFloatAnimatableProperty *)self->_scaleProperty setValue:v6];
  [(UIViewFloatAnimatableProperty *)self->_alphaProperty setValue:v7];
  self->_interactiveDismissalInProgress = 1;
}

- (void)_resetAfterInteractiveGestureToCameraVisible:(BOOL)a3
{
  scaleProperdouble ty = self->_scaleProperty;
  double v5 = 0.5;
  if (a3)
  {
    double v5 = 1.0;
    double v6 = 0.0;
  }
  else
  {
    double v6 = 1.0;
  }
  [(UIViewFloatAnimatableProperty *)scaleProperty setValue:v5];
  [(UIViewFloatAnimatableProperty *)self->_alphaProperty setValue:v6];
  self->_interactiveDismissalInProgress = 0;
}

- (BOOL)_shouldCancelInteractiveDismissGesture
{
  [(UIViewFloatAnimatableProperty *)self->_scaleProperty presentationValue];
  double v4 = v3;
  [(UIViewFloatAnimatableProperty *)self->_scaleProperty velocity];
  double v6 = v4 + v5 / 1000.0 * 0.99 / 0.01;
  double v7 = 0.0;
  if (v6 <= 1.0) {
    double v7 = 1.0 - v6;
  }
  return fabs(v7) < vabdd_f64(0.8, v6);
}

- (void)_createProperties
{
  v21[2] = *MEMORY[0x1E4F143B8];
  double v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  scaleProperdouble ty = self->_scaleProperty;
  self->_scaleProperdouble ty = v3;

  [(UIViewFloatAnimatableProperty *)self->_scaleProperty setValue:1.0];
  [(UIViewFloatAnimatableProperty *)self->_scaleProperty setVelocityUsableForVFD:1];
  double v5 = (SBFFluidBehaviorSettings *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  scaleSettings = self->_scaleSettings;
  self->_scaleSettings = v5;

  [(SBFFluidBehaviorSettings *)self->_scaleSettings setBehaviorType:2];
  [(SBFFluidBehaviorSettings *)self->_scaleSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_scaleSettings setResponse:0.5];
  double v7 = self->_scaleSettings;
  CAFrameRateRange v22 = CAFrameRateRangeMake(30.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](v7, "setFrameRateRange:highFrameRateReason:", 1114127, *(double *)&v22.minimum, *(double *)&v22.maximum, *(double *)&v22.preferred);
  double v8 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  alphaProperdouble ty = self->_alphaProperty;
  self->_alphaProperdouble ty = v8;

  [(UIViewFloatAnimatableProperty *)self->_alphaProperty setValue:1.0];
  [(UIViewFloatAnimatableProperty *)self->_alphaProperty setVelocityUsableForVFD:1];
  CGAffineTransform v10 = (SBFFluidBehaviorSettings *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  alphaSettings = self->_alphaSettings;
  self->_alphaSettings = v10;

  [(SBFFluidBehaviorSettings *)self->_alphaSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_alphaSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_alphaSettings setResponse:0.25];
  CGAffineTransform v12 = self->_alphaSettings;
  CAFrameRateRange v23 = CAFrameRateRangeMake(30.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](v12, "setFrameRateRange:highFrameRateReason:", 1114127, *(double *)&v23.minimum, *(double *)&v23.maximum, *(double *)&v23.preferred);
  objc_initWeak(&location, self);
  int8x8_t v13 = (void *)MEMORY[0x1E4F42FF0];
  CGAffineTransform v14 = self->_alphaProperty;
  v21[0] = self->_scaleProperty;
  v21[1] = v14;
  CGAffineTransform v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__SBDashBoardCameraPageViewController__createProperties__block_invoke;
  v18[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v19, &location);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__SBDashBoardCameraPageViewController__createProperties__block_invoke_2;
  v16[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v17, &location);
  [v13 _createTransformerWithInputAnimatableProperties:v15 modelValueSetter:v18 presentationValueSetter:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __56__SBDashBoardCameraPageViewController__createProperties__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateForPropertyChangedForPresentation:0];
}

void __56__SBDashBoardCameraPageViewController__createProperties__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateForPropertyChangedForPresentation:1];
}

- (void)_updateForPropertyChangedForPresentation:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIViewController *)self->_appViewControllerContainerVC view];
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    memset(&v25, 0, sizeof(v25));
    CGAffineTransformMakeScale(&v25, 1.0, 1.0);
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    scaleProperdouble ty = self->_scaleProperty;
    if (!v3)
    {
      [(UIViewFloatAnimatableProperty *)scaleProperty value];
      memset(&v25, 0, sizeof(v25));
      CGAffineTransformMakeScale(&v25, v14, v14);
LABEL_10:
      [(UIViewFloatAnimatableProperty *)self->_alphaProperty value];
      double v16 = v15;
      *(_OWORD *)&v24.m11 = *(_OWORD *)&v25.a;
      *(_OWORD *)&v24.m13 = *(_OWORD *)&v25.c;
      *(_OWORD *)&v24.m21 = *(_OWORD *)&v25.tx;
      [v5 setTransform:&v24];
      [(UIView *)self->_tintView setAlpha:v16];
      goto LABEL_11;
    }
    [(UIViewFloatAnimatableProperty *)scaleProperty presentationValue];
    memset(&v25, 0, sizeof(v25));
    CGAffineTransformMakeScale(&v25, v7, v7);
  }
  [(UIViewFloatAnimatableProperty *)self->_alphaProperty presentationValue];
  double v9 = v8;
  if (!UIAccessibilityIsReduceMotionEnabled()) {
    [(UIViewFloatAnimatableProperty *)self->_scaleProperty velocity];
  }
  memset(&v24, 0, sizeof(v24));
  CGAffineTransform m = v25;
  CATransform3DMakeAffineTransform(&v24, &m);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  memset(&m, 0, sizeof(m));
  SBVelocityMatrixForUniform2DScaling();
  CATransform3D v17 = v24;
  CGAffineTransform v10 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v17];
  *(_OWORD *)&v17.m31 = v20;
  *(_OWORD *)&v17.m33 = v21;
  *(_OWORD *)&v17.m41 = v22;
  *(_OWORD *)&v17.m43 = v23;
  *(CGAffineTransform *)&v17.m11 = m;
  *(_OWORD *)&v17.m23 = v19;
  double v11 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v17];
  [v5 _setPresentationValue:v10 velocity:v11 preferredFrameRateRangeMaximum:120 forKey:@"transform"];

  tintView = self->_tintView;
  int8x8_t v13 = [NSNumber numberWithDouble:v9];
  [(UIView *)tintView _setPresentationValue:v13 forKey:@"alpha"];

LABEL_11:
}

- (int64_t)_sbAnimationUpdateModeForCoverSheetTransitionMode:(int64_t)a3
{
  int64_t v3 = 2;
  if (a3 != 1) {
    int64_t v3 = 3;
  }
  if (a3 == 3) {
    return 5;
  }
  else {
    return v3;
  }
}

- (void)_updateCameraScale:(double)a3 transitionMode:(int64_t)a4
{
  int64_t v6 = [(SBDashBoardCameraPageViewController *)self _sbAnimationUpdateModeForCoverSheetTransitionMode:a4];
  scaleSettings = self->_scaleSettings;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __73__SBDashBoardCameraPageViewController__updateCameraScale_transitionMode___block_invoke;
  v8[3] = &unk_1E6AF4A70;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", scaleSettings, v6, v8, 0);
}

uint64_t __73__SBDashBoardCameraPageViewController__updateCameraScale_transitionMode___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1256) setValue:*(double *)(a1 + 40)];
}

- (void)_updateDimmingAlpha:(double)a3 transitionMode:(int64_t)a4
{
  int64_t v6 = [(SBDashBoardCameraPageViewController *)self _sbAnimationUpdateModeForCoverSheetTransitionMode:a4];
  alphaSettings = self->_alphaSettings;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __74__SBDashBoardCameraPageViewController__updateDimmingAlpha_transitionMode___block_invoke;
  v8[3] = &unk_1E6AF4A70;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", alphaSettings, v6, v8, 0);
}

uint64_t __74__SBDashBoardCameraPageViewController__updateDimmingAlpha_transitionMode___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1264) setValue:*(double *)(a1 + 40)];
}

- (void)_updateCameraScale:(double)a3 dimmingAlpha:(double)a4
{
}

- (void)_updateCameraScale:(double)a3 dimmingAlpha:(double)a4 transitionMode:(int64_t)a5
{
  -[SBDashBoardCameraPageViewController _updateCameraScale:transitionMode:](self, "_updateCameraScale:transitionMode:", a3);
  [(SBDashBoardCameraPageViewController *)self _updateDimmingAlpha:a5 transitionMode:a4];
}

- (CSHostableEntity)hostedEntity
{
  return self->_hostedEntity;
}

- (SBDashBoardCameraPageViewControllerDelegate)cameraPageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraPageDelegate);
  return (SBDashBoardCameraPageViewControllerDelegate *)WeakRetained;
}

- (BOOL)wantsHomeGestureOwnership
{
  return self->_wantsHomeGestureOwnership;
}

- (SBHomeGestureInteraction)homeGestureInteraction
{
  return self->_homeGestureInteraction;
}

- (void)setHomeGestureInteraction:(id)a3
{
}

- (UIViewFloatAnimatableProperty)scaleProperty
{
  return self->_scaleProperty;
}

- (void)setScaleProperty:(id)a3
{
}

- (UIViewFloatAnimatableProperty)alphaProperty
{
  return self->_alphaProperty;
}

- (void)setAlphaProperty:(id)a3
{
}

- (SBFFluidBehaviorSettings)scaleSettings
{
  return self->_scaleSettings;
}

- (void)setScaleSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)alphaSettings
{
  return self->_alphaSettings;
}

- (void)setAlphaSettings:(id)a3
{
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
}

- (SBAudioCategoryZStackPolicyAssistant)audioCategoryZStackPolicyAssistant
{
  return self->_audioCategoryZStackPolicyAssistant;
}

- (void)setAudioCategoryZStackPolicyAssistant:(id)a3
{
}

- (SBSystemApertureZStackPolicyAssistant)systemApertureZStackPolicyAssistant
{
  return self->_systemApertureZStackPolicyAssistant;
}

- (void)setSystemApertureZStackPolicyAssistant:(id)a3
{
}

- (SBPhysicalButtonZStackPolicyAssistant)physicalButtonZStackPolicyAssistant
{
  return self->_physicalButtonZStackPolicyAssistant;
}

- (void)setPhysicalButtonZStackPolicyAssistant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalButtonZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_systemApertureZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_audioCategoryZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_alphaSettings, 0);
  objc_storeStrong((id *)&self->_scaleSettings, 0);
  objc_storeStrong((id *)&self->_alphaProperty, 0);
  objc_storeStrong((id *)&self->_scaleProperty, 0);
  objc_storeStrong((id *)&self->_homeGestureInteraction, 0);
  objc_destroyWeak((id *)&self->_cameraPageDelegate);
  objc_storeStrong((id *)&self->_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);
  objc_storeStrong((id *)&self->_prewarmCancelTimer, 0);
  objc_storeStrong((id *)&self->_prewarmDebounceTimer, 0);
  objc_storeStrong((id *)&self->_appViewControllerContainerVC, 0);
  objc_storeStrong((id *)&self->_orientedContentViewController, 0);
  objc_storeStrong((id *)&self->_traitsParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_appViewController, 0);
  objc_storeStrong((id *)&self->_hostedEntityViewController, 0);
  objc_storeStrong((id *)&self->_hostedEntity, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
}

@end