@interface MRDGroupSessionServer
- (BOOL)isPresentingProximityCard;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)running;
- (MRDGroupSessionAssertionManager)assertionManager;
- (MRDGroupSessionEligibilityMonitor)eligibilityMonitor;
- (MRDGroupSessionManager)sessionManager;
- (MRDGroupSessionServer)initWithNowPlayingServer:(id)a3;
- (MRDNetworkMonitor)networkMonitor;
- (MRDNowPlayingServer)nowPlayingServer;
- (MRDRemoteControlGroupSessionCoordinator)coordinator;
- (MRUserIdentity)localMusicIdentity;
- (MSVTimer)requestAssertionTimer;
- (MSVTimer)stopTimer;
- (NSError)lastConnectionError;
- (NSMapTable)assertionsByClient;
- (NSMutableSet)clients;
- (NSMutableSet)requestGroupSessionCompletions;
- (NSXPCListener)listener;
- (OS_dispatch_queue)messageQueue;
- (OS_dispatch_queue)notificationQueue;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (id)clientForConnection:(id)a3;
- (os_unfair_lock_s)lock;
- (void)_completeGroupSessionRequestsWithIdentifier:(id)a3;
- (void)_handleCreateGroupSessionTokenMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetUserIdentityForDSIDMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetUserIdentityMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGroupSessionEventMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePresentProximityCardMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRequestGroupSessionMessage:(id)a3 fromClient:(id)a4;
- (void)addClient:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)dismissProximityCard;
- (void)eligibilityMonitor:(id)a3 eligibilityStatusDidChange:(id)a4;
- (void)groupSessionAssertionManagerDidAssert:(id)a3;
- (void)groupSessionAssertionManagerDidUnassert:(id)a3;
- (void)handleClientConnect:(id)a3;
- (void)handleClientInvalidate:(id)a3;
- (void)handleGetGroupSessionServerEndpointMessage:(id)a3 fromClient:(id)a4;
- (void)handleJoinGroupSessionMessage:(id)a3 fromClient:(id)a4;
- (void)handleLeaveGroupSessionMessage:(id)a3 fromClient:(id)a4;
- (void)handleUserStateChange:(id)a3;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)joinGroupSessionViaEquivalentWHAEndpoint:(id)a3 completion:(id)a4;
- (void)manager:(id)a3 activeSessionDidChange:(id)a4;
- (void)manager:(id)a3 didLeaveRemoteGroupSession:(id)a4;
- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4;
- (void)manager:(id)a3 discoveredSessionsDidChange:(id)a4;
- (void)notifyActiveSessionStateChanged;
- (void)notifyEligibilityChanged:(id)a3;
- (void)presentProximityCardWithDeviceName:(id)a3 modelIdentifier:(id)a4 color:(id)a5 url:(id)a6 error:(id *)a7;
- (void)reevaluateAssertionState;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)removeClient:(id)a3;
- (void)requestEligibilityMonitoring;
- (void)requestGroupSessionWithCompletion:(id)a3;
- (void)restoreClientState:(id)a3 handler:(id)a4;
- (void)setAssertionsByClient:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setEligibilityMonitor:(id)a3;
- (void)setLastConnectionError:(id)a3;
- (void)setLocalMusicIdentity:(id)a3;
- (void)setRemoteAlertHandle:(id)a3;
- (void)setRequestGroupSessionCompletions:(id)a3;
- (void)setSessionManager:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MRDGroupSessionServer

- (MRDGroupSessionManager)sessionManager
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_sessionManager;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)handleClientConnect:(id)a3
{
  v4 = [a3 object];
  v5 = [(MRDGroupSessionServer *)self sessionManager];
  v6 = [v5 session];

  if (sub_100009C80(v4))
  {
    if (v6) {
      id v7 = [objc_alloc((Class)MRGroupSessionInfo) initWithGroupSession:v6];
    }
    else {
      id v7 = 0;
    }
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    [v8 setObject:v7 forKeyedSubscript:MRActiveGroupSessionInfoUserInfoKey];
    v9 = _MRLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10032A350((uint64_t)v7, v4);
    }

    v10 = +[MRDMediaRemoteServer server];
    uint64_t v11 = _MRGroupSessionInfoDidChangeNotification;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000200A8;
    v22[3] = &unk_100416020;
    id v12 = v4;
    id v23 = v12;
    [v10 postClientNotificationNamed:v11 userInfo:v8 predicate:v22];

    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    v14 = [(MRDGroupSessionServer *)self eligibilityMonitor];
    v15 = [v14 eligibilityStatus];

    id v16 = [v15 copy];
    [v8 setObject:v16 forKeyedSubscript:MRGroupSessionEligibilityStatusUserInfoKey];

    v17 = _MRLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10032A2BC((uint64_t)v13, v12);
    }

    v18 = +[MRDMediaRemoteServer server];
    uint64_t v19 = _MRGroupSessionEligibilityDidChangeNotification;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000200E4;
    v20[3] = &unk_100416020;
    id v21 = v12;
    [v18 postClientNotificationNamed:v19 userInfo:v8 predicate:v20];
  }
}

