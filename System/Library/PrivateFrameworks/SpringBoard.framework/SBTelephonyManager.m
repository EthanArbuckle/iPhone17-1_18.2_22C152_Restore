@interface SBTelephonyManager
+ (__CTServerConnection)defaultTelephonyCenter;
+ (id)sharedTelephonyManager;
+ (id)sharedTelephonyManagerCreatingIfNecessary:(BOOL)a3;
- (BOOL)activeCallExists;
- (BOOL)containsCellularRadio;
- (BOOL)emergencyCallSupported;
- (BOOL)hasCellularData;
- (BOOL)hasCellularTelephony;
- (BOOL)hasNonCellularNetworkConnection;
- (BOOL)heldCallExists;
- (BOOL)inBargeCall;
- (BOOL)inCall;
- (BOOL)inCallUsingSpeakerOrReceiver;
- (BOOL)incomingCallExists;
- (BOOL)isCellDataSwitchingEnabled;
- (BOOL)isEmergencyCallActive;
- (BOOL)isEndpointOnCurrentDevice;
- (BOOL)isInEmergencyCallbackMode;
- (BOOL)isNetworkRegistrationEnabled;
- (BOOL)isNetworkTethering;
- (BOOL)isTTYEnabled;
- (BOOL)isUsingSlowDataConnection;
- (BOOL)isUsingVPNConnection;
- (BOOL)multipleCallsExist;
- (BOOL)outgoingCallExists;
- (BOOL)toggleBargeCallState;
- (BOOL)updateLocale;
- (CoreTelephonyClient)coreTelephonyClient;
- (NSString)cachedSlot1CountryCode;
- (NSString)cachedSlot1SIMStatus;
- (NSString)cachedSlot2CountryCode;
- (NSString)cachedSlot2SIMStatus;
- (SBBluetoothController)bluetoothController;
- (SBTelephonyManager)init;
- (SBTelephonyManager)initWithStateProvider:(id)a3 wifiDomain:(id)a4 bluetoothController:(id)a5;
- (STTelephonyStateProvider)telephonyStateProvider;
- (STWifiStatusDomain)wifiDomain;
- (TUCall)activeCall;
- (TUCall)heldCall;
- (TUCall)incomingCall;
- (TUCall)outgoingCall;
- (__CTServerConnection)_serverConnection;
- (double)inCallDuration;
- (id)_backgroundQueryQueue;
- (id)_callsForService:(int)a3;
- (id)_phoneApp;
- (id)_primaryCarrierBundleInfo;
- (id)_primaryMobileEquipmentInfo;
- (id)_primarySubscriptionInfo;
- (id)_secondaryCarrierBundleInfo;
- (id)_secondaryMobileEquipmentInfo;
- (id)_secondarySubscriptionInfo;
- (id)_subscriptionInfoForCall:(id)a3;
- (id)carrierDisabledApplicationIDs;
- (id)displayedCall;
- (int)numberOfNetworkTetheredDevices;
- (int64_t)_anySubscriptionSlotWithSIMPresent;
- (int64_t)_dataConnectedSubscriptionSlot;
- (int64_t)_dataPreferredSubscriptionSlotIfSIMPresent;
- (int64_t)_otherSubscriptionSlotIfSIMPresent:(int64_t)a3;
- (int64_t)_primarySubscriptionSlot;
- (int64_t)_secondarySubscriptionSlot;
- (int64_t)_subscriptionSlotIfSIMPresent:(int64_t)a3;
- (unint64_t)_callCountForService:(int)a3;
- (unint64_t)callCount;
- (unint64_t)dataConnectionAvailabilityWithCurrentCalls;
- (unint64_t)faceTimeAudioCallCount;
- (unint64_t)telephonyCallCount;
- (void)_avSystemControllerDidError:(id)a3;
- (void)_handleTelephonyDaemonRestart;
- (void)_performQueryInBackground:(id)a3 withMainQueueResultHandler:(id)a4;
- (void)_provisioningUpdateWithStatus:(int)a3 slot:(int64_t)a4;
- (void)_queue_noteWirelessModemDynamicStoreChanged;
- (void)_serverConnection;
- (void)_serverConnectionDidError:(id)a3;
- (void)_setCurrentActivationAlertItem:(id)a3;
- (void)_setIsInEmergencyCallbackMode:(unsigned __int8)a3;
- (void)_setIsNetworkTethering:(BOOL)a3 withNumberOfDevices:(int)a4;
- (void)_updateNetworkLocale;
- (void)_updateState;
- (void)callEventHandler:(id)a3;
- (void)carrierBundleInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4;
- (void)disconnectAllCalls;
- (void)disconnectCallAndActivateHeld;
- (void)disconnectDisplayedCall;
- (void)disconnectIncomingCall;
- (void)dumpBasebandState:(id)a3;
- (void)handleCallControlFailure:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)preHeatDataLinkForDomains:(id)a3;
- (void)queue_setFastDormancySuspended:(BOOL)a3 withConnection:(__CTServerConnection *)a4;
- (void)setActiveCall:(id)a3;
- (void)setCachedSlot1CountryCode:(id)a3;
- (void)setCachedSlot1SIMStatus:(id)a3;
- (void)setCachedSlot2CountryCode:(id)a3;
- (void)setCachedSlot2SIMStatus:(id)a3;
- (void)setCellDataSwitchingEnabled:(BOOL)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setFastDormancySuspended:(BOOL)a3;
- (void)setHeldCall:(id)a3;
- (void)setIncomingCall:(id)a3;
- (void)setNetworkRegistrationEnabled:(BOOL)a3;
- (void)setOutgoingCall:(id)a3;
- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4;
- (void)swapCalls;
- (void)telephonyAudioChangeHandler;
- (void)updateCalls;
- (void)updateSpringBoard;
@end

@implementation SBTelephonyManager

- (BOOL)isInEmergencyCallbackMode
{
  int inEmergencyCallbackMode = self->_inEmergencyCallbackMode;
  if (inEmergencyCallbackMode < 0)
  {
    CTTelephonyCenterGetDefault();
    unint64_t v4 = _CTServerConnectionGetEmergencyCallBackMode();
    if (HIDWORD(v4)) {
      [(SBTelephonyManager *)self _serverConnectionDidError:v4];
    }
    else {
      [(SBTelephonyManager *)self _setIsInEmergencyCallbackMode:0];
    }
    int inEmergencyCallbackMode = self->_inEmergencyCallbackMode;
  }
  return inEmergencyCallbackMode == 1;
}

- (BOOL)inCallUsingSpeakerOrReceiver
{
  if (![(SBTelephonyManager *)self inCall]) {
    return 0;
  }
  v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  v3 = [v2 routeController];
  unint64_t v4 = [v3 pickedRoute];

  if ([v4 isReceiver] & 1) != 0 || (objc_msgSend(v4, "isSpeaker")) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isBluetoothLE];
  }

  return v5;
}

- (BOOL)inCall
{
  v3 = [MEMORY[0x1E4FADA90] sharedInstance];
  uint64_t v4 = [v3 currentCallCount];

  if (!v4) {
    return 0;
  }
  if (v4 != 1) {
    return 1;
  }
  char v5 = [(SBTelephonyManager *)self incomingCall];
  BOOL v6 = v5 == 0;

  return v6;
}

+ (id)sharedTelephonyManagerCreatingIfNecessary:(BOOL)a3
{
  uint64_t v4 = (void *)__sharedTelephonyManager;
  if (__sharedTelephonyManager) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    kdebug_trace();
    v7 = [(id)SBApp systemStatusServer];
    if (!v7)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:a1 file:@"SBTelephonyManager.m" lineNumber:201 description:@"SBTelephonyManager is being created before the system status server"];
    }
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FA9570]) initWithServerHandle:v7];
    v9 = [(id)SBApp telephonyStateProvider];
    if (!v9)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:a1 file:@"SBTelephonyManager.m" lineNumber:204 description:@"SBTelephonyManager is being created before the telephony state provider"];
    }
    v10 = [SBTelephonyManager alloc];
    v11 = +[SBBluetoothController sharedInstance];
    uint64_t v12 = [(SBTelephonyManager *)v10 initWithStateProvider:v9 wifiDomain:v8 bluetoothController:v11];
    v13 = (void *)__sharedTelephonyManager;
    __sharedTelephonyManager = v12;

    kdebug_trace();
    uint64_t v4 = (void *)__sharedTelephonyManager;
  }
  return v4;
}

+ (id)sharedTelephonyManager
{
  return (id)[a1 sharedTelephonyManagerCreatingIfNecessary:1];
}

