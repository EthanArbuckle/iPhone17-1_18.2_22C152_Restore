@interface MFPowerController
+ (MFPowerController)sharedInstance;
+ (void)powerlog:(id)a3 eventData:(id)a4;
+ (void)sharedInstance;
- (BOOL)_isHoldingTaskAssertion;
- (BOOL)gameModeEnabled;
- (BOOL)isBatterySaverModeEnabled;
- (BOOL)isHoldingAssertion;
- (BOOL)isPluggedIn;
- (EFObservable)batteryLevelObservable;
- (EFObservable)lowPowerModeObservable;
- (EFObservable)pluggedInObservable;
- (MFPowerController)init;
- (double)_assertionTimeout;
- (float)batteryLevel;
- (id)batteryLevelStateChangeNotificationObservable;
- (id)copyDiagnosticInformation;
- (id)powerObservable;
- (void)_applicationForegroundStateChanged:(BOOL)a3;
- (void)_applicationForegroundStateChanged_nts:(BOOL)a3;
- (void)_batteryInformationChanged;
- (void)_gameModeInformationChanged;
- (void)_lowPowerModeChangedNotification:(id)a3;
- (void)_registerForBatteryLevelChanges;
- (void)_registerForGameModeChanges;
- (void)_releasePowerAssertion_nts;
- (void)_releaseTaskAssertion_nts;
- (void)_retainPowerAssertion_nts;
- (void)_retainTaskAssertion_nts;
- (void)_setPluggedIn:(unsigned int)a3;
- (void)_setupAssertionTimer:(double)a3;
- (void)_unregisterForBatteryLevelChanges;
- (void)_unregisterForGameModeChanges;
- (void)dealloc;
- (void)init;
- (void)releaseAssertionWithIdentifier:(id)a3;
- (void)retainAssertionWithIdentifier:(id)a3;
- (void)startListeningForBatterySaverNotifications;
@end

@implementation MFPowerController

uint64_t __56__MFPowerController__applicationForegroundStateChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applicationForegroundStateChanged_nts:", *(unsigned __int8 *)(a1 + 40));
}

- (void)startListeningForBatterySaverNotifications
{
  v3 = MFPowerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "Listening for low-power mode notifications", v5, 2u);
  }

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__lowPowerModeChangedNotification_ name:*MEMORY[0x1E4F287E8] object:0];
}

uint64_t __48__MFPowerController__registerForGameModeChanges__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _gameModeInformationChanged];
}

void __35__MFPowerController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MFPowerController);
  v1 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = (uint64_t)v0;
}

- (MFPowerController)init
{
  v26.receiver = self;
  v26.super_class = (Class)MFPowerController;
  id v2 = [(MFPowerController *)&v26 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.message.MFPowerController.state", 0);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.message.MFPowerController.power", 0);
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    v8 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v7;

    *((_DWORD *)v2 + 15) = -1082130432;
    *((void *)v2 + 4) = -1;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __25__MFPowerController_init__block_invoke;
    aBlock[3] = &unk_1E5D40378;
    v9 = (char *)v2;
    v25 = v9;
    v10 = (void (**)(void *, void))_Block_copy(aBlock);
    v11 = v9 + 28;
    if (notify_register_dispatch("com.apple.springboard.pluggedin", (int *)v9 + 7, *((dispatch_queue_t *)v2 + 1), v10)) {
      _DWORD *v11 = -1;
    }
    else {
      v10[2](v10, *v11);
    }
    sRootDomainConnect = IORegisterForSystemPower(0, (IONotificationPortRef *)v9 + 9, (IOServiceInterestCallback)_powerChanged, (io_object_t *)v9 + 20);
    if (sRootDomainConnect)
    {
      IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v9 + 9), *((dispatch_queue_t *)v2 + 2));
    }
    else
    {
      v12 = MFPowerLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MFPowerController init]();
      }
    }
    [v9 _registerForBatteryLevelChanges];
    [v9 _registerForGameModeChanges];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v9);
    v13 = +[MFAppStateMonitor sharedInstance];
    v14 = [v13 appIsVisibleObservable];
    v15 = (void *)MEMORY[0x1E4F60DE0];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __25__MFPowerController_init__block_invoke_16;
    v21[3] = &unk_1E5D3DAC0;
    objc_copyWeak(&v22, &location);
    v16 = [v15 observerWithResultBlock:v21];
    uint64_t v17 = [v14 subscribe:v16];
    v18 = (void *)*((void *)v9 + 6);
    *((void *)v9 + 6) = v17;

    v19 = [MEMORY[0x1E4F734D0] sharedController];
    [v19 addDiagnosticsGenerator:v9];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return (MFPowerController *)v2;
}

