@interface IMNetworkObserver
+ (BOOL)isLikelyToReachRemoteServerWithReachabilityFlags:(unsigned int)a3;
+ (id)_networkObserverLogConfig;
+ (id)sharedInstance;
- (BOOL)isObserving;
- (BOOL)networkTypeIsCellularType:(int64_t)a3;
- (IMNetworkObserver)init;
- (NSString)connectionTypeHeader;
- (id)_dataStatusIndicator;
- (id)dataStatusIndicator;
- (id)operatorName;
- (id)stringForNetworkType:(int64_t)a3;
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
- (void)_reloadDataStatusIndicator;
- (void)_reloadNetworkType;
- (void)_reloadNetworkTypeWithReachabilityFlags:(unsigned int)a3;
- (void)beginObserving;
- (void)dealloc;
- (void)endObserving;
- (void)reloadNetworkType;
- (void)setNetworkType:(int64_t)a3;
@end

@implementation IMNetworkObserver

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__IMNetworkObserver_sharedInstance__block_invoke;
  block[3] = &unk_1E5E61390;
  block[4] = a1;
  if (sharedInstance_sOnce != -1) {
    dispatch_once(&sharedInstance_sOnce, block);
  }
  return (id)sharedInstance_sObserver;
}

- (NSString)connectionTypeHeader
{
  v3 = (void *)[MEMORY[0x1E4F28E78] string];
  int64_t v4 = [(IMNetworkObserver *)self networkType];
  id v5 = [(IMNetworkObserver *)self stringForNetworkType:v4];
  if (v5)
  {
    [v3 appendString:v5];
    if ([(IMNetworkObserver *)self networkTypeIsCellularType:v4])
    {
      id v6 = [(IMNetworkObserver *)self operatorName];
      if ([v6 length]) {
        [v3 appendFormat:@"/%@", v6];
      }
    }
  }
  return (NSString *)v3;
}

- (id)stringForNetworkType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id result = @"2G";
      break;
    case 2:
      id result = @"3G";
      break;
    case 3:
      id result = @"4G";
      break;
    case 4:
      id result = @"5G";
      break;
    case 5:
      id result = @"6G";
      break;
    case 6:
      id result = @"7G";
      break;
    case 7:
      id result = @"8G";
      break;
    case 8:
      id result = @"9G";
      break;
    default:
      if (a3 == 1000) {
        id result = @"WiFi";
      }
      else {
        id result = 0;
      }
      break;
  }
  return result;
}

- (int64_t)networkType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t networkType = self->_networkType;
  os_unfair_lock_unlock(p_lock);
  return networkType;
}

- (BOOL)networkTypeIsCellularType:(int64_t)a3
{
  BOOL result = 0;
  if (a3 <= 1999)
  {
    if (!a3 || a3 == 1000) {
      return result;
    }
    return 1;
  }
  if (a3 != 2000 && a3 != 3000) {
    return 1;
  }
  return result;
}

id __35__IMNetworkObserver_sharedInstance__block_invoke()
{
  id result = objc_alloc_init((Class)objc_opt_class());
  sharedInstance_sObserver = (uint64_t)result;
  return result;
}

- (IMNetworkObserver)init
{
  v4.receiver = self;
  v4.super_class = (Class)IMNetworkObserver;
  v2 = [(IMNetworkObserver *)&v4 init];
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstore.IMNetworkObserver", 0);
    v2->_notificationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstore.IMNetworkObserver.notifications", 0);
    v2->_observing = 0;
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__applicationForegroundNotification_, @"MTApplicationWillEnterForegroundNotification", 0);
  }
  return v2;
}

void __56__IMNetworkObserver__applicationForegroundNotification___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 72));
  [*(id *)(a1 + 32) _reloadDataStatusIndicator];
  [*(id *)(a1 + 32) _reloadNetworkType];
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 72);
  os_unfair_lock_unlock(v2);
}

- (void)_reloadNetworkType
{
  uint64_t v3 = [(IMNetworkObserver *)self _currentNetworkReachabilityFlags];
  [(IMNetworkObserver *)self _reloadNetworkTypeWithReachabilityFlags:v3];
}

- (void)_reloadNetworkTypeWithReachabilityFlags:(unsigned int)a3
{
  int64_t v5 = -[IMNetworkObserver _networkTypeForReachabilityFlags:](self, "_networkTypeForReachabilityFlags:");
  int64_t v6 = [(IMNetworkObserver *)self _setNetworkType:v5];
  unsigned int networkReachabilityFlags = self->_networkReachabilityFlags;
  self->_unsigned int networkReachabilityFlags = a3;
  if (v6 != v5 || networkReachabilityFlags != a3)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__IMNetworkObserver__reloadNetworkTypeWithReachabilityFlags___block_invoke;
    block[3] = &unk_1E5E614C0;
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

- (int64_t)_setNetworkType:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t networkType = self->_networkType;
  if (networkType != a3)
  {
    self->_int64_t networkType = a3;
    id v5 = +[IMNetworkObserver _networkObserverLogConfig];
    if (!v5) {
      id v5 = (id)[MEMORY[0x1E4F4DCE8] sharedConfig];
    }
    int64_t v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = [(IMNetworkObserver *)self stringForNetworkType:self->_networkType];
      int v10 = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl(&dword_1AC9D5000, v6, OS_LOG_TYPE_DEFAULT, "%@: Set network type \"%@\"", (uint8_t *)&v10, 0x16u);
    }
  }
  return networkType;
}

