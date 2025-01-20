@interface NPKSecureElement
+ (id)sharedInstance;
+ (unint64_t)cachedIsInFailForward;
+ (void)_initVariables;
+ (void)isInFailForward:(id)a3;
- (BOOL)isInRestrictedMode;
- (BOOL)isNFCDisabled;
- (NFHardwareManager)hardwareManager;
- (NPKSecureElement)init;
- (unsigned)supportState;
- (void)_applicationWillEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_backgroundQueue_initHWManager;
- (void)_fetchNFCState;
- (void)_secureElementDidUpdateRestrictedModeState:(BOOL)a3;
- (void)applicationIsAtForeground;
- (void)dealloc;
- (void)didChangeRadioState:(BOOL)a3;
- (void)hardwareStateDidChange;
- (void)isInRestrictedMode:(id)a3;
- (void)registerObserver:(id)a3;
- (void)secureElement:(id)a3 didChangeRestrictedMode:(BOOL)a4;
- (void)setHardwareManager:(id)a3;
- (void)setSupportState:(unsigned int)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation NPKSecureElement

+ (unint64_t)cachedIsInFailForward
{
  [a1 _initVariables];
  unint64_t v3 = atomic_load((unsigned int *)&_atomicIsInFailForward);
  if (!v3) {
    [a1 isInFailForward:0];
  }
  return v3;
}

+ (void)isInFailForward:(id)a3
{
  id v4 = a3;
  v5 = pk_ui_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_ui_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Requested check if SE is in fail forward mode", buf, 2u);
    }
  }
  [a1 _initVariables];
  v8 = _inFailForwardQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__NPKSecureElement_isInFailForward___block_invoke;
  block[3] = &unk_2644D2B10;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, block);
}

uint64_t __36__NPKSecureElement_isInFailForward___block_invoke(uint64_t a1)
{
  v2 = pk_ui_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_ui_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Start check if SE is in fail forward mode", buf, 2u);
    }
  }
  uint64_t v5 = [MEMORY[0x263F5C1F8] isInFailForward];
  BOOL v6 = pk_ui_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    if (!v7)
    {
      unsigned int v9 = 1;
      goto LABEL_17;
    }
    v8 = pk_ui_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: SE is in fail forward mode", v12, 2u);
    }
    unsigned int v9 = 1;
  }
  else
  {
    if (!v7)
    {
      unsigned int v9 = 2;
      goto LABEL_17;
    }
    v8 = pk_ui_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      unsigned int v9 = 2;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: SE is Not in fail forward mode", v11, 2u);
    }
    else
    {
      unsigned int v9 = 2;
    }
  }

LABEL_17:
  atomic_store(v9, (unsigned int *)&_atomicIsInFailForward);
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  }
  return result;
}

+ (void)_initVariables
{
  if (_initVariables_onceToken != -1) {
    dispatch_once(&_initVariables_onceToken, &__block_literal_global_33);
  }
}

void __34__NPKSecureElement__initVariables__block_invoke()
{
  atomic_store(0, (unsigned int *)&_atomicIsInFailForward);
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.nanoPassKit.secureElement.inFailForward", v2);
  v1 = (void *)_inFailForwardQueue;
  _inFailForwardQueue = (uint64_t)v0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_25_0);
  }
  v2 = (void *)sharedInstance_sharedInstance_5;
  return v2;
}

void __34__NPKSecureElement_sharedInstance__block_invoke()
{
  dispatch_queue_t v0 = objc_alloc_init(NPKSecureElement);
  v1 = (void *)sharedInstance_sharedInstance_5;
  sharedInstance_sharedInstance_5 = (uint64_t)v0;
}

