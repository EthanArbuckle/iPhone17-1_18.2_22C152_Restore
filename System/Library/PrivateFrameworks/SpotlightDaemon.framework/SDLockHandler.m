@interface SDLockHandler
+ (id)sharedLockHandler;
+ (void)setLockHandlerWithDelegate:(id)a3 options:(unint64_t)a4;
- (BOOL)firstUnlockedInSB;
- (BOOL)migrationComplete;
- (BOOL)unlocked;
- (BOOL)unlockedSinceBoot;
- (SDLockHandler)initWithDelegate:(id)a3 options:(unint64_t)a4;
- (void)checkMigrationComplete;
- (void)handleFirstUnlock;
- (void)handleFirstUnlockHomeScreen;
- (void)handleFirstUnlockInSpringBoard;
- (void)handleMigrationComplete;
- (void)start;
@end

@implementation SDLockHandler

+ (id)sharedLockHandler
{
  return (id)sSDLockHandler;
}

- (BOOL)unlocked
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned int v2 = MKBGetDeviceLockState();
  v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (v2 > 7) {
      v4 = "unknown";
    }
    else {
      v4 = getMobileKeyBagStateCStr_sKeyBagStates[v2];
    }
    v8[0] = 67109378;
    v8[1] = v2;
    __int16 v9 = 2080;
    v10 = v4;
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_INFO, "[LOCK] MKBGetDeviceLockState returned ret:%d %s", (uint8_t *)v8, 0x12u);
  }
  BOOL v6 = v2 == 3 || v2 == 0;

  return v6;
}

+ (void)setLockHandlerWithDelegate:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __52__SDLockHandler_setLockHandlerWithDelegate_options___block_invoke;
  v8[3] = &unk_2645066B0;
  id v9 = v5;
  unint64_t v10 = a4;
  uint64_t v6 = setLockHandlerWithDelegate_options__onceToken;
  id v7 = v5;
  if (v6 != -1) {
    dispatch_once(&setLockHandlerWithDelegate_options__onceToken, v8);
  }
}

uint64_t __52__SDLockHandler_setLockHandlerWithDelegate_options___block_invoke(uint64_t a1)
{
  sSDLockHandler = [[SDLockHandler alloc] initWithDelegate:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

- (void)handleFirstUnlock
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_didFirstUnlockSinceBoot, 1u) & 1) == 0)
  {
    unsigned int v2 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "[LOCK] device unlocked since boot", v3, 2u);
    }
  }
}

- (void)handleMigrationComplete
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_didMigrationComplete, 1u) & 1) == 0)
  {
    v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "[LOCK] Migration Complete", buf, 2u);
    }

    v4 = [(SDLockHandlerDelegate *)self->_delegate indexQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__SDLockHandler_handleMigrationComplete__block_invoke;
    block[3] = &unk_2645063F8;
    block[4] = self;
    dispatch_async(v4, block);

    notificationQueue = self->_notificationQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__SDLockHandler_handleMigrationComplete__block_invoke_2;
    v6[3] = &unk_2645063F8;
    v6[4] = self;
    dispatch_async(notificationQueue, v6);
  }
}

uint64_t __40__SDLockHandler_handleMigrationComplete__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) migrationCompleted];
}

uint64_t __40__SDLockHandler_handleMigrationComplete__block_invoke_2(uint64_t result)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(*(void *)(result + 32) + 44) != -1)
  {
    uint64_t v1 = result;
    unsigned int v2 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(_DWORD *)(*(void *)(v1 + 32) + 44);
      v4[0] = 67109378;
      v4[1] = v3;
      __int16 v5 = 2080;
      uint64_t v6 = "com.apple.springboard.homescreenunlocked";
      _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "[LOCK] cancel token %d %s", (uint8_t *)v4, 0x12u);
    }

    result = notify_cancel(*(_DWORD *)(*(void *)(v1 + 32) + 44));
    *(_DWORD *)(*(void *)(v1 + 32) + 44) = -1;
  }
  return result;
}

