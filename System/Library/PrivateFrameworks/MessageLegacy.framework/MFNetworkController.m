@interface MFNetworkController
+ (id)networkAssertionWithIdentifier:(id)a3;
+ (id)sharedInstance;
- (BOOL)_isNetworkUp_nts;
- (BOOL)_simulationOverrideForType:(unint64_t)a3 actualValue:(BOOL)a4;
- (BOOL)hasAlternateAdvice;
- (BOOL)inAirplaneMode;
- (BOOL)is3GConnection;
- (BOOL)is4GConnection;
- (BOOL)isDataAvailable;
- (BOOL)isFatPipe;
- (BOOL)isNetworkUp;
- (BOOL)isOnWWAN;
- (EFObservable)networkObservable;
- (EFObservable)wifiObservable;
- (MFNetworkController)init;
- (id)_networkAssertionWithIdentifier:(id)a3;
- (id)addNetworkObserverBlock:(id)a3 queue:(id)a4;
- (id)copyCarrierBundleValue:(id)a3;
- (id)copyDiagnosticInformation;
- (int)dataStatus;
- (void)_carrierBundleDidChange;
- (void)_checkKeys:(id)a3 forStore:(__SCDynamicStore *)a4;
- (void)_handleWiFiNotification:(unsigned int)a3;
- (void)_initializeDataStatus;
- (void)_inititializeWifiManager;
- (void)_setDataStatus_nts:(id)a3;
- (void)_setFlags:(unsigned int)a3 forReachability:(__SCNetworkReachability *)a4;
- (void)_setupSymptons;
- (void)_updateActiveCalls;
- (void)_updateWifiClientType;
- (void)addBackgroundWifiClient:(id)a3;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)connectionActivationError:(id)a3 connection:(int)a4 error:(int)a5;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)preferredDataSimChanged:(id)a3;
- (void)removeBackgroundWifiClient:(id)a3;
- (void)removeNetworkObserver:(id)a3;
- (void)setWifiManager:(void *)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)wifiManager;
@end

@implementation MFNetworkController

