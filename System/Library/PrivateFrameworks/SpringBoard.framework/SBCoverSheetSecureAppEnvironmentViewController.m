@interface SBCoverSheetSecureAppEnvironmentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canHostAnApp;
- (BOOL)contentOccludesBackground;
- (BOOL)handlesRotationIndependentOfCoverSheet;
- (BOOL)isHostingAnApp;
- (BOOL)needsActuationForUpdateReasons:(int64_t)a3;
- (BSInvalidatable)secureAppViewController;
- (SBCoverSheetSecureAppEnvironmentViewController)initWithSecureAppViewController:(id)a3;
- (SBCoverSheetSecureAppEnvironmentViewControllerDelegate)delegate;
- (SBFZStackParticipant)zStackParticipant;
- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3;
- (id)_createTraitsSceneParticipantDelegate;
- (id)_currentSecureAppAction;
- (id)_hostableEntityPresenter;
- (id)_traitsArbiter;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (id)participantAssociatedSceneIdentityTokens:(id)a3;
- (id)participantAssociatedWindows:(id)a3;
- (id)traitsParticipantForSceneHandle:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_acquireSecureAppTraitsParticipantIfNeeded;
- (void)_actuateTraitsParticipantResolution;
- (void)_invalidateTraitsParticipantAndDelegateHelper;
- (void)_updateIdleWarnModeForAlwaysOnEnabled:(BOOL)a3;
- (void)_updateSupportedOrientationsMaskForSecureAppAction;
- (void)_updateZStackPolicyAssistants;
- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5;
- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4;
- (void)dealloc;
- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4;
- (void)homeGrabberViewDidReceiveClick:(id)a3;
- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3;
- (void)relinquishHiddenAssertionForHomeGrabber:(id)a3 animated:(BOOL)a4;
- (void)relinquishHomeGesture;
- (void)requestHomeGestureOwnership;
- (void)secureAppOfTypeDidTakeNewAssertion:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setZStackParticipant:(id)a3;
- (void)takeHiddenAssertionForHomeGrabber:(id)a3 animated:(BOOL)a4;
- (void)updateHomeGrabberHiddenAssertion:(BOOL)a3;
- (void)updateOrientationSceneSettingsForParticipant:(id)a3;
- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBCoverSheetSecureAppEnvironmentViewController

- (SBCoverSheetSecureAppEnvironmentViewController)initWithSecureAppViewController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBCoverSheetSecureAppEnvironmentViewController;
  v6 = [(SBCoverSheetSecureAppEnvironmentViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_secureAppViewController, a3);
    v7->_currentOrientationMask = 30;
    if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleSecureApp"))
    {
      [(SBCoverSheetSecureAppEnvironmentViewController *)v7 _acquireSecureAppTraitsParticipantIfNeeded];
    }
    else
    {
      v8 = +[SBSecureAppManager sharedInstance];
      [v8 addObserver:v7];
    }
  }

  return v7;
}

