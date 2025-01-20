@interface SBFMobileKeyBag
+ (id)sharedInstance;
- ($5FACF4406A79EE03481B7753C49AE7A4)_queue_aksDeviceState;
- (BOOL)_queue_isContinuityUnlocked;
- (BOOL)_queue_verifyExpectedStashState:(int64_t)a3;
- (BOOL)_shouldHandleKeyBagEventWithHandleState:(id)a3;
- (BOOL)beginRecovery:(id)a3 error:(id *)a4;
- (BOOL)hasBeenUnlockedSinceBoot;
- (BOOL)hasPasscodeSet;
- (BOOL)isContinuityUnlocked;
- (BOOL)unlockWithOptions:(id)a3 error:(id *)a4;
- (BOOL)verifyWithOptions:(id)a3 error:(id *)a4;
- (SBFMobileKeyBag)init;
- (SBFMobileKeyBagState)extendedState;
- (SBFMobileKeyBagState)state;
- (id)_queue_keyBagInfo;
- (id)_queue_lockStateExtended:(BOOL)a3;
- (int64_t)maxUnlockAttempts;
- (void)_queue_aksDeviceState;
- (void)_queue_createStashBag:(id)a3 skipSEKeepUserDataOperation:(BOOL)a4;
- (void)_queue_firstUnlockOccurred;
- (void)_queue_handleKeybagStatusChanged;
- (void)_queue_setHasPasscodeIfNecessary:(id)a3;
- (void)addObserver:(id)a3;
- (void)createStashBagWithOptions:(id)a3 completion:(id)a4;
- (void)createStashBagWithOptions:(id)a3 completion:(id)a4 completionQueue:(id)a5;
- (void)dealloc;
- (void)lockSkippingGracePeriod:(BOOL)a3;
- (void)lockSkippingGracePeriod:(BOOL)a3 endingContinuityUnlock:(BOOL)a4;
- (void)maxUnlockAttempts;
- (void)performAfterFirstUnlockSinceBootUsingBlock:(id)a3;
- (void)refreshContinuityUnlockHeartbeat;
- (void)removeObserver:(id)a3;
- (void)waitForUnlockWithTimeout:(float)a3;
@end

@implementation SBFMobileKeyBag

- (SBFMobileKeyBagState)extendedState
{
  BSDispatchQueueAssertNot();
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__SBFMobileKeyBag_extendedState__block_invoke;
  v6[3] = &unk_1E548CB00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SBFMobileKeyBagState *)v4;
}

uint64_t __32__SBFMobileKeyBag_extendedState__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_lockStateExtended:", 1);
  return MEMORY[0x1F41817F8]();
}

- (id)_queue_lockStateExtended:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssert();
  v5 = [SBFMobileKeyBagState alloc];
  v6 = [(SBFMobileKeyBag *)self _queue_keyBagInfo];
  uint64_t v7 = [(SBFMobileKeyBagState *)v5 initWithKeyBagInfo:v6 extended:v3];

  return v7;
}

- (id)_queue_keyBagInfo
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
  __int16 v24 = 0;
  long long v22 = 0u;
  memset(v23, 0, sizeof(v23));
  [(SBFMobileKeyBag *)self _queue_aksDeviceState];
  MKBGetDeviceLockStateInfo = _get_MKBGetDeviceLockStateInfo();
  id v4 = (void *)MKBGetDeviceLockStateInfo(0);
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", 0, @"kSBFKeyBagInfoExtendedLockState");
  v21[0] = v5;
  v20[1] = @"kSBFKeyBagInfoLockState";
  v6 = [NSNumber numberWithUnsignedInt:0];
  v21[1] = v6;
  v20[2] = @"kSBFKeyBagInfoKeyBagState";
  uint64_t v7 = [NSNumber numberWithUnsignedInt:0];
  v21[2] = v7;
  v20[3] = @"kSBFKeyBagInfoBackOff";
  v8 = [NSNumber numberWithUnsignedLongLong:0];
  v21[3] = v8;
  v20[4] = @"kSBFKeyBagInfoFailedAttempts";
  uint64_t v9 = [NSNumber numberWithUnsignedInt:0];
  v21[4] = v9;
  v20[5] = @"kSBFKeyBagInfoPermanentlyBlocked";
  uint64_t v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F78138]];
  v11 = (void *)v10;
  uint64_t v12 = MEMORY[0x1E4F1CC28];
  if (v10) {
    uint64_t v13 = v10;
  }
  else {
    uint64_t v13 = MEMORY[0x1E4F1CC28];
  }
  v21[5] = v13;
  v20[6] = @"kSBFKeyBagInfoShouldWipe";
  uint64_t v14 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F78140]];
  v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v12;
  }
  v21[6] = v16;
  v20[7] = @"kSBFKeyBagInfoRecoveryCountdown";
  v17 = [NSNumber numberWithUnsignedLongLong:*(void *)((char *)v23 + 10)];
  v21[7] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:8];

  return v18;
}