- (void)handleFirstUnlockHomeScreen
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_didFirstUnlockInHomeScreen, 1u) & 1) == 0)
  {
    int v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "[LOCK] Home Screen first unlock", v4, 2u);
    }

    [(SDLockHandler *)self handleMigrationComplete];
  }
}

- (void)handleFirstUnlockInSpringBoard
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_didMigrationComplete);
  if ((v3 & 1) == 0)
  {
    if (!_getDeviceMigrationComplete()) {
      return;
    }
    [(SDLockHandler *)self handleMigrationComplete];
  }
  if ((atomic_exchange((atomic_uchar *volatile)&self->_didFirstUnlockInSpringBoard, 1u) & 1) == 0)
  {
    v4 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "[LOCK] SpringBoard first unlock", buf, 2u);
    }

    __int16 v5 = [(SDLockHandlerDelegate *)self->_delegate indexQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__SDLockHandler_handleFirstUnlockInSpringBoard__block_invoke;
    block[3] = &unk_2645063F8;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

void __47__SDLockHandler_handleFirstUnlockInSpringBoard__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) firstUnlockSBCompleted];
  uint64_t v2 = *(void *)(a1 + 32);
  unsigned __int8 v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SDLockHandler_handleFirstUnlockInSpringBoard__block_invoke_2;
  block[3] = &unk_2645063F8;
  block[4] = v2;
  dispatch_async(v3, block);
}

uint64_t __47__SDLockHandler_handleFirstUnlockInSpringBoard__block_invoke_2(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(*(void *)(result + 32) + 48) != -1)
  {
    uint64_t v1 = result;
    uint64_t v2 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(_DWORD *)(*(void *)(v1 + 32) + 48);
      uint64_t v4 = *MEMORY[0x263F796A8];
      v5[0] = 67109378;
      v5[1] = v3;
      __int16 v6 = 2080;
      uint64_t v7 = v4;
      _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "[LOCK] cancel token %d %s", (uint8_t *)v5, 0x12u);
    }

    result = notify_cancel(*(_DWORD *)(*(void *)(v1 + 32) + 48));
    *(_DWORD *)(*(void *)(v1 + 32) + 48) = -1;
  }
  return result;
}

