@interface SBSyncController
+ (SBSyncController)sharedInstance;
- (BOOL)_isBackupAgentRunning;
- (BOOL)isInUse;
- (BOOL)isResetting;
- (BOOL)isRestoring;
- (SBIdleTimerCoordinating)_idleTimerCoordinator;
- (id)_idleTimerBehavior;
- (int)resetState;
- (int)restoreState;
- (void)_appInstallationNotification;
- (void)_delayedQuitApplications;
- (void)_didEndRestoring:(int)a3;
- (void)_invalidateRestoreTimer;
- (void)_isBackupAgentRunning;
- (void)_killApplicationsIfNecessary;
- (void)_notifyRestoreCanProceed;
- (void)_rebootNow;
- (void)_restoreTimerFired:(id)a3;
- (void)_setIdleTimerCoordinator:(id)a3;
- (void)_setRestoreState:(int)a3;
- (void)_setupRestoreTimer;
- (void)_syncSessionDidBegin;
- (void)_syncSessionDidEnd;
- (void)beginRestoring;
- (void)cancelRestoring;
- (void)dealloc;
- (void)finishedTerminatingApplications;
- (void)resetService:(id)a3 didBeginDataResetWithMode:(int64_t)a4;
- (void)resetService:(id)a3 didCompleteDataResetMode:(int64_t)a4 withError:(id)a5 completion:(id)a6;
- (void)resetService:(id)a3 willBeginDataResetWithMode:(int64_t)a4;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation SBSyncController

- (BOOL)isResetting
{
  return (self->_resetState - 1) < 2;
}

+ (SBSyncController)sharedInstance
{
  if (sharedInstance___once_0 != -1) {
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_55);
  }
  v2 = (void *)sharedInstance___sharedSyncController;
  return (SBSyncController *)v2;
}

- (BOOL)isInUse
{
  if ([(SBSyncController *)self isRestoring]) {
    return 1;
  }
  return [(SBSyncController *)self isResetting];
}

- (BOOL)isRestoring
{
  int restoreState = self->_restoreState;
  return restoreState == 1 || restoreState == 4;
}

uint64_t __34__SBSyncController_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBSyncController);
  v1 = (void *)sharedInstance___sharedSyncController;
  sharedInstance___sharedSyncController = (uint64_t)v0;

  return kdebug_trace();
}

- (void)dealloc
{
  [(SBWindowSceneStatusBarSettingsAssertion *)self->_hideStatusBarAssertion invalidate];
  [(SBSyncController *)self stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)SBSyncController;
  [(SBSyncController *)&v3 dealloc];
}

- (void)startObserving
{
  objc_super v3 = (const char *)[(id)*MEMORY[0x1E4F78000] UTF8String];
  notify_register_dispatch(v3, &self->_restoreStartedNotifyToken, MEMORY[0x1E4F14428], &__block_literal_global_7);
  uint64_t state64 = 0;
  notify_get_state(self->_restoreStartedNotifyToken, &state64);
  if (state64)
  {
    v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "SB RESTORE: SBRestoreStarted", v10, 2u);
    }

    v5 = +[SBSyncController sharedInstance];
    [v5 beginRestoring];
  }
  v6 = (const char *)[(id)*MEMORY[0x1E4F77FF8] UTF8String];
  v7 = (void *)MEMORY[0x1E4F14428];
  notify_register_dispatch(v6, &self->_restoreEndedNotifyToken, MEMORY[0x1E4F14428], &__block_literal_global_10);

  v8 = [MEMORY[0x1E4F61050] sharedInstance];
  [v8 addOberver:self];

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__wirelessSyncEnded_ name:@"kSBWirelessAppSyncEnded" object:0];
  [v9 addObserver:self selector:sel__wirelessSyncBegan_ name:@"kSBWirelessAppSyncBegan" object:0];
  [v9 addObserver:self selector:sel__appInstallationNotification name:@"SBInstalledApplicationsDidChangeNotification" object:0];
}

void __34__SBSyncController_startObserving__block_invoke()
{
  v0 = SBLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEFAULT, "SB RESTORE: SBRestoreStarted", v2, 2u);
  }

  v1 = +[SBSyncController sharedInstance];
  [v1 beginRestoring];
}

void __34__SBSyncController_startObserving__block_invoke_8()
{
  v0 = SBLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEFAULT, "SB RESTORE: SBRestoreEnded", v2, 2u);
  }

  v1 = +[SBSyncController sharedInstance];
  [v1 _didEndRestoring:2];
}