uint64_t __25__MFPowerController_init__block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0xAAAAAAAAAAAAAAAALL;
  notify_get_state(token, &state64);
  return [*(id *)(a1 + 32) _setPluggedIn:state64];
}

- (void)_setPluggedIn:(unsigned int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int pluggedIn = self->_pluggedIn;
  if (pluggedIn != a3)
  {
    int v5 = self->_pluggedIn;
    atomic_compare_exchange_strong(&self->_pluggedIn, (unsigned int *)&v5, a3);
    if (v5 == pluggedIn)
    {
      v6 = MFPowerLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_pluggedIn) {
          id v7 = @"plugged in";
        }
        else {
          id v7 = @"unplugged";
        }
        int v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "Device is now %@", (uint8_t *)&v9, 0xCu);
      }

      if (self->_pluggedIn)
      {
        if (sPowerAssertion) {
          [(MFPowerController *)self _releasePowerAssertion_nts];
        }
      }
      else if ([(NSCountedSet *)self->_identifiers count] && !self->_isForeground && !sPowerAssertion)
      {
        [(MFPowerController *)self _retainPowerAssertion_nts];
      }
      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 postNotificationName:@"MFPowerStateDidChange" object:self];
    }
  }
}

- (void)_registerForGameModeChanges
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Could not register for game mode change notification due to status (%d)", (uint8_t *)v2, 8u);
}

- (void)_registerForBatteryLevelChanges
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "#BatteryLevel Could not register for battery change notification due to status (%d)", (uint8_t *)v2, 8u);
}

- (void)_batteryInformationChanged
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "#BatteryLevel No internal battery found", v2, v3, v4, v5, v6);
}

void __25__MFPowerController_init__block_invoke_16(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_applicationForegroundStateChanged:", objc_msgSend(v4, "BOOLValue"));
}

- (void)_applicationForegroundStateChanged:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__MFPowerController__applicationForegroundStateChanged___block_invoke;
  v4[3] = &unk_1E5D3B5E8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

+ (void)powerlog:(id)a3 eventData:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (softLinkPLShouldLogRegisteredEvent(12, (uint64_t)v6)) {
    softLinkPLLogRegisteredEvent(12, (uint64_t)v6, (uint64_t)v5, MEMORY[0x1E4F1CBF0]);
  }
}

- (void)_applicationForegroundStateChanged_nts:(BOOL)a3
{
  if (self->_isForeground != a3)
  {
    self->_isForeground = a3;
    if (a3)
    {
      if (sPowerAssertion)
      {
        [(MFPowerController *)self _releasePowerAssertion_nts];
      }
    }
    else if ([(NSCountedSet *)self->_identifiers count] {
           && ![(MFPowerController *)self isPluggedIn]
    }
           && !sPowerAssertion)
    {
      [(MFPowerController *)self _retainPowerAssertion_nts];
    }
  }
}

+ (MFPowerController)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_56);
  }
  uint64_t v2 = (void *)sharedInstance_instance_1;
  if (!sharedInstance_instance_1) {
    +[MFPowerController sharedInstance]();
  }
  return (MFPowerController *)v2;
}

- (void)_gameModeInformationChanged
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  int gameModeNotificationToken = self->_gameModeNotificationToken;
  if (gameModeNotificationToken == -1)
  {
    id v5 = MFPowerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "Invalid Game Mode notify token";
      v8 = v5;
      uint32_t v9 = 2;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  uint32_t state = notify_get_state(gameModeNotificationToken, &state64);
  id v5 = MFPowerLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (state)
  {
    if (v6)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v12) = state;
      id v7 = "notify_get_state() for Game Mode failed with error %u";
      v8 = v5;
      uint32_t v9 = 8;
LABEL_7:
      _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v6)
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = state64;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Game Mode Status is now %llu", buf, 0xCu);
  }

  self->_gameModeEnabled = state64 != 0;
}

