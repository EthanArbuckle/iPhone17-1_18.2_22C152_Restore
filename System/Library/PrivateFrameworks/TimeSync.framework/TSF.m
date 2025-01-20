@interface TSF
@end

@implementation TSF

void __50___TSF_TSDClockSyncManager_sharedClockSyncManager__block_invoke()
{
  v0 = (void *)MEMORY[0x1BA9F1DF0]();
  v1 = objc_alloc_init(_TSF_TSDClockSyncManager);
  v2 = (void *)_sharedClockSyncManager;
  _sharedClockSyncManager = (uint64_t)v1;
}

uint64_t __56___TSF_TSDgPTPManager_notifyWhengPTPManagerIsAvailable___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58___TSF_TSDgPTPManager_notifyWhengPTPManagerIsUnavailable___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40___TSF_TSDgPTPManager_sharedgPTPManager__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.TimeSync.TSDgPTPManager.shared", 0);
  v1 = (void *)_sharedgPTPManagerQueue;
  _sharedgPTPManagerQueue = (uint64_t)v0;

  id v2 = +[_TSF_TSDClockManager sharedClockManager];
  [v2 addgPTPServicesWithError:0];
}

void __40___TSF_TSDgPTPManager_sharedgPTPManager__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  if (!_sharedgPTPManager_0)
  {
    v3 = +[_TSF_TSDClockManager sharedClockManager];
    [v3 addgPTPServicesWithError:0];
    uint64_t v4 = [*(id *)(a1 + 32) gPTPManager];
    v5 = (void *)_sharedgPTPManager_0;
    _sharedgPTPManager_0 = v4;
  }
}

intptr_t __56___TSF_TSDgPTPManager_sharedgPTPManagerSyncWithTimeout___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __35___TSF_TSDgPTPManager_systemDomain__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = -[_TSF_TSDKernelClock initWithClockIdentifier:]([_TSF_TSDgPTPClock alloc], "initWithClockIdentifier:", [*(id *)(a1 + 32) systemDomainClockIdentifier]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

void __37___TSF_TSDgPTPManager_diagnosticInfo__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (void *)MEMORY[0x1BA9F1DF0]();
  if ([v5 conformsToIOClassName:@"IOTimeSyncDomain"])
  {
    uint64_t v4 = +[_TSF_TSDgPTPClock diagnosticInfoForService:v5];
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
}

uint64_t __40___TSF_TSDgPTPPort_initWithService_pid___block_invoke()
{
  _sharedNotificationsQueue = (uint64_t)dispatch_queue_create("com.apple.TimeSync.TSDgPTPPort.sharedNotificationsQueue", 0);
  return MEMORY[0x1F41817F8]();
}

void __40___TSF_TSDgPTPPort_initWithService_pid___block_invoke_65(uint64_t a1, void *a2, int a3)
{
  id v8 = a2;
  id v5 = (void *)MEMORY[0x1BA9F1DF0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a3 == -536870608)
    {
      if (WeakRetained[32]) {
        [WeakRetained updateProperties];
      }
    }
    else if (a3 == -536870896)
    {
      [WeakRetained serviceTerminated];
    }
  }
}

void __36___TSF_TSDgPTPPort_updateProperties__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  if ([*(id *)(a1 + 32) portRole] != *(_DWORD *)(a1 + 48)) {
    objc_msgSend(*(id *)(a1 + 32), "setPortRole:");
  }
  if ([*(id *)(a1 + 32) clockIdentifier] != *(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "setClockIdentifier:");
  }
}

