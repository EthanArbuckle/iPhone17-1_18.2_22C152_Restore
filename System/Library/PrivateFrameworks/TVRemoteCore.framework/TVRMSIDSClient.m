@interface TVRMSIDSClient
+ (id)sharedClient;
- (BOOL)_isCompanionAvailable;
- (BOOL)isCompanionAvailable;
- (TVRMSIDSClient)init;
- (void)_handleAddToWishlistResponse:(id)a3;
- (void)_handleAudioRoutesDidUpdate:(id)a3;
- (void)_handleAvailableServicesDidUpdate:(id)a3;
- (void)_handleBeginDiscoverySessionResponse:(id)a3;
- (void)_handleBeginPairingSessionResponse:(id)a3;
- (void)_handleConnectToServiceResponse:(id)a3;
- (void)_handleNowPlayingArtworkAvailable:(id)a3;
- (void)_handleNowPlayingArtworkDataResponse:(id)a3;
- (void)_handleNowPlayingInfoDidUpdate:(id)a3;
- (void)_handlePairingDidFail:(id)a3;
- (void)_handlePairingDidSucceed:(id)a3;
- (void)_handlePickAudioRouteResponse:(id)a3;
- (void)_handleResponseCodeMessage:(id)a3;
- (void)_handleSessionDidEnd:(id)a3;
- (void)_handleSetLikedStateResponse:(id)a3;
- (void)_handleTimeoutForMessageWithIdentifier:(id)a3;
- (void)_handleVolumeDidUpdate:(id)a3;
- (void)_handleWifiAvailabilityDidChange:(id)a3;
- (void)_invokeArtworkDataResponseBlock:(id)a3 artworkData:(id)a4;
- (void)_invokeBeginDiscoveryResponseBlock:(id)a3 success:(BOOL)a4 session:(int)a5;
- (void)_invokeBeginPairingResponseBlock:(id)a3 responseCode:(int64_t)a4 session:(int)a5;
- (void)_invokeConnectToServiceResponseBlock:(id)a3 responseCode:(int64_t)a4 controlInterface:(id)a5 session:(int)a6;
- (void)_invokeResponseCodeResponseBlock:(id)a3 responseCode:(int64_t)a4;
- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 timeout:(int)a5 queueOneID:(id)a6 priority:(int64_t)a7 responseBlock:(id)a8;
- (void)_updateCompanionAvailability;
- (void)addToWishlist:(unint64_t)a3 databaseID:(unint64_t)a4 sessionIdentifier:(int)a5 completionHandler:(id)a6;
- (void)beginDiscoverySessionWithDiscoveryTypes:(int)a3 pairedNetworkNames:(id)a4 completionHandler:(id)a5;
- (void)beginObservingNowPlayingWithSessionIdentifier:(int)a3 completionHandler:(id)a4;
- (void)beginPairingSessionWithPasscode:(id)a3 appName:(id)a4 deviceName:(id)a5 deviceModel:(id)a6 completionHandler:(id)a7;
- (void)connectToService:(id)a3 pairingGUID:(id)a4 completionHandler:(id)a5;
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
- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4 sessionIdentifier:(int)a5;
- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4 sessionIdentifier:(int)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setCompanionAvailable:(BOOL)a3;
- (void)setLikedState:(int64_t)a3 itemID:(unint64_t)a4 databaseID:(unint64_t)a5 sessionIdentifier:(int)a6 completionHandler:(id)a7;
- (void)setVolume:(float)a3 sessionIdentifier:(int)a4;
- (void)updatePairedNetworkNames:(id)a3 sessionIdentifier:(int)a4;
@end

@implementation TVRMSIDSClient

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1) {
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedClient_sharedConnectionManager;

  return v2;
}

