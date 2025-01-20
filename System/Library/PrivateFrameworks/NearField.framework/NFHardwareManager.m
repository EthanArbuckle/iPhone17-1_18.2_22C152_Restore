@interface NFHardwareManager
+ (id)_sharedHardwareManagerWaitOnHWInit:(BOOL)a3;
+ (id)_sharedHardwareManagerWithNoUIWaitOnHWInit:(BOOL)a3;
+ (id)sharedHardwareManager;
+ (id)sharedHardwareManagerWithNoUI;
+ (void)sharedHardwareManager:(id)a3;
+ (void)sharedHardwareManagerWithNoUI:(id)a3;
+ (void)sharedHardwareManagerWithOptions:(id)a3 readyCompletion:(id)a4;
- (BOOL)_isHWReadyAndIfNotQueueClient:(id)a3;
- (BOOL)areFeaturesSupported:(unint64_t)a3 outError:(id *)a4;
- (BOOL)areSessionsAllowed;
- (BOOL)currentInMetroStatus:(id *)a3;
- (BOOL)expressModesEnabled;
- (BOOL)getHeadlessFactoryMode:(id *)a3;
- (BOOL)hasCard;
- (BOOL)isBackgroundTagReadingAvailable;
- (BOOL)isExpressAppletTypeSupported:(unsigned __int8)a3;
- (BOOL)isExpressModeSupported;
- (BOOL)isInRestrictedMode;
- (BOOL)preWarm;
- (BOOL)preWarm:(id *)a3;
- (BOOL)refreshSecureElementsWithError:(id *)a3;
- (BOOL)secureElementBootHistory:(id *)a3;
- (BOOL)setFieldDetectEnabled:(BOOL)a3;
- (BOOL)supportsCathay;
- (BOOL)suspendBackgroundTagReading;
- (BOOL)triggerCrash:(unsigned __int16)a3;
- (BOOL)triggerDelayedWake:(unsigned __int8)a3;
- (NFHardwareControllerInfo)controllerInfo;
- (NFHardwareManager)initWithType:(int64_t)a3;
- (NSUUID)blessedUser;
- (id)_sessionAttribute;
- (id)_startFieldDetectSession:(BOOL)a3 completion:(id)a4;
- (id)_startLoyaltyAndContactlessPaymentSession:(id)a3 force:(BOOL)a4;
- (id)_synchronousQueueSessionWithRetry:(id)a3 queueBlock:(id)a4;
- (id)cachedEmbeddedSecureElementSerialNumber:(id *)a3;
- (id)checkExpressPassCompatibility:(id)a3 error:(id *)a4;
- (id)configureHeadlessFactoryMode:(BOOL)a3;
- (id)connectToXPCManager:(BOOL)a3;
- (id)controllerInfoWithError:(id *)a3;
- (id)disableHeadless;
- (id)disableLPEMFeature:(unint64_t)a3;
- (id)enableHeadlessTestMode:(unsigned __int16)a3;
- (id)enableLPEMFeature:(unint64_t)a3;
- (id)expressPassConfigsWithError:(id *)a3;
- (id)forceLoyaltyAndContactlessPaymentSession:(id)a3;
- (id)getDieID;
- (id)getDieIDWithError:(id *)a3;
- (id)getFlashWriteCounters:(id *)a3;
- (id)getHeadlessModeFlags:(unsigned int *)a3;
- (id)getLPEMFTALogging:(id *)a3;
- (id)getPowerCounters:(id *)a3;
- (id)getRadioEnabledSetting:(BOOL *)a3;
- (id)getRadioEnabledState:(int64_t *)a3;
- (id)getReaderProhibitTimerInfoSERmRunning:(BOOL *)a3 hostRmRunning:(BOOL *)a4 remainingInMs:(unsigned int *)a5;
- (id)getTemperature:(double *)a3;
- (id)getUniqueFDRKey:(id *)a3;
- (id)hostEmulationLog;
- (id)pushSignedRF:(id)a3;
- (id)releaseAssertion:(id)a3;
- (id)releaseSinglePollExpressModeAssertion;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)requestAssertion:(unint64_t)a3 error:(id *)a4;
- (id)rfSettings;
- (id)secureElementWithIdentifier:(id)a3;
- (id)secureElementWithIdentifier:(id)a3 error:(id *)a4;
- (id)secureElements;
- (id)secureElementsWithError:(id *)a3;
- (id)setAntiRelayRID:(id)a3;
- (id)setChipscope:(BOOL)a3;
- (id)setRadioEnabledSetting:(BOOL)a3;
- (id)startContactlessPaymentSession:(id)a3;
- (id)startContactlessSession:(id)a3;
- (id)startCredentialSession:(id)a3;
- (id)startDigitalCarKeySession:(id)a3;
- (id)startECommercePaymentSession:(id)a3;
- (id)startFieldDetectSession:(id)a3;
- (id)startHCESession:(id)a3;
- (id)startHCESessionWithConfiguration:(id)a3 completion:(id)a4;
- (id)startHandoverHybridSessionWithCompletion:(id)a3;
- (id)startLPEMConfigSession:(id)a3;
- (id)startLoyaltyAndContactlessPaymentSession:(id)a3;
- (id)startNdefTagSession:(id)a3;
- (id)startNdefTagSessionWithBluetoothLESecureOOBData:(id)a3 callback:(id)a4;
- (id)startPeerPaymentSession:(id)a3;
- (id)startReaderSession:(id)a3;
- (id)startReaderSessionWithActionSheetUI:(id)a3;
- (id)startReaderSessionWithAttributes:(id)a3 completion:(id)a4;
- (id)startSecureElementAndHCESession:(id)a3;
- (id)startSecureElementAndHCESessionWithConfiguration:(id)a3 completion:(id)a4;
- (id)startSecureElementLoggingSession:(id)a3;
- (id)startSecureElementManagerSession:(id)a3;
- (id)startSecureElementManagerSessionWithAttributes:(id)a3 completion:(id)a4;
- (id)startSecureElementManagerSessionWithPriority:(BOOL)a3 callback:(id)a4;
- (id)startSecureElementManagerSessionWithPriority:(id)a3;
- (id)startSecureElementReaderSession:(id)a3;
- (id)startSecureTransactionServicesSessionWithRole:(unint64_t)a3 connectionHandoverCofig:(unint64_t)a4 completion:(id)a5;
- (id)startSesHatSession:(id)a3;
- (id)startSinglePollExpressModeAssertion:(double)a3;
- (id)startTrustSession:(id)a3;
- (id)startUnfilteredFieldDetectSession:(id)a3;
- (id)startUnifiedAccessSession:(id)a3;
- (id)stateInfo:(id *)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)toggleGPIO:(unsigned __int16)a3;
- (id)updateHWSupportWithXPC:(id)a3 waitForInit:(BOOL)a4;
- (id)validateExpressPassCompatibilityWithConfig:(id)a3 outError:(id *)a4;
- (int64_t)expressModeControlState;
- (unsigned)checkUserBlessing:(id)a3;
- (unsigned)checkUserBlessing:(id)a3 hasCards:(BOOL *)a4;
- (unsigned)getHwSupport;
- (unsigned)queryHardwareSupport:(id *)a3;
- (unsigned)setBlessedUser:(id)a3 keybagUUID:(id)a4 withAuthorization:(id)a5;
- (unsigned)setBlessedUser:(id)a3 withAuthorization:(id)a4;
- (void)_initSEDictionaryWithSEInfoList:(id)a3;
- (void)actOnUserInitiatedSystemShutDown:(unsigned int)a3 completion:(id)a4;
- (void)configureReaderModeRFForTransitPartner:(BOOL)a3 transitPartner:(unsigned int)a4 callback:(id)a5;
- (void)didChangeRadioState:(BOOL)a3;
- (void)didInterrupt:(id)a3;
- (void)didInvalidate;
- (void)dumpLPMDebugLog;
- (void)hwStateDidChange:(unsigned int)a3;
- (void)invalidateConnection;
- (void)listenForNfcdStartup;
- (void)refreshSecureElements;
- (void)registerEventListener:(id)a3;
- (void)registerForRemoteCallbacks;
- (void)secureElementWithIdentifier:(id)a3 didChangeRestrictedMode:(BOOL)a4;
- (void)sessionDidEnd:(id)a3;
- (void)setAuthorization:(id)a3;
- (void)setSuspendBackgroundTagReading:(BOOL)a3;
- (void)stopListeningForNfcdRestart;
- (void)temperatureChanged:(double)a3;
- (void)unregisterEventListener:(id)a3;
- (void)unregisterForRemoteCallbacks;
@end

@implementation NFHardwareManager

- (void)temperatureChanged:(double)a3
{
  callbackQueue = self->_callbackQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__NFHardwareManager_temperatureChanged___block_invoke;
  v4[3] = &unk_1E595C698;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(callbackQueue, v4);
}

- (BOOL)areFeaturesSupported:(unint64_t)a3 outError:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v8 = _os_activity_create(&dword_19D636000, "areFeaturesSupported:outError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  if (!a3)
  {
    if (!a4) {
      return 0;
    }
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    v14 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v15 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v34[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    *a4 = (id)[v13 initWithDomain:v14 code:10 userInfo:v16];
LABEL_35:

    return 0;
  }
  BOOL result = 0;
  if (a3 <= 0xFFF && (a3 & 0xFFF) != 0)
  {
    v10 = [(NFHardwareManager *)self controllerInfo];
    v11 = v10;
    if ((a3 & 2) != 0)
    {
      int v12 = [v10 hasAntenna];
      if ((a3 & 4) == 0) {
        goto LABEL_13;
      }
    }
    else
    {
      int v12 = 1;
      if ((a3 & 4) == 0) {
        goto LABEL_13;
      }
    }
    int v17 = [v11 hasAntenna];
    if (v12) {
      int v12 = v17;
    }
    else {
      int v12 = 0;
    }
LABEL_13:
    if ((a3 & 0x200) != 0)
    {
      int v24 = [v11 hasAntenna];
      if (v24) {
        int v24 = [(NFHardwareManager *)self supportsCathay];
      }
      v12 &= v24;
      if ((a3 & 8) == 0)
      {
LABEL_15:
        if ((a3 & 0x20) == 0) {
          goto LABEL_19;
        }
        goto LABEL_16;
      }
    }
    else if ((a3 & 8) == 0)
    {
      goto LABEL_15;
    }
    int v25 = [v11 hasAntenna];
    if (v12) {
      int v12 = v25;
    }
    else {
      int v12 = 0;
    }
    if ((a3 & 0x20) == 0)
    {
LABEL_19:
      if ((a3 & 0x410) != 0)
      {
        int v19 = [v11 hasAntenna];
        if (v12) {
          int v12 = v19;
        }
        else {
          int v12 = 0;
        }
      }
      if ((a3 & 0x800) != 0)
      {
        int v26 = [v11 hasAntenna];
        if (v12) {
          int v12 = v26;
        }
        else {
          int v12 = 0;
        }
        if ((a3 & 0x40) == 0)
        {
LABEL_25:
          if ((a3 & 0x80) == 0) {
            goto LABEL_26;
          }
          goto LABEL_54;
        }
      }
      else if ((a3 & 0x40) == 0)
      {
        goto LABEL_25;
      }
      int v27 = [v11 hasAntenna];
      if (v12) {
        int v12 = v27;
      }
      else {
        int v12 = 0;
      }
      if ((a3 & 0x80) == 0)
      {
LABEL_26:
        if ((a3 & 0x100) == 0) {
          goto LABEL_27;
        }
        goto LABEL_58;
      }
LABEL_54:
      int v28 = [v11 hasLPEMSupport];
      if (v12) {
        int v12 = v28;
      }
      else {
        int v12 = 0;
      }
      if ((a3 & 0x100) == 0)
      {
LABEL_27:
        if ((a3 & 1) == 0)
        {
LABEL_31:

          BOOL result = v12 != 0;
          goto LABEL_32;
        }
LABEL_28:
        int v20 = [v11 hasReaderModeSupport];
        if (v12) {
          int v12 = v20;
        }
        else {
          int v12 = 0;
        }
        goto LABEL_31;
      }
LABEL_58:
      int v29 = [v11 hasCarKeySupport];
      if (v12) {
        int v12 = v29;
      }
      else {
        int v12 = 0;
      }
      if ((a3 & 1) == 0) {
        goto LABEL_31;
      }
      goto LABEL_28;
    }
LABEL_16:
    int v18 = [v11 hasAntenna];
    if (v12) {
      int v12 = v18;
    }
    else {
      int v12 = 0;
    }
    goto LABEL_19;
  }
LABEL_32:
  if (a4 && !result)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
    v14 = [NSString stringWithUTF8String:"nfcd"];
    v31[0] = *MEMORY[0x1E4F28568];
    v15 = [NSString stringWithUTF8String:"Feature Not Supported"];
    v32[0] = v15;
    v32[1] = &unk_1EEF359E0;
    v31[1] = @"Line";
    v31[2] = @"Method";
    v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
    v32[2] = v16;
    v31[3] = *MEMORY[0x1E4F28228];
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 2677);
    v32[3] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];
    *a4 = (id)[v21 initWithDomain:v14 code:14 userInfo:v23];

    goto LABEL_35;
  }
  return result;
}

void __38__NFHardwareManager_hwStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(a1 + 48);
  int v5 = *(_DWORD *)(v3 + 84);
  if (*(_DWORD *)(v3 + 80) == v4 && v5 == v4)
  {
    int v22 = *(_DWORD *)(v3 + 84);
  }
  else
  {
    v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v9(6, "%c[%{public}s %{public}s]:%i %d -> %d", v14, ClassName, Name, 1496, *(unsigned int *)(*(void *)(a1 + 32) + 80), *(unsigned int *)(a1 + 48));
    }
    dispatch_get_specific(*v7);
    v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      int v18 = object_getClassName(*(id *)(a1 + 32));
      int v19 = sel_getName(*(SEL *)(a1 + 40));
      int v20 = *(_DWORD *)(*(void *)(a1 + 32) + 80);
      int v21 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 67110402;
      int v49 = v17;
      __int16 v50 = 2082;
      v51 = v18;
      __int16 v52 = 2082;
      v53 = v19;
      __int16 v54 = 1024;
      int v55 = 1496;
      __int16 v56 = 1024;
      int v57 = v20;
      __int16 v58 = 1024;
      int v59 = v21;
      _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %d -> %d", buf, 0x2Eu);
    }

    int v22 = *(_DWORD *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  *(_DWORD *)(v3 + 80) = v22;
  if (*(_DWORD *)(a1 + 48) == 2)
  {
    v23 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
    [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  }
  else
  {
    v23 = 0;
  }
  if (v5 == v4)
  {
    objc_sync_exit(v2);
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 84) = *(_DWORD *)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 32);
    int v25 = *(void **)(v24 + 16);
    *(void *)(v24 + 16) = 0;

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v26 = *(id *)(*(void *)(a1 + 32) + 32);
    uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v31 hardwareStateDidChange];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v28);
    }

    objc_sync_exit(v2);
    id v32 = (id)[*(id *)(a1 + 32) controllerInfo];
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v33 = v23;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v39 != v36) {
          objc_enumerationMutation(v33);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v38 + 1) + 8 * j) + 16))();
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v35);
  }
}

void __40__NFHardwareManager_temperatureChanged___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "temperatureChanged:", *(double *)(a1 + 40), (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);
}

- (NFHardwareControllerInfo)controllerInfo
{
  return (NFHardwareControllerInfo *)[(NFHardwareManager *)self controllerInfoWithError:0];
}

- (id)controllerInfoWithError:(id *)a3
{
  uint64_t v6 = _os_activity_create(&dword_19D636000, "controllerInfoWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v7 = self;
  objc_sync_enter(v7);
  controllerInfo = v7->_controllerInfo;
  if (controllerInfo)
  {
    long long v9 = controllerInfo;
    objc_sync_exit(v7);
  }
  else
  {
    objc_sync_exit(v7);

    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__6;
    uint64_t v24 = __Block_byref_object_dispose__6;
    id v25 = 0;
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    int v18 = __Block_byref_object_copy__6;
    int v19 = __Block_byref_object_dispose__6;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__NFHardwareManager_controllerInfoWithError___block_invoke;
    v14[3] = &unk_1E595CBD0;
    v14[5] = &v15;
    v14[6] = a2;
    v14[4] = v7;
    long long v10 = [(NFHardwareManager *)v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__NFHardwareManager_controllerInfoWithError___block_invoke_69;
    v13[3] = &unk_1E595D8C0;
    v13[4] = v7;
    v13[5] = &v15;
    v13[6] = &state;
    v13[7] = a2;
    [v10 controllerInfoWithCompletion:v13];

    if (a3) {
      *a3 = (id) v16[5];
    }
    long long v11 = v7;
    objc_sync_enter(v11);
    objc_storeStrong((id *)&v7->_controllerInfo, *(id *)(state.opaque[1] + 40));
    objc_sync_exit(v11);

    long long v9 = (NFHardwareControllerInfo *)*(id *)(state.opaque[1] + 40);
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&state, 8);
  }
  return v9;
}

+ (id)sharedHardwareManager
{
  return (id)[a1 _sharedHardwareManagerWaitOnHWInit:1];
}

+ (id)_sharedHardwareManagerWaitOnHWInit:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1EB4D1FA0 != -1) {
    dispatch_once(&qword_1EB4D1FA0, &__block_literal_global_1);
  }
  id v4 = (id)[(id)_MergedGlobals_15 connectToXPCManager:v3];
  uint64_t v5 = (void *)_MergedGlobals_15;
  return v5;
}

- (id)cachedEmbeddedSecureElementSerialNumber:(id *)a3
{
  uint64_t v5 = _os_activity_create(&dword_19D636000, "cachedEmbeddedSecureElementSerialNumber", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__6;
  uint64_t v28 = __Block_byref_object_dispose__6;
  id v29 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  uint64_t v6 = *MEMORY[0x1E4F281F8];
  char v7 = 1;
  do
  {
    v8 = *(void **)(state.opaque[1] + 40);
    *(void *)(state.opaque[1] + 40) = 0;

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__NFHardwareManager_cachedEmbeddedSecureElementSerialNumber___block_invoke;
    v18[3] = &unk_1E595CBD0;
    v18[5] = &state;
    v18[6] = a2;
    v18[4] = self;
    long long v9 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v18];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__NFHardwareManager_cachedEmbeddedSecureElementSerialNumber___block_invoke_133;
    v17[3] = &unk_1E595DD08;
    v17[4] = &state;
    v17[5] = &v19;
    [v9 cachedEmbeddedSecureElementSerialNumber:v17];

    long long v10 = *(void **)(state.opaque[1] + 40);
    if (!v10) {
      break;
    }
    long long v11 = [v10 domain];
    if (([v11 isEqualToString:v6] & 1) == 0)
    {

      break;
    }
    BOOL v12 = [*(id *)(state.opaque[1] + 40) code] == 4097;

    char v13 = v7 & v12;
    char v7 = 0;
  }
  while ((v13 & 1) != 0);
  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  id v14 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&state, 8);
  return v14;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void *))a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  char v7 = [(NFHardwareManager *)v6 connectToXPCManager:0];
  v8 = v7;
  if (v7)
  {
    long long v9 = [v7 connection];
    BOOL v3 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v5];
  }
  objc_sync_exit(v6);

  if (!v8)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    long long v11 = [NSString stringWithUTF8String:"nf.fwk"];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = @"No connection to nfcd";
    BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    char v13 = (void *)[v10 initWithDomain:v11 code:0 userInfo:v12];
    v5[2](v5, v13);

    BOOL v3 = 0;
  }

  return v3;
}