- (void)dealloc
{
  [(SBCoverSheetSecureAppEnvironmentViewController *)self _invalidateTraitsParticipantAndDelegateHelper];
  v3.receiver = self;
  v3.super_class = (Class)SBCoverSheetSecureAppEnvironmentViewController;
  [(SBCoverSheetSecureAppEnvironmentViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetSecureAppEnvironmentViewController;
  [(SBCoverSheetSecureAppEnvironmentViewController *)&v5 viewDidLoad];
  secureAppViewController = self->_secureAppViewController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__SBCoverSheetSecureAppEnvironmentViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E6AF6698;
  v4[4] = self;
  [(SBCoverSheetSecureAppEnvironmentViewController *)self bs_addChildViewController:secureAppViewController animated:0 transitionBlock:v4];
  [(SBCoverSheetSecureAppEnvironmentViewController *)self _updateZStackPolicyAssistants];
}

void __61__SBCoverSheetSecureAppEnvironmentViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(*(void *)(a1 + 32) + 1032);
  v4 = a2;
  id v6 = [v3 view];
  objc_super v5 = [*(id *)(a1 + 32) viewIfLoaded];
  [v5 bounds];
  objc_msgSend(v6, "setFrame:");

  [v6 setAutoresizingMask:18];
  v4[2](v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBCoverSheetSecureAppEnvironmentViewController;
  [(SBCoverSheetSecureAppEnvironmentViewController *)&v8 viewWillAppear:a3];
  v4 = [MEMORY[0x1E4FA7C68] sharedInstance];
  if (([v4 hasPearlSupport] & 1) == 0)
  {
    objc_super v5 = [v4 acquireMatchingAssertionWithMode:2 reason:@"SBCoverSheetSecureAppEnvironmentViewController"];
    biometricMatchingAssertion = self->_biometricMatchingAssertion;
    self->_biometricMatchingAssertion = v5;

    v7 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SBCoverSheetSecureAppEnvironmentViewController viewWillAppear:]();
    }
  }
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleSecureApp") & 1) == 0) {
    [(SBCoverSheetSecureAppEnvironmentViewController *)self _updateSupportedOrientationsMaskForSecureAppAction];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  if (a3)
  {
    [(SBCoverSheetSecureAppEnvironmentViewController *)self _acquireSecureAppTraitsParticipantIfNeeded];
    [(SBCoverSheetSecureAppEnvironmentViewController *)self _actuateTraitsParticipantResolution];
  }
  else
  {
    [(SBCoverSheetSecureAppEnvironmentViewController *)self _invalidateTraitsParticipantAndDelegateHelper];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetSecureAppEnvironmentViewController;
  [(SBCoverSheetSecureAppEnvironmentViewController *)&v5 viewDidAppear:a3];
  [(SBCoverSheetSecureAppEnvironmentViewController *)self updateHomeGrabberHiddenAssertion:0];
  v4 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
  [v4 addObserver:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBCoverSheetSecureAppEnvironmentViewController;
  [(SBCoverSheetSecureAppEnvironmentViewController *)&v8 viewWillDisappear:a3];
  p_biometricMatchingAssertion = &self->_biometricMatchingAssertion;
  if (self->_biometricMatchingAssertion)
  {
    objc_super v5 = SBLogLockScreenBiometricCoordinator();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SBCoverSheetSecureAppEnvironmentViewController viewWillDisappear:]();
    }

    [(BSInvalidatable *)*p_biometricMatchingAssertion invalidate];
    id v6 = *p_biometricMatchingAssertion;
    *p_biometricMatchingAssertion = 0;
  }
  v7 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
  [v7 removeObserver:self];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleSecureApp")) {
    return 30;
  }
  objc_super v3 = [(SBCoverSheetSecureAppEnvironmentViewController *)self _currentSecureAppAction];
  char v4 = [v3 specifiesSupportedInterfaceOrientations];

  objc_super v5 = [(SBCoverSheetSecureAppEnvironmentViewController *)self hostedAppSceneHandle];
  id v6 = [v5 sceneIfExists];
  v7 = [v6 uiSettings];
  int v8 = [v7 deviceOrientationEventsEnabled];

  if ((v4 & 1) == 0 && !v8) {
    return 30;
  }
  [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
  return XBInterfaceOrientationMaskForInterfaceOrientation();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_createTraitsSceneParticipantDelegate
{
  objc_super v3 = [(SBCoverSheetSecureAppEnvironmentViewController *)self _hostableEntityPresenter];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 sceneHandleForTraitsParticipant];
    if (v4) {
      objc_super v5 = [[SBTraitsSceneParticipantDelegate alloc] initWithSceneHandle:v4];
    }
    else {
      objc_super v5 = 0;
    }
  }
  else
  {
    objc_super v5 = 0;
  }
  if (!self->_secureAppTraitsParticipantDelegateHelper)
  {
    if (objc_opt_respondsToSelector())
    {
      id v6 = [v3 sceneForTraitsParticipant];
      if (v6)
      {
        v7 = [[SBTraitsSceneParticipantDelegate alloc] initWithScene:v6];

        objc_super v5 = v7;
      }
    }
    if (!self->_secureAppTraitsParticipantDelegateHelper)
    {
      int v8 = [SBTraitsSceneParticipantDelegate alloc];
      v9 = [(BSInvalidatable *)self->_secureAppViewController applicationSceneHandle];
      uint64_t v10 = [(SBTraitsSceneParticipantDelegate *)v8 initWithSceneHandle:v9];

      objc_super v5 = (SBTraitsSceneParticipantDelegate *)v10;
    }
  }

  return v5;
}

