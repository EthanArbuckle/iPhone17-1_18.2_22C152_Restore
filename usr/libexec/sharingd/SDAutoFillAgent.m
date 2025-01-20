@interface SDAutoFillAgent
- (BOOL)_serviceShouldRequestAutoFill;
- (BOOL)_uiShowing;
- (BOOL)preventNotifications;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SDAutoFillAgent)init;
- (id)_rpCompanionLinkDeviceForSFDevice:(id)a3;
- (int)helper:(id)a3 didPickUsername:(id)a4 password:(id)a5 error:(id)a6;
- (int)helper:(id)a3 tryPIN:(id)a4;
- (int)helper:(id)a3 userNotificationDidActivate:(id)a4;
- (int)helper:(id)a3 userNotificationDidDismiss:(id)a4;
- (int)helperStart:(id)a3;
- (void)_activate;
- (void)_activateUIDelayTimer;
- (void)_bulletinsEnsureStarted;
- (void)_bulletinsEnsureStopped;
- (void)_clientClinkDeviceChanged:(id)a3;
- (void)_clientClinkDeviceFound:(id)a3;
- (void)_clientClinkDeviceLost:(id)a3;
- (void)_commonEnsureStarted;
- (void)_commonEnsureStopped;
- (void)_deactivateUIDelayTimer;
- (void)_deviceChanged:(id)a3;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)_deviceStoppedRequesting:(id)a3;
- (void)_discoveryEnsureStarted;
- (void)_discoveryEnsureStopped;
- (void)_ensureKeychainCleaned:(BOOL)a3;
- (void)_helpersClientPairingSucceeded:(BOOL)a3 completion:(id)a4;
- (void)_helpersClientPromptForPIN:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)_invalidate;
- (void)_postSetupNotificationForDevice:(id)a3;
- (void)_proximityChanged:(id)a3;
- (void)_proximityEnsureStarted;
- (void)_proximityEnsureStopped;
- (void)_proximityFound:(id)a3;
- (void)_proximityLost:(id)a3;
- (void)_rtiEnsureStarted;
- (void)_rtiEnsureStopped;
- (void)_screenStateChanged:(id)a3;
- (void)_serviceEnsureStarted;
- (void)_serviceEnsureStopped;
- (void)_serviceHandleError:(id)a3;
- (void)_serviceHandleUsername:(id)a3 password:(id)a4 error:(id)a5;
- (void)_serviceStartRequestingAutoFillIfReady;
- (void)_serviceStopRequestingAutoFill;
- (void)_serviceTimeoutStart;
- (void)_serviceTimeoutStop;
- (void)_sessionHandlePairingSucceededResponse:(id)a3;
- (void)_sessionStart:(id)a3;
- (void)_sessionStop:(id)a3;
- (void)_siriRemoteMonitorEnsureStarted;
- (void)_siriRemoteMonitorEnsureStopped;
- (void)_uiLockStatusChanged:(id)a3;
- (void)_uiStart:(id)a3 extraInfo:(id)a4;
- (void)_uiStartIfEnabled:(id)a3 extraInfo:(id)a4;
- (void)_uiStartIfNeeded:(id)a3 extraInfo:(id)a4;
- (void)_uiStop:(id)a3;
- (void)_update;
- (void)activate;
- (void)dealloc;
- (void)handleInputDidBeginWithFlags:(unint64_t)a3 sessionInfo:(id)a4;
- (void)handleInputDidEndWithFlags:(unint64_t)a3 sessionInfo:(id)a4;
- (void)helperStop:(id)a3;
- (void)invalidate;
- (void)notificiationDidDismiss:(id)a3;
- (void)passwordPickerStart:(id)a3 bundleID:(id)a4 localizedAppName:(id)a5 unlocalizedAppName:(id)a6 associatedDomains:(id)a7 appIconData:(id)a8 deviceName:(id)a9 completion:(id)a10;
- (void)prefsChanged;
- (void)proximityDeviceDidTrigger:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPreventNotifications:(BOOL)a3;
- (void)testKeychain:(id)a3;
- (void)testRemote:(id)a3;
- (void)testService:(id)a3;
- (void)testUI:(id)a3;
- (void)triggerProximityAutoFillDetectedWithURL:(id)a3 completion:(id)a4;
@end

@implementation SDAutoFillAgent

- (SDAutoFillAgent)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDAutoFillAgent;
  v2 = [(SDAutoFillAgent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(SDAutoFillAgent *)self _commonEnsureStopped];
  v3.receiver = self;
  v3.super_class = (Class)SDAutoFillAgent;
  [(SDAutoFillAgent *)&v3 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"-- SDAutoFillAgent --\n"];
  v4 = "enabled";
  if (self->_prefGrantingEnabled) {
    v5 = "enabled";
  }
  else {
    v5 = "disabled";
  }
  if (self->_prefRequestingEnabled) {
    objc_super v6 = "enabled";
  }
  else {
    objc_super v6 = "disabled";
  }
  if (!self->_scanningEnabled) {
    v4 = "disabled";
  }
  [v3 appendFormat:@"Granting: %s, Requesting: %s, Scanning: %s\n", v5, v6, v4];
  if (self->_deviceDiscovery) {
    deviceDiscovery = self->_deviceDiscovery;
  }
  else {
    deviceDiscovery = (SFDeviceDiscovery *)@"off";
  }
  [v3 appendFormat:@"Device Discovery: %@, %ld devices\n", deviceDiscovery, -[NSMutableDictionary count](self->_devices, "count")];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v8 = self->_devices;
  id v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v42;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        v14 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v13];
        [v3 appendFormat:@"    %@", v14];

        v15 = [(NSMutableDictionary *)self->_triggeredDevices objectForKeyedSubscript:v13];

        if (v15) {
          [v3 appendString:@", TRIG"];
        }
        [v3 appendString:@"\n"];
      }
      id v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v10);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v16 = self->_triggeredDevices;
  id v17 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v37 + 1) + 8 * (void)j);
        v22 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v21];

        if (!v22)
        {
          v23 = [(NSMutableDictionary *)self->_triggeredDevices objectForKeyedSubscript:v21];
          [v3 appendFormat:@"    Orphaned triggered device: %@", v23];
        }
      }
      id v18 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v18);
  }

  if (self->_proximityDiscovery) {
    proximityDiscovery = self->_proximityDiscovery;
  }
  else {
    proximityDiscovery = (SFBLEScanner *)@"off";
  }
  [v3 appendFormat:@"Proximity discovery: %@, %ld devices\n", proximityDiscovery, -[NSMutableDictionary count](self->_proximityDevices, "count")];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v25 = self->_proximityDevices;
  id v26 = [(NSMutableDictionary *)v25 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v34;
    do
    {
      for (k = 0; k != v27; k = (char *)k + 1)
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * (void)k)];
        [v3 appendFormat:@"    %@\n", v30];
      }
      id v27 = [(NSMutableDictionary *)v25 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v27);
  }

  requestingService = self->_requestingService;
  if (!requestingService) {
    requestingService = (SFRemoteAutoFillService *)@"off";
  }
  [v3 appendFormat:@"Requesting service: %@\n", requestingService];

  return (NSString *)v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A50E8;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDAutoFillAgent *)self prefsChanged];

  [(SDAutoFillAgent *)self _ensureKeychainCleaned:0];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A51FC;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDAutoFillAgent *)self _commonEnsureStopped];
  [(SDAutoFillAgent *)self _discoveryEnsureStopped];
  [(SDAutoFillAgent *)self _proximityEnsureStopped];
  [(SDAutoFillAgent *)self _rtiEnsureStopped];
  [(SDAutoFillAgent *)self _serviceEnsureStopped];
  [(SDAutoFillAgent *)self _siriRemoteMonitorEnsureStopped];

  [(SDAutoFillAgent *)self _deactivateUIDelayTimer];
}