- (void)preHeatDataLinkForDomains:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v5 = [(SBTelephonyManager *)self telephonyStateProvider];
    BOOL v6 = objc_msgSend(v5, "subscriptionInfoForSlot:", -[SBTelephonyManager _dataConnectedSubscriptionSlot](self, "_dataConnectedSubscriptionSlot"));

    if ((unint64_t)([v6 dataConnectionType] - 2) <= 8)
    {
      v14 = v6;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
            v13 = dispatch_get_global_queue(0, 0);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __48__SBTelephonyManager_preHeatDataLinkForDomains___block_invoke;
            block[3] = &unk_1E6AF4AC0;
            block[4] = v12;
            dispatch_async(v13, block);

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }

      BOOL v6 = v14;
    }
  }
}

- (unint64_t)dataConnectionAvailabilityWithCurrentCalls
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(SBTelephonyManager *)self hasNonCellularNetworkConnection]) {
    return 0;
  }
  id v4 = [(SBTelephonyManager *)self _callsForService:1];
  if (![v4 count])
  {
    unint64_t v3 = 0;
    goto LABEL_27;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v6)
  {
    unint64_t v3 = 0;
    goto LABEL_26;
  }
  uint64_t v7 = v6;
  long long v17 = v4;
  uint64_t v8 = *(void *)v19;
LABEL_6:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v19 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
    uint64_t v11 = [v10 provider];
    int v12 = [v11 isTelephonyProvider];

    if (!v12) {
      goto LABEL_13;
    }
    v13 = [v10 providerContext];
    v14 = [v13 objectForKey:@"kCallSubType"];

    if (v14)
    {
      if (![v14 isEqualToString:@"kCallSubTypeWifi"]) {
        break;
      }
    }

LABEL_13:
    if (v7 == ++v9)
    {
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        goto LABEL_6;
      }
      unint64_t v3 = 0;
      id v4 = v17;
      goto LABEL_26;
    }
  }
  v15 = [(SBTelephonyManager *)self _subscriptionInfoForCall:v10];

  if (!v15)
  {
    unint64_t v3 = 0;
    id v4 = v17;
    goto LABEL_27;
  }
  id v4 = v17;
  if ([v15 isProvidingDataConnection])
  {
    unint64_t v3 = (unint64_t)([v15 dataConnectionType] - 15) < 0xFFFFFFFFFFFFFFF5;
  }
  else if ([(SBTelephonyManager *)self isCellDataSwitchingEnabled])
  {
    unint64_t v3 = 1;
  }
  else
  {
    unint64_t v3 = 2;
  }
  id v5 = v15;
LABEL_26:

LABEL_27:
  return v3;
}

- (BOOL)hasNonCellularNetworkConnection
{
  unint64_t v3 = [(SBTelephonyManager *)self wifiDomain];
  id v4 = [v3 data];
  if ([v4 isWifiActive])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [(SBTelephonyManager *)self bluetoothController];
    if ([v6 tetheringConnected]) {
      char v5 = 1;
    }
    else {
      char v5 = [(NWSystemPathMonitor *)self->_systemPathMonitor isEthernetPrimary];
    }
  }
  return v5;
}

- (STWifiStatusDomain)wifiDomain
{
  return self->_wifiDomain;
}

- (BOOL)isUsingSlowDataConnection
{
  if ([(SBTelephonyManager *)self hasNonCellularNetworkConnection]) {
    return 0;
  }
  id v4 = [(SBTelephonyManager *)self telephonyStateProvider];
  char v5 = objc_msgSend(v4, "subscriptionInfoForSlot:", -[SBTelephonyManager _dataConnectedSubscriptionSlot](self, "_dataConnectedSubscriptionSlot"));

  BOOL v3 = (unint64_t)([v5 dataConnectionType] - 1) < 3;
  return v3;
}

- (int64_t)_dataConnectedSubscriptionSlot
{
  int64_t v3 = [(SBTelephonyManager *)self _subscriptionSlotIfSIMPresent:2];
  id v4 = [(SBTelephonyManager *)self telephonyStateProvider];
  char v5 = [v4 subscriptionInfoForSlot:v3];

  if ([v5 isProvidingDataConnection]) {
    int64_t v6 = v3;
  }
  else {
    int64_t v6 = 1;
  }

  return v6;
}

- (STTelephonyStateProvider)telephonyStateProvider
{
  return self->_telephonyStateProvider;
}

- (int64_t)_subscriptionSlotIfSIMPresent:(int64_t)a3
{
  id v4 = [(SBTelephonyManager *)self telephonyStateProvider];
  int v5 = [v4 isSIMPresentForSlot:a3];

  if (v5) {
    return a3;
  }
  else {
    return 0;
  }
}

void __69__SBTelephonyManager_subscriptionInfoDidChangeForStateProvider_slot___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 > 1)
  {
    int v9 = 0;
    int v8 = 0;
  }
  else
  {
    int64_t v3 = [*(id *)(a1 + 32) telephonyStateProvider];
    id v4 = [v3 subscriptionInfoForSlot:1];

    uint64_t v5 = [v4 SIMStatus];
    uint64_t v6 = [*(id *)(a1 + 32) cachedSlot1SIMStatus];
    uint64_t v7 = (void *)v6;
    if (v6 | v5 && ([(id)v6 isEqualToString:v5] & 1) == 0)
    {
      [*(id *)(a1 + 32) setCachedSlot1SIMStatus:v5];
      int v8 = [(id)v5 isEqualToString:*MEMORY[0x1E4F24210]];
    }
    else
    {
      int v8 = 0;
    }
    uint64_t v10 = [v4 lastKnownNetworkCountryCode];
    uint64_t v11 = [*(id *)(a1 + 32) cachedSlot1CountryCode];
    int v12 = (void *)v11;
    if (v11 | v10 && ([(id)v11 isEqualToString:v10] & 1) == 0)
    {
      [*(id *)(a1 + 32) setCachedSlot1CountryCode:v10];
      int v9 = 1;
    }
    else
    {
      int v9 = 0;
    }
  }
  if ((v2 | 2) != 2)
  {
    if (v8) {
      goto LABEL_20;
    }
LABEL_23:
    if (!v9) {
      return;
    }
    goto LABEL_24;
  }
  v13 = [*(id *)(a1 + 32) telephonyStateProvider];
  v14 = [v13 subscriptionInfoForSlot:2];

  uint64_t v15 = [v14 SIMStatus];
  uint64_t v16 = [*(id *)(a1 + 32) cachedSlot2SIMStatus];
  long long v17 = (void *)v16;
  if (v16 | v15 && ([(id)v16 isEqualToString:v15] & 1) == 0)
  {
    [*(id *)(a1 + 32) setCachedSlot2SIMStatus:v15];
    LOBYTE(v8) = [(id)v15 isEqualToString:*MEMORY[0x1E4F24210]] | v8;
  }
  uint64_t v18 = [v14 lastKnownNetworkCountryCode];
  uint64_t v19 = [*(id *)(a1 + 32) cachedSlot2CountryCode];
  long long v20 = (void *)v19;
  if (v19 | v18 && ([(id)v19 isEqualToString:v18] & 1) == 0)
  {
    [*(id *)(a1 + 32) setCachedSlot2CountryCode:v18];
    int v9 = 1;
  }

  if ((v8 & 1) == 0) {
    goto LABEL_23;
  }
LABEL_20:
  [*(id *)(a1 + 32) updateLocale];
  if ((v9 & 1) == 0) {
    return;
  }
LABEL_24:
  long long v21 = *(void **)(a1 + 32);
  [v21 _updateNetworkLocale];
}

- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__SBTelephonyManager_subscriptionInfoDidChangeForStateProvider_slot___block_invoke;
  v4[3] = &unk_1E6AF4A70;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

- (NSString)cachedSlot1SIMStatus
{
  return self->_cachedSlot1SIMStatus;
}

- (NSString)cachedSlot1CountryCode
{
  return self->_cachedSlot1CountryCode;
}

+ (__CTServerConnection)defaultTelephonyCenter
{
  CFRunLoopGetMain();
  CTTelephonyCenterSetDefaultRunloop();
  return (__CTServerConnection *)CTTelephonyCenterGetDefault();
}

- (SBTelephonyManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBTelephonyManager.m" lineNumber:212 description:@"Use initWithStateProvider:wifiDomain:bluetoothController:"];

  return [(SBTelephonyManager *)self initWithStateProvider:0 wifiDomain:0 bluetoothController:0];
}

