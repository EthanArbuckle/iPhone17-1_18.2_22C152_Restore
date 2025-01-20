@interface RMSIDSClient
+ (id)sharedClient;
- (BOOL)_isCompanionAvailable;
- (BOOL)_isInMinimalConfiguration;
- (BOOL)isCompanionAvailable;
- (RMSIDSClient)init;
- (void)_handleAddToWishlistResponse:(id)a3;
- (void)_handleAudioRoutesDidUpdate:(id)a3;
- (void)_handleAvailableServicesDidUpdate:(id)a3;
- (void)_handleBeginDiscoverySessionResponse:(id)a3;
- (void)_handleBeginPairingSessionResponse:(id)a3;
- (void)_handleConnectToServiceResponse:(id)a3;
- (void)_handleDidBeginEditingText:(id)a3;
- (void)_handleDidEndEditingText:(id)a3;
- (void)_handleNowPlayingArtworkAvailable:(id)a3;
- (void)_handleNowPlayingArtworkDataResponse:(id)a3;
- (void)_handleNowPlayingInfoDidUpdate:(id)a3;
- (void)_handlePairingChallengeRequest:(id)a3;
- (void)_handlePairingDidFail:(id)a3;
- (void)_handlePairingDidSucceed:(id)a3;
- (void)_handlePickAudioRouteResponse:(id)a3;
- (void)_handleResponseCodeMessage:(id)a3;
- (void)_handleSendTextResponse:(id)a3;
- (void)_handleSessionDidEnd:(id)a3;
- (void)_handleSetLikedStateResponse:(id)a3;
- (void)_handleTimeoutForMessageWithIdentifier:(id)a3;
- (void)_handleUnpairServiceResponse:(id)a3;
- (void)_handleVolumeDidUpdate:(id)a3;
- (void)_handleWifiAvailabilityDidChange:(id)a3;
- (void)_invokeArtworkDataResponseBlock:(id)a3 artworkData:(id)a4;
- (void)_invokeBeginDiscoveryResponseBlock:(id)a3 success:(BOOL)a4 session:(int)a5;
- (void)_invokeBeginPairingResponseBlock:(id)a3 responseCode:(int64_t)a4 session:(int)a5;
- (void)_invokeCompletePairingChallengeResponseBlock:(id)a3 responseCode:(int64_t)a4 controlInterface:(id)a5;
- (void)_invokeConnectToServiceResponseBlock:(id)a3 responseCode:(int64_t)a4 responseData:(int)a5 controlInterface:(id)a6 session:(int)a7;
- (void)_invokeResponseCodeResponseBlock:(id)a3 responseCode:(int64_t)a4;
- (void)_invokeSetTextResponseBlock:(id)a3 responseCode:(int64_t)a4 session:(int)a5;
- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 sendTimeout:(int)a5 responseTimeout:(int)a6 queueOneID:(id)a7 priority:(int64_t)a8 inResponseToProtobuf:(id)a9 responseBlock:(id)a10;
- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 sendTimeout:(int)a5 responseTimeout:(int)a6 queueOneID:(id)a7 priority:(int64_t)a8 responseBlock:(id)a9;
- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 timeout:(int)a5 queueOneID:(id)a6 priority:(int64_t)a7 inResponseToProtobuf:(id)a8;
- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 timeout:(int)a5 queueOneID:(id)a6 priority:(int64_t)a7 responseBlock:(id)a8;
- (void)_updateCompanionAvailability;
- (void)addToWishlist:(unint64_t)a3 databaseID:(unint64_t)a4 sessionIdentifier:(int)a5 completionHandler:(id)a6;
- (void)beginDiscoverySessionWithDiscoveryTypes:(int)a3 pairedNetworkNames:(id)a4 completionHandler:(id)a5;
- (void)beginObservingNowPlayingWithSessionIdentifier:(int)a3 completionHandler:(id)a4;
- (void)beginPairingSessionWithPasscode:(id)a3 appName:(id)a4 deviceName:(id)a5 deviceModel:(id)a6 completionHandler:(id)a7;
- (void)connectToService:(id)a3 pairingGUID:(id)a4 allowPairing:(BOOL)a5 completionHandler:(id)a6;
- (void)endDiscoverySession:(int)a3;
- (void)endObservingNowPlayingWithSessionIdentifier:(int)a3;
- (void)endPairingSession:(int)a3;
- (void)logoutWithSessionIdentifier:(int)a3;
- (void)pickAudioRouteWithMacAddress:(unint64_t)a3 sessionIdentifier:(int)a4 completionHandler:(id)a5;
- (void)requestArtworkDataForNowPlayingInfo:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 compressionQuality:(float)a6 completionHandler:(id)a7;
- (void)seekToPlaybackTime:(int)a3 sessionIdentifier:(int)a4;
- (void)sendHeartbeatWithSessionIdentifier:(int)a3 completionHandler:(id)a4;
- (void)sendNavigationCommand:(int64_t)a3 sessionIdentifier:(int)a4;
- (void)sendPlaybackCommand:(int64_t)a3 sessionIdentifier:(int)a4;
- (void)sendText:(id)a3 sessionIdentifier:(int)a4 completionHandler:(id)a5;
- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4 sessionIdentifier:(int)a5;
- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4 sessionIdentifier:(int)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setCompanionAvailable:(BOOL)a3;
- (void)setLikedState:(int64_t)a3 itemID:(unint64_t)a4 databaseID:(unint64_t)a5 sessionIdentifier:(int)a6 completionHandler:(id)a7;
- (void)setVolume:(float)a3 sessionIdentifier:(int)a4;
- (void)unpairService:(id)a3 sessionIdentifier:(int)a4 completionHandler:(id)a5;
- (void)updatePairedNetworkNames:(id)a3 sessionIdentifier:(int)a4;
@end

@implementation RMSIDSClient

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1) {
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedClient_sharedConnectionManager;
  return v2;
}

