@interface SDAirDropServer
- (BOOL)discoverableByContactsOnly;
- (BOOL)discoverableByEveryone;
- (BOOL)thisIsTheFinder;
- (NSString)clientBundleID;
- (NSString)description;
- (SDAirDropServer)init;
- (SDAirDropServerDelegate)delegate;
- (id)sslSettings;
- (int)clientPid;
- (void)_createOSTransactionIfNeeded;
- (void)activate;
- (void)addObservers;
- (void)airDropInformation:(id)a3 didChange:(id)a4;
- (void)airDropStatusChanged:(id)a3;
- (void)airDropUnpublished:(id)a3;
- (void)appleIDAccountInfoChanged:(id)a3;
- (void)appleIDChanged:(id)a3;
- (void)awdl:(id)a3 failedToStartScanningWithError:(id)a4;
- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5;
- (void)awdlDidUpdateState:(id)a3;
- (void)awdlTimeoutFired:(id)a3;
- (void)bluetoothChanged:(id)a3;
- (void)bonjourPublisher:(id)a3 propertiesDidChange:(id)a4;
- (void)consoleUserChanged:(id)a3;
- (void)dealloc;
- (void)didCloseConnection:(_CFHTTPServerConnection *)a3;
- (void)didOpenConnection:(_CFHTTPServerConnection *)a3;
- (void)didReceiveError:(__CFError *)a3;
- (void)discoverableModeChanged:(id)a3;
- (void)finderAirDropEnabled:(id)a3;
- (void)foundDevice:(id)a3;
- (void)handleFoundHashes:(id)a3 rssi:(id)a4;
- (void)handleTerminalCallBack;
- (void)invalidate;
- (void)invalidateTimers;
- (void)keyBagFirstUnlock:(id)a3;
- (void)logDiscoveryWithHash:(id)a3 rssi:(id)a4;
- (void)notifyClient:(int64_t)a3 withResults:(id)a4;
- (void)publishedInfoChanged:(id)a3;
- (void)removeObservers;
- (void)screenStateChange:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientPid:(int)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)startHTTPServer:(unsigned __int16)a3;
- (void)startProximityScanner;
- (void)startServer;
- (void)startTimers;
- (void)stop;
- (void)stopProximityScanner;
- (void)stopScanningAndStartServer;
- (void)systemHasPoweredOn:(id)a3;
- (void)systemWillSleep:(id)a3;
- (void)updateServerState;
- (void)wirelessChanged:(id)a3;
@end

@implementation SDAirDropServer

- (SDAirDropServer)init
{
  v24.receiver = self;
  v24.super_class = (Class)SDAirDropServer;
  v2 = [(SDAirDropServer *)&v24 init];
  v3 = v2;
  if (v2)
  {
    v2->_identity = 0;
    v2->_server = 0;
    v2->_startTime = 0.0;
    proximity = v2->_proximity;
    v2->_proximity = 0;

    awdlTimer = v3->_awdlTimer;
    v3->_awdlTimer = 0;

    publisher = v3->_publisher;
    v3->_publisher = 0;

    coalescer = v3->_coalescer;
    v3->_coalescer = 0;

    portNumber = v3->_portNumber;
    v3->_portNumber = 0;

    information = v3->_information;
    v3->_information = 0;

    transaction = v3->_transaction;
    v3->_transaction = 0;

    v3->_contactsOnly = 0;
    bluetoothTimer = v3->_bluetoothTimer;
    v3->_bluetoothTimer = 0;

    objc_storeStrong((id *)&v3->_queue, &_dispatch_main_q);
    uint64_t v12 = objc_opt_new();
    discoveredHashes = v3->_discoveredHashes;
    v3->_discoveredHashes = (NSMutableSet *)v12;

    uint64_t v14 = objc_opt_new();
    properties = v3->_properties;
    v3->_properties = (NSMutableDictionary *)v14;

    uint64_t v16 = +[SDStatusMonitor sharedMonitor];
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v16;

    v3->_screenOn = [(SDStatusMonitor *)v3->_monitor screenOn];
    uint64_t v18 = [(SDStatusMonitor *)v3->_monitor discoverableMode];
    discoverableMode = v3->_discoverableMode;
    v3->_discoverableMode = (NSString *)v18;

    v3->_connections = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    scanningIdentifier = v3->_scanningIdentifier;
    v3->_scanningIdentifier = 0;

    v21 = airdrop_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AirDrop server initialized", (uint8_t *)v23, 2u);
    }
  }
  return v3;
}

- (void)dealloc
{
  CFRelease(self->_connections);
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropServer;
  [(SDAirDropServer *)&v4 dealloc];
}

