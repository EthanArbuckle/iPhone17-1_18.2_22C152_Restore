@interface RMSIDSServer
+ (id)server;
- (RMSIDSServer)init;
- (void)_cleanupStaleSessions:(id)a3;
- (void)_handleAddToWishlist:(id)a3;
- (void)_handleBeginDiscovery:(id)a3;
- (void)_handleBeginObservingNowPlaying:(id)a3;
- (void)_handleBeginPairing:(id)a3;
- (void)_handleConnectToService:(id)a3;
- (void)_handleEndDiscovery:(id)a3;
- (void)_handleEndObservingNowPlaying:(id)a3;
- (void)_handleEndPairing:(id)a3;
- (void)_handleLogout:(id)a3;
- (void)_handleNavigationCommand:(id)a3;
- (void)_handleNowPlayingArtworkRequest:(id)a3;
- (void)_handlePairingChallengeResponse:(id)a3;
- (void)_handlePickAudioRoute:(id)a3;
- (void)_handlePlaybackCommand:(id)a3;
- (void)_handleSeekToPlaybackTime:(id)a3;
- (void)_handleSendText:(id)a3;
- (void)_handleSessionHeartbeat:(id)a3;
- (void)_handleSetLikeState:(id)a3;
- (void)_handleSetVolume:(id)a3;
- (void)_handleTouchEnd:(id)a3;
- (void)_handleTouchMove:(id)a3;
- (void)_handleUnpairService:(id)a3;
- (void)_handleUpdatePairedNetworkNames:(id)a3;
- (void)_sendData:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 timeout:(int)a6 queueOneID:(id)a7 inResponseTo:(id)a8;
- (void)_sendData:(id)a3 type:(unsigned __int16)a4 timeout:(int)a5 queueOneID:(id)a6 inResponseTo:(id)a7;
- (void)controlSession:(id)a3 artworkDataDidBecomeAvailable:(id)a4 identifier:(id)a5;
- (void)controlSession:(id)a3 didReceivePairingChallengeRequestWithCredentials:(id)a4 completionHandler:(id)a5;
- (void)controlSession:(id)a3 didUpdateAudioRoutes:(id)a4;
- (void)controlSession:(id)a3 didUpdateNowPlayingInfo:(id)a4;
- (void)controlSession:(id)a3 didUpdateVolume:(float)a4;
- (void)controlSessionDidBeginEditingText:(id)a3;
- (void)controlSessionDidEnd:(id)a3;
- (void)controlSessionDidEndEditingText:(id)a3;
- (void)discoverySessionDidUpdateAvailableServices:(id)a3;
- (void)discoverySessionNetworkAvailabilityDidChange:(id)a3;
- (void)pairingSession:(id)a3 didPairWithServiceNetworkName:(id)a4 pairingGUID:(id)a5;
- (void)pairingSessionDidFail:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)sessionManager:(id)a3 sessionDidTimeout:(id)a4 withIdentifier:(int)a5;
@end

@implementation RMSIDSServer

+ (id)server
{
  if (server_onceToken != -1) {
    dispatch_once(&server_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)server_server;
  return v2;
}

uint64_t __22__RMSIDSServer_server__block_invoke()
{
  server_server = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (RMSIDSServer)init
{
  v17.receiver = self;
  v17.super_class = (Class)RMSIDSServer;
  v2 = [(RMSIDSServer *)&v17 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sessionManager = v2->_sessionManager;
    v2->_sessionManager = (RMSSessionManager *)v3;

    [(RMSSessionManager *)v2->_sessionManager setDelegate:v2];
    uint64_t v5 = objc_opt_new();
    nowPlayingSessions = v2->_nowPlayingSessions;
    v2->_nowPlayingSessions = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    pairingSessions = v2->_pairingSessions;
    v2->_pairingSessions = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    touchRemoteSessions = v2->_touchRemoteSessions;
    v2->_touchRemoteSessions = (NSMutableDictionary *)v9;

    v11 = [(RMSSessionManager *)v2->_sessionManager persistedSessionIdentifiers];
    uint64_t v12 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.remotemediaservices"];
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v12;

    [(IDSService *)v2->_idsService setProtobufAction:sel__handleSessionHeartbeat_ forIncomingRequestsOfType:16];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleBeginDiscovery_ forIncomingRequestsOfType:1];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleEndDiscovery_ forIncomingRequestsOfType:3];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleUnpairService_ forIncomingRequestsOfType:46];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleConnectToService_ forIncomingRequestsOfType:5];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleLogout_ forIncomingRequestsOfType:7];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handlePlaybackCommand_ forIncomingRequestsOfType:8];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handlePickAudioRoute_ forIncomingRequestsOfType:18];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleSetVolume_ forIncomingRequestsOfType:20];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleTouchMove_ forIncomingRequestsOfType:21];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleTouchEnd_ forIncomingRequestsOfType:22];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleNavigationCommand_ forIncomingRequestsOfType:23];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleBeginObservingNowPlaying_ forIncomingRequestsOfType:9];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleEndObservingNowPlaying_ forIncomingRequestsOfType:11];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleNowPlayingArtworkRequest_ forIncomingRequestsOfType:24];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleBeginPairing_ forIncomingRequestsOfType:26];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleEndPairing_ forIncomingRequestsOfType:28];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleSetLikeState_ forIncomingRequestsOfType:31];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleAddToWishlist_ forIncomingRequestsOfType:33];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleSeekToPlaybackTime_ forIncomingRequestsOfType:35];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleUpdatePairedNetworkNames_ forIncomingRequestsOfType:39];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleSendText_ forIncomingRequestsOfType:44];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handlePairingChallengeResponse_ forIncomingResponsesOfType:41];
    v14 = v2->_idsService;
    v15 = dispatch_get_global_queue(25, 0);
    [(IDSService *)v14 addDelegate:v2 queue:v15];

    [(RMSIDSServer *)v2 _cleanupStaleSessions:v11];
  }
  return v2;
}