uint64_t __28__RMSIDSClient_sharedClient__block_invoke()
{
  sharedClient_sharedConnectionManager = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (RMSIDSClient)init
{
  v12.receiver = self;
  v12.super_class = (Class)RMSIDSClient;
  v2 = [(RMSIDSClient *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    messageRecords = v2->_messageRecords;
    v2->_messageRecords = (NSMutableDictionary *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.remotemediaservices"];
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.remotemediaservices.ids", 0);
    idsDispatchQueue = v2->_idsDispatchQueue;
    v2->_idsDispatchQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = dispatch_get_global_queue(33, 0);
    idsOutgoingQueue = v2->_idsOutgoingQueue;
    v2->_idsOutgoingQueue = (OS_dispatch_queue *)v9;

    [(IDSService *)v2->_idsService setProtobufAction:sel__handleAvailableServicesDidUpdate_ forIncomingRequestsOfType:4];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handlePairingChallengeRequest_ forIncomingRequestsOfType:40];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleNowPlayingInfoDidUpdate_ forIncomingRequestsOfType:12];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleNowPlayingArtworkAvailable_ forIncomingRequestsOfType:13];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleAudioRoutesDidUpdate_ forIncomingRequestsOfType:14];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleVolumeDidUpdate_ forIncomingRequestsOfType:15];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handlePairingDidSucceed_ forIncomingRequestsOfType:29];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handlePairingDidFail_ forIncomingRequestsOfType:30];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleSessionDidEnd_ forIncomingRequestsOfType:37];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleWifiAvailabilityDidChange_ forIncomingRequestsOfType:38];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleDidBeginEditingText_ forIncomingRequestsOfType:42];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleDidEndEditingText_ forIncomingRequestsOfType:43];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleBeginDiscoverySessionResponse_ forIncomingResponsesOfType:2];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleConnectToServiceResponse_ forIncomingResponsesOfType:6];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleNowPlayingArtworkDataResponse_ forIncomingResponsesOfType:25];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleBeginPairingSessionResponse_ forIncomingResponsesOfType:27];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleHeartbeatResponse_ forIncomingResponsesOfType:17];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handlePickAudioRouteResponse_ forIncomingResponsesOfType:19];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleSetLikedStateResponse_ forIncomingResponsesOfType:32];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleBeginObservingNowPlayingResponse_ forIncomingResponsesOfType:10];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleSendTextResponse_ forIncomingResponsesOfType:45];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleUnpairServiceResponse_ forIncomingResponsesOfType:47];
    [(IDSService *)v2->_idsService addDelegate:v2 queue:v2->_idsDispatchQueue];
    v2->_companionAvailable = 1;
    [(RMSIDSClient *)v2 _updateCompanionAvailability];
  }
  return v2;
}

- (void)beginDiscoverySessionWithDiscoveryTypes:(int)a3 pairedNetworkNames:(id)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  id v12 = (id)objc_opt_new();
  [v12 setDiscoveryTypes:v6];
  v10 = (void *)[v9 mutableCopy];

  [v12 setPairedNetworkNames:v10];
  [v12 setHasPairedNetworkNames:1];
  v11 = (void *)MEMORY[0x23ECE8BF0](v8);

  [(RMSIDSClient *)self _sendMessage:v12 type:1 timeout:10 queueOneID:0 priority:200 responseBlock:v11];
}

- (void)updatePairedNetworkNames:(id)a3 sessionIdentifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v8 = (id)objc_opt_new();
  [v8 setSessionIdentifier:v4];
  dispatch_queue_t v7 = (void *)[v6 mutableCopy];

  [v8 setPairedNetworkNames:v7];
  [(RMSIDSClient *)self _sendMessage:v8 type:39 timeout:10 queueOneID:@"UpdatePairedNetworkNames" priority:200 responseBlock:0];
}

- (void)_handleBeginDiscoverySessionResponse:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSessionMessage alloc];
  id v6 = [v4 data];
  dispatch_queue_t v7 = [(RMSSessionMessage *)v5 initWithData:v6];

  id v8 = [v4 context];

  id v9 = [v8 incomingResponseIdentifier];

  uint64_t v10 = [(RMSSessionMessage *)v7 sessionIdentifier];
  v11 = RMSLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v10;
    _os_log_impl(&dword_23C83A000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Received begin discovery response", (uint8_t *)v12, 8u);
  }

  [(RMSIDSClient *)self _invokeBeginDiscoveryResponseBlock:v9 success:1 session:v10];
}

- (void)_invokeBeginDiscoveryResponseBlock:(id)a3 success:(BOOL)a4 session:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_messageRecords, "objectForKeyedSubscript:");
  id v9 = [v8 responseBlock];

  if (v9)
  {
    v9[2](v9, v6, v5);
  }
  else if (v6)
  {
    [(RMSIDSClient *)self endDiscoverySession:v5];
  }
  [(NSMutableDictionary *)self->_messageRecords removeObjectForKey:v10];
}

- (void)_handleAvailableServicesDidUpdate:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSAvailableServicesDidUpdateMessage alloc];
  BOOL v6 = [v4 data];

  dispatch_queue_t v7 = [(RMSAvailableServicesDidUpdateMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSAvailableServicesDidUpdateMessage *)v7 sessionIdentifier];
  id v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received discovery available services update", (uint8_t *)v16, 8u);
  }

  id v10 = objc_opt_new();
  v11 = [NSNumber numberWithInt:v8];
  [v10 setObject:v11 forKeyedSubscript:@"RMSIDSClientSessionIdentifierNotificationKey"];

  id v12 = [(RMSAvailableServicesDidUpdateMessage *)v7 services];

  if (v12)
  {
    uint64_t v13 = [(RMSAvailableServicesDidUpdateMessage *)v7 services];
    v14 = +[RMSService servicesFromProtobufs:v13];

    [v10 setObject:v14 forKeyedSubscript:@"RMSIDSClientAvailableServicesNotificationKey"];
  }
  v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 postNotificationName:@"RMSIDSClientAvailableServicesDidUpdateNotification" object:self userInfo:v10];
}

- (void)endDiscoverySession:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_new();
  [v5 setSessionIdentifier:v3];
  BOOL v6 = RMSLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_23C83A000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending end discovery message", (uint8_t *)v7, 8u);
  }

  [(RMSIDSClient *)self _sendMessage:v5 type:3 timeout:(int)*MEMORY[0x263F49E68] queueOneID:0 priority:200 responseBlock:0];
}

- (void)sendHeartbeatWithSessionIdentifier:(int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_queue_t v7 = objc_opt_new();
  [v7 setSessionIdentifier:v4];
  uint64_t v8 = RMSLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_23C83A000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending heartbeat message", (uint8_t *)v10, 8u);
  }

  id v9 = (void *)MEMORY[0x23ECE8BF0](v6);
  [(RMSIDSClient *)self _sendMessage:v7 type:16 timeout:20 queueOneID:0 priority:300 responseBlock:v9];
}