- (void)_acquireSecureAppTraitsParticipantIfNeeded
{
  if (!self->_secureAppTraitsParticipant)
  {
    if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleSecureApp"))
    {
      objc_super v3 = [(SBCoverSheetSecureAppEnvironmentViewController *)self _traitsArbiter];
      char v4 = [v3 acquireParticipantWithRole:@"SBTraitsParticipantRoleSecureApp" delegate:self];
      secureAppTraitsParticipant = self->_secureAppTraitsParticipant;
      self->_secureAppTraitsParticipant = v4;

      id v6 = [(SBCoverSheetSecureAppEnvironmentViewController *)self _createTraitsSceneParticipantDelegate];
      secureAppTraitsParticipantDelegateHelper = self->_secureAppTraitsParticipantDelegateHelper;
      self->_secureAppTraitsParticipantDelegateHelper = v6;

      [(SBTraitsSceneParticipantDelegate *)self->_secureAppTraitsParticipantDelegateHelper setArbiter:v3];
      [(SBTraitsSceneParticipantDelegate *)self->_secureAppTraitsParticipantDelegateHelper setParticipant:self->_secureAppTraitsParticipant];
      [(SBTraitsSceneParticipantDelegate *)self->_secureAppTraitsParticipantDelegateHelper setCanDetermineActiveOrientation:1];
      int v8 = self->_secureAppTraitsParticipantDelegateHelper;
      v9 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43CF8] + -5.0];
      [(SBTraitsSceneParticipantDelegate *)v8 setPreferredSceneLevel:v9];

      [(SBTraitsSceneParticipantDelegate *)self->_secureAppTraitsParticipantDelegateHelper setOrientationModeOverride:2];
      objc_initWeak(&location, self);
      uint64_t v10 = self->_secureAppTraitsParticipantDelegateHelper;
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      v13 = __92__SBCoverSheetSecureAppEnvironmentViewController__acquireSecureAppTraitsParticipantIfNeeded__block_invoke;
      v14 = &unk_1E6AF9470;
      objc_copyWeak(&v15, &location);
      [(SBTraitsSceneParticipantDelegate *)v10 setActuateOrientationAlongsideBlock:&v11];
      [(TRAParticipant *)self->_secureAppTraitsParticipant setNeedsUpdatePreferencesWithReason:@"setup", v11, v12, v13, v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __92__SBCoverSheetSecureAppEnvironmentViewController__acquireSecureAppTraitsParticipantIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _actuateTraitsParticipantResolution];
}

- (void)_invalidateTraitsParticipantAndDelegateHelper
{
  [(TRAParticipant *)self->_secureAppTraitsParticipant invalidate];
  [(SBTraitsSceneParticipantDelegate *)self->_secureAppTraitsParticipantDelegateHelper invalidate];
  secureAppTraitsParticipantDelegateHelper = self->_secureAppTraitsParticipantDelegateHelper;
  self->_secureAppTraitsParticipantDelegateHelper = 0;

  secureAppTraitsParticipant = self->_secureAppTraitsParticipant;
  self->_secureAppTraitsParticipant = 0;
}