- (void)_handleSessionHeartbeat:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSessionMessage alloc];
  v6 = [v4 data];
  uint64_t v7 = [(RMSSessionMessage *)v5 initWithData:v6];

  uint64_t v8 = [(RMSSessionMessage *)v7 sessionIdentifier];
  uint64_t v9 = [(RMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  v10 = objc_opt_new();
  v11 = RMSLogger();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      int v15 = 67109120;
      int v16 = v8;
      _os_log_impl(&dword_23C83A000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Received heartbeat", (uint8_t *)&v15, 8u);
    }

    [(RMSSessionManager *)self->_sessionManager refreshSessionWithIdentifier:v8];
    uint64_t v13 = 1;
  }
  else
  {
    if (v12)
    {
      int v15 = 67109120;
      int v16 = v8;
      _os_log_impl(&dword_23C83A000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Received heartbeat, but session was no longer active - respond with timeout error", (uint8_t *)&v15, 8u);
    }

    uint64_t v13 = 4294967293;
  }
  [v10 setResponseCode:v13];
  v14 = [v10 data];
  [(RMSIDSServer *)self _sendData:v14 type:17 priority:300 timeout:10 queueOneID:0 inResponseTo:v4];
}

- (void)_handleBeginDiscovery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "Received request to begin discovery session", buf, 2u);
  }

  v6 = [RMSBeginDiscoveryMessage alloc];
  uint64_t v7 = [v4 data];
  uint64_t v8 = [(RMSBeginDiscoveryMessage *)v6 initWithData:v7];

  uint64_t v9 = +[RMSDiscoverySession localDiscoverySession];
  objc_msgSend(v9, "setDiscoveryTypes:", -[RMSBeginDiscoveryMessage discoveryTypes](v8, "discoveryTypes"));
  [v9 setDelegate:self];
  if ([(RMSBeginDiscoveryMessage *)v8 hasPairedNetworkNames])
  {
    v10 = RMSLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C83A000, v10, OS_LOG_TYPE_DEFAULT, "Client supplied a list of paired network names, use this for filtering discovery", buf, 2u);
    }

    v11 = [(RMSBeginDiscoveryMessage *)v8 pairedNetworkNames];
    [v9 setPairedNetworkNames:v11];
  }
  uint64_t v12 = (int)*(double *)&RMSDiscoverySessionTimeout;
  sessionManager = self->_sessionManager;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __38__RMSIDSServer__handleBeginDiscovery___block_invoke;
  v16[3] = &unk_264E74838;
  v16[4] = self;
  id v17 = v4;
  id v18 = v9;
  id v14 = v9;
  id v15 = v4;
  [(RMSSessionManager *)sessionManager beginSession:v14 timeout:v12 shouldTakePowerAssertion:1 completionHandler:v16];
}

void __38__RMSIDSServer__handleBeginDiscovery___block_invoke(uint64_t a1, int a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__RMSIDSServer__handleBeginDiscovery___block_invoke_2;
  v4[3] = &unk_264E74810;
  int v7 = a2;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __38__RMSIDSServer__handleBeginDiscovery___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  [v2 setSessionIdentifier:*(unsigned int *)(a1 + 56)];
  uint64_t v3 = RMSLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(_DWORD *)(a1 + 56);
    int v9 = 67109120;
    int v10 = v4;
    _os_log_impl(&dword_23C83A000, v3, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending begin discovery response", (uint8_t *)&v9, 8u);
  }

  id v5 = *(void **)(a1 + 32);
  id v6 = [v2 data];
  [v5 _sendData:v6 type:2 timeout:10 queueOneID:0 inResponseTo:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) beginDiscovery];
  if (([*(id *)(a1 + 48) isNetworkAvailable] & 1) == 0)
  {
    int v7 = RMSLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(_DWORD *)(a1 + 56);
      int v9 = 67109120;
      int v10 = v8;
      _os_log_impl(&dword_23C83A000, v7, OS_LOG_TYPE_DEFAULT, "[Session %d] Network not available, immediately notify client", (uint8_t *)&v9, 8u);
    }

    [*(id *)(a1 + 32) discoverySessionNetworkAvailabilityDidChange:*(void *)(a1 + 48)];
  }
}

- (void)_handleUpdatePairedNetworkNames:(id)a3
{
  id v4 = a3;
  id v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "Received request to update paired network names", v11, 2u);
  }

  id v6 = [RMSUpdatePairedNetworNamesMessage alloc];
  int v7 = [v4 data];

  int v8 = [(RMSUpdatePairedNetworNamesMessage *)v6 initWithData:v7];
  int v9 = [(RMSSessionManager *)self->_sessionManager sessionWithIdentifier:[(RMSUpdatePairedNetworNamesMessage *)v8 sessionIdentifier]];
  int v10 = [(RMSUpdatePairedNetworNamesMessage *)v8 pairedNetworkNames];
  [v9 setPairedNetworkNames:v10];
}

- (void)_handleEndDiscovery:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [RMSSessionMessage alloc];
  id v6 = [v4 data];

  int v7 = [(RMSSessionMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSSessionMessage *)v7 sessionIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to end discovery session", (uint8_t *)v10, 8u);
  }

  [(RMSSessionManager *)self->_sessionManager endSessionWithIdentifier:v8 completionHandler:&__block_literal_global_62];
}

