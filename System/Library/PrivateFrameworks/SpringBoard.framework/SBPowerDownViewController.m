@interface SBPowerDownViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsStackingOverlayContentAbove;
- (BOOL)handleLockButtonPress;
- (BOOL)passcodeEntryTransientOverlayViewController:(id)a3 authenticatePasscode:(id)a4;
- (BOOL)prefersEmbeddedDisplayPresentation;
- (BOOL)shouldDisableBanners;
- (BOOL)shouldDisableControlCenter;
- (BOOL)shouldDisableSiri;
- (BOOL)shouldPendAlertItems;
- (BOOL)userWantsFindMySuppressed;
- (NSMutableArray)externalDisplayDimmingWindows;
- (SBFLockOutStatusProvider)lockOutController;
- (SBFUserAuthenticationController)userAuthController;
- (SBPasscodeEntryTransientOverlayViewController)passcodeEntryTransientOverlayViewController;
- (SBPowerDownViewController)initWithWindowSceneManager:(id)a3;
- (SBPowerDownViewControllerDelegate)delegate;
- (SBWindowSceneManager)windowSceneManager;
- (SPBeaconManager)beaconManager;
- (id)newTransientOverlayDismissalTransitionCoordinator;
- (id)newTransientOverlayPresentationTransitionCoordinator;
- (id)passcodeEntryTransientOverlayViewControllerStatusSubtitleText;
- (id)passcodeEntryTransientOverlayViewControllerStatusText;
- (int)_preferredStatusBarVisibility;
- (int64_t)idleTimerMode;
- (void)_beginTimeTracking;
- (void)_endTimeTrackingIncludingReportWithKey:(id)a3;
- (void)_incrementCountForKey:(id)a3;
- (void)_setPasscodeVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)didTapTemporarilyDisableFindMy;
- (void)passcodeEntryTransientOverlayViewControllerRequestsDismissal:(id)a3;
- (void)powerDownViewDidCancelSlide:(id)a3;
- (void)powerDownViewDidCompleteSlide:(id)a3;
- (void)powerDownViewDidFireIdleTimer:(id)a3;
- (void)powerDownViewDidReceiveCancelButtonAction:(id)a3;
- (void)powerDownViewRequestCancel:(id)a3;
- (void)powerDownViewRequestPowerDown:(id)a3;
- (void)setBeaconManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalDisplayDimmingWindows:(id)a3;
- (void)setLockOutController:(id)a3;
- (void)setPasscodeEntryTransientOverlayViewController:(id)a3;
- (void)setUserAuthController:(id)a3;
- (void)setUserWantsFindMySuppressed:(BOOL)a3;
- (void)setWindowSceneManager:(id)a3;
- (void)showPowerDownFindMyAlert;
- (void)showPowerDownFindMyAlertWithProceed:(id)a3 cancelCompletion:(id)a4;
- (void)userAcknowledgedFindMyInfo;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBPowerDownViewController

