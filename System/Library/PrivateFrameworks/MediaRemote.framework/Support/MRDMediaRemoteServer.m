@interface MRDMediaRemoteServer
+ (MRDMediaRemoteServer)server;
- (BOOL)_internalMediaRemoteNotificationIsLegal:(id)a3;
- (BOOL)_isACriticalSectionActive;
- (BOOL)_isMediaAppInstalled:(id)a3;
- (BOOL)isFirstLaunchAfterBoot;
- (BOOL)shouldSendCommandsDuringPhoneCall;
- (FBSDisplayLayoutMonitor)sharedDisplayMonitor;
- (MRDAVRoutingServer)routingServer;
- (MRDExternalDeviceRemoteServer)externalDeviceServer;
- (MRDGroupSessionServer)groupSessionServer;
- (MRDMediaRemoteClient)MRUIClient;
- (MRDMediaRemoteClient)daemonClient;
- (MRDMediaRemoteClient)frontmostClient;
- (MRDMediaRemoteClient)localNowPlayingClient;
- (MRDMediaRemoteClient)systemMediaClient;
- (MRDMediaRemoteClient)systemPodcastClient;
- (MRDMediaRemoteServer)init;
- (MRDNowPlayingServer)nowPlayingServer;
- (MRDRemoteControlServer)remoteControlServer;
- (MRDTransactionServer)transactionServer;
- (MRDUIServer)uiServer;
- (MRDeviceInfo)deviceInfo;
- (NSArray)availableOrigins;
- (RPCompanionLinkClient)sharedCompanionLinkClient;
- (id)_init;
- (id)allClients;
- (id)canBeNowPlayingClients;
- (id)clientForBundleIdentifier:(id)a3;
- (id)clientForPID:(int)a3;
- (id)clientForPlayerPath:(id)a3;
- (id)clientWithRegisteredCustomOrigin:(id)a3;
- (id)mostRecentCanBeNowPlayingClient;
- (id)mostRecentPlayingClient;
- (void)_clientDidOpenConnection:(id)a3;
- (void)_collectDiagnosticFromClient:(id)a3 completion:(id)a4;
- (void)_handleAdjustSystemVolumeByStepMessage:(id)a3 fromClient:(id)a4;
- (void)_handleAdjustSystemVolumeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCollectClientDiagnosticsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCollectClientDiagnosticsMessageWithCompletion:(id)a3;
- (void)_handleCollectDiagnosticMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCompletePairingHandlerMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCriticalSectionTransition:(id)a3 fromClient:(id)a4;
- (void)_handleGetIsBooksAppInstalledMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetIsMusicAppInstalledMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetSupportsSystemPairingMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetSystemIsMutedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetSystemVolumeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleKeepAliveMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePing:(id)a3 fromClient:(id)a4;
- (void)_handleRegisterPairingHandlerMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRequestBlessMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSelectSourceMessage:(id)a3 fromClient:(id)a4;
- (void)_handleServerXPCMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetSystemIsMutedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetSystemVolumeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleUnregisterPairingHandler:(id)a3 fromClient:(id)a4;
- (void)_handleWakeMediaAppMessage:(id)a3 fromClient:(id)a4;
- (void)_handleWakePlayerServiceMessage:(id)a3 fromClient:(id)a4;
- (void)_postAppActivityNotificationNamed:(id)a3 withActivity:(id)a4;
- (void)_removeClient:(id)a3;
- (void)_restoreNowPlayingClientState;
- (void)_sendMediaRemoteCommand:(unsigned int)a3 withOrigin:(id)a4;
- (void)_terminationHandler;
- (void)_validateAuditTokens:(id)a3 pids:(id)a4 auditTokens:(id)a5;
- (void)addClient:(id)a3;
- (void)addMediaRemoteSeverStartedHandler:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)initializeServer;
- (void)postClientNotificationNamed:(id)a3;
- (void)postClientNotificationNamed:(id)a3 predicate:(id)a4;
- (void)postClientNotificationNamed:(id)a3 userInfo:(id)a4;
- (void)postClientNotificationNamed:(id)a3 userInfo:(id)a4 predicate:(id)a5;
- (void)reevaluateClientsForActiveCriticalSection;
- (void)removeClientForPID:(int)a3;
- (void)restoreClientDeviceInfo:(id)a3;
- (void)restoreClientState:(id)a3 handler:(id)a4;
- (void)start;
- (void)stop;
- (void)virtualAudioInputServer:(id)a3 didUpdateRecordingState:(unsigned int)a4 forDevice:(id)a5;
@end

@implementation MRDMediaRemoteServer

- (BOOL)_isACriticalSectionActive
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v3 = [(NSMutableDictionary *)self->_activeClients allValues];
  v4 = objc_msgSend(v3, "mr_filter:", &stru_10041CFD8);
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (id)allClients
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1001073A8;
  v10 = sub_1001073B8;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100009E78;
  v5[3] = &unk_100415940;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011D54;
  block[3] = &unk_100416870;
  id v6 = v4;
  id v9 = v6;
  v10 = self;
  id v11 = &v12;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  if (*((unsigned char *)v13 + 24)) {
    [(MRDMediaRemoteServer *)self restoreClientDeviceInfo:v6];
  }
  [(MRDMediaRemoteServer *)self reevaluateClientsForActiveCriticalSection];
  v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"MRDMediaRemoteClientDidConnect" object:v6];

  _Block_object_dispose(&v12, 8);
}

- (void)_clientDidOpenConnection:(id)a3
{
  id v4 = (_xpc_connection_s *)a3;
  pid_t pid = xpc_connection_get_pid(v4);
  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = pid;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client with pid %ld opened connection.", (uint8_t *)&v8, 0xCu);
  }

  v7 = [[MRDMediaRemoteClient alloc] initWithConnection:v4];
  [(MRDMediaRemoteClient *)v7 setMessageHandler:self];
  [(MRDMediaRemoteServer *)self addClient:v7];
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_MESSAGE_ID_KEY");
  switch(HIBYTE(uint64))
  {
    case 1u:
      [(MRDMediaRemoteServer *)self _handleServerXPCMessage:v6 fromClient:v7];
      break;
    case 2u:
      nowPlayingServer = self->_nowPlayingServer;
      goto LABEL_14;
    case 3u:
      nowPlayingServer = self->_routingServer;
      goto LABEL_14;
    case 4u:
      nowPlayingServer = self->_remoteControlServer;
      goto LABEL_14;
    case 5u:
      nowPlayingServer = self->_browsableContentServer;
      goto LABEL_14;
    case 6u:
      nowPlayingServer = self->_externalDeviceServer;
      goto LABEL_14;
    case 9u:
      nowPlayingServer = self->_virtualAudioInputServer;
      goto LABEL_14;
    case 0xBu:
      nowPlayingServer = self->_uiServer;
      goto LABEL_14;
    case 0xCu:
      nowPlayingServer = self->_groupSessionServer;
LABEL_14:
      [nowPlayingServer handleXPCMessage:v6 fromClient:v7];
      break;
    default:
      id v11 = _MRLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        uint64_t v13 = uint64;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "XPC message with id %lu not handled.", (uint8_t *)&v12, 0xCu);
      }

      break;
  }
}

