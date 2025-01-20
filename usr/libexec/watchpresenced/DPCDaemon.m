@interface DPCDaemon
+ (id)sharedInstance;
- (BOOL)checkIfShouldShutdown;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DPCDaemon)init;
- (NSMutableArray)connections;
- (unint64_t)currentWatchPresenceType;
- (unint64_t)startTheDetection;
- (void)_setupXPCListener;
- (void)dealloc;
- (void)forceNotifyNewEvents:(unint64_t)a3 probability:(float)a4;
- (void)getCurrentWatchPresenceStatus;
- (void)notifyConnection:(id)a3 withError:(unint64_t)a4;
- (void)notifyNewEvents:(unint64_t)a3 probability:(float)a4;
- (void)notifyNewWatchStatusEvents:(unint64_t)a3;
- (void)setConnections:(id)a3;
- (void)setCurrentWatchPresenceStatus:(unint64_t)a3;
- (void)setCurrentWatchPresenceType:(unint64_t)a3;
- (void)setStreamingMode:(BOOL)a3;
- (void)setupWatchPresenceDetection;
- (void)shutdownTheDetection;
- (void)startWatchPresenceDetection;
- (void)stopWatchPresenceDetection;
@end

@implementation DPCDaemon

+ (id)sharedInstance
{
  if (qword_100016ED8 != -1) {
    dispatch_once(&qword_100016ED8, &stru_100010580);
  }
  v2 = (void *)qword_100016EE0;

  return v2;
}

- (DPCDaemon)init
{
  v10.receiver = self;
  v10.super_class = (Class)DPCDaemon;
  v2 = [(DPCDaemon *)&v10 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    connectionLock = v2->_connectionLock;
    v2->_connectionLock = v3;

    v5 = objc_alloc_init(DPCWatchPresenceDetector);
    detector = v2->_detector;
    v2->_detector = v5;

    [(DPCDaemon *)v2 _setupXPCListener];
    uint64_t v7 = +[DPCTelemetry sharedInstance];
    telemetry = v2->_telemetry;
    v2->_telemetry = (DPCTelemetry *)v7;
  }
  return v2;
}

- (void)dealloc
{
  [(DPCDaemon *)self shutdownTheDetection];
  v3.receiver = self;
  v3.super_class = (Class)DPCDaemon;
  [(DPCDaemon *)&v3 dealloc];
}

- (void)_setupXPCListener
{
  objc_super v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.watchpresenced"];
  listener = self->_listener;
  self->_listener = v3;

  v5 = self->_listener;
  if (!v5)
  {
    v6 = sub_100006A24((uint64_t)off_100016CB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "XPC Listener failed", v9, 2u);
    }

    v5 = self->_listener;
  }
  [(NSXPCListener *)v5 setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
  uint64_t v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  connections = self->_connections;
  self->_connections = v7;
}

- (unint64_t)startTheDetection
{
  unint64_t v3 = [(DPCWatchPresenceDetector *)self->_detector prestartCheck];
  if (!v3)
  {
    self->_currentWatchPresenceType = 1;
    [(DPCWatchPresenceDetector *)self->_detector start];
  }
  return v3;
}

- (void)shutdownTheDetection
{
  unint64_t v3 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down watchpresenced", v5, 2u);
  }

  [(DPCWatchPresenceDetector *)self->_detector resetAll];
  transaction = self->_transaction;
  self->_transaction = 0;
}

- (BOOL)checkIfShouldShutdown
{
  return [(NSMutableArray *)self->_connections count] == 0;
}

- (void)notifyNewEvents:(unint64_t)a3 probability:(float)a4
{
  [(NSLock *)self->_connectionLock lock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_connections;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) remoteObjectProxy:v14];
        *(float *)&double v13 = a4;
        [v12 newWatchPresenceEvent:a3 probability:v13];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(NSLock *)self->_connectionLock unlock];
}

- (void)notifyNewWatchStatusEvents:(unint64_t)a3
{
  [(NSLock *)self->_connectionLock lock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_connections;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) remoteObjectProxy:v11];
        [v10 newWatchStatusEvent:a3];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(NSLock *)self->_connectionLock unlock];
}

- (void)forceNotifyNewEvents:(unint64_t)a3 probability:(float)a4
{
  [(NSLock *)self->_connectionLock lock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_connections;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) remoteObjectProxy:v14];
        *(float *)&double v13 = a4;
        [v12 newWatchPresenceEvent:a3 probability:v13];

        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(NSLock *)self->_connectionLock unlock];
}