id __66__MFPowerController_batteryLevelStateChangeNotificationObservable__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 object];
  return v2;
}

uint64_t __52__MFPowerController__registerForBatteryLevelChanges__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _batteryInformationChanged];
}

id __43__MFPowerController_batteryLevelObservable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = (void *)MEMORY[0x1E4F28ED0];
  [v2 batteryLevel];
  id v4 = objc_msgSend(v3, "numberWithFloat:");

  return v4;
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (void)dealloc
{
  int powerToken = self->_powerToken;
  if (powerToken != -1) {
    notify_cancel(powerToken);
  }
  [(EFCancelable *)self->_appStateCancelable cancel];
  if (sRootDomainConnect)
  {
    IONotificationPortSetDispatchQueue(self->_pmPort, 0);
    IODeregisterForSystemPower(&self->_pmNotifier);
    IOServiceClose(sRootDomainConnect);
    IONotificationPortDestroy(self->_pmPort);
    sRootDomainConnect = 0;
  }
  [(MFPowerController *)self _unregisterForBatteryLevelChanges];
  [(MFPowerController *)self _unregisterForGameModeChanges];
  v4.receiver = self;
  v4.super_class = (Class)MFPowerController;
  [(MFPowerController *)&v4 dealloc];
}

- (BOOL)isPluggedIn
{
  return self->_pluggedIn != 0;
}

- (BOOL)isHoldingAssertion
{
  return sPowerAssertion != 0;
}

- (BOOL)_isHoldingTaskAssertion
{
  return sTaskAssertion != 0;
}

- (void)_lowPowerModeChangedNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MFPowerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [MEMORY[0x1E4F28F80] processInfo];
    int v5 = [v4 isLowPowerModeEnabled];
    BOOL v6 = @"OFF";
    if (v5) {
      BOOL v6 = @"ON";
    }
    int v8 = 138412290;
    uint32_t v9 = v6;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "Low-power mode changed to %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"MFBatterySaverModeDidChange" object:0];
}

- (BOOL)isBatterySaverModeEnabled
{
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  char v3 = [v2 isLowPowerModeEnabled];

  return v3;
}

- (double)_assertionTimeout
{
  return 120.0;
}

- (void)_setupAssertionTimer:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (sPowerAssertionTimer)
  {
    int v5 = MFPowerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "#Assertions [*] cancel power assertion timer", buf, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)sPowerAssertionTimer);
    BOOL v6 = (void *)sPowerAssertionTimer;
    sPowerAssertionTimer = 0;
  }
  if (a3 > 0.0)
  {
    id v7 = MFPowerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = (int)a3;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "#Assertions [*] schedule %d sec power assertion timer", buf, 8u);
    }

    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    uint32_t v9 = (void *)sPowerAssertionTimer;
    sPowerAssertionTimer = (uint64_t)v8;

    [(MFPowerController *)self _assertionTimeout];
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)sPowerAssertionTimer, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __42__MFPowerController__setupAssertionTimer___block_invoke;
    handler[3] = &unk_1E5D3B5C0;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)sPowerAssertionTimer, handler);
    dispatch_resume((dispatch_object_t)sPowerAssertionTimer);
  }
}

void __42__MFPowerController__setupAssertionTimer___block_invoke(uint64_t a1)
{
  id v2 = MFPowerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v3 = 0;
    _os_log_impl(&dword_1A7EFF000, v2, OS_LOG_TYPE_DEFAULT, "#Assertions [*] power assertion timer expired", v3, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_releasePowerAssertion_nts");
  dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_43_0);
}

uint64_t __42__MFPowerController__setupAssertionTimer___block_invoke_41()
{
  v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"MFPowerAssertionDidExpire" object:0];

  uint64_t v1 = (void *)sObservers;
  return [v1 makeObjectsPerformSelector:sel_assertionDidExpire];
}

- (void)_retainPowerAssertion_nts
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "#Assertions Could not create power assertion.", v2, v3, v4, v5, v6);
}

