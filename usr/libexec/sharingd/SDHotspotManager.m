@interface SDHotspotManager
- (BOOL)capturingTailspin;
- (BOOL)flippedHotspotSwitch;
- (BOOL)isNetworkHostAP:(__WiFiNetwork *)a3;
- (BOOL)isP2PAllowed;
- (BOOL)isTethering;
- (BOOL)isTetheringInUse;
- (BOOL)isTetheringSupported;
- (BOOL)maxConnectionsReached;
- (BOOL)netRBTetheringSupported;
- (BOOL)setHotspotPassword:(id)a3;
- (BOOL)shouldTurnOffTethering;
- (BOOL)startedHostAP;
- (NSMutableArray)handlers;
- (NSNumber)p2pAllowedCache;
- (NSString)hotspotName;
- (NSString)hotspotPassword;
- (NSTimer)networkTimer;
- (OS_dispatch_queue)workQueue;
- (SDHotspotManager)initWithDelegate:(id)a3;
- (SDHotspotManagerDelegate)delegate;
- (id)_createDefaultPassword;
- (id)hostAPNetwork;
- (id)hotspotChannel;
- (void)addObservers;
- (void)dealloc;
- (void)debugInfoRequest:(id)a3;
- (void)disableMISImmediately;
- (void)firstUnlockStateChanged:(id)a3;
- (void)handleHostAPChanged:(id)a3;
- (void)invalidateNetworkTimer;
- (void)misStateChanged:(id)a3;
- (void)networkTimerFired:(id)a3;
- (void)notifyHostAPActivated;
- (void)notifyHostAPError:(id)a3;
- (void)onqueue_captureTailspin;
- (void)onqueue_cleanUpFailedNetworkBringUp;
- (void)onqueue_handleHostAPChanged:(id)a3;
- (void)onqueue_handleSwitchCondtionsChanged;
- (void)onqueue_startTetheringWithCompletionHandler:(id)a3 modelID:(id)a4 productVersion:(id)a5 canConnectOn5GHz:(BOOL)a6;
- (void)onqueue_updateHostAPNetwork;
- (void)onqueue_updateTetheringSupported;
- (void)personalHotspotAllowedChanged:(id)a3;
- (void)removeObservers;
- (void)restartNetworkTimer;
- (void)setCapturingTailspin:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFlippedHotspotSwitch:(BOOL)a3;
- (void)setHandlers:(id)a3;
- (void)setHostAPNetwork:(id)a3;
- (void)setMaxConnectionsReached:(BOOL)a3;
- (void)setNetworkTimer:(id)a3;
- (void)setP2pAllowedCache:(id)a3;
- (void)setStartedHostAP:(BOOL)a3;
- (void)setTetheringSupported:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)simStateChanged:(id)a3;
- (void)startTetheringWithCompletionHandler:(id)a3 modelID:(id)a4 productVersion:(id)a5 canConnectOn5GHz:(BOOL)a6;
- (void)stopTethering;
- (void)turnOffDiscovery;
@end

@implementation SDHotspotManager

