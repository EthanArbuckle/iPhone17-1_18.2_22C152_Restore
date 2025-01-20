@interface TVRMSIDSServer
+ (id)server;
- (TVRMSIDSServer)init;
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
- (void)_handlePickAudioRoute:(id)a3;
- (void)_handlePlaybackCommand:(id)a3;
- (void)_handleSeekToPlaybackTime:(id)a3;
- (void)_handleSessionHeartbeat:(id)a3;
- (void)_handleSetLikeState:(id)a3;
- (void)_handleSetVolume:(id)a3;
- (void)_handleTouchEnd:(id)a3;
- (void)_handleTouchMove:(id)a3;
- (void)_handleUpdatePairedNetworkNames:(id)a3;
- (void)_sendData:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 timeout:(int)a6 queueOneID:(id)a7 inResponseTo:(id)a8;
- (void)_sendData:(id)a3 type:(unsigned __int16)a4 timeout:(int)a5 queueOneID:(id)a6 inResponseTo:(id)a7;
- (void)controlSession:(id)a3 artworkDataDidBecomeAvailable:(id)a4 identifier:(id)a5;
- (void)controlSession:(id)a3 didUpdateAudioRoutes:(id)a4;
- (void)controlSession:(id)a3 didUpdateNowPlayingInfo:(id)a4;
- (void)controlSession:(id)a3 didUpdateVolume:(float)a4;
- (void)controlSessionDidEnd:(id)a3;
- (void)discoverySessionDidUpdateAvailableServices:(id)a3;
- (void)discoverySessionNetworkAvailabilityDidChange:(id)a3;
- (void)pairingSession:(id)a3 didPairWithServiceNetworkName:(id)a4 pairingGUID:(id)a5;
- (void)pairingSessionDidFail:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)sessionManager:(id)a3 sessionDidTimeout:(int)a4;
@end

@implementation TVRMSIDSServer

+ (id)server
{
  if (server_onceToken != -1) {
    dispatch_once(&server_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)server_server;

  return v2;
}

uint64_t __24__TVRMSIDSServer_server__block_invoke()
{
  server_server = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (TVRMSIDSServer)init
{
  v17.receiver = self;
  v17.super_class = (Class)TVRMSIDSServer;
  v2 = [(TVRMSIDSServer *)&v17 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sessionManager = v2->_sessionManager;
    v2->_sessionManager = (TVRMSSessionManager *)v3;

    [(TVRMSSessionManager *)v2->_sessionManager setDelegate:v2];
    uint64_t v5 = objc_opt_new();
    nowPlayingSessions = v2->_nowPlayingSessions;
    v2->_nowPlayingSessions = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    pairingSessions = v2->_pairingSessions;
    v2->_pairingSessions = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    touchRemoteSessions = v2->_touchRemoteSessions;
    v2->_touchRemoteSessions = (NSMutableDictionary *)v9;

    v11 = [(TVRMSSessionManager *)v2->_sessionManager persistedSessionIdentifiers];
    uint64_t v12 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.remotemediaservices"];
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v12;

    [(IDSService *)v2->_idsService setProtobufAction:sel__handleSessionHeartbeat_ forIncomingRequestsOfType:16];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleBeginDiscovery_ forIncomingRequestsOfType:1];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleEndDiscovery_ forIncomingRequestsOfType:3];
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
    v14 = v2->_idsService;
    v15 = dispatch_get_global_queue(25, 0);
    [(IDSService *)v14 addDelegate:v2 queue:v15];

    [(TVRMSIDSServer *)v2 _cleanupStaleSessions:v11];
  }
  return v2;
}

- (void)_handleSessionHeartbeat:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [TVRMSSessionMessage alloc];
  v6 = [v4 data];
  uint64_t v7 = [(TVRMSSessionMessage *)v5 initWithData:v6];

  uint64_t v8 = [(TVRMSSessionMessage *)v7 sessionIdentifier];
  uint64_t v9 = [(TVRMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  v10 = objc_opt_new();
  v11 = _TVRCRMSLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      int v15 = 67109120;
      int v16 = v8;
      _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Received heartbeat", (uint8_t *)&v15, 8u);
    }

    [(TVRMSSessionManager *)self->_sessionManager refreshSessionWithIdentifier:v8];
    uint64_t v13 = 1;
  }
  else
  {
    if (v12)
    {
      int v15 = 67109120;
      int v16 = v8;
      _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Received heartbeat, but session was no longer active - respond with timeout error", (uint8_t *)&v15, 8u);
    }

    uint64_t v13 = 4294967293;
  }
  [v10 setResponseCode:v13];
  v14 = [v10 data];
  [(TVRMSIDSServer *)self _sendData:v14 type:17 timeout:10 queueOneID:0 inResponseTo:v4];
}