uint64_t __30__TVRMSIDSClient_sharedClient__block_invoke()
{
  sharedClient_sharedConnectionManager = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (TVRMSIDSClient)init
{
  v12.receiver = self;
  v12.super_class = (Class)TVRMSIDSClient;
  v2 = [(TVRMSIDSClient *)&v12 init];
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
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleNowPlayingInfoDidUpdate_ forIncomingRequestsOfType:12];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleNowPlayingArtworkAvailable_ forIncomingRequestsOfType:13];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleAudioRoutesDidUpdate_ forIncomingRequestsOfType:14];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleVolumeDidUpdate_ forIncomingRequestsOfType:15];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handlePairingDidSucceed_ forIncomingRequestsOfType:29];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handlePairingDidFail_ forIncomingRequestsOfType:30];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleSessionDidEnd_ forIncomingRequestsOfType:37];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleWifiAvailabilityDidChange_ forIncomingRequestsOfType:38];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleBeginDiscoverySessionResponse_ forIncomingResponsesOfType:2];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleConnectToServiceResponse_ forIncomingResponsesOfType:6];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleNowPlayingArtworkDataResponse_ forIncomingResponsesOfType:25];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleBeginPairingSessionResponse_ forIncomingResponsesOfType:27];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleHeartbeatResponse_ forIncomingResponsesOfType:17];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handlePickAudioRouteResponse_ forIncomingResponsesOfType:19];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleSetLikedStateResponse_ forIncomingResponsesOfType:32];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleBeginObservingNowPlayingResponse_ forIncomingResponsesOfType:10];
    [(IDSService *)v2->_idsService addDelegate:v2 queue:v2->_idsDispatchQueue];
    v2->_companionAvailable = 1;
    [(TVRMSIDSClient *)v2 _updateCompanionAvailability];
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
  v11 = (void *)MEMORY[0x22A6592D0](v8);

  [(TVRMSIDSClient *)self _sendMessage:v12 type:1 timeout:10 queueOneID:0 priority:200 responseBlock:v11];
}

- (void)updatePairedNetworkNames:(id)a3 sessionIdentifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v8 = (id)objc_opt_new();
  [v8 setSessionIdentifier:v4];
  dispatch_queue_t v7 = (void *)[v6 mutableCopy];

  [v8 setPairedNetworkNames:v7];
  [(TVRMSIDSClient *)self _sendMessage:v8 type:39 timeout:10 queueOneID:@"UpdatePairedNetworkNames" priority:200 responseBlock:0];
}

- (void)_handleBeginDiscoverySessionResponse:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [TVRMSSessionMessage alloc];
  id v6 = [v4 data];
  dispatch_queue_t v7 = [(TVRMSSessionMessage *)v5 initWithData:v6];

  id v8 = [v4 context];

  id v9 = [v8 incomingResponseIdentifier];

  uint64_t v10 = [(TVRMSSessionMessage *)v7 sessionIdentifier];
  v11 = _TVRCRMSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v10;
    _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "[Session %d] Received begin discovery response", (uint8_t *)v12, 8u);
  }

  [(TVRMSIDSClient *)self _invokeBeginDiscoveryResponseBlock:v9 success:1 session:v10];
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
    [(TVRMSIDSClient *)self endDiscoverySession:v5];
  }
  [(NSMutableDictionary *)self->_messageRecords removeObjectForKey:v10];
}

- (void)_handleAvailableServicesDidUpdate:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [TVRMSAvailableServicesDidUpdateMessage alloc];
  BOOL v6 = [v4 data];

  dispatch_queue_t v7 = [(TVRMSAvailableServicesDidUpdateMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSAvailableServicesDidUpdateMessage *)v7 sessionIdentifier];
  id v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received discovery available services update", (uint8_t *)v16, 8u);
  }

  id v10 = objc_opt_new();
  v11 = [NSNumber numberWithInt:v8];
  [v10 setObject:v11 forKeyedSubscript:@"RMSIDSClientSessionIdentifierNotificationKey"];

  id v12 = [(TVRMSAvailableServicesDidUpdateMessage *)v7 services];

  if (v12)
  {
    uint64_t v13 = [(TVRMSAvailableServicesDidUpdateMessage *)v7 services];
    v14 = +[TVRMSService servicesFromProtobufs:v13];

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
  BOOL v6 = _TVRCRMSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending end discovery message", (uint8_t *)v7, 8u);
  }

  [(TVRMSIDSClient *)self _sendMessage:v5 type:3 timeout:(int)*MEMORY[0x263F4A150] queueOneID:0 priority:200 responseBlock:0];
}

