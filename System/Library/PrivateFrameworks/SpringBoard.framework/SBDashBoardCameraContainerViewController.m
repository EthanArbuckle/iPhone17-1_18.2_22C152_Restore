@interface SBDashBoardCameraContainerViewController
- (BOOL)canHostAnApp;
- (BOOL)handleEvent:(id)a3;
- (BOOL)handlesRotationIndependentOfCoverSheet;
- (BOOL)isHostingAnApp;
- (BOOL)wantsDefaultModalDismissalBehavior;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CGRect)_referenceBoundsForBounds:(CGRect)a3;
- (CSHostableEntity)hostedEntity;
- (CSHostedEntityViewController)hostedEntityViewController;
- (SBDashBoardCameraContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_traitsArbiter;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (void)_acquireTraitsParticipantIfNeeded;
- (void)_invalidateTraitsParticipant;
- (void)_setPresenterNeedsZStackPreferencesUpdateWithReason:(id)a3;
- (void)_updateZStackPolicyAssistants;
- (void)addGrabberView:(id)a3;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)aggregatePresentation:(id)a3;
- (void)dealloc;
- (void)foregroundSceneZStackPolicyAssistantDidChange:(id)a3 forReason:(id)a4;
- (void)hostableEntityPresenter:(id)a3 didBeginHosting:(id)a4;
- (void)hostableEntityPresenter:(id)a3 didEndHosting:(id)a4;
- (void)invalidate;
- (void)setHostedEntity:(id)a3;
- (void)systemApertureZStackPolicyAssistantDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBDashBoardCameraContainerViewController

- (SBDashBoardCameraContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)SBDashBoardCameraContainerViewController;
  v4 = [(CSCoverSheetViewControllerBase *)&v18 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (CSHostedEntityViewController *)objc_alloc_init(MEMORY[0x1E4F5E400]);
    hostedEntityViewController = v4->_hostedEntityViewController;
    v4->_hostedEntityViewController = v5;

    [(CSHostedEntityViewController *)v4->_hostedEntityViewController setEntityPresenterDelegate:v4];
    [(CSHostedEntityViewController *)v4->_hostedEntityViewController setPresenter:v4];
    v7 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)[SBAudioCategoryZStackPolicyAssistant alloc] initWithDelegate:v4];
    audioCategoryZStackPolicyAssistant = v4->_audioCategoryZStackPolicyAssistant;
    v4->_audioCategoryZStackPolicyAssistant = v7;

    v9 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)[SBPhysicalButtonZStackPolicyAssistant alloc] initWithDelegate:v4];
    physicalButtonZStackPolicyAssistant = v4->_physicalButtonZStackPolicyAssistant;
    v4->_physicalButtonZStackPolicyAssistant = v9;

    uint64_t v11 = -[SBSystemApertureZStackPolicyAssistant initWithDelegate:]((id *)[SBSystemApertureZStackPolicyAssistant alloc], v4);
    systemApertureZStackPolicyAssistant = v4->_systemApertureZStackPolicyAssistant;
    v4->_systemApertureZStackPolicyAssistant = (SBSystemApertureZStackPolicyAssistant *)v11;

    uint64_t v13 = [MEMORY[0x1E4FA7C68] sharedInstance];
    biometricResource = v4->_biometricResource;
    v4->_biometricResource = (SBUIBiometricResource *)v13;

    uint64_t v15 = [(id)SBApp authenticationController];
    authenticationAssertionProvider = v4->_authenticationAssertionProvider;
    v4->_authenticationAssertionProvider = (SBFAuthenticationAssertionProviding *)v15;
  }
  return v4;
}