- (void)reevaluateClientsForActiveCriticalSection
{
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000141B0;
  block[3] = &unk_100415CF0;
  void block[4] = self;
  block[5] = &v14;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  [(MRDMediaRemoteServer *)self allClients];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isMediaRemoteDaemon", (void)v9) & 1) == 0)
        {
          if (*((unsigned char *)v15 + 24)) {
            [v8 pauseNotifications];
          }
          else {
            [v8 resumeNotifications];
          }
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v18 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v14, 8);
}

+ (MRDMediaRemoteServer)server
{
  if (qword_10047E1B8 != -1) {
    dispatch_once(&qword_10047E1B8, &stru_10041CCF0);
  }
  v2 = (void *)qword_10047E1B0;

  return (MRDMediaRemoteServer *)v2;
}

- (MRDMediaRemoteServer)init
{
  return 0;
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)MRDMediaRemoteServer;
  v2 = [(MRDMediaRemoteServer *)&v11 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mediaremoted.serialQueue", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activeClients = v2->_activeClients;
    v2->_activeClients = v6;

    int v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    startHandlers = v2->_startHandlers;
    v2->_startHandlers = v8;
  }
  return v2;
}

- (void)initializeServer
{
  id v3 = dispatch_get_global_queue(2, 0);
  dispatch_queue_t v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v3);
  termSigHandler = self->_termSigHandler;
  self->_termSigHandler = v4;

  uint64_t v6 = self->_termSigHandler;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100106B00;
  handler[3] = &unk_100415CC8;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  dispatch_resume((dispatch_object_t)self->_termSigHandler);
  id v7 = +[MRDUIServer sharedServer];
  uiServer = self->_uiServer;
  self->_uiServer = v7;

  [(MRDUIServer *)self->_uiServer start];
  int out_token = 0;
  uint32_t v9 = notify_register_dispatch("AppleLanguagePreferencesChangedNotification", &out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_10041CD30);
  if (v9)
  {
    int v10 = v9;
    objc_super v11 = _MRLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10032EF4C(v10, v11);
    }
  }
  +[MRAVConcreteOutputContext setOutputContextForLocalDeviceDataSource:&stru_10041CD70];
  long long v12 = objc_alloc_init(MRDAVRoutingDataSource);
  localRoutingDataSource = self->_localRoutingDataSource;
  self->_localRoutingDataSource = v12;

  uint64_t v14 = [[MRDVolumeController alloc] initWithRoutingDataSource:self->_localRoutingDataSource];
  volumeController = self->_volumeController;
  self->_volumeController = v14;

  uint64_t v16 = objc_alloc_init(MRDNowPlayingServer);
  nowPlayingServer = self->_nowPlayingServer;
  self->_nowPlayingServer = v16;

  v18 = objc_alloc_init(MRDRemoteControlServer);
  remoteControlServer = self->_remoteControlServer;
  self->_remoteControlServer = v18;

  v20 = objc_alloc_init(MRDBrowsableContentServer);
  browsableContentServer = self->_browsableContentServer;
  self->_browsableContentServer = v20;

  v22 = objc_alloc_init(MRDVirtualAudioInputServer);
  virtualAudioInputServer = self->_virtualAudioInputServer;
  self->_virtualAudioInputServer = v22;

  [(MRDVirtualAudioInputServer *)self->_virtualAudioInputServer setDelegate:self];
  v24 = objc_alloc_init(MRDTransactionServer);
  transactionServer = self->_transactionServer;
  self->_transactionServer = v24;

  v26 = objc_alloc_init(MRDBackgroundTasks);
  tasks = self->_tasks;
  self->_tasks = v26;

  v28 = [[MRDAVRoutingServer alloc] initWithRoutingDataSource:self->_localRoutingDataSource];
  routingServer = self->_routingServer;
  self->_routingServer = v28;

  v30 = [[MRDExternalDeviceRemoteServer alloc] initWithRoutingDataSource:self->_localRoutingDataSource];
  externalDeviceServer = self->_externalDeviceServer;
  self->_externalDeviceServer = v30;

  v32 = +[MRSharedSettings currentSettings];
  unsigned int v33 = [v32 supportGroupSession];

  if (v33)
  {
    v34 = [[MRDGroupSessionServer alloc] initWithNowPlayingServer:self->_nowPlayingServer];
    groupSessionServer = self->_groupSessionServer;
    self->_groupSessionServer = v34;
  }
  v36 = objc_alloc_init(MRDMediaControlIPCServer);
  mediaControlServer = self->_mediaControlServer;
  self->_mediaControlServer = v36;

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100106C50;
  v41[3] = &unk_100415DC8;
  v41[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, v41);

  v38 = +[NSNotificationCenter defaultCenter];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100107048;
  v40[3] = &unk_100418568;
  v40[4] = self;
  id v39 = [v38 addObserverForName:@"MRDMediaRemoteClientDidInvalidate" object:0 queue:0 usingBlock:v40];

  [(MRDMediaRemoteServer *)self _restoreNowPlayingClientState];
}