- (SBPowerDownViewController)initWithWindowSceneManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBPowerDownViewController;
  v6 = [(SBPowerDownViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_windowSceneManager, a3);
  }

  return v7;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBPowerDownViewController;
  [(SBTransientOverlayViewController *)&v5 viewDidDisappear:a3];
  v4 = [(SBPowerDownViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 powerDownViewControllerDidDisappear:self];
  }
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SBPowerDownViewController;
  [(SBTransientOverlayViewController *)&v12 viewDidLayoutSubviews];
  v3 = [(SBPowerDownViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[SBPowerDownView setFrame:](self->_powerDownView, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)SBPowerDownViewController;
  [(SBTransientOverlayViewController *)&v16 viewDidLoad];
  v3 = [(SBTransientOverlayViewController *)self contentView];
  double v4 = +[SBWallpaperController sharedInstance];
  uint64_t v5 = [v4 activeVariant];
  [v4 contrastForVariant:v5];
  double v7 = v6;
  double v8 = (void *)MEMORY[0x1E4F43388];
  double v9 = [v4 averageColorForVariant:v5];
  double v10 = [v4 legibilitySettingsForVariant:v5];
  double v11 = [v8 vibrantSettingsWithReferenceColor:v9 referenceContrast:v10 legibilitySettings:v7];

  objc_super v12 = [SBPowerDownView alloc];
  [v3 bounds];
  v13 = -[SBUIPowerDownView initWithFrame:vibrantSettings:](v12, "initWithFrame:vibrantSettings:", v11);
  powerDownView = self->_powerDownView;
  self->_powerDownView = v13;

  [(SBUIPowerDownView *)self->_powerDownView setDelegate:self];
  [v3 addSubview:self->_powerDownView];
  id v15 = objc_alloc_init(MEMORY[0x1E4F97C08]);
  [(SBPowerDownViewController *)self setBeaconManager:v15];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBPowerDownViewController;
  [(SBPowerDownViewController *)&v9 viewWillAppear:a3];
  [(SBPowerDownViewController *)self _beginTimeTracking];
  [(SBPowerDownViewController *)self _incrementCountForKey:@"com.apple.springboard.powerdown.uiActivatedCount"];
  double v4 = [(id)SBApp captureButtonRestrictionCoordinator];
  uint64_t v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  double v7 = [v4 inhibitCaptureButtonActionAssertionWithReason:v6];
  powerDownCaptureButtonSuppressionAssertion = self->_powerDownCaptureButtonSuppressionAssertion;
  self->_powerDownCaptureButtonSuppressionAssertion = v7;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBPowerDownViewController;
  [(SBPowerDownViewController *)&v5 viewWillDisappear:a3];
  [(SBPowerDownViewController *)self _endTimeTrackingIncludingReportWithKey:@"com.apple.springboard.powerdown.uiActivatedDurationSeconds"];
  [(BSInvalidatable *)self->_powerDownCaptureButtonSuppressionAssertion invalidate];
  powerDownCaptureButtonSuppressionAssertion = self->_powerDownCaptureButtonSuppressionAssertion;
  self->_powerDownCaptureButtonSuppressionAssertion = 0;
}

- (int)_preferredStatusBarVisibility
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)powerDownViewRequestCancel:(id)a3
{
  id v4 = [(SBPowerDownViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 powerDownViewControllerRequestsDismissal:self];
  }
}

- (void)powerDownViewRequestPowerDown:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SBPowerDownViewController_powerDownViewRequestPowerDown___block_invoke;
  v8[3] = &unk_1E6AF4AC0;
  v8[4] = self;
  id v4 = (void (**)(void))MEMORY[0x1D948C7A0](v8, a2, a3);
  if ([(SBPowerDownViewController *)self userWantsFindMySuppressed])
  {
    objc_super v5 = [(SBPowerDownViewController *)self beaconManager];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__SBPowerDownViewController_powerDownViewRequestPowerDown___block_invoke_2;
    v6[3] = &unk_1E6AF5300;
    double v7 = v4;
    [v5 setSuppressLPEMBeaconing:1 completion:v6];
  }
  else
  {
    v4[2](v4);
  }
}

void __59__SBPowerDownViewController_powerDownViewRequestPowerDown___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 powerDownViewControllerRequestsPowerDown:*(void *)(a1 + 32)];
  }
}

void __59__SBPowerDownViewController_powerDownViewRequestPowerDown___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SBPowerDownViewController_powerDownViewRequestPowerDown___block_invoke_3;
  block[3] = &unk_1E6AF5300;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__SBPowerDownViewController_powerDownViewRequestPowerDown___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showPowerDownFindMyAlertWithProceed:(id)a3 cancelCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v9 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"POWER_DOWN_FIND_MY_TITLE"];
  v24 = [v8 localizedStringForKey:v9 value:&stru_1F3084718 table:@"SpringBoard"];

  double v10 = [MEMORY[0x1E4F28B50] mainBundle];
  double v11 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"POWER_DOWN_FIND_MY"];
  objc_super v12 = [v10 localizedStringForKey:v11 value:&stru_1F3084718 table:@"SpringBoard"];

  v13 = [MEMORY[0x1E4F28B50] mainBundle];
  v14 = [v13 localizedStringForKey:@"OK" value:&stru_1F3084718 table:@"SpringBoard"];

  id v15 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v16 = [v15 localizedStringForKey:@"CANCEL" value:&stru_1F3084718 table:@"SpringBoard"];

  v17 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v24 message:v12 preferredStyle:1];
  v18 = (void *)MEMORY[0x1E4F42720];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __82__SBPowerDownViewController_showPowerDownFindMyAlertWithProceed_cancelCompletion___block_invoke;
  v27[3] = &unk_1E6AF5328;
  v27[4] = self;
  id v28 = v6;
  id v19 = v6;
  v20 = [v18 actionWithTitle:v14 style:0 handler:v27];
  [v17 addAction:v20];

  v21 = (void *)MEMORY[0x1E4F42720];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __82__SBPowerDownViewController_showPowerDownFindMyAlertWithProceed_cancelCompletion___block_invoke_3;
  v25[3] = &unk_1E6AF5328;
  v25[4] = self;
  id v26 = v7;
  id v22 = v7;
  v23 = [v21 actionWithTitle:v16 style:1 handler:v25];
  [v17 addAction:v23];

  [(SBPowerDownViewController *)self presentViewController:v17 animated:1 completion:0];
}

