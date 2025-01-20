@interface SDBonjourBrowser
+ (void)updateFriendRPIdentityForAccountID:(id)a3 withAirDropClientInfo:(id)a4;
- (BOOL)checkDiscoveryEntitlement;
- (BOOL)preferVibrantIcons;
- (BOOL)shouldStart;
- (BOOL)startCalled;
- (BOOL)thisIsTheFinder;
- (BOOL)validAirDropInterface:(unsigned int)a3;
- (NSArray)nodes;
- (NSArray)types;
- (NSString)bundleID;
- (NSString)description;
- (NSString)domain;
- (NSString)sessionID;
- (OS_xpc_object)xpcConnection;
- (SDBonjourBrowser)initWithDomain:(id)a3 types:(id)a4;
- (SDBonjourBrowserDelegate)delegate;
- (SDXPCHelperConnection)helperConnection;
- (__SFNode)copyNodeForName:(id)a3;
- (__SFNode)copyNodeForService:(id)a3;
- (id)colorArrayFromEcolor:(id)a3 icolor:(id)a4;
- (id)odiskMountPoints:(id)a3;
- (id)queryKey:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6;
- (id)serviceFromServiceName:(id)a3;
- (id)valueForKey:(id)a3 inTXTRecord:(const void *)a4 withLength:(unsigned __int16)a5;
- (int)transfersCompleted;
- (int)transfersInitiated;
- (int64_t)mode;
- (unsigned)getInterface:(unsigned int)a3;
- (void)addObservers;
- (void)addQueryToDictionary:(_DNSServiceRef_t *)a3 name:(id)a4 type:(id)a5 domain:(id)a6 recordType:(unsigned __int16)a7;
- (void)addService:(id)a3 type:(id)a4 domain:(id)a5 interface:(unsigned int)a6;
- (void)advertiseHashes;
- (void)airDropClient:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)airDropPublished:(id)a3;
- (void)awdl:(id)a3 failedToStartAdvertisingWithError:(id)a4;
- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5;
- (void)awdlDidUpdateState:(id)a3;
- (void)cancelAirDropRequests;
- (void)cancelIdentityQueries;
- (void)cleanupAirDropRequest:(id)a3;
- (void)cleanupRecordQuery:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6;
- (void)cleanupRecordQueryForKey:(id)a3;
- (void)cleanupRecordQueryForNetService:(id)a3 recordType:(unsigned __int16)a4;
- (void)clearCache;
- (void)clearCacheAndNotify;
- (void)commentChanged:(id)a3 comment:(id)a4;
- (void)consoleUserChanged:(id)a3;
- (void)contactsChanged:(id)a3;
- (void)dealloc;
- (void)deviceInfoChanged:(id)a3 model:(id)a4 ecolor:(id)a5 icolor:(id)a6 osxvers:(id)a7;
- (void)handleBrowseCallBack:(unsigned int)a3 interface:(unsigned int)a4 error:(int)a5 name:(const char *)a6 type:(const char *)a7 domain:(const char *)a8;
- (void)handleIdentity:(id)a3 withQueryID:(id)a4 emailOrPhone:(id)a5 error:(id)a6;
- (void)handleQueryCallBack:(unsigned int)a3 error:(int)a4 fullname:(const char *)a5 rrtype:(unsigned __int16)a6 rdlen:(unsigned __int16)a7 rdata:(const void *)a8;
- (void)invalidate;
- (void)linkStateChanged:(id)a3;
- (void)lockStatusChanged:(id)a3;
- (void)logAirDropDiscoveryInfoForNode:(__SFNode *)a3;
- (void)logAirDropSessionInfo;
- (void)notifyClient;
- (void)notifyClientIfDone:(unsigned int)a3;
- (void)personInfoChanged:(id)a3 flags:(id)a4 atag:(id)a5 cname:(id)a6 phash:(id)a7 ehash:(id)a8 nhash:(id)a9;
- (void)processTXTRecordUpdate:(const char *)a3 rdlen:(unsigned __int16)a4 rdata:(const void *)a5;
- (void)queryRecordTimerCallBack:(id)a3;
- (void)removeInvalidNodes:(id)a3;
- (void)removeObservers;
- (void)removeService:(id)a3 type:(id)a4 domain:(id)a5;
- (void)restartAfterDelay:(double)a3;
- (void)restartBrowser:(id)a3;
- (void)screenStatusChanged:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHelperConnection:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setSessionID:(id)a3;
- (void)setTransfersCompleted:(int)a3;
- (void)setTransfersInitiated:(int)a3;
- (void)setXpcConnection:(id)a3;
- (void)somethingChanged:(id)a3;
- (void)start;
- (void)startAirDropRequestForNode:(__SFNode *)a3;
- (void)startConnectionlessAdvertisingWithData:(id)a3;
- (void)startIdentityQueryForNode:(__SFNode *)a3;
- (void)startPictureQuery:(id)a3;
- (void)startRecordQuery:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6 interface:(unsigned int)a7;
- (void)stop;
- (void)stopConnectionlessAdvertising;
- (void)systemInfoChanged:(id)a3 diskInfo:(__CFDictionary *)a4;
- (void)updateBrowserState;
- (void)updateSecondaryNameForNodes:(id)a3;
- (void)updateServerCacheIfNeeded;
- (void)wirelessPowerChanged:(id)a3;
@end

@implementation SDBonjourBrowser

- (SDBonjourBrowser)initWithDomain:(id)a3 types:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)SDBonjourBrowser;
  v9 = [(SDBonjourBrowser *)&v34 init];
  v10 = v9;
  if (v9)
  {
    airDropRequests = v9->_airDropRequests;
    v9->_airDropRequests = 0;

    v10->_awdlIndex = 0;
    bundleID = v10->_bundleID;
    v10->_bundleID = 0;

    v10->_connection = 0;
    discoveredPeers = v10->_discoveredPeers;
    v10->_discoveredPeers = 0;

    objc_storeStrong((id *)&v10->_domain, a3);
    v10->_firstTime = 0.0;
    iconCache = v10->_iconCache;
    v10->_iconCache = 0;

    v10->_identityQueries = 0;
    isFinder = v10->_isFinder;
    v10->_isFinder = 0;

    v10->_maxServices = 0;
    v10->_mode = 0;
    proximity = v10->_proximity;
    v10->_proximity = 0;

    sessionID = v10->_sessionID;
    v10->_sessionID = 0;

    serverCache = v10->_serverCache;
    v10->_serverCache = 0;

    v10->_startTime = 0.0;
    *(void *)&v10->_transfersInitiated = 0;
    objc_storeStrong((id *)&v10->_types, a4);
    uint64_t v19 = objc_opt_new();
    servers = v10->_servers;
    v10->_servers = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_opt_new();
    dnsQueries = v10->_dnsQueries;
    v10->_dnsQueries = (NSMutableDictionary *)v21;

    uint64_t v23 = +[SDStatusMonitor sharedMonitor];
    monitor = v10->_monitor;
    v10->_monitor = (SDStatusMonitor *)v23;

    v10->_isNetBIOS = [v8 containsObject:@"_netbios._udp."];
    v10->_isAirDrop = [v8 containsObject:sub_1000D94A0()];
    v10->_isWorkgroups = [v8 containsObject:@"_workgroups._udp."];
    uint64_t v25 = +[NSTimer scheduledTimerWithTimeInterval:v10 target:"restartBrowser:" selector:0 userInfo:1 repeats:1.0e30];
    restartTimer = v10->_restartTimer;
    v10->_restartTimer = (NSTimer *)v25;

    if (v10->_isAirDrop)
    {
      uint64_t v27 = objc_opt_new();
      v28 = v10->_airDropRequests;
      v10->_airDropRequests = (NSMutableDictionary *)v27;

      uint64_t v29 = objc_opt_new();
      v30 = v10->_discoveredPeers;
      v10->_discoveredPeers = (NSMutableSet *)v29;

      uint64_t v31 = objc_opt_new();
      v32 = v10->_iconCache;
      v10->_iconCache = (NSMutableDictionary *)v31;

      v10->_identityQueries = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    [(SDBonjourBrowser *)v10 addObservers];
  }

  return v10;
}