- (SDHotspotManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SDHotspotManager;
  v5 = [(SDHotspotManager *)&v19 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_startedHostAP = 0;
    networkTimer = v6->_networkTimer;
    v6->_networkTimer = 0;

    id hostAPNetwork = v6->_hostAPNetwork;
    v6->_id hostAPNetwork = 0;

    v6->_flippedHotspotSwitch = 0;
    uint64_t v9 = objc_opt_new();
    handlers = v6->_handlers;
    v6->_handlers = (NSMutableArray *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.SDHotspotManager-work", 0);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc_init(SDMISManager);
    misManager = v6->_misManager;
    v6->_misManager = v13;

    [(SDMISManager *)v6->_misManager setDelegate:v6];
    [(SDHotspotManager *)v6 addObservers];
    v15 = v6->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001882F4;
    block[3] = &unk_1008CA4B8;
    v18 = v6;
    dispatch_async(v15, block);
  }
  return v6;
}

- (void)dealloc
{
  [(SDHotspotManager *)self removeObservers];
  misManager = self->_misManager;
  self->_misManager = 0;

  v4.receiver = self;
  v4.super_class = (Class)SDHotspotManager;
  [(SDHotspotManager *)&v4 dealloc];
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"debugInfoRequest:" name:@"com.apple.sharingd.DebugInfoRequested" object:0];
  [v3 addObserver:self selector:"firstUnlockStateChanged:" name:@"com.apple.sharingd.KeyBagFirstUnlock" object:0];
  [v3 addObserver:self selector:"simStateChanged:" name:@"com.apple.sharingd.SIMStateChanged" object:0];
  [v3 addObserver:self selector:"personalHotspotAllowedChanged:" name:@"com.apple.sharingd.PersonalHotspotAllowedChanged" object:0];
  [v3 addObserver:self selector:"handleHostAPChanged:" name:@"com.apple.sharingd.HotspotHostAPStateChanged" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)debugInfoRequest:(id)a3
{
  id v23 = (id)objc_opt_new();
  if ([(SDHotspotManager *)self netRBTetheringSupported]) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  v5 = +[NSString stringWithFormat:@"NetRB Tethering Supported:%@", v4];
  [v23 addObject:v5];

  v6 = +[SDStatusMonitor sharedMonitor];
  if ([v6 deviceWasUnlockedOnce]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  v8 = +[NSString stringWithFormat:@"First Unlocked:%@", v7];
  [v23 addObject:v8];

  uint64_t v9 = +[SDStatusMonitor sharedMonitor];
  id v10 = [v9 wifiManager];

  if (v10)
  {
    if (WiFiManagerClientIsTetheringSupported()) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    v12 = +[NSString stringWithFormat:@"Wifi Tethering Supported:%@", v11];
    [v23 addObject:v12];

    if (WiFiManagerClientGetMISDiscoveryState()) {
      CFStringRef v13 = @"YES";
    }
    else {
      CFStringRef v13 = @"NO";
    }
    v14 = +[NSString stringWithFormat:@"Wifi Discovery State:%@", v13];
    [v23 addObject:v14];
  }
  v15 = [(SDHotspotManager *)self hostAPNetwork];
  if (v15) {
    CFStringRef v16 = @"YES";
  }
  else {
    CFStringRef v16 = @"NO";
  }
  v17 = +[NSString stringWithFormat:@"HostAp Network Up:%@", v16];
  [v23 addObject:v17];

  v18 = +[NSString stringWithFormat:@"Connected Hosts:%d", [(SDMISManager *)self->_misManager connectedHosts]];
  [v23 addObject:v18];

  if ([(SDHotspotManager *)self flippedHotspotSwitch]) {
    CFStringRef v19 = @"YES";
  }
  else {
    CFStringRef v19 = @"NO";
  }
  v20 = +[NSString stringWithFormat:@"We turned switch on:%@", v19];
  [v23 addObject:v20];

  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  sub_100047144(v22, (uint64_t)v23);
}

- (void)firstUnlockStateChanged:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001887E0;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)simStateChanged:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018885C;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)personalHotspotAllowedChanged:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001888D8;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (BOOL)netRBTetheringSupported
{
  int v5 = 0;
  int v4 = 0;
  [(SDMISManager *)self->_misManager getState:&v5 andReason:&v4];
  return (v5 & 0xFFFFFFFE) == 0x3FE && v4 != 4;
}