- (void)_handleBeginDiscovery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Received request to begin discovery session", buf, 2u);
  }

  v6 = [TVRMSBeginDiscoveryMessage alloc];
  uint64_t v7 = [v4 data];
  uint64_t v8 = [(TVRMSBeginDiscoveryMessage *)v6 initWithData:v7];

  uint64_t v9 = objc_opt_new();
  objc_msgSend(v9, "setDiscoveryTypes:", -[TVRMSBeginDiscoveryMessage discoveryTypes](v8, "discoveryTypes"));
  [v9 setDelegate:self];
  if ([(TVRMSBeginDiscoveryMessage *)v8 hasPairedNetworkNames])
  {
    v10 = _TVRCRMSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Client supplied a list of paired network names, use this for filtering discovery", buf, 2u);
    }

    v11 = [(TVRMSBeginDiscoveryMessage *)v8 pairedNetworkNames];
    [v9 setPairedNetworkNames:v11];
  }
  uint64_t v12 = (int)*(double *)&TVRMSDiscoverySessionTimeout;
  sessionManager = self->_sessionManager;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __40__TVRMSIDSServer__handleBeginDiscovery___block_invoke;
  v16[3] = &unk_2647AEFA0;
  v16[4] = self;
  id v17 = v4;
  id v18 = v9;
  id v14 = v9;
  id v15 = v4;
  [(TVRMSSessionManager *)sessionManager beginSession:v14 timeout:v12 shouldTakePowerAssertion:1 completionHandler:v16];
}

void __40__TVRMSIDSServer__handleBeginDiscovery___block_invoke(uint64_t a1, int a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__TVRMSIDSServer__handleBeginDiscovery___block_invoke_2;
  v4[3] = &unk_2647AEF78;
  int v7 = a2;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __40__TVRMSIDSServer__handleBeginDiscovery___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  [v2 setSessionIdentifier:*(unsigned int *)(a1 + 56)];
  uint64_t v3 = _TVRCRMSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(_DWORD *)(a1 + 56);
    int v9 = 67109120;
    int v10 = v4;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending begin discovery response", (uint8_t *)&v9, 8u);
  }

  id v5 = *(void **)(a1 + 32);
  id v6 = [v2 data];
  [v5 _sendData:v6 type:2 timeout:10 queueOneID:0 inResponseTo:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) beginDiscovery];
  if (([*(id *)(a1 + 48) isNetworkAvailable] & 1) == 0)
  {
    int v7 = _TVRCRMSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(_DWORD *)(a1 + 56);
      int v9 = 67109120;
      int v10 = v8;
      _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "[Session %d] Network not available, immediately notify client", (uint8_t *)&v9, 8u);
    }

    [*(id *)(a1 + 32) discoverySessionNetworkAvailabilityDidChange:*(void *)(a1 + 48)];
  }
}

- (void)_handleUpdatePairedNetworkNames:(id)a3
{
  id v4 = a3;
  id v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Received request to update paired network names", v11, 2u);
  }

  id v6 = [TVRMSUpdatePairedNetworNamesMessage alloc];
  int v7 = [v4 data];

  int v8 = [(TVRMSUpdatePairedNetworNamesMessage *)v6 initWithData:v7];
  int v9 = [(TVRMSSessionManager *)self->_sessionManager sessionWithIdentifier:[(TVRMSUpdatePairedNetworNamesMessage *)v8 sessionIdentifier]];
  int v10 = [(TVRMSUpdatePairedNetworNamesMessage *)v8 pairedNetworkNames];
  [v9 setPairedNetworkNames:v10];
}

- (void)_handleEndDiscovery:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSSessionMessage alloc];
  id v6 = [v4 data];

  int v7 = [(TVRMSSessionMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSSessionMessage *)v7 sessionIdentifier];
  int v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to end discovery session", (uint8_t *)v10, 8u);
  }

  [(TVRMSSessionManager *)self->_sessionManager endSessionWithIdentifier:v8 completionHandler:&__block_literal_global_56];
}

uint64_t __38__TVRMSIDSServer__handleEndDiscovery___block_invoke(uint64_t a1, void *a2)
{
  return [a2 endDiscovery];
}