- (NSString)bundleID
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection && !self->_bundleID)
  {
    sub_1001B3F50(xpcConnection);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleID = self->_bundleID;
    self->_bundleID = v4;
  }
  v6 = self->_bundleID;

  return v6;
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(SDBonjourBrowser *)self stop];
    [(SDBonjourBrowser *)self notifyClient];
    [(SDBonjourBrowser *)self updateBrowserState];
  }
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)restartBrowser:(id)a3
{
  if (self->_startCalled)
  {
    [(SDBonjourBrowser *)self stop];
    [(SDBonjourBrowser *)self notifyClient];
    [(SDBonjourBrowser *)self updateBrowserState];
  }
}

- (void)dealloc
{
  [(SDBonjourBrowser *)self removeObservers];
  identityQueries = self->_identityQueries;
  if (identityQueries) {
    CFRelease(identityQueries);
  }
  v4.receiver = self;
  v4.super_class = (Class)SDBonjourBrowser;
  [(SDBonjourBrowser *)&v4 dealloc];
}

- (void)clearCache
{
  serverCache = self->_serverCache;
  self->_serverCache = 0;
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  if (self->_isAirDrop)
  {
    [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.AppleIDAccountInfoChanged" object:0];
    [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.AppleIDChanged" object:0];
    [v3 addObserver:self selector:"airDropPublished:" name:@"com.apple.sharingd.AirDropPublished" object:0];
    [v3 addObserver:self selector:"lockStatusChanged:" name:@"com.apple.sharingd.UILockStatusChanged" object:0];
    [v3 addObserver:self selector:"screenStatusChanged:" name:@"com.apple.sharingd.ScreenStateChanged" object:0];
    [v3 addObserver:self selector:"contactsChanged:" name:@"com.apple.sharingd.ContactsChanged" object:0];
    [v3 addObserver:self selector:"consoleUserChanged:" name:@"com.apple.sharingd.ConsoleUserChanged" object:0];
    [v3 addObserver:self selector:"linkStateChanged:" name:@"com.apple.sharingd.AirDropLinkStateChanged" object:0];
    [v3 addObserver:self selector:"wirelessPowerChanged:" name:@"com.apple.sharingd.WirelessPowerChanged" object:0];
    [v3 addObserver:self selector:"wirelessPowerChanged:" name:@"com.apple.sharingd.BluetoothPowerChanged" object:0];
  }
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.MulticastDNSChanged" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (unsigned)getInterface:(unsigned int)a3
{
  if (self->_isAirDrop)
  {
    if ([(SDStatusMonitor *)self->_monitor browseAllInterfaces])
    {
      return 0;
    }
    else
    {
      unsigned int result = self->_awdlIndex;
      if (!result)
      {
        unsigned int result = sub_1001B423C();
        self->_awdlIndex = result;
        if (!result)
        {
          v5 = airdrop_log();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
            sub_1001406E4();
          }

          return self->_awdlIndex;
        }
      }
    }
  }
  else if (self->_isWorkgroups)
  {
    return -1;
  }
  else if (self->_isNetBIOS)
  {
    return -1;
  }
  else
  {
    return a3;
  }
  return result;
}

- (BOOL)thisIsTheFinder
{
  isFinder = self->_isFinder;
  if (!isFinder)
  {
    objc_super v4 = [(SDBonjourBrowser *)self bundleID];
    +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isEqualToString:@"com.apple.finder"]);
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_isFinder;
    self->_isFinder = v5;

    isFinder = self->_isFinder;
  }

  return [(NSNumber *)isFinder BOOLValue];
}

- (BOOL)preferVibrantIcons
{
  return 1;
}

- (BOOL)checkDiscoveryEntitlement
{
  return sub_1000D9060(@"GateAirDropDiscovery", 0) != 0;
}

- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = airdrop_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100140718((uint64_t)v6, (uint64_t)v7, v8);
  }
}

- (void)awdlDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = [v4 state];
  if ((unint64_t)v5 > 3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = *((void *)&off_1008CE158 + (void)v5);
  }
  id v7 = airdrop_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BTLE advertiser %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [v4 state];
  if (v8 == (id)3) {
    [(SDBonjourBrowser *)self advertiseHashes];
  }
}

- (void)awdl:(id)a3 failedToStartAdvertisingWithError:(id)a4
{
  id v4 = a4;
  id v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100140790((uint64_t)v4, v5);
  }
}

- (void)startConnectionlessAdvertisingWithData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    CFStringRef v6 = @"com.apple.airdrop";
    id v5 = +[NSArray arrayWithObjects:&v6 count:1];
    id v4 = +[SDAirDropContactHashManager btleAdvertisementDataForStrings:v5];
  }
  [(WPAWDL *)self->_proximity startConnectionlessAWDLServiceAdvertisingWithData:v4];
}

- (void)stopConnectionlessAdvertising
{
  [(WPAWDL *)self->_proximity stopConnectionlessAWDLServiceAdvertising];
  [(WPAWDL *)self->_proximity invalidate];
  proximity = self->_proximity;
  self->_proximity = 0;
}

- (void)advertiseHashes
{
  proximity = self->_proximity;
  if (proximity && [(WPAWDL *)proximity state] == (id)3)
  {
    if ([(SDStatusMonitor *)self->_monitor enableAirDropAdvertising])
    {
      id v4 = [(SDStatusMonitor *)self->_monitor myShortHashesForAirDrop];
      if (v4)
      {
        [(SDBonjourBrowser *)self startConnectionlessAdvertisingWithData:v4];
        id v5 = airdrop_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 138412290;
          id v8 = v4;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BTLE advertising hashes %@", (uint8_t *)&v7, 0xCu);
        }
      }
      else
      {
        CFStringRef v6 = airdrop_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v7) = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No email or phone number hashes to advertise", (uint8_t *)&v7, 2u);
        }

        [(SDBonjourBrowser *)self startConnectionlessAdvertisingWithData:0];
      }
      sub_100046EFC(@"BluetoothAdvertise", @"Start", (uint64_t)[(SDBonjourBrowser *)self bundleID], 0);
    }
    else
    {
      id v4 = airdrop_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BTLE advertising disabled", (uint8_t *)&v7, 2u);
      }
    }
  }
}

- (BOOL)shouldStart
{
  if (self->_startCalled)
  {
    if (self->_isAirDrop)
    {
      unsigned int v3 = [(SDStatusMonitor *)self->_monitor screenOn];
      if (v3)
      {
        unsigned int v3 = [(SDStatusMonitor *)self->_monitor bluetoothEnabled];
        if (v3)
        {
          monitor = self->_monitor;
          LOBYTE(v3) = [(SDStatusMonitor *)monitor wirelessEnabled];
        }
      }
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

- (void)updateBrowserState
{
  unsigned int v3 = [(SDBonjourBrowser *)self domain];
  unsigned int v4 = [(SDBonjourBrowser *)self shouldStart];
  if (v3
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate)) != 0
    && (!self->_connection ? (unsigned int v6 = v4) : (unsigned int v6 = 0), WeakRetained, v6 == 1))
  {
    if (DNSServiceCreateConnection(&self->_connection))
    {
      int v7 = browser_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001408D8();
      }
    }
    else
    {
      p_connection = &self->_connection;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      int v9 = self->_types;
      id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v33;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v33 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(id *)(*((void *)&v32 + 1) + 8 * i);
            sdRef[0] = self->_connection;
            int64_t mode = self->_mode;
            if (mode == 1) {
              int v16 = 33570816;
            }
            else {
              int v16 = 0x4000;
            }
            if (mode == 2) {
              DNSServiceFlags v17 = 67125248;
            }
            else {
              DNSServiceFlags v17 = v16;
            }
            if (self->_isAirDrop && ![(SDStatusMonitor *)self->_monitor enableDemoMode]) {
              v17 |= 0x100000u;
            }
            uint32_t v18 = [(SDBonjourBrowser *)self getInterface:0];
            id v19 = v14;
            DNSServiceErrorType v20 = DNSServiceBrowse(sdRef, v17, v18, (const char *)[v19 UTF8String], (const char *)[v3 UTF8String], (DNSServiceBrowseReply)sub_10013C1A4, self);

            if (v20)
            {

              uint64_t v21 = browser_log();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                sub_100140870();
              }
              goto LABEL_37;
            }
          }
          id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      if (DNSServiceSetDispatchQueue(*p_connection, (dispatch_queue_t)&_dispatch_main_q))
      {
        uint64_t v21 = browser_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100140808();
        }
LABEL_37:

        DNSServiceRefDeallocate(*p_connection);
        *p_connection = 0;
      }
      else if (self->_isAirDrop)
      {
        v22 = airdrop_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(sdRef[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Bonjour discovery started", (uint8_t *)sdRef, 2u);
        }

        sub_100046EFC(@"BonjourBrowse", @"Start", (uint64_t)[(SDBonjourBrowser *)self bundleID], 0);
        self->_startTime = CFAbsoluteTimeGetCurrent();
        uint64_t v23 = +[NSUUID UUID];
        v24 = [v23 UUIDString];
        [v24 substringWithRange:24, 12];
        uint64_t v25 = (NSString *)objc_claimAutoreleasedReturnValue();
        browserID = self->_browserID;
        self->_browserID = v25;

        if (![(SDStatusMonitor *)self->_monitor enableDemoMode])
        {
          if (!self->_proximity)
          {
            uint64_t v27 = airdrop_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(sdRef[0]) = 0;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "BTLE advertising started", (uint8_t *)sdRef, 2u);
            }

            v28 = (WPAWDL *)[objc_alloc((Class)WPAWDL) initWithDelegate:self queue:&_dispatch_main_q];
            proximity = self->_proximity;
            self->_proximity = v28;
          }
          [(SDBonjourBrowser *)self advertiseHashes];
        }
      }
    }
  }
  else
  {
    if (self->_startTime == 0.0) {
      char v8 = 1;
    }
    else {
      char v8 = v4;
    }
    if ((v8 & 1) == 0)
    {
      [(SDBonjourBrowser *)self stop];
      [(SDBonjourBrowser *)self notifyClient];
    }
  }
}