- (id)connectToXPCManager:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  unsigned int hwSupport = v4->_hwSupport;
  if (v4->_xpc)
  {
    if (hwSupport == 1)
    {
      uint64_t v6 = NFSharedSignpostLog();
      if (os_signpost_enabled(v6))
      {
        int v18 = 67109120;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_19D636000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConnectToXPCManager", "hwSupport=unknown, waitForHwInit=%u", (uint8_t *)&v18, 8u);
      }

      goto LABEL_10;
    }
  }
  else if (hwSupport != 4)
  {
    char v7 = NFSharedSignpostLog();
    if (os_signpost_enabled(v7))
    {
      unsigned int v8 = v4->_hwSupport;
      int v18 = 67109376;
      BOOL v19 = v8;
      __int16 v20 = 1024;
      BOOL v21 = v3;
      _os_signpost_emit_with_name_impl(&dword_19D636000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConnectToXPCManager", "hwSupport=%u, waitForHwInit=%u", (uint8_t *)&v18, 0xEu);
    }

    long long v9 = [NFXPCServiceClient alloc];
    id v10 = +[NFHardwareManagerInterface interface]();
    uint64_t v11 = [(NFXPCServiceClient *)v9 initWithService:@"com.apple.nfcd.hwmanager" remoteObjectInterface:v10 exportedInterface:0 exportedObject:0 xpcDispatchQueue:v4->_xpcQueue];
    xpc = v4->_xpc;
    v4->_xpc = (NFXPCServiceClient *)v11;

    [(NFXPCServiceClient *)v4->_xpc addDelegate:v4];
    if (!v4->_xpc)
    {
      char v13 = 0;
      goto LABEL_11;
    }
LABEL_10:
    [(NFHardwareManager *)v4 registerForRemoteCallbacks];
    char v13 = v4->_xpc;
LABEL_11:
    id v14 = [(NFHardwareManager *)v4 updateHWSupportWithXPC:v13 waitForInit:v3];
  }
  if (![(NSMutableSet *)v4->_eventListeners count])
  {
    unsigned int v15 = v4->_hwSupport;
    if (v15 == 4 || v15 == 2) {
      [(NFHardwareManager *)v4 unregisterForRemoteCallbacks];
    }
  }
  v16 = v4->_xpc;
  objc_sync_exit(v4);

  return v16;
}

- (void)unregisterForRemoteCallbacks
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_hasEventListener)
  {
    id v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 291);
    }
    dispatch_get_specific(*v4);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v19 = v13;
      __int16 v20 = 2082;
      BOOL v21 = object_getClassName(self);
      __int16 v22 = 2082;
      v23 = sel_getName(a2);
      __int16 v24 = 1024;
      int v25 = 291;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    self->_hasEventListener = 0;
    id v14 = [(NFXPCServiceClient *)self->_xpc connection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __49__NFHardwareManager_unregisterForRemoteCallbacks__block_invoke;
    v17[3] = &unk_1E595C648;
    v17[4] = self;
    v17[5] = a2;
    unsigned int v15 = [v14 remoteObjectProxyWithErrorHandler:v17];
    [v15 unregisterForCallbacks:self];
  }
}

- (id)updateHWSupportWithXPC:(id)a3 waitForInit:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__6;
  BOOL v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  unsigned int v8 = self;
  objc_sync_enter(v8);
  if (v7)
  {
    long long v9 = [v7 connection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke;
    v16[3] = &unk_1E595CBD0;
    v16[5] = &v17;
    v16[6] = a2;
    v16[4] = v8;
    uint64_t v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke_54;
    v15[3] = &unk_1E595CBD0;
    v15[5] = &v17;
    v15[6] = a2;
    v15[4] = v8;
    uint64_t v10 = [(NFHardwareManager *)v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  }
  if (v18[5])
  {
    [(NFHardwareManager *)v8 listenForNfcdStartup];
  }
  else if (v4)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke_55;
    v14[3] = &unk_1E595D7F8;
    v14[4] = v8;
    v14[5] = a2;
    [v10 waitForHWSupportedWithCompletion:v14];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke_58;
    v13[3] = &unk_1E595D7F8;
    v13[4] = v8;
    v13[5] = a2;
    [v10 isHWSupportedWithCompletion:v13];
  }

  objc_sync_exit(v8);
  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (void)registerForRemoteCallbacks
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v4 = _os_activity_create(&dword_19D636000, "registerForRemoteCallbacks", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)os_activity_scope_state_s state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v4, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  if (!self->_hasEventListener)
  {
    uint64_t v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 277);
    }
    dispatch_get_specific(*v5);
    BOOL v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      unsigned int v15 = object_getClassName(self);
      v16 = sel_getName(a2);
      *(_DWORD *)os_activity_scope_state_s state = 67109890;
      *(_DWORD *)&state[4] = v14;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v15;
      __int16 v22 = 2082;
      v23 = v16;
      __int16 v24 = 1024;
      int v25 = 277;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", state, 0x22u);
    }

    self->_hasEventListener = 1;
    uint64_t v17 = [(NFXPCServiceClient *)self->_xpc connection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __47__NFHardwareManager_registerForRemoteCallbacks__block_invoke;
    v20[3] = &unk_1E595C648;
    v20[4] = self;
    v20[5] = a2;
    int v18 = [v17 remoteObjectProxyWithErrorHandler:v20];
    [v18 registerForCallbacks:self];
  }
}

- (void)_initSEDictionaryWithSEInfoList:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v17 = self;
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          BOOL v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
          id v13 = [[NFSecureElement alloc] _initWithInfo:v12];
          [v5 addObject:v13];
          int v14 = [v12 identifier];
          [v6 addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v5 forKeys:v6];
    secureElementsById = v17->_secureElementsById;
    v17->_secureElementsById = (NSDictionary *)v15;
  }
}

+ (id)sharedHardwareManagerWithNoUI
{
  return (id)[a1 _sharedHardwareManagerWithNoUIWaitOnHWInit:1];
}

- (void)hwStateDidChange:(unsigned int)a3
{
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__NFHardwareManager_hwStateDidChange___block_invoke;
  block[3] = &unk_1E595DC90;
  unsigned int v5 = a3;
  block[4] = self;
  block[5] = a2;
  dispatch_async(callbackQueue, block);
}

- (id)secureElementWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  secureElementsById = v7->_secureElementsById;
  if (secureElementsById)
  {
    id v9 = [(NSDictionary *)secureElementsById objectForKey:v6];
    objc_sync_exit(v7);
  }
  else
  {
    objc_sync_exit(v7);

    [(NFHardwareManager *)v7 secureElementsWithError:a4];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = (id)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v10);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          int v14 = objc_msgSend(v13, "info", (void)v18);
          uint64_t v15 = [v14 identifier];
          char v16 = [v15 isEqualToString:v6];

          if (v16)
          {
            id v9 = v13;
            goto LABEL_13;
          }
        }
        id v9 = (id)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v9;
}

- (id)secureElementsWithError:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__6;
  id v29 = __Block_byref_object_dispose__6;
  id v30 = 0;
  unsigned int v5 = self;
  objc_sync_enter(v5);
  if (!v5->_secureElementsById)
  {
    uint64_t v19 = 0;
    long long v20 = &v19;
    uint64_t v21 = 0x3032000000;
    __int16 v22 = __Block_byref_object_copy__6;
    uint64_t v23 = __Block_byref_object_dispose__6;
    id v24 = 0;
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    char v7 = 1;
    do
    {
      uint64_t v8 = (void *)v26[5];
      v26[5] = 0;

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __45__NFHardwareManager_secureElementsWithError___block_invoke;
      v18[3] = &unk_1E595CBD0;
      v18[5] = &v25;
      v18[6] = a2;
      v18[4] = v5;
      id v9 = [(NFHardwareManager *)v5 synchronousRemoteObjectProxyWithErrorHandler:v18];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __45__NFHardwareManager_secureElementsWithError___block_invoke_131;
      v17[3] = &unk_1E595DCE0;
      v17[4] = &v19;
      [v9 secureElementsWithCompletion:v17];

      id v10 = (void *)v26[5];
      if (!v10) {
        break;
      }
      uint64_t v11 = [v10 domain];
      if (([v11 isEqualToString:v6] & 1) == 0)
      {

        break;
      }
      BOOL v12 = [(id)v26[5] code] == 4097;

      char v13 = v7 & v12;
      char v7 = 0;
    }
    while ((v13 & 1) != 0);
    -[NFHardwareManager _initSEDictionaryWithSEInfoList:](v5, "_initSEDictionaryWithSEInfoList:", v20[5], a3);
    _Block_object_dispose(&v19, 8);

    a3 = v16;
  }
  if (a3) {
    *a3 = (id) v26[5];
  }
  int v14 = [(NSDictionary *)v5->_secureElementsById allValues];
  objc_sync_exit(v5);

  _Block_object_dispose(&v25, 8);
  return v14;
}

uint64_t __56__NFHardwareManager__sharedHardwareManagerWaitOnHWInit___block_invoke()
{
  _MergedGlobals_15 = [[NFHardwareManager alloc] initWithType:0];
  return MEMORY[0x1F41817F8]();
}

- (NFHardwareManager)initWithType:(int64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)NFHardwareManager;
  id v4 = [(NFHardwareManager *)&v19 init];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v6 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v8 = (void *)*((void *)v4 + 4);
    *((void *)v4 + 4) = v7;

    *((void *)v4 + 10) = 0x100000001;
    *((void *)v4 + 11) = a3;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = (void *)*((void *)v4 + 6);
    *((void *)v4 + 6) = v9;

    *((_DWORD *)v4 + 24) = -1;
    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.nearfield.callbacks", v11);
    char v13 = (void *)*((void *)v4 + 7);
    *((void *)v4 + 7) = v12;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v4 + 7), (const void *)*MEMORY[0x1E4FBA898], 0, 0);
    int v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.nearfield.nfcd.xpc", v15);
    uint64_t v17 = (void *)*((void *)v4 + 9);
    *((void *)v4 + 9) = v16;
  }
  return (NFHardwareManager *)v4;
}

- (id)requestAssertion:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = _os_activity_create(&dword_19D636000, "requestAssertion:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__6;
  uint64_t v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__6;
  long long v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__NFHardwareManager_requestAssertion_error___block_invoke;
  v13[3] = &unk_1E595CBD0;
  v13[5] = &state;
  void v13[6] = a2;
  v13[4] = self;
  id v9 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__NFHardwareManager_requestAssertion_error___block_invoke_102;
  v12[3] = &unk_1E595DC68;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &state;
  v12[7] = a2;
  [v9 requestAssertion:a3 completion:v12];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&state, 8);
  return v10;
}

+ (void)sharedHardwareManagerWithNoUI:(id)a3
{
}

+ (id)_sharedHardwareManagerWithNoUIWaitOnHWInit:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1EB4D1FB0 != -1) {
    dispatch_once(&qword_1EB4D1FB0, &__block_literal_global_16);
  }
  id v4 = (id)[(id)qword_1EB4D1FA8 connectToXPCManager:v3];
  id v5 = (void *)qword_1EB4D1FA8;
  return v5;
}

uint64_t __64__NFHardwareManager__sharedHardwareManagerWithNoUIWaitOnHWInit___block_invoke()
{
  qword_1EB4D1FA8 = [[NFHardwareManager alloc] initWithType:1];
  return MEMORY[0x1F41817F8]();
}

+ (void)sharedHardwareManager:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [a1 sharedHardwareManagerWithOptions:v5 readyCompletion:v4];
}

+ (void)sharedHardwareManagerWithOptions:(id)a3 readyCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"UIPopup"];
  id v9 = v8;
  if (v8) {
    int v10 = [v8 BOOLValue];
  }
  else {
    int v10 = 1;
  }
  uint64_t v11 = [v6 objectForKeyedSubscript:@"forceCompletionOnCBQueue"];
  dispatch_queue_t v12 = v11;
  if (v11) {
    int v13 = [v11 BOOLValue];
  }
  else {
    int v13 = 0;
  }
  if (v10) {
    [a1 _sharedHardwareManagerWaitOnHWInit:0];
  }
  else {
  uint64_t v14 = [a1 _sharedHardwareManagerWithNoUIWaitOnHWInit:0];
  }
  if ([v14 _isHWReadyAndIfNotQueueClient:v7])
  {
    if (v13)
    {
      uint64_t v15 = v14[7];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __70__NFHardwareManager_sharedHardwareManagerWithOptions_readyCompletion___block_invoke;
      v16[3] = &unk_1E595D540;
      id v18 = v7;
      uint64_t v17 = v14;
      dispatch_async(v15, v16);
    }
    else
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v14);
    }
  }
}

uint64_t __70__NFHardwareManager_sharedHardwareManagerWithOptions_readyCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)_isHWReadyAndIfNotQueueClient:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  unsigned int hwSupport = v5->_hwSupport;
  if (hwSupport != 2)
  {
    waitingClients = v5->_waitingClients;
    uint64_t v8 = (void *)MEMORY[0x19F3A96D0](v4);
    [(NSMutableArray *)waitingClients addObject:v8];
  }
  objc_sync_exit(v5);

  return hwSupport == 2;
}

- (void)listenForNfcdStartup
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  p_int listeningForNfcdStartedNtf = &self->_listeningForNfcdStartedNtf;
  if (self->_listeningForNfcdStartedNtf == -1)
  {
    listeningQueue = self->_listeningQueue;
    id v6 = (const void **)MEMORY[0x1E4FBA898];
    if (!listeningQueue)
    {
      id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      uint64_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
      id v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.nearfield.nfcd.listener", v8);
      int v10 = self->_listeningQueue;
      self->_listeningQueue = v9;

      dispatch_queue_set_specific((dispatch_queue_t)self->_listeningQueue, *v6, 0, 0);
      listeningQueue = self->_listeningQueue;
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __41__NFHardwareManager_listenForNfcdStartup__block_invoke;
    handler[3] = &unk_1E595D7B0;
    handler[4] = self;
    uint64_t v11 = notify_register_dispatch("com.apple.nfcd.started", p_listeningForNfcdStartedNtf, listeningQueue, handler);
    dispatch_get_specific(*v6);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v18 = 45;
      if (isMetaClass) {
        uint64_t v18 = 43;
      }
      v13(6, "%c[%{public}s %{public}s]:%i Listening for startup NTF : %d (token %d)", v18, ClassName, Name, 213, v11, self->_listeningForNfcdStartedNtf);
    }
    dispatch_get_specific(*v6);
    id v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = object_getClass(self);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      __int16 v22 = object_getClassName(self);
      uint64_t v23 = sel_getName(a2);
      int listeningForNfcdStartedNtf = self->_listeningForNfcdStartedNtf;
      *(_DWORD *)buf = 67110402;
      int v27 = v21;
      __int16 v28 = 2082;
      id v29 = v22;
      __int16 v30 = 2082;
      v31 = v23;
      __int16 v32 = 1024;
      int v33 = 213;
      __int16 v34 = 1024;
      int v35 = v11;
      __int16 v36 = 1024;
      int v37 = listeningForNfcdStartedNtf;
      _os_log_impl(&dword_19D636000, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Listening for startup NTF : %d (token %d)", buf, 0x2Eu);
    }
  }
}

id __41__NFHardwareManager_listenForNfcdStartup__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i Received startup NTF", "-[NFHardwareManager listenForNfcdStartup]_block_invoke", 207);
  }
  dispatch_get_specific(*v2);
  id v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v7 = "-[NFHardwareManager listenForNfcdStartup]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 207;
    _os_log_impl(&dword_19D636000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Received startup NTF", buf, 0x12u);
  }

  [*(id *)(a1 + 32) stopListeningForNfcdRestart];
  return (id)[*(id *)(a1 + 32) connectToXPCManager:0];
}

- (void)stopListeningForNfcdRestart
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_listeningForNfcdStartedNtf != -1)
  {
    id v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(6, "%c[%{public}s %{public}s]:%i Stop listening for startup NTF", v10, ClassName, Name, 220);
    }
    dispatch_get_specific(*v4);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v12 = object_getClass(self);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v16 = v13;
      __int16 v17 = 2082;
      uint64_t v18 = object_getClassName(self);
      __int16 v19 = 2082;
      long long v20 = sel_getName(a2);
      __int16 v21 = 1024;
      int v22 = 220;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Stop listening for startup NTF", buf, 0x22u);
    }

    notify_cancel(self->_listeningForNfcdStartedNtf);
    self->_int listeningForNfcdStartedNtf = -1;
  }
}

void __47__NFHardwareManager_registerForRemoteCallbacks__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Failed to re-register with nfcd: %{public}@", v9, ClassName, Name, 280, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    long long v20 = v13;
    __int16 v21 = 2082;
    int v22 = v14;
    __int16 v23 = 1024;
    int v24 = 280;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to re-register with nfcd: %{public}@", buf, 0x2Cu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 100) = 0;
}

void __49__NFHardwareManager_unregisterForRemoteCallbacks__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Failed to re-register with nfcd: %{public}@", v9, ClassName, Name, 294, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    long long v20 = v13;
    __int16 v21 = 2082;
    int v22 = v14;
    __int16 v23 = 1024;
    int v24 = 294;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to re-register with nfcd: %{public}@", buf, 0x2Cu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 100) = 1;
}

- (void)sessionDidEnd:(id)a3
{
  obuint64_t j = self->_sessions;
  id v5 = a3;
  objc_sync_enter(obj);
  [(NSMutableSet *)self->_sessions removeObject:v5];

  objc_sync_exit(obj);
}

- (void)didInvalidate
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(5, "%c[%{public}s %{public}s]:%i Connection invalidated", v10, ClassName, Name, 333);
  }
  dispatch_get_specific(*v4);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v30 = v13;
    __int16 v31 = 2082;
    __int16 v32 = object_getClassName(self);
    __int16 v33 = 2082;
    __int16 v34 = sel_getName(a2);
    __int16 v35 = 1024;
    int v36 = 333;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Connection invalidated", buf, 0x22u);
  }

  uint64_t v14 = self;
  objc_sync_enter(v14);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v15 = v14->_eventListeners;
  uint64_t v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v20 didReceiveFatalCommunicationError];
        }
      }
      uint64_t v17 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v17);
  }

  xpc = v14->_xpc;
  v14->_xpc = 0;

  v14->_hasEventListener = 0;
  controllerInfo = v14->_controllerInfo;
  v14->_controllerInfo = 0;

  v14->_unsigned int hwSupport = 1;
  [(NFHardwareManager *)v14 hwStateDidChange:1];
  [(NFHardwareManager *)v14 listenForNfcdStartup];
  objc_sync_exit(v14);
}

- (void)didInterrupt:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(5, "%c[%{public}s %{public}s]:%i Connection interrupted", v11, ClassName, Name, 356);
  }
  dispatch_get_specific(*v5);
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v43 = v14;
    __int16 v44 = 2082;
    long long v45 = object_getClassName(self);
    __int16 v46 = 2082;
    v47 = sel_getName(a2);
    __int16 v48 = 1024;
    int v49 = 356;
    _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Connection interrupted", buf, 0x22u);
  }

  uint64_t v15 = self->_sessions;
  objc_sync_enter(v15);
  uint64_t v16 = (void *)[(NSMutableSet *)self->_sessions copy];
  objc_sync_exit(v15);

  [v16 enumerateObjectsUsingBlock:&__block_literal_global_45];
  uint64_t v17 = self;
  objc_sync_enter(v17);
  if ([(NSMutableSet *)v17->_eventListeners count] || [(NSMutableArray *)v17->_waitingClients count])
  {
    v17->_hasEventListener = 0;
    [(NFHardwareManager *)v17 registerForRemoteCallbacks];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v18 = [(NSDictionary *)v17->_secureElementsById allValues];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * i) _markDirty];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v20);
  }

  controllerInfo = v17->_controllerInfo;
  v17->_controllerInfo = 0;

  v17->_unsigned int hwSupport = 1;
  objc_sync_exit(v17);

  if (v17->_didPreWarm)
  {
    dispatch_get_specific(*v5);
    uint64_t v24 = NFLogGetLogger();
    if (v24)
    {
      long long v25 = (void (*)(uint64_t, const char *, ...))v24;
      long long v26 = object_getClass(v17);
      BOOL v27 = class_isMetaClass(v26);
      __int16 v28 = object_getClassName(v17);
      int v36 = sel_getName(a2);
      uint64_t v29 = 45;
      if (v27) {
        uint64_t v29 = 43;
      }
      v25(3, "%c[%{public}s %{public}s]:%i Re-starting preWarm after disconnect", v29, v28, v36, 385);
    }
    dispatch_get_specific(*v5);
    int v30 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = object_getClass(v17);
      if (class_isMetaClass(v31)) {
        int v32 = 43;
      }
      else {
        int v32 = 45;
      }
      __int16 v33 = object_getClassName(v17);
      __int16 v34 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v43 = v32;
      __int16 v44 = 2082;
      long long v45 = v33;
      __int16 v46 = 2082;
      v47 = v34;
      __int16 v48 = 1024;
      int v49 = 385;
      _os_log_impl(&dword_19D636000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Re-starting preWarm after disconnect", buf, 0x22u);
    }

    [(NFHardwareManager *)v17 preWarm];
  }
}