- (void)dealloc
{
  [(SBDashBoardCameraContainerViewController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardCameraContainerViewController;
  [(CSCoverSheetViewControllerBase *)&v3 dealloc];
}

- (CSHostableEntity)hostedEntity
{
  return (CSHostableEntity *)[(CSHostedEntityViewController *)self->_hostedEntityViewController hostedEntity];
}

- (void)setHostedEntity:(id)a3
{
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)SBDashBoardCameraContainerViewController;
  [(CSCoverSheetViewControllerBase *)&v24 viewDidLoad];
  objc_super v3 = [(SBDashBoardCameraContainerViewController *)self view];
  v4 = [MEMORY[0x1E4F428B8] blackColor];
  [v3 setBackgroundColor:v4];

  v5 = objc_alloc_init(SBTraitsOrientedContentViewController);
  orientedContentViewController = self->_orientedContentViewController;
  self->_orientedContentViewController = v5;

  v7 = [(SBTraitsOrientedContentViewController *)self->_orientedContentViewController view];
  v8 = [(CSHostedEntityViewController *)self->_hostedEntityViewController view];
  v9 = self->_orientedContentViewController;
  hostedEntityViewController = self->_hostedEntityViewController;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55__SBDashBoardCameraContainerViewController_viewDidLoad__block_invoke;
  v21[3] = &unk_1E6AF53D0;
  id v22 = v8;
  id v11 = v3;
  id v23 = v11;
  id v12 = v8;
  [(SBTraitsOrientedContentViewController *)v9 bs_addChildViewController:hostedEntityViewController animated:0 transitionBlock:v21];
  uint64_t v13 = self->_orientedContentViewController;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__SBDashBoardCameraContainerViewController_viewDidLoad__block_invoke_2;
  v17[3] = &unk_1E6AF8F30;
  id v18 = v11;
  id v19 = v7;
  v20 = self;
  id v14 = v7;
  id v15 = v11;
  [(SBDashBoardCameraContainerViewController *)self bs_addChildViewController:v13 animated:0 transitionBlock:v17];
  v16 = [v15 layer];
  [v16 setAllowsGroupOpacity:1];
}

void __55__SBDashBoardCameraContainerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
  [*(id *)(a1 + 32) setAutoresizingMask:18];
  v5[2]();
}

void __55__SBDashBoardCameraContainerViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v15 = a2;
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_msgSend(*(id *)(a1 + 40), "setFrame:");
  id v12 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_referenceBoundsForBounds:", v5, v7, v9, v11);
  objc_msgSend(v12, "setContentViewBoundsInReferenceSpace:");
  [*(id *)(a1 + 40) setAutoresizingMask:18];
  uint64_t v13 = *(void **)(a1 + 40);
  id v14 = [*(id *)(*(void *)(a1 + 48) + 1120) view];
  [v13 setContentView:v14];

  v15[2]();
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBDashBoardCameraContainerViewController;
  [(CSCoverSheetViewControllerBase *)&v10 viewWillAppear:a3];
  [(SBDashBoardCameraContainerViewController *)self _acquireTraitsParticipantIfNeeded];
  [(CSHostedEntityViewController *)self->_hostedEntityViewController setHostableEntityContentMode:2];
  if (!self->_sustainAuthenticationAssertion)
  {
    double v4 = SBLogDashBoard();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "SBDashBoardCameraContainerViewController - taking sustain auth assertion", v9, 2u);
    }

    authenticationAssertionProvider = self->_authenticationAssertionProvider;
    double v6 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
    double v7 = [(SBFAuthenticationAssertionProviding *)authenticationAssertionProvider createKeybagUnlockAssertionWithReason:v6];
    sustainAuthenticationAssertion = self->_sustainAuthenticationAssertion;
    self->_sustainAuthenticationAssertion = v7;

    [(SBFAuthenticationAssertion *)self->_sustainAuthenticationAssertion activate];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardCameraContainerViewController;
  [(SBDashBoardCameraContainerViewController *)&v4 viewIsAppearing:a3];
  [(SBDashBoardCameraContainerViewController *)self _acquireTraitsParticipantIfNeeded];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardCameraContainerViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidAppear:a3];
  [(SBDashBoardCameraContainerViewController *)self _updateZStackPolicyAssistants];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardCameraContainerViewController;
  [(CSCoverSheetViewControllerBase *)&v7 viewDidDisappear:a3];
  [(CSHostedEntityViewController *)self->_hostedEntityViewController setHostableEntityContentMode:1];
  if (self->_sustainAuthenticationAssertion)
  {
    objc_super v4 = SBLogDashBoard();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "SBDashBoardCameraContainerViewController - relinquishing sustain auth assertion", v6, 2u);
    }

    [(SBFAuthenticationAssertion *)self->_sustainAuthenticationAssertion invalidate];
    sustainAuthenticationAssertion = self->_sustainAuthenticationAssertion;
    self->_sustainAuthenticationAssertion = 0;
  }
  [(SBDashBoardCameraContainerViewController *)self _invalidateTraitsParticipant];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBDashBoardCameraContainerViewController;
  [(SBDashBoardCameraContainerViewController *)&v16 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  orientedContentViewController = self->_orientedContentViewController;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v10 = v9;
    }
    else {
      objc_super v10 = 0;
    }
  }
  else
  {
    objc_super v10 = 0;
  }
  id v11 = v10;

  id v12 = [v11 traitsParticipant];

  [(SBTraitsOrientedContentViewController *)orientedContentViewController setContainerParticipant:v12];
  if (v9)
  {
    [(SBDashBoardCameraContainerViewController *)self _acquireTraitsParticipantIfNeeded];
  }
  else
  {
    uint64_t v13 = [(CSHostedEntityViewController *)self->_hostedEntityViewController hostedEntity];
    id v14 = [v13 hostingViewController];
    id v15 = [v14 _sbWindowScene];

    if (!v15) {
      [(CSHostedEntityViewController *)self->_hostedEntityViewController setHostableEntityContentMode:1];
    }
  }
}