- (MRDGroupSessionServer)initWithNowPlayingServer:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)MRDGroupSessionServer;
  v6 = [(MRDGroupSessionServer *)&v31 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = MRGroupSessionSubsystemGetQueue();
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.MRDGroupSessionServer.notification", v7, v8);
    notificationQueue = v6->_notificationQueue;
    v6->_notificationQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.MRDGroupSessionServer.messageQueue", v12);
    messageQueue = v6->_messageQueue;
    v6->_messageQueue = (OS_dispatch_queue *)v13;

    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v15 = +[NSMutableSet set];
    clients = v6->_clients;
    v6->_clients = (NSMutableSet *)v15;

    uint64_t v17 = +[NSMapTable weakToStrongObjectsMapTable];
    assertionsByClient = v6->_assertionsByClient;
    v6->_assertionsByClient = (NSMapTable *)v17;

    objc_storeStrong((id *)&v6->_nowPlayingServer, a3);
    if (MSVDeviceIsAudioAccessory())
    {
      uint64_t v19 = objc_alloc_init(MRDGroupSessionAssertionManager);
      assertionManager = v6->_assertionManager;
      v6->_assertionManager = v19;
    }
    id v21 = objc_alloc_init(MRDNetworkMonitor);
    networkMonitor = v6->_networkMonitor;
    v6->_networkMonitor = v21;

    [(MRDNetworkMonitor *)v6->_networkMonitor startWithQueue:v6->_notificationQueue];
    id v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v6 selector:"handleClientConnect:" name:@"MRDMediaRemoteClientDidConnect" object:0];

    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v6 selector:"handleClientInvalidate:" name:@"MRDMediaRemoteServerClientInvalidatedNotification" object:0];

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v6 selector:"handleUserStateChange:" name:@"MRDMusicUserStateCenterCloudStateDidUpdateNotification" object:0];

    v26 = _MRLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Initialized", buf, 2u);
    }

    if (MSVDeviceIsAudioAccessory())
    {
      [(MRDGroupSessionAssertionManager *)v6->_assertionManager addObserver:v6];
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001CDEC;
      block[3] = &unk_100415CC8;
      v29 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  return v6;
}

- (void)requestEligibilityMonitoring
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_eligibilityMonitor)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v4 = _MRLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Starting eligibility monitoring", v7, 2u);
    }

    id v5 = objc_alloc_init(MRDGroupSessionEligibilityMonitor);
    eligibilityMonitor = self->_eligibilityMonitor;
    self->_eligibilityMonitor = v5;

    [(MRDGroupSessionEligibilityMonitor *)self->_eligibilityMonitor addObserver:self];
    os_unfair_lock_unlock(p_lock);
    dispatch_async((dispatch_queue_t)self->_notificationQueue, &stru_100415DA0);
  }
}

- (void)start
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Starting...", buf, 2u);
  }

  [(MRDGroupSessionServer *)self requestEligibilityMonitoring];
  os_unfair_lock_lock(&self->_lock);
  v4 = [[MRDGroupSessionManager alloc] initWithEligibilityMonitor:self->_eligibilityMonitor];
  sessionManager = self->_sessionManager;
  self->_sessionManager = v4;

  [(MRDGroupSessionManager *)self->_sessionManager addObserver:self];
  v6 = [[MRDRemoteControlGroupSessionCoordinator alloc] initWithSessionManager:self->_sessionManager eligibilityMonitor:self->_eligibilityMonitor];
  coordinator = self->_coordinator;
  self->_coordinator = v6;

  self->_running = 1;
  os_unfair_lock_unlock(&self->_lock);
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D0B4;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)notificationQueue, block);
  dispatch_queue_t v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Started.", buf, 2u);
  }
}

- (void)stop
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Stopping...", buf, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  coordinator = self->_coordinator;
  self->_coordinator = 0;

  [(MRDGroupSessionManager *)self->_sessionManager removeObserver:self];
  id v5 = [(MRDGroupSessionManager *)self->_sessionManager session];
  if ([v5 isHosted])
  {
    [(MRDGroupSessionManager *)self->_sessionManager finishRemoteControlGroupSession:v5];
  }
  else if (v5)
  {
    [(MRDGroupSessionManager *)self->_sessionManager leaveRemoteControlGroupSession:v5];
  }
  sessionManager = self->_sessionManager;
  self->_sessionManager = 0;

  self->_running = 0;
  os_unfair_lock_unlock(&self->_lock);
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D2A0;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)notificationQueue, block);
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Stopped.", buf, 2u);
  }
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  switch(xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY"))
  {
    case 0xC00000000000001uLL:
      [(MRDGroupSessionServer *)self handleGetGroupSessionServerEndpointMessage:xdict fromClient:v6];
      break;
    case 0xC00000000000002uLL:
      [(MRDGroupSessionServer *)self handleJoinGroupSessionMessage:xdict fromClient:v6];
      break;
    case 0xC00000000000003uLL:
      [(MRDGroupSessionServer *)self handleLeaveGroupSessionMessage:xdict fromClient:v6];
      break;
    case 0xC00000000000004uLL:
      [(MRDGroupSessionServer *)self _handleGroupSessionEventMessage:xdict fromClient:v6];
      break;
    case 0xC00000000000005uLL:
      [(MRDGroupSessionServer *)self _handleGetUserIdentityMessage:xdict fromClient:v6];
      break;
    case 0xC00000000000006uLL:
      [(MRDGroupSessionServer *)self _handleCreateGroupSessionTokenMessage:xdict fromClient:v6];
      break;
    case 0xC00000000000007uLL:
      [(MRDGroupSessionServer *)self _handleGetUserIdentityForDSIDMessage:xdict fromClient:v6];
      break;
    case 0xC00000000000008uLL:
      [(MRDGroupSessionServer *)self _handlePresentProximityCardMessage:xdict fromClient:v6];
      break;
    case 0xC00000000000009uLL:
      [(MRDGroupSessionServer *)self _handleRequestGroupSessionMessage:xdict fromClient:v6];
      break;
    default:
      break;
  }
}