- (void)connectToService:(id)a3 pairingGUID:(id)a4 allowPairing:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v15 = (id)objc_opt_new();
  uint64_t v13 = [v12 protobuf];

  [v15 setService:v13];
  [v15 setPairingGUID:v11];

  [v15 setAllowPairing:v6];
  v14 = (void *)MEMORY[0x23ECE8BF0](v10);

  [(RMSIDSClient *)self _sendMessage:v15 type:5 sendTimeout:15 responseTimeout:60 queueOneID:0 priority:300 responseBlock:v14];
}

- (void)_handleConnectToServiceResponse:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSConnectToServiceResponseMessage alloc];
  BOOL v6 = [v4 data];
  dispatch_queue_t v7 = [(RMSConnectToServiceResponseMessage *)v5 initWithData:v6];

  uint64_t v8 = [RMSControlInterface alloc];
  id v9 = [(RMSConnectToServiceResponseMessage *)v7 controlInterface];
  id v10 = [(RMSControlInterface *)v8 initWithProtobuf:v9];

  uint64_t v11 = [(RMSConnectToServiceResponseMessage *)v7 sessionIdentifier];
  id v12 = RMSLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = v11;
    _os_log_impl(&dword_23C83A000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Received connection response", (uint8_t *)v15, 8u);
  }

  uint64_t v13 = [v4 context];
  v14 = [v13 incomingResponseIdentifier];

  [(RMSIDSClient *)self _invokeConnectToServiceResponseBlock:v14 responseCode:[(RMSConnectToServiceResponseMessage *)v7 responseCode] responseData:[(RMSConnectToServiceResponseMessage *)v7 responseData] controlInterface:v10 session:v11];
}

- (void)_handlePairingChallengeRequest:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSPairingChallengeRequestMessage alloc];
  BOOL v6 = [v4 data];
  dispatch_queue_t v7 = [(RMSPairingChallengeRequestMessage *)v5 initWithData:v6];

  uint64_t v8 = [(RMSPairingChallengeRequestMessage *)v7 sessionIdentifier];
  id v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received pairing challenge request", (uint8_t *)&buf, 8u);
  }

  id v10 = [RMSPairingCredentials alloc];
  uint64_t v11 = [(RMSPairingChallengeRequestMessage *)v7 pairingCredentials];
  id v12 = [(RMSPairingCredentials *)v10 initWithProtobuf:v11];

  objc_initWeak(&buf, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __47__RMSIDSClient__handlePairingChallengeRequest___block_invoke;
  v19[3] = &unk_264E74348;
  int v22 = v8;
  objc_copyWeak(&v21, &buf);
  id v13 = v4;
  id v20 = v13;
  v14 = (void *)MEMORY[0x23ECE8BF0](v19);
  v23[0] = @"RMSIDSClientSessionIdentifierNotificationKey";
  id v15 = [NSNumber numberWithInt:v8];
  v24[0] = v15;
  v24[1] = v12;
  v23[1] = @"RMSIDSClientPairingCredentialsNotificationKey";
  v23[2] = @"RMSIDSClientPairingCompletionHandlerNotificationKey";
  uint64_t v16 = (void *)MEMORY[0x23ECE8BF0](v14);
  v24[2] = v16;
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];

  v18 = [MEMORY[0x263F08A00] defaultCenter];
  [v18 postNotificationName:@"RMSIDSClientDidReceivePairingChallengeRequestNotification" object:self userInfo:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&buf);
}

void __47__RMSIDSClient__handlePairingChallengeRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v7 = (id)objc_opt_new();
  [v7 setSessionIdentifier:*(unsigned int *)(a1 + 48)];
  [v7 setCode:v5];

  [v7 setUserCancelled:a3];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _sendMessage:v7 type:41 timeout:15 queueOneID:0 priority:300 inResponseToProtobuf:*(void *)(a1 + 32)];
}

- (void)logoutWithSessionIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = objc_opt_new();
  [v5 setSessionIdentifier:v3];
  BOOL v6 = RMSLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_23C83A000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending logout message", (uint8_t *)v7, 8u);
  }

  [(RMSIDSClient *)self _sendMessage:v5 type:7 timeout:(int)*MEMORY[0x263F49E68] queueOneID:0 priority:200 responseBlock:0];
}

- (void)_invokeConnectToServiceResponseBlock:(id)a3 responseCode:(int64_t)a4 responseData:(int)a5 controlInterface:(id)a6 session:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a5;
  id v15 = a3;
  id v12 = a6;
  id v13 = [(NSMutableDictionary *)self->_messageRecords objectForKeyedSubscript:v15];
  v14 = [v13 responseBlock];

  if (v14) {
    ((void (**)(void, int64_t, uint64_t, id, uint64_t))v14)[2](v14, a4, v9, v12, v7);
  }
  [(NSMutableDictionary *)self->_messageRecords removeObjectForKey:v15];
}

- (void)_invokeCompletePairingChallengeResponseBlock:(id)a3 responseCode:(int64_t)a4 controlInterface:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  uint64_t v9 = [(NSMutableDictionary *)self->_messageRecords objectForKeyedSubscript:v11];
  id v10 = [v9 responseBlock];

  if (v10) {
    ((void (**)(void, int64_t, id))v10)[2](v10, a4, v8);
  }
  [(NSMutableDictionary *)self->_messageRecords removeObjectForKey:v11];
}

- (void)sendPlaybackCommand:(int64_t)a3 sessionIdentifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_opt_new();
  [v7 setPlaybackCommand:a3];
  [v7 setSessionIdentifier:v4];
  id v8 = RMSLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_23C83A000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending playback command", (uint8_t *)v9, 8u);
  }

  [(RMSIDSClient *)self _sendMessage:v7 type:8 timeout:5 queueOneID:0 priority:300 responseBlock:0];
}

- (void)setVolume:(float)a3 sessionIdentifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_opt_new();
  *(float *)&double v8 = a3;
  [v7 setVolume:v8];
  [v7 setSessionIdentifier:v4];
  uint64_t v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending set volume message", (uint8_t *)v10, 8u);
  }

  [(RMSIDSClient *)self _sendMessage:v7 type:20 timeout:5 queueOneID:@"SetVolume" priority:300 responseBlock:0];
}

- (void)pickAudioRouteWithMacAddress:(unint64_t)a3 sessionIdentifier:(int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = objc_opt_new();
  [v9 setMacAddress:a3];
  [v9 setSessionIdentifier:v5];
  uint64_t v10 = RMSLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v5;
    _os_log_impl(&dword_23C83A000, v10, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending pick audio route message", (uint8_t *)v12, 8u);
  }

  uint64_t v11 = (void *)MEMORY[0x23ECE8BF0](v8);
  [(RMSIDSClient *)self _sendMessage:v9 type:18 timeout:30 queueOneID:0 priority:200 responseBlock:v11];
}