- (void)prefsChanged
{
  BOOL v3 = CFPrefs_GetInt64() != 0;
  if (self->_prefGrantingEnabled != v3)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      v4 = "yes";
      if (v3) {
        v5 = "no";
      }
      else {
        v5 = "yes";
      }
      if (!v3) {
        v4 = "no";
      }
      v24 = v5;
      v25 = v4;
      LogPrintF();
    }
    self->_BOOL prefGrantingEnabled = v3;
    if (!v3 && dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  BOOL v6 = CFPrefs_GetInt64() != 0;
  if (self->_prefRateLimitDisabled != v6)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      v7 = "yes";
      if (v6) {
        v8 = "no";
      }
      else {
        v8 = "yes";
      }
      if (!v6) {
        v7 = "no";
      }
      v24 = v8;
      v25 = v7;
      LogPrintF();
    }
    self->_prefRateLimitDisabled = v6;
  }
  BOOL v9 = CFPrefs_GetInt64() != 0;
  if (self->_prefRequestingEnabled != v9)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      id v10 = "yes";
      if (v9) {
        uint64_t v11 = "no";
      }
      else {
        uint64_t v11 = "yes";
      }
      if (!v9) {
        id v10 = "no";
      }
      v24 = v11;
      v25 = v10;
      LogPrintF();
    }
    self->_prefRequestingEnabled = v9;
  }
  BOOL v12 = CFPrefs_GetInt64() != 0;
  if (self->_prefRequiresProx != v12)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v13 = "yes";
      if (v12) {
        v14 = "no";
      }
      else {
        v14 = "yes";
      }
      if (!v12) {
        uint64_t v13 = "no";
      }
      v24 = v14;
      v25 = v13;
      LogPrintF();
    }
    self->_prefRequiresProx = v12;
  }
  BOOL v15 = CFPrefs_GetInt64() != 0;
  if (self->_prefPairedTVAllowed != v15)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      v16 = "yes";
      if (v15) {
        id v17 = "no";
      }
      else {
        id v17 = "yes";
      }
      if (!v15) {
        v16 = "no";
      }
      v24 = v17;
      v25 = v16;
      LogPrintF();
    }
    self->_prefPairedTVAllowed = v15;
  }
  BOOL v18 = CFPrefs_GetInt64() != 0;
  if (self->_proximityEnabled != v18)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = "yes";
      if (v18) {
        v20 = "no";
      }
      else {
        v20 = "yes";
      }
      if (!v18) {
        uint64_t v19 = "no";
      }
      v24 = v20;
      v25 = v19;
      LogPrintF();
    }
    self->_proximityEnabled = v18;
  }
  if (self->_remoteMonitoringEnabled)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      v24 = "yes";
      v25 = "no";
      LogPrintF();
    }
    self->_remoteMonitoringEnabled = 0;
  }
  BOOL prefGrantingEnabled = self->_prefGrantingEnabled;
  if (prefGrantingEnabled != self->_scanningEnabled)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      v22 = "no";
      if (prefGrantingEnabled) {
        v23 = "no";
      }
      else {
        v23 = "yes";
      }
      if (prefGrantingEnabled) {
        v22 = "yes";
      }
      v24 = v23;
      v25 = v22;
      LogPrintF();
    }
    self->_scanningEnabled = prefGrantingEnabled;
  }
  [(SDAutoFillAgent *)self _update];
}

- (void)setPreventNotifications:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A5898;
  v4[3] = &unk_1008CB9D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_prefGrantingEnabled || self->_prefRequestingEnabled || self->_scanningEnabled) {
    [(SDAutoFillAgent *)self _commonEnsureStarted];
  }
  else {
    [(SDAutoFillAgent *)self _commonEnsureStopped];
  }
  BOOL v3 = [(SDStatusMonitor *)self->_statusMonitor screenOn]
    && [(SDStatusMonitor *)self->_statusMonitor deviceUIUnlocked]
    && self->_scanningEnabled;
  if (![(SDStatusMonitor *)self->_statusMonitor screenOn])
  {
    if (!v3)
    {
LABEL_15:
      [(SDAutoFillAgent *)self _discoveryEnsureStopped];
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if (v3)
  {
LABEL_14:
    [(SDAutoFillAgent *)self _discoveryEnsureStarted];
    goto LABEL_16;
  }
  if (!self->_scanningEnabled) {
    goto LABEL_15;
  }
LABEL_16:
  [(SDAutoFillAgent *)self _rtiEnsureStopped];
  [(SDAutoFillAgent *)self _bulletinsEnsureStarted];
  BOOL v4 = [(SDStatusMonitor *)self->_statusMonitor screenOn]
    && [(SDStatusMonitor *)self->_statusMonitor deviceUIUnlocked]
    && self->_proximityEnabled;
  if ([(SDStatusMonitor *)self->_statusMonitor screenOn])
  {
    if (!v4)
    {
      if (self->_proximityEnabled) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
LABEL_25:
    [(SDAutoFillAgent *)self _proximityEnsureStarted];
    goto LABEL_27;
  }
  if (v4) {
    goto LABEL_25;
  }
LABEL_26:
  [(SDAutoFillAgent *)self _proximityEnsureStopped];
LABEL_27:
  if (self->_remoteMonitoringEnabled) {
    [(SDAutoFillAgent *)self _siriRemoteMonitorEnsureStarted];
  }
  else {
    [(SDAutoFillAgent *)self _siriRemoteMonitorEnsureStopped];
  }
  if ([(SDAutoFillAgent *)self _serviceShouldRequestAutoFill])
  {
    [(SDAutoFillAgent *)self _serviceEnsureStarted];
  }
  else
  {
    [(SDAutoFillAgent *)self _serviceEnsureStopped];
  }
}

- (void)_commonEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_statusMonitor)
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_screenStateChanged:" name:@"com.apple.sharingd.ScreenStateChanged" object:0];
    [v5 addObserver:self selector:"_uiLockStatusChanged:" name:@"com.apple.sharingd.UILockStatusChanged" object:0];
    BOOL v3 = +[SDStatusMonitor sharedMonitor];
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = v3;
  }
}

- (void)_commonEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_statusMonitor)
  {
    BOOL v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"com.apple.sharingd.ScreenStateChanged" object:0];
    [v3 removeObserver:self name:@"com.apple.sharingd.UILockStatusChanged" object:0];
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = 0;
  }
  self->_cleanKeysState = 0;
}

