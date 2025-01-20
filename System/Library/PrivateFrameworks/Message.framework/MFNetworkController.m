@interface MFNetworkController
+ (MFNetworkController)sharedInstance;
+ (id)addNetworkObserverBlock:(id)a3 queue:(id)a4;
+ (id)networkAssertionWithIdentifier:(id)a3;
+ (id)observers;
+ (id)signpostLog;
+ (void)performExecuteOnObservers;
+ (void)removeNetworkObserver:(id)a3;
- (BOOL)_isNetworkUp_nts;
- (BOOL)_simulationOverrideForType:(unint64_t)a3 actualValue:(BOOL)a4;
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
- (id)copyCarrierBundleValue:(id)a3;
- (int)dataIndicator;
- (int64_t)dataStatus;
- (int64_t)transportType;
- (unint64_t)signpostID;
- (void)_carrierBundleDidChange;
- (void)_checkKeys:(id)a3 forStore:(__SCDynamicStore *)a4;
- (void)_handleWiFiNotification:(unsigned int)a3;
- (void)_initializeDataStatus;
- (void)_registerStateCaptureHandler;
- (void)_resetDataStatusInitialized;
- (void)_setDataStatus_nts:(id)a3;
- (void)_setFlags:(unsigned int)a3 forReachability:(__SCNetworkReachability *)a4;
- (void)_setupSymptoms;
- (void)_updateActiveCalls;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)connectionActivationError:(id)a3 connection:(int)a4 error:(int)a5;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)dealloc;
- (void)preferredDataSimChanged:(id)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
@end

@implementation MFNetworkController

uint64_t __53__MFNetworkController_addNetworkObserverBlock_queue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (BOOL)_simulationOverrideForType:(unint64_t)a3 actualValue:(BOOL)a4
{
  v6 = (void *)CFPreferencesCopyValue(@"MFNetworkSimulationBitfieldKey", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  uint64_t v7 = [v6 unsignedIntegerValue];
  if (v7) {
    a4 = (v7 & a3) != 0;
  }

  return a4;
}

+ (MFNetworkController)sharedInstance
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
  return (MFNetworkController *)v2;
}

void __32__MFNetworkController_observers__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F60DA0]);
  id v3 = (id)objc_opt_new();
  uint64_t v1 = objc_msgSend(v0, "initWithObject:");
  v2 = (void *)observers_observers;
  observers_observers = v1;
}

uint64_t __44__MFNetworkController__initializeDataStatus__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 userDataPreferred];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

uint64_t __37__MFNetworkController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v1;

  id v3 = +[MFNetworkController addNetworkObserverBlock:&__block_literal_global_51 queue:MEMORY[0x1E4F14428]];
  v4 = (void *)sharedInstance__sharedInstance;
  return [v4 _registerStateCaptureHandler];
}