- (void)sendHeartbeatWithSessionIdentifier:(int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_queue_t v7 = objc_opt_new();
  [v7 setSessionIdentifier:v4];
  uint64_t v8 = _TVRCRMSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending heartbeat message", (uint8_t *)v10, 8u);
  }

  id v9 = (void *)MEMORY[0x22A6592D0](v6);
  [(TVRMSIDSClient *)self _sendMessage:v7 type:16 timeout:20 queueOneID:0 priority:200 responseBlock:v9];
}

- (void)connectToService:(id)a3 pairingGUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v13 = (id)objc_opt_new();
  uint64_t v11 = [v10 protobuf];

  [v13 setService:v11];
  [v13 setPairingGUID:v9];

  id v12 = (void *)MEMORY[0x22A6592D0](v8);
  [(TVRMSIDSClient *)self _sendMessage:v13 type:5 timeout:15 queueOneID:0 priority:300 responseBlock:v12];
}

- (void)_handleConnectToServiceResponse:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [TVRMSConnectToServiceResponseMessage alloc];
  id v6 = [v4 data];
  dispatch_queue_t v7 = [(TVRMSConnectToServiceResponseMessage *)v5 initWithData:v6];

  id v8 = [TVRMSControlInterface alloc];
  id v9 = [(TVRMSConnectToServiceResponseMessage *)v7 controlInterface];
  id v10 = [(TVRMSControlInterface *)v8 initWithProtobuf:v9];

  uint64_t v11 = [(TVRMSConnectToServiceResponseMessage *)v7 sessionIdentifier];
  id v12 = _TVRCRMSLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = v11;
    _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Received connection response", (uint8_t *)v15, 8u);
  }

  id v13 = [v4 context];
  v14 = [v13 incomingResponseIdentifier];

  [(TVRMSIDSClient *)self _invokeConnectToServiceResponseBlock:v14 responseCode:[(TVRMSConnectToServiceResponseMessage *)v7 responseCode] controlInterface:v10 session:v11];
}

- (void)logoutWithSessionIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_new();
  [v5 setSessionIdentifier:v3];
  id v6 = _TVRCRMSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending logout message", (uint8_t *)v7, 8u);
  }

  [(TVRMSIDSClient *)self _sendMessage:v5 type:7 timeout:(int)*MEMORY[0x263F4A150] queueOneID:0 priority:200 responseBlock:0];
}

- (void)_invokeConnectToServiceResponseBlock:(id)a3 responseCode:(int64_t)a4 controlInterface:(id)a5 session:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v13 = a3;
  id v10 = a5;
  uint64_t v11 = [(NSMutableDictionary *)self->_messageRecords objectForKeyedSubscript:v13];
  id v12 = [v11 responseBlock];

  if (v12) {
    ((void (**)(void, int64_t, id, uint64_t))v12)[2](v12, a4, v10, v6);
  }
  [(NSMutableDictionary *)self->_messageRecords removeObjectForKey:v13];
}

- (void)sendPlaybackCommand:(int64_t)a3 sessionIdentifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_queue_t v7 = objc_opt_new();
  [v7 setPlaybackCommand:a3];
  [v7 setSessionIdentifier:v4];
  uint64_t v8 = _TVRCRMSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending playback command", (uint8_t *)v9, 8u);
  }

  [(TVRMSIDSClient *)self _sendMessage:v7 type:8 timeout:5 queueOneID:0 priority:300 responseBlock:0];
}

- (void)setVolume:(float)a3 sessionIdentifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_queue_t v7 = objc_opt_new();
  *(float *)&double v8 = a3;
  [v7 setVolume:v8];
  [v7 setSessionIdentifier:v4];
  id v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending set volume message", (uint8_t *)v10, 8u);
  }

  [(TVRMSIDSClient *)self _sendMessage:v7 type:20 timeout:5 queueOneID:@"SetVolume" priority:300 responseBlock:0];
}