- ($5FACF4406A79EE03481B7753C49AE7A4)_queue_aksDeviceState
{
  BSDispatchQueueAssert();
  *(_WORD *)&retstr->var11[8] = 0;
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  result = ($5FACF4406A79EE03481B7753C49AE7A4 *)aks_get_extended_device_state();
  if (result)
  {
    v5 = SBLogAuthenticationKeybag();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBFMobileKeyBag _queue_aksDeviceState]();
    }
  }
  return result;
}

uint64_t __33__SBFMobileKeyBag_hasPasscodeSet__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 48);
  return result;
}

- (BOOL)hasPasscodeSet
{
  BSDispatchQueueAssertNot();
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__SBFMobileKeyBag_hasPasscodeSet__block_invoke;
  v5[3] = &unk_1E548CB00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance___instance;
  return v2;
}

uint64_t __33__SBFMobileKeyBag_sharedInstance__block_invoke()
{
  sharedInstance___instance = objc_alloc_init(SBFMobileKeyBag);
  return MEMORY[0x1F41817F8]();
}

- (SBFMobileKeyBag)init
{
  v19.receiver = self;
  v19.super_class = (Class)SBFMobileKeyBag;
  v2 = [(SBFMobileKeyBag *)&v19 init];
  if (v2)
  {
    uint64_t v3 = BSDispatchQueueCreateWithQualityOfService();
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = BSDispatchQueueCreateWithQualityOfService();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __23__SBFMobileKeyBag_init__block_invoke;
    v15 = &unk_1E548CA60;
    objc_copyWeak(&v17, &location);
    uint64_t v7 = v2;
    uint64_t v16 = v7;
    v7->_aksEvent = (_AKSEvent *)AKSEventsRegister();
    uint64_t v8 = v2->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __23__SBFMobileKeyBag_init__block_invoke_2;
    v10[3] = &unk_1E548CA88;
    v11 = v7;
    dispatch_async(v8, v10);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

uint64_t __23__SBFMobileKeyBag_init__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2)
  {
    if (a2 == 1)
    {
      uint64_t v8 = WeakRetained;
      if ([*(id *)(a1 + 32) _shouldHandleKeyBagEventWithHandleState:a3]) {
        objc_msgSend(v8, "_queue_handleKeybagStatusChanged");
      }
    }
  }
  else
  {
    WeakRetained[49] = 1;
    objc_msgSend(WeakRetained, "_queue_firstUnlockOccurred");
  }
  return MEMORY[0x1F41817F8]();
}

void __23__SBFMobileKeyBag_init__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_lockStateExtended:", 1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_queue_setHasPasscodeIfNecessary:", v7);
  MKBDeviceUnlockedSinceBoot = _get_MKBDeviceUnlockedSinceBoot();
  int v3 = MKBDeviceUnlockedSinceBoot();
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 48)) {
    BOOL v5 = v3 <= 0;
  }
  else {
    BOOL v5 = 0;
  }
  char v6 = !v5;
  *(unsigned char *)(v4 + 49) = v6;
}