- (MFNetworkController)init
{
  v42.receiver = self;
  v42.super_class = (Class)MFNetworkController;
  v2 = [(MFNetworkController *)&v42 init];
  id v3 = v2;
  if (!v2) {
    return v3;
  }
  v2->_dataStatusInitializerLock._os_unfair_lock_opaque = 0;
  v4 = +[MFNetworkController signpostLog];
  v5 = +[MFNetworkController signpostLog];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v7 = v4;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf.version) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MFNetworkControllerInit", "", (uint8_t *)&buf, 2u);
  }

  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"com.apple.message.mfnetworkcontroller" andDelegate:v3];
  lock = v3->_lock;
  v3->_lock = (MFLock *)v9;

  v3->_hasCellDataCapability = MGGetBoolAnswer();
  v3->_hasWiFiCapability = MGGetBoolAnswer();
  CFRunLoopRef Main = CFRunLoopGetMain();
  v3->_rl = Main;
  CFRetain(Main);
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v13 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &init_sa);
  v3->_reachability = v13;
  SCNetworkReachabilityGetFlags(v13, &v3->_flags);
  buf.version = 0;
  buf.info = v3;
  buf.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
  buf.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
  buf.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x1E4F1C220];
  SCNetworkReachabilitySetCallback(v3->_reachability, (SCNetworkReachabilityCallBack)_NetworkReachabilityCallBack, &buf);
  CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F1D410];
  SCNetworkReachabilityScheduleWithRunLoop(v3->_reachability, v3->_rl, (CFStringRef)*MEMORY[0x1E4F1D410]);
  context.version = 0;
  context.info = v3;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
  context.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x1E4F1C220];
  SCDynamicStoreRef v15 = SCDynamicStoreCreate(v12, @"com.apple.message.mfnetworkcontroller", (SCDynamicStoreCallBack)_DynamicStoreCallBack, &context);
  v3->_store = v15;
  if (v15)
  {
    v38.version = 0xAAAAAAAAAAAAAAAALL;
    v38.version = (CFIndex)SCDynamicStoreKeyCreateNetworkGlobalEntity(v12, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41B08]);
    CFArrayRef v16 = (const __CFArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:&v38 count:1];
    [(MFNetworkController *)v3 _checkKeys:v16 forStore:v3->_store];
    SCDynamicStoreSetNotificationKeys(v3->_store, v16, 0);
    RunLoopSource = SCDynamicStoreCreateRunLoopSource(v12, v3->_store, 0);
    v3->_store_source = RunLoopSource;
    if (RunLoopSource)
    {
      CFRunLoopAddSource(v3->_rl, RunLoopSource, v14);
    }
    else
    {
      v19 = MFLogGeneral();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_DEFAULT, "#Warning #Network SCDynamicStoreCreateRunLoopSource failed - returned NULL.", v39, 2u);
      }
    }
  }
  else
  {
    v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v38.version) = 0;
      _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "#Warning #Network Could not create SCDynamicStore", (uint8_t *)&v38, 2u);
    }
  }
  if (v3->_hasWiFiCapability)
  {
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle && (CFStringRef Identifier = CFBundleGetIdentifier(MainBundle), (v22 = Identifier) != 0))
    {
      CFRetain(Identifier);
    }
    else
    {
      v23 = getprogname();
      uint64_t v24 = getpid();
      CFStringRef v22 = CFStringCreateWithFormat(v12, 0, @"%s (%d)", v23, v24);
      if (!v22) {
        goto LABEL_21;
      }
    }
    v25 = SCPreferencesCreate(v12, v22, @"com.apple.wifi.plist");
    v3->_wiFiPreferences = v25;
    v38.version = 0;
    memset(&v38.retain, 0, 24);
    v38.info = v3;
    SCPreferencesSetCallback(v25, (SCPreferencesCallBack)_WiFiCallBack, &v38);
    SCPreferencesScheduleWithRunLoop(v3->_wiFiPreferences, v3->_rl, v14);
    v3->_isWiFiEnabled = _IsWiFiEnabled(v3->_wiFiPreferences);
    CFRelease(v22);
  }
LABEL_21:
  dispatch_queue_t v26 = dispatch_queue_create("com.apple.message.MFNetworkController.dataStatus", 0);
  dataStatusQueue = v3->_dataStatusQueue;
  v3->_dataStatusQueue = (OS_dispatch_queue *)v26;

  uint64_t v28 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v3->_dataStatusQueue];
  ctc = v3->_ctc;
  v3->_ctc = (CoreTelephonyClient *)v28;

  [(CoreTelephonyClient *)v3->_ctc setDelegate:v3];
  [(MFNetworkController *)v3 _setupSymptoms];
  dispatch_queue_t v30 = dispatch_queue_create("com.apple.mail.radioPreferences", 0);
  prefsQueue = v3->_prefsQueue;
  v3->_prefsQueue = (OS_dispatch_queue *)v30;

  uint64_t v32 = [objc_alloc(MEMORY[0x1E4F4BE78]) initWithQueue:v3->_prefsQueue];
  radiosPreferences = v3->_radiosPreferences;
  v3->_radiosPreferences = (RadiosPreferences *)v32;

  [(RadiosPreferences *)v3->_radiosPreferences setDelegate:v3];
  v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v34 addObserver:v3 selector:sel__resetDataStatusInitialized name:@"UIApplicationWillEnterForegroundNotification" object:0];

  v35 = v8;
  v36 = v35;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    LOWORD(v38.version) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v36, OS_SIGNPOST_INTERVAL_END, v6, "MFNetworkControllerInit", "", (uint8_t *)&v38, 2u);
  }

  return v3;
}

+ (id)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MFNetworkController_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_0 != -1) {
    dispatch_once(&signpostLog_onceToken_0, block);
  }
  v2 = (void *)signpostLog_log_0;
  return v2;
}

