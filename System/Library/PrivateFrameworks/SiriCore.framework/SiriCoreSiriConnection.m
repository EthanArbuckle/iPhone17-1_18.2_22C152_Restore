@interface SiriCoreSiriConnection
- (BOOL)deviceIsInWalkaboutExperimentGroup;
- (BOOL)forceReconnect;
- (BOOL)imposePolicyBan;
- (BOOL)prefersWWAN;
- (BOOL)siriConnectionUsesPeerManagedSync;
- (BOOL)skipPeer;
- (BOOL)useWiFiHint;
- (BOOL)usesProxyConnection;
- (Class)peerProviderClass;
- (NSError)skipPeerError;
- (NSString)aceHost;
- (NSString)assistantIdentifier;
- (NSString)connectionId;
- (NSString)languageCode;
- (NSString)peerAssistantIdentifier;
- (NSString)peerType;
- (NSString)peerVersion;
- (NSString)productTypePrefix;
- (NSURL)url;
- (SAConnectionPolicy)connectionPolicy;
- (SiriCoreSiriConnection)init;
- (SiriCoreSiriConnection)initWithQueue:(id)a3;
- (SiriCoreSiriConnectionDelegate)delegate;
- (double)timeout;
- (id)_activeOrAnyPendingConnection;
- (id)_connectionInfoForRoute:(id)a3 policy:(id)a4;
- (id)analysisInfo;
- (void)_accessPotentiallyActiveConnections:(id)a3;
- (void)_cancelSynchronously:(id)a3;
- (void)_handleLastEventFromBackgroundConnection:(id)a3 pendingConnectionExhaustionHandler:(id)a4;
- (void)_recordConnectionMethodForMetrics:(id)a3;
- (void)_scheduleBackgroundConnectionWithRoute:(id)a3 delay:(double)a4 policy:(id)a5;
- (void)_startBackgroundConnectionWithRoute:(id)a3 policy:(id)a4;
- (void)_waitForActiveConnection:(id)a3;
- (void)barrier:(id)a3;
- (void)cancelSynchronously:(BOOL)a3 onQueue:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)getAnalysisInfo:(id)a3;
- (void)getConnectionMetricsSynchronously:(BOOL)a3 completion:(id)a4;
- (void)probeConnection;
- (void)sendCommand:(id)a3 errorHandler:(id)a4;
- (void)sendCommands:(id)a3 errorHandler:(id)a4;
- (void)setAceHost:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setConnectionId:(id)a3;
- (void)setConnectionPolicy:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceIsInWalkaboutExperimentGroup:(BOOL)a3;
- (void)setForceReconnect:(BOOL)a3;
- (void)setImposePolicyBan:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setPeerAssistantIdentifier:(id)a3;
- (void)setPeerProviderClass:(Class)a3;
- (void)setPeerType:(id)a3;
- (void)setPeerVersion:(id)a3;
- (void)setPrefersWWAN:(BOOL)a3;
- (void)setProductTypePrefix:(id)a3;
- (void)setSendPings:(BOOL)a3;
- (void)setSiriConnectionUsesPeerManagedSync:(BOOL)a3;
- (void)setSkipPeer:(BOOL)a3;
- (void)setSkipPeerError:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setUrl:(id)a3;
- (void)setUseWiFiHint:(BOOL)a3;
- (void)setUsesProxyConnection:(BOOL)a3;
- (void)siriBackgroundConnection:(id)a3 didEncounterError:(id)a4 analysisInfo:(id)a5;
- (void)siriBackgroundConnection:(id)a3 didEncounterIntermediateError:(id)a4;
- (void)siriBackgroundConnection:(id)a3 didOpenWithConnectionType:(id)a4 routeId:(id)a5 delay:(double)a6;
- (void)siriBackgroundConnection:(id)a3 didReceiveAceObject:(id)a4;
- (void)siriBackgroundConnection:(id)a3 willStartConnectionWithHTTPHeader:(id)a4;
- (void)siriBackgroundConnection:(id)a3 willStartWithConnectionType:(id)a4;
- (void)siriBackgroundConnectionDidClose:(id)a3;
- (void)start;
@end

