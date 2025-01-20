@interface SDConnectionManager
+ (id)sharedManager;
- (NSMutableArray)companionStreams;
- (NSMutableArray)streamIdentifiers;
- (NSMutableArray)unlockSessions;
- (NSMutableDictionary)deviceStreamMap;
- (NSString)bundleID;
- (NSUUID)identifier;
- (NSXPCConnection)xpcConnection;
- (SDConnectionManager)initWithXPCConnection:(id)a3;
- (SDConnectionManagerDelegate)delegate;
- (SDHotspotAgent)hotspotAgent;
- (SDServiceManager)serviceManager;
- (void)appleAccountSignedIn;
- (void)appleAccountSignedOut;
- (void)cleanUpConnections;
- (void)companionStreamClosedStreams:(id)a3;
- (void)createCompanionServiceManagerWithIdentifier:(id)a3 clientProxy:(id)a4 reply:(id)a5;
- (void)createHotspotSessionForClientProxy:(id)a3 reply:(id)a4;
- (void)createStreamsForMessage:(id)a3 reply:(id)a4;
- (void)createUnlockManagerWithReply:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCompanionStreams:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceStreamMap:(id)a3;
- (void)setHotspotAgent:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setServiceManager:(id)a3;
- (void)setStreamIdentifiers:(id)a3;
- (void)setUnlockSessions:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)start;
- (void)unlockSessionDidFinish:(id)a3;
- (void)updateLowLatencyFilter:(id)a3 isAddFilter:(BOOL)a4 completion:(id)a5;
@end

@implementation SDConnectionManager

+ (id)sharedManager
{
  if (qword_100980018 != -1) {
    dispatch_once(&qword_100980018, &stru_1008CD8E0);
  }
  v2 = (void *)qword_100980010;

  return v2;
}

- (SDConnectionManager)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SDConnectionManager;
  v6 = [(SDConnectionManager *)&v22 init];
  if (v6)
  {
    uint64_t v7 = +[NSUUID UUID];
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

    v9 = [v5 _xpcConnection];
    uint64_t v10 = sub_1001B3F50(v9);
    bundleID = v6->_bundleID;
    v6->_bundleID = (NSString *)v10;

    serviceManager = v6->_serviceManager;
    v6->_serviceManager = 0;

    uint64_t v13 = objc_opt_new();
    unlockSessions = v6->_unlockSessions;
    v6->_unlockSessions = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    uint64_t v15 = objc_opt_new();
    companionStreams = v6->_companionStreams;
    v6->_companionStreams = (NSMutableArray *)v15;

    uint64_t v17 = objc_opt_new();
    deviceStreamMap = v6->_deviceStreamMap;
    v6->_deviceStreamMap = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    streamIdentifiers = v6->_streamIdentifiers;
    v6->_streamIdentifiers = (NSMutableArray *)v19;
  }
  return v6;
}

- (void)start
{
  if (self->_xpcConnection)
  {
    +[SFCompanionXPCManager initialize];
    v3 = +[SFCompanionXPCManager xpcManagerInterface];
    [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v3];

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
    id location = 0;
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10010D1D4;
    v11[3] = &unk_1008CA3B0;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v11];
    v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    v8 = sub_10010D240;
    v9 = &unk_1008CA3B0;
    objc_copyWeak(&v10, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:&v6];
    identifier = self->_identifier;
    CFStringRef v14 = @"SDConnectionManagerIdentifier";
    uint64_t v15 = identifier;
    id v5 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1, v6, v7, v8, v9);
    [(NSXPCConnection *)self->_xpcConnection setUserInfo:v5];

    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)cleanUpConnections
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010D4DC;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v3 = tethering_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(NSUUID *)self->_identifier UUIDString];
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Client invalidated (%@)", buf, 0xCu);
  }
  [(SDHotspotAgent *)self->_hotspotAgent stopBrowsingForClientID:self->_identifier];
  [(SDHotspotAgent *)self->_hotspotAgent removeClientID:self->_identifier];
  hotspotAgent = self->_hotspotAgent;
  self->_hotspotAgent = 0;
}

- (void)createCompanionServiceManagerWithIdentifier:(id)a3 clientProxy:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    uint64_t v17 = streams_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10010E37C();
    }
    goto LABEL_17;
  }
  if (!v9)
  {
    v18 = streams_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10010E3B0();
    }

    NSErrorDomain v19 = NSPOSIXErrorDomain;
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    CFStringRef v27 = @"Missing client proxy";
    v20 = &v27;
    v21 = &v26;
    goto LABEL_16;
  }
  if (!v8)
  {
    objc_super v22 = streams_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10010E3E4();
    }

    NSErrorDomain v19 = NSPOSIXErrorDomain;
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"Missing identifier";
    v20 = &v25;
    v21 = &v24;
