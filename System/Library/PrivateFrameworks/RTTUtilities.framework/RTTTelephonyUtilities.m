@interface RTTTelephonyUtilities
+ (BOOL)TTYHardwareEnabledForAnyActiveContext;
+ (BOOL)TTYSoftwareEnabledForAnyActiveContext;
+ (BOOL)hardwareTTYIsSupported;
+ (BOOL)hardwareTTYIsSupportedForContext:(id)a3;
+ (BOOL)isOnlyRTTSupported;
+ (BOOL)isOnlyRTTSupportedForContext:(id)a3;
+ (BOOL)isRTTCallHoldSupportedForContext:(id)a3;
+ (BOOL)isRTTSupported;
+ (BOOL)isRTTSupportedForContext:(id)a3;
+ (BOOL)isRelayRTTSupported;
+ (BOOL)isTTYSupported;
+ (BOOL)isTTYSupportedForContext:(id)a3;
+ (BOOL)relayIsSupported;
+ (BOOL)relayIsSupportedForContext:(id)a3;
+ (BOOL)shouldUseRTT;
+ (BOOL)shouldUseRTTForContext:(id)a3;
+ (BOOL)softwareTTYIsSupported;
+ (BOOL)softwareTTYIsSupportedForContext:(id)a3;
+ (id)relayPhoneNumber;
+ (id)relayPhoneNumberForContext:(id)a3;
+ (id)sharedCallCenter;
+ (id)sharedUtilityProvider;
+ (int64_t)currentSupportedTextingType;
+ (void)performCallCenterTask:(id)a3;
- (BOOL)answerRTTCallAsMutedForCall:(id)a3;
- (BOOL)contactIsTTYContact:(id)a3;
- (BOOL)contactPathIsMe:(id)a3;
- (BOOL)currentProcessHandlesCloudRelay;
- (BOOL)deviceIsTinker;
- (BOOL)headphoneJackSupportsTTY;
- (BOOL)isRTTCallHoldSupportedForContext:(id)a3;
- (BOOL)isTTYOverIMSSupportedForContext:(id)a3;
- (BOOL)isTTYSupportedForContext:(id)a3;
- (BOOL)relayIsSupported;
- (BOOL)relayRTTIsSupported;
- (BOOL)reloadRelayPhoneNumbers;
- (CNContactStore)contactStore;
- (CTXPCContexts)cachedActiveContexts;
- (CTXPCServiceSubscriptionContext)defaultVoiceContext;
- (CoreTelephonyClient)telephonyClient;
- (NSArray)cachedSubscriptionContexts;
- (NSMutableDictionary)phoneNumberInfoCache;
- (NSNumber)callCapabilitiesSupportsTelephonyCalls;
- (NSSet)allVoiceContexts;
- (OS_dispatch_queue)accountStoreQueue;
- (OS_dispatch_queue)telephonyUpdateQueue;
- (RTTTelephonyUtilities)init;
- (id)activeContexts;
- (id)contactPathForCall:(id)a3;
- (id)contextForCall:(id)a3;
- (id)getCarrierValueForKey:(id)a3 andContext:(id)a4;
- (id)getCarrierValueForKeyHierarchy:(id)a3 andContext:(id)a4;
- (id)labelFromUUID:(id)a3;
- (id)myPhoneNumber;
- (id)phoneNumberForContext:(id)a3;
- (id)phoneNumberFromUUID:(id)a3;
- (id)relayNumberForContext:(id)a3;
- (id)subscriptionContexts;
- (id)ttyMeContact;
- (unint64_t)activeContextCount;
- (unint64_t)currentPreferredTransportMethod;
- (unint64_t)currentPreferredTransportMethodForContext:(id)a3;
- (void)_processiCloudAccountForRTT;
- (void)carrierSettingsDidChange;
- (void)dealloc;
- (void)didChangeOutgoingRelayCallerID;
- (void)didChangeRelayCallingAvailability;
- (void)didChangeRelayCallingCapabilities;
- (void)didChangeTelephonyCallingSupport;
- (void)headphoneStateChangedNotification:(id)a3;
- (void)iCloudAccountDidChange:(id)a3;
- (void)iCloudRTTRelayDidChange:(id)a3;
- (void)listenForCloudRelayChanges;
- (void)mediaServerDied;
- (void)purgePhoneNumberInfoCache;
- (void)registerNotifications;
- (void)reloadDefaultVoiceContext;
- (void)resetCloudSupportStore;
- (void)setAccountStoreQueue:(id)a3;
- (void)setActiveContextCount:(unint64_t)a3;
- (void)setAllVoiceContexts:(id)a3;
- (void)setCachedActiveContexts:(id)a3;
- (void)setCachedSubscriptionContexts:(id)a3;
- (void)setCallCapabilitiesSupportsTelephonyCalls:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDefaultVoiceContext:(id)a3;
- (void)setHeadphoneJackSupportsTTY:(BOOL)a3;
- (void)setPhoneNumberInfoCache:(id)a3;
- (void)setTTYDictionaryAvailability:(BOOL)a3;
- (void)setTelephonyClient:(id)a3;
- (void)setTelephonyUpdateQueue:(id)a3;
- (void)updateHeadphoneState;
@end

@implementation RTTTelephonyUtilities

- (CTXPCServiceSubscriptionContext)defaultVoiceContext
{
  return (CTXPCServiceSubscriptionContext *)objc_getProperty(self, a2, 48, 1);
}

+ (id)sharedUtilityProvider
{
  if (sharedUtilityProvider_onceToken != -1) {
    dispatch_once(&sharedUtilityProvider_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedUtilityProvider_UtilityProvider;

  return v2;
}

uint64_t __46__RTTTelephonyUtilities_sharedUtilityProvider__block_invoke()
{
  sharedUtilityProvider_UtilityProvider = objc_alloc_init(RTTTelephonyUtilities);

  return MEMORY[0x270F9A758]();
}

+ (id)sharedCallCenter
{
  if (sharedCallCenter_onceToken != -1) {
    dispatch_once(&sharedCallCenter_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)sharedCallCenter_CallCenter;

  return v2;
}

uint64_t __41__RTTTelephonyUtilities_sharedCallCenter__block_invoke()
{
  sharedCallCenter_CallCenter = [MEMORY[0x263F7E1A0] sharedInstance];

  return MEMORY[0x270F9A758]();
}

+ (void)performCallCenterTask:(id)a3
{
  v3 = (void (**)(void))a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v3[2](v3);
  }
  else
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__RTTTelephonyUtilities_performCallCenterTask___block_invoke;
    v7[3] = &unk_2645402D0;
    dispatch_semaphore_t v8 = v4;
    v9 = v3;
    v5 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v7);
    dispatch_time_t v6 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v5, v6);
  }
}

intptr_t __47__RTTTelephonyUtilities_performCallCenterTask___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

+ (BOOL)TTYHardwareEnabledForAnyActiveContext
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v2 = +[RTTTelephonyUtilities sharedUtilityProvider];
  v3 = [v2 activeContexts];
  dispatch_semaphore_t v4 = [v3 subscriptions];

  if ([v4 count])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__RTTTelephonyUtilities_TTYHardwareEnabledForAnyActiveContext__block_invoke;
    v11[3] = &unk_2645402F8;
    v11[4] = &v13;
    [v4 enumerateObjectsUsingBlock:v11];
    char v5 = *((unsigned char *)v14 + 24) != 0;
  }
  else
  {
    dispatch_time_t v6 = AXLogRTT();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FEA9000, v6, OS_LOG_TYPE_INFO, "HW No active subscriptions, falling back to default voice context", buf, 2u);
    }

    v7 = +[RTTSettings sharedInstance];
    dispatch_semaphore_t v8 = +[RTTTelephonyUtilities sharedUtilityProvider];
    v9 = [v8 defaultVoiceContext];
    char v5 = [v7 TTYHardwareEnabledForContext:v9];
  }
  _Block_object_dispose(&v13, 8);
  return v5;
}