- (SBTelephonyManager)initWithStateProvider:(id)a3 wifiDomain:(id)a4 bluetoothController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v50.receiver = self;
  v50.super_class = (Class)SBTelephonyManager;
  int v12 = [(SBTelephonyManager *)&v50 init];
  objc_storeStrong((id *)&__sharedTelephonyManager, v12);
  if (v12)
  {
    objc_storeStrong((id *)&v12->_telephonyStateProvider, a3);
    objc_storeStrong((id *)&v12->_wifiDomain, a4);
    objc_storeStrong((id *)&v12->_bluetoothController, a5);
    v12->_containsCellularRadio = MGGetBoolAnswer();
    v12->_hasCellularTelephony = MGGetBoolAnswer();
    v12->_hasCellularData = MGGetBoolAnswer();
    v12->_int inEmergencyCallbackMode = -1;
    +[SBTelephonyManager defaultTelephonyCenter];
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if (v12->_containsCellularRadio)
    {
      CTTelephonyCenterAddObserver();
      CTTelephonyCenterAddObserver();
      CTTelephonyCenterAddObserver();
    }
    if (v12->_hasCellularTelephony) {
      CTTelephonyCenterAddObserver();
    }
    objc_msgSend(v13, "addObserver:selector:name:object:", v12, sel_callEventHandler_, *MEMORY[0x1E4FADD90], 0, v9);
    [v13 addObserver:v12 selector:sel_callEventHandler_ name:*MEMORY[0x1E4FADD78] object:0];
    [v13 addObserver:v12 selector:sel_handleCallControlFailure_ name:*MEMORY[0x1E4FADDA0] object:0];
    [v13 addObserver:v12 selector:sel_updateSpringBoard name:*MEMORY[0x1E4FADE18] object:0];
    [v13 addObserver:v12 selector:sel_telephonyAudioChangeHandler name:*MEMORY[0x1E4FADCB8] object:0];
    id v14 = objc_alloc(MEMORY[0x1E4F23A80]);
    uint64_t v15 = [(SBTelephonyManager *)v12 _backgroundQueryQueue];
    uint64_t v16 = [v14 initWithQueue:v15];
    coreTelephonyClient = v12->_coreTelephonyClient;
    v12->_coreTelephonyClient = (CoreTelephonyClient *)v16;

    if (MGGetBoolAnswer())
    {
      CTTelephonyCenterAddObserver();
      CTTelephonyCenterAddObserver();
    }
    CTTelephonyCenterAddObserver();
    uint64_t v18 = dispatch_get_global_queue(-2, 0);
    dispatch_async(v18, &__block_literal_global_19);

    uint64_t v19 = [getRTTSettingsClass() sharedInstance];
    [v19 registerUpdateBlock:&__block_literal_global_68_0 forRetrieveSelector:sel_TTYSoftwareEnabled withListener:v12];
    [v19 registerUpdateBlock:&__block_literal_global_68_0 forRetrieveSelector:sel_TTYHardwareEnabled withListener:v12];
    long long v20 = +[SBLockdownManager sharedInstance];
    char v21 = [v20 brickedDevice];

    if ((v21 & 1) == 0) {
      [(SBTelephonyManager *)v12 setNetworkRegistrationEnabled:1];
    }
    [(STTelephonyStateProvider *)v12->_telephonyStateProvider addObserver:v12];
    [(SBTelephonyManager *)v12 _updateState];
    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_initWeak(&location, v22);

    objc_initWeak(&from, v12);
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__3;
    v46 = __Block_byref_object_dispose__3;
    id v47 = 0;
    uint64_t v23 = [MEMORY[0x1E4F28F08] mainQueue];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __75__SBTelephonyManager_initWithStateProvider_wifiDomain_bluetoothController___block_invoke_75;
    v39[3] = &unk_1E6AF7970;
    objc_copyWeak(&v40, &from);
    objc_copyWeak(&v41, &location);
    v39[4] = &v42;
    uint64_t v24 = [v13 addObserverForName:@"SBBootCompleteNotification" object:0 queue:v23 usingBlock:v39];
    v25 = (void *)v43[5];
    v43[5] = v24;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    wirelessModemDynamicStoreQueue = v12->_wirelessModemDynamicStoreQueue;
    v12->_wirelessModemDynamicStoreQueue = (OS_dispatch_queue *)Serial;

    v28 = v12->_wirelessModemDynamicStoreQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__SBTelephonyManager_initWithStateProvider_wifiDomain_bluetoothController___block_invoke_2_80;
    block[3] = &unk_1E6AF4AC0;
    v29 = v12;
    v38 = v29;
    dispatch_async(v28, block);
    v30 = +[SBDefaults externalDefaults];
    v31 = [v30 globalDefaults];
    [v31 removeFormattedPhoneNumberFromGlobalPreferences];

    uint64_t v32 = [MEMORY[0x1E4F38C38] sharedSystemPathMonitor];
    id v33 = v29[12];
    v29[12] = (id)v32;

    [v29[12] addObserver:v29 forKeyPath:@"vpnActive" options:5 context:0];
    _Block_object_dispose(&v42, 8);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    id v9 = v36;
  }
  id v34 = (id)[MEMORY[0x1E4FADA90] sharedInstance];

  return v12;
}

id __75__SBTelephonyManager_initWithStateProvider_wifiDomain_bluetoothController___block_invoke()
{
  return (id)[MEMORY[0x1E4F74F68] sharedAVSystemController];
}

void __75__SBTelephonyManager_initWithStateProvider_wifiDomain_bluetoothController___block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SBTTYChangedNotification" object:0 userInfo:0];
}

void __75__SBTelephonyManager_initWithStateProvider_wifiDomain_bluetoothController___block_invoke_75(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateCalls];

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void __75__SBTelephonyManager_initWithStateProvider_wifiDomain_bluetoothController___block_invoke_2_80(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (_NETRBClientCreate())
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    *(_OWORD *)cStr = 0u;
    long long v10 = 0u;
    if (_NETRBClientGetDynamicStoreKey())
    {
      *(void *)(*(void *)(a1 + 32) + 40) = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], cStr, 0x8000100u);
      if (*(void *)(*(void *)(a1 + 32) + 40))
      {
LABEL_13:
        _NETRBClientDestroy();
        goto LABEL_14;
      }
      unint64_t v2 = SBLogCommon();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v7 = 0;
        id v3 = "_NETRBClientGetDynamicStoreKey failed to convert to CFStringRef";
LABEL_11:
        _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, v3, v7, 2u);
      }
    }
    else
    {
      unint64_t v2 = SBLogCommon();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v7 = 0;
        id v3 = "_NETRBClientGetDynamicStoreKey failed";
        goto LABEL_11;
      }
    }

    goto LABEL_13;
  }
  id v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)cStr = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "_NETRBClientCreate failed", (uint8_t *)cStr, 2u);
  }

LABEL_14:
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    *(void *)(*(void *)(a1 + 32) + 32) = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"com.apple.springboard", (SCDynamicStoreCallBack)_WirelessModemDynamicStoreCallBack, 0);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(const __SCDynamicStore **)(v5 + 32);
    uint64_t v8 = *(void *)(v5 + 40);
    SCDynamicStoreSetNotificationKeys(v6, (CFArrayRef)[MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1], 0);
    SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(*(void *)(a1 + 32) + 32), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 24));
    objc_msgSend(*(id *)(a1 + 32), "_queue_noteWirelessModemDynamicStoreChanged");
  }
}

- (id)_backgroundQueryQueue
{
  if (_backgroundQueryQueue_onceToken != -1) {
    dispatch_once(&_backgroundQueryQueue_onceToken, &__block_literal_global_92);
  }
  unint64_t v2 = (void *)_backgroundQueryQueue___queryQueue;
  return v2;
}

void __43__SBTelephonyManager__backgroundQueryQueue__block_invoke()
{
  uint64_t Serial = BSDispatchQueueCreateSerial();
  v1 = (void *)_backgroundQueryQueue___queryQueue;
  _backgroundQueryQueue___queryQueue = Serial;
}

