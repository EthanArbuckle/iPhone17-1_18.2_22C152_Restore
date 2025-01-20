@interface ISNetworkObserver
+ (BOOL)isLikelyToReachRemoteServerWithReachabilityFlags:(unsigned int)a3;
+ (id)sharedInstance;
- (BOOL)_ntsIsUsingNetwork;
- (BOOL)isUsingNetwork;
- (BOOL)isWiFiEnabled;
- (BOOL)shouldShowCellularAutomaticDownloadsSwitch;
- (ISNetworkObserver)init;
- (NSString)connectionTypeHeader;
- (NSString)dataStatusIndicator;
- (NSString)mobileSubscriberCountryCode;
- (NSString)mobileSubscriberNetworkCode;
- (NSString)modemRegistrationStatus;
- (NSString)operatorName;
- (NSString)phoneNumber;
- (NSString)providerName;
- (double)lastNetworkTypeChangeTime;
- (id)_dataStatusIndicator;
- (id)copyValueForCarrierBundleKey:(id)a3;
- (int64_t)_networkTypeForReachabilityFlags:(unsigned int)a3;
- (int64_t)_networkTypeFromDataIndicator:(id)a3;
- (int64_t)_setNetworkType:(int64_t)a3;
- (int64_t)networkType;
- (unsigned)_currentNetworkReachabilityFlags;
- (unsigned)networkReachabilityFlags;
- (void)_applicationForegroundNotification:(id)a3;
- (void)_copyConnectionDataStatus:(id)a3;
- (void)_handleTelephonyNotificationWithName:(__CFString *)a3 userInfo:(__CFDictionary *)a4;
- (void)_postReachabilityFlagsChangedNotificationFromValue:(unsigned int)a3 toValue:(unsigned int)a4;
- (void)_postTypeChangedNotificationFromValue:(int64_t)a3 toValue:(int64_t)a4;
- (void)_postUsageChangedToValue:(BOOL)a3;
- (void)_reloadCellularRestriction;
- (void)_reloadDataStatusIndicator;
- (void)_reloadNetworkType;
- (void)_reloadNetworkTypeWithReachabilityFlags:(unsigned int)a3;
- (void)_telephonyOperatorNameDidChangeNotification:(id)a3;
- (void)_telephonyRegistrationDidChangeNotification:(id)a3;
- (void)beginObservingDownloadQueue:(id)a3;
- (void)beginUsingNetwork;
- (void)dealloc;
- (void)downloadQueueNetworkUsageChanged:(id)a3;
- (void)endObservingDownloadQueue:(id)a3;
- (void)endUsingNetwork;
- (void)reloadNetworkType;
- (void)setNetworkType:(int64_t)a3;
@end

@implementation ISNetworkObserver

uint64_t __32__ISNetworkObserver_networkType__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 56);
  return result;
}

id __35__ISNetworkObserver_sharedInstance__block_invoke()
{
  id result = objc_alloc_init((Class)objc_opt_class());
  sharedInstance_sObserver = (uint64_t)result;
  return result;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__ISNetworkObserver_sharedInstance__block_invoke;
  block[3] = &unk_264260FB0;
  block[4] = a1;
  if (sharedInstance_sOnce != -1) {
    dispatch_once(&sharedInstance_sOnce, block);
  }
  return (id)sharedInstance_sObserver;
}