- (void)handleGetGroupSessionServerEndpointMessage:(id)a3 fromClient:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001D4E4;
  v4[3] = &unk_100415DC8;
  v4[4] = self;
  sub_100014324(a3, v4);
}

- (void)handleJoinGroupSessionMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MRCreateDataFromXPCMessage();
  id v9 = [objc_alloc((Class)MRGroupSessionToken) initWithData:v8];
  v10 = _MRLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Handling join command from client: %@", buf, 0xCu);
  }

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10001D964;
  v38[3] = &unk_100415E18;
  id v11 = v6;
  id v39 = v11;
  id v12 = objc_retainBlock(v38);
  id v13 = kMREventJoinSessionModeQRCode;
  v14 = [v9 discoveredSession];

  if (v14)
  {
    uint64_t v15 = [v9 discoveredSession];
    id v16 = [v15 source];

    uint64_t v17 = (id *)&kMREventJoinSessionModeProximity;
    if (v16 == (id)1) {
      uint64_t v17 = (id *)&kMREventJoinSessionModeBoop;
    }
    goto LABEL_9;
  }
  v18 = [v9 sharedSecret];

  if (v18)
  {
    uint64_t v17 = (id *)&kMREventJoinSessionModeWHAAutoJoin;
LABEL_9:
    id v19 = *v17;

    id v13 = v19;
  }
  v20 = [(MRDGroupSessionServer *)self networkMonitor];
  if ([v20 isUsingWifi])
  {
    unsigned int v21 = 1;
  }
  else
  {
    v22 = [(MRDGroupSessionServer *)self networkMonitor];
    unsigned int v21 = [v22 isUsingWiredEthernet];
  }
  uint64_t v23 = [v9 equivalentMediaIdentifier];
  if (!v23) {
    goto LABEL_20;
  }
  v24 = (void *)v23;
  v25 = [v9 sharedSecret];
  if (v25) {
    unsigned int v21 = 0;
  }

  if (v21 == 1)
  {
    v26 = _MRLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Attempting to join group session by searching for equivalent WHA device", buf, 2u);
    }

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10001DA50;
    v36[3] = &unk_100415E40;
    v37 = v12;
    v27 = v12;
    [(MRDGroupSessionServer *)self joinGroupSessionViaEquivalentWHAEndpoint:v9 completion:v36];
    v28 = v37;
  }
  else
  {
LABEL_20:
    v29 = [[MRDGroupSessionJoinAttemptAnalytics alloc] initWithJoinMode:v13];
    v30 = [(MRDGroupSessionJoinAttemptAnalytics *)v29 request];
    [v30 start];

    objc_super v31 = [(MRDGroupSessionServer *)self sessionManager];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10001DACC;
    v33[3] = &unk_100415E68;
    v34 = v29;
    v35 = v12;
    v32 = v12;
    v28 = v29;
    [v31 joinGroupSessionWithToken:v9 completion:v33];
  }
}

- (void)joinGroupSessionViaEquivalentWHAEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 equivalentMediaIdentifier];
    *(_DWORD *)buf = 138412290;
    v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Searching for WHA endpoint with device identifier: %@", buf, 0xCu);
  }
  v10 = [MRDGroupSessionJoinAttemptAnalytics alloc];
  id v11 = [(MRDGroupSessionJoinAttemptAnalytics *)v10 initWithJoinMode:kMREventJoinSessionModeWHAAutoJoin];
  id v12 = [(MRDGroupSessionServer *)self sessionManager];
  id v13 = objc_alloc_init((Class)MRAVLightweightReconnaissanceSession);
  v14 = [(MRDGroupSessionJoinAttemptAnalytics *)v11 recon];
  [v14 start];

  uint64_t v15 = [v6 equivalentMediaIdentifier];
  id v16 = MRGroupSessionSubsystemGetQueue();
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001DDCC;
  v22[3] = &unk_100415F58;
  id v23 = v13;
  id v24 = v12;
  id v25 = v6;
  v26 = v11;
  v27 = self;
  id v28 = v7;
  uint64_t v17 = v11;
  id v18 = v7;
  id v19 = v6;
  id v20 = v12;
  id v21 = v13;
  [v21 searchEndpointsForOutputDeviceUID:v15 timeout:@"MRGroupSession.waitForWHAEndpoint" reason:v16 queue:v22 completion:3.0];
}

- (void)handleLeaveGroupSessionMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  MRCreateStringFromXPCMessage();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [(MRDGroupSessionServer *)self sessionManager];
  v10 = [v9 session];
  id v11 = _MRLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Handling leave command from client: %@", buf, 0xCu);
  }

  id v12 = [v10 identifier];
  if (v8 == v12)
  {

LABEL_7:
    if ([v10 isHosted])
    {
      uint64_t v15 = MRGroupSessionError;
      CFStringRef v16 = @"Cannot leave hosted session.";
      uint64_t v17 = 9;
      goto LABEL_9;
    }
    id v35 = v6;
    id v19 = [v10 joinToken];
    id v20 = [v19 equivalentMediaIdentifier];
    id v21 = v20;
    if (v20)
    {
      id v22 = v20;
    }
    else
    {
      id v22 = [v10 identifier];
    }
    id v23 = v22;

    id v24 = +[MRDMediaRemoteServer server];
    id v25 = [v24 routingServer];
    v26 = [v25 systemEndpointController];
    id v27 = [v26 activeOutputDeviceUID:0];
    if (v27 == v23)
    {
    }
    else
    {
      id v28 = v27;
      unsigned __int8 v29 = [v27 isEqual:v23];

      if ((v29 & 1) == 0) {
        goto LABEL_18;
      }
    }
    v30 = +[MRDMediaRemoteServer server];
    objc_super v31 = [v30 routingServer];
    v32 = [v31 systemEndpointController];
    id v33 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:0 reason:@"Group session ended."];
    [v32 updateSystemEndpointForRequest:v33];

