@interface ICWiFiManager
+ (id)sharedWiFiManager;
- (BOOL)_getWiFiAssociated;
- (BOOL)_getWiFiEnabledFromPrefs;
- (BOOL)isWiFiAssociated;
- (BOOL)isWiFiEnabled;
- (ICWiFiManager)init;
- (id)_processIdentifier;
- (void)_wifiCallBack:(unsigned int)a3;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)setWiFiAssociated:(BOOL)a3;
- (void)setWiFiEnabled:(BOOL)a3;
@end

@implementation ICWiFiManager

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
}

uint64_t __34__ICWiFiManager_sharedWiFiManager__block_invoke()
{
  sharedWiFiManager_sharedWiFiManager = objc_alloc_init(ICWiFiManager);

  return MEMORY[0x1F41817F8]();
}

- (ICWiFiManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)ICWiFiManager;
  v2 = [(ICWiFiManager *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.amp.HomeSharing.HSWiFiManager.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    CFStringRef v5 = [(ICWiFiManager *)v2 _processIdentifier];
    v6 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, @"com.apple.wifi.plist");
    v2->_wifiPreferences = v6;
    v12.version = 0;
    memset(&v12.retain, 0, 24);
    v12.info = v2;
    SCPreferencesSetCallback(v6, (SCPreferencesCallBack)_WiFiCallBack, &v12);
    wifiPreferences = v2->_wifiPreferences;
    Main = CFRunLoopGetMain();
    SCPreferencesScheduleWithRunLoop(wifiPreferences, Main, (CFStringRef)*MEMORY[0x1E4F1D410]);
    v2->_wiFiEnabled = [(ICWiFiManager *)v2 _getWiFiEnabledFromPrefs];
    v2->_wiFiAssociated = 1;
    v9 = +[ICEnvironmentMonitor sharedMonitor];
    [v9 registerObserver:v2];

    v10 = v2;
  }

  return v2;
}

- (id)_processIdentifier
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  dispatch_queue_t v3 = [v2 bundleIdentifier];

  if (!v3)
  {
    v4 = NSString;
    CFStringRef v5 = getprogname();
    dispatch_queue_t v3 = objc_msgSend(v4, "stringWithFormat:", @"%s (%d)", v5, getpid());
  }

  return v3;
}

+ (id)sharedWiFiManager
{
  if (sharedWiFiManager_onceToken != -1) {
    dispatch_once(&sharedWiFiManager_onceToken, &__block_literal_global_41163);
  }
  v2 = (void *)sharedWiFiManager_sharedWiFiManager;

  return v2;
}

- (void)_wifiCallBack:(unsigned int)a3
{
  char v3 = a3;
  v13[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(ICWiFiManager *)self _getWiFiEnabledFromPrefs];
  BOOL v6 = [(ICWiFiManager *)self _getWiFiAssociated];
  if (v3)
  {
    BOOL v7 = v6;
    if (v5 != [(ICWiFiManager *)self isWiFiEnabled]
      || v7 != [(ICWiFiManager *)self isWiFiAssociated])
    {
      [(ICWiFiManager *)self setWiFiEnabled:v5];
      [(ICWiFiManager *)self setWiFiAssociated:v7];
      v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ICWiFiManager isWiFiEnabled](self, "isWiFiEnabled"));
      v12[0] = v8;
      v13[0] = @"ICWiFiManagerWiFiEnabledUserInfoKey";
      v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ICWiFiManager isWiFiAssociated](self, "isWiFiAssociated"));
      v12[1] = v9;
      v13[1] = @"ICWiFiManagerWiFiAssociatedUserInfoKey";
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 postNotificationName:@"ICWiFiManagerWiFiDidChangeNotification" object:self userInfo:v10];
    }
  }
}

- (BOOL)isWiFiEnabled
{
  return self->_wiFiEnabled;
}

- (BOOL)isWiFiAssociated
{
  return self->_wiFiAssociated;
}

- (BOOL)_getWiFiEnabledFromPrefs
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__ICWiFiManager__getWiFiEnabledFromPrefs__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_getWiFiAssociated
{
  v2 = +[ICEnvironmentMonitor sharedMonitor];
  char v3 = [v2 isWiFiAssociated];

  return v3;
}

- (void)setWiFiEnabled:(BOOL)a3
{
  self->_wiFiEnabled = a3;
}

- (void)setWiFiAssociated:(BOOL)a3
{
  self->_wiFiAssociated = a3;
}

void __41__ICWiFiManager__getWiFiEnabledFromPrefs__block_invoke(uint64_t a1)
{
  CFBooleanRef Value = (const __CFBoolean *)SCPreferencesGetValue(*(SCPreferencesRef *)(*(void *)(a1 + 32) + 8), @"AllowEnable");
  if (Value)
  {
    CFBooleanRef v3 = Value;
    CFTypeID v4 = CFGetTypeID(Value);
    if (v4 == CFNumberGetTypeID() || (CFTypeID v5 = CFGetTypeID(v3), v5 == CFBooleanGetTypeID())) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFBooleanGetValue(v3) != 0;
    }
  }
  uint64_t v6 = *(const __SCPreferences **)(*(void *)(a1 + 32) + 8);

  SCPreferencesSynchronize(v6);
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  wifiPreferences = self->_wifiPreferences;
  Main = CFRunLoopGetMain();
  SCPreferencesUnscheduleFromRunLoop(wifiPreferences, Main, (CFStringRef)*MEMORY[0x1E4F1D410]);
  CFRelease(self->_wifiPreferences);
  v5.receiver = self;
  v5.super_class = (Class)ICWiFiManager;
  [(ICWiFiManager *)&v5 dealloc];
}

@end