- (void)_actuateTraitsParticipantResolution
{
  int64_t v3 = [(TRAParticipant *)self->_secureAppTraitsParticipant sbf_currentOrientation];
  char v4 = [(SBCoverSheetSecureAppEnvironmentViewController *)self view];
  objc_super v5 = [v4 window];
  [v5 _legacySetRotatableViewOrientation:v3 updateStatusBar:1 duration:0 force:0.0];

  secureAppViewController = self->_secureAppViewController;
  id v10 = [MEMORY[0x1E4F42D90] mainScreen];
  v7 = [v10 fixedCoordinateSpace];
  [v7 bounds];
  -[BSInvalidatable setHostedAppReferenceSize:withInterfaceOrientation:](secureAppViewController, "setHostedAppReferenceSize:withInterfaceOrientation:", v3, v8, v9);
}

- (id)_traitsArbiter
{
  char v4 = [(BSInvalidatable *)self->_secureAppViewController applicationSceneHandle];
  objc_super v5 = [v4 displayIdentity];

  id v6 = [(id)SBApp windowSceneManager];
  v7 = [v6 windowSceneForDisplayIdentity:v5];

  if (v7)
  {
    double v8 = [v7 traitsArbiter];
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBCoverSheetSecureAppEnvironmentViewController.m" lineNumber:229 description:@"Unexpected nil window scene"];

    double v8 = 0;
  }

  return v8;
}

- (void)updateOrientationSceneSettingsForParticipant:(id)a3
{
}

- (BOOL)needsActuationForUpdateReasons:(int64_t)a3
{
  return [(SBTraitsSceneParticipantDelegate *)self->_secureAppTraitsParticipantDelegateHelper needsActuationForUpdateReasons:a3];
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  secureAppTraitsParticipantDelegateHelper = self->_secureAppTraitsParticipantDelegateHelper;
  id v5 = a4;
  [(SBTraitsSceneParticipantDelegate *)secureAppTraitsParticipantDelegateHelper updatePreferencesWithUpdater:v5];
  [v5 updateOrientationPreferencesWithBlock:&__block_literal_global_214];
}

void __90__SBCoverSheetSecureAppEnvironmentViewController_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v3 = __sb__runningInSpringBoard();
  char v4 = v3;
  if (v3)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      [v5 setSupportedOrientations:2];
      goto LABEL_9;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] != 1)
    {
      [v5 setSupportedOrientations:2];
      goto LABEL_8;
    }
  }
  objc_msgSend(v5, "setSupportedOrientations:", objc_msgSend(v5, "supportedOrientations"));
  if ((v4 & 1) == 0) {
LABEL_8:
  }

LABEL_9:
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  secureAppTraitsParticipantDelegateHelper = self->_secureAppTraitsParticipantDelegateHelper;
  objc_msgSend(a4, "orientationActuationContext", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SBTraitsSceneParticipantDelegate *)secureAppTraitsParticipantDelegateHelper actuateOrientationSettingsWithContext:v5];
}

- (id)participantAssociatedWindows:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  char v4 = [(SBCoverSheetSecureAppEnvironmentViewController *)self view];
  id v5 = [v4 window];
  if (v5)
  {
    id v6 = [(SBCoverSheetSecureAppEnvironmentViewController *)self view];
    v7 = [v6 window];
    v10[0] = v7;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SBCoverSheetSecureAppEnvironmentViewController *)self participantAssociatedSceneIdentityTokens:a3];
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = objc_msgSend(v10, "bs_map:", &__block_literal_global_37_5);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __110__SBCoverSheetSecureAppEnvironmentViewController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke_2;
    v14[3] = &unk_1E6AF5290;
    id v15 = v8;
    id v16 = v12;
    id v13 = v12;
    [v15 appendBodySectionWithName:@"Associated Scenes" multilinePrefix:v9 block:v14];
  }
}

uint64_t __110__SBCoverSheetSecureAppEnvironmentViewController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringRepresentation];
}