- (void)aggregateBehavior:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardCameraContainerViewController;
  [(CSCoverSheetViewControllerBase *)&v5 aggregateBehavior:v4];
  [v4 unionBehavior:self->_hostedEntityViewController];
  if ([(SBUIBiometricResource *)self->_biometricResource hasPearlSupport]) {
    [v4 addRestrictedCapabilities:8];
  }
}

- (void)aggregateAppearance:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardCameraContainerViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v5 aggregateAppearance:v4];
  objc_msgSend(v4, "unionAppearance:", self->_hostedEntityViewController, v5.receiver, v5.super_class);
}

- (void)aggregatePresentation:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardCameraContainerViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v5 aggregatePresentation:v4];
  objc_msgSend(v4, "unionPresentation:", self->_hostedEntityViewController, v5.receiver, v5.super_class);
}

- (void)invalidate
{
  [(SBFAuthenticationAssertion *)self->_sustainAuthenticationAssertion invalidate];
  sustainAuthenticationAssertion = self->_sustainAuthenticationAssertion;
  self->_sustainAuthenticationAssertion = 0;

  [(SBDashBoardCameraContainerViewController *)self _invalidateTraitsParticipant];
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return [(CSHostedEntityViewController *)self->_hostedEntityViewController wouldHandleButtonEvent:a3];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardCameraContainerViewController;
  if ([(CSCoverSheetViewControllerBase *)&v7 handleEvent:v4]
    && ([v4 isConsumable] & 1) != 0
    || [(CSHostedEntityViewController *)self->_hostedEntityViewController handleEvent:v4])
  {
    char v5 = [v4 isConsumable];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)canHostAnApp
{
  return [(CSHostedEntityViewController *)self->_hostedEntityViewController canHostAnApp];
}

- (BOOL)isHostingAnApp
{
  return [(CSHostedEntityViewController *)self->_hostedEntityViewController isHostingAnApp];
}

- (id)hostedAppSceneHandle
{
  return (id)[(CSHostedEntityViewController *)self->_hostedEntityViewController hostedAppSceneHandle];
}

- (id)hostedAppSceneHandles
{
  return (id)[(CSHostedEntityViewController *)self->_hostedEntityViewController hostedAppSceneHandles];
}

- (BOOL)handlesRotationIndependentOfCoverSheet
{
  return [(CSHostedEntityViewController *)self->_hostedEntityViewController handlesRotationIndependentOfCoverSheet];
}

- (void)foregroundSceneZStackPolicyAssistantDidChange:(id)a3 forReason:(id)a4
{
}

- (void)systemApertureZStackPolicyAssistantDidChange:(id)a3
{
}

- (void)addGrabberView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v8 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    [(CSHostedEntityViewController *)self->_hostedEntityViewController setHomeGrabberView:v7];
  }
}

- (BOOL)wantsDefaultModalDismissalBehavior
{
  return 1;
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v11 = a4;
  if (([(SBDashBoardCameraContainerViewController *)self bs_isDisappearingOrDisappeared] & 1) == 0)
  {
    [v11 setSuppressSystemApertureForSystemChromeSuppression:-[SBSystemApertureZStackPolicyAssistant suppressSystemApertureForSystemChromeSuppression]((BOOL)self->_systemApertureZStackPolicyAssistant)];
    uint64_t v5 = -[SBCameraHardwareButton allCameraShutterButtonPIDs]((uint64_t)self->_systemApertureZStackPolicyAssistant);
    [v11 setAssociatedBundleIdentifiersToSuppressInSystemAperture:v5];

    id v6 = -[SBCameraHardwareButton foregroundCameraShutterButtonPIDs]((uint64_t)self->_systemApertureZStackPolicyAssistant);
    [v11 setAssociatedSceneIdentifiersToSuppressInSystemAperture:v6];

    id v7 = -[SBAudioCategoryZStackPolicyAssistant audioCategoriesDisablingVolumeHUD]((uint64_t)self->_audioCategoryZStackPolicyAssistant);
    [v11 setAudioCategoriesDisablingVolumeHUD:v7];

    id v8 = -[SBPhysicalButtonZStackPolicyAssistant physicalButtonSceneTargets]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
    [v11 setPhysicalButtonSceneTargets:v8];

    id v9 = -[SBPhysicalButtonZStackPolicyAssistant captureButtonFullFidelityEventRequestingScenes]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
    [v11 setCaptureButtonFullFidelityEventRequestingScenes:v9];

    objc_super v10 = -[SBPhysicalButtonZStackPolicyAssistant foregroundCaptureSceneTargets]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
    [v11 setForegroundCaptureSceneTargets:v10];
  }
}