- (void)start
{
  unsigned int v3 = airdrop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SDBonjourBrowser: start requested", buf, 2u);
  }

  self->_startCalled = 1;
  if (dword_1009942C8)
  {
    dispatch_time_t v4 = sub_1001B1AF8(2.0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10013C304;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10013C30C;
    v5[3] = &unk_1008CA4B8;
    v5[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (void)logAirDropSessionInfo
{
  double startTime = self->_startTime;
  double Current = CFAbsoluteTimeGetCurrent();
  double firstTime = self->_firstTime;
  double v6 = self->_startTime;
  uint64_t maxServices = self->_maxServices;
  id v8 = [(NSMutableSet *)self->_discoveredPeers count];
  unsigned int v9 = [(SDStatusMonitor *)self->_monitor discoverableLevel];
  id v10 = airdrop_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Bonjour discovery stopped", buf, 2u);
  }
  if (firstTime == 0.0) {
    double v11 = -1.0;
  }
  else {
    double v11 = firstTime - v6;
  }

  browserID = (__CFString *)self->_browserID;
  sessionID = (__CFString *)self->_sessionID;
  id v14 = [(SDBonjourBrowser *)self bundleID];
  sub_100046AFC(sessionID, browserID, v14, (unint64_t)(startTime * 1000.0), maxServices, (uint64_t)v8, self->_transfersInitiated, self->_transfersCompleted, Current - v6, v11, v9);
}

- (void)stop
{
  [(SDBonjourBrowser *)self clearCache];
  [(NSMutableDictionary *)self->_servers removeAllObjects];
  [(SDBonjourBrowser *)self cancelIdentityQueries];
  [(SDBonjourBrowser *)self cancelAirDropRequests];
  if (self->_isAirDrop && self->_startTime != 0.0)
  {
    [(SDBonjourBrowser *)self logAirDropSessionInfo];
    [(NSMutableSet *)self->_discoveredPeers removeAllObjects];
    browserID = self->_browserID;
    self->_browserID = 0;

    self->_uint64_t maxServices = 0;
    self->_double firstTime = 0.0;
    self->_double startTime = 0.0;
  }
  dnsQueries = self->_dnsQueries;
  if (dnsQueries)
  {
    id v5 = [(NSMutableDictionary *)dnsQueries allValues];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) objectForKeyedSubscript:@"QueryTimer"];
          [v10 invalidate];
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    [(NSMutableDictionary *)self->_dnsQueries removeAllObjects];
  }
  connection = self->_connection;
  if (connection)
  {
    if (self->_isAirDrop)
    {
      sub_100046EFC(@"BonjourBrowse", @"Stop", (uint64_t)[(SDBonjourBrowser *)self bundleID], 0);
      connection = self->_connection;
    }
    DNSServiceRefDeallocate(connection);
    self->_connection = 0;
  }
  if (self->_proximity)
  {
    uint64_t v12 = airdrop_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BTLE advertising stopped", v13, 2u);
    }

    sub_100046EFC(@"BluetoothAdvertise", @"Stop", (uint64_t)[(SDBonjourBrowser *)self bundleID], 0);
    [(SDBonjourBrowser *)self stopConnectionlessAdvertising];
  }
}

- (void)invalidate
{
  unsigned int v3 = airdrop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SDBonjourBrowser: invalidate requested", v6, 2u);
  }

  [(SDBonjourBrowser *)self stop];
  restartTimer = self->_restartTimer;
  if (restartTimer)
  {
    [(NSTimer *)restartTimer invalidate];
    id v5 = self->_restartTimer;
    self->_restartTimer = 0;
  }
}

