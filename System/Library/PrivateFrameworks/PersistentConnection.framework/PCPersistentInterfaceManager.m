@interface PCPersistentInterfaceManager
+ (id)sharedInstance;
- (BOOL)_isCellularCall:(__CTCall *)a3;
- (BOOL)_isCurrentDataSimContextLocked:(id)a3;
- (BOOL)_isInternetReachableLocked;
- (BOOL)_isWWANInHomeCountryLocked;
- (BOOL)_isWiFiUsable;
- (BOOL)_wantsWWANInterfaceAssertion;
- (BOOL)_wantsWakeOnWiFiEnabled;
- (BOOL)_wifiIsPoorLinkQuality;
- (BOOL)_wwanIsPoorLinkQuality;
- (BOOL)allowBindingToWWAN;
- (BOOL)areAllNetworkInterfacesDisabled;
- (BOOL)doesWWANInterfaceExist;
- (BOOL)hasWWANStatusIndicator;
- (BOOL)isInCall;
- (BOOL)isInternetReachable;
- (BOOL)isInternetReachableViaWiFi;
- (BOOL)isPowerStateDetectionSupported;
- (BOOL)isWWANBetterThanWiFi;
- (BOOL)isWWANInHomeCountry;
- (BOOL)isWWANInterfaceActivationPermitted;
- (BOOL)isWWANInterfaceInProlongedHighPowerState;
- (BOOL)isWWANInterfaceSuspended;
- (BOOL)isWWANInterfaceUp;
- (BOOL)isWakeOnWiFiSupported;
- (NSString)WWANInterfaceName;
- (NSString)currentLinkQualityString;
- (PCPersistentInterfaceManager)init;
- (id)_nonCellularMonitor;
- (void)_adjustWakeOnWiFi;
- (void)_adjustWakeOnWiFiLocked;
- (void)_adjustWiFiAutoAssociation;
- (void)_adjustWiFiAutoAssociationLocked;
- (void)_clearInCallWWANOverrideTimerLocked;
- (void)_createCTConnection;
- (void)_ctConnectionAttempt;
- (void)_inCallWWANOverrideTimerFired;
- (void)_mainThreadCTConnectionAttempt;
- (void)_processCallStatusChanged:(id)a3;
- (void)_processConnectionStatusLocked:(id)a3;
- (void)_processCurrentDataSimChangedLocked:(id)a3;
- (void)_processDataStatusLocked:(id)a3;
- (void)_scheduleCalloutsForSelector:(SEL)a3;
- (void)_updateCTIsWWANInHomeCountry:(BOOL)a3 isWWANInterfaceDataActive:(BOOL)a4;
- (void)_updateWWANInterfaceAssertions;
- (void)_updateWWANInterfaceAssertionsLocked;
- (void)_updateWWANInterfaceUpState;
- (void)_updateWWANInterfaceUpStateLocked;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)connectionActivationError:(id)a3 connection:(int)a4 error:(int)a5;
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)currentDataSimChanged:(id)a3;
- (void)cutWiFiManagerDeviceAttached:(id)a3;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)dealloc;
- (void)enableWakeOnWiFi:(BOOL)a3 forDelegate:(id)a4;
- (void)enableWiFiAutoAssociation:(BOOL)a3 forDelegate:(id)a4;
- (void)handleMachMessage:(void *)a3;
- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4;
- (void)interfaceReachabilityChanged:(id)a3;
- (void)removeDelegate:(id)a3;
@end

@implementation PCPersistentInterfaceManager

- (void)removeDelegate:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  [(NSMapTable *)self->_delegatesAndQueues removeObjectForKey:v5];

  v6 = self->_lock;
  [(NSRecursiveLock *)v6 unlock];
}

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

- (BOOL)isWWANInterfaceUp
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isWWANInterfaceUp = self->_isWWANInterfaceUp;
  [(NSRecursiveLock *)self->_lock unlock];
  return isWWANInterfaceUp;
}

- (BOOL)isPowerStateDetectionSupported
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isPowerStateDetectionSupported = self->_isPowerStateDetectionSupported;
  [(NSRecursiveLock *)self->_lock unlock];
  return isPowerStateDetectionSupported;
}

- (BOOL)isInternetReachable
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = [(PCPersistentInterfaceManager *)self _isInternetReachableLocked];
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (BOOL)isInCall
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isInCall = self->_isInCall;
  [(NSRecursiveLock *)self->_lock unlock];
  return isInCall;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  lock = self->_lock;
  id v7 = a4;
  id v8 = a3;
  [(NSRecursiveLock *)lock lock];
  v9 = objc_alloc_init(PCDelegateInfo);
  [(PCDelegateInfo *)v9 setQueue:v7];

  [(NSMapTable *)self->_delegatesAndQueues setObject:v9 forKey:v8];
  [(NSRecursiveLock *)self->_lock unlock];
}

- (BOOL)_isInternetReachableLocked
{
  BOOL v3 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
  if ([v3 isInterfaceUsable] && self->_isWWANInterfaceUp)
  {
    char v4 = 1;
  }
  else
  {
    id v5 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
    char v4 = [v5 isInterfaceUsable];
  }
  return v4;
}

uint64_t __46__PCPersistentInterfaceManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(PCPersistentInterfaceManager);
  return MEMORY[0x1F41817F8]();
}

- (PCPersistentInterfaceManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)PCPersistentInterfaceManager;
  v2 = [(PCPersistentInterfaceManager *)&v12 init];
  if (v2)
  {
    BOOL v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v2->_lock;
    v2->_lock = v3;

    [(NSRecursiveLock *)v2->_lock lock];
    uint64_t v5 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegatesAndQueues = v2->_delegatesAndQueues;
    v2->_delegatesAndQueues = (NSMapTable *)v5;

    v2->_WiFiAutoAssociationDelegates = CFSetCreateMutable(0, 0, 0);
    v2->_wakeOnWiFiDelegates = CFSetCreateMutable(0, 0, 0);
    v2->_ctIsWWANInHomeCountry = 1;
    v2->_isWWANInterfaceActivationPermitted = 0;
    [(PCPersistentInterfaceManager *)v2 _createCTConnection];
    id v7 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
    id v8 = (void *)MEMORY[0x1E4F14428];
    [v7 addDelegate:v2 queue:MEMORY[0x1E4F14428]];

    v9 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
    [v9 addDelegate:v2 queue:v8];

    [(PCPersistentInterfaceManager *)v2 _updateWWANInterfaceUpStateLocked];
    v10 = [MEMORY[0x1E4F59E38] sharedInstance];
    [v10 addDelegate:v2];

    [(NSRecursiveLock *)v2->_lock unlock];
  }
  return v2;
}