- (int64_t)networkType
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__ISNetworkObserver_networkType__block_invoke;
  v5[3] = &unk_264261000;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (ISNetworkObserver)init
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  __ISRecordSPIClassUsage(self);
  v16.receiver = self;
  v16.super_class = (Class)ISNetworkObserver;
  id v3 = [(ISNetworkObserver *)&v16 init];
  if (v3)
  {
    *((void *)v3 + 2) = dispatch_queue_create("com.apple.itunesstore.ISNetworkObserver", 0);
    *((void *)v3 + 8) = dispatch_queue_create("com.apple.itunesstore.ISNetworkObserver.notifications", 0);
    *((unsigned char *)v3 + 24) = 1;
    *((CFAbsoluteTime *)v3 + 4) = CFAbsoluteTimeGetCurrent();
    uint64_t v12 = 0;
    long long v14 = 0u;
    uint64_t v15 = 0;
    id v13 = v3;
    uint64_t v4 = _CTServerConnectionCreate();
    *((void *)v3 + 11) = v4;
    if (v4)
    {
      _CTServerConnectionSetTargetQueue();
      _CTServerConnectionRegisterForNotification();
    }
    sockaddr address = (sockaddr)xmmword_2160B5650;
    v5 = SCNetworkReachabilityCreateWithAddress(0, &address);
    *((void *)v3 + 10) = v5;
    if (v5)
    {
      context.version = 0;
      context.info = v3;
      context.retain = 0;
      context.release = 0;
      context.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x263EFF380];
      SCNetworkReachabilitySetCallback(v5, (SCNetworkReachabilityCallBack)__ReachabilityCallback, &context);
      SCNetworkReachabilitySetDispatchQueue(*((SCNetworkReachabilityRef *)v3 + 10), *((dispatch_queue_t *)v3 + 2));
    }
    uint64_t v6 = [v3 _currentNetworkReachabilityFlags];
    *((_DWORD *)v3 + 10) = v6;
    *((void *)v3 + 7) = [v3 _networkTypeForReachabilityFlags:v6];
    v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v3 selector:sel__applicationForegroundNotification_ name:@"UIApplicationDidEnterForegroundNotification" object:0];
    [v7 addObserver:v3 selector:sel__applicationForegroundNotification_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
    uint64_t v8 = [MEMORY[0x263F7B3F0] sharedController];
    [v7 addObserver:v3 selector:sel__telephonyOperatorNameDidChangeNotification_ name:*MEMORY[0x263F7BD10] object:v8];
    [v7 addObserver:v3 selector:sel__telephonyRegistrationDidChangeNotification_ name:*MEMORY[0x263F7BD20] object:v8];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__CarrierChangeNotification, (CFStringRef)*MEMORY[0x263F02DA0], 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__CarrierChangeNotification, (CFStringRef)*MEMORY[0x263F02DA8], 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__AutoDownloadsSettingsChangedNotification, (CFStringRef)*MEMORY[0x263F7BDA8], 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__NetworkTypeOverrideChangedNotification, (CFStringRef)*MEMORY[0x263F7BDB8], 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return (ISNetworkObserver *)v3;
}

- (int64_t)_networkTypeForReachabilityFlags:(unsigned int)a3
{
  if ((a3 & 2) != 0)
  {
    uint64_t v6 = (void *)CFPreferencesCopyAppValue(@"SSNetworkTypeOverride", (CFStringRef)*MEMORY[0x263F7BDC8]);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [v6 integerValue];
    }
    else
    {
      if ((a3 & 0x40000) == 0)
      {
        int64_t v3 = 1000;
LABEL_9:

        return v3;
      }
      uint64_t v7 = [(ISNetworkObserver *)self _networkTypeFromDataIndicator:[(ISNetworkObserver *)self _dataStatusIndicator]];
    }
    int64_t v3 = v7;
    goto LABEL_9;
  }
  return 0;
}

- (unsigned)_currentNetworkReachabilityFlags
{
  SCNetworkReachabilityFlags flags = 0;
  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilityGetFlags(reachability, &flags);
    LODWORD(reachability) = flags;
  }
  return reachability;
}

- (void)dealloc
{
  int64_t v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"UIApplicationWillEnterForegroundNotification" object:0];
  uint64_t v4 = [MEMORY[0x263F7B3F0] sharedController];
  [v3 removeObserver:self name:*MEMORY[0x263F7BD10] object:v4];
  [v3 removeObserver:self name:*MEMORY[0x263F7BD20] object:v4];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F02DA0], 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F02DA8], 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F7BDA8], 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F7BDB8], 0);
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  notificationQueue = self->_notificationQueue;
  if (notificationQueue) {
    dispatch_release(notificationQueue);
  }
  [(NSMutableSet *)self->_observedDownloadQueues makeObjectsPerformSelector:sel_removeObserver_ withObject:self];

  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilitySetDispatchQueue(reachability, 0);
    CFRelease(self->_reachability);
    self->_reachability = 0;
  }
  if (self->_telephonyServer)
  {
    _CTServerConnectionUnregisterForNotification();
    CFRelease(self->_telephonyServer);
    self->_telephonyServer = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)ISNetworkObserver;
  [(ISNetworkObserver *)&v9 dealloc];
}

