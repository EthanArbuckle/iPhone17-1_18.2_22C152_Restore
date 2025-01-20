@interface NFMRemoteFindLocally
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IDSService)gizmoService;
- (NFMPingMyWatchCoordinator)pingMyWatchCoordinator;
- (NFMPlayCommands)playCommands;
- (NFMRemoteFindLocally)init;
- (NIDiscoveryToken)token;
- (NISession)session;
- (NSData)sharedConfigData;
- (NSMutableDictionary)localConnections;
- (NSXPCListener)localListener;
- (OS_dispatch_queue)serialQueue;
- (unsigned)_behaviorModeOverride;
- (void)_cleanUpSession;
- (void)_initializeSessionIfNeeded;
- (void)_startPhoneRangingSession;
- (void)_startRangingSession;
- (void)_tellPhoneToPlaySoundWithBehavior:(unsigned __int16)a3;
- (void)didPlaySound:(id)a3;
- (void)didPlaySoundAndFlashLED:(id)a3;
- (void)handleSendSharedConfiguration:(id)a3;
- (void)handleSharedConfigurationResponse:(id)a3;
- (void)handleStopPhoneRanging:(id)a3;
- (void)pingMyWatchCapabilityDidChange;
- (void)playNearbySoundOnPhone;
- (void)playSound:(id)a3;
- (void)playSoundAndFlash:(id)a3;
- (void)playSoundAndFlashRemotely;
- (void)playSoundRemotely;
- (void)session:(id)a3 didGenerateShareableConfigurationData:(id)a4 forObject:(id)a5;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5;
- (void)sessionSuspensionEnded:(id)a3;
- (void)sessionWasSuspended:(id)a3;
- (void)setGizmoService:(id)a3;
- (void)setLocalConnections:(id)a3;
- (void)setLocalListener:(id)a3;
- (void)setPingMyWatchCoordinator:(id)a3;
- (void)setPlayCommands:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setSharedConfigData:(id)a3;
- (void)setToken:(id)a3;
- (void)startRangingOnPhone;
- (void)stopRangingOnPhone;
@end

@implementation NFMRemoteFindLocally

- (NFMRemoteFindLocally)init
{
  v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v24 = 79;
    __int16 v25 = 2080;
    v26 = "-[NFMRemoteFindLocally init]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  v22.receiver = self;
  v22.super_class = (Class)NFMRemoteFindLocally;
  v4 = [(NFMRemoteFindLocally *)&v22 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("NFMRemoteFindLocally-SerialQueue", v5);
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v6;

    v8 = (NFMPlayCommands *)objc_alloc_init((Class)NFMPlayCommands);
    playCommands = v4->_playCommands;
    v4->_playCommands = v8;

    id v10 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.findmylocaldevice"];
    [v10 setProtobufAction:"playSound:" forIncomingRequestsOfType:1];
    [v10 setProtobufAction:"playSoundAndFlash:" forIncomingRequestsOfType:2];
    [v10 setProtobufAction:"didPlaySound:" forIncomingResponsesOfType:1];
    [v10 setProtobufAction:"didPlaySoundAndFlashLED:" forIncomingResponsesOfType:2];
    [v10 setProtobufAction:"handleSendSharedConfiguration:" forIncomingRequestsOfType:4];
    [v10 setProtobufAction:"handleSharedConfigurationResponse:" forIncomingResponsesOfType:4];
    [v10 setProtobufAction:"handleStopPhoneRanging:" forIncomingRequestsOfType:5];
    [v10 addDelegate:v4 queue:v4->_serialQueue];
    gizmoService = v4->_gizmoService;
    v4->_gizmoService = (IDSService *)v10;
    id v12 = v10;

    v13 = nfm_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "########### SETUP COMP-SIDE DAEMON", buf, 2u);
    }

    id v14 = objc_alloc((Class)NSXPCListener);
    v15 = (NSXPCListener *)[v14 initWithMachServiceName:NFMFindLocalDeviceServerName];
    localListener = v4->_localListener;
    v4->_localListener = v15;

    [(NSXPCListener *)v4->_localListener setDelegate:v4];
    [(NSXPCListener *)v4->_localListener resume];
    uint64_t v17 = +[NSMutableDictionary dictionary];
    localConnections = v4->_localConnections;
    v4->_localConnections = (NSMutableDictionary *)v17;

    xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_10000C3B8);
    v19 = (NFMPingMyWatchCoordinator *)objc_alloc_init((Class)NFMPingMyWatchCoordinator);
    pingMyWatchCoordinator = v4->_pingMyWatchCoordinator;
    v4->_pingMyWatchCoordinator = v19;

    [(NFMPingMyWatchCoordinator *)v4->_pingMyWatchCoordinator setDelegate:v4];
    [(NFMPingMyWatchCoordinator *)v4->_pingMyWatchCoordinator updatePingMyWatchSupportStateIfNeeded];
  }
  return v4;
}