- (void)dealloc
{
  BOOL v3 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
  [v3 removeDelegate:self];

  char v4 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
  [v4 removeDelegate:self];

  uint64_t v5 = [MEMORY[0x1E4F59E38] sharedInstance];
  [v5 removeDelegate:self];

  WiFiAutoAssociationDelegates = self->_WiFiAutoAssociationDelegates;
  if (WiFiAutoAssociationDelegates) {
    CFRelease(WiFiAutoAssociationDelegates);
  }
  wakeOnWiFiDelegates = self->_wakeOnWiFiDelegates;
  if (wakeOnWiFiDelegates) {
    CFRelease(wakeOnWiFiDelegates);
  }
  interfaceAssertion = self->_interfaceAssertion;
  if (interfaceAssertion) {
    CFRelease(interfaceAssertion);
  }
  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection) {
    CFRelease(ctServerConnection);
  }
  v10.receiver = self;
  v10.super_class = (Class)PCPersistentInterfaceManager;
  [(PCPersistentInterfaceManager *)&v10 dealloc];
}

- (void)_createCTConnection
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (self->_ctClient || self->_interfaceAssertion)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"PCPersistentInterfaceManager.m" lineNumber:171 description:@"CTServerConnectionRef already exists"];
  }
  char v4 = PCCreateQueue("PCPersistentInterfaceManager-ctserverqueue");
  uint64_t v5 = [MEMORY[0x1E4F59E30] weakRefWithObject:self];
  +[PCPersistentIdentifiers processNameAndPidIdentifier];
  v38[1] = (id)MEMORY[0x1E4F143A8];
  v38[2] = (id)3221225472;
  v38[3] = __51__PCPersistentInterfaceManager__createCTConnection__block_invoke;
  v38[4] = &unk_1E698DD58;
  id v6 = v5;
  id v39 = v6;
  id v7 = v4;
  v40 = v7;
  id v8 = (void *)_CTServerConnectionCreateOnTargetQueue();
  self->_ctServerConnection = v8;
  if (v8) {
    _CTServerConnectionRegisterForNotification();
  }
  v9 = (CoreTelephonyClient *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v7];
  ctClient = self->_ctClient;
  self->_ctClient = v9;

  v11 = self->_ctClient;
  if (v11)
  {
    [(CoreTelephonyClient *)v11 setDelegate:self];
    objc_super v12 = self->_ctClient;
    v38[0] = 0;
    id v13 = [(CoreTelephonyClient *)v12 getCurrentDataSubscriptionContextSync:v38];
    id v14 = v38[0];
    if (v14 || !v13)
    {
      v21 = +[PCLog interfaceManager];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v26 = self->_ctClient;
        *(_DWORD *)buf = 138412802;
        v42 = self;
        __int16 v43 = 2112;
        v44 = v26;
        __int16 v45 = 2112;
        id v46 = v14;
        _os_log_error_impl(&dword_1D340D000, v21, OS_LOG_TYPE_ERROR, "%@ failed to get currentDataSimContext for ctclient %@ error %@", buf, 0x20u);
      }
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_3;
      block[3] = &unk_1E698DD80;
      block[4] = self;
      id v13 = v13;
      id v37 = v13;
      dispatch_async(v7, block);
      v15 = self->_ctClient;
      id v35 = 0;
      v16 = [(CoreTelephonyClient *)v15 getConnectionState:v13 connectionType:0 error:&v35];
      id v17 = v35;
      if (v17)
      {
        v18 = +[PCLog interfaceManager];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v27 = self->_ctClient;
          *(_DWORD *)buf = 138412802;
          v42 = self;
          __int16 v43 = 2112;
          v44 = v27;
          __int16 v45 = 2112;
          id v46 = v17;
          _os_log_error_impl(&dword_1D340D000, v18, OS_LOG_TYPE_ERROR, "%@ failed to get connection state for ctclient %@ error %@", buf, 0x20u);
        }
      }
      else
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_4;
        v33[3] = &unk_1E698DD80;
        v33[4] = self;
        id v34 = v16;
        dispatch_async(v7, v33);
      }
      v22 = self->_ctClient;
      id v32 = 0;
      v23 = [(CoreTelephonyClient *)v22 getDataStatus:v13 error:&v32];
      id v24 = v32;
      if (v24)
      {
        v25 = +[PCLog interfaceManager];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v28 = self->_ctClient;
          *(_DWORD *)buf = 138412802;
          v42 = self;
          __int16 v43 = 2112;
          v44 = v28;
          __int16 v45 = 2112;
          id v46 = v24;
          _os_log_error_impl(&dword_1D340D000, v25, OS_LOG_TYPE_ERROR, "%@ failed to get data status for ctclient %@ error %@", buf, 0x20u);
        }
      }
      else
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_27;
        v30[3] = &unk_1E698DD80;
        v30[4] = self;
        id v31 = v23;
        dispatch_async(v7, v30);
      }
    }
  }
  else
  {
    v19 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D340D000, v19, OS_LOG_TYPE_DEFAULT, "Interface manager: unable to create a connection to the CT Server. Will retry connection to the CT server later.", buf, 2u);
    }

    id v20 = objc_alloc(MEMORY[0x1E4F1C978]);
    id v14 = (id)objc_msgSend(v20, "initWithObjects:", *MEMORY[0x1E4F1C4B0], 0);
    id v13 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v13 performSelector:sel__mainThreadCTConnectionAttempt target:self argument:0 order:0 modes:v14];
  }
}