- (void)beginObservingDownloadQueue:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__ISNetworkObserver_beginObservingDownloadQueue___block_invoke;
  v6[3] = &unk_264260FD8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = &v11;
  v6[7] = &v7;
  dispatch_sync(dispatchQueue, v6);
  int v5 = *((unsigned __int8 *)v8 + 24);
  if (*((unsigned __int8 *)v12 + 24) != v5) {
    [(ISNetworkObserver *)self _postUsageChangedToValue:v5 != 0];
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

uint64_t __49__ISNetworkObserver_beginObservingDownloadQueue___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[9])
  {
    *(void *)(*(void *)(a1 + 32) + 72) = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v2 = *(void **)(a1 + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 _ntsIsUsingNetwork];
  [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 32) + 72) addObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) _ntsIsUsingNetwork];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)beginUsingNetwork
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__ISNetworkObserver_beginUsingNetwork__block_invoke;
  v5[3] = &unk_264261000;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  if (*((unsigned char *)v7 + 24)) {
    [(ISNetworkObserver *)self _postUsageChangedToValue:1];
  }
  uint64_t v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x263F7BCD8] object:0];
  _Block_object_dispose(&v6, 8);
}

uint64_t __38__ISNetworkObserver_beginUsingNetwork__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = (*(void *)(*(void *)(result + 32) + 48))++ == 0;
  return result;
}

- (NSString)connectionTypeHeader
{
  int64_t v3 = (void *)[MEMORY[0x263F089D8] string];
  [(ISNetworkObserver *)self networkType];
  uint64_t v4 = SSGetStringForNetworkType();
  if (v4)
  {
    [v3 appendString:v4];
    if (SSNetworkTypeIsCellularType())
    {
      int v5 = [(ISNetworkObserver *)self operatorName];
      if ([(NSString *)v5 length]) {
        [v3 appendFormat:@"/%@", v5];
      }
    }
  }
  return (NSString *)v3;
}

- (id)copyValueForCarrierBundleKey:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  uint64_t v23 = 0;
  uint64_t v4 = dispatch_semaphore_create(0);
  id v5 = objc_alloc_init(MEMORY[0x263F02D30]);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __50__ISNetworkObserver_copyValueForCarrierBundleKey___block_invoke;
  v17[3] = &unk_264261050;
  v17[4] = v5;
  v17[5] = a3;
  v17[6] = v4;
  v17[7] = &v18;
  [v5 getSubscriptionInfo:v17];
  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v4, v6))
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v7) {
      uint64_t v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v8 = [v7 shouldLog];
    int v9 = [v7 shouldLogToDisk];
    char v10 = [v7 OSLogObject];
    if (v9) {
      v8 |= 2u;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      uint64_t v11 = objc_opt_class();
      int v24 = 138543618;
      uint64_t v25 = v11;
      __int16 v26 = 2112;
      id v27 = a3;
      LODWORD(v16) = 22;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v24, v16);
        free(v13);
        SSFileLog();
      }
    }
  }
  dispatch_release(v4);
  char v14 = (void *)[(id)v19[5] copy];
  _Block_object_dispose(&v18, 8);
  return v14;
}

intptr_t __50__ISNetworkObserver_copyValueForCarrierBundleKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int64_t v3 = (void *)[a2 subscriptions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        id v9 = (id)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:1];
        if ([v8 slotID] == 1)
        {
          char v10 = *(void **)(a1 + 32);
          uint64_t v11 = *(void *)(a1 + 40);
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __50__ISNetworkObserver_copyValueForCarrierBundleKey___block_invoke_2;
          v13[3] = &unk_264261028;
          long long v14 = *(_OWORD *)(a1 + 48);
          [v10 copyCarrierBundleValue:v8 key:v11 bundleType:v9 completion:v13];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

intptr_t __50__ISNetworkObserver_copyValueForCarrierBundleKey___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)endObservingDownloadQueue:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__ISNetworkObserver_endObservingDownloadQueue___block_invoke;
  v6[3] = &unk_264261078;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = &v11;
  v6[7] = &v7;
  dispatch_sync(dispatchQueue, v6);
  int v5 = *((unsigned __int8 *)v8 + 24);
  if (*((unsigned __int8 *)v12 + 24) != v5) {
    [(ISNetworkObserver *)self _postUsageChangedToValue:v5 != 0];
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

uint64_t __47__ISNetworkObserver_endObservingDownloadQueue___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _ntsIsUsingNetwork];
  [*(id *)(a1 + 40) removeObserver:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) _ntsIsUsingNetwork];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)endUsingNetwork
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__ISNetworkObserver_endUsingNetwork__block_invoke;
  v5[3] = &unk_2642608E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  if (*((unsigned char *)v7 + 24)) {
    [(ISNetworkObserver *)self _postUsageChangedToValue:0];
  }
  uint64_t v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x263F7BCE0] object:0];
  _Block_object_dispose(&v6, 8);
}