- (void)dealloc
{
  AKSEventsUnregister();
  v3.receiver = self;
  v3.super_class = (Class)SBFMobileKeyBag;
  [(SBFMobileKeyBag *)&v3 dealloc];
}

- (void)lockSkippingGracePeriod:(BOOL)a3
{
}

- (void)lockSkippingGracePeriod:(BOOL)a3 endingContinuityUnlock:(BOOL)a4
{
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__SBFMobileKeyBag_lockSkippingGracePeriod_endingContinuityUnlock___block_invoke;
  v8[3] = &unk_1E548CAB0;
  v8[4] = self;
  BOOL v9 = a4;
  BOOL v10 = a3;
  dispatch_sync(queue, v8);
}

void __66__SBFMobileKeyBag_lockSkippingGracePeriod_endingContinuityUnlock___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(*(id *)(a1 + 32), "_queue_isContinuityUnlocked") && !*(unsigned char *)(a1 + 40))
  {
    objc_super v3 = SBLogAuthenticationKeybag();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(unsigned __int8 *)(a1 + 41);
      *(_DWORD *)buf = 67109120;
      int v7 = v4;
      _os_log_impl(&dword_18B52E000, v3, OS_LOG_TYPE_DEFAULT, "Deferring keybag lock because endingContinuityUnlock = NO (skipGracePeriod = %{BOOL}u)", buf, 8u);
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 41))
    {
      id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:*MEMORY[0x1E4F1CFD0] forKey:@"LockDeviceNow"];
    }
    else
    {
      id v5 = 0;
    }
    MKBLockDevice = _get_MKBLockDevice();
    MKBLockDevice((uint64_t)v5);
  }
}

- (BOOL)unlockWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BSDispatchQueueAssertNot();
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SBFMobileKeyBag_unlockWithOptions_error___block_invoke;
  block[3] = &unk_1E548CAD8;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v15;
  uint64_t v14 = &v19;
  dispatch_sync(queue, block);
  if (a4) {
    *a4 = (id) v20[5];
  }
  char v9 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __43__SBFMobileKeyBag_unlockWithOptions_error___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v10 = @"SkipSE";
  int v2 = [*(id *)(a1 + 32) skipSEKeepUserDataOperation];
  objc_super v3 = (void *)MEMORY[0x1E4F1CFD0];
  if (!v2) {
    objc_super v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  v11[0] = *v3;
  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  MKBUnlockDevice = _get_MKBUnlockDevice();
  int v6 = MKBUnlockDevice([*(id *)(a1 + 32) passcode], (uint64_t)v4);
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.springboardfoundation.mkb" code:v6 userInfo:0];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    char v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)verifyWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BSDispatchQueueAssertNot();
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SBFMobileKeyBag_verifyWithOptions_error___block_invoke;
  block[3] = &unk_1E548CAD8;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v15;
  uint64_t v14 = &v19;
  dispatch_sync(queue, block);
  if (a4) {
    *a4 = (id) v20[5];
  }
  char v9 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __43__SBFMobileKeyBag_verifyWithOptions_error___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  char v9 = @"SkipSE";
  int v2 = [*(id *)(a1 + 32) skipSEKeepUserDataOperation];
  objc_super v3 = (void *)MEMORY[0x1E4F1CFD0];
  if (!v2) {
    objc_super v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  v10[0] = *v3;
  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [*(id *)(a1 + 32) passcode];
  int v5 = MKBVerifyPasswordWithContext();
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.springboardfoundation.mkb" code:v5 userInfo:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)isContinuityUnlocked
{
  BSDispatchQueueAssertNot();
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SBFMobileKeyBag_isContinuityUnlocked__block_invoke;
  v5[3] = &unk_1E548CB00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __39__SBFMobileKeyBag_isContinuityUnlocked__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_isContinuityUnlocked");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)maxUnlockAttempts
{
  MKBGetDeviceConfigurations = _get_MKBGetDeviceConfigurations();
  CFDictionaryRef v3 = (const __CFDictionary *)MKBGetDeviceConfigurations(0);
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E4F780F8]);
    if (Value && (v6 = Value, CFTypeID v7 = CFGetTypeID(Value), v7 == CFNumberGetTypeID()))
    {
      int64_t valuePtr = 0;
      CFNumberGetValue(v6, kCFNumberLongLongType, &valuePtr);
      int64_t v8 = valuePtr;
      if (valuePtr)
      {
LABEL_10:
        CFRelease(v4);
        return v8;
      }
      char v9 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SBFMobileKeyBag maxUnlockAttempts]();
      }
    }
    else
    {
      char v9 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SBFMobileKeyBag maxUnlockAttempts]();
      }
    }

    int64_t v8 = 10;
    goto LABEL_10;
  }
  BOOL v10 = SBLogAuthenticationKeybag();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[SBFMobileKeyBag maxUnlockAttempts]();
  }

  return 10;
}