void __51__PCPersistentInterfaceManager__createCTConnection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = (void *)MEMORY[0x1D94354F0]();
  id v7 = [*(id *)(a1 + 32) object];
  id v8 = (void *)[a2 copy];
  v9 = (void *)[a3 copy];
  if (v7)
  {
    objc_super v10 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_2;
    block[3] = &unk_1E698DD30;
    id v12 = v8;
    id v13 = v7;
    id v14 = v9;
    dispatch_async(v10, block);
  }
}

uint64_t __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F23B38]];
  if (result)
  {
    BOOL v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    return [v3 _processCallStatusChanged:v4];
  }
  return result;
}

uint64_t __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) lock];
  [*(id *)(a1 + 32) _processCurrentDataSimChangedLocked:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v2 unlock];
}

uint64_t __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) lock];
  [*(id *)(a1 + 32) _processConnectionStatusLocked:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v2 unlock];
}

uint64_t __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_27(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) lock];
  [*(id *)(a1 + 32) _processDataStatusLocked:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v2 unlock];
}

- (void)_mainThreadCTConnectionAttempt
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v4 = (id)objc_msgSend(v3, "initWithObjects:", *MEMORY[0x1E4F1C4B0], 0);
  [(PCPersistentInterfaceManager *)self performSelector:sel__ctConnectionAttempt withObject:0 afterDelay:v4 inModes:10.0];
}

- (void)_ctConnectionAttempt
{
  id v3 = (void *)MEMORY[0x1D94354F0](self, a2);
  [(NSRecursiveLock *)self->_lock lock];
  id v4 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v4 cancelPerformSelector:sel__mainThreadCTConnectionAttempt target:self argument:0];

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__ctConnectionAttempt object:0];
  uint64_t v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v5 cancelPerformSelector:sel__ctConnectionAttempt target:self argument:0];

  interfaceAssertion = self->_interfaceAssertion;
  if (interfaceAssertion)
  {
    CFRelease(interfaceAssertion);
    self->_interfaceAssertion = 0;
  }
  ctClient = self->_ctClient;
  self->_ctClient = 0;

  currentDataSimContext = self->_currentDataSimContext;
  self->_currentDataSimContext = 0;

  [(PCPersistentInterfaceManager *)self _createCTConnection];
  [(PCPersistentInterfaceManager *)self _updateWWANInterfaceAssertionsLocked];
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4
{
  [(PCPersistentInterfaceManager *)self _updateWWANInterfaceUpState];
  [(NSRecursiveLock *)self->_lock lock];
  [(PCPersistentInterfaceManager *)self _scheduleCalloutsForSelector:sel_interfaceManagerInternetReachabilityChanged_];
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (void)interfaceReachabilityChanged:(id)a3
{
  [(PCPersistentInterfaceManager *)self _updateWWANInterfaceUpState];
  [(NSRecursiveLock *)self->_lock lock];
  [(PCPersistentInterfaceManager *)self _scheduleCalloutsForSelector:sel_interfaceManagerInternetReachabilityChanged_];
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (void)handleMachMessage:(void *)a3
{
}

- (void)currentDataSimChanged:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  [(PCPersistentInterfaceManager *)self _processCurrentDataSimChangedLocked:v5];

  id v6 = self->_lock;
  [(NSRecursiveLock *)v6 unlock];
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v8 = a5;
  if (!a4)
  {
    id v11 = v8;
    lock = self->_lock;
    id v10 = a3;
    [(NSRecursiveLock *)lock lock];
    LODWORD(lock) = [(PCPersistentInterfaceManager *)self _isCurrentDataSimContextLocked:v10];

    if (lock) {
      [(PCPersistentInterfaceManager *)self _processConnectionStatusLocked:v11];
    }
    [(NSRecursiveLock *)self->_lock unlock];
    id v8 = v11;
  }
}

- (void)connectionActivationError:(id)a3 connection:(int)a4 error:(int)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (!a4
    && [(PCPersistentInterfaceManager *)self _isCurrentDataSimContextLocked:v8])
  {
    v9 = [(CoreTelephonyClient *)self->_ctClient getDataStatus:v8 error:0];
    int v10 = [v9 cellularDataPossible];

    id v11 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109120;
      LODWORD(v15) = a5;
      _os_log_impl(&dword_1D340D000, v11, OS_LOG_TYPE_DEFAULT, "Interface manager: received connectionActivationError %u", (uint8_t *)&v14, 8u);
    }

    id v12 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = @"NO";
      if (v10) {
        id v13 = @"YES";
      }
      int v14 = 138543618;
      v15 = self;
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_impl(&dword_1D340D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Interface manager: setting _isWWANInterfaceActivationPermitted to %{public}@ due to kCTRegistrationCellularDataPlanActivateFailedNotification", (uint8_t *)&v14, 0x16u);
    }

    self->_isWWANInterfaceActivationPermitted = v10;
    [(PCPersistentInterfaceManager *)self _updateWWANInterfaceAssertionsLocked];
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  id v8 = a4;
  lock = self->_lock;
  id v7 = a3;
  [(NSRecursiveLock *)lock lock];
  LODWORD(lock) = [(PCPersistentInterfaceManager *)self _isCurrentDataSimContextLocked:v7];

  if (lock) {
    [(PCPersistentInterfaceManager *)self _processDataStatusLocked:v8];
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (BOOL)_isCurrentDataSimContextLocked:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && self->_currentDataSimContext)
  {
    uint64_t v6 = [v4 slotID];
    BOOL v7 = v6 == [(CTXPCServiceSubscriptionContext *)self->_currentDataSimContext slotID];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_processCurrentDataSimChangedLocked:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PCLog interfaceManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    currentDataSimContext = self->_currentDataSimContext;
    int v9 = 138412546;
    int v10 = currentDataSimContext;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D340D000, v5, OS_LOG_TYPE_DEFAULT, "Interface manager: updating currentDataSimContext. {old: %@; new: %@}",
      (uint8_t *)&v9,
      0x16u);
  }

  BOOL v7 = (CTXPCServiceSubscriptionContext *)[v4 copy];
  id v8 = self->_currentDataSimContext;
  self->_currentDataSimContext = v7;
}