uint64_t __34__NFHardwareManager_didInterrupt___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didEndUnexpectedly];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *))a3;
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(NFHardwareManager *)v6 connectToXPCManager:0];
  __int16 v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 connection];
    id v3 = [v9 remoteObjectProxyWithErrorHandler:v5];
  }
  objc_sync_exit(v6);

  if (!v8)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = [NSString stringWithUTF8String:"nf.fwk"];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = @"No connection to nfcd";
    int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    int v13 = (void *)[v10 initWithDomain:v11 code:0 userInfo:v12];
    v5[2](v5, v13);

    id v3 = 0;
  }

  return v3;
}

void __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Failed to get HW support : %{public}@", v9, ClassName, Name, 427, v3);
  }
  dispatch_get_specific(*v4);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    int v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    int v22 = v13;
    __int16 v23 = 2082;
    uint64_t v24 = v14;
    __int16 v25 = 1024;
    int v26 = 427;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get HW support : %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Failed to get HW support : %{public}@", v9, ClassName, Name, 432, v3);
  }
  dispatch_get_specific(*v4);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    int v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    int v22 = v13;
    __int16 v23 = 2082;
    uint64_t v24 = v14;
    __int16 v25 = 1024;
    int v26 = 432;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get HW support : %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke_55(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 67109120;
    int v20 = a2;
    _os_signpost_emit_with_name_impl(&dword_19D636000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "updateHWSupportWithXPC", "hwSupport=%u, waitForHWInit=true", buf, 8u);
  }

  id v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i %d -> %d", v12, ClassName, Name, 444, *(unsigned int *)(*(void *)(a1 + 32) + 80), a2);
  }
  dispatch_get_specific(*v5);
  int v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    uint64_t v16 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v17 = sel_getName(*(SEL *)(a1 + 40));
    int v18 = *(_DWORD *)(*(void *)(a1 + 32) + 80);
    *(_DWORD *)buf = 67110402;
    int v20 = v15;
    __int16 v21 = 2082;
    int v22 = v16;
    __int16 v23 = 2082;
    uint64_t v24 = v17;
    __int16 v25 = 1024;
    int v26 = 444;
    __int16 v27 = 1024;
    int v28 = v18;
    __int16 v29 = 1024;
    int v30 = a2;
    _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %d -> %d", buf, 0x2Eu);
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 80) = a2;
}

void __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke_58(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 67109120;
    int v20 = a2;
    _os_signpost_emit_with_name_impl(&dword_19D636000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "updateHWSupportWithXPC", "hwSupport=%u, waitForHWInit=false", buf, 8u);
  }

  id v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i %d -> %d", v12, ClassName, Name, 452, *(unsigned int *)(*(void *)(a1 + 32) + 80), a2);
  }
  dispatch_get_specific(*v5);
  int v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    uint64_t v16 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v17 = sel_getName(*(SEL *)(a1 + 40));
    int v18 = *(_DWORD *)(*(void *)(a1 + 32) + 80);
    *(_DWORD *)buf = 67110402;
    int v20 = v15;
    __int16 v21 = 2082;
    int v22 = v16;
    __int16 v23 = 2082;
    uint64_t v24 = v17;
    __int16 v25 = 1024;
    int v26 = 452;
    __int16 v27 = 1024;
    int v28 = v18;
    __int16 v29 = 1024;
    int v30 = a2;
    _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %d -> %d", buf, 0x2Eu);
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 80) = a2;
}

- (unsigned)getHwSupport
{
  id v2 = self;
  objc_sync_enter(v2);
  unsigned int hwSupport = v2->_hwSupport;
  objc_sync_exit(v2);

  return hwSupport;
}

- (unsigned)queryHardwareSupport:(id *)a3
{
  id v5 = _os_activity_create(&dword_19D636000, "queryHardwareSupport:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  os_activity_scope_leave(&v10);

  id v6 = [(NFHardwareManager *)self updateHWSupportWithXPC:0 waitForInit:0];
  id v7 = v6;
  if (a3 && v6) {
    *a3 = v6;
  }
  unsigned int v8 = [(NFHardwareManager *)self getHwSupport];

  return v8;
}

- (id)getRadioEnabledSetting:(BOOL *)a3
{
  uint64_t v8 = 0;
  id v4 = [(NFHardwareManager *)self getRadioEnabledState:&v8];
  if (a3) {
    *a3 = 0;
  }
  if ((unint64_t)(v8 + 1) >= 2)
  {
    if (v8 != 1 || a3 == 0) {
      goto LABEL_12;
    }
    BOOL v5 = 1;
  }
  else
  {
    if (!a3) {
      goto LABEL_12;
    }
    BOOL v5 = 0;
  }
  *a3 = v5;
LABEL_12:
  return v4;
}

- (id)getRadioEnabledState:(int64_t *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "getRadioEnabledState:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__6;
  int v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__NFHardwareManager_getRadioEnabledState___block_invoke;
  v11[3] = &unk_1E595CBD0;
  v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__NFHardwareManager_getRadioEnabledState___block_invoke_60;
  v10[3] = &unk_1E595D820;
  v10[4] = &state;
  v10[5] = a3;
  [v7 radioEnableStateWithCompletion:v10];

  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v8;
}

void __42__NFHardwareManager_getRadioEnabledState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 509, v3);
  }
  dispatch_get_specific(*v4);
  os_activity_scope_state_s v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    int v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    int v22 = v13;
    __int16 v23 = 2082;
    uint64_t v24 = v14;
    __int16 v25 = 1024;
    int v26 = 509;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

uint64_t __42__NFHardwareManager_getRadioEnabledState___block_invoke_60(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6) {
    *id v6 = a2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = v5;
  return MEMORY[0x1F41817F8]();
}

- (id)setRadioEnabledSetting:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    id v6 = "setRadioEnabledSetting:Y";
  }
  else {
    id v6 = "setRadioEnabledSetting:N";
  }
  id v7 = _os_activity_create(&dword_19D636000, v6, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__NFHardwareManager_setRadioEnabledSetting___block_invoke;
  v12[3] = &unk_1E595CBD0;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  id v8 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__NFHardwareManager_setRadioEnabledSetting___block_invoke_62;
  v11[3] = &unk_1E595CF58;
  v11[4] = &state;
  [v8 enableRadio:v3 completion:v11];

  id v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __44__NFHardwareManager_setRadioEnabledSetting___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 529, v3);
  }
  dispatch_get_specific(*v4);
  os_activity_scope_state_s v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    int v22 = v13;
    __int16 v23 = 2082;
    uint64_t v24 = v14;
    __int16 v25 = 1024;
    int v26 = 529;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __44__NFHardwareManager_setRadioEnabledSetting___block_invoke_62(uint64_t a1, void *a2)
{
}

- (id)getTemperature:(double *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "getTemperature:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__NFHardwareManager_getTemperature___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__NFHardwareManager_getTemperature___block_invoke_63;
  v10[3] = &unk_1E595D848;
  v10[4] = &state;
  v10[5] = a3;
  [v7 getTemperatureWithCompletion:v10];

  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v8;
}

void __36__NFHardwareManager_getTemperature___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 544, v3);
  }
  dispatch_get_specific(*v4);
  os_activity_scope_state_s v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    int v22 = v13;
    __int16 v23 = 2082;
    uint64_t v24 = v14;
    __int16 v25 = 1024;
    int v26 = 544;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __36__NFHardwareManager_getTemperature___block_invoke_63(uint64_t a1, void *a2, double a3)
{
  id v7 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = *(double **)(a1 + 40);
  if (v6) {
    *id v6 = a3;
  }
}

- (id)getReaderProhibitTimerInfoSERmRunning:(BOOL *)a3 hostRmRunning:(BOOL *)a4 remainingInMs:(unsigned int *)a5
{
  os_activity_scope_state_s v10 = _os_activity_create(&dword_19D636000, "getReaderProhibitTimerInfoSERmRunning:hRmRunning:remainingInMs", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  uint64_t v29 = 0;
  int v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v17 = 0x3032000000;
  int v18 = __Block_byref_object_copy__6;
  uint64_t v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__NFHardwareManager_getReaderProhibitTimerInfoSERmRunning_hostRmRunning_remainingInMs___block_invoke;
  v15[3] = &unk_1E595CBD0;
  v15[5] = &state;
  v15[6] = a2;
  v15[4] = self;
  uint64_t v11 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__NFHardwareManager_getReaderProhibitTimerInfoSERmRunning_hostRmRunning_remainingInMs___block_invoke_65;
  v14[3] = &unk_1E595D870;
  v14[4] = &v29;
  v14[5] = &v25;
  void v14[6] = &v21;
  void v14[7] = &state;
  [v11 getReaderProhibitTimer:v14];

  if (a3) {
    *a3 = *((unsigned char *)v30 + 24);
  }
  if (a4) {
    *a4 = *((unsigned char *)v26 + 24);
  }
  if (a5) {
    *a5 = *((_DWORD *)v22 + 6);
  }
  id v12 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v12;
}

void __87__NFHardwareManager_getReaderProhibitTimerInfoSERmRunning_hostRmRunning_remainingInMs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 567, v3);
  }
  dispatch_get_specific(*v4);
  os_activity_scope_state_s v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    int v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 567;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

uint64_t __87__NFHardwareManager_getReaderProhibitTimerInfoSERmRunning_hostRmRunning_remainingInMs___block_invoke_65(void *a1, char a2, char a3, int a4, void *a5)
{
  id v9 = a5;
  if (!v9)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a4;
  }
  *(void *)(*(void *)(a1[7] + 8) + 40) = v9;
  return MEMORY[0x1F41817F8]();
}

- (id)stateInfo:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "stateInfo:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__6;
  __int16 v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __31__NFHardwareManager_stateInfo___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &v12;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __31__NFHardwareManager_stateInfo___block_invoke_67;
  v10[3] = &unk_1E595D898;
  v10[4] = self;
  v10[5] = &v12;
  void v10[6] = &state;
  v10[7] = a2;
  [v7 stateInfoWithCompletion:v10];

  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __31__NFHardwareManager_stateInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 627, v3);
  }
  dispatch_get_specific(*v4);
  os_activity_scope_state_s v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 627;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __31__NFHardwareManager_stateInfo___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      os_activity_scope_state_s v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 631, v7);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(*(id *)(a1 + 32));
      int v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v24 = v16;
      __int16 v25 = 2082;
      int v26 = v17;
      __int16 v27 = 2082;
      id v28 = v18;
      __int16 v29 = 1024;
      int v30 = 631;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v20 = a3;
  }
  else
  {
    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v20 = a2;
  }
  objc_storeStrong(v19, v20);
}

void __45__NFHardwareManager_controllerInfoWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 658, v3);
  }
  dispatch_get_specific(*v4);
  os_activity_scope_state_s v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 658;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __45__NFHardwareManager_controllerInfoWithError___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      os_activity_scope_state_s v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 662, v7);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(*(id *)(a1 + 32));
      int v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v24 = v16;
      __int16 v25 = 2082;
      int v26 = v17;
      __int16 v27 = 2082;
      id v28 = v18;
      __int16 v29 = 1024;
      int v30 = 662;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v20 = a3;
  }
  else
  {
    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v20 = a2;
  }
  objc_storeStrong(v19, v20);
}

- (id)rfSettings
{
  id v4 = _os_activity_create(&dword_19D636000, "rfSettings", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__6;
  uint64_t v13 = __Block_byref_object_dispose__6;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__NFHardwareManager_rfSettings__block_invoke;
  v9[3] = &unk_1E595C648;
  v9[4] = self;
  v9[5] = a2;
  id v5 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__NFHardwareManager_rfSettings__block_invoke_71;
  v8[3] = &unk_1E595D8E8;
  v8[5] = &state;
  v8[6] = a2;
  v8[4] = self;
  [v5 rfSettingsWithCompletion:v8];

  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __31__NFHardwareManager_rfSettings__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 691, v3);
  }
  dispatch_get_specific(*v4);
  os_activity_scope_state_s v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    int v20 = v13;
    __int16 v21 = 2082;
    id v22 = v14;
    __int16 v23 = 1024;
    int v24 = 691;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __31__NFHardwareManager_rfSettings__block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      os_activity_scope_state_s v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 694, v7);
    }
    dispatch_get_specific(*v8);
    id v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(*(id *)(a1 + 32));
      int v18 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      int v24 = v17;
      __int16 v25 = 2082;
      id v26 = v18;
      __int16 v27 = 1024;
      int v28 = 694;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)setAntiRelayRID:(id)a3
{
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__NFHardwareManager_setAntiRelayRID___block_invoke;
  v10[3] = &unk_1E595CBD0;
  v10[5] = &v11;
  void v10[6] = a2;
  v10[4] = self;
  id v5 = a3;
  id v6 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__NFHardwareManager_setAntiRelayRID___block_invoke_72;
  v9[3] = &unk_1E595CBD0;
  v9[5] = &v11;
  void v9[6] = a2;
  v9[4] = self;
  [v6 setAntiRelayRID:v5 completion:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __37__NFHardwareManager_setAntiRelayRID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 710, v3);
  }
  dispatch_get_specific(*v4);
  os_activity_scope_state_s v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    int v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 710;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __37__NFHardwareManager_setAntiRelayRID___block_invoke_72(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 714, v3);
    }
    dispatch_get_specific(*v4);
    os_activity_scope_state_s v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
      id v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v20 = v12;
      __int16 v21 = 2082;
      int v22 = v13;
      __int16 v23 = 2082;
      int v24 = v14;
      __int16 v25 = 1024;
      int v26 = 714;
      __int16 v27 = 2114;
      id v28 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

- (id)getDieIDWithError:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "getDieIDWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__6;
  __int16 v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__NFHardwareManager_getDieIDWithError___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &v12;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__NFHardwareManager_getDieIDWithError___block_invoke_73;
  v10[3] = &unk_1E595D910;
  v10[4] = self;
  v10[5] = &v12;
  void v10[6] = &state;
  void v10[7] = a2;
  [v7 getDieIDWithCompletion:v10];

  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __39__NFHardwareManager_getDieIDWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 732, v3);
  }
  dispatch_get_specific(*v4);
  os_activity_scope_state_s v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 732;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __39__NFHardwareManager_getDieIDWithError___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      os_activity_scope_state_s v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 736, v7);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(*(id *)(a1 + 32));
      int v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v24 = v16;
      __int16 v25 = 2082;
      int v26 = v17;
      __int16 v27 = 2082;
      id v28 = v18;
      __int16 v29 = 1024;
      int v30 = 736;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v20 = a3;
  }
  else
  {
    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v20 = a2;
  }
  objc_storeStrong(v19, v20);
}

- (id)getDieID
{
  return [(NFHardwareManager *)self getDieIDWithError:0];
}

- (id)getUniqueFDRKey:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "getUniqueFDRKey:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__6;
  __int16 v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  int v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__NFHardwareManager_getUniqueFDRKey___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &v12;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__NFHardwareManager_getUniqueFDRKey___block_invoke_75;
  v10[3] = &unk_1E595D938;
  v10[4] = self;
  v10[5] = &v12;
  void v10[6] = &state;
  void v10[7] = a2;
  [v7 getUniqueFDRKeyWithCompletion:v10];

  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __37__NFHardwareManager_getUniqueFDRKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 762, v3);
  }
  dispatch_get_specific(*v4);
  os_activity_scope_state_s v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 762;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __37__NFHardwareManager_getUniqueFDRKey___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      os_activity_scope_state_s v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 766, v7);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(*(id *)(a1 + 32));
      int v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v24 = v16;
      __int16 v25 = 2082;
      int v26 = v17;
      __int16 v27 = 2082;
      id v28 = v18;
      __int16 v29 = 1024;
      int v30 = 766;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v20 = a3;
  }
  else
  {
    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v20 = a2;
  }
  objc_storeStrong(v19, v20);
}

- (id)pushSignedRF:(id)a3
{
  id v5 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "pushSignedRF:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__NFHardwareManager_pushSignedRF___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__NFHardwareManager_pushSignedRF___block_invoke_77;
  v10[3] = &unk_1E595CBD0;
  v10[5] = &state;
  void v10[6] = a2;
  v10[4] = self;
  [v7 pushSignedRF:v5 completion:v10];

  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v8;
}

void __34__NFHardwareManager_pushSignedRF___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 785, v3);
  }
  dispatch_get_specific(*v4);
  os_activity_scope_state_s v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 785;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __34__NFHardwareManager_pushSignedRF___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 789, v3);
    }
    dispatch_get_specific(*v4);
    os_activity_scope_state_s v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v20 = v12;
      __int16 v21 = 2082;
      id v22 = v13;
      __int16 v23 = 2082;
      int v24 = v14;
      __int16 v25 = 1024;
      int v26 = 789;
      __int16 v27 = 2114;
      id v28 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

- (BOOL)isExpressModeSupported
{
  id v3 = _os_activity_create(&dword_19D636000, "isExpressModeSupported", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  os_activity_scope_leave(&v6);

  id v4 = [(NFHardwareManager *)self controllerInfo];
  LOBYTE(v3) = [v4 hasAntenna];

  return (char)v3;
}

- (BOOL)supportsCathay
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = [(NFHardwareManager *)self controllerInfo];
  unint64_t v30 = [v3 siliconName];

  id v4 = self;
  objc_sync_enter(v4);
  [(NFHardwareManager *)v4 secureElementsWithError:0];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v33 != v8) {
        objc_enumerationMutation(v5);
      }
      os_activity_scope_state_s v10 = *(void **)(*((void *)&v32 + 1) + 8 * v9);
      uint64_t v11 = [v10 info];
      unint64_t v12 = [v11 seType];

      if (v12 > 7) {
        goto LABEL_25;
      }
      if (((1 << v12) & 0xBB) == 0) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v44 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    if (v12 != 2)
    {
LABEL_25:
      id v13 = 0;
      BOOL v16 = 1;
      uint64_t v14 = v5;
      goto LABEL_26;
    }
    id v13 = v10;

    if (!v13) {
      goto LABEL_15;
    }
    if (v30 >= 7)
    {
      uint64_t v14 = [v13 info];
      uint64_t v15 = [v14 sequenceCounter];
      BOOL v16 = [v15 unsignedIntValue] > 0x65D;

      goto LABEL_26;
    }
    BOOL v16 = 1;
  }
  else
  {
LABEL_10:

LABEL_15:
    id v17 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v4);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v4);
      Name = sel_getName(a2);
      uint64_t v23 = 45;
      if (isMetaClass) {
        uint64_t v23 = 43;
      }
      v19(3, "%c[%{public}s %{public}s]:%i couldn't find embedded SE! :-O", v23, ClassName, Name, 825);
    }
    dispatch_get_specific(*v17);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v24 = object_getClass(v4);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      int v26 = object_getClassName(v4);
      __int16 v27 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v37 = v25;
      __int16 v38 = 2082;
      long long v39 = v26;
      __int16 v40 = 2082;
      long long v41 = v27;
      __int16 v42 = 1024;
      int v43 = 825;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i couldn't find embedded SE! :-O", buf, 0x22u);
    }
    id v13 = 0;
    BOOL v16 = 0;
LABEL_26:
  }
  objc_sync_exit(v4);

  return v16;
}