- (void)createStashBagWithOptions:(id)a3 completion:(id)a4
{
}

- (void)createStashBagWithOptions:(id)a3 completion:(id)a4 completionQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__SBFMobileKeyBag_createStashBagWithOptions_completion_completionQueue___block_invoke;
  v15[3] = &unk_1E548CB28;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __72__SBFMobileKeyBag_createStashBagWithOptions_completion_completionQueue___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  CFDictionaryRef v3 = [*(id *)(a1 + 40) passcode];
  objc_msgSend(v2, "_queue_createStashBag:skipSEKeepUserDataOperation:", v3, objc_msgSend(*(id *)(a1 + 40), "skipSEKeepUserDataOperation"));

  CFDictionaryRef v4 = *(void **)(a1 + 56);
  if (v4)
  {
    int v5 = *(NSObject **)(a1 + 48);
    dispatch_async(v5, v4);
  }
}

- (BOOL)hasBeenUnlockedSinceBoot
{
  uint64_t v6 = 0;
  CFTypeID v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SBFMobileKeyBag_hasBeenUnlockedSinceBoot__block_invoke;
  v5[3] = &unk_1E548CB00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SBFMobileKeyBag_hasBeenUnlockedSinceBoot__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 49);
  return result;
}

- (SBFMobileKeyBagState)state
{
  BSDispatchQueueAssertNot();
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__SBFMobileKeyBag_state__block_invoke;
  v6[3] = &unk_1E548CB00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SBFMobileKeyBagState *)v4;
}

uint64_t __24__SBFMobileKeyBag_state__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_lockStateExtended:", 0);
  return MEMORY[0x1F41817F8]();
}