- (void)_setupSymptoms
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__MFNetworkController__setupSymptoms__block_invoke;
  aBlock[3] = &unk_1E5D40378;
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  p_symptomsToken = &self->_symptomsToken;
  if (notify_register_dispatch("com.apple.symptoms.hasAlternateAdvice", p_symptomsToken, MEMORY[0x1E4F14428], v3)) {
    int *p_symptomsToken = -1;
  }
}

+ (void)performExecuteOnObservers
{
  id v2 = [a1 observers];
  [v2 performWhileLocked:&__block_literal_global_23_1];
}

+ (id)addNetworkObserverBlock:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[_MFNetworkObserver alloc] initWithBlock:v6 queue:v7];
  uint64_t v9 = [a1 observers];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__MFNetworkController_addNetworkObserverBlock_queue___block_invoke;
  v12[3] = &unk_1E5D403A0;
  v10 = v8;
  v13 = v10;
  [v9 performWhileLocked:v12];

  return v10;
}

+ (id)observers
{
  if (observers_onceToken != -1) {
    dispatch_once(&observers_onceToken, &__block_literal_global_18);
  }
  id v2 = (void *)observers_observers;
  return v2;
}

- (BOOL)isFatPipe
{
  [(MFLock *)self->_lock lock];
  if ([(MFNetworkController *)self _isNetworkUp_nts]) {
    BOOL v3 = (self->_flags & 0x40000) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  [(MFLock *)self->_lock unlock];
  return [(MFNetworkController *)self _simulationOverrideForType:4 actualValue:v3];
}

- (void)_checkKeys:(id)a3 forStore:(__SCDynamicStore *)a4
{
  id v10 = a3;
  [(MFLock *)self->_lock lock];
  if (self->_store == a4)
  {
    BOOL v6 = [(MFNetworkController *)self _isNetworkUp_nts];
    self->_hasDNS = 0;
    if ([v10 count])
    {
      id v7 = [v10 objectAtIndexedSubscript:0];
      v8 = (void *)SCDynamicStoreCopyValue(a4, v7);

      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = [v8 objectForKey:*MEMORY[0x1E4F41BC0]];
          self->_hasDNS = [v9 count] != 0;
        }
      }
    }
    if (v6 != [(MFNetworkController *)self _isNetworkUp_nts]) {
      +[MFNetworkController performExecuteOnObservers];
    }
  }
  [(MFLock *)self->_lock unlock];
}

- (int64_t)dataStatus
{
  [(MFNetworkController *)self _initializeDataStatus];
  [(MFLock *)self->_lock lock];
  if ([(MFNetworkController *)self _isNetworkUp_nts])
  {
    if (self->_hasWiFiCapability && (self->_flags & 0x40000) == 0) {
      goto LABEL_14;
    }
    int64_t v3 = 6;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    prefsQueue = self->_prefsQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__MFNetworkController_dataStatus__block_invoke;
    v7[3] = &unk_1E5D3DAE8;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(prefsQueue, v7);
    if (*((unsigned char *)v9 + 24))
    {
      char v5 = 0;
      int64_t v3 = 1;
    }
    else if (!self->_hasWiFiCapability || self->_hasCellDataCapability || self->_isWiFiEnabled)
    {
      char v5 = 1;
      int64_t v3 = 6;
    }
    else
    {
      char v5 = 0;
      int64_t v3 = 3;
    }
    _Block_object_dispose(&v8, 8);
    if ((v5 & 1) == 0) {
      goto LABEL_15;
    }
  }
  if (self->_hasCellDataCapability)
  {
    if (self->_cellularDataAvailable)
    {
LABEL_14:
      int64_t v3 = 0;
      goto LABEL_15;
    }
    if (CTCellularDataPlanGetIsEnabled())
    {
      if (self->_isRoamingAllowed)
      {
        if (self->_activeCalls) {
          int64_t v3 = 5;
        }
      }
      else
      {
        int64_t v3 = 4;
      }
    }
    else
    {
      int64_t v3 = 2;
    }
  }
LABEL_15:
  [(MFLock *)self->_lock unlock];
  return v3;
}

- (BOOL)_isNetworkUp_nts
{
  return (self->_flags & 6) == 2 && self->_hasDNS;
}

- (void)_initializeDataStatus
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "#Network failed to get data status for context %@ with error: %@", (uint8_t *)&v3, 0x16u);
}

- (void)_setDataStatus_nts:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "#Network setting data status: %@", (uint8_t *)&v7, 0xCu);
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