- (BOOL)isExpressAppletTypeSupported:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_19D636000, "isExpressAppletTypeSupported:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)os_activity_scope_state_s state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v6, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  if ((v3 - 1) >= 4 && v3 != 6)
  {
    if (v3 == 5)
    {
      uint64_t v7 = [(NFHardwareManager *)self controllerInfo];
      if ([v7 hasAntenna])
      {
        char v8 = [(NFHardwareManager *)self supportsCathay];
        goto LABEL_3;
      }
    }
    else
    {
      os_activity_scope_state_s v10 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        unint64_t v12 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v15 = 45;
        if (isMetaClass) {
          uint64_t v15 = 43;
        }
        v12(3, "%c[%{public}s %{public}s]:%i unsupported express mode %d", v15, ClassName, Name, 854, v3);
      }
      dispatch_get_specific(*v10);
      uint64_t v7 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        BOOL v16 = object_getClass(self);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        int v18 = object_getClassName(self);
        uint64_t v19 = sel_getName(a2);
        *(_DWORD *)os_activity_scope_state_s state = 67110146;
        *(_DWORD *)&state[4] = v17;
        *(_WORD *)&state[8] = 2082;
        *(void *)&state[10] = v18;
        __int16 v24 = 2082;
        int v25 = v19;
        __int16 v26 = 1024;
        int v27 = 854;
        __int16 v28 = 1024;
        int v29 = v3;
        _os_log_impl(&dword_19D636000, v7, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i unsupported express mode %d", state, 0x28u);
      }
    }
    BOOL v9 = 0;
    goto LABEL_18;
  }
  uint64_t v7 = [(NFHardwareManager *)self controllerInfo];
  char v8 = [v7 hasAntenna];
LABEL_3:
  BOOL v9 = v8;
LABEL_18:

  return v9;
}

- (BOOL)expressModesEnabled
{
  id v4 = _os_activity_create(&dword_19D636000, "expressModeEnabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__NFHardwareManager_expressModesEnabled__block_invoke;
  v8[3] = &unk_1E595C648;
  v8[4] = self;
  v8[5] = a2;
  id v5 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__NFHardwareManager_expressModesEnabled__block_invoke_80;
  v7[3] = &unk_1E595D960;
  v7[4] = &state;
  [v5 expressModesInfoWithOption:0 completion:v7];

  LOBYTE(v5) = *(unsigned char *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return (char)v5;
}

void __40__NFHardwareManager_expressModesEnabled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 866, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    char v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    int v20 = v13;
    __int16 v21 = 2082;
    id v22 = v14;
    __int16 v23 = 1024;
    int v24 = 866;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

uint64_t __40__NFHardwareManager_expressModesEnabled__block_invoke_80(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 == 1;
  return result;
}

- (int64_t)expressModeControlState
{
  id v4 = _os_activity_create(&dword_19D636000, "expressModeControlState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__NFHardwareManager_expressModeControlState__block_invoke;
  v9[3] = &unk_1E595C648;
  v9[4] = self;
  v9[5] = a2;
  id v5 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__NFHardwareManager_expressModeControlState__block_invoke_82;
  v8[3] = &unk_1E595D960;
  v8[4] = &state;
  [v5 expressModesInfoWithOption:0 completion:v8];

  int64_t v6 = *(void *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return v6;
}

void __44__NFHardwareManager_expressModeControlState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 882, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    int v20 = v13;
    __int16 v21 = 2082;
    id v22 = v14;
    __int16 v23 = 1024;
    int v24 = 882;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

uint64_t __44__NFHardwareManager_expressModeControlState__block_invoke_82(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)expressPassConfigsWithError:(id *)a3
{
  int64_t v6 = _os_activity_create(&dword_19D636000, "expressPassConfigListWithError", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__6;
  __int16 v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  BOOL v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__NFHardwareManager_expressPassConfigsWithError___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  uint64_t v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__NFHardwareManager_expressPassConfigsWithError___block_invoke_83;
  v10[3] = &unk_1E595D960;
  v10[4] = &v12;
  [v7 expressModesInfoWithOption:2 completion:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __49__NFHardwareManager_expressPassConfigsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 898, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 898;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __49__NFHardwareManager_expressPassConfigsWithError___block_invoke_83(uint64_t a1, int a2, int a3, int a4, id obj)
{
}

- (id)checkExpressPassCompatibility:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = _os_activity_create(&dword_19D636000, "checkExpressPassCompatibility:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__6;
  __int16 v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__6;
  int v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__NFHardwareManager_checkExpressPassCompatibility_error___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &state;
  void v13[6] = a2;
  uint64_t v9 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__NFHardwareManager_checkExpressPassCompatibility_error___block_invoke_84;
  v12[3] = &unk_1E595D988;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &state;
  void v12[7] = a2;
  [v9 checkExpressPassCompatibilityDeprecated:v7 callback:v12];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&state, 8);
  return v10;
}

void __57__NFHardwareManager_checkExpressPassCompatibility_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 919, v4);
  }
  dispatch_get_specific(*v5);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 919;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __57__NFHardwareManager_checkExpressPassCompatibility_error___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 924, v7);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(*(id *)(a1 + 32));
      int v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      __int16 v24 = v17;
      __int16 v25 = 2082;
      __int16 v26 = v18;
      __int16 v27 = 1024;
      int v28 = 924;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
}

- (id)validateExpressPassCompatibilityWithConfig:(id)a3 outError:(id *)a4
{
  id v7 = a3;
  id v8 = _os_activity_create(&dword_19D636000, "validateExpressPassCompatibilityWithConfig:outError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v21 = 0x3032000000;
  int v22 = __Block_byref_object_copy__6;
  __int16 v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__6;
  int v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__NFHardwareManager_validateExpressPassCompatibilityWithConfig_outError___block_invoke;
  v13[3] = &unk_1E595C6C0;
  v13[4] = self;
  v13[5] = &state;
  void v13[6] = a2;
  uint64_t v9 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__NFHardwareManager_validateExpressPassCompatibilityWithConfig_outError___block_invoke_86;
  v12[3] = &unk_1E595D988;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &state;
  void v12[7] = a2;
  [v9 checkExpressPassCompatibility:v7 callback:v12];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&state, 8);
  return v10;
}

void __73__NFHardwareManager_validateExpressPassCompatibilityWithConfig_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 944, v4);
  }
  dispatch_get_specific(*v5);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 944;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __73__NFHardwareManager_validateExpressPassCompatibilityWithConfig_outError___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 949, v7);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(*(id *)(a1 + 32));
      int v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      __int16 v24 = v17;
      __int16 v25 = 2082;
      __int16 v26 = v18;
      __int16 v27 = 1024;
      int v28 = 949;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
}

- (BOOL)currentInMetroStatus:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "currentInMetroStatus:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v17 = 0x3032000000;
  int v18 = __Block_byref_object_copy__6;
  int v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__NFHardwareManager_currentInMetroStatus___block_invoke;
  v11[3] = &unk_1E595C6C0;
  v11[4] = self;
  void v11[5] = &state;
  v11[6] = a2;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__NFHardwareManager_currentInMetroStatus___block_invoke_87;
  v10[3] = &unk_1E595D9B0;
  v10[4] = self;
  void v10[5] = &v12;
  void v10[6] = &state;
  void v10[7] = a2;
  [v7 currentInMetroStatus:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v8 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&state, 8);

  return v8;
}

void __42__NFHardwareManager_currentInMetroStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 969, v4);
  }
  dispatch_get_specific(*v5);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    char v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    __int16 v23 = v15;
    __int16 v24 = 1024;
    int v25 = 969;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __42__NFHardwareManager_currentInMetroStatus___block_invoke_87(uint64_t a1, char a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    id v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 974, v6);
    }
    dispatch_get_specific(*v7);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      int v16 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v17 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v21 = v15;
      __int16 v22 = 2082;
      __int16 v23 = v16;
      __int16 v24 = 2082;
      int v25 = v17;
      __int16 v26 = 1024;
      int v27 = 974;
      __int16 v28 = 2114;
      id v29 = v6;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
}

- (id)configureHeadlessFactoryMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    id v6 = "configureHeadlessFactoryMode:Y";
  }
  else {
    id v6 = "configureHeadlessFactoryMode:N";
  }
  id v7 = _os_activity_create(&dword_19D636000, v6, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__6;
  int v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__NFHardwareManager_configureHeadlessFactoryMode___block_invoke;
  v12[3] = &unk_1E595CBD0;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  char v8 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__NFHardwareManager_configureHeadlessFactoryMode___block_invoke_89;
  v11[3] = &unk_1E595CF58;
  v11[4] = &state;
  [v8 configureHeadlessFactoryMode:v3 completion:v11];

  id v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __50__NFHardwareManager_configureHeadlessFactoryMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 998, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 998;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __50__NFHardwareManager_configureHeadlessFactoryMode___block_invoke_89(uint64_t a1, void *a2)
{
}

- (id)enableLPEMFeature:(unint64_t)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "enableLPEMFeature:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__NFHardwareManager_enableLPEMFeature___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__NFHardwareManager_enableLPEMFeature___block_invoke_90;
  v10[3] = &unk_1E595CF58;
  v10[4] = &state;
  [v7 enableLPEMFeature:a3 completion:v10];

  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v8;
}

void __39__NFHardwareManager_enableLPEMFeature___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1015, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 1015;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __39__NFHardwareManager_enableLPEMFeature___block_invoke_90(uint64_t a1, void *a2)
{
}

- (id)disableLPEMFeature:(unint64_t)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "enableLPEMFeature:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__NFHardwareManager_disableLPEMFeature___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__NFHardwareManager_disableLPEMFeature___block_invoke_91;
  v10[3] = &unk_1E595CF58;
  v10[4] = &state;
  [v7 disableLPEMFeature:a3 completion:v10];

  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v8;
}

void __40__NFHardwareManager_disableLPEMFeature___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1031, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 1031;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __40__NFHardwareManager_disableLPEMFeature___block_invoke_91(uint64_t a1, void *a2)
{
}

- (id)getHeadlessModeFlags:(unsigned int *)a3
{
  id v5 = _os_activity_create(&dword_19D636000, "getHeadlessModeFlags:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__6;
  uint64_t v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__NFHardwareManager_getHeadlessModeFlags___block_invoke;
  v10[3] = &unk_1E595CF58;
  v10[4] = &state;
  id v6 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__NFHardwareManager_getHeadlessModeFlags___block_invoke_2;
  v9[3] = &unk_1E595DC18;
  v9[4] = &state;
  v9[5] = a3;
  [v6 headlessFactoryModeWithCompletion:v9];

  id v7 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v7;
}

void __42__NFHardwareManager_getHeadlessModeFlags___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v3 = [NSString stringWithUTF8String:"nfcd"];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  id v4 = [NSString stringWithUTF8String:"XPC Error"];
  v10[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v6 = [v2 initWithDomain:v3 code:7 userInfo:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __42__NFHardwareManager_getHeadlessModeFlags___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v7 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  uint64_t v6 = *(_DWORD **)(a1 + 40);
  if (v6)
  {
    if (a3) {
      *v6 |= 1u;
    }
    if ((a3 & 2) != 0) {
      **(_DWORD **)(a1 + 40) |= 2u;
    }
  }
}

- (BOOL)getHeadlessFactoryMode:(id *)a3
{
  int v8 = 0;
  id v4 = [(NFHardwareManager *)self getHeadlessModeFlags:&v8];
  id v5 = v4;
  if (a3) {
    *a3 = v4;
  }
  BOOL v6 = v8 != 0;

  return v6;
}

- (id)disableHeadless
{
  id v4 = _os_activity_create(&dword_19D636000, "disableHeadless", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__6;
  uint64_t v13 = __Block_byref_object_dispose__6;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__NFHardwareManager_disableHeadless__block_invoke;
  v9[3] = &unk_1E595CBD0;
  v9[5] = &state;
  void v9[6] = a2;
  v9[4] = self;
  id v5 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__NFHardwareManager_disableHeadless__block_invoke_94;
  v8[3] = &unk_1E595CF58;
  v8[4] = &state;
  [v5 disableHeadlessMiniNVWithCompletion:v8];

  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __36__NFHardwareManager_disableHeadless__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1077, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 1077;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __36__NFHardwareManager_disableHeadless__block_invoke_94(uint64_t a1, void *a2)
{
}

- (id)getPowerCounters:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "getPowerCounters:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__6;
  __int16 v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__NFHardwareManager_getPowerCounters___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &v12;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __38__NFHardwareManager_getPowerCounters___block_invoke_95;
  v10[3] = &unk_1E595DC40;
  v10[4] = self;
  void v10[5] = &v12;
  void v10[6] = &state;
  void v10[7] = a2;
  [v7 getPowerCountersWithCompletion:v10];

  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __38__NFHardwareManager_getPowerCounters___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1094, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 1094;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __38__NFHardwareManager_getPowerCounters___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 1098, v6);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(*(id *)(a1 + 32));
      int v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v24 = v16;
      __int16 v25 = 2082;
      int v26 = v17;
      __int16 v27 = 2082;
      id v28 = v18;
      __int16 v29 = 1024;
      int v30 = 1098;
      __int16 v31 = 2114;
      id v32 = v6;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v20 = a2;
  }
  else
  {
    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v20 = a3;
  }
  objc_storeStrong(v19, v20);
}

- (id)getFlashWriteCounters:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "getFlashWriteCounters:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__6;
  __int16 v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  int v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__NFHardwareManager_getFlashWriteCounters___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &v12;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __43__NFHardwareManager_getFlashWriteCounters___block_invoke_97;
  v10[3] = &unk_1E595DC40;
  v10[4] = self;
  void v10[5] = &v12;
  void v10[6] = &state;
  void v10[7] = a2;
  [v7 getFlashWriteCountersWithCompletion:v10];

  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __43__NFHardwareManager_getFlashWriteCounters___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1118, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 1118;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __43__NFHardwareManager_getFlashWriteCounters___block_invoke_97(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 1122, v6);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(*(id *)(a1 + 32));
      int v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v24 = v16;
      __int16 v25 = 2082;
      int v26 = v17;
      __int16 v27 = 2082;
      id v28 = v18;
      __int16 v29 = 1024;
      int v30 = 1122;
      __int16 v31 = 2114;
      id v32 = v6;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v20 = a2;
  }
  else
  {
    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v20 = a3;
  }
  objc_storeStrong(v19, v20);
}

- (id)startSinglePollExpressModeAssertion:(double)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "startSinglePollExpressModeAssertion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__NFHardwareManager_startSinglePollExpressModeAssertion___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __57__NFHardwareManager_startSinglePollExpressModeAssertion___block_invoke_98;
  v10[3] = &unk_1E595CBD0;
  void v10[5] = &state;
  void v10[6] = a2;
  v10[4] = self;
  [v7 openSinglePollExpressModeAssertion:v10 completion:a3];

  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v8;
}

void __57__NFHardwareManager_startSinglePollExpressModeAssertion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1142, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 1142;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __57__NFHardwareManager_startSinglePollExpressModeAssertion___block_invoke_98(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 1146, v4);
    }
    dispatch_get_specific(*v5);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 1146;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)releaseSinglePollExpressModeAssertion
{
  id v4 = _os_activity_create(&dword_19D636000, "releaseSinglePollExpressModeAssertion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__6;
  int v13 = __Block_byref_object_dispose__6;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__NFHardwareManager_releaseSinglePollExpressModeAssertion__block_invoke;
  v9[3] = &unk_1E595CBD0;
  v9[5] = &state;
  void v9[6] = a2;
  v9[4] = self;
  id v5 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__NFHardwareManager_releaseSinglePollExpressModeAssertion__block_invoke_99;
  v8[3] = &unk_1E595CBD0;
  void v8[5] = &state;
  void v8[6] = a2;
  v8[4] = self;
  [v5 cancelSinglePollExpressModeAssertionWithCompletion:v8];

  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __58__NFHardwareManager_releaseSinglePollExpressModeAssertion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1162, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 1162;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __58__NFHardwareManager_releaseSinglePollExpressModeAssertion__block_invoke_99(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 1166, v4);
    }
    dispatch_get_specific(*v5);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      id v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 1166;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)dumpLPMDebugLog
{
  id v4 = _os_activity_create(&dword_19D636000, "dumpLPMDebugLog", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__NFHardwareManager_dumpLPMDebugLog__block_invoke;
  v7[3] = &unk_1E595C648;
  v7[4] = self;
  void v7[5] = a2;
  id v5 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__NFHardwareManager_dumpLPMDebugLog__block_invoke_100;
  v6[3] = &unk_1E595C648;
  v6[4] = self;
  v6[5] = a2;
  [v5 dumpLPMDebugLogWithCompletion:v6];
}

void __36__NFHardwareManager_dumpLPMDebugLog__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1181, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 1024;
    int v24 = 1181;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __36__NFHardwareManager_dumpLPMDebugLog__block_invoke_100(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1184, v3);
    }
    dispatch_get_specific(*v4);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      int v13 = object_getClassName(*(id *)(a1 + 32));
      id v14 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67110146;
      int v18 = v12;
      __int16 v19 = 2082;
      __int16 v20 = v13;
      __int16 v21 = 2082;
      __int16 v22 = v14;
      __int16 v23 = 1024;
      int v24 = 1184;
      __int16 v25 = 2114;
      id v26 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
}

- (unsigned)checkUserBlessing:(id)a3
{
  return [(NFHardwareManager *)self checkUserBlessing:a3 hasCards:0];
}

- (unsigned)checkUserBlessing:(id)a3 hasCards:(BOOL *)a4
{
  id v4 = _os_activity_create(&dword_19D636000, "checkUserBlessing:hasCards:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v4, &v6);
  os_activity_scope_leave(&v6);

  return 14;
}

- (unsigned)setBlessedUser:(id)a3 withAuthorization:(id)a4
{
  return [(NFHardwareManager *)self setBlessedUser:a3 keybagUUID:0 withAuthorization:a4];
}

- (unsigned)setBlessedUser:(id)a3 keybagUUID:(id)a4 withAuthorization:(id)a5
{
  id v5 = _os_activity_create(&dword_19D636000, "setBlessedUser:keybagUUIID:withAuthorization:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  os_activity_scope_leave(&v7);

  return 14;
}

- (NSUUID)blessedUser
{
  id v2 = _os_activity_create(&dword_19D636000, "blessedUser", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  return 0;
}

- (void)setAuthorization:(id)a3
{
  id v3 = _os_activity_create(&dword_19D636000, "setAuthorization:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  os_activity_scope_leave(&v4);
}

- (BOOL)hasCard
{
  id v2 = _os_activity_create(&dword_19D636000, "hasCard", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  return 0;
}

- (void)registerEventListener:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "registerEventListener:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  os_activity_scope_leave(&v7);

  os_activity_scope_state_s v6 = self;
  objc_sync_enter(v6);
  [(NFHardwareManager *)v6 registerForRemoteCallbacks];
  [(NSMutableSet *)v6->_eventListeners addObject:v4];

  objc_sync_exit(v6);
}

- (void)unregisterEventListener:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "unregisterEventListener:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  os_activity_scope_leave(&v8);

  os_activity_scope_state_s v6 = self;
  objc_sync_enter(v6);
  [(NSMutableSet *)v6->_eventListeners removeObject:v4];

  if (![(NSMutableSet *)v6->_eventListeners count])
  {
    unsigned int hwSupport = v6->_hwSupport;
    if (hwSupport == 4 || hwSupport == 2) {
      [(NFHardwareManager *)v6 unregisterForRemoteCallbacks];
    }
  }
  objc_sync_exit(v6);
}

- (BOOL)setFieldDetectEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    os_activity_scope_state_s v6 = "setFieldDetectEnable:Y";
  }
  else {
    os_activity_scope_state_s v6 = "setFieldDetectEnable:N";
  }
  os_activity_scope_state_s v7 = _os_activity_create(&dword_19D636000, v6, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__NFHardwareManager_setFieldDetectEnabled___block_invoke;
  v12[3] = &unk_1E595C648;
  v12[4] = self;
  v12[5] = a2;
  os_activity_scope_state_s v8 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__NFHardwareManager_setFieldDetectEnabled___block_invoke_101;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  [v8 setFieldDetectEnabled:v3 completion:v11];

  char v9 = *(unsigned char *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return v9;
}

void __43__NFHardwareManager_setFieldDetectEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    os_activity_scope_state_s v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1329, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    __int16 v20 = v13;
    __int16 v21 = 2082;
    __int16 v22 = v14;
    __int16 v23 = 1024;
    int v24 = 1329;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __43__NFHardwareManager_setFieldDetectEnabled___block_invoke_101(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      os_activity_scope_state_s v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1332, v3);
    }
    dispatch_get_specific(*v4);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      int v13 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v18 = v12;
      __int16 v19 = 2082;
      __int16 v20 = v13;
      __int16 v21 = 2082;
      __int16 v22 = v14;
      __int16 v23 = 1024;
      int v24 = 1332;
      __int16 v25 = 2114;
      id v26 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __44__NFHardwareManager_requestAssertion_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    os_activity_scope_state_s v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1352, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 1352;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __44__NFHardwareManager_requestAssertion_error___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    os_activity_scope_state_s v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 1356, v6);
    }
    dispatch_get_specific(*v7);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      id v16 = object_getClassName(*(id *)(a1 + 32));
      id v17 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v32 = v15;
      __int16 v33 = 2082;
      long long v34 = v16;
      __int16 v35 = 2082;
      int v36 = v17;
      __int16 v37 = 1024;
      int v38 = 1356;
      __int16 v39 = 2114;
      id v40 = v6;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    int v18 = [NFAssertion alloc];
    v29[0] = @"NFAssertionType";
    int v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "assertionType"));
    v30[0] = v13;
    v29[1] = @"NFAssertionPID";
    __int16 v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "pid"));
    v30[1] = v19;
    v29[2] = @"NFAssertionTime";
    int v20 = [v5 assertionTime];
    v30[2] = v20;
    __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
    uint64_t v22 = [(NFAssertion *)v18 initWithDictionary:v21];
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    int v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
  uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
  int v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v6;
}