- (void)dealloc
{
  [(MRDVirtualAudioInputServer *)self->_virtualAudioInputServer setDelegate:0];
  [(MRDMediaRemoteServer *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)MRDMediaRemoteServer;
  [(MRDMediaRemoteServer *)&v3 dealloc];
}

- (void)start
{
  if (!self->_listenerConnection)
  {
    objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaremoted.connection", v3);
    connectionQueue = self->_connectionQueue;
    self->_connectionQueue = v4;

    mach_service = xpc_connection_create_mach_service("com.apple.mediaremoted.xpc", (dispatch_queue_t)self->_connectionQueue, 1uLL);
    listenerConnection = self->_listenerConnection;
    self->_listenerConnection = mach_service;

    int v8 = self->_listenerConnection;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000728C;
    handler[3] = &unk_100415DC8;
    handler[4] = self;
    xpc_connection_set_event_handler(v8, handler);
    xpc_connection_resume(self->_listenerConnection);
  }
  mediaControlServer = self->_mediaControlServer;
  if (mediaControlServer) {
    [(MRDMediaControlIPCServer *)mediaControlServer start];
  }
  externalDeviceServer = self->_externalDeviceServer;
  if (externalDeviceServer) {
    [(MRDExternalDeviceRemoteServer *)externalDeviceServer start];
  }
  notify_post(kMRMediaRemoteServiceDidResetDistributedNotification);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_1001073A8;
  v25 = sub_1001073B8;
  id v26 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001073C0;
  block[3] = &unk_100415CF0;
  void block[4] = self;
  block[5] = &v21;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = (id)v22[5];
  id v13 = [v12 countByEnumeratingWithState:&v16 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      char v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * (void)v15) + 16))(*(void *)(*((void *)&v16 + 1) + 8 * (void)v15));
        char v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v16 objects:v28 count:16];
    }
    while (v13);
  }

  MRGetSharedService();
  _Block_object_dispose(&v21, 8);
}

- (void)stop
{
  if (self->_listenerConnection)
  {
    objc_super v3 = _MRLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping MediaRemote server", v7, 2u);
    }

    xpc_connection_cancel(self->_listenerConnection);
    listenerConnection = self->_listenerConnection;
    self->_listenerConnection = 0;
  }
  connectionQueue = self->_connectionQueue;
  if (connectionQueue)
  {
    self->_connectionQueue = 0;
  }
  externalDeviceServer = self->_externalDeviceServer;
  if (externalDeviceServer) {
    [(MRDExternalDeviceRemoteServer *)externalDeviceServer stop];
  }
}

- (void)removeClientForPID:(int)a3
{
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100107540;
  v5[3] = &unk_1004176D0;
  int v6 = a3;
  v5[4] = self;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  [(MRDMediaRemoteServer *)self reevaluateClientsForActiveCriticalSection];
}

- (id)clientForPID:(int)a3
{
  uint64_t v8 = 0;
  uint32_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  objc_super v11 = sub_1001073A8;
  id v12 = sub_1001073B8;
  id v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100107834;
  block[3] = &unk_100417748;
  void block[4] = self;
  block[5] = &v8;
  int v7 = a3;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)clientForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = sub_1001073A8;
  long long v16 = sub_1001073B8;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001079C4;
  block[3] = &unk_100416870;
  void block[4] = self;
  id v10 = v4;
  objc_super v11 = &v12;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)clientWithRegisteredCustomOrigin:(id)a3
{
  id v4 = [(MRDNowPlayingServer *)self->_nowPlayingServer originClientForOrigin:a3];
  if (v4)
  {
    id v5 = [(MRDMediaRemoteServer *)self daemonClient];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)mostRecentCanBeNowPlayingClient
{
  v2 = +[NSDate distantFuture];
  objc_super v3 = +[MRDMediaRemoteServer server];
  id v4 = [v3 nowPlayingServer];

  id v5 = +[MROrigin localOrigin];
  v24 = v4;
  id v6 = [v4 originClientForOrigin:v5];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v23 = v6;
  id obj = [v6 nowPlayingClients];
  id v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  id v7 = 0;
  if (v28)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v8;
        uint32_t v9 = *(void **)(*((void *)&v34 + 1) + 8 * v8);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v10 = [v9 playerClients];
        id v11 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v31;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v31 != v13) {
                objc_enumerationMutation(v10);
              }
              char v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              long long v16 = [v15 canBeNowPlayingPlayerTimestamp];
              id v17 = [v2 compare:v16];

              if (v17 == (id)1)
              {
                uint64_t v18 = [v15 canBeNowPlayingPlayerTimestamp];

                id v19 = v9;
                id v7 = v19;
                v2 = (void *)v18;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v29 + 1;
      }
      while ((id)(v29 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v28);
  }

  v20 = [v7 client];
  uint64_t v21 = -[MRDMediaRemoteServer clientForPID:](self, "clientForPID:", [v20 processIdentifier]);

  return v21;
}

- (id)mostRecentPlayingClient
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(MRDMediaRemoteServer *)self canBeNowPlayingClients];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint32_t v9 = [(MRDNowPlayingServer *)self->_nowPlayingServer localPlayersForXpcClient:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        [v3 addObjectsFromArray:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  id v10 = [v3 sortedArrayUsingComparator:&stru_10041CDB8];
  id v11 = [v10 lastObject];

  nowPlayingServer = self->_nowPlayingServer;
  uint64_t v13 = [v11 playerPath];
  uint64_t v14 = [(MRDNowPlayingServer *)nowPlayingServer xpcClientForPlayerPath:v13];

  return v14;
}

- (id)canBeNowPlayingClients
{
  v2 = [(MRDMediaRemoteServer *)self allClients];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint32_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "canBeNowPlaying", (void)v11)) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)clientForPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 origin];
  unsigned int v6 = [v5 isLocal];

  if (v6)
  {
    uint64_t v7 = [v4 client];

    -[MRDMediaRemoteServer clientForPID:](self, "clientForPID:", [v7 processIdentifier]);
  }
  else
  {
    uint64_t v7 = [v4 origin];

    [(MRDMediaRemoteServer *)self clientWithRegisteredCustomOrigin:v7];
  uint64_t v8 = };

  return v8;
}

- (void)addMediaRemoteSeverStartedHandler:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001082D8;
  v7[3] = &unk_100416988;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (void)postClientNotificationNamed:(id)a3
{
}

- (void)postClientNotificationNamed:(id)a3 predicate:(id)a4
{
}

- (void)postClientNotificationNamed:(id)a3 userInfo:(id)a4
{
}

- (void)postClientNotificationNamed:(id)a3 userInfo:(id)a4 predicate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace();
  if (qword_10047E1C0 != -1) {
    dispatch_once(&qword_10047E1C0, &stru_10041CDD8);
  }
  long long v11 = MRGetPlayerPathFromUserInfo();
  id v12 = [v11 copy];

  long long v13 = qword_10047E1C8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001085A8;
  block[3] = &unk_10041AB90;
  id v19 = v9;
  id v20 = v8;
  id v21 = v12;
  v22 = self;
  id v23 = v10;
  id v14 = v10;
  id v15 = v12;
  id v16 = v8;
  id v17 = v9;
  dispatch_async(v13, block);
}