- (int)dataStatus
{
  [(MFNetworkController *)self _initializeDataStatus];
  [(NSLock *)self->_lock lock];
  if ([(MFNetworkController *)self _isNetworkUp_nts])
  {
    if (self->_hasWiFiCapability && (self->_flags & 0x40000) == 0)
    {
LABEL_12:
      int v3 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    if ([(RadiosPreferences *)self->_radiosPreferences airplaneMode])
    {
      int v3 = 1;
      goto LABEL_22;
    }
    if (self->_hasWiFiCapability && !self->_hasCellDataCapability && !self->_isWiFiEnabled)
    {
      int v3 = 3;
      goto LABEL_22;
    }
  }
  if (!self->_hasCellDataCapability)
  {
    int v3 = 6;
    goto LABEL_22;
  }
  if (self->_cellularDataAvailable) {
    goto LABEL_12;
  }
  if (CTCellularDataPlanGetIsEnabled())
  {
    if (self->_isRoamingAllowed)
    {
      if (self->_activeCalls) {
        int v3 = 5;
      }
      else {
        int v3 = 6;
      }
    }
    else
    {
      int v3 = 4;
    }
  }
  else
  {
    int v3 = 2;
  }
LABEL_22:
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (void)_initializeDataStatus
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MFNetworkController__initializeDataStatus__block_invoke;
  block[3] = &unk_1E68675C0;
  block[4] = self;
  if (_initializeDataStatus_onceToken != -1) {
    dispatch_once(&_initializeDataStatus_onceToken, block);
  }
}

- (BOOL)_isNetworkUp_nts
{
  return (self->_flags & 6) == 2 && self->_dns;
}

- (void)_setDataStatus_nts:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1CFCFE000, v5, OS_LOG_TYPE_DEFAULT, "#Network setting data status: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4)
  {
    self->_dataIndicator = [v4 indicator];
    self->_isRoamingAllowed = [v4 roamAllowed];
    BOOL v6 = [v4 attached]
      && [v4 indicator]
      && self->_isRoamingAllowed;
    self->_cellularDataAvailable = v6;
  }
  else
  {
    self->_dataIndicator = 0;
    self->_isRoamingAllowed = 0;
    self->_cellularDataAvailable = 0;
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MFNetworkController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

void __37__MFNetworkController_sharedInstance__block_invoke(uint64_t a1)
{
  id obj = objc_alloc(*(Class *)(a1 + 32));
  v1 = +[MFStream networkThread];
  [obj performSelector:sel_init onThread:v1 withObject:0 waitUntilDone:1];

  objc_storeStrong((id *)&sharedInstance__sharedInstance, obj);
  id v2 = (id)[(id)sharedInstance__sharedInstance addNetworkObserverBlock:&__block_literal_global_16 queue:MEMORY[0x1E4F14428]];
}

void __37__MFNetworkController_sharedInstance__block_invoke_2()
{
  v0 = (void *)MEMORY[0x1D25DDB40]();
  v1 = [MEMORY[0x1E4F28EA0] notificationWithName:@"NetworkConfigurationDidChangeNotification" object:sharedInstance__sharedInstance];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotification:v1];
}

- (MFNetworkController)init
{
  v37.receiver = self;
  v37.super_class = (Class)MFNetworkController;
  id v2 = [(MFNetworkController *)&v37 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"com.apple.message.mfnetworkcontroller" andDelegate:v2];
    lock = v2->_lock;
    v2->_lock = (NSLock *)v3;

    v2->_hasCellDataCapability = MGGetBoolAnswer();
    v2->_hasWiFiCapability = MGGetBoolAnswer();
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    v2->_rl = Current;
    CFRetain(Current);
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    int v7 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &init_sa);
    v2->_reachability = v7;
    SCNetworkReachabilityGetFlags(v7, &v2->_flags);
    context.version = 0;
    context.info = v2;
    id v8 = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
    context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
    uint64_t v9 = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
    context.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
    v10 = (CFStringRef (__cdecl *)(const void *))MEMORY[0x1E4F1C220];
    context.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x1E4F1C220];
    SCNetworkReachabilitySetCallback(v2->_reachability, (SCNetworkReachabilityCallBack)_NetworkReachabilityCallBack, &context);
    CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D410];
    SCNetworkReachabilityScheduleWithRunLoop(v2->_reachability, v2->_rl, (CFStringRef)*MEMORY[0x1E4F1D410]);
    v35.version = 0;
    v35.info = v2;
    v35.retain = v8;
    v35.release = v9;
    v35.copyDescription = v10;
    SCDynamicStoreRef v12 = SCDynamicStoreCreate(v6, @"com.apple.message.mfnetworkcontroller", (SCDynamicStoreCallBack)_DynamicStoreCallBack, &v35);
    v2->_store = v12;
    if (v12)
    {
      buf.version = (CFIndex)SCDynamicStoreKeyCreateNetworkGlobalEntity(v6, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41B08]);
      CFArrayRef v13 = (const __CFArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&buf count:1];
      [(MFNetworkController *)v2 _checkKeys:v13 forStore:v2->_store];
      SCDynamicStoreSetNotificationKeys(v2->_store, v13, 0);
      RunLoopSource = SCDynamicStoreCreateRunLoopSource(v6, v2->_store, 0);
      v2->_store_source = RunLoopSource;
      CFRunLoopAddSource(v2->_rl, RunLoopSource, v11);
    }
    else
    {
      v15 = MFLogGeneral();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.version) = 0;
        _os_log_impl(&dword_1CFCFE000, v15, OS_LOG_TYPE_DEFAULT, "#Warning #Network Could not create SCDynamicStore", (uint8_t *)&buf, 2u);
      }
    }
    if (!v2->_hasWiFiCapability) {
      goto LABEL_13;
    }
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle && (CFStringRef Identifier = CFBundleGetIdentifier(MainBundle)) != 0)
    {
      CFStringRef v18 = Identifier;
      CFRetain(Identifier);
    }
    else
    {
      v19 = getprogname();
      uint64_t v20 = getpid();
      CFStringRef v18 = CFStringCreateWithFormat(v6, 0, @"%s (%d)", v19, v20);
      if (!v18)
      {
LABEL_13:
        dispatch_queue_t v22 = dispatch_queue_create("com.apple.message.MFNetworkController.dataStatus", 0);
        dataStatusQueue = v2->_dataStatusQueue;
        v2->_dataStatusQueue = (OS_dispatch_queue *)v22;

        uint64_t v24 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v2->_dataStatusQueue];
        ctc = v2->_ctc;
        v2->_ctc = (CoreTelephonyClient *)v24;

        [(CoreTelephonyClient *)v2->_ctc setDelegate:v2];
        v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        backgroundWifiClients = v2->_backgroundWifiClients;
        v2->_backgroundWifiClients = v26;

        [(MFNetworkController *)v2 _inititializeWifiManager];
        [(MFNetworkController *)v2 _setupSymptons];
        dispatch_queue_t v28 = dispatch_queue_create("com.apple.mail.radioPreferences", 0);
        prefsQueue = v2->_prefsQueue;
        v2->_prefsQueue = (OS_dispatch_queue *)v28;

        uint64_t v30 = [objc_alloc(MEMORY[0x1E4F4BE78]) initWithQueue:v2->_prefsQueue];
        radiosPreferences = v2->_radiosPreferences;
        v2->_radiosPreferences = (RadiosPreferences *)v30;

        [(RadiosPreferences *)v2->_radiosPreferences setDelegate:v2];
        v32 = [MEMORY[0x1E4F734D0] sharedController];
        [v32 addDiagnosticsGenerator:v2];

        return v2;
      }
    }
    v21 = SCPreferencesCreate(v6, v18, @"com.apple.wifi.plist");
    v2->_wiFiPreferences = v21;
    buf.version = 0;
    memset(&buf.retain, 0, 24);
    buf.info = v2;
    SCPreferencesSetCallback(v21, (SCPreferencesCallBack)_WiFiCallBack, &buf);
    SCPreferencesScheduleWithRunLoop(v2->_wiFiPreferences, v2->_rl, v11);
    v2->_isWiFiEnabled = _IsWiFiEnabled(v2->_wiFiPreferences);
    CFRelease(v18);
    goto LABEL_13;
  }
  return v2;
}