- (void)_handleConnectToService:(id)a3
{
  id v4 = a3;
  id v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Received request to connect to service", buf, 2u);
  }

  id v6 = [TVRMSConnectToServiceMessage alloc];
  int v7 = [v4 data];
  uint64_t v8 = [(TVRMSConnectToServiceMessage *)v6 initWithData:v7];

  int v9 = objc_opt_new();
  [v9 setDelegate:self];
  sessionManager = self->_sessionManager;
  uint64_t v11 = (int)*(double *)&TVRMSDAAPControlSessionTimeout;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __42__TVRMSIDSServer__handleConnectToService___block_invoke;
  v15[3] = &unk_2647AF010;
  int v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v4;
  id v12 = v4;
  id v13 = v9;
  id v14 = v8;
  [(TVRMSSessionManager *)sessionManager beginSession:v13 timeout:v11 shouldTakePowerAssertion:0 completionHandler:v15];
}

void __42__TVRMSIDSServer__handleConnectToService___block_invoke(uint64_t a1, int a2)
{
  id v4 = [TVRMSService alloc];
  id v5 = [*(id *)(a1 + 32) service];
  id v6 = [(TVRMSService *)v4 initWithProtobuf:v5];

  int v7 = *(void **)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 32) pairingGUID];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __42__TVRMSIDSServer__handleConnectToService___block_invoke_2;
  v10[3] = &unk_2647AEFE8;
  int v12 = a2;
  int v9 = *(void **)(a1 + 56);
  v10[4] = *(void *)(a1 + 48);
  id v11 = v9;
  [v7 connectToService:v6 pairingGUID:v8 completionHandler:v10];
}

void __42__TVRMSIDSServer__handleConnectToService___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_opt_new();
  [v6 setResponseCode:a2];
  int v7 = [v5 protobuf];

  [v6 setControlInterface:v7];
  [v6 setSessionIdentifier:*(unsigned int *)(a1 + 48)];
  uint64_t v8 = _TVRCRMSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(_DWORD *)(a1 + 48);
    int v10 = NSStringFromRMSResponseCode(a2);
    v13[0] = 67109378;
    v13[1] = v9;
    __int16 v14 = 2112;
    id v15 = v10;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending connection result: %@", (uint8_t *)v13, 0x12u);
  }
  id v11 = *(void **)(a1 + 32);
  int v12 = [v6 data];
  [v11 _sendData:v12 type:6 priority:300 timeout:15 queueOneID:0 inResponseTo:*(void *)(a1 + 40)];
}

- (void)_handleLogout:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSSessionMessage alloc];
  id v6 = [v4 data];

  int v7 = [(TVRMSSessionMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSSessionMessage *)v7 sessionIdentifier];
  int v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for logout", (uint8_t *)v10, 8u);
  }

  [(TVRMSSessionManager *)self->_sessionManager endSessionWithIdentifier:v8 completionHandler:&__block_literal_global_64];
}

uint64_t __32__TVRMSIDSServer__handleLogout___block_invoke(uint64_t a1, void *a2)
{
  return [a2 logout];
}