void __43___TSF_TSDgPTPNetworkPort_updateProperties__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  if ([*(id *)(a1 + 32) remoteClockIdentity] != *(void *)(a1 + 56)) {
    objc_msgSend(*(id *)(a1 + 32), "setRemoteClockIdentity:");
  }
  if ([*(id *)(a1 + 32) remotePortNumber] != *(unsigned __int16 *)(a1 + 124)) {
    objc_msgSend(*(id *)(a1 + 32), "setRemotePortNumber:");
  }
  int v3 = [*(id *)(a1 + 32) remoteIsSameDevice];
  int v4 = *(unsigned __int8 *)(a1 + 128);
  if (v4 != v3) {
    [*(id *)(a1 + 32) setRemoteIsSameDevice:v4 != 0];
  }
  int v5 = [*(id *)(a1 + 32) isASCapable];
  int v6 = *(unsigned __int8 *)(a1 + 129);
  if (v6 != v5) {
    [*(id *)(a1 + 32) setAsCapable:v6 != 0];
  }
  if ([*(id *)(a1 + 32) propagationDelay] != *(_DWORD *)(a1 + 72)) {
    objc_msgSend(*(id *)(a1 + 32), "setPropagationDelay:");
  }
  if ([*(id *)(a1 + 32) maximumPropagationDelay] != *(_DWORD *)(a1 + 76)) {
    objc_msgSend(*(id *)(a1 + 32), "setMaximumPropagationDelay:");
  }
  if ([*(id *)(a1 + 32) minimumPropagationDelay] != *(_DWORD *)(a1 + 80)) {
    objc_msgSend(*(id *)(a1 + 32), "setMinimumPropagationDelay:");
  }
  if ([*(id *)(a1 + 32) maximumRawDelay] != *(_DWORD *)(a1 + 84)) {
    objc_msgSend(*(id *)(a1 + 32), "setMaximumRawDelay:");
  }
  if ([*(id *)(a1 + 32) minimumRawDelay] != *(_DWORD *)(a1 + 88)) {
    objc_msgSend(*(id *)(a1 + 32), "setMinimumRawDelay:");
  }
  unsigned __int8 v7 = [*(id *)(a1 + 32) localSyncLogMeanInterval];
  int v8 = *(unsigned __int8 *)(a1 + 130);
  if (v8 != v7) {
    [*(id *)(a1 + 32) setLocalSyncLogMeanInterval:(char)v8];
  }
  unsigned __int8 v9 = [*(id *)(a1 + 32) remoteSyncLogMeanInterval];
  int v10 = *(unsigned __int8 *)(a1 + 131);
  if (v10 != v9) {
    [*(id *)(a1 + 32) setRemoteSyncLogMeanInterval:(char)v10];
  }
  unsigned __int8 v11 = [*(id *)(a1 + 32) localAnnounceLogMeanInterval];
  int v12 = *(unsigned __int8 *)(a1 + 132);
  if (v12 != v11) {
    [*(id *)(a1 + 32) setLocalAnnounceLogMeanInterval:(char)v12];
  }
  unsigned __int8 v13 = [*(id *)(a1 + 32) remoteAnnounceLogMeanInterval];
  int v14 = *(unsigned __int8 *)(a1 + 133);
  if (v14 != v13) {
    [*(id *)(a1 + 32) setRemoteAnnounceLogMeanInterval:(char)v14];
  }
  if ([*(id *)(a1 + 32) localLinkType] != *(unsigned __int8 *)(a1 + 134)) {
    objc_msgSend(*(id *)(a1 + 32), "setLocalLinkType:");
  }
  if ([*(id *)(a1 + 32) remoteLinkType] != *(unsigned __int8 *)(a1 + 135)) {
    objc_msgSend(*(id *)(a1 + 32), "setRemoteLinkType:");
  }
  if ([*(id *)(a1 + 32) localTimestampingMode] != *(unsigned __int8 *)(a1 + 136)) {
    objc_msgSend(*(id *)(a1 + 32), "setLocalTimestampingMode:");
  }
  if ([*(id *)(a1 + 32) remoteTimestampingMode] != *(unsigned __int8 *)(a1 + 137)) {
    objc_msgSend(*(id *)(a1 + 32), "setRemoteTimestampingMode:");
  }
  if ([*(id *)(a1 + 32) localOscillatorType] != *(unsigned __int8 *)(a1 + 138)) {
    objc_msgSend(*(id *)(a1 + 32), "setLocalOscillatorType:");
  }
  if ([*(id *)(a1 + 32) remoteOscillatorType] != *(unsigned __int8 *)(a1 + 139)) {
    objc_msgSend(*(id *)(a1 + 32), "setRemoteOscillatorType:");
  }
  int v15 = [*(id *)(a1 + 32) hasLocalFrequencyToleranceLower];
  int v16 = *(unsigned __int8 *)(a1 + 140);
  if (v16 != v15) {
    [*(id *)(a1 + 32) setHasLocalFrequencyToleranceLower:v16 != 0];
  }
  if ([*(id *)(a1 + 32) localFrequencyToleranceLower] != *(_DWORD *)(a1 + 92)) {
    objc_msgSend(*(id *)(a1 + 32), "setLocalFrequencyToleranceLower:");
  }
  int v17 = [*(id *)(a1 + 32) hasLocalFrequencyToleranceUpper];
  int v18 = *(unsigned __int8 *)(a1 + 141);
  if (v18 != v17) {
    [*(id *)(a1 + 32) setHasLocalFrequencyToleranceUpper:v18 != 0];
  }
  if ([*(id *)(a1 + 32) localFrequencyToleranceUpper] != *(_DWORD *)(a1 + 96)) {
    objc_msgSend(*(id *)(a1 + 32), "setLocalFrequencyToleranceUpper:");
  }
  int v19 = [*(id *)(a1 + 32) hasRemoteFrequencyToleranceLower];
  int v20 = *(unsigned __int8 *)(a1 + 142);
  if (v20 != v19) {
    [*(id *)(a1 + 32) setHasRemoteFrequencyToleranceLower:v20 != 0];
  }
  if ([*(id *)(a1 + 32) remoteFrequencyToleranceLower] != *(_DWORD *)(a1 + 100)) {
    objc_msgSend(*(id *)(a1 + 32), "setRemoteFrequencyToleranceLower:");
  }
  int v21 = [*(id *)(a1 + 32) hasRemoteFrequencyToleranceUpper];
  int v22 = *(unsigned __int8 *)(a1 + 143);
  if (v22 != v21) {
    [*(id *)(a1 + 32) setHasRemoteFrequencyToleranceUpper:v22 != 0];
  }
  if ([*(id *)(a1 + 32) remoteFrequencyToleranceUpper] != *(_DWORD *)(a1 + 104)) {
    objc_msgSend(*(id *)(a1 + 32), "setRemoteFrequencyToleranceUpper:");
  }
  int v23 = [*(id *)(a1 + 32) hasLocalFrequencyStabilityLower];
  int v24 = *(unsigned __int8 *)(a1 + 144);
  if (v24 != v23) {
    [*(id *)(a1 + 32) setHasLocalFrequencyStabilityLower:v24 != 0];
  }
  if ([*(id *)(a1 + 32) localFrequencyStabilityLower] != *(_DWORD *)(a1 + 108)) {
    objc_msgSend(*(id *)(a1 + 32), "setLocalFrequencyStabilityLower:");
  }
  int v25 = [*(id *)(a1 + 32) hasLocalFrequencyStabilityUpper];
  int v26 = *(unsigned __int8 *)(a1 + 145);
  if (v26 != v25) {
    [*(id *)(a1 + 32) setHasLocalFrequencyStabilityUpper:v26 != 0];
  }
  if ([*(id *)(a1 + 32) localFrequencyStabilityUpper] != *(_DWORD *)(a1 + 112)) {
    objc_msgSend(*(id *)(a1 + 32), "setLocalFrequencyStabilityUpper:");
  }
  int v27 = [*(id *)(a1 + 32) hasRemoteFrequencyStabilityLower];
  int v28 = *(unsigned __int8 *)(a1 + 146);
  if (v28 != v27) {
    [*(id *)(a1 + 32) setHasRemoteFrequencyStabilityLower:v28 != 0];
  }
  if ([*(id *)(a1 + 32) remoteFrequencyStabilityLower] != *(_DWORD *)(a1 + 116)) {
    objc_msgSend(*(id *)(a1 + 32), "setRemoteFrequencyStabilityLower:");
  }
  int v29 = [*(id *)(a1 + 32) hasRemoteFrequencyStabilityUpper];
  int v30 = *(unsigned __int8 *)(a1 + 147);
  if (v30 != v29) {
    [*(id *)(a1 + 32) setHasRemoteFrequencyStabilityUpper:v30 != 0];
  }
  if ([*(id *)(a1 + 32) remoteFrequencyStabilityUpper] != *(_DWORD *)(a1 + 120)) {
    objc_msgSend(*(id *)(a1 + 32), "setRemoteFrequencyStabilityUpper:");
  }
  v31 = [*(id *)(a1 + 32) sourceAddressString];
  char v32 = [v31 isEqualToString:*(void *)(a1 + 40)];

  if ((v32 & 1) == 0) {
    [*(id *)(a1 + 32) setSourceAddressString:*(void *)(a1 + 40)];
  }
  v33 = [*(id *)(a1 + 32) destinationAddressString];
  char v34 = [v33 isEqualToString:*(void *)(a1 + 48)];

  if ((v34 & 1) == 0) {
    [*(id *)(a1 + 32) setDestinationAddressString:*(void *)(a1 + 48)];
  }
  int v35 = [*(id *)(a1 + 32) overridenReceiveMatching];
  int v36 = *(unsigned __int8 *)(a1 + 148);
  if (v36 != v35) {
    [*(id *)(a1 + 32) setOverridenReceiveMatching:v36 != 0];
  }
  if ([*(id *)(a1 + 32) overridenReceiveClockIdentity] != *(void *)(a1 + 64)) {
    objc_msgSend(*(id *)(a1 + 32), "setOverridenReceiveClockIdentity:");
  }
  if ([*(id *)(a1 + 32) overridenReceivePortNumber] != *(unsigned __int16 *)(a1 + 126)) {
    objc_msgSend(*(id *)(a1 + 32), "setOverridenReceivePortNumber:");
  }
  int v37 = [*(id *)(a1 + 32) enabled];
  int v38 = *(unsigned __int8 *)(a1 + 149);
  if (v38 != v37) {
    [*(id *)(a1 + 32) setEnabled:v38 != 0];
  }
}