uint64_t __82__SBPowerDownViewController_showPowerDownFindMyAlertWithProceed_cancelCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) beaconManager];
  [v2 setUserHasAcknowledgedFindMy:1 completion:&__block_literal_global_8];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __82__SBPowerDownViewController_showPowerDownFindMyAlertWithProceed_cancelCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) beaconManager];
  [v2 setUserHasAcknowledgedFindMy:1 completion:&__block_literal_global_60];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)showPowerDownFindMyAlert
{
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"POWER_DOWN_FIND_MY_TITLE"];
  objc_super v5 = [v3 localizedStringForKey:v4 value:&stru_1F3084718 table:@"SpringBoard"];

  id v6 = [MEMORY[0x1E4F28B50] mainBundle];
  id v7 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"POWER_DOWN_FIND_MY_DISABLE"];
  double v8 = [v6 localizedStringForKey:v7 value:&stru_1F3084718 table:@"SpringBoard"];

  objc_super v9 = [MEMORY[0x1E4F28B50] mainBundle];
  double v10 = [v9 localizedStringForKey:@"POWER_DOWN_FIND_MY_DISABLE_BUTTON" value:&stru_1F3084718 table:@"SpringBoard"];

  double v11 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v12 = [v11 localizedStringForKey:@"OK" value:&stru_1F3084718 table:@"SpringBoard"];

  v13 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v5 message:v8 preferredStyle:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__SBPowerDownViewController_showPowerDownFindMyAlert__block_invoke;
  v17[3] = &unk_1E6AF4918;
  v17[4] = self;
  v14 = [MEMORY[0x1E4F42720] actionWithTitle:v12 style:0 handler:v17];
  [v13 addAction:v14];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__SBPowerDownViewController_showPowerDownFindMyAlert__block_invoke_2;
  v16[3] = &unk_1E6AF4918;
  v16[4] = self;
  id v15 = [MEMORY[0x1E4F42720] actionWithTitle:v10 style:0 handler:v16];
  [v13 addAction:v15];

  [(SBPowerDownViewController *)self presentViewController:v13 animated:1 completion:0];
}

uint64_t __53__SBPowerDownViewController_showPowerDownFindMyAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) userAcknowledgedFindMyInfo];
}

uint64_t __53__SBPowerDownViewController_showPowerDownFindMyAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didTapTemporarilyDisableFindMy];
}

- (void)userAcknowledgedFindMyInfo
{
  v3 = [(SBPowerDownViewController *)self beaconManager];
  [v3 setUserHasAcknowledgedFindMy:1 completion:&__block_literal_global_68];

  powerDownView = self->_powerDownView;
  [(SBUIPowerDownView *)powerDownView didAcknowledgeFindMyInfo];
}

- (void)didTapTemporarilyDisableFindMy
{
  [(SBPowerDownViewController *)self userAcknowledgedFindMyInfo];
  v3 = [(id)SBApp authenticationController];
  int v4 = [v3 hasPasscodeSet];

  if (v4)
  {
    objc_super v5 = [(SBPowerDownViewController *)self userAuthController];

    if (!v5)
    {
      id v6 = [(id)SBApp authenticationController];
      userAuthController = self->_userAuthController;
      self->_userAuthController = v6;

      double v8 = [(id)SBApp lockOutController];
      lockOutController = self->_lockOutController;
      self->_lockOutController = v8;
    }
    double v10 = [SBPasscodeEntryTransientOverlayViewController alloc];
    double v11 = [(id)SBApp authenticationController];
    v14 = [(SBPasscodeEntryTransientOverlayViewController *)v10 initWithAuthenticationController:v11];

    [(SBPowerDownViewController *)self setPasscodeEntryTransientOverlayViewController:v14];
    [(SBPasscodeEntryTransientOverlayViewController *)self->_passcodeEntryTransientOverlayViewController setDelegate:self];
    objc_super v12 = +[SBWorkspace mainWorkspace];
    [v12 presentTransientOverlayViewController:self->_passcodeEntryTransientOverlayViewController animated:1 completion:0];
  }
  else
  {
    [(SBPowerDownViewController *)self setUserWantsFindMySuppressed:1];
    powerDownView = self->_powerDownView;
    [(SBUIPowerDownView *)powerDownView didSuppressFindMy];
  }
}