void __62__RTTTelephonyUtilities_TTYHardwareEnabledForAnyActiveContext__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  v7 = +[RTTSettings sharedInstance];
  dispatch_semaphore_t v8 = [v6 context];

  LODWORD(v6) = [v7 TTYHardwareEnabledForContext:v8];
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (BOOL)TTYSoftwareEnabledForAnyActiveContext
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v2 = +[RTTTelephonyUtilities sharedUtilityProvider];
  v3 = [v2 activeContexts];
  dispatch_semaphore_t v4 = [v3 subscriptions];

  if ([v4 count])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__RTTTelephonyUtilities_TTYSoftwareEnabledForAnyActiveContext__block_invoke;
    v11[3] = &unk_2645402F8;
    v11[4] = &v13;
    [v4 enumerateObjectsUsingBlock:v11];
    char v5 = *((unsigned char *)v14 + 24) != 0;
  }
  else
  {
    id v6 = AXLogRTT();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FEA9000, v6, OS_LOG_TYPE_INFO, "SW No active subscriptions, falling back to default voice context", buf, 2u);
    }

    v7 = +[RTTSettings sharedInstance];
    dispatch_semaphore_t v8 = +[RTTTelephonyUtilities sharedUtilityProvider];
    v9 = [v8 defaultVoiceContext];
    char v5 = [v7 TTYSoftwareEnabledForContext:v9];
  }
  _Block_object_dispose(&v13, 8);
  return v5;
}

void __62__RTTTelephonyUtilities_TTYSoftwareEnabledForAnyActiveContext__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  v7 = +[RTTSettings sharedInstance];
  dispatch_semaphore_t v8 = [v6 context];

  LODWORD(v6) = [v7 TTYSoftwareEnabledForContext:v8];
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (BOOL)isTTYSupported
{
  v2 = +[RTTTelephonyUtilities sharedUtilityProvider];
  v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
  dispatch_semaphore_t v4 = [v3 defaultVoiceContext];
  char v5 = [v2 isTTYSupportedForContext:v4];

  return v5;
}

+ (BOOL)isRTTSupported
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
  dispatch_semaphore_t v4 = +[RTTTelephonyUtilities sharedUtilityProvider];
  char v5 = [v4 defaultVoiceContext];
  int v6 = [v3 isTTYOverIMSSupportedForContext:v5];

  int v7 = [a1 isRelayRTTSupported];
  dispatch_semaphore_t v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109376;
    v10[1] = v6;
    __int16 v11 = 1024;
    int v12 = v7;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "isRTTSupported: %d, relay: %d", (uint8_t *)v10, 0xEu);
  }

  return v6 | v7;
}

+ (BOOL)isOnlyRTTSupported
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = +[RTTTelephonyUtilities sharedUtilityProvider];
  v3 = [v2 defaultVoiceContext];
  BOOL v4 = +[RTTTelephonyUtilities isOnlyRTTSupportedForContext:v3];

  char v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "checking only RTT: %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

+ (BOOL)shouldUseRTT
{
  v2 = +[RTTTelephonyUtilities sharedUtilityProvider];
  v3 = [v2 defaultVoiceContext];
  BOOL v4 = +[RTTTelephonyUtilities shouldUseRTTForContext:v3];

  return v4;
}

+ (BOOL)relayIsSupported
{
  v2 = +[RTTSettings sharedInstance];
  if ([v2 TTYSoftwareEnabled])
  {
    v3 = +[RTTTelephonyUtilities relayPhoneNumber];
    BOOL v4 = [v3 length] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (int64_t)currentSupportedTextingType
{
  if (!+[RTTTelephonyUtilities hardwareTTYIsSupported]
    && !+[RTTTelephonyUtilities softwareTTYIsSupported])
  {
    return 4;
  }
  if (+[RTTTelephonyUtilities isOnlyRTTSupported]) {
    return 1;
  }
  if (+[RTTTelephonyUtilities isRTTSupported]) {
    return 3;
  }
  if (+[RTTTelephonyUtilities isRelayRTTSupported]) {
    return 1;
  }
  return 2;
}

+ (id)relayPhoneNumber
{
  v2 = +[RTTSettings sharedInstance];
  v3 = [v2 preferredRelayNumber];

  return v3;
}

+ (BOOL)hardwareTTYIsSupported
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = +[RTTTelephonyUtilities sharedUtilityProvider];
  v3 = [v2 allVoiceContexts];

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
        if (+[RTTTelephonyUtilities hardwareTTYIsSupportedForContext:*(void *)(*((void *)&v8 + 1) + 8 * i)])
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

+ (BOOL)isRelayRTTSupported
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = +[RTTSettings sharedInstance];
  if ([v2 supportsRelayCalling])
  {
    v3 = +[RTTSettings sharedInstance];
    int v4 = [v3 isRelayCallingEnabled];
  }
  else
  {
    int v4 = 0;
  }

  uint64_t v5 = +[RTTSettings sharedInstance];
  int v6 = [v5 continuityRTTIsSupported];

  int v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109376;
    v9[1] = v4;
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_impl(&dword_21FEA9000, v7, OS_LOG_TYPE_INFO, "Relay supported: TU supports: %d, continuity: %d", (uint8_t *)v9, 0xEu);
  }

  if (v4) {
    return v6;
  }
  else {
    return 0;
  }
}

+ (BOOL)softwareTTYIsSupported
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
  int v4 = [v3 allVoiceContexts];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (+[RTTTelephonyUtilities softwareTTYIsSupportedForContext:*(void *)(*((void *)&v10 + 1) + 8 * v8)])
        {

          return 1;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  return [a1 isRelayRTTSupported];
}

+ (BOOL)isTTYSupportedForContext:(id)a3
{
  id v3 = a3;
  int v4 = +[RTTTelephonyUtilities sharedUtilityProvider];
  char v5 = [v4 isTTYSupportedForContext:v3];

  return v5;
}

+ (BOOL)isRTTSupportedForContext:(id)a3
{
  id v3 = a3;
  int v4 = +[RTTTelephonyUtilities sharedUtilityProvider];
  char v5 = [v4 isTTYOverIMSSupportedForContext:v3];

  return v5;
}

+ (BOOL)isOnlyRTTSupportedForContext:(id)a3
{
  id v3 = a3;
  BOOL v4 = !+[RTTTelephonyUtilities isTTYSupportedForContext:](RTTTelephonyUtilities, "isTTYSupportedForContext:", v3)&& +[RTTTelephonyUtilities isRTTSupportedForContext:v3];

  return v4;
}