- (void)_inititializeWifiManager
{
  uint64_t v3 = (void *)WiFiManagerClientCreate();
  self->_wifiManager = v3;
  if (!v3)
  {
    id v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CFCFE000, v4, OS_LOG_TYPE_DEFAULT, "#Warning #Network WiFiManagerClientCreate() returned NULL. Check that the process has the appropriate entitlement(s).", v5, 2u);
    }
  }
}

void __44__MFNetworkController__initializeDataStatus__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v18 = 0;
  uint64_t v3 = [v2 getSubscriptionInfoWithError:&v18];
  id v4 = v18;
  v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)SCPreferencesContext buf = 138412546;
    uint64_t v20 = v3;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_1CFCFE000, v5, OS_LOG_TYPE_DEFAULT, "#Network retrieved CT subscription info: %@ with error: %@", buf, 0x16u);
  }

  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    int v7 = [v3 subscriptions];
    id v8 = objc_msgSend(v7, "ef_firstObjectPassingTest:", &__block_literal_global_36);

    if (v8)
    {
      uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 96);
      id v17 = 0;
      v10 = [v9 getDataStatus:v8 error:&v17];
      id v11 = v17;
      id v4 = v11;
      if (v10) {
        BOOL v12 = v11 == 0;
      }
      else {
        BOOL v12 = 0;
      }
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "_setDataStatus_nts:", v10);
      }
      else
      {
        CFArrayRef v13 = MFLogGeneral();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __44__MFNetworkController__initializeDataStatus__block_invoke_cold_2((uint64_t)v8, (uint64_t)v4, v13);
        }
      }
    }
    else
    {
      v10 = MFLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __44__MFNetworkController__initializeDataStatus__block_invoke_cold_1(v10);
      }
      id v4 = 0;
    }
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F19198]);
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 152);
  *(void *)(v15 + 152) = v14;

  [*(id *)(*(void *)(a1 + 32) + 152) setDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 112)];
  [*(id *)(a1 + 32) _updateActiveCalls];
}

uint64_t __44__MFNetworkController__initializeDataStatus__block_invoke_33(uint64_t a1, void *a2)
{
  id v2 = [a2 userDataPreferred];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (void)_setupSymptons
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__MFNetworkController__setupSymptons__block_invoke;
  aBlock[3] = &unk_1E68675E8;
  aBlock[4] = self;
  uint64_t v3 = _Block_copy(aBlock);
  p_symptomsToken = &self->_symptomsToken;
  if (notify_register_dispatch("com.apple.symptoms.hasAlternateAdvice", p_symptomsToken, MEMORY[0x1E4F14428], v3)) {
    int *p_symptomsToken = -1;
  }
}

