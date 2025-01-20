@interface SBCarDoNotDisturbController
- (BOOL)_dismissAlertItemsAnimated:(BOOL)a3;
- (BOOL)_hasShownSiriHeaderViewControllerDuringCurrentCarDNDSession;
- (BOOL)_isExitConfirmationRequired;
- (BOOL)_shouldExitConfirmationBeEnforced;
- (BOOL)handleEvent:(id)a3;
- (BOOL)showPasscode;
- (BOOL)unlockFromSource:(int)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (NSString)coverSheetIdentifier;
- (SBCarDoNotDisturbController)init;
- (SBCarDoNotDisturbController)initWithCARAutomaticDNDStatus:(id)a3 lockScreenManager:(id)a4;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (unint64_t)restrictedCapabilities;
- (void)_queue_setExitConfirmationRequired:(BOOL)a3;
- (void)_queue_setScreenOn:(BOOL)a3;
- (void)_setHasShownSiriHeaderViewControllerDuringCurrentCarDNDSession:(BOOL)a3;
- (void)_setScreenOn:(BOOL)a3;
- (void)dealloc;
@end

@implementation SBCarDoNotDisturbController

- (SBCarDoNotDisturbController)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F57EC8]);
  v4 = +[SBLockScreenManager sharedInstance];
  v5 = [(SBCarDoNotDisturbController *)self initWithCARAutomaticDNDStatus:v3 lockScreenManager:v4];

  return v5;
}

- (SBCarDoNotDisturbController)initWithCARAutomaticDNDStatus:(id)a3 lockScreenManager:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBCarDoNotDisturbController.m", 51, @"Invalid parameter not satisfying: %@", @"carAutomaticDNDStatus" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)SBCarDoNotDisturbController;
  v10 = [(SBCarDoNotDisturbController *)&v26 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_carAutomaticDNDStatus, a3);
    objc_storeStrong((id *)&v11->_lockScreenManager, a4);
    v12 = [MEMORY[0x1E4F4F730] serial];
    uint64_t v13 = BSDispatchQueueCreate();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    carAutomaticDNDStatus = v11->_carAutomaticDNDStatus;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke;
    v24[3] = &unk_1E6AF8948;
    v16 = v11;
    v25 = v16;
    [(CARAutomaticDNDStatus *)carAutomaticDNDStatus fetchAutomaticDNDExitConfirmationWithReply:v24];
    objc_initWeak(&location, v16);
    v17 = v11->_carAutomaticDNDStatus;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_43;
    v21[3] = &unk_1E6AF80B8;
    objc_copyWeak(&v22, &location);
    [(CARAutomaticDNDStatus *)v17 setExitConfirmationChangeObserver:v21];
    v18 = [(SBLockScreenManager *)v11->_lockScreenManager coverSheetViewController];
    [v18 registerExternalLockProvider:v16];
    [v18 registerExternalEventHandler:v16];
    [v18 registerExternalBehaviorProvider:v16];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v11;
}

void __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = SBLogDoNotDisturbWhileDriving();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_cold_1((uint64_t)v5, v7);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = @"Not Required";
      if (a2) {
        id v8 = @"Required";
      }
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "fetched car automatic DnD exit-confirmation status: %@", buf, 0xCu);
    }

    id v9 = *(void **)(a1 + 32);
    v10 = v9[1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_40;
    v11[3] = &unk_1E6AF5D38;
    v12 = v9;
    char v13 = a2;
    dispatch_async(v10, v11);
    v7 = v12;
  }
}