@implementation SiriCoreSiriConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionPolicy, 0);
  objc_storeStrong((id *)&self->_skipPeerError, 0);
  objc_storeStrong((id *)&self->_connMethodUsedHistory, 0);
  objc_storeStrong((id *)&self->_peerProviderClass, 0);
  objc_storeStrong((id *)&self->_productTypePrefix, 0);
  objc_storeStrong((id *)&self->_peerVersion, 0);
  objc_storeStrong((id *)&self->_peerType, 0);
  objc_storeStrong((id *)&self->_activeConnectionGroup, 0);
  objc_storeStrong((id *)&self->_activeBackgroundConnection, 0);
  objc_storeStrong((id *)&self->_scheduledRoutes, 0);
  objc_storeStrong((id *)&self->_comatoseBackgroundConnections, 0);
  objc_storeStrong((id *)&self->_pendingBackgroundConnections, 0);
  objc_storeStrong((id *)&self->_connectionId, 0);
  objc_storeStrong((id *)&self->_peerAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_aceHost, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setConnectionPolicy:(id)a3
{
}

- (SAConnectionPolicy)connectionPolicy
{
  return self->_connectionPolicy;
}

- (void)setImposePolicyBan:(BOOL)a3
{
  self->_imposePolicyBan = a3;
}

- (BOOL)imposePolicyBan
{
  return self->_imposePolicyBan;
}

- (void)setConnectionId:(id)a3
{
}

- (NSString)connectionId
{
  return self->_connectionId;
}

- (void)setPeerProviderClass:(Class)a3
{
}

- (Class)peerProviderClass
{
  return self->_peerProviderClass;
}

- (void)setSiriConnectionUsesPeerManagedSync:(BOOL)a3
{
  self->_siriConnectionUsesPeerManagedSync = a3;
}

- (BOOL)siriConnectionUsesPeerManagedSync
{
  return self->_siriConnectionUsesPeerManagedSync;
}

- (void)setDeviceIsInWalkaboutExperimentGroup:(BOOL)a3
{
  self->_deviceIsInWalkaboutExperimentGroup = a3;
}

- (BOOL)deviceIsInWalkaboutExperimentGroup
{
  return self->_deviceIsInWalkaboutExperimentGroup;
}

- (void)setUsesProxyConnection:(BOOL)a3
{
  self->_usesProxyConnection = a3;
}

- (BOOL)usesProxyConnection
{
  return self->_usesProxyConnection;
}

- (void)setProductTypePrefix:(id)a3
{
}

- (NSString)productTypePrefix
{
  return self->_productTypePrefix;
}

- (void)setPeerVersion:(id)a3
{
}

- (NSString)peerVersion
{
  return self->_peerVersion;
}

- (void)setPeerType:(id)a3
{
}

- (NSString)peerType
{
  return self->_peerType;
}

- (void)setPeerAssistantIdentifier:(id)a3
{
}

- (NSString)peerAssistantIdentifier
{
  return self->_peerAssistantIdentifier;
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setAceHost:(id)a3
{
}

- (NSString)aceHost
{
  return self->_aceHost;
}

- (void)setForceReconnect:(BOOL)a3
{
  self->_forceReconnect = a3;
}

- (BOOL)forceReconnect
{
  return self->_forceReconnect;
}

- (void)setPrefersWWAN:(BOOL)a3
{
  self->_prefersWWAN = a3;
}

- (BOOL)prefersWWAN
{
  return self->_prefersWWAN;
}

- (void)setSkipPeerError:(id)a3
{
}

- (NSError)skipPeerError
{
  return self->_skipPeerError;
}

- (void)setUseWiFiHint:(BOOL)a3
{
  self->_useWiFiHint = a3;
}

- (BOOL)useWiFiHint
{
  return self->_useWiFiHint;
}

- (void)setSkipPeer:(BOOL)a3
{
  self->_skipPeer = a3;
}

- (BOOL)skipPeer
{
  return self->_skipPeer;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setDelegate:(id)a3
{
}

- (SiriCoreSiriConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SiriCoreSiriConnectionDelegate *)WeakRetained;
}

- (void)_recordConnectionMethodForMetrics:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  connMethodUsedHistory = self->_connMethodUsedHistory;
  if (!connMethodUsedHistory)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_connMethodUsedHistory;
    self->_connMethodUsedHistory = v6;

    connMethodUsedHistory = self->_connMethodUsedHistory;
  }
  [(NSMutableArray *)connMethodUsedHistory addObject:v4];
  v8 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    v9 = self->_connMethodUsedHistory;
    int v10 = 136315394;
    v11 = "-[SiriCoreSiriConnection _recordConnectionMethodForMetrics:]";
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)siriBackgroundConnection:(id)a3 willStartConnectionWithHTTPHeader:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__SiriCoreSiriConnection_siriBackgroundConnection_willStartConnectionWithHTTPHeader___block_invoke;
  v8[3] = &unk_26443AF40;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __85__SiriCoreSiriConnection_siriBackgroundConnection_willStartConnectionWithHTTPHeader___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [v4 siriConnection:*(void *)(a1 + 32) willStartConnectionWithHTTPHeaderFields:*(void *)(a1 + 40)];
  }
}

- (void)siriBackgroundConnection:(id)a3 didEncounterIntermediateError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__SiriCoreSiriConnection_siriBackgroundConnection_didEncounterIntermediateError___block_invoke;
  block[3] = &unk_26443A820;
  id v12 = v7;
  v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __81__SiriCoreSiriConnection_siriBackgroundConnection_didEncounterIntermediateError___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) domain];
  if ([v2 isEqualToString:@"SiriCoreSiriConnectionErrorDomain"]) {
    BOOL v3 = [*(id *)(a1 + 32) code] == 33;
  }
  else {
    BOOL v3 = 0;
  }

  id v4 = [*(id *)(a1 + 32) domain];
  if ([v4 isEqualToString:@"SiriCoreSiriConnectionErrorDomain"]) {
    BOOL v5 = [*(id *)(a1 + 32) code] == 35;
  }
  else {
    BOOL v5 = 0;
  }

  id v6 = [*(id *)(a1 + 32) domain];
  if ([v6 isEqualToString:@"SiriCoreSiriConnectionErrorDomain"]) {
    BOOL v7 = [*(id *)(a1 + 32) code] == 36;
  }
  else {
    BOOL v7 = 0;
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v3 || (*(void *)(v8 + 136) == *(void *)(a1 + 48) ? (int v9 = 1) : (int v9 = v5), ((v9 | v7) & 1) != 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v8 + 24));
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v17 = 136315394;
        v18 = "-[SiriCoreSiriConnection siriBackgroundConnection:didEncounterIntermediateError:]_block_invoke";
        __int16 v19 = 2112;
        uint64_t v20 = v13;
        _os_log_impl(&dword_21CBF7000, v12, OS_LOG_TYPE_INFO, "%s Connection got intermediate error from active connection: %@", (uint8_t *)&v17, 0x16u);
      }
      id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
      [v14 siriConnection:*(void *)(a1 + 40) didEncounterIntermediateError:*(void *)(a1 + 32)];
    }
  }
  else
  {
    v15 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = 136315394;
      v18 = "-[SiriCoreSiriConnection siriBackgroundConnection:didEncounterIntermediateError:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      _os_log_impl(&dword_21CBF7000, v15, OS_LOG_TYPE_INFO, "%s Connection got intermediate error from inactive connection. Error: %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)siriBackgroundConnection:(id)a3 didEncounterError:(id)a4 analysisInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [v8 getConnectionMethodUsed];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__SiriCoreSiriConnection_siriBackgroundConnection_didEncounterError_analysisInfo___block_invoke;
  block[3] = &unk_26443A978;
  void block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(queue, block);
}