- (void)removeInvalidNodes:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_serverCache allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [v4 objectForKeyedSubscript:v10];

        CFStringRef v11 = (const __CFString *)SFNodeCopyDisplayName();
        if (v11)
        {
          CFStringRef v12 = v11;
          if (!CFStringGetLength(v11)) {
            [v4 removeObjectForKey:v10];
          }
          CFRelease(v12);
        }
        else
        {
          [v4 removeObjectForKey:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)updateSecondaryNameForNodes:(id)a3
{
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (sub_10005068C()) {
          sub_1000508C4(v8, v3);
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)updateServerCacheIfNeeded
{
  if (!self->_serverCache)
  {
    if (self->_isAirDrop)
    {
      if ([(SDStatusMonitor *)self->_monitor wirelessEnabled]
        && [(SDStatusMonitor *)self->_monitor bluetoothEnabled])
      {
        id v3 = (NSMutableDictionary *)[(NSMutableDictionary *)self->_servers mutableCopy];
        serverCache = self->_serverCache;
        self->_serverCache = v3;

        if (![(SDStatusMonitor *)self->_monitor showMeInWormhole])
        {
          CFStringRef v5 = sub_10004FD54(0, 0);
          if (v5)
          {
            CFStringRef v6 = v5;
            [(NSMutableDictionary *)self->_serverCache removeObjectForKey:v5];
            CFRelease(v6);
          }
        }
        [(SDBonjourBrowser *)self removeInvalidNodes:self->_serverCache];
        id v7 = [(NSMutableDictionary *)self->_serverCache allValues];
        [(SDBonjourBrowser *)self updateSecondaryNameForNodes:v7];

        id v8 = [(NSMutableDictionary *)self->_serverCache count];
        if ((uint64_t)v8 > self->_maxServices)
        {
          self->_uint64_t maxServices = (int)v8;
          if (self->_firstTime == 0.0) {
            self->_double firstTime = CFAbsoluteTimeGetCurrent();
          }
        }
      }
    }
    else if (self->_isWorkgroups || [(SDStatusMonitor *)self->_monitor showThisComputer])
    {
      long long v9 = (NSMutableDictionary *)[(NSMutableDictionary *)self->_servers mutableCopy];
      long long v10 = self->_serverCache;
      self->_serverCache = v9;
    }
    else
    {
      long long v11 = (NSMutableDictionary *)[(NSMutableDictionary *)self->_servers mutableCopy];
      long long v12 = self->_serverCache;
      self->_serverCache = v11;

      monitor = self->_monitor;
      if (self->_isNetBIOS) {
        [(SDStatusMonitor *)monitor netbiosName];
      }
      else {
      long long v14 = [(SDStatusMonitor *)monitor bonjourName];
      }
      if (v14)
      {
        id v16 = v14;
        long long v15 = [v14 lowercaseString];
        if (v15) {
          [(NSMutableDictionary *)self->_serverCache removeObjectForKey:v15];
        }

        long long v14 = v16;
      }
    }
  }
}

- (NSArray)nodes
{
  [(SDBonjourBrowser *)self updateServerCacheIfNeeded];
  serverCache = self->_serverCache;

  return (NSArray *)[(NSMutableDictionary *)serverCache allValues];
}

- (void)addService:(id)a3 type:(id)a4 domain:(id)a5 interface:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  long long v11 = (__CFString *)a4;
  long long v12 = (__CFString *)a5;
  if (sub_1000D9A10(v11))
  {
    long long v13 = [v10 lowercaseString];
    long long v14 = [(NSMutableDictionary *)self->_servers objectForKeyedSubscript:v13];

    if (v14)
    {
LABEL_25:
      SFNodeAddBonjourProtocol();

      goto LABEL_26;
    }
    long long v15 = sub_1001B4338(v12);
    if (self->_isNetBIOS)
    {
      id v16 = (void *)SFNodeCreate();
      SFNodeAddKind();
      SFNodeSetNetbiosName();
      SFNodeSetWorkgroup();
      CFURLRef v17 = sub_1000D8564(kSFNodeProtocolSMB, 0, 0, v13, -1, 0, 0, 0);
      if (v17)
      {
        CFURLRef v18 = v17;
        SFNodeSetURL();
        CFRelease(v18);
      }
      id v19 = self;
      id v20 = v10;
      CFStringRef v21 = v11;
    }
    else
    {
      if (self->_isWorkgroups)
      {
        id v16 = (void *)SFNodeCreate();
        SFNodeAddKind();
        SFNodeAddWorkgroup();
        goto LABEL_24;
      }
      id v16 = (void *)SFNodeCreate();
      SFNodeSetServiceName();
      SFNodeSetDomain();
      SFNodeAddKind();
      CFStringRef v22 = sub_1000D94A0();
      if (CFEqual(v11, v22))
      {
        SFNodeSetDisplayName();
        SFNodeSetRealName();
        SFNodeAddKind();
        SFNodeAddKind();
        uint64_t v23 = (__CFString *)sub_10004FD54(0, 0);
        if (![v10 isEqual:v23]
          || [(SDStatusMonitor *)self->_monitor showMeInWormhole])
        {
          long long v34 = v23;
          v36 = objc_opt_new();
          [v36 setSessionID:self->_browserID];
          objc_setAssociatedObject(v16, @"SDAirDropPeerMetric", v36, (void *)0x301);
          double Current = CFAbsoluteTimeGetCurrent();
          uint64_t v25 = +[NSNumber numberWithDouble:Current - self->_startTime];
          [v36 setBonjourPTRDiscovery:v25];

          v26 = +[NSNumber numberWithDouble:Current];
          [v36 setBonjourTXTRecordDiscovery:v26];

          uint64_t v27 = [v36 bonjourPTRDiscovery];
          [v27 doubleValue];
          double v29 = v28;

          v30 = sub_1001B1A70(v6);
          uint64_t v31 = v30;
          if (v30)
          {
            id v32 = v30;
          }
          else
          {
            id v32 = +[NSNumber numberWithInt:v6];
          }
          long long v35 = v32;

          long long v33 = airdrop_log();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v38 = v10;
            __int16 v39 = 2112;
            v40 = v35;
            __int16 v41 = 1024;
            int v42 = (int)(v29 * 1000.0);
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Bonjour discovered %@ PTR over %@ in %d ms", buf, 0x1Cu);
          }

          [(SDBonjourBrowser *)self startRecordQuery:v10 type:v11 domain:v15 recordType:16 interface:v6];
          uint64_t v23 = v34;
        }

        goto LABEL_24;
      }
      if (CFEqual(v11, @"_odisk._tcp."))
      {
        SFNodeAddKind();
        [(SDBonjourBrowser *)self startRecordQuery:v10 type:v11 domain:v15 recordType:16 interface:v6];
      }
      if (self->_mode == 1) {
        goto LABEL_24;
      }
      CFStringRef v21 = @"_device-info._tcp.";
      id v19 = self;
      id v20 = v10;
    }
    [(SDBonjourBrowser *)v19 startRecordQuery:v20 type:v21 domain:v15 recordType:16 interface:v6];
LABEL_24:
    [(NSMutableDictionary *)self->_servers setObject:v16 forKeyedSubscript:v13];
    CFRelease(v15);
    CFRelease(v16);
    goto LABEL_25;
  }
LABEL_26:
}

- (id)queryKey:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6
{
  unsigned int v6 = a6;
  id v9 = a4;
  id v10 = a3;
  long long v11 = sub_1001B4338((const __CFString *)a5);
  long long v12 = +[NSString stringWithFormat:@"%@.%@%@.%d", v10, v9, v11, v6];

  long long v13 = [v12 lowercaseString];

  return v13;
}

- (void)addQueryToDictionary:(_DNSServiceRef_t *)a3 name:(id)a4 type:(id)a5 domain:(id)a6 recordType:(unsigned __int16)a7
{
  uint64_t v7 = a7;
  id v12 = a5;
  id v16 = [(SDBonjourBrowser *)self queryKey:a4 type:v12 domain:a6 recordType:v7];
  long long v13 = objc_opt_new();
  long long v14 = +[NSNumber numberWithLong:*a3];
  [v13 setObject:v14 forKeyedSubscript:@"ServiceRef"];

  LODWORD(v14) = CFEqual(v12, @"_device-info._tcp.");
  if (v14)
  {
    long long v15 = +[NSTimer scheduledTimerWithTimeInterval:self target:"queryRecordTimerCallBack:" selector:v16 userInfo:0 repeats:30.0];
    [v13 setObject:v15 forKeyedSubscript:@"QueryTimer"];
  }
  [(NSMutableDictionary *)self->_dnsQueries setObject:v13 forKeyedSubscript:v16];
}

- (void)startRecordQuery:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6 interface:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  sub_1001B4410(v12, v13, v14, 1);
  long long v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    id v20 = browser_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100140940();
    }
    goto LABEL_16;
  }
  bzero(buffer, 0x3F1uLL);
  if (!CFStringGetCString(v15, buffer, 1009, 0x8000100u))
  {
    id v20 = browser_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100140974();
    }
    goto LABEL_16;
  }
  DNSServiceRef sdRef = self->_connection;
  BOOL isAirDrop = self->_isAirDrop;
  uint32_t v17 = [(SDBonjourBrowser *)self getInterface:v7];
  if (isAirDrop) {
    DNSServiceFlags v18 = 1065216;
  }
  else {
    DNSServiceFlags v18 = 16640;
  }
  DNSServiceErrorType v19 = DNSServiceQueryRecord(&sdRef, v18, v17, buffer, v8, 1u, (DNSServiceQueryRecordReply)sub_10013D410, self);
  if (v19 == -65540)
  {
    if (![(SDStatusMonitor *)self->_monitor enableBugs]) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  if (v19)
  {
LABEL_14:
    id v20 = browser_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1001409A8();
    }
LABEL_16:

    goto LABEL_17;
  }
  [(SDBonjourBrowser *)self addQueryToDictionary:&sdRef name:v12 type:v13 domain:v14 recordType:v8];
LABEL_17:
}

- (void)cleanupRecordQueryForKey:(id)a3
{
  id v9 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_dnsQueries, "objectForKeyedSubscript:");
  CFStringRef v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 objectForKeyedSubscript:@"QueryTimer"];
    [v6 invalidate];

    uint64_t v7 = [v5 objectForKeyedSubscript:@"ServiceRef"];
    uint64_t v8 = (_DNSServiceRef_t *)[v7 longValue];

    if (v8) {
      DNSServiceRefDeallocate(v8);
    }
    [(NSMutableDictionary *)self->_dnsQueries removeObjectForKey:v9];
  }
}

- (void)cleanupRecordQuery:(id)a3 type:(id)a4 domain:(id)a5 recordType:(unsigned __int16)a6
{
  uint64_t v7 = [(SDBonjourBrowser *)self queryKey:a3 type:a4 domain:a5 recordType:a6];
  if (v7)
  {
    uint64_t v8 = v7;
    [(SDBonjourBrowser *)self cleanupRecordQueryForKey:v7];
    uint64_t v7 = v8;
  }
}

- (void)cleanupRecordQueryForNetService:(id)a3 recordType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v9 = [v6 name];
  uint64_t v7 = [v6 type];
  uint64_t v8 = [v6 domain];

  [(SDBonjourBrowser *)self cleanupRecordQuery:v9 type:v7 domain:v8 recordType:v4];
}