- (void)_handlePlaybackCommand:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSPlaybackCommandMessage alloc];
  id v6 = [v4 data];

  int v7 = [(TVRMSPlaybackCommandMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSPlaybackCommandMessage *)v7 sessionIdentifier];
  int v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for playback command", (uint8_t *)v11, 8u);
  }

  int v10 = [(TVRMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_msgSend(v10, "sendPlaybackCommand:completionHandler:", -[TVRMSPlaybackCommandMessage playbackCommand](v7, "playbackCommand"), 0);
}

- (void)_handleBeginObservingNowPlaying:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSSessionMessage alloc];
  id v6 = [v4 data];
  int v7 = [(TVRMSSessionMessage *)v5 initWithData:v6];

  uint64_t v8 = [(TVRMSSessionMessage *)v7 sessionIdentifier];
  int v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to begin observing now playing", (uint8_t *)v13, 8u);
  }

  int v10 = [(TVRMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  [v10 beginObservingNowPlaying];
  uint64_t v11 = objc_opt_new();
  [v11 setResponseCode:1];
  uint64_t v12 = [v11 data];
  [(TVRMSIDSServer *)self _sendData:v12 type:10 timeout:15 queueOneID:0 inResponseTo:v4];
}

- (void)_handleEndObservingNowPlaying:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSSessionMessage alloc];
  id v6 = [v4 data];

  int v7 = [(TVRMSSessionMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSSessionMessage *)v7 sessionIdentifier];
  int v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to end observing now playing session", (uint8_t *)v11, 8u);
  }

  int v10 = [(TVRMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  [v10 endObservingNowPlaying];
}

- (void)_handlePickAudioRoute:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSPickAudioRouteMessage alloc];
  id v6 = [v4 data];
  int v7 = [(TVRMSPickAudioRouteMessage *)v5 initWithData:v6];

  uint64_t v8 = [(TVRMSPickAudioRouteMessage *)v7 sessionIdentifier];
  int v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to pick audio route", (uint8_t *)&buf, 8u);
  }

  int v10 = objc_opt_new();
  objc_msgSend(v10, "setMacAddress:", -[TVRMSPickAudioRouteMessage macAddress](v7, "macAddress"));
  uint64_t v11 = [(TVRMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_initWeak(&buf, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  _DWORD v13[2] = __40__TVRMSIDSServer__handlePickAudioRoute___block_invoke;
  v13[3] = &unk_2647AF058;
  int v16 = v8;
  objc_copyWeak(&v15, &buf);
  id v12 = v4;
  id v14 = v12;
  [v11 pickAudioRoute:v10 completionHandler:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&buf);
}

void __40__TVRMSIDSServer__handlePickAudioRoute___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  [v4 setResponseCode:a2];
  id v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(_DWORD *)(a1 + 48);
    int v7 = NSStringFromRMSResponseCode(a2);
    v10[0] = 67109378;
    v10[1] = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending pick route response: %@", (uint8_t *)v10, 0x12u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v9 = [v4 data];
  [WeakRetained _sendData:v9 type:19 timeout:30 queueOneID:0 inResponseTo:*(void *)(a1 + 32)];
}

- (void)_handleSetVolume:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSSetVolumeMessage alloc];
  int v6 = [v4 data];

  int v7 = [(TVRMSSetVolumeMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSSetVolumeMessage *)v7 sessionIdentifier];
  int v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to set volume", (uint8_t *)v11, 8u);
  }

  int v10 = [(TVRMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  [(TVRMSSetVolumeMessage *)v7 volume];
  objc_msgSend(v10, "setVolume:completionHandler:", 0);
}

- (void)_handleSeekToPlaybackTime:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSSeekToPlaybackTimeMessage alloc];
  int v6 = [v4 data];

  int v7 = [(TVRMSSeekToPlaybackTimeMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSSeekToPlaybackTimeMessage *)v7 sessionIdentifier];
  int v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received message to seek to playbacktime", (uint8_t *)v11, 8u);
  }

  int v10 = [(TVRMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_msgSend(v10, "seekToPlaybackTime:completionHandler:", -[TVRMSSeekToPlaybackTimeMessage playbackTime](v7, "playbackTime"), 0);
}

- (void)_handleNowPlayingArtworkRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSNowPlayingArtworkRequestMessage alloc];
  int v6 = [v4 data];
  int v7 = [(TVRMSNowPlayingArtworkRequestMessage *)v5 initWithData:v6];

  uint64_t v8 = [(TVRMSNowPlayingArtworkRequestMessage *)v7 artworkIdentifier];
  int v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    uint64_t v22 = (uint64_t)v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "Received artwork request for identifier: %@", (uint8_t *)&v21, 0xCu);
  }

  int v10 = +[TVRMSNowPlayingArtworkCache sharedArtworkCache];
  __int16 v11 = [v10 artworkDataForIdentifier:v8];

  if (v11)
  {
    unsigned int v12 = [(TVRMSNowPlayingArtworkRequestMessage *)v7 width];
    unsigned int v13 = [(TVRMSNowPlayingArtworkRequestMessage *)v7 height];
    [(TVRMSNowPlayingArtworkRequestMessage *)v7 compressionQuality];
    int v15 = v14;
    int v16 = [MEMORY[0x263F1C6B0] imageWithData:v11];
    LODWORD(v17) = v15;
    uint64_t v18 = objc_msgSend(v16, "rms_jpegDataScaledToSize:compressionQuality:", (double)v12, (double)v13, v17);

    id v19 = _TVRCRMSLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v18 length];
      int v21 = 134217984;
      uint64_t v22 = v20;
      _os_log_impl(&dword_2266D3000, v19, OS_LOG_TYPE_DEFAULT, "Sending artwork, size=%td", (uint8_t *)&v21, 0xCu);
    }

    [(TVRMSIDSServer *)self _sendData:v18 type:25 timeout:(int)*MEMORY[0x263F4A150] queueOneID:@"ArtworkData" inResponseTo:v4];
  }
  else
  {
    uint64_t v18 = _TVRCRMSLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_2266D3000, v18, OS_LOG_TYPE_DEFAULT, "Artwork data not found", (uint8_t *)&v21, 2u);
    }
  }
}