- (void)_ensureKeychainCleaned:(BOOL)a3
{
  BOOL v3 = a3;
  CFTypeRef result = 0;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  if (self->_cleanKeysState) {
    BOOL v6 = !v3;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {

    goto LABEL_49;
  }
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_cleanKeysState = 1;
  v64[0] = kSecAttrAccessGroup;
  v64[1] = kSecClass;
  v65[0] = @"com.apple.sharing.safaripasswordsharing";
  v65[1] = kSecClassKey;
  v64[2] = kSecMatchLimit;
  v64[3] = kSecReturnAttributes;
  v65[2] = kSecMatchLimitAll;
  v65[3] = &__kCFBooleanTrue;
  v64[4] = kSecReturnPersistentRef;
  v65[4] = &__kCFBooleanTrue;
  v7 = &NSCalendarIdentifierGregorian_ptr;
  OSStatus v8 = SecItemCopyMatching((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:5], &result);
  long long v44 = self;
  if (v8)
  {
    if (dword_100966D60 > 60 || (OSStatus v35 = v8, dword_100966D60 == -1) && !_LogCategory_Initialize())
    {
      id obj = 0;
      int v34 = 3;
      goto LABEL_46;
    }
    uint64_t v36 = v35;
    NSErrorUserInfoKey v62 = NSLocalizedDescriptionKey;
    uint64_t v37 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    id v21 = (id)v37;
    CFStringRef v38 = @"?";
    if (v37) {
      CFStringRef v38 = (const __CFString *)v37;
    }
    CFStringRef v63 = v38;
    long long v39 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    long long v41 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v36 userInfo:v39];
    LogPrintF();

    id obj = 0;
    int v34 = 3;
    goto LABEL_45;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = (id)result;
  id v9 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v52;
    uint64_t v12 = kSecAttrEndDate;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v52 != v11) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v14;
          v16 = [v15 objectForKeyedSubscript:v12];
          if (v16)
          {
            id v17 = +[NSDate date];
            id v18 = [v17 compare:v16];

            BOOL v6 = v18 == (id)1;
            v7 = &NSCalendarIdentifierGregorian_ptr;
            if (v6)
            {
              uint64_t v19 = [v15 objectForKeyedSubscript:kSecValuePersistentRef];
              if (v19)
              {
                v20 = (void *)v19;
                [v5 addObject:v19];
                if (dword_100966D60 <= 10 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
                {
                  long long v40 = v16;
                  long long v42 = v20;
                  LogPrintF();
                }
              }
            }
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v10);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v21 = v5;
  id v22 = [v21 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (!v22)
  {
    int v34 = 4;
LABEL_45:

    self = v44;
    goto LABEL_46;
  }
  id v23 = v22;
  id v43 = v5;
  uint64_t v24 = *(void *)v48;
  p_opt_class_meths = &OBJC_PROTOCOL___SDUnlockIDSControllerDelegate.opt_class_meths;
  id v45 = v21;
  do
  {
    for (j = 0; j != v23; j = (char *)j + 1)
    {
      if (*(void *)v48 != v24) {
        objc_enumerationMutation(v21);
      }
      id v27 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
      CFStringRef v58 = kSecValuePersistentRef;
      v59 = v27;
      OSStatus v28 = SecItemDelete((CFDictionaryRef)-[NSCalendarIdentifier dictionaryWithObjects:forKeys:count:]((id)v7[183], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1, v40, v42));
      if (v28)
      {
        int v29 = *((_DWORD *)p_opt_class_meths + 856);
        if (v29 <= 60 && (v29 != -1 || _LogCategory_Initialize()))
        {
          NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
          uint64_t v30 = +[NSString stringWithUTF8String:DebugGetErrorString()];
          v31 = (void *)v30;
          CFStringRef v32 = @"?";
          if (v30) {
            CFStringRef v32 = (const __CFString *)v30;
          }
          CFStringRef v57 = v32;
          long long v33 = [(NSCalendarIdentifier *)(id)v7[183] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
          +[NSError errorWithDomain:NSOSStatusErrorDomain code:v28 userInfo:v33];
          v42 = long long v40 = v27;
          LogPrintF();

          p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SDUnlockIDSControllerDelegate + 48);
          v7 = &NSCalendarIdentifierGregorian_ptr;

          id v21 = v45;
        }
      }
    }
    id v23 = [v21 countByEnumeratingWithState:&v47 objects:v60 count:16];
  }
  while (v23);

  self = v44;
  v44->_cleanKeysState = 4;
  if (!v28)
  {
    id v5 = v43;
    goto LABEL_48;
  }
  int v34 = 3;
  id v5 = v43;
LABEL_46:
  self->_cleanKeysState = v34;
LABEL_48:

LABEL_49:
}

- (void)_postSetupNotificationForDevice:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 identifier];
  id v5 = [v4 UUIDString];

  if (v5)
  {
    v10[0] = @"deviceID";
    v10[1] = @"needsSetup";
    v11[0] = v5;
    unsigned int v6 = [v3 needsSetup];
    v7 = &__kCFBooleanFalse;
    if (v6) {
      v7 = &__kCFBooleanTrue;
    }
    v11[1] = v7;
    OSStatus v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    id v9 = +[NSDistributedNotificationCenter defaultCenter];
    [v9 postNotificationName:@"com.apple.sharing.ProxAutoFill" object:@"com.apple.sharingd" userInfo:v8 deliverImmediately:1];
    if (dword_100966D60 <= 50 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)triggerProximityAutoFillDetectedWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = [objc_alloc((Class)NSURLComponents) initWithURL:v6 resolvingAgainstBaseURL:0];
  id v9 = v8;
  if (v8)
  {
    uint64_t v37 = self;
    id v38 = v8;
    long long v39 = v7;
    id v40 = v6;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v10 = [v8 queryItems];
    id v11 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (!v11)
    {
      uint64_t v13 = 0;
      v14 = 0;
      goto LABEL_23;
    }
    id v12 = v11;
    uint64_t v13 = 0;
    v14 = 0;
    uint64_t v15 = *(void *)v42;
    while (1)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v10);
        }
        id v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v18 = [v17 name];
        if (v18 == @"bt"
          || (uint64_t v19 = v18) != 0
          && (unsigned int v20 = [(__CFString *)v18 isEqual:@"bt"],
              v19,
              v19,
              v20))
        {
          uint64_t v21 = [v17 value];
          id v22 = v13;
          uint64_t v13 = (void *)v21;
LABEL_15:

          continue;
        }
        id v23 = [v17 name];
        if (v23 != @"pin")
        {
          uint64_t v24 = v23;
          if (!v23) {
            continue;
          }
          unsigned int v25 = [(__CFString *)v23 isEqual:@"pin"];

          if (!v25) {
            continue;
          }
        }
        uint64_t v26 = [v17 value];
        id v22 = v14;
        v14 = (void *)v26;
        goto LABEL_15;
      }
      id v12 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (!v12)
      {
LABEL_23:

        id v27 = objc_alloc_init((Class)NSMutableDictionary);
        OSStatus v28 = v27;
        if (v14) {
          [v27 setObject:v14 forKeyedSubscript:@"pin"];
        }
        v7 = v39;
        if (v13)
        {
          [v28 setObject:v13 forKeyedSubscript:@"deviceAddress"];
          int v29 = [(NSMutableDictionary *)v37->_btDevices objectForKeyedSubscript:v13];
          uint64_t v30 = v29;
          if (v29)
          {
            v31 = [v29 identifier];

            if (v31)
            {
              if (dword_100966D60 <= 10 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
              {
                uint64_t v36 = [v30 identifier];
                LogPrintF();
              }
              int v34 = [v30 identifier:v36];
              OSStatus v35 = [v34 UUIDString];
              [v28 setObject:v35 forKeyedSubscript:@"deviceIdentifier"];
            }
          }
        }
        else
        {
          uint64_t v30 = 0;
        }
        id v6 = v40;
        if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v36 = v40;
          LogPrintF();
        }
        -[SDAutoFillAgent _uiStart:extraInfo:](v37, "_uiStart:extraInfo:", 0, v28, v36);
        if (v39) {
          v39[2](v39, 0);
        }

        id v9 = v38;
        goto LABEL_46;
      }
    }
  }
  if (dword_100966D60 <= 60 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v36 = v6;
    LogPrintF();
  }
  if (v7)
  {
    NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
    uint64_t v32 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v13 = (void *)v32;
    CFStringRef v33 = @"?";
    if (v32) {
      CFStringRef v33 = (const __CFString *)v32;
    }
    CFStringRef v47 = v33;
    uint64_t v30 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1, v36);
    v14 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6705 userInfo:v30];
    v7[2](v7, v14);
LABEL_46:
  }
}

- (void)_screenStateChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A693C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_uiLockStatusChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A6AA8;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_bulletinsEnsureStarted
{
  if (!self->_notificationManager)
  {
    id v3 = +[SDNotificationManager sharedManager];
    notificationManager = self->_notificationManager;
    self->_notificationManager = v3;

    id v5 = self->_notificationManager;
    [(SDNotificationManager *)v5 activate];
  }
}

- (void)_bulletinsEnsureStopped
{
  notificationManager = self->_notificationManager;
  self->_notificationManager = 0;
}