- (void)_handlePickAudioRouteResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "Received pick audio route response", v6, 2u);
  }

  [(RMSIDSClient *)self _handleResponseCodeMessage:v4];
}

- (void)seekToPlaybackTime:(int)a3 sessionIdentifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_opt_new();
  [v7 setPlaybackTime:v5];
  [v7 setSessionIdentifier:v4];
  id v8 = RMSLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_23C83A000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending seek to playback time message", (uint8_t *)v9, 8u);
  }

  [(RMSIDSClient *)self _sendMessage:v7 type:35 timeout:5 queueOneID:@"SeekToPlaybackTime" priority:300 responseBlock:0];
}

- (void)setLikedState:(int64_t)a3 itemID:(unint64_t)a4 databaseID:(unint64_t)a5 sessionIdentifier:(int)a6 completionHandler:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v12 = a7;
  uint64_t v13 = objc_opt_new();
  [v13 setLikeState:a3];
  [v13 setItemID:a4];
  [v13 setDatabaseID:a5];
  [v13 setSessionIdentifier:v7];
  v14 = RMSLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = v7;
    _os_log_impl(&dword_23C83A000, v14, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending set like state message", (uint8_t *)v16, 8u);
  }

  id v15 = (void *)MEMORY[0x23ECE8BF0](v12);
  [(RMSIDSClient *)self _sendMessage:v13 type:31 timeout:10 queueOneID:0 priority:200 responseBlock:v15];
}

- (void)_handleSetLikedStateResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "Received set like state response", v6, 2u);
  }

  [(RMSIDSClient *)self _handleResponseCodeMessage:v4];
}

- (void)addToWishlist:(unint64_t)a3 databaseID:(unint64_t)a4 sessionIdentifier:(int)a5 completionHandler:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v10 = a6;
  uint64_t v11 = objc_opt_new();
  [v11 setItemID:a3];
  [v11 setDatabaseID:a4];
  [v11 setSessionIdentifier:v6];
  id v12 = RMSLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v6;
    _os_log_impl(&dword_23C83A000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending add to wishlist message", (uint8_t *)v14, 8u);
  }

  uint64_t v13 = (void *)MEMORY[0x23ECE8BF0](v10);
  [(RMSIDSClient *)self _sendMessage:v11 type:33 timeout:10 queueOneID:0 priority:200 responseBlock:v13];
}

- (void)_handleAddToWishlistResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = RMSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_23C83A000, v5, OS_LOG_TYPE_DEFAULT, "Received add to wishlist response", v6, 2u);
  }

  [(RMSIDSClient *)self _handleResponseCodeMessage:v4];
}

- (void)beginObservingNowPlayingWithSessionIdentifier:(int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  [v7 setSessionIdentifier:v4];
  id v8 = RMSLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_23C83A000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending begin observing now playing message", (uint8_t *)v10, 8u);
  }

  uint64_t v9 = (void *)MEMORY[0x23ECE8BF0](v6);
  [(RMSIDSClient *)self _sendMessage:v7 type:9 timeout:10 queueOneID:0 priority:200 responseBlock:v9];
}

- (void)endObservingNowPlayingWithSessionIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_new();
  [v5 setSessionIdentifier:v3];
  id v6 = RMSLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_23C83A000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending end observing now playing message", (uint8_t *)v7, 8u);
  }

  [(RMSIDSClient *)self _sendMessage:v5 type:11 timeout:(int)*MEMORY[0x263F49E68] queueOneID:0 priority:200 responseBlock:0];
}

- (void)_handleAudioRoutesDidUpdate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSAudioRoutesDidUpdateMessage alloc];
  id v6 = [v4 data];

  uint64_t v7 = [(RMSAudioRoutesDidUpdateMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSAudioRoutesDidUpdateMessage *)v7 sessionIdentifier];
  uint64_t v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109120;
    int v18 = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received now playing audio routes update", buf, 8u);
  }

  id v10 = [(RMSAudioRoutesDidUpdateMessage *)v7 audioRoutes];
  uint64_t v11 = +[RMSAudioRoute audioRoutesFromProtobufs:v10];

  id v12 = objc_msgSend(NSNumber, "numberWithInt:", v8, @"RMSIDSClientSessionIdentifierNotificationKey");
  v15[1] = @"RMSIDSClientNowPlayingAudioRoutesNotificationKey";
  v16[0] = v12;
  v16[1] = v11;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 postNotificationName:@"RMSIDSClientNowPlayingAudioRoutesDidUpdateNotification" object:self userInfo:v13];
}

- (void)_handleVolumeDidUpdate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSVolumeDidUpdateMessage alloc];
  id v6 = [v4 data];

  uint64_t v7 = [(RMSVolumeDidUpdateMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSVolumeDidUpdateMessage *)v7 sessionIdentifier];
  uint64_t v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109120;
    int v18 = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received now playing volume update", buf, 8u);
  }

  id v10 = objc_msgSend(NSNumber, "numberWithInt:", v8, @"RMSIDSClientSessionIdentifierNotificationKey");
  v15[1] = @"RMSIDSClientNowPlayingVolumeNotificationKey";
  v16[0] = v10;
  uint64_t v11 = NSNumber;
  [(RMSVolumeDidUpdateMessage *)v7 volume];
  id v12 = objc_msgSend(v11, "numberWithFloat:");
  v16[1] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 postNotificationName:@"RMSIDSClientNowPlayingVolumeDidUpdateNotification" object:self userInfo:v13];
}

- (void)_handleNowPlayingInfoDidUpdate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSNowPlayingInfoDidUpdateMessage alloc];
  id v6 = [v4 data];

  uint64_t v7 = [(RMSNowPlayingInfoDidUpdateMessage *)v5 initWithData:v6];
  uint64_t v8 = [RMSNowPlayingInfo alloc];
  uint64_t v9 = [(RMSNowPlayingInfoDidUpdateMessage *)v7 nowPlayingInfo];
  id v10 = [(RMSNowPlayingInfo *)v8 initWithProtobuf:v9];

  uint64_t v11 = [(RMSNowPlayingInfoDidUpdateMessage *)v7 sessionIdentifier];
  id v12 = RMSLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109120;
    int v19 = v11;
    _os_log_impl(&dword_23C83A000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Received now playing info update", buf, 8u);
  }

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", v11, @"RMSIDSClientSessionIdentifierNotificationKey");
  v16[1] = @"RMSIDSClientNowPlayingInfoNotificationKey";
  v17[0] = v13;
  v17[1] = v10;
  v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 postNotificationName:@"RMSIDSClientNowPlayingInfoDidUpdateNotification" object:self userInfo:v14];
}