- (void)stopObserving
{
  objc_super v3 = [MEMORY[0x1E4F61050] sharedInstance];
  [v3 removeObserver:self];

  notify_cancel(self->_restoreStartedNotifyToken);
  notify_cancel(self->_restoreEndedNotifyToken);
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];
}

- (void)finishedTerminatingApplications
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SBResetOrRestoreStateDidChangeNotification" object:self];

  +[SBSyncController cancelPreviousPerformRequestsWithTarget:self selector:sel_finishedTerminatingApplications object:0];
  [(SBSyncController *)self _notifyRestoreCanProceed];
}

- (int)restoreState
{
  return self->_restoreState;
}

- (void)beginRestoring
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_super v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int restoreState = self->_restoreState;
    v11[0] = 67109120;
    v11[1] = restoreState;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "SB RESTORE: beginRestoring %d", (uint8_t *)v11, 8u);
  }

  if (!self->_restoreState)
  {
    v5 = +[SBTelephonyManager sharedTelephonyManager];
    [(SBSyncController *)self _setRestoreState:1];
    [(SBSyncController *)self _setupRestoreTimer];
    v6 = [MEMORY[0x1E4F624C8] sharedInstance];
    [v6 prepareDisplaysForExit];

    v7 = +[SBMainStatusBarStateProvider sharedInstance];
    [v7 setTelephonyAndBluetoothItemsCloaked:1];

    [v5 disconnectAllCalls];
    v8 = +[SBAirplaneModeController sharedInstance];
    [v8 setInAirplaneMode:0];

    if ([MEMORY[0x1E4F42738] isRunningInStoreDemoMode])
    {
      v9 = [MEMORY[0x1E4F43048] webClips];
      v10 = (void *)[v9 copy];

      [v10 makeObjectsPerformSelector:sel_removeFromDisk];
    }
    [v5 setNetworkRegistrationEnabled:0];
    [(SBSyncController *)self _killApplicationsIfNecessary];
  }
}

- (void)cancelRestoring
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int restoreState = self->_restoreState;
    v5[0] = 67109120;
    v5[1] = restoreState;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "SB RESTORE: cancelRestoring %d", (uint8_t *)v5, 8u);
  }

  [(SBSyncController *)self _setRestoreState:3];
}

- (int)resetState
{
  return self->_resetState;
}

- (void)resetService:(id)a3 willBeginDataResetWithMode:(int64_t)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = SBLogDataReset();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v7 = a4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Received willBeginDataResetWithMode:%ld in springboard", buf, 0xCu);
  }

  BSDispatchMain();
}

void __60__SBSyncController_resetService_willBeginDataResetWithMode___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v1 + 12))
  {
    *(_DWORD *)(v1 + 12) = 1;
    objc_super v3 = [MEMORY[0x1E4F624C8] sharedInstance];
    [v3 prepareDisplaysForExit];

    id v4 = +[SBMainStatusBarStateProvider sharedInstance];
    [v4 setTelephonyAndBluetoothItemsCloaked:1];

    if (!*(void *)(*(void *)(a1 + 32) + 64))
    {
      v5 = SBLogDataReset();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Hiding the status bar", buf, 2u);
      }

      uint64_t v6 = +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay];
      int64_t v7 = [v6 assertionManager];
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[SBSyncController resetService:willBeginDataResetWithMode:]_block_invoke");
      uint64_t v9 = [v7 newSettingsAssertionWithStatusBarHidden:1 atLevel:9 reason:v8];
      uint64_t v10 = *(void *)(a1 + 32);
      v11 = *(void **)(v10 + 64);
      *(void *)(v10 + 64) = v9;

      [*(id *)(*(void *)(a1 + 32) + 64) acquire];
    }
    uint64_t v12 = SBLogDataReset();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Disabling the idle timer", v17, 2u);
    }

    v13 = [*(id *)(a1 + 32) _idleTimerCoordinator];
    v14 = *(void **)(a1 + 32);
    v15 = [v14 _idleTimerBehavior];
    id v16 = (id)[v13 idleTimerProvider:v14 didProposeBehavior:v15 forReason:@"SBSyncControllerReset"];
  }
}

- (void)resetService:(id)a3 didBeginDataResetWithMode:(int64_t)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = SBLogDataReset();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = a4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Received didBeginDataResetWithMode:%ld in springboard", (uint8_t *)&v6, 0xCu);
  }
}