- (void)handleTerminalCallBack
{
  v3 = airdrop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AirDrop server invalidation complete", buf, 2u);
  }

  server = self->_server;
  if (server)
  {
    CFRelease(server);
    self->_server = 0;
  }
  portNumber = self->_portNumber;
  self->_portNumber = 0;

  if (self->_publisher)
  {
    sub_100046EFC(@"BonjourAdvertise", @"Stop", (uint64_t)self->_clientBundleID, self->_clientPid);
    [(SDAirDropPublisher *)self->_publisher setDelegate:0];
    [(SDAirDropPublisher *)self->_publisher invalidate];
    publisher = self->_publisher;
    self->_publisher = 0;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BD22C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startTimers
{
  if (!CFDictionaryGetCount(self->_connections))
  {
    v3 = +[NSTimer scheduledTimerWithTimeInterval:self target:"awdlTimeoutFired:" selector:0 userInfo:0 repeats:20.0];
    awdlTimer = self->_awdlTimer;
    self->_awdlTimer = v3;

    v5 = +[NSTimer scheduledTimerWithTimeInterval:self target:"bluetoothTimeoutFired:" selector:0 userInfo:0 repeats:15.0];
    bluetoothTimer = self->_bluetoothTimer;
    self->_bluetoothTimer = v5;
  }
}

- (void)invalidateTimers
{
  awdlTimer = self->_awdlTimer;
  if (awdlTimer)
  {
    [(NSTimer *)awdlTimer invalidate];
    objc_super v4 = self->_awdlTimer;
    self->_awdlTimer = 0;
  }
  bluetoothTimer = self->_bluetoothTimer;
  if (bluetoothTimer)
  {
    [(NSTimer *)bluetoothTimer invalidate];
    v6 = self->_bluetoothTimer;
    self->_bluetoothTimer = 0;
  }
}

- (void)didOpenConnection:(_CFHTTPServerConnection *)a3
{
  v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    uint64_t v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "New AirDrop connection %p", (uint8_t *)&v11, 0xCu);
  }

  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v7 = (const void *)kSFOperationContactsOnlyKey;
  v8 = +[NSNumber numberWithBool:self->_contactsOnly];
  CFDictionarySetValue(Mutable, v7, v8);

  CFDictionarySetValue(Mutable, kSFOperationHTTPServerConnectionKey, a3);
  CFDictionarySetValue(self->_connections, a3, a3);
  v9 = [(SDStatusMonitor *)self->_monitor finderServer];
  v10 = v9;
  if (!v9) {
    v9 = self;
  }
  [v9 notifyClient:1 withResults:Mutable];
  [(SDAirDropServer *)self invalidateTimers];
  CFRelease(Mutable);
}

- (void)didCloseConnection:(_CFHTTPServerConnection *)a3
{
  v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    int v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Closed AirDrop connection %p", (uint8_t *)&v10, 0xCu);
  }

  v6 = sub_1000503C4(a3);
  v7 = v6;
  if (v6) {
    [v6 didCloseConnection];
  }
  CFDictionaryRemoveValue(self->_connections, a3);
  if (![(SDStatusMonitor *)self->_monitor showMeInWormhole]
    || (+[SDServerBrowser sharedBrowser],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v8 isAirDropEnabled],
        v8,
        (v9 & 1) == 0))
  {
    [(SDAirDropServer *)self startTimers];
  }
}

- (void)didReceiveError:(__CFError *)a3
{
  v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000C00F0((uint64_t)a3, v5);
  }

  [(SDAirDropServer *)self handleTerminalCallBack];
  CFErrorDomain Domain = CFErrorGetDomain(a3);
  int v7 = CFEqual(Domain, _kCFHTTPServerErrorDomain);
  CFIndex Code = CFErrorGetCode(a3);
  if ((v7 && Code == 1002 || CFErrorGetCode(a3) == 48)
    && [(NSNumber *)self->_portNumber isEqual:&off_100902940])
  {
    unsigned __int8 v9 = airdrop_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trying again with random port number", v11, 2u);
    }

    [(SDAirDropServer *)self startHTTPServer:0];
  }
  else
  {
    uint64_t v12 = kSFOperationErrorKey;
    v13 = a3;
    int v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [(SDAirDropServer *)self notifyClient:10 withResults:v10];
  }
}