LABEL_18:
    [v9 leaveRemoteControlGroupSession:v10];

    id v18 = 0;
    id v6 = v35;
    goto LABEL_19;
  }
  id v13 = v12;
  unsigned int v14 = [v8 isEqual:v12];

  if (v14) {
    goto LABEL_7;
  }
  uint64_t v15 = MRGroupSessionError;
  CFStringRef v16 = @"Did not find session for leave request.";
  uint64_t v17 = 2;
LABEL_9:
  id v18 = +[NSError msv_errorWithDomain:v15 code:v17 debugDescription:v16];
LABEL_19:
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10001ECA4;
  v36[3] = &unk_100415DC8;
  id v37 = v18;
  id v34 = v18;
  sub_100014324(v7, v36);
}

- (void)_handleGetUserIdentityMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001ED50;
  v6[3] = &unk_100415DC8;
  id v7 = a4;
  id v5 = v7;
  sub_100014324(a3, v6);
}

- (void)_handleGroupSessionEventMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MRCreatePropertyListFromXPCMessage();
  id v9 = [(MRDGroupSessionServer *)self sessionManager];
  v10 = [v8 objectForKeyedSubscript:MRGroupSessionEventOptionEventType];
  unint64_t v11 = (unint64_t)[v10 integerValue];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10001F28C;
  v34[3] = &unk_100415F80;
  id v12 = v6;
  id v35 = v12;
  id v13 = objc_retainBlock(v34);
  unsigned int v14 = (void (**)(void, void))v13;
  if (v11)
  {
    if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      os_unfair_lock_t lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      uint64_t v15 = [(NSMapTable *)self->_assertionsByClient objectForKey:v7];
      CFStringRef v16 = v15;
      if (v15)
      {
        id v17 = v15;
      }
      else
      {
        id v17 = +[NSMutableDictionary dictionary];
      }
      id v19 = v17;

      id v20 = [v8 objectForKeyedSubscript:MRGroupSessionEventOptionAssertionIdentifier];
      if (v20
        || (+[NSError msv_errorWithDomain:MRGroupSessionError code:9 debugDescription:@"No assertion ID provided."], (id v18 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v21 = _MRLogForCategory();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        if (v11 == 2)
        {
          if (v22)
          {
            uint64_t v23 = [v7 bundleIdentifier];
            id v24 = (void *)v23;
            if (!v23)
            {
              uint64_t v23 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 pid]);
            }
            *(_DWORD *)buf = 138412546;
            v30 = (void *)v23;
            uint64_t v37 = v23;
            __int16 v38 = 2112;
            id v39 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Client: %@ asserting with ID: %@", buf, 0x16u);
            if (!v24) {
          }
            }
          id v25 = [v9 assertSessionManagementScreenVisible];
          [v19 setObject:v25 forKeyedSubscript:v20];
        }
        else
        {
          if (v22)
          {
            uint64_t v26 = [v7 bundleIdentifier];
            id v27 = (void *)v26;
            if (!v26)
            {
              uint64_t v26 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 pid]);
            }
            *(_DWORD *)buf = 138412546;
            v30 = (void *)v26;
            uint64_t v37 = v26;
            __int16 v38 = 2112;
            id v39 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Client: %@ removing assertion with ID: %@", buf, 0x16u);
            if (!v27) {
          }
            }
          [v19 setObject:0 forKeyedSubscript:v20];
          [v9 releaseSessionManagementScreenVisibleAssertion];
        }
        id v28 = objc_msgSend(v19, "count", v30, lock);
        assertionsByClient = self->_assertionsByClient;
        if (v28) {
          [(NSMapTable *)assertionsByClient setObject:v19 forKey:v7];
        }
        else {
          [(NSMapTable *)assertionsByClient removeObjectForKey:v7];
        }
        id v18 = 0;
      }
      os_unfair_lock_unlock(lock);
      ((void (**)(void, void *))v14)[2](v14, v18);
    }
    else
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10001F33C;
      v32[3] = &unk_100415FA8;
      id v33 = v13;
      [v9 handleGroupSessionEvent:v11 withOptions:v8 completion:v32];
      id v18 = v33;
    }
  }
  else
  {
    id v18 = +[NSError msv_errorWithDomain:MRGroupSessionError code:9 debugDescription:@"No event type provided."];
    ((void (**)(void, void *))v14)[2](v14, v18);
  }
}

- (void)_handleCreateGroupSessionTokenMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = (void *)MRCreateDataFromXPCMessage();
  id v6 = MRCreateStringFromXPCMessage();
  id v7 = +[NSNumber numberWithLongLong:xpc_dictionary_get_int64(v4, "MRXPC_GROUP_SESSION_VERSION_KEY")];
  id v8 = objc_msgSend(objc_alloc((Class)MRGroupSessionToken), "initWithInvitationData:sharedSecret:sessionIdentifier:equivalentMediaIdentifier:version:", v5, 0, 0, v6, objc_msgSend(v7, "integerValue"));
  id v9 = 0;
  if (!v8)
  {
    id v9 = +[NSError msv_errorWithDomain:MRGroupSessionError code:12 debugDescription:@"Failed to parse group session token"];
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001F4D4;
  v12[3] = &unk_100415DF0;
  id v13 = v9;
  id v14 = v8;
  id v10 = v8;
  id v11 = v9;
  sub_100014324(v4, v12);
}

- (void)_handleGetUserIdentityForDSIDMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = MRCreateStringFromXPCMessage();
  id v6 = +[MRDMusicUserStateCenter sharedCenter];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001F62C;
  v8[3] = &unk_100415FD0;
  id v9 = v4;
  id v7 = v4;
  [v6 userIdentityForDSID:v5 completion:v8];
}

- (void)_handlePresentProximityCardMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = MRCreateStringFromXPCMessage();
  id v7 = MRCreateStringFromXPCMessage();
  id v8 = MRCreateStringFromXPCMessage();
  id v9 = MRCreateStringFromXPCMessage();
  id v13 = 0;
  [(MRDGroupSessionServer *)self presentProximityCardWithDeviceName:v6 modelIdentifier:v7 color:v8 url:v9 error:&v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001F8B8;
  v11[3] = &unk_100415DC8;
  id v12 = v13;
  id v10 = v12;
  sub_100014324(v5, v11);
}

- (void)_handleRequestGroupSessionMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001F964;
  v6[3] = &unk_100415E18;
  id v7 = a3;
  id v5 = v7;
  [(MRDGroupSessionServer *)self requestGroupSessionWithCompletion:v6];
}

- (void)requestGroupSessionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  if (MSVDeviceIsAudioAccessory())
  {
    id v5 = [(MRDGroupSessionServer *)self sessionManager];
    id v6 = [v5 session];

    if (v6)
    {
      if ([v6 isHosted])
      {
        id v7 = [v6 identifier];
        v4[2](v4, v7, 0);
      }
      else
      {
        id v7 = [objc_alloc((Class)NSError) initWithMRError:3];
        ((void (**)(id, id, id))v4)[2](v4, 0, v7);
      }
    }
    else
    {
      os_unfair_lock_lock(&self->_lock);
      requestGroupSessionCompletions = self->_requestGroupSessionCompletions;
      if (!requestGroupSessionCompletions)
      {
        id v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        id v10 = self->_requestGroupSessionCompletions;
        self->_requestGroupSessionCompletions = v9;

        requestGroupSessionCompletions = self->_requestGroupSessionCompletions;
      }
      id v11 = [v4 copy];
      id v12 = objc_retainBlock(v11);
      [(NSMutableSet *)requestGroupSessionCompletions addObject:v12];

      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x3032000000;
      v19[3] = sub_10001E52C;
      v19[4] = sub_10001E53C;
      id v20 = [(MRDGroupSessionAssertionManager *)self->_assertionManager createAssertionWithReason:@"Client requested group session"];
      id v13 = +[MRUserSettings currentSettings];
      [v13 groupSessionStartRequestAssertionDuration];
      double v15 = v14;

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10001FCE4;
      v18[3] = &unk_100415FF8;
      v18[4] = v19;
      CFStringRef v16 = +[MSVTimer timerWithInterval:0 repeats:v18 block:v15];
      requestAssertionTimer = self->_requestAssertionTimer;
      self->_requestAssertionTimer = v16;

      os_unfair_lock_unlock(&self->_lock);
      _Block_object_dispose(v19, 8);
    }
  }
  else
  {
    id v6 = [objc_alloc((Class)NSError) initWithMRError:6];
    ((void (**)(id, id, id))v4)[2](v4, 0, v6);
  }
}

- (BOOL)isPresentingProximityCard
{
  return self->_remoteAlertHandle != 0;
}

- (void)presentProximityCardWithDeviceName:(id)a3 modelIdentifier:(id)a4 color:(id)a5 url:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  CFStringRef v16 = v15;
  if (!v12)
  {
    if (!a7) {
      goto LABEL_21;
    }
    id v26 = objc_alloc((Class)NSError);
    CFStringRef v27 = @"device name is missing";
LABEL_20:
    *a7 = [v26 initWithMRError:2 description:v27];
    goto LABEL_21;
  }
  if (!v13)
  {
    if (!a7) {
      goto LABEL_21;
    }
    id v26 = objc_alloc((Class)NSError);
    CFStringRef v27 = @"model is missing";
    goto LABEL_20;
  }
  if (!v14)
  {
    if (!a7) {
      goto LABEL_21;
    }
    id v26 = objc_alloc((Class)NSError);
    CFStringRef v27 = @"color is missing";
    goto LABEL_20;
  }
  if (!v15)
  {
    if (!a7) {
      goto LABEL_21;
    }
    id v26 = objc_alloc((Class)NSError);
    CFStringRef v27 = @"url is missing";
    goto LABEL_20;
  }
  if (self->_remoteAlertHandle)
  {
    id v17 = _MRLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Dismissing existing proximity card to present a new one", buf, 2u);
    }

    [(MRDGroupSessionServer *)self dismissProximityCard];
  }
  id v18 = _MRLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2112;
    uint64_t v37 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Presenting proximity card for device with name: %@, model: %@, color: %@, url: %@", buf, 0x2Au);
  }

  id v19 = +[RBSProcessIdentity identityForAngelJobLabel:@"com.apple.MediaRemoteUI"];
  id v20 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithSceneProvidingProcess:v19 configurationIdentifier:@"proximity-card"];
  id v21 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  v28[0] = @"deviceName";
  v28[1] = @"modelIdentifier";
  v29[0] = v12;
  v29[1] = v13;
  v28[2] = @"color";
  v28[3] = @"url";
  v29[2] = v14;
  v29[3] = v16;
  BOOL v22 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];
  [v21 setUserInfo:v22];

  id v23 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  id v24 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:v20 configurationContext:v21];
  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = v24;

  [(SBSRemoteAlertHandle *)self->_remoteAlertHandle registerObserver:self];
  [(SBSRemoteAlertHandle *)self->_remoteAlertHandle activateWithContext:v23];

