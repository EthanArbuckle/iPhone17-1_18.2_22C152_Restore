@interface SFAutoUnlockManager
+ (BOOL)autoUnlockEnabled;
+ (BOOL)autoUnlockEnabled:(unsigned int)a3;
+ (BOOL)bluetoothAndWiFiEnabled;
+ (BOOL)mockedAutoUnlockEnabled;
+ (BOOL)mockedBluetoothAndWiFiEnabled;
+ (BOOL)mockedPhoneAutoUnlockAWDLUnavailable;
+ (BOOL)mockedPhoneAutoUnlockEnabled;
+ (BOOL)mockedPhoneAutoUnlockFaceIDDisabled;
+ (BOOL)mockedPhoneAutoUnlockInBioLockout;
+ (BOOL)mockedPhoneAutoUnlockMaskUnlikely;
+ (BOOL)mockedPhoneAutoUnlockNeverUnlocked;
+ (BOOL)mockedPhoneAutoUnlockNoMask;
+ (BOOL)mockedPhoneAutoUnlockNoPairedWatch;
+ (BOOL)mockedPhoneAutoUnlockNoWatch;
+ (BOOL)mockedPhoneAutoUnlockSimulateDevicesOutOfRange;
+ (BOOL)mockedPhoneAutoUnlockSimulateMagnetBreak;
+ (BOOL)mockedPhoneAutoUnlockSimulatePhoneMissedFinalConfirmationToUnlock;
+ (BOOL)mockedPhoneAutoUnlockWatchAWDLUnavailable;
+ (BOOL)mockedPhoneAutoUnlockWatchHasWeakPasscode;
+ (BOOL)mockedPhoneAutoUnlockWatchLocked;
+ (BOOL)mockedPhoneAutoUnlockWatchNoMotion;
+ (BOOL)mockedPhoneAutoUnlockWatchOffWrist;
+ (BOOL)mockedPhoneAutoUnlockWatchSleepModeOn;
+ (BOOL)mockedPhoneAutoUnlockWatchWiFiOff;
+ (BOOL)mockedPhoneAutoUnlockWatchWristDetectionDisabled;
+ (BOOL)mockedPhoneAutoUnlockWiFiOff;
+ (NSUserDefaults)userDefaults;
+ (float)mockedPhoneAutoUnlockSimulateLatency;
+ (float)mockedPhoneAutoUnlockSimulateManualReLock;
+ (int64_t)mockedPhoneAutoUnlockSimulateErrorCode;
+ (void)autoUnlockEnabled;
+ (void)enableBluetoothAndWiFi;
+ (void)mockedEnableBluetoothAndWiFi;
- (OS_dispatch_queue)delegateQueue;
- (SFAutoUnlockManager)init;
- (SFAutoUnlockManagerDelegate)delegate;
- (double)spinnerDelay;
- (void)attemptAutoUnlock;
- (void)attemptAutoUnlockForSiri;
- (void)attemptAutoUnlockWithoutNotifyingWatch;
- (void)authPromptInfoWithCompletionHandler:(id)a3;
- (void)autoUnlockStateWithCompletionHandler:(id)a3;
- (void)beganAttemptWithDevice:(id)a3;
- (void)cancelAutoUnlock;
- (void)cancelEnablingAutoUnlockForDevice:(id)a3;
- (void)clearPhoneAutoUnlockBehaviorChangeNotification;
- (void)completeAutoUnlockWithNotification:(BOOL)a3;
- (void)completedUnlockWithDevice:(id)a3;
- (void)declinedToEnablePhoneAutoUnlock;
- (void)deviceRequestedRelock:(id)a3;
- (void)disableAutoUnlockForDevice:(id)a3 completionHandler:(id)a4;
- (void)donateDeviceUnlockedWithMask:(BOOL)a3;
- (void)eligibleAutoUnlockDevicesWithCompletionHandler:(id)a3;
- (void)enableAutoUnlockWithDevice:(id)a3 passcode:(id)a4;
- (void)enabledDevice:(id)a3;
- (void)failedToEnableDevice:(id)a3 error:(id)a4;
- (void)failedUnlockWithError:(id)a3;
- (void)keyDeviceLocked:(id)a3;
- (void)mockedAttemptAutoUnlock;
- (void)mockedCancelUnlock;
- (void)mockedDisableAutoUnlockForDevice:(id)a3;
- (void)mockedEligibleAutoUnlockDevicesWithCompletionHandler:(id)a3;
- (void)mockedEnableAutoUnlockWithDevice:(id)a3;
- (void)onDelegateQueue_notifyDelegateOfAttemptError:(id)a3;
- (void)onDelegateQueue_notifyDelegateOfEnableError:(id)a3 device:(id)a4;
- (void)prewarmAutoUnlock;
- (void)repairCloudPairing;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
@end

@implementation SFAutoUnlockManager

+ (BOOL)mockedAutoUnlockEnabled
{
  return !+[SFAutoUnlockManager mockedPhoneAutoUnlockNoPairedWatch];
}

+ (BOOL)autoUnlockEnabled
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    v3 = (__CFString *)SCDynamicStoreCopyValue(0, @"com.apple.sharing:/AutoUnlock/Enabled");
    v4 = v3;
    if (v3 && (CFTypeID v5 = CFGetTypeID(v3), v5 == CFDictionaryGetTypeID()))
    {
      v6 = auto_unlock_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, "Dynamic store enabled state %@", buf, 0xCu);
      }

      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", getuid());
      v8 = [(__CFString *)v4 objectForKeyedSubscript:v7];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v10 = [(__CFString *)v4 objectForKeyedSubscript:v7];
        int v11 = [v10 BOOLValue];
      }
      else
      {
        int v11 = 0;
      }
      v13 = auto_unlock_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        +[SFAutoUnlockManager autoUnlockEnabled];
      }
    }
    else
    {
      v12 = auto_unlock_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = @"com.apple.sharing:/AutoUnlock/Enabled";
        _os_log_impl(&dword_1A5389000, v12, OS_LOG_TYPE_DEFAULT, "No value at path: %@", buf, 0xCu);
      }

      if (v4) {
        CFRelease(v4);
      }
      int v11 = 0;
    }
    LOBYTE(v2) = v11 != 0;
  }
  return v2;
}