- (void)_handleSetLikeState:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSSetLikeStateMessage alloc];
  int v6 = [v4 data];
  int v7 = [(TVRMSSetLikeStateMessage *)v5 initWithData:v6];

  uint64_t v8 = [(TVRMSSetLikeStateMessage *)v7 sessionIdentifier];
  int v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to set like state", (uint8_t *)&buf, 8u);
  }

  int v10 = [(TVRMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_initWeak(&buf, self);
  int v11 = [(TVRMSSetLikeStateMessage *)v7 likeState];
  uint64_t v12 = [(TVRMSSetLikeStateMessage *)v7 itemID];
  uint64_t v13 = [(TVRMSSetLikeStateMessage *)v7 databaseID];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__TVRMSIDSServer__handleSetLikeState___block_invoke;
  v15[3] = &unk_2647AF080;
  objc_copyWeak(&v17, &buf);
  id v14 = v4;
  id v16 = v14;
  [v10 setLikedState:v11 itemID:v12 databaseID:v13 completionHandler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&buf);
}

void __38__TVRMSIDSServer__handleSetLikeState___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  [v4 setResponseCode:a2];
  id v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromRMSResponseCode(a2);
    int v9 = 138412290;
    int v10 = v6;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Sending set like state response: %@", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = [v4 data];
  [WeakRetained _sendData:v8 type:32 timeout:15 queueOneID:0 inResponseTo:*(void *)(a1 + 32)];
}

- (void)_handleAddToWishlist:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSAddToWishlistMessage alloc];
  int v6 = [v4 data];
  int v7 = [(TVRMSAddToWishlistMessage *)v5 initWithData:v6];

  uint64_t v8 = [(TVRMSAddToWishlistMessage *)v7 sessionIdentifier];
  int v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to add to wishlist", (uint8_t *)&buf, 8u);
  }

  int v10 = [(TVRMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_initWeak(&buf, self);
  uint64_t v11 = [(TVRMSAddToWishlistMessage *)v7 itemID];
  uint64_t v12 = [(TVRMSAddToWishlistMessage *)v7 databaseID];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__TVRMSIDSServer__handleAddToWishlist___block_invoke;
  v14[3] = &unk_2647AF080;
  objc_copyWeak(&v16, &buf);
  id v13 = v4;
  id v15 = v13;
  [v10 addToWishlist:v11 databaseID:v12 completionHandler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&buf);
}

void __39__TVRMSIDSServer__handleAddToWishlist___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  [v4 setResponseCode:a2];
  id v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = NSStringFromRMSResponseCode(a2);
    int v9 = 138412290;
    int v10 = v6;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Sending add to wishlist response: %@", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = [v4 data];
  [WeakRetained _sendData:v8 type:32 timeout:15 queueOneID:0 inResponseTo:*(void *)(a1 + 32)];
}

- (void)_handleTouchMove:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSTouchMessage alloc];
  int v6 = [v4 data];

  int v7 = [(TVRMSTouchMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSTouchMessage *)v7 sessionIdentifier];
  int v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for touch move", (uint8_t *)v11, 8u);
  }

  int v10 = [(TVRMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_msgSend(v10, "sendTouchMoveWithDirection:repeatCount:", -[TVRMSTouchMessage direction](v7, "direction"), -[TVRMSTouchMessage repeatCount](v7, "repeatCount"));
}

- (void)_handleTouchEnd:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSTouchMessage alloc];
  int v6 = [v4 data];

  int v7 = [(TVRMSTouchMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSTouchMessage *)v7 sessionIdentifier];
  int v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for touch end", (uint8_t *)v11, 8u);
  }

  int v10 = [(TVRMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_msgSend(v10, "sendTouchEndWithDirection:repeatCount:", -[TVRMSTouchMessage direction](v7, "direction"), -[TVRMSTouchMessage repeatCount](v7, "repeatCount"));
}

- (void)_handleNavigationCommand:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSNavigationCommandMessage alloc];
  int v6 = [v4 data];

  int v7 = [(TVRMSNavigationCommandMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSNavigationCommandMessage *)v7 sessionIdentifier];
  int v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request for navigation command", (uint8_t *)v11, 8u);
  }

  int v10 = [(TVRMSSessionManager *)self->_sessionManager sessionWithIdentifier:v8];
  objc_msgSend(v10, "sendNavigationCommand:", -[TVRMSNavigationCommandMessage navigationCommand](v7, "navigationCommand"));
}