uint64_t __110__SBCoverSheetSecureAppEnvironmentViewController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendArraySection:*(void *)(a1 + 40) withName:@"Associated Scene Tokens" skipIfEmpty:0];
}

- (id)participantAssociatedSceneIdentityTokens:(id)a3
{
  return [(SBTraitsSceneParticipantDelegate *)self->_secureAppTraitsParticipantDelegateHelper participantAssociatedSceneIdentityTokens:a3];
}

- (BOOL)contentOccludesBackground
{
  return 1;
}

- (BOOL)canHostAnApp
{
  return [(BSInvalidatable *)self->_secureAppViewController canHostAnApp];
}

- (BOOL)isHostingAnApp
{
  return [(BSInvalidatable *)self->_secureAppViewController isHostingAnApp];
}

- (id)hostedAppSceneHandle
{
  return (id)[(BSInvalidatable *)self->_secureAppViewController hostedAppSceneHandle];
}

- (id)hostedAppSceneHandles
{
  return (id)[(BSInvalidatable *)self->_secureAppViewController hostedAppSceneHandles];
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
}

- (BOOL)handlesRotationIndependentOfCoverSheet
{
  return 0;
}

- (id)traitsParticipantForSceneHandle:(id)a3
{
  secureAppViewController = self->_secureAppViewController;
  id v5 = a3;
  id v6 = [(BSInvalidatable *)secureAppViewController applicationSceneHandle];

  if (v6 == v5) {
    v7 = self->_secureAppTraitsParticipant;
  }
  else {
    v7 = 0;
  }
  return v7;
}

- (void)secureAppOfTypeDidTakeNewAssertion:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogCoverSheet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SecureApp of type: %lu took new assertion", (uint8_t *)&v6, 0xCu);
  }

  [(SBCoverSheetSecureAppEnvironmentViewController *)self _updateSupportedOrientationsMaskForSecureAppAction];
}

- (void)requestHomeGestureOwnership
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v3 = [(SBCoverSheetSecureAppEnvironmentViewController *)self zStackParticipant];

  if (!v3)
  {
    char v4 = [(SBCoverSheetSecureAppEnvironmentViewController *)self view];
    id v5 = [v4 window];

    int v6 = [v5 _sbWindowScene];
    unint64_t v7 = [v6 zStackResolver];
    uint64_t v8 = [v7 acquireParticipantWithIdentifier:7 delegate:self];
    if (v8)
    {
      [(SBCoverSheetSecureAppEnvironmentViewController *)self setZStackParticipant:v8];
      id v9 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)[SBAudioCategoryZStackPolicyAssistant alloc] initWithParticipant:self->_zStackParticipant];
      audioCategoryZStackPolicyAssistant = self->_audioCategoryZStackPolicyAssistant;
      self->_audioCategoryZStackPolicyAssistant = v9;

      uint64_t v11 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)[SBPhysicalButtonZStackPolicyAssistant alloc] initWithParticipant:self->_zStackParticipant];
      physicalButtonZStackPolicyAssistant = self->_physicalButtonZStackPolicyAssistant;
      self->_physicalButtonZStackPolicyAssistant = v11;

      id v13 = (SBSystemApertureZStackPolicyAssistant *)-[SBSystemApertureZStackPolicyAssistant initWithParticipant:]((id *)[SBSystemApertureZStackPolicyAssistant alloc], self->_zStackParticipant);
      systemApertureZStackPolicyAssistant = self->_systemApertureZStackPolicyAssistant;
      self->_systemApertureZStackPolicyAssistant = v13;

      [(SBCoverSheetSecureAppEnvironmentViewController *)self _updateZStackPolicyAssistants];
    }
    else
    {
      id v15 = SBLogCoverSheet();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = 134218496;
        v17 = v5;
        __int16 v18 = 2048;
        v19 = v6;
        __int16 v20 = 2048;
        v21 = v7;
        _os_log_error_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_ERROR, "participant should not be nil here -- all of these should be non-nil: window:%p SBWindowScene:%p resolver:%p", (uint8_t *)&v16, 0x20u);
      }
    }
  }
}