- (void)pickAudioRouteWithMacAddress:(unint64_t)a3 sessionIdentifier:(int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = objc_opt_new();
  [v9 setMacAddress:a3];
  [v9 setSessionIdentifier:v5];
  uint64_t v10 = _TVRCRMSLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v5;
    _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending pick audio route message", (uint8_t *)v12, 8u);
  }

  uint64_t v11 = (void *)MEMORY[0x22A6592D0](v8);
  [(TVRMSIDSClient *)self _sendMessage:v9 type:18 timeout:30 queueOneID:0 priority:200 responseBlock:v11];
}

- (void)_handlePickAudioRouteResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Received pick audio route response", v6, 2u);
  }

  [(TVRMSIDSClient *)self _handleResponseCodeMessage:v4];
}

- (void)seekToPlaybackTime:(int)a3 sessionIdentifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_queue_t v7 = objc_opt_new();
  [v7 setPlaybackTime:v5];
  [v7 setSessionIdentifier:v4];
  id v8 = _TVRCRMSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending seek to playback time message", (uint8_t *)v9, 8u);
  }

  [(TVRMSIDSClient *)self _sendMessage:v7 type:35 timeout:5 queueOneID:@"SeekToPlaybackTime" priority:300 responseBlock:0];
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
  v14 = _TVRCRMSLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = v7;
    _os_log_impl(&dword_2266D3000, v14, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending set like state message", (uint8_t *)v16, 8u);
  }

  v15 = (void *)MEMORY[0x22A6592D0](v12);
  [(TVRMSIDSClient *)self _sendMessage:v13 type:31 timeout:10 queueOneID:0 priority:200 responseBlock:v15];
}

- (void)_handleSetLikedStateResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Received set like state response", v6, 2u);
  }

  [(TVRMSIDSClient *)self _handleResponseCodeMessage:v4];
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
  id v12 = _TVRCRMSLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v6;
    _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending add to wishlist message", (uint8_t *)v14, 8u);
  }

  uint64_t v13 = (void *)MEMORY[0x22A6592D0](v10);
  [(TVRMSIDSClient *)self _sendMessage:v11 type:33 timeout:10 queueOneID:0 priority:200 responseBlock:v13];
}

- (void)_handleAddToWishlistResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Received add to wishlist response", v6, 2u);
  }

  [(TVRMSIDSClient *)self _handleResponseCodeMessage:v4];
}

- (void)beginObservingNowPlayingWithSessionIdentifier:(int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  [v7 setSessionIdentifier:v4];
  id v8 = _TVRCRMSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending begin observing now playing message", (uint8_t *)v10, 8u);
  }

  id v9 = (void *)MEMORY[0x22A6592D0](v6);
  [(TVRMSIDSClient *)self _sendMessage:v7 type:9 timeout:10 queueOneID:0 priority:200 responseBlock:v9];
}

- (void)endObservingNowPlayingWithSessionIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_new();
  [v5 setSessionIdentifier:v3];
  id v6 = _TVRCRMSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending end observing now playing message", (uint8_t *)v7, 8u);
  }

  [(TVRMSIDSClient *)self _sendMessage:v5 type:11 timeout:(int)*MEMORY[0x263F4A150] queueOneID:0 priority:200 responseBlock:0];
}