- (void)_releasePowerAssertion_nts
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!sPowerAssertion)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MFPowerController.m" lineNumber:273 description:@"assertion IS NULL"];
  }
  if (!sPowerAssertionTimer)
  {
    uint8_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MFPowerController.m" lineNumber:274 description:@"assertion timer IS nil"];
  }
  uint64_t v4 = MFPowerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    dispatch_source_t v8 = @"com.apple.message.preventSleep";
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "#Assertions [-] %@", (uint8_t *)&v7, 0xCu);
  }

  [(MFPowerController *)self _setupAssertionTimer:0.0];
  CFRelease((CFTypeRef)sPowerAssertion);
  sPowerAssertion = 0;
}

- (void)_retainTaskAssertion_nts
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MFUserAgent();
  int v5 = [v4 isMobileMail];

  if (v5)
  {
    if (sTaskAssertion)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"MFPowerController.m" lineNumber:291 description:@"task assertion IS NOT NULL"];
    }
    uint8_t v6 = MFPowerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      dispatch_time_t v11 = @"com.apple.message.backgroundTaskAssertion";
      _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "#Assertions [+] %@", (uint8_t *)&v10, 0xCu);
    }

    int v7 = [[MFTaskAssertion alloc] initWithName:@"com.apple.message.backgroundTaskAssertion"];
    dispatch_source_t v8 = (void *)sTaskAssertion;
    sTaskAssertion = (uint64_t)v7;
  }
}

- (void)_releaseTaskAssertion_nts
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!sTaskAssertion)
  {
    uint8_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MFPowerController.m" lineNumber:298 description:@"task assertion IS NULL"];
  }
  uint64_t v2 = MFPowerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    dispatch_source_t v8 = @"com.apple.message.backgroundTaskAssertion";
    _os_log_impl(&dword_1A7EFF000, v2, OS_LOG_TYPE_DEFAULT, "#Assertions [-] %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v3 = (void *)sTaskAssertion;
  sTaskAssertion = 0;
}

- (void)retainAssertionWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MFPowerController_retainAssertionWithIdentifier___block_invoke;
  v7[3] = &unk_1E5D3B6E0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __51__MFPowerController_retainAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MFPowerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1A7EFF000, v2, OS_LOG_TYPE_DEFAULT, "#Assertions [+] %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 40) addObject:*(void *)(a1 + 32)];
  if (!*(unsigned char *)(*(void *)(a1 + 40) + 56))
  {
    char v4 = [*(id *)(a1 + 40) isPluggedIn];
    char v5 = sPowerAssertion ? 1 : v4;
    if ((v5 & 1) == 0) {
      objc_msgSend(*(id *)(a1 + 40), "_retainPowerAssertion_nts");
    }
  }
  if (!sTaskAssertion) {
    objc_msgSend(*(id *)(a1 + 40), "_retainTaskAssertion_nts");
  }
  id v6 = MFPowerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 40) count];
    int v8 = 134217984;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "#Assertions Active Assertions: %lu", (uint8_t *)&v8, 0xCu);
  }
}

- (void)releaseAssertionWithIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = MFPowerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "#Assertions [-] %@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__MFPowerController_releaseAssertionWithIdentifier___block_invoke;
  v8[3] = &unk_1E5D3B6E0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(queue, v8);
}

void __52__MFPowerController_releaseAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    if (sPowerAssertion) {
      objc_msgSend(*(id *)(a1 + 32), "_releasePowerAssertion_nts");
    }
    if (sTaskAssertion) {
      objc_msgSend(*(id *)(a1 + 32), "_releaseTaskAssertion_nts");
    }
  }
  uint64_t v2 = MFPowerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) count];
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A7EFF000, v2, OS_LOG_TYPE_DEFAULT, "#Assertions Active Assertions: %lu", (uint8_t *)&v4, 0xCu);
  }
}

- (id)powerObservable
{
  uint64_t v2 = [MEMORY[0x1E4F60DD8] observableOnDefaultNotificationCenterWithName:@"MFPowerStateDidChange" object:self];
  uint64_t v3 = [v2 map:&__block_literal_global_79_0];

  return v3;
}

id __36__MFPowerController_powerObservable__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 object];
  return v2;
}

- (EFObservable)pluggedInObservable
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MFPowerController *)self powerObservable];
  v8[0] = self;
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v5 = [v3 startWith:v4];
  uint64_t v6 = [v5 map:&__block_literal_global_83];

  return (EFObservable *)v6;
}