- (void)_performQueryInBackground:(id)a3 withMainQueueResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__SBTelephonyManager__performQueryInBackground_withMainQueueResultHandler___block_invoke;
  v14[3] = &unk_1E6AF4AC0;
  v14[4] = self;
  if (_performQueryInBackground_withMainQueueResultHandler__onceToken != -1) {
    dispatch_once(&_performQueryInBackground_withMainQueueResultHandler__onceToken, v14);
  }
  uint64_t v8 = [(SBTelephonyManager *)self _backgroundQueryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SBTelephonyManager__performQueryInBackground_withMainQueueResultHandler___block_invoke_2;
  block[3] = &unk_1E6AF6BD0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __75__SBTelephonyManager__performQueryInBackground_withMainQueueResultHandler___block_invoke(uint64_t a1)
{
  _performQueryInBackground_withMainQueueResultHandler____queryServerConnection = _CTServerConnectionCreateWithIdentifier();
  unint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_backgroundQueryQueue", 0, 0, 0, 0, 0);
  _CTServerConnectionSetTargetQueue();
}

void __75__SBTelephonyManager__performQueryInBackground_withMainQueueResultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, _performQueryInBackground_withMainQueueResultHandler____queryServerConnection);
  }
  if (*(void *)(a1 + 40))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__SBTelephonyManager__performQueryInBackground_withMainQueueResultHandler___block_invoke_3;
    block[3] = &unk_1E6AF5300;
    id v4 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __75__SBTelephonyManager__performQueryInBackground_withMainQueueResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (__CTServerConnection)_serverConnection
{
  result = self->_serverConnection;
  if (!result)
  {
    result = (__CTServerConnection *)_CTServerConnectionCreateWithIdentifier();
    self->_serverConnection = result;
    if (!result)
    {
      id v4 = SBLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[SBTelephonyManager _serverConnection](v4);
      }

      return self->_serverConnection;
    }
  }
  return result;
}

- (void)_avSystemControllerDidError:(id)a3
{
  id v3 = a3;
  id v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[SBTelephonyManager _avSystemControllerDidError:](v3, v4);
  }
}

- (void)_serverConnectionDidError:(id)a3
{
  uint64_t v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SBTelephonyManager _serverConnectionDidError:](*(void *)&a3, v5);
  }

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__handleTelephonyDaemonRestart object:0];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C4B0]];
  [(SBTelephonyManager *)self performSelector:sel__handleTelephonyDaemonRestart withObject:0 afterDelay:v6 inModes:1.0];
}

- (void)_handleTelephonyDaemonRestart
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__handleTelephonyDaemonRestart object:0];
  serverConnection = self->_serverConnection;
  if (serverConnection)
  {
    CFRelease(serverConnection);
    self->_serverConnection = 0;
  }
  [(SBTelephonyManager *)self _serverConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SBTelephonyManager__handleTelephonyDaemonRestart__block_invoke;
  v7[3] = &unk_1E6AF7998;
  v7[4] = self;
  [(SBTelephonyManager *)self _performQueryInBackground:v7 withMainQueueResultHandler:0];
  [(SBTelephonyManager *)self handleCallControlFailure:0];
  [(SBTelephonyManager *)self _updateState];
  id v4 = +[SBIconController sharedInstance];
  uint64_t v5 = [v4 iconManager];
  [v5 setIdleModeText:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:*MEMORY[0x1E4FA7AA8] object:0];
}

void *__51__SBTelephonyManager__handleTelephonyDaemonRestart__block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result[11])
  {
    objc_msgSend(result, "queue_setFastDormancySuspended:withConnection:", 0, a2);
    uint64_t v5 = *(void **)(a1 + 32);
    return objc_msgSend(v5, "queue_setFastDormancySuspended:withConnection:", 1, a2);
  }
  return result;
}

- (BOOL)containsCellularRadio
{
  return self->_containsCellularRadio;
}

- (BOOL)hasCellularTelephony
{
  return self->_hasCellularTelephony;
}

- (BOOL)hasCellularData
{
  return self->_hasCellularData;
}

- (BOOL)emergencyCallSupported
{
  unint64_t v3 = [(SBTelephonyManager *)self callCount];
  BOOL v4 = [(SBTelephonyManager *)self isEmergencyCallActive];
  int v5 = MGGetBoolAnswer();
  if (v3) {
    BOOL v6 = v4;
  }
  else {
    BOOL v6 = 1;
  }
  return v5 && v6;
}

- (double)inCallDuration
{
  uint64_t v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  unint64_t v3 = [v2 displayedCallFromCalls:0];

  double v4 = -1.0;
  if (v3 && [v3 status] != 3)
  {
    [v3 callDuration];
    double v4 = v5;
  }

  return v4;
}

- (void)updateSpringBoard
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  unint64_t v3 = [v2 displayedCallFromCalls:0];

  double v4 = +[SBLockScreenManager sharedInstanceIfExists];
  int v5 = [v4 isUILocked];

  if (v5)
  {
    BOOL v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"SBLockScreenTelephoneCallUINeedsUpdateNotification" object:0];
  }
  if (!v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = +[SBApplicationController sharedInstance];
    uint64_t v8 = [v7 allApplications];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v12++) setHasDisplayedLaunchAlert:0 forType:1];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  id v13 = +[SBIdleTimerGlobalCoordinator sharedInstance];
  [v13 resetIdleTimerForReason:@"TelephonyManager:UpdateSB"];
}

- (id)_phoneApp
{
  uint64_t v2 = +[SBApplicationController sharedInstance];
  unint64_t v3 = [v2 mobilePhone];

  return v3;
}

- (void)queue_setFastDormancySuspended:(BOOL)a3 withConnection:(__CTServerConnection *)a4
{
  p_queue_fastDormancySuspendAssertion = &self->_queue_fastDormancySuspendAssertion;
  queue_fastDormancySuspendAssertion = self->_queue_fastDormancySuspendAssertion;
  if (a3)
  {
    if (a4)
    {
      if (!queue_fastDormancySuspendAssertion)
      {
        unint64_t v6 = _CTServerConnectionDormancySuspendAssertionCreate();
        unint64_t v7 = HIDWORD(v6);
        if (HIDWORD(v6))
        {
          int v8 = v6;
          uint64_t v9 = SBLogCommon();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            -[SBTelephonyManager queue_setFastDormancySuspended:withConnection:](v8, v7, v9);
          }
        }
      }
    }
  }
  else if (queue_fastDormancySuspendAssertion)
  {
    CFRelease(queue_fastDormancySuspendAssertion);
    *p_queue_fastDormancySuspendAssertion = 0;
  }
}

- (void)setFastDormancySuspended:(BOOL)a3
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    int v5 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v6 = [NSString stringWithUTF8String:"-[SBTelephonyManager setFastDormancySuspended:]"];
    [v5 handleFailureInFunction:v6 file:@"SBTelephonyManager.m" lineNumber:501 description:@"this call must be made on the main thread"];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SBTelephonyManager_setFastDormancySuspended___block_invoke;
  v7[3] = &unk_1E6AF79C0;
  v7[4] = self;
  BOOL v8 = a3;
  [(SBTelephonyManager *)self _performQueryInBackground:v7 withMainQueueResultHandler:0];
}

uint64_t __47__SBTelephonyManager_setFastDormancySuspended___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_setFastDormancySuspended:withConnection:", *(unsigned __int8 *)(a1 + 40), a2);
}

- (void)updateCalls
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(SBTelephonyManager *)self setIncomingCall:0];
  [(SBTelephonyManager *)self setActiveCall:0];
  [(SBTelephonyManager *)self setHeldCall:0];
  [(SBTelephonyManager *)self setOutgoingCall:0];
  unint64_t v3 = 0x1E4FAD000uLL;
  double v4 = [MEMORY[0x1E4FADA90] sharedInstance];
  uint64_t v5 = [v4 currentCallCount];

  if (v5)
  {
    unint64_t v6 = [MEMORY[0x1E4FADA90] sharedInstance];
    unint64_t v7 = [v6 currentCalls];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = 0;
      uint64_t v12 = *(void *)v21;
      uint64_t v13 = *MEMORY[0x1E4FADD90];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v8);
          }
          long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          switch(objc_msgSend(v15, "status", (void)v20))
          {
            case 1u:
              long long v16 = [(SBTelephonyManager *)self activeCall];

              if (!v16) {
                [(SBTelephonyManager *)self setActiveCall:v15];
              }
              break;
            case 2u:
              long long v17 = [(SBTelephonyManager *)self heldCall];

              if (!v17) {
                [(SBTelephonyManager *)self setHeldCall:v15];
              }
              break;
            case 3u:
              [(SBTelephonyManager *)self setOutgoingCall:v15];
              break;
            case 4u:
              long long v18 = [MEMORY[0x1E4F28EA0] notificationWithName:v13 object:v15];
              [(SBTelephonyManager *)self callEventHandler:v18];

              char v11 = 1;
              break;
            default:
              continue;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);

      unint64_t v3 = 0x1E4FAD000;
      if (v11) {
        goto LABEL_20;
      }
    }
    else
    {
    }
    sInTelephonyCall = 1;
    SBUpdateCallState();
LABEL_20:
  }
  uint64_t v19 = objc_msgSend(*(id *)(v3 + 2704), "sharedInstance", (void)v20);
  __LastUpdatedCallCount = [v19 currentCallCount];

  [(SBTelephonyManager *)self updateSpringBoard];
}