- (void)playSoundAndFlash:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003438;
  v5[3] = &unk_10000C3E0;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)playSound:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003778;
  v5[3] = &unk_10000C3E0;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)didPlaySound:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NFMProtoDidPlaySoundResponse);
  id v6 = [v4 data];
  id v7 = [v5 initWithData:v6];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = [(NSMutableDictionary *)self->_localConnections allValues];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) remoteObjectProxy];
        objc_msgSend(v13, "playedSound:", objc_msgSend(v7, "didPlay"));

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)didPlaySoundAndFlashLED:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NFMProtoDidPlaySoundAndFlashLEDResponse);
  id v6 = [v4 data];
  id v7 = [v5 initWithData:v6];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = [(NSMutableDictionary *)self->_localConnections allValues];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) remoteObjectProxy];
        objc_msgSend(v13, "playedSoundAndLED:", objc_msgSend(v7, "didPlay"));

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)handleSendSharedConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = 278;
    __int16 v11 = 2080;
    id v12 = "-[NFMRemoteFindLocally handleSendSharedConfiguration:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v10, 0x12u);
  }

  id v6 = objc_alloc((Class)NFMProtoSendSharedConfiguration);
  id v7 = [v4 data];

  id v8 = [v6 initWithData:v7];
  id v9 = [v8 sharedConfiguration];
  [(NFMRemoteFindLocally *)self setSharedConfigData:v9];

  [(NFMRemoteFindLocally *)self _initializeSessionIfNeeded];
  [(NFMRemoteFindLocally *)self _startRangingSession];
}

- (void)handleSharedConfigurationResponse:(id)a3
{
  id v4 = a3;
  id v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109378;
    v13[1] = 287;
    __int16 v14 = 2080;
    long long v15 = "-[NFMRemoteFindLocally handleSharedConfigurationResponse:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v13, 0x12u);
  }

  id v6 = objc_alloc((Class)NFMProtoSendSharedConfiguration);
  id v7 = [v4 data];

  id v8 = [v6 initWithData:v7];
  id v9 = [v8 sharedConfiguration];
  id v10 = [(NFMRemoteFindLocally *)self session];
  __int16 v11 = [v10 findingNotifier];
  id v12 = [(NFMRemoteFindLocally *)self token];
  [v11 notifyDiscoveredNearbyObjectWithToken:v12 sharedConfigurationData:v9];
}

- (void)handleStopPhoneRanging:(id)a3
{
  id v4 = a3;
  id v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id buf = (id)0x12704000202;
    __int16 v9 = 2080;
    id v10 = "-[NFMRemoteFindLocally handleStopPhoneRanging:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)&buf, 0x12u);
  }

  [(NFMRemoteFindLocally *)self _initializeSessionIfNeeded];
  objc_initWeak(&buf, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004380;
  v6[3] = &unk_10000C430;
  v6[4] = self;
  objc_copyWeak(&v7, &buf);
  +[NFMTokenManager getTokenWithCompletionHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&buf);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nfm_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 318;
    LOWORD(v21) = 2080;
    *(void *)((char *)&v21 + 2) = "-[NFMRemoteFindLocally listener:shouldAcceptNewConnection:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "########### %d %s", buf, 0x12u);
  }

  __int16 v9 = [v7 valueForEntitlement:NFMFindLocalDeviceEntitlementName];
  objc_initWeak(&location, self);
  *(void *)id buf = 0;
  *(void *)&long long v21 = buf;
  *((void *)&v21 + 1) = 0x3032000000;
  objc_super v22 = sub_100004784;
  v23 = sub_100004794;
  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 processIdentifier]);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v9 BOOLValue])
  {
    id v10 = [(NFMRemoteFindLocally *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000479C;
    block[3] = &unk_10000C4D0;
    long long v15 = v7;
    long long v16 = self;
    objc_copyWeak(&v18, &location);
    long long v17 = buf;
    dispatch_async(v10, block);

    objc_destroyWeak(&v18);
    __int16 v11 = v15;
    BOOL v12 = 1;
  }
  else
  {
    __int16 v11 = nfm_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100007F18();
    }
    BOOL v12 = 0;
  }

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);

  return v12;
}