+ (BOOL)autoUnlockEnabled:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (void *)copySharingPrefValue(@"AUTestDictionary");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  CFTypeID v5 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v3);
  v6 = [v4 objectForKeyedSubscript:v5];
  v7 = [v6 objectForKeyedSubscript:@"AUTestMode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = [v7 BOOLValue];

    if ((v8 & 1) == 0)
    {
LABEL_4:
      BOOL v9 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    int v10 = [v7 isEqual:@"1"];

    if (!v10) {
      goto LABEL_4;
    }
  }
  int v11 = auto_unlock_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v14 = v3;
    __int16 v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1A5389000, v11, OS_LOG_TYPE_DEFAULT, "Using test mode (uid: %u, test dictionary %@)", buf, 0x12u);
  }

  BOOL v9 = 1;
LABEL_9:

  return v9;
}

- (SFAutoUnlockManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFAutoUnlockManager;
  int v2 = [(SFAutoUnlockManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.sharing.auto-unlock.delegate-queue", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (double)spinnerDelay
{
  int v2 = (void *)copySharingPrefValue(@"AUSpinnerDelay");
  dispatch_queue_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 3.5;
  }

  return v5;
}

+ (BOOL)mockedBluetoothAndWiFiEnabled
{
  return !+[SFAutoUnlockManager mockedPhoneAutoUnlockWiFiOff];
}

+ (BOOL)bluetoothAndWiFiEnabled
{
  return +[SFAutoUnlockManager mockedBluetoothAndWiFiEnabled];
}

+ (void)mockedEnableBluetoothAndWiFi
{
  id v2 = +[SFAutoUnlockManager userDefaults];
  [v2 setBool:0 forKey:@"phoneAutoUnlockWiFiOff"];
}

+ (void)enableBluetoothAndWiFi
{
}

- (void)repairCloudPairing
{
}

- (void)mockedEligibleAutoUnlockDevicesWithCompletionHandler:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = (void (**)(id, void *, void *))a3;
  double v4 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
  if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch])
  {
    double v5 = objc_opt_new();
    [v5 setUniqueID:@"fake watch unique id"];
    objc_super v6 = objc_opt_new();
    [v5 setBluetoothID:v6];

    [v5 setModelIdentifier:@"Watch5,3"];
    [v5 setProductName:@"watchOS"];
    [v5 setProductVersion:@"7.5"];
    [v5 setProductBuildVersion:@"some build in HunterE"];
    [v5 setName:@"fake watch"];
    [v5 setEnclosureColor:@"graphite"];
    [v5 setDefaultPairedDevice:1];
    [v5 setModelName:@"Apple Watch"];
    [v5 setMajorOSVersion:7];
    [v5 setSupportsApproveWithWatch:1];
    [v5 setSupportsApproveIcon:1];
    [v5 setSupportsEncryption:1];
    [v5 setSupportsAdvertisingUnlocked:1];
    [v5 setSupportsConnectionCache:1];
    [v5 setSupportsHEIC:1];
    [v4 addObject:v5];
  }
  uint64_t v7 = +[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateErrorCode];
  if (v7 < 1)
  {
    int v11 = 0;
  }
  else
  {
    uint64_t v8 = v7;
    BOOL v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"simulated error";
    int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    int v11 = [v9 errorWithDomain:@"SFAutoUnlockErrorDomain" code:v8 userInfo:v10];
  }
  v3[2](v3, v4, v11);
}

- (void)eligibleAutoUnlockDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (+[SFAutoUnlockManager autoUnlockSupported])
    {
      double v5 = auto_unlock_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Client requesting eligible devices", buf, 2u);
      }

      *(void *)buf = 0;
      v13 = buf;
      uint64_t v14 = 0x2020000000;
      char v15 = 0;
      if (_os_feature_enabled_impl()
        && +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
      {
        [(SFAutoUnlockManager *)self mockedEligibleAutoUnlockDevicesWithCompletionHandler:v4];
      }
      else
      {
        uint64_t v8 = +[SFCompanionXPCManager sharedManager];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_410;
        v9[3] = &unk_1E5BBD3F0;
        v9[4] = self;
        int v11 = buf;
        id v10 = v4;
        [v8 unlockManagerWithCompletionHandler:v9];
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke;
      block[3] = &unk_1E5BBC658;
      id v17 = v4;
      dispatch_async(delegateQueue, block);
    }
  }
  else
  {
    objc_super v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SFAutoUnlockManager eligibleAutoUnlockDevicesWithCompletionHandler:](v6);
    }
  }
}

void __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFAutoUnlockErrorDomain" code:115 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_410(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_2;
    v20[3] = &unk_1E5BBD378;
    v20[4] = *(void *)(a1 + 32);
    long long v12 = *(_OWORD *)(a1 + 40);
    id v6 = (id)v12;
    long long v21 = v12;
    uint64_t v7 = [a2 remoteObjectProxyWithErrorHandler:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_4;
    v18[3] = &unk_1E5BBD3C8;
    v18[4] = *(void *)(a1 + 32);
    long long v13 = *(_OWORD *)(a1 + 40);
    id v8 = (id)v13;
    long long v19 = v13;
    [v7 eligibleAutoUnlockDevicesWithCompletionHandler:v18];

    BOOL v9 = (void *)v21;
  }
  else
  {
    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_6;
    block[3] = &unk_1E5BBD350;
    long long v14 = *(_OWORD *)(a1 + 40);
    id v11 = (id)v14;
    long long v17 = v14;
    id v16 = v5;
    dispatch_async(v10, block);

    BOOL v9 = (void *)v17;
  }
}

void __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E5BBD350;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_5;
  block[3] = &unk_1E5BBD3A0;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_5(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 48) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_6(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)mockedEnableAutoUnlockWithDevice:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch])
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v36[0] = @"Apple Watch Not Found";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    long long v7 = v5;
    uint64_t v8 = 131;
LABEL_7:
    id v14 = [v7 errorWithDomain:@"SFAutoUnlockErrorDomain" code:v8 userInfo:v6];
    goto LABEL_13;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchLocked])
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    id v6 = SFLocalizedStringForKey(@"UNLOCK_WATCH_LOCKED_TITLE");
    v34 = v6;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    long long v11 = v9;
    uint64_t v12 = 102;
  }
  else
  {
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockFaceIDDisabled])
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v32 = @"FaceID disabled";
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      long long v7 = v13;
      uint64_t v8 = 205;
      goto LABEL_7;
    }
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchHasWeakPasscode])
    {
      long long v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      id v6 = SFLocalizedStringForKey(@"UNLOCK_PASSCODE_REQUIRED_TITLE");
      v30 = v6;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      long long v11 = v15;
      uint64_t v12 = 108;
    }
    else
    {
      if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchWristDetectionDisabled])
      {
        if (+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateErrorCode] < 1)goto LABEL_17; {
        long long v19 = (void *)MEMORY[0x1E4F28C58];
        }
        int64_t v20 = +[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateErrorCode];
        uint64_t v25 = *MEMORY[0x1E4F28568];
        v26 = @"Custom error code";
        id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        long long v7 = v19;
        uint64_t v8 = v20;
        goto LABEL_7;
      }
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      id v6 = SFLocalizedStringForKey(@"UNLOCK_WRIST_DETECTION_REQUIRED_TITLE");
      v28 = v6;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      long long v11 = v16;
      uint64_t v12 = 158;
    }
  }
  id v14 = [v11 errorWithDomain:@"SFAutoUnlockErrorDomain" code:v12 userInfo:v10];