unsigned char *__79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_40(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[16]) {
    return (unsigned char *)objc_msgSend(result, "_queue_setExitConfirmationRequired:", *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_43(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = SBLogDoNotDisturbWhileDriving();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v12 = a2;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "car automatic DnD exit-confirmation state update received, new state: %{BOOL}u", buf, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained[1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_44;
  v8[3] = &unk_1E6AF5D38;
  id v9 = WeakRetained;
  char v10 = a2;
  v7 = WeakRetained;
  dispatch_async(v6, v8);
}

uint64_t __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setExitConfirmationRequired:", *(unsigned __int8 *)(a1 + 40));
}

- (void)dealloc
{
  [(CARAutomaticDNDStatus *)self->_carAutomaticDNDStatus setExitConfirmationChangeObserver:0];
  id v3 = [(SBLockScreenManager *)self->_lockScreenManager coverSheetViewController];
  [v3 unregisterExternalLockProvider:self];

  v4.receiver = self;
  v4.super_class = (Class)SBCarDoNotDisturbController;
  [(SBCarDoNotDisturbController *)&v4 dealloc];
}

- (BOOL)showPasscode
{
  return 0;
}

- (BOOL)unlockFromSource:(int)a3
{
  BOOL v5 = [(SBCarDoNotDisturbController *)self _shouldExitConfirmationBeEnforced];
  if (v5)
  {
    v6 = objc_alloc_init(SBCarDoNotDisturbExitConfirmationAlertItem);
    objc_initWeak(&location, v6);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke;
    v15 = &unk_1E6B08158;
    objc_copyWeak(&v17, &location);
    uint64_t v16 = self;
    int v18 = a3;
    [(SBCarDoNotDisturbExitConfirmationAlertItem *)v6 setNotDrivingActionHandler:&v12];
    v7 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
    id v8 = [v7 policyAggregator];
    if ([v8 allowsCapability:4]
      && [MEMORY[0x1E4FA4FF8] shouldShowCarDNDUseSiriHeaderViewController])
    {
      BOOL v9 = [(SBCarDoNotDisturbController *)self _hasShownSiriHeaderViewControllerDuringCurrentCarDNDSession];

      if (!v9)
      {
        [(SBCarDoNotDisturbExitConfirmationAlertItem *)v6 setShowSiriHeaderViewController:1];
        [(SBCarDoNotDisturbController *)self _setHasShownSiriHeaderViewControllerDuringCurrentCarDNDSession:1];
      }
    }
    else
    {
    }
    char v10 = +[SBAlertItemsController sharedInstance];
    [v10 activateAlertItem:v6];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return !v5;
}

void __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v2 = _os_activity_create(&dword_1D85BA000, "deactivate car automatic DnD", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &state);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained showSiriHeaderViewController]) {
    id v4 = (id)*MEMORY[0x1E4FA5008];
  }
  else {
    id v4 = 0;
  }
  BOOL v5 = SBLogDoNotDisturbWhileDriving();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "requesting end of car automatic DnD", buf, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_49;
  v9[3] = &unk_1E6B08130;
  v9[4] = v6;
  id v8 = WeakRetained;
  id v10 = v8;
  int v11 = *(_DWORD *)(a1 + 48);
  [v7 disableDNDUntilEndOfDriveWithContext:v4 reply:v9];

  os_activity_scope_leave(&state);
}

void __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_49(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = SBLogDoNotDisturbWhileDriving();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "succeeded in ending car automatic DnD", buf, 2u);
    }

    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_50;
    v16[3] = &unk_1E6AF8BD8;
    BOOL v9 = (id *)v17;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    v17[0] = v10;
    v17[1] = v11;
    int v18 = *(_DWORD *)(a1 + 48);
    uint64_t v12 = v16;
    uint64_t v13 = v8;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_49_cold_1((uint64_t)v5, v7);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_52;
    v14[3] = &unk_1E6AF4AC0;
    BOOL v9 = &v15;
    id v15 = *(id *)(a1 + 40);
    uint64_t v13 = MEMORY[0x1E4F14428];
    uint64_t v12 = v14;
  }
  dispatch_async(v13, v12);
}

void __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_50(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_2;
  block[3] = &unk_1E6AF8BD8;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  int v7 = *(_DWORD *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_msgSend(*(id *)(a1 + 40), "_queue_setExitConfirmationRequired:", 0);
}

void __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) deactivateForButton];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 32) coverSheetViewController];
  id v2 = [MEMORY[0x1E4F5E380] actionWithType:9];
  [v3 handleAction:v2 fromSender:*(void *)(a1 + 40)];

  [*(id *)(*(void *)(a1 + 40) + 32) unlockUIFromSource:*(unsigned int *)(a1 + 48) withOptions:0];
}

uint64_t __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_52(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == 24)
  {
    [(SBCarDoNotDisturbController *)self _setScreenOn:1];
  }
  else if (v5 == 25)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    uint64_t v6 = _os_activity_create(&dword_1D85BA000, "deactivate car automatic DnD alert item (screen off)", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &state);

    if ([(SBCarDoNotDisturbController *)self _dismissAlertItemsAnimated:0])
    {
      int v7 = SBLogDoNotDisturbWhileDriving();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v9 = 0;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "deactivated car automatic DnD alert item because screen turned off", v9, 2u);
      }
    }
    [(SBCarDoNotDisturbController *)self _setScreenOn:0];
    os_activity_scope_leave(&state);
  }

  return 0;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
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
  if ([(SBCarDoNotDisturbController *)self _isExitConfirmationRequired]) {
    return 10485956;
  }
  else {
    return 0;
  }
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (NSString)coverSheetIdentifier
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (void)_setScreenOn:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SBCarDoNotDisturbController__setScreenOn___block_invoke;
  v4[3] = &unk_1E6AF5D38;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __44__SBCarDoNotDisturbController__setScreenOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setScreenOn:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_queue_setScreenOn:(BOOL)a3
{
  if (self->_queue_screenOn != a3)
  {
    self->_queue_screenOn = a3;
    if (!a3 && self->_queue_pendingExitConfirmationRequirement)
    {
      id v4 = SBLogDoNotDisturbWhileDriving();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v5 = 0;
        _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "enabling exit-confirmation requirement due to screen-off", v5, 2u);
      }

      [(SBCarDoNotDisturbController *)self _queue_setExitConfirmationRequired:1];
    }
  }
}