- (void)_handleNowPlayingArtworkAvailable:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSNowPlayingArtworkAvailableMessage alloc];
  id v6 = [v4 data];

  uint64_t v7 = [(RMSNowPlayingArtworkAvailableMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSNowPlayingArtworkAvailableMessage *)v7 sessionIdentifier];
  uint64_t v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109120;
    int v17 = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received now playing artwork update", buf, 8u);
  }

  id v10 = objc_msgSend(NSNumber, "numberWithInt:", v8, @"RMSIDSClientSessionIdentifierNotificationKey");
  v14[1] = @"RMSIDSClientNowPlayingArtworkIdentifierKey";
  v15[0] = v10;
  uint64_t v11 = [(RMSNowPlayingArtworkAvailableMessage *)v7 artworkIdentifier];
  v15[1] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 postNotificationName:@"RMSIDSClientNowPlayingArtworkDidBecomeAvailableNotification" object:self userInfo:v12];
}

- (void)requestArtworkDataForNowPlayingInfo:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 compressionQuality:(float)a6 completionHandler:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  id v12 = a7;
  id v13 = a3;
  id v17 = (id)objc_opt_new();
  v14 = [v13 artworkIdentifier];

  [v17 setArtworkIdentifier:v14];
  [v17 setWidth:v9];
  [v17 setHeight:v8];
  *(float *)&double v15 = a6;
  [v17 setCompressionQuality:v15];
  uint64_t v16 = (void *)MEMORY[0x23ECE8BF0](v12);

  [(RMSIDSClient *)self _sendMessage:v17 type:24 timeout:30 queueOneID:@"RequestArtworkData" priority:200 responseBlock:v16];
}

- (void)_handleNowPlayingArtworkDataResponse:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  uint64_t v7 = [v4 data];
  uint64_t v8 = RMSLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = [v7 length];
    _os_log_impl(&dword_23C83A000, v8, OS_LOG_TYPE_DEFAULT, "Received artwork data, length=%zd", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [v4 data];
  [(RMSIDSClient *)self _invokeArtworkDataResponseBlock:v6 artworkData:v9];
}

- (void)_invokeArtworkDataResponseBlock:(id)a3 artworkData:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_messageRecords objectForKeyedSubscript:v9];
  uint64_t v8 = [v7 responseBlock];

  if (v8) {
    ((void (**)(void, id))v8)[2](v8, v6);
  }
  [(NSMutableDictionary *)self->_messageRecords removeObjectForKey:v9];
}

- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4 sessionIdentifier:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v9 = objc_opt_new();
  [v9 setDirection:a3];
  [v9 setRepeatCount:v6];
  [v9 setSessionIdentifier:v5];
  int v10 = RMSLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v5;
    _os_log_impl(&dword_23C83A000, v10, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending touch move", (uint8_t *)v11, 8u);
  }

  [(RMSIDSClient *)self _sendMessage:v9 type:21 timeout:5 queueOneID:0 priority:300 responseBlock:0];
}

- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4 sessionIdentifier:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v9 = objc_opt_new();
  [v9 setDirection:a3];
  [v9 setRepeatCount:v6];
  [v9 setSessionIdentifier:v5];
  int v10 = RMSLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v5;
    _os_log_impl(&dword_23C83A000, v10, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending touch end", (uint8_t *)v11, 8u);
  }

  [(RMSIDSClient *)self _sendMessage:v9 type:22 timeout:5 queueOneID:0 priority:300 responseBlock:0];
}

- (void)sendNavigationCommand:(int64_t)a3 sessionIdentifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_opt_new();
  [v7 setNavigationCommand:a3];
  [v7 setSessionIdentifier:v4];
  uint64_t v8 = RMSLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_23C83A000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending navigation command message", (uint8_t *)v9, 8u);
  }

  [(RMSIDSClient *)self _sendMessage:v7 type:23 timeout:5 queueOneID:0 priority:300 responseBlock:0];
}

- (void)beginPairingSessionWithPasscode:(id)a3 appName:(id)a4 deviceName:(id)a5 deviceModel:(id)a6 completionHandler:(id)a7
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = objc_opt_new();
  [v17 setPasscode:v12];
  [v17 setAppName:v16];

  [v17 setDeviceName:v15];
  [v17 setDeviceModel:v14];

  uint64_t v18 = RMSLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v12;
    _os_log_impl(&dword_23C83A000, v18, OS_LOG_TYPE_DEFAULT, "Sending begin pairing message with passcode [%@]", (uint8_t *)&v20, 0xCu);
  }

  int v19 = (void *)MEMORY[0x23ECE8BF0](v13);
  [(RMSIDSClient *)self _sendMessage:v17 type:26 timeout:20 queueOneID:0 priority:200 responseBlock:v19];
}

- (void)endPairingSession:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_new();
  [v5 setSessionIdentifier:v3];
  uint64_t v6 = RMSLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_23C83A000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending end pairing message", (uint8_t *)v7, 8u);
  }

  [(RMSIDSClient *)self _sendMessage:v5 type:28 timeout:(int)*MEMORY[0x263F49E68] queueOneID:0 priority:200 responseBlock:0];
}

- (void)_handleBeginPairingSessionResponse:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSBeginPairingResponseMessage alloc];
  uint64_t v6 = [v4 data];
  uint64_t v7 = [(RMSBeginPairingResponseMessage *)v5 initWithData:v6];

  uint64_t v8 = [(RMSBeginPairingResponseMessage *)v7 sessionIdentifier];
  id v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received begin pairing response", (uint8_t *)v12, 8u);
  }

  uint64_t v10 = [v4 context];
  uint64_t v11 = [v10 incomingResponseIdentifier];

  [(RMSIDSClient *)self _invokeBeginPairingResponseBlock:v11 responseCode:[(RMSBeginPairingResponseMessage *)v7 responseCode] session:v8];
}

- (void)_invokeBeginPairingResponseBlock:(id)a3 responseCode:(int64_t)a4 session:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v10 = a3;
  uint64_t v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_messageRecords, "objectForKeyedSubscript:");
  id v9 = [v8 responseBlock];

  if (v9)
  {
    v9[2](v9, a4, v5);
  }
  else if (a4 == 1)
  {
    [(RMSIDSClient *)self endPairingSession:v5];
  }
  [(NSMutableDictionary *)self->_messageRecords removeObjectForKey:v10];
}