- (void)notifyConnection:(id)a3 withError:(unint64_t)a4
{
  id v5 = a3;
  id v6 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = [v5 processIdentifier];
    __int16 v9 = 2048;
    unint64_t v10 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notifying connection %d with Error %lu", (uint8_t *)v8, 0x12u);
  }

  id v7 = [v5 remoteObjectProxy];
  [v7 newErrorDetected:a4];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = [v7 processIdentifier];
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Watchpresenced received a new connection request from %d, connection: %@", (uint8_t *)&buf, 0x12u);
  }

  __int16 v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DPCXPCInterface];
  [v7 setExportedInterface:v9];

  [v7 setExportedObject:self];
  unint64_t v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DPCXPCClientInterface];
  [v7 setRemoteObjectInterface:v10];

  objc_initWeak(&buf, self);
  objc_initWeak(&location, v7);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000075A4;
  v15[3] = &unk_1000105A8;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &buf);
  [v7 setInvalidationHandler:v15];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000076C0;
  v12[3] = &unk_1000105A8;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &buf);
  [v7 setInterruptionHandler:v12];
  [(NSLock *)self->_connectionLock lock];
  [(NSMutableArray *)self->_connections addObject:v7];
  [(NSLock *)self->_connectionLock unlock];
  [v7 resume];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&buf);

  return 1;
}

- (void)getCurrentWatchPresenceStatus
{
  LODWORD(v2) = 1065185444;
  [(DPCDaemon *)self notifyNewEvents:self->_currentWatchPresenceType probability:v2];
}

- (void)startWatchPresenceDetection
{
  double v2 = self;
  objc_sync_enter(v2);
  if (!v2->_transaction)
  {
    uint64_t v3 = os_transaction_create();
    transaction = v2->_transaction;
    v2->_transaction = (OS_os_transaction *)v3;
  }
  id v5 = +[NSXPCConnection currentConnection];
  id v6 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    __int16 v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[start] command received from connection %@, going to start...", (uint8_t *)&v8, 0xCu);
  }

  if ([(NSMutableArray *)v2->_connections count] == (id)1)
  {
    id v7 = [(DPCDaemon *)v2 startTheDetection];
    if (v7)
    {
      if (v7 == (id)2) {
        [(DPCDaemon *)v2 notifyNewWatchStatusEvents:5];
      }
      else {
        [(DPCDaemon *)v2 notifyConnection:v5 withError:v7];
      }
    }
  }

  objc_sync_exit(v2);
}

- (void)stopWatchPresenceDetection
{
  double v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = +[NSXPCConnection currentConnection];
  v4 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[stop] command received from connection %@, going to stop...", (uint8_t *)&v5, 0xCu);
  }

  if ([(DPCDaemon *)v2 checkIfShouldShutdown]) {
    [(DPCDaemon *)v2 shutdownTheDetection];
  }

  objc_sync_exit(v2);
}

- (void)setupWatchPresenceDetection
{
  double v2 = self;
  objc_sync_enter(v2);
  objc_initWeak(&location, v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007B48;
  block[3] = &unk_1000105F8;
  block[4] = v2;
  objc_copyWeak(&v4, &location);
  if (qword_100016EE8 != -1) {
    dispatch_once(&qword_100016EE8, block);
  }
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  objc_sync_exit(v2);
}

- (void)setCurrentWatchPresenceStatus:(unint64_t)a3
{
  int v5 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    CFStringRef v6 = @"Unknown";
    if (a3 == 1) {
      CFStringRef v6 = @"Presence";
    }
    if (a3 == 2) {
      CFStringRef v6 = @"Absence";
    }
    int v8 = 138412290;
    CFStringRef v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "received a testtool set status command: going to set to type %@...", (uint8_t *)&v8, 0xCu);
  }

  self->_currentWatchPresenceType = a3;
  LODWORD(v7) = 1065185444;
  [(DPCDaemon *)self forceNotifyNewEvents:a3 probability:v7];
}

- (void)setStreamingMode:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    CFStringRef v6 = @"disable";
    if (v3) {
      CFStringRef v6 = @"enable";
    }
    int v7 = 138412290;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Going to %@ streaming mode", (uint8_t *)&v7, 0xCu);
  }

  [(DPCWatchPresenceDetector *)self->_detector setEnabledStreamingMode:v3];
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (unint64_t)currentWatchPresenceType
{
  return self->_currentWatchPresenceType;
}

- (void)setCurrentWatchPresenceType:(unint64_t)a3
{
  self->_currentWatchPresenceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_telemetry, 0);

  objc_storeStrong((id *)&self->_detector, 0);
}

@end