void __36__RMSIDSServer__handleEndDiscovery___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__RMSIDSServer__handleEndDiscovery___block_invoke_2;
  block[3] = &unk_264E740A8;
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __36__RMSIDSServer__handleEndDiscovery___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) endDiscovery];
}

- (void)_handleUnpairService:(id)a3
{
  id v4 = a3;
  id v5 = [RMSUnpairServiceMessage alloc];
  id v6 = [v4 data];
  int v7 = [(RMSUnpairServiceMessage *)v5 initWithData:v6];

  uint64_t v8 = [RMSService alloc];
  int v9 = [(RMSUnpairServiceMessage *)v7 service];
  int v10 = [(RMSService *)v8 initWithProtobuf:v9];

  uint64_t v11 = RMSLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23C83A000, v11, OS_LOG_TYPE_DEFAULT, "Received request to unpair service", buf, 2u);
  }

  uint64_t v12 = +[RMSPairingSession localPairingSession];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __37__RMSIDSServer__handleUnpairService___block_invoke;
  v14[3] = &unk_264E74880;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [v12 unpairService:v10 completionHandler:v14];
}

void __37__RMSIDSServer__handleUnpairService___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  [v4 setResponseCode:a2];
  id v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromRMSResponseCode(a2);
    int v9 = 138412290;
    int v10 = v6;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "Sending unpairing result: %@", (uint8_t *)&v9, 0xCu);
  }
  int v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v4 data];
  [v7 _sendData:v8 type:47 timeout:10 queueOneID:0 inResponseTo:*(void *)(a1 + 40)];
}

- (void)_handleConnectToService:(id)a3
{
  id v4 = a3;
  id v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "Received request to connect to service", buf, 2u);
  }

  id v6 = [RMSConnectToServiceMessage alloc];
  int v7 = [v4 data];
  uint64_t v8 = [(RMSConnectToServiceMessage *)v6 initWithData:v7];

  int v9 = [RMSService alloc];
  int v10 = [(RMSConnectToServiceMessage *)v8 service];
  uint64_t v11 = [(RMSService *)v9 initWithProtobuf:v10];

  BOOL v12 = [(RMSConnectToServiceMessage *)v8 allowPairing];
  if ([(RMSService *)v11 isTVRemoteCoreSupported]) {
    +[RMSControlSession localControlSession];
  }
  else {
  id v13 = +[RMSControlSession daapControlSession];
  }
  [v13 setDelegate:self];
  sessionManager = self->_sessionManager;
  uint64_t v15 = (int)*(double *)&RMSControlSessionTimeout;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __40__RMSIDSServer__handleConnectToService___block_invoke;
  v20[3] = &unk_264E748D0;
  id v21 = v13;
  v22 = v11;
  BOOL v26 = v12;
  v23 = v8;
  v24 = self;
  id v25 = v4;
  id v16 = v4;
  id v17 = v8;
  id v18 = v11;
  id v19 = v13;
  [(RMSSessionManager *)sessionManager beginSession:v19 timeout:v15 shouldTakePowerAssertion:0 completionHandler:v20];
}

void __40__RMSIDSServer__handleConnectToService___block_invoke(uint64_t a1, int a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) pairingGUID];
  uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__RMSIDSServer__handleConnectToService___block_invoke_2;
  v9[3] = &unk_264E748A8;
  int v11 = a2;
  uint64_t v8 = *(void **)(a1 + 64);
  v9[4] = *(void *)(a1 + 56);
  id v10 = v8;
  [v4 connectToService:v5 pairingGUID:v6 allowPairing:v7 completionHandler:v9];
}

void __40__RMSIDSServer__handleConnectToService___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  [v8 setResponseCode:a2];
  int v9 = [v7 protobuf];

  [v8 setControlInterface:v9];
  [v8 setSessionIdentifier:*(unsigned int *)(a1 + 48)];
  [v8 setResponseData:a3];
  id v10 = RMSLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *(_DWORD *)(a1 + 48);
    BOOL v12 = NSStringFromRMSResponseCode(a2);
    v15[0] = 67109378;
    v15[1] = v11;
    __int16 v16 = 2112;
    id v17 = v12;
    _os_log_impl(&dword_23C83A000, v10, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending connection result: %@", (uint8_t *)v15, 0x12u);
  }
  id v13 = *(void **)(a1 + 32);
  id v14 = [v8 data];
  [v13 _sendData:v14 type:6 priority:300 timeout:15 queueOneID:0 inResponseTo:*(void *)(a1 + 40)];

  if (a2 != 1) {
    [*(id *)(*(void *)(a1 + 32) + 8) endSessionWithIdentifier:*(unsigned int *)(a1 + 48) completionHandler:0];
  }
}

- (void)_handlePairingChallengeResponse:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSPairingChallengeResponseMessage alloc];
  id v6 = [v4 data];

  id v7 = [(RMSPairingChallengeResponseMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSPairingChallengeResponseMessage *)v7 sessionIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received pairing response", (uint8_t *)v14, 8u);
  }

  pairingCompletionHandlers = self->_pairingCompletionHandlers;
  int v11 = [NSNumber numberWithInt:v8];
  BOOL v12 = [(NSMutableDictionary *)pairingCompletionHandlers objectForKeyedSubscript:v11];

  if (v12)
  {
    id v13 = [(RMSPairingChallengeResponseMessage *)v7 code];
    ((void (**)(void, void *, BOOL))v12)[2](v12, v13, [(RMSPairingChallengeResponseMessage *)v7 userCancelled]);
  }
}

- (void)_handleLogout:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSessionMessage alloc];
  id v6 = [v4 data];

  id v7 = [(RMSSessionMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSSessionMessage *)v7 sessionIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for logout", (uint8_t *)v10, 8u);
  }

  [(RMSSessionManager *)self->_sessionManager endSessionWithIdentifier:v8 completionHandler:&__block_literal_global_75];
}