- (void)restoreClientDeviceInfo:(id)a3
{
  id v4 = a3;
  nowPlayingServer = self->_nowPlayingServer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100108A2C;
  v7[3] = &unk_10041CE00;
  id v8 = v4;
  id v6 = v4;
  [(MRDNowPlayingServer *)nowPlayingServer restoreDeviceInfoToClient:v6 handler:v7];
}

- (void)restoreClientState:(id)a3 handler:(id)a4
{
  routingServer = self->_routingServer;
  id v7 = a4;
  id v8 = a3;
  [(MRDAVRoutingServer *)routingServer restoreClientState:v8 handler:v7];
  [(MRDNowPlayingServer *)self->_nowPlayingServer restoreClientState:v8 handler:v7];
  [(MRDGroupSessionServer *)self->_groupSessionServer restoreClientState:v8 handler:v7];
}

- (MRDMediaRemoteClient)localNowPlayingClient
{
  id v3 = [(MRDNowPlayingServer *)self->_nowPlayingServer localActivePlayerPath];
  id v4 = [(MRDMediaRemoteServer *)self clientForPlayerPath:v3];

  return (MRDMediaRemoteClient *)v4;
}

- (MRDMediaRemoteClient)systemMediaClient
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1001073A8;
  id v10 = sub_1001073B8;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100108D2C;
  v5[3] = &unk_100415940;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDMediaRemoteClient *)v3;
}

- (MRDMediaRemoteClient)systemPodcastClient
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1001073A8;
  id v10 = sub_1001073B8;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100108F2C;
  v5[3] = &unk_100415940;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDMediaRemoteClient *)v3;
}

- (MRDMediaRemoteClient)frontmostClient
{
  id v3 = sub_10016A3A0();
  if (v3)
  {
    id v4 = [(MRDMediaRemoteServer *)self clientForBundleIdentifier:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (MRDMediaRemoteClient *)v4;
}

- (MRDMediaRemoteClient)daemonClient
{
  uint64_t v3 = getpid();

  return (MRDMediaRemoteClient *)[(MRDMediaRemoteServer *)self clientForPID:v3];
}

- (MRDMediaRemoteClient)MRUIClient
{
  return (MRDMediaRemoteClient *)[(MRDMediaRemoteServer *)self clientForBundleIdentifier:@"com.apple.MediaRemoteUI"];
}

- (RPCompanionLinkClient)sharedCompanionLinkClient
{
  if (qword_10047E1D8 != -1) {
    dispatch_once(&qword_10047E1D8, &stru_10041CE48);
  }
  v2 = (void *)qword_10047E1D0;

  return (RPCompanionLinkClient *)v2;
}

- (MRDeviceInfo)deviceInfo
{
  v2 = [(MRDNowPlayingServer *)self->_nowPlayingServer localOriginClient];
  uint64_t v3 = [v2 deviceInfo];

  return (MRDeviceInfo *)v3;
}

- (void)_handleServerXPCMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_MESSAGE_ID_KEY");
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134218498;
    uint64_t v13 = uint64;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Received message %llu from client %@ : %@", (uint8_t *)&v12, 0x20u);
  }

  switch(uint64)
  {
    case 0x100000000000001uLL:
      [(MRDMediaRemoteServer *)self _handleSelectSourceMessage:v6 fromClient:v7];
      break;
    case 0x100000000000002uLL:
      [(MRDMediaRemoteServer *)self _handleKeepAliveMessage:v6 fromClient:v7];
      break;
    case 0x100000000000003uLL:
      [(MRDMediaRemoteServer *)self _handlePostNotificationMessage:v6 fromClient:v7];
      break;
    case 0x100000000000004uLL:
      [(MRDMediaRemoteServer *)self _handleGetSystemVolumeMessage:v6 fromClient:v7];
      break;
    case 0x100000000000005uLL:
      [(MRDMediaRemoteServer *)self _handleSetSystemVolumeMessage:v6 fromClient:v7];
      break;
    case 0x100000000000006uLL:
      [(MRDMediaRemoteServer *)self _handleAdjustSystemVolumeByStepMessage:v6 fromClient:v7];
      break;
    case 0x100000000000007uLL:
      [(MRDMediaRemoteServer *)self _handleSetSystemIsMutedMessage:v6 fromClient:v7];
      break;
    case 0x100000000000008uLL:
      [(MRDMediaRemoteServer *)self _handleGetSystemIsMutedMessage:v6 fromClient:v7];
      break;
    case 0x100000000000009uLL:
      transactionServer = self->_transactionServer;
      goto LABEL_14;
    case 0x10000000000000AuLL:
      transactionServer = self->_tasks;
LABEL_14:
      [transactionServer handleXPCMessage:v6 fromClient:v7];
      break;
    case 0x10000000000000CuLL:
      [(MRDMediaRemoteServer *)self _handlePing:v6 fromClient:v7];
      break;
    case 0x10000000000000DuLL:
      [(MRDMediaRemoteServer *)self _handleGetSupportsSystemPairingMessage:v6 fromClient:v7];
      break;
    case 0x10000000000000EuLL:
      [(MRDMediaRemoteServer *)self _handleCollectDiagnosticMessage:v6 fromClient:v7];
      break;
    case 0x10000000000000FuLL:
      [(MRDMediaRemoteServer *)self _handleCollectClientDiagnosticsMessage:v6 fromClient:v7];
      break;
    case 0x100000000000010uLL:
      [(MRDMediaRemoteServer *)self _handleWakeMediaAppMessage:v6 fromClient:v7];
      break;
    case 0x100000000000011uLL:
      [(MRDMediaRemoteServer *)self _handleWakePlayerServiceMessage:v6 fromClient:v7];
      break;
    case 0x100000000000012uLL:
      [(MRDMediaRemoteServer *)self _handleRequestBlessMessage:v6 fromClient:v7];
      break;
    case 0x100000000000013uLL:
      [(MRDMediaRemoteServer *)self _handleRegisterPairingHandlerMessage:v6 fromClient:v7];
      break;
    case 0x100000000000014uLL:
      [(MRDMediaRemoteServer *)self _handleUnregisterPairingHandler:v6 fromClient:v7];
      break;
    case 0x100000000000015uLL:
      [(MRDMediaRemoteServer *)self _handleCompletePairingHandlerMessage:v6 fromClient:v7];
      break;
    case 0x100000000000016uLL:
      [(MRDMediaRemoteServer *)self _handleGetIsBooksAppInstalledMessage:v6 fromClient:v7];
      break;
    case 0x100000000000017uLL:
      [(MRDMediaRemoteServer *)self _handleGetIsMusicAppInstalledMessage:v6 fromClient:v7];
      break;
    case 0x100000000000019uLL:
      [(MRDMediaRemoteServer *)self _handleSuspendDisconnectionPauseMessage:v6 fromClient:v7];
      break;
    case 0x10000000000001AuLL:
      [(MRDMediaRemoteServer *)self _handleAdjustSystemVolumeMessage:v6 fromClient:v7];
      break;
    case 0x10000000000001BuLL:
      [(MRDMediaRemoteServer *)self _handleCriticalSectionTransition:v6 fromClient:v7];
      break;
    default:
      id v11 = _MRLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        uint64_t v13 = uint64;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Server message with id %llu not handled.", (uint8_t *)&v12, 0xCu);
      }

      break;
  }
}