- (void)onqueue_updateTetheringSupported
{
  unsigned int v3 = [(SDHotspotManager *)self isTetheringSupported];
  int v4 = +[SDStatusMonitor sharedMonitor];
  id v5 = [v4 wifiManager];

  if (v5) {
    BOOL v6 = WiFiManagerClientIsTetheringSupported() == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (self->_misManager) {
    unsigned int v7 = ![(SDHotspotManager *)self netRBTetheringSupported];
  }
  else {
    unsigned int v7 = 1;
  }
  v8 = +[SDStatusMonitor sharedMonitor];
  unsigned int v9 = [v8 deviceWasUnlockedOnce];

  id v10 = +[SDStatusMonitor sharedMonitor];
  unsigned int v11 = [v10 simStateReady];

  v12 = +[SDStatusMonitor sharedMonitor];
  unsigned int v13 = [v12 personalHotspotAllowed];

  __int16 v28 = 0;
  v14 = +[SDStatusMonitor sharedMonitor];
  [v14 cellularDataEnabled:&v28 airplaneMode:(char *)&v28 + 1];

  BOOL v15 = 0;
  if ((v13 ^ 1 | v6) != 1 && !v7 && v9 && v11 && !HIBYTE(v28)) {
    BOOL v15 = (_BYTE)v28 != 0;
  }
  CFStringRef v16 = tethering_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = @"NO";
    if (v15) {
      CFStringRef v18 = @"YES";
    }
    else {
      CFStringRef v18 = @"NO";
    }
    if (v6) {
      CFStringRef v19 = @"NO";
    }
    else {
      CFStringRef v19 = @"YES";
    }
    *(_DWORD *)buf = 138414082;
    CFStringRef v30 = v18;
    if (v7) {
      CFStringRef v20 = @"NO";
    }
    else {
      CFStringRef v20 = @"YES";
    }
    __int16 v31 = 2112;
    CFStringRef v32 = v19;
    if (v9) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    __int16 v33 = 2112;
    if (v11) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    CFStringRef v34 = v20;
    if (v13) {
      CFStringRef v23 = @"YES";
    }
    else {
      CFStringRef v23 = @"NO";
    }
    __int16 v35 = 2112;
    if (HIBYTE(v28)) {
      CFStringRef v24 = @"YES";
    }
    else {
      CFStringRef v24 = @"NO";
    }
    CFStringRef v36 = v21;
    if ((_BYTE)v28) {
      CFStringRef v17 = @"YES";
    }
    __int16 v37 = 2112;
    CFStringRef v38 = v22;
    __int16 v39 = 2112;
    CFStringRef v40 = v23;
    __int16 v41 = 2112;
    CFStringRef v42 = v24;
    __int16 v43 = 2112;
    CFStringRef v44 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updated tethering support result = %@, wifiResult = %@, netRBResult = %@, firstUnlocked = %@, simStateReady = %@, allowed = %@, airplaneMode = %@, cell data enabled = %@", buf, 0x52u);
  }

  [(SDHotspotManager *)self setTetheringSupported:v15];
  if (v3 != [(SDHotspotManager *)self isTetheringSupported])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      id v27 = objc_loadWeakRetained((id *)&self->_delegate);
      [v27 hotspotManagerTetheringSupportChanged:self];
    }
  }
}

- (void)onqueue_updateHostAPNetwork
{
  p_id hostAPNetwork = &self->_hostAPNetwork;
  id hostAPNetwork = self->_hostAPNetwork;
  self->_id hostAPNetwork = 0;

  CFTypeRef cf = 0;
  id v5 = +[SDStatusMonitor sharedMonitor];
  id v6 = [v5 defaultWiFiDevice];

  if (v6)
  {
    int v7 = WiFiDeviceClientCopyHostedNetworks();
    if (v7)
    {
      int v8 = v7;
      unsigned int v9 = tethering_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10018B3DC(v8, v9);
      }
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      unsigned int v9 = (id)cf;
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v9);
            }
            BOOL v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if ([(SDHotspotManager *)self isNetworkHostAP:v15])
            {
              objc_storeStrong(p_hostAPNetwork, v15);
              CFStringRef v16 = tethering_log();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)CFStringRef v17 = 0;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Host AP network up", v17, 2u);
              }
            }
          }
          id v12 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v12);
      }
    }

    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    id v10 = tethering_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10018B3A8();
    }
  }
}