uint64_t __30__RMSIDSServer__handleLogout___block_invoke(uint64_t a1, void *a2)
{
  return [a2 logout];
}

- (void)_handlePlaybackCommand:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSPlaybackCommandMessage alloc];
  id v6 = [v4 data];

  id v7 = [(RMSPlaybackCommandMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSPlaybackCommandMessage *)v7 sessionIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for playback command", (uint8_t *)v11, 8u);
  }

  id v10 = [(RMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_msgSend(v10, "sendPlaybackCommand:completionHandler:", -[RMSPlaybackCommandMessage playbackCommand](v7, "playbackCommand"), 0);
}

- (void)_handleBeginObservingNowPlaying:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSessionMessage alloc];
  id v6 = [v4 data];
  id v7 = [(RMSSessionMessage *)v5 initWithData:v6];

  uint64_t v8 = [(RMSSessionMessage *)v7 sessionIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to begin observing now playing", (uint8_t *)v13, 8u);
  }

  id v10 = [(RMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  [v10 beginObservingNowPlaying];
  uint64_t v11 = objc_opt_new();
  [v11 setResponseCode:1];
  uint64_t v12 = [v11 data];
  [(RMSIDSServer *)self _sendData:v12 type:10 timeout:15 queueOneID:0 inResponseTo:v4];
}

- (void)_handleEndObservingNowPlaying:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSessionMessage alloc];
  id v6 = [v4 data];

  id v7 = [(RMSSessionMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSSessionMessage *)v7 sessionIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to end observing now playing session", (uint8_t *)v11, 8u);
  }

  id v10 = [(RMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  [v10 endObservingNowPlaying];
}

- (void)_handlePickAudioRoute:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSPickAudioRouteMessage alloc];
  id v6 = [v4 data];
  id v7 = [(RMSPickAudioRouteMessage *)v5 initWithData:v6];

  uint64_t v8 = [(RMSPickAudioRouteMessage *)v7 sessionIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to pick audio route", (uint8_t *)&buf, 8u);
  }

  id v10 = objc_opt_new();
  objc_msgSend(v10, "setMacAddress:", -[RMSPickAudioRouteMessage macAddress](v7, "macAddress"));
  uint64_t v11 = [(RMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_initWeak(&buf, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  _DWORD v13[2] = __38__RMSIDSServer__handlePickAudioRoute___block_invoke;
  v13[3] = &unk_264E74918;
  int v16 = v8;
  objc_copyWeak(&v15, &buf);
  id v12 = v4;
  id v14 = v12;
  [v11 pickAudioRoute:v10 completionHandler:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&buf);
}

void __38__RMSIDSServer__handlePickAudioRoute___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  [v4 setResponseCode:a2];
  uint64_t v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(_DWORD *)(a1 + 48);
    id v7 = NSStringFromRMSResponseCode(a2);
    v10[0] = 67109378;
    v10[1] = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending pick route response: %@", (uint8_t *)v10, 0x12u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v9 = [v4 data];
  [WeakRetained _sendData:v9 type:19 timeout:30 queueOneID:0 inResponseTo:*(void *)(a1 + 32)];
}

- (void)_handleSetVolume:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSetVolumeMessage alloc];
  int v6 = [v4 data];

  id v7 = [(RMSSetVolumeMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSSetVolumeMessage *)v7 sessionIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to set volume", (uint8_t *)v11, 8u);
  }

  id v10 = [(RMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  [(RMSSetVolumeMessage *)v7 volume];
  objc_msgSend(v10, "setVolume:completionHandler:", 0);
}

- (void)_handleSeekToPlaybackTime:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSeekToPlaybackTimeMessage alloc];
  int v6 = [v4 data];

  id v7 = [(RMSSeekToPlaybackTimeMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSSeekToPlaybackTimeMessage *)v7 sessionIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received message to seek to playbacktime", (uint8_t *)v11, 8u);
  }

  id v10 = [(RMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_msgSend(v10, "seekToPlaybackTime:completionHandler:", -[RMSSeekToPlaybackTimeMessage playbackTime](v7, "playbackTime"), 0);
}

- (void)_handleNowPlayingArtworkRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSNowPlayingArtworkRequestMessage alloc];
  int v6 = [v4 data];
  id v7 = [(RMSNowPlayingArtworkRequestMessage *)v5 initWithData:v6];

  uint64_t v8 = [(RMSNowPlayingArtworkRequestMessage *)v7 artworkIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    uint64_t v22 = (uint64_t)v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "Received artwork request for identifier: %@", (uint8_t *)&v21, 0xCu);
  }

  id v10 = +[RMSNowPlayingArtworkCache sharedArtworkCache];
  __int16 v11 = [v10 artworkDataForIdentifier:v8];

  if (v11)
  {
    unsigned int v12 = [(RMSNowPlayingArtworkRequestMessage *)v7 width];
    unsigned int v13 = [(RMSNowPlayingArtworkRequestMessage *)v7 height];
    [(RMSNowPlayingArtworkRequestMessage *)v7 compressionQuality];
    int v15 = v14;
    int v16 = [MEMORY[0x263F1C6B0] imageWithData:v11];
    LODWORD(v17) = v15;
    uint64_t v18 = objc_msgSend(v16, "rms_jpegDataScaledToSize:compressionQuality:", (double)v12, (double)v13, v17);

    id v19 = RMSLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v18 length];
      int v21 = 134217984;
      uint64_t v22 = v20;
      _os_log_impl(&dword_23C83A000, v19, OS_LOG_TYPE_DEFAULT, "Sending artwork, size=%zd", (uint8_t *)&v21, 0xCu);
    }

    [(RMSIDSServer *)self _sendData:v18 type:25 timeout:(int)*MEMORY[0x263F49E68] queueOneID:@"ArtworkData" inResponseTo:v4];
  }
  else
  {
    uint64_t v18 = RMSLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_23C83A000, v18, OS_LOG_TYPE_DEFAULT, "Artwork data not found", (uint8_t *)&v21, 2u);
    }
  }
}