- (void)_handlePairingDidSucceed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSPairingSessionDidPairMessage alloc];
  uint64_t v6 = [v4 data];

  uint64_t v7 = [(RMSPairingSessionDidPairMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSPairingSessionDidPairMessage *)v7 sessionIdentifier];
  id v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109120;
    int v18 = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received successful pairing", buf, 8u);
  }

  id v10 = objc_msgSend(NSNumber, "numberWithInt:", v8, @"RMSIDSClientSessionIdentifierNotificationKey");
  v16[0] = v10;
  v15[1] = @"RMSIDSClientServiceNetworkNameNotificationKey";
  uint64_t v11 = [(RMSPairingSessionDidPairMessage *)v7 serviceNetworkName];
  v16[1] = v11;
  void v15[2] = @"RMSIDSClientPairingGUIDNotificationKey";
  id v12 = [(RMSPairingSessionDidPairMessage *)v7 pairingGUID];
  void v16[2] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

  id v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 postNotificationName:@"RMSIDSClientDidPairWithServiceNotification" object:self userInfo:v13];
}

- (void)_handlePairingDidFail:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSessionMessage alloc];
  uint64_t v6 = [v4 data];

  uint64_t v7 = [(RMSSessionMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSSessionMessage *)v7 sessionIdentifier];
  id v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109120;
    int v16 = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received failure pairing", buf, 8u);
  }

  id v10 = objc_msgSend(NSNumber, "numberWithInt:", v8, @"RMSIDSClientSessionIdentifierNotificationKey");
  id v14 = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  id v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotificationName:@"RMSIDSClientPairingDidFailNotification" object:self userInfo:v11];
}

- (void)unpairService:(id)a3 sessionIdentifier:(int)a4 completionHandler:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_opt_new();
  uint64_t v11 = [v9 protobuf];

  [v10 setService:v11];
  id v12 = RMSLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = a4;
    _os_log_impl(&dword_23C83A000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending unpair service message", (uint8_t *)v14, 8u);
  }

  uint64_t v13 = (void *)MEMORY[0x23ECE8BF0](v8);
  [(RMSIDSClient *)self _sendMessage:v10 type:46 timeout:10 queueOneID:0 priority:200 responseBlock:v13];
}

- (void)_handleSessionDidEnd:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSessionMessage alloc];
  uint64_t v6 = [v4 data];

  uint64_t v7 = [(RMSSessionMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSSessionMessage *)v7 sessionIdentifier];
  id v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109120;
    int v16 = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received session did end", buf, 8u);
  }

  id v10 = objc_msgSend(NSNumber, "numberWithInt:", v8, @"RMSIDSClientSessionIdentifierNotificationKey");
  id v14 = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  id v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotificationName:@"RMSIDSClientSessionDidEndNotification" object:self userInfo:v11];
}

- (void)_handleWifiAvailabilityDidChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSWifiAvailabilityDidChangeMessage alloc];
  uint64_t v6 = [v4 data];

  uint64_t v7 = [(RMSWifiAvailabilityDidChangeMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSWifiAvailabilityDidChangeMessage *)v7 sessionIdentifier];
  id v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = [(RMSWifiAvailabilityDidChangeMessage *)v7 wifiAvailable];
    uint64_t v11 = @"unavailable";
    if (v10) {
      uint64_t v11 = @"available";
    }
    *(_DWORD *)id buf = 67109378;
    int v19 = v8;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received wifi availability message: %@", buf, 0x12u);
  }

  id v12 = objc_msgSend(NSNumber, "numberWithInt:", v8, @"RMSIDSClientSessionIdentifierNotificationKey");
  v16[1] = @"RMSIDSClientWifiAvailabilityNotificationKey";
  v17[0] = v12;
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[RMSWifiAvailabilityDidChangeMessage wifiAvailable](v7, "wifiAvailable"));
  v17[1] = v13;
  id v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 postNotificationName:@"RMSIDSClientWifiAvailabilityDidChangeNotification" object:self userInfo:v14];
}

- (void)_handleDidBeginEditingText:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSessionMessage alloc];
  uint64_t v6 = [v4 data];

  uint64_t v7 = [(RMSSessionMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSSessionMessage *)v7 sessionIdentifier];
  id v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109120;
    int v16 = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received did begin editing text", buf, 8u);
  }

  BOOL v10 = objc_msgSend(NSNumber, "numberWithInt:", v8, @"RMSIDSClientSessionIdentifierNotificationKey");
  id v14 = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  id v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotificationName:@"RMSIDSClientDidBeginEditingTextNotification" object:self userInfo:v11];
}

- (void)_handleDidEndEditingText:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSessionMessage alloc];
  uint64_t v6 = [v4 data];

  uint64_t v7 = [(RMSSessionMessage *)v5 initWithData:v6];
  uint64_t v8 = [(RMSSessionMessage *)v7 sessionIdentifier];
  id v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109120;
    int v16 = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received did end editing text", buf, 8u);
  }

  BOOL v10 = objc_msgSend(NSNumber, "numberWithInt:", v8, @"RMSIDSClientSessionIdentifierNotificationKey");
  id v14 = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  id v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotificationName:@"RMSIDSClientDidEndEditingTextNotification" object:self userInfo:v11];
}

- (void)sendText:(id)a3 sessionIdentifier:(int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  BOOL v10 = objc_opt_new();
  [v10 setSessionIdentifier:v5];
  [v10 setText:v9];

  uint64_t v11 = RMSLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v5;
    _os_log_impl(&dword_23C83A000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending begin observing text input events", (uint8_t *)v14, 8u);
  }

  uint64_t v12 = (int)*MEMORY[0x263F49E68];
  uint64_t v13 = (void *)MEMORY[0x23ECE8BF0](v8);

  [(RMSIDSClient *)self _sendMessage:v10 type:44 timeout:v12 queueOneID:0 priority:200 responseBlock:v13];
}

- (void)_handleSendTextResponse:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [RMSSendTextResponseMessage alloc];
  uint64_t v6 = [v4 data];
  uint64_t v7 = [(RMSSendTextResponseMessage *)v5 initWithData:v6];

  uint64_t v8 = [(RMSSendTextResponseMessage *)v7 sessionIdentifier];
  id v9 = RMSLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v8;
    _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received send text response", (uint8_t *)v12, 8u);
  }

  BOOL v10 = [v4 context];
  uint64_t v11 = [v10 incomingResponseIdentifier];

  [(RMSIDSClient *)self _invokeSetTextResponseBlock:v11 responseCode:[(RMSSendTextResponseMessage *)v7 responseCode] session:v8];
}