LABEL_21:
}

- (void)dismissProximityCard
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Dismissing proximity card", v5, 2u);
  }

  [(SBSRemoteAlertHandle *)self->_remoteAlertHandle unregisterObserver:self];
  [(SBSRemoteAlertHandle *)self->_remoteAlertHandle invalidate];
  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = 0;
}

- (void)handleClientInvalidate:(id)a3
{
  id v4 = [a3 object];
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSMapTable *)self->_assertionsByClient objectForKey:v4];
  if ([v5 count])
  {
    id v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 bundleIdentifier];
      id v8 = v7;
      if (!v7)
      {
        id v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 pid]);
      }
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Cleaning up assertions for invalidated client: %@ - %@", (uint8_t *)&v9, 0x16u);
      if (!v7) {
    }
      }
  }
  [(NSMapTable *)self->_assertionsByClient removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)restoreClientState:(id)a3 handler:(id)a4
{
  id v19 = a3;
  id v6 = (void (**)(id, void, id))a4;
  int v7 = sub_100009C80(v19);
  id v8 = v19;
  if (v7)
  {
    int v9 = [(MRDGroupSessionServer *)self sessionManager];
    id v10 = [v9 session];

    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    if (v10)
    {
      id v12 = [objc_alloc((Class)MRGroupSessionInfo) initWithGroupSession:v10];
      [v11 setObject:v12 forKeyedSubscript:MRActiveGroupSessionInfoUserInfoKey];
    }
    v6[2](v6, _MRGroupSessionInfoDidChangeNotification, v11);

    id v8 = v19;
  }
  id v13 = [v8 bundleIdentifier];
  int IsSystemMediaApplication = MRMediaRemoteApplicationIsSystemMediaApplication();

  if (IsSystemMediaApplication)
  {
    id v15 = +[MRDMusicUserStateCenter sharedCenter];
    CFStringRef v16 = [v15 localActiveIdentity];

    id v17 = +[NSMutableDictionary dictionary];
    id v18 = [v16 protobufData];
    [v17 setObject:v18 forKeyedSubscript:_MRUserIdentityDataUserInfoKey];

    v6[2](v6, _MRUserIdentityDidChangeNotification, v17);
  }
}

- (void)handleUserStateChange:(id)a3
{
  id v4 = +[MRDMusicUserStateCenter sharedCenter];
  id v11 = [v4 localActiveIdentity];

  id v5 = [(MRDGroupSessionServer *)self localMusicIdentity];
  id v6 = v11;
  int v7 = v11;
  if (v5 != v11)
  {
    id v8 = v5;
    unsigned __int8 v9 = [v5 isEqual:v11];

    if (v9) {
      goto LABEL_5;
    }
    [(MRDGroupSessionServer *)self setLocalMusicIdentity:v11];
    int v7 = +[NSMutableDictionary dictionary];
    id v10 = [v11 protobufData];
    [v7 setObject:v10 forKeyedSubscript:_MRUserIdentityDataUserInfoKey];

    id v6 = +[MRDMediaRemoteServer server];
    [v6 postClientNotificationNamed:_MRUserIdentityDidChangeNotification userInfo:v7 predicate:&stru_100416060];
  }

LABEL_5:
}

- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4
{
  id v5 = objc_msgSend(a4, "identifier", a3);
  [(MRDGroupSessionServer *)self _completeGroupSessionRequestsWithIdentifier:v5];

  [(MRDGroupSessionServer *)self notifyActiveSessionStateChanged];
}

- (void)manager:(id)a3 activeSessionDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(MRDGroupSessionServer *)self lastConnectionError];
  id v7 = [v6 code];

  if (v7 == (id)100)
  {
    id v8 = [v5 joinToken];
    unsigned __int8 v9 = [v8 equivalentMediaIdentifier];

    if (v9)
    {
      id v10 = _MRLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[MRDGroupSessionServer] Registering WHA identifier for connection failure: %@", (uint8_t *)&v16, 0xCu);
      }

      id v11 = +[MRDMediaRemoteServer server];
      id v12 = [v11 routingServer];
      id v13 = [v12 hostedRoutingService];
      id v14 = [v13 hostedRoutingController];
      id v15 = [v14 discoverySession];

      [v15 registerConnectionFailureForWHAIdentifier:v9];
    }
  }
}

- (void)manager:(id)a3 didLeaveRemoteGroupSession:(id)a4
{
  id v5 = objc_msgSend(a4, "joinToken", a3);
  id v11 = [v5 equivalentMediaIdentifier];

  if (v11)
  {
    id v6 = +[MRDMediaRemoteServer server];
    id v7 = [v6 routingServer];
    id v8 = [v7 hostedRoutingService];
    unsigned __int8 v9 = [v8 hostedRoutingController];
    id v10 = [v9 discoverySession];

    [v10 unregisterConnectionFailureForWHAIdentifier:v11];
  }
  [(MRDGroupSessionServer *)self notifyActiveSessionStateChanged];
}