LABEL_16:
    v23 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v21 count:1];
    uint64_t v17 = +[NSError errorWithDomain:v19 code:22 userInfo:v23];

    (*((void (**)(id, void, void, void, void, NSObject *))v10 + 2))(v10, 0, 0, 0, 0, v17);
LABEL_17:

    goto LABEL_20;
  }
  if (!self->_serviceManager)
  {
    v11 = [[SDServiceManager alloc] initWithClientProxy:v9 withIdentifier:v8];
    serviceManager = self->_serviceManager;
    self->_serviceManager = v11;

    [(SDServiceManager *)self->_serviceManager setBundleID:self->_bundleID];
    [(SDServiceManager *)self->_serviceManager start];
  }
  uint64_t v13 = +[SDStatusMonitor sharedMonitor];
  CFStringRef v14 = [v13 someComputerName];

  uint64_t v15 = (__CFString *)sub_1001B40B8();
  if (sub_1000D912C())
  {
    v16 = +[SDCompanionCommon myIPAddress];
  }
  else
  {
    v16 = 0;
  }
  (*((void (**)(id, SDServiceManager *, void *, __CFString *, void *, void))v10 + 2))(v10, self->_serviceManager, v14, v15, v16, 0);

LABEL_20:
}

- (void)createStreamsForMessage:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = streams_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Streams are being requested from service = %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010DAC4;
  block[3] = &unk_1008CAD48;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)createUnlockManagerWithReply:(id)a3
{
  v4 = (void (**)(id, SDUnlockXPCSession *, void))a3;
  id v5 = objc_alloc_init(SDUnlockXPCSession);
  [(SDUnlockXPCSession *)v5 setDelegate:self];
  v4[2](v4, v5, 0);

  id v6 = v5;
  sf_dispatch_on_main_queue();
}

- (void)createHotspotSessionForClientProxy:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ((SFIsDeviceAppleTV() & 1) != 0
    || (+[SDHotspotAgent sharedAgent],
        (id v8 = (SDHotspotAgent *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"Could not create a hotspot browser";
    v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v11];

    v7[2](v7, 0, v10);
  }
  else
  {
    hotspotAgent = self->_hotspotAgent;
    self->_hotspotAgent = v8;
    id v10 = v8;

    [(SDHotspotAgent *)v10 addClientID:self->_identifier proxy:v6];
    ((void (**)(id, SDHotspotAgent *, id))v7)[2](v7, v10, 0);
  }
}

- (void)updateLowLatencyFilter:(id)a3 isAddFilter:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, id))a5;
  if ((SFIsDeviceAppleTV() & 1) != 0
    || (+[SDHotspotAgent sharedAgent],
        (id v10 = (SDHotspotAgent *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    CFStringRef v15 = @"Could not create a hotspot agent";
    CFStringRef v13 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    NSErrorUserInfoKey v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v13];

    v9[2](v9, v12);
  }
  else
  {
    hotspotAgent = self->_hotspotAgent;
    self->_hotspotAgent = v10;
    NSErrorUserInfoKey v12 = v10;

    [(SDHotspotAgent *)v12 updateLowLatencyFilter:v8 isAddFilter:v6 completion:v9];
  }
}

- (void)appleAccountSignedIn
{
  v2 = SFMainQueue();
  dispatch_async(v2, &stru_1008CD900);
}

- (void)appleAccountSignedOut
{
  v2 = SFMainQueue();
  dispatch_async(v2, &stru_1008CD920);
}

- (void)companionStreamClosedStreams:(id)a3
{
}

- (void)unlockSessionDidFinish:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  sf_dispatch_on_main_queue();
}

- (SDConnectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDConnectionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (NSMutableArray)companionStreams
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCompanionStreams:(id)a3
{
}

- (SDServiceManager)serviceManager
{
  return (SDServiceManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServiceManager:(id)a3
{
}

- (NSMutableDictionary)deviceStreamMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDeviceStreamMap:(id)a3
{
}

- (NSMutableArray)unlockSessions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUnlockSessions:(id)a3
{
}

- (NSMutableArray)streamIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStreamIdentifiers:(id)a3
{
}

- (SDHotspotAgent)hotspotAgent
{
  return (SDHotspotAgent *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHotspotAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotspotAgent, 0);
  objc_storeStrong((id *)&self->_streamIdentifiers, 0);
  objc_storeStrong((id *)&self->_unlockSessions, 0);
  objc_storeStrong((id *)&self->_deviceStreamMap, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_companionStreams, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end