- (void)_updateActiveCalls
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v3 = [(CXCallObserver *)self->_callObserver calls];
  unint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 += [*(id *)(*((void *)&v9 + 1) + 8 * v7++) hasEnded] ^ 1;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v5);
  }

  id v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)SCNetworkReachabilityContext buf = 67109120;
    int v14 = v4;
    _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "#Network %d active calls", buf, 8u);
  }

  self->_activeCalls = v4;
}

uint64_t __48__MFNetworkController_performExecuteOnObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 makeObjectsPerformSelector:sel_execute];
}

void __34__MFNetworkController_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  id v2 = (void *)signpostLog_log_0;
  signpostLog_log_0 = (uint64_t)v1;
}

- (void)_resetDataStatusInitialized
{
  p_dataStatusInitializerLock = &self->_dataStatusInitializerLock;
  os_unfair_lock_lock(&self->_dataStatusInitializerLock);
  self->_dataStatusInitialized = 0;
  os_unfair_lock_unlock(p_dataStatusInitializerLock);
}

- (void)_registerStateCaptureHandler
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v6, &location);
  EFLogRegisterStateCaptureBlock();
  unint64_t v4 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
  stateCancelable = self->_stateCancelable;
  self->_stateCancelable = v4;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

void __37__MFNetworkController_sharedInstance__block_invoke_2()
{
  id v0 = (void *)MEMORY[0x1AD0E3E00]();
  os_log_t v1 = [MEMORY[0x1E4F28EA0] notificationWithName:@"NetworkConfigurationDidChangeNotification" object:sharedInstance__sharedInstance];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotification:v1];
}

void __37__MFNetworkController__setupSymptoms__block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  if (state64 == 1)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"NetworkSymptomsHasAlternativeAdvice" object:*(void *)(a1 + 32)];
  }
}

- (void)dealloc
{
  [(EFCancelable *)self->_stateCancelable cancel];
  wiFiPreferences = self->_wiFiPreferences;
  if (wiFiPreferences)
  {
    SCPreferencesSetCallback(wiFiPreferences, 0, 0);
    os_signpost_id_t v4 = self->_wiFiPreferences;
    CFRunLoopRef Main = CFRunLoopGetMain();
    SCPreferencesUnscheduleFromRunLoop(v4, Main, (CFStringRef)*MEMORY[0x1E4F1D410]);
    CFRelease(self->_wiFiPreferences);
    self->_wiFiPreferences = 0;
  }
  if (self->_store)
  {
    uint64_t v7 = "NULL == _store";
    int v8 = 396;
    goto LABEL_10;
  }
  if (self->_reachability)
  {
    uint64_t v7 = "NULL == _reachability";
    int v8 = 397;
LABEL_10:
    __assert_rtn("-[MFNetworkController dealloc]", "MFNetworkController.m", v8, v7);
  }
  int symptomsToken = self->_symptomsToken;
  if (symptomsToken != -1) {
    notify_cancel(symptomsToken);
  }
  v9.receiver = self;
  v9.super_class = (Class)MFNetworkController;
  [(MFNetworkController *)&v9 dealloc];
}

uint64_t __33__MFNetworkController_dataStatus__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 96) airplaneMode];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isDataAvailable
{
  BOOL v3 = [(MFNetworkController *)self dataStatus] == 0;
  return [(MFNetworkController *)self _simulationOverrideForType:1 actualValue:v3];
}

- (BOOL)isNetworkUp
{
  [(MFLock *)self->_lock lock];
  BOOL v3 = [(MFNetworkController *)self _isNetworkUp_nts];
  [(MFLock *)self->_lock unlock];
  return [(MFNetworkController *)self _simulationOverrideForType:2 actualValue:v3];
}