- (void)_updateState
{
  unint64_t v3 = [(SBTelephonyManager *)self telephonyStateProvider];
  id v11 = [v3 subscriptionInfoForSlot:1];

  double v4 = [(SBTelephonyManager *)self telephonyStateProvider];
  uint64_t v5 = [v4 subscriptionInfoForSlot:2];

  unint64_t v6 = [v11 lastKnownNetworkCountryCode];
  [(SBTelephonyManager *)self setCachedSlot1CountryCode:v6];

  unint64_t v7 = [v11 SIMStatus];
  [(SBTelephonyManager *)self setCachedSlot1SIMStatus:v7];

  id v8 = [v5 lastKnownNetworkCountryCode];
  [(SBTelephonyManager *)self setCachedSlot2CountryCode:v8];

  uint64_t v9 = [v5 SIMStatus];
  [(SBTelephonyManager *)self setCachedSlot2SIMStatus:v9];

  [(SBTelephonyManager *)self updateLocale];
  [(SBTelephonyManager *)self _updateNetworkLocale];
  uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"SBTTYChangedNotification" object:0 userInfo:0];
}

- (BOOL)updateLocale
{
  if (self->_hasCellularData)
  {
    *(void *)buf = 0;
    unint64_t v7 = buf;
    uint64_t v8 = 0x2020000000;
    char v9 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __34__SBTelephonyManager_updateLocale__block_invoke;
    v5[3] = &unk_1E6AF79E8;
    v5[4] = buf;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __34__SBTelephonyManager_updateLocale__block_invoke_3;
    v4[3] = &unk_1E6AF4B88;
    v4[4] = self;
    v4[5] = buf;
    _updateLocale(self, v5, &__block_literal_global_121, v4);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v2 = SBLogStatusBarish();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[SBTelephonyManager] updateLocale: clearing country code info for non-cellular device", buf, 2u);
    }

    CPPhoneNumberSetActiveCountryCode();
    CPPhoneNumberSetHomeCountryCode();
    CPPhoneNumberSetNetworkCountryCode();
  }
  return 0;
}

uint64_t __34__SBTelephonyManager_updateLocale__block_invoke()
{
  return _CTServerConnectionCopyMobileSubscriberHomeCountryList();
}

uint64_t __34__SBTelephonyManager_updateLocale__block_invoke_2()
{
  return CPPhoneNumberSetActiveCountryCode();
}

void __34__SBTelephonyManager_updateLocale__block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    active = (void *)CPPhoneNumberCopyActiveCountryCodeNoDefault();

    if (active)
    {
      unint64_t v3 = SBLogStatusBarish();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v6 = 0;
        _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[SBTelephonyManager] updateLocale: clearing active country code for eSIM with none/many country codes", v6, 2u);
      }

      CPPhoneNumberSetActiveCountryCode();
    }
  }
  double v4 = [*(id *)(a1 + 32) _primaryCarrierBundleInfo];
  uint64_t v5 = [v4 homeCountryCode];

  if (!v5) {
    uint64_t v5 = (void *)CPPhoneNumberCopyActiveCountryCode();
  }
  CPPhoneNumberSetHomeCountryCode();
}

- (void)_updateNetworkLocale
{
}

uint64_t __42__SBTelephonyManager__updateNetworkLocale__block_invoke()
{
  return _CTServerConnectionCopyMobileCountryCode();
}

uint64_t __42__SBTelephonyManager__updateNetworkLocale__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = SBLogStatusBarish();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = a2;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[SBTelephonyManager] _updateNetworkLocale: got updated country code: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return CPPhoneNumberSetNetworkCountryCode();
}

- (void)handleCallControlFailure:(id)a3
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[SBTelephonyManager handleCallControlFailure:]"];
    [v6 handleFailureInFunction:v7 file:@"SBTelephonyManager.m" lineNumber:683 description:@"this call must be made on the main thread"];
  }
  [(SBTelephonyManager *)self updateCalls];
  double v4 = [(SBTelephonyManager *)self activeCall];
  if (v4)
  {
    sInTelephonyCall = 1;
    SBUpdateCallState();
  }
  else
  {
    int v5 = [(SBTelephonyManager *)self outgoingCall];
    sInTelephonyCall = v5 != 0;
    SBUpdateCallState();
  }
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"SBCallCountChangedNotification" object:0 userInfo:0];
}

- (void)callEventHandler:(id)a3
{
  id v43 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    id v40 = [NSString stringWithUTF8String:"-[SBTelephonyManager callEventHandler:]"];
    [v39 handleFailureInFunction:v40 file:@"SBTelephonyManager.m" lineNumber:695 description:@"this call must be made on the main thread"];
  }
  double v4 = [v43 object];
  int v5 = [v4 status];
  uint64_t v6 = [MEMORY[0x1E4FADA90] sharedInstance];
  unint64_t v7 = [v6 currentCallCount];

  id v8 = [(SBTelephonyManager *)self incomingCall];

  if (v8)
  {
    id v8 = [(SBTelephonyManager *)self incomingCall];
    char v9 = [(SBTelephonyManager *)self incomingCall];
    int v10 = [v9 status];

    if (v10 != 4) {
      [(SBTelephonyManager *)self setIncomingCall:0];
    }
  }
  int v11 = 0;
  unint64_t v42 = v7;
  int v12 = 0;
  int v13 = 0;
  switch(v5)
  {
    case 1:
      [(SBTelephonyManager *)self setActiveCall:v4];
      int v12 = 0;
      int v13 = 0;
      int v41 = 1;
      int v11 = 1;
      goto LABEL_30;
    case 2:
      [(SBTelephonyManager *)self setHeldCall:v4];
      int v11 = 0;
      goto LABEL_9;
    case 3:
      long long v14 = [(SBTelephonyManager *)self outgoingCall];

      if (!v14) {
        goto LABEL_13;
      }
      long long v15 = [(SBTelephonyManager *)self outgoingCall];
      char v16 = [v15 isEqual:v4];

      long long v17 = v8;
      if (v16) {
        goto LABEL_52;
      }
      [(SBTelephonyManager *)self setOutgoingCall:0];
LABEL_13:
      [(SBTelephonyManager *)self setOutgoingCall:v4];
      int v11 = 1;
LABEL_14:
      int v12 = 0;
      int v13 = v7 == 1 && v5 == 3;
LABEL_26:
      uint64_t v19 = [(SBTelephonyManager *)self activeCall];
      if (v19)
      {
        long long v20 = (void *)v19;
        long long v21 = [(SBTelephonyManager *)self activeCall];
        int v22 = [v21 isEqual:v4];

        if (v22)
        {
          long long v23 = [MEMORY[0x1E4FADA90] sharedInstance];
          long long v24 = [v23 callWithStatus:1];
          [(SBTelephonyManager *)self setActiveCall:v24];
        }
      }
      int v41 = 0;
      if (v5 == 2) {
        goto LABEL_34;
      }
LABEL_30:
      uint64_t v25 = [(SBTelephonyManager *)self heldCall];
      if (v25)
      {
        v26 = (void *)v25;
        v27 = [(SBTelephonyManager *)self heldCall];
        int v28 = [v27 isEqual:v4];

        if (v28)
        {
          v29 = [MEMORY[0x1E4FADA90] sharedInstance];
          v30 = [v29 callWithStatus:2];
          [(SBTelephonyManager *)self setHeldCall:v30];
        }
      }
      if (v5 != 3)
      {
LABEL_34:
        uint64_t v31 = [(SBTelephonyManager *)self outgoingCall];
        if (v31)
        {
          uint64_t v32 = (void *)v31;
          id v33 = [(SBTelephonyManager *)self outgoingCall];
          int v34 = [v33 isEqual:v4];

          if (v34) {
            [(SBTelephonyManager *)self setOutgoingCall:0];
          }
        }
      }
      long long v17 = v8;
      if (v8 && [v4 isEqual:v8])
      {
        unint64_t v35 = v42;
        if (v5 != 4)
        {
          int v36 = v41;
          if (v42 != 1) {
            int v36 = 0;
          }
          v13 |= v36;
        }
      }
      else
      {
        unint64_t v35 = v42;
        if (v5 == 4)
        {
          [(SBTelephonyManager *)self setIncomingCall:v4];
          v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v37 postNotificationName:*MEMORY[0x1E4FA7A60] object:v4];
        }
      }
      if ((v12 | v13) == 1)
      {
        sInTelephonyCall = v13;
        SBUpdateCallState();
      }
      if (__LastUpdatedCallCount != v35)
      {
        v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v38 postNotificationName:@"SBCallCountChangedNotification" object:0 userInfo:0];
      }
      if (v11) {
        [(SBTelephonyManager *)self updateSpringBoard];
      }
      __LastUpdatedCallCount = (int)v35;