- (void)_reloadDataStatusIndicator
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__IMNetworkObserver__reloadDataStatusIndicator__block_invoke;
  v2[3] = &unk_1E5E61498;
  v2[4] = self;
  [(IMNetworkObserver *)self _copyConnectionDataStatus:v2];
}

- (void)_copyConnectionDataStatus:(id)a3
{
}

void __47__IMNetworkObserver__reloadDataStatusIndicator__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {

    *(void *)(*(void *)(a1 + 32) + 8) = a2;
  }
}

- (void)beginObserving
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_observing)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    uint64_t v9 = 0;
    long long v11 = 0u;
    uint64_t v12 = 0;
    int v10 = self;
    objc_super v4 = (__CTServerConnection *)_CTServerConnectionCreate();
    self->_telephonyServer = v4;
    if (v4)
    {
      _CTServerConnectionSetTargetQueue();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
    }
    sockaddr address = (sockaddr)xmmword_1ACE82F60;
    id v5 = SCNetworkReachabilityCreateWithAddress(0, &address);
    self->_reachability = v5;
    if (v5)
    {
      context.version = 0;
      context.info = self;
      context.retain = 0;
      context.release = 0;
      context.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x1E4F1C220];
      SCNetworkReachabilitySetCallback(v5, (SCNetworkReachabilityCallBack)__ReachabilityCallback, &context);
      SCNetworkReachabilitySetDispatchQueue(self->_reachability, (dispatch_queue_t)self->_dispatchQueue);
    }
    uint64_t v6 = [(IMNetworkObserver *)self _currentNetworkReachabilityFlags];
    self->_unsigned int networkReachabilityFlags = v6;
    self->_int64_t networkType = [(IMNetworkObserver *)self _networkTypeForReachabilityFlags:v6];
    if (self->_telephonyServer) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = self->_reachability != 0;
    }
    self->_observing = v7;
    os_unfair_lock_unlock(p_lock);
  }
}

- (int64_t)_networkTypeForReachabilityFlags:(unsigned int)a3
{
  if ((a3 & 2) == 0) {
    return 0;
  }
  if ((a3 & 0x40000) == 0) {
    return 1000;
  }
  id v6 = [(IMNetworkObserver *)self _dataStatusIndicator];
  return [(IMNetworkObserver *)self _networkTypeFromDataIndicator:v6];
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

- (void)_applicationForegroundNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__IMNetworkObserver__applicationForegroundNotification___block_invoke;
  block[3] = &unk_1E5E61390;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)isObserving
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_observing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)endObserving
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
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
    _CTServerConnectionUnregisterForNotification();
    CFRelease(self->_telephonyServer);
    self->_telephonyServer = 0;
  }
  self->_observing = 0;
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"MTApplicationWillEnterForegroundNotification", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F23BA8], 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F23BB0], 0);
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  notificationQueue = self->_notificationQueue;
  if (notificationQueue) {
    dispatch_release(notificationQueue);
  }

  [(IMNetworkObserver *)self endObserving];
  os_unfair_lock_unlock(p_lock);
  v7.receiver = self;
  v7.super_class = (Class)IMNetworkObserver;
  [(IMNetworkObserver *)&v7 dealloc];
}

- (unsigned)networkReachabilityFlags
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_networkReachabilityFlags;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

+ (BOOL)isLikelyToReachRemoteServerWithReachabilityFlags:(unsigned int)a3
{
  return (a3 & 6) == 2;
}

- (id)dataStatusIndicator
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(IMNetworkObserver *)self _dataStatusIndicator];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)operatorName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_operatorName = &self->_operatorName;
  operatorName = self->_operatorName;
  if (!operatorName)
  {
    if (self->_telephonyServer)
    {
      unint64_t v8 = _CTServerConnectionCopyOperatorName();
      operatorName = *p_operatorName;
      if (HIDWORD(v8) && operatorName)
      {

        operatorName = 0;
        *p_operatorName = 0;
      }
    }
    else
    {
      operatorName = 0;
    }
  }
  id v6 = operatorName;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)reloadNetworkType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(IMNetworkObserver *)self _reloadNetworkType];
  os_unfair_lock_unlock(p_lock);
}