+ (BOOL)hardwareTTYIsSupportedForContext:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)MEMORY[0x223C60680]();
  if (+[RTTTelephonyUtilities isTTYSupportedForContext:v3])
  {
    char v5 = [MEMORY[0x263F7E198] supportsPrimaryCalling];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)softwareTTYIsSupportedForContext:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = (void *)MEMORY[0x223C60680]();
  if ([MEMORY[0x263F472B0] isInternalInstall]
    && (+[RTTSettings sharedInstance],
        char v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 internalOverrideTTYAvailability],
        v5,
        (v6 & 1) != 0))
  {
    char v7 = 1;
  }
  else
  {
    v19 = v4;
    BOOL v8 = +[RTTTelephonyUtilities isTTYSupportedForContext:v3];
    int v9 = [MEMORY[0x263F7E198] supportsPrimaryCalling];
    int v10 = [MEMORY[0x263F7E198] isThumperCallingEnabled];
    int v11 = [MEMORY[0x263F7E198] isDirectTelephonyCallingCurrentlyAvailable];
    int v12 = [MEMORY[0x263F7E198] isRelayCallingEnabled];
    BOOL v13 = +[RTTTelephonyUtilities isRTTSupportedForContext:v3];
    v14 = +[RTTSettings sharedInstance];
    int v15 = [v14 continuityRTTIsSupported];

    char v16 = AXLogRTT();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = [MEMORY[0x263F7E198] thumperCallingCapabilityInfo];
      *(_DWORD *)buf = 67110912;
      BOOL v21 = v8;
      __int16 v22 = 1024;
      int v23 = v9;
      __int16 v24 = 1024;
      int v25 = v10;
      __int16 v26 = 1024;
      int v27 = v11;
      __int16 v28 = 1024;
      int v29 = v12;
      __int16 v30 = 1024;
      int v31 = v15;
      __int16 v32 = 1024;
      BOOL v33 = v13;
      __int16 v34 = 1024;
      int v35 = [v17 provisioningStatus];
      _os_log_impl(&dword_21FEA9000, v16, OS_LOG_TYPE_INFO, "SW TTY enabled=%d, Primary calling: %d, Thumper: %d, Direct: %d, Relay: %d, RTTRelay: %d, RTT supported %d, Thumper provisioning: %d", buf, 0x32u);
    }
    char v7 = v8 & v9 | v15 | (v9 | v10 | v11 | v12) & v13;
    BOOL v4 = v19;
  }

  return v7;
}

+ (BOOL)shouldUseRTTForContext:(id)a3
{
  if (!+[RTTTelephonyUtilities isRTTSupportedForContext:a3])return 0; {
  id v3 = +[RTTTelephonyUtilities sharedUtilityProvider];
  }
  BOOL v4 = [v3 currentPreferredTransportMethod] == 2;

  return v4;
}

+ (BOOL)relayIsSupportedForContext:(id)a3
{
  id v3 = +[RTTTelephonyUtilities relayPhoneNumberForContext:a3];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

+ (id)relayPhoneNumberForContext:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[RTTTelephonyUtilities sharedUtilityProvider];
  char v5 = [v4 relayNumberForContext:v3];

  return v5;
}

+ (BOOL)isRTTCallHoldSupportedForContext:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[RTTTelephonyUtilities sharedUtilityProvider];
  char v5 = [v4 isRTTCallHoldSupportedForContext:v3];

  return v5;
}

- (RTTTelephonyUtilities)init
{
  v22.receiver = self;
  v22.super_class = (Class)RTTTelephonyUtilities;
  v2 = [(RTTTelephonyUtilities *)&v22 init];
  if (v2)
  {
    id v3 = dispatch_queue_create("ttyTelephonyQueue", 0);
    [(RTTTelephonyUtilities *)v2 setTelephonyUpdateQueue:v3];
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v3];
    [v4 setDelegate:v2];
    [(RTTTelephonyUtilities *)v2 setTelephonyClient:v4];
    dispatch_queue_t v5 = dispatch_queue_create("ttyAccountStoreQueue", 0);
    [(RTTTelephonyUtilities *)v2 setAccountStoreQueue:v5];

    uint64_t v6 = [objc_alloc(MEMORY[0x263F21398]) initWithTargetSerialQueue:v3];
    icloudAccountConsolidator = v2->_icloudAccountConsolidator;
    v2->_icloudAccountConsolidator = (AXDispatchTimer *)v6;

    [(AXDispatchTimer *)v2->_icloudAccountConsolidator setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    uint64_t v8 = [objc_alloc(MEMORY[0x263F21398]) initWithTargetSerialQueue:v3];
    icloudRelayConsolidator = v2->_icloudRelayConsolidator;
    v2->_icloudRelayConsolidator = (AXDispatchTimer *)v8;

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__RTTTelephonyUtilities_init__block_invoke;
    block[3] = &unk_264540098;
    int v10 = v2;
    BOOL v21 = v10;
    dispatch_async(v3, block);
    id v11 = objc_alloc(MEMORY[0x263EFEA58]);
    int v12 = objc_opt_new();
    BOOL v13 = (void *)[v11 initWithConfiguration:v12];
    [(RTTTelephonyUtilities *)v10 setContactStore:v13];

    v14 = +[RTTSettings sharedInstance];
    [v14 registerUpdateBlock:&__block_literal_global_42 forRetrieveSelector:sel_TTYHardwareEnabled withListener:v10];

    int v15 = +[RTTSettings sharedInstance];
    [v15 registerUpdateBlock:&__block_literal_global_42 forRetrieveSelector:sel_TTYSoftwareEnabled withListener:v10];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)transportMethodDidChange, @"AXTTYPreferredTransportMethodChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(RTTTelephonyUtilities *)v10 listenForCloudRelayChanges];
    v17 = (void *)MEMORY[0x263F7E198];
    v18 = dispatch_get_global_queue(21, 0);
    [v17 addDelegate:v10 queue:v18];
  }
  return v2;
}

uint64_t __29__RTTTelephonyUtilities_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) registerNotifications];
  [*(id *)(a1 + 32) reloadDefaultVoiceContext];
  [*(id *)(a1 + 32) didChangeRelayCallingAvailability];
  v2 = *(void **)(a1 + 32);

  return [v2 updateHeadphoneState];
}

void __29__RTTTelephonyUtilities_init__block_invoke_2()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"AXTTYPreferredTransportMethodChangedNotification" object:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RTTTelephonyUtilities;
  [(RTTTelephonyUtilities *)&v4 dealloc];
}

- (void)setTTYDictionaryAvailability:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_queue_t v5 = objc_alloc_init(RTTDictionaryManager);
  if ([MEMORY[0x263F472B0] currentProcessIsHeard])
  {
    if (v3) {
      [(RTTDictionaryManager *)v5 downloadIfNeeded];
    }
    else {
      [(RTTDictionaryManager *)v5 deleteIfNeeded];
    }
  }
  else
  {
    objc_super v4 = +[RTTServer sharedInstance];
    [v4 setTTYDictionaryAvailability:v3];
  }
}

- (void)didChangeTelephonyCallingSupport
{
  [(RTTTelephonyUtilities *)self setCallCapabilitiesSupportsTelephonyCalls:0];
  v2 = AXLogRTT();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_21FEA9000, v2, OS_LOG_TYPE_INFO, "Reseting telephony calling support", v3, 2u);
  }
}

- (void)updateHeadphoneState
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(RTTTelephonyUtilities *)self currentPreferredTransportMethod];
  objc_super v4 = [MEMORY[0x263F544E0] sharedAVSystemController];
  dispatch_queue_t v5 = [v4 attributeForKey:*MEMORY[0x263F543A8]];
  int v6 = [v5 BOOLValue];

  char v7 = [v4 attributeForKey:*MEMORY[0x263F543A0]];
  unsigned int v8 = [v7 BOOLValue];

  [(RTTTelephonyUtilities *)self setHeadphoneJackSupportsTTY:v6 & v8];
  int v9 = AXLogRTT();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v16 = 67109376;
    int v17 = v6;
    __int16 v18 = 1024;
    unsigned int v19 = v8;
    _os_log_impl(&dword_21FEA9000, v9, OS_LOG_TYPE_INFO, "Headphone state changed [%d, %d]", (uint8_t *)&v16, 0xEu);
  }

  int v10 = AXLogRTT();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unsigned int v11 = [(RTTTelephonyUtilities *)self currentPreferredTransportMethod];
    int v16 = 67109376;
    int v17 = v3;
    __int16 v18 = 1024;
    unsigned int v19 = v11;
    _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Current method %d, preferred method %d", (uint8_t *)&v16, 0xEu);
  }

  if (v3 != [(RTTTelephonyUtilities *)self currentPreferredTransportMethod])
  {
    int v12 = AXLogRTT();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = [(RTTTelephonyUtilities *)self currentPreferredTransportMethod];
      int v16 = 67109120;
      int v17 = v13;
      _os_log_impl(&dword_21FEA9000, v12, OS_LOG_TYPE_INFO, "Preferred TTY method changed to %d", (uint8_t *)&v16, 8u);
    }

    v14 = AXLogRTT();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_21FEA9000, v14, OS_LOG_TYPE_INFO, "Posting transport changed because headphone state changed", (uint8_t *)&v16, 2u);
    }

    int v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 postNotificationName:@"AXTTYPreferredTransportMethodChangedNotification" object:0];
  }
}