- (void)onqueue_handleSwitchCondtionsChanged
{
  uint64_t v5 = 0;
  [(SDMISManager *)self->_misManager getState:(char *)&v5 + 4 andReason:&v5];
  if (HIDWORD(v5) == 1023)
  {
    if ([(SDHotspotManager *)self shouldTurnOffTethering]) {
      [(SDMISManager *)self->_misManager setState:1022];
    }
  }
  else
  {
    self->_flippedHotspotSwitch = 0;
    unsigned int v3 = tethering_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_flippedHotspotSwitch) {
        CFStringRef v4 = @"YES";
      }
      else {
        CFStringRef v4 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Flipped switch on state being reset to %@", buf, 0xCu);
    }
  }
}

- (BOOL)shouldTurnOffTethering
{
  unsigned int v3 = +[SDStatusMonitor sharedMonitor];
  id v4 = [v3 wifiManager];

  uint64_t v5 = tethering_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(SDMISManager *)self->_misManager connectedHosts];
    if ([(SDMISManager *)self->_misManager hostIsOnlyUSBEthernet]) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    if (self->_flippedHotspotSwitch) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    if (WiFiManagerClientGetMISDiscoveryState()) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    id v10 = [(SDHotspotManager *)self hostAPNetwork];
    networkTimer = self->_networkTimer;
    if (v10) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    v16[0] = 67110658;
    v16[1] = v6;
    __int16 v17 = 2112;
    CFStringRef v18 = v7;
    __int16 v19 = 2112;
    CFStringRef v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2112;
    CFStringRef v24 = v9;
    __int16 v25 = 2112;
    CFStringRef v26 = v12;
    __int16 v27 = 2112;
    __int16 v28 = networkTimer;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connected hosts = %d, only usb = %@, flipped switch on = %@, wifiClient = %@, discovery state = %@, id hostAPNetwork = %@, network timer = %@", (uint8_t *)v16, 0x44u);
  }
  if ([(SDMISManager *)self->_misManager connectedHosts]
    && ![(SDMISManager *)self->_misManager hostIsOnlyUSBEthernet])
  {
    return 0;
  }
  BOOL v13 = 0;
  if (self->_flippedHotspotSwitch && v4)
  {
    if (WiFiManagerClientGetMISDiscoveryState()) {
      return 0;
    }
    BOOL v15 = [(SDHotspotManager *)self hostAPNetwork];
    if (v15) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = self->_networkTimer == 0;
    }
  }
  return v13;
}

- (BOOL)isTethering
{
  int v4 = 1021;
  int v3 = 0;
  [(SDMISManager *)self->_misManager getState:&v4 andReason:&v3];
  return v4 == 1023;
}

- (BOOL)isP2PAllowed
{
  v2 = +[SDStatusMonitor sharedMonitor];
  id v3 = [v2 wifiManager];

  return v3 && WiFiManagerClientIsP2PAllowed() != 0;
}

- (BOOL)isTetheringInUse
{
  CFTypeRef cf = 0;
  id v3 = +[SDStatusMonitor sharedMonitor];
  id v4 = [v3 defaultWiFiDevice];

  if (v4)
  {
    int v5 = WiFiDeviceClientCopyHostedNetworks();
    if (v5 == 5)
    {
      int v14 = 0;
    }
    else
    {
      int v6 = v5;
      if (v5)
      {
        CFStringRef v7 = tethering_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_10018B3DC(v6, v7);
        }
      }
      else
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        CFStringRef v7 = (id)cf;
        id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v16;
          while (2)
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v16 != v10) {
                objc_enumerationMutation(v7);
              }
              if (-[SDHotspotManager isNetworkHostAP:](self, "isNetworkHostAP:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
              {
                int v14 = 1;
                goto LABEL_21;
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
      }
      int v14 = 0;
LABEL_21:
    }
    if (cf) {
      CFRelease(cf);
    }
    return v14 != 0;
  }
  else
  {
    CFStringRef v12 = tethering_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10018B3A8();
    }

    return 0;
  }
}