- (void)_collectDiagnosticFromClient:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = MRCreateXPCMessage();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100109884;
  v9[3] = &unk_10041CEB0;
  id v10 = v5;
  id v8 = v5;
  [v6 relayXPCMessage:v7 andReply:1 resultCallback:v9];
}

- (void)_handleSelectSourceMessage:(id)a3 fromClient:(id)a4
{
  string = xpc_dictionary_get_string(a3, "MRXPC_SOURCE_ID_KEY");
  if (string)
  {
    id v9 = +[NSString stringWithUTF8String:string];
    [(MRDAVRoutingServer *)self->_routingServer pickCachedRouteWithUID:"pickCachedRouteWithUID:"];
  }
  else
  {
    id v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138412290;
      id v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NULL source ID string sent to %@", buf, 0xCu);
    }
  }
}

- (void)_handleKeepAliveMessage:(id)a3 fromClient:(id)a4
{
}

- (void)_handleGetSystemVolumeMessage:(id)a3 fromClient:(id)a4
{
  id v9 = a3;
  id v4 = +[MRDMediaRemoteServer server];
  id v5 = [v4 nowPlayingServer];
  id v6 = [v5 localOriginClient];
  [v6 volume];
  float v8 = v7;

  sub_10001432C(v9, (uint64_t)"MRXPC_VOLUME_VALUE_KEY", 4, COERCE__INT64(v8), 0);
}

- (void)_handleSetSystemVolumeMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float v8 = xpc_dictionary_get_double(v6, "MRXPC_VOLUME_VALUE_KEY");
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 displayName];
    *(_DWORD *)buf = 138543618;
    long long v18 = v10;
    __int16 v19 = 2048;
    double v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client: %{public}@ Set system volume: setting volume to %f", buf, 0x16u);
  }
  volumeController = self->_volumeController;
  id v16 = 0;
  *(float *)&double v12 = v8;
  [(MRDVolumeController *)volumeController setVolume:&v16 error:v12];
  id v13 = v16;
  __int16 v14 = v13;
  if (v13) {
    unsigned int v15 = [v13 code];
  }
  else {
    unsigned int v15 = 0;
  }
  sub_1001679D8(v6, v15);
}

- (void)_handleAdjustSystemVolumeByStepMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float v8 = xpc_dictionary_get_double(v6, "MRXPC_VOLUME_VALUE_KEY");
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 displayName];
    *(_DWORD *)buf = 138543618;
    long long v18 = v10;
    __int16 v19 = 2048;
    double v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client: %{public}@ Adjust system volume: stepping volume by %f", buf, 0x16u);
  }
  volumeController = self->_volumeController;
  id v16 = 0;
  *(float *)&double v12 = v8;
  [(MRDVolumeController *)volumeController adjustVolumeWithStepAmount:&v16 error:v12];
  id v13 = v16;
  __int16 v14 = v13;
  if (v13) {
    unsigned int v15 = [v13 code];
  }
  else {
    unsigned int v15 = 0;
  }
  sub_1001679D8(v6, v15);
}

- (void)_handleSetSystemIsMutedMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = MRCreateProtobufFromXPCMessage();
  id v7 = [v6 isMuted];
  volumeController = self->_volumeController;
  id v12 = 0;
  [(MRDVolumeController *)volumeController setIsMuted:v7 error:&v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100109E58;
  v10[3] = &unk_100415DC8;
  id v11 = v12;
  id v9 = v11;
  sub_100014324(v5, v10);
}

- (void)_handleGetSystemIsMutedMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = +[MRDMediaRemoteServer server];
  id v6 = [v5 nowPlayingServer];
  id v7 = [v6 localOriginClient];
  unsigned __int8 v8 = [v7 isMuted];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100109F40;
  v9[3] = &unk_10041CED0;
  unsigned __int8 v10 = v8;
  sub_100014324(v4, v9);
}

- (void)_handleAdjustSystemVolumeMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = MRCreateProtobufFromXPCMessage();
  volumeController = self->_volumeController;
  id v11 = 0;
  -[MRDVolumeController adjustVolume:error:](volumeController, "adjustVolume:error:", [v6 adjustment], &v11);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10010A090;
  v9[3] = &unk_100415DC8;
  id v10 = v11;
  id v8 = v10;
  sub_100014324(v5, v9);
}

- (void)_handleGetIsBooksAppInstalledMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (id)MRMediaRemoteCopyLocalDeviceSystemBooksApplicationDisplayID();
  sub_10001432C(v5, (uint64_t)"MRXPC_APP_INSTALLED_KEY", 2, [(MRDMediaRemoteServer *)self _isMediaAppInstalled:v6], 0);
}

- (void)_handleGetIsMusicAppInstalledMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (id)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  sub_10001432C(v5, (uint64_t)"MRXPC_APP_INSTALLED_KEY", 2, [(MRDMediaRemoteServer *)self _isMediaAppInstalled:v6], 0);
}

- (BOOL)_isMediaAppInstalled:(id)a3
{
  if (a3)
  {
    uint64_t v3 = +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:");
    id v4 = [v3 appState];
    unsigned __int8 v5 = [v4 isValid];

    return v5;
  }
  else
  {
    id v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10032F228();
    }

    return 0;
  }
}

- (void)_handleWakeMediaAppMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10010A35C;
  v15[3] = &unk_10041CEF8;
  id v16 = v5;
  id v7 = v5;
  id v8 = objc_retainBlock(v15);
  id v9 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10010A378;
  v12[3] = &unk_10041CF20;
  id v13 = v6;
  id v14 = v8;
  id v10 = v6;
  id v11 = v8;
  sub_100168898(v9, &__NSDictionary0__struct, v12, 5.0);
}