- (void)resetService:(id)a3 didCompleteDataResetMode:(int64_t)a4 withError:(id)a5 completion:(id)a6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a6;
  uint64_t v8 = SBLogDataReset();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v11 = a4;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Received didCompleteDataResetMode:%ld in springboard", buf, 0xCu);
  }

  id v9 = v7;
  BSDispatchMain();
}

uint64_t __79__SBSyncController_resetService_didCompleteDataResetMode_withError_completion___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 12) = 2;
  v2 = [*(id *)(a1 + 32) _idleTimerCoordinator];
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = [v3 _idleTimerBehavior];
  id v5 = (id)[v2 idleTimerProvider:v3 didProposeBehavior:v4 forReason:@"SBSyncControllerReset"];

  int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"SBResetOrRestoreStateDidChangeNotification" object:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)_setRestoreState:(int)a3
{
  if (self->_restoreState != a3)
  {
    self->_int restoreState = a3;
    disableDeviceLockAssertion = self->_disableDeviceLockAssertion;
    if (a3 == 1)
    {
      if (!disableDeviceLockAssertion)
      {
        id v5 = [(id)SBApp authenticationController];
        int v6 = [v5 createKeybagUnlockAssertionWithReason:@"Sync restore or reset"];
        id v7 = self->_disableDeviceLockAssertion;
        self->_disableDeviceLockAssertion = v6;

        [(SBFAuthenticationAssertion *)self->_disableDeviceLockAssertion activate];
      }
    }
    else
    {
      [(SBFAuthenticationAssertion *)disableDeviceLockAssertion invalidate];
      uint64_t v8 = self->_disableDeviceLockAssertion;
      self->_disableDeviceLockAssertion = 0;

      [(SBWindowSceneStatusBarSettingsAssertion *)self->_hideStatusBarAssertion invalidate];
      hideStatusBarAssertion = self->_hideStatusBarAssertion;
      self->_hideStatusBarAssertion = 0;
    }
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"SBITunesRestoreStateDidChangeNotification" object:0];
  }
}

- (void)_syncSessionDidBegin
{
  self->_isAppSyncing = 1;
}

- (void)_syncSessionDidEnd
{
  *(_WORD *)&self->_isAppSyncing = 256;
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SBSyncController__syncSessionDidEnd__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

void __38__SBSyncController__syncSessionDidEnd__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 73) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 40) && !*(unsigned char *)(v1 + 72))
  {
    *(unsigned char *)(v1 + 40) = 0;
    id v2 = objc_alloc_init(MEMORY[0x1E4FA82E8]);
    [v2 start];
  }
}

- (void)_notifyRestoreCanProceed
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int restoreState = self->_restoreState;
    v5[0] = 67109120;
    v5[1] = restoreState;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "SB RESTORE: _notifyRestoreCanProceed %d", (uint8_t *)v5, 8u);
  }

  notify_post("com.apple.SpringBoard.ReadyForRestore");
  notify_post((const char *)[(id)*MEMORY[0x1E4FA7160] UTF8String]);
}

- (void)_killApplicationsIfNecessary
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__SBSyncController__killApplicationsIfNecessary__block_invoke;
  v12[3] = &unk_1E6AF4B88;
  v12[4] = self;
  v12[5] = v13;
  id v2 = (void *)MEMORY[0x1D948C7A0](v12, a2);
  dispatch_time_t v3 = SBLogDataReset();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Start killing all applications", buf, 2u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__SBSyncController__killApplicationsIfNecessary__block_invoke_45;
  v9[3] = &unk_1E6AF5A50;
  id v4 = v2;
  id v10 = v4;
  SBWorkspaceTerminateAllApps(5, 0, @"device reset", v9);
  dispatch_time_t v5 = dispatch_time(0, 4000000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SBSyncController__killApplicationsIfNecessary__block_invoke_47;
  v7[3] = &unk_1E6AF5300;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x1E4F14428], v7);

  _Block_object_dispose(v13, 8);
}

uint64_t __48__SBSyncController__killApplicationsIfNecessary__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return [*(id *)(result + 32) finishedTerminatingApplications];
  }
  return result;
}