- (id)releaseAssertion:(id)a3
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "releaseAssertion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__6;
  __int16 v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  id v7 = objc_alloc(MEMORY[0x1E4FBA848]);
  v23[0] = @"NFAssertionType";
  os_activity_scope_state_s v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "assertionType"));
  v24[0] = v8;
  v23[1] = @"NFAssertionPID";
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "pid"));
  v24[1] = v9;
  v23[2] = @"NFAssertionTime";
  uint64_t v10 = [v5 assertionTime];

  v24[2] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  uint64_t v12 = (void *)[v7 initWithDictionary:v11];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __38__NFHardwareManager_releaseAssertion___block_invoke;
  v17[3] = &unk_1E595CBD0;
  void v17[5] = &state;
  void v17[6] = a2;
  v17[4] = self;
  int v13 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __38__NFHardwareManager_releaseAssertion___block_invoke_116;
  v16[3] = &unk_1E595CBD0;
  v16[5] = &state;
  v16[6] = a2;
  void v16[4] = self;
  [v13 releaseAssertion:v12 completion:v16];

  id v14 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v14;
}

void __38__NFHardwareManager_releaseAssertion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1389, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 1389;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __38__NFHardwareManager_releaseAssertion___block_invoke_116(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1393, v3);
    }
    dispatch_get_specific(*v4);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      int v13 = object_getClassName(*(id *)(a1 + 32));
      id v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v20 = v12;
      __int16 v21 = 2082;
      id v22 = v13;
      __int16 v23 = 2082;
      int v24 = v14;
      __int16 v25 = 1024;
      int v26 = 1393;
      __int16 v27 = 2114;
      id v28 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

- (BOOL)triggerDelayedWake:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "triggerDelayedWake:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __40__NFHardwareManager_triggerDelayedWake___block_invoke;
  v10[3] = &unk_1E595C648;
  v10[4] = self;
  void v10[5] = a2;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__NFHardwareManager_triggerDelayedWake___block_invoke_117;
  v9[3] = &unk_1E595CBD0;
  v9[5] = &state;
  void v9[6] = a2;
  v9[4] = self;
  [v7 triggerDelayedWake:v3 completion:v9];

  LOBYTE(v3) = *(unsigned char *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return v3;
}

void __40__NFHardwareManager_triggerDelayedWake___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1412, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    char v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    int v20 = v13;
    __int16 v21 = 2082;
    id v22 = v14;
    __int16 v23 = 1024;
    int v24 = 1412;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __40__NFHardwareManager_triggerDelayedWake___block_invoke_117(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1415, v3);
    }
    dispatch_get_specific(*v4);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      char v13 = object_getClassName(*(id *)(a1 + 32));
      id v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v18 = v12;
      __int16 v19 = 2082;
      int v20 = v13;
      __int16 v21 = 2082;
      id v22 = v14;
      __int16 v23 = 1024;
      int v24 = 1415;
      __int16 v25 = 2114;
      id v26 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)triggerCrash:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "triggerCrash:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __34__NFHardwareManager_triggerCrash___block_invoke;
  v10[3] = &unk_1E595C648;
  v10[4] = self;
  void v10[5] = a2;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__NFHardwareManager_triggerCrash___block_invoke_118;
  v9[3] = &unk_1E595CBD0;
  v9[5] = &state;
  void v9[6] = a2;
  v9[4] = self;
  [v7 triggerCrash:v3 completion:v9];

  LOBYTE(v3) = *(unsigned char *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return v3;
}

void __34__NFHardwareManager_triggerCrash___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1432, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    char v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    int v20 = v13;
    __int16 v21 = 2082;
    id v22 = v14;
    __int16 v23 = 1024;
    int v24 = 1432;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __34__NFHardwareManager_triggerCrash___block_invoke_118(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1435, v3);
    }
    dispatch_get_specific(*v4);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      char v13 = object_getClassName(*(id *)(a1 + 32));
      id v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v18 = v12;
      __int16 v19 = 2082;
      int v20 = v13;
      __int16 v21 = 2082;
      id v22 = v14;
      __int16 v23 = 1024;
      int v24 = 1435;
      __int16 v25 = 2114;
      id v26 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)enableHeadlessTestMode:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "enableHeadlessTestMode:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__NFHardwareManager_enableHeadlessTestMode___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __44__NFHardwareManager_enableHeadlessTestMode___block_invoke_119;
  v10[3] = &unk_1E595CBD0;
  void v10[5] = &state;
  void v10[6] = a2;
  v10[4] = self;
  [v7 enableHeadlessTestMode:v3 completion:v10];

  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v8;
}

void __44__NFHardwareManager_enableHeadlessTestMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1454, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = 1454;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __44__NFHardwareManager_enableHeadlessTestMode___block_invoke_119(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 1458, v4);
    }
    dispatch_get_specific(*v5);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      id v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 1458;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)toggleGPIO:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "toggleGPIO:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__NFHardwareManager_toggleGPIO___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __32__NFHardwareManager_toggleGPIO___block_invoke_120;
  v10[3] = &unk_1E595CBD0;
  void v10[5] = &state;
  void v10[6] = a2;
  v10[4] = self;
  [v7 toggleGPIO:v3 completion:v10];

  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v8;
}

void __32__NFHardwareManager_toggleGPIO___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1473, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 1473;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __32__NFHardwareManager_toggleGPIO___block_invoke_120(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 1477, v4);
    }
    dispatch_get_specific(*v5);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      id v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 1477;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)secureElementWithIdentifier:(id)a3 didChangeRestrictedMode:(BOOL)a4
{
  id v7 = a3;
  callbackQueue = self->_callbackQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __73__NFHardwareManager_secureElementWithIdentifier_didChangeRestrictedMode___block_invoke;
  v10[3] = &unk_1E595DCB8;
  v10[4] = self;
  id v11 = v7;
  SEL v12 = a2;
  BOOL v13 = a4;
  id v9 = v7;
  dispatch_async(callbackQueue, v10);
}

void __73__NFHardwareManager_secureElementWithIdentifier_didChangeRestrictedMode___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v31 = 0;
  id v5 = [v3 secureElementWithIdentifier:v4 error:&v31];
  id v6 = v31;
  if (v5)
  {
    [v5 _setIsInRestrictedMode:*(unsigned __int8 *)(a1 + 56)];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = *(id *)(*(void *)(a1 + 32) + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v26 = v6;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          SEL v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v12 secureElement:v5 didChangeRestrictedMode:*(unsigned __int8 *)(a1 + 56)];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
      id v6 = v26;
    }
  }
  else
  {
    BOOL v13 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v15 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v20 = 45;
      if (isMetaClass) {
        uint64_t v20 = 43;
      }
      v15(3, "%c[%{public}s %{public}s]:%i Missing SE for %{public}@ - %{public}@", v20, ClassName, Name, 1535, *(void *)(a1 + 40), v6);
    }
    dispatch_get_specific(*v13);
    id v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      __int16 v23 = object_getClassName(*(id *)(a1 + 32));
      __int16 v24 = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v25 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 67110402;
      int v34 = v22;
      __int16 v35 = 2082;
      int v36 = v23;
      __int16 v37 = 2082;
      int v38 = v24;
      __int16 v39 = 1024;
      int v40 = 1535;
      __int16 v41 = 2114;
      uint64_t v42 = v25;
      __int16 v43 = 2114;
      id v44 = v6;
      _os_log_impl(&dword_19D636000, v7, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing SE for %{public}@ - %{public}@", buf, 0x36u);
    }
  }

  objc_sync_exit(v2);
}

- (void)didChangeRadioState:(BOOL)a3
{
  callbackQueue = self->_callbackQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__NFHardwareManager_didChangeRadioState___block_invoke;
  v4[3] = &unk_1E595D0F0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(callbackQueue, v4);
}

void __41__NFHardwareManager_didChangeRadioState___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "didChangeRadioState:", *(unsigned __int8 *)(a1 + 40), (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);
}

- (id)secureElements
{
  return [(NFHardwareManager *)self secureElementsWithError:0];
}

void __45__NFHardwareManager_secureElementsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1613, v3);
  }
  dispatch_get_specific(*v4);
  long long v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    long long v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    BOOL v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    int v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 1613;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __45__NFHardwareManager_secureElementsWithError___block_invoke_131(uint64_t a1, void *a2)
{
}

void __61__NFHardwareManager_cachedEmbeddedSecureElementSerialNumber___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1647, v3);
  }
  dispatch_get_specific(*v4);
  long long v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    long long v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    BOOL v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    int v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 1647;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __61__NFHardwareManager_cachedEmbeddedSecureElementSerialNumber___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)secureElementWithIdentifier:(id)a3
{
  return [(NFHardwareManager *)self secureElementWithIdentifier:a3 error:0];
}

- (void)refreshSecureElements
{
}

- (BOOL)refreshSecureElementsWithError:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_19D636000, "refreshSecureElementsWithError", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v36 = 0x3032000000;
  __int16 v37 = __Block_byref_object_copy__6;
  int v38 = __Block_byref_object_dispose__6;
  id v39 = 0;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  int v32 = __Block_byref_object_copy__6;
  __int16 v33 = __Block_byref_object_dispose__6;
  id v34 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __52__NFHardwareManager_refreshSecureElementsWithError___block_invoke;
  v28[3] = &unk_1E595CBD0;
  v28[5] = &state;
  v28[6] = a2;
  v28[4] = self;
  uint64_t v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v28];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __52__NFHardwareManager_refreshSecureElementsWithError___block_invoke_134;
  v27[3] = &unk_1E595DCE0;
  v27[4] = &v29;
  [v7 secureElementsWithCompletion:v27];

  id v8 = self;
  objc_sync_enter(v8);
  secureElementsById = v8->_secureElementsById;
  long long v10 = secureElementsById;
  if (!secureElementsById)
  {
    [(NFHardwareManager *)v8 _initSEDictionaryWithSEInfoList:v30[5]];
    long long v10 = v8->_secureElementsById;
  }
  long long v11 = (void *)[(NSDictionary *)v10 copy];
  objc_sync_exit(v8);

  uint64_t v12 = state.opaque[1];
  if (secureElementsById && !*(void *)(state.opaque[1] + 40))
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = (id)v30[5];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          int v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          int v19 = objc_msgSend(v18, "identifier", (void)v23);
          int v20 = [v11 objectForKey:v19];

          [v20 _updateSecureElementInfo:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v40 count:16];
      }
      while (v15);
    }

    uint64_t v12 = state.opaque[1];
  }
  if (a3)
  {
    *a3 = *(id *)(v12 + 40);
    uint64_t v12 = state.opaque[1];
  }
  BOOL v21 = *(void *)(v12 + 40) == 0;

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&state, 8);

  return v21;
}

void __52__NFHardwareManager_refreshSecureElementsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1708, v3);
  }
  dispatch_get_specific(*v4);
  long long v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    long long v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    int v22 = v13;
    __int16 v23 = 2082;
    long long v24 = v14;
    __int16 v25 = 1024;
    int v26 = 1708;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __52__NFHardwareManager_refreshSecureElementsWithError___block_invoke_134(uint64_t a1, void *a2)
{
}

- (BOOL)secureElementBootHistory:(id *)a3
{
  uint64_t v4 = +[NFSecureElement embeddedSecureElementWithError:0];
  id v5 = v4;
  if (a3 && v4)
  {
    uint64_t v6 = [v4 info];
    *a3 = [v6 bootHistory];
  }
  return v5 != 0;
}

- (id)hostEmulationLog
{
  uint64_t v4 = _os_activity_create(&dword_19D636000, "hostEmulationLog", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__6;
  id v13 = __Block_byref_object_dispose__6;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__NFHardwareManager_hostEmulationLog__block_invoke;
  v9[3] = &unk_1E595C648;
  v9[4] = self;
  v9[5] = a2;
  id v5 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__NFHardwareManager_hostEmulationLog__block_invoke_135;
  v8[3] = &unk_1E595DD30;
  v8[4] = &state;
  [v5 getHostCardEmulationLogWithCompletion:v8];

  id v6 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v6;
}

void __37__NFHardwareManager_hostEmulationLog__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1759, v3);
  }
  dispatch_get_specific(*v4);
  long long v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    int v20 = v13;
    __int16 v21 = 2082;
    int v22 = v14;
    __int16 v23 = 1024;
    int v24 = 1759;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __37__NFHardwareManager_hostEmulationLog__block_invoke_135(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!a3)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v6 = v7;
  }
}

- (id)_synchronousQueueSessionWithRetry:(id)a3 queueBlock:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = &v38;
  id v26 = a3;
  id v8 = (void (**)(id, void *, void *))a4;
  uint64_t v9 = 0;
  uint64_t v39 = 0;
  int v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  do
  {
    uint64_t v11 = v9;
    *id v7 = 0;
    v30[0] = v10;
    v30[1] = 3221225472;
    v30[2] = __66__NFHardwareManager__synchronousQueueSessionWithRetry_queueBlock___block_invoke;
    void v30[3] = &unk_1E595DD58;
    int v32 = &v39;
    __int16 v33 = &v35;
    v30[4] = self;
    SEL v34 = a2;
    id v12 = v26;
    id v31 = v12;
    uint64_t v9 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v30];

    if (v9)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __66__NFHardwareManager__synchronousQueueSessionWithRetry_queueBlock___block_invoke_138;
      v27[3] = &unk_1E595DD80;
      v27[4] = self;
      SEL v29 = a2;
      id v28 = v12;
      v8[2](v8, v9, v27);
    }
    else
    {
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        id v14 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v18 = 45;
        if (isMetaClass) {
          uint64_t v18 = 43;
        }
        v14(3, "%c[%{public}s %{public}s]:%i Failed to get interface from XPC connection... rather unexpected.", v18, ClassName, Name, 1814);
      }
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      __int16 v19 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = object_getClass(self);
        if (class_isMetaClass(v20)) {
          int v21 = 43;
        }
        else {
          int v21 = 45;
        }
        int v22 = object_getClassName(self);
        __int16 v23 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v44 = v21;
        __int16 v45 = 2082;
        __int16 v46 = v22;
        __int16 v47 = 2082;
        __int16 v48 = v23;
        __int16 v49 = 1024;
        int v50 = 1814;
        _os_log_impl(&dword_19D636000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get interface from XPC connection... rather unexpected.", buf, 0x22u);
      }
    }
    id v7 = (char *)(v36 + 3);
  }
  while (*((unsigned char *)v36 + 24) && (unint64_t)v40[3] < 3);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v12;
}

void __66__NFHardwareManager__synchronousQueueSessionWithRetry_queueBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  id v7 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v4 > 1)
  {
    if (Logger)
    {
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 64));
      uint64_t v18 = 45;
      if (isMetaClass) {
        uint64_t v18 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i XPC Failure: %{public}@", v18, ClassName, Name, 1788, v3);
    }
    dispatch_get_specific(*v5);
    __int16 v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      int v22 = object_getClassName(*(id *)(a1 + 32));
      __int16 v23 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      int v37 = v21;
      __int16 v38 = 2082;
      uint64_t v39 = v22;
      __int16 v40 = 2082;
      uint64_t v41 = v23;
      __int16 v42 = 1024;
      int v43 = 1788;
      __int16 v44 = 2114;
      id v45 = v3;
      _os_log_impl(&dword_19D636000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Failure: %{public}@", buf, 0x2Cu);
    }

    int v24 = *(void **)(a1 + 40);
    id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v26 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    uint64_t v27 = [NSString stringWithUTF8String:"XPC Error"];
    uint64_t v35 = v27;
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    SEL v29 = (void *)[v25 initWithDomain:v26 code:7 userInfo:v28];
    [v24 didStartSession:v29];

    [*(id *)(a1 + 40) resume];
  }
  else
  {
    if (Logger)
    {
      id v8 = object_getClass(*(id *)(a1 + 32));
      BOOL v9 = class_isMetaClass(v8);
      long long v30 = object_getClassName(*(id *)(a1 + 32));
      int v32 = sel_getName(*(SEL *)(a1 + 64));
      uint64_t v10 = 45;
      if (v9) {
        uint64_t v10 = 43;
      }
      v7(4, "%c[%{public}s %{public}s]:%i Retrying xpc connection - proxy error: %{public}@", v10, v30, v32, 1785, v3);
    }
    dispatch_get_specific(*v5);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      id v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      int v37 = v13;
      __int16 v38 = 2082;
      uint64_t v39 = v14;
      __int16 v40 = 2082;
      uint64_t v41 = v15;
      __int16 v42 = 1024;
      int v43 = 1785;
      __int16 v44 = 2114;
      id v45 = v3;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Retrying xpc connection - proxy error: %{public}@", buf, 0x2Cu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

void __66__NFHardwareManager__synchronousQueueSessionWithRetry_queueBlock___block_invoke_138(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    BOOL v9 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i %{public}@", v14, ClassName, Name, 1799, v8);
    }
    dispatch_get_specific(*v9);
    uint64_t v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      uint64_t v18 = object_getClassName(*(id *)(a1 + 32));
      __int16 v19 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v24 = v17;
      __int16 v25 = 2082;
      id v26 = v18;
      __int16 v27 = 2082;
      id v28 = v19;
      __int16 v29 = 1024;
      int v30 = 1799;
      __int16 v31 = 2114;
      id v32 = v8;
      _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    [*(id *)(a1 + 40) didStartSession:v8];
  }
  else
  {
    id v20 = *(id *)(*(void *)(a1 + 32) + 24);
    objc_sync_enter(v20);
    [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
    objc_sync_exit(v20);

    [*(id *)(a1 + 40) setProxy:v7];
    [*(id *)(a1 + 40) setIsFirstInQueue:a3];
  }
  [*(id *)(a1 + 40) resume];
}

- (id)_sessionAttribute
{
  id v3 = objc_opt_new();
  unint64_t v4 = v3;
  if (self->_type == 1) {
    [v3 setObject:&unk_1EEF35950 forKeyedSubscript:@"session.prevent.ui.popup.on.radio.disabled"];
  }
  return v4;
}

- (id)startFieldDetectSession:(id)a3
{
  return [(NFHardwareManager *)self _startFieldDetectSession:0 completion:a3];
}

- (id)startUnfilteredFieldDetectSession:(id)a3
{
  return [(NFHardwareManager *)self _startFieldDetectSession:1 completion:a3];
}