- (void)_handleBeginPairing:(id)a3
{
  id v4 = a3;
  id v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Received request to begin pairing session", buf, 2u);
  }

  int v6 = [TVRMSBeginPairingMessage alloc];
  int v7 = [v4 data];
  uint64_t v8 = [(TVRMSBeginPairingMessage *)v6 initWithData:v7];

  int v9 = objc_opt_new();
  [v9 setDelegate:self];
  int v10 = [(TVRMSBeginPairingMessage *)v8 passcode];
  [v9 setPasscode:v10];

  uint64_t v11 = [(TVRMSBeginPairingMessage *)v8 appName];
  [v9 setAdvertisedAppName:v11];

  uint64_t v12 = [(TVRMSBeginPairingMessage *)v8 deviceName];
  [v9 setAdvertisedDeviceName:v12];

  id v13 = [(TVRMSBeginPairingMessage *)v8 deviceModel];
  [v9 setAdvertisedDeviceModel:v13];

  uint64_t v14 = (int)*(double *)&TVRMSPairingSessionTimeout;
  sessionManager = self->_sessionManager;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __38__TVRMSIDSServer__handleBeginPairing___block_invoke;
  v18[3] = &unk_2647AEFA0;
  id v19 = v9;
  uint64_t v20 = self;
  id v21 = v4;
  id v16 = v4;
  id v17 = v9;
  [(TVRMSSessionManager *)sessionManager beginSession:v17 timeout:v14 shouldTakePowerAssertion:1 completionHandler:v18];
}

void __38__TVRMSIDSServer__handleBeginPairing___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) beginPairing];
  id v4 = objc_opt_new();
  [v4 setSessionIdentifier:a2];
  [v4 setResponseCode:1];
  id v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending begin pairing response", (uint8_t *)v8, 8u);
  }

  int v6 = *(void **)(a1 + 40);
  int v7 = [v4 data];
  [v6 _sendData:v7 type:27 timeout:15 queueOneID:0 inResponseTo:*(void *)(a1 + 48)];
}

- (void)_handleEndPairing:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TVRMSSessionMessage alloc];
  int v6 = [v4 data];

  int v7 = [(TVRMSSessionMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSSessionMessage *)v7 sessionIdentifier];
  uint64_t v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received request to end pairing session", (uint8_t *)v10, 8u);
  }

  [(TVRMSSessionManager *)self->_sessionManager endSessionWithIdentifier:v8 completionHandler:&__block_literal_global_85];
}

uint64_t __36__TVRMSIDSServer__handleEndPairing___block_invoke(uint64_t a1, void *a2)
{
  return [a2 endPairing];
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
    uint64_t v8 = (int)*MEMORY[0x263F4A150];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        int v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_opt_new();
        objc_msgSend(v11, "setSessionIdentifier:", objc_msgSend(v10, "intValue"));
        uint64_t v12 = _TVRCRMSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = [v10 intValue];
          *(_DWORD *)id buf = 67109120;
          int v20 = v13;
          _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Session is stale, notifying client", buf, 8u);
        }

        uint64_t v14 = [v11 data];
        [(TVRMSIDSServer *)self _sendData:v14 type:37 timeout:v8 queueOneID:0 inResponseTo:0];
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
  v43[3] = *MEMORY[0x263EF8340];
  id v14 = a7;
  id v15 = a8;
  long long v16 = (objc_class *)MEMORY[0x263F4A228];
  id v17 = a3;
  long long v18 = (void *)[[v16 alloc] initWithProtobufData:v17 type:v11 isResponse:v15 != 0];

  id v19 = objc_alloc(MEMORY[0x263EFF9A0]);
  v42[0] = *MEMORY[0x263F49F80];
  int v20 = [NSNumber numberWithInt:v9];
  uint64_t v21 = *MEMORY[0x263F49ED8];
  v43[0] = v20;
  v43[1] = MEMORY[0x263EFFA88];
  uint64_t v22 = *MEMORY[0x263F49F20];
  v42[1] = v21;
  v42[2] = v22;
  v43[2] = MEMORY[0x263EFFA88];
  uint64_t v23 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];
  v24 = (void *)[v19 initWithDictionary:v23];

  if (v15)
  {
    v25 = [v15 context];
    v26 = [v25 outgoingResponseIdentifier];
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
  v29 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F4A148]];
  id v36 = 0;
  id v37 = 0;
  [(IDSService *)idsService sendProtobuf:v18 toDestinations:v29 priority:a5 options:v24 identifier:&v37 error:&v36];
  id v30 = v37;
  id v31 = v36;

  v32 = _TVRCRMSLog();
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    if (v33)
    {
      v34 = NSStringFromRMSMessageType(v11);
      *(_DWORD *)id buf = 138412546;
      v39 = v34;
      __int16 v40 = 2112;
      id v41 = v31;
      v35 = "Error sending message of type %@: %@";
LABEL_12:
      _os_log_impl(&dword_2266D3000, v32, OS_LOG_TYPE_DEFAULT, v35, buf, 0x16u);
    }
  }
  else if (v33)
  {
    v34 = NSStringFromRMSMessageType(v11);
    *(_DWORD *)id buf = 138412546;
    v39 = v34;
    __int16 v40 = 2112;
    id v41 = v30;
    v35 = "Sent message of type: %@, IDS identifier: %@";
    goto LABEL_12;
  }
}