LABEL_52:

      return;
    case 4:
      goto LABEL_14;
    case 6:
      if (!v8 && !v7) {
        goto LABEL_25;
      }
      int v12 = 0;
      int v11 = 1;
      int v13 = 0;
      if (v7 <= 1 && v8)
      {
        if ([v4 isEqual:v8])
        {
LABEL_9:
          int v12 = 0;
          int v13 = 0;
        }
        else
        {
LABEL_25:
          int v13 = 0;
          int v11 = 1;
          int v12 = 1;
        }
      }
      goto LABEL_26;
    default:
      goto LABEL_26;
  }
}

- (unint64_t)callCount
{
  uint64_t v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  unint64_t v3 = [v2 currentCallCount];

  return v3;
}

- (void)telephonyAudioChangeHandler
{
  if ([(SBTelephonyManager *)self inCall])
  {
    id v2 = +[SBIdleTimerGlobalCoordinator sharedInstance];
    [v2 resetIdleTimerForReason:@"TelephonyManager:AudioChange"];
  }
}

- (id)displayedCall
{
  unint64_t v3 = [(SBTelephonyManager *)self incomingCall];
  if (!v3)
  {
    unint64_t v3 = [(SBTelephonyManager *)self outgoingCall];
    if (!v3)
    {
      unint64_t v3 = [(SBTelephonyManager *)self activeCall];
    }
  }
  return v3;
}

- (BOOL)activeCallExists
{
  id v2 = [(SBTelephonyManager *)self activeCall];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)heldCallExists
{
  id v2 = [(SBTelephonyManager *)self heldCall];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)incomingCallExists
{
  id v2 = [(SBTelephonyManager *)self incomingCall];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)outgoingCallExists
{
  id v2 = [(SBTelephonyManager *)self outgoingCall];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)multipleCallsExist
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  unint64_t v3 = [v2 currentCallCount];

  if (v3 < 2)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    double v4 = [MEMORY[0x1E4FADA90] sharedInstance];
    int v5 = [v4 currentCalls];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "isConferenced", (void)v11))
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v7;
}

- (BOOL)isCellDataSwitchingEnabled
{
  id v2 = [(SBTelephonyManager *)self coreTelephonyClient];
  char v3 = [v2 getSupportDynamicDataSimSwitchOnBBCallSync:0];

  return v3;
}

- (void)setCellDataSwitchingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBTelephonyManager *)self coreTelephonyClient];
  id v4 = (id)[v5 setSupportDynamicDataSimSwitchOnBBCall:v3];
}

- (id)_subscriptionInfoForCall:(id)a3
{
  id v4 = [a3 localSenderIdentity];
  id v5 = [v4 UUID];
  id v6 = [v5 UUIDString];

  uint64_t v7 = [(SBTelephonyManager *)self telephonyStateProvider];
  if ([v7 isSIMPresentForSlot:1])
  {
    uint64_t v8 = [v7 subscriptionInfoForSlot:1];
    char v9 = [v8 identifier];
    char v10 = [v9 isEqualToString:v6];

    if (v10) {
      goto LABEL_8;
    }
  }
  if ([v7 isSIMPresentForSlot:2])
  {
    uint64_t v8 = [v7 subscriptionInfoForSlot:2];
    long long v11 = [v8 identifier];
    char v12 = [v11 isEqualToString:v6];

    if (v12) {
      goto LABEL_8;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (id)_callsForService:(int)a3
{
  id v4 = [MEMORY[0x1E4FADA90] sharedInstance];
  id v5 = [v4 currentCalls];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__SBTelephonyManager__callsForService___block_invoke;
  v12[3] = &__block_descriptor_36_e23_B32__0__TUCall_8Q16_B24l;
  int v13 = a3;
  id v6 = [v5 indexesOfObjectsPassingTest:v12];
  uint64_t v7 = [v5 objectsAtIndexes:v6];
  uint64_t v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  char v10 = v9;

  return v10;
}

BOOL __39__SBTelephonyManager__callsForService___block_invoke(uint64_t a1, void *a2)
{
  return [a2 service] == *(_DWORD *)(a1 + 32);
}

- (unint64_t)_callCountForService:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4FADA90] sharedInstance];
  id v5 = [v4 currentCalls];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) service] == a3) {
          ++v8;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)telephonyCallCount
{
  return [(SBTelephonyManager *)self _callCountForService:1];
}

- (unint64_t)faceTimeAudioCallCount
{
  return [(SBTelephonyManager *)self _callCountForService:2];
}

- (BOOL)inBargeCall
{
  id v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  BOOL v3 = [v2 bargeCalls];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)toggleBargeCallState
{
  id v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  BOOL v3 = [v2 frontmostBargeCall];

  BOOL v4 = [MEMORY[0x1E4FADA90] sharedInstance];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v5 = [v4 handleWiredHeadsetFlashButtonForBargeCalls];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isEndpointOnCurrentDevice
{
  id v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  char v3 = [v2 anyCallIsEndpointOnCurrentDevice];

  return v3;
}

- (void)disconnectIncomingCall
{
  id v4 = [MEMORY[0x1E4FADA90] sharedInstance];
  char v3 = [(SBTelephonyManager *)self incomingCall];
  [v4 disconnectCall:v3];
}

- (void)disconnectDisplayedCall
{
  id v4 = [MEMORY[0x1E4FADA90] sharedInstance];
  char v3 = [(SBTelephonyManager *)self displayedCall];
  [v4 disconnectCall:v3];
}

- (void)swapCalls
{
  uint64_t v3 = [(SBTelephonyManager *)self heldCall];
  if (v3)
  {
    id v4 = (void *)v3;
    char v5 = [(SBTelephonyManager *)self activeCall];

    if (v5)
    {
      id v7 = [MEMORY[0x1E4FADA90] sharedInstance];
      uint64_t v6 = [(SBTelephonyManager *)self heldCall];
      [v7 unholdCall:v6];
    }
  }
}

- (void)disconnectAllCalls
{
  if ([(SBTelephonyManager *)self inCall])
  {
    id v2 = [MEMORY[0x1E4FADA90] sharedInstance];
    [v2 disconnectAllCalls];
  }
}

- (void)disconnectCallAndActivateHeld
{
  id v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  [v2 disconnectCurrentCallAndActivateHeld];
}

- (void)dumpBasebandState:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBTelephonyManager *)self _serverConnection])
  {
    char v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Dumping baseband state: %@", (uint8_t *)&v7, 0xCu);
    }

    unint64_t v6 = _CTServerConnectionDumpBasebandState();
    if (HIDWORD(v6)) {
      [(SBTelephonyManager *)self _serverConnectionDidError:v6];
    }
  }
}

- (BOOL)isNetworkRegistrationEnabled
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = NSHomeDirectory();
  id v4 = [v3 stringByAppendingPathComponent:@"SBNetworkRegistrationCookie"];
  char v5 = [v2 fileExistsAtPath:v4] ^ 1;

  return v5;
}

- (void)setNetworkRegistrationEnabled:(BOOL)a3
{
  if (a3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v5 = NSHomeDirectory();
    unint64_t v6 = [v5 stringByAppendingPathComponent:@"SBNetworkRegistrationCookie"];
    [v4 removeItemAtPath:v6 error:0];

    if (![(SBTelephonyManager *)self _serverConnection]) {
      return;
    }
    unint64_t v7 = _CTServerConnectionEnableRegistration();
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1C9B8] data];
    uint64_t v9 = NSHomeDirectory();
    char v10 = [v9 stringByAppendingPathComponent:@"SBNetworkRegistrationCookie"];
    [v8 writeToFile:v10 options:0x10000000 error:0];

    if (![(SBTelephonyManager *)self _serverConnection]) {
      return;
    }
    unint64_t v7 = _CTServerConnectionDisableRegistration();
  }
  if (HIDWORD(v7))
  {
    [(SBTelephonyManager *)self _serverConnectionDidError:v7];
  }
}