- (void)headphoneStateChangedNotification:(id)a3
{
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  dispatch_queue_t v5 = [(RTTTelephonyUtilities *)self telephonyUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__RTTTelephonyUtilities_headphoneStateChangedNotification___block_invoke;
  block[3] = &unk_264540098;
  void block[4] = self;
  dispatch_after(v4, v5, block);
}

uint64_t __59__RTTTelephonyUtilities_headphoneStateChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateHeadphoneState];
}

- (void)registerNotifications
{
  v14[3] = *MEMORY[0x263EF8340];
  unint64_t v3 = [MEMORY[0x263F544E0] sharedAVSystemController];
  dispatch_time_t v4 = (void *)MEMORY[0x263F543B0];
  dispatch_queue_t v5 = (void *)MEMORY[0x263F54320];
  uint64_t v6 = *MEMORY[0x263F54320];
  v14[0] = *MEMORY[0x263F543B0];
  v14[1] = v6;
  char v7 = (uint64_t *)MEMORY[0x263F54470];
  v14[2] = *MEMORY[0x263F54470];
  unsigned int v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  [v3 setAttribute:v8 forKey:*MEMORY[0x263F544A0] error:0];

  int v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:self selector:sel_headphoneStateChangedNotification_ name:*v4 object:0];

  int v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:self selector:sel_headphoneStateChangedNotification_ name:*v5 object:0];

  unsigned int v11 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v12 = *v7;
  int v13 = [MEMORY[0x263F544E0] sharedAVSystemController];
  [v11 addObserver:self selector:sel_mediaServerDied name:v12 object:v13];
}

- (void)mediaServerDied
{
  unint64_t v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_queue_t v5 = 0;
    _os_log_impl(&dword_21FEA9000, v3, OS_LOG_TYPE_INFO, "Media server died.", v5, 2u);
  }

  dispatch_time_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  [(RTTTelephonyUtilities *)self performSelector:sel_registerNotifications withObject:0 afterDelay:2.0];
  [(RTTTelephonyUtilities *)self headphoneStateChangedNotification:0];
}

- (unint64_t)currentPreferredTransportMethod
{
  unint64_t v3 = [(RTTTelephonyUtilities *)self defaultVoiceContext];
  unint64_t v4 = [(RTTTelephonyUtilities *)self currentPreferredTransportMethodForContext:v3];

  return v4;
}

- (void)setCallCapabilitiesSupportsTelephonyCalls:(id)a3
{
  id v7 = a3;
  unint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  callCapabilitiesSupportsTelephonyCalls = v4->_callCapabilitiesSupportsTelephonyCalls;
  v4->_callCapabilitiesSupportsTelephonyCalls = (NSNumber *)v5;

  objc_sync_exit(v4);
}

- (NSNumber)callCapabilitiesSupportsTelephonyCalls
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  callCapabilitiesSupportsTelephonyCalls = v2->_callCapabilitiesSupportsTelephonyCalls;
  if (!callCapabilitiesSupportsTelephonyCalls)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F7E198], "supportsTelephonyCalls"));
    uint64_t v5 = v2->_callCapabilitiesSupportsTelephonyCalls;
    v2->_callCapabilitiesSupportsTelephonyCalls = (NSNumber *)v4;

    uint64_t v6 = AXLogRTT();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = v2->_callCapabilitiesSupportsTelephonyCalls;
      int v10 = 138412290;
      unsigned int v11 = v7;
      _os_log_impl(&dword_21FEA9000, v6, OS_LOG_TYPE_INFO, "Retrieving new telephony supports calling: %@", (uint8_t *)&v10, 0xCu);
    }

    callCapabilitiesSupportsTelephonyCalls = v2->_callCapabilitiesSupportsTelephonyCalls;
  }
  unsigned int v8 = (void *)[(NSNumber *)callCapabilitiesSupportsTelephonyCalls copy];
  objc_sync_exit(v2);

  return (NSNumber *)v8;
}

- (unint64_t)currentPreferredTransportMethodForContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![MEMORY[0x263F472B0] deviceIsPhone]) {
    goto LABEL_8;
  }
  uint64_t v5 = [(RTTTelephonyUtilities *)self callCapabilitiesSupportsTelephonyCalls];
  if (![v5 BOOLValue]) {
    goto LABEL_7;
  }
  uint64_t v6 = +[RTTSettings sharedInstance];
  if (([v6 TTYHardwareEnabledForContext:v4] & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  BOOL v7 = [(RTTTelephonyUtilities *)self headphoneJackSupportsTTY];

  if (v7)
  {
    unint64_t v8 = 1;
    goto LABEL_10;
  }
LABEL_8:
  int v9 = +[RTTSettings sharedInstance];
  int v10 = [v9 TTYSoftwareEnabledForContext:v4];

  if (!v10)
  {
    v14 = AXLogRTT();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      *(void *)int v17 = v4;
      _os_log_impl(&dword_21FEA9000, v14, OS_LOG_TYPE_INFO, "No TTY transport method support, so not migrating or priming server: %@", (uint8_t *)&v16, 0xCu);
    }
    unint64_t v8 = 0;
    goto LABEL_17;
  }
  unint64_t v8 = 2;
LABEL_10:
  unsigned int v11 = +[RTTSettings sharedInstance];
  int v12 = [v11 shouldMigrateSettings];

  int v13 = AXLogRTT();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v16 = 67109634;
    *(_DWORD *)int v17 = v8;
    *(_WORD *)&v17[4] = 1024;
    *(_DWORD *)&v17[6] = v12;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_21FEA9000, v13, OS_LOG_TYPE_INFO, "Current preferred transport is : %d - %d = %@", (uint8_t *)&v16, 0x18u);
  }

  if (v12)
  {
    v14 = +[RTTServer sharedInstance];
    [v14 primeRTTServer];
LABEL_17:
  }
  return v8;
}

- (BOOL)contactIsTTYContact:(id)a3
{
  id v4 = a3;
  if ([(RTTTelephonyUtilities *)self currentPreferredTransportMethod])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = +[RTTServer sharedInstance];
    char v5 = [v6 contactIsTTYContact:v4];
  }
  return v5;
}

- (BOOL)relayIsSupported
{
  return +[RTTTelephonyUtilities relayIsSupported];
}

- (id)myPhoneNumber
{
  unint64_t v3 = [(RTTTelephonyUtilities *)self defaultVoiceContext];
  id v4 = [(RTTTelephonyUtilities *)self phoneNumberForContext:v3];

  return v4;
}