- (void)notificiationDidDismiss:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    grantingSession = self->_grantingSession;
    if (grantingSession)
    {
      id v10 = v4;
      id v6 = [(SFRemoteAutoFillSession *)grantingSession peerDevice];
      v7 = [v6 identifier];
      id v8 = [v7 UUIDString];
      unsigned int v9 = [v8 isEqual:v10];

      id v4 = v10;
      if (v9)
      {
        [(SDAutoFillAgent *)self _sessionStop:0];
        id v4 = v10;
      }
    }
  }
}

- (void)_discoveryEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_deviceDiscovery)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = v3;

    [(SFDeviceDiscovery *)self->_deviceDiscovery setChangeFlags:13];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDiscoveryFlags:8208];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setPurpose:@"AutoFill"];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setRssiThreshold:-60];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setScanRate:20];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000A7078;
    v14[3] = &unk_1008CADB8;
    v14[4] = self;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceFoundHandler:v14];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000A7084;
    v13[3] = &unk_1008CADB8;
    v13[4] = self;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceLostHandler:v13];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000A7090;
    v12[3] = &unk_1008CADE0;
    v12[4] = self;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceChangedHandler:v12];
    id v5 = self->_deviceDiscovery;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_1000A709C;
    v11[3] = &unk_1008CA5A8;
    v11[4] = self;
    [(SFDeviceDiscovery *)v5 activateWithCompletion:v11];
    if (!self->_clinkClient)
    {
      if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v6 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
      clinkClient = self->_clinkClient;
      self->_clinkClient = v6;

      [(RPCompanionLinkClient *)self->_clinkClient setControlFlags:(unint64_t)[(RPCompanionLinkClient *)self->_clinkClient controlFlags] | 0x2004];
      [(RPCompanionLinkClient *)self->_clinkClient setDispatchQueue:self->_dispatchQueue];
      [(RPCompanionLinkClient *)self->_clinkClient setInterruptionHandler:&stru_1008CC100];
      [(RPCompanionLinkClient *)self->_clinkClient setInvalidationHandler:&stru_1008CC120];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      void v10[2] = sub_1000A7274;
      v10[3] = &unk_1008CA828;
      v10[4] = self;
      [(RPCompanionLinkClient *)self->_clinkClient setDeviceFoundHandler:v10];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000A7280;
      v9[3] = &unk_1008CA828;
      v9[4] = self;
      [(RPCompanionLinkClient *)self->_clinkClient setDeviceLostHandler:v9];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000A728C;
      v8[3] = &unk_1008CA850;
      v8[4] = self;
      [(RPCompanionLinkClient *)self->_clinkClient setDeviceChangedHandler:v8];
      [(RPCompanionLinkClient *)self->_clinkClient activateWithCompletion:&stru_1008CC140];
    }
  }
}

- (void)_discoveryEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_deviceDiscovery)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFDeviceDiscovery *)self->_deviceDiscovery invalidate];
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0;
  }
  [(NSMutableDictionary *)self->_btDevices removeAllObjects];
  btDevices = self->_btDevices;
  self->_btDevices = 0;

  [(NSMutableDictionary *)self->_devices removeAllObjects];
  devices = self->_devices;
  self->_devices = 0;

  [(NSMutableDictionary *)self->_grantedDevices removeAllObjects];
  grantedDevices = self->_grantedDevices;
  self->_grantedDevices = 0;

  [(NSMutableSet *)self->_ignoredTVs removeAllObjects];
  ignoredTVs = self->_ignoredTVs;
  self->_ignoredTVs = 0;

  [(NSMutableDictionary *)self->_triggeredDevices removeAllObjects];
  triggeredDevices = self->_triggeredDevices;
  self->_triggeredDevices = 0;

  ascAgentProxy = self->_ascAgentProxy;
  if (ascAgentProxy)
  {
    self->_ascAgentProxy = 0;
  }
  clinkClient = self->_clinkClient;
  if (clinkClient)
  {
    [(RPCompanionLinkClient *)clinkClient invalidate];
    id v11 = self->_clinkClient;
    self->_clinkClient = 0;
  }
}

- (void)_deviceChanged:(id)a3
{
  id v16 = a3;
  id v4 = [v16 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v4 || !self->_deviceDiscovery) {
    goto LABEL_30;
  }
  unsigned int v5 = [v16 deviceActionType];
  id v6 = +[SDNearbyAgent sharedNearbyAgent];
  v7 = [v6 idsBluetoothDeviceIDsForRIServers];
  unsigned int v8 = [v7 containsObject:v4];

  if (v5 == 19 && v8 && !self->_prefPairedTVAllowed)
  {
    if (([(NSMutableSet *)self->_ignoredTVs containsObject:v4] & 1) == 0)
    {
      if (dword_100966D60 <= 10 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      ignoredTVs = self->_ignoredTVs;
      if (!ignoredTVs)
      {
        v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        uint64_t v15 = self->_ignoredTVs;
        self->_ignoredTVs = v14;

        ignoredTVs = self->_ignoredTVs;
      }
      [(NSMutableSet *)ignoredTVs addObject:v4];
    }
    goto LABEL_30;
  }
  unsigned int v9 = [(NSMutableDictionary *)self->_triggeredDevices objectForKeyedSubscript:v4];
  if (!v9)
  {
    if (!gSDProxCardsSuppressed)
    {
LABEL_14:
      if (![(SDAutoFillAgent *)self _uiShowing]
        && ([(SDStatusMonitor *)self->_statusMonitor systemUIFlags] & 0x7C809) == 0
        && [v16 needsSetup]
        && v5 == 19)
      {
        triggeredDevices = self->_triggeredDevices;
        if (!triggeredDevices)
        {
          id v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          id v12 = self->_triggeredDevices;
          self->_triggeredDevices = v11;

          triggeredDevices = self->_triggeredDevices;
        }
        [(NSMutableDictionary *)triggeredDevices setObject:v16 forKeyedSubscript:v4];
        [(SDAutoFillAgent *)self _uiStartIfEnabled:v16 extraInfo:0];
      }
      goto LABEL_31;
    }
LABEL_30:
    unsigned int v9 = 0;
    goto LABEL_31;
  }
  if (([v16 needsSetup] & 1) == 0)
  {
    [(SDAutoFillAgent *)self _deviceStoppedRequesting:v16];
    goto LABEL_31;
  }
  [(NSMutableDictionary *)self->_triggeredDevices setObject:v16 forKeyedSubscript:v4];
  if (v5 != 19) {
    [(SDAutoFillAgent *)self _deviceStoppedRequesting:v16];
  }
  if (self->_prefRateLimitDisabled && !gSDProxCardsSuppressed) {
    goto LABEL_14;
  }
LABEL_31:
  [(SDAutoFillAgent *)self _update];
}

- (void)_deviceFound:(id)a3
{
  id v19 = a3;
  id v4 = [v19 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_deviceDiscovery) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 && [v19 deviceActionType] == 19)
  {
    if (dword_100966D60 <= 10 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      id v18 = v19;
      LogPrintF();
    }
    devices = self->_devices;
    if (!devices)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      unsigned int v8 = self->_devices;
      self->_devices = v7;

      devices = self->_devices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v19, v4, v18);
    unsigned int v9 = [v19 bleDevice];
    id v10 = [v9 advertisementFields];
    id v11 = [v10 objectForKeyedSubscript:@"bdAddr"];

    if (v11)
    {
      id v12 = SFHexStringForData();
      uint64_t v13 = +[NSCharacterSet symbolCharacterSet];
      v14 = [v12 stringByTrimmingCharactersInSet:v13];

      btDevices = self->_btDevices;
      if (!btDevices)
      {
        id v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v17 = self->_btDevices;
        self->_btDevices = v16;

        btDevices = self->_btDevices;
      }
      [(NSMutableDictionary *)btDevices setObject:v19 forKeyedSubscript:v14];
    }
    [(SDAutoFillAgent *)self _update];
    [(SDAutoFillAgent *)self _deviceChanged:v19];
  }
}