- (void)publishedInfoChanged:(id)a3
{
  id v4 = a3;
  if (self->_startTime != 0.0)
  {
    id v12 = v4;
    if ([v4 count])
    {
      [(NSMutableDictionary *)self->_properties removeAllObjects];
      [(NSMutableDictionary *)self->_properties addEntriesFromDictionary:v12];
    }
    [(NSMutableDictionary *)self->_properties setObject:&__kCFBooleanFalse forKeyedSubscript:kSFOperationLegacyDeviceKey];
    v5 = +[NSNumber numberWithBool:[(SDStatusMonitor *)self->_monitor wirelessCarPlay]];
    [(NSMutableDictionary *)self->_properties setObject:v5 forKeyedSubscript:kSFOperationWirelessCarPlayKey];

    v6 = +[NSNumber numberWithBool:[(SDStatusMonitor *)self->_monitor wirelessEnabled]];
    [(NSMutableDictionary *)self->_properties setObject:v6 forKeyedSubscript:kSFOperationWirelessEnabledKey];

    int v7 = +[NSNumber numberWithBool:[(SDStatusMonitor *)self->_monitor bluetoothEnabled]];
    [(NSMutableDictionary *)self->_properties setObject:v7 forKeyedSubscript:kSFOperationBluetoothEnabledKey];

    v8 = +[NSNumber numberWithBool:[(SDStatusMonitor *)self->_monitor airplaneModeEnabled]];
    [(NSMutableDictionary *)self->_properties setObject:v8 forKeyedSubscript:kSFOperationAirplaneModeEnabledKey];

    unsigned __int8 v9 = +[NSNumber numberWithUnsignedInteger:[(SDStatusMonitor *)self->_monitor ultraWideBandState]];
    [(NSMutableDictionary *)self->_properties setObject:v9 forKeyedSubscript:kSFOperationUltraWideBandEnabledKey];

    int v10 = +[NSNumber numberWithBool:[(SDStatusMonitor *)self->_monitor computerToComputer]];
    [(NSMutableDictionary *)self->_properties setObject:v10 forKeyedSubscript:kSFOperationComputerToComputerKey];

    int v11 = +[NSNumber numberWithBool:[(SDStatusMonitor *)self->_monitor wirelessAccessPoint]];
    [(NSMutableDictionary *)self->_properties setObject:v11 forKeyedSubscript:kSFOperationWirelessAccessPointKey];

    [(SDAirDropServer *)self notifyClient:12 withResults:self->_properties];
    id v4 = v12;
  }
}

- (void)awdlTimeoutFired:(id)a3
{
  id v4 = airdrop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AirDrop server idle timeout", v5, 2u);
  }

  [(SDAirDropServer *)self stop];
  [(SDAirDropServer *)self updateServerState];
}

- (void)wirelessChanged:(id)a3
{
}

- (void)bluetoothChanged:(id)a3
{
}

- (void)airDropStatusChanged:(id)a3
{
  if (![(SDAirDropServer *)self thisIsTheFinder]
    && [(SDStatusMonitor *)self->_monitor showMeInWormhole])
  {
    id v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AirDrop status changed", v5, 2u);
    }

    [(CUCoalescer *)self->_coalescer trigger];
  }
}

- (void)appleIDAccountInfoChanged:(id)a3
{
  if (![(SDAirDropServer *)self thisIsTheFinder])
  {
    id v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Apple ID account info changed", v5, 2u);
    }

    [(CUCoalescer *)self->_coalescer trigger];
  }
}

- (void)appleIDChanged:(id)a3
{
  if (![(SDAirDropServer *)self thisIsTheFinder])
  {
    id v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Apple ID account changed", v5, 2u);
    }

    [(CUCoalescer *)self->_coalescer trigger];
  }
}

- (void)systemWillSleep:(id)a3
{
  if (![(SDAirDropServer *)self thisIsTheFinder] && self->_startTime != 0.0)
  {
    id v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = getuid();
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping AirDrop server for user %d on sleep", (uint8_t *)v5, 8u);
    }

    [(SDAirDropServer *)self stop];
  }
}

- (void)systemHasPoweredOn:(id)a3
{
  if (![(SDAirDropServer *)self thisIsTheFinder] && self->_startTime == 0.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      unsigned int v6 = [(SDStatusMonitor *)self->_monitor currentConsoleUser];

      if (v6)
      {
        int v7 = airdrop_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8[0] = 67109120;
          v8[1] = getuid();
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting AirDrop server for user %d on wake", (uint8_t *)v8, 8u);
        }

        [(SDAirDropServer *)self start];
      }
    }
  }
}

- (void)consoleUserChanged:(id)a3
{
  if (![(SDAirDropServer *)self thisIsTheFinder])
  {
    unsigned int v4 = [(SDStatusMonitor *)self->_monitor currentConsoleUser];
    double startTime = self->_startTime;
    if (v4)
    {
      if (startTime == 0.0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

        if (WeakRetained)
        {
          int v7 = airdrop_log();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            int v9 = 67109120;
            uid_t v10 = getuid();
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting AirDrop server for user %d on login", (uint8_t *)&v9, 8u);
          }

          [(SDAirDropServer *)self start];
        }
      }
    }
    else if (startTime != 0.0)
    {
      v8 = airdrop_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 67109120;
        uid_t v10 = getuid();
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Stopping AirDrop server for user %d on logout", (uint8_t *)&v9, 8u);
      }

      [(SDAirDropServer *)self stop];
    }
  }
}