- (void)hostableEntityPresenter:(id)a3 didBeginHosting:(id)a4
{
  id v9 = a3;
  if ([(SBDashBoardCameraContainerViewController *)self bs_isAppearingOrAppeared])[(SBDashBoardCameraContainerViewController *)self _acquireTraitsParticipantIfNeeded]; {
  uint64_t v5 = [v9 sceneHandleForTraitsParticipant];
  }
  id v6 = [v5 scene];

  if (!v6)
  {
    id v6 = [v9 sceneForTraitsParticipant];
  }
  id v7 = [(SBTraitsOrientedContentViewController *)self->_orientedContentViewController view];
  id v8 = [v6 settings];
  [v8 frame];
  objc_msgSend(v7, "setContentViewBoundsInReferenceSpace:");

  [(SBDashBoardCameraContainerViewController *)self _updateZStackPolicyAssistants];
  [(SBDashBoardCameraContainerViewController *)self _setPresenterNeedsZStackPreferencesUpdateWithReason:@"Began hosting"];
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
      [(SBDashBoardCameraContainerViewController *)self _invalidateTraitsParticipant];
      [(SBDashBoardCameraContainerViewController *)self _updateZStackPolicyAssistants];
    }
  }
}

- (void)_setPresenterNeedsZStackPreferencesUpdateWithReason:(id)a3
{
  id v5 = a3;
  id v4 = [(CSCoverSheetViewControllerBase *)self _presenter];
  if (objc_opt_respondsToSelector()) {
    [v4 invalidateZStackParticipantPreferencesWithReason:v5];
  }
}

- (void)_updateZStackPolicyAssistants
{
  id v10 = [(CSHostedEntityViewController *)self->_hostedEntityViewController sceneHandleForTraitsParticipant];
  if (v10)
  {
    uint64_t v3 = objc_opt_class();
    id v4 = v10;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v8 = v5;

    if (v8)
    {
      id v9 = [(CSHostedEntityViewController *)self->_hostedEntityViewController homeGrabberView];
      -[SBSystemApertureZStackPolicyAssistant setForegroundExclusiveSceneHandle:homeGrabberView:]((uint64_t)self->_systemApertureZStackPolicyAssistant, v8, v9);
    }
    id v6 = v4;
  }
  else
  {
    id v6 = [(CSHostedEntityViewController *)self->_hostedEntityViewController sceneForTraitsParticipant];
    if (!v6)
    {
      id v7 = 0;
      goto LABEL_13;
    }
  }
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObject:v6];
LABEL_13:
  [(SBZStackForegroundSceneOrderedPolicyAssistant *)self->_audioCategoryZStackPolicyAssistant setForegroundScenes:v7];
  [(SBZStackForegroundSceneOrderedPolicyAssistant *)self->_physicalButtonZStackPolicyAssistant setForegroundScenes:v7];
}