void __82__SiriCoreSiriConnection_siriBackgroundConnection_didEncounterError_analysisInfo___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = *(void **)(a1 + 40);
  id v4 = (void *)v2[17];
  BOOL v5 = *MEMORY[0x263F28358];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO);
  if (v4 == v3)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SiriCoreSiriConnection siriBackgroundConnection:didEncounterError:analysisInfo:]_block_invoke";
      __int16 v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s Got error from active connection: %@", buf, 0x16u);
    }
    char v11 = [*(id *)(a1 + 48) domain];
    if ([v11 isEqualToString:@"SiriCoreSiriConnectionErrorDomain"])
    {
      uint64_t v12 = [*(id *)(a1 + 48) code];

      if (v12 == 32) {
        [*(id *)(a1 + 40) updateActiveBackgroundConnectionWithSecondary];
      }
    }
    else
    {
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [WeakRetained siriConnection:*(void *)(a1 + 32) didEncounterError:*(void *)(a1 + 48) analysisInfo:*(void *)(a1 + 56)];
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SiriCoreSiriConnection siriBackgroundConnection:didEncounterError:analysisInfo:]_block_invoke";
      __int16 v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s Got error from inactive connection: %@", buf, 0x16u);
      v2 = *(void **)(a1 + 32);
      BOOL v3 = *(void **)(a1 + 40);
    }
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __82__SiriCoreSiriConnection_siriBackgroundConnection_didEncounterError_analysisInfo___block_invoke_20;
    id v16 = &unk_26443A950;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 32);
    id v17 = v7;
    uint64_t v18 = v8;
    id v19 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 56);
    [v2 _handleLastEventFromBackgroundConnection:v7 pendingConnectionExhaustionHandler:&v13];
    id v9 = *(void **)(a1 + 32);
    if (!v9[17]) {
      objc_msgSend(v9, "_recordConnectionMethodForMetrics:", *(void *)(a1 + 64), v13, v14, v15, v16);
    }

    id WeakRetained = v17;
  }
}

void __82__SiriCoreSiriConnection_siriBackgroundConnection_didEncounterError_analysisInfo___block_invoke_20(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    int v5 = 136315394;
    BOOL v6 = "-[SiriCoreSiriConnection siriBackgroundConnection:didEncounterError:analysisInfo:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_INFO, "%s Ran out of pending connections; forwarding error from last connection %@",
      (uint8_t *)&v5,
      0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 24));
  [WeakRetained siriConnection:a1[5] didEncounterError:a1[6] analysisInfo:a1[7]];
}

- (void)siriBackgroundConnectionDidClose:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__SiriCoreSiriConnection_siriBackgroundConnectionDidClose___block_invoke;
  v7[3] = &unk_26443AF40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __59__SiriCoreSiriConnection_siriBackgroundConnectionDidClose___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(v2 + 136);
  int v5 = *MEMORY[0x263F28358];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO);
  if (v4 == v3)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[SiriCoreSiriConnection siriBackgroundConnectionDidClose:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s Closing from active connection: %@", buf, 0x16u);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
    [WeakRetained siriConnectionDidClose:*(void *)(a1 + 32)];
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[SiriCoreSiriConnection siriBackgroundConnectionDidClose:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s Ignoring connection close from inactive connection: %@", buf, 0x16u);
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void **)(a1 + 40);
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__SiriCoreSiriConnection_siriBackgroundConnectionDidClose___block_invoke_19;
    v10[3] = &unk_26443AF40;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = v7;
    uint64_t v12 = v8;
    [(id)v2 _handleLastEventFromBackgroundConnection:v7 pendingConnectionExhaustionHandler:v10];
    id WeakRetained = v11;
  }
}

void __59__SiriCoreSiriConnection_siriBackgroundConnectionDidClose___block_invoke_19(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    BOOL v6 = "-[SiriCoreSiriConnection siriBackgroundConnectionDidClose:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_INFO, "%s Ran out of pending connections, forwarding close from last connection %@", (uint8_t *)&v5, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  [WeakRetained siriConnectionDidClose:*(void *)(a1 + 40)];
}

- (void)siriBackgroundConnection:(id)a3 didReceiveAceObject:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[SiriCoreSiriConnection siriBackgroundConnection:didReceiveAceObject:]";
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__SiriCoreSiriConnection_siriBackgroundConnection_didReceiveAceObject___block_invoke;
  block[3] = &unk_26443A820;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