- (void)_deviceLost:(id)a3
{
  id v12 = a3;
  id v4 = [v12 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966D60 <= 10 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    id v11 = v12;
    LogPrintF();
  }
  if (v4)
  {
    [(NSMutableDictionary *)self->_devices removeObjectForKey:v4];
    [(SDAutoFillAgent *)self _deviceStoppedRequesting:v12];
    BOOL v5 = [v12 bleDevice];
    id v6 = [v5 advertisementFields];
    v7 = [v6 objectForKeyedSubscript:@"bdAddr"];

    if (v7)
    {
      unsigned int v8 = SFHexStringForData();
      unsigned int v9 = +[NSCharacterSet symbolCharacterSet];
      id v10 = [v8 stringByTrimmingCharactersInSet:v9];

      [(NSMutableDictionary *)self->_btDevices removeObjectForKey:v10];
    }
    [(SDAutoFillAgent *)self _update];
  }
}

- (void)_deviceStoppedRequesting:(id)a3
{
  id v8 = a3;
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    id v6 = v8;
    LogPrintF();
  }
  -[SDAutoFillAgent _uiStop:](self, "_uiStop:", v8, v6);
  id v4 = [v8 identifier];
  if (v4)
  {
    BOOL v5 = [(NSMutableDictionary *)self->_grantedDevices objectForKeyedSubscript:v4];

    if (v5)
    {
      if (dword_100966D60 <= 50 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
      {
        id v7 = v8;
        LogPrintF();
      }
      -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v4, v7);
      [(NSMutableDictionary *)self->_grantedDevices removeObjectForKey:v4];
    }
  }
}

- (void)_clientClinkDeviceFound:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100966D60 <= 30)
  {
    id v6 = v3;
    if (dword_100966D60 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void)_clientClinkDeviceLost:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100966D60 <= 30)
  {
    id v6 = v3;
    if (dword_100966D60 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void)_clientClinkDeviceChanged:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100966D60 <= 30)
  {
    id v6 = v3;
    if (dword_100966D60 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (id)_rpCompanionLinkDeviceForSFDevice:(id)a3
{
  id v4 = a3;
  int v5 = [v4 name];
  id v23 = [v4 model];
  id v6 = [v4 idsIdentifier];
  id v7 = [v4 mediaRouteID];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(RPCompanionLinkClient *)self->_clinkClient activeDevices];
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    id v22 = v4;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = [v12 idsDeviceIdentifier];
        unsigned __int8 v14 = [v13 isEqualToString:v6];

        if (v14) {
          goto LABEL_20;
        }
        uint64_t v15 = [v12 mediaRouteIdentifier];
        unsigned __int8 v16 = [v15 isEqualToString:v7];

        if (v16) {
          goto LABEL_20;
        }
        id v17 = [v12 name];
        if ([v17 isEqualToString:v5])
        {
          id v18 = [v12 model];
          unsigned int v19 = [v18 isEqualToString:v23];

          if (v19)
          {
            if (dword_100966D60 <= 90 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
LABEL_20:
            id v20 = v12;
            id v4 = v22;
            goto LABEL_21;
          }
        }
        else
        {
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      id v20 = 0;
      id v4 = v22;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v20 = 0;
  }
LABEL_21:

  return v20;
}

- (int)helperStart:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [v4 setDispatchQueue:self->_dispatchQueue];
  [v4 setAgent:self];
  helpers = self->_helpers;
  if (!helpers)
  {
    id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v7 = self->_helpers;
    self->_helpers = v6;

    helpers = self->_helpers;
  }
  [(NSMutableSet *)helpers addObject:v4];
  [v4 activateWithCompletion:0];
  [(SDAutoFillAgent *)self _update];

  return 0;
}

- (void)helperStop:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(NSMutableSet *)self->_helpers removeObject:v4];
  [(SDAutoFillAgent *)self _sessionStop:0];
  [(SDAutoFillAgent *)self _update];
}

- (int)helper:(id)a3 didPickUsername:(id)a4 password:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (([(NSMutableSet *)self->_helpers containsObject:v10] & 1) == 0
    && dword_100966D60 <= 60
    && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  credentialsHandler = (void (**)(id, id, id, id))self->_credentialsHandler;
  if (credentialsHandler)
  {
    credentialsHandler[2](credentialsHandler, v11, v12, v13);
  }
  else if (dword_100966D60 <= 60 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!v13)
  {
    uint64_t v15 = [(SFRemoteAutoFillSession *)self->_grantingSession peerDevice];
    uint64_t v16 = [v15 identifier];
    id v17 = (void *)v16;
    if (v15 && v16)
    {
      if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
      {
        id v22 = v17;
        LogPrintF();
      }
      grantedDevices = self->_grantedDevices;
      if (!grantedDevices)
      {
        unsigned int v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v20 = self->_grantedDevices;
        self->_grantedDevices = v19;

        grantedDevices = self->_grantedDevices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](grantedDevices, "setObject:forKeyedSubscript:", v15, v17, v22);
    }
  }
  return 0;
}

- (int)helper:(id)a3 tryPIN:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    id v9 = v7;
    LogPrintF();
  }
  if ((-[NSMutableSet containsObject:](self->_helpers, "containsObject:", v6, v9) & 1) == 0
    && dword_100966D60 <= 60
    && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFRemoteAutoFillSession *)self->_grantingSession tryPIN:v7];

  return 0;
}

- (int)helper:(id)a3 userNotificationDidActivate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (([(NSMutableSet *)self->_helpers containsObject:v6] & 1) == 0
    && dword_100966D60 <= 60
    && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SDAutoFillAgent *)self _sessionStart:v7];

  return 0;
}

- (int)helper:(id)a3 userNotificationDidDismiss:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (([(NSMutableSet *)self->_helpers containsObject:v6] & 1) == 0
    && dword_100966D60 <= 60
    && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v8 = [v7 UUIDString];
  [(SDAutoFillAgent *)self notificiationDidDismiss:v8];

  return 0;
}

- (void)_helpersClientPairingSucceeded:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = self->_helpers;
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector()) {
          [v12 clientPairingSucceeded:v4 completion:v6];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_helpersClientPromptForPIN:(unsigned int)a3 throttleSeconds:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_helpers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 clientPromptForPIN:v5 throttleSeconds:v4];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_proximityEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_proximityDiscovery)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (SFBLEScanner *)[objc_alloc((Class)SFBLEScanner) initWithType:7];
    proximityDiscovery = self->_proximityDiscovery;
    self->_proximityDiscovery = v3;

    [(SFBLEScanner *)self->_proximityDiscovery setChangeFlags:13];
    [(SFBLEScanner *)self->_proximityDiscovery setDispatchQueue:self->_dispatchQueue];
    [(SFBLEScanner *)self->_proximityDiscovery setRssiThreshold:-60];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000A8B54;
    v9[3] = &unk_1008CAE28;
    v9[4] = self;
    [(SFBLEScanner *)self->_proximityDiscovery setDeviceFoundHandler:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000A8B60;
    v8[3] = &unk_1008CAE28;
    v8[4] = self;
    [(SFBLEScanner *)self->_proximityDiscovery setDeviceLostHandler:v8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A8B6C;
    v7[3] = &unk_1008CAE90;
    v7[4] = self;
    [(SFBLEScanner *)self->_proximityDiscovery setDeviceChangedHandler:v7];
    [(SFBLEScanner *)self->_proximityDiscovery activateWithCompletion:&stru_1008CC160];
    if (!self->_proximityController)
    {
      uint64_t v5 = +[SDProximityController sharedController];
      proximityController = self->_proximityController;
      self->_proximityController = v5;
    }
  }
}

- (void)_proximityEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_proximityDiscovery)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFBLEScanner *)self->_proximityDiscovery invalidate];
    proximityDiscovery = self->_proximityDiscovery;
    self->_proximityDiscovery = 0;
  }
  [(NSMutableDictionary *)self->_proximityDevices removeAllObjects];
  proximityDevices = self->_proximityDevices;
  self->_proximityDevices = 0;
}