uint64_t __52___TSF_TSDgPTPNetworkPort_getCurrentPortInfo_error___block_invoke(uint64_t a1)
{
  **(_DWORD **)(a1 + 40) = [*(id *)(a1 + 32) portRole];
  *(_DWORD *)(*(void *)(a1 + 40) + 4) = [*(id *)(a1 + 32) portType];
  *(unsigned char *)(*(void *)(a1 + 40) + 8) = [*(id *)(a1 + 32) localLinkType];
  *(unsigned char *)(*(void *)(a1 + 40) + 9) = [*(id *)(a1 + 32) remoteLinkType];
  *(unsigned char *)(*(void *)(a1 + 40) + 10) = [*(id *)(a1 + 32) localTimestampingMode];
  *(unsigned char *)(*(void *)(a1 + 40) + 11) = [*(id *)(a1 + 32) remoteTimestampingMode];
  *(void *)(*(void *)(a1 + 40) + 16) = [*(id *)(a1 + 32) remoteClockIdentity];
  uint64_t result = [*(id *)(a1 + 32) remotePortNumber];
  *(_WORD *)(*(void *)(a1 + 40) + 24) = result;
  return result;
}

void __51___TSF_TSDgPTPNetworkPort__handleRefreshConnection__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  [*(id *)(a1 + 32) didChangeASCapable:*(unsigned __int8 *)(a1 + 48) forPort:*(void *)(a1 + 40)];
}