- (void)finderAirDropEnabled:(id)a3
{
  if (![(SDAirDropServer *)self thisIsTheFinder])
  {
    unsigned int v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = [(SDStatusMonitor *)self->_monitor finderAirDropEnabled];
      CFStringRef v6 = @"exited";
      if (v5) {
        CFStringRef v6 = @"entered";
      }
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finder %@ AirDrop", (uint8_t *)&v7, 0xCu);
    }

    [(CUCoalescer *)self->_coalescer trigger];
  }
}

- (void)discoverableModeChanged:(id)a3
{
  if (![(SDAirDropServer *)self thisIsTheFinder])
  {
    unsigned int v4 = [(SDStatusMonitor *)self->_monitor discoverableMode];
    discoverableMode = self->_discoverableMode;
    self->_discoverableMode = v4;

    CFStringRef v6 = airdrop_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = self->_discoverableMode;
      int v8 = 138412290;
      int v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Discoverable mode changed to %@", (uint8_t *)&v8, 0xCu);
    }

    [(SDAirDropServer *)self stop];
    [(SDAirDropServer *)self updateServerState];
  }
}

- (void)keyBagFirstUnlock:(id)a3
{
  unsigned int v4 = airdrop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Device first unlock", v5, 2u);
  }

  [(SDAirDropServer *)self updateServerState];
}

- (void)screenStateChange:(id)a3
{
  if (![(SDAirDropServer *)self thisIsTheFinder])
  {
    BOOL screenOn = self->_screenOn;
    if (screenOn != [(SDStatusMonitor *)self->_monitor screenOn])
    {
      self->_BOOL screenOn = [(SDStatusMonitor *)self->_monitor screenOn];
      unsigned int v5 = airdrop_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_screenOn) {
          CFStringRef v6 = @"on";
        }
        else {
          CFStringRef v6 = @"off";
        }
        int v7 = 138412290;
        CFStringRef v8 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Screen turned %@", (uint8_t *)&v7, 0xCu);
      }

      [(SDAirDropServer *)self updateServerState];
    }
  }
}

- (BOOL)discoverableByEveryone
{
  return [(NSString *)self->_discoverableMode isEqual:kSFOperationDiscoverableModeEveryone];
}

- (BOOL)discoverableByContactsOnly
{
  return [(NSString *)self->_discoverableMode isEqual:kSFOperationDiscoverableModeContactsOnly];
}

- (void)stopScanningAndStartServer
{
  [(SDAirDropServer *)self stopProximityScanner];
  [(SDAirDropServer *)self invalidateTimers];
  [(SDAirDropServer *)self startTimers];

  [(SDAirDropServer *)self startServer];
}

- (void)handleFoundHashes:(id)a3 rssi:(id)a4
{
  id v6 = a3;
  [(SDAirDropServer *)self logDiscoveryWithHash:v6 rssi:a4];
  if ([(SDAirDropServer *)self discoverableByEveryone])
  {
    int v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      CFStringRef v8 = "In Everyone mode, start server";
      int v9 = v7;
      uint32_t v10 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if ([(SDAirDropServer *)self discoverableByContactsOnly])
  {
    unsigned int v11 = [(SDStatusMonitor *)self->_monitor contactsContainsShortHashes:v6];
    int v7 = airdrop_log();
    BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v12)
      {
        int v13 = 138412290;
        id v14 = v6;
        CFStringRef v8 = "Hashes %@ exist in contacts, start server";
        int v9 = v7;
        uint32_t v10 = 12;
        goto LABEL_8;
      }
LABEL_9:

      [(SDAirDropServer *)self stopScanningAndStartServer];
      goto LABEL_10;
    }
    if (v12)
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Hashes %@ not recognized", (uint8_t *)&v13, 0xCu);
    }
  }
LABEL_10:
}

- (void)logDiscoveryWithHash:(id)a3 rssi:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(NSMutableSet *)self->_discoveredHashes containsObject:v6];
  int v9 = airdrop_log();
  uint32_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000C0168((uint64_t)v6, (uint64_t)v7, v10);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BTLE discovered hashes %@ rssi %@", (uint8_t *)&v11, 0x16u);
    }

    [(NSMutableSet *)self->_discoveredHashes addObject:v6];
  }
}

- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5
{
  id v7 = a5;
  [a4 subdataWithRange:1, 8];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(SDAirDropServer *)self handleFoundHashes:v8 rssi:v7];
}