- (void)discoverySessionDidUpdateAvailableServices:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 availableServices];
  uint64_t v6 = +[TVRMSService protobufsFromServices:v5];
  uint64_t v7 = [(TVRMSSessionManager *)self->_sessionManager identifierForSession:v4];

  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (void *)[v6 mutableCopy];
  [v8 setServices:v9];

  [v8 setSessionIdentifier:v7];
  int v10 = _TVRCRMSLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109378;
    v12[1] = v7;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending available services: %@", (uint8_t *)v12, 0x12u);
  }

  uint64_t v11 = [v8 data];
  [(TVRMSIDSServer *)self _sendData:v11 type:4 timeout:(int)*MEMORY[0x263F4A150] queueOneID:@"AvailableServices" inResponseTo:0];
}

- (void)discoverySessionNetworkAvailabilityDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(TVRMSSessionManager *)self->_sessionManager identifierForSession:v4];
  uint64_t v6 = objc_opt_new();
  [v6 setSessionIdentifier:v5];
  objc_msgSend(v6, "setWifiAvailable:", objc_msgSend(v4, "isNetworkAvailable"));
  uint64_t v7 = _TVRCRMSLog();
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
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending wifi availability message: %@", (uint8_t *)v11, 0x12u);
  }

  int v10 = [v6 data];
  [(TVRMSIDSServer *)self _sendData:v10 type:38 timeout:(int)*MEMORY[0x263F4A150] queueOneID:@"NetworkAvailability" inResponseTo:0];
}

- (void)controlSession:(id)a3 didUpdateNowPlayingInfo:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  sessionManager = self->_sessionManager;
  id v7 = a4;
  uint64_t v8 = [(TVRMSSessionManager *)sessionManager identifierForSession:a3];
  uint64_t v9 = objc_opt_new();
  int v10 = [v7 protobuf];

  [v9 setNowPlayingInfo:v10];
  [v9 setSessionIdentifier:v8];
  uint64_t v11 = _TVRCRMSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v8;
    _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending now playing info update", (uint8_t *)v13, 8u);
  }

  __int16 v12 = [v9 data];
  [(TVRMSIDSServer *)self _sendData:v12 type:12 timeout:(int)*MEMORY[0x263F4A150] queueOneID:@"NowPlayingInfo" inResponseTo:0];
}

- (void)controlSession:(id)a3 artworkDataDidBecomeAvailable:(id)a4 identifier:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  sessionManager = self->_sessionManager;
  id v8 = a5;
  uint64_t v9 = [(TVRMSSessionManager *)sessionManager identifierForSession:a3];
  int v10 = objc_opt_new();
  [v10 setSessionIdentifier:v9];
  [v10 setArtworkIdentifier:v8];

  uint64_t v11 = _TVRCRMSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v9;
    _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending artwork updated notification", (uint8_t *)v13, 8u);
  }

  __int16 v12 = [v10 data];
  [(TVRMSIDSServer *)self _sendData:v12 type:13 timeout:(int)*MEMORY[0x263F4A150] queueOneID:0 inResponseTo:0];
}