void __71__SiriCoreSiriConnection_siriBackgroundConnection_didReceiveAceObject___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = *(void *)(v3 + 136);
  int v5 = *MEMORY[0x263F28358];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO);
  if (v4 == v2)
  {
    if (v6)
    {
      int v8 = 136315394;
      uint64_t v9 = "-[SiriCoreSiriConnection siriBackgroundConnection:didReceiveAceObject:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s Received ace object from active connection: %@", (uint8_t *)&v8, 0x16u);
      uint64_t v3 = a1[4];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
    [WeakRetained siriConnection:a1[4] didReceiveAceObject:a1[6]];
  }
  else if (v6)
  {
    int v8 = 136315394;
    uint64_t v9 = "-[SiriCoreSiriConnection siriBackgroundConnection:didReceiveAceObject:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v2;
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s Ignoring ace object from inactive connection: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)siriBackgroundConnection:(id)a3 didOpenWithConnectionType:(id)a4 routeId:(id)a5 delay:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v10 getConnectionMethodUsed];
  queue = self->_queue;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __91__SiriCoreSiriConnection_siriBackgroundConnection_didOpenWithConnectionType_routeId_delay___block_invoke;
  v19[3] = &unk_26443A928;
  v19[4] = self;
  id v20 = v10;
  id v21 = v13;
  id v22 = v11;
  id v23 = v12;
  double v24 = a6;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(queue, v19);
}

void __91__SiriCoreSiriConnection_siriBackgroundConnection_didOpenWithConnectionType_routeId_delay___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 136);
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    int v5 = *MEMORY[0x263F28358];
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO);
    if (v4 == v3)
    {
      if (v6)
      {
        int v12 = 136315394;
        id v13 = "-[SiriCoreSiriConnection siriBackgroundConnection:didOpenWithConnectionType:routeId:delay:]_block_invoke";
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s Connection opened twice or connection became viable again. %@", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      if (v6)
      {
        id v7 = *(void **)(a1 + 48);
        int v12 = 136315650;
        id v13 = "-[SiriCoreSiriConnection siriBackgroundConnection:didOpenWithConnectionType:routeId:delay:]_block_invoke";
        __int16 v14 = 2112;
        id v15 = v7;
        __int16 v16 = 2112;
        id v17 = v4;
        _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s A connection lost the race, canceling %@ connection %@", (uint8_t *)&v12, 0x20u);
        uint64_t v4 = *(void **)(a1 + 40);
      }
      [v4 cancel];
      [*(id *)(*(void *)(a1 + 32) + 112) removeObject:*(void *)(a1 + 40)];
    }
  }
  else
  {
    int v8 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      id v10 = *(void **)(a1 + 40);
      uint64_t v9 = *(void **)(a1 + 48);
      int v12 = 136315650;
      id v13 = "-[SiriCoreSiriConnection siriBackgroundConnection:didOpenWithConnectionType:routeId:delay:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, "%s Connection opened and %@ won the race: %@", (uint8_t *)&v12, 0x20u);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    objc_storeStrong((id *)(v2 + 136), *(id *)(a1 + 40));
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [WeakRetained siriConnection:*(void *)(a1 + 32) didOpenWithConnectionType:*(void *)(a1 + 56) routeId:*(void *)(a1 + 64) delay:*(void *)(a1 + 48) method:*(double *)(a1 + 72)];

    [*(id *)(a1 + 32) _recordConnectionMethodForMetrics:*(void *)(a1 + 48)];
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 144));
  }
}

- (void)siriBackgroundConnection:(id)a3 willStartWithConnectionType:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v12 = "-[SiriCoreSiriConnection siriBackgroundConnection:willStartWithConnectionType:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_21CBF7000, v6, OS_LOG_TYPE_INFO, "%s connectionType=%@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__SiriCoreSiriConnection_siriBackgroundConnection_willStartWithConnectionType___block_invoke;
  v9[3] = &unk_26443AF40;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

void __79__SiriCoreSiriConnection_siriBackgroundConnection_willStartWithConnectionType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained siriConnection:*(void *)(a1 + 32) willStartWithConnectionType:*(void *)(a1 + 40)];
}

- (void)_handleLastEventFromBackgroundConnection:(id)a3 pendingConnectionExhaustionHandler:(id)a4
{
  id v7 = a3;
  BOOL v6 = (void (**)(void))a4;
  if ([(NSMutableSet *)self->_pendingBackgroundConnections containsObject:v7])
  {
    [(NSMutableSet *)self->_comatoseBackgroundConnections addObject:v7];
    [(NSMutableSet *)self->_pendingBackgroundConnections removeObject:v7];
  }
  if (!self->_activeBackgroundConnection
    && ![(NSMutableSet *)self->_pendingBackgroundConnections count]
    && ![(NSMutableSet *)self->_scheduledRoutes count])
  {
    v6[2](v6);
  }
}

- (id)_activeOrAnyPendingConnection
{
  activeBackgroundConnection = self->_activeBackgroundConnection;
  if (activeBackgroundConnection)
  {
    uint64_t v3 = activeBackgroundConnection;
  }
  else
  {
    uint64_t v3 = [(NSMutableSet *)self->_pendingBackgroundConnections anyObject];
  }

  return v3;
}