- (BOOL)beginRecovery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BSDispatchQueueAssertNot();
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SBFMobileKeyBag_beginRecovery_error___block_invoke;
  block[3] = &unk_1E548CAD8;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v19;
  id v14 = &v15;
  dispatch_sync(queue, block);
  if (a4) {
    *a4 = (id) v20[5];
  }
  char v9 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __39__SBFMobileKeyBag_beginRecovery_error___block_invoke(void *a1)
{
  MKBKeyBagPerformRecovery = _get_MKBKeyBagPerformRecovery();
  uint64_t v3 = MKBKeyBagPerformRecovery(a1[4], 0);
  if (v3 != -13)
  {
    uint64_t v4 = v3;
    int v5 = SBLogAuthenticationKeybag();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __39__SBFMobileKeyBag_beginRecovery_error___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.springboardfoundation.mkb" code:(int)v4 userInfo:0];
    uint64_t v13 = *(void *)(a1[5] + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

- (void)waitForUnlockWithTimeout:(float)a3
{
  BSDispatchQueueAssertNot();
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __44__SBFMobileKeyBag_waitForUnlockWithTimeout___block_invoke;
  v19[3] = &unk_1E548CB50;
  uint64_t v6 = v5;
  v20 = v6;
  uint64_t v7 = (void *)MEMORY[0x18C133210](v19);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SBFMobileKeyBag_waitForUnlockWithTimeout___block_invoke_2;
  block[3] = &unk_1E548CB78;
  void block[4] = self;
  id v9 = v7;
  id v18 = v9;
  dispatch_sync(queue, block);
  uint64_t v10 = [(SBFMobileKeyBag *)self state];
  char v11 = [v10 isEffectivelyLocked];

  if ((v11 & 1) == 0) {
    dispatch_semaphore_signal(v6);
  }
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(float)(a3 * 1000000000.0));
  dispatch_semaphore_wait(v6, v12);
  uint64_t v13 = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__SBFMobileKeyBag_waitForUnlockWithTimeout___block_invoke_3;
  v15[3] = &unk_1E548CB78;
  v15[4] = self;
  id v16 = v9;
  id v14 = v9;
  dispatch_sync(v13, v15);
}

intptr_t __44__SBFMobileKeyBag_waitForUnlockWithTimeout___block_invoke(uint64_t a1, void *a2)
{
  intptr_t result = [a2 isEffectivelyLocked];
  if ((result & 1) == 0)
  {
    uint64_t v4 = *(NSObject **)(a1 + 32);
    return dispatch_semaphore_signal(v4);
  }
  return result;
}

void __44__SBFMobileKeyBag_waitForUnlockWithTimeout___block_invoke_2(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    uint64_t v4 = *(void *)(a1 + 32);
    dispatch_semaphore_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    int v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  id v6 = (id)MEMORY[0x18C133210](*(void *)(a1 + 40));
  [v2 addObject:v6];
}

void __44__SBFMobileKeyBag_waitForUnlockWithTimeout___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  id v2 = (id)MEMORY[0x18C133210](*(void *)(a1 + 40));
  [v1 removeObject:v2];
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBFMobileKeyBag.m", 407, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SBFMobileKeyBag_addObserver___block_invoke;
  block[3] = &unk_1E548CBA0;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
}

uint64_t __31__SBFMobileKeyBag_addObserver___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBFMobileKeyBag.m", 419, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SBFMobileKeyBag_removeObserver___block_invoke;
  block[3] = &unk_1E548CBA0;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
}

uint64_t __34__SBFMobileKeyBag_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (void)performAfterFirstUnlockSinceBootUsingBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBFMobileKeyBag.m", 428, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  BSDispatchQueueAssertNot();
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SBFMobileKeyBag_performAfterFirstUnlockSinceBootUsingBlock___block_invoke;
  block[3] = &unk_1E548CBC8;
  char v11 = &v12;
  void block[4] = self;
  id v7 = (void (**)(void))v5;
  id v10 = v7;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v13 + 24)) {
    v7[2](v7);
  }

  _Block_object_dispose(&v12, 8);
}

void __62__SBFMobileKeyBag_performAfterFirstUnlockSinceBootUsingBlock___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 49);
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 49))
  {
    uint64_t v3 = *(void **)(v1 + 40);
    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
    }
    id v8 = (id)[*(id *)(a1 + 40) copy];
    id v7 = (void *)MEMORY[0x18C133210]();
    [v3 addObject:v7];
  }
}

- (void)refreshContinuityUnlockHeartbeat
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = aks_oneness_heartbeat();
  uint64_t v3 = @"not currently in continuity unlocked state";
  if (!v2) {
    uint64_t v3 = @"success";
  }
  id v4 = v3;
  uint64_t v5 = SBLogAuthenticationKeybag();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_18B52E000, v5, OS_LOG_TYPE_DEFAULT, "Refreshed continuity unlock heartbeat with result: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_queue_firstUnlockOccurred
{
  BSDispatchQueueAssert();
  uint64_t v3 = (void *)[(NSHashTable *)self->_queue_observers copy];
  id v4 = self->_queue_performAfterFirstUnlockBlocks;
  queue_performAfterFirstUnlockBlocks = self->_queue_performAfterFirstUnlockBlocks;
  self->_queue_performAfterFirstUnlockBlocks = 0;

  int v6 = SBLogAuthenticationKeybag();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B52E000, v6, OS_LOG_TYPE_DEFAULT, "First unlock occurred", buf, 2u);
  }

  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SBFMobileKeyBag__queue_firstUnlockOccurred__block_invoke;
  block[3] = &unk_1E548CBF0;
  id v11 = v3;
  uint64_t v12 = self;
  uint64_t v13 = v4;
  uint64_t v8 = v4;
  id v9 = v3;
  dispatch_async(calloutQueue, block);
}