uint64_t __36__ISNetworkObserver_endUsingNetwork__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 48);
  if (v1 >= 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v1 == 1;
    --*(void *)(*(void *)(result + 32) + 48);
  }
  return result;
}

- (BOOL)isUsingNetwork
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__ISNetworkObserver_isUsingNetwork__block_invoke;
  v5[3] = &unk_264261000;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__ISNetworkObserver_isUsingNetwork__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _ntsIsUsingNetwork];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)lastNetworkTypeChangeTime
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  unint64_t v9 = 0xFFEFFFFFFFFFFFFFLL;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__ISNetworkObserver_lastNetworkTypeChangeTime__block_invoke;
  v5[3] = &unk_264261000;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __46__ISNetworkObserver_lastNetworkTypeChangeTime__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 32);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unsigned)networkReachabilityFlags
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__ISNetworkObserver_networkReachabilityFlags__block_invoke;
  v5[3] = &unk_264261000;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__ISNetworkObserver_networkReachabilityFlags__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 40);
  return result;
}

- (BOOL)shouldShowCellularAutomaticDownloadsSwitch
{
  id v2 = [(ISNetworkObserver *)self copyValueForCarrierBundleKey:@"ShowiTunesStoreAutoDownloadOverCellularSwitch"];
  if (v2)
  {
    if (objc_opt_respondsToSelector()) {
      char v3 = [v2 BOOLValue];
    }
    else {
      char v3 = 0;
    }
  }
  else
  {
    char v3 = 1;
  }

  return v3;
}

+ (BOOL)isLikelyToReachRemoteServerWithReachabilityFlags:(unsigned int)a3
{
  return (a3 & 6) == 2;
}

- (NSString)dataStatusIndicator
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__4;
  char v10 = __Block_byref_object_dispose__4;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__ISNetworkObserver_dataStatusIndicator__block_invoke;
  v5[3] = &unk_264261000;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __40__ISNetworkObserver_dataStatusIndicator__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _dataStatusIndicator];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)isWiFiEnabled
{
  id v2 = (void *)[MEMORY[0x263F255C0] sharedNetworkObserver];

  return [v2 isWiFiEnabled];
}

- (NSString)mobileSubscriberCountryCode
{
  id v2 = (void *)[MEMORY[0x263F7B3F0] sharedController];

  return (NSString *)[v2 mobileSubscriberCountryCode];
}

- (NSString)mobileSubscriberNetworkCode
{
  id v2 = (void *)[MEMORY[0x263F7B3F0] sharedController];

  return (NSString *)[v2 mobileSubscriberNetworkCode];
}

- (NSString)modemRegistrationStatus
{
  id v2 = (void *)[MEMORY[0x263F7B3F0] sharedController];

  return (NSString *)[v2 registrationStatus];
}

- (NSString)operatorName
{
  id v2 = (void *)[MEMORY[0x263F7B3F0] sharedController];

  return (NSString *)[v2 operatorName];
}

- (NSString)providerName
{
  id v2 = (void *)[MEMORY[0x263F7B3F0] sharedController];

  return (NSString *)[v2 providerName];
}

- (NSString)phoneNumber
{
  id v2 = (void *)[MEMORY[0x263F7B3F0] sharedController];

  return (NSString *)[v2 phoneNumber];
}

- (void)reloadNetworkType
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ISNetworkObserver_reloadNetworkType__block_invoke;
  block[3] = &unk_264260FB0;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __38__ISNetworkObserver_reloadNetworkType__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadNetworkType];
}

- (void)setNetworkType:(int64_t)a3
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__ISNetworkObserver_setNetworkType___block_invoke;
  block[3] = &unk_2642610A0;
  block[4] = self;
  void block[5] = &v8;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  uint64_t v6 = v9[3];
  if (v6 != a3) {
    [(ISNetworkObserver *)self _postTypeChangedNotificationFromValue:v6 toValue:a3];
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __36__ISNetworkObserver_setNetworkType___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _setNetworkType:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)downloadQueueNetworkUsageChanged:(id)a3
{
  BOOL v5 = [(ISNetworkObserver *)self isUsingNetwork];
  if (v5 == [a3 isUsingNetwork])
  {
    [(ISNetworkObserver *)self _postUsageChangedToValue:v5];
  }
}