- (void)startTetheringWithCompletionHandler:(id)a3 modelID:(id)a4 productVersion:(id)a5 canConnectOn5GHz:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001894A0;
  block[3] = &unk_1008CF0C8;
  void block[4] = self;
  id v18 = v11;
  id v19 = v12;
  id v20 = v10;
  BOOL v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(workQueue, block);
}

- (void)onqueue_startTetheringWithCompletionHandler:(id)a3 modelID:(id)a4 productVersion:(id)a5 canConnectOn5GHz:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = (void (**)(id, void *, void *, void *, void))a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v39 = 0;
  if ([(SDHotspotManager *)self isTetheringSupported])
  {
    BOOL v13 = tethering_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating password if needed", buf, 2u);
    }

    id v14 = [(SDHotspotManager *)self hotspotPassword];
    id v15 = tethering_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Checking WiFi power", buf, 2u);
    }

    id v16 = +[SDStatusMonitor sharedMonitor];
    unsigned __int8 v17 = [v16 wirelessEnabled];

    if ((v17 & 1) == 0)
    {
      id v18 = tethering_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Turning on Wifi", buf, 2u);
      }

      id v19 = +[SDStatusMonitor sharedMonitor];
      [v19 setWirelessEnabled:1];
    }
    id v20 = tethering_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Fetching WiFi manager", buf, 2u);
    }

    BOOL v21 = +[SDStatusMonitor sharedMonitor];
    id v22 = [v21 wifiManager];

    if (v22)
    {
      __int16 v23 = tethering_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Checking MIS state", buf, 2u);
      }

      if (!WiFiManagerClientGetMISDiscoveryState()) {
        self->_startedHostAP = 1;
      }
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        __int16 v25 = Mutable;
        CFDictionaryAddValue(Mutable, @"SOFTAP_ENABLE", kCFBooleanTrue);
        if (v6) {
          CFBooleanRef v26 = kCFBooleanFalse;
        }
        else {
          CFBooleanRef v26 = kCFBooleanTrue;
        }
        CFDictionaryAddValue(v25, @"SOFTAP_FORCE_2_4G_CHANNEL", v26);
        CFDictionaryAddValue(v25, @"SOFTAP_IMMEDIATE_DISABLE", kCFBooleanFalse);
        if (v11) {
          CFDictionaryAddValue(v25, @"SOFTAP_SOFTAP_CAP_MODEL", v11);
        }
        if (v12) {
          CFDictionaryAddValue(v25, @"SOFTAP_SOFTAP_OS_VER", v12);
        }
        __int16 v27 = tethering_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v28 = @"YES";
          if (!self->_startedHostAP) {
            CFStringRef v28 = @"NO";
          }
          *(_DWORD *)buf = 138412546;
          CFStringRef v43 = v28;
          __int16 v44 = 2112;
          v45 = v25;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Setting MIS Discovery state to YES, we started it = %@ with params: %@", buf, 0x16u);
        }

        WiFiManagerClientSetMISDiscoveryStateExt();
        CFRelease(v25);
      }
      else
      {
        CFStringRef v30 = tethering_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_10018B454();
        }
      }
      [(SDMISManager *)self->_misManager getState:(char *)&v39 + 4 andReason:&v39];
      if (HIDWORD(v39) == 1022)
      {
        [(SDMISManager *)self->_misManager setState:1023];
        self->_flippedHotspotSwitch = 1;
      }
      [(SDHotspotManager *)self onqueue_updateHostAPNetwork];
      __int16 v31 = [(SDHotspotManager *)self hostAPNetwork];

      CFStringRef v32 = tethering_log();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (v31)
      {
        if (v33)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Network already up", buf, 2u);
        }

        CFStringRef v34 = [(SDHotspotManager *)self hotspotName];
        __int16 v35 = [(SDHotspotManager *)self hotspotPassword];
        CFStringRef v36 = [(SDHotspotManager *)self hotspotChannel];
        v10[2](v10, v34, v35, v36, 0);

        [(SDHotspotManager *)self turnOffDiscovery];
        self->_startedHostAP = 0;
      }
      else
      {
        if (v33)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Bringing up the network, queuing handler", buf, 2u);
        }

        handlers = self->_handlers;
        id v38 = [v10 copy];
        [(NSMutableArray *)handlers addObject:v38];

        [(SDHotspotManager *)self restartNetworkTimer];
      }
    }
  }
  else
  {
    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    CFStringRef v41 = @"Tethering is not supported";
    id v14 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    v29 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:v14];
    ((void (**)(id, void *, void *, void *, void *))v10)[2](v10, 0, 0, 0, v29);
  }
}