void __81___TSF_TSDgPTPNetworkPort__handleNotification_withArg1_arg2_arg3_arg4_arg5_arg6___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  [*(id *)(a1 + 32) didChangeASCapable:*(void *)(a1 + 48) != 0 forPort:*(void *)(a1 + 40)];
}

void __52___TSF_TSDgPTPNetworkPort_diagnosticInfoForService___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v3 = (void *)MEMORY[0x1BA9F1DF0]();
  if (([v5 conformsToIOClassName:@"IOEthernetInterface"] & 1) != 0
    || [v5 conformsToIOClassName:@"IOTimeSyncInterfaceAdapter"])
  {
    int v4 = [v5 iodPropertyForKey:@"BSD Name"];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"BSD Name"];
  }
}

void __41___TSF_TSDgPTPFDPtPPort_updateProperties__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  unsigned __int8 v3 = [*(id *)(a1 + 32) localPDelayLogMeanInterval];
  int v4 = *(unsigned __int8 *)(a1 + 48);
  if (v4 != v3) {
    [*(id *)(a1 + 32) setLocalPDelayLogMeanInterval:(char)v4];
  }
  unsigned __int8 v5 = [*(id *)(a1 + 32) remotePDelayLogMeanInterval];
  int v6 = *(unsigned __int8 *)(a1 + 49);
  if (v6 != v5) {
    [*(id *)(a1 + 32) setRemotePDelayLogMeanInterval:(char)v6];
  }
  int v7 = [*(id *)(a1 + 32) multipleRemotes];
  int v8 = *(unsigned __int8 *)(a1 + 50);
  if (v8 != v7) {
    [*(id *)(a1 + 32) setMultipleRemotes:v8 != 0];
  }
  int v9 = [*(id *)(a1 + 32) measuringPDelay];
  int v10 = *(unsigned __int8 *)(a1 + 51);
  if (v10 != v9) {
    [*(id *)(a1 + 32) setMeasuringPDelay:v10 != 0];
  }
  [*(id *)(a1 + 32) setStatistics:*(void *)(a1 + 40)];
}

