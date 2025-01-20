@interface MFPowerController
+ (id)sharedInstance;
+ (void)powerlog:(id)a3 eventData:(id)a4;
+ (void)sharedInstance;
- (BOOL)isBatterySaverModeEnabled;
- (BOOL)isHoldingAssertion;
- (BOOL)isPluggedIn;
- (EFObservable)lowPowerModeObservable;
- (EFObservable)pluggedInObservable;
- (MFPowerController)init;
- (double)_assertionTimeout;
- (id)copyDiagnosticInformation;
- (id)powerObservable;
- (void)_applicationForegroundStateChanged:(BOOL)a3;
- (void)_applicationForegroundStateChanged_nts:(BOOL)a3;
- (void)_lowPowerModeChangedNotification:(id)a3;
- (void)_releasePowerAssertion_nts;
- (void)_retainPowerAssertion_nts;
- (void)_setPluggedIn:(unsigned int)a3;
- (void)_setupAssertionTimer:(double)a3;
- (void)dealloc;
- (void)releaseAssertionWithIdentifier:(id)a3;
- (void)retainAssertionWithIdentifier:(id)a3;
- (void)startListeningForBatterySaverNotifications;
@end

@implementation MFPowerController

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
    v8 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v7;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __25__MFPowerController_init__block_invoke;
    aBlock[3] = &unk_1E68675E8;
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
    __RootDomainConnect = IORegisterForSystemPower(0, (IONotificationPortRef *)v9 + 7, (IOServiceInterestCallback)_powerChanged, (io_object_t *)v9 + 16);
    if (__RootDomainConnect)
    {
      IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v9 + 7), *((dispatch_queue_t *)v2 + 2));
    }
    else
    {
      v12 = MFLogGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1CFCFE000, v12, OS_LOG_TYPE_DEFAULT, "#Warning could not register for power notifications", (uint8_t *)&buf, 2u);
      }
    }
    objc_initWeak(&buf, v9);
    v13 = +[MFAppStateMonitor sharedInstance];
    v14 = [v13 appStateObservable];
    v15 = (void *)MEMORY[0x1E4F60DE0];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __25__MFPowerController_init__block_invoke_13;
    v21[3] = &unk_1E6867720;
    objc_copyWeak(&v22, &buf);
    v16 = [v15 observerWithResultBlock:v21];
    uint64_t v17 = [v14 subscribe:v16];
    v18 = (void *)*((void *)v9 + 5);
    *((void *)v9 + 5) = v17;

    v19 = [MEMORY[0x1E4F734D0] sharedController];
    [v19 addDiagnosticsGenerator:v9];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&buf);
  }
  return (MFPowerController *)v2;
}

uint64_t __25__MFPowerController_init__block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  return [*(id *)(a1 + 32) _setPluggedIn:state64];
}

void __25__MFPowerController_init__block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [v3 isForeground];

  [WeakRetained _applicationForegroundStateChanged:v4];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_17);
  }
  id v2 = (void *)sharedInstance_instance_1;
  if (!sharedInstance_instance_1) {
    +[MFPowerController sharedInstance]();
  }
  return v2;
}

uint64_t __35__MFPowerController_sharedInstance__block_invoke()
{
  sharedInstance_instance_1 = objc_alloc_init(MFPowerController);
  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  int powerToken = self->_powerToken;
  if (powerToken != -1) {
    notify_cancel(powerToken);
  }
  [(EFCancelable *)self->_appStateCancelable cancel];
  if (__RootDomainConnect)
  {
    IONotificationPortSetDispatchQueue(self->_pmPort, 0);
    IODeregisterForSystemPower(&self->_pmNotifier);
    IOServiceClose(__RootDomainConnect);
    IONotificationPortDestroy(self->_pmPort);
    __RootDomainConnect = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MFPowerController;
  [(MFPowerController *)&v4 dealloc];
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
      v6 = MFLogGeneral();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        if (self->_pluggedIn) {
          id v7 = @"plugged in";
        }
        else {
          id v7 = @"unplugged";
        }
        int v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1CFCFE000, v6, OS_LOG_TYPE_INFO, "device is now %@", (uint8_t *)&v9, 0xCu);
      }

      if (self->_pluggedIn)
      {
        if (_powerAssertion) {
          [(MFPowerController *)self _releasePowerAssertion_nts];
        }
      }
      else if ([(NSCountedSet *)self->_identifiers count] && !self->_isForeground && !_powerAssertion)
      {
        [(MFPowerController *)self _retainPowerAssertion_nts];
      }
      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 postNotificationName:@"MFPowerStateDidChange" object:self];
    }
  }
}

- (BOOL)isPluggedIn
{
  return self->_pluggedIn != 0;
}

- (BOOL)isHoldingAssertion
{
  return _powerAssertion != 0;
}