- (void)_processConnectionStatusLocked:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 state];
  int v6 = [v4 suspended];
  BOOL v7 = [v4 interfaceName];

  if (![(NSString *)self->_WWANInterfaceName isEqualToString:v7])
  {
    id v8 = (NSString *)[v7 copy];
    WWANInterfaceName = self->_WWANInterfaceName;
    self->_WWANInterfaceName = v8;

    int v10 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = self->_WWANInterfaceName;
      int v16 = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_1D340D000, v10, OS_LOG_TYPE_DEFAULT, "Interface manager: wwan interface name changed to %@", (uint8_t *)&v16, 0xCu);
    }
  }
  if (self->_isWWANInterfaceDataActive != (v5 == 2))
  {
    [(PCPersistentInterfaceManager *)self _updateCTIsWWANInHomeCountry:self->_ctIsWWANInHomeCountry isWWANInterfaceDataActive:v5 == 2];
    id v12 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isWWANInterfaceDataActive) {
        uint64_t v13 = "true";
      }
      else {
        uint64_t v13 = "false";
      }
      int v16 = 136315138;
      id v17 = (void *)v13;
      _os_log_impl(&dword_1D340D000, v12, OS_LOG_TYPE_DEFAULT, "Interface manager: PDP context _isWWANInterfaceDataActive status changed to %s", (uint8_t *)&v16, 0xCu);
    }
  }
  if (self->_isWWANInterfaceSuspended != v6)
  {
    self->_isWWANInterfaceSuspended = v6;
    int v14 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isWWANInterfaceSuspended) {
        v15 = "true";
      }
      else {
        v15 = "false";
      }
      int v16 = 136315138;
      id v17 = (void *)v15;
      _os_log_impl(&dword_1D340D000, v14, OS_LOG_TYPE_DEFAULT, "Interface manager: PDP context _isWWANInterfaceSuspended status changed to  %s", (uint8_t *)&v16, 0xCu);
    }
  }
  [(PCPersistentInterfaceManager *)self _updateWWANInterfaceUpStateLocked];
}

- (void)_processDataStatusLocked:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [v4 indicator];
  BOOL v6 = v5 < 6;
  BOOL v7 = [v4 indicator] != 0;
  int v8 = [v4 cellularDataPossible];
  uint64_t v9 = [v4 inHomeCountry];
  if (self->_isWWANInterfaceInProlongedHighPowerState != v6)
  {
    self->_isWWANInterfaceInProlongedHighPowerState = v6;
    if (v5 <= 5) {
      self->_BOOL isPowerStateDetectionSupported = 1;
    }
    int v10 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isWWANInterfaceInProlongedHighPowerState) {
        __int16 v11 = "active";
      }
      else {
        __int16 v11 = "inactive";
      }
      int v22 = 136315394;
      v23 = (void *)v11;
      __int16 v24 = 1024;
      int v25 = [v4 indicator];
      _os_log_impl(&dword_1D340D000, v10, OS_LOG_TYPE_DEFAULT, "Interface manager: WWAN radio power level notification; high power state changed to %s with data indicator %d",
        (uint8_t *)&v22,
        0x12u);
    }

    [(PCPersistentInterfaceManager *)self _scheduleCalloutsForSelector:sel_interfaceManagerWWANInterfaceChangedPowerState_];
  }
  if (self->_ctIsWWANInHomeCountry != v9)
  {
    id v12 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = "false";
      if (v9) {
        uint64_t v13 = "true";
      }
      int v22 = 136315138;
      v23 = (void *)v13;
      _os_log_impl(&dword_1D340D000, v12, OS_LOG_TYPE_DEFAULT, "Interface manager: PDP context _ctIsWWANInHomeCountry status changed to %s", (uint8_t *)&v22, 0xCu);
    }

    [(PCPersistentInterfaceManager *)self _updateCTIsWWANInHomeCountry:v9 isWWANInterfaceDataActive:self->_isWWANInterfaceDataActive];
  }
  if (self->_hasWWANStatusIndicator != v7)
  {
    self->_hasWWANStatusIndicator = v7;
    int v14 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v4 indicator];
      int v22 = 67109120;
      LODWORD(v23) = v15;
      _os_log_impl(&dword_1D340D000, v14, OS_LOG_TYPE_DEFAULT, "Interface manager: PDP context WWANStatusIndicator changed to %u.", (uint8_t *)&v22, 8u);
    }
  }
  if (self->_isWWANInterfaceActivationPermitted != v8)
  {
    self->_isWWANInterfaceActivationPermitted = v8;
    int v16 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isWWANInterfaceActivationPermitted) {
        id v17 = @"YES";
      }
      else {
        id v17 = @"NO";
      }
      int v22 = 138543362;
      v23 = v17;
      _os_log_impl(&dword_1D340D000, v16, OS_LOG_TYPE_DEFAULT, "Interface manager: PDP context _isWWANInterfaceActivationPermitted to %{public}@ (isWWANInterfaceDataAttached).", (uint8_t *)&v22, 0xCu);
    }
  }
  [(PCPersistentInterfaceManager *)self _updateWWANInterfaceUpStateLocked];
  if (!self->_isWWANInterfaceDataActive)
  {
    if (v8)
    {
      if (self->_hasWWANStatusIndicator)
      {
        if ([(PCPersistentInterfaceManager *)self _wantsWWANInterfaceAssertion])
        {
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          double lastActivationTime = self->_lastActivationTime;
          if (lastActivationTime > Current || lastActivationTime + 900.0 < Current)
          {
            id v20 = +[PCLog interfaceManager];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v22) = 0;
              _os_log_impl(&dword_1D340D000, v20, OS_LOG_TYPE_DEFAULT, "Interface manager: data attached but not active; activating context",
                (uint8_t *)&v22,
                2u);
            }

            id v21 = (id)[(CoreTelephonyClient *)self->_ctClient setPacketContextActiveByServiceType:self->_currentDataSimContext connectionType:0 active:1];
            self->_double lastActivationTime = Current;
          }
        }
      }
    }
  }
}