- (SDLockHandler)initWithDelegate:(id)a3 options:(unint64_t)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v47.receiver = self;
  v47.super_class = (Class)SDLockHandler;
  uint64_t v8 = [(SDLockHandler *)&v47 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_delegate, a3);
    *(void *)&v9->_int notifyTokenKeybagLockStateNotifyToken = -1;
    v9->_options = a4;
    v9->_int notifyTokenSBLockState = -1;
    unint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v11 = dispatch_queue_attr_make_initially_inactive(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.spotlight.locknotification", v11);
    notificationQueue = v9->_notificationQueue;
    v9->_notificationQueue = (OS_dispatch_queue *)v12;

    if (MKBDeviceUnlockedSinceBoot() || MKBGetDeviceLockState() == 3)
    {
      [(SDLockHandler *)v9 handleFirstUnlock];
      char v14 = 0;
    }
    else
    {
      char v14 = 1;
    }
    v15 = (const char **)MEMORY[0x263F796A8];
    if (v9->_options & 5) != 0 || (_getDeviceMigrationComplete())
    {
      [(SDLockHandler *)v9 handleMigrationComplete];
      v16 = *v15;
      if ((v14 & 1) != 0 || (out_token = -1, uint64_t state64 = -1, notify_register_check(v16, &out_token)))
      {
        int v17 = 0;
      }
      else
      {
        int check = 0;
        if (!notify_check(out_token, &check) && check && !notify_get_state(out_token, &state64))
        {
          v18 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109634;
            int v52 = out_token;
            __int16 v53 = 2080;
            v54 = v16;
            __int16 v55 = 2048;
            uint64_t v56 = state64;
            _os_log_impl(&dword_21F1CE000, v18, OS_LOG_TYPE_DEFAULT, "[LOCK] check %d %s %lu", buf, 0x1Cu);
          }
        }
        notify_cancel(out_token);
        int v17 = 0;
        char v19 = 0;
        if (!state64)
        {
LABEL_32:
          v31 = v9->_notificationQueue;
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __42__SDLockHandler_initWithDelegate_options___block_invoke_8;
          v41[3] = &unk_2645066D8;
          v32 = v9;
          v42 = v32;
          uint32_t v33 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v9->_notifyTokenKeybagLockStateNotifyToken, v31, v41);
          v34 = logForCSLogCategoryIndex();
          v35 = v34;
          if (v33)
          {
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              -[SDLockHandler initWithDelegate:options:]();
            }
          }
          else if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            int notifyTokenKeybagLockStateNotifyToken = v9->_notifyTokenKeybagLockStateNotifyToken;
            *(_DWORD *)buf = 67109378;
            int v52 = notifyTokenKeybagLockStateNotifyToken;
            __int16 v53 = 2080;
            v54 = "com.apple.mobile.keybagd.lock_status";
            _os_log_impl(&dword_21F1CE000, v35, OS_LOG_TYPE_DEFAULT, "[LOCK] token %d %s", buf, 0x12u);
          }

          v37 = v32;
          uint64_t v38 = AKSEventsRegister();
          v37->_aksEvent = (_AKSEvent *)v38;
          if (v38)
          {
            if (v19)
            {
LABEL_40:

              goto LABEL_41;
            }
          }
          else
          {
            v40 = logForCSLogCategoryIndex();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
              -[SDLockHandler initWithDelegate:options:](v40);
            }

            if (v19) {
              goto LABEL_40;
            }
          }
          [(SDLockHandler *)v37 handleFirstUnlockInSpringBoard];
          goto LABEL_40;
        }
      }
    }
    else
    {
      v16 = *v15;
      int v17 = 1;
    }
    v20 = v9->_notificationQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __42__SDLockHandler_initWithDelegate_options___block_invoke;
    handler[3] = &unk_2645066D8;
    v21 = v9;
    v46 = v21;
    uint32_t v22 = notify_register_dispatch(v16, &v9->_notifyTokenSBLockState, v20, handler);
    v23 = logForCSLogCategoryIndex();
    v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[SDLockHandler initWithDelegate:options:].cold.4((uint64_t)v16, v22, v24);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int notifyTokenSBLockState = v9->_notifyTokenSBLockState;
      *(_DWORD *)buf = 67109378;
      int v52 = notifyTokenSBLockState;
      __int16 v53 = 2080;
      v54 = v16;
      _os_log_impl(&dword_21F1CE000, v24, OS_LOG_TYPE_DEFAULT, "[LOCK] token %d %s", buf, 0x12u);
    }

    if (v17)
    {
      v26 = v9->_notificationQueue;
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __42__SDLockHandler_initWithDelegate_options___block_invoke_6;
      v43[3] = &unk_2645066D8;
      v44 = v21;
      uint32_t v27 = notify_register_dispatch("com.apple.springboard.homescreenunlocked", &v9->_notifyTokenSBHomescreenUnlocked, v26, v43);
      v28 = logForCSLogCategoryIndex();
      v29 = v28;
      if (v27)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[SDLockHandler initWithDelegate:options:]();
        }
      }
      else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int notifyTokenSBHomescreenUnlocked = v9->_notifyTokenSBHomescreenUnlocked;
        *(_DWORD *)buf = 67109378;
        int v52 = notifyTokenSBHomescreenUnlocked;
        __int16 v53 = 2080;
        v54 = "com.apple.springboard.homescreenunlocked";
        _os_log_impl(&dword_21F1CE000, v29, OS_LOG_TYPE_DEFAULT, "[LOCK] token %d %s", buf, 0x12u);
      }
    }
    char v19 = 1;
    goto LABEL_32;
  }
LABEL_41:

  return v9;
}