- (void)awdlDidUpdateState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 state];
  if ((unint64_t)v4 > 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *((void *)&off_1008CC6E0 + (void)v4);
  }
  id v6 = airdrop_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BTLE scanner %@", (uint8_t *)&v7, 0xCu);
  }

  if ([v3 state] == (id)3) {
    [v3 startConnectionlessAWDLServiceScanning];
  }
}

- (void)awdl:(id)a3 failedToStartScanningWithError:(id)a4
{
  id v4 = a4;
  uint64_t v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000C01F0((uint64_t)v4, v5);
  }
}

- (void)updateServerState
{
  if ([(SDAirDropServer *)self thisIsTheFinder]) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    unsigned int v4 = [(SDStatusMonitor *)self->_monitor currentConsoleUser];
    unsigned int v5 = [(SDStatusMonitor *)self->_monitor deviceWasUnlockedOnce];
    BOOL v6 = [(SDAirDropServer *)self discoverableByContactsOnly];
    if (v6) {
      unsigned int v7 = 1;
    }
    else {
      unsigned int v7 = [(SDAirDropServer *)self discoverableByEveryone];
    }
    if ((v4 & v7) == 1 && (self->_screenOn ? (unsigned int v9 = v5) : (unsigned int v9 = 0), v9 == 1))
    {
      [(SDAirDropServer *)self _createOSTransactionIfNeeded];
      self->_contactsOnly = v6;
      if ([(SDStatusMonitor *)self->_monitor enableDemoMode])
      {
LABEL_15:
        uint32_t v10 = airdrop_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Auto-trigger server", (uint8_t *)&v17, 2u);
        }

        [(SDAirDropServer *)self startServer];
        return;
      }
      if ([(SDStatusMonitor *)self->_monitor showMeInWormhole])
      {
        __int16 v13 = +[SDServerBrowser sharedBrowser];
        if ([v13 isAirDropEnabled])
        {

          goto LABEL_15;
        }
        char IsVirtualMachine = SFDeviceIsVirtualMachine();

        if (IsVirtualMachine) {
          goto LABEL_15;
        }
      }
      else if (SFDeviceIsVirtualMachine())
      {
        goto LABEL_15;
      }
      [(SDAirDropServer *)self startProximityScanner];
      v15 = airdrop_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_contactsOnly) {
          CFStringRef v16 = @"Contacts Only";
        }
        else {
          CFStringRef v16 = @"Everyone";
        }
        int v17 = 138412290;
        *(void *)uint64_t v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Scanning mode %@", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      int v11 = airdrop_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        BOOL screenOn = self->_screenOn;
        int v17 = 67109888;
        *(_DWORD *)uint64_t v18 = v4;
        *(_WORD *)&v18[4] = 1024;
        *(_DWORD *)&v18[6] = v7;
        __int16 v19 = 1024;
        BOOL v20 = screenOn;
        __int16 v21 = 1024;
        unsigned int v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Scanning mode off: console=%d, discoverable=%d, screenOn=%d, unlockedOnce=%d", (uint8_t *)&v17, 0x1Au);
      }

      [(SDAirDropServer *)self stop];
    }
  }
  else
  {
    uint64_t v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C0268();
    }
  }
}

- (void)airDropUnpublished:(id)a3
{
  unsigned int v4 = [a3 object];
  if (v4 != self && !self->_server)
  {
    unsigned int v9 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v6 = WeakRetained;
    if (WeakRetained && self->_screenOn)
    {
      unsigned int v7 = [(SDStatusMonitor *)self->_monitor currentConsoleUser];

      if (v7)
      {
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000BEA80;
        block[3] = &unk_1008CA4B8;
        block[4] = self;
        dispatch_async(queue, block);
      }
      return;
    }

    unsigned int v4 = v9;
  }
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"keyBagFirstUnlock:" name:@"com.apple.sharingd.KeyBagFirstUnlock" object:0];
  [v3 addObserver:self selector:"wirelessChanged:" name:@"com.apple.sharingd.WirelessCarPlayChanged" object:0];
  [v3 addObserver:self selector:"appleIDAccountInfoChanged:" name:@"com.apple.sharingd.AppleIDAccountInfoChanged" object:0];
  [v3 addObserver:self selector:"appleIDChanged:" name:@"com.apple.sharingd.AppleIDChanged" object:0];
  [v3 addObserver:self selector:"airDropUnpublished:" name:@"com.apple.sharingd.AirDropUnpublished" object:0];
  [v3 addObserver:self selector:"airDropStatusChanged:" name:@"com.apple.sharingd.AirDropStatusChanged" object:0];
  [v3 addObserver:self selector:"wirelessChanged:" name:@"com.apple.sharingd.WirelessModeChanged" object:0];
  [v3 addObserver:self selector:"wirelessChanged:" name:@"com.apple.sharingd.WirelessPowerChanged" object:0];
  [v3 addObserver:self selector:"screenStateChange:" name:@"com.apple.sharingd.ScreenStateChanged" object:0];
  [v3 addObserver:self selector:"bluetoothChanged:" name:@"com.apple.sharingd.BluetoothPowerChanged" object:0];
  [v3 addObserver:self selector:"discoverableModeChanged:" name:@"com.apple.sharingd.DiscoverableModeChanged" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)notifyClient:(int64_t)a3 withResults:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained airDropServer:self event:a3 withResults:v7];
}