- (void)_setPasscodeVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[SBWorkspace mainWorkspace];
  [v6 dismissTransientOverlayViewController:self->_passcodeEntryTransientOverlayViewController animated:v4 completion:0];

  passcodeEntryTransientOverlayViewController = self->_passcodeEntryTransientOverlayViewController;
  self->_passcodeEntryTransientOverlayViewController = 0;
}

- (BOOL)passcodeEntryTransientOverlayViewController:(id)a3 authenticatePasscode:(id)a4
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__SBPowerDownViewController_passcodeEntryTransientOverlayViewController_authenticatePasscode___block_invoke;
  v10[3] = &unk_1E6AF5350;
  v10[4] = self;
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1D948C7A0](v10);
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FA5EA0]) initForPasscode:v5 source:0 handler:v6];

  double v8 = [(SBPowerDownViewController *)self userAuthController];
  [v8 processAuthenticationRequest:v7];

  return 1;
}

uint64_t __94__SBPowerDownViewController_passcodeEntryTransientOverlayViewController_authenticatePasscode___block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"no";
    if (a2) {
      id v5 = @"yes";
    }
    int v8 = 138412290;
    objc_super v9 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "PowerDownFindMy auth attempt succeeded: %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = *(id **)(a1 + 32);
  if (a2)
  {
    [v6 setUserWantsFindMySuppressed:1];
    [*(id *)(*(void *)(a1 + 32) + 1408) didSuppressFindMy];
  }
  else
  {
    uint64_t result = [v6[185] isBlocked];
    if (!result) {
      return result;
    }
  }
  return [*(id *)(a1 + 32) _setPasscodeVisible:0 animated:1];
}

- (void)passcodeEntryTransientOverlayViewControllerRequestsDismissal:(id)a3
{
  id v4 = +[SBWorkspace mainWorkspace];
  [v4 dismissTransientOverlayViewController:self->_passcodeEntryTransientOverlayViewController animated:1 completion:0];
}

- (id)passcodeEntryTransientOverlayViewControllerStatusText
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"POWER_DOWN_FIND_MY_DISABLE_PASSCODE_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];

  return v3;
}

- (id)passcodeEntryTransientOverlayViewControllerStatusSubtitleText
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"POWER_DOWN_FIND_MY_DISABLE_PASSCODE_SUBTITLE" value:&stru_1F3084718 table:@"SpringBoard"];

  return v3;
}

- (void)powerDownViewDidCancelSlide:(id)a3
{
}

- (void)powerDownViewDidCompleteSlide:(id)a3
{
}

- (void)powerDownViewDidFireIdleTimer:(id)a3
{
}

- (void)powerDownViewDidReceiveCancelButtonAction:(id)a3
{
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return 1;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return 1;
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 performAlongsideTransitions];
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  id v5 = *(void **)(*(void *)(a1 + 32) + 1408);
  uint64_t v6 = [v3 isAnimated];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
  v28[3] = &unk_1E6AF4AC0;
  id v7 = v4;
  v29 = v7;
  [v5 hideAnimated:v6 completion:v28];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v17 = a1;
  id obj = *(id *)(*(void *)(a1 + 32) + 1464);
  uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        dispatch_group_enter(v7);
        double v13 = 0.0;
        if ([v3 isAnimated])
        {
          [*(id *)(*(void *)(v17 + 32) + 1408) showHideAnimationDuration];
          double v13 = v14;
        }
        id v15 = (void *)MEMORY[0x1E4F42FF0];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
        v23[3] = &unk_1E6AF4AC0;
        v23[4] = v12;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4;
        v21[3] = &unk_1E6AF4A98;
        v21[4] = v12;
        id v22 = v7;
        [v15 animateWithDuration:v23 animations:v21 completion:v13];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v9);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5;
  block[3] = &unk_1E6AF5290;
  void block[4] = *(void *)(v17 + 32);
  id v20 = v3;
  id v16 = v3;
  dispatch_group_notify(v7, MEMORY[0x1E4F14428], block);
}

void __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
}

uint64_t __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  id v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