void __45__SBFMobileKeyBag__queue_firstUnlockOccurred__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 keybagDidUnlockForTheFirstTime:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)_queue_handleKeybagStatusChanged
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
  uint64_t v3 = (void *)[(NSHashTable *)self->_queue_observers copy];
  uint64_t v4 = (void *)[(NSMutableArray *)self->_queue_observerStateChangedCallbackBlocks copy];
  uint64_t v5 = [(SBFMobileKeyBag *)self _queue_lockStateExtended:1];
  [(SBFMobileKeyBag *)self _queue_setHasPasscodeIfNecessary:v5];
  uint64_t v6 = SBLogAuthenticationKeybag();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 publicDescription];
    *(_DWORD *)buf = 138543362;
    long long v18 = v7;
    _os_log_impl(&dword_18B52E000, v6, OS_LOG_TYPE_DEFAULT, "Keybag state changed: %{public}@", buf, 0xCu);
  }
  calloutQueue = self->_calloutQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__SBFMobileKeyBag__queue_handleKeybagStatusChanged__block_invoke;
  v12[3] = &unk_1E548CC18;
  id v13 = v4;
  id v14 = v5;
  id v15 = v3;
  long long v16 = self;
  id v9 = v3;
  id v10 = v5;
  id v11 = v4;
  dispatch_async(calloutQueue, v12);
}

void __51__SBFMobileKeyBag__queue_handleKeybagStatusChanged__block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v38;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v38 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v37 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v4);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 keybagWillBeginProcessingStateChange:*(void *)(a1 + 56)];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v9);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v29 + 1) + 8 * v17);
        if (objc_opt_respondsToSelector()) {
          [v18 keybag:*(void *)(a1 + 56) extendedStateDidChange:*(void *)(a1 + 40)];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v15);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v19 = *(id *)(a1 + 48);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v25 + 1) + 8 * v23);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v24, "keybagDidFinishProcessingStateChange:", *(void *)(a1 + 56), (void)v25);
        }
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v21);
  }
}

- (BOOL)_queue_verifyExpectedStashState:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
  MKBKeyBagKeyStashVerify = _get_MKBKeyBagKeyStashVerify();
  CFDictionaryRef v5 = (const __CFDictionary *)MKBKeyBagKeyStashVerify();
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v5, @"StashBagValidOnDisk");
    if (Value && (v8 = Value, CFTypeID v9 = CFGetTypeID(Value), v9 == CFNumberGetTypeID()))
    {
      uint64_t valuePtr = 0;
      CFNumberGetValue(v8, kCFNumberLongLongType, &valuePtr);
      BOOL v10 = valuePtr == a3;
      if (!v10)
      {
        uint64_t v11 = SBLogAuthenticationKeybag();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v22 = valuePtr;
          _os_log_impl(&dword_18B52E000, v11, OS_LOG_TYPE_DEFAULT, "MKBKeyBagStashVerify() returned unexpected stash state %lld", buf, 0xCu);
        }

        uint64_t v12 = SBLogAuthenticationKeybag();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          MKBGetDeviceLockState = _get_MKBGetDeviceLockState();
          id v19 = @"ExtendedDeviceLockState";
          uint64_t v20 = *MEMORY[0x1E4F1CFD0];
          int v14 = MKBGetDeviceLockState([MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1]);
          *(_DWORD *)buf = 67109120;
          LODWORD(v22) = v14;
          _os_log_impl(&dword_18B52E000, v12, OS_LOG_TYPE_DEFAULT, "keybag extended state = %d", buf, 8u);
        }
      }
    }
    else
    {
      uint64_t v15 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B52E000, v15, OS_LOG_TYPE_DEFAULT, "MKBKeyBagStashVerify() did not return a stash state", buf, 2u);
      }

      BOOL v10 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    uint64_t v16 = SBLogAuthenticationKeybag();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B52E000, v16, OS_LOG_TYPE_DEFAULT, "MKBKeyBagKeyStashVerify() returned NULL", buf, 2u);
    }

    return 0;
  }
  return v10;
}