- (void)_handleSetLikeState:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSetLikeStateMessage alloc];
  int v6 = [v4 data];
  id v7 = [(RMSSetLikeStateMessage *)v5 initWithData:v6];

  uint64_t v8 = [(RMSSetLikeStateMessage *)v7 sessionIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to set like state", (uint8_t *)&buf, 8u);
  }

  id v10 = [(RMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_initWeak(&buf, self);
  int v11 = [(RMSSetLikeStateMessage *)v7 likeState];
  uint64_t v12 = [(RMSSetLikeStateMessage *)v7 itemID];
  uint64_t v13 = [(RMSSetLikeStateMessage *)v7 databaseID];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  _DWORD v15[2] = __36__RMSIDSServer__handleSetLikeState___block_invoke;
  v15[3] = &unk_264E74940;
  objc_copyWeak(&v17, &buf);
  id v14 = v4;
  id v16 = v14;
  [v10 setLikedState:v11 itemID:v12 databaseID:v13 completionHandler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&buf);
}

void __36__RMSIDSServer__handleSetLikeState___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  [v4 setResponseCode:a2];
  uint64_t v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromRMSResponseCode(a2);
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "Sending set like state response: %@", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = [v4 data];
  [WeakRetained _sendData:v8 type:32 timeout:15 queueOneID:0 inResponseTo:*(void *)(a1 + 32)];
}

- (void)_handleAddToWishlist:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSAddToWishlistMessage alloc];
  int v6 = [v4 data];
  id v7 = [(RMSAddToWishlistMessage *)v5 initWithData:v6];

  uint64_t v8 = [(RMSAddToWishlistMessage *)v7 sessionIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to add to wishlist", (uint8_t *)&buf, 8u);
  }

  id v10 = [(RMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_initWeak(&buf, self);
  uint64_t v11 = [(RMSAddToWishlistMessage *)v7 itemID];
  uint64_t v12 = [(RMSAddToWishlistMessage *)v7 databaseID];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  _DWORD v14[2] = __37__RMSIDSServer__handleAddToWishlist___block_invoke;
  v14[3] = &unk_264E74940;
  objc_copyWeak(&v16, &buf);
  id v13 = v4;
  id v15 = v13;
  [v10 addToWishlist:v11 databaseID:v12 completionHandler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&buf);
}

void __37__RMSIDSServer__handleAddToWishlist___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  [v4 setResponseCode:a2];
  uint64_t v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromRMSResponseCode(a2);
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "Sending add to wishlist response: %@", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = [v4 data];
  [WeakRetained _sendData:v8 type:32 timeout:15 queueOneID:0 inResponseTo:*(void *)(a1 + 32)];
}

- (void)_handleTouchMove:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSTouchMessage alloc];
  int v6 = [v4 data];

  id v7 = [(RMSTouchMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSTouchMessage *)v7 sessionIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for touch move", (uint8_t *)v11, 8u);
  }

  id v10 = [(RMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_msgSend(v10, "sendTouchMoveWithDirection:repeatCount:", -[RMSTouchMessage direction](v7, "direction"), -[RMSTouchMessage repeatCount](v7, "repeatCount"));
}

- (void)_handleTouchEnd:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSTouchMessage alloc];
  int v6 = [v4 data];

  id v7 = [(RMSTouchMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSTouchMessage *)v7 sessionIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for touch end", (uint8_t *)v11, 8u);
  }

  id v10 = [(RMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_msgSend(v10, "sendTouchEndWithDirection:repeatCount:", -[RMSTouchMessage direction](v7, "direction"), -[RMSTouchMessage repeatCount](v7, "repeatCount"));
}

- (void)_handleNavigationCommand:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSNavigationCommandMessage alloc];
  int v6 = [v4 data];

  id v7 = [(RMSNavigationCommandMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSNavigationCommandMessage *)v7 sessionIdentifier];
  int v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for navigation command", (uint8_t *)v11, 8u);
  }

  id v10 = [(RMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_msgSend(v10, "sendNavigationCommand:", -[RMSNavigationCommandMessage navigationCommand](v7, "navigationCommand"));
}

- (void)_handleBeginPairing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "Received request to begin pairing session", buf, 2u);
  }

  int v6 = [RMSBeginPairingMessage alloc];
  id v7 = [v4 data];
  uint64_t v8 = [(RMSBeginPairingMessage *)v6 initWithData:v7];

  int v9 = +[RMSPairingSession localPairingSession];
  [v9 setDelegate:self];
  id v10 = [(RMSBeginPairingMessage *)v8 passcode];
  [v9 setPasscode:v10];

  uint64_t v11 = [(RMSBeginPairingMessage *)v8 appName];
  [v9 setAdvertisedAppName:v11];

  uint64_t v12 = [(RMSBeginPairingMessage *)v8 deviceName];
  [v9 setAdvertisedDeviceName:v12];

  id v13 = [(RMSBeginPairingMessage *)v8 deviceModel];
  [v9 setAdvertisedDeviceModel:v13];

  uint64_t v14 = (int)*(double *)&RMSPairingSessionTimeout;
  sessionManager = self->_sessionManager;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __36__RMSIDSServer__handleBeginPairing___block_invoke;
  v18[3] = &unk_264E74838;
  id v19 = v9;
  uint64_t v20 = self;
  id v21 = v4;
  id v16 = v4;
  id v17 = v9;
  [(RMSSessionManager *)sessionManager beginSession:v17 timeout:v14 shouldTakePowerAssertion:1 completionHandler:v18];
}