- (void)_handleWakePlayerServiceMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MRDMediaRemoteServer server];
  long long v35 = [v7 nowPlayingServer];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10010A878;
  v46[3] = &unk_10041CEF8;
  id v30 = v5;
  id v47 = v30;
  uint64_t v29 = objc_retainBlock(v46);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v31 = v7;
  id obj = [v7 allClients];
  id v34 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v43;
    while (2)
    {
      id v8 = 0;
      do
      {
        if (*(void *)v43 != v33) {
          objc_enumerationMutation(obj);
        }
        long long v37 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v8);
        id v9 = objc_msgSend(v35, "localPlayersForXpcClient:");
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v10 = v9;
        id v11 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v39;
          long long v36 = v8;
LABEL_8:
          id v14 = 0;
          while (1)
          {
            if (*(void *)v39 != v13) {
              objc_enumerationMutation(v10);
            }
            unsigned int v15 = [*(id *)(*((void *)&v38 + 1) + 8 * (void)v14) playerPath];
            id v16 = [v15 client];
            id v17 = [v16 parentApplicationBundleIdentifier];
            long long v18 = v6;
            __int16 v19 = [v6 bundleIdentifier];
            id v20 = v17;
            id v21 = v19;
            if (v20 == v21) {
              break;
            }
            v22 = v21;
            unsigned __int8 v23 = [v20 isEqual:v21];

            if (v23) {
              goto LABEL_17;
            }
            id v14 = (char *)v14 + 1;
            id v6 = v18;
            if (v12 == v14)
            {
              id v12 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
              id v8 = v36;
              if (v12) {
                goto LABEL_8;
              }
              goto LABEL_15;
            }
          }

LABEL_17:
          id v24 = v37;

          id v6 = v18;
          id v8 = v36;
          if (!v24) {
            goto LABEL_18;
          }

          uint64_t v27 = [v18 bundleIdentifier];
          id v28 = +[NSString stringWithFormat:@"Player Service Wake - %@", v27];
          id v26 = v29;
          ((void (*)(void *, id))v29[2])(v29, [v24 takeAssertionAndBlessForReason:v28]);

          goto LABEL_24;
        }
LABEL_15:

LABEL_18:
        id v8 = (char *)v8 + 1;
      }
      while (v8 != v34);
      id v34 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (v34) {
        continue;
      }
      break;
    }
  }

  v25 = _MRLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_10032F25C();
  }

  id v26 = v29;
  ((void (*)(void *, void))v29[2])(v29, 0);
LABEL_24:
}

- (void)_handlePing:(id)a3 fromClient:(id)a4
{
}

- (void)_handleRequestBlessMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v6 entitlements] & 0x10) != 0)
  {
    id v8 = [v6 bundleIdentifier];
    id v9 = +[NSString stringWithFormat:@"Bless Request - %@", v8];

    id v10 = [MRDTaskAssertion alloc];
    id v11 = [v6 pid];
    id v12 = [v6 bundleIdentifier];
    uint64_t v13 = [(MRDTaskAssertion *)v10 initWithType:4 pid:v11 bundleID:v12 name:v9];

    if ([(MRDTaskAssertion *)v13 invalidateInDuration:10.0])
    {
      id v14 = [v6 bundleIdentifier];
      LODWORD(v7) = sub_100169F18(v14);
      if ((v7 & 1) == 0)
      {
        unsigned int v15 = _MRLogForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10032F308();
        }
      }
    }
    else
    {
      id v14 = _MRLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10032F33C();
      }
      LODWORD(v7) = 0;
    }
    uint64_t v7 = v7;
  }
  else
  {
    uint64_t v7 = 0;
  }
  sub_10001432C(v5, (uint64_t)"MRXPC_BOOL_RESULT_KEY", 2, v7, 0);
}

- (void)_handleGetSupportsSystemPairingMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10010AAD4;
  v6[3] = &unk_10041CED0;
  BOOL v7 = ([a4 entitlements] & 4) != 0;
  sub_100014324(v5, v6);
}

- (void)_handleCollectDiagnosticMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MRDDiagnostic);
  BOOL v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = dispatch_queue_create("com.apple.mediaremote.MRDMediaRemoteServer-diagnostic", v7);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010ABEC;
  block[3] = &unk_1004159B8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_handleCollectClientDiagnosticsMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10010B2CC;
  v6[3] = &unk_10041CF70;
  id v7 = a3;
  id v5 = v7;
  [(MRDMediaRemoteServer *)self _handleCollectClientDiagnosticsMessageWithCompletion:v6];
}

- (void)_handleCollectClientDiagnosticsMessageWithCompletion:(id)a3
{
  id v25 = a3;
  id v4 = dispatch_group_create();
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaremote.MRDMediaRemoteServer", v5);

  id v7 = objc_alloc_init((Class)NSMutableArray);
  [(MRDMediaRemoteServer *)self allClients];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v42;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v11);
        dispatch_group_enter(v4);
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_10010B710;
        v36[3] = &unk_10041CF98;
        long long v37 = v6;
        uint64_t v38 = v12;
        id v39 = v7;
        long long v40 = v4;
        [(MRDMediaRemoteServer *)self _collectDiagnosticFromClient:v12 completion:v36];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v9);
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10010B890;
  v32[3] = &unk_1004161E0;
  dispatch_queue_t v33 = v6;
  id v34 = v7;
  id v35 = v25;
  id v13 = v25;
  id v14 = v7;
  unsigned int v15 = v6;
  id v16 = objc_retainBlock(v32);
  id v17 = objc_alloc((Class)MRBlockGuard);
  long long v18 = +[MRUserSettings currentSettings];
  [v18 broadcastCommandWaitDuration];
  double v20 = v19;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10010BAAC;
  v30[3] = &unk_100415FA8;
  id v21 = v16;
  id v31 = v21;
  id v22 = [v17 initWithTimeout:@"clientDiagnose" reason:v30 handler:v20];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010BABC;
  block[3] = &unk_100416988;
  id v28 = v22;
  id v29 = v21;
  unsigned __int8 v23 = v21;
  id v24 = v22;
  dispatch_group_notify(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handleRegisterPairingHandlerMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = MRCreateStringFromXPCMessage();
  if (v7)
  {
    id v8 = +[MRDMediaRemoteServer server];
    id v9 = [v8 routingServer];
    uint64_t v10 = [v9 routingDataSource];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10010BCC4;
    v13[3] = &unk_10041BDE8;
    id v14 = v7;
    id v15 = v5;
    [v10 addAuthorizationCallbackForRouteID:v14 requestCallback:v13];

    unsigned int v11 = 0;
    uint64_t v12 = v14;
  }
  else
  {
    uint64_t v12 = _MRLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Pairing Handler register failed for routeUID: %{public}@", buf, 0xCu);
    }
    unsigned int v11 = 2;
  }

  sub_1001679D8(v6, v11);
}