id __40__MFPowerController_pluggedInObservable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v2, "isPluggedIn"));

  return v3;
}

- (EFObservable)lowPowerModeObservable
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F60DD8] observableOnDefaultNotificationCenterWithName:@"MFBatterySaverModeDidChange" object:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__MFPowerController_lowPowerModeObservable__block_invoke;
  v9[3] = &unk_1E5D40710;
  v9[4] = self;
  int v4 = [v3 map:v9];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MFPowerController isBatterySaverModeEnabled](self, "isBatterySaverModeEnabled"));
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v7 = [v4 startWith:v6];

  return (EFObservable *)v7;
}

id __43__MFPowerController_lowPowerModeObservable__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isBatterySaverModeEnabled"));
  return v1;
}

- (id)batteryLevelStateChangeNotificationObservable
{
  id v2 = [MEMORY[0x1E4F60DD8] observableOnDefaultNotificationCenterWithName:@"MFBatteryLevelDidChange" object:self];
  uint64_t v3 = [v2 map:&__block_literal_global_87_0];

  return v3;
}

- (EFObservable)batteryLevelObservable
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MFPowerController *)self batteryLevelStateChangeNotificationObservable];
  v8[0] = self;
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v5 = [v3 startWith:v4];
  uint64_t v6 = [v5 map:&__block_literal_global_89];

  return (EFObservable *)v6;
}

- (void)_unregisterForBatteryLevelChanges
{
  int batteryNotificationToken = self->_batteryNotificationToken;
  if (batteryNotificationToken != -1)
  {
    notify_cancel(batteryNotificationToken);
    self->_int batteryNotificationToken = -1;
  }
}

uint64_t __48__MFPowerController__registerForGameModeChanges__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _gameModeInformationChanged];
}

- (void)_unregisterForGameModeChanges
{
  int gameModeNotificationToken = self->_gameModeNotificationToken;
  if (gameModeNotificationToken != -1)
  {
    notify_cancel(gameModeNotificationToken);
    self->_int gameModeNotificationToken = -1;
  }
}

- (id)copyDiagnosticInformation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"\n"];
  [v3 appendString:@"==== Power State ====\n"];
  if ([(MFPowerController *)self isPluggedIn]) {
    int v4 = @"YES";
  }
  else {
    int v4 = @"NO";
  }
  [v3 appendFormat:@"  charging: %@\n", v4];
  uint64_t v5 = [MEMORY[0x1E4F28F80] processInfo];
  int v6 = [v5 isLowPowerModeEnabled];
  id v7 = @"OFF";
  if (v6) {
    id v7 = @"ON";
  }
  [v3 appendFormat:@"  low-power mode: %@\n", v7];

  if ([(MFPowerController *)self gameModeEnabled]) {
    int v8 = @"YES";
  }
  else {
    int v8 = @"NO";
  }
  [v3 appendFormat:@"  Game Mode: %@\n", v8];
  if (sPowerAssertion) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  [v3 appendFormat:@"  holding assertion: %@\n", v9];
  [v3 appendString:@"\n==== Internal Assertions ====\n"];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MFPowerController_copyDiagnosticInformation__block_invoke;
  block[3] = &unk_1E5D3B6E0;
  block[4] = self;
  id v11 = v3;
  id v16 = v11;
  dispatch_sync(queue, block);
  uint64_t v12 = v16;
  id v13 = v11;

  return v13;
}

void __46__MFPowerController_copyDiagnosticInformation__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v11 != v4) {
            objc_enumerationMutation(v2);
          }
          uint64_t v6 = *(void *)(*((void *)&v10 + 1) + 8 * i);
          id v7 = *(void **)(a1 + 40);
          uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 40) countForObject:v6];
          [v7 appendFormat:@"  %@: %d\n", v6, v8, (void)v10];
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v3);
    }
  }
  else
  {
    id v9 = *(void **)(a1 + 40);
    [v9 appendFormat:@"(empty)\n"];
  }
}

- (BOOL)gameModeEnabled
{
  return self->_gameModeEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStateCancelable, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_powerQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "Could not register for power notifications", v2, v3, v4, v5, v6);
}

+ (void)sharedInstance
{
  __assert_rtn("+[MFPowerController sharedInstance]", "MFPowerController.m", 143, "instance != nil");
}

@end