- (id)phoneNumberForContext:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    phoneNumberInfoCache = self->_phoneNumberInfoCache;
    if (!phoneNumberInfoCache)
    {
      uint64_t v6 = (NSMutableDictionary *)objc_opt_new();
      BOOL v7 = self->_phoneNumberInfoCache;
      self->_phoneNumberInfoCache = v6;

      phoneNumberInfoCache = self->_phoneNumberInfoCache;
    }
    unint64_t v8 = [v4 uuid];
    int v9 = [(NSMutableDictionary *)phoneNumberInfoCache objectForKey:v8];

    if (v9)
    {
      int v10 = self->_phoneNumberInfoCache;
      unsigned int v11 = [v4 uuid];
      int v12 = [(NSMutableDictionary *)v10 objectForKey:v11];
    }
    else
    {
      int v17 = [(RTTTelephonyUtilities *)self telephonyClient];
      id v23 = 0;
      int v12 = [v17 getPhoneNumber:v4 error:&v23];
      int v16 = v23;

      __int16 v18 = AXLogRTT();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        int v25 = v12;
        __int16 v26 = 2112;
        int v27 = v4;
        _os_log_impl(&dword_21FEA9000, v18, OS_LOG_TYPE_INFO, "Retrieved phone number %@ from context %@ for caching", buf, 0x16u);
      }

      if (v16) {
        goto LABEL_15;
      }
    }
    if ([v12 isPresent])
    {
      int v13 = [v12 number];
      v14 = self->_phoneNumberInfoCache;
      int v15 = [v4 uuid];
      [(NSMutableDictionary *)v14 setObject:v12 forKey:v15];
      int v16 = 0;
LABEL_18:

      goto LABEL_19;
    }
    int v16 = 0;
LABEL_15:
    id v19 = self->_phoneNumberInfoCache;
    uint64_t v20 = objc_opt_new();
    BOOL v21 = [v4 uuid];
    [(NSMutableDictionary *)v19 setObject:v20 forKey:v21];

    int v15 = AXLogRTT();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      int v25 = v4;
      __int16 v26 = 2112;
      int v27 = v16;
      _os_log_impl(&dword_21FEA9000, v15, OS_LOG_TYPE_INFO, "Cached blank phone number for context %@. Error? %@", buf, 0x16u);
    }
    int v13 = 0;
    goto LABEL_18;
  }
  int v16 = AXLogRTT();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[RTTTelephonyUtilities phoneNumberForContext:](v16);
  }
  int v13 = 0;
LABEL_19:

  return v13;
}

- (id)ttyMeContact
{
  v11[3] = *MEMORY[0x263EF8340];
  if (_AXSInUnitTestMode())
  {
    if (ttyMeContact_onceToken != -1) {
      dispatch_once(&ttyMeContact_onceToken, &__block_literal_global_64);
    }
    id v2 = (id)ttyMeContact_unitTestMe;
  }
  else
  {
    unint64_t v3 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
    uint64_t v4 = *MEMORY[0x263EFDF80];
    v11[0] = v3;
    v11[1] = v4;
    v11[2] = *MEMORY[0x263EFE070];
    char v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];

    uint64_t v6 = +[RTTTelephonyUtilities sharedUtilityProvider];
    BOOL v7 = [v6 contactStore];
    uint64_t v10 = 0;
    unint64_t v8 = objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v5, &v10);

    id v2 = v8;
  }

  return v2;
}

uint64_t __37__RTTTelephonyUtilities_ttyMeContact__block_invoke()
{
  ttyMeContact_unitTestMe = (uint64_t)objc_alloc_init(MEMORY[0x263EFE9F8]);

  return MEMORY[0x270F9A758]();
}

- (BOOL)contactPathIsMe:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [MEMORY[0x263F089C0] decimalDigitCharacterSet];
  [v5 invert];
  uint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];
  BOOL v7 = [v6 componentsJoinedByString:&stru_26D1B01C8];

  unint64_t v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Is contact path %@ (%@) me?", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v19 = 0;
  int v9 = [(RTTTelephonyUtilities *)self subscriptionContexts];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__RTTTelephonyUtilities_contactPathIsMe___block_invoke;
  v14[3] = &unk_264540320;
  void v14[4] = self;
  id v10 = v5;
  id v15 = v10;
  id v11 = v4;
  id v16 = v11;
  int v17 = buf;
  [v9 enumerateObjectsUsingBlock:v14];

  BOOL v12 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v12;
}

void __41__RTTTelephonyUtilities_contactPathIsMe___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  BOOL v7 = [*(id *)(a1 + 32) phoneNumberForContext:v6];
  unint64_t v8 = [v7 componentsSeparatedByCharactersInSet:*(void *)(a1 + 40)];
  int v9 = [v8 componentsJoinedByString:&stru_26D1B01C8];

  id v10 = AXLogRTT();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Finding own contact path from context %@ with phone number %@", (uint8_t *)&v12, 0x16u);
  }

  if ([v7 isEqualToString:*(void *)(a1 + 48)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
    id v11 = AXLogRTT();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_21FEA9000, v11, OS_LOG_TYPE_INFO, "Yes it's my phone number!", (uint8_t *)&v12, 2u);
    }
  }
}

- (id)contactPathForCall:(id)a3
{
  id v4 = [a3 dialRequestForRedial];
  char v5 = [v4 localSenderIdentityUUID];
  id v6 = [v5 UUIDString];
  BOOL v7 = [(RTTTelephonyUtilities *)self phoneNumberFromUUID:v6];

  int v8 = [MEMORY[0x263F472B0] deviceIsPad];
  if (![v7 length] || (_AXSInUnitTestMode() ? (int v9 = 1) : (int v9 = v8), v9 == 1))
  {
    uint64_t v10 = ttyLocString(@"TTYPersonMe");

    BOOL v7 = (void *)v10;
  }

  return v7;
}

- (id)phoneNumberFromUUID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__0;
  int v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  char v5 = [(RTTTelephonyUtilities *)self subscriptionContexts];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __45__RTTTelephonyUtilities_phoneNumberFromUUID___block_invoke;
  v9[3] = &unk_264540348;
  id v6 = v4;
  id v11 = self;
  int v12 = &v13;
  id v10 = v6;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __45__RTTTelephonyUtilities_phoneNumberFromUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  id v6 = [v12 uuid];
  id v7 = [v6 UUIDString];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 40) phoneNumberForContext:v12];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

- (id)labelFromUUID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__0;
  int v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  char v5 = [(RTTTelephonyUtilities *)self subscriptionContexts];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __39__RTTTelephonyUtilities_labelFromUUID___block_invoke;
  v9[3] = &unk_264540348;
  id v6 = v4;
  id v11 = self;
  id v12 = &v13;
  id v10 = v6;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __39__RTTTelephonyUtilities_labelFromUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v19 = a2;
  id v6 = [v19 uuid];
  id v7 = [v6 UUIDString];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 40) telephonyClient];
    id v10 = [v9 getSimLabel:v19 error:0];
    uint64_t v11 = [v10 text];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length]) {
      id v14 = (id)[*(id *)(a1 + 40) phoneNumberForContext:v19];
    }
    if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
    {
      uint64_t v15 = [v19 uuid];
      uint64_t v16 = [v15 UUIDString];
      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
      id v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
    *a4 = 1;
  }
}

- (BOOL)answerRTTCallAsMutedForCall:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [v3 isEmergency];
  int v5 = [v3 supportsTTYWithVoice];

  id v6 = +[RTTSettings sharedInstance];
  int v7 = [v6 answerRTTCallsAsMuted];

  int v8 = AXLogRTT();
  int v9 = v4 ^ 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109632;
    v11[1] = v7;
    __int16 v12 = 1024;
    int v13 = v9;
    __int16 v14 = 1024;
    int v15 = v5;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Mute call on answer? Preference: %d Not emergency: %d Supports RTT: %d", (uint8_t *)v11, 0x14u);
  }

  return v7 & v9 & v5;
}

- (void)purgePhoneNumberInfoCache
{
  id v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_21FEA9000, v3, OS_LOG_TYPE_INFO, "Purging phone number info cache", v4, 2u);
  }

  [(NSMutableDictionary *)self->_phoneNumberInfoCache removeAllObjects];
}