- (id)_startFieldDetectSession:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_19D636000, "startFieldDetectSession:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v31 = 0;
  id v32 = (int *)&v31;
  uint64_t v33 = 0x2020000000;
  int v34 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v23 = 0x3032000000;
  int v24 = __Block_byref_object_copy__6;
  __int16 v25 = __Block_byref_object_dispose__6;
  id v26 = 0;
  BOOL v9 = objc_alloc_init(NFFieldDetectSession);
  uint64_t v10 = *(void **)(state.opaque[1] + 40);
  *(void *)(state.opaque[1] + 40) = v9;

  [*(id *)(state.opaque[1] + 40) setDidStartCallback:v7];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __57__NFHardwareManager__startFieldDetectSession_completion___block_invoke;
  v21[3] = &unk_1E595DDA8;
  v21[4] = self;
  [*(id *)(state.opaque[1] + 40) setDidEndCallback:v21];
  uint64_t v11 = v28;
  do
  {
    *((unsigned char *)v11 + 24) = 0;
    id v12 = [(NFHardwareManager *)self _sessionAttribute];
    int v13 = [NSNumber numberWithBool:v4];
    [v12 setObject:v13 forKeyedSubscript:@"session.fd.unfiltered"];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__NFHardwareManager__startFieldDetectSession_completion___block_invoke_2;
    v20[3] = &unk_1E595DDD0;
    v20[4] = self;
    v20[5] = &v31;
    v20[7] = &state;
    v20[8] = a2;
    void v20[6] = &v27;
    uint64_t v14 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v20];
    uint64_t v15 = *(void *)(state.opaque[1] + 40);
    uint64_t v16 = (void *)[v12 copy];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__NFHardwareManager__startFieldDetectSession_completion___block_invoke_151;
    v19[3] = &unk_1E595DDF8;
    v19[4] = self;
    v19[5] = &state;
    v19[6] = a2;
    [v14 queueFieldDetectSession:v15 sessionAttribute:v16 completion:v19];

    uint64_t v11 = v28;
  }
  while (*((unsigned char *)v28 + 24) && v32[6] < 3);
  id v17 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

uint64_t __57__NFHardwareManager__startFieldDetectSession_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __57__NFHardwareManager__startFieldDetectSession_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  id v7 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v4 > 1)
  {
    if (Logger)
    {
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 64));
      uint64_t v18 = 45;
      if (isMetaClass) {
        uint64_t v18 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i XPC Failure: %{public}@", v18, ClassName, Name, 1866, v3);
    }
    dispatch_get_specific(*v5);
    __int16 v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      int v22 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v23 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      int v37 = v21;
      __int16 v38 = 2082;
      uint64_t v39 = v22;
      __int16 v40 = 2082;
      uint64_t v41 = v23;
      __int16 v42 = 1024;
      int v43 = 1866;
      __int16 v44 = 2114;
      id v45 = v3;
      _os_log_impl(&dword_19D636000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Failure: %{public}@", buf, 0x2Cu);
    }

    int v24 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v26 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    uint64_t v27 = [NSString stringWithUTF8String:"XPC Error"];
    uint64_t v35 = v27;
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    uint64_t v29 = (void *)[v25 initWithDomain:v26 code:7 userInfo:v28];
    [v24 didStartSession:v29];

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) resume];
  }
  else
  {
    if (Logger)
    {
      id v8 = object_getClass(*(id *)(a1 + 32));
      BOOL v9 = class_isMetaClass(v8);
      char v30 = object_getClassName(*(id *)(a1 + 32));
      id v32 = sel_getName(*(SEL *)(a1 + 64));
      uint64_t v10 = 45;
      if (v9) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Retrying xpc connection - proxy error: %{public}@", v10, v30, v32, 1862, v3);
    }
    dispatch_get_specific(*v5);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      int v37 = v13;
      __int16 v38 = 2082;
      uint64_t v39 = v14;
      __int16 v40 = 2082;
      uint64_t v41 = v15;
      __int16 v42 = 1024;
      int v43 = 1862;
      __int16 v44 = 2114;
      id v45 = v3;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Retrying xpc connection - proxy error: %{public}@", buf, 0x2Cu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __57__NFHardwareManager__startFieldDetectSession_completion___block_invoke_151(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(*(void *)(a1 + 32) + 24);
  objc_sync_enter(v7);
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  objc_sync_exit(v7);

  if (v6)
  {
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 1879, v6);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v18 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      int v24 = v17;
      __int16 v25 = 2082;
      id v26 = v18;
      __int16 v27 = 1024;
      int v28 = 1879;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) didStartSession:v6];
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setProxy:v5];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resume];
}

- (id)startECommercePaymentSession:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "startECommercePaymentSession:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = objc_alloc_init(NFECommercePaymentSession);
  [(NFSession *)v6 setDidStartCallback:v4];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__NFHardwareManager_startECommercePaymentSession___block_invoke;
  v14[3] = &unk_1E595DDA8;
  v14[4] = self;
  [(NFSession *)v6 setDidEndCallback:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__NFHardwareManager_startECommercePaymentSession___block_invoke_2;
  v11[3] = &unk_1E595DE20;
  id v7 = v6;
  id v12 = v7;
  uint64_t v13 = self;
  id v8 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v7 queueBlock:v11];
  BOOL v9 = v7;

  return v9;
}

uint64_t __50__NFHardwareManager_startECommercePaymentSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __50__NFHardwareManager_startECommercePaymentSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 _sessionAttribute];
  id v8 = (void *)[v9 copy];
  [v7 queueECommercePaymentSession:v4 sessionAttribute:v8 completion:v6];
}

- (id)startContactlessPaymentSession:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "startContactlessPaymentSession:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = objc_alloc_init(NFContactlessPaymentSession);
  [(NFSession *)v6 setDidStartCallback:v4];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__NFHardwareManager_startContactlessPaymentSession___block_invoke;
  v14[3] = &unk_1E595DDA8;
  v14[4] = self;
  [(NFSession *)v6 setDidEndCallback:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__NFHardwareManager_startContactlessPaymentSession___block_invoke_2;
  v11[3] = &unk_1E595DE20;
  id v7 = v6;
  id v12 = v7;
  uint64_t v13 = self;
  id v8 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v7 queueBlock:v11];
  id v9 = v7;

  return v9;
}

uint64_t __52__NFHardwareManager_startContactlessPaymentSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __52__NFHardwareManager_startContactlessPaymentSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = +[NFHardwareManagerInterface interface]();
  +[NFHardwareManagerInterface updateContactlessInterface:]((uint64_t)NFHardwareManagerInterface, v7);

  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) _sessionAttribute];
  id v9 = (void *)[v10 copy];
  [v6 queueContactlessPaymentSession:v8 sessionAttribute:v9 completion:v5];
}

- (id)startContactlessSession:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "startContactlessSession:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = objc_alloc_init(NFContactlessSession);
  [(NFSession *)v6 setDidStartCallback:v4];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__NFHardwareManager_startContactlessSession___block_invoke;
  v14[3] = &unk_1E595DDA8;
  v14[4] = self;
  [(NFSession *)v6 setDidEndCallback:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__NFHardwareManager_startContactlessSession___block_invoke_2;
  v11[3] = &unk_1E595DE20;
  id v7 = v6;
  id v12 = v7;
  uint64_t v13 = self;
  id v8 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v7 queueBlock:v11];
  id v9 = v7;

  return v9;
}

uint64_t __45__NFHardwareManager_startContactlessSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __45__NFHardwareManager_startContactlessSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 _sessionAttribute];
  id v8 = (void *)[v9 copy];
  [v7 queueContactlessSession:v4 sessionAttribute:v8 completion:v6];
}

- (id)startSecureElementManagerSessionWithAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(NFSecureElementManagerSession);
  [(NFSession *)v8 setDidStartCallback:v7];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__NFHardwareManager_startSecureElementManagerSessionWithAttributes_completion___block_invoke;
  v18[3] = &unk_1E595DDA8;
  v18[4] = self;
  [(NFSession *)v8 setDidEndCallback:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__NFHardwareManager_startSecureElementManagerSessionWithAttributes_completion___block_invoke_2;
  v15[3] = &unk_1E595DE20;
  id v9 = v8;
  int v16 = v9;
  id v17 = v6;
  id v10 = v6;
  id v11 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v9 queueBlock:v15];
  id v12 = v17;
  uint64_t v13 = v9;

  return v13;
}

uint64_t __79__NFHardwareManager_startSecureElementManagerSessionWithAttributes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __79__NFHardwareManager_startSecureElementManagerSessionWithAttributes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = a2;
  id v6 = +[NFHardwareManagerInterface interface]();
  +[NFHardwareManagerInterface updateSEMInterface:]((uint64_t)NFHardwareManagerInterface, v6);

  [v7 queueSecureElementManagerSession:*(void *)(a1 + 32) sessionAttribute:*(void *)(a1 + 40) completion:v5];
}

- (id)startSecureElementManagerSessionWithPriority:(BOOL)a3 callback:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4) {
    id v7 = "startSecureElementManagerSessionWithPriority:Y callback:";
  }
  else {
    id v7 = "startSecureElementManagerSessionWithPriority:N callback:";
  }
  id v8 = _os_activity_create(&dword_19D636000, v7, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v8, &v13);
  os_activity_scope_leave(&v13);

  id v9 = [(NFHardwareManager *)self _sessionAttribute];
  id v10 = [NSNumber numberWithBool:v4];
  [v9 setObject:v10 forKeyedSubscript:@"session.high.priority"];

  id v11 = [(NFHardwareManager *)self startSecureElementManagerSessionWithAttributes:v9 completion:v6];

  return v11;
}

- (id)startSecureElementManagerSession:(id)a3
{
  return [(NFHardwareManager *)self startSecureElementManagerSessionWithPriority:0 callback:a3];
}

- (id)startSecureElementManagerSessionWithPriority:(id)a3
{
  return [(NFHardwareManager *)self startSecureElementManagerSessionWithPriority:1 callback:a3];
}

- (id)startLoyaltyAndContactlessPaymentSession:(id)a3
{
  return [(NFHardwareManager *)self _startLoyaltyAndContactlessPaymentSession:a3 force:0];
}

- (id)forceLoyaltyAndContactlessPaymentSession:(id)a3
{
  return [(NFHardwareManager *)self _startLoyaltyAndContactlessPaymentSession:a3 force:1];
}

- (id)_startLoyaltyAndContactlessPaymentSession:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    id v7 = "_startLoyaltyAndContactlessPaymentSession:force:Y";
  }
  else {
    id v7 = "_startLoyaltyAndContactlessPaymentSession:force:N";
  }
  id v8 = _os_activity_create(&dword_19D636000, v7, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  id v9 = objc_alloc_init(NFLoyaltyAndPaymentSession);
  [(NFSession *)v9 setDidStartCallback:v6];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__NFHardwareManager__startLoyaltyAndContactlessPaymentSession_force___block_invoke;
  v21[3] = &unk_1E595DDA8;
  v21[4] = self;
  [(NFSession *)v9 setDidEndCallback:v21];
  id v10 = [(NFHardwareManager *)self _sessionAttribute];
  id v11 = (void *)[v10 mutableCopy];

  if (v4) {
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"session.force.express.exit"];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__NFHardwareManager__startLoyaltyAndContactlessPaymentSession_force___block_invoke_2;
  v18[3] = &unk_1E595DE20;
  id v12 = v9;
  __int16 v19 = v12;
  id v20 = v11;
  id v13 = v11;
  id v14 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v12 queueBlock:v18];
  uint64_t v15 = v20;
  int v16 = v12;

  return v16;
}

uint64_t __69__NFHardwareManager__startLoyaltyAndContactlessPaymentSession_force___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __69__NFHardwareManager__startLoyaltyAndContactlessPaymentSession_force___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = a2;
  id v6 = +[NFHardwareManagerInterface interface]();
  +[NFHardwareManagerInterface updateContactlessInterface:]((uint64_t)NFHardwareManagerInterface, v6);

  [v7 queueLoyaltyAndPaymentSession:*(void *)(a1 + 32) sessionAttribute:*(void *)(a1 + 40) completion:v5];
}

- (id)startDigitalCarKeySession:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "startDigitalCarKeySession:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = objc_alloc_init(NFDigitalCarKeySession);
  [(NFSession *)v6 setDidStartCallback:v4];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__NFHardwareManager_startDigitalCarKeySession___block_invoke;
  v14[3] = &unk_1E595DDA8;
  v14[4] = self;
  [(NFSession *)v6 setDidEndCallback:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__NFHardwareManager_startDigitalCarKeySession___block_invoke_2;
  v11[3] = &unk_1E595DE20;
  id v7 = v6;
  id v12 = v7;
  id v13 = self;
  id v8 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v7 queueBlock:v11];
  id v9 = v7;

  return v9;
}

uint64_t __47__NFHardwareManager_startDigitalCarKeySession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __47__NFHardwareManager_startDigitalCarKeySession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = +[NFHardwareManagerInterface interface]();
  +[NFHardwareManagerInterface updateContactlessInterface:]((uint64_t)NFHardwareManagerInterface, v7);

  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) _sessionAttribute];
  id v9 = (void *)[v10 copy];
  [v6 queueLoyaltyAndPaymentSession:v8 sessionAttribute:v9 completion:v5];
}

- (id)startReaderSession:(id)a3
{
  return [(NFHardwareManager *)self startReaderSessionWithAttributes:&unk_1EEF35E18 completion:a3];
}

- (id)startReaderSessionWithActionSheetUI:(id)a3
{
  return [(NFHardwareManager *)self startReaderSessionWithAttributes:&unk_1EEF35E40 completion:a3];
}

- (id)startReaderSessionWithAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"session.show.corenfc.ui"];
  unsigned int v9 = [v8 BOOLValue];

  if (v9) {
    id v10 = "_startReaderSessionWithUI:CoreNFC callback:";
  }
  else {
    id v10 = "_startReaderSessionWithUI:None callback:";
  }
  id v11 = _os_activity_create(&dword_19D636000, v10, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  id v12 = [(NFHardwareManager *)self _sessionAttribute];
  if ([v6 count]) {
    [v12 addEntriesFromDictionary:v6];
  }
  id v13 = [[NFReaderSession alloc] initWithUIType:v9];
  [(NFSession *)v13 setDidStartCallback:v7];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__NFHardwareManager_startReaderSessionWithAttributes_completion___block_invoke;
  v21[3] = &unk_1E595DDA8;
  v21[4] = self;
  [(NFSession *)v13 setDidEndCallback:v21];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__NFHardwareManager_startReaderSessionWithAttributes_completion___block_invoke_2;
  v18[3] = &unk_1E595DE20;
  id v14 = v13;
  __int16 v19 = v14;
  id v20 = v12;
  id v15 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v14 queueBlock:v18];
  int v16 = v14;

  return v16;
}

uint64_t __65__NFHardwareManager_startReaderSessionWithAttributes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __65__NFHardwareManager_startReaderSessionWithAttributes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = +[NFHardwareManagerInterface interface]();
  +[NFHardwareManagerInterface updateReaderInterface:]((uint64_t)NFHardwareManagerInterface, v7);

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = (id)[*(id *)(a1 + 40) copy];
  [v6 queueReaderSessionInternal:v8 sessionAttribute:v9 completion:v5];
}

- (id)startSesHatSession:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _os_activity_create(&dword_19D636000, "startSesHatSession:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__6;
  v70 = __Block_byref_object_dispose__6;
  id v71 = 0;
  uint64_t v63 = 0;
  v64 = (int *)&v63;
  uint64_t v65 = 0x2020000000;
  int v66 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  id v7 = objc_alloc_init(NFSeshatSession);
  __int16 v40 = v5;
  [(NFSession *)v7 setDidStartCallback:v5];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __40__NFHardwareManager_startSesHatSession___block_invoke;
  v58[3] = &unk_1E595DDA8;
  v58[4] = self;
  id v45 = v7;
  [(NFSession *)v7 setDidEndCallback:v58];
  dispatch_semaphore_t v44 = dispatch_semaphore_create(0);
  uint64_t v8 = +[NFHardwareManagerInterface interface]();
  +[NFHardwareManagerInterface updateSeshatInterface:]((uint64_t)NFHardwareManagerInterface, v8);

  uint64_t v43 = MEMORY[0x1E4F143A8];
  uint64_t v42 = *MEMORY[0x1E4F28568];
  uint64_t v41 = *MEMORY[0x1E4F28228];
  id v9 = v60;
  id v10 = (const void **)MEMORY[0x1E4FBA898];
  while (1)
  {
    *((unsigned char *)v9 + 24) = 0;
    v51[0] = v43;
    v51[1] = 3221225472;
    v51[2] = __40__NFHardwareManager_startSesHatSession___block_invoke_2;
    v51[3] = &unk_1E595DE48;
    v51[4] = self;
    p_os_activity_scope_state_s state = &state;
    int v55 = &v63;
    __int16 v56 = &v59;
    SEL v57 = a2;
    id v11 = v45;
    __int16 v52 = v11;
    id v12 = v44;
    v53 = v12;
    id v13 = [(NFHardwareManager *)self remoteObjectProxyWithErrorHandler:v51];
    id v14 = [(NFHardwareManager *)self _sessionAttribute];
    id v15 = (void *)[v14 copy];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __40__NFHardwareManager_startSesHatSession___block_invoke_193;
    v46[3] = &unk_1E595DE70;
    v46[4] = self;
    int v16 = v11;
    __int16 v49 = &state;
    SEL v50 = a2;
    __int16 v47 = v16;
    id v17 = v12;
    __int16 v48 = v17;
    [v13 queueSeshatSession:v16 sessionAttribute:v15 completion:v46];

    dispatch_time_t v18 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v17, v18)) {
      break;
    }

    id v9 = v60;
    if (!*((unsigned char *)v60 + 24) || v64[6] >= 3) {
      goto LABEL_15;
    }
  }
  dispatch_get_specific(*v10);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v20 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v24 = 45;
    if (isMetaClass) {
      uint64_t v24 = 43;
    }
    v20(3, "%c[%{public}s %{public}s]:%i Failed to talk to proxy!!!", v24, ClassName, Name, 2145);
  }
  dispatch_get_specific(*v10);
  __int16 v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    id v26 = object_getClass(self);
    if (class_isMetaClass(v26)) {
      int v27 = 43;
    }
    else {
      int v27 = 45;
    }
    int v28 = object_getClassName(self);
    __int16 v29 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v75 = v27;
    __int16 v76 = 2082;
    v77 = v28;
    __int16 v78 = 2082;
    v79 = v29;
    __int16 v80 = 1024;
    int v81 = 2145;
    _os_log_impl(&dword_19D636000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to talk to proxy!!!", buf, 0x22u);
  }

  id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v31 = [NSString stringWithUTF8String:"nfcd"];
  v72[0] = v42;
  id v32 = [NSString stringWithUTF8String:"XPC Error"];
  v73[0] = v32;
  v73[1] = &unk_1EEF35998;
  v72[1] = @"Line";
  v72[2] = @"Method";
  uint64_t v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
  v73[2] = v33;
  v72[3] = v41;
  uint64_t v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 2146);
  v73[3] = v34;
  uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:4];
  uint64_t v36 = (void *)[v30 initWithDomain:v31 code:7 userInfo:v35];
  [(NFSession *)v16 didStartSession:v36];

  [(NFSession *)v16 resume];
  [(NFHardwareManager *)self invalidateConnection];

LABEL_15:
  int v37 = v16;

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&state, 8);

  return v37;
}