- (BOOL)_isCellularCall:(__CTCall *)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = (const void *)CTCallGetCallSubType();
  return CFEqual(v3, (CFTypeRef)*MEMORY[0x1E4F23B40]) != 0;
}

- (void)_processCallStatusChanged:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [v4 objectForKey:*MEMORY[0x1E4F23B30]];
  BOOL v6 = v5;
  if (v5) {
    BOOL v7 = [v5 intValue] - 6 < 0xFFFFFFFE;
  }
  else {
    BOOL v7 = 0;
  }
  BOOL v8 = v7 & -[PCPersistentInterfaceManager _isCellularCall:](self, "_isCellularCall:", [v4 objectForKey:*MEMORY[0x1E4F23B20]]);
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_isInCall != v8)
  {
    self->_BOOL isInCall = v8;
    uint64_t v9 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isInCall) {
        int v10 = "in";
      }
      else {
        int v10 = "not in";
      }
      int v19 = 136315138;
      id v20 = (PCPersistentInterfaceManager *)v10;
      _os_log_impl(&dword_1D340D000, v9, OS_LOG_TYPE_DEFAULT, "Interface manager: call status is %s call", (uint8_t *)&v19, 0xCu);
    }

    inCallWWANOverrideTimer = self->_inCallWWANOverrideTimer;
    [(PCPersistentInterfaceManager *)self _clearInCallWWANOverrideTimerLocked];
    BOOL isInCall = self->_isInCall;
    if (self->_isInCall)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__inCallWWANOverrideTimerFired selector:0 userInfo:0 repeats:15.0];
      int v14 = self->_inCallWWANOverrideTimer;
      self->_inCallWWANOverrideTimer = v13;

      int v15 = +[PCLog interfaceManager];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = self->_inCallWWANOverrideTimer;
        int v19 = 138543874;
        id v20 = self;
        __int16 v21 = 2048;
        uint64_t v22 = 0x402E000000000000;
        __int16 v23 = 2114;
        __int16 v24 = v16;
        _os_log_impl(&dword_1D340D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Interface manager: overriding WWAN interface while on call for %f seconds: %{public}@", (uint8_t *)&v19, 0x20u);
      }

      id v17 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v17 addTimer:self->_inCallWWANOverrideTimer forMode:*MEMORY[0x1E4F1C4B0]];

      Main = CFRunLoopGetMain();
      CFRunLoopWakeUp(Main);
      BOOL isInCall = 1;
    }
    if (isInCall != (inCallWWANOverrideTimer != 0)) {
      [(PCPersistentInterfaceManager *)self _updateWWANInterfaceUpStateLocked];
    }
    [(PCPersistentInterfaceManager *)self _updateWWANInterfaceAssertionsLocked];
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_inCallWWANOverrideTimerFired
{
  [(NSRecursiveLock *)self->_lock lock];
  [(PCPersistentInterfaceManager *)self _clearInCallWWANOverrideTimerLocked];
  [(PCPersistentInterfaceManager *)self _updateWWANInterfaceUpStateLocked];
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (void)_clearInCallWWANOverrideTimerLocked
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_inCallWWANOverrideTimer)
  {
    id v3 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      inCallWWANOverrideTimer = self->_inCallWWANOverrideTimer;
      int v6 = 138543618;
      BOOL v7 = self;
      __int16 v8 = 2114;
      uint64_t v9 = inCallWWANOverrideTimer;
      _os_log_impl(&dword_1D340D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Interface manager: Clearing _inCallWWANOverrideTimer: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    [(NSTimer *)self->_inCallWWANOverrideTimer invalidate];
    unsigned int v5 = self->_inCallWWANOverrideTimer;
    self->_inCallWWANOverrideTimer = 0;
  }
}

- (id)_nonCellularMonitor
{
  return +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
}

- (void)_updateWWANInterfaceUpStateLocked
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL isWWANInterfaceUp = self->_isWWANInterfaceUp;
  if (self->_inCallWWANOverrideTimer && self->_isInCall)
  {
    id v4 = [(PCPersistentInterfaceManager *)self _nonCellularMonitor];
    int v5 = [v4 isInterfaceUsable];
  }
  else
  {
    int v5 = 0;
  }
  char isWWANInterfaceDataActive = self->_isWWANInterfaceDataActive;
  if (isWWANInterfaceDataActive)
  {
    char isWWANInterfaceDataActive = v5 ^ 1;
    if (!self->_hasWWANStatusIndicator) {
      char isWWANInterfaceDataActive = 0;
    }
  }
  self->_BOOL isWWANInterfaceUp = isWWANInterfaceDataActive;
  BOOL v7 = +[PCLog interfaceManager];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (isWWANInterfaceUp) {
      __int16 v8 = @"YES";
    }
    else {
      __int16 v8 = @"NO";
    }
    if (self->_isWWANInterfaceUp) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    *(_DWORD *)int v14 = 138544386;
    if ([(PCPersistentInterfaceManager *)self _wantsWWANInterfaceAssertion]) {
      uint64_t v10 = @"YES";
    }
    else {
      uint64_t v10 = @"NO";
    }
    *(void *)&v14[4] = self;
    if (v5) {
      __int16 v11 = @"YES";
    }
    else {
      __int16 v11 = @"NO";
    }
    *(_WORD *)&v14[12] = 2114;
    *(void *)&v14[14] = v8;
    __int16 v15 = 2114;
    int v16 = v9;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    __int16 v19 = 2114;
    id v20 = v11;
    _os_log_impl(&dword_1D340D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ _updateWWANInterfaceUpState wasUp %{public}@ isUp %{public}@ wantsInterfaceAssertion %{public}@ avoidWWANOnCall %{public}@", v14, 0x34u);
  }

  if (isWWANInterfaceUp != self->_isWWANInterfaceUp)
  {
    if ([(PCPersistentInterfaceManager *)self _wantsWWANInterfaceAssertion]
      || isWWANInterfaceUp
      && !self->_hasWWANStatusIndicator
      && (+[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0), id v12 = objc_claimAutoreleasedReturnValue(), v13 = [v12 isInternetReachable], v12, v13))
    {
      -[PCPersistentInterfaceManager _scheduleCalloutsForSelector:](self, "_scheduleCalloutsForSelector:", sel_interfaceManagerWWANInterfaceStatusChanged_, *(_OWORD *)v14);
    }
    -[PCPersistentInterfaceManager _scheduleCalloutsForSelector:](self, "_scheduleCalloutsForSelector:", sel_interfaceManagerInternetReachabilityChanged_, *(void *)v14);
  }
  [(PCPersistentInterfaceManager *)self _updateWWANInterfaceAssertionsLocked];
}