- (BOOL)deviceIsTinker
{
  return 0;
}

- (void)carrierSettingsDidChange
{
  id v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_21FEA9000, v3, OS_LOG_TYPE_INFO, "Carrier settings did change, reloading context and relay phone numbers", v4, 2u);
  }

  [(RTTTelephonyUtilities *)self reloadDefaultVoiceContext];
  [(RTTTelephonyUtilities *)self reloadRelayPhoneNumbers];
  [(RTTTelephonyUtilities *)self purgePhoneNumberInfoCache];
  [(RTTTelephonyUtilities *)self setCachedSubscriptionContexts:0];
  [(RTTTelephonyUtilities *)self setCachedActiveContexts:0];
}

- (id)activeContexts
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(RTTTelephonyUtilities *)self cachedActiveContexts];

  if (v3)
  {
    int v4 = [(RTTTelephonyUtilities *)self cachedActiveContexts];
  }
  else
  {
    int v5 = [(RTTTelephonyUtilities *)self telephonyClient];
    id v12 = 0;
    id v6 = [v5 getActiveContexts:&v12];
    id v7 = v12;

    if (v7)
    {
      int v8 = AXLogRTT();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v7;
        _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Error getting contexts %@", buf, 0xCu);
      }
    }
    [(RTTTelephonyUtilities *)self setCachedActiveContexts:v6];
    int v9 = AXLogRTT();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [(RTTTelephonyUtilities *)self cachedActiveContexts];
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_impl(&dword_21FEA9000, v9, OS_LOG_TYPE_INFO, "Caching active contexts %@", buf, 0xCu);
    }
    int v4 = [(RTTTelephonyUtilities *)self cachedActiveContexts];
  }

  return v4;
}

- (id)subscriptionContexts
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(RTTTelephonyUtilities *)self cachedSubscriptionContexts];

  if (v3)
  {
    int v4 = [(RTTTelephonyUtilities *)self cachedSubscriptionContexts];
  }
  else
  {
    int v5 = [(RTTTelephonyUtilities *)self telephonyClient];
    id v13 = 0;
    id v6 = [v5 getSubscriptionInfoWithError:&v13];
    id v7 = v13;

    if (v7)
    {
      int v8 = AXLogRTT();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v7;
        _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Error getting subscriptionInfo %@", buf, 0xCu);
      }
    }
    int v9 = [v6 subscriptions];
    [(RTTTelephonyUtilities *)self setCachedSubscriptionContexts:v9];

    id v10 = AXLogRTT();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [(RTTTelephonyUtilities *)self cachedSubscriptionContexts];
      *(_DWORD *)buf = 138412290;
      id v15 = v11;
      _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Caching subscription contexts %@", buf, 0xCu);
    }
    int v4 = [(RTTTelephonyUtilities *)self cachedSubscriptionContexts];
  }

  return v4;
}

- (id)contextForCall:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(RTTTelephonyUtilities *)self subscriptionContexts];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __40__RTTTelephonyUtilities_contextForCall___block_invoke;
  v11[3] = &unk_264540370;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v11];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v8 = AXLogRTT();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "No context found for call %@", buf, 0xCu);
    }
    int v9 = 0;
  }
  else
  {
    int v8 = [(RTTTelephonyUtilities *)self subscriptionContexts];
    int v9 = [v8 objectAtIndex:v7];
  }

  return v9;
}

uint64_t __40__RTTTelephonyUtilities_contextForCall___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) localSenderIdentityUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (BOOL)reloadRelayPhoneNumbers
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if ([MEMORY[0x263F472B0] currentProcessIsHeard])
  {
    id v3 = AXLogRTT();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FEA9000, v3, OS_LOG_TYPE_INFO, "Updating relay number with carrier bundle", buf, 2u);
    }

    id v4 = [(RTTTelephonyUtilities *)self activeContexts];
    uint64_t v5 = [v4 subscriptions];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__RTTTelephonyUtilities_reloadRelayPhoneNumbers__block_invoke;
    v8[3] = &unk_264540398;
    v8[4] = self;
    v8[5] = &v10;
    [v5 enumerateObjectsUsingBlock:v8];
  }
  char v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __48__RTTTelephonyUtilities_reloadRelayPhoneNumbers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 context];
  char v6 = [v4 relayNumberForContext:v5];

  if ([v6 length])
  {
    uint64_t v7 = +[RTTSettings sharedInstance];
    int v8 = [v3 context];
    int v9 = [v7 preferredRelayNumberForContext:v8];
    uint64_t v10 = [v9 length];

    if (!v10)
    {
      uint64_t v11 = AXLogRTT();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [v3 context];
        int v15 = 138412546;
        uint64_t v16 = v6;
        __int16 v17 = 2112;
        id v18 = v12;
        _os_log_impl(&dword_21FEA9000, v11, OS_LOG_TYPE_INFO, "setting relay number: %@ for context: %@", (uint8_t *)&v15, 0x16u);
      }
      char v13 = +[RTTSettings sharedInstance];
      id v14 = [v3 context];
      [v13 setPreferredRelayNumber:v6 forContext:v14];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

- (void)reloadDefaultVoiceContext
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FEA9000, a2, OS_LOG_TYPE_ERROR, "Could not retrieve default voice context: %@", (uint8_t *)&v2, 0xCu);
}

void __50__RTTTelephonyUtilities_reloadDefaultVoiceContext__block_invoke(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = (void *)a1[4];
  if (v5)
  {
    char v6 = [v3 uuid];
    int v7 = [v5 isEqual:v6];

    if (v7)
    {
      uint64_t v8 = [v4 context];
      uint64_t v9 = *(void *)(a1[6] + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v11 = AXLogRTT();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(*(void *)(a1[6] + 8) + 40);
        int v19 = 138412290;
        uint64_t v20 = v12;
        _os_log_impl(&dword_21FEA9000, v11, OS_LOG_TYPE_INFO, "Checking voice preferred context %@", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  else if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v13 = [v3 context];
    uint64_t v14 = *(void *)(a1[6] + 8);
    int v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  uint64_t v16 = [v4 context];

  if (v16)
  {
    __int16 v17 = (void *)a1[5];
    id v18 = [v4 context];
    [v17 addObject:v18];
  }
}

- (id)getCarrierValueForKey:(id)a3 andContext:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    v11[0] = v6;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    uint64_t v9 = [(RTTTelephonyUtilities *)self getCarrierValueForKeyHierarchy:v8 andContext:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)getCarrierValueForKeyHierarchy:(id)a3 andContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(RTTTelephonyUtilities *)self telephonyClient];
    id v14 = 0;
    uint64_t v9 = [v8 context:v7 getCarrierBundleValue:v6 error:&v14];
    uint64_t v10 = v14;

    if (!v10) {
      goto LABEL_9;
    }
    uint64_t v11 = AXLogRTT();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[RTTTelephonyUtilities getCarrierValueForKeyHierarchy:andContext:]((uint64_t)v6, (uint64_t)v10, v11);
    }
  }
  else
  {
    uint64_t v10 = AXLogRTT();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Empty context", v13, 2u);
    }
  }
  uint64_t v9 = 0;
LABEL_9:

  return v9;
}

- (BOOL)isTTYOverIMSSupportedForContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(RTTTelephonyUtilities *)self getCarrierValueForKeyHierarchy:&unk_26D1B3C28 andContext:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v6 = [v5 BOOLValue];
  }
  else {
    int v6 = 0;
  }
  id v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = +[RTTSettings sharedInstance];
    int v12 = 138413058;
    id v13 = v4;
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 2112;
    __int16 v17 = v5;
    __int16 v18 = 1024;
    int v19 = [v8 continuityRTTIsSupported];
    _os_log_impl(&dword_21FEA9000, v7, OS_LOG_TYPE_INFO, "RTT supported %@ - %d = %@ -- %d", (uint8_t *)&v12, 0x22u);
  }
  if (v6)
  {
    char v9 = 1;
  }
  else
  {
    uint64_t v10 = +[RTTSettings sharedInstance];
    char v9 = [v10 continuityRTTIsSupported];
  }
  return v9;
}