LABEL_13:
  if (!v14)
  {
LABEL_17:
    long long v21 = +[SFAutoUnlockManager userDefaults];
    [v21 setBool:0 forKey:@"phoneAutoUnlockNoPairedWatch"];

    [(SFAutoUnlockManager *)self enabledDevice:v4];
    goto LABEL_18;
  }
  delegateQueue = self->_delegateQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __56__SFAutoUnlockManager_mockedEnableAutoUnlockWithDevice___block_invoke;
  v22[3] = &unk_1E5BBD418;
  v22[4] = self;
  id v23 = v14;
  id v24 = v4;
  id v18 = v14;
  dispatch_async(delegateQueue, v22);

LABEL_18:
}

uint64_t __56__SFAutoUnlockManager_mockedEnableAutoUnlockWithDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onDelegateQueue_notifyDelegateOfEnableError:device:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)enableAutoUnlockWithDevice:(id)a3 passcode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  if (!v6)
  {
    delegateQueue = self->_delegateQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_6;
    v12[3] = &unk_1E5BBD4B8;
    v12[4] = self;
    v12[5] = v19;
    dispatch_async(delegateQueue, v12);
    goto LABEL_9;
  }
  if (!+[SFAutoUnlockManager autoUnlockSupported])
  {
    id v9 = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke;
    block[3] = &unk_1E5BBBD18;
    void block[4] = self;
    id v18 = v6;
    dispatch_async(v9, block);
    id v10 = v18;
LABEL_8:

    goto LABEL_9;
  }
  if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
  {
    long long v11 = +[SFCompanionXPCManager sharedManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_2;
    v13[3] = &unk_1E5BBD490;
    v13[4] = self;
    id v16 = v19;
    id v14 = v6;
    id v15 = v7;
    [v11 unlockManagerWithCompletionHandler:v13];

    id v10 = v14;
    goto LABEL_8;
  }
  [(SFAutoUnlockManager *)self mockedEnableAutoUnlockWithDevice:v6];
LABEL_9:
  _Block_object_dispose(v19, 8);
}

void __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFAutoUnlockErrorDomain" code:115 userInfo:0];
  objc_msgSend(v2, "onDelegateQueue_notifyDelegateOfEnableError:device:", v3, *(void *)(a1 + 40));
}

void __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_3;
    v16[3] = &unk_1E5BBD468;
    uint64_t v7 = *(void *)(a1 + 56);
    v16[4] = *(void *)(a1 + 32);
    v18[1] = v7;
    uint64_t v8 = &v17;
    id v17 = v5;
    id v9 = (id *)v18;
    v18[0] = *(id *)(a1 + 40);
    id v10 = [a2 remoteObjectProxyWithErrorHandler:v16];
    [v10 enableAutoUnlockWithDevice:*(void *)(a1 + 40) passcode:*(void *)(a1 + 48) clientProxy:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(NSObject **)(v11 + 16);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_5;
    v13[3] = &unk_1E5BBD440;
    v15[1] = *(void *)(a1 + 56);
    v13[4] = v11;
    uint64_t v8 = &v14;
    id v14 = v5;
    id v9 = (id *)v15;
    v15[0] = *(id *)(a1 + 40);
    dispatch_async(v12, v13);
  }
}

void __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_4;
  v4[3] = &unk_1E5BBD440;
  uint64_t v7 = *(void *)(a1 + 56);
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, v4);
}

uint64_t __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_4(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    uint64_t v1 = (void *)result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfEnableError:device:", v1[5], v1[6]);
    *(unsigned char *)(*(void *)(v1[7] + 8) + 24) = 1;
  }
  return result;
}

uint64_t __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_5(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    uint64_t v1 = (void *)result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfEnableError:device:", v1[5], v1[6]);
    *(unsigned char *)(*(void *)(v1[7] + 8) + 24) = 1;
  }
  return result;
}

void __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_6(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F28798];
    uint64_t v7 = *MEMORY[0x1E4F28568];
    v8[0] = @"nil device";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v6 = [v3 errorWithDomain:v4 code:22 userInfo:v5];
    objc_msgSend(v2, "onDelegateQueue_notifyDelegateOfEnableError:device:", v6, 0);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)cancelEnablingAutoUnlockForDevice:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3 && +[SFAutoUnlockManager autoUnlockSupported])
  {
    uint64_t v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 uniqueID];
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "Cancelling enabling for device %@", buf, 0xCu);
    }
    id v6 = +[SFCompanionXPCManager sharedManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__SFAutoUnlockManager_cancelEnablingAutoUnlockForDevice___block_invoke;
    v7[3] = &unk_1E5BBD4E0;
    id v8 = v3;
    [v6 unlockManagerWithCompletionHandler:v7];
  }
}

void __57__SFAutoUnlockManager_cancelEnablingAutoUnlockForDevice___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v4 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_437];
    [v4 cancelEnablingAutoUnlockForDevice:*(void *)(a1 + 32)];
  }
  else
  {
    id v3 = auto_unlock_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling enable failed: missing proxy object", buf, 2u);
    }
  }
}

void __57__SFAutoUnlockManager_cancelEnablingAutoUnlockForDevice___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling enable failed: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)mockedDisableAutoUnlockForDevice:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateErrorCode] < 1)
  {
    id v8 = 0;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    int64_t v6 = +[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateErrorCode];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"Custom error code";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v8 = [v5 errorWithDomain:@"SFAutoUnlockErrorDomain" code:v6 userInfo:v7];
  }
  id v9 = +[SFAutoUnlockManager userDefaults];
  [v9 setBool:1 forKey:@"phoneAutoUnlockNoPairedWatch"];

  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SFAutoUnlockManager_mockedDisableAutoUnlockForDevice___block_invoke;
  block[3] = &unk_1E5BBC9C8;
  id v14 = v8;
  id v15 = v4;
  id v11 = v8;
  id v12 = v4;
  dispatch_async(delegateQueue, block);
}

uint64_t __56__SFAutoUnlockManager_mockedDisableAutoUnlockForDevice___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, *(void *)(a1 + 32));
}