- (void)bonjourPublisher:(id)a3 propertiesDidChange:(id)a4
{
}

- (id)sslSettings
{
  if ([(SDStatusMonitor *)self->_monitor disableTLS])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = objc_opt_new();
    unsigned int v4 = objc_opt_new();
    [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:_kCFStreamSSLShouldSetPeerID];
    [v3 setObject:v4 forKeyedSubscript:_kCFHTTPServerStreamSSLSettings];
    if (self->_identity)
    {
      unsigned int v5 = [(SDStatusMonitor *)self->_monitor copyMyAppleIDIntermediateCertificate];
      if (v5)
      {
        BOOL v6 = v5;
        v12[0] = self->_identity;
        v12[1] = v5;
        id v7 = +[NSArray arrayWithObjects:v12 count:2];
        [v3 setObject:v7 forKeyedSubscript:_kCFHTTPServerServerTrustChain];

        CFRelease(v6);
      }
      else
      {
        unsigned int v9 = airdrop_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000C029C();
        }
      }
    }
    else
    {
      uint64_t v8 = airdrop_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AirDrop using self-signed certificate", v11, 2u);
      }

      [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:_kCFHTTPServerAllowAnonymousServer];
    }
    [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:_kCFHTTPServerRequireClientCertificate];
  }

  return v3;
}

- (void)startHTTPServer:(unsigned __int16)a3
{
  if (!self->_server && self->_startTime != 0.0)
  {
    Service = (_CFHTTPServer *)_CFHTTPServerCreateService();
    self->_server = Service;
    if (Service)
    {
      [(SDAirDropServer *)self sslSettings];
      _CFHTTPServerSetProperty();
      _CFHTTPServerSetProperty();
      _CFHTTPServerSetProperty();
      if (!sub_1001B3C24() && ![(SDStatusMonitor *)self->_monitor enableDemoMode]
        || SFDeviceIsVirtualMachine())
      {
        [(SDStatusMonitor *)self->_monitor registerAllInterfaces];
        _CFHTTPServerSetProperty();
      }
      _CFHTTPServerSetProperty();
      CFRunLoopGetMain();
      _CFHTTPServerScheduleWithRunLoopAndMode();
      unsigned int v5 = (NSNumber *)_CFHTTPServerCopyProperty();
      portNumber = self->_portNumber;
      self->_portNumber = v5;

      id v7 = self->_portNumber;
      uint64_t v8 = airdrop_log();
      unsigned int v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint32_t v10 = self->_portNumber;
          *(_DWORD *)buf = 138412290;
          CFStringRef v16 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AirDrop server scheduled on port %@", buf, 0xCu);
        }

        sub_100046EFC(@"BonjourAdvertise", @"Start", (uint64_t)self->_clientBundleID, self->_clientPid);
        int v11 = [[SDAirDropPublisher alloc] initWithPort:self->_portNumber identity:self->_identity];
        publisher = self->_publisher;
        self->_publisher = v11;

        [(SDAirDropPublisher *)self->_publisher setDelegate:self];
        [(SDAirDropPublisher *)self->_publisher start];
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1000C0304();
        }
      }
    }
    else
    {
      __int16 v13 = airdrop_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000C02D0();
      }
    }
  }
}

- (void)startProximityScanner
{
  unsigned int v3 = +[SFAirDropUserDefaults_objc askToAirdropEnabled];
  if ((!v3 || self->_scanningIdentifier) && self->_proximity || CFDictionaryGetCount(self->_connections))
  {
    unsigned int v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = self->_scanningIdentifier != 0;
      CFIndex Count = CFDictionaryGetCount(self->_connections);
      *(_DWORD *)buf = 67109376;
      BOOL v16 = v5;
      __int16 v17 = 2048;
      CFIndex v18 = Count;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BTLE scanning not starting: scanningIdentifier=%d, count=%ld", buf, 0x12u);
    }
    goto LABEL_7;
  }
  id v7 = airdrop_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BTLE scanning started", buf, 2u);
  }

  sub_100046EFC(@"BluetoothScanning", @"Start", (uint64_t)self->_clientBundleID, self->_clientPid);
  if (v3)
  {
    uint64_t v8 = +[NSUUID UUID];
    scanningIdentifier = self->_scanningIdentifier;
    self->_scanningIdentifier = v8;

    unsigned int v4 = +[SDAirDropBLEController shared];
    uint32_t v10 = self->_scanningIdentifier;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000BF448;
    v14[3] = &unk_1008CC6C0;
    v14[4] = self;
    [v4 startScanningWithIdentifier:v10 deviceUpdatesHandler:v14];
LABEL_7:

    return;
  }
  int v11 = (WPAWDL *)[objc_alloc((Class)WPAWDL) initWithDelegate:self queue:self->_queue];
  proximity = self->_proximity;
  self->_proximity = v11;

  __int16 v13 = self->_proximity;
  if (v13 && [(WPAWDL *)v13 state] == (id)3) {
    [(WPAWDL *)self->_proximity startConnectionlessAWDLServiceScanning];
  }
}