- (BOOL)isTTYSupportedForContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(RTTTelephonyUtilities *)self getCarrierValueForKey:@"ShowTTY" andContext:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v6 = [v5 BOOLValue];
  }
  else {
    int v6 = 0;
  }
  id v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 1024;
    int v12 = v6;
    _os_log_impl(&dword_21FEA9000, v7, OS_LOG_TYPE_INFO, "TTY supported %@ - %d", (uint8_t *)&v9, 0x12u);
  }

  return v6;
}

- (id)relayNumberForContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(RTTTelephonyUtilities *)self getCarrierValueForKey:@"TTYRelayNumber" andContext:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  if ([v6 length])
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(RTTTelephonyUtilities *)self getCarrierValueForKeyHierarchy:&unk_26D1B3C40 andContext:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;

      id v6 = v8;
    }
    int v9 = AXLogRTT();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_21FEA9000, v9, OS_LOG_TYPE_INFO, "Checking IMSConfig for relay number %@", (uint8_t *)&v11, 0xCu);
    }
  }

  return v6;
}

- (BOOL)isRTTCallHoldSupportedForContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(RTTTelephonyUtilities *)self getCarrierValueForKeyHierarchy:&unk_26D1B3C58 andContext:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = [v5 BOOLValue];
  }
  else {
    char v6 = 0;
  }
  id v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_21FEA9000, v7, OS_LOG_TYPE_INFO, "RTT call hold supported %@ for context %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (BOOL)currentProcessHandlesCloudRelay
{
  return [MEMORY[0x263F472B0] currentProcessIsHeard];
}

- (void)listenForCloudRelayChanges
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = [(RTTTelephonyUtilities *)self currentProcessHandlesCloudRelay];
  id v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v14 = v3;
    _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "Listening for cloud relay changes: %d", buf, 8u);
  }

  if (v3)
  {
    uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v6 = *MEMORY[0x263F085E8];
    id v7 = [MEMORY[0x263F08C40] defaultStore];
    [v5 addObserver:self selector:sel_iCloudRTTRelayDidChange_ name:v6 object:v7];

    id v8 = [MEMORY[0x263F08C40] defaultStore];
    [v8 synchronize];

    telephonyUpdateQueue = self->_telephonyUpdateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__RTTTelephonyUtilities_listenForCloudRelayChanges__block_invoke;
    block[3] = &unk_264540098;
    void block[4] = self;
    dispatch_async(telephonyUpdateQueue, block);
    id v10 = [(RTTTelephonyUtilities *)self accountStoreQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __51__RTTTelephonyUtilities_listenForCloudRelayChanges__block_invoke_109;
    v11[3] = &unk_264540098;
    void v11[4] = self;
    dispatch_async(v10, v11);
  }
}

uint64_t __51__RTTTelephonyUtilities_listenForCloudRelayChanges__block_invoke(uint64_t a1)
{
  int v2 = AXLogRTT();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21FEA9000, v2, OS_LOG_TYPE_INFO, "Processing icloud settings for RTT", v4, 2u);
  }

  [*(id *)(a1 + 32) iCloudAccountDidChange:0];
  return [*(id *)(a1 + 32) iCloudRTTRelayDidChange:0];
}

void __51__RTTTelephonyUtilities_listenForCloudRelayChanges__block_invoke_109(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = AXLogRTT();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FEA9000, v2, OS_LOG_TYPE_INFO, "RTT fetching account store", buf, 2u);
  }

  id v3 = objc_alloc_init(MEMORY[0x263EFB210]);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v3;

  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
  id v7 = [v6 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAE58]];
  id v8 = [v6 accountsWithAccountType:v7];

  int v9 = AXLogRTT();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v11 = v8;
    _os_log_impl(&dword_21FEA9000, v9, OS_LOG_TYPE_INFO, "retrieved accounts: %@", buf, 0xCu);
  }

  AXPerformBlockAsynchronouslyOnMainThread();
}

void __51__RTTTelephonyUtilities_listenForCloudRelayChanges__block_invoke_111(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_iCloudAccountDidChange_ name:*MEMORY[0x263EFB060] object:0];
}

- (void)didChangeOutgoingRelayCallerID
{
  if ([(RTTTelephonyUtilities *)self currentProcessHandlesCloudRelay])
  {
    id v3 = AXLogRTT();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_21FEA9000, v3, OS_LOG_TYPE_INFO, "Did change outgoing relay caller ID", v4, 2u);
    }

    [(RTTTelephonyUtilities *)self iCloudRTTRelayDidChange:0];
  }
}

- (void)didChangeRelayCallingCapabilities
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(RTTTelephonyUtilities *)self currentProcessHandlesCloudRelay])
  {
    uint64_t v2 = [MEMORY[0x263F7E198] supportsRelayCalling];
    uint64_t v3 = [MEMORY[0x263F7E198] isRelayCallingEnabled];
    uint64_t v4 = +[RTTSettings sharedInstance];
    [v4 setSupportsRelayCalling:v2];

    uint64_t v5 = +[RTTSettings sharedInstance];
    [v5 setIsRelayCallingEnabled:v3];

    uint64_t v6 = AXLogRTT();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109376;
      v7[1] = v2;
      __int16 v8 = 1024;
      int v9 = v3;
      _os_log_impl(&dword_21FEA9000, v6, OS_LOG_TYPE_INFO, "Did change relay calling capibilities %d %d", (uint8_t *)v7, 0xEu);
    }
  }
}

- (void)didChangeRelayCallingAvailability
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(RTTTelephonyUtilities *)self currentProcessHandlesCloudRelay])
  {
    uint64_t v2 = [MEMORY[0x263F7E198] supportsRelayCalling];
    uint64_t v3 = [MEMORY[0x263F7E198] isRelayCallingEnabled];
    uint64_t v4 = +[RTTSettings sharedInstance];
    [v4 setSupportsRelayCalling:v2];

    uint64_t v5 = +[RTTSettings sharedInstance];
    [v5 setIsRelayCallingEnabled:v3];

    uint64_t v6 = AXLogRTT();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109376;
      v7[1] = v2;
      __int16 v8 = 1024;
      int v9 = v3;
      _os_log_impl(&dword_21FEA9000, v6, OS_LOG_TYPE_INFO, "Did change relay calling availability %d %d", (uint8_t *)v7, 0xEu);
    }
  }
}

- (void)iCloudRTTRelayDidChange:(id)a3
{
  uint64_t v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "Cloud relay updated", buf, 2u);
  }

  icloudRelayConsolidator = self->_icloudRelayConsolidator;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__RTTTelephonyUtilities_iCloudRTTRelayDidChange___block_invoke;
  v6[3] = &unk_264540098;
  v6[4] = self;
  [(AXDispatchTimer *)icloudRelayConsolidator afterDelay:v6 processBlock:3.0];
}

uint64_t __49__RTTTelephonyUtilities_iCloudRTTRelayDidChange___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08C40] defaultStore];
  [v2 synchronize];

  uint64_t v3 = [*(id *)(a1 + 32) relayRTTIsSupported];
  uint64_t v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "Relay supported? %d", (uint8_t *)v8, 8u);
  }

  uint64_t v5 = +[RTTSettings sharedInstance];
  [v5 setContinuityRTTIsSupported:v3];

  if (!+[RTTTelephonyUtilities softwareTTYIsSupported])
  {
    uint64_t v6 = +[RTTSettings sharedInstance];
    [v6 setTTYSoftwareEnabled:0];
  }
  return [*(id *)(a1 + 32) headphoneStateChangedNotification:0];
}