- (void)disableAutoUnlockForDevice:(id)a3 completionHandler:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (+[SFAutoUnlockManager autoUnlockSupported])
    {
      if (+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
      {
        [(SFAutoUnlockManager *)self mockedDisableAutoUnlockForDevice:v7];
      }
      else if (v6)
      {
        v18[0] = 0;
        v18[1] = v18;
        void v18[2] = 0x2020000000;
        char v19 = 0;
        id v10 = +[SFCompanionXPCManager sharedManager];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_2;
        v14[3] = &unk_1E5BBD558;
        v14[4] = self;
        id v17 = v18;
        id v16 = v7;
        id v15 = v6;
        [v10 unlockManagerWithCompletionHandler:v14];

        _Block_object_dispose(v18, 8);
      }
      else
      {
        id v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28568];
        v23[0] = @"nil device";
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
        id v13 = [v11 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v12];
        (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
      }
    }
    else
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke;
      block[3] = &unk_1E5BBC658;
      id v21 = v7;
      dispatch_async(delegateQueue, block);
    }
  }
  else
  {
    id v8 = auto_unlock_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SFAutoUnlockManager disableAutoUnlockForDevice:completionHandler:](v8);
    }
  }
}

void __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFAutoUnlockErrorDomain" code:115 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_3;
    v21[3] = &unk_1E5BBD378;
    v21[4] = *(void *)(a1 + 32);
    long long v13 = *(_OWORD *)(a1 + 48);
    id v6 = (id)v13;
    long long v22 = v13;
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_5;
    void v19[3] = &unk_1E5BBD530;
    uint64_t v8 = *(void *)(a1 + 40);
    v19[4] = *(void *)(a1 + 32);
    long long v14 = *(_OWORD *)(a1 + 48);
    id v9 = (id)v14;
    long long v20 = v14;
    [v7 disableAutoUnlockForDevice:v8 completionHandler:v19];

    id v10 = (void *)v22;
  }
  else
  {
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_7;
    block[3] = &unk_1E5BBD350;
    long long v15 = *(_OWORD *)(a1 + 48);
    id v12 = (id)v15;
    long long v18 = v15;
    id v17 = v5;
    dispatch_async(v11, block);

    id v10 = (void *)v18;
  }
}

void __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_4;
  block[3] = &unk_1E5BBD350;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_4(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_6;
  block[3] = &unk_1E5BBD508;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  char v13 = a2;
  id v11 = v5;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_6(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_7(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)mockedAttemptAutoUnlock
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(SFAutoUnlockDevice);
  [(SFPeerDevice *)v3 setName:@"Apple Watch"];
  [(SFAutoUnlockDevice *)v3 setModelName:@"Apple Watch"];
  id v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [v4 UUIDString];
  [(SFPeerDevice *)v3 setUniqueID:v5];

  [(SFAutoUnlockManager *)self beganAttemptWithDevice:v3];
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch])
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v77 = *MEMORY[0x1E4F28568];
    v78[0] = @"Apple Watch Not Found";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
    id v8 = v6;
    uint64_t v9 = 131;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoPairedWatch])
  {
    long long v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v75 = *MEMORY[0x1E4F28568];
    v76 = @"No enabled devices";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    id v8 = v10;
    uint64_t v9 = 117;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockInBioLockout])
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v73 = *MEMORY[0x1E4F28568];
    v74 = @"Phone in bio lockout";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    id v8 = v11;
    uint64_t v9 = 207;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoMask])
  {
    long long v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v71 = *MEMORY[0x1E4F28568];
    v72 = @"No mask detected";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    id v8 = v12;
    uint64_t v9 = 206;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNeverUnlocked])
  {
    char v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v69 = *MEMORY[0x1E4F28568];
    v70 = @"Unlock phone with passcode or FaceID first";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    id v8 = v13;
    uint64_t v9 = 177;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchHasWeakPasscode])
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v67 = *MEMORY[0x1E4F28568];
    id v7 = SFLocalizedStringForKey(@"UNLOCK_PASSCODE_REQUIRED_TITLE");
    v68 = v7;
    long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    char v19 = v17;
    uint64_t v20 = 108;
    goto LABEL_18;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchWristDetectionDisabled])
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v65 = *MEMORY[0x1E4F28568];
    id v7 = SFLocalizedStringForKey(@"UNLOCK_WRIST_DETECTION_REQUIRED_TITLE");
    v66 = v7;
    long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    char v19 = v21;
    uint64_t v20 = 158;
    goto LABEL_18;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWiFiOff])
  {
    long long v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v63 = *MEMORY[0x1E4F28568];
    v64 = @"Phone WiFi disabled";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    id v8 = v22;
    uint64_t v9 = 120;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockAWDLUnavailable])
  {
    id v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v61 = *MEMORY[0x1E4F28568];
    v62 = @"AWDL network failed to start";
    id v24 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v25 = &v62;
    v26 = &v61;
LABEL_27:
    id v7 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:1];
    id v8 = v23;
    uint64_t v9 = 192;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchWiFiOff])
  {
    uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v59 = *MEMORY[0x1E4F28568];
    v60 = @"WiFi interface disabled on Watch";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    id v8 = v27;
    uint64_t v9 = 199;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchAWDLUnavailable])
  {
    id v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v57 = *MEMORY[0x1E4F28568];
    v58 = @"Watch AWDL network failed to start";
    id v24 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v25 = &v58;
    v26 = &v57;
    goto LABEL_27;
  }
  if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchLocked])
  {
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchOffWrist])
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v53 = *MEMORY[0x1E4F28568];
      v54 = @"Cannot unlock while Watch not on wrist";
      v30 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v31 = &v54;
      v32 = &v53;
    }
    else
    {
      if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchSleepModeOn])
      {
        if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchNoMotion])
        {
          uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v49 = *MEMORY[0x1E4F28568];
          v50 = @"No motion detected from Watch";
          id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          id v8 = v33;
          uint64_t v9 = 210;
        }
        else
        {
          if (+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateErrorCode] < 1)goto LABEL_39; {
          v34 = (void *)MEMORY[0x1E4F28C58];
          }
          int64_t v35 = +[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateErrorCode];
          uint64_t v47 = *MEMORY[0x1E4F28568];
          v48 = @"Custom error code";
          id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
          id v8 = v34;
          uint64_t v9 = v35;
        }
        goto LABEL_11;
      }
      uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F28568];
      v52 = @"Cannot unlock while in sleep mode";
      v30 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v31 = &v52;
      v32 = &v51;
    }
    id v7 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:1];
    id v8 = v29;
    uint64_t v9 = 158;