void __37__MFNetworkController__setupSymptons__block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  uint64_t v3 = state64;
  *(unsigned char *)(*(void *)(a1 + 32) + 68) = state64 != 0;
  if (v3 == 1)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"NetworkSymptonsHasAlternativeAdvice" object:*(void *)(a1 + 32)];
  }
}

- (void)dealloc
{
  __assert_rtn("-[MFNetworkController dealloc]", "MFNetworkController.m", 361, "NULL == _store");
}

- (void)invalidate
{
  uint64_t v3 = [(id)objc_opt_class() sharedInstance];

  if (v3 != self)
  {
    [(NSLock *)self->_lock lock];
    id v4 = (CFRunLoopMode *)MEMORY[0x1E4F1D410];
    if (self->_store)
    {
      CFRunLoopSourceInvalidate(self->_store_source);
      SCDynamicStoreSetNotificationKeys(self->_store, 0, 0);
      CFRunLoopRemoveSource(self->_rl, self->_store_source, *v4);
      CFRelease(self->_store_source);
      CFRelease(self->_store);
      self->_store = 0;
    }
    reachability = self->_reachability;
    if (reachability)
    {
      SCNetworkReachabilitySetCallback(reachability, 0, 0);
      SCNetworkReachabilityUnscheduleFromRunLoop(self->_reachability, self->_rl, *v4);
      CFRelease(self->_reachability);
      self->_reachability = 0;
    }
    observers = self->_observers;
    self->_observers = 0;

    rl = self->_rl;
    if (rl)
    {
      CFRelease(rl);
      self->_rl = 0;
    }
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (BOOL)_simulationOverrideForType:(unint64_t)a3 actualValue:(BOOL)a4
{
  BOOL v6 = (void *)CFPreferencesCopyValue(@"MFNetworkSimulationBitfieldKey", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  uint64_t v7 = [v6 unsignedIntegerValue];
  if (v7) {
    a4 = (v7 & a3) != 0;
  }

  return a4;
}

- (BOOL)isDataAvailable
{
  BOOL v3 = [(MFNetworkController *)self dataStatus] == 0;
  return [(MFNetworkController *)self _simulationOverrideForType:1 actualValue:v3];
}

- (BOOL)isNetworkUp
{
  [(NSLock *)self->_lock lock];
  BOOL v3 = [(MFNetworkController *)self _isNetworkUp_nts];
  [(NSLock *)self->_lock unlock];
  return [(MFNetworkController *)self _simulationOverrideForType:2 actualValue:v3];
}

- (BOOL)isFatPipe
{
  [(NSLock *)self->_lock lock];
  if ([(MFNetworkController *)self _isNetworkUp_nts]) {
    BOOL v3 = (self->_flags & 0x40000) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  [(NSLock *)self->_lock unlock];
  return [(MFNetworkController *)self _simulationOverrideForType:4 actualValue:v3];
}

- (BOOL)isOnWWAN
{
  [(NSLock *)self->_lock lock];
  if ([(MFNetworkController *)self _isNetworkUp_nts]) {
    uint64_t v3 = (BYTE2(self->_flags) >> 2) & 1;
  }
  else {
    uint64_t v3 = 0;
  }
  [(NSLock *)self->_lock unlock];
  return [(MFNetworkController *)self _simulationOverrideForType:8 actualValue:v3];
}

- (BOOL)inAirplaneMode
{
  BOOL v3 = [(MFNetworkController *)self dataStatus] == 1;
  return [(MFNetworkController *)self _simulationOverrideForType:16 actualValue:v3];
}

- (BOOL)is3GConnection
{
  [(MFNetworkController *)self _initializeDataStatus];
  BOOL v3 = (self->_dataIndicator - 3) < 3;
  return [(MFNetworkController *)self _simulationOverrideForType:32 actualValue:v3];
}

- (BOOL)is4GConnection
{
  [(MFNetworkController *)self _initializeDataStatus];
  BOOL v3 = (self->_dataIndicator - 7) < 2;
  return [(MFNetworkController *)self _simulationOverrideForType:64 actualValue:v3];
}

- (BOOL)hasAlternateAdvice
{
  return self->_alternateAdviceState;
}

- (void)_setFlags:(unsigned int)a3 forReachability:(__SCNetworkReachability *)a4
{
  [(NSLock *)self->_lock lock];
  if (self->_reachability == a4)
  {
    BOOL v7 = [(MFNetworkController *)self _isNetworkUp_nts];
    unsigned int v8 = self->_flags ^ a3;
    self->_flags = a3;
    if ((v8 & 0x40000) != 0 || v7 != [(MFNetworkController *)self _isNetworkUp_nts]) {
      [(NSMutableArray *)self->_observers makeObjectsPerformSelector:sel_execute];
    }
  }
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)_checkKeys:(id)a3 forStore:(__SCDynamicStore *)a4
{
  id v10 = a3;
  [(NSLock *)self->_lock lock];
  if (self->_store == a4)
  {
    BOOL v6 = [(MFNetworkController *)self _isNetworkUp_nts];
    self->_dns = 0;
    if ([v10 count])
    {
      BOOL v7 = [v10 objectAtIndexedSubscript:0];
      unsigned int v8 = (void *)SCDynamicStoreCopyValue(a4, v7);

      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = [v8 objectForKey:*MEMORY[0x1E4F41BC0]];
          self->_dns = [v9 count] != 0;
        }
      }
    }
    if (v6 != [(MFNetworkController *)self _isNetworkUp_nts]) {
      [(NSMutableArray *)self->_observers makeObjectsPerformSelector:sel_execute];
    }
  }
  [(NSLock *)self->_lock unlock];
}

- (void)_handleWiFiNotification:(unsigned int)a3
{
  if (a3)
  {
    [(NSLock *)self->_lock lock];
    self->_isWiFiEnabled = _IsWiFiEnabled(self->_wiFiPreferences);
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (id)_networkAssertionWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _CTServerConnectionCreateWithIdentifier();
  if (v4)
  {
    v5 = (const void *)v4;
    _CTServerConnectionAddToRunLoop();
    if ((unint64_t)_CTServerConnectionPacketContextAssertionCreate() >> 32)
    {
      BOOL v6 = MFLogGeneral();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[MFNetworkController _networkAssertionWithIdentifier:](v6);
      }
    }
    CFRelease(v5);
  }
  id v7 = 0;

  return v7;
}

+ (id)networkAssertionWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [a1 sharedInstance];
  BOOL v6 = [v5 _networkAssertionWithIdentifier:v4];

  return v6;
}

- (id)copyCarrierBundleValue:(id)a3
{
  id v4 = a3;
  ctc = self->_ctc;
  id v17 = 0;
  BOOL v6 = [(CoreTelephonyClient *)ctc getSubscriptionInfoWithError:&v17];
  id v7 = v17;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MFNetworkController copyCarrierBundleValue:]((uint64_t)v8, v9);
    }
    id v10 = 0;
  }
  else
  {
    id v11 = [v6 subscriptions];
    uint64_t v9 = objc_msgSend(v11, "ef_firstObjectPassingTest:", &__block_literal_global_49);

    if (v9)
    {
      BOOL v12 = (void *)[objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:1];
      CFArrayRef v13 = self->_ctc;
      id v16 = 0;
      id v10 = (void *)[(CoreTelephonyClient *)v13 copyCarrierBundleValue:v9 key:v4 bundleType:v12 error:&v16];
      id v8 = v16;
      if (v8)
      {
        id v14 = MFLogGeneral();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[MFNetworkController copyCarrierBundleValue:]((uint64_t)v8, v14);
        }
      }
    }
    else
    {
      id v10 = 0;
      id v8 = 0;
    }
  }

  return v10;
}