- (void)relinquishHomeGesture
{
  int v3 = [(SBCoverSheetSecureAppEnvironmentViewController *)self zStackParticipant];

  if (v3)
  {
    char v4 = [(SBCoverSheetSecureAppEnvironmentViewController *)self zStackParticipant];
    [v4 invalidate];

    [(SBCoverSheetSecureAppEnvironmentViewController *)self setZStackParticipant:0];
  }
}

- (id)_currentSecureAppAction
{
  v2 = +[SBSecureAppManager sharedInstance];
  int v3 = [v2 secureAppAction];

  return v3;
}

- (void)_updateSupportedOrientationsMaskForSecureAppAction
{
  v34[6] = *MEMORY[0x1E4F143B8];
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleSecureApp") & 1) == 0)
  {
    int v3 = [(SBCoverSheetSecureAppEnvironmentViewController *)self _currentSecureAppAction];
    char v4 = v3;
    if (v3 && [v3 specifiesSupportedInterfaceOrientations])
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __100__SBCoverSheetSecureAppEnvironmentViewController__updateSupportedOrientationsMaskForSecureAppAction__block_invoke;
      v32[3] = &unk_1E6B05028;
      v32[4] = self;
      id v5 = (uint64_t (**)(void, void))MEMORY[0x1D948C7A0](v32);
      unint64_t v6 = [v4 supportedInterfaceOrientations];
      unint64_t currentOrientationMask = self->_currentOrientationMask;
      uint64_t v8 = [(id)SBApp activeInterfaceOrientation];
      id v9 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v10 = [v9 orientation];

      int v11 = v5[2](v5, v8);
      int v12 = v5[2](v5, v10);
      if (v6 != currentOrientationMask || v11 == 0 || v12 == 0)
      {
        self->_unint64_t currentOrientationMask = v6;
        id v15 = [NSNumber numberWithInteger:v8];
        v34[0] = v15;
        int v16 = [NSNumber numberWithInteger:v10];
        v34[1] = v16;
        v17 = [NSNumber numberWithInteger:3];
        v34[2] = v17;
        __int16 v18 = [NSNumber numberWithInteger:4];
        v34[3] = v18;
        v19 = [NSNumber numberWithInteger:1];
        v34[4] = v19;
        __int16 v20 = [NSNumber numberWithInteger:2];
        v34[5] = v20;
        v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:6];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v29 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "integerValue", (void)v28);
              if (v5[2](v5, v27))
              {
                [(id)SBApp _setDeviceOrientation:v27 animated:0 logMessage:@"[SBCSSecureAppEnvironmentVC] rotating device to match full screen secure app supported orientations."];
                [(id)SBApp updateNativeOrientationWithOrientation:v27 logMessage:@"[SBCSSecureAppEnvironmentVC] rotating native orientation to match full screen secure app supported orientations."];
                goto LABEL_22;
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v33 count:16];
            if (v24) {
              continue;
            }
            break;
          }
        }
LABEL_22:
      }
    }
  }
}

BOOL __100__SBCoverSheetSecureAppEnvironmentViewController__updateSupportedOrientationsMaskForSecureAppAction__block_invoke(uint64_t a1, char a2)
{
  return (*(void *)(*(void *)(a1 + 32) + 984) & (1 << a2)) != 0;
}

- (void)_updateIdleWarnModeForAlwaysOnEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v6 = [WeakRetained secureAppEnvironmentViewControllerShouldEnableIdleWarning:self alwaysOnEnabled:v3];

  if (objc_opt_respondsToSelector())
  {
    secureAppViewController = self->_secureAppViewController;
    [(BSInvalidatable *)secureAppViewController setOverrideIdleWarnMode:v6 ^ 1u];
  }
}