- (void)_handleAudioRoutesDidUpdate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [TVRMSAudioRoutesDidUpdateMessage alloc];
  id v6 = [v4 data];

  uint64_t v7 = [(TVRMSAudioRoutesDidUpdateMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSAudioRoutesDidUpdateMessage *)v7 sessionIdentifier];
  id v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v18 = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received now playing audio routes update", buf, 8u);
  }

  id v10 = [(TVRMSAudioRoutesDidUpdateMessage *)v7 audioRoutes];
  uint64_t v11 = +[TVRMSAudioRoute audioRoutesFromProtobufs:v10];

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
  uint64_t v5 = [TVRMSVolumeDidUpdateMessage alloc];
  id v6 = [v4 data];

  uint64_t v7 = [(TVRMSVolumeDidUpdateMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSVolumeDidUpdateMessage *)v7 sessionIdentifier];
  id v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v18 = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received now playing volume update", buf, 8u);
  }

  id v10 = objc_msgSend(NSNumber, "numberWithInt:", v8, @"RMSIDSClientSessionIdentifierNotificationKey");
  v15[1] = @"RMSIDSClientNowPlayingVolumeNotificationKey";
  v16[0] = v10;
  uint64_t v11 = NSNumber;
  [(TVRMSVolumeDidUpdateMessage *)v7 volume];
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
  uint64_t v5 = [TVRMSNowPlayingInfoDidUpdateMessage alloc];
  id v6 = [v4 data];

  uint64_t v7 = [(TVRMSNowPlayingInfoDidUpdateMessage *)v5 initWithData:v6];
  uint64_t v8 = [TVRMSNowPlayingInfo alloc];
  id v9 = [(TVRMSNowPlayingInfoDidUpdateMessage *)v7 nowPlayingInfo];
  id v10 = [(TVRMSNowPlayingInfo *)v8 initWithProtobuf:v9];

  uint64_t v11 = [(TVRMSNowPlayingInfoDidUpdateMessage *)v7 sessionIdentifier];
  id v12 = _TVRCRMSLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v19 = v11;
    _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "[Session %d] Received now playing info update", buf, 8u);
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
  uint64_t v5 = [TVRMSNowPlayingArtworkAvailableMessage alloc];
  id v6 = [v4 data];

  uint64_t v7 = [(TVRMSNowPlayingArtworkAvailableMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSNowPlayingArtworkAvailableMessage *)v7 sessionIdentifier];
  id v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v17 = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received now playing artwork update", buf, 8u);
  }

  id v10 = objc_msgSend(NSNumber, "numberWithInt:", v8, @"RMSIDSClientSessionIdentifierNotificationKey");
  v14[1] = @"RMSIDSClientNowPlayingArtworkIdentifierKey";
  v15[0] = v10;
  uint64_t v11 = [(TVRMSNowPlayingArtworkAvailableMessage *)v7 artworkIdentifier];
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
  uint64_t v16 = (void *)MEMORY[0x22A6592D0](v12);

  [(TVRMSIDSClient *)self _sendMessage:v17 type:24 timeout:30 queueOneID:@"RequestArtworkData" priority:200 responseBlock:v16];
}

- (void)_handleNowPlayingArtworkDataResponse:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  uint64_t v7 = [v4 data];
  uint64_t v8 = _TVRCRMSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = [v7 length];
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Received artwork data, length=%td", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [v4 data];
  [(TVRMSIDSClient *)self _invokeArtworkDataResponseBlock:v6 artworkData:v9];
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
  int v10 = _TVRCRMSLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v5;
    _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending touch move", (uint8_t *)v11, 8u);
  }

  [(TVRMSIDSClient *)self _sendMessage:v9 type:21 timeout:5 queueOneID:0 priority:300 responseBlock:0];
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
  int v10 = _TVRCRMSLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v5;
    _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending touch end", (uint8_t *)v11, 8u);
  }

  [(TVRMSIDSClient *)self _sendMessage:v9 type:22 timeout:5 queueOneID:0 priority:300 responseBlock:0];
}

- (void)sendNavigationCommand:(int64_t)a3 sessionIdentifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_opt_new();
  [v7 setNavigationCommand:a3];
  [v7 setSessionIdentifier:v4];
  uint64_t v8 = _TVRCRMSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending navigation command message", (uint8_t *)v9, 8u);
  }

  [(TVRMSIDSClient *)self _sendMessage:v7 type:23 timeout:5 queueOneID:0 priority:300 responseBlock:0];
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

  uint64_t v18 = _TVRCRMSLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v12;
    _os_log_impl(&dword_2266D3000, v18, OS_LOG_TYPE_DEFAULT, "Sending begin pairing message with passcode [%@]", (uint8_t *)&v20, 0xCu);
  }

  int v19 = (void *)MEMORY[0x22A6592D0](v13);
  [(TVRMSIDSClient *)self _sendMessage:v17 type:26 timeout:20 queueOneID:0 priority:200 responseBlock:v19];
}

- (void)endPairingSession:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_new();
  [v5 setSessionIdentifier:v3];
  uint64_t v6 = _TVRCRMSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "[Session %d] Sending end pairing message", (uint8_t *)v7, 8u);
  }

  [(TVRMSIDSClient *)self _sendMessage:v5 type:28 timeout:(int)*MEMORY[0x263F4A150] queueOneID:0 priority:200 responseBlock:0];
}