uint64_t __78__SBPowerDownViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1464) removeAllObjects];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1464);
  *(void *)(v2 + 1464) = 0;

  id v4 = *(void **)(a1 + 40);
  return [v4 completeTransition:1];
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  id v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 performAlongsideTransitions];
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  id v5 = *(void **)(*(void *)(a1 + 32) + 1408);
  long long v27 = v3;
  uint64_t v6 = [v3 isAnimated];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
  v40[3] = &unk_1E6AF4AC0;
  id v7 = v4;
  v41 = v7;
  [v5 showAnimated:v6 completion:v40];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 1448) connectedWindowScenes];
  uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    long long v26 = v34;
    double v11 = *MEMORY[0x1E4F43F18];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (objc_msgSend(v13, "isExternalDisplayWindowScene", v26))
        {
          dispatch_group_enter(v7);
          double v14 = (void *)[objc_alloc(MEMORY[0x1E4FA6088]) initWithWindowScene:v13];
          [v14 setWindowLevel:v11];
          [v14 setHidden:0];
          [v14 setAlpha:0.0];
          id v15 = *(void **)(*(void *)(a1 + 32) + 1408);
          [v14 bounds];
          id v16 = objc_msgSend(v15, "createDimmingBackdropViewWithFrame:");
          [v14 addSubview:v16];
          uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 1464);
          if (!v17)
          {
            id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            uint64_t v19 = *(void *)(a1 + 32);
            id v20 = *(void **)(v19 + 1464);
            *(void *)(v19 + 1464) = v18;

            uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 1464);
          }
          [v17 addObject:v14];
          double v21 = 0.0;
          if ([v27 isAnimated])
          {
            [*(id *)(*(void *)(a1 + 32) + 1408) showHideAnimationDuration];
            double v21 = v22;
          }
          v23 = (void *)MEMORY[0x1E4F42FF0];
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v34[0] = __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
          v34[1] = &unk_1E6AF4AC0;
          id v35 = v14;
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4;
          v31[3] = &unk_1E6AF5350;
          v32 = v7;
          id v24 = v14;
          [v23 animateWithDuration:v33 animations:v31 completion:v21];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v9);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5;
  block[3] = &unk_1E6AF4AC0;
  id v30 = v27;
  id v25 = v27;
  dispatch_group_notify(v7, MEMORY[0x1E4F14428], block);
}

void __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
}

uint64_t __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4(uint64_t a1)
{
}

uint64_t __81__SBPowerDownViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (int64_t)idleTimerMode
{
  return 3;
}

- (BOOL)shouldDisableBanners
{
  return 1;
}

- (BOOL)shouldDisableControlCenter
{
  return 1;
}

- (BOOL)shouldDisableSiri
{
  return 1;
}

- (BOOL)shouldPendAlertItems
{
  return 1;
}

- (BOOL)handleLockButtonPress
{
  uint64_t v2 = [MEMORY[0x1E4FA7C68] sharedInstance];
  [v2 _forceBioLockout];

  return 1;
}

- (void)_beginTimeTracking
{
  self->_aggdStartTime = mach_absolute_time();
}

- (void)_incrementCountForKey:(id)a3
{
}

- (void)_endTimeTrackingIncludingReportWithKey:(id)a3
{
  if (self->_aggdStartTime)
  {
    ADPushTimeIntervalForDistributionKeySinceStartTime();
    self->_aggdStartTime = 0;
  }
}

- (SBPowerDownViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBPowerDownViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SPBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
}

- (SBWindowSceneManager)windowSceneManager
{
  return self->_windowSceneManager;
}

- (void)setWindowSceneManager:(id)a3
{
}

- (SBPasscodeEntryTransientOverlayViewController)passcodeEntryTransientOverlayViewController
{
  return self->_passcodeEntryTransientOverlayViewController;
}

- (void)setPasscodeEntryTransientOverlayViewController:(id)a3
{
}

- (NSMutableArray)externalDisplayDimmingWindows
{
  return self->_externalDisplayDimmingWindows;
}

- (void)setExternalDisplayDimmingWindows:(id)a3
{
}

- (SBFUserAuthenticationController)userAuthController
{
  return self->_userAuthController;
}

- (void)setUserAuthController:(id)a3
{
}

- (BOOL)userWantsFindMySuppressed
{
  return self->_userWantsFindMySuppressed;
}

- (void)setUserWantsFindMySuppressed:(BOOL)a3
{
  self->_userWantsFindMySuppressed = a3;
}

- (SBFLockOutStatusProvider)lockOutController
{
  return self->_lockOutController;
}

- (void)setLockOutController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockOutController, 0);
  objc_storeStrong((id *)&self->_userAuthController, 0);
  objc_storeStrong((id *)&self->_externalDisplayDimmingWindows, 0);
  objc_storeStrong((id *)&self->_passcodeEntryTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_powerDownCaptureButtonSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_powerDownView, 0);
}

@end