void __41___TSF_TSDgPTPFDEtEPort_updateProperties__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  [*(id *)(a1 + 32) setStatistics:*(void *)(a1 + 40)];
}

uint64_t __33___TSF_TSDIOKServiceMatcher_init__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.TimeSync.TSIOKServiceMatcherClassNotifier.sharedNotificationsQueue", 0);
  v1 = (void *)_sharedTSDIOKServiceMatcherNotificationsQueue;
  _sharedTSDIOKServiceMatcherNotificationsQueue = (uint64_t)v0;

  id v2 = objc_alloc(MEMORY[0x1E4F6EC28]);
  _sharedTSDIOKServiceMatcherNotificationsPort = [v2 initOnDispatchQueue:_sharedTSDIOKServiceMatcherNotificationsQueue];
  return MEMORY[0x1F41817F8]();
}

void __70___TSF_TSDIOKServiceMatcher_startNotificationsWithMatchingDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  unsigned __int8 v3 = (void *)MEMORY[0x1BA9F1DF0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = [v8 nextObject];
    if (v5)
    {
      int v6 = (void *)v5;
      do
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [WeakRetained handleServiceMatched:v6];
        }
        uint64_t v7 = [v8 nextObject];

        int v6 = (void *)v7;
      }
      while (v7);
    }
  }
}

void __70___TSF_TSDIOKServiceMatcher_startNotificationsWithMatchingDictionary___block_invoke_12(uint64_t a1, void *a2)
{
  id v8 = a2;
  unsigned __int8 v3 = (void *)MEMORY[0x1BA9F1DF0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = [v8 nextObject];
    if (v5)
    {
      int v6 = (void *)v5;
      do
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [WeakRetained handleServiceTerminated:v6];
        }
        uint64_t v7 = [v8 nextObject];

        int v6 = (void *)v7;
      }
      while (v7);
    }
  }
}

void __70___TSF_TSDIOKServiceMatcher_startNotificationsWithMatchingDictionary___block_invoke_14(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  [*(id *)(*(void *)(a1 + 32) + 8) primeNotification];
  [*(id *)(*(void *)(a1 + 32) + 16) primeNotification];
}