- (void)_proximityChanged:(id)a3
{
  id v21 = a3;
  uint64_t v4 = [v21 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v4 || !self->_proximityDiscovery)
  {
    id v6 = 0;
    long long v13 = 0;
    id v5 = 0;
LABEL_36:
    id v7 = 0;
    goto LABEL_31;
  }
  id v5 = objc_alloc_init((Class)SFDevice);
  [v5 updateWithBLEDevice:v21];
  id v6 = [v5 model];
  if (![&off_100906E00 containsObject:v6])
  {
    long long v13 = 0;
    goto LABEL_36;
  }
  id v7 = [v21 proxPairProximityEstimator];
  if (!v7)
  {
    id v8 = +[SDNearbyAgent sharedNearbyAgent];
    uint64_t v9 = [v8 bleProximityInfoForType:@"rafp" device:v5];

    id v7 = +[SFProximityEstimator proximityEstimatorWithProximityInfo:v9];
    [v21 setProxPairProximityEstimator:v7];
  }
  [v7 updateWithSFBLEDevice:v21];
  unsigned int v10 = [v21 triggered];
  [(SDProximityController *)self->_proximityController sender:self notifyBluetoothSample:v5];
  unint64_t v11 = [(SDProximityController *)self->_proximityController checkDeviceRegion:v5];
  if (v11 == 2 && dword_100966D60 <= 50 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL v12 = v11 == 2;
  if (!_os_feature_enabled_impl()) {
    BOOL v12 = v10;
  }
  long long v13 = [(NSMutableDictionary *)self->_proximityDevices objectForKeyedSubscript:v4];
  if (v13)
  {
    if (v12)
    {
      [(NSMutableDictionary *)self->_proximityDevices setObject:v21 forKeyedSubscript:v4];
      goto LABEL_31;
    }
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      unsigned int v19 = v4;
      id v20 = [v21 rssiEstimate];
      LogPrintF();
    }
    -[NSMutableDictionary removeObjectForKey:](self->_proximityDevices, "removeObjectForKey:", v4, v19, v20);
  }
  else
  {
    if (!v12)
    {
      long long v13 = 0;
      goto LABEL_31;
    }
    long long v14 = v21;
    if (dword_100966D60 <= 30)
    {
      if (dword_100966D60 != -1 || (int v15 = _LogCategory_Initialize(), v14 = v21, v15))
      {
        unsigned int v19 = v4;
        id v20 = [v14 rssiEstimate];
        LogPrintF();
        long long v14 = v21;
      }
    }
    proximityDevices = self->_proximityDevices;
    if (!proximityDevices)
    {
      id v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v18 = self->_proximityDevices;
      self->_proximityDevices = v17;

      long long v14 = v21;
      proximityDevices = self->_proximityDevices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](proximityDevices, "setObject:forKeyedSubscript:", v14, v4, v19, v20);
  }
  [(SDAutoFillAgent *)self _update];
LABEL_31:
}

- (void)_proximityFound:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_proximityDiscovery) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if (dword_100966D60 <= 10 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[SDAutoFillAgent _proximityChanged:](self, "_proximityChanged:", v7, v7);
    }
    else
    {
      -[SDAutoFillAgent _proximityChanged:](self, "_proximityChanged:", v7, v6);
    }
  }
}

- (void)_proximityLost:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_proximityDiscovery) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if (dword_100966D60 <= 10 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      id v6 = v7;
      LogPrintF();
    }
    -[NSMutableDictionary removeObjectForKey:](self->_proximityDevices, "removeObjectForKey:", v4, v6);
    [(SDAutoFillAgent *)self _update];
  }
}

- (void)_rtiEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_rtiActivated)
  {
    id v3 = +[SDSharedRemoteTextInputClient sharedClient];
    [v3 addDelegate:self];

    self->_rtiActivated = 1;
  }
}

- (void)_rtiEnsureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_rtiActivated)
  {
    id v3 = +[SDSharedRemoteTextInputClient sharedClient];
    [v3 removeDelegate:self];

    self->_rtiActivated = 0;
  }
}

- (void)handleInputDidBeginWithFlags:(unint64_t)a3 sessionInfo:(id)a4
{
  id v21 = a4;
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    unint64_t v19 = a3;
    LogPrintF();
  }
  unint64_t v6 = a3 & 1;
  if (v6 != self->_autoFillContext)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      id v7 = "no";
      if (v6) {
        id v8 = "no";
      }
      else {
        id v8 = "yes";
      }
      if (v6) {
        id v7 = "yes";
      }
      unint64_t v19 = (unint64_t)v8;
      id v20 = v7;
      LogPrintF();
    }
    [v21 objectForKeyedSubscript:@"remoteAppIconData" v19, v20];
    uint64_t v9 = (NSData *)objc_claimAutoreleasedReturnValue();
    appIconData = self->_appIconData;
    self->_appIconData = v9;

    self->_autoFillContext = v6;
    unint64_t v11 = [v21 objectForKeyedSubscript:@"remoteLocalizedAppName"];
    requestingAppLocalizedName = self->_requestingAppLocalizedName;
    self->_requestingAppLocalizedName = v11;

    long long v13 = [v21 objectForKeyedSubscript:@"remoteUnlocalizedAppName"];
    requestingAppUnlocalizedName = self->_requestingAppUnlocalizedName;
    self->_requestingAppUnlocalizedName = v13;

    int v15 = [v21 objectForKeyedSubscript:@"remoteAssociatedDomains"];
    requestingAssociatedDomains = self->_requestingAssociatedDomains;
    self->_requestingAssociatedDomains = v15;

    id v17 = [v21 objectForKeyedSubscript:@"remoteBundleID"];
    requestingBundleID = self->_requestingBundleID;
    self->_requestingBundleID = v17;
  }
  [(SDAutoFillAgent *)self _update];
}

- (void)handleInputDidEndWithFlags:(unint64_t)a3 sessionInfo:(id)a4
{
  id v10 = a4;
  if (dword_100966D60 <= 30)
  {
    if (dword_100966D60 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  appIconData = self->_appIconData;
  self->_appIconData = 0;

  self->_autoFillContext = 0;
  requestingBundleID = self->_requestingBundleID;
  self->_requestingBundleID = 0;

  requestingAppLocalizedName = self->_requestingAppLocalizedName;
  self->_requestingAppLocalizedName = 0;

  requestingAppUnlocalizedName = self->_requestingAppUnlocalizedName;
  self->_requestingAppUnlocalizedName = 0;

  requestingAssociatedDomains = self->_requestingAssociatedDomains;
  self->_requestingAssociatedDomains = 0;

  [(SDAutoFillAgent *)self _update];
}

- (void)_siriRemoteMonitorEnsureStarted
{
  self->_siriRemoteMonitorState = 2;
}

- (void)_siriRemoteMonitorEnsureStopped
{
  self->_siriRemoteMonitorState = 0;
}

- (void)_serviceEnsureStarted
{
  if (!self->_requestingService)
  {
    if (dword_100966D60 <= 60 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_requestingServiceState = 2;
  }
}

- (void)_serviceEnsureStopped
{
  if (self->_requestingService)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SDAutoFillAgent *)self _serviceStopRequestingAutoFill];
    [(SFRemoteAutoFillService *)self->_requestingService invalidate];
    requestingService = self->_requestingService;
    self->_requestingService = 0;

    self->_requestingServiceState = 0;
  }
}

- (void)_serviceHandleError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (dword_100966D60 <= 60)
  {
    id v6 = v3;
    if (dword_100966D60 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
      uint64_t v4 = v6;
    }
  }
}