- (void)removeService:(id)a3 type:(id)a4 domain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [v8 lowercaseString];
  id v12 = [(NSMutableDictionary *)self->_servers objectForKeyedSubscript:v11];

  if (v12)
  {
    if (self->_isNetBIOS)
    {
      [(SDBonjourBrowser *)self cleanupRecordQuery:v8 type:v9 domain:v10 recordType:16];
LABEL_5:
      [(NSMutableDictionary *)self->_servers removeObjectForKey:v11];
      goto LABEL_6;
    }
    if (self->_isWorkgroups) {
      goto LABEL_5;
    }
    if (sub_1000D9A10(v9))
    {
      SFNodeRemoveBonjourProtocol();
      CFBagRef v13 = (const __CFBag *)SFNodeCopyBonjourProtocols();
      if (!CFBagGetCount(v13))
      {
        if (CFEqual(v9, @"_odisk._tcp."))
        {
          [(SDBonjourBrowser *)self ejectDisksIfNeeded:v8 diskNames:0];
          [(SDBonjourBrowser *)self cleanupRecordQuery:v8 type:v9 domain:v10 recordType:16];
        }
        else
        {
          CFStringRef v14 = sub_1000D94A0();
          if (CFEqual(v9, v14))
          {
            long long v15 = airdrop_log();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              int v17 = 138412290;
              id v18 = v8;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Bonjour removed %@", (uint8_t *)&v17, 0xCu);
            }

            id v16 = [(NSMutableDictionary *)self->_airDropRequests objectForKeyedSubscript:v11];
            if (v16) {
              [(SDBonjourBrowser *)self cleanupAirDropRequest:v16];
            }
            [(SDBonjourBrowser *)self cleanupRecordQuery:v8 type:v9 domain:v10 recordType:16];
          }
        }
        [(SDBonjourBrowser *)self cleanupRecordQuery:v8 type:@"_device-info._tcp." domain:v10 recordType:16];
        [(NSMutableDictionary *)self->_servers removeObjectForKey:v11];
      }
      CFRelease(v13);
    }
  }
LABEL_6:
}

- (__SFNode)copyNodeForName:(id)a3
{
  id v4 = a3;
  [(SDBonjourBrowser *)self updateServerCacheIfNeeded];
  serverCache = self->_serverCache;
  id v6 = [v4 lowercaseString];

  uint64_t v7 = [(NSMutableDictionary *)serverCache objectForKeyedSubscript:v6];

  if (v7) {
    CFRetain(v7);
  }
  return v7;
}

- (__SFNode)copyNodeForService:(id)a3
{
  servers = self->_servers;
  id v4 = [a3 name];
  CFStringRef v5 = [v4 lowercaseString];
  id v6 = [(NSMutableDictionary *)servers objectForKeyedSubscript:v5];

  if (v6) {
    CFRetain(v6);
  }
  return v6;
}

- (void)systemInfoChanged:(id)a3 diskInfo:(__CFDictionary *)a4
{
  id v6 = a3;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a4, @"adVF");
  CFNumberRef v8 = sub_1001B1C88(0, Value);
  CFStringRef v9 = (const __CFString *)CFDictionaryGetValue(a4, @"adDT");
  CFNumberRef v10 = sub_1001B1C88(0, v9);
  long long v11 = [(SDBonjourBrowser *)self copyNodeForService:v6];

  if (v11)
  {
    uint64_t valuePtr = 0;
    if (v10 && !CFNumberGetValue(v10, kCFNumberCFIndexType, &valuePtr)) {
      uint64_t valuePtr = 0;
    }
    SFNodeSetSupportedMedia();
    SFNodeSetFlags();
    CFRelease(v11);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v10) {
    CFRelease(v10);
  }
}

- (id)colorArrayFromEcolor:(id)a3 icolor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    CFNumberRef v8 = [v5 componentsSeparatedByString:@","];
    if ([v8 count] == (id)3)
    {
      CFStringRef v9 = [v8 objectAtIndexedSubscript:0];
      id v10 = [v9 intValue];

      long long v11 = [v8 objectAtIndexedSubscript:1];
      id v12 = [v11 intValue];

      CFBagRef v13 = [v8 objectAtIndexedSubscript:2];
      id v14 = [v13 intValue];

      long long v15 = 0;
      if (v10 <= 0xFF
        && (v12 & 0x80000000) == 0
        && (int)v12 <= 255
        && (v14 & 0x80000000) == 0
        && (int)v14 <= 255)
      {
        id v16 = +[NSNumber numberWithInt:v10];
        v21[0] = v16;
        int v17 = +[NSNumber numberWithInt:v12];
        v21[1] = v17;
        id v18 = +[NSNumber numberWithInt:v14];
        v21[2] = v18;
        long long v15 = +[NSArray arrayWithObjects:v21 count:3];
      }
    }
    else
    {
      long long v15 = 0;
    }
    goto LABEL_12;
  }
  if (v6)
  {
    CFNumberRef v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 integerValue]);
    id v20 = v8;
    long long v15 = +[NSArray arrayWithObjects:&v20 count:1];
LABEL_12:

    goto LABEL_13;
  }
  long long v15 = 0;
LABEL_13:

  return v15;
}

- (void)deviceInfoChanged:(id)a3 model:(id)a4 ecolor:(id)a5 icolor:(id)a6 osxvers:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  long long v15 = (__CFString *)a7;
  id v16 = [(SDBonjourBrowser *)self copyNodeForService:v19];
  if (v16)
  {
    int v17 = v16;
    SFNodeSetModel();
    [(SDBonjourBrowser *)self colorArrayFromEcolor:v13 icolor:v14];
    SFNodeSetColor();
    CFNumberRef v18 = sub_1001B1C88(0, v15);
    SFNodeSetFlags();
    if (v18) {
      CFRelease(v18);
    }
    CFRelease(v17);
  }
  [(SDBonjourBrowser *)self cleanupRecordQueryForNetService:v19 recordType:16];
}

- (void)commentChanged:(id)a3 comment:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(SDBonjourBrowser *)self copyNodeForService:v9];
  if (v7)
  {
    CFNumberRef v8 = v7;
    SFNodeSetSecondaryName();
    CFRelease(v8);
  }
  [(SDBonjourBrowser *)self cleanupRecordQueryForNetService:v9 recordType:16];
}

- (void)startPictureQuery:(id)a3
{
  id v8 = a3;
  if (![(SDStatusMonitor *)self->_monitor disablePictureQuery])
  {
    id v4 = [v8 domain];
    id v5 = sub_1001B4338(v4);

    id v6 = [v8 name];
    uint64_t v7 = [v8 type];
    [(SDBonjourBrowser *)self startRecordQuery:v6 type:v7 domain:v5 recordType:10 interface:0];

    CFRelease(v5);
  }
}

- (void)clearCacheAndNotify
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013DF24;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cleanupAirDropRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 personID];
  [(NSMutableDictionary *)self->_airDropRequests removeObjectForKey:v5];
  [v4 invalidate];
}

- (void)logAirDropDiscoveryInfoForNode:(__SFNode *)a3
{
  id v4 = objc_getAssociatedObject(a3, @"SDAirDropPeerMetric");
  id v5 = [v4 modelName];
  id v6 = [v4 verifiableIdentity];
  unsigned int v7 = [v6 BOOLValue];

  id v8 = [v4 bonjourPTRDiscovery];
  [v8 doubleValue];
  double v10 = v9;

  long long v11 = [v4 bonjourTXTRecordDiscovery];
  [v11 doubleValue];
  double v41 = v12;

  id v13 = [v4 bonjourResolveComplete];
  [v13 doubleValue];
  double v15 = v14;

  id v16 = [v4 tcpConnectionComplete];
  [v16 doubleValue];
  double v18 = v17;

  id v19 = [v4 tlsHandshakeComplete];
  [v19 doubleValue];
  double v21 = v20;

  CFStringRef v22 = [v4 identityQueryComplete];
  [v22 doubleValue];
  double v24 = v23;

  double Current = CFAbsoluteTimeGetCurrent();
  double startTime = self->_startTime;
  double v27 = CFAbsoluteTimeGetCurrent() - startTime;
  double v28 = (void *)SFNodeCopyRealName();
  double v29 = @"unverifiable";
  unsigned int v42 = v7;
  if (v7) {
    double v29 = @"verifiable";
  }
  v30 = v29;
  uint64_t v31 = airdrop_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = [v4 accountID];
    *(_DWORD *)buf = 138413315;
    v44 = v30;
    __int16 v45 = 2112;
    v46 = v28;
    __int16 v47 = 2113;
    v48 = v32;
    __int16 v49 = 2113;
    v50 = v5;
    __int16 v51 = 1024;
    int v52 = (int)(v27 * 1000.0);
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Discovered %@ identity of %@ accountID %{private}@ model %{private}@ in %d ms", buf, 0x30u);
  }
  long long v33 = (void *)SFNodeCopyServiceName();
  long long v34 = [(SDStatusMonitor *)self->_monitor awdlInfoForPeerWithServiceName:v33];
  long long v35 = [v34 objectForKeyedSubscript:@"STATION_AWDL_VERSION"];
  unsigned int v40 = [v35 intValue];

  v36 = [v34 objectForKeyedSubscript:@"STATION_AWDL_PLATFORM"];
  unsigned int v37 = [v36 intValue];

  id v38 = [v34 objectForKeyedSubscript:@"STATION_RSSI"];
  unsigned int v39 = [v38 intValue];

  sub_10004675C((__CFString *)self->_sessionID, (__CFString *)self->_browserID, v5, v42, v40, v37, v39, v10, v41, v15, v18, v21, v24, Current - startTime - v10, v27);
}