- (void)_waitForActiveConnection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    activeConnectionGroup = self->_activeConnectionGroup;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__SiriCoreSiriConnection__waitForActiveConnection___block_invoke;
    block[3] = &unk_26443A900;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    dispatch_group_notify(activeConnectionGroup, queue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __51__SiriCoreSiriConnection__waitForActiveConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 104)) {
    id v3 = WeakRetained[17];
  }
  else {
    id v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_accessPotentiallyActiveConnections:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  if (!self->_isCanceledInternal)
  {
    if (self->_activeBackgroundConnection)
    {
      (*((void (**)(id))v4 + 2))(v4);
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      BOOL v6 = (void *)[(NSMutableSet *)self->_pendingBackgroundConnections copy];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            v5[2](v5, *(void *)(*((void *)&v11 + 1) + 8 * i));
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)getConnectionMetricsSynchronously:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__SiriCoreSiriConnection_getConnectionMetricsSynchronously_completion___block_invoke;
  v10[3] = &unk_26443AB48;
  void v10[4] = self;
  id v11 = v6;
  if (v4) {
    uint64_t v8 = (void (*)(OS_dispatch_queue *, void *))MEMORY[0x263EF8868];
  }
  else {
    uint64_t v8 = (void (*)(OS_dispatch_queue *, void *))MEMORY[0x263EF8838];
  }
  id v9 = v6;
  v8(queue, v10);
}

void __71__SiriCoreSiriConnection_getConnectionMetricsSynchronously_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[SiriCoreSiriConnection getConnectionMetricsSynchronously:completion:]_block_invoke";
    _os_log_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  id v3 = [*(id *)(a1 + 32) _activeOrAnyPendingConnection];
  if (v3
    || ([*(id *)(*(void *)(a1 + 32) + 120) anyObject],
        (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v3 getConnectionMetrics:*(void *)(*(void *)(a1 + 32) + 192) withCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    }
  }
}

- (void)getAnalysisInfo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SiriCoreSiriConnection_getAnalysisInfo___block_invoke;
  v7[3] = &unk_26443AB48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __42__SiriCoreSiriConnection_getAnalysisInfo___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v3 = [*(id *)(a1 + 32) _activeOrAnyPendingConnection];
    uint64_t v2 = [v3 analysisInfo];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
  }
}

- (id)analysisInfo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1683;
  id v10 = __Block_byref_object_dispose__1684;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__SiriCoreSiriConnection_analysisInfo__block_invoke;
  v5[3] = &unk_26443AB20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__SiriCoreSiriConnection_analysisInfo__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _activeOrAnyPendingConnection];
  uint64_t v2 = [v5 analysisInfo];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)cancelSynchronously:(BOOL)a3 onQueue:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v8 = (void (**)(void))a5;
  id v9 = v8;
  if (self->_isCanceled)
  {
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    self->_isCanceled = 1;
    if (v5)
    {
      [(SiriCoreSiriConnection *)self _cancelSynchronously:v8];
    }
    else
    {
      queue = self->_queue;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __65__SiriCoreSiriConnection_cancelSynchronously_onQueue_completion___block_invoke;
      v11[3] = &unk_26443AB48;
      v11[4] = self;
      long long v12 = v8;
      if (v6) {
        MEMORY[0x263EF8868](queue, v11);
      }
      else {
        MEMORY[0x263EF8838](queue, v11);
      }
    }
  }
}

uint64_t __65__SiriCoreSiriConnection_cancelSynchronously_onQueue_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelSynchronously:*(void *)(a1 + 40)];
}

- (void)_cancelSynchronously:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  [(SiriCoreSiriBackgroundConnection *)self->_activeBackgroundConnection cancel];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v5 = self->_pendingBackgroundConnections;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v9++) cancel];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = self->_comatoseBackgroundConnections;
  uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "cancel", (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  self->_isCanceledInternal = 1;
  if (v4) {
    v4[2](v4);
  }
}

- (void)probeConnection
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SiriCoreSiriConnection_probeConnection__block_invoke;
  block[3] = &unk_26443AF18;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __41__SiriCoreSiriConnection_probeConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessPotentiallyActiveConnections:&__block_literal_global_1685];
}

uint64_t __41__SiriCoreSiriConnection_probeConnection__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 probeConnection];
}

- (void)barrier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__SiriCoreSiriConnection_barrier___block_invoke;
  v6[3] = &unk_26443A8B8;
  id v7 = v4;
  id v5 = v4;
  [(SiriCoreSiriConnection *)self _waitForActiveConnection:v6];
}

void __34__SiriCoreSiriConnection_barrier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = v3;
    [v3 barrier:v4];
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    id v5 = 0;
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  id v3 = v5;
LABEL_6:
}

- (void)setSendPings:(BOOL)a3
{
  self->_sendPings = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__SiriCoreSiriConnection_setSendPings___block_invoke;
  v3[3] = &__block_descriptor_33_e42_v16__0__SiriCoreSiriBackgroundConnection_8l;
  BOOL v4 = a3;
  [(SiriCoreSiriConnection *)self _waitForActiveConnection:v3];
}

uint64_t __39__SiriCoreSiriConnection_setSendPings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSendPings:*(unsigned __int8 *)(a1 + 32)];
}

- (void)sendCommands:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SiriCoreSiriConnection_sendCommands_errorHandler___block_invoke;
  block[3] = &unk_26443AFD8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __52__SiriCoreSiriConnection_sendCommands_errorHandler___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__SiriCoreSiriConnection_sendCommands_errorHandler___block_invoke_2;
  v3[3] = &unk_26443A870;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _accessPotentiallyActiveConnections:v3];
}

uint64_t __52__SiriCoreSiriConnection_sendCommands_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 sendCommands:*(void *)(a1 + 32) errorHandler:*(void *)(a1 + 40)];
}