void __42__SDLockHandler_initWithDelegate_options___block_invoke(uint64_t a1, int token)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0;
  uint64_t state = notify_get_state(token, &state64);
  if (state)
  {
    uint64_t v4 = state;
    __int16 v5 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __42__SDLockHandler_initWithDelegate_options___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    uint64_t v12 = state64;
    v13 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      char v14 = "NO";
      if (!v12) {
        char v14 = "YES";
      }
      *(_DWORD *)buf = 136315138;
      int v17 = v14;
      _os_log_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_DEFAULT, "[LOCK] SpringBoard unlocked: %s", buf, 0xCu);
    }

    if (!v12) {
      [*(id *)(a1 + 32) handleFirstUnlockInSpringBoard];
    }
  }
}

void __42__SDLockHandler_initWithDelegate_options___block_invoke_6(uint64_t a1, int token)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0;
  if (notify_get_state(token, &state64))
  {
    int v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__SDLockHandler_initWithDelegate_options___block_invoke_6_cold_1();
    }
  }
  else
  {
    uint64_t v4 = state64;
    __int16 v5 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = "NO";
      if (v4 == 1) {
        uint64_t v6 = "YES";
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = v6;
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "[LOCK] Home Screen: %s", buf, 0xCu);
    }

    if (v4 == 1) {
      [*(id *)(a1 + 32) handleFirstUnlockHomeScreen];
    }
  }
}

void __42__SDLockHandler_initWithDelegate_options___block_invoke_8(uint64_t a1)
{
  v24[1] = *MEMORY[0x263EF8340];
  v23 = @"ExtendedDeviceLockState";
  v24[0] = *MEMORY[0x263EFFB40];
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  unsigned int v3 = MKBGetDeviceLockState();
  uint64_t v4 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 > 7) {
      __int16 v5 = "unknown";
    }
    else {
      __int16 v5 = getMobileKeyBagStateCStr_sKeyBagStates[v3];
    }
    *(_DWORD *)buf = 67109378;
    unsigned int v20 = v3;
    __int16 v21 = 2080;
    uint32_t v22 = v5;
    _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "[LOCK] Device state changed: %d %s", buf, 0x12u);
  }

  if (v3 > 7 || ((1 << v3) & 0xC9) == 0)
  {
    char v7 = 0;
  }
  else
  {
    [*(id *)(a1 + 32) handleFirstUnlock];
    char v7 = 1;
  }
  qos_class_t v8 = qos_class_self();
  uint64_t v9 = dispatch_get_global_queue(v8, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SDLockHandler_initWithDelegate_options___block_invoke_11;
  block[3] = &unk_264506700;
  id v17 = *(id *)(a1 + 32);
  char v18 = v7;
  dispatch_async(v9, block);

  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 8) indexQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__SDLockHandler_initWithDelegate_options___block_invoke_2;
  v12[3] = &unk_264506728;
  id v13 = v2;
  unsigned int v15 = v3;
  id v14 = *(id *)(a1 + 32);
  id v11 = v2;
  dispatch_async(v10, v12);
}

uint64_t __42__SDLockHandler_initWithDelegate_options___block_invoke_11(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) deviceStateWillChange:*(unsigned __int8 *)(a1 + 40)];
}

void __42__SDLockHandler_initWithDelegate_options___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unsigned int v2 = MKBGetDeviceLockState();
  int v3 = *(_DWORD *)(a1 + 48);
  uint64_t v4 = logForCSLogCategoryIndex();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2 == v3)
  {
    if (!v5) {
      goto LABEL_16;
    }
    if (v2 > 7) {
      uint64_t v6 = "unknown";
    }
    else {
      uint64_t v6 = getMobileKeyBagStateCStr_sKeyBagStates[v2];
    }
    int v13 = 67109378;
    unsigned int v14 = v2;
    __int16 v15 = 2080;
    *(void *)v16 = v6;
    uint64_t v9 = "[LOCK] Device state %d %s";
    uint64_t v10 = v4;
    uint32_t v11 = 18;
  }
  else
  {
    if (!v5) {
      goto LABEL_16;
    }
    uint64_t v7 = *(unsigned int *)(a1 + 48);
    if (v7 > 7) {
      qos_class_t v8 = "unknown";
    }
    else {
      qos_class_t v8 = getMobileKeyBagStateCStr_sKeyBagStates[v7];
    }
    if (v2 > 7) {
      uint64_t v12 = "unknown";
    }
    else {
      uint64_t v12 = getMobileKeyBagStateCStr_sKeyBagStates[v2];
    }
    int v13 = 67109890;
    unsigned int v14 = v7;
    __int16 v15 = 1024;
    *(_DWORD *)v16 = v2;
    *(_WORD *)&v16[4] = 2080;
    *(void *)&v16[6] = v8;
    __int16 v17 = 2080;
    char v18 = v12;
    uint64_t v9 = "[LOCK] Device state:(%d/%d) (%s/%s)";
    uint64_t v10 = v4;
    uint32_t v11 = 34;
  }
  _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