+ (void)updateFriendRPIdentityForAccountID:(id)a3 withAirDropClientInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = +[SDStatusMonitor sharedMonitor];
  if ([v5 length])
  {
    v42[0] = CNContactEmailAddressesKey;
    v42[1] = CNContactPhoneNumbersKey;
    id v8 = +[NSArray arrayWithObjects:v42 count:2];
    double v9 = [v7 contactsWithPhoneNumberOrEmail:v5 keys:v8];
    if ([v9 count])
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      double v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v34;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v34 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            if ([v7 contactIsBlocked:v14])
            {
              double v21 = airdrop_log();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                uint64_t v39 = v14;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Skipped RPIdentity update because contact %{private}@ is blocked", buf, 0xCu);
              }

              goto LABEL_37;
            }
          }
          id v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      double v10 = [v7 contactWithPreferredIdentifierForContacts:v10];
      double v28 = [v6 objectForKeyedSubscript:kSFOperationReceiverDeviceIRKDataKey];
      if (v28)
      {
        double v15 = [v6 objectForKeyedSubscript:kSFOperationReceiverEdPKDataKey];
        if (v15)
        {
          uint64_t v27 = [v6 objectForKeyedSubscript:kSFOperationReceiverIDSDeviceIDKey];
          if (v27)
          {
            uint64_t v26 = [v10 identifier];
            if (v26)
            {
              val = objc_alloc_init((Class)RPClient);
              id v16 = objc_alloc_init((Class)RPIdentity);
              [v16 setAccountID:v5];
              [v16 setContactID:v26];
              [v16 setDeviceIRKData:v28];
              [v16 setEdPKData:v15];
              [v16 setIdsDeviceID:v27];
              double v17 = [v6 objectForKeyedSubscript:kSFOperationSendersKnownAliasKey];
              [v16 setSendersKnownAlias:v17];

              [v16 setType:6];
              id location = 0;
              objc_initWeak(&location, val);
              double v18 = airdrop_log();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 141558275;
                uint64_t v39 = 1752392040;
                __int16 v40 = 2113;
                id v41 = v5;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Updating RPIdentity for %{private, mask.hash}@", buf, 0x16u);
              }

              v29[0] = _NSConcreteStackBlock;
              v29[1] = 3221225472;
              v29[2] = sub_10013E980;
              v29[3] = &unk_1008CE110;
              id v19 = v16;
              id v30 = v19;
              objc_copyWeak(&v31, &location);
              [val addOrUpdateIdentity:v19 completion:v29];
              objc_destroyWeak(&v31);

              objc_destroyWeak(&location);
              double v20 = val;
            }
            else
            {
              double v24 = airdrop_log();
              double v20 = v24;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                sub_100140A44((uint64_t)v10, v24);
                double v20 = v24;
              }
            }

            double v23 = v26;
          }
          else
          {
            double v23 = airdrop_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 141558275;
              uint64_t v39 = 1752392040;
              __int16 v40 = 2113;
              id v41 = v5;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Didn't update RPIdentity because idsDeviceID is missing for %{private, mask.hash}@", buf, 0x16u);
            }
          }

          CFStringRef v22 = v27;
        }
        else
        {
          CFStringRef v22 = airdrop_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 141558275;
            uint64_t v39 = 1752392040;
            __int16 v40 = 2113;
            id v41 = v5;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Didn't update RPIdentity because edPKData is missing for %{private, mask.hash}@", buf, 0x16u);
          }
        }
      }
      else
      {
        double v15 = airdrop_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 141558275;
          uint64_t v39 = 1752392040;
          __int16 v40 = 2113;
          id v41 = v5;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Didn't update RPIdentity because deviceIRKData is missing for %{private, mask.hash}@", buf, 0x16u);
        }
      }
    }
    else
    {
      double v10 = airdrop_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 141558275;
        uint64_t v39 = 1752392040;
        __int16 v40 = 2113;
        id v41 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to update RPIdentity because there are no contacts for %{private, mask.hash}@", buf, 0x16u);
      }
    }
LABEL_37:
  }
  else
  {
    id v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100140A10();
    }
  }
}

- (void)airDropClient:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [v9 personID];
  uint64_t v12 = [(NSMutableDictionary *)self->_servers objectForKeyedSubscript:v11];

  switch(a4)
  {
    case 4:
    case 10:
      goto LABEL_20;
    case 5:
      break;
    case 9:
      if (v12)
      {
        id v13 = [v10 objectForKeyedSubscript:kSFOperationReceiverMediaCapabilitiesKey];
        if (v13) {
          SFNodeSetMediaCapabilities();
        }
        uint64_t v14 = (__SecTrust *)[v9 secTrustRef];
        if (v14)
        {
          double v15 = v14;
          double v28 = v13;
          id v16 = [v10 objectForKeyedSubscript:kSFOperationReceiverRecordDataKey];
          double v17 = sub_10005247C(v16, v15, (uint64_t)v12);
          uint64_t v18 = [v10 objectForKeyedSubscript:kSFOperationReceiverModelNameKey];
          id v19 = [v10 objectForKeyedSubscript:kSFOperationReceiverComputerNameKey];
          uint64_t v20 = [v10 objectForKeyedSubscript:kSFOperationReceiverIDSDeviceIDKey];
          SFNodeSetModel();
          SFNodeSetComputerName();
          uint64_t v26 = (void *)v20;
          SFNodeSetIDSDeviceIdentifier();
          uint64_t v27 = (void *)v18;
          if (v19)
          {
            double v21 = objc_getAssociatedObject(v12, @"SDAirDropPeerMetric");
            [v21 setModelName:v18];
            CFStringRef v22 = +[NSNumber numberWithInt:v17 != 0];
            [v21 setVerifiableIdentity:v22];

            [v21 setAccountID:v17];
            [(SDBonjourBrowser *)self logAirDropDiscoveryInfoForNode:v12];
            [(NSMutableSet *)self->_discoveredPeers addObject:v11];
          }
          else
          {
            double v21 = airdrop_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v30 = v11;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Identity discovery denied for %@", buf, 0xCu);
            }
          }

          id v13 = v28;
          if (v17 && (sub_10005068C() & 1) == 0) {
            +[SDBonjourBrowser updateFriendRPIdentityForAccountID:v17 withAirDropClientInfo:v10];
          }
          [(SDBonjourBrowser *)self startIdentityQueryForNode:v12];
        }
        else
        {
          id v16 = airdrop_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_100140B38();
          }
        }

        double v24 = [(SDBonjourBrowser *)self nodes];
        sub_100050F5C(v12, v24, self->_iconCache, [(SDBonjourBrowser *)self preferVibrantIcons]);

        [(SDBonjourBrowser *)self clearCache];
        [(SDBonjourBrowser *)self notifyClient];
      }
LABEL_20:
      [(SDBonjourBrowser *)self cleanupAirDropRequest:v9];
      break;
    default:
      double v23 = airdrop_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        id v30 = v25;
        __int16 v31 = 2112;
        CFStringRef v32 = sub_10013EE98(a4);
        __int16 v33 = 1024;
        int v34 = a4;
        __int16 v35 = 2112;
        id v36 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@: UNHANDLED EVENT %@ [%d] %@", buf, 0x26u);
      }
      break;
  }
}