void __36__RMSIDSServer__handleBeginPairing___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) beginPairing];
  id v4 = objc_opt_new();
  [v4 setSessionIdentifier:a2];
  [v4 setResponseCode:1];
  uint64_t v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending begin pairing response", (uint8_t *)v8, 8u);
  }

  int v6 = *(void **)(a1 + 40);
  id v7 = [v4 data];
  [v6 _sendData:v7 type:27 timeout:15 queueOneID:0 inResponseTo:*(void *)(a1 + 48)];
}

- (void)_handleEndPairing:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSessionMessage alloc];
  int v6 = [v4 data];

  id v7 = [(RMSSessionMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSSessionMessage *)v7 sessionIdentifier];
  uint64_t v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to end pairing session", (uint8_t *)v10, 8u);
  }

  [(RMSSessionManager *)self->_sessionManager endSessionWithIdentifier:v8 completionHandler:&__block_literal_global_94];
}

uint64_t __34__RMSIDSServer__handleEndPairing___block_invoke(uint64_t a1, void *a2)
{
  return [a2 endPairing];
}

- (void)_handleSendText:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSendTextMessage alloc];
  int v6 = [v4 data];
  id v7 = [(RMSSendTextMessage *)v5 initWithData:v6];

  uint64_t v8 = [(RMSSendTextMessage *)v7 sessionIdentifier];
  uint64_t v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109120;
    int v17 = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to send text", buf, 8u);
  }

  id v10 = [(RMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  uint64_t v11 = [(RMSSendTextMessage *)v7 text];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  _DWORD v13[2] = __32__RMSIDSServer__handleSendText___block_invoke;
  v13[3] = &unk_264E74968;
  int v15 = v8;
  void v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  [v10 sendText:v11 completionHandler:v13];
}

void __32__RMSIDSServer__handleSendText___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  [v4 setResponseCode:a2];
  uint64_t v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(_DWORD *)(a1 + 48);
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending send text response", (uint8_t *)v9, 8u);
  }

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v4 data];
  [v7 _sendData:v8 type:45 timeout:15 queueOneID:0 inResponseTo:*(void *)(a1 + 40)];
}

- (void)_cleanupStaleSessions:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = (int)*MEMORY[0x263F49E68];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_opt_new();
        objc_msgSend(v11, "setSessionIdentifier:", objc_msgSend(v10, "intValue"));
        id v12 = RMSLogger();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = [v10 intValue];
          *(_DWORD *)id buf = 67109120;
          int v20 = v13;
          _os_log_impl(&dword_23C83A000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Session is stale, notifying client", buf, 8u);
        }

        id v14 = [v11 data];
        [(RMSIDSServer *)self _sendData:v14 type:37 timeout:v8 queueOneID:0 inResponseTo:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)_sendData:(id)a3 type:(unsigned __int16)a4 timeout:(int)a5 queueOneID:(id)a6 inResponseTo:(id)a7
{
}

- (void)_sendData:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 timeout:(int)a6 queueOneID:(id)a7 inResponseTo:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v11 = a4;
  v42[3] = *MEMORY[0x263EF8340];
  id v14 = a7;
  id v15 = a8;
  long long v16 = (objc_class *)MEMORY[0x263F4A098];
  id v17 = a3;
  long long v18 = (void *)[[v16 alloc] initWithProtobufData:v17 type:v11 isResponse:v15 != 0];

  id v19 = objc_alloc(MEMORY[0x263EFF9A0]);
  v41[0] = *MEMORY[0x263F49F80];
  int v20 = [NSNumber numberWithInt:v9];
  uint64_t v21 = *MEMORY[0x263F49ED8];
  v42[0] = v20;
  v42[1] = MEMORY[0x263EFFA88];
  uint64_t v22 = *MEMORY[0x263F49F20];
  v41[1] = v21;
  v41[2] = v22;
  v42[2] = MEMORY[0x263EFFA88];
  uint64_t v23 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];
  v24 = (void *)[v19 initWithDictionary:v23];

  if (v15)
  {
    id v25 = [v15 context];
    BOOL v26 = [v25 outgoingResponseIdentifier];
    [v24 setObject:v26 forKeyedSubscript:*MEMORY[0x263F49F40]];
  }
  if (v14) {
    [v24 setObject:v14 forKeyedSubscript:*MEMORY[0x263F49F60]];
  }
  if (a5 == 300)
  {
    uint64_t v27 = MEMORY[0x263EFFA88];
    [v24 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49EF8]];
    [v24 setObject:v27 forKeyedSubscript:*MEMORY[0x263F49EC0]];
  }
  idsService = self->_idsService;
  v29 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E30]];
  id v35 = 0;
  id v36 = 0;
  [(IDSService *)idsService sendProtobuf:v18 toDestinations:v29 priority:a5 options:v24 identifier:&v36 error:&v35];
  id v30 = v36;
  id v31 = v35;

  v32 = RMSLogger();
  v33 = v32;
  if (v31)
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[RMSIDSServer _sendData:type:priority:timeout:queueOneID:inResponseTo:](v11, (uint64_t)v31, v33);
    }
  }
  else if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v34 = NSStringFromRMSMessageType(v11);
    *(_DWORD *)id buf = 138412546;
    v38 = v34;
    __int16 v39 = 2112;
    id v40 = v30;
    _os_log_impl(&dword_23C83A000, v33, OS_LOG_TYPE_DEFAULT, "Sent message of type: %@, IDS identifier: %@", buf, 0x16u);
  }
}