- (void)_handleBeginPairingSessionResponse:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [TVRMSBeginPairingResponseMessage alloc];
  uint64_t v6 = [v4 data];
  uint64_t v7 = [(TVRMSBeginPairingResponseMessage *)v5 initWithData:v6];

  uint64_t v8 = [(TVRMSBeginPairingResponseMessage *)v7 sessionIdentifier];
  id v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received begin pairing response", (uint8_t *)v12, 8u);
  }

  uint64_t v10 = [v4 context];
  uint64_t v11 = [v10 incomingResponseIdentifier];

  [(TVRMSIDSClient *)self _invokeBeginPairingResponseBlock:v11 responseCode:[(TVRMSBeginPairingResponseMessage *)v7 responseCode] session:v8];
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
    [(TVRMSIDSClient *)self endPairingSession:v5];
  }
  [(NSMutableDictionary *)self->_messageRecords removeObjectForKey:v10];
}

- (void)_handlePairingDidSucceed:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [TVRMSPairingSessionDidPairMessage alloc];
  uint64_t v6 = [v4 data];

  uint64_t v7 = [(TVRMSPairingSessionDidPairMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSPairingSessionDidPairMessage *)v7 sessionIdentifier];
  id v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v18 = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received successful pairing", buf, 8u);
  }

  id v10 = objc_msgSend(NSNumber, "numberWithInt:", v8, @"RMSIDSClientSessionIdentifierNotificationKey");
  v16[0] = v10;
  v15[1] = @"RMSIDSClientServiceNetworkNameNotificationKey";
  uint64_t v11 = [(TVRMSPairingSessionDidPairMessage *)v7 serviceNetworkName];
  v16[1] = v11;
  void v15[2] = @"RMSIDSClientPairingGUIDNotificationKey";
  id v12 = [(TVRMSPairingSessionDidPairMessage *)v7 pairingGUID];
  void v16[2] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

  id v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 postNotificationName:@"RMSIDSClientDidPairWithServiceNotification" object:self userInfo:v13];
}

- (void)_handlePairingDidFail:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [TVRMSSessionMessage alloc];
  uint64_t v6 = [v4 data];

  uint64_t v7 = [(TVRMSSessionMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSSessionMessage *)v7 sessionIdentifier];
  id v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received failure pairing", buf, 8u);
  }

  id v10 = objc_msgSend(NSNumber, "numberWithInt:", v8, @"RMSIDSClientSessionIdentifierNotificationKey");
  id v14 = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  id v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotificationName:@"RMSIDSClientPairingDidFailNotification" object:self userInfo:v11];
}

- (void)_handleSessionDidEnd:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [TVRMSSessionMessage alloc];
  uint64_t v6 = [v4 data];

  uint64_t v7 = [(TVRMSSessionMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSSessionMessage *)v7 sessionIdentifier];
  id v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = v8;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received session did end", buf, 8u);
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
  uint64_t v5 = [TVRMSWifiAvailabilityDidChangeMessage alloc];
  uint64_t v6 = [v4 data];

  uint64_t v7 = [(TVRMSWifiAvailabilityDidChangeMessage *)v5 initWithData:v6];
  uint64_t v8 = [(TVRMSWifiAvailabilityDidChangeMessage *)v7 sessionIdentifier];
  id v9 = _TVRCRMSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = [(TVRMSWifiAvailabilityDidChangeMessage *)v7 wifiAvailable];
    uint64_t v11 = @"unavailable";
    if (v10) {
      uint64_t v11 = @"available";
    }
    *(_DWORD *)buf = 67109378;
    int v19 = v8;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "[Session %d] Received wifi availability message: %@", buf, 0x12u);
  }

  id v12 = objc_msgSend(NSNumber, "numberWithInt:", v8, @"RMSIDSClientSessionIdentifierNotificationKey");
  v16[1] = @"RMSIDSClientWifiAvailabilityNotificationKey";
  v17[0] = v12;
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[TVRMSWifiAvailabilityDidChangeMessage wifiAvailable](v7, "wifiAvailable"));
  v17[1] = v13;
  id v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  id v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 postNotificationName:@"RMSIDSClientWifiAvailabilityDidChangeNotification" object:self userInfo:v14];
}

- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 timeout:(int)a5 queueOneID:(id)a6 priority:(int64_t)a7 responseBlock:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  idsOutgoingQueue = self->_idsOutgoingQueue;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __78__TVRMSIDSClient__sendMessage_type_timeout_queueOneID_priority_responseBlock___block_invoke;
  v21[3] = &unk_2647AEF50;
  unsigned __int16 v28 = a4;
  int v27 = a5;
  id v22 = v14;
  id v23 = v16;
  v25 = self;
  int64_t v26 = a7;
  id v24 = v15;
  id v18 = v15;
  id v19 = v16;
  id v20 = v14;
  dispatch_async(idsOutgoingQueue, v21);
}

void __78__TVRMSIDSClient__sendMessage_type_timeout_queueOneID_priority_responseBlock___block_invoke(uint64_t a1)
{
  v36[3] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F4A228]);
  uint64_t v3 = [*(id *)(a1 + 32) data];
  id v4 = (void *)[v2 initWithProtobufData:v3 type:*(unsigned __int16 *)(a1 + 76) isResponse:0];

  id v5 = objc_alloc(MEMORY[0x263EFF9A0]);
  v35[0] = *MEMORY[0x263F49F80];
  uint64_t v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  uint64_t v7 = *MEMORY[0x263F49ED8];
  v36[0] = v6;
  v36[1] = MEMORY[0x263EFFA88];
  uint64_t v8 = *MEMORY[0x263F49F20];
  v35[1] = v7;
  v35[2] = v8;
  v36[2] = MEMORY[0x263EFFA88];
  id v9 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
  BOOL v10 = (void *)[v5 initWithDictionary:v9];

  if (*(void *)(a1 + 40)) {
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49EE8]];
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x263F49F60]];
  }
  if (*(void *)(a1 + 64) == 300)
  {
    uint64_t v12 = MEMORY[0x263EFFA88];
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49EF8]];
    [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x263F49EC0]];
  }
  uint64_t v13 = *(void **)(*(void *)(a1 + 56) + 16);
  id v14 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F4A148]];
  uint64_t v15 = *(void *)(a1 + 64);
  id v29 = 0;
  id v30 = 0;
  int v16 = [v13 sendProtobuf:v4 toDestinations:v14 priority:v15 options:v10 identifier:&v30 error:&v29];
  id v17 = v30;
  id v18 = v29;

  id v19 = _TVRCRMSLog();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (!v16 || v18)
  {
    if (v20)
    {
      v25 = NSStringFromRMSMessageType(*(unsigned __int16 *)(a1 + 76));
      *(_DWORD *)buf = 138412546;
      v32 = v25;
      __int16 v33 = 2112;
      id v34 = v18;
      _os_log_impl(&dword_2266D3000, v19, OS_LOG_TYPE_DEFAULT, "Error sending message of type %@: %@", buf, 0x16u);
    }
    goto LABEL_15;
  }
  if (v20)
  {
    id v21 = NSStringFromRMSMessageType(*(unsigned __int16 *)(a1 + 76));
    *(_DWORD *)buf = 138412546;
    v32 = v21;
    __int16 v33 = 2112;
    id v34 = v17;
    _os_log_impl(&dword_2266D3000, v19, OS_LOG_TYPE_DEFAULT, "Sent message of type: %@, IDS identifier: %@", buf, 0x16u);
  }
  if (*(void *)(a1 + 40))
  {
    id v19 = objc_opt_new();
    [v19 setMessageType:*(unsigned __int16 *)(a1 + 76)];
    id v22 = (void *)[*(id *)(a1 + 40) copy];
    [v19 setResponseBlock:v22];

    [*(id *)(*(void *)(a1 + 56) + 8) setObject:v19 forKeyedSubscript:v17];
    objc_initWeak((id *)buf, *(id *)(a1 + 56));
    dispatch_time_t v23 = dispatch_time(0, 1000000000 * *(int *)(a1 + 72));
    id v24 = *(NSObject **)(*(void *)(a1 + 56) + 24);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __78__TVRMSIDSClient__sendMessage_type_timeout_queueOneID_priority_responseBlock___block_invoke_180;
    v26[3] = &unk_2647AEC00;
    objc_copyWeak(&v28, (id *)buf);
    id v27 = v17;
    dispatch_after(v23, v24, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
LABEL_15:
  }
}