- (void)startAirDropRequestForNode:(__SFNode *)a3
{
  uint64_t v9 = SFNodeCopyEmailHash();
  uint64_t v5 = SFNodeCopyPhoneHash();
  if (!(v9 | v5))
  {
    id v6 = (void *)SFNodeCopyRealName();
    unsigned int v7 = [(NSMutableDictionary *)self->_airDropRequests objectForKeyedSubscript:v6];

    if (!v7)
    {
      id v8 = [[SDAirDropClient alloc] initWithPerson:a3 items:0 forDiscovery:1];
      [(NSMutableDictionary *)self->_airDropRequests setObject:v8 forKeyedSubscript:v6];
      [(SDAirDropClient *)v8 setDelegate:self];
      [(SDAirDropClient *)v8 activate];
    }
  }
}

- (void)cancelAirDropRequests
{
  airDropRequests = self->_airDropRequests;
  if (airDropRequests)
  {
    id v4 = [(NSMutableDictionary *)airDropRequests allValues];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) invalidate];
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    [(NSMutableDictionary *)self->_airDropRequests removeAllObjects];
  }
}

- (void)personInfoChanged:(id)a3 flags:(id)a4 atag:(id)a5 cname:(id)a6 phash:(id)a7 ehash:(id)a8 nhash:(id)a9
{
  id v12 = a3;
  id v13 = (__CFString *)a4;
  id v14 = a5;
  double v15 = [(SDBonjourBrowser *)self copyNodeForService:v12];
  if (v15)
  {
    id v16 = v15;
    CFNumberRef v17 = sub_1001B1C88(0, v13);
    if (v17)
    {
      CFNumberRef v18 = v17;
      SFNodeSetFlags();
      CFRelease(v18);
    }
    if ([(SDStatusMonitor *)self->_monitor enableStrangers]) {
      SFNodeSetUserName();
    }
    id v19 = objc_getAssociatedObject(v16, @"SDAirDropPeerMetric");
    double Current = CFAbsoluteTimeGetCurrent();
    double v21 = [v19 bonjourTXTRecordDiscovery];
    [v21 doubleValue];
    double v23 = +[NSNumber numberWithDouble:Current - v22];

    [v19 setBonjourTXTRecordDiscovery:v23];
    double v24 = airdrop_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [v12 name];
      [v23 doubleValue];
      int v27 = 138412546;
      double v28 = v25;
      __int16 v29 = 1024;
      int v30 = (int)(v26 * 1000.0);
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Bonjour discovered %@ TXT record in %d ms", (uint8_t *)&v27, 0x12u);
    }
    [(SDBonjourBrowser *)self startAirDropRequestForNode:v16];
    CFRelease(v16);
  }
}

- (void)handleIdentity:(id)a3 withQueryID:(id)a4 emailOrPhone:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = airdrop_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100140B6C((uint64_t)v12, (uint64_t)v13, v14);
    }

    CFDictionaryRemoveValue(self->_identityQueries, v11);
  }
  else
  {
    CFStringRef Value = (void *)CFDictionaryGetValue(self->_identityQueries, v11);
    if (Value)
    {
      id v16 = Value;
      CFNumberRef v17 = (void *)SFNodeCopyAppleID();
      if (v17)
      {
        id v18 = [(SDStatusMonitor *)self->_monitor verifiedIdentityForAppleID:v17];
      }
      else
      {
        id v18 = 0;
      }
      id v19 = v10;
      if (v18 != v19 && ([v18 isEqual:v19] & 1) == 0)
      {
        if (v19)
        {
          [(SDStatusMonitor *)self->_monitor cacheIdentity:v19];
          uint64_t v20 = [v19 emailOrPhone];
          SFNodeSetAppleID();
        }
        double v21 = [(SDBonjourBrowser *)self nodes];
        sub_100050F5C(v16, v21, self->_iconCache, [(SDBonjourBrowser *)self preferVibrantIcons]);

        [(SDBonjourBrowser *)self clearCacheAndNotify];
      }
      CFDictionaryRemoveValue(self->_identityQueries, v11);
    }
  }
}

- (void)startIdentityQueryForNode:(__SFNode *)a3
{
  uint64_t v5 = SFNodeCopyEmailHash();
  uint64_t v6 = SFNodeCopyPhoneHash();
  if (v5 | v6)
  {
    uint64_t v7 = [(SDStatusMonitor *)self->_monitor emailOrPhoneForEmailHash:v5 phoneHash:v6];
    if (v7)
    {
      id v8 = [(SDStatusMonitor *)self->_monitor verifiedIdentityForAppleID:v7];
      if (v8)
      {
        SFNodeSetAppleID();
        long long v9 = [(SDBonjourBrowser *)self nodes];
        sub_100050F5C(a3, v9, self->_iconCache, [(SDBonjourBrowser *)self preferVibrantIcons]);

        [(SDBonjourBrowser *)self clearCacheAndNotify];
      }
      else
      {
        id v10 = +[NSUUID UUID];
        id v11 = [v10 UUIDString];

        CFDictionarySetValue(self->_identityQueries, v11, a3);
        id v12 = +[SDAppleIDAgent sharedAgent];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10013F638;
        v14[3] = &unk_1008CE138;
        v14[4] = self;
        id v15 = v11;
        id v16 = v7;
        id v13 = v11;
        [v12 verifiedIdentityForEmailOrPhone:v16 completion:v14];
      }
    }
    else
    {
      SFNodeSetAppleID();
    }
  }
  else
  {
    SFNodeSetAppleID();
  }
}

- (void)cancelIdentityQueries
{
  identityQueries = self->_identityQueries;
  if (identityQueries) {
    CFDictionaryRemoveAllValues(identityQueries);
  }
}

- (void)contactsChanged:(id)a3
{
  if (self->_startTime != 0.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      [(SDBonjourBrowser *)self cancelIdentityQueries];
      uint64_t v5 = [(NSMutableDictionary *)self->_servers allValues];
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            [(SDBonjourBrowser *)self startIdentityQueryForNode:v10];
            id v11 = [(SDBonjourBrowser *)self nodes];
            sub_100050F5C(v10, v11, self->_iconCache, [(SDBonjourBrowser *)self preferVibrantIcons]);
          }
          id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }
      [(SDBonjourBrowser *)self clearCacheAndNotify];
    }
  }
}

- (void)airDropPublished:(id)a3
{
}

- (void)lockStatusChanged:(id)a3
{
}

- (void)consoleUserChanged:(id)a3
{
}

- (void)screenStatusChanged:(id)a3
{
}

- (void)somethingChanged:(id)a3
{
}

- (void)wirelessPowerChanged:(id)a3
{
}

- (void)linkStateChanged:(id)a3
{
  id v4 = airdrop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AWDL link state changed", v5, 2u);
  }

  [(SDBonjourBrowser *)self restartAfterDelay:1.0];
}

- (void)notifyClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained bonjourNodesDidChange:self];
}

- (void)notifyClientIfDone:(unsigned int)a3
{
  char v3 = a3;
  [(SDBonjourBrowser *)self clearCache];
  if ((v3 & 1) == 0 || self->_isAirDrop)
  {
    [(SDBonjourBrowser *)self notifyClient];
  }
}

- (BOOL)validAirDropInterface:(unsigned int)a3
{
  if (self->_awdlIndex == a3 || [(SDStatusMonitor *)self->_monitor browseAllInterfaces]) {
    return 1;
  }
  if (a3) {
    return 0;
  }
  monitor = self->_monitor;

  return [(SDStatusMonitor *)monitor showMeInWormhole];
}

- (void)handleBrowseCallBack:(unsigned int)a3 interface:(unsigned int)a4 error:(int)a5 name:(const char *)a6 type:(const char *)a7 domain:(const char *)a8
{
  if (a5)
  {
    long long v9 = browser_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100140C08();
    }

    [(SDBonjourBrowser *)self restartAfterDelay:2.0];
  }
  else
  {
    uint64_t v12 = *(void *)&a4;
    uint64_t v13 = *(void *)&a3;
    id v18 = +[NSString stringWithUTF8String:a6];
    long long v14 = +[NSString stringWithUTF8String:a7];
    long long v15 = +[NSString stringWithUTF8String:a8];
    if (v18) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    BOOL v17 = v16 || v15 == 0;
    if (!v17
      && (!self->_isAirDrop
       || sub_100052608(v18)
       && [(SDBonjourBrowser *)self validAirDropInterface:v12]))
    {
      if ((v13 & 2) != 0) {
        [(SDBonjourBrowser *)self addService:v18 type:v14 domain:v15 interface:v12];
      }
      else {
        [(SDBonjourBrowser *)self removeService:v18 type:v14 domain:v15];
      }
    }
    [(SDBonjourBrowser *)self notifyClientIfDone:v13];
  }
}