- (void)discoverySessionDidUpdateAvailableServices:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 availableServices];
  uint64_t v6 = +[RMSService protobufsFromServices:v5];
  uint64_t v7 = [(RMSSessionManager *)self->_sessionManager identifierForSession:v4];

  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (void *)[v6 mutableCopy];
  [v8 setServices:v9];

  [v8 setSessionIdentifier:v7];
  uint64_t v10 = RMSLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109378;
    v12[1] = v7;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_23C83A000, v10, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending available services: %@", (uint8_t *)v12, 0x12u);
  }

  uint64_t v11 = [v8 data];
  [(RMSIDSServer *)self _sendData:v11 type:4 timeout:(int)*MEMORY[0x263F49E68] queueOneID:@"AvailableServices" inResponseTo:0];
}

- (void)discoverySessionNetworkAvailabilityDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(RMSSessionManager *)self->_sessionManager identifierForSession:v4];
  uint64_t v6 = objc_opt_new();
  [v6 setSessionIdentifier:v5];
  objc_msgSend(v6, "setWifiAvailable:", objc_msgSend(v4, "isNetworkAvailable"));
  uint64_t v7 = RMSLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v4 isNetworkAvailable];
    uint64_t v9 = @"unavailable";
    if (v8) {
      uint64_t v9 = @"available";
    }
    v11[0] = 67109378;
    v11[1] = v5;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl(&dword_23C83A000, v7, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending wifi availability message: %@", (uint8_t *)v11, 0x12u);
  }

  uint64_t v10 = [v6 data];
  [(RMSIDSServer *)self _sendData:v10 type:38 timeout:(int)*MEMORY[0x263F49E68] queueOneID:@"NetworkAvailability" inResponseTo:0];
}

- (void)controlSession:(id)a3 didReceivePairingChallengeRequestWithCredentials:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a5;
  sessionManager = self->_sessionManager;
  id v10 = a4;
  uint64_t v11 = [(RMSSessionManager *)sessionManager identifierForSession:a3];
  if (!self->_pairingCompletionHandlers)
  {
    __int16 v12 = (NSMutableDictionary *)objc_opt_new();
    pairingCompletionHandlers = self->_pairingCompletionHandlers;
    self->_pairingCompletionHandlers = v12;
  }
  uint64_t v14 = (void *)MEMORY[0x23ECE8BF0](v8);
  uint64_t v15 = self->_pairingCompletionHandlers;
  long long v16 = [NSNumber numberWithInt:v11];
  [(NSMutableDictionary *)v15 setObject:v14 forKeyedSubscript:v16];

  id v17 = objc_opt_new();
  [v17 setSessionIdentifier:v11];
  long long v18 = [v10 protobuf];

  [v17 setPairingCredentials:v18];
  id v19 = RMSLogger();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v21[0] = 67109120;
    v21[1] = v11;
    _os_log_impl(&dword_23C83A000, v19, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending pairing request", (uint8_t *)v21, 8u);
  }

  int v20 = [v17 data];
  [(RMSIDSServer *)self _sendData:v20 type:40 priority:300 timeout:(int)*MEMORY[0x263F49E68] queueOneID:0 inResponseTo:0];
}

- (void)controlSession:(id)a3 didUpdateNowPlayingInfo:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  sessionManager = self->_sessionManager;
  id v7 = a4;
  uint64_t v8 = [(RMSSessionManager *)sessionManager identifierForSession:a3];
  uint64_t v9 = objc_opt_new();
  id v10 = [v7 protobuf];

  [v9 setNowPlayingInfo:v10];
  [v9 setSessionIdentifier:v8];
  uint64_t v11 = RMSLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v8;
    _os_log_impl(&dword_23C83A000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending now playing info update", (uint8_t *)v13, 8u);
  }

  __int16 v12 = [v9 data];
  [(RMSIDSServer *)self _sendData:v12 type:12 timeout:(int)*MEMORY[0x263F49E68] queueOneID:@"NowPlayingInfo" inResponseTo:0];
}

- (void)controlSession:(id)a3 artworkDataDidBecomeAvailable:(id)a4 identifier:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = +[RMSNowPlayingArtworkCache sharedArtworkCache];
  [v11 setArtworkData:v9 forIdentifier:v8];

  uint64_t v12 = [(RMSSessionManager *)self->_sessionManager identifierForSession:v10];
  __int16 v13 = objc_opt_new();
  [v13 setSessionIdentifier:v12];
  [v13 setArtworkIdentifier:v8];

  uint64_t v14 = RMSLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = v12;
    _os_log_impl(&dword_23C83A000, v14, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending artwork updated notification", (uint8_t *)v16, 8u);
  }

  uint64_t v15 = [v13 data];
  [(RMSIDSServer *)self _sendData:v15 type:13 timeout:(int)*MEMORY[0x263F49E68] queueOneID:0 inResponseTo:0];
}

- (void)controlSession:(id)a3 didUpdateAudioRoutes:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  id v9 = +[RMSAudioRoute protobufsFromAudioRoutes:v6];

  uint64_t v10 = [(RMSSessionManager *)self->_sessionManager identifierForSession:v7];
  uint64_t v11 = (void *)[v9 mutableCopy];
  [v8 setAudioRoutes:v11];

  [v8 setSessionIdentifier:v10];
  uint64_t v12 = RMSLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v10;
    _os_log_impl(&dword_23C83A000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending audio routes update", (uint8_t *)v14, 8u);
  }

  __int16 v13 = [v8 data];
  [(RMSIDSServer *)self _sendData:v13 type:14 timeout:(int)*MEMORY[0x263F49E68] queueOneID:@"AudioRoutes" inResponseTo:0];
}