- (void)controlSession:(id)a3 didUpdateAudioRoutes:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  uint64_t v9 = +[TVRMSAudioRoute protobufsFromAudioRoutes:v6];

  uint64_t v10 = [(TVRMSSessionManager *)self->_sessionManager identifierForSession:v7];
  uint64_t v11 = (void *)[v9 mutableCopy];
  [v8 setAudioRoutes:v11];

  [v8 setSessionIdentifier:v10];
  __int16 v12 = _TVRCRMSLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v10;
    _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending audio routes update", (uint8_t *)v14, 8u);
  }

  __int16 v13 = [v8 data];
  [(TVRMSIDSServer *)self _sendData:v13 type:14 timeout:(int)*MEMORY[0x263F4A150] queueOneID:@"AudioRoutes" inResponseTo:0];
}

- (void)controlSession:(id)a3 didUpdateVolume:(float)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(TVRMSSessionManager *)self->_sessionManager identifierForSession:a3];
  id v7 = objc_opt_new();
  *(float *)&double v8 = a4;
  [v7 setVolume:v8];
  [v7 setSessionIdentifier:v6];
  uint64_t v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v6;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending volume update", (uint8_t *)v11, 8u);
  }

  uint64_t v10 = [v7 data];
  [(TVRMSIDSServer *)self _sendData:v10 type:15 timeout:10 queueOneID:@"Volume" inResponseTo:0];
}

- (void)controlSessionDidEnd:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(TVRMSSessionManager *)self->_sessionManager identifierForSession:v4];

  if (v6)
  {
    [v5 setSessionIdentifier:v6];
    id v7 = _TVRCRMSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending control session ended", (uint8_t *)v9, 8u);
    }

    double v8 = [v5 data];
    [(TVRMSIDSServer *)self _sendData:v8 type:37 timeout:(int)*MEMORY[0x263F4A150] queueOneID:0 inResponseTo:0];

    [(TVRMSSessionManager *)self->_sessionManager endSessionWithIdentifier:v6 completionHandler:0];
  }
}

- (void)pairingSession:(id)a3 didPairWithServiceNetworkName:(id)a4 pairingGUID:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  sessionManager = self->_sessionManager;
  id v10 = a5;
  uint64_t v11 = [(TVRMSSessionManager *)sessionManager identifierForSession:a3];
  uint64_t v12 = objc_opt_new();
  [v12 setServiceNetworkName:v8];
  [v12 setPairingGUID:v10];

  [v12 setSessionIdentifier:v11];
  __int16 v13 = _TVRCRMSLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109378;
    v15[1] = v11;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending pairing success with service network name: %@", (uint8_t *)v15, 0x12u);
  }

  uint64_t v14 = [v12 data];
  [(TVRMSIDSServer *)self _sendData:v14 type:29 timeout:(int)*MEMORY[0x263F4A150] queueOneID:0 inResponseTo:0];
}

- (void)pairingSessionDidFail:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(TVRMSSessionManager *)self->_sessionManager identifierForSession:a3];
  uint64_t v5 = objc_opt_new();
  [v5 setSessionIdentifier:v4];
  [(TVRMSSessionManager *)self->_sessionManager endSessionWithIdentifier:v4 completionHandler:0];
  uint64_t v6 = _TVRCRMSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending pairing session failed message", (uint8_t *)v8, 8u);
  }

  id v7 = [v5 data];
  [(TVRMSIDSServer *)self _sendData:v7 type:30 timeout:(int)*MEMORY[0x263F4A150] queueOneID:0 inResponseTo:0];
}

- (void)sessionManager:(id)a3 sessionDidTimeout:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_opt_new();
  [v6 setSessionIdentifier:v4];
  id v7 = _TVRCRMSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending session ended due to timeout", (uint8_t *)v9, 8u);
  }

  id v8 = [v6 data];
  [(TVRMSIDSServer *)self _sendData:v8 type:37 timeout:(int)*MEMORY[0x263F4A150] queueOneID:0 inResponseTo:0];
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = _TVRCRMSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = [v7 type];
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Unhandled message type: %d", (uint8_t *)v9, 8u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_touchRemoteSessions, 0);
  objc_storeStrong((id *)&self->_pairingSessions, 0);
  objc_storeStrong((id *)&self->_nowPlayingSessions, 0);

  objc_storeStrong((id *)&self->_sessionManager, 0);
}

@end