void __53___TSF_TSDKextNotifier_notifyWhenServiceIsAvailable___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  int v3 = [*(id *)(a1 + 32) getMatchedCount];
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (v3 < 1)
  {
    if (v4)
    {
      uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 32) UTF8String];
      int v11 = 136315394;
      uint64_t v12 = v6;
      __int16 v13 = 1024;
      int v14 = v3;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsAvailable %s matchedCount %d, saving notification block", (uint8_t *)&v11, 0x12u);
    }
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = *(void **)(*(void *)(a1 + 32) + 40);
    int v9 = (void *)[v7 copy];
    int v10 = (void *)MEMORY[0x1BA9F1FE0]();
    [v8 addObject:v10];
  }
  else
  {
    if (v4)
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 32) UTF8String];
      int v11 = 136315394;
      uint64_t v12 = v5;
      __int16 v13 = 1024;
      int v14 = v3;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsAvailable %s matchedCount %d, dispatching notification", (uint8_t *)&v11, 0x12u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __55___TSF_TSDKextNotifier_notifyWhenServiceIsUnavailable___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  int v3 = [*(id *)(a1 + 32) getMatchedCount];
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 32) UTF8String];
      int v11 = 136315394;
      uint64_t v12 = v5;
      __int16 v13 = 1024;
      int v14 = v3;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsUnavailable %s matchedCount %d, saving notification block", (uint8_t *)&v11, 0x12u);
    }
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 48);
    id v8 = (void *)[v6 copy];
    int v9 = (void *)MEMORY[0x1BA9F1FE0]();
    [v7 addObject:v9];
  }
  else
  {
    if (v4)
    {
      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 32) UTF8String];
      int v11 = 136315394;
      uint64_t v12 = v10;
      __int16 v13 = 1024;
      int v14 = 0;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsUnavailable %s matchedCount %d, dispatching notification", (uint8_t *)&v11, 0x12u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __31___TSF_TSDKextNotifier_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *(id *)(a1 + 40);
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

uint64_t __46___TSF_IODConnection_initWithService_andType___block_invoke()
{
  getpid();
  gClientsLock = 0;
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)gClients;
  gClients = v0;

  gDaemonServiceClient = +[TSXDaemonServiceClient sharedDaemonServiceClient];
  return MEMORY[0x1F41817F8]();
}

uint64_t __41___TSF_IODConnection_daemonClientRefresh__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(a1 + 40))(*(void *)(a1 + 48), 0, *(void *)(*(void *)(a1 + 32) + 8) + 32, 1);
}

uint64_t __76___TSF_IODConnection_dispatchNotificationForClientID_ioResult_args_numArgs___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(a1 + 48))(*(void *)(*(void *)(a1 + 32) + 40), *(unsigned int *)(a1 + 56), *(void *)(*(void *)(a1 + 40) + 8) + 32, *(unsigned int *)(a1 + 60));
}

uint64_t __58___TSF_TSDClockManager_notifyWhenClockManagerIsAvailable___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60___TSF_TSDClockManager_notifyWhenClockManagerIsUnavailable___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __42___TSF_TSDClockManager_sharedClockManager__block_invoke()
{
  _sharedClockManagerQueue = (uint64_t)dispatch_queue_create("com.apple.TimeSync.TSDClockManager.shared", 0);
  return MEMORY[0x1F41817F8]();
}

void __42___TSF_TSDClockManager_sharedClockManager__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  if (!_sharedClockManager)
  {
    uint64_t v3 = [*(id *)(a1 + 32) clockManager];
    uint64_t v4 = (void *)_sharedClockManager;
    _sharedClockManager = v3;
  }
}

void __54___TSF_TSDKernelClock_availableKernelClockIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = (void *)MEMORY[0x1BA9F1DF0]();
  uint64_t v4 = [v5 iodPropertyForKey:@"ClockIdentifier"];
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __51___TSF_TSDKernelClock_initWithClockIdentifier_pid___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v9 = a2;
  uint64_t v7 = (void *)MEMORY[0x1BA9F1DF0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInterestNotification:a3 withArgument:a4];
}

void __59___TSF_TSDKernelClock__refreshLockStateOnNotificationQueue__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  int v3 = *(_DWORD *)(a1 + 40);
  if (v3 != [*(id *)(a1 + 32) lockState]) {
    [*(id *)(a1 + 32) setLockState:*(unsigned int *)(a1 + 40)];
  }
}

void __64___TSF_TSDKernelClock__handleInterestNotification_withArgument___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  int v3 = *(_DWORD *)(a1 + 40);
  if (v3 != [*(id *)(a1 + 32) lockState]) {
    [*(id *)(a1 + 32) setLockState:*(unsigned int *)(a1 + 40)];
  }
}