+ (void)powerlog:(id)a3 eventData:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (softLinkPLShouldLogRegisteredEvent(12, (uint64_t)v6)) {
    softLinkPLLogRegisteredEvent(12, (uint64_t)v6, (uint64_t)v5, MEMORY[0x1E4F1CBF0]);
  }
}

- (void)startListeningForBatterySaverNotifications
{
  id v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1CFCFE000, v3, OS_LOG_TYPE_INFO, "listening for low-power mode notifications", v5, 2u);
  }

  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__lowPowerModeChangedNotification_ name:*MEMORY[0x1E4F287E8] object:0];
}

- (void)_lowPowerModeChangedNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_super v4 = [MEMORY[0x1E4F28F80] processInfo];
    int v5 = [v4 isLowPowerModeEnabled];
    id v6 = @"OFF";
    if (v5) {
      id v6 = @"ON";
    }
    int v8 = 138412290;
    int v9 = v6;
    _os_log_impl(&dword_1CFCFE000, v3, OS_LOG_TYPE_INFO, "low-power mode changed to %@", (uint8_t *)&v8, 0xCu);
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
  if (_powerAssertionTimer)
  {
    int v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1CFCFE000, v5, OS_LOG_TYPE_INFO, "#Assertions [*] cancel power assertion timer", buf, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)_powerAssertionTimer);
    id v6 = (void *)_powerAssertionTimer;
    _powerAssertionTimer = 0;
  }
  if (a3 > 0.0)
  {
    id v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id buf = 67109120;
      int v14 = (int)a3;
      _os_log_impl(&dword_1CFCFE000, v7, OS_LOG_TYPE_INFO, "#Assertions [*] schedule %d sec power assertion timer", buf, 8u);
    }

    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    int v9 = (void *)_powerAssertionTimer;
    _powerAssertionTimer = (uint64_t)v8;

    [(MFPowerController *)self _assertionTimeout];
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)_powerAssertionTimer, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __42__MFPowerController__setupAssertionTimer___block_invoke;
    handler[3] = &unk_1E68675C0;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)_powerAssertionTimer, handler);
    dispatch_resume((dispatch_object_t)_powerAssertionTimer);
  }
}

void __42__MFPowerController__setupAssertionTimer___block_invoke(uint64_t a1)
{
  id v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_1CFCFE000, v2, OS_LOG_TYPE_INFO, "#Assertions [*] power assertion timer expired", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_releasePowerAssertion_nts");
  dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_40);
  char v3 = dispatch_get_global_queue(2, 0);
  dispatch_async(v3, &__block_literal_global_42);
}

void __42__MFPowerController__setupAssertionTimer___block_invoke_38()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"MFPowerAssertionDidExpire" object:0];
}

uint64_t __42__MFPowerController__setupAssertionTimer___block_invoke_2()
{
  return [(id)_observers_0 makeObjectsPerformSelector:sel_assertionDidExpire];
}

- (void)_retainPowerAssertion_nts
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (_powerAssertion)
  {
    int v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MFPowerController.m" lineNumber:238 description:@"assertion IS NOT NULL"];
  }
  if (_powerAssertionTimer)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MFPowerController.m" lineNumber:239 description:@"assertion timer IS NOT nil"];
  }
  objc_super v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    dispatch_source_t v8 = @"com.apple.messageLegacy.preventSleep";
    _os_log_impl(&dword_1CFCFE000, v4, OS_LOG_TYPE_INFO, "#Assertions [+] %@", (uint8_t *)&v7, 0xCu);
  }

  _powerAssertion = CPPowerAssertionCreate();
  [(MFPowerController *)self _assertionTimeout];
  -[MFPowerController _setupAssertionTimer:](self, "_setupAssertionTimer:");
}

- (void)_releasePowerAssertion_nts
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!_powerAssertion)
  {
    int v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MFPowerController.m" lineNumber:249 description:@"assertion IS NULL"];
  }
  if (!_powerAssertionTimer)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MFPowerController.m" lineNumber:250 description:@"assertion timer IS nil"];
  }
  objc_super v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    dispatch_source_t v8 = @"com.apple.messageLegacy.preventSleep";
    _os_log_impl(&dword_1CFCFE000, v4, OS_LOG_TYPE_INFO, "#Assertions [-] %@", (uint8_t *)&v7, 0xCu);
  }

  [(MFPowerController *)self _setupAssertionTimer:0.0];
  CFRelease((CFTypeRef)_powerAssertion);
  _powerAssertion = 0;
}

- (void)retainAssertionWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MFPowerController_retainAssertionWithIdentifier___block_invoke;
  v7[3] = &unk_1E6866E20;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __51__MFPowerController_retainAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1CFCFE000, v2, OS_LOG_TYPE_INFO, "#Assertions [+] %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 32) addObject:*(void *)(a1 + 32)];
  uint64_t result = *(void *)(a1 + 40);
  if (!*(unsigned char *)(result + 48))
  {
    uint64_t result = [(id)result isPluggedIn];
    if ((result & 1) == 0 && !_powerAssertion) {
      return objc_msgSend(*(id *)(a1 + 40), "_retainPowerAssertion_nts");
    }
  }
  return result;
}