- (BOOL)_dismissAlertItemsAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  id v4 = +[SBAlertItemsController sharedInstance];
  LOBYTE(v3) = [v4 deactivateAlertItemsOfClass:objc_opt_class() reason:5 animated:v3];

  return v3;
}

- (void)_queue_setExitConfirmationRequired:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
  self->_queue_pendingExitConfirmationRequirement = 0;
  if (v3) {
    self->_queue_hasShownSiriHeaderViewControllerDuringCurrentCarDNDSession = 0;
  }
  BOOL v5 = SBLogDoNotDisturbWhileDriving();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL queue_exitConfirmationRequired = self->_queue_exitConfirmationRequired;
    *(_DWORD *)buf = 67109376;
    BOOL v10 = v3;
    __int16 v11 = 1024;
    BOOL v12 = queue_exitConfirmationRequired;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "setting internal car automatic DnD exit-confirmation flag to %{BOOL}u (was %{BOOL}u)", buf, 0xEu);
  }

  self->_queue_stateValid = 1;
  if (self->_queue_exitConfirmationRequired != v3)
  {
    if (self->_queue_screenOn && v3)
    {
      int v7 = SBLogDoNotDisturbWhileDriving();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "deferring exit-confirmation requirement until screen off", buf, 2u);
      }

      self->_queue_pendingExitConfirmationRequirement = 1;
    }
    else
    {
      self->_BOOL queue_exitConfirmationRequired = v3;
      if (!v3)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __66__SBCarDoNotDisturbController__queue_setExitConfirmationRequired___block_invoke;
        block[3] = &unk_1E6AF4AC0;
        void block[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      BSDispatchMain();
    }
  }
}

void __66__SBCarDoNotDisturbController__queue_setExitConfirmationRequired___block_invoke(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v2 = _os_activity_create(&dword_1D85BA000, "deactivate car automatic DnD alert item (exit-confirmation off)", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &state);

  if ([*(id *)(a1 + 32) _dismissAlertItemsAnimated:1])
  {
    BOOL v3 = SBLogDoNotDisturbWhileDriving();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "deactivated car automatic DnD alert item because exit-confirmation no longer required", v4, 2u);
    }
  }
  os_activity_scope_leave(&state);
}

void __66__SBCarDoNotDisturbController__queue_setExitConfirmationRequired___block_invoke_56(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) coverSheetViewController];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __66__SBCarDoNotDisturbController__queue_setExitConfirmationRequired___block_invoke_2;
  BOOL v9 = &unk_1E6AF5290;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  BOOL v5 = (void (**)(void))MEMORY[0x1D948C7A0](&v6);
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldExitConfirmationBeEnforced", v6, v7, v8, v9)) {
    [v3 activateMainPageWithCompletion:v5];
  }
  else {
    v5[2](v5);
  }
}

uint64_t __66__SBCarDoNotDisturbController__queue_setExitConfirmationRequired___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) externalBehaviorProviderBehaviorChanged:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 externalLockProviderStateChanged:v3];
}

- (BOOL)_isExitConfirmationRequired
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SBCarDoNotDisturbController__isExitConfirmationRequired__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__SBCarDoNotDisturbController__isExitConfirmationRequired__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 17);
  return result;
}

- (BOOL)_shouldExitConfirmationBeEnforced
{
  BOOL v3 = [(SBCarDoNotDisturbController *)self _isExitConfirmationRequired];
  if (v3)
  {
    lockScreenManager = self->_lockScreenManager;
    LOBYTE(v3) = [(SBLockScreenManager *)lockScreenManager isLockScreenVisible];
  }
  return v3;
}

- (void)_setHasShownSiriHeaderViewControllerDuringCurrentCarDNDSession:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __94__SBCarDoNotDisturbController__setHasShownSiriHeaderViewControllerDuringCurrentCarDNDSession___block_invoke;
  v4[3] = &unk_1E6AF5D38;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __94__SBCarDoNotDisturbController__setHasShownSiriHeaderViewControllerDuringCurrentCarDNDSession___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 20) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)_hasShownSiriHeaderViewControllerDuringCurrentCarDNDSession
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __90__SBCarDoNotDisturbController__hasShownSiriHeaderViewControllerDuringCurrentCarDNDSession__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __90__SBCarDoNotDisturbController__hasShownSiriHeaderViewControllerDuringCurrentCarDNDSession__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 20);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_carAutomaticDNDStatus, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "failed to fetch car automatic DnD exit-confirmation status with error %@", (uint8_t *)&v2, 0xCu);
}

void __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_49_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "failed to disable car automatic DnD with error %@", (uint8_t *)&v2, 0xCu);
}

@end