uint64_t __46__MFNetworkController_copyCarrierBundleValue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 userDataPreferred];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (id)addNetworkObserverBlock:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_MFNetworkObserver alloc] initWithBlock:v7 queue:v6];

  [(NSLock *)self->_lock lock];
  observers = self->_observers;
  if (!observers)
  {
    id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = self->_observers;
    self->_observers = v10;

    observers = self->_observers;
  }
  [(NSMutableArray *)observers addObject:v8];
  [(NSLock *)self->_lock unlock];
  return v8;
}

- (void)removeNetworkObserver:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  [(NSMutableArray *)self->_observers removeObject:v5];

  id v6 = self->_lock;
  [(NSLock *)v6 unlock];
}

- (EFObservable)networkObservable
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__MFNetworkController_networkObservable__block_invoke;
  v4[3] = &unk_1E6867660;
  v4[4] = self;
  id v2 = [MEMORY[0x1E4F60DD8] observableWithBlock:v4];
  return (EFObservable *)v2;
}

id __40__MFNetworkController_networkObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v5 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40__MFNetworkController_networkObservable__block_invoke_2;
  v18[3] = &unk_1E6867610;
  objc_copyWeak(&v21, &location);
  id v6 = v3;
  id v19 = v6;
  id v7 = v4;
  id v20 = v7;
  uint64_t v8 = MEMORY[0x1E4F14428];
  id v9 = MEMORY[0x1E4F14428];
  id v10 = [v5 addNetworkObserverBlock:v18 queue:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__MFNetworkController_networkObservable__block_invoke_3;
  v15[3] = &unk_1E6867638;
  objc_copyWeak(&v17, &location);
  id v11 = v10;
  id v16 = v11;
  [v7 addCancelationBlock:v15];
  BOOL v12 = v16;
  id v13 = v7;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v13;
}