- (void)_invokeSetTextResponseBlock:(id)a3 responseCode:(int64_t)a4 session:(int)a5
{
  id v9 = a3;
  uint64_t v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_messageRecords, "objectForKeyedSubscript:");
  uint64_t v8 = [v7 responseBlock];

  if (v8) {
    v8[2](v8, a4);
  }
  [(NSMutableDictionary *)self->_messageRecords removeObjectForKey:v9];
}

- (void)_handleUnpairServiceResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [RMSResponseCodeMessage alloc];
  uint64_t v6 = [v4 data];
  uint64_t v7 = [(RMSResponseCodeMessage *)v5 initWithData:v6];

  uint64_t v8 = RMSLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_23C83A000, v8, OS_LOG_TYPE_DEFAULT, "Received unpair service response", v11, 2u);
  }

  id v9 = [v4 context];
  BOOL v10 = [v9 incomingResponseIdentifier];

  [(RMSIDSClient *)self _invokeResponseCodeResponseBlock:v10 responseCode:[(RMSResponseCodeMessage *)v7 responseCode]];
}

- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 timeout:(int)a5 queueOneID:(id)a6 priority:(int64_t)a7 responseBlock:(id)a8
{
}

- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 sendTimeout:(int)a5 responseTimeout:(int)a6 queueOneID:(id)a7 priority:(int64_t)a8 responseBlock:(id)a9
{
}

- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 timeout:(int)a5 queueOneID:(id)a6 priority:(int64_t)a7 inResponseToProtobuf:(id)a8
{
}

- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 sendTimeout:(int)a5 responseTimeout:(int)a6 queueOneID:(id)a7 priority:(int64_t)a8 inResponseToProtobuf:(id)a9 responseBlock:(id)a10
{
  id v16 = a3;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  idsOutgoingQueue = self->_idsOutgoingQueue;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __117__RMSIDSClient__sendMessage_type_sendTimeout_responseTimeout_queueOneID_priority_inResponseToProtobuf_responseBlock___block_invoke;
  v25[3] = &unk_264E74398;
  unsigned __int16 v34 = a4;
  id v26 = v16;
  id v27 = v18;
  id v28 = v19;
  id v29 = v17;
  v30 = self;
  int64_t v31 = a8;
  int v32 = a5;
  int v33 = a6;
  id v21 = v17;
  id v22 = v19;
  id v23 = v18;
  id v24 = v16;
  dispatch_async(idsOutgoingQueue, v25);
}

void __117__RMSIDSClient__sendMessage_type_sendTimeout_responseTimeout_queueOneID_priority_inResponseToProtobuf_responseBlock___block_invoke(uint64_t a1)
{
  v38[3] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F4A098]);
  uint64_t v3 = [*(id *)(a1 + 32) data];
  id v4 = (void *)[v2 initWithProtobufData:v3 type:*(unsigned __int16 *)(a1 + 88) isResponse:*(void *)(a1 + 40) != 0];

  id v5 = objc_alloc(MEMORY[0x263EFF9A0]);
  v37[0] = *MEMORY[0x263F49F80];
  uint64_t v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  uint64_t v7 = *MEMORY[0x263F49ED8];
  v38[0] = v6;
  v38[1] = MEMORY[0x263EFFA88];
  uint64_t v8 = *MEMORY[0x263F49F20];
  v37[1] = v7;
  v37[2] = v8;
  v38[2] = MEMORY[0x263EFFA88];
  id v9 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
  BOOL v10 = (void *)[v5 initWithDictionary:v9];

  uint64_t v11 = *(void **)(a1 + 40);
  if (v11)
  {
    uint64_t v12 = [v11 context];
    uint64_t v13 = [v12 outgoingResponseIdentifier];
    [v10 setObject:v13 forKeyedSubscript:*MEMORY[0x263F49F40]];
  }
  if (*(void *)(a1 + 48)) {
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49EE8]];
  }
  uint64_t v14 = *(void *)(a1 + 56);
  if (v14) {
    [v10 setObject:v14 forKeyedSubscript:*MEMORY[0x263F49F60]];
  }
  if (*(void *)(a1 + 72) == 300)
  {
    uint64_t v15 = MEMORY[0x263EFFA88];
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49EF8]];
    [v10 setObject:v15 forKeyedSubscript:*MEMORY[0x263F49EC0]];
  }
  id v16 = *(void **)(*(void *)(a1 + 64) + 16);
  id v17 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E30]];
  uint64_t v18 = *(void *)(a1 + 72);
  id v31 = 0;
  id v32 = 0;
  int v19 = [v16 sendProtobuf:v4 toDestinations:v17 priority:v18 options:v10 identifier:&v32 error:&v31];
  id v20 = v32;
  id v21 = v31;

  id v22 = RMSLogger();
  id v23 = v22;
  if (!v19 || v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __117__RMSIDSClient__sendMessage_type_sendTimeout_responseTimeout_queueOneID_priority_inResponseToProtobuf_responseBlock___block_invoke_cold_1((unsigned __int16 *)(a1 + 88), (uint64_t)v21, v23);
    }
    goto LABEL_17;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = NSStringFromRMSMessageType(*(unsigned __int16 *)(a1 + 88));
    *(_DWORD *)id buf = 138412546;
    unsigned __int16 v34 = v24;
    __int16 v35 = 2112;
    id v36 = v20;
    _os_log_impl(&dword_23C83A000, v23, OS_LOG_TYPE_DEFAULT, "Sent message of type: %@, IDS identifier: %@", buf, 0x16u);
  }
  if (*(void *)(a1 + 48))
  {
    id v23 = objc_opt_new();
    [v23 setMessageType:*(unsigned __int16 *)(a1 + 88)];
    v25 = (void *)[*(id *)(a1 + 48) copy];
    [v23 setResponseBlock:v25];

    [*(id *)(*(void *)(a1 + 64) + 8) setObject:v23 forKeyedSubscript:v20];
    objc_initWeak((id *)buf, *(id *)(a1 + 64));
    dispatch_time_t v26 = dispatch_time(0, 1000000000 * *(int *)(a1 + 84));
    id v27 = *(NSObject **)(*(void *)(a1 + 64) + 24);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __117__RMSIDSClient__sendMessage_type_sendTimeout_responseTimeout_queueOneID_priority_inResponseToProtobuf_responseBlock___block_invoke_213;
    v28[3] = &unk_264E74370;
    objc_copyWeak(&v30, (id *)buf);
    id v29 = v20;
    dispatch_after(v26, v27, v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
LABEL_17:
  }
}