- (void)sendCommand:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SiriCoreSiriConnection_sendCommand_errorHandler___block_invoke;
  block[3] = &unk_26443AFD8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __51__SiriCoreSiriConnection_sendCommand_errorHandler___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__SiriCoreSiriConnection_sendCommand_errorHandler___block_invoke_2;
  v3[3] = &unk_26443A870;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _accessPotentiallyActiveConnections:v3];
}

uint64_t __51__SiriCoreSiriConnection_sendCommand_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 sendCommand:*(void *)(a1 + 32) moreComing:0 errorHandler:*(void *)(a1 + 40)];
}

- (void)start
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v95 = "-[SiriCoreSiriConnection start]";
    _os_log_impl(&dword_21CBF7000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = self->_connectionPolicy;
  id v5 = [(SAConnectionPolicy *)v4 routes];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v83 objects:buf count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v84;
    uint64_t v63 = *MEMORY[0x263F65188];
    *(void *)&long long v8 = 136315138;
    long long v62 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v84 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v83 + 1) + 8 * v11);
        id v13 = objc_msgSend(v12, "cname", v62);
        if ((_RouteHostStringIsAcceptable(v13) & 1) == 0)
        {

LABEL_17:
          long long v21 = *MEMORY[0x263F28358];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO)) {
            goto LABEL_23;
          }
          *(_DWORD *)v90 = 136315394;
          v91 = "_PolicyRouteSetsForConnectionPolicy";
          __int16 v92 = 2112;
          v93 = v12;
          long long v19 = v21;
          long long v20 = "%s Skipping connection route with unacceptable cname and/or host: %@";
          uint32_t v22 = 22;
          goto LABEL_19;
        }
        uint64_t v14 = [v12 host];
        char IsAcceptable = _RouteHostStringIsAcceptable(v14);

        if ((IsAcceptable & 1) == 0) {
          goto LABEL_17;
        }
        long long v16 = [v12 type];
        int v17 = [v16 isEqualToString:v63];

        if (!v17) {
          goto LABEL_20;
        }
        if (NetworkServiceProxyIsEnabled())
        {
          if (AFIsInternalInstall() && _AFPreferencesGetTuscanyStatus())
          {
            long long v18 = *MEMORY[0x263F28358];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO)) {
              goto LABEL_23;
            }
            *(_DWORD *)v90 = v62;
            v91 = "_PolicyRouteSetsForConnectionPolicy";
            long long v19 = v18;
            long long v20 = "%s Not using Tuscany policy as Tuscany is disabled in Internal Settings";
LABEL_27:
            uint32_t v22 = 12;
LABEL_19:
            _os_log_impl(&dword_21CBF7000, v19, OS_LOG_TYPE_INFO, v20, v90, v22);
            goto LABEL_23;
          }
LABEL_20:
          id v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "priority"));
          id v24 = [v6 objectForKey:v23];
          if (!v24)
          {
            id v24 = objc_alloc_init(MEMORY[0x263EFF9C0]);
            [v6 setObject:v24 forKey:v23];
          }
          [v24 addObject:v12];

          goto LABEL_23;
        }
        uint64_t v25 = *MEMORY[0x263F28358];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v90 = v62;
          v91 = "_SiriCorePOPServiceExists";
          long long v19 = v25;
          long long v20 = "%s POP Service disabled.";
          goto LABEL_27;
        }
LABEL_23:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v26 = [obj countByEnumeratingWithState:&v83 objects:buf count:16];
      uint64_t v9 = v26;
    }
    while (v26);
  }

  v27 = [v6 allKeys];
  v28 = [v27 sortedArrayUsingSelector:sel_compare_];

  v29 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v28, "count"));
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v30 = [v28 reverseObjectEnumerator];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v79 objects:v90 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v80 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = [v6 objectForKey:*(void *)(*((void *)&v79 + 1) + 8 * i)];
        if (v35) {
          [v29 addObject:v35];
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v79 objects:v90 count:16];
    }
    while (v32);
  }

  v36 = [(SAConnectionPolicy *)v4 globalTimeout];
  v64 = v36;
  if (v36)
  {
    [v36 doubleValue];
    double v38 = fmin(v37 * 1000.0, 10.0);
  }
  else
  {
    double v38 = 10.0;
  }
  v39 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
  v40 = [MEMORY[0x263F08C38] UUID];
  [v39 setNetworkConnectionId:v40];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obja = v29;
  uint64_t v41 = [obja countByEnumeratingWithState:&v75 objects:v89 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v76;
    double v44 = 0.0;
    while (2)
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v76 != v43) {
          objc_enumerationMutation(obja);
        }
        v46 = *(void **)(*((void *)&v75 + 1) + 8 * j);
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v47 = v46;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v71 objects:v88 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v72;
          double v51 = 0.0;
          do
          {
            for (uint64_t k = 0; k != v49; ++k)
            {
              if (*(void *)v72 != v50) {
                objc_enumerationMutation(v47);
              }
              v53 = [*(id *)(*((void *)&v71 + 1) + 8 * k) timeout];
              [v53 doubleValue];
              double v55 = v54 / 1000.0;

              if (v51 < v55) {
                double v51 = v55;
              }
            }
            uint64_t v49 = [v47 countByEnumeratingWithState:&v71 objects:v88 count:16];
          }
          while (v49);
        }
        else
        {
          double v51 = 0.0;
        }

        if (v44 >= v38)
        {
          v61 = *MEMORY[0x263F28358];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315906;
            v95 = "-[SiriCoreSiriConnection start]";
            __int16 v96 = 2048;
            double v97 = v44;
            __int16 v98 = 2048;
            double v99 = v38;
            __int16 v100 = 2112;
            id v101 = v47;
            _os_log_impl(&dword_21CBF7000, v61, OS_LOG_TYPE_INFO, "%s Skipping connection policy route because they would take too long (%.3fs >= %.3fs): %@", buf, 0x2Au);
          }
          goto LABEL_71;
        }
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v56 = v47;
        uint64_t v57 = [v56 countByEnumeratingWithState:&v67 objects:v87 count:16];
        if (v57)
        {
          uint64_t v58 = v57;
          uint64_t v59 = *(void *)v68;
          do
          {
            for (uint64_t m = 0; m != v58; ++m)
            {
              if (*(void *)v68 != v59) {
                objc_enumerationMutation(v56);
              }
              [(SiriCoreSiriConnection *)self _scheduleBackgroundConnectionWithRoute:*(void *)(*((void *)&v67 + 1) + 8 * m) delay:v4 policy:v44];
            }
            uint64_t v58 = [v56 countByEnumeratingWithState:&v67 objects:v87 count:16];
          }
          while (v58);
        }

        double v44 = v44 + fmin(v51, 5.0);
      }
      uint64_t v42 = [obja countByEnumeratingWithState:&v75 objects:v89 count:16];
      if (v42) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v44 = 0.0;
  }