- (void)_queue_createStashBag:(id)a3 skipSEKeepUserDataOperation:(BOOL)a4
{
  BOOL v4 = a4;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BSDispatchQueueAssert();
  long long v27 = @"SkipSE";
  id v7 = (void *)MEMORY[0x1E4F1CFD0];
  if (!v4) {
    id v7 = (void *)MEMORY[0x1E4F1CFC8];
  }
  v28[0] = *v7;
  CFNumberRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  CFTypeID v9 = _get_MKBKeyBagKeyStashCreateWithOpts();
  uint64_t v10 = v9((uint64_t)v8, 1, 0, (uint64_t)v6);

  if (v10)
  {
    uint64_t v11 = SBLogAuthenticationKeybag();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SBFMobileKeyBag _queue_createStashBag:skipSEKeepUserDataOperation:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  else
  {
    if (![(SBFMobileKeyBag *)self _queue_verifyExpectedStashState:0]) {
      goto LABEL_12;
    }
    MKBKeyBagKeyStashCommit = _get_MKBKeyBagKeyStashCommit();
    uint64_t v19 = MKBKeyBagKeyStashCommit();
    if (!v19)
    {
      [(SBFMobileKeyBag *)self _queue_verifyExpectedStashState:1];
      goto LABEL_12;
    }
    uint64_t v20 = v19;
    uint64_t v11 = SBLogAuthenticationKeybag();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SBFMobileKeyBag _queue_createStashBag:skipSEKeepUserDataOperation:](v20, v11, v21, v22, v23, v24, v25, v26);
    }
  }

LABEL_12:
}

- (void)_queue_setHasPasscodeIfNecessary:(id)a3
{
  self->_queue_hasPasscodeSet = [a3 lockState] != 3;
}

- (BOOL)_queue_isContinuityUnlocked
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
  __int16 v7 = 0;
  long long v5 = 0u;
  long long v6 = 0u;
  [(SBFMobileKeyBag *)self _queue_aksDeviceState];
  return (*(void *)((char *)&v5 + 2) >> 4) & 1;
}

- (BOOL)_shouldHandleKeyBagEventWithHandleState:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v5 = [v4 BOOLForKey:@"SBOnenessUnlockPrototyping"];

  if (v5)
  {
    long long v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4D978]];
    BOOL v7 = [v6 integerValue] == -501;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_performAfterFirstUnlockBlocks, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue_observerStateChangedCallbackBlocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (void)maxUnlockAttempts
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_18B52E000, v0, v1, "MKBGetDeviceConfigurations() returned 0 for kMKBConfigMaxUnlockAttempts", v2, v3, v4, v5, v6);
}

void __39__SBFMobileKeyBag_beginRecovery_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_18B52E000, a2, a3, "MKBKeyBagPerformRecovery() returned %d", a5, a6, a7, a8, 0);
}

- (void)_queue_createStashBag:(uint64_t)a3 skipSEKeepUserDataOperation:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_18B52E000, a2, a3, "MKBKeyBagKeyStashCommit() returned %d", a5, a6, a7, a8, 0);
}

- (void)_queue_createStashBag:(uint64_t)a3 skipSEKeepUserDataOperation:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_18B52E000, a2, a3, "MKBKeyBagKeyStashCreate() returned %d", a5, a6, a7, a8, 0);
}

- (void)_queue_aksDeviceState
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_18B52E000, v0, v1, "Failed to get device state", v2, v3, v4, v5, v6);
}

@end