- (id)_hostableEntityPresenter
{
  if (objc_opt_respondsToSelector()) {
    BOOL v3 = self->_secureAppViewController;
  }
  else {
    BOOL v3 = 0;
  }
  return v3;
}

- (void)zStackParticipantDidChange:(id)a3
{
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v5 = a4;
  [v5 setActivationPolicyForParticipantsBelow:2];
  [v5 setSuppressSystemApertureForSystemChromeSuppression:-[SBSystemApertureZStackPolicyAssistant suppressSystemApertureForSystemChromeSuppression]((BOOL)self->_systemApertureZStackPolicyAssistant)];
  int v6 = -[SBCameraHardwareButton allCameraShutterButtonPIDs]((uint64_t)self->_systemApertureZStackPolicyAssistant);
  [v5 setAssociatedBundleIdentifiersToSuppressInSystemAperture:v6];

  unint64_t v7 = -[SBCameraHardwareButton foregroundCameraShutterButtonPIDs]((uint64_t)self->_systemApertureZStackPolicyAssistant);
  [v5 setAssociatedSceneIdentifiersToSuppressInSystemAperture:v7];

  uint64_t v8 = -[SBAudioCategoryZStackPolicyAssistant audioCategoriesDisablingVolumeHUD]((uint64_t)self->_audioCategoryZStackPolicyAssistant);
  [v5 setAudioCategoriesDisablingVolumeHUD:v8];

  id v9 = -[SBPhysicalButtonZStackPolicyAssistant physicalButtonSceneTargets]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
  [v5 setPhysicalButtonSceneTargets:v9];

  uint64_t v10 = -[SBPhysicalButtonZStackPolicyAssistant captureButtonFullFidelityEventRequestingScenes]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
  [v5 setCaptureButtonFullFidelityEventRequestingScenes:v10];

  -[SBPhysicalButtonZStackPolicyAssistant foregroundCaptureSceneTargets]((uint64_t)self->_physicalButtonZStackPolicyAssistant);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setForegroundCaptureSceneTargets:v11];
}

- (void)_updateZStackPolicyAssistants
{
  v21[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBCoverSheetSecureAppEnvironmentViewController *)self _hostableEntityPresenter];
  char v4 = v3;
  if (v3)
  {
    id v5 = [v3 sceneHandleForTraitsParticipant];
    if (v5)
    {
      uint64_t v6 = objc_opt_class();
      id v7 = v5;
      if (v6)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v8 = v7;
        }
        else {
          uint64_t v8 = 0;
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
      id v9 = v8;

      if (v9)
      {
        v17 = [v4 homeGrabberViewForTraitsParticipant];
        -[SBSystemApertureZStackPolicyAssistant setForegroundExclusiveSceneHandle:homeGrabberView:]((uint64_t)self->_systemApertureZStackPolicyAssistant, v9, v17);
      }
      v21[0] = v7;
      id v15 = v21;
    }
    else
    {
      uint64_t v14 = [v4 sceneForTraitsParticipant];
      id v9 = (id)v14;
      if (!v14)
      {
        int v16 = 0;
        goto LABEL_29;
      }
      uint64_t v20 = v14;
      id v15 = &v20;
    }
    int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
LABEL_29:

    goto LABEL_30;
  }
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(BSInvalidatable *)self->_secureAppViewController appView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v5 homeGrabberView];
      uint64_t v10 = [(BSInvalidatable *)self->_secureAppViewController applicationSceneHandle];
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
      id v18 = v13;
    }
    else
    {
      id v18 = 0;
      id v9 = 0;
    }
    -[SBSystemApertureZStackPolicyAssistant setForegroundExclusiveSceneHandle:homeGrabberView:]((uint64_t)self->_systemApertureZStackPolicyAssistant, v18, v9);
    if (v18)
    {
      id v19 = v18;
      int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    }
    else
    {
      int v16 = 0;
    }

    goto LABEL_29;
  }
  int v16 = 0;