- (void)stopProximityScanner
{
  unsigned int v3 = +[SFAirDropUserDefaults_objc askToAirdropEnabled];
  if (v3 && self->_scanningIdentifier || self->_proximity)
  {
    unsigned int v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BTLE scanning stopped", v8, 2u);
    }

    sub_100046EFC(@"BluetoothScanning", @"Stop", (uint64_t)self->_clientBundleID, self->_clientPid);
    if (v3)
    {
      BOOL v5 = +[SDAirDropBLEController shared];
      p_scanningIdentifier = (void **)&self->_scanningIdentifier;
      [v5 stopScanningWithIdentifier:self->_scanningIdentifier];
    }
    else
    {
      p_scanningIdentifier = (void **)&self->_proximity;
      [(WPAWDL *)self->_proximity stopConnectionlessAWDLServiceScanning];
      [(WPAWDL *)self->_proximity invalidate];
    }
    id v7 = *p_scanningIdentifier;
    *p_scanningIdentifier = 0;

    [(NSMutableSet *)self->_discoveredHashes removeAllObjects];
  }
}

- (void)foundDevice:(id)a3
{
  id v4 = a3;
  LOBYTE(v8) = (unsigned __int16)[v4 airdropHash1] >> 8;
  BYTE1(v8) = [v4 airdropHash1:v8];
  BYTE2(v8) = (unsigned __int16)[v4 airdropHash2] >> 8;
  BYTE3(v8) = [v4 airdropHash2];
  BYTE4(v8) = (unsigned __int16)[v4 airdropHash3] >> 8;
  BYTE5(v8) = [v4 airdropHash3];
  BYTE6(v8) = (unsigned __int16)[v4 airdropHash4] >> 8;
  HIBYTE(v8) = [v4 airdropHash4];
  BOOL v5 = +[NSData dataWithBytes:&v8 length:8];
  id v6 = [v4 bleRSSI];

  id v7 = +[NSNumber numberWithInt:v6];
  [(SDAirDropServer *)self handleFoundHashes:v5 rssi:v7];
}

- (void)startServer
{
  if (!self->_server && self->_startTime == 0.0)
  {
    if (![(SDStatusMonitor *)self->_monitor disableTLS])
    {
      identity = self->_identity;
      if (identity) {
        CFRelease(identity);
      }
      self->_identity = [(SDStatusMonitor *)self->_monitor copyMyAppleIDSecIdentity];
    }
    self->_double startTime = CFAbsoluteTimeGetCurrent();
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BF760;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)airDropInformation:(id)a3 didChange:(id)a4
{
}

- (BOOL)thisIsTheFinder
{
  return [(NSString *)self->_clientBundleID isEqualToString:@"com.apple.finder"];
}

- (void)start
{
  if ([(SDAirDropServer *)self thisIsTheFinder])
  {
    [(SDAirDropServer *)self _createOSTransactionIfNeeded];
    [(SDStatusMonitor *)self->_monitor setFinderServer:self];
    unsigned int v3 = objc_alloc_init(SDAirDropInformation);
    information = self->_information;
    self->_information = v3;

    [(SDAirDropInformation *)self->_information setDelegate:self];
    BOOL v5 = self->_information;
    [(SDAirDropInformation *)v5 start];
  }
  else
  {
    id v6 = airdrop_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AirDrop server started", buf, 2u);
    }

    if (dword_1009942C8)
    {
      dispatch_time_t v7 = sub_1001B1AF8(2.0);
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000BF918;
      block[3] = &unk_1008CA4B8;
      block[4] = self;
      dispatch_after(v7, queue, block);
    }
    else
    {
      unsigned int v9 = self->_queue;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000BF920;
      v10[3] = &unk_1008CA4B8;
      v10[4] = self;
      dispatch_async(v9, v10);
    }
  }
}