LABEL_71:

  [(SiriCoreSiriConnection *)self _scheduleBackgroundConnectionWithRoute:0 delay:v4 policy:v44];
}

- (void)_scheduleBackgroundConnectionWithRoute:(id)a3 delay:(double)a4 policy:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    long long v19 = "-[SiriCoreSiriConnection _scheduleBackgroundConnectionWithRoute:delay:policy:]";
    __int16 v20 = 2048;
    double v21 = a4 * 1000.0;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_21CBF7000, v10, OS_LOG_TYPE_INFO, "%s Scheduling connection after delay %.2f ms with route %@", buf, 0x20u);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__SiriCoreSiriConnection__scheduleBackgroundConnectionWithRoute_delay_policy___block_invoke;
  v14[3] = &unk_26443A848;
  v14[4] = self;
  id v15 = v8;
  double v17 = a4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(queue, v14);
}

void __78__SiriCoreSiriConnection__scheduleBackgroundConnectionWithRoute_delay_policy___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 128);
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(v2 + 128), "addObject:");
  }
  else
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
    [v3 addObject:v4];
  }
  double v5 = *(double *)(a1 + 56);
  if (v5 <= 0.0)
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    [v9 _startBackgroundConnectionWithRoute:v10 policy:v11];
  }
  else
  {
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__SiriCoreSiriConnection__scheduleBackgroundConnectionWithRoute_delay_policy___block_invoke_2;
    block[3] = &unk_26443A820;
    void block[4] = v7;
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    dispatch_after(v6, v8, block);
  }
}

uint64_t __78__SiriCoreSiriConnection__scheduleBackgroundConnectionWithRoute_delay_policy___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startBackgroundConnectionWithRoute:*(void *)(a1 + 40) policy:*(void *)(a1 + 48)];
}

- (void)_startBackgroundConnectionWithRoute:(id)a3 policy:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  scheduledRoutes = self->_scheduledRoutes;
  if (v6)
  {
    [(NSMutableSet *)self->_scheduledRoutes removeObject:v6];
  }
  else
  {
    id v9 = [MEMORY[0x263EFF9D0] null];
    [(NSMutableSet *)scheduledRoutes removeObject:v9];
  }
  if (self->_isCanceledInternal || self->_activeBackgroundConnection)
  {
    uint64_t v10 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      double v21 = "-[SiriCoreSiriConnection _startBackgroundConnectionWithRoute:policy:]";
      uint64_t v11 = "%s Not starting scheduled background connection because we're canceled or already have an active one";
      id v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
LABEL_8:
      _os_log_impl(&dword_21CBF7000, v12, v13, v11, (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    id v14 = [MEMORY[0x263F285A0] sharedPreferences];
    int v15 = [v14 isDictationHIPAACompliant];

    if (v15)
    {
      id v16 = *MEMORY[0x263F28338];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28338], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      int v20 = 136315138;
      double v21 = "-[SiriCoreSiriConnection _startBackgroundConnectionWithRoute:policy:]";
      uint64_t v11 = "%s Not starting scheduled background connection because we have HIPAA On-Device Dictation enabled";
      id v12 = v16;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
    double v17 = [[SiriCoreSiriBackgroundConnection alloc] initWithQueue:self->_queue];
    [(SiriCoreSiriBackgroundConnection *)v17 setPeerType:self->_peerType];
    [(SiriCoreSiriBackgroundConnection *)v17 setPeerVersion:self->_peerVersion];
    [(SiriCoreSiriBackgroundConnection *)v17 setPeerProviderClass:self->_peerProviderClass];
    [(SiriCoreSiriBackgroundConnection *)v17 setProductTypePrefix:self->_productTypePrefix];
    [(SiriCoreSiriBackgroundConnection *)v17 setDelegate:self];
    [(SiriCoreSiriBackgroundConnection *)v17 setSiriConnectionUsesPeerManagedSync:self->_siriConnectionUsesPeerManagedSync];
    [(SiriCoreSiriBackgroundConnection *)v17 setUsesProxyConnection:self->_usesProxyConnection];
    [(SiriCoreSiriBackgroundConnection *)v17 setDeviceIsInWalkaboutExperimentGroup:self->_deviceIsInWalkaboutExperimentGroup];
    [(NSMutableSet *)self->_pendingBackgroundConnections addObject:v17];
    long long v18 = [(SiriCoreSiriConnection *)self _connectionInfoForRoute:v6 policy:v7];
    long long v19 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      int v20 = 136315394;
      double v21 = "-[SiriCoreSiriConnection _startBackgroundConnectionWithRoute:policy:]";
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_21CBF7000, v19, OS_LOG_TYPE_INFO, "%s Starting background connection with connection info: %@", (uint8_t *)&v20, 0x16u);
    }
    [(SiriCoreSiriBackgroundConnection *)v17 startWithConnectionInfo:v18];
  }