- (BOOL)isOnWWAN
{
  [(MFLock *)self->_lock lock];
  if ([(MFNetworkController *)self _isNetworkUp_nts]) {
    uint64_t v3 = (BYTE2(self->_flags) >> 2) & 1;
  }
  else {
    uint64_t v3 = 0;
  }
  [(MFLock *)self->_lock unlock];
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

- (int64_t)transportType
{
  if (![(MFNetworkController *)self isNetworkUp]) {
    return 0;
  }
  if ([(MFNetworkController *)self isFatPipe]) {
    return 2;
  }
  if ([(MFNetworkController *)self isOnWWAN]
    && (int v4 = [(MFNetworkController *)self dataIndicator] - 1, v4 <= 0xE))
  {
    return qword_1A8AC65D8[v4];
  }
  else
  {
    return 0;
  }
}

- (void)_setFlags:(unsigned int)a3 forReachability:(__SCNetworkReachability *)a4
{
  [(MFLock *)self->_lock lock];
  if (self->_reachability == a4)
  {
    BOOL v7 = [(MFNetworkController *)self _isNetworkUp_nts];
    unsigned int v8 = self->_flags ^ a3;
    self->_flags = a3;
    if ((v8 & 0x40000) != 0 || v7 != [(MFNetworkController *)self _isNetworkUp_nts]) {
      +[MFNetworkController performExecuteOnObservers];
    }
  }
  lock = self->_lock;
  [(MFLock *)lock unlock];
}

- (void)_handleWiFiNotification:(unsigned int)a3
{
  if (a3)
  {
    [(MFLock *)self->_lock lock];
    self->_isWiFiEnabled = _IsWiFiEnabled(self->_wiFiPreferences);
    lock = self->_lock;
    [(MFLock *)lock unlock];
  }
}

- (id)_networkAssertionWithIdentifier:(id)a3
{
  id v3 = a3;
  int v4 = (const void *)_CTServerConnectionCreateWithIdentifier();
  if (v4)
  {
    _CTServerConnectionAddToRunLoop();
    if ((unint64_t)_CTServerConnectionPacketContextAssertionCreate() >> 32)
    {
      uint64_t v5 = MFLogGeneral();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[MFNetworkController _networkAssertionWithIdentifier:](v5);
      }
    }
    CFRelease(v4);
  }
  id v6 = 0;

  return v6;
}

+ (id)networkAssertionWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 sharedInstance];
  id v6 = [v5 _networkAssertionWithIdentifier:v4];

  return v6;
}

- (id)copyCarrierBundleValue:(id)a3
{
  id v4 = a3;
  ctc = self->_ctc;
  id v17 = 0;
  id v6 = [(CoreTelephonyClient *)ctc getSubscriptionInfoWithError:&v17];
  id v7 = v17;
  if (v7)
  {
    id v8 = v7;
    objc_super v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MFNetworkController copyCarrierBundleValue:]((uint64_t)v8, v9);
    }
    goto LABEL_4;
  }
  long long v11 = [v6 subscriptions];
  objc_super v9 = objc_msgSend(v11, "ef_firstObjectPassingTest:", &__block_literal_global_59_0);

  if (!v9)
  {
    id v8 = 0;
LABEL_4:
    long long v10 = 0;
    goto LABEL_11;
  }
  long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:1];
  v13 = self->_ctc;
  id v16 = 0;
  long long v10 = (void *)[(CoreTelephonyClient *)v13 copyCarrierBundleValue:v9 key:v4 bundleType:v12 error:&v16];
  id v8 = v16;
  if (v8)
  {
    int v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MFNetworkController copyCarrierBundleValue:]((uint64_t)v8, v14);
    }
  }
LABEL_11:

  return v10;
}

uint64_t __46__MFNetworkController_copyCarrierBundleValue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 userDataPreferred];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

+ (void)removeNetworkObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 observers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__MFNetworkController_removeNetworkObserver___block_invoke;
  v7[3] = &unk_1E5D403A0;
  id v6 = v4;
  id v8 = v6;
  [v5 performWhileLocked:v7];
}

uint64_t __45__MFNetworkController_removeNetworkObserver___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (EFObservable)networkObservable
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__MFNetworkController_networkObservable__block_invoke;
  v4[3] = &unk_1E5D403F0;
  v4[4] = self;
  id v2 = [MEMORY[0x1E4F60DD8] observableWithBlock:v4];
  return (EFObservable *)v2;
}

id __40__MFNetworkController_networkObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40__MFNetworkController_networkObservable__block_invoke_2;
  v14[3] = &unk_1E5D403C8;
  objc_copyWeak(&v17, &location);
  id v5 = v3;
  id v15 = v5;
  id v6 = v4;
  id v16 = v6;
  id v7 = +[MFNetworkController addNetworkObserverBlock:v14 queue:MEMORY[0x1E4F14428]];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__MFNetworkController_networkObservable__block_invoke_3;
  v12[3] = &unk_1E5D3B5C0;
  v13 = v7;
  id v8 = v7;
  [v6 addCancelationBlock:v12];
  objc_super v9 = v13;
  id v10 = v6;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v10;
}