- (NPKSecureElement)init
{
  v13.receiver = self;
  v13.super_class = (Class)NPKSecureElement;
  v2 = [(NPKSecureElement *)&v13 init];
  BOOL v3 = v2;
  if (v2)
  {
    atomic_store(0, (unsigned __int8 *)&v2->_atomicIsInRestricted);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanoPassKit.hwManager.background", 0);
    backgroundQueue = v3->_backgroundQueue;
    v3->_backgroundQueue = (OS_dispatch_queue *)v4;

    BOOL v6 = objc_alloc_init(NPKThreadSafeObserverManager);
    observerManager = v3->_observerManager;
    v3->_observerManager = &v6->super;

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v3 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];
    [v8 addObserver:v3 selector:sel__applicationWillEnterBackground_ name:*MEMORY[0x263F5C880] object:0];
    unsigned int v9 = v3->_backgroundQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __24__NPKSecureElement_init__block_invoke;
    block[3] = &unk_2644D2910;
    v12 = v3;
    dispatch_async(v9, block);
  }
  return v3;
}

uint64_t __24__NPKSecureElement_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundQueue_initHWManager");
}

- (BOOL)isInRestrictedMode
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_atomicIsInRestricted);
  return v2 & 1;
}

- (BOOL)isNFCDisabled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_atomicIsNfcDisabled);
  return v2 & 1;
}

- (void)isInRestrictedMode:(id)a3
{
  id v4 = a3;
  backgroundQueue = self->_backgroundQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__NPKSecureElement_isInRestrictedMode___block_invoke;
  v7[3] = &unk_2644D2E58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(backgroundQueue, v7);
}

uint64_t __39__NPKSecureElement_isInRestrictedMode___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) supportState] == 2)
  {
    unsigned __int8 v2 = [*(id *)(a1 + 32) hardwareManager];
    uint64_t v3 = [v2 isInRestrictedMode];

    [*(id *)(a1 + 32) _secureElementDidUpdateRestrictedModeState:v3];
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      uint64_t v5 = *(uint64_t (**)(void))(result + 16);
      return v5();
    }
  }
  else
  {
    id v6 = pk_General_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      id v8 = pk_General_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = [*(id *)(a1 + 32) supportState];
        v10[0] = 67109120;
        v10[1] = v9;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Warning: Won't use APIs since hw support state is %d", (uint8_t *)v10, 8u);
      }
    }
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
    }
  }
  return result;
}

- (void)registerObserver:(id)a3
{
  id v5 = a3;
  id v4 = [(NPKSecureElement *)self hardwareManager];
  [v4 registerEventListener:self];

  [(NPKObserverManager *)self->_observerManager registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  [(NPKObserverManager *)self->_observerManager unregisterObserver:a3];
  id v4 = [(NPKSecureElement *)self hardwareManager];
  [v4 unregisterEventListener:self];
}

- (void)applicationIsAtForeground
{
  backgroundQueue = self->_backgroundQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__NPKSecureElement_applicationIsAtForeground__block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_async(backgroundQueue, block);
}

uint64_t __45__NPKSecureElement_applicationIsAtForeground__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) isInRestrictedMode:0];
  unsigned __int8 v2 = *(void **)(a1 + 32);
  return [v2 _fetchNFCState];
}

- (void)_backgroundQueue_initHWManager
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_backgroundQueue);
  uint64_t v3 = [MEMORY[0x263F58118] sharedHardwareManagerWithNoUI];
  hardwareManager = self->_hardwareManager;
  self->_hardwareManager = v3;

  id v5 = [(NPKSecureElement *)self hardwareManager];
  self->_unsigned int supportState = [v5 getHwSupport];

  unsigned int supportState = self->_supportState;
  if (supportState == 4)
  {
    BOOL v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      int v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Warning: Found NFHardwareSupportStateUnSupported.", v11, 2u);
      }
    }
    v10 = [(NPKSecureElement *)self hardwareManager];
    [v10 unregisterEventListener:self];

    [(NPKSecureElement *)self setHardwareManager:0];
    atomic_store(0, (unsigned __int8 *)&self->_atomicIsNfcDisabled);
  }
  else if (supportState == 2)
  {
    [(NPKSecureElement *)self _fetchNFCState];
  }
}