- (void)_applicationForegroundNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ISNetworkObserver__applicationForegroundNotification___block_invoke;
  block[3] = &unk_264260FB0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __56__ISNetworkObserver__applicationForegroundNotification___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadDataStatusIndicator];
  id v2 = *(void **)(a1 + 32);

  return [v2 _reloadNetworkType];
}

- (void)_telephonyOperatorNameDidChangeNotification:(id)a3
{
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ISNetworkObserver__telephonyOperatorNameDidChangeNotification___block_invoke;
  block[3] = &unk_264260FB0;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

uint64_t __65__ISNetworkObserver__telephonyOperatorNameDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 postNotificationName:@"ISNetworkObserverOperatorNameChangedNotification" object:v3];
}

- (void)_telephonyRegistrationDidChangeNotification:(id)a3
{
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ISNetworkObserver__telephonyRegistrationDidChangeNotification___block_invoke;
  block[3] = &unk_264260FB0;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

uint64_t __65__ISNetworkObserver__telephonyRegistrationDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 postNotificationName:@"ISNetworkObserverModemRegistrationChanged" object:v3];
}

- (void)_handleTelephonyNotificationWithName:(__CFString *)a3 userInfo:(__CFDictionary *)a4
{
  if (CFEqual(a3, (CFStringRef)*MEMORY[0x263F02F30]))
  {

    self->_dataStatusIndicator = (NSString *)(id)CFDictionaryGetValue(a4, (const void *)*MEMORY[0x263F02EC8]);
    [(ISNetworkObserver *)self _reloadNetworkType];
  }
}

- (void)_copyConnectionDataStatus:(id)a3
{
}

- (id)_dataStatusIndicator
{
  id result = self->_dataStatusIndicator;
  if (!result)
  {
    if (self->_telephonyServer)
    {
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __41__ISNetworkObserver__dataStatusIndicator__block_invoke;
      v4[3] = &unk_2642610C8;
      v4[4] = self;
      [(ISNetworkObserver *)self _copyConnectionDataStatus:v4];
      return self->_dataStatusIndicator;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t __41__ISNetworkObserver__dataStatusIndicator__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(result + 32) + 8) = a2;
  return result;
}

- (int64_t)_networkTypeFromDataIndicator:(id)a3
{
  uint64_t v4 = 0;
  v6[24] = *MEMORY[0x263EF8340];
  v6[0] = *MEMORY[0x263F02ED0];
  v6[1] = 1;
  v6[2] = *MEMORY[0x263F02ED8];
  v6[3] = 1;
  v6[4] = *MEMORY[0x263F02EE0];
  v6[5] = 2;
  v6[6] = *MEMORY[0x263F02EE8];
  v6[7] = 2;
  void v6[8] = *MEMORY[0x263F02EF0];
  v6[9] = 2;
  v6[10] = *MEMORY[0x263F02F28];
  v6[11] = 3;
  v6[12] = *MEMORY[0x263F02EF8];
  v6[13] = 3;
  v6[14] = *MEMORY[0x263F02F00];
  v6[15] = 4;
  v6[16] = *MEMORY[0x263F02F08];
  v6[17] = 5;
  v6[18] = *MEMORY[0x263F02F10];
  v6[19] = 6;
  v6[20] = *MEMORY[0x263F02F18];
  v6[21] = 7;
  v6[22] = *MEMORY[0x263F02F20];
  v6[23] = 8;
  while (![a3 isEqualToString:v6[v4]])
  {
    v4 += 2;
    if (v4 == 24) {
      return 0;
    }
  }
  return v6[v4 + 1];
}

- (BOOL)_ntsIsUsingNetwork
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v2 = self->_networkUsageCount > 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  observedDownloadQueues = self->_observedDownloadQueues;
  uint64_t v4 = [(NSMutableSet *)observedDownloadQueues countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(observedDownloadQueues);
        }
        if (v2) {
          char v2 = 1;
        }
        else {
          char v2 = [*(id *)(*((void *)&v9 + 1) + 8 * i) isUsingNetwork];
        }
      }
      uint64_t v5 = [(NSMutableSet *)observedDownloadQueues countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  return v2;
}

- (void)_postReachabilityFlagsChangedNotificationFromValue:(unsigned int)a3 toValue:(unsigned int)a4
{
  id v7 = objc_alloc(NSDictionary);
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v9 = *MEMORY[0x263F081C8];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a4];
  id v11 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, v9, v10, *MEMORY[0x263F081B8], 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"ISNetworkReachabilityFlagsChangedNotification", self, v11);
}