- (void)iCloudAccountDidChange:(id)a3
{
  id v4 = a3;
  telephonyUpdateQueue = self->_telephonyUpdateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __48__RTTTelephonyUtilities_iCloudAccountDidChange___block_invoke;
  v7[3] = &unk_2645400C0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(telephonyUpdateQueue, v7);
}

uint64_t __48__RTTTelephonyUtilities_iCloudAccountDidChange___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = AXLogRTT();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_21FEA9000, v2, OS_LOG_TYPE_INFO, "iCloud Account did change: %@", buf, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(v4 + 24);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __48__RTTTelephonyUtilities_iCloudAccountDidChange___block_invoke_114;
  v7[3] = &unk_264540098;
  void v7[4] = v4;
  return [v5 afterDelay:v7 processBlock:3.0];
}

uint64_t __48__RTTTelephonyUtilities_iCloudAccountDidChange___block_invoke_114(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processiCloudAccountForRTT];
}

- (void)_processiCloudAccountForRTT
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F7E198] supportsPrimaryCalling];
  if ([MEMORY[0x263F472B0] currentProcessIsHeard]) {
    int v4 = 1;
  }
  else {
    int v4 = [MEMORY[0x263F472B0] currentProcessIsPreferences];
  }
  uint64_t v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v17 = 67109376;
    *(_DWORD *)__int16 v18 = v3;
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = v4;
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "iCloud changed: pushing changes: primary calling supported: %d for right process: %d", (uint8_t *)&v17, 0xEu);
  }

  if ((v3 & v4) == 1)
  {
    id v6 = [MEMORY[0x263F08C40] defaultStore];
    id v7 = (void *)MEMORY[0x263EFF9A0];
    id v8 = [v6 dictionaryForKey:@"RTTCloudRelayNumberKey"];
    uint64_t v9 = [v7 dictionaryWithDictionary:v8];

    uint64_t v10 = [(RTTTelephonyUtilities *)self defaultVoiceContext];
    __int16 v11 = [v10 uuid];
    uint64_t v12 = [v11 UUIDString];

    uint64_t v13 = [(RTTTelephonyUtilities *)self phoneNumberFromUUID:v12];
    BOOL v14 = AXLogRTT();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412546;
      *(void *)__int16 v18 = v13;
      *(_WORD *)&v18[8] = 2112;
      int v19 = v12;
      _os_log_impl(&dword_21FEA9000, v14, OS_LOG_TYPE_INFO, "Phone num: %@ for %@", (uint8_t *)&v17, 0x16u);
    }

    if ([v13 length])
    {
      uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", +[RTTTelephonyUtilities isRTTSupported](RTTTelephonyUtilities, "isRTTSupported"));
      [v9 setObject:v15 forKey:v13];

      __int16 v16 = AXLogRTT();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        *(void *)__int16 v18 = v9;
        _os_log_impl(&dword_21FEA9000, v16, OS_LOG_TYPE_DEFAULT, "Storing relay phones: %@ for RTT", (uint8_t *)&v17, 0xCu);
      }

      [v6 setObject:v9 forKey:@"RTTCloudRelayNumberKey"];
      [v6 synchronize];
    }
  }
}

- (BOOL)relayRTTIsSupported
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F7E198] supportsTelephonyRelayCalling])
  {
    uint64_t v2 = [MEMORY[0x263F7E198] outgoingRelayCallerID];
    int v3 = [MEMORY[0x263F08C40] defaultStore];
    int v4 = [v3 dictionaryForKey:@"RTTCloudRelayNumberKey"];

    uint64_t v5 = AXLogRTT();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 138478083;
      uint64_t v10 = v2;
      __int16 v11 = 2113;
      uint64_t v12 = v4;
      _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Checking %{private}@ in %{private}@", (uint8_t *)&v9, 0x16u);
    }

    id v6 = [v4 objectForKey:v2];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    uint64_t v2 = AXLogRTT();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21FEA9000, v2, OS_LOG_TYPE_INFO, "Device doesn't support relay calls", (uint8_t *)&v9, 2u);
    }
    char v7 = 0;
  }

  return v7;
}

- (void)resetCloudSupportStore
{
  v8[1] = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F472B0] isInternalInstall])
  {
    if ([(RTTTelephonyUtilities *)self currentProcessHandlesCloudRelay])
    {
      int v3 = AXLogRTT();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_21FEA9000, v3, OS_LOG_TYPE_INFO, "Resetting cloud storage for device RTT support", v6, 2u);
      }

      int v4 = [MEMORY[0x263F08C40] defaultStore];
      [v4 synchronize];
      [v4 removeObjectForKey:@"RTTCloudRelayNumberKey"];
      [v4 synchronize];
    }
    else
    {
      if (!AXProcessIsAxctl()) {
        return;
      }
      int v4 = +[RTTServer sharedInstance];
      char v7 = @"axtty_reset_cloud_support_store_action";
      v8[0] = MEMORY[0x263EFFA88];
      uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
      [v4 sendMessageWithPayload:v5 andIdentifier:0x800000000];
    }
  }
}

- (void)setDefaultVoiceContext:(id)a3
{
}

- (unint64_t)activeContextCount
{
  return self->_activeContextCount;
}

- (void)setActiveContextCount:(unint64_t)a3
{
  self->_activeContextCount = a3;
}

- (NSSet)allVoiceContexts
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAllVoiceContexts:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (BOOL)headphoneJackSupportsTTY
{
  return self->_headphoneJackSupportsTTY;
}

- (void)setHeadphoneJackSupportsTTY:(BOOL)a3
{
  self->_headphoneJackSupportsTTY = a3;
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (OS_dispatch_queue)telephonyUpdateQueue
{
  return self->_telephonyUpdateQueue;
}

- (void)setTelephonyUpdateQueue:(id)a3
{
}

- (OS_dispatch_queue)accountStoreQueue
{
  return self->_accountStoreQueue;
}

- (void)setAccountStoreQueue:(id)a3
{
}

- (NSArray)cachedSubscriptionContexts
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCachedSubscriptionContexts:(id)a3
{
}

- (CTXPCContexts)cachedActiveContexts
{
  return (CTXPCContexts *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCachedActiveContexts:(id)a3
{
}

- (NSMutableDictionary)phoneNumberInfoCache
{
  return self->_phoneNumberInfoCache;
}

- (void)setPhoneNumberInfoCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumberInfoCache, 0);
  objc_storeStrong((id *)&self->_cachedActiveContexts, 0);
  objc_storeStrong((id *)&self->_cachedSubscriptionContexts, 0);
  objc_storeStrong((id *)&self->_accountStoreQueue, 0);
  objc_storeStrong((id *)&self->_telephonyUpdateQueue, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_allVoiceContexts, 0);
  objc_storeStrong((id *)&self->_defaultVoiceContext, 0);
  objc_storeStrong((id *)&self->_icloudRelayConsolidator, 0);
  objc_storeStrong((id *)&self->_icloudAccountConsolidator, 0);
  objc_storeStrong((id *)&self->_callCapabilitiesSupportsTelephonyCalls, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)phoneNumberForContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FEA9000, log, OS_LOG_TYPE_ERROR, "Attempted to retrieve phone number using a nil context", v1, 2u);
}

- (void)getCarrierValueForKeyHierarchy:(os_log_t)log andContext:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21FEA9000, log, OS_LOG_TYPE_ERROR, "Error getting carrier key %@ - %@", (uint8_t *)&v3, 0x16u);
}

@end