- (void)_handleUnregisterPairingHandler:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = MRCreateStringFromXPCMessage();
  id v6 = _MRLogForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v11 = 138412290;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pairing Handler unregister fro routeUID: %@", (uint8_t *)&v11, 0xCu);
    }

    id v6 = +[MRDMediaRemoteServer server];
    id v8 = [v6 routingServer];
    id v9 = [v8 routingDataSource];
    [v9 removeAuthorizationCallbackForRouteID:v5];

    unsigned int v10 = 0;
  }
  else
  {
    if (v7)
    {
      int v11 = 138412290;
      uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pairing Handler unregister failed for routeUID: %@", (uint8_t *)&v11, 0xCu);
    }
    unsigned int v10 = 2;
  }

  sub_1001679D8(v4, v10);
}

- (void)_handleCompletePairingHandlerMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = MRCreateStringFromXPCMessage();
  id v8 = MRCreateStringFromXPCMessage();
  id v9 = _MRLogForCategory();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Pairing handler complete attempt for routeUID: %@", (uint8_t *)&v12, 0xCu);
    }

    id v9 = [v6 pairingHandler];
    [v9 performHandlerForRouteUID:v7 passcode:v8];
    unsigned int v11 = 0;
  }
  else
  {
    if (v10)
    {
      int v12 = 138412290;
      id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Pairing Handler complete failed for routeUID: %@", (uint8_t *)&v12, 0xCu);
    }
    unsigned int v11 = 2;
  }

  sub_1001679D8(v5, v11);
}

- (void)_handleCriticalSectionTransition:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 entitlements] & 0x4000) != 0)
  {
    int64_t int64 = xpc_dictionary_get_int64(v6, "MRXPC_CRITICAL_SECTION_TRANSITION_KEY");
    string = xpc_dictionary_get_string(v6, "MRXPC_CRITICAL_SECTION_IDENTIFIER_KEY");
    if (string)
    {
      unsigned int v11 = string;
      id v12 = objc_alloc((Class)NSUUID);
      id v13 = +[NSString stringWithUTF8String:v11];
      id v14 = [v12 initWithUUIDString:v13];

      if (int64 == 1)
      {
        [v7 invalidateCriticalSectionAssertionForRequestID:v14];
      }
      else if (!int64)
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10010C328;
        v16[3] = &unk_100415CC8;
        v16[4] = self;
        [v7 takeCriticalSectionAssertionForRequestID:v14 completion:v16];
      }
      [(MRDMediaRemoteServer *)self reevaluateClientsForActiveCriticalSection];
      sub_10001432C(v6, (uint64_t)"MRXPC_BOOL_RESULT_KEY", 2, 1, 0);
    }
    else
    {
      id v15 = _MRLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10032F3A4();
      }
    }
  }
  else
  {
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10032F370();
    }

    sub_10001432C(v6, (uint64_t)"MRXPC_BOOL_RESULT_KEY", 2, 0, 0);
  }
}

- (void)virtualAudioInputServer:(id)a3 didUpdateRecordingState:(unsigned int)a4 forDevice:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v10[0] = kMRVirtualVoiceInputDeviceIDUserInfoKey;
  id v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(a5, "deviceID", a3));
  v11[0] = v7;
  v10[1] = kMRVirtualVoiceInputRecordingStateUserInfoKey;
  id v8 = +[NSNumber numberWithUnsignedInt:v5];
  v11[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  [(MRDMediaRemoteServer *)self postClientNotificationNamed:kMRVirtualVoiceInputRecordingStateDidChangeNotification userInfo:v9];
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  unsigned int v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10010C5F4;
  id v14 = &unk_1004158D8;
  id v15 = v4;
  id v16 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, &v11);
  id v7 = [(MRDMediaRemoteServer *)self localNowPlayingClient];
  [v6 setLocalNowPlayingClient:v7];

  id v8 = [(MRDMediaRemoteServer *)self systemMediaClient];
  [v6 setSystemMediaClient:v8];

  id v9 = [(MRDMediaRemoteServer *)self frontmostClient];
  [v6 setFrontmostClient:v9];

  BOOL v10 = [(MRDMediaRemoteServer *)self daemonClient];
  [v6 setDaemonClient:v10];

  [v6 setVolumeController:self->_volumeController];
}

- (void)_postAppActivityNotificationNamed:(id)a3 withActivity:(id)a4
{
  id v5 = a3;
  ExternalRepresentation = (void *)_MRApplicationActivityCreateExternalRepresentation();
  uint64_t v8 = kMRApplicationActivityUserInfoDataKey;
  id v9 = ExternalRepresentation;
  id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [(MRDMediaRemoteServer *)self postClientNotificationNamed:v5 userInfo:v7];
}

- (BOOL)_internalMediaRemoteNotificationIsLegal:(id)a3
{
  uint64_t v3 = qword_10047E1E8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10047E1E8, &stru_10041D038);
  }
  unsigned __int8 v5 = [(id)qword_10047E1E0 containsObject:v4];

  return v5;
}

- (void)_removeClient:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pid];
  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client %{public}@ invalidated.", (uint8_t *)&v10, 0xCu);
  }

  [(MRDRemoteControlServer *)self->_remoteControlServer clearContextsForClient:v4];
  [(MRDVirtualAudioInputServer *)self->_virtualAudioInputServer clearRegisteredDevicesForClient:v4];
  [(MRDVirtualAudioInputServer *)self->_virtualAudioInputServer clearRecordingEndpointsForClient:v4];
  [(MRDExternalDeviceRemoteServer *)self->_externalDeviceServer clearEndpointForClient:v4];
  id v7 = [(MRDAVRoutingServer *)self->_routingServer hostedRoutingService];
  uint64_t v8 = [v7 hostedRoutingController];
  [v8 removeVirtualOutputDevicesForClient:v4];

  [(MRDNowPlayingServer *)self->_nowPlayingServer clearNowPlayingClientForXPCClient:v4];
  [(MRDMediaRemoteServer *)self removeClientForPID:v5];
  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:@"MRDMediaRemoteServerClientInvalidatedNotification" object:v4 userInfo:0];
}