- (void)_fetchNFCState
{
  if (MGGetBoolAnswer())
  {
    backgroundQueue = self->_backgroundQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__NPKSecureElement__fetchNFCState__block_invoke;
    block[3] = &unk_2644D2910;
    void block[4] = self;
    dispatch_async(backgroundQueue, block);
  }
  else
  {
    atomic_store(0, (unsigned __int8 *)&self->_atomicIsNfcDisabled);
  }
}

void __34__NPKSecureElement__fetchNFCState__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) supportState] == 2)
  {
    uint64_t v14 = 0;
    unsigned __int8 v2 = [*(id *)(a1 + 32) hardwareManager];
    uint64_t v3 = [v2 getRadioEnabledState:&v14];

    if (v3)
    {
      id v4 = pk_General_log();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

      if (v5)
      {
        id v6 = pk_General_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v3;
          _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Fetch NFC status error: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      atomic_store(v14 != 1, (unsigned __int8 *)(*(void *)(a1 + 32) + 17));
    }
    v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v13 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 17));
        *(_DWORD *)buf = 67109120;
        LODWORD(v16) = v13 & 1;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NFC: retrieved nfcDisabled state: %d.", buf, 8u);
      }
    }
  }
  else
  {
    BOOL v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (!v8) {
      return;
    }
    uint64_t v3 = pk_General_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [*(id *)(a1 + 32) supportState];
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v9;
      _os_log_impl(&dword_21E92F000, v3, OS_LOG_TYPE_DEFAULT, "Warning: Will not use APIs since hw support state is %d", buf, 8u);
    }
  }
}

- (void)_secureElementDidUpdateRestrictedModeState:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_atomicIsInRestricted);
  observerManager = self->_observerManager;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__NPKSecureElement__secureElementDidUpdateRestrictedModeState___block_invoke;
  v4[3] = &unk_2644D8C28;
  v4[4] = self;
  BOOL v5 = a3;
  [(NPKObserverManager *)observerManager enumerateObserversUsingBlock:v4];
}

void __63__NPKSecureElement__secureElementDidUpdateRestrictedModeState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 secureElement:*(void *)(a1 + 32) didUpdateRestrictedModeState:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)dealloc
{
  id v3 = [(NPKSecureElement *)self hardwareManager];
  [v3 unregisterEventListener:self];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)NPKSecureElement;
  [(NPKSecureElement *)&v5 dealloc];
}

- (void)didChangeRadioState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NFHardwareEventListener received nfc radio enabled %d", (uint8_t *)v8, 8u);
    }
  }
  atomic_store(!v3, (unsigned __int8 *)&self->_atomicIsNfcDisabled);
}

- (void)hardwareStateDidChange
{
  backgroundQueue = self->_backgroundQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__NPKSecureElement_hardwareStateDidChange__block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_async(backgroundQueue, block);
}

void __42__NPKSecureElement_hardwareStateDidChange__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hardwareManager];
  objc_msgSend(*(id *)(a1 + 32), "setSupportState:", objc_msgSend(v2, "getHwSupport"));
}

- (void)secureElement:(id)a3 didChangeRestrictedMode:(BOOL)a4
{
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4 = [(NPKSecureElement *)self hardwareManager];
  [v4 registerEventListener:self];
}

- (void)_applicationWillEnterBackground:(id)a3
{
  id v4 = [(NPKSecureElement *)self hardwareManager];
  [v4 unregisterEventListener:self];
}

- (NFHardwareManager)hardwareManager
{
  return self->_hardwareManager;
}

- (void)setHardwareManager:(id)a3
{
}

- (unsigned)supportState
{
  return self->_supportState;
}

- (void)setSupportState:(unsigned int)a3
{
  self->_unsigned int supportState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareManager, 0);
  objc_storeStrong((id *)&self->_observerManager, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
}

@end