LABEL_11:
    long long v14 = [v8 errorWithDomain:@"SFAutoUnlockErrorDomain" code:v9 userInfo:v7];
    goto LABEL_12;
  }
  v28 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v55 = *MEMORY[0x1E4F28568];
  id v7 = SFLocalizedStringForKey(@"UNLOCK_WATCH_LOCKED_TITLE");
  v56 = v7;
  long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  char v19 = v28;
  uint64_t v20 = 102;
LABEL_18:
  long long v14 = [v19 errorWithDomain:@"SFAutoUnlockErrorDomain" code:v20 userInfo:v18];

LABEL_12:
  if (v14)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke;
    block[3] = &unk_1E5BBBD18;
    void block[4] = self;
    id v44 = v14;
    id v16 = v14;
    dispatch_async(delegateQueue, block);

    goto LABEL_42;
  }
LABEL_39:
  +[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateLatency];
  float v37 = v36;
  v38 = auto_unlock_log();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v46 = v37;
    _os_log_impl(&dword_1A5389000, v38, OS_LOG_TYPE_DEFAULT, "delaying unlock for %f sec", buf, 0xCu);
  }

  dispatch_time_t v39 = dispatch_time(0, (uint64_t)(float)(v37 * 1000000000.0));
  v40 = dispatch_get_global_queue(0, 0);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke_472;
  v41[3] = &unk_1E5BBBD18;
  v41[4] = self;
  v42 = v3;
  dispatch_after(v39, v40, v41);

LABEL_42:
}

uint64_t __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(void *)(a1 + 40));
}

void __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke_472(uint64_t a1)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateDevicesOutOfRange])
  {
    id v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    id v3 = SFLocalizedStringForKey(@"UNLOCK_OUT_OF_RANGE");
    v31[0] = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v5 = [v2 errorWithDomain:@"SFAutoUnlockErrorDomain" code:130 userInfo:v4];
  }
  else
  {
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulatePhoneMissedFinalConfirmationToUnlock])
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      uint64_t v29 = @"Confirmation failed";
      id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v7 = v6;
      uint64_t v8 = 136;
    }
    else
    {
      if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateMagnetBreak])goto LABEL_10; {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      }
      uint64_t v26 = *MEMORY[0x1E4F28568];
      uint64_t v27 = @"Apple Watch Not Found";
      id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v7 = v9;
      uint64_t v8 = 131;
    }
    id v5 = [v7 errorWithDomain:@"SFAutoUnlockErrorDomain" code:v8 userInfo:v3];
  }

  if (v5)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(NSObject **)(v10 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke_479;
    block[3] = &unk_1E5BBBD18;
    void block[4] = v10;
    id v12 = v5;
    id v23 = v12;
    dispatch_async(v11, block);

    goto LABEL_13;
  }
LABEL_10:
  char v13 = auto_unlock_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5389000, v13, OS_LOG_TYPE_DEFAULT, "unlocked device", buf, 2u);
  }

  [*(id *)(a1 + 32) completedUnlockWithDevice:*(void *)(a1 + 40)];
  id v12 = 0;
LABEL_13:
  +[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateManualReLock];
  if (v14 > 0.0)
  {
    float v15 = v14;
    id v16 = auto_unlock_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v25 = v15;
      _os_log_impl(&dword_1A5389000, v16, OS_LOG_TYPE_DEFAULT, "delaying relock for %f sec", buf, 0xCu);
    }

    dispatch_time_t v17 = dispatch_time(0, (uint64_t)(float)(v15 * 1000000000.0));
    long long v18 = dispatch_get_global_queue(0, 0);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke_480;
    v20[3] = &unk_1E5BBBD18;
    char v19 = *(void **)(a1 + 40);
    v20[4] = *(void *)(a1 + 32);
    id v21 = v19;
    dispatch_after(v17, v18, v20);
  }
}

uint64_t __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke_479(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(void *)(a1 + 40));
}

uint64_t __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke_480(uint64_t a1)
{
  id v2 = auto_unlock_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_DEFAULT, "re-locking device", v4, 2u);
  }

  return [*(id *)(a1 + 32) deviceRequestedRelock:*(void *)(a1 + 40)];
}

- (void)prewarmAutoUnlock
{
  id v2 = +[SFCompanionXPCManager sharedManager];
  [v2 unlockManagerWithCompletionHandler:&__block_literal_global_482];
}

void __40__SFAutoUnlockManager_prewarmAutoUnlock__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = [a2 remoteObjectProxy];
    [v2 prewarmAutoUnlock];
  }
}

- (void)completeAutoUnlockWithNotification:(BOOL)a3
{
  id v4 = +[SFCompanionXPCManager sharedManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SFAutoUnlockManager_completeAutoUnlockWithNotification___block_invoke;
  v5[3] = &__block_descriptor_33_e60_v24__0___SFUnlockProtocol__NSXPCProxyCreating__8__NSError_16l;
  BOOL v6 = a3;
  [v4 unlockManagerWithCompletionHandler:v5];
}

void __58__SFAutoUnlockManager_completeAutoUnlockWithNotification___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 remoteObjectProxy];
    [v3 completeAutoUnlockWithNotification:*(unsigned __int8 *)(a1 + 32)];
  }
}

- (void)donateDeviceUnlockedWithMask:(BOOL)a3
{
  id v4 = +[SFCompanionXPCManager sharedManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SFAutoUnlockManager_donateDeviceUnlockedWithMask___block_invoke;
  v5[3] = &__block_descriptor_33_e60_v24__0___SFUnlockProtocol__NSXPCProxyCreating__8__NSError_16l;
  BOOL v6 = a3;
  [v4 unlockManagerWithCompletionHandler:v5];
}

void __52__SFAutoUnlockManager_donateDeviceUnlockedWithMask___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 remoteObjectProxy];
    if (objc_opt_respondsToSelector()) {
      [v3 donateDeviceUnlockedWithMask:*(unsigned __int8 *)(a1 + 32)];
    }
  }
}

- (void)declinedToEnablePhoneAutoUnlock
{
  id v2 = +[SFCompanionXPCManager sharedManager];
  [v2 unlockManagerWithCompletionHandler:&__block_literal_global_486];
}

void __54__SFAutoUnlockManager_declinedToEnablePhoneAutoUnlock__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = [a2 remoteObjectProxy];
    if (objc_opt_respondsToSelector()) {
      [v2 clearPhoneAutoUnlockNotification:1];
    }
  }
}

- (void)clearPhoneAutoUnlockBehaviorChangeNotification
{
  id v2 = +[SFCompanionXPCManager sharedManager];
  [v2 unlockManagerWithCompletionHandler:&__block_literal_global_490];
}

