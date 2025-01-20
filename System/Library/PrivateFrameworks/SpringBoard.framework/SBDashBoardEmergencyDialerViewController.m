@interface SBDashBoardEmergencyDialerViewController
- (BOOL)handleEvent:(id)a3;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (int64_t)presentationPriority;
- (int64_t)presentationType;
- (void)_activateEmergencyDialerController;
- (void)_deactivateEmergencyDialerController;
- (void)_updateEmergencyCallMode:(id)a3;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)dealloc;
- (void)emergencyDialer:(id)a3 willDeactivateWithError:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBDashBoardEmergencyDialerViewController

- (void)dealloc
{
  [(SBDashBoardEmergencyDialerViewController *)self _deactivateEmergencyDialerController];
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardEmergencyDialerViewController;
  [(CSCoverSheetViewControllerBase *)&v3 dealloc];
}

- (void)viewDidLoad
{
  [(SBDashBoardEmergencyDialerViewController *)self _activateEmergencyDialerController];
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardEmergencyDialerViewController;
  [(CSCoverSheetViewControllerBase *)&v3 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardEmergencyDialerViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillAppear:a3];
  [(SBDashBoardEmergencyDialerViewController *)self _activateEmergencyDialerController];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBDashBoardEmergencyDialerViewController *)self _deactivateEmergencyDialerController];
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardEmergencyDialerViewController;
  [(CSCoverSheetViewControllerBase *)&v5 viewDidDisappear:v3];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 != 27)
  {
    if (v5 != 25)
    {
LABEL_7:
      int v8 = 0;
LABEL_11:
      v12.receiver = self;
      v12.super_class = (Class)SBDashBoardEmergencyDialerViewController;
      v8 |= [(CSCoverSheetViewControllerBase *)&v12 handleEvent:v4];
      goto LABEL_12;
    }
    if (self->_inEmergencyCallMode)
    {
      v6 = SBLogDashBoard();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        [v4 type];
        v7 = NSStringFromCoverSheetEventType();
        *(_DWORD *)buf = 138543362;
        v14 = v7;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring dismiss from event \"%{public}@\" because we are in emergency call mode.", buf, 0xCu);
      }
      goto LABEL_7;
    }
  }
  v9 = SBLogDashBoard();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [v4 type];
    v10 = NSStringFromCoverSheetEventType();
    *(_DWORD *)buf = 138543362;
    v14 = v10;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Dismissing emergency dialer for event: \"%{public}@\"", buf, 0xCu);
  }
  [(CSCoverSheetViewControllerBase *)self dismiss];
  int v8 = 1;
  if (([v4 isConsumable] & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

- (void)aggregateAppearance:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SBDashBoardEmergencyDialerViewController;
  [(CSCoverSheetViewControllerBase *)&v39 aggregateAppearance:v4];
  uint64_t v5 = [MEMORY[0x1E4F5E3C0] background];
  v6 = [v5 priority:70];
  v7 = [MEMORY[0x1E4F428B8] whiteColor];
  int v8 = [v6 color:v7];
  [v4 addComponent:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F43228]);
  v10 = [MEMORY[0x1E4F428B8] blackColor];
  v11 = (void *)[v9 initWithStyle:2 contentColor:v10];
  [v4 setLegibilitySettings:v11];

  objc_super v12 = [MEMORY[0x1E4F5E3C0] dateView];
  v13 = [v12 priority:70];
  v14 = [v13 hidden:1];
  [v4 addComponent:v14];

  uint64_t v15 = [MEMORY[0x1E4F5E3C0] backgroundContent];
  v16 = [v15 priority:70];
  v17 = [v16 hidden:1];
  [v4 addComponent:v17];

  v18 = [MEMORY[0x1E4F5E3C0] pageContent];
  v19 = [v18 priority:70];
  v20 = [v19 hidden:1];
  [v4 addComponent:v20];

  v21 = [MEMORY[0x1E4F5E3C0] whitePoint];
  v22 = [v21 priority:70];
  v23 = [v22 hidden:1];
  [v4 addComponent:v23];

  if (SBFEffectiveHomeButtonType() == 2)
  {
    v24 = objc_opt_new();
    v25 = [v24 priority:70];
    v26 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
    v27 = [v25 identifier:v26];
    v28 = [v27 hidden:1];
    v29 = [v28 suppressTeachableMomentsAnimation:1];
    [v4 addComponent:v29];

    v30 = [MEMORY[0x1E4F5E3C0] quickActions];
    v31 = [v30 priority:70];
    v32 = [v31 hidden:1];
    [v4 addComponent:v32];

    v33 = [MEMORY[0x1E4F5E3C0] controlCenterGrabber];
    v34 = [v33 priority:70];
    v35 = [v34 hidden:1];
    [v4 addComponent:v35];

    v36 = [MEMORY[0x1E4F5E3C0] proudLock];
    v37 = [v36 priority:70];
    v38 = [v37 hidden:1];
    [v4 addComponent:v38];
  }
}

- (void)aggregateBehavior:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardEmergencyDialerViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v6 aggregateBehavior:v4];
  if (self->_inEmergencyCallMode) {
    uint64_t v5 = 14;
  }
  else {
    uint64_t v5 = 10;
  }
  objc_msgSend(v4, "setIdleTimerDuration:", v5, v6.receiver, v6.super_class);
  [v4 setIdleTimerMode:1];
  [v4 addRestrictedCapabilities:67113118];
  [v4 setProximityDetectionMode:2 * self->_inEmergencyCall];
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 700;
}