uint64_t __40__NFHardwareManager_startSesHatSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __40__NFHardwareManager_startSesHatSession___block_invoke_2(uint64_t a1, void *a2)
{
  v48[5] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v5 = [NSString stringWithUTF8String:"nfcd"];
  v47[0] = *MEMORY[0x1E4F28568];
  id v6 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  v48[0] = v6;
  v48[1] = v3;
  v47[1] = v7;
  v47[2] = @"Line";
  v48[2] = &unk_1EEF35968;
  v47[3] = @"Method";
  uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 80)));
  v48[3] = v8;
  v47[4] = *MEMORY[0x1E4F28228];
  id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 80)), 2106);
  v48[4] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:5];
  uint64_t v11 = [v4 initWithDomain:v5 code:7 userInfo:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  LODWORD(v6) = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v14 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  int v16 = (void (*)(uint64_t, const char *, ...))Logger;
  if ((int)v6 > 1)
  {
    if (Logger)
    {
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 80));
      uint64_t v27 = 45;
      if (isMetaClass) {
        uint64_t v27 = 43;
      }
      v16(3, "%c[%{public}s %{public}s]:%i %{public}@", v27, ClassName, Name, 2112, v3);
    }
    dispatch_get_specific(*v14);
    int v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      uint64_t v31 = object_getClassName(*(id *)(a1 + 32));
      id v32 = sel_getName(*(SEL *)(a1 + 80));
      *(_DWORD *)buf = 67110146;
      int v38 = v30;
      __int16 v39 = 2082;
      __int16 v40 = v31;
      __int16 v41 = 2082;
      uint64_t v42 = v32;
      __int16 v43 = 1024;
      int v44 = 2112;
      __int16 v45 = 2114;
      id v46 = v3;
      _os_log_impl(&dword_19D636000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    [*(id *)(a1 + 40) didStartSession:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    [*(id *)(a1 + 40) resume];
    [*(id *)(a1 + 32) invalidateConnection];
  }
  else
  {
    if (Logger)
    {
      id v17 = object_getClass(*(id *)(a1 + 32));
      BOOL v18 = class_isMetaClass(v17);
      uint64_t v33 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v35 = sel_getName(*(SEL *)(a1 + 80));
      uint64_t v19 = 45;
      if (v18) {
        uint64_t v19 = 43;
      }
      v16(3, "%c[%{public}s %{public}s]:%i Retrying xpc connection - proxy error: %{public}@", v19, v33, v35, 2108, v3);
    }
    dispatch_get_specific(*v14);
    id v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v21 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      __int16 v23 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v24 = sel_getName(*(SEL *)(a1 + 80));
      *(_DWORD *)buf = 67110146;
      int v38 = v22;
      __int16 v39 = 2082;
      __int16 v40 = v23;
      __int16 v41 = 2082;
      uint64_t v42 = v24;
      __int16 v43 = 1024;
      int v44 = 2108;
      __int16 v45 = 2114;
      id v46 = v3;
      _os_log_impl(&dword_19D636000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Retrying xpc connection - proxy error: %{public}@", buf, 0x2Cu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __40__NFHardwareManager_startSesHatSession___block_invoke_193(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(*(void *)(a1 + 32) + 24);
  objc_sync_enter(v7);
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  objc_sync_exit(v7);

  if (v6)
  {
    uint64_t v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 64));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 2128, v6);
    }
    dispatch_get_specific(*v8);
    id v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(*(id *)(a1 + 32));
      BOOL v18 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      int v37 = v16;
      __int16 v38 = 2082;
      __int16 v39 = v17;
      __int16 v40 = 2082;
      __int16 v41 = v18;
      __int16 v42 = 1024;
      int v43 = 2128;
      __int16 v44 = 2114;
      id v45 = v6;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v20 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v21 = [v6 code];
    v34[0] = *MEMORY[0x1E4F28568];
    int v22 = NSString;
    if ([v6 code] > 70) {
      uint64_t v23 = 71;
    }
    else {
      uint64_t v23 = [v6 code];
    }
    uint64_t v24 = [v22 stringWithUTF8String:NFResultCodeString_1[v23]];
    uint64_t v25 = *MEMORY[0x1E4F28A50];
    v35[0] = v24;
    v35[1] = v6;
    v34[1] = v25;
    void v34[2] = @"Line";
    v35[2] = &unk_1EEF35980;
    v34[3] = @"Method";
    id v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 64)));
    v35[3] = v26;
    v34[4] = *MEMORY[0x1E4F28228];
    uint64_t v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 64)), 2129);
    v35[4] = v27;
    int v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:5];
    uint64_t v29 = [v19 initWithDomain:v20 code:v21 userInfo:v28];
    uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;

    [*(id *)(a1 + 40) didStartSession:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
  else
  {
    [*(id *)(a1 + 40) setProxy:v5];
  }
  [*(id *)(a1 + 40) resume];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)preWarm
{
  return [(NFHardwareManager *)self preWarm:0];
}

- (BOOL)preWarm:(id *)a3
{
  id v6 = _os_activity_create(&dword_19D636000, "preWarm:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  id v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __29__NFHardwareManager_preWarm___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &state;
  v11[6] = a2;
  void v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __29__NFHardwareManager_preWarm___block_invoke_202;
  v10[3] = &unk_1E595CA18;
  v10[4] = self;
  void v10[5] = &v17;
  void v10[6] = &state;
  void v10[7] = a2;
  [v7 preWarmWithCompletion:v10];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __29__NFHardwareManager_preWarm___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 2178, v3);
  }
  dispatch_get_specific(*v4);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v30 = v12;
    __int16 v31 = 2082;
    id v32 = v13;
    __int16 v33 = 2082;
    uint64_t v34 = v14;
    __int16 v35 = 1024;
    int v36 = 2178;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v16 = [NSString stringWithUTF8String:"nfcd"];
  v27[0] = *MEMORY[0x1E4F28568];
  uint64_t v17 = [NSString stringWithUTF8String:"XPC Error"];
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = @"Line";
  v28[2] = &unk_1EEF359B0;
  v27[3] = @"Method";
  uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 48)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F28228];
  char v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 48)), 2179);
  v28[4] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
  uint64_t v22 = [v15 initWithDomain:v16 code:7 userInfo:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;

  [*(id *)(a1 + 32) invalidateConnection];
}

void __29__NFHardwareManager_preWarm___block_invoke_202(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 2187, v3);
    }
    dispatch_get_specific(*v4);
    id v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
      id v14 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v33 = v12;
      __int16 v34 = 2082;
      __int16 v35 = v13;
      __int16 v36 = 2082;
      __int16 v37 = v14;
      __int16 v38 = 1024;
      int v39 = 2187;
      __int16 v40 = 2114;
      id v41 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v16 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v17 = [v3 code];
    v30[0] = *MEMORY[0x1E4F28568];
    uint64_t v18 = NSString;
    if ([v3 code] > 70) {
      uint64_t v19 = 71;
    }
    else {
      uint64_t v19 = [v3 code];
    }
    char v20 = [v18 stringWithUTF8String:NFResultCodeString_1[v19]];
    uint64_t v21 = *MEMORY[0x1E4F28A50];
    v31[0] = v20;
    v31[1] = v3;
    v30[1] = v21;
    v30[2] = @"Line";
    v31[2] = &unk_1EEF359C8;
    void v30[3] = @"Method";
    uint64_t v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(*(SEL *)(a1 + 56)));
    v31[3] = v22;
    v30[4] = *MEMORY[0x1E4F28228];
    uint64_t v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(*(SEL *)(a1 + 56)), 2188);
    void v31[4] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:5];
    uint64_t v25 = [v15 initWithDomain:v16 code:v17 userInfo:v24];
    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 101) = 1;
  }
}

- (id)startTrustSession:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "startTrustSession:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = objc_alloc_init(NFTrustSession);
  [(NFSession *)v6 setDidStartCallback:v4];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__NFHardwareManager_startTrustSession___block_invoke;
  v14[3] = &unk_1E595DDA8;
  v14[4] = self;
  [(NFSession *)v6 setDidEndCallback:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__NFHardwareManager_startTrustSession___block_invoke_2;
  v11[3] = &unk_1E595DE20;
  id v7 = v6;
  int v12 = v7;
  uint64_t v13 = self;
  id v8 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v7 queueBlock:v11];
  uint64_t v9 = v7;

  return v9;
}

uint64_t __39__NFHardwareManager_startTrustSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __39__NFHardwareManager_startTrustSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 _sessionAttribute];
  id v8 = (void *)[v9 copy];
  [v7 queueTrustSession:v4 sessionAttribute:v8 completion:v6];
}

- (id)startSecureElementLoggingSession:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "startSecureElementLoggingSession:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = objc_alloc_init(NFSecureElementLoggingSession);
  [(NFSession *)v6 setDidStartCallback:v4];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__NFHardwareManager_startSecureElementLoggingSession___block_invoke;
  v14[3] = &unk_1E595DDA8;
  v14[4] = self;
  [(NFSession *)v6 setDidEndCallback:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__NFHardwareManager_startSecureElementLoggingSession___block_invoke_2;
  v11[3] = &unk_1E595DE20;
  id v7 = v6;
  int v12 = v7;
  uint64_t v13 = self;
  id v8 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v7 queueBlock:v11];
  id v9 = v7;

  return v9;
}

uint64_t __54__NFHardwareManager_startSecureElementLoggingSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __54__NFHardwareManager_startSecureElementLoggingSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 _sessionAttribute];
  id v8 = (void *)[v9 copy];
  [v7 queueSecureElementLoggingSession:v4 sessionAttribute:v8 completion:v6];
}

- (id)startPeerPaymentSession:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "startPeerPaymentSession:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = objc_alloc_init(NFPeerPaymentSession);
  [(NFSession *)v6 setDidStartCallback:v4];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__NFHardwareManager_startPeerPaymentSession___block_invoke;
  v14[3] = &unk_1E595DDA8;
  v14[4] = self;
  [(NFSession *)v6 setDidEndCallback:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__NFHardwareManager_startPeerPaymentSession___block_invoke_2;
  v11[3] = &unk_1E595DE20;
  id v7 = v6;
  int v12 = v7;
  uint64_t v13 = self;
  id v8 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v7 queueBlock:v11];
  id v9 = v7;

  return v9;
}

uint64_t __45__NFHardwareManager_startPeerPaymentSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __45__NFHardwareManager_startPeerPaymentSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 _sessionAttribute];
  id v8 = (void *)[v9 copy];
  [v7 queuePeerPaymentSession:v4 sessionAttribute:v8 completion:v6];
}

- (id)startNdefTagSession:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "startNdefTagSession:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = objc_alloc_init(NFNdefTagSession);
  [(NFSession *)v6 setDidStartCallback:v4];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__NFHardwareManager_startNdefTagSession___block_invoke;
  v14[3] = &unk_1E595DDA8;
  v14[4] = self;
  [(NFSession *)v6 setDidEndCallback:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__NFHardwareManager_startNdefTagSession___block_invoke_2;
  v11[3] = &unk_1E595DE20;
  id v7 = v6;
  int v12 = v7;
  uint64_t v13 = self;
  id v8 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v7 queueBlock:v11];
  id v9 = v7;

  return v9;
}

uint64_t __41__NFHardwareManager_startNdefTagSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __41__NFHardwareManager_startNdefTagSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 _sessionAttribute];
  id v8 = (void *)[v9 copy];
  [v7 queueNdefTagSession:v4 sessionAttribute:v8 data:0 completion:v6];
}

- (id)startNdefTagSessionWithBluetoothLESecureOOBData:(id)a3 callback:(id)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = _os_activity_create(&dword_19D636000, "startNdefTagSessionWithBluetoothLESecureOOBData:callback:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)os_activity_scope_state_s state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v9, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  id v10 = objc_alloc_init(NFNdefTagSession);
  [(NFSession *)v10 setDidStartCallback:v7];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __78__NFHardwareManager_startNdefTagSessionWithBluetoothLESecureOOBData_callback___block_invoke;
  v39[3] = &unk_1E595DDA8;
  v39[4] = self;
  [(NFSession *)v10 setDidEndCallback:v39];
  uint64_t v11 = +[NFNdefTagSession generateBluetoothLESecureNdefPayloadWithOOBData:v8];

  if (!v8 || v11)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __78__NFHardwareManager_startNdefTagSessionWithBluetoothLESecureOOBData_callback___block_invoke_210;
    v35[3] = &unk_1E595DE98;
    uint64_t v29 = v10;
    __int16 v36 = v29;
    __int16 v37 = self;
    id v38 = v11;
    id v30 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v29 queueBlock:v35];
    __int16 v31 = v29;

    id v16 = v36;
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v13 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v48[0] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    id v16 = (NFNdefTagSession *)[v12 initWithDomain:v13 code:10 userInfo:v15];

    uint64_t v17 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v22 = 45;
      if (isMetaClass) {
        uint64_t v22 = 43;
      }
      v19(3, "%c[%{public}s %{public}s]:%i Invalid oobdata: %{public}@", v22, ClassName, Name, 2275, v16);
    }
    dispatch_get_specific(*v17);
    uint64_t v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      uint64_t v26 = object_getClassName(self);
      uint64_t v27 = sel_getName(a2);
      *(_DWORD *)os_activity_scope_state_s state = 67110146;
      *(_DWORD *)&state[4] = v25;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v26;
      __int16 v41 = 2082;
      uint64_t v42 = v27;
      __int16 v43 = 1024;
      int v44 = 2275;
      __int16 v45 = 2114;
      uint64_t v46 = v16;
      _os_log_impl(&dword_19D636000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid oobdata: %{public}@", state, 0x2Cu);
    }

    [(NFSession *)v10 didStartSession:v16];
    [(NFSession *)v10 resume];
    int v28 = v10;
  }

  return v10;
}

uint64_t __78__NFHardwareManager_startNdefTagSessionWithBluetoothLESecureOOBData_callback___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __78__NFHardwareManager_startNdefTagSessionWithBluetoothLESecureOOBData_callback___block_invoke_210(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1[4];
  id v6 = (void *)a1[5];
  id v7 = a3;
  id v8 = a2;
  id v10 = [v6 _sessionAttribute];
  id v9 = (void *)[v10 copy];
  [v8 queueNdefTagSession:v5 sessionAttribute:v9 data:a1[6] completion:v7];
}

- (id)startHCESession:(id)a3
{
  return [(NFHardwareManager *)self startHCESessionWithConfiguration:MEMORY[0x1E4F1CC08] completion:a3];
}

- (id)startHCESessionWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_19D636000, "startHCESessionWithConfiguration:completion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  id v9 = objc_alloc_init(NFHCESession);
  [(NFSession *)v9 setDidStartCallback:v7];

  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __65__NFHardwareManager_startHCESessionWithConfiguration_completion___block_invoke;
  v45[3] = &unk_1E595DDA8;
  v45[4] = self;
  [(NFSession *)v9 setDidEndCallback:v45];
  id v10 = [(NFHardwareManager *)self _sessionAttribute];
  uint64_t v11 = objc_msgSend(v6, "NF_arrayForKey:", @"StartOnECP");
  if ([v11 count]) {
    [v10 setObject:v11 forKeyedSubscript:@"StartOnECP"];
  }
  id v12 = objc_msgSend(v6, "NF_numberForKey:", @"EmulationOnSessionStart");

  if (v12)
  {
    uint64_t v13 = [v6 objectForKeyedSubscript:@"EmulationOnSessionStart"];
    [v10 setObject:v13 forKeyedSubscript:@"EmulationOnSessionStart"];
  }
  id v14 = objc_msgSend(v6, "NF_numberForKey:", @"ReadOnReaderConnected");

  if (v14)
  {
    id v15 = [v6 objectForKeyedSubscript:@"ReadOnReaderConnected"];
    [v10 setObject:v15 forKeyedSubscript:@"ReadOnReaderConnected"];
  }
  id v16 = objc_msgSend(v6, "NF_numberForKey:", @"SuspendOnDisconnect");

  if (v16)
  {
    uint64_t v17 = [v6 objectForKeyedSubscript:@"SuspendOnDisconnect"];
    [v10 setObject:v17 forKeyedSubscript:@"SuspendOnDisconnect"];
  }
  uint64_t v18 = objc_msgSend(v6, "NF_numberForKey:", @"BackgroundTagReadingECP");

  if (v18)
  {
    uint64_t v19 = [v6 objectForKeyedSubscript:@"BackgroundTagReadingECP"];
    [v10 setObject:v19 forKeyedSubscript:@"BackgroundTagReadingECP"];
  }
  char v20 = objc_msgSend(v6, "NF_numberForKey:", @"ListenOnAllField");

  if (v20)
  {
    uint64_t v21 = [v6 objectForKeyedSubscript:@"ListenOnAllField"];
    [v10 setObject:v21 forKeyedSubscript:@"ListenOnAllField"];
  }
  uint64_t v22 = objc_msgSend(v6, "NF_numberForKey:", @"FDRestartOnMatchingECPTermInfo");

  if (v22)
  {
    uint64_t v23 = [v6 objectForKeyedSubscript:@"FDRestartOnMatchingECPTermInfo"];
    [v10 setObject:v23 forKeyedSubscript:@"FDRestartOnMatchingECPTermInfo"];
  }
  uint64_t v24 = objc_msgSend(v6, "NF_dataForKey:", @"ECPBroadcast");

  if (v24)
  {
    int v25 = [v6 objectForKeyedSubscript:@"ECPBroadcast"];
    [v10 setObject:v25 forKeyedSubscript:@"ECPBroadcast"];
  }
  uint64_t v26 = objc_msgSend(v6, "NF_numberForKey:", @"ECPBroadcastInterval");

  if (v26)
  {
    uint64_t v27 = [v6 objectForKeyedSubscript:@"ECPBroadcastInterval"];
    [v10 setObject:v27 forKeyedSubscript:@"ECPBroadcastInterval"];
  }
  int v28 = objc_msgSend(v6, "NF_numberForKey:", @"ECPBroadcastPollDuration");

  if (v28)
  {
    uint64_t v29 = [v6 objectForKeyedSubscript:@"ECPBroadcastPollDuration"];
    [v10 setObject:v29 forKeyedSubscript:@"ECPBroadcastPollDuration"];
  }
  id v30 = objc_msgSend(v6, "NF_arrayForKey:", @"ECPBroadcastFieldMatch");

  if (v30)
  {
    __int16 v31 = [v6 objectForKeyedSubscript:@"ECPBroadcastFieldMatch"];
    [v10 setObject:v31 forKeyedSubscript:@"ECPBroadcastFieldMatch"];
  }
  id v32 = objc_msgSend(v6, "NF_numberForKey:", @"disableAutostartOnField");

  if (v32)
  {
    int v33 = [v6 objectForKeyedSubscript:@"disableAutostartOnField"];
    [v10 setObject:v33 forKeyedSubscript:@"disableAutostartOnField"];
  }
  __int16 v34 = objc_msgSend(v6, "NF_dataForKey:", @"bkgTagReadECPOverride");

  if (v34)
  {
    __int16 v35 = [v6 objectForKeyedSubscript:@"bkgTagReadECPOverride"];
    [v10 setObject:v35 forKeyedSubscript:@"bkgTagReadECPOverride"];
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __65__NFHardwareManager_startHCESessionWithConfiguration_completion___block_invoke_2;
  v42[3] = &unk_1E595DE20;
  __int16 v36 = v9;
  __int16 v43 = v36;
  int v44 = v10;
  id v37 = v10;
  id v38 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v36 queueBlock:v42];
  int v39 = v44;
  __int16 v40 = v36;

  return v40;
}

uint64_t __65__NFHardwareManager_startHCESessionWithConfiguration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

uint64_t __65__NFHardwareManager_startHCESessionWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 queueHostEmulationSession:*(void *)(a1 + 32) sessionAttribute:*(void *)(a1 + 40) completion:a3];
}

- (id)startSecureElementAndHCESession:(id)a3
{
  return [(NFHardwareManager *)self startSecureElementAndHCESessionWithConfiguration:MEMORY[0x1E4F1CC08] completion:a3];
}

- (id)startSecureElementAndHCESessionWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_19D636000, "startSecureElementAndHCESessionWithConfiguration:completion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  id v9 = objc_alloc_init(NFSecureElementAndHostCardEmulationSession);
  [(NFSession *)v9 setDidStartCallback:v7];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __81__NFHardwareManager_startSecureElementAndHCESessionWithConfiguration_completion___block_invoke;
  v22[3] = &unk_1E595DDA8;
  v22[4] = self;
  [(NFSession *)v9 setDidEndCallback:v22];
  id v10 = [(NFHardwareManager *)self _sessionAttribute];
  uint64_t v11 = objc_msgSend(v6, "NF_numberForKey:", @"EmulationOnSessionStart");

  if (v11)
  {
    id v12 = [v6 objectForKeyedSubscript:@"EmulationOnSessionStart"];
    [v10 setObject:v12 forKeyedSubscript:@"EmulationOnSessionStart"];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81__NFHardwareManager_startSecureElementAndHCESessionWithConfiguration_completion___block_invoke_2;
  v19[3] = &unk_1E595DE20;
  uint64_t v13 = v9;
  char v20 = v13;
  uint64_t v21 = v10;
  id v14 = v10;
  id v15 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v13 queueBlock:v19];
  id v16 = v21;
  uint64_t v17 = v13;

  return v17;
}

uint64_t __81__NFHardwareManager_startSecureElementAndHCESessionWithConfiguration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