void __69__SFAutoUnlockManager_clearPhoneAutoUnlockBehaviorChangeNotification__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = [a2 remoteObjectProxy];
    if (objc_opt_respondsToSelector()) {
      [v2 clearPhoneAutoUnlockNotification:0];
    }
  }
}

- (void)attemptAutoUnlock
{
  if (+[SFAutoUnlockManager autoUnlockSupported])
  {
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
    {
      [(SFAutoUnlockManager *)self mockedAttemptAutoUnlock];
    }
    else
    {
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x2020000000;
      char v7 = 0;
      id v4 = +[SFCompanionXPCManager sharedManager];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_2;
      v5[3] = &unk_1E5BBD5F0;
      void v5[4] = self;
      v5[5] = v6;
      [v4 unlockManagerWithCompletionHandler:v5];

      _Block_object_dispose(v6, 8);
    }
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke;
    block[3] = &unk_1E5BBC870;
    void block[4] = self;
    dispatch_async(delegateQueue, block);
  }
}

void __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFAutoUnlockErrorDomain" code:115 userInfo:0];
  objc_msgSend(v1, "onDelegateQueue_notifyDelegateOfAttemptError:", v2);
}

void __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = v5;
  if (a2)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_3;
    v13[3] = &unk_1E5BBD5C8;
    long long v14 = *(_OWORD *)(a1 + 32);
    char v7 = [a2 remoteObjectProxyWithErrorHandler:v13];
    [v7 attemptAutoUnlockWithClientProxy:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(NSObject **)(v8 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_5;
    block[3] = &unk_1E5BBD5A0;
    uint64_t v12 = *(void *)(a1 + 40);
    void block[4] = v8;
    id v11 = v5;
    dispatch_async(v9, block);
    char v7 = v11;
  }
}

void __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_4;
  block[3] = &unk_1E5BBD5A0;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  void block[4] = v4;
  id v7 = v3;
  dispatch_async(v5, block);
}

uint64_t __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_4(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(void *)(result + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_5(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(void *)(result + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)attemptAutoUnlockWithoutNotifyingWatch
{
  if (+[SFAutoUnlockManager autoUnlockSupported])
  {
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
    {
      [(SFAutoUnlockManager *)self mockedAttemptAutoUnlock];
    }
    else
    {
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x2020000000;
      char v7 = 0;
      uint64_t v4 = +[SFCompanionXPCManager sharedManager];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_2;
      v5[3] = &unk_1E5BBD5F0;
      void v5[4] = self;
      v5[5] = v6;
      [v4 unlockManagerWithCompletionHandler:v5];

      _Block_object_dispose(v6, 8);
    }
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke;
    block[3] = &unk_1E5BBC870;
    void block[4] = self;
    dispatch_async(delegateQueue, block);
  }
}

void __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFAutoUnlockErrorDomain" code:115 userInfo:0];
  objc_msgSend(v1, "onDelegateQueue_notifyDelegateOfAttemptError:", v2);
}

void __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_3;
    v13[3] = &unk_1E5BBD5C8;
    long long v14 = *(_OWORD *)(a1 + 32);
    char v7 = [a2 remoteObjectProxyWithErrorHandler:v13];
    [v7 attemptAutoUnlockWithoutNotifyingWatchWithClientProxy:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(NSObject **)(v8 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_5;
    block[3] = &unk_1E5BBD5A0;
    uint64_t v12 = *(void *)(a1 + 40);
    void block[4] = v8;
    id v11 = v5;
    dispatch_async(v9, block);
    char v7 = v11;
  }
}

void __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_4;
  block[3] = &unk_1E5BBD5A0;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  void block[4] = v4;
  id v7 = v3;
  dispatch_async(v5, block);
}

uint64_t __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_4(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(void *)(result + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_5(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(void *)(result + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)attemptAutoUnlockForSiri
{
  if (+[SFAutoUnlockManager autoUnlockSupported])
  {
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
    {
      [(SFAutoUnlockManager *)self mockedAttemptAutoUnlock];
    }
    else
    {
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x2020000000;
      char v7 = 0;
      uint64_t v4 = +[SFCompanionXPCManager sharedManager];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_2;
      v5[3] = &unk_1E5BBD5F0;
      void v5[4] = self;
      v5[5] = v6;
      [v4 unlockManagerWithCompletionHandler:v5];

      _Block_object_dispose(v6, 8);
    }
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke;
    block[3] = &unk_1E5BBC870;
    void block[4] = self;
    dispatch_async(delegateQueue, block);
  }
}

void __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFAutoUnlockErrorDomain" code:115 userInfo:0];
  objc_msgSend(v1, "onDelegateQueue_notifyDelegateOfAttemptError:", v2);
}

void __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_3;
    v13[3] = &unk_1E5BBD5C8;
    long long v14 = *(_OWORD *)(a1 + 32);
    char v7 = [a2 remoteObjectProxyWithErrorHandler:v13];
    [v7 attemptAutoUnlockForSiriWithClientProxy:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(NSObject **)(v8 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_5;
    block[3] = &unk_1E5BBD5A0;
    uint64_t v12 = *(void *)(a1 + 40);
    void block[4] = v8;
    id v11 = v5;
    dispatch_async(v9, block);
    char v7 = v11;
  }
}

void __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_4;
  block[3] = &unk_1E5BBD5A0;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  void block[4] = v4;
  id v7 = v3;
  dispatch_async(v5, block);
}

uint64_t __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_4(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(void *)(result + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_5(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(void *)(result + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)mockedCancelUnlock
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateDevicesOutOfRange])
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    uint64_t v4 = SFLocalizedStringForKey(@"UNLOCK_OUT_OF_RANGE");
    v16[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v6 = [v3 errorWithDomain:@"SFAutoUnlockErrorDomain" code:130 userInfo:v5];
  }
  else
  {
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulatePhoneMissedFinalConfirmationToUnlock])
    {
      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      long long v14 = @"Confirmation failed";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      uint64_t v8 = v7;
      uint64_t v9 = 136;
    }
    else
    {
      if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateMagnetBreak])
      {
        uint64_t v6 = 0;
        goto LABEL_9;
      }
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F28568];
      uint64_t v12 = @"Apple Watch Not Found";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      uint64_t v8 = v10;
      uint64_t v9 = 131;
    }
    uint64_t v6 = [v8 errorWithDomain:@"SFAutoUnlockErrorDomain" code:v9 userInfo:v4];
  }

LABEL_9:
  [(SFAutoUnlockManager *)self failedUnlockWithError:v6];
}