- (void)_updateWWANInterfaceUpState
{
  [(NSRecursiveLock *)self->_lock lock];
  [(PCPersistentInterfaceManager *)self _updateWWANInterfaceUpStateLocked];
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (void)_updateCTIsWWANInHomeCountry:(BOOL)a3 isWWANInterfaceDataActive:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v7 = [(PCPersistentInterfaceManager *)self _isWWANInHomeCountryLocked];
  self->_ctIsWWANInHomeCountry = a3;
  self->_char isWWANInterfaceDataActive = a4;
  int v8 = [(PCPersistentInterfaceManager *)self _isWWANInHomeCountryLocked];
  if (v7 != v8)
  {
    int v9 = v8;
    uint64_t v10 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = "false";
      if (v9) {
        __int16 v11 = "true";
      }
      int v12 = 136315138;
      int v13 = v11;
      _os_log_impl(&dword_1D340D000, v10, OS_LOG_TYPE_DEFAULT, "Interface manager: isWWANInHomeCountry status changed to %s", (uint8_t *)&v12, 0xCu);
    }

    [(PCPersistentInterfaceManager *)self _scheduleCalloutsForSelector:sel_interfaceManagerInHomeCountryStatusChanged_];
  }
}

- (NSString)currentLinkQualityString
{
  v2 = NSString;
  id v3 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
  id v4 = [v3 linkQualityString];
  int v5 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
  int v6 = [v5 linkQualityString];
  int v7 = [v2 stringWithFormat:@"wwan is %@; wifi is %@", v4, v6];

  return (NSString *)v7;
}

- (BOOL)_wwanIsPoorLinkQuality
{
  v2 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
  char v3 = [v2 isPoorLinkQuality];

  return v3;
}

- (BOOL)_wifiIsPoorLinkQuality
{
  v2 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
  char v3 = [v2 isPoorLinkQuality];

  return v3;
}

- (void)_scheduleCalloutsForSelector:(SEL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v5 = self->_delegatesAndQueues;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        __int16 v11 = [(NSMapTable *)self->_delegatesAndQueues objectForKey:v10];
        int v12 = [v11 queue];

        if (v12)
        {
          int v13 = [v11 queue];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __61__PCPersistentInterfaceManager__scheduleCalloutsForSelector___block_invoke;
          v14[3] = &unk_1E698DDA8;
          v14[4] = self;
          v14[5] = v10;
          id v15 = v11;
          SEL v16 = a3;
          dispatch_async(v13, v14);
        }
      }
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

void __61__PCPersistentInterfaceManager__scheduleCalloutsForSelector___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) lock];
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  id v4 = [v2 queue];

  id v3 = [*(id *)(a1 + 48) queue];

  [*(id *)(*(void *)(a1 + 32) + 8) unlock];
  if (v3 == v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(a1 + 40) performSelector:*(void *)(a1 + 56) withObject:*(void *)(a1 + 32)];
  }
}

- (BOOL)isWWANBetterThanWiFi
{
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_isWWANInterfaceUp)
  {
    LOBYTE(v3) = 1;
    id v4 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
    if (([v4 isInterfaceHistoricallyUsable] & 1) == 0)
    {
      int v5 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
      int v3 = [v5 isInterfaceUsable] ^ 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (NSString)WWANInterfaceName
{
  [(NSRecursiveLock *)self->_lock lock];
  int v3 = self->_WWANInterfaceName;
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (BOOL)isWWANInterfaceSuspended
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isWWANInterfaceSuspended = self->_isWWANInterfaceSuspended;
  [(NSRecursiveLock *)self->_lock unlock];
  return isWWANInterfaceSuspended;
}

- (BOOL)doesWWANInterfaceExist
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = self->_WWANInterfaceName != 0;
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (BOOL)isWWANInterfaceInProlongedHighPowerState
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isWWANInterfaceInProlongedHighPowerState = self->_isWWANInterfaceInProlongedHighPowerState;
  [(NSRecursiveLock *)self->_lock unlock];
  return isWWANInterfaceInProlongedHighPowerState;
}

- (BOOL)isWWANInterfaceActivationPermitted
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isWWANInterfaceActivationPermitted = self->_isWWANInterfaceActivationPermitted;
  [(NSRecursiveLock *)self->_lock unlock];
  return isWWANInterfaceActivationPermitted;
}

- (BOOL)_isWWANInHomeCountryLocked
{
  return !self->_isWWANInterfaceDataActive || self->_ctIsWWANInHomeCountry;
}

- (BOOL)isWWANInHomeCountry
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = [(PCPersistentInterfaceManager *)self _isWWANInHomeCountryLocked];
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (BOOL)isInternetReachableViaWiFi
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
  char v4 = [v3 isInternetReachable];

  [(NSRecursiveLock *)self->_lock unlock];
  return v4;
}

- (BOOL)_isWiFiUsable
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
  char v4 = [v3 isInterfaceUsable];

  [(NSRecursiveLock *)self->_lock unlock];
  return v4;
}