- (void)releaseAssertionWithIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1CFCFE000, v5, OS_LOG_TYPE_INFO, "#Assertions [-] %@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__MFPowerController_releaseAssertionWithIdentifier___block_invoke;
  v8[3] = &unk_1E6866E20;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(queue, v8);
}

uint64_t __52__MFPowerController_releaseAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) count];
  if (result) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = _powerAssertion == 0;
  }
  if (!v3)
  {
    id v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "_releasePowerAssertion_nts");
  }
  return result;
}

- (void)_applicationForegroundStateChanged_nts:(BOOL)a3
{
  if (self->_isForeground != a3)
  {
    self->_isForeground = a3;
    if (a3)
    {
      if (_powerAssertion)
      {
        [(MFPowerController *)self _releasePowerAssertion_nts];
      }
    }
    else if ([(NSCountedSet *)self->_identifiers count] {
           && ![(MFPowerController *)self isPluggedIn]
    }
           && !_powerAssertion)
    {
      [(MFPowerController *)self _retainPowerAssertion_nts];
    }
  }
}

- (void)_applicationForegroundStateChanged:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__MFPowerController__applicationForegroundStateChanged___block_invoke;
  v4[3] = &unk_1E6867480;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __56__MFPowerController__applicationForegroundStateChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applicationForegroundStateChanged_nts:", *(unsigned __int8 *)(a1 + 40));
}

- (id)powerObservable
{
  id v2 = [MEMORY[0x1E4F60DD8] observableOnDefaultNotificationCenterWithName:@"MFPowerStateDidChange" object:self];
  BOOL v3 = [v2 map:&__block_literal_global_68];

  return v3;
}

uint64_t __36__MFPowerController_powerObservable__block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

- (EFObservable)pluggedInObservable
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MFPowerController *)self powerObservable];
  v8[0] = self;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  BOOL v5 = [v3 startWith:v4];
  uint64_t v6 = [v5 map:&__block_literal_global_72];

  return (EFObservable *)v6;
}

uint64_t __40__MFPowerController_pluggedInObservable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 isPluggedIn];
  return [v2 numberWithBool:v3];
}

- (EFObservable)lowPowerModeObservable
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F60DD8] observableOnDefaultNotificationCenterWithName:@"MFBatterySaverModeDidChange" object:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__MFPowerController_lowPowerModeObservable__block_invoke;
  v9[3] = &unk_1E6867788;
  v9[4] = self;
  id v4 = [v3 map:v9];
  BOOL v5 = objc_msgSend(NSNumber, "numberWithBool:", -[MFPowerController isBatterySaverModeEnabled](self, "isBatterySaverModeEnabled"));
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v7 = [v4 startWith:v6];

  return (EFObservable *)v7;
}

uint64_t __43__MFPowerController_lowPowerModeObservable__block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  uint64_t v2 = [*(id *)(a1 + 32) isBatterySaverModeEnabled];
  return [v1 numberWithBool:v2];
}

- (id)copyDiagnosticInformation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"\n"];
  [v3 appendString:@"==== Power State ====\n"];
  if ([(MFPowerController *)self isPluggedIn]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 appendFormat:@"  charging: %@\n", v4];
  BOOL v5 = [MEMORY[0x1E4F28F80] processInfo];
  int v6 = [v5 isLowPowerModeEnabled];
  id v7 = @"OFF";
  if (v6) {
    id v7 = @"ON";
  }
  [v3 appendFormat:@"  low-power mode: %@\n", v7];

  if (_powerAssertion) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  [v3 appendFormat:@"  holding assertion: %@\n", v8];
  [v3 appendString:@"\n==== Internal Assertions ====\n"];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MFPowerController_copyDiagnosticInformation__block_invoke;
  block[3] = &unk_1E6866E20;
  block[4] = self;
  id v10 = v3;
  id v15 = v10;
  dispatch_sync(queue, block);
  id v11 = v15;
  id v12 = v10;

  return v12;
}

void __46__MFPowerController_copyDiagnosticInformation__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          id v8 = *(void **)(a1 + 40);
          uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 32) countForObject:v7];
          [v8 appendFormat:@"  %@: %d\n", v7, v9, (void)v11];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
  }
  else
  {
    id v10 = *(void **)(a1 + 40);
    [v10 appendFormat:@"(empty)\n"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStateCancelable, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_powerQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)sharedInstance
{
  __assert_rtn("+[MFPowerController sharedInstance]", "MFPowerController.m", 125, "instance != nil");
}

@end