void __40__MFNetworkController_networkObservable__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    [*(id *)(a1 + 32) observerDidReceiveResult:WeakRetained];
  }
}

uint64_t __40__MFNetworkController_networkObservable__block_invoke_3(uint64_t a1)
{
  return +[MFNetworkController removeNetworkObserver:*(void *)(a1 + 32)];
}

- (EFObservable)wifiObservable
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MFNetworkController *)self networkObservable];
  v9[0] = self;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v5 = [v3 startWith:v4];
  id v6 = [v5 map:&__block_literal_global_67];
  id v7 = [v6 distinctUntilChanged];

  return (EFObservable *)v7;
}

id __37__MFNetworkController_wifiObservable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v2, "isFatPipe"));

  return v3;
}

- (void)_carrierBundleDidChange
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MFNetworkController__carrierBundleDidChange__block_invoke;
  block[3] = &unk_1E5D3B5C0;
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataStatusQueue);
  objc_super v9 = [v8 userDataPreferred];
  char v10 = [v9 BOOLValue];

  char v11 = v10 ^ 1;
  if (a4) {
    char v11 = 1;
  }
  if ((v11 & 1) == 0)
  {
    long long v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412802;
      id v14 = v8;
      __int16 v15 = 1024;
      int v16 = 0;
      __int16 v17 = 1024;
      int v18 = a5;
      _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, "#Network failed to bring up data context (context: %@, connection: %u, error: %d", (uint8_t *)&v13, 0x18u);
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
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "#Network preferred data sim was changed to slot %lu", (uint8_t *)&v6, 0xCu);
  }
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataStatusQueue);
  uint64_t v7 = [v9 userDataPreferred];
  int v8 = [v7 BOOLValue];

  if (v8) {
    [(MFNetworkController *)self _setDataStatus_nts:v6];
  }
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:*MEMORY[0x1E4F24210]])
  {
    int v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      uint64_t v10 = [v6 slotID];
      _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "#Network SIM is now ready (slot %lu)", (uint8_t *)&v9, 0xCu);
    }

    [(MFNetworkController *)self _carrierBundleDidChange];
  }
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataStatusQueue);
  [(MFNetworkController *)self _updateActiveCalls];
}

id __51__MFNetworkController__registerStateCaptureHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  dispatch_time_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(WeakRetained, "dataStatus"));
  [v2 setObject:v3 forKeyedSubscript:@"Data Status"];

  [WeakRetained[6] lock];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"0x%02x", *((unsigned int *)WeakRetained + 16));
  [v2 setObject:v4 forKeyedSubscript:@"Reachability Flags"];

  if (*((unsigned char *)WeakRetained + 68)) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  [v2 setObject:v5 forKeyedSubscript:@"DNS"];
  if (*((unsigned char *)WeakRetained + 90)) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  [v2 setObject:v6 forKeyedSubscript:@"WiFi Enabled"];
  if (*((unsigned char *)WeakRetained + 136)) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  [v2 setObject:v7 forKeyedSubscript:@"Cell Data"];
  uint64_t v8 = *((int *)WeakRetained + 37);
  if (v8 > 0xC) {
    int v9 = @"Unknown";
  }
  else {
    int v9 = off_1E5D40458[v8];
  }
  [v2 setObject:v9 forKeyedSubscript:@"Data Status Indicator"];
  if (*((unsigned char *)WeakRetained + 91)) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  [v2 setObject:v10 forKeyedSubscript:@"Roaming Allowed"];
  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:WeakRetained[9]];
  [v2 setObject:v11 forKeyedSubscript:@"Active Calls"];

  long long v12 = objc_msgSend(NSString, "stringWithFormat:", @"%p", WeakRetained[15]);
  [v2 setObject:v12 forKeyedSubscript:@"Core Telephony Client"];

  [WeakRetained[6] unlock];
  return v2;
}

- (int)dataIndicator
{
  return self->_dataIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStatusQueue, 0);
  objc_storeStrong((id *)&self->_ctc, 0);
  objc_storeStrong((id *)&self->_prefsQueue, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_stateCancelable, 0);
}

- (void)_networkAssertionWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "#Network failed to aquire network assertion", v1, 2u);
}

- (void)copyCarrierBundleValue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "#Network copyCarrierBundleValue returned error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)copyCarrierBundleValue:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "#Network could not get subscription info: %@", (uint8_t *)&v2, 0xCu);
}

@end