- (void)stopTethering
{
  id v3 = +[SDStatusMonitor sharedMonitor];
  id v4 = [v3 wifiManager];

  if (v4)
  {
    *(_OWORD *)keys = *(_OWORD *)&off_1008CF108;
    v8[0] = kCFBooleanFalse;
    v8[1] = kCFBooleanTrue;
    CFDictionaryRef v5 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, v8, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v5)
    {
      CFDictionaryRef v6 = v5;
      WiFiManagerClientSetMISDiscoveryStateExt();
      CFRelease(v6);
    }
    else
    {
      CFStringRef v7 = tethering_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10018B488();
      }
    }
  }
  [(SDMISManager *)self->_misManager setState:1022];
}

- (void)turnOffDiscovery
{
  dispatch_time_t v2 = dispatch_time(0, 3000000000);

  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, &stru_1008CF0E8);
}

- (void)disableMISImmediately
{
  dispatch_time_t v2 = +[SDStatusMonitor sharedMonitor];
  id v3 = [v2 wifiManager];

  if (v3)
  {
    id v4 = tethering_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Disabling MIS", buf, 2u);
    }

    *(_OWORD *)buf = *(_OWORD *)&off_1008CF108;
    v8[0] = kCFBooleanFalse;
    v8[1] = kCFBooleanTrue;
    CFDictionaryRef v5 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)buf, v8, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v5)
    {
      CFDictionaryRef v6 = v5;
      WiFiManagerClientSetMISDiscoveryStateExt();
      CFRelease(v6);
    }
    else
    {
      CFStringRef v7 = tethering_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10018B488();
      }
    }
    WiFiManagerClientSetMISState();
  }
}

- (void)onqueue_cleanUpFailedNetworkBringUp
{
  NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
  CFStringRef v13 = @"Could not bring up Personal Hotspot WiFi network";
  id v3 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:50 userInfo:v3];
  [(SDHotspotManager *)self notifyHostAPError:v4];

  CFDictionaryRef v5 = +[SDStatusMonitor sharedMonitor];
  id v6 = [v5 wifiManager];

  if (v6)
  {
    *(_OWORD *)keys = *(_OWORD *)&off_1008CF108;
    v10[0] = kCFBooleanFalse;
    v10[1] = kCFBooleanTrue;
    CFDictionaryRef v7 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, v10, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v7)
    {
      CFDictionaryRef v8 = v7;
      WiFiManagerClientSetMISDiscoveryStateExt();
      CFRelease(v8);
    }
    else
    {
      id v9 = tethering_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10018B488();
      }
    }
  }
  [(SDHotspotManager *)self onqueue_handleSwitchCondtionsChanged];
}

- (void)restartNetworkTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018A134;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)networkTimerFired:(id)a3
{
  id v4 = tethering_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10018B4BC();
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018A28C;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)invalidateNetworkTimer
{
  if (self->_networkTimer)
  {
    id v3 = tethering_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFDictionaryRef v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating network timer", v5, 2u);
    }

    [(NSTimer *)self->_networkTimer invalidate];
    networkTimer = self->_networkTimer;
    self->_networkTimer = 0;
  }
}