uint64_t __40__MFNetworkController_networkObservable__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    [*(id *)(a1 + 32) observerDidReceiveResult:WeakRetained];
  }
  return MEMORY[0x1F41817F8]();
}

void __40__MFNetworkController_networkObservable__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeNetworkObserver:*(void *)(a1 + 32)];
}

- (EFObservable)wifiObservable
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MFNetworkController *)self networkObservable];
  v9[0] = self;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v5 = [v3 startWith:v4];
  id v6 = [v5 map:&__block_literal_global_58];
  id v7 = [v6 distinctUntilChanged];

  return (EFObservable *)v7;
}

uint64_t __37__MFNetworkController_wifiObservable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 isFatPipe];
  return [v2 numberWithBool:v3];
}

- (void)_updateWifiClientType
{
  BOOL v3 = [(NSMutableSet *)self->_backgroundWifiClients count] != 0;
  if (WiFiManagerClientGetType() != v3)
  {
    wifiManager = self->_wifiManager;
    MEMORY[0x1F412FF40](wifiManager, v3);
  }
}

- (void)addBackgroundWifiClient:(id)a3
{
  if (a3)
  {
    lock = self->_lock;
    id v5 = a3;
    [(NSLock *)lock lock];
    [(NSMutableSet *)self->_backgroundWifiClients addObject:v5];

    [(MFNetworkController *)self _updateWifiClientType];
    id v6 = self->_lock;
    [(NSLock *)v6 unlock];
  }
}

- (void)removeBackgroundWifiClient:(id)a3
{
  if (a3)
  {
    lock = self->_lock;
    id v5 = a3;
    [(NSLock *)lock lock];
    [(NSMutableSet *)self->_backgroundWifiClients removeObject:v5];

    [(MFNetworkController *)self _updateWifiClientType];
    id v6 = self->_lock;
    [(NSLock *)v6 unlock];
  }
}

- (void)_carrierBundleDidChange
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MFNetworkController__carrierBundleDidChange__block_invoke;
  block[3] = &unk_1E68675C0;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

void __46__MFNetworkController__carrierBundleDidChange__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MFCarrierBundleChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)connectionActivationError:(id)a3 connection:(int)a4 error:(int)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataStatusQueue);
  id v9 = [v8 userDataPreferred];
  int v10 = [v9 BOOLValue];

  if (!a4 && v10)
  {
    id v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = v8;
      __int16 v14 = 1024;
      int v15 = 0;
      __int16 v16 = 1024;
      int v17 = a5;
      _os_log_impl(&dword_1CFCFE000, v11, OS_LOG_TYPE_DEFAULT, "#Network failed to bring up data context (context: %@, connection: %u, error: %d", (uint8_t *)&v12, 0x18u);
    }
  }
}

- (void)preferredDataSimChanged:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataStatusQueue);
  [(MFNetworkController *)self _carrierBundleDidChange];
  id v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = [v4 slotID];
    _os_log_impl(&dword_1CFCFE000, v5, OS_LOG_TYPE_DEFAULT, "#Network preferred data sim was changed to slot %lu", (uint8_t *)&v6, 0xCu);
  }
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  id v9 = a4;
  dataStatusQueue = self->_dataStatusQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(dataStatusQueue);
  uint64_t v8 = [v7 userDataPreferred];

  LODWORD(v7) = [v8 BOOLValue];
  if (v7) {
    [(MFNetworkController *)self _setDataStatus_nts:v9];
  }
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([a4 isEqualToString:*MEMORY[0x1E4F24210]])
  {
    id v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = [v6 slotID];
      _os_log_impl(&dword_1CFCFE000, v7, OS_LOG_TYPE_DEFAULT, "#Network SIM is now ready (slot %lu)", (uint8_t *)&v8, 0xCu);
    }

    [(MFNetworkController *)self _carrierBundleDidChange];
  }
}