LABEL_9:
}

- (id)_connectionInfoForRoute:(id)a3 policy:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(SiriCoreSiriConnectionInfo);
  [(SiriCoreSiriConnectionInfo *)v8 setAceHost:self->_aceHost];
  [(SiriCoreSiriConnectionInfo *)v8 setLanguageCode:self->_languageCode];
  [(SiriCoreSiriConnectionInfo *)v8 setPrefersWWAN:self->_prefersWWAN];
  [(SiriCoreSiriConnectionInfo *)v8 setSkipPeer:self->_skipPeer];
  [(SiriCoreSiriConnectionInfo *)v8 setUseWiFiHint:self->_useWiFiHint];
  [(SiriCoreSiriConnectionInfo *)v8 setConnectionPolicy:v7];

  [(SiriCoreSiriConnectionInfo *)v8 setForceReconnect:self->_forceReconnect];
  [(SiriCoreSiriConnectionInfo *)v8 setConnectionPolicyRoute:v6];
  [(SiriCoreSiriConnectionInfo *)v8 setAssistantIdentifier:self->_assistantIdentifier];
  [(SiriCoreSiriConnectionInfo *)v8 setPeerAssistantIdentifier:self->_peerAssistantIdentifier];
  [(SiriCoreSiriConnectionInfo *)v8 setImposePolicyBan:self->_imposePolicyBan];
  [(SiriCoreSiriConnectionInfo *)v8 setForceOnDeviceOnlyDictation:_AFPreferencesForceOnDeviceOnlyDictationEnabled()];
  [(SiriCoreSiriConnectionInfo *)v8 setRequiresURLSession:0];
  [(SiriCoreSiriConnectionInfo *)v8 setTimeout:self->_timeout];
  id v9 = self->_url;
  if (v6)
  {
    uint64_t v10 = [v6 cname];
    if (v10 || ([v6 host], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v11 = [MEMORY[0x263F08BA0] componentsWithURL:v9 resolvingAgainstBaseURL:0];
      [v11 setHost:v10];
      uint64_t v12 = [v11 URL];

      id v9 = (NSURL *)v12;
    }
  }
  os_log_type_t v13 = [(NSURL *)v9 port];
  id v14 = [v13 stringValue];

  if (!v14)
  {
    int v15 = [(NSURL *)v9 scheme];
    uint64_t v16 = [v15 caseInsensitiveCompare:@"https"];

    if (v16) {
      id v14 = @"80";
    }
    else {
      id v14 = @"443";
    }
  }
  double v17 = (void *)*MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    long long v18 = v17;
    long long v19 = [(NSURL *)v9 host];
    int v22 = 136315650;
    id v23 = "-[SiriCoreSiriConnection _connectionInfoForRoute:policy:]";
    __int16 v24 = 2112;
    uint64_t v25 = v19;
    __int16 v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_21CBF7000, v18, OS_LOG_TYPE_INFO, "%s route host is %@ port is %@", (uint8_t *)&v22, 0x20u);
  }
  [(SiriCoreSiriConnectionInfo *)v8 setUrl:v9];
  int v20 = [v6 connectionId];
  [(SiriCoreSiriConnectionInfo *)v8 setConnectionId:v20];

  return v8;
}

- (void)dealloc
{
  if (!self->_activeBackgroundConnection) {
    dispatch_group_leave((dispatch_group_t)self->_activeConnectionGroup);
  }
  id v3 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
  [v3 setNetworkConnectionId:0];

  v4.receiver = self;
  v4.super_class = (Class)SiriCoreSiriConnection;
  [(SiriCoreSiriConnection *)&v4 dealloc];
}

- (SiriCoreSiriConnection)initWithQueue:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SiriCoreSiriConnection;
  id v5 = [(SiriCoreSiriConnection *)&v21 init];
  if (v5)
  {
    id v6 = v4;
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UNSPECIFIED, 0);

    if (v6) {
      dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("SiriCoreSiriConnection", v8, v6);
    }
    else {
      dispatch_queue_t v9 = dispatch_queue_create("SiriCoreSiriConnection", v8);
    }
    dispatch_queue_t v10 = v9;

    uint64_t v11 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v10;

    id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    os_log_type_t v13 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v12;

    id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    int v15 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v14;

    id v16 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    double v17 = (void *)*((void *)v5 + 16);
    *((void *)v5 + 16) = v16;

    dispatch_group_t v18 = dispatch_group_create();
    long long v19 = (void *)*((void *)v5 + 18);
    *((void *)v5 + 18) = v18;

    dispatch_group_enter(*((dispatch_group_t *)v5 + 18));
  }

  return (SiriCoreSiriConnection *)v5;
}

- (SiriCoreSiriConnection)init
{
  return [(SiriCoreSiriConnection *)self initWithQueue:0];
}

@end