LABEL_16:

  if (v2 <= 7)
  {
    if (((1 << v2) & 0xC9) != 0)
    {
      [*(id *)(*(void *)(a1 + 40) + 8) unlocked];
    }
    else if (v2 == 1)
    {
      [*(id *)(*(void *)(a1 + 40) + 8) locked];
    }
    else if (v2 == 2)
    {
      [*(id *)(*(void *)(a1 + 40) + 8) locking];
    }
  }
}

void __42__SDLockHandler_initWithDelegate_options___block_invoke_12(uint64_t a1, int a2, CFDictionaryRef theDict)
{
  if (a2 == 1)
  {
    value[5] = v3;
    value[6] = v4;
    value[0] = 0;
    if (CFDictionaryGetValueIfPresent(theDict, (const void *)*MEMORY[0x263F27708], (const void **)value))
    {
      CFTypeID v7 = CFGetTypeID(value[0]);
      if (v7 == CFBooleanGetTypeID())
      {
        if (CFBooleanGetValue((CFBooleanRef)value[0]))
        {
          qos_class_t v8 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "Received Cx expiring notification", buf, 2u);
          }

          [*(id *)(*(void *)(a1 + 32) + 8) lockingCx];
        }
      }
    }
    if (CFDictionaryGetValueIfPresent(theDict, (const void *)*MEMORY[0x263F27700], (const void **)value))
    {
      CFTypeID v9 = CFGetTypeID(value[0]);
      if (v9 == CFBooleanGetTypeID())
      {
        if (CFBooleanGetValue((CFBooleanRef)value[0]))
        {
          [*(id *)(*(void *)(a1 + 32) + 8) lockedCx];
          uint64_t v10 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint32_t v11 = 0;
            _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_DEFAULT, "Received Cx expired notification", v11, 2u);
          }
        }
      }
    }
  }
}

- (void)start
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_didStart, 1u) & 1) == 0)
  {
    int v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "[LOCK] handler started", v4, 2u);
    }

    dispatch_activate((dispatch_object_t)self->_notificationQueue);
  }
}

- (BOOL)unlockedSinceBoot
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_didFirstUnlockSinceBoot);
  return v2 & 1;
}

- (BOOL)migrationComplete
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_didMigrationComplete);
  return v2 & 1;
}

- (BOOL)firstUnlockedInSB
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_didFirstUnlockInSpringBoard);
  return v2 & 1;
}

- (void)checkMigrationComplete
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_didMigrationComplete);
  if ((v2 & 1) == 0 && _getDeviceMigrationComplete())
  {
    [(SDLockHandler *)self handleMigrationComplete];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithDelegate:(os_log_t)log options:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21F1CE000, log, OS_LOG_TYPE_ERROR, "Failed register: AKSEventsRegister", v1, 2u);
}

- (void)initWithDelegate:options:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F1CE000, v0, v1, "Error %u setting up notification handler for %s", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:options:.cold.3()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F1CE000, v0, v1, "Error %u setting up notification handler for %s", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:(os_log_t)log options:.cold.4(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21F1CE000, log, OS_LOG_TYPE_ERROR, "Error %u setting up notification handler for %s", (uint8_t *)v3, 0x12u);
}

void __42__SDLockHandler_initWithDelegate_options___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __42__SDLockHandler_initWithDelegate_options___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F1CE000, v0, v1, "Error %u getting state for %s", v2, v3, v4, v5, v6);
}

@end