uint64_t __48__SBSyncController__killApplicationsIfNecessary__block_invoke_45(uint64_t a1)
{
  id v2 = SBLogDataReset();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Completed killing all applications", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48__SBSyncController__killApplicationsIfNecessary__block_invoke_47(uint64_t a1)
{
  id v2 = SBLogDataReset();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Killing all applications watchdog fired: continuing anyway.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_rebootNow
{
  id v2 = +[SBTelephonyManager sharedTelephonyManager];
  [v2 setNetworkRegistrationEnabled:1];

  id v3 = [(id)SBApp restartManager];
  [v3 rebootForReason:@"ResetOrRestoreComplete"];
}

- (void)_didEndRestoring:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v12 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SB RESTORE: didEndRestoring %d", buf, 8u);
  }

  [(SBSyncController *)self _setRestoreState:v3];
  [(SBSyncController *)self _invalidateRestoreTimer];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"SBResetOrRestoreStateDidChangeNotification" object:self];

  if (v3 == 4)
  {
    id v7 = objc_alloc_init(SBRestoreFailureAlertItem);
    id v8 = +[SBAlertItemsController sharedInstance];
    [v8 activateAlertItem:v7];
  }
  else
  {
    dispatch_time_t v9 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__SBSyncController__didEndRestoring___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_after(v9, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __37__SBSyncController__didEndRestoring___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rebootNow];
}

- (void)_delayedQuitApplications
{
  [(SBSyncController *)self _killApplicationsIfNecessary];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"com.apple.springboard.reset-ready" object:0];
}

- (void)_invalidateRestoreTimer
{
  restoreTimer = self->_restoreTimer;
  self->_restoreTimer = 0;
}

- (BOOL)_isBackupAgentRunning
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)id v10 = xmmword_1D8FD0CE8;
  uint64_t v11 = 0;
  size_t size = 0;
  if (sysctl(v10, 3u, 0, &size, 0, 0))
  {
    id v2 = SBLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[SBSyncController _isBackupAgentRunning](v2);
    }
    uint64_t v3 = 0;
LABEL_8:

LABEL_9:
    BOOL v4 = 0;
    goto LABEL_10;
  }
  uint64_t v3 = (char *)malloc_type_malloc(size, 0x8010A67AuLL);
  if (sysctl(v10, 3u, v3, &size, 0, 0))
  {
    id v2 = SBLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[SBSyncController _isBackupAgentRunning](v2);
    }
    goto LABEL_8;
  }
  unint64_t v6 = (int)size / 0x288uLL;
  if ((int)v6 < 1) {
    goto LABEL_9;
  }
  uint64_t v7 = 0;
  uint64_t v8 = 648 * v6;
  while (*(int *)&v3[v7 + 40] < 1 || !strstr(&v3[v7 + 243], "BackupAgent"))
  {
    v7 += 648;
    if (v8 == v7) {
      goto LABEL_9;
    }
  }
  BOOL v4 = 1;
LABEL_10:
  free(v3);
  return v4;
}

- (void)_restoreTimerFired:(id)a3
{
  id v4 = a3;
  int restoreTimerState = self->_restoreTimerState;
  if (restoreTimerState == 1)
  {
    BOOL v7 = [(SBSyncController *)self _isBackupAgentRunning];
    uint64_t v8 = SBLogCommon();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SB RESTORE: BackupAgent restarted", v11, 2u);
      }

      self->_int restoreTimerState = 0;
    }
    else
    {
      if (v9)
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SB RESTORE: BackupAgent failed", v10, 2u);
      }

      self->_int restoreTimerState = 2;
      [(SBSyncController *)self _didEndRestoring:4];
    }
  }
  else if (!restoreTimerState && ![(SBSyncController *)self _isBackupAgentRunning])
  {
    unint64_t v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "SB RESTORE: BackupAgent not running", buf, 2u);
    }

    self->_int restoreTimerState = 1;
  }
}

- (void)_setupRestoreTimer
{
  self->_int restoreTimerState = 0;
  uint64_t v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__restoreTimerFired_ selector:0 userInfo:1 repeats:5.0];
  restoreTimer = self->_restoreTimer;
  self->_restoreTimer = v3;
}

- (void)_appInstallationNotification
{
  BOOL v2 = self->_appsChangedDuringSync || self->_isAppSyncing || self->_inExtendedAppSyncCoalescePeriod;
  self->_appsChangedDuringSync = v2;
}

- (id)_idleTimerBehavior
{
  if ([(SBSyncController *)self isResetting]) {
    +[SBIdleTimerBehavior disabledBehavior];
  }
  else {
  BOOL v2 = +[SBIdleTimerBehavior defaultBehavior];
  }
  return v2;
}

- (SBIdleTimerCoordinating)_idleTimerCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  return (SBIdleTimerCoordinating *)WeakRetained;
}

- (void)_setIdleTimerCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_hideStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_disableDeviceLockAssertion, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_restoreTimer, 0);
}

- (void)_isBackupAgentRunning
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SB RESTORE: Error obtaining process list size", v1, 2u);
}

@end