- (BOOL)isTTYEnabled
{
  id v2 = [getRTTSettingsClass() sharedInstance];
  if ([v2 TTYSoftwareEnabled]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 TTYHardwareEnabled];
  }

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  unint64_t v7 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F284C8], a4);
  char v8 = [v7 BOOLValue];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SBTelephonyManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E6AF5D38;
  v9[4] = self;
  char v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __69__SBTelephonyManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isUsingVPNConnection];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 19) = *(unsigned char *)(*(void *)(a1 + 32) + 19) & 0xFE | v3;
    id v4 = SBLogStatusBarish();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) isUsingVPNConnection];
      char v5 = NSStringFromBOOL();
      int v7 = 138543362;
      char v8 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "SBTelephonyManager updated usingVPN to %{public}@", (uint8_t *)&v7, 0xCu);
    }
    unint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"SBVPNConnectionChangedNotification" object:0 userInfo:0];
  }
}

- (BOOL)isUsingVPNConnection
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    char v5 = [NSString stringWithUTF8String:"-[SBTelephonyManager isUsingVPNConnection]"];
    [v4 handleFailureInFunction:v5 file:@"SBTelephonyManager.m" lineNumber:1113 description:@"this call must be made on the main thread"];
  }
  return *((unsigned char *)self + 19) & 1;
}

- (void)_setCurrentActivationAlertItem:(id)a3
{
  char v5 = (SBAlertItem *)a3;
  activationAlertItem = self->_activationAlertItem;
  p_activationAlertItem = &self->_activationAlertItem;
  unint64_t v6 = activationAlertItem;
  long long v11 = v5;
  if (activationAlertItem != v5)
  {
    if (v6)
    {
      uint64_t v9 = +[SBAlertItemsController sharedInstance];
      [v9 deactivateAlertItem:*p_activationAlertItem];
    }
    objc_storeStrong((id *)p_activationAlertItem, a3);
    if (*p_activationAlertItem)
    {
      [(SBAlertItem *)*p_activationAlertItem setSuppressForKeynote:1];
      char v10 = +[SBAlertItemsController sharedInstance];
      [v10 activateAlertItem:*p_activationAlertItem];
    }
  }
}

- (void)_provisioningUpdateWithStatus:(int)a3 slot:(int64_t)a4
{
  id v27 = [(SBTelephonyManager *)self telephonyStateProvider];
  int v7 = [v27 subscriptionInfoForSlot:1];
  char v8 = [v7 SIMStatus];
  uint64_t v9 = *MEMORY[0x1E4F24210];
  int v10 = [v8 isEqualToString:*MEMORY[0x1E4F24210]];

  long long v11 = [v27 subscriptionInfoForSlot:2];
  long long v12 = [v11 SIMStatus];
  int v13 = [v12 isEqualToString:v9];

  int v14 = MGGetBoolAnswer();
  if (a3 == 2)
  {
    ++self->_numActivationFailures;
    if (self->_hasCellularTelephony)
    {
      long long v20 = [[SBActivationFailedAlertItem alloc] initWithFailureCount:self->_numActivationFailures slot:a4];
      goto LABEL_13;
    }
LABEL_15:
    long long v20 = 0;
LABEL_16:
    [(SBTelephonyManager *)self _setCurrentActivationAlertItem:v20];
LABEL_17:

    goto LABEL_18;
  }
  if (a3 == 1)
  {
    if (self->_hasCellularTelephony)
    {
      int v22 = [SBDismissOnlyAlertItem alloc];
      long long v23 = [MEMORY[0x1E4F28B50] mainBundle];
      long long v24 = [v23 localizedStringForKey:@"PHONE_ACTIVATED" value:&stru_1F3084718 table:@"SpringBoard"];
      long long v20 = [(SBDismissOnlyAlertItem *)v22 initWithTitle:v24 body:0];

LABEL_13:
      uint64_t v25 = +[SBSetupManager sharedInstance];
      int v26 = [v25 isInSetupMode];

      if (v26) {
        [(SBAlertItem *)v20 setPendInSetupIfNotAllowed:0];
      }
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (!a3 && (*((unsigned char *)self + 56) & 1) == 0 && v14 ^ 1 | v10 | v13)
  {
    if (self->_hasCellularTelephony)
    {
      long long v15 = [SBDismissOnlyAlertItem alloc];
      uint64_t v16 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v17 = [v16 localizedStringForKey:@"WAITING_FOR_ACTIVATION_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
      long long v18 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v19 = [v18 localizedStringForKey:@"WAITING_FOR_ACTIVATION_BODY" value:&stru_1F3084718 table:@"SpringBoard"];
      long long v20 = [(SBDismissOnlyAlertItem *)v15 initWithTitle:v17 body:v19];

      long long v21 = +[SBSetupManager sharedInstance];
      LODWORD(v19) = [v21 isInSetupMode];

      if (v19) {
        [(SBAlertItem *)v20 setPendInSetupIfNotAllowed:0];
      }
    }
    else
    {
      long long v20 = 0;
    }
    [(SBTelephonyManager *)self _setCurrentActivationAlertItem:v20];
    *((unsigned char *)self + 56) |= 1u;
    goto LABEL_17;
  }
LABEL_18:
}

- (BOOL)isEmergencyCallActive
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  [v2 currentCalls];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
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
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "isEmergency", (void)v8))
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

  return v4;
}

- (void)_setIsInEmergencyCallbackMode:(unsigned __int8)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t inEmergencyCallbackMode = self->_inEmergencyCallbackMode;
  int v4 = a3 != 0;
  self->_uint64_t inEmergencyCallbackMode = v4;
  if (inEmergencyCallbackMode != v4)
  {
    unint64_t v6 = SBLogStatusBarish();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = SBTMCachedBooleanDebugName(inEmergencyCallbackMode);
      long long v8 = SBTMCachedBooleanDebugName(self->_inEmergencyCallbackMode);
      int v10 = 138543618;
      long long v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[SBTelephonyManager] _setIsInEmergencyCallbackMode: status changed from %{public}@ to %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  long long v9 = +[SBAlertItemsController sharedInstance];
  objc_msgSend(v9, "setForceAlertsToPend:forReason:", objc_msgSend((id)__sharedTelephonyManager, "isInEmergencyCallbackMode"), @"isInEmergencyCallbackMode");
}

- (id)_primarySubscriptionInfo
{
  int64_t v3 = [(SBTelephonyManager *)self _primarySubscriptionSlot];
  int v4 = [(SBTelephonyManager *)self telephonyStateProvider];
  uint64_t v5 = [v4 subscriptionInfoForSlot:v3];

  return v5;
}

- (id)_primaryCarrierBundleInfo
{
  int64_t v3 = [(SBTelephonyManager *)self _primarySubscriptionSlot];
  int v4 = [(SBTelephonyManager *)self telephonyStateProvider];
  uint64_t v5 = [v4 carrierBundleInfoForSlot:v3];

  return v5;
}

- (id)_primaryMobileEquipmentInfo
{
  int64_t v3 = [(SBTelephonyManager *)self _primarySubscriptionSlot];
  int v4 = [(SBTelephonyManager *)self telephonyStateProvider];
  uint64_t v5 = [v4 mobileEquipmentInfoForSlot:v3];

  return v5;
}

- (id)_secondarySubscriptionInfo
{
  int64_t v3 = [(SBTelephonyManager *)self _secondarySubscriptionSlot];
  int v4 = [(SBTelephonyManager *)self telephonyStateProvider];
  uint64_t v5 = [v4 subscriptionInfoForSlot:v3];

  return v5;
}

- (id)_secondaryCarrierBundleInfo
{
  int64_t v3 = [(SBTelephonyManager *)self _secondarySubscriptionSlot];
  int v4 = [(SBTelephonyManager *)self telephonyStateProvider];
  uint64_t v5 = [v4 carrierBundleInfoForSlot:v3];

  return v5;
}

- (id)_secondaryMobileEquipmentInfo
{
  int64_t v3 = [(SBTelephonyManager *)self _secondarySubscriptionSlot];
  int v4 = [(SBTelephonyManager *)self telephonyStateProvider];
  uint64_t v5 = [v4 mobileEquipmentInfoForSlot:v3];

  return v5;
}

- (int64_t)_primarySubscriptionSlot
{
  if (!self->_containsCellularRadio) {
    return 1;
  }
  int64_t result = [(SBTelephonyManager *)self _dataPreferredSubscriptionSlotIfSIMPresent];
  if (!result)
  {
    int64_t result = [(SBTelephonyManager *)self _anySubscriptionSlotWithSIMPresent];
    if ((unint64_t)result <= 1) {
      return 1;
    }
  }
  return result;
}

- (int64_t)_secondarySubscriptionSlot
{
  if (!self->_containsCellularRadio) {
    return 0;
  }
  int64_t v3 = [(SBTelephonyManager *)self telephonyStateProvider];
  int v4 = [v3 isDualSIMEnabled];

  if (!v4) {
    return 0;
  }
  int64_t v5 = [(SBTelephonyManager *)self _primarySubscriptionSlot];
  return [(SBTelephonyManager *)self _otherSubscriptionSlotIfSIMPresent:v5];
}