- (void)playSoundRemotely
{
  v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109378;
    v4[1] = 371;
    __int16 v5 = 2080;
    id v6 = "-[NFMRemoteFindLocally playSoundRemotely]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v4, 0x12u);
  }

  [(NFMRemoteFindLocally *)self _tellPhoneToPlaySoundWithBehavior:[(NFMRemoteFindLocally *)self _behaviorModeOverride]];
}

- (void)playSoundAndFlashRemotely
{
  v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109378;
    v4[1] = 378;
    __int16 v5 = 2080;
    id v6 = "-[NFMRemoteFindLocally playSoundAndFlashRemotely]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v4, 0x12u);
  }

  [(NFMRemoteFindLocally *)self _tellPhoneToPlaySoundWithBehavior:1];
}

- (void)playNearbySoundOnPhone
{
  v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109378;
    v4[1] = 385;
    __int16 v5 = 2080;
    id v6 = "-[NFMRemoteFindLocally playNearbySoundOnPhone]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v4, 0x12u);
  }

  [(NFMRemoteFindLocally *)self _tellPhoneToPlaySoundWithBehavior:3];
}

- (void)_tellPhoneToPlaySoundWithBehavior:(unsigned __int16)a3
{
  __int16 v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109378;
    int v10 = 392;
    __int16 v11 = 2080;
    BOOL v12 = "-[NFMRemoteFindLocally _tellPhoneToPlaySoundWithBehavior:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  id v6 = [(NFMRemoteFindLocally *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005150;
  v7[3] = &unk_10000C4F8;
  unsigned __int16 v8 = a3;
  v7[4] = self;
  dispatch_async(v6, v7);
}

- (unsigned)_behaviorModeOverride
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:@"behaviorMode"];

  if ((unint64_t)v3 >= 5) {
    return 0;
  }
  else {
    return (unsigned __int16)v3;
  }
}

- (void)startRangingOnPhone
{
  id v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109378;
    int v7 = 437;
    __int16 v8 = 2080;
    __int16 v9 = "-[NFMRemoteFindLocally startRangingOnPhone]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  id v4 = [(NFMRemoteFindLocally *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000053C4;
  block[3] = &unk_10000C520;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)stopRangingOnPhone
{
  id v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109378;
    int v7 = 447;
    __int16 v8 = 2080;
    __int16 v9 = "-[NFMRemoteFindLocally stopRangingOnPhone]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  id v4 = [(NFMRemoteFindLocally *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005520;
  block[3] = &unk_10000C520;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)session:(id)a3 didGenerateShareableConfigurationData:(id)a4 forObject:(id)a5
{
  id v6 = a4;
  int v7 = nfm_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109378;
    int v14 = 471;
    __int16 v15 = 2080;
    long long v16 = "-[NFMRemoteFindLocally session:didGenerateShareableConfigurationData:forObject:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  __int16 v8 = [(NFMRemoteFindLocally *)self serialQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  _DWORD v10[2] = sub_100005748;
  v10[3] = &unk_10000C3E0;
  id v11 = v6;
  BOOL v12 = self;
  id v9 = v6;
  dispatch_async(v8, v10);
}

- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5
{
  id v6 = nfm_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = 496;
    __int16 v8 = 2080;
    id v9 = "-[NFMRemoteFindLocally session:didRemoveNearbyObjects:withReason:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%d %s: Invalidating session", (uint8_t *)v7, 0x12u);
  }

  [(NFMRemoteFindLocally *)self _cleanUpSession];
}

- (void)sessionWasSuspended:(id)a3
{
  id v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109378;
    v4[1] = 502;
    __int16 v5 = 2080;
    id v6 = "-[NFMRemoteFindLocally sessionWasSuspended:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%d %s: Ignoring", (uint8_t *)v4, 0x12u);
  }
}

- (void)sessionSuspensionEnded:(id)a3
{
  id v4 = nfm_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = 507;
    __int16 v6 = 2080;
    int v7 = "-[NFMRemoteFindLocally sessionSuspensionEnded:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v5, 0x12u);
  }

  [(NFMRemoteFindLocally *)self _startRangingSession];
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  __int16 v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = 513;
    __int16 v7 = 2080;
    __int16 v8 = "-[NFMRemoteFindLocally session:didInvalidateWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%d %s: Invalidating session", (uint8_t *)v6, 0x12u);
  }

  [(NFMRemoteFindLocally *)self _cleanUpSession];
}

- (void)_startPhoneRangingSession
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005BF8;
  v3[3] = &unk_10000C430;
  v3[4] = self;
  objc_copyWeak(&v4, &location);
  +[NFMTokenManager getTokenWithCompletionHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_startRangingSession
{
}

- (void)_initializeSessionIfNeeded
{
  id v3 = [(NFMRemoteFindLocally *)self session];

  if (!v3)
  {
    id v4 = nfm_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "initializing NI session", v9, 2u);
    }

    id v5 = objc_alloc_init((Class)NISession);
    [(NFMRemoteFindLocally *)self setSession:v5];
  }
  __int16 v6 = [(NFMRemoteFindLocally *)self session];
  [v6 setDelegate:self];

  __int16 v7 = [(NFMRemoteFindLocally *)self serialQueue];
  __int16 v8 = [(NFMRemoteFindLocally *)self session];
  [v8 setDelegateQueue:v7];
}

- (void)_cleanUpSession
{
  id v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = 586;
    __int16 v6 = 2080;
    __int16 v7 = "-[NFMRemoteFindLocally _cleanUpSession]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v5, 0x12u);
  }

  id v4 = [(NFMRemoteFindLocally *)self session];
  [v4 invalidate];

  [(NFMRemoteFindLocally *)self setSession:0];
}

- (void)pingMyWatchCapabilityDidChange
{
  v2 = +[CHSControlService sharedInstance];
  [v2 reloadControlsForExtension:@"com.apple.Bridge.BridgeWidgetExtension" kind:@"com.apple.PingMyWatchControlCenterUI.swiftUI" reason:@"pingMyWatchCapabilityDidChange"];

  id v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "########### Reloaded PingMyWatch control", v4, 2u);
  }
}

- (IDSService)gizmoService
{
  return self->_gizmoService;
}

- (void)setGizmoService:(id)a3
{
}

- (NSXPCListener)localListener
{
  return self->_localListener;
}

- (void)setLocalListener:(id)a3
{
}

- (NSMutableDictionary)localConnections
{
  return self->_localConnections;
}

- (void)setLocalConnections:(id)a3
{
}

- (NFMPlayCommands)playCommands
{
  return self->_playCommands;
}

- (void)setPlayCommands:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NISession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NIDiscoveryToken)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSData)sharedConfigData
{
  return self->_sharedConfigData;
}

- (void)setSharedConfigData:(id)a3
{
}

- (NFMPingMyWatchCoordinator)pingMyWatchCoordinator
{
  return self->_pingMyWatchCoordinator;
}

- (void)setPingMyWatchCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pingMyWatchCoordinator, 0);
  objc_storeStrong((id *)&self->_sharedConfigData, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_playCommands, 0);
  objc_storeStrong((id *)&self->_localConnections, 0);
  objc_storeStrong((id *)&self->_localListener, 0);
  objc_storeStrong((id *)&self->_gizmoService, 0);
}

@end