- (void)_updateActiveCalls
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  dispatch_time_t v3 = [(CXCallObserver *)self->_callObserver calls];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) hasEnded] ^ 1;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  uint64_t v9 = MFLogGeneral();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)SCPreferencesContext buf = 67109120;
    int v15 = v6;
    _os_log_impl(&dword_1CFCFE000, v9, OS_LOG_TYPE_DEFAULT, "#Network %d active calls", buf, 8u);
  }

  self->_activeCalls = v6;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataStatusQueue);
  [(MFNetworkController *)self _updateActiveCalls];
}

- (id)copyDiagnosticInformation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(NSLock *)self->_lock lock];
  [v3 appendString:@"\n==== Network Controller State ====\n"];
  objc_msgSend(v3, "appendFormat:", @"    reachability flags: 0x%02x\n", self->_flags);
  if (self->_dns) {
    uint64_t v4 = "YES";
  }
  else {
    uint64_t v4 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"    has DNS: %s\n", v4);
  if (self->_isWiFiEnabled) {
    uint64_t v5 = "YES";
  }
  else {
    uint64_t v5 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"    wifi enabled: %s\n", v5);
  if (self->_cellularDataAvailable) {
    unint64_t v6 = "YES";
  }
  else {
    unint64_t v6 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"    has cell data: %s\n", v6);
  uint64_t dataIndicator = self->_dataIndicator;
  if (dataIndicator > 0xC) {
    int v8 = @"Unknown";
  }
  else {
    int v8 = off_1E68676A0[dataIndicator];
  }
  [v3 appendFormat:@"    data status indicator: %@\n", v8];
  if (self->_isRoamingAllowed) {
    uint64_t v9 = "YES";
  }
  else {
    uint64_t v9 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"    roaming allowed: %s\n", v9);
  objc_msgSend(v3, "appendFormat:", @"    calls: %lu\n", self->_activeCalls);
  objc_msgSend(v3, "appendFormat:", @"    background wifi clients: %lu\n", -[NSMutableSet count](self->_backgroundWifiClients, "count"));
  objc_msgSend(v3, "appendFormat:", @"    core telephony client: %p\n", self->_ctc);
  [(NSLock *)self->_lock unlock];
  [(MFNetworkController *)self _initializeDataStatus];
  [v3 appendFormat:@"    cellular data plans:\n"];
  long long v10 = [(CoreTelephonyClient *)self->_ctc getSubscriptionInfoWithError:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v11 = [v10 subscriptions];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        [v3 appendFormat:@"        %@\n", *(void *)(*((void *)&v17 + 1) + 8 * v15++)];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  return v3;
}

- (void)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(void *)a3
{
  self->_wifiManager = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_dataStatusQueue, 0);
  objc_storeStrong((id *)&self->_ctc, 0);
  objc_storeStrong((id *)&self->_prefsQueue, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_backgroundWifiClients, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __44__MFNetworkController__initializeDataStatus__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFCFE000, log, OS_LOG_TYPE_ERROR, "#Network failed to find data-preferred context", v1, 2u);
}

void __44__MFNetworkController__initializeDataStatus__block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1CFCFE000, log, OS_LOG_TYPE_ERROR, "#Network failed to get data status for context %@ with error: %@", (uint8_t *)&v3, 0x16u);
}

- (void)_networkAssertionWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFCFE000, log, OS_LOG_TYPE_ERROR, "#Network failed to aquire network assertion", v1, 2u);
}

- (void)copyCarrierBundleValue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1CFCFE000, a2, OS_LOG_TYPE_ERROR, "#Network copyCarrierBundleValue returned error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)copyCarrierBundleValue:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1CFCFE000, a2, OS_LOG_TYPE_ERROR, "#Network could not get subscription info: %@", (uint8_t *)&v2, 0xCu);
}

@end