- (int64_t)_otherSubscriptionSlotIfSIMPresent:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  return [(SBTelephonyManager *)self _subscriptionSlotIfSIMPresent:v3];
}

- (int64_t)_dataPreferredSubscriptionSlotIfSIMPresent
{
  int64_t v3 = [(SBTelephonyManager *)self _subscriptionSlotIfSIMPresent:2];
  int v4 = [(SBTelephonyManager *)self telephonyStateProvider];
  int64_t v5 = [v4 subscriptionInfoForSlot:v3];

  if ([v5 isPreferredForDataConnections]) {
    int64_t v6 = v3;
  }
  else {
    int64_t v6 = 1;
  }

  return v6;
}

- (int64_t)_anySubscriptionSlotWithSIMPresent
{
  int64_t result = [(SBTelephonyManager *)self _subscriptionSlotIfSIMPresent:1];
  if (!result)
  {
    return [(SBTelephonyManager *)self _subscriptionSlotIfSIMPresent:2];
  }
  return result;
}

- (void)carrierBundleInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SBTelephonyManager_carrierBundleInfoDidChangeForStateProvider_slot___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __70__SBTelephonyManager_carrierBundleInfoDidChangeForStateProvider_slot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLocale];
}

- (id)carrierDisabledApplicationIDs
{
  int64_t v3 = [(SBTelephonyManager *)self _primaryCarrierBundleInfo];
  int v4 = [v3 disabledApplicationIDs];

  int64_t v5 = [MEMORY[0x1E4F1CA80] set];
  int64_t v6 = v5;
  if (v4) {
    [v5 addObjectsFromArray:v4];
  }
  int v7 = [(SBTelephonyManager *)self _secondaryCarrierBundleInfo];
  long long v8 = [v7 disabledApplicationIDs];

  if (v8) {
    [v6 addObjectsFromArray:v8];
  }

  return v6;
}

- (void)_queue_noteWirelessModemDynamicStoreChanged
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Wireless modem data: %@", (uint8_t *)&v2, 0xCu);
}

BOOL __65__SBTelephonyManager__queue_noteWirelessModemDynamicStoreChanged__block_invoke(uint64_t a1, const __CFString *a2)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F41AC8];
  CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 40), 0);
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(v4, v5, ValueAtIndex, a2);
  if (!NetworkInterfaceEntity) {
    return 0;
  }
  CFStringRef v8 = NetworkInterfaceEntity;
  CFPropertyListRef v9 = SCDynamicStoreCopyValue(*(SCDynamicStoreRef *)(*(void *)(a1 + 32) + 32), NetworkInterfaceEntity);
  BOOL v10 = v9 != 0;
  if (v9) {
    CFRelease(v9);
  }
  CFRelease(v8);
  return v10;
}

uint64_t __65__SBTelephonyManager__queue_noteWirelessModemDynamicStoreChanged__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = SBLogStatusBarish();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    if (*(unsigned char *)(a1 + 44)) {
      CFAllocatorRef v4 = @"ON";
    }
    else {
      CFAllocatorRef v4 = @"OFF";
    }
    int v6 = 138543618;
    int v7 = v4;
    __int16 v8 = 1024;
    int v9 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Received notification that wireless modem state changed. Tethering is currently %{public}@ with %d devices connected.", (uint8_t *)&v6, 0x12u);
  }

  return [*(id *)(a1 + 32) _setIsNetworkTethering:*(unsigned __int8 *)(a1 + 44) withNumberOfDevices:*(unsigned int *)(a1 + 40)];
}

- (BOOL)isNetworkTethering
{
  return self->_isNetworkTethering;
}

- (int)numberOfNetworkTetheredDevices
{
  return self->_numberOfNetworkTetheredDevices;
}

- (void)_setIsNetworkTethering:(BOOL)a3 withNumberOfDevices:(int)a4
{
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isNetworkTethering != a3 || self->_numberOfNetworkTetheredDevices != a4)
  {
    int v7 = SBLogStatusBarish();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = @"ON";
      int numberOfNetworkTetheredDevices = self->_numberOfNetworkTetheredDevices;
      if (self->_isNetworkTethering) {
        uint64_t v10 = @"ON";
      }
      else {
        uint64_t v10 = @"OFF";
      }
      int v12 = 138413058;
      if (!v5) {
        __int16 v8 = @"OFF";
      }
      uint64_t v13 = v10;
      __int16 v14 = 1024;
      int v15 = numberOfNetworkTetheredDevices;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      __int16 v18 = 1024;
      int v19 = a4;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Previous tethering state was %@ with %d devices connected; new state is %{public}@ with %d devices connected; updating UI.",
        (uint8_t *)&v12,
        0x22u);
    }

    self->_isNetworkTethering = v5;
    self->_int numberOfNetworkTetheredDevices = a4;
    long long v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:*MEMORY[0x1E4FA7A80] object:0];
  }
}

void __48__SBTelephonyManager_preHeatDataLinkForDomains___block_invoke(uint64_t a1)
{
  v1 = (const char *)[*(id *)(a1 + 32) UTF8String];
  if (v1)
  {
    int v2 = 0;
    getaddrinfo(v1, 0, 0, &v2);
    if (v2) {
      freeaddrinfo(v2);
    }
  }
}

- (TUCall)incomingCall
{
  return self->_incomingCall;
}

- (void)setIncomingCall:(id)a3
{
}

- (TUCall)activeCall
{
  return self->_activeCall;
}

- (void)setActiveCall:(id)a3
{
}

- (TUCall)heldCall
{
  return self->_heldCall;
}

- (void)setHeldCall:(id)a3
{
}

- (TUCall)outgoingCall
{
  return self->_outgoingCall;
}

- (void)setOutgoingCall:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (SBBluetoothController)bluetoothController
{
  return self->_bluetoothController;
}

- (void)setCachedSlot1CountryCode:(id)a3
{
}

- (NSString)cachedSlot2CountryCode
{
  return self->_cachedSlot2CountryCode;
}

- (void)setCachedSlot2CountryCode:(id)a3
{
}

- (void)setCachedSlot1SIMStatus:(id)a3
{
}

- (NSString)cachedSlot2SIMStatus
{
  return self->_cachedSlot2SIMStatus;
}

- (void)setCachedSlot2SIMStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSlot2SIMStatus, 0);
  objc_storeStrong((id *)&self->_cachedSlot1SIMStatus, 0);
  objc_storeStrong((id *)&self->_cachedSlot2CountryCode, 0);
  objc_storeStrong((id *)&self->_cachedSlot1CountryCode, 0);
  objc_storeStrong((id *)&self->_bluetoothController, 0);
  objc_storeStrong((id *)&self->_wifiDomain, 0);
  objc_storeStrong((id *)&self->_telephonyStateProvider, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_outgoingCall, 0);
  objc_storeStrong((id *)&self->_heldCall, 0);
  objc_storeStrong((id *)&self->_activeCall, 0);
  objc_storeStrong((id *)&self->_incomingCall, 0);
  objc_storeStrong((id *)&self->_systemPathMonitor, 0);
  objc_storeStrong((id *)&self->_activationAlertItem, 0);
  objc_storeStrong((id *)&self->_wirelessModemDynamicStoreQueue, 0);
}

- (void)_serverConnection
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Unable to create CFServerConnection. Telephony state may be incorrect.", v1, 2u);
}

- (void)_avSystemControllerDidError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v4 = [a1 domain];
  uint64_t v5 = [a1 code];
  int v6 = [MEMORY[0x1E4F29060] callStackReturnAddresses];
  int v7 = 138412802;
  __int16 v8 = v4;
  __int16 v9 = 2048;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  int v12 = v6;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "AVSystemController returned error: (%@, %li). Destroying connection. (Callstack: %{public}@)", (uint8_t *)&v7, 0x20u);
}

- (void)_serverConnectionDidError:(unint64_t)a1 .cold.1(unint64_t a1, NSObject *a2)
{
  int v3 = a1;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = HIDWORD(a1);
  uint64_t v5 = [MEMORY[0x1E4F29060] callStackReturnAddresses];
  v6[0] = 67109634;
  v6[1] = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v5;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "CTServerConnection returned error: (%i, %i). Destroying connection. (Callstack: %{public}@)", (uint8_t *)v6, 0x18u);
}

- (void)queue_setFastDormancySuspended:(os_log_t)log withConnection:.cold.1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "CTServerConnection failed to acquire fastDormancySuspend assertion: (%i, %i)", (uint8_t *)v3, 0xEu);
}

@end