void __78__TVRMSIDSClient__sendMessage_type_timeout_queueOneID_priority_responseBlock___block_invoke_180(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleTimeoutForMessageWithIdentifier:*(void *)(a1 + 32)];
}

- (void)_handleResponseCodeMessage:(id)a3
{
  id v4 = a3;
  id v5 = [TVRMSResponseCodeMessage alloc];
  uint64_t v6 = [v4 data];
  id v9 = [(TVRMSResponseCodeMessage *)v5 initWithData:v6];

  uint64_t v7 = [v4 context];

  uint64_t v8 = [v7 incomingResponseIdentifier];

  [(TVRMSIDSClient *)self _invokeResponseCodeResponseBlock:v8 responseCode:[(TVRMSResponseCodeMessage *)v9 responseCode]];
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
  block[2] = __46__TVRMSIDSClient__updateCompanionAvailability__block_invoke;
  block[3] = &unk_2647AEA98;
  block[4] = self;
  dispatch_async(v3, block);
}

void __46__TVRMSIDSClient__updateCompanionAvailability__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) _isCompanionAvailable];
  if (*(unsigned __int8 *)(*(void *)(a1 + 32) + 40) != v2)
  {
    int v3 = v2;
    id v4 = _TVRCRMSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = @"unavailable";
      if (v3) {
        id v5 = @"avalable";
      }
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Companion availability changed: %@", (uint8_t *)&v7, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 40) = v3;
    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"RMSIDSClientCompanionAvailabilityDidChangeNotification" object:*(void *)(a1 + 32)];
  }
}

- (BOOL)_isCompanionAvailable
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(IDSService *)self->_idsService devices];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "isDefaultPairedDevice", (void)v8)
          && ([v6 isConnected] & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v7 = a5;
  long long v8 = _TVRCRMSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = [v7 type];
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Unhandled message type: %d", (uint8_t *)v9, 8u);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a7;
  if (!a6)
  {
    uint64_t v12 = _TVRCRMSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "IDS message %@ failed with error: %@", (uint8_t *)&v13, 0x16u);
    }

    [(TVRMSIDSClient *)self _handleTimeoutForMessageWithIdentifier:v10];
  }
}

- (void)_handleTimeoutForMessageWithIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_messageRecords objectForKeyedSubscript:v4];
  if (v5)
  {
    uint64_t v6 = _TVRCRMSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromRMSMessageType([v5 messageType]);
      int v11 = 138412290;
      uint64_t v12 = v7;
      _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Handling timeout for message type: %@", (uint8_t *)&v11, 0xCu);
    }
    int v8 = [v5 messageType];
    if (v8 > 15)
    {
      switch(v8)
      {
        case 25:
          [(TVRMSIDSClient *)self _invokeArtworkDataResponseBlock:v4 artworkData:0];
          break;
        case 26:
          [(TVRMSIDSClient *)self _invokeBeginPairingResponseBlock:v4 responseCode:-3 session:0];
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
          [(TVRMSIDSClient *)self _invokeBeginDiscoveryResponseBlock:v4 success:0 session:0];
          break;
        case 5:
          [(TVRMSIDSClient *)self _invokeConnectToServiceResponseBlock:v4 responseCode:-3 controlInterface:0 session:0];
          break;
        case 9:
LABEL_15:
          [(TVRMSIDSClient *)self _invokeResponseCodeResponseBlock:v4 responseCode:-3];
          break;
        default:
LABEL_16:
          long long v9 = _TVRCRMSLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            id v10 = NSStringFromRMSMessageType([v5 messageType]);
            int v11 = 138412290;
            uint64_t v12 = v10;
            _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "No known timeout handler for message type %@", (uint8_t *)&v11, 0xCu);
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

@end