- (void)stop
{
  if ([(SDAirDropServer *)self thisIsTheFinder])
  {
    [(SDStatusMonitor *)self->_monitor setFinderServer:0];
    [(SDAirDropInformation *)self->_information setDelegate:0];
    [(SDAirDropInformation *)self->_information stop];
    information = self->_information;
    self->_information = 0;
  }
  else
  {
    if (self->_startTime != 0.0)
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      sub_100046584(Current - self->_startTime);
      self->_double startTime = 0.0;
    }
    if (self->_server)
    {
      BOOL v5 = airdrop_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)dispatch_time_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidating AirDrop server", v7, 2u);
      }

      _CFHTTPServerInvalidate();
    }
    [(SDAirDropServer *)self stopProximityScanner];
    [(SDAirDropServer *)self invalidateTimers];
  }
  transaction = self->_transaction;
  self->_transaction = 0;
}

- (void)activate
{
  if (!self->_coalescer)
  {
    unsigned int v3 = self;
    id v4 = (CUCoalescer *)objc_opt_new();
    coalescer = self->_coalescer;
    self->_coalescer = v4;

    [(CUCoalescer *)self->_coalescer setDispatchQueue:v3->_queue];
    [(CUCoalescer *)self->_coalescer setMaxDelay:0.4];
    [(CUCoalescer *)self->_coalescer setMinDelay:0.3];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000BFB08;
    v6[3] = &unk_1008CA4B8;
    v6[4] = v3;
    [(CUCoalescer *)self->_coalescer setActionHandler:v6];
    [(SDAirDropServer *)v3 addObservers];
    [(SDAirDropServer *)v3 start];
  }
}

- (void)invalidate
{
  if (self->_transaction)
  {
    [(SDAirDropServer *)self stop];
    [(SDAirDropServer *)self removeObservers];
    [(CUCoalescer *)self->_coalescer invalidate];
    transaction = self->_transaction;
    self->_transaction = 0;
  }
}

- (NSString)description
{
  NSAppendPrintF();
  id v31 = 0;
  NSAppendPrintF();
  id v3 = v31;

  NSAppendPrintF();
  id v4 = v3;

  NSAppendPrintF();
  id v5 = v4;

  if (self->_contactsOnly) {
    id v6 = "yes";
  }
  else {
    id v6 = "no";
  }
  v25 = v6;
  NSAppendPrintF();
  id v7 = v5;

  if ([(SDAirDropServer *)self discoverableByEveryone]) {
    uint64_t v8 = "yes";
  }
  else {
    uint64_t v8 = "no";
  }
  v26 = v8;
  NSAppendPrintF();
  id v9 = v7;

  [(SDStatusMonitor *)self->_monitor deviceWasUnlockedOnce];
  NSAppendPrintF();
  id v10 = v9;

  NSAppendPrintF();
  id v11 = v10;

  if (self->_proximity) {
    id v12 = "yes";
  }
  else {
    id v12 = "no";
  }
  v27 = v12;
  NSAppendPrintF();
  id v13 = v11;

  proximity = self->_proximity;
  if (proximity)
  {
    unint64_t v15 = (unint64_t)[(WPAWDL *)proximity state];
    BOOL v16 = v15 > 5 ? "?" : off_1008CC700[v15];
    v28 = v16;
    NSAppendPrintF();
    id v17 = v13;

    id v29 = [(NSMutableSet *)self->_discoveredHashes count];
    NSAppendPrintF();
    id v13 = v17;

    if ([(NSMutableSet *)self->_discoveredHashes count])
    {
      CFIndex v18 = [(NSMutableSet *)self->_discoveredHashes allObjects];
      v30 = [v18 componentsJoinedByString:@", "];
      NSAppendPrintF();
      id v19 = v13;

      id v13 = v19;
    }
  }
  NSAppendPrintF();
  id v20 = v13;

  if (self->_server)
  {
    CFAbsoluteTimeGetCurrent();
    NSAppendPrintF();
    id v21 = v20;

    id v20 = v21;
  }
  connections = self->_connections;
  if (connections && CFDictionaryGetCount(connections))
  {
    CFDictionaryGetCount(self->_connections);
    NSAppendPrintF();
    id v23 = v20;

    id v20 = v23;
  }

  return (NSString *)v20;
}

- (void)_createOSTransactionIfNeeded
{
  if (!self->_transaction)
  {
    id v3 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v3;
  }
}

- (int)clientPid
{
  return self->_clientPid;
}

- (void)setClientPid:(int)a3
{
  self->_clientPid = a3;
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setClientBundleID:(id)a3
{
}

- (SDAirDropServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDAirDropServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_scanningIdentifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_information, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_discoveredHashes, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_discoverableMode, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong((id *)&self->_bluetoothTimer, 0);
  objc_storeStrong((id *)&self->_awdlTimer, 0);
  objc_storeStrong((id *)&self->_portNumber, 0);

  objc_storeStrong((id *)&self->_proximity, 0);
}

@end