- (void)onqueue_captureTailspin
{
  if (sub_1000D9060(@"EnableSoftAPTailspin", 0) && !self->_capturingTailspin)
  {
    self->_capturingTailspin = 1;
    id v3 = tethering_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Capturing tailspin", buf, 2u);
    }

    id v4 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    CFDictionaryRef v5 = +[NSLocale autoupdatingCurrentLocale];
    [v4 setLocale:v5];

    id v6 = objc_opt_new();
    BOOL v21 = v4;
    CFDictionaryRef v7 = [v4 components:2097404 fromDate:v6];

    id v8 = [v7 year];
    id v9 = [v7 month];
    id v10 = [v7 day];
    id v11 = [v7 hour];
    id v12 = [v7 minute];
    id v13 = [v7 second];
    id v14 = [v7 timeZone];
    id v15 = [v14 abbreviation];
    id v16 = +[NSString stringWithFormat:@"%02ld-%02ld-%02ld_%02ld:%02ld:%02ld_%@", v8, v9, v10, v11, v12, v13, v15];

    unsigned __int8 v17 = +[NSString stringWithFormat:@"/var/tmp/InstantHotspot_%@.tailspin", v16];
    id v18 = +[NSFileManager defaultManager];
    [v18 createFileAtPath:v17 contents:0 attributes:0];

    id v19 = +[NSFileHandle fileHandleForUpdatingAtPath:v17];
    if (v19)
    {
      id v20 = dispatch_get_global_queue(-32768, 0);
      [v19 fileDescriptor];
      id v22 = v19;
      tailspin_dump_output();
    }
  }
}

- (NSString)hotspotName
{
  id v3 = [(SDHotspotManager *)self hostAPNetwork];

  if (v3)
  {
    id v4 = [(SDHotspotManager *)self hostAPNetwork];
    WiFiNetworkGetSSID();
    CFDictionaryRef v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFDictionaryRef v5 = &stru_1008E7020;
  }

  return (NSString *)v5;
}

- (BOOL)setHotspotPassword:(id)a3
{
  id v3 = a3;
  id v4 = +[SDStatusMonitor sharedMonitor];
  id v5 = [v4 wifiManager];

  if (v5)
  {
    id v6 = tethering_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting new password", v8, 2u);
    }

    LOBYTE(v5) = WiFiManagerClientSetMisPassword() == 1;
  }

  return (char)v5;
}

- (id)_createDefaultPassword
{
  id v3 = +[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
  v12[0] = v3;
  id v4 = +[NSCharacterSet characterSetWithCharactersInString:@"1234567890"];
  v12[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v12 count:2];

  v10[0] = kSecPasswordMinLengthKey;
  v10[1] = kSecPasswordMaxLengthKey;
  v11[0] = &off_100902D00;
  v11[1] = &off_100902D00;
  v10[2] = kSecPasswordAllowedCharactersKey;
  v10[3] = kSecPasswordRequiredCharactersKey;
  v11[2] = @"abcdefghijklmnopqrstuvwxyz1234567890";
  v11[3] = v5;
  +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  id v6 = (void *)SecPasswordGenerate();
  if ([v6 length])
  {
    if ([(SDHotspotManager *)self setHotspotPassword:v6])
    {
      id v7 = v6;
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = tethering_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10018B4F0(@"unknown error", v8);
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (NSString)hotspotPassword
{
  id v3 = +[SDStatusMonitor sharedMonitor];
  id v4 = (__CFString *)[v3 wifiManager];

  if (v4)
  {
    id v4 = (__CFString *)WiFiManagerClientCopyMisPassword();
    if (![(__CFString *)v4 length])
    {
      uint64_t v5 = [(SDHotspotManager *)self _createDefaultPassword];

      id v4 = (__CFString *)v5;
    }
  }
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = &stru_1008E7020;
  }
  id v7 = v6;

  return v7;
}

- (id)hotspotChannel
{
  id v3 = [(SDHotspotManager *)self hostAPNetwork];

  if (v3)
  {
    id v4 = [(SDHotspotManager *)self hostAPNetwork];
    WiFiNetworkGetChannel();
    uint64_t v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = &off_100902D18;
  }

  return v5;
}

- (void)setMaxConnectionsReached:(BOOL)a3
{
  self->_maxConnectionsReached = a3;
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"SDHotspotManagerConnectionStateChanged" object:0];
}

- (void)notifyHostAPActivated
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = self->_handlers;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v7);
        id v9 = [(SDHotspotManager *)self hotspotName];
        id v10 = [(SDHotspotManager *)self hotspotPassword];
        id v11 = [(SDHotspotManager *)self hotspotChannel];
        (*(void (**)(uint64_t, void *, void *, void *, void))(v8 + 16))(v8, v9, v10, v11, 0);

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_handlers removeAllObjects];
}