void __55___TSF_TSDCallbackRefconMap_sharedTSDCallbackRefconMap__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1BA9F1DF0]();
  v1 = objc_alloc_init(_TSF_TSDCallbackRefconMap);
  id v2 = (void *)_sharedTSDCallbackRefconMap;
  _sharedTSDCallbackRefconMap = (uint64_t)v1;
}

void __50___TSF_TSDgPTPClock_availablegPTPClockIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v3 = (void *)MEMORY[0x1BA9F1DF0]();
  uint64_t v4 = [v5 iodPropertyForKey:@"ClockIdentifier"];
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __62___TSF_TSDgPTPClock__handleInterestNotification_withArgument___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 != [*(id *)(a1 + 32) grandmasterIdentity]) {
    [*(id *)(a1 + 32) setGrandmasterIdentity:*(void *)(a1 + 40)];
  }
}

void __62___TSF_TSDgPTPClock__handleInterestNotification_withArgument___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) gptpPath];
  LOBYTE(v3) = [v3 isEqual:v4];

  if ((v3 & 1) == 0) {
    [*(id *)(a1 + 40) setGptpPath:*(void *)(a1 + 32)];
  }
}

void __67___TSF_TSDgPTPClock__refreshGrandmasterIdentityOnNotificationQueue__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9F1DF0]();
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3 != [*(id *)(a1 + 32) grandmasterIdentity]) {
    [*(id *)(a1 + 32) setGrandmasterIdentity:*(void *)(a1 + 48)];
  }
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) gptpPath];
  LOBYTE(v4) = [v4 isEqual:v5];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) setGptpPath:*(void *)(a1 + 40)];
  }
}

void __26___TSF_TSDgPTPClock_ports__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = (void *)MEMORY[0x1BA9F1DF0]();
  if ([v5 conformsToIOClassName:@"IOTimeSyncPort"])
  {
    uint64_t v4 = +[_TSF_TSDgPTPPort gPTPPortWithService:v5];
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
}

void __40___TSF_TSDgPTPClock_portWithPortNumber___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = (void *)MEMORY[0x1BA9F1DF0]();
  if ([v9 conformsToIOClassName:@"IOTimeSyncPort"])
  {
    uint64_t v4 = [v9 iodPropertyForKey:@"PortNumber"];
    id v5 = v4;
    if (v4 && [v4 unsignedShortValue] == *(unsigned __int16 *)(a1 + 40))
    {
      uint64_t v6 = +[_TSF_TSDgPTPPort gPTPPortWithService:v9];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }
}

void __46___TSF_TSDgPTPClock_diagnosticInfoForService___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = (void *)MEMORY[0x1BA9F1DF0]();
  if ([v7 conformsToIOClassName:@"IOTimeSyncEthernetPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = _TSF_TSDgPTPEthernetPort;
  }
  else if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerPtPPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = _TSF_TSDgPTPUnicastLinkLayerPtPPort;
  }
  else if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerEtEPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = _TSF_TSDgPTPUnicastLinkLayerEtEPort;
  }
  else if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4PtPPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = _TSF_TSDgPTPUnicastUDPv4PtPPort;
  }
  else if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6PtPPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = _TSF_TSDgPTPUnicastUDPv6PtPPort;
  }
  else if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4EtEPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = _TSF_TSDgPTPUnicastUDPv4EtEPort;
  }
  else if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6EtEPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = _TSF_TSDgPTPUnicastUDPv6EtEPort;
  }
  else if ([v7 conformsToIOClassName:@"IOTimeSyncLocalClockPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = _TSF_TSDgPTPLocalClockPort;
  }
  else
  {
    if (![v7 conformsToIOClassName:@"IOTimeSyncPort"]) {
      goto LABEL_20;
    }
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = _TSF_TSDgPTPPort;
  }
  uint64_t v6 = [(__objc2_class *)v5 diagnosticInfoForService:v7];
  [v4 addObject:v6];

LABEL_20:
}

@end