- (void)_serviceHandleUsername:(id)a3 password:(id)a4 error:(id)a5
{
  unint64_t v14 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  id v8 = (char *)a5;
  if (v8 && dword_100966D60 <= 60 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    BOOL v12 = v8;
    LogPrintF();
  }
  if (v14 | v7)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = "yes";
      if (v14) {
        id v10 = "yes";
      }
      else {
        id v10 = "no";
      }
      if (!v7) {
        uint64_t v9 = "no";
      }
      BOOL v12 = v10;
      long long v13 = v9;
      LogPrintF();
    }
    unint64_t v11 = +[SDSharedRemoteTextInputClient sharedClient];
    [v11 handleUsername:v14 password:v7];
  }
  else if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)_serviceShouldRequestAutoFill
{
  id v3 = +[MCProfileConnection sharedConnection];
  [v3 isPasswordProximityAutoFillRequestingAllowed];

  return self->_testingService;
}

- (void)_serviceStartRequestingAutoFillIfReady
{
  if (self->_siriRemoteMonitorState == 4)
  {
    if (self->_requestingServiceState == 4)
    {
      if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SFRemoteAutoFillService *)self->_requestingService startRequestingAutoFill];
      [(SDAutoFillAgent *)self _serviceTimeoutStart];
      return;
    }
    if (dword_100966D60 > 30 || dword_100966D60 == -1 && !_LogCategory_Initialize()) {
      return;
    }
  }
  else if (dword_100966D60 > 30 || dword_100966D60 == -1 && !_LogCategory_Initialize())
  {
    return;
  }

  LogPrintF();
}

- (void)_serviceStopRequestingAutoFill
{
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDAutoFillAgent *)self _serviceTimeoutStop];
  requestingService = self->_requestingService;

  [(SFRemoteAutoFillService *)requestingService stopRequestingAutoFill];
}

- (void)_serviceTimeoutStart
{
  requestingServiceTimer = self->_requestingServiceTimer;
  if (requestingServiceTimer)
  {
    uint64_t v4 = requestingServiceTimer;
    dispatch_source_cancel(v4);
    int v5 = self->_requestingServiceTimer;
    self->_requestingServiceTimer = 0;
  }
  self->_requestingServiceTimedOut = 0;
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  unint64_t v7 = self->_requestingServiceTimer;
  self->_requestingServiceTimer = v6;

  id v8 = self->_requestingServiceTimer;
  dispatch_time_t v9 = dispatch_time(0, 3600000000000);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  id v10 = self->_requestingServiceTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000A9CC0;
  handler[3] = &unk_1008CA4B8;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  dispatch_resume((dispatch_object_t)self->_requestingServiceTimer);
}

- (void)_serviceTimeoutStop
{
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  requestingServiceTimer = self->_requestingServiceTimer;
  if (requestingServiceTimer)
  {
    uint64_t v4 = requestingServiceTimer;
    dispatch_source_cancel(v4);
    int v5 = self->_requestingServiceTimer;
    self->_requestingServiceTimer = 0;
  }
  self->_requestingServiceTimedOut = 0;
}

- (void)_sessionStart:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v5 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];
    if (!v5)
    {
      id v5 = objc_alloc_init((Class)SFDevice);
      [v5 setIdentifier:v4];
    }
    grantingSession = self->_grantingSession;
    if (grantingSession) {
      [(SFRemoteAutoFillSession *)grantingSession invalidate];
    }
    unint64_t v7 = (SFRemoteAutoFillSession *)objc_alloc_init((Class)SFRemoteAutoFillSession);
    id v8 = self->_grantingSession;
    self->_grantingSession = v7;

    [(SFRemoteAutoFillSession *)self->_grantingSession setDispatchQueue:self->_dispatchQueue];
    [(SFRemoteAutoFillSession *)self->_grantingSession setPeerDevice:v5];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000AA1A0;
    v17[3] = &unk_1008CA5A8;
    v17[4] = self;
    [(SFRemoteAutoFillSession *)self->_grantingSession setCompletedHandler:v17];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000AA1AC;
    v15[3] = &unk_1008CA640;
    v15[4] = self;
    id v16 = v4;
    [(SFRemoteAutoFillSession *)self->_grantingSession setPairingFinishedHandler:v15];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000AA2F4;
    v14[3] = &unk_1008CC188;
    v14[4] = self;
    [(SFRemoteAutoFillSession *)self->_grantingSession setPromptForPickerHandler:v14];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000AA434;
    v13[3] = &unk_1008CC1B0;
    v13[4] = self;
    [(SFRemoteAutoFillSession *)self->_grantingSession setPromptForPINHandler:v13];
    [(SFRemoteAutoFillSession *)self->_grantingSession activate];
LABEL_11:

    goto LABEL_12;
  }
  if (dword_100966D60 <= 60 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    uint64_t v9 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    id v5 = (id)v9;
    CFStringRef v10 = @"?";
    if (v9) {
      CFStringRef v10 = (const __CFString *)v9;
    }
    CFStringRef v19 = v10;
    unint64_t v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    BOOL v12 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6705 userInfo:v11];
    LogPrintF();

    goto LABEL_11;
  }
LABEL_12:
}

- (void)_sessionStop:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SFRemoteAutoFillSession *)self->_grantingSession peerDevice];
    if (v5 && ([v4 code] == (id)-6723 || objc_msgSend(v4, "code") == (id)-71160))
    {
      [(SDAutoFillAgent *)self _uiStop:v5];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v6 = self->_helpers;
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v14;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) clientDismissUserNotification];
          }
          id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v8);
      }
    }
    if (dword_100966D60 <= 60 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
    {
      id v12 = v4;
      LogPrintF();
    }
  }
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SFRemoteAutoFillSession *)self->_grantingSession invalidate];
  grantingSession = self->_grantingSession;
  self->_grantingSession = 0;
}

- (void)_sessionHandlePairingSucceededResponse:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100966D60 <= 30)
  {
    id v6 = v3;
    if (dword_100966D60 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void)proximityDeviceDidTrigger:(id)a3
{
  id v4 = a3;
  if (dword_100966D60 <= 50 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    id v7 = v4;
    LogPrintF();
  }
  int v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_proximityDevices, "objectForKeyedSubscript:", v4, v7);

  if (v5)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AA7FC;
    block[3] = &unk_1008CA640;
    block[4] = self;
    id v9 = v4;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)testKeychain:(id)a3
{
  id v5 = a3;
  if (dword_100966D60 <= 50 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    id v4 = v5;
    LogPrintF();
  }
  -[SDAutoFillAgent _ensureKeychainCleaned:](self, "_ensureKeychainCleaned:", 1, v4);
}

- (void)testRemote:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100966D60 <= 50)
  {
    id v6 = v3;
    if (dword_100966D60 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void)testService:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (dword_100966D60 <= 50)
  {
    if (dword_100966D60 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v8, v5))
    {
      id v7 = v4;
      LogPrintF();
      id v4 = v8;
    }
  }
  if (objc_msgSend(v4, "isEqualToIgnoringCase:", @"-start", v7))
  {
    BOOL v6 = 1;
  }
  else
  {
    if (![v8 isEqualToIgnoringCase:@"-stop"]) {
      goto LABEL_10;
    }
    BOOL v6 = 0;
  }
  self->_testingService = v6;
  [(SDAutoFillAgent *)self _update];
LABEL_10:
}