- (void)setNetworkType:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v6 = [(IMNetworkObserver *)self _setNetworkType:a3];
  os_unfair_lock_unlock(p_lock);
  if (v6 != a3)
  {
    [(IMNetworkObserver *)self _postTypeChangedNotificationFromValue:v6 toValue:a3];
  }
}

- (void)_handleTelephonyNotificationWithName:(__CFString *)a3 userInfo:(__CFDictionary *)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (CFStringCompare(a3, (CFStringRef)*MEMORY[0x1E4F24080], 0))
  {
    if (CFEqual(a3, (CFStringRef)*MEMORY[0x1E4F240A0]))
    {

      self->_operatorName = (NSString *)(id)CFDictionaryGetValue(a4, (const void *)*MEMORY[0x1E4F24098]);
      notificationQueue = self->_notificationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__IMNetworkObserver__handleTelephonyNotificationWithName_userInfo___block_invoke;
      block[3] = &unk_1E5E61390;
      block[4] = self;
      dispatch_async(notificationQueue, block);
    }
  }
  else
  {

    self->_dataStatusIndicator = (NSString *)(id)CFDictionaryGetValue(a4, (const void *)*MEMORY[0x1E4F24018]);
    [(IMNetworkObserver *)self _reloadNetworkType];
  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __67__IMNetworkObserver__handleTelephonyNotificationWithName_userInfo___block_invoke(uint64_t a1)
{
  v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"IMNetworkObserverOperatorNameChangedNotification" object:v3];
}

- (id)_dataStatusIndicator
{
  id result = self->_dataStatusIndicator;
  if (!result)
  {
    if (self->_telephonyServer)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __41__IMNetworkObserver__dataStatusIndicator__block_invoke;
      v4[3] = &unk_1E5E61498;
      v4[4] = self;
      [(IMNetworkObserver *)self _copyConnectionDataStatus:v4];
      return self->_dataStatusIndicator;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t __41__IMNetworkObserver__dataStatusIndicator__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(result + 32) + 8) = a2;
  return result;
}

- (int64_t)_networkTypeFromDataIndicator:(id)a3
{
  uint64_t v4 = 0;
  v6[24] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4F24020];
  v6[1] = 1;
  v6[2] = *MEMORY[0x1E4F24028];
  v6[3] = 1;
  v6[4] = *MEMORY[0x1E4F24030];
  v6[5] = 2;
  v6[6] = *MEMORY[0x1E4F24038];
  v6[7] = 2;
  v6[8] = *MEMORY[0x1E4F24040];
  v6[9] = 2;
  v6[10] = *MEMORY[0x1E4F24078];
  v6[11] = 3;
  v6[12] = *MEMORY[0x1E4F24048];
  v6[13] = 3;
  v6[14] = *MEMORY[0x1E4F24050];
  v6[15] = 4;
  v6[16] = *MEMORY[0x1E4F24058];
  v6[17] = 5;
  v6[18] = *MEMORY[0x1E4F24060];
  v6[19] = 6;
  v6[20] = *MEMORY[0x1E4F24068];
  v6[21] = 7;
  v6[22] = *MEMORY[0x1E4F24070];
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

- (void)_postReachabilityFlagsChangedNotificationFromValue:(unsigned int)a3 toValue:(unsigned int)a4
{
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  uint64_t v9 = *MEMORY[0x1E4F284E0];
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  id v11 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, v9, v10, *MEMORY[0x1E4F284C8], 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"IMNetworkReachabilityFlagsChangedNotification", self, v11);
}

- (void)_postTypeChangedNotificationFromValue:(int64_t)a3 toValue:(int64_t)a4
{
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  uint64_t v9 = *MEMORY[0x1E4F284E0];
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  id v11 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, v9, v10, *MEMORY[0x1E4F284C8], 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"IMNetworkTypeChangedNotification", self, v11);
}

uint64_t __61__IMNetworkObserver__reloadNetworkTypeWithReachabilityFlags___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 64)) {
    id result = [*(id *)(result + 32) _postTypeChangedNotificationFromValue:*(void *)(result + 40) toValue:*(void *)(result + 48)];
  }
  if (*(unsigned char *)(v1 + 65))
  {
    v2 = *(void **)(v1 + 32);
    uint64_t v3 = *(unsigned int *)(v1 + 56);
    uint64_t v4 = *(unsigned int *)(v1 + 60);
    return [v2 _postReachabilityFlagsChangedNotificationFromValue:v3 toValue:v4];
  }
  return result;
}

+ (id)_networkObserverLogConfig
{
  if (_networkObserverLogConfig_onceToken != -1) {
    dispatch_once(&_networkObserverLogConfig_onceToken, &__block_literal_global_2);
  }
  return (id)_networkObserverLogConfig_logConfig;
}

void __46__IMNetworkObserver__networkObserverLogConfig__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F4DDA8]);
  [v0 setSubsystem:@"com.apple.Podcasts"];
  [v0 setCategory:@"Network Observer"];
  _networkObserverLogConfig_logConfig = [v0 copy];
}

@end