- (void)cancelAutoUnlock
{
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
  {
    [(SFAutoUnlockManager *)self mockedCancelUnlock];
  }
  else
  {
    id v3 = +[SFCompanionXPCManager sharedManager];
    [v3 unlockManagerWithCompletionHandler:&__block_literal_global_492];
  }
}

void __39__SFAutoUnlockManager_cancelAutoUnlock__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = [a2 remoteObjectProxy];
    [v2 cancelAutoUnlock];
  }
}

+ (NSUserDefaults)userDefaults
{
  if (userDefaults_onceToken != -1) {
    dispatch_once(&userDefaults_onceToken, &__block_literal_global_494);
  }
  id v2 = (void *)userDefaults_userDefaults;

  return (NSUserDefaults *)v2;
}

void __35__SFAutoUnlockManager_userDefaults__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.sharing.autounlock"];
  uint64_t v1 = (void *)userDefaults_userDefaults;
  userDefaults_userDefaults = v0;
}

+ (BOOL)mockedPhoneAutoUnlockEnabled
{
  if (!IsAppleInternalBuild() || !_os_feature_enabled_impl()) {
    return 0;
  }
  id v2 = +[SFAutoUnlockManager userDefaults];
  char v3 = [v2 BOOLForKey:@"phoneAutoUnlockEnabled"];

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockInBioLockout
{
  BOOL v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled];
  if (v2)
  {
    char v3 = +[SFAutoUnlockManager userDefaults];
    char v4 = [v3 BOOLForKey:@"phoneAutoUnlockInBioLockout"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockFaceIDDisabled
{
  BOOL v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled];
  if (v2)
  {
    char v3 = +[SFAutoUnlockManager userDefaults];
    char v4 = [v3 BOOLForKey:@"phoneAutoUnlockFaceIDDisabled"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockNeverUnlocked
{
  BOOL v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled];
  if (v2)
  {
    char v3 = +[SFAutoUnlockManager userDefaults];
    char v4 = [v3 BOOLForKey:@"phoneAutoUnlockNeverUnlocked"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockMaskUnlikely
{
  BOOL v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled];
  if (v2)
  {
    char v3 = +[SFAutoUnlockManager userDefaults];
    char v4 = [v3 BOOLForKey:@"phoneAutoUnlockMaskUnlikely"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockNoMask
{
  BOOL v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled];
  if (v2)
  {
    char v3 = +[SFAutoUnlockManager userDefaults];
    char v4 = [v3 BOOLForKey:@"phoneAutoUnlockNoMask"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockWiFiOff
{
  BOOL v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled];
  if (v2)
  {
    char v3 = +[SFAutoUnlockManager userDefaults];
    char v4 = [v3 BOOLForKey:@"phoneAutoUnlockWiFiOff"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockAWDLUnavailable
{
  BOOL v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled];
  if (v2)
  {
    char v3 = +[SFAutoUnlockManager userDefaults];
    char v4 = [v3 BOOLForKey:@"phoneAutoUnlockAWDLUnavailable"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockNoWatch
{
  BOOL v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled];
  if (v2)
  {
    char v3 = +[SFAutoUnlockManager userDefaults];
    char v4 = [v3 BOOLForKey:@"phoneAutoUnlockNoWatch"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockNoPairedWatch
{
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
  {
    return 0;
  }
  BOOL v2 = +[SFAutoUnlockManager userDefaults];
  char v3 = [v2 BOOLForKey:@"phoneAutoUnlockNoPairedWatch"];

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchHasWeakPasscode
{
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
  {
    return 0;
  }
  BOOL v2 = +[SFAutoUnlockManager userDefaults];
  char v3 = [v2 BOOLForKey:@"phoneAutoUnlockWatchHasWeakPasscode"];

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchWristDetectionDisabled
{
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
  {
    return 0;
  }
  BOOL v2 = +[SFAutoUnlockManager userDefaults];
  char v3 = [v2 BOOLForKey:@"phoneAutoUnlockWatchWristDetectionDisabled"];

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchLocked
{
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
  {
    return 0;
  }
  BOOL v2 = +[SFAutoUnlockManager userDefaults];
  char v3 = [v2 BOOLForKey:@"phoneAutoUnlockWatchLocked"];

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchOffWrist
{
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
  {
    return 0;
  }
  BOOL v2 = +[SFAutoUnlockManager userDefaults];
  char v3 = [v2 BOOLForKey:@"phoneAutoUnlockWatchOffWrist"];

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchWiFiOff
{
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
  {
    return 0;
  }
  BOOL v2 = +[SFAutoUnlockManager userDefaults];
  char v3 = [v2 BOOLForKey:@"phoneAutoUnlockWatchWiFiOff"];

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchAWDLUnavailable
{
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
  {
    return 0;
  }
  BOOL v2 = +[SFAutoUnlockManager userDefaults];
  char v3 = [v2 BOOLForKey:@"phoneAutoUnlockWatchAWDLUnavailable"];

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchSleepModeOn
{
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
  {
    return 0;
  }
  BOOL v2 = +[SFAutoUnlockManager userDefaults];
  char v3 = [v2 BOOLForKey:@"phoneAutoUnlockWatchSleepModeOn"];

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchNoMotion
{
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
  {
    return 0;
  }
  BOOL v2 = +[SFAutoUnlockManager userDefaults];
  char v3 = [v2 BOOLForKey:@"phoneAutoUnlockWatchNoMotion"];

  return v3;
}

+ (float)mockedPhoneAutoUnlockSimulateLatency
{
  float v2 = 0.0;
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
  {
    char v3 = +[SFAutoUnlockManager userDefaults];
    [v3 floatForKey:@"phoneAutoUnlockSimulateLatency"];
    if (v4 != 0.0)
    {
      id v5 = +[SFAutoUnlockManager userDefaults];
      [v5 floatForKey:@"phoneAutoUnlockSimulateLatency"];
      float v2 = v6;
    }
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockSimulateDevicesOutOfRange
{
  BOOL v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled];
  if (v2)
  {
    char v3 = +[SFAutoUnlockManager userDefaults];
    char v4 = [v3 BOOLForKey:@"phoneAutoUnlockSimulateDevicesOutOfRange"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockSimulatePhoneMissedFinalConfirmationToUnlock
{
  BOOL v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled];
  if (v2)
  {
    char v3 = +[SFAutoUnlockManager userDefaults];
    char v4 = [v3 BOOLForKey:@"phoneAutoUnlockSimulatePhoneMissedFinalConfirmationToUnlock"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockSimulateMagnetBreak
{
  BOOL v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled];
  if (v2)
  {
    char v3 = +[SFAutoUnlockManager userDefaults];
    char v4 = [v3 BOOLForKey:@"phoneAutoUnlockSimulateMagnetBreak"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (float)mockedPhoneAutoUnlockSimulateManualReLock
{
  float v2 = 0.0;
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])
  {
    char v3 = +[SFAutoUnlockManager userDefaults];
    [v3 floatForKey:@"phoneAutoUnlockSimulateManualReLock"];
    if (v4 != 0.0)
    {
      id v5 = +[SFAutoUnlockManager userDefaults];
      [v5 floatForKey:@"phoneAutoUnlockSimulateManualReLock"];
      float v2 = v6;
    }
  }
  return v2;
}

+ (int64_t)mockedPhoneAutoUnlockSimulateErrorCode
{
  if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled])return 0; {
  float v2 = +[SFAutoUnlockManager userDefaults];
  }
  int64_t v3 = [v2 integerForKey:@"phoneAutoUnlockSimulateErrorCode"] != 0;

  return v3;
}

- (void)onDelegateQueue_notifyDelegateOfEnableError:(id)a3 device:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v10 code] != 118)
  {
    id v7 = [(SFAutoUnlockManager *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = [(SFAutoUnlockManager *)self delegate];
      [v9 manager:self failedToEnableDevice:v6 error:v10];
    }
  }
}

- (void)onDelegateQueue_notifyDelegateOfAttemptError:(id)a3
{
  id v7 = a3;
  float v4 = [(SFAutoUnlockManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SFAutoUnlockManager *)self delegate];
    [v6 manager:self failedAttemptWithError:v7];
  }
}

- (void)keyDeviceLocked:(id)a3
{
  id v4 = a3;
  char v5 = [(SFAutoUnlockManager *)self delegateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SFAutoUnlockManager_keyDeviceLocked___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __39__SFAutoUnlockManager_keyDeviceLocked___block_invoke(uint64_t a1)
{
  float v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 manager:*(void *)(a1 + 32) enablingLockedDevice:*(void *)(a1 + 40)];
  }
}

- (void)enabledDevice:(id)a3
{
  id v4 = a3;
  char v5 = [(SFAutoUnlockManager *)self delegateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__SFAutoUnlockManager_enabledDevice___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __37__SFAutoUnlockManager_enabledDevice___block_invoke(uint64_t a1)
{
  float v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 manager:*(void *)(a1 + 32) didEnableDevice:*(void *)(a1 + 40)];
  }
}

- (void)failedToEnableDevice:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SFAutoUnlockManager *)self delegateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SFAutoUnlockManager_failedToEnableDevice_error___block_invoke;
  block[3] = &unk_1E5BBD418;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __50__SFAutoUnlockManager_failedToEnableDevice_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onDelegateQueue_notifyDelegateOfEnableError:device:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)beganAttemptWithDevice:(id)a3
{
  id v4 = a3;
  char v5 = [(SFAutoUnlockManager *)self delegateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__SFAutoUnlockManager_beganAttemptWithDevice___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__SFAutoUnlockManager_beganAttemptWithDevice___block_invoke(uint64_t a1)
{
  float v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 manager:*(void *)(a1 + 32) beganAttemptWithDevice:*(void *)(a1 + 40)];
  }
}

- (void)completedUnlockWithDevice:(id)a3
{
  id v4 = a3;
  char v5 = [(SFAutoUnlockManager *)self delegateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SFAutoUnlockManager_completedUnlockWithDevice___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__SFAutoUnlockManager_completedUnlockWithDevice___block_invoke(uint64_t a1)
{
  float v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 manager:*(void *)(a1 + 32) completedUnlockWithDevice:*(void *)(a1 + 40)];
  }
}

- (void)failedUnlockWithError:(id)a3
{
  id v4 = a3;
  char v5 = [(SFAutoUnlockManager *)self delegateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SFAutoUnlockManager_failedUnlockWithError___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __45__SFAutoUnlockManager_failedUnlockWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(void *)(a1 + 40));
}

- (void)deviceRequestedRelock:(id)a3
{
  id v4 = a3;
  char v5 = [(SFAutoUnlockManager *)self delegateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SFAutoUnlockManager_deviceRequestedRelock___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__SFAutoUnlockManager_deviceRequestedRelock___block_invoke(uint64_t a1)
{
  float v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 manager:*(void *)(a1 + 32) deviceRequestedRelock:*(void *)(a1 + 40)];
  }
}

- (void)autoUnlockStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  char v5 = +[SFCompanionXPCManager sharedManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5BBD668;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 unlockManagerWithCompletionHandler:v7];
}

void __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_2;
    v15[3] = &unk_1E5BBD618;
    id v6 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v6;
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_4;
    v13[3] = &unk_1E5BBD640;
    id v14 = *(id *)(a1 + 40);
    [v7 autoUnlockStateWithCompletionHandler:v13];

    id v8 = v16;
  }
  else
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_5;
    block[3] = &unk_1E5BBC9C8;
    id v12 = *(id *)(a1 + 40);
    id v11 = v5;
    dispatch_async(v9, block);

    id v8 = v12;
  }
}

void __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E5BBC9C8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 integerValue], v5);
}

uint64_t __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)authPromptInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[SFCompanionXPCManager sharedManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5BBD668;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 unlockManagerWithCompletionHandler:v7];
}

void __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_2;
    v15[3] = &unk_1E5BBD618;
    id v6 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v6;
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_4;
    v13[3] = &unk_1E5BBD690;
    id v14 = *(id *)(a1 + 40);
    [v7 authPromptInfoWithCompletionHandler:v13];

    id v8 = v16;
  }
  else
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_5;
    block[3] = &unk_1E5BBC9C8;
    id v12 = *(id *)(a1 + 40);
    id v11 = v5;
    dispatch_async(v9, block);

    id v8 = v12;
  }
}

void __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E5BBC9C8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (SFAutoUnlockManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAutoUnlockManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)autoUnlockEnabled
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 138412802;
  id v4 = @"com.apple.sharing:/AutoUnlock/Enabled";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_debug_impl(&dword_1A5389000, log, OS_LOG_TYPE_DEBUG, "Dynamic store path: %@, uid: %@, enabled: %d", (uint8_t *)&v3, 0x1Cu);
}

- (void)eligibleAutoUnlockDevicesWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A5389000, log, OS_LOG_TYPE_ERROR, "eligibleAutoUnlockDevicesWithCompletionHandler: missing completion handler", v1, 2u);
}

- (void)disableAutoUnlockForDevice:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A5389000, log, OS_LOG_TYPE_ERROR, "disableAutoUnlockForDevice: missing completion handler", v1, 2u);
}

@end