- (void)testUI:(id)a3
{
  id v4 = a3;
  if (dword_100966D60 <= 50 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
  {
    id v12 = v4;
    LogPrintF();
  }
  id v5 = objc_alloc_init((Class)SFDevice);
  id v6 = objc_alloc((Class)NSUUID);
  if ([v4 isEqual:@"-fail"]) {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000002";
  }
  else {
    CFStringRef v7 = @"00000000-0000-0000-0000-000000000001";
  }
  id v8 = [v6 initWithUUIDString:v7, v12];
  [v5 setIdentifier:v8];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AABEC;
  block[3] = &unk_1008CAF18;
  id v14 = v4;
  long long v15 = self;
  id v16 = v5;
  id v10 = v5;
  id v11 = v4;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateUIDelayTimer
{
  if (!self->_uiDelayTimer)
  {
    if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    uiDelayTimer = self->_uiDelayTimer;
    self->_uiDelayTimer = v3;

    id v5 = self->_uiDelayTimer;
    dispatch_time_t v6 = dispatch_time(0, 500000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
    CFStringRef v7 = self->_uiDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000AAE68;
    handler[3] = &unk_1008CA4B8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_uiDelayTimer);
  }
}

- (void)_deactivateUIDelayTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uiDelayTimer = self->_uiDelayTimer;
  if (uiDelayTimer)
  {
    id v4 = uiDelayTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_uiDelayTimer;
    self->_uiDelayTimer = 0;
  }
  self->_uiDelayActive = 0;
  uiDelayDevice = self->_uiDelayDevice;
  self->_uiDelayDevice = 0;
}

- (void)passwordPickerStart:(id)a3 bundleID:(id)a4 localizedAppName:(id)a5 unlocalizedAppName:(id)a6 associatedDomains:(id)a7 appIconData:(id)a8 deviceName:(id)a9 completion:(id)a10
{
  id v15 = a10;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a5;
  id v20 = a4;
  id v21 = objc_retainBlock(v15);
  id credentialsHandler = self->_credentialsHandler;
  self->_id credentialsHandler = v21;

  id v23 = [objc_alloc((Class)ASCCredentialRequestContext) initWithRequestTypes:1];
  [v23 setProxiedAppName:v19];

  [v23 setProxiedAssociatedDomains:v18];
  [v23 setProxiedBundleIdentifier:v20];

  [v23 setProxiedIconData:v17];
  [v23 setProxiedIconScale:&off_1009028F8];
  [v23 setProxiedOriginDeviceName:v16];

  uint64_t v24 = (ASCAgentProxy *)objc_alloc_init((Class)ASCAgentProxy);
  ascAgentProxy = self->_ascAgentProxy;
  self->_ascAgentProxy = v24;

  long long v26 = self->_ascAgentProxy;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000AB1A8;
  v28[3] = &unk_1008CC218;
  id v27 = v15;
  id v29 = v27;
  [(ASCAgentProxy *)v26 performAuthorizationRequestsForContext:v23 withCompletionHandler:v28];
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_uiStartIfEnabled:(id)a3 extraInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_1000AB428;
  id v19 = sub_1000AB438;
  id v20 = 0;
  id v20 = objc_alloc_init(off_100966DD0());
  id v8 = (void *)v16[5];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_1000AB440;
  v11[3] = &unk_1008CC240;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  id v14 = &v15;
  [v8 getRemoteAutoFillAvailabilityWithCompletionHandler:v11];

  _Block_object_dispose(&v15, 8);
}

- (void)_uiStartIfNeeded:(id)a3 extraInfo:(id)a4
{
  id v21 = a3;
  id v7 = a4;
  id v8 = [v21 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gSDProxCardsSuppressed
    || self->_preventNotifications
    || [(SDAutoFillAgent *)self _uiShowing]
    || ([(SDStatusMonitor *)self->_statusMonitor systemUIFlags] & 0x7C809) != 0)
  {
    goto LABEL_36;
  }
  if ([v21 deviceClassCode] != 6) {
    goto LABEL_15;
  }
  if (self->_prefRequiresProx)
  {
    if (![(NSMutableDictionary *)self->_proximityDevices count])
    {
      if (dword_100966D60 <= 10 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
      {
        id v20 = v8;
        LogPrintF();
      }
      -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v8, v20);
      goto LABEL_36;
    }
    goto LABEL_15;
  }
  id v9 = [(RPCompanionLinkClient *)self->_clinkClient activeDevices];
  id v10 = SFDeviceToRPCompanionLinkDevice();

  if (!v10)
  {
    id v10 = [(SDAutoFillAgent *)self _rpCompanionLinkDeviceForSFDevice:v21];
    if (!v10)
    {
      uint64_t v17 = +[SDNearbyAgent sharedNearbyAgent];
      id v18 = [v17 idsBluetoothDeviceIDsForSharing];
      unsigned __int8 v19 = [v18 containsObject:v8];

      if ((v19 & 1) == 0) {
        goto LABEL_36;
      }
      goto LABEL_15;
    }
  }
  id v11 = [v10 activeUserAltDSID];
  id v12 = objc_alloc_init(off_100966DD8());
  id v13 = [v12 aa_primaryAppleAccount];
  id v14 = [v13 aa_altDSID];
  if ([v14 isEqualToString:v11])
  {

LABEL_15:
    uint64_t v15 = [(SDNotificationManager *)self->_notificationManager activeTVAutoFillPrompts];
    unsigned __int8 v16 = [v15 containsObject:v8];

    if ((v16 & 1) == 0)
    {
      if (self->_uiDelayActive)
      {
        if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        objc_storeStrong((id *)&self->_uiDelayDevice, a3);
      }
      else
      {
        if (dword_100966D60 <= 50 && (dword_100966D60 != -1 || _LogCategory_Initialize()))
        {
          id v20 = v21;
          LogPrintF();
        }
        -[SDAutoFillAgent _uiStart:extraInfo:](self, "_uiStart:extraInfo:", v21, v7, v20);
      }
    }
    goto LABEL_36;
  }
  if (dword_100966D60 <= 30 && (dword_100966D60 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

LABEL_36:
}

- (void)_uiStart:(id)a3 extraInfo:(id)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = v6;
  if (v6)
  {
    [(SDNotificationManager *)self->_notificationManager tvAutoFillPostIfNeeded:v6];
    id v5 = v6;
  }
}

- (void)_uiStop:(id)a3
{
  id v4 = a3;
  grantingSession = self->_grantingSession;
  id v14 = v4;
  if (!grantingSession) {
    goto LABEL_8;
  }
  id v6 = [(SFRemoteAutoFillSession *)grantingSession peerDevice];
  id v7 = [v6 identifier];
  id v8 = [v14 identifier];
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {

LABEL_9:
    id v13 = v14;
    goto LABEL_10;
  }
  id v11 = v10;
  if ((v9 == 0) == (v10 != 0))
  {

    goto LABEL_8;
  }
  unsigned __int8 v12 = [v9 isEqual:v10];

  id v13 = v14;
  if ((v12 & 1) == 0)
  {
LABEL_8:
    [(SDNotificationManager *)self->_notificationManager tvAutoFillRemove:v14];
    goto LABEL_9;
  }
LABEL_10:
}

- (BOOL)_uiShowing
{
  v2 = [(SDNotificationManager *)self->_notificationManager activeTVAutoFillPrompts];
  id v3 = v2;
  if (v2) {
    BOOL v4 = [v2 count] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)preventNotifications
{
  return self->_preventNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong((id *)&self->_uiDelayTimer, 0);
  objc_storeStrong((id *)&self->_uiDelayDevice, 0);
  objc_storeStrong((id *)&self->_triggeredDevices, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_requestingServiceTimer, 0);
  objc_storeStrong((id *)&self->_requestingService, 0);
  objc_storeStrong((id *)&self->_requestingBundleID, 0);
  objc_storeStrong((id *)&self->_requestingAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_requestingAppUnlocalizedName, 0);
  objc_storeStrong((id *)&self->_requestingAppLocalizedName, 0);
  objc_storeStrong((id *)&self->_proximityDiscovery, 0);
  objc_storeStrong((id *)&self->_proximityDevices, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_ignoredTVs, 0);
  objc_storeStrong((id *)&self->_helpers, 0);
  objc_storeStrong((id *)&self->_grantedDevices, 0);
  objc_storeStrong((id *)&self->_grantingSession, 0);
  objc_storeStrong((id *)&self->_btDevices, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong(&self->_credentialsHandler, 0);
  objc_storeStrong((id *)&self->_clinkClient, 0);
  objc_storeStrong((id *)&self->_ascAgentProxy, 0);

  objc_storeStrong((id *)&self->_appIconData, 0);
}

@end