- (BOOL)isWakeOnWiFiSupported
{
  v2 = [MEMORY[0x1E4F59E38] sharedInstance];
  char v3 = [v2 isWoWSupported];

  return v3;
}

- (BOOL)areAllNetworkInterfacesDisabled
{
  [(NSRecursiveLock *)self->_lock lock];
  if ([(PCPersistentInterfaceManager *)self _isInternetReachableLocked]) {
    goto LABEL_2;
  }
  char v4 = SCPreferencesCreateWithAuthorization(0, @"com.apple.persistentconnection", @"com.apple.radios.plist", 0);
  if (v4)
  {
    int v5 = v4;
    BOOL v6 = SCPreferencesGetValue(v4, @"AirplaneMode") == (CFPropertyListRef)*MEMORY[0x1E4F1CFD0];
    CFRelease(v5);
  }
  else
  {
    BOOL v6 = 0;
  }
  uint64_t v7 = [MEMORY[0x1E4F59E38] sharedInstance];
  char v8 = [v7 isWiFiEnabled];

  if (!v6 && self->_WWANInterfaceName && self->_isWWANInterfaceActivationPermitted) {
LABEL_2:
  }
    char v3 = 0;
  else {
    char v3 = v8 ^ 1;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (void)cutWiFiManagerDeviceAttached:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[PCLog interfaceManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D340D000, v5, OS_LOG_TYPE_DEFAULT, "cutWiFiManagerDeviceAttached called: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(PCPersistentInterfaceManager *)self _adjustWakeOnWiFi];
}

- (BOOL)_wantsWWANInterfaceAssertion
{
  if (self->_isWWANInterfaceActivationPermitted)
  {
    if (self->_isInCall)
    {
      v2 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
      int v3 = [v2 isInterfaceUsable] ^ 1;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_updateWWANInterfaceAssertions
{
  [(NSRecursiveLock *)self->_lock lock];
  [(PCPersistentInterfaceManager *)self _updateWWANInterfaceAssertionsLocked];
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (void)_updateWWANInterfaceAssertionsLocked
{
  BOOL v3 = [(PCPersistentInterfaceManager *)self _wantsWWANInterfaceAssertion];
  interfaceAssertion = self->_interfaceAssertion;
  if (v3)
  {
    if (!interfaceAssertion && self->_ctClient)
    {
      int v5 = +[PCLog interfaceManager];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D340D000, v5, OS_LOG_TYPE_DEFAULT, "Interface manager: asserting packet context active", (uint8_t *)buf, 2u);
      }

      id v6 = (id)[(CoreTelephonyClient *)self->_ctClient setPacketContextActiveByServiceType:self->_currentDataSimContext connectionType:0 active:1];
      objc_initWeak(buf, self);
      ctClient = self->_ctClient;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __68__PCPersistentInterfaceManager__updateWWANInterfaceAssertionsLocked__block_invoke;
      v9[3] = &unk_1E698DDD0;
      objc_copyWeak(&v10, buf);
      self->_interfaceAssertion = (void *)[(CoreTelephonyClient *)ctClient createAssertionForConnectionType:0 allocator:0 error:0 onReAssertError:v9];
      objc_destroyWeak(&v10);
      objc_destroyWeak(buf);
    }
  }
  else if (interfaceAssertion)
  {
    uint64_t v8 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D340D000, v8, OS_LOG_TYPE_DEFAULT, "Interface manager: clearing packet context assertion", (uint8_t *)buf, 2u);
    }

    CFRelease(self->_interfaceAssertion);
    self->_interfaceAssertion = 0;
  }
}

void __68__PCPersistentInterfaceManager__updateWWANInterfaceAssertionsLocked__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (WeakRetained && WeakRetained[7])
  {
    id v6 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1D340D000, v6, OS_LOG_TYPE_DEFAULT, "Interface manager: reAssert failed, dropping assertion {reAssertError: %@}", (uint8_t *)&v8, 0xCu);
    }

    [v5[1] lock];
    id v7 = v5[7];
    if (v7)
    {
      CFRelease(v7);
      v5[7] = 0;
    }
    [v5[1] unlock];
  }
}

- (void)enableWiFiAutoAssociation:(BOOL)a3 forDelegate:(id)a4
{
  BOOL v4 = a3;
  lock = self->_lock;
  id v7 = a4;
  [(NSRecursiveLock *)lock lock];
  WiFiAutoAssociationDelegates = self->_WiFiAutoAssociationDelegates;
  if (v4) {
    CFSetAddValue(WiFiAutoAssociationDelegates, v7);
  }
  else {
    CFSetRemoveValue(WiFiAutoAssociationDelegates, v7);
  }

  if (CFSetGetCount(self->_WiFiAutoAssociationDelegates) < 1)
  {
    if (!self->_WiFiAutoAssociationDisableTimer)
    {
      id v9 = [[PCSimpleTimer alloc] initWithTimeInterval:@"interfacemanager-wifiautoassoc" serviceIdentifier:self target:sel__adjustWiFiAutoAssociation selector:0 userInfo:60.0];
      WiFiAutoAssociationDisableTimer = self->_WiFiAutoAssociationDisableTimer;
      self->_WiFiAutoAssociationDisableTimer = v9;

      [(PCSimpleTimer *)self->_WiFiAutoAssociationDisableTimer setDisableSystemWaking:1];
      __int16 v11 = self->_WiFiAutoAssociationDisableTimer;
      int v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(PCSimpleTimer *)v11 scheduleInRunLoop:v12];

      Main = CFRunLoopGetMain();
      CFRunLoopWakeUp(Main);
    }
  }
  else
  {
    [(PCPersistentInterfaceManager *)self _adjustWiFiAutoAssociationLocked];
  }
  uint64_t v14 = self->_lock;
  [(NSRecursiveLock *)v14 unlock];
}