- (void)_sendMediaRemoteCommand:(unsigned int)a3 withOrigin:(id)a4
{
}

- (void)_validateAuditTokens:(id)a3 pids:(id)a4 auditTokens:(id)a5
{
  id v7 = a3;
  id v22 = a4;
  id v21 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v7;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        memset(&v26, 0, sizeof(v26));
        [v12 getBytes:&v26 length:32];
        audit_token_t atoken = v26;
        uint64_t v13 = audit_token_to_pid(&atoken);
        audit_token_t atoken = v26;
        int v14 = audit_token_to_pidversion(&atoken);
        id v15 = +[NSNumber numberWithInt:v13];
        uint64_t v25 = 0;
        id v16 = +[RBSProcessHandle handleForIdentifier:v15 error:&v25];

        if (!v16)
        {
          long long v18 = _MRLogForCategory();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_14;
          }
          atoken.val[0] = 67109120;
          atoken.val[1] = v13;
          double v19 = v18;
          double v20 = "No process for pid %d";
          goto LABEL_13;
        }
        [v16 auditToken];
        if (audit_token_to_pidversion(&v24) == v14)
        {
          uint64_t v17 = +[NSNumber numberWithInt:v13];
          [v22 addObject:v17];

          audit_token_t atoken = v26;
          long long v18 = +[NSData dataWithBytes:&atoken length:32];
          [v21 addObject:v18];
          goto LABEL_14;
        }
        long long v18 = _MRLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          atoken.val[0] = 67109120;
          atoken.val[1] = v13;
          double v19 = v18;
          double v20 = "Pidversion out of date for %d";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&atoken, 8u);
        }
LABEL_14:
      }
      id v9 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }
}

- (BOOL)isFirstLaunchAfterBoot
{
  if (qword_10047E1F0 != -1) {
    dispatch_once(&qword_10047E1F0, &stru_10041D058);
  }
  return byte_1004770F0;
}

- (void)_restoreNowPlayingClientState
{
  if ([(MRDMediaRemoteServer *)self isFirstLaunchAfterBoot])
  {
    uint64_t v3 = _MRLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting client and expected pids", buf, 2u);
    }

    id v4 = +[MRUserSettings currentSettings];
    [v4 setExpectedClientAuditTokens:&__NSArray0__struct];

    id v5 = +[MRUserSettings currentSettings];
    [v5 setConnectedClientAuditTokens:&__NSArray0__struct];
  }
  else
  {
    id v6 = +[MRUserSettings currentSettings];
    id v7 = [v6 connectedClientAuditTokens];
    id v5 = [v7 copy];

    id v8 = +[MRUserSettings currentSettings];
    id v9 = [v8 expectedClientAuditTokens];
    id v10 = [v9 copy];

    id v11 = +[NSMutableArray array];
    uint64_t v12 = +[NSMutableArray array];
    uint64_t v13 = +[NSMutableArray array];
    [(MRDMediaRemoteServer *)self _validateAuditTokens:v5 pids:v12 auditTokens:v11];
    [(MRDMediaRemoteServer *)self _validateAuditTokens:v10 pids:v13 auditTokens:v11];
    id v14 = [objc_alloc((Class)NSMutableSet) initWithArray:v12];
    [v14 addObjectsFromArray:v13];
    id v15 = +[MRUserSettings currentSettings];
    [v15 setExpectedClientAuditTokens:v11];

    id v16 = +[MRUserSettings currentSettings];
    [v16 setConnectedClientAuditTokens:&__NSArray0__struct];

    uint64_t v17 = _MRLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      audit_token_t v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Restoring client pids %{public}@", buf, 0xCu);
    }

    long long v18 = _MRLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      audit_token_t v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Restoring expected client pids %{public}@", buf, 0xCu);
    }

    double v19 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010D31C;
    block[3] = &unk_1004158D8;
    id v23 = v14;
    audit_token_t v24 = self;
    id v20 = v14;
    dispatch_async(v19, block);
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10010D4A4;
  v21[3] = &unk_100415CC8;
  v21[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v21);
}

- (void)_terminationHandler
{
  v2 = _MRLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SIGTERM received, preparing to shut down", v3, 2u);
  }

  xpc_transaction_exit_clean();
  MRInvalidateTransactions();
}

- (NSArray)availableOrigins
{
  return self->_availableOrigins;
}

- (MRDNowPlayingServer)nowPlayingServer
{
  return self->_nowPlayingServer;
}

- (MRDRemoteControlServer)remoteControlServer
{
  return self->_remoteControlServer;
}

- (MRDAVRoutingServer)routingServer
{
  return self->_routingServer;
}

- (MRDTransactionServer)transactionServer
{
  return self->_transactionServer;
}

- (MRDExternalDeviceRemoteServer)externalDeviceServer
{
  return self->_externalDeviceServer;
}

- (BOOL)shouldSendCommandsDuringPhoneCall
{
  return self->_shouldSendCommandsDuringPhoneCall;
}

- (MRDGroupSessionServer)groupSessionServer
{
  return self->_groupSessionServer;
}

- (MRDUIServer)uiServer
{
  return self->_uiServer;
}

- (FBSDisplayLayoutMonitor)sharedDisplayMonitor
{
  return self->_sharedDisplayMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_groupSessionServer, 0);
  objc_storeStrong((id *)&self->_availableOrigins, 0);
  objc_storeStrong((id *)&self->_startHandlers, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_termSigHandler, 0);
  objc_storeStrong((id *)&self->_activeClients, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_transactionServer, 0);
  objc_storeStrong((id *)&self->_virtualAudioInputServer, 0);
  objc_storeStrong((id *)&self->_mediaControlServer, 0);
  objc_storeStrong((id *)&self->_uiServer, 0);
  objc_storeStrong((id *)&self->_routingServer, 0);
  objc_storeStrong((id *)&self->_externalDeviceServer, 0);
  objc_storeStrong((id *)&self->_browsableContentServer, 0);
  objc_storeStrong((id *)&self->_remoteControlServer, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_nowPlayingServer, 0);
  objc_storeStrong((id *)&self->_localRoutingDataSource, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_listenerConnection, 0);
}

@end