void __117__RMSIDSClient__sendMessage_type_sendTimeout_responseTimeout_queueOneID_priority_inResponseToProtobuf_responseBlock___block_invoke_213(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleTimeoutForMessageWithIdentifier:*(void *)(a1 + 32)];
}

- (void)_handleResponseCodeMessage:(id)a3
{
  id v4 = a3;
  id v5 = [RMSResponseCodeMessage alloc];
  uint64_t v6 = [v4 data];
  id v9 = [(RMSResponseCodeMessage *)v5 initWithData:v6];

  uint64_t v7 = [v4 context];

  uint64_t v8 = [v7 incomingResponseIdentifier];

  [(RMSIDSClient *)self _invokeResponseCodeResponseBlock:v8 responseCode:[(RMSResponseCodeMessage *)v9 responseCode]];
}

- (void)_invokeResponseCodeResponseBlock:(id)a3 responseCode:(int64_t)a4
{
  id v8 = a3;
  uint64_t v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_messageRecords, "objectForKeyedSubscript:");
  uint64_t v7 = [v6 responseBlock];

  if (v7) {
    v7[2](v7, a4);
  }
  [(NSMutableDictionary *)self->_messageRecords removeObjectForKey:v8];
}

- (void)_updateCompanionAvailability
{
  uint64_t v3 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__RMSIDSClient__updateCompanionAvailability__block_invoke;
  block[3] = &unk_264E740A8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __44__RMSIDSClient__updateCompanionAvailability__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) _isCompanionAvailable];
  if (*(unsigned __int8 *)(*(void *)(a1 + 32) + 40) != v2)
  {
    int v3 = v2;
    id v4 = RMSLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = @"unavailable";
      if (v3) {
        id v5 = @"avalable";
      }
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_23C83A000, v4, OS_LOG_TYPE_DEFAULT, "Companion availability changed: %@", (uint8_t *)&v7, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 40) = v3;
    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"RMSIDSClientCompanionAvailabilityDidChangeNotification" object:*(void *)(a1 + 32)];
  }
}

- (BOOL)_isCompanionAvailable
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(RMSIDSClient *)self _isInMinimalConfiguration])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    [(IDSService *)self->_idsService devices];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v4);
          }
          int v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (objc_msgSend(v7, "isDefaultPairedDevice", (void)v9)
            && ([v7 isConnected] & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v3 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v3;
}

- (BOOL)_isInMinimalConfiguration
{
  int v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.rootrobot"];
  uint64_t v3 = [v2 stringForKey:@"configuration"];
  char v4 = [@"minimal" isEqualToString:v3];

  return v4;
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v7 = a5;
  id v8 = RMSLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[RMSIDSClient service:account:incomingUnhandledProtobuf:fromID:context:](v7, v8);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a7;
  if (!a6)
  {
    long long v12 = RMSLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl(&dword_23C83A000, v12, OS_LOG_TYPE_DEFAULT, "IDS message %@ failed with error: %@", (uint8_t *)&v13, 0x16u);
    }

    [(RMSIDSClient *)self _handleTimeoutForMessageWithIdentifier:v10];
  }
}

- (void)_handleTimeoutForMessageWithIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_messageRecords objectForKeyedSubscript:v4];
  if (v5)
  {
    uint64_t v6 = RMSLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromRMSMessageType([v5 messageType]);
      int v11 = 138412290;
      long long v12 = v7;
      _os_log_impl(&dword_23C83A000, v6, OS_LOG_TYPE_DEFAULT, "Handling timeout for message type: %@", (uint8_t *)&v11, 0xCu);
    }
    int v8 = [v5 messageType];
    if (v8 > 15)
    {
      switch(v8)
      {
        case 25:
          [(RMSIDSClient *)self _invokeArtworkDataResponseBlock:v4 artworkData:0];
          break;
        case 26:
          [(RMSIDSClient *)self _invokeBeginPairingResponseBlock:v4 responseCode:-3 session:0];
          break;
        case 27:
        case 28:
        case 29:
        case 30:
        case 32:
          goto LABEL_16;
        case 31:
        case 33:
          goto LABEL_15;
        default:
          if (v8 == 16 || v8 == 18) {
            goto LABEL_15;
          }
          goto LABEL_16;
      }
    }
    else
    {
      switch(v8)
      {
        case 1:
          [(RMSIDSClient *)self _invokeBeginDiscoveryResponseBlock:v4 success:0 session:0];
          break;
        case 5:
          [(RMSIDSClient *)self _invokeConnectToServiceResponseBlock:v4 responseCode:-3 responseData:0 controlInterface:0 session:0];
          break;
        case 9:
LABEL_15:
          [(RMSIDSClient *)self _invokeResponseCodeResponseBlock:v4 responseCode:-3];
          break;
        default:
LABEL_16:
          long long v9 = RMSLogger();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            id v10 = NSStringFromRMSMessageType([v5 messageType]);
            int v11 = 138412290;
            long long v12 = v10;
            _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "No known timeout handler for message type %@", (uint8_t *)&v11, 0xCu);
          }
          [(NSMutableDictionary *)self->_messageRecords removeObjectForKey:v4];
          break;
      }
    }
  }
}

- (BOOL)isCompanionAvailable
{
  return self->_companionAvailable;
}

- (void)setCompanionAvailable:(BOOL)a3
{
  self->_companionAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsOutgoingQueue, 0);
  objc_storeStrong((id *)&self->_idsDispatchQueue, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_messageRecords, 0);
}

void __117__RMSIDSClient__sendMessage_type_sendTimeout_responseTimeout_queueOneID_priority_inResponseToProtobuf_responseBlock___block_invoke_cold_1(unsigned __int16 *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSStringFromRMSMessageType(*a1);
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_23C83A000, a3, OS_LOG_TYPE_ERROR, "Error sending message of type %@: %@", (uint8_t *)&v6, 0x16u);
}

- (void)service:(void *)a1 account:(NSObject *)a2 incomingUnhandledProtobuf:fromID:context:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 type];
  _os_log_error_impl(&dword_23C83A000, a2, OS_LOG_TYPE_ERROR, "Unhandled message type: %d", (uint8_t *)v3, 8u);
}

@end