- (void)_adjustWiFiAutoAssociation
{
  [(NSRecursiveLock *)self->_lock lock];
  [(PCPersistentInterfaceManager *)self _adjustWiFiAutoAssociationLocked];
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (void)_adjustWiFiAutoAssociationLocked
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WiFiAutoAssociationDisableTimer = self->_WiFiAutoAssociationDisableTimer;
  if (WiFiAutoAssociationDisableTimer)
  {
    [(PCSimpleTimer *)WiFiAutoAssociationDisableTimer invalidate];
    BOOL v4 = self->_WiFiAutoAssociationDisableTimer;
    self->_WiFiAutoAssociationDisableTimer = 0;
  }
  CFIndex Count = CFSetGetCount(self->_WiFiAutoAssociationDelegates);
  id v6 = [MEMORY[0x1E4F59E38] sharedInstance];
  int v7 = [v6 hasWiFiAutoAssociationClientToken:@"PCAutoAssociateToken"];

  if (Count > 0 != v7)
  {
    int v8 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = "disabling";
      if (Count > 0) {
        id v9 = "enabling";
      }
      int v12 = 136315138;
      int v13 = v9;
      _os_log_impl(&dword_1D340D000, v8, OS_LOG_TYPE_DEFAULT, "Interface manager: %s WiFi association on wake", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v10 = [MEMORY[0x1E4F59E38] sharedInstance];
    __int16 v11 = v10;
    if (Count < 1) {
      [v10 removeWiFiAutoAssociationClientToken:@"PCAutoAssociateToken"];
    }
    else {
      [v10 addWiFiAutoAssociationClientToken:@"PCAutoAssociateToken"];
    }
  }
}

- (void)enableWakeOnWiFi:(BOOL)a3 forDelegate:(id)a4
{
  BOOL v4 = a3;
  lock = self->_lock;
  id v7 = a4;
  [(NSRecursiveLock *)lock lock];
  wakeOnWiFiDelegates = self->_wakeOnWiFiDelegates;
  if (v4) {
    CFSetAddValue(wakeOnWiFiDelegates, v7);
  }
  else {
    CFSetRemoveValue(wakeOnWiFiDelegates, v7);
  }

  if ([(PCPersistentInterfaceManager *)self _wantsWakeOnWiFiEnabled])
  {
    [(PCPersistentInterfaceManager *)self _adjustWakeOnWiFiLocked];
  }
  else if (!self->_wakeOnWiFiDisableTimer)
  {
    id v9 = [[PCSimpleTimer alloc] initWithTimeInterval:@"interfacemanager-wow" serviceIdentifier:self target:sel__adjustWakeOnWiFi selector:0 userInfo:60.0];
    wakeOnWiFiDisableTimer = self->_wakeOnWiFiDisableTimer;
    self->_wakeOnWiFiDisableTimer = v9;

    [(PCSimpleTimer *)self->_wakeOnWiFiDisableTimer setDisableSystemWaking:1];
    __int16 v11 = self->_wakeOnWiFiDisableTimer;
    int v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(PCSimpleTimer *)v11 scheduleInRunLoop:v12];

    Main = CFRunLoopGetMain();
    CFRunLoopWakeUp(Main);
  }
  uint64_t v14 = self->_lock;
  [(NSRecursiveLock *)v14 unlock];
}

- (BOOL)_wantsWakeOnWiFiEnabled
{
  if (CFSetGetCount(self->_wakeOnWiFiDelegates) < 1) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F59E38] sharedInstance];
  char v3 = [v2 isWoWSupported];

  return v3;
}

- (void)_adjustWakeOnWiFi
{
  [(NSRecursiveLock *)self->_lock lock];
  [(PCPersistentInterfaceManager *)self _adjustWakeOnWiFiLocked];
  lock = self->_lock;
  [(NSRecursiveLock *)lock unlock];
}

- (void)_adjustWakeOnWiFiLocked
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  wakeOnWiFiDisableTimer = self->_wakeOnWiFiDisableTimer;
  if (wakeOnWiFiDisableTimer)
  {
    [(PCSimpleTimer *)wakeOnWiFiDisableTimer invalidate];
    BOOL v4 = self->_wakeOnWiFiDisableTimer;
    self->_wakeOnWiFiDisableTimer = 0;
  }
  int v5 = [(PCPersistentInterfaceManager *)self _wantsWakeOnWiFiEnabled];
  id v6 = [MEMORY[0x1E4F59E38] sharedInstance];
  int v7 = [v6 hasWoWClient:self];

  if (v5 != v7)
  {
    int v8 = +[PCLog interfaceManager];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = "disabling";
      if (v5) {
        id v9 = "enabling";
      }
      int v12 = 136315138;
      int v13 = v9;
      _os_log_impl(&dword_1D340D000, v8, OS_LOG_TYPE_DEFAULT, "Interface manager: %s wake-on-WiFi", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v10 = [MEMORY[0x1E4F59E38] sharedInstance];
    __int16 v11 = v10;
    if (v5) {
      [v10 addWoWClient:self];
    }
    else {
      [v10 removeWoWClient:self];
    }
  }
}

- (BOOL)allowBindingToWWAN
{
  BOOL v3 = [(PCPersistentInterfaceManager *)self doesWWANInterfaceExist];
  if (v3)
  {
    BOOL v3 = [(PCPersistentInterfaceManager *)self isWWANInterfaceActivationPermitted];
    if (v3)
    {
      if ([(PCPersistentInterfaceManager *)self isInCall]) {
        LOBYTE(v3) = ![(PCPersistentInterfaceManager *)self _isWiFiUsable];
      }
      else {
        LOBYTE(v3) = 1;
      }
    }
  }
  return v3;
}

- (BOOL)hasWWANStatusIndicator
{
  return self->_hasWWANStatusIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDataSimContext, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_inCallWWANOverrideTimer, 0);
  objc_storeStrong((id *)&self->_WWANInterfaceName, 0);
  objc_storeStrong((id *)&self->_wakeOnWiFiDisableTimer, 0);
  objc_storeStrong((id *)&self->_WiFiAutoAssociationDisableTimer, 0);
  objc_storeStrong((id *)&self->_delegatesAndQueues, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end