LABEL_30:
  [(SBZStackForegroundSceneOrderedPolicyAssistant *)self->_audioCategoryZStackPolicyAssistant setForegroundScenes:v16];
  [(SBZStackForegroundSceneOrderedPolicyAssistant *)self->_physicalButtonZStackPolicyAssistant setForegroundScenes:v16];
}

- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4
{
}

- (void)updateHomeGrabberHiddenAssertion:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v9 = [(BSInvalidatable *)self->_secureAppViewController appView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v6 = v9;
    if (isKindOfClass)
    {
      id v7 = [v9 homeGrabberView];
      [v7 setDelegate:self];
      [v7 setPointerClickDelegate:self];
      if ([(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture]) {
        [(SBCoverSheetSecureAppEnvironmentViewController *)self relinquishHiddenAssertionForHomeGrabber:v7 animated:v3];
      }
      else {
        [(SBCoverSheetSecureAppEnvironmentViewController *)self takeHiddenAssertionForHomeGrabber:v7 animated:v3];
      }
      uint64_t v8 = [(SBCoverSheetSecureAppEnvironmentViewController *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v8 secureAppEnvironmentViewControllerOwnsHomeGestureDidChange];
      }

      uint64_t v6 = v9;
    }
  }
}

- (void)takeHiddenAssertionForHomeGrabber:(id)a3 animated:(BOOL)a4
{
  if (a4)
  {
    char v4 = (void *)MEMORY[0x1E4FA5F28];
    id v5 = a3;
    uint64_t v6 = [v4 rootSettings];
    id v7 = [v6 hideForHomeGestureOwnershipAnimationSettings];
    uint64_t v8 = [v7 BSAnimationSettings];

    [v5 setHidden:1 forReason:@"SBCoverSheetSecureAppEnvironmentViewController" withAnimationSettings:v8];
  }
  else
  {
    [a3 setHidden:1 forReason:@"SBCoverSheetSecureAppEnvironmentViewController" withAnimationSettings:0];
  }
  [a3 setHomeAffordanceInteractionEnabled:0];
}

- (void)relinquishHiddenAssertionForHomeGrabber:(id)a3 animated:(BOOL)a4
{
  if (a4)
  {
    char v4 = (void *)MEMORY[0x1E4FA5F28];
    id v5 = a3;
    uint64_t v6 = [v4 rootSettings];
    id v7 = [v6 unhideForHomeGestureOwnershipAnimationSettings];
    uint64_t v8 = [v7 BSAnimationSettings];

    [v5 setHidden:0 forReason:@"SBCoverSheetSecureAppEnvironmentViewController" withAnimationSettings:v8];
  }
  else
  {
    [a3 setHidden:0 forReason:@"SBCoverSheetSecureAppEnvironmentViewController" withAnimationSettings:0];
  }
  [a3 setHomeAffordanceInteractionEnabled:1];
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
    id v3 = +[SBLockScreenManager sharedInstance];
    [v3 unlockUIFromSource:15 withOptions:MEMORY[0x1E4F1CC08]];
  }
}

- (BSInvalidatable)secureAppViewController
{
  return self->_secureAppViewController;
}

- (SBCoverSheetSecureAppEnvironmentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBCoverSheetSecureAppEnvironmentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secureAppViewController, 0);
  objc_storeStrong((id *)&self->_systemApertureZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_physicalButtonZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_audioCategoryZStackPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_secureAppTraitsParticipantDelegateHelper, 0);
  objc_storeStrong((id *)&self->_secureAppTraitsParticipant, 0);
  objc_storeStrong((id *)&self->_biometricMatchingAssertion, 0);
}

- (void)viewWillAppear:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "%@ acquired PreArmCaptureOnly assertion: %@");
}

- (void)viewWillDisappear:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "%@ released PreArmCaptureOnly assertion: %@");
}

@end