uint64_t __81__NFHardwareManager_startSecureElementAndHCESessionWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 queueSecureElementAndHostEmulationSession:*(void *)(a1 + 32) sessionAttribute:*(void *)(a1 + 40) completion:a3];
}

- (id)startSecureElementReaderSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_19D636000, "startSecureElementReaderSession:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = objc_alloc_init(NFSecureElementReaderSession);
  [(NFSession *)v6 setDidStartCallback:v4];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__NFHardwareManager_startSecureElementReaderSession___block_invoke;
  v14[3] = &unk_1E595DDA8;
  v14[4] = self;
  [(NFSession *)v6 setDidEndCallback:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__NFHardwareManager_startSecureElementReaderSession___block_invoke_2;
  v11[3] = &unk_1E595DE20;
  id v7 = v6;
  id v12 = v7;
  uint64_t v13 = self;
  id v8 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v7 queueBlock:v11];
  id v9 = v7;

  return v9;
}

uint64_t __53__NFHardwareManager_startSecureElementReaderSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __53__NFHardwareManager_startSecureElementReaderSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 _sessionAttribute];
  id v8 = (void *)[v9 copy];
  [v7 queueSecureElementReaderSession:v4 sessionAttribute:v8 completion:v6];
}

- (id)startSecureTransactionServicesSessionWithRole:(unint64_t)a3 connectionHandoverCofig:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = _os_activity_create(&dword_19D636000, "startSecureTransactionServicesSessionWithRole:connectionHandoverCofig:completion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  id v10 = objc_alloc_init(NFSecureTransactionServicesHandoverSession);
  [(NFSession *)v10 setDidStartCallback:v8];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __102__NFHardwareManager_startSecureTransactionServicesSessionWithRole_connectionHandoverCofig_completion___block_invoke;
  v27[3] = &unk_1E595DDA8;
  v27[4] = self;
  [(NFSession *)v10 setDidEndCallback:v27];
  unint64_t v12 = 2 * (a4 & 1);
  if ((a4 & 2) != 0)
  {
    switch(a3)
    {
      case 0uLL:
        uint64_t v13 = 0;
        v12 |= 4uLL;
        break;
      case 1uLL:
        v12 |= 0xCuLL;
        goto LABEL_12;
      case 2uLL:
        goto LABEL_9;
      case 3uLL:
        goto LABEL_10;
      default:
        goto LABEL_8;
    }
  }
  else if (v11)
  {
LABEL_10:
    uint64_t v13 = 4;
  }
  else if (a3 == 2)
  {
LABEL_9:
    uint64_t v13 = 3;
  }
  else if (a3 == 1)
  {
LABEL_12:
    uint64_t v13 = 1;
  }
  else
  {
LABEL_8:
    uint64_t v13 = 0;
  }
  unint64_t v14 = (a4 >> 1) & 0x1C | (a4 >> 2) & 1 | v12;
  id v15 = [(NFHardwareManager *)self _sessionAttribute];
  id v16 = [NSNumber numberWithUnsignedInteger:v13];
  [v15 setObject:v16 forKeyedSubscript:@"session.sts.handover.role"];

  uint64_t v17 = [NSNumber numberWithUnsignedInteger:v14];
  [v15 setObject:v17 forKeyedSubscript:@"session.sts.handover.type"];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __102__NFHardwareManager_startSecureTransactionServicesSessionWithRole_connectionHandoverCofig_completion___block_invoke_2;
  v24[3] = &unk_1E595DE20;
  uint64_t v18 = v10;
  int v25 = v18;
  uint64_t v26 = v15;
  id v19 = v15;
  id v20 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v18 queueBlock:v24];
  uint64_t v21 = v26;
  uint64_t v22 = v18;

  return v22;
}

uint64_t __102__NFHardwareManager_startSecureTransactionServicesSessionWithRole_connectionHandoverCofig_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __102__NFHardwareManager_startSecureTransactionServicesSessionWithRole_connectionHandoverCofig_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = +[NFHardwareManagerInterface interface]();
  +[NFHardwareManagerInterface updateHandoverInterface:]((uint64_t)NFHardwareManagerInterface, v7);

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = (id)[*(id *)(a1 + 40) copy];
  [v6 queueSecureTransactionServicesSession:v8 sessionAttribute:v9 completion:v5];
}

- (id)startHandoverHybridSessionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "startHandoverHybridSessionWithCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = objc_alloc_init(NFSecureTransactionServicesHandoverHybridSession);
  [(NFSession *)v6 setDidStartCallback:v4];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__NFHardwareManager_startHandoverHybridSessionWithCompletion___block_invoke;
  v19[3] = &unk_1E595DDA8;
  void v19[4] = self;
  [(NFSession *)v6 setDidEndCallback:v19];
  id v7 = [(NFHardwareManager *)self _sessionAttribute];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:0];
  [v7 setObject:v8 forKeyedSubscript:@"session.sts.handover.role"];

  id v9 = [NSNumber numberWithUnsignedInteger:4];
  [v7 setObject:v9 forKeyedSubscript:@"session.sts.handover.type"];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __62__NFHardwareManager_startHandoverHybridSessionWithCompletion___block_invoke_2;
  v16[3] = &unk_1E595DE20;
  id v10 = v6;
  uint64_t v17 = v10;
  uint64_t v18 = v7;
  id v11 = v7;
  id v12 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v10 queueBlock:v16];
  uint64_t v13 = v18;
  unint64_t v14 = v10;

  return v14;
}

uint64_t __62__NFHardwareManager_startHandoverHybridSessionWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __62__NFHardwareManager_startHandoverHybridSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = +[NFHardwareManagerInterface interface]();
  +[NFHardwareManagerInterface updateHandoverInterface:]((uint64_t)NFHardwareManagerInterface, v7);

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = (id)[*(id *)(a1 + 40) copy];
  [v6 queueSecureTransactionServicesHybridSession:v8 sessionAttribute:v9 completion:v5];
}

- (id)startUnifiedAccessSession:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19D636000, "startUnifiedAccessSession:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = objc_alloc_init(NFUnifiedAccessSession);
  [(NFSession *)v6 setDidStartCallback:v4];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__NFHardwareManager_startUnifiedAccessSession___block_invoke;
  v14[3] = &unk_1E595DDA8;
  v14[4] = self;
  [(NFSession *)v6 setDidEndCallback:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__NFHardwareManager_startUnifiedAccessSession___block_invoke_2;
  v11[3] = &unk_1E595DE20;
  id v7 = v6;
  id v12 = v7;
  uint64_t v13 = self;
  id v8 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v7 queueBlock:v11];
  id v9 = v7;

  return v9;
}

uint64_t __47__NFHardwareManager_startUnifiedAccessSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __47__NFHardwareManager_startUnifiedAccessSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = +[NFHardwareManagerInterface interface]();
  +[NFHardwareManagerInterface updateContactlessInterface:]((uint64_t)NFHardwareManagerInterface, v7);

  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) _sessionAttribute];
  id v9 = (void *)[v10 copy];
  [v6 queueUnifiedAccessSession:v8 sessionAttribute:v9 completion:v5];
}

- (id)startLPEMConfigSession:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(NFLPEMConfigSession);
  [(NFSession *)v5 setDidStartCallback:v4];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__NFHardwareManager_startLPEMConfigSession___block_invoke;
  v13[3] = &unk_1E595DDA8;
  v13[4] = self;
  [(NFSession *)v5 setDidEndCallback:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __44__NFHardwareManager_startLPEMConfigSession___block_invoke_2;
  v10[3] = &unk_1E595DE20;
  id v6 = v5;
  id v11 = v6;
  id v12 = self;
  id v7 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v6 queueBlock:v10];
  uint64_t v8 = v6;

  return v8;
}

uint64_t __44__NFHardwareManager_startLPEMConfigSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __44__NFHardwareManager_startLPEMConfigSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 _sessionAttribute];
  uint64_t v8 = (void *)[v9 copy];
  [v7 queueLPEMConfigSession:v4 sessionAttribute:v8 completion:v6];
}

- (id)startCredentialSession:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  [v5 setDidStartCallback:v4];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__NFHardwareManager_startCredentialSession___block_invoke;
  v13[3] = &unk_1E595DDA8;
  v13[4] = self;
  [v5 setDidEndCallback:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __44__NFHardwareManager_startCredentialSession___block_invoke_2;
  v10[3] = &unk_1E595DE20;
  id v6 = v5;
  id v11 = v6;
  id v12 = self;
  id v7 = [(NFHardwareManager *)self _synchronousQueueSessionWithRetry:v6 queueBlock:v10];
  id v8 = v6;

  return v8;
}

uint64_t __44__NFHardwareManager_startCredentialSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionDidEnd:a2];
}

void __44__NFHardwareManager_startCredentialSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 _sessionAttribute];
  id v8 = (void *)[v9 copy];
  [v7 queueCredentialSession:v4 sessionAttribute:v8 completion:v6];
}

- (void)configureReaderModeRFForTransitPartner:(BOOL)a3 transitPartner:(unsigned int)a4 callback:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  BOOL v6 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = _os_activity_create(&dword_19D636000, "configureReaderModeRFForTransitPartner:Y transitPartner:callback:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)os_activity_scope_state_s state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v10, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  id v11 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v13(6, "%c[%{public}s %{public}s]:%i ", v17, ClassName, Name, 2588);
  }
  dispatch_get_specific(*v11);
  uint64_t v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    uint64_t v21 = object_getClassName(self);
    uint64_t v22 = sel_getName(a2);
    *(_DWORD *)os_activity_scope_state_s state = 67109890;
    *(_DWORD *)&state[4] = v20;
    *(_WORD *)&state[8] = 2082;
    *(void *)&state[10] = v21;
    __int16 v30 = 2082;
    __int16 v31 = v22;
    __int16 v32 = 1024;
    int v33 = 2588;
    _os_log_impl(&dword_19D636000, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", state, 0x22u);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __84__NFHardwareManager_configureReaderModeRFForTransitPartner_transitPartner_callback___block_invoke;
  v26[3] = &unk_1E595DEC0;
  id v27 = v9;
  SEL v28 = a2;
  v26[4] = self;
  id v23 = v9;
  uint64_t v24 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v26];
  [v24 configureReaderModeRFForTransitPartner:v6 transitPartner:v5 completion:v23];
}

void __84__NFHardwareManager_configureReaderModeRFForTransitPartner_transitPartner_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    BOOL v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i XPC Failure: %{public}@", v9, ClassName, Name, 2591, v3);
  }
  dispatch_get_specific(*v4);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
    unint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    int v20 = v13;
    __int16 v21 = 2082;
    uint64_t v22 = v14;
    __int16 v23 = 1024;
    int v24 = 2591;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Failure: %{public}@", buf, 0x2Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)isInRestrictedMode
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(NSDictionary *)v2->_secureElementsById allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isInRestrictedMode])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)areSessionsAllowed
{
  id v3 = _os_activity_create(&dword_19D636000, "areSessionsAllowed", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v4 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_265];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__NFHardwareManager_areSessionsAllowed__block_invoke_2;
  v6[3] = &unk_1E595DF08;
  v6[4] = &state;
  [v4 areSessionsAllowedWithCompletion:v6];

  LOBYTE(v4) = *(unsigned char *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return (char)v4;
}

uint64_t __39__NFHardwareManager_areSessionsAllowed__block_invoke_2(uint64_t result, char a2, uint64_t a3)
{
  if (!a3) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  }
  return result;
}

- (void)invalidateConnection
{
  id v3 = _os_activity_create(&dword_19D636000, "invalidateConnection", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  os_activity_scope_leave(&v6);

  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NFXPCServiceClient *)v4->_xpc removeDelegate:v4];
  xpc = v4->_xpc;
  v4->_xpc = 0;

  v4->_hasEventListener = 0;
  objc_sync_exit(v4);
}

- (BOOL)isBackgroundTagReadingAvailable
{
  id v3 = _os_activity_create(&dword_19D636000, "isBackgroundTagReadingAvailable", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  os_activity_scope_leave(&v6);

  uint64_t v4 = [(NFHardwareManager *)self controllerInfo];
  LOBYTE(v3) = [v4 hasAntenna];

  return (char)v3;
}

- (BOOL)suspendBackgroundTagReading
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _os_activity_create(&dword_19D636000, "suspendBackgroundTagReading", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)os_activity_scope_state_s state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v4, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x2020000000;
  BOOL v5 = 1;
  int v26 = 1;
  os_activity_scope_state_s v6 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_269];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __48__NFHardwareManager_suspendBackgroundTagReading__block_invoke_2;
  v22[3] = &unk_1E595DF30;
  v22[4] = &v23;
  [v6 updateBackgroundTagReading:0 completion:v22];

  int v7 = *((_DWORD *)v24 + 6);
  if (v7 != 2)
  {
    if (v7 == 1)
    {
      uint64_t v8 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        long long v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v14 = 45;
        if (isMetaClass) {
          uint64_t v14 = 43;
        }
        v10(3, "%c[%{public}s %{public}s]:%i Hardware unsupported; assume it's disabled",
          v14,
          ClassName,
          Name,
          2721);
      }
      dispatch_get_specific(*v8);
      id v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = object_getClass(self);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        int v18 = object_getClassName(self);
        __int16 v19 = sel_getName(a2);
        *(_DWORD *)os_activity_scope_state_s state = 67109890;
        *(_DWORD *)&state[4] = v17;
        *(_WORD *)&state[8] = 2082;
        *(void *)&state[10] = v18;
        __int16 v28 = 2082;
        uint64_t v29 = v19;
        __int16 v30 = 1024;
        int v31 = 2721;
        _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Hardware unsupported; assume it's disabled",
          state,
          0x22u);
      }
    }
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v23, 8);
  return v5;
}

uint64_t __48__NFHardwareManager_suspendBackgroundTagReading__block_invoke_2(uint64_t result, uint64_t a2, int a3)
{
  if (!a2) {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  }
  return result;
}

- (void)setSuspendBackgroundTagReading:(BOOL)a3
{
  if (a3)
  {
    BOOL v5 = _os_activity_create(&dword_19D636000, "setSuspendBackgroundTagReading:Y", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    os_activity_scope_leave(&state);
    uint64_t v6 = 3;
  }
  else
  {
    uint64_t v6 = 2;
    BOOL v5 = _os_activity_create(&dword_19D636000, "setSuspendBackgroundTagReading:N", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    os_activity_scope_leave(&state);
  }

  int v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_272];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__NFHardwareManager_setSuspendBackgroundTagReading___block_invoke_2;
  v8[3] = &unk_1E595DF58;
  int v9 = v6;
  v8[4] = self;
  void v8[5] = a2;
  [v7 updateBackgroundTagReading:v6 completion:v8];
}

void __52__NFHardwareManager_setSuspendBackgroundTagReading___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a2 || *(_DWORD *)(a1 + 48) != a3)
  {
    uint64_t v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 40));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i Error in setting state", v10, ClassName, Name, 2742);
    }
    dispatch_get_specific(*v4);
    long long v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      id v15 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      int v18 = v13;
      __int16 v19 = 2082;
      int v20 = v14;
      __int16 v21 = 2082;
      uint64_t v22 = v15;
      __int16 v23 = 1024;
      int v24 = 2742;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error in setting state", buf, 0x22u);
    }
  }
}

- (void)actOnUserInitiatedSystemShutDown:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_19D636000, "actOnUserInitiatedSystemShutDown:completion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__NFHardwareManager_actOnUserInitiatedSystemShutDown_completion___block_invoke;
  v15[3] = &unk_1E595DEC0;
  void v15[4] = self;
  SEL v17 = a2;
  id v9 = v7;
  id v16 = v9;
  uint64_t v10 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__NFHardwareManager_actOnUserInitiatedSystemShutDown_completion___block_invoke_274;
  v12[3] = &unk_1E595DF80;
  id v13 = v9;
  SEL v14 = a2;
  v12[4] = self;
  id v11 = v9;
  [v10 actOnUserInitiatedSystemShutDown:v4 completion:v12];
}

void __65__NFHardwareManager_actOnUserInitiatedSystemShutDown_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 2752, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    SEL v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v18 = v12;
    __int16 v19 = 2082;
    int v20 = v13;
    __int16 v21 = 2082;
    uint64_t v22 = v14;
    __int16 v23 = 1024;
    int v24 = 2752;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65__NFHardwareManager_actOnUserInitiatedSystemShutDown_completion___block_invoke_274(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v4 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v8 = 45;
    if (isMetaClass) {
      uint64_t v8 = 43;
    }
    v4(6, "%c[%{public}s %{public}s]:%i Done", v8, ClassName, Name, 2755);
  }
  dispatch_get_specific(*v2);
  uint64_t v9 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v10)) {
      int v11 = 43;
    }
    else {
      int v11 = 45;
    }
    int v12 = object_getClassName(*(id *)(a1 + 32));
    id v13 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v11;
    __int16 v18 = 2082;
    __int16 v19 = v12;
    __int16 v20 = 2082;
    __int16 v21 = v13;
    __int16 v22 = 1024;
    int v23 = 2755;
    _os_log_impl(&dword_19D636000, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Done", buf, 0x22u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)setChipscope:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    uint64_t v6 = "setChipscope:Y";
  }
  else {
    uint64_t v6 = "setChipscope:N";
  }
  id v7 = _os_activity_create(&dword_19D636000, v6, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__NFHardwareManager_setChipscope___block_invoke;
  v12[3] = &unk_1E595CBD0;
  void v12[5] = &state;
  void v12[6] = a2;
  v12[4] = self;
  uint64_t v8 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__NFHardwareManager_setChipscope___block_invoke_276;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &state;
  v11[6] = a2;
  void v11[4] = self;
  [v8 setChipscope:v3 completion:v11];

  id v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __34__NFHardwareManager_setChipscope___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 2771, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    __int16 v22 = v13;
    __int16 v23 = 2082;
    uint64_t v24 = v14;
    __int16 v25 = 1024;
    int v26 = 2771;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __34__NFHardwareManager_setChipscope___block_invoke_276(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 2775, v4);
    }
    dispatch_get_specific(*v5);
    int v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      __int16 v21 = v14;
      __int16 v22 = 2082;
      __int16 v23 = v15;
      __int16 v24 = 1024;
      int v25 = 2775;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)getLPEMFTALogging:(id *)a3
{
  uint64_t v6 = _os_activity_create(&dword_19D636000, "getLPEMFTALogging:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__6;
  __int16 v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__NFHardwareManager_getLPEMFTALogging___block_invoke;
  v11[3] = &unk_1E595CBD0;
  void v11[5] = &state;
  v11[6] = a2;
  void v11[4] = self;
  id v7 = [(NFHardwareManager *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __39__NFHardwareManager_getLPEMFTALogging___block_invoke_277;
  v10[3] = &unk_1E595DC40;
  void v10[4] = self;
  void v10[5] = &state;
  void v10[6] = &v12;
  void v10[7] = a2;
  [v7 getLPEMFTALoggingWithCompletion:v10];

  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&state, 8);
  return v8;
}

void __39__NFHardwareManager_getLPEMFTALogging___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 2791, v3);
  }
  dispatch_get_specific(*v4);
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    int v13 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    int v20 = v12;
    __int16 v21 = 2082;
    id v22 = v13;
    __int16 v23 = 2082;
    __int16 v24 = v14;
    __int16 v25 = 1024;
    int v26 = 2791;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

void __39__NFHardwareManager_getLPEMFTALogging___block_invoke_277(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    id v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 2795, v6);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(*(id *)(a1 + 32));
      __int16 v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      int v24 = v16;
      __int16 v25 = 2082;
      int v26 = v17;
      __int16 v27 = 2082;
      id v28 = v18;
      __int16 v29 = 1024;
      int v30 = 2795;
      __int16 v31 = 2114;
      id v32 = v6;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v20 = a2;
  }
  else
  {
    uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v20 = a3;
  }
  objc_storeStrong(v19, v20);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_listeningQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_waitingClients, 0);
  objc_storeStrong((id *)&self->_secureElementsById, 0);
  objc_storeStrong((id *)&self->_eventListeners, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_controllerInfo, 0);
  objc_storeStrong((id *)&self->_xpc, 0);
}

@end