- (id)odiskMountPoints:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [(SDStatusMonitor *)self->_monitor odiskMountPointsForServer:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = sub_1001B3B74(v11);
        if (v12) {
          [v5 setObject:v11 forKeyedSubscript:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)serviceFromServiceName:(id)a3
{
  char v3 = (__CFNetService *)_CFNetServiceCreateFromServiceName();
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = CFNetServiceGetName(v3);
    id v6 = CFNetServiceGetType(v4);
    id v7 = CFNetServiceGetDomain(v4);
    id v8 = [objc_alloc((Class)NSNetService) initWithDomain:v7 type:v6 name:v5];
    CFRelease(v4);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)valueForKey:(id)a3 inTXTRecord:(const void *)a4 withLength:(unsigned __int16)a5
{
  uint8_t valueLen = 0;
  id ValuePtr = (id) TXTRecordGetValuePtr(a5, a4, (const char *)[a3 UTF8String], &valueLen);
  if (ValuePtr)
  {
    id v6 = ValuePtr;
    id v7 = objc_alloc((Class)NSString);
    id ValuePtr = [v7 initWithBytes:v6 length:valueLen encoding:4];
  }

  return ValuePtr;
}

- (void)processTXTRecordUpdate:(const char *)a3 rdlen:(unsigned __int16)a4 rdata:(const void *)a5
{
  uint64_t v6 = a4;
  id v8 = &NSCalendarIdentifierGregorian_ptr;
  uint64_t v9 = +[NSString stringWithUTF8String:a3];
  id v10 = [(SDBonjourBrowser *)self serviceFromServiceName:v9];

  if (v10)
  {
    id v11 = [v10 type];
    if ([v11 isEqualToString:@"_device-info._tcp."])
    {
      uint64_t v12 = [(SDBonjourBrowser *)self valueForKey:@"model" inTXTRecord:a5 withLength:v6];
      uint64_t v13 = [(SDBonjourBrowser *)self valueForKey:@"osxvers" inTXTRecord:a5 withLength:v6];
      long long v14 = [(SDBonjourBrowser *)self valueForKey:@"ecolor" inTXTRecord:a5 withLength:v6];
      long long v15 = [(SDBonjourBrowser *)self valueForKey:@"icolor" inTXTRecord:a5 withLength:v6];
      [(SDBonjourBrowser *)self deviceInfoChanged:v10 model:v12 ecolor:v14 icolor:v15 osxvers:v13];
    }
    else
    {
      if ([v11 isEqualToString:@"_netbios._udp."])
      {
        long long v16 = [(SDBonjourBrowser *)self valueForKey:@"comment" inTXTRecord:a5 withLength:v6];
        [(SDBonjourBrowser *)self commentChanged:v10 comment:v16];

        goto LABEL_23;
      }
      if (![v11 isEqualToString:sub_1000D94A0()])
      {
        int v27 = v11;
        unsigned int Count = TXTRecordGetCount(v6, a5);
        double v28 = objc_opt_new();
        if (Count)
        {
          uint64_t v21 = 0;
          uint64_t v22 = Count;
          do
          {
            value = 0;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            *(_OWORD *)key = 0u;
            long long v32 = 0u;
            uint8_t valueLen = 0;
            if (!TXTRecordGetItemAtIndex(v6, a5, v21, 0x100u, key, &valueLen, (const void **)&value))
            {
              double v23 = [(NSCalendarIdentifier *)(id)v8[225] stringWithUTF8String:key];
              if (v23)
              {
                double v24 = sub_1001B46B4(valueLen, (const UInt8 *)value);
                if (v24)
                {
                  if ([v23 isEqual:@"sys"])
                  {
                    [(SDBonjourBrowser *)self systemInfoChanged:v10 diskInfo:v24];
                  }
                  else
                  {
                    uint64_t v25 = [v24 objectForKeyedSubscript:@"adVN"];
                    if (v25) {
                      [v28 addObject:v25];
                    }
                  }
                }

                id v8 = &NSCalendarIdentifierGregorian_ptr;
              }
            }
            ++v21;
          }
          while (v22 != v21);
        }
        double v26 = [v10 name];
        [(SDBonjourBrowser *)self ejectDisksIfNeeded:v26 diskNames:v28];

        id v11 = v27;
        goto LABEL_23;
      }
      uint64_t v12 = [(SDBonjourBrowser *)self valueForKey:@"flags" inTXTRecord:a5 withLength:v6];
      uint64_t v13 = [(SDBonjourBrowser *)self valueForKey:@"atag" inTXTRecord:a5 withLength:v6];
      long long v14 = [(SDBonjourBrowser *)self valueForKey:@"ehash" inTXTRecord:a5 withLength:v6];
      long long v17 = [(SDBonjourBrowser *)self valueForKey:@"nhash" inTXTRecord:a5 withLength:v6];
      id v18 = [(SDBonjourBrowser *)self valueForKey:@"phash" inTXTRecord:a5 withLength:v6];
      id v19 = [(SDBonjourBrowser *)self valueForKey:@"cname" inTXTRecord:a5 withLength:v6];
      [(SDBonjourBrowser *)self personInfoChanged:v10 flags:v12 atag:v13 cname:v19 phash:v18 ehash:v14 nhash:v17];
    }
LABEL_23:
  }
}

- (void)handleQueryCallBack:(unsigned int)a3 error:(int)a4 fullname:(const char *)a5 rrtype:(unsigned __int16)a6 rdlen:(unsigned __int16)a7 rdata:(const void *)a8
{
  if (a4)
  {
    id v8 = browser_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100140CD8();
    }
  }
  else
  {
    uint64_t v9 = *(void *)&a3;
    if ((a3 & 2) != 0)
    {
      if (a6 == 16)
      {
        [(SDBonjourBrowser *)self processTXTRecordUpdate:a5 rdlen:a7 rdata:a8];
      }
      else
      {
        id v11 = browser_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100140C70();
        }
      }
    }
    [(SDBonjourBrowser *)self notifyClientIfDone:v9];
  }
}

- (void)queryRecordTimerCallBack:(id)a3
{
  id v4 = [a3 userInfo];
  [(SDBonjourBrowser *)self cleanupRecordQueryForKey:v4];
}

- (void)restartAfterDelay:(double)a3
{
  if (self->_startCalled)
  {
    id v4 = +[NSDate dateWithTimeIntervalSinceNow:a3];
    [(NSTimer *)self->_restartTimer setFireDate:v4];
  }
}

- (NSString)description
{
  NSAppendPrintF();
  id v11 = 0;
  NSAppendPrintF();
  id v3 = v11;

  NSAppendPrintF();
  id v4 = v3;

  if (self->_proximity) {
    uint64_t v5 = "yes";
  }
  else {
    uint64_t v5 = "no";
  }
  id v10 = v5;
  NSAppendPrintF();
  id v6 = v4;

  proximity = self->_proximity;
  if (proximity)
  {
    [(WPAWDL *)proximity state];
    NSAppendPrintF();
    id v8 = v6;

    id v6 = v8;
  }

  return (NSString *)v6;
}

- (void)setBundleID:(id)a3
{
}

- (SDXPCHelperConnection)helperConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_helperConnection);

  return (SDXPCHelperConnection *)WeakRetained;
}

- (void)setHelperConnection:(id)a3
{
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSessionID:(id)a3
{
}

- (NSArray)types
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (SDBonjourBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDBonjourBrowserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 152, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (int)transfersInitiated
{
  return self->_transfersInitiated;
}

- (void)setTransfersInitiated:(int)a3
{
  self->_transfersInitiated = a3;
}

- (int)transfersCompleted
{
  return self->_transfersCompleted;
}

- (void)setTransfersCompleted:(int)a3
{
  self->_transfersCompleted = a3;
}

- (BOOL)startCalled
{
  return self->_startCalled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_types, 0);
  objc_destroyWeak((id *)&self->_helperConnection);
  objc_storeStrong((id *)&self->_airDropRequests, 0);
  objc_storeStrong((id *)&self->_serverCache, 0);
  objc_storeStrong((id *)&self->_dnsQueries, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_servers, 0);
  objc_storeStrong((id *)&self->_discoveredPeers, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_restartTimer, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_browserID, 0);
  objc_storeStrong((id *)&self->_isFinder, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_proximity, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end