- (void)notifyHostAPError:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_handlers;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_handlers removeAllObjects];
}

- (void)misStateChanged:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018AE58;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (BOOL)isNetworkHostAP:(__WiFiNetwork *)a3
{
  id v3 = WiFiNetworkGetProperty();
  id v4 = v3;
  if (v3) {
    BOOL v5 = [v3 intValue] == 3;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)handleHostAPChanged:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018AF88;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)onqueue_handleHostAPChanged:(id)a3
{
  id v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:@"HostAPEventData"];

  id v6 = [v5 objectForKeyedSubscript:@"HostApEnabled"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7)
  {
    [(SDHotspotManager *)self onqueue_updateHostAPNetwork];
    [(SDHotspotManager *)self invalidateNetworkTimer];
    if ([(SDHotspotManager *)self startedHostAP])
    {
      id v8 = tethering_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "We brought up the network", (uint8_t *)&v15, 2u);
      }

      [(SDHotspotManager *)self turnOffDiscovery];
      [(SDHotspotManager *)self setStartedHostAP:0];
    }
    id v9 = [v5 objectForKeyedSubscript:@"HostApDisableHotspotAdvertise"];
    id v10 = [v9 BOOLValue];

    [(SDHotspotManager *)self setMaxConnectionsReached:v10];
    [(SDHotspotManager *)self notifyHostAPActivated];
    long long v11 = tethering_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [(SDHotspotManager *)self isP2PAllowed];
      CFStringRef v13 = @"NO";
      if (v12) {
        CFStringRef v13 = @"YES";
      }
      int v15 = 138412290;
      CFStringRef v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SoftAP up, P2P enabled %@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    long long v14 = tethering_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Clearing cached wifinetwork", (uint8_t *)&v15, 2u);
    }

    [(SDHotspotManager *)self setHostAPNetwork:0];
    [(SDHotspotManager *)self setMaxConnectionsReached:0];
    [(SDHotspotManager *)self onqueue_handleSwitchCondtionsChanged];
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1008CF118);
}

- (BOOL)isTetheringSupported
{
  return self->_tetheringSupported;
}

- (void)setTetheringSupported:(BOOL)a3
{
  self->_tetheringSupported = a3;
}

- (BOOL)maxConnectionsReached
{
  return self->_maxConnectionsReached;
}

- (SDHotspotManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDHotspotManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSNumber)p2pAllowedCache
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setP2pAllowedCache:(id)a3
{
}

- (BOOL)startedHostAP
{
  return self->_startedHostAP;
}

- (void)setStartedHostAP:(BOOL)a3
{
  self->_startedHostAP = a3;
}

- (BOOL)capturingTailspin
{
  return self->_capturingTailspin;
}

- (void)setCapturingTailspin:(BOOL)a3
{
  self->_capturingTailspin = a3;
}

- (BOOL)flippedHotspotSwitch
{
  return self->_flippedHotspotSwitch;
}

- (void)setFlippedHotspotSwitch:(BOOL)a3
{
  self->_flippedHotspotSwitch = a3;
}

- (id)hostAPNetwork
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setHostAPNetwork:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (NSTimer)networkTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNetworkTimer:(id)a3
{
}

- (NSMutableArray)handlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_networkTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_hostAPNetwork, 0);
  objc_storeStrong((id *)&self->_p2pAllowedCache, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_misManager, 0);
}

@end