- (void)manager:(id)a3 discoveredSessionsDidChange:(id)a4
{
  id v5 = objc_msgSend(a4, "msv_firstWhere:", &stru_1004160A0);
  if (v5)
  {
    id v6 = [(MRDGroupSessionServer *)self nowPlayingServer];
    if ([v6 activePlayerIsPlaying])
    {
      id v7 = [(MRDGroupSessionServer *)self nowPlayingServer];
      id v8 = [v7 activePlayerPath];
      unsigned __int8 v9 = [v8 isSystemMediaApplication];

      if ((v9 & 1) == 0)
      {
        id v10 = _MRLogForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[MRDGroupSessionServer] Suppressing proximity card because local device is playing non-Music content", buf, 2u);
        }

        goto LABEL_15;
      }
    }
    else
    {
    }
    id v11 = [objc_alloc((Class)MRGroupSessionToken) initWithDiscoveredSession:v5 autoConnect:1];
    id v12 = [v5 hostInfo];
    id v13 = [v12 displayName];
    id v14 = [v5 hostInfo];
    id v15 = [v14 modelIdentifier];
    int v16 = [v5 hostInfo];
    id v17 = [v16 color];
    id v18 = [v11 joinURLString];
    id v22 = 0;
    [(MRDGroupSessionServer *)self presentProximityCardWithDeviceName:v13 modelIdentifier:v15 color:v17 url:v18 error:&v22];
    id v19 = v22;

    if (v19)
    {
      id v20 = _MRLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10032A3E4(v19, v20);
      }
    }
    else
    {
      id v21 = v5;
      MRAnalyticsSendEvent();
      id v20 = v21;
    }
  }
  else if ([(MRDGroupSessionServer *)self isPresentingProximityCard])
  {
    [(MRDGroupSessionServer *)self dismissProximityCard];
  }
LABEL_15:
}

- (void)notifyActiveSessionStateChanged
{
  v2 = [(MRDGroupSessionServer *)self sessionManager];
  v3 = [v2 session];

  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  if (v3)
  {
    id v5 = [objc_alloc((Class)MRGroupSessionInfo) initWithGroupSession:v3];
    [v4 setObject:v5 forKeyedSubscript:MRActiveGroupSessionInfoUserInfoKey];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Push active session state: %@ to clients", (uint8_t *)&v8, 0xCu);
  }

  id v7 = +[MRDMediaRemoteServer server];
  [v7 postClientNotificationNamed:_MRGroupSessionInfoDidChangeNotification userInfo:v4 predicate:&stru_1004160E8];
}

- (void)_completeGroupSessionRequestsWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_requestGroupSessionCompletions;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v9) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v9));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  requestGroupSessionCompletions = self->_requestGroupSessionCompletions;
  self->_requestGroupSessionCompletions = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)eligibilityMonitor:(id)a3 eligibilityStatusDidChange:(id)a4
{
}

- (void)notifyEligibilityChanged:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:v3 forKeyedSubscript:MRGroupSessionEligibilityStatusUserInfoKey];
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Push local session state: %{public}@ to clients", (uint8_t *)&v7, 0xCu);
  }

  id v6 = +[MRDMediaRemoteServer server];
  [v6 postClientNotificationNamed:_MRGroupSessionEligibilityDidChangeNotification userInfo:v4 predicate:&stru_100416108];
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDGroupSessionServer *)self messageQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Adding client %{public}@", (uint8_t *)&v8, 0xCu);
  }

  int v7 = [(MRDGroupSessionServer *)self clients];
  [v7 addObject:v4];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDGroupSessionServer *)self messageQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Removing client %{public}@", (uint8_t *)&v8, 0xCu);
  }

  int v7 = [(MRDGroupSessionServer *)self clients];
  [v7 removeObject:v4];
}