- (void)_acquireTraitsParticipantIfNeeded
{
  if (!self->_traitsParticipant)
  {
    uint64_t v3 = [(SBDashBoardCameraContainerViewController *)self view];
    id v4 = [v3 window];

    if (v4)
    {
      id v5 = [(SBDashBoardCameraContainerViewController *)self _traitsArbiter];
      id v6 = [(CSHostedEntityViewController *)self->_hostedEntityViewController sceneHandleForTraitsParticipant];
      if (v6)
      {
        id v7 = [[SBTraitsSceneParticipantDelegate alloc] initWithSceneHandle:v6];
        traitsParticipantDelegate = self->_traitsParticipantDelegate;
        self->_traitsParticipantDelegate = v7;
      }
      else
      {
        id v9 = [(CSHostedEntityViewController *)self->_hostedEntityViewController sceneForTraitsParticipant];
        if (v9)
        {
          id v10 = [[SBTraitsSceneParticipantDelegate alloc] initWithScene:v9];
          id v11 = self->_traitsParticipantDelegate;
          self->_traitsParticipantDelegate = v10;
        }
      }
      if (self->_traitsParticipantDelegate)
      {
        objc_msgSend(v5, "acquireParticipantWithRole:delegate:", @"SBTraitsParticipantRoleCoverSheetCamera");
        id v12 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
        traitsParticipant = self->_traitsParticipant;
        self->_traitsParticipant = v12;

        [(SBTraitsSceneParticipantDelegate *)self->_traitsParticipantDelegate setArbiter:v5];
        [(SBTraitsSceneParticipantDelegate *)self->_traitsParticipantDelegate setParticipant:self->_traitsParticipant];
        id v14 = self->_traitsParticipantDelegate;
        id v15 = NSNumber;
        [v4 windowLevel];
        objc_super v16 = objc_msgSend(v15, "numberWithDouble:");
        [(SBTraitsSceneParticipantDelegate *)v14 setPreferredSceneLevel:v16];

        [(SBTraitsOrientedContentViewController *)self->_orientedContentViewController setContentParticipant:self->_traitsParticipant];
        orientedContentViewController = self->_orientedContentViewController;
        uint64_t v18 = objc_opt_class();
        id v19 = v4;
        if (v18)
        {
          if (objc_opt_isKindOfClass()) {
            v20 = v19;
          }
          else {
            v20 = 0;
          }
        }
        else
        {
          v20 = 0;
        }
        id v21 = v20;

        id v22 = [v21 traitsParticipant];

        [(SBTraitsOrientedContentViewController *)orientedContentViewController setContainerParticipant:v22];
        id v23 = [(SBTraitsOrientedContentViewController *)self->_orientedContentViewController view];
        objc_msgSend(v23, "setContentOrientation:", objc_msgSend(v23, "containerOrientation"));
        objc_initWeak(&location, self);
        objc_super v24 = self->_traitsParticipantDelegate;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __77__SBDashBoardCameraContainerViewController__acquireTraitsParticipantIfNeeded__block_invoke;
        v28[3] = &unk_1E6AF9470;
        objc_copyWeak(&v29, &location);
        [(SBTraitsSceneParticipantDelegate *)v24 setActuateOrientationAlongsideBlock:v28];
        v25 = self->_orientedContentViewController;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __77__SBDashBoardCameraContainerViewController__acquireTraitsParticipantIfNeeded__block_invoke_2;
        v26[3] = &unk_1E6AF9498;
        objc_copyWeak(&v27, &location);
        [(SBTraitsOrientedContentViewController *)v25 setActuateAlongsideBlock:v26];
        objc_destroyWeak(&v27);
        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __77__SBDashBoardCameraContainerViewController__acquireTraitsParticipantIfNeeded__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[131] updateOrientationIfNeeded];
    WeakRetained = v2;
  }
}

void __77__SBDashBoardCameraContainerViewController__acquireTraitsParticipantIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    objc_msgSend(WeakRetained[140], "setHostedAppReferenceSize:withInterfaceOrientation:", a2, a3, a4);
    WeakRetained = v8;
  }
}

- (void)_invalidateTraitsParticipant
{
  [(SBTraitsOrientedContentViewController *)self->_orientedContentViewController setActuateAlongsideBlock:0];
  [(TRAParticipant *)self->_traitsParticipant invalidate];
  [(SBTraitsSceneParticipantDelegate *)self->_traitsParticipantDelegate invalidate];
  traitsParticipantDelegate = self->_traitsParticipantDelegate;
  self->_traitsParticipantDelegate = 0;

  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;
}

- (id)_traitsArbiter
{
  id v4 = [(SBDashBoardCameraContainerViewController *)self view];
  id v5 = [v4 window];

  if (v5)
  {
    id v6 = [v5 _sbWindowScene];
    id v7 = [v6 traitsArbiter];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBDashBoardCameraContainerViewController.m" lineNumber:406 description:@"Unexpected nil window"];
    id v7 = 0;
  }

  return v7;
}

- (CGRect)_referenceBoundsForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = CGRectGetHeight(a3);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double v8 = CGRectGetWidth(v13);
  if (v7 >= v8) {
    double v9 = v8;
  }
  else {
    double v9 = v7;
  }
  if (v7 >= v8) {
    double v10 = v7;
  }
  else {
    double v10 = v8;
  }
  double v11 = x;
  double v12 = y;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CSHostedEntityViewController)hostedEntityViewController
{
  return self->_hostedEntityViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedEntityViewController, 0);
  objc_storeStrong((id *)&self->_sustainAuthenticationAssertion, 0);
  objc_storeStrong((id *)&self->_authenticationAssertionProvider, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_systemApertureZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_physicalButtonZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_audioCategoryZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_traitsParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_orientedContentViewController, 0);
}

@end