- (void)_postTypeChangedNotificationFromValue:(int64_t)a3 toValue:(int64_t)a4
{
  id v7 = objc_alloc(NSDictionary);
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v9 = *MEMORY[0x263F081C8];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a4];
  id v11 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, v9, v10, *MEMORY[0x263F081B8], 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"ISNetworkTypeChangedNotification", self, v11);
}

- (void)_postUsageChangedToValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(NSDictionary);
  uint64_t v6 = [NSNumber numberWithBool:v3];
  id v7 = (id)objc_msgSend(v5, "initWithObjectsAndKeys:", v6, *MEMORY[0x263F081B8], 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"ISNetworkUsageStateChangedNotification", self, v7);
}

- (void)_reloadCellularRestriction
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ISNetworkObserver__reloadCellularRestriction__block_invoke;
  block[3] = &unk_264260FB0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __47__ISNetworkObserver__reloadCellularRestriction__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  uint64_t v1 = *(void *)(a1 + 32);
  char v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ISNetworkObserver__reloadCellularRestriction__block_invoke_2;
  block[3] = &unk_264260FB0;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __47__ISNetworkObserver__reloadCellularRestriction__block_invoke_2(uint64_t a1)
{
  char v2 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 postNotificationName:@"ISNetworkObserverCellularRestrictionChangedNotification" object:v3];
}

- (void)_reloadDataStatusIndicator
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __47__ISNetworkObserver__reloadDataStatusIndicator__block_invoke;
  v2[3] = &unk_2642610C8;
  v2[4] = self;
  [(ISNetworkObserver *)self _copyConnectionDataStatus:v2];
}

void __47__ISNetworkObserver__reloadDataStatusIndicator__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {

    *(void *)(*(void *)(a1 + 32) + 8) = a2;
  }
}

- (void)_reloadNetworkType
{
  uint64_t v3 = [(ISNetworkObserver *)self _currentNetworkReachabilityFlags];

  [(ISNetworkObserver *)self _reloadNetworkTypeWithReachabilityFlags:v3];
}

- (void)_reloadNetworkTypeWithReachabilityFlags:(unsigned int)a3
{
  int64_t v5 = -[ISNetworkObserver _networkTypeForReachabilityFlags:](self, "_networkTypeForReachabilityFlags:");
  int64_t v6 = [(ISNetworkObserver *)self _setNetworkType:v5];
  unsigned int networkReachabilityFlags = self->_networkReachabilityFlags;
  self->_unsigned int networkReachabilityFlags = a3;
  if (v6 != v5 || networkReachabilityFlags != a3)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__ISNetworkObserver__reloadNetworkTypeWithReachabilityFlags___block_invoke;
    block[3] = &unk_2642610F0;
    BOOL v13 = v6 != v5;
    block[4] = self;
    void block[5] = v6;
    block[6] = v5;
    BOOL v14 = networkReachabilityFlags != a3;
    unsigned int v11 = networkReachabilityFlags;
    unsigned int v12 = a3;
    dispatch_async(notificationQueue, block);
  }
}

uint64_t __61__ISNetworkObserver__reloadNetworkTypeWithReachabilityFlags___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 64)) {
    id result = [*(id *)(result + 32) _postTypeChangedNotificationFromValue:*(void *)(result + 40) toValue:*(void *)(result + 48)];
  }
  if (*(unsigned char *)(v1 + 65))
  {
    char v2 = *(void **)(v1 + 32);
    uint64_t v3 = *(unsigned int *)(v1 + 56);
    uint64_t v4 = *(unsigned int *)(v1 + 60);
    return [v2 _postReachabilityFlagsChangedNotificationFromValue:v3 toValue:v4];
  }
  return result;
}

- (int64_t)_setNetworkType:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int64_t networkType = self->_networkType;
  if (networkType != a3)
  {
    self->_int64_t networkType = a3;
    self->_lastNetworkTypeChangeTime = CFAbsoluteTimeGetCurrent();
    uint64_t v4 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v4) {
      uint64_t v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v6 &= 2u;
    }
    if (v6)
    {
      int v11 = 138412546;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2112;
      uint64_t v14 = SSGetStringForNetworkType();
      LODWORD(v10) = 22;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v11, v10);
        free(v8);
        SSFileLog();
      }
    }
  }
  return networkType;
}

@end