- (id)clientForConnection:(id)a3
{
  id v4 = a3;
  [(MRDGroupSessionServer *)self clients];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "connection", (void)v13);
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSXPCListener)listener
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  listener = self->_listener;
  if (!listener)
  {
    id v5 = +[NSXPCListener anonymousListener];
    id v6 = self->_listener;
    self->_listener = v5;

    [(NSXPCListener *)self->_listener setDelegate:self];
    [(NSXPCListener *)self->_listener resume];
    listener = self->_listener;
  }
  uint64_t v7 = listener;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v7)
  {
    [v7 auditToken];
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  id v9 = MSVBundleIDForAuditToken();
  id v10 = [v9 length];
  unsigned __int8 v11 = _MRLogForCategory();
  long long v12 = v11;
  if (v10)
  {
    id v28 = v10;
    id v29 = v6;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10032A47C((uint64_t)v9, v12);
    }

    CFStringRef v27 = [[MRDGroupSessionClient alloc] initWithConnection:v8 bundleID:v9];
    long long v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MRGroupSessionServerXPCProtocol];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    id v18 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", v13, v14, v15, v16, v17, objc_opt_class(), 0);
    id v19 = MSVPropertyListDataClasses();
    [v18 unionSet:v19];

    [v12 setClasses:v18 forSelector:"connectToSession:reply:" argumentIndex:0 ofReply:1];
    [v12 setClasses:v18 forSelector:"connectToDiscoveryWithReply:" argumentIndex:0 ofReply:1];
    [v12 setClasses:v18 forSelector:"connectToDiscoveryWithReply:" argumentIndex:1 ofReply:1];
    [v12 setClasses:v18 forSelector:"session:approvePendingParticipant:reply:" argumentIndex:1 ofReply:0];
    [v12 setClasses:v18 forSelector:"session:denyPendingParticipant:reply:" argumentIndex:1 ofReply:0];
    id v20 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MRGroupSessionClientXPCProtocol];
    [v20 setClasses:v18 forSelector:"session:didUpdateParticipants:" argumentIndex:1 ofReply:0];
    [v20 setClasses:v18 forSelector:"session:didUpdatePendingParticipants:" argumentIndex:1 ofReply:0];
    [v20 setClasses:v18 forSelector:"session:didUpdateMembers:" argumentIndex:1 ofReply:0];
    [v20 setClasses:v18 forSelector:"discoveredSessionsDidChange:" argumentIndex:0 ofReply:0];
    [v20 setClasses:v18 forSelector:"activeSessionDidChange:" argumentIndex:0 ofReply:0];
    [v8 setExportedInterface:v12];
    id v21 = +[MSVWeakProxy proxyWithObject:v27 protocol:&OBJC_PROTOCOL___MRGroupSessionServerXPCProtocol];
    [v8 setExportedObject:v21];

    [v8 setRemoteObjectInterface:v20];
    id v22 = [(MRDGroupSessionServer *)self messageQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000218F0;
    block[3] = &unk_1004158D8;
    void block[4] = self;
    id v23 = v27;
    id v33 = v23;
    dispatch_sync(v22, block);

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000218FC;
    v30[3] = &unk_1004158D8;
    v30[4] = self;
    id v31 = v23;
    id v24 = v23;
    [v8 setInvalidationHandler:v30];
    id v25 = [(MRDGroupSessionServer *)self messageQueue];
    [v8 _setQueue:v25];

    [v8 resume];
    id v10 = v28;
    id v6 = v29;
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    sub_10032A4F4(v12);
  }

  return v10 != 0;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[MRDGroupSessionServer] Remote alert handle did activate", v4, 2u);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = _MRLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[MRDGroupSessionServer] Remote alert handle did deactivate", v6, 2u);
  }

  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = 0;
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[MRDGroupSessionServer] Remote alert handle did invalidate with error: %@", (uint8_t *)&v8, 0xCu);
  }

  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = 0;
}

- (void)groupSessionAssertionManagerDidAssert:(id)a3
{
}

- (void)groupSessionAssertionManagerDidUnassert:(id)a3
{
}

- (void)reevaluateAssertionState
{
  id v3 = [(MRDGroupSessionServer *)self assertionManager];
  unsigned __int8 v4 = [v3 isAsserting];
  os_unfair_lock_lock(&self->_lock);
  BOOL running = self->_running;
  if ((v4 & 1) == 0)
  {
    if (self->_running)
    {
      id v6 = _MRLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] No group session assertions: Scheduling stop timer", buf, 2u);
      }

      [(MSVTimer *)self->_stopTimer invalidate];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100021C20;
      v9[3] = &unk_1004158D8;
      id v10 = v3;
      unsigned __int8 v11 = self;
      id v7 = +[MSVTimer timerWithInterval:0 repeats:v9 block:30.0];
      stopTimer = self->_stopTimer;
      self->_stopTimer = v7;
    }
    goto LABEL_8;
  }
  [(MSVTimer *)self->_stopTimer invalidate];
  if (running)
  {
LABEL_8:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_9;
  }
  os_unfair_lock_unlock(&self->_lock);
  [(MRDGroupSessionServer *)self start];
LABEL_9:
}

- (MRDRemoteControlGroupSessionCoordinator)coordinator
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned __int8 v4 = self->_coordinator;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (MRDGroupSessionEligibilityMonitor)eligibilityMonitor
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned __int8 v4 = self->_eligibilityMonitor;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSError)lastConnectionError
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned __int8 v4 = self->_lastConnectionError;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setLastConnectionError:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (NSError *)[v5 copy];

  lastConnectionError = self->_lastConnectionError;
  self->_lastConnectionError = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)collectDiagnostic:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(MRDRemoteControlGroupSessionCoordinator *)self->_coordinator collectDiagnostic:v5];
  [(MRDGroupSessionManager *)self->_sessionManager collectDiagnostic:v5];
  [(MRDGroupSessionAssertionManager *)self->_assertionManager collectDiagnostic:v5];

  os_unfair_lock_unlock(p_lock);
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (MRDGroupSessionAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (void)setCoordinator:(id)a3
{
}

- (void)setSessionManager:(id)a3
{
}

- (void)setEligibilityMonitor:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (MRDNowPlayingServer)nowPlayingServer
{
  return self->_nowPlayingServer;
}

- (MRDNetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (NSMapTable)assertionsByClient
{
  return self->_assertionsByClient;
}

- (void)setAssertionsByClient:(id)a3
{
}

- (MRUserIdentity)localMusicIdentity
{
  return self->_localMusicIdentity;
}

- (void)setLocalMusicIdentity:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BOOL)running
{
  return self->_running;
}

- (MSVTimer)stopTimer
{
  return self->_stopTimer;
}

- (MSVTimer)requestAssertionTimer
{
  return self->_requestAssertionTimer;
}

- (NSMutableSet)requestGroupSessionCompletions
{
  return self->_requestGroupSessionCompletions;
}

- (void)setRequestGroupSessionCompletions:(id)a3
{
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_requestGroupSessionCompletions, 0);
  objc_storeStrong((id *)&self->_requestAssertionTimer, 0);
  objc_storeStrong((id *)&self->_stopTimer, 0);
  objc_storeStrong((id *)&self->_localMusicIdentity, 0);
  objc_storeStrong((id *)&self->_assertionsByClient, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_nowPlayingServer, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_eligibilityMonitor, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_lastConnectionError, 0);
}

@end