- (void)controlSession:(id)a3 didUpdateVolume:(float)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(RMSSessionManager *)self->_sessionManager identifierForSession:a3];
  id v7 = objc_opt_new();
  *(float *)&double v8 = a4;
  [v7 setVolume:v8];
  [v7 setSessionIdentifier:v6];
  id v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v6;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending volume update", (uint8_t *)v11, 8u);
  }

  uint64_t v10 = [v7 data];
  [(RMSIDSServer *)self _sendData:v10 type:15 timeout:10 queueOneID:@"Volume" inResponseTo:0];
}

- (void)controlSessionDidBeginEditingText:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(RMSSessionManager *)self->_sessionManager identifierForSession:a3];
  uint64_t v5 = objc_opt_new();
  [v5 setSessionIdentifier:v4];
  uint64_t v6 = RMSLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl(&dword_23C83A000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending did begin editing text notification", (uint8_t *)v8, 8u);
  }

  id v7 = [v5 data];
  [(RMSIDSServer *)self _sendData:v7 type:42 timeout:(int)*MEMORY[0x263F49E68] queueOneID:0 inResponseTo:0];
}

- (void)controlSessionDidEndEditingText:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(RMSSessionManager *)self->_sessionManager identifierForSession:a3];
  uint64_t v5 = objc_opt_new();
  [v5 setSessionIdentifier:v4];
  uint64_t v6 = RMSLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl(&dword_23C83A000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending did begin editing text notification", (uint8_t *)v8, 8u);
  }

  id v7 = [v5 data];
  [(RMSIDSServer *)self _sendData:v7 type:43 timeout:(int)*MEMORY[0x263F49E68] queueOneID:0 inResponseTo:0];
}

- (void)controlSessionDidEnd:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(RMSSessionManager *)self->_sessionManager identifierForSession:v4];

  if (v6)
  {
    [v5 setSessionIdentifier:v6];
    id v7 = RMSLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl(&dword_23C83A000, v7, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending control session ended", (uint8_t *)v9, 8u);
    }

    double v8 = [v5 data];
    [(RMSIDSServer *)self _sendData:v8 type:37 timeout:(int)*MEMORY[0x263F49E68] queueOneID:0 inResponseTo:0];

    [(RMSSessionManager *)self->_sessionManager endSessionWithIdentifier:v6 completionHandler:0];
  }
}

- (void)pairingSession:(id)a3 didPairWithServiceNetworkName:(id)a4 pairingGUID:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  sessionManager = self->_sessionManager;
  id v10 = a5;
  uint64_t v11 = [(RMSSessionManager *)sessionManager identifierForSession:a3];
  uint64_t v12 = objc_opt_new();
  [v12 setServiceNetworkName:v8];
  [v12 setPairingGUID:v10];

  [v12 setSessionIdentifier:v11];
  __int16 v13 = RMSLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109378;
    v15[1] = v11;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_23C83A000, v13, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending pairing success with service network name: %@", (uint8_t *)v15, 0x12u);
  }

  uint64_t v14 = [v12 data];
  [(RMSIDSServer *)self _sendData:v14 type:29 timeout:(int)*MEMORY[0x263F49E68] queueOneID:0 inResponseTo:0];
}

- (void)pairingSessionDidFail:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(RMSSessionManager *)self->_sessionManager identifierForSession:a3];
  uint64_t v5 = objc_opt_new();
  [v5 setSessionIdentifier:v4];
  [(RMSSessionManager *)self->_sessionManager endSessionWithIdentifier:v4 completionHandler:0];
  uint64_t v6 = RMSLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl(&dword_23C83A000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending pairing session failed message", (uint8_t *)v8, 8u);
  }

  id v7 = [v5 data];
  [(RMSIDSServer *)self _sendData:v7 type:30 timeout:(int)*MEMORY[0x263F49E68] queueOneID:0 inResponseTo:0];
}

- (void)sessionManager:(id)a3 sessionDidTimeout:(id)a4 withIdentifier:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = objc_opt_new();
  [v8 setSessionIdentifier:v5];
  uint64_t v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109120;
    int v15 = v5;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending session ended due to timeout", buf, 8u);
  }

  id v10 = [v8 data];
  [(RMSIDSServer *)self _sendData:v10 type:37 timeout:(int)*MEMORY[0x263F49E68] queueOneID:0 inResponseTo:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    _DWORD v11[2] = __64__RMSIDSServer_sessionManager_sessionDidTimeout_withIdentifier___block_invoke;
    v11[3] = &unk_264E74990;
    int v13 = v5;
    id v12 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
}

uint64_t __64__RMSIDSServer_sessionManager_sessionDidTimeout_withIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = RMSLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_23C83A000, v2, OS_LOG_TYPE_DEFAULT, "[Session %d] Ending discovery session on main queue", (uint8_t *)v5, 8u);
  }

  return [*(id *)(a1 + 32) endDiscovery];
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v7 = a5;
  id v8 = RMSLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[RMSIDSClient service:account:incomingUnhandledProtobuf:fromID:context:](v7, v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_touchRemoteSessions, 0);
  objc_storeStrong((id *)&self->_pairingSessions, 0);
  objc_storeStrong((id *)&self->_nowPlayingSessions, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
}

- (void)_sendData:(NSObject *)a3 type:priority:timeout:queueOneID:inResponseTo:.cold.1(unsigned __int16 a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSStringFromRMSMessageType(a1);
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_23C83A000, a3, OS_LOG_TYPE_ERROR, "Error sending message of type %@: %@", (uint8_t *)&v6, 0x16u);
}

@end