- (void)emergencyDialer:(id)a3 willDeactivateWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_super v6 = SBLogDashBoard();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v11 = 138543362;
      id v12 = v5;
      int v8 = "Emergency dialer controller requested dismissal due to error: %{public}@";
      id v9 = v6;
      uint32_t v10 = 12;
LABEL_6:
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
    }
  }
  else if (v7)
  {
    LOWORD(v11) = 0;
    int v8 = "Emergency dialer controller requested dismissal";
    id v9 = v6;
    uint32_t v10 = 2;
    goto LABEL_6;
  }

  [(CSCoverSheetViewControllerBase *)self dismiss];
}

- (void)_activateEmergencyDialerController
{
  if (!self->_controller)
  {
    BOOL v3 = SBLogDashBoard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Activating emergency dialer controller...", buf, 2u);
    }

    id v4 = [MEMORY[0x1E4FADA90] sharedInstance];
    callCenter = self->_callCenter;
    self->_callCenter = v4;

    objc_super v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__updateEmergencyCallMode_ name:*MEMORY[0x1E4FADD90] object:0];
    [v6 addObserver:self selector:sel__updateEmergencyCallMode_ name:*MEMORY[0x1E4FADDC8] object:0];
    [v6 addObserver:self selector:sel__updateEmergencyCallMode_ name:*MEMORY[0x1E4FADD68] object:0];
    BOOL v7 = objc_alloc_init(SBLockScreenEmergencyDialerController);
    controller = self->_controller;
    self->_controller = v7;

    [(SBLockScreenEmergencyDialerController *)self->_controller setDelegate:self];
    id v9 = self->_controller;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke;
    v10[3] = &unk_1E6AF5350;
    v10[4] = self;
    [(SBLockScreenEmergencyDialerController *)v9 activateWithCompletion:v10];
    [(SBDashBoardEmergencyDialerViewController *)self _updateEmergencyCallMode:0];
  }
}

void __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = NSStringFromBOOL();
    *(_DWORD *)buf = 138543362;
    v17 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Emergency dialer controller activation complete; success = %{public}@.",
      buf,
      0xCu);
  }
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1080) viewController];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F4F680];
    objc_super v6 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    BOOL v7 = [v5 settingsWithDuration:v6 timingFunction:0.4];

    int v8 = [v4 view];
    [v8 setAlpha:0.0];
    id v9 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke_23;
    v12[3] = &unk_1E6AF8F30;
    id v13 = v8;
    v14 = v9;
    id v15 = v7;
    id v10 = v7;
    id v11 = v8;
    objc_msgSend(v9, "bs_addChildViewController:animated:transitionBlock:", v4, 1, v12);
    [*(id *)(a1 + 32) _updateEmergencyCallMode:0];
  }
  else
  {
    [*(id *)(a1 + 32) _deactivateEmergencyDialerController];
    [*(id *)(a1 + 32) dismiss];
  }
}

void __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) view];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");

  objc_super v6 = (void *)MEMORY[0x1E4F4F898];
  uint64_t v7 = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke_2;
  v11[3] = &unk_1E6AF4AC0;
  id v12 = *(id *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke_3;
  v9[3] = &unk_1E6AF5A50;
  id v10 = v3;
  id v8 = v3;
  [v6 animateWithSettings:v7 actions:v11 completion:v9];
}

uint64_t __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __78__SBDashBoardEmergencyDialerViewController__activateEmergencyDialerController__block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_deactivateEmergencyDialerController
{
  if (self->_controller)
  {
    id v3 = SBLogDashBoard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Deactivating emergency dialer controller", v7, 2u);
    }

    [(SBLockScreenEmergencyDialerController *)self->_controller deactivate];
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x1E4FADD90] object:0];
    [v4 removeObserver:self name:*MEMORY[0x1E4FADDC8] object:0];
    [v4 removeObserver:self name:*MEMORY[0x1E4FADD68] object:0];
    controller = self->_controller;
    self->_controller = 0;

    callCenter = self->_callCenter;
    self->_callCenter = 0;

    self->_inEmergencyCall = 0;
    self->_inEmergencyCallMode = 0;
  }
}

- (void)_updateEmergencyCallMode:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

uint64_t __69__SBDashBoardEmergencyDialerViewController__updateEmergencyCallMode___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = SBLogDashBoard();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = [*(id *)(a1 + 32) name];
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Updating for notification: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  char v4 = [*(id *)(*(void *)(a1 + 40) + 1072) anyCallPassesTest:&__block_literal_global_174];
  if (v4) {
    char v5 = 1;
  }
  else {
    char v5 = [MEMORY[0x1E4FADA88] isEmergencyCallbackModeEnabled];
  }
  if ((BSEqualBools() & 1) == 0 || (uint64_t result = BSEqualBools(), (result & 1) == 0))
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 1088) = v4;
    *(unsigned char *)(*(void *)(a1 + 40) + 1089) = v5;
    uint64_t v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = NSStringFromBOOL();
      id v9 = NSStringFromBOOL();
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2114;
      id v13 = v9;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Now in emergency call mode: %{public}@; call active: %{public}@",
        (uint8_t *)&v10,
        0x16u);
    }
    return [*(id *)(a1 + 40) rebuildBehavior];
  }
  return result;
}

uint64_t __69__SBDashBoardEmergencyDialerViewController__updateEmergencyCallMode___block_invoke_27(uint64_t a1, void *a2)
{
  return [a2 isEmergency];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
}

@end