@interface SiriCoreNetworkSessionProvider
+ (void)getMetricsContext:(id)a3;
- (BOOL)hasActiveConnection;
- (BOOL)isCanceled;
- (BOOL)isEstablishing;
- (BOOL)isMultipath;
- (BOOL)isPeerConnectionError:(id)a3;
- (BOOL)isPeerNotNearbyError:(id)a3;
- (BOOL)isReady;
- (BOOL)providerStatsIndicatePoorLinkQuality;
- (BOOL)shouldFallbackFromError:(id)a3;
- (BOOL)shouldFallbackQuickly;
- (BOOL)supportsInitialPayload;
- (SiriCoreNetworkSessionProvider)initWithQueue:(id)a3;
- (id)analysisInfo;
- (id)connectionType;
- (id)delegate;
- (id)headerDataWithForceReconnect:(BOOL)a3;
- (id)resolvedHost;
- (void)URLSession:(id)a3 betterRouteDiscoveredForStreamTask:(id)a4;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 streamTask:(id)a4 didBecomeInputStream:(id)a5 outputStream:(id)a6;
- (void)_cancelOpenTimer;
- (void)_cancelStaleConnectionTimer;
- (void)_closeWithError:(id)a3;
- (void)_invokeOpenCompletionWithError:(id)a3;
- (void)_setupOpenTimer;
- (void)_setupStaleConnectionTimer;
- (void)_streamDidBecomeUnviable;
- (void)close;
- (void)openConnectionForURL:(id)a3 withConnectionId:(id)a4 initialPayload:(id)a5 completion:(id)a6;
- (void)readData:(id)a3;
- (void)setConnectByPOPMethod:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPolicyRoute:(id)a3;
- (void)setPrefersWWAN:(BOOL)a3;
- (void)setProviderConnectionPolicy:(id)a3;
- (void)setStaleInterval:(double)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)updateConnectionMetrics:(id)a3 completion:(id)a4;
- (void)writeData:(id)a3 completion:(id)a4;
@end

@implementation SiriCoreNetworkSessionProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staleConnectionTimer, 0);
  objc_storeStrong((id *)&self->_openTimer, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_readGroup, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionId, 0);
  objc_storeStrong((id *)&self->_resolvedHost, 0);
  objc_storeStrong(&self->_completion_block, 0);
  objc_storeStrong((id *)&self->_streamTask, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_connectionType, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)writeData:(id)a3 completion:(id)a4
{
  v6 = a3;
  v7 = (void (**)(id, void))a4;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  if (self->_outputStream)
  {
    ++self->_readWriteCounter;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__SiriCoreNetworkSessionProvider_writeData_completion___block_invoke;
    v10[3] = &unk_26443A3E8;
    v10[4] = self;
    v10[5] = &v11;
    dispatch_data_apply(v6, v10);
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:11 userInfo:0];
  v9 = (void *)v12[5];
  v12[5] = v8;

  if (v7) {
LABEL_5:
  }
    v7[2](v7, v12[5]);
LABEL_6:
  _Block_object_dispose(&v11, 8);
}

BOOL __55__SiriCoreNetworkSessionProvider_writeData_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 10400) write:a4 maxLength:a5];
  if (v6 < 0)
  {
    v7 = [*(id *)(*(void *)(a1 + 32) + 10400) streamError];
    uint64_t v8 = v7;
    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:26 userInfo:0];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
    if (!v7) {
  }
    }
  return v6 >= 0;
}

- (void)readData:(id)a3
{
  id v4 = a3;
  readGroup = self->_readGroup;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__SiriCoreNetworkSessionProvider_readData___block_invoke;
  v8[3] = &unk_26443AB48;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(readGroup, queue, v8);
}

void __43__SiriCoreNetworkSessionProvider_readData___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 10424);
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 10376);
  if (v3)
  {
    size_t v4 = [v3 read:v2 + 136 maxLength:10240];
    uint64_t v5 = *(void *)(a1 + 32);
    if ((v4 & 0x8000000000000000) == 0)
    {
      dispatch_data_t v9 = dispatch_data_create((const void *)(v5 + 136), v4, 0, 0);
      dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 10384));
      dispatch_data_t v6 = v9;
      id v7 = 0;
      *(unsigned char *)(*(void *)(a1 + 32) + 10392) = 1;
      goto LABEL_7;
    }
    uint64_t v8 = [*(id *)(v5 + 10376) streamError];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:11 userInfo:0];
  }
  id v7 = (void *)v8;
  dispatch_data_t v6 = 0;
LABEL_7:
  dispatch_data_t v10 = v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setStaleInterval:(double)a3
{
  self->_staleConnectionInterval = a3;
}

- (void)setConnectByPOPMethod:(BOOL)a3
{
  self->_connectByPOPEnabled = a3;
}

- (void)setPrefersWWAN:(BOOL)a3
{
  self->_prefersWWAN = a3;
}

- (void)setProviderConnectionPolicy:(id)a3
{
  self->_policy = (SAConnectionPolicy *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setPolicyRoute:(id)a3
{
  self->_route = (SAConnectionPolicyRoute *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (BOOL)isEstablishing
{
  return self->_isEstablishing;
}

- (BOOL)isMultipath
{
  return self->_isMPTCP;
}

- (BOOL)shouldFallbackFromError:(id)a3
{
  return 1;
}

- (BOOL)isPeerNotNearbyError:(id)a3
{
  return 0;
}

- (BOOL)isPeerConnectionError:(id)a3
{
  return 0;
}

- (void)_closeWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (os_log_t *)MEMORY[0x263F28358];
  dispatch_data_t v6 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v22 = 136315138;
    v23 = "-[SiriCoreNetworkSessionProvider _closeWithError:]";
    _os_log_impl(&dword_21CBF7000, v6, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v22, 0xCu);
  }
  [(NSURLSession *)self->_urlSession invalidateAndCancel];
  urlSession = self->_urlSession;
  self->_urlSession = 0;

  [(NSOperationQueue *)self->_opQueue cancelAllOperations];
  opQueue = self->_opQueue;
  self->_opQueue = 0;

  inputStream = self->_inputStream;
  if (inputStream)
  {
    [(NSInputStream *)inputStream close];
    dispatch_data_t v10 = self->_inputStream;
    self->_inputStream = 0;
  }
  else
  {
    [(NSURLSessionStreamTask *)self->_streamTask closeRead];
  }
  if (self->_waitingOnReadGroup)
  {
    dispatch_group_leave((dispatch_group_t)self->_readGroup);
    self->_waitingOnReadGroup = 0;
  }
  outputStream = self->_outputStream;
  if (outputStream)
  {
    [(NSOutputStream *)outputStream close];
    v12 = self->_outputStream;
    self->_outputStream = 0;
  }
  else
  {
    [(NSURLSessionStreamTask *)self->_streamTask closeWrite];
  }
  streamTask = self->_streamTask;
  self->_streamTask = 0;

  [(SiriCoreNetworkSessionProvider *)self _cancelOpenTimer];
  [(SiriCoreNetworkSessionProvider *)self _cancelStaleConnectionTimer];
  if (self->_completion_block)
  {
    v14 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315138;
      v23 = "-[SiriCoreNetworkSessionProvider _closeWithError:]";
      _os_log_error_impl(&dword_21CBF7000, v14, OS_LOG_TYPE_ERROR, "%s Invoking open completion on close", (uint8_t *)&v22, 0xCu);
      if (v4) {
        goto LABEL_15;
      }
    }
    else if (v4)
    {
LABEL_15:
      [(SiriCoreNetworkSessionProvider *)self _invokeOpenCompletionWithError:v4];
      goto LABEL_16;
    }
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:17 userInfo:0];
    goto LABEL_15;
  }
LABEL_16:
  v15 = self->_urlSession;
  self->_urlSession = 0;

  self->_interfaceIndex = 0;
  interfaceName = self->_interfaceName;
  self->_interfaceName = 0;

  self->_isCanceled = 1;
  resolvedHost = self->_resolvedHost;
  self->_resolvedHost = 0;

  url = self->_url;
  self->_url = 0;

  connectionId = self->_connectionId;
  self->_connectionId = 0;

  connectionType = self->_connectionType;
  self->_connectionType = 0;

  route = self->_route;
  self->_route = 0;
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SiriCoreNetworkSessionProvider_close__block_invoke;
  block[3] = &unk_26443AF18;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __39__SiriCoreNetworkSessionProvider_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeWithError:0];
}

- (id)resolvedHost
{
  return self->_resolvedHost;
}

- (BOOL)providerStatsIndicatePoorLinkQuality
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  outputStream = self->_outputStream;
  if (!outputStream) {
    return 0;
  }
  v3 = outputStream;
  uint64_t v9 = 0;
  dispatch_data_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v4 = [(NSOutputStream *)v3 propertyForKey:*MEMORY[0x263EFC6C0]];
  if ([v4 count])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __70__SiriCoreNetworkSessionProvider_providerStatsIndicatePoorLinkQuality__block_invoke;
    v8[3] = &unk_26443A3C0;
    v8[4] = &v9;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
  if (*((unsigned char *)v10 + 24))
  {
    BOOL v5 = 1;
  }
  else
  {
    dispatch_data_t v6 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SiriCoreNetworkSessionProvider providerStatsIndicatePoorLinkQuality]";
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_21CBF7000, v6, OS_LOG_TYPE_INFO, "%s %@ has poor quality.", buf, 0x16u);
      BOOL v5 = *((unsigned char *)v10 + 24) != 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __70__SiriCoreNetworkSessionProvider_providerStatsIndicatePoorLinkQuality__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [a3 bytes];
  uint64_t v7 = v6;
  uint64_t v8 = (os_log_t *)MEMORY[0x263F28358];
  if ((*(unsigned char *)v6 & 0xFE) == 4 && *(void *)(v6 + 92) <= 0x100uLL)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    uint64_t v9 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      v18 = "-[SiriCoreNetworkSessionProvider providerStatsIndicatePoorLinkQuality]_block_invoke";
      __int16 v19 = 2112;
      *(void *)v20 = v5;
      _os_log_impl(&dword_21CBF7000, v9, OS_LOG_TYPE_INFO, "%s Treating %@ as ok quality", (uint8_t *)&v17, 0x16u);
    }
  }
  dispatch_data_t v10 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
  {
    int v12 = *(_DWORD *)(v7 + 20);
    int v11 = *(_DWORD *)(v7 + 24);
    int v13 = *(_DWORD *)(v7 + 28);
    int v14 = *(_DWORD *)(v7 + 64);
    uint64_t v15 = *(void *)(v7 + 92);
    uint64_t v16 = *(void *)(v7 + 284);
    int v17 = 136316930;
    v18 = "-[SiriCoreNetworkSessionProvider providerStatsIndicatePoorLinkQuality]_block_invoke";
    __int16 v19 = 1024;
    *(_DWORD *)v20 = v11;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v12;
    __int16 v21 = 1024;
    int v22 = v13;
    __int16 v23 = 1024;
    int v24 = v14;
    __int16 v25 = 2048;
    uint64_t v26 = v15;
    __int16 v27 = 2048;
    uint64_t v28 = v16;
    __int16 v29 = 2112;
    id v30 = v5;
    _os_log_impl(&dword_21CBF7000, v10, OS_LOG_TYPE_INFO, "%s TCP srtt: %d rttcur:%d rttvar:%d sbbytes:%d txunacked:%lld txretransmitpackets:%lld for if=%@", (uint8_t *)&v17, 0x42u);
  }
}

- (void)updateConnectionMetrics:(id)a3 completion:(id)a4
{
}

- (id)analysisInfo
{
  v3 = [SiriCoreAceConnectionAnalysisInfo alloc];
  url = self->_url;
  uint64_t interfaceIndex = self->_interfaceIndex;
  BOOL prefersWWAN = self->_prefersWWAN;
  uint64_t v7 = [(SiriCoreNetworkSessionProvider *)self connectionType];
  uint64_t v8 = [(SAConnectionPolicy *)self->_policy policyId];
  uint64_t v9 = [(SiriCoreAceConnectionAnalysisInfo *)v3 initWithConnectionURL:url interfaceIndex:interfaceIndex sendBufferSize:&unk_26CD90A20 wwanPreferred:prefersWWAN connectionType:v7 policyId:v8];

  return v9;
}

- (id)connectionType
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (!self->_urlSession)
  {
    uint64_t v16 = [[SiriCoreConnectionType alloc] initWithTechnology:0];
    goto LABEL_22;
  }
  connectionType = self->_connectionType;
  if (!connectionType)
  {
    id v4 = self->_outputStream;
    BOOL isMPTCP = self->_isMPTCP;
    uint64_t v6 = [(NSOutputStream *)v4 propertyForKey:*MEMORY[0x263EFC760]];
    uint64_t v7 = [v6 BOOLValue];

    uint64_t v8 = (os_log_t *)MEMORY[0x263F28358];
    uint64_t v9 = (void *)*MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      dispatch_data_t v10 = NSNumber;
      int v11 = v9;
      int v12 = [v10 numberWithBool:isMPTCP];
      int v13 = [NSNumber numberWithBool:v7];
      int v26 = 136315650;
      __int16 v27 = "-[SiriCoreNetworkSessionProvider connectionType]";
      __int16 v28 = 2112;
      __int16 v29 = v12;
      __int16 v30 = 2112;
      uint64_t v31 = v13;
      _os_log_impl(&dword_21CBF7000, v11, OS_LOG_TYPE_INFO, "%s Connection is MPTCP %@ isCellular %@", (uint8_t *)&v26, 0x20u);
    }
    if (isMPTCP)
    {
      int v14 = [[SiriCoreConnectionType alloc] initWithTechnology:3000];
    }
    else
    {
      int v17 = [(NSOutputStream *)v4 propertyForKey:*MEMORY[0x263EFC7B0]];
      interfaceName = self->_interfaceName;
      self->_interfaceName = v17;

      __int16 v19 = self->_interfaceName;
      v20 = *v8;
      BOOL v21 = os_log_type_enabled(*v8, OS_LOG_TYPE_INFO);
      if (v19)
      {
        if (v21)
        {
          int v26 = 136315394;
          __int16 v27 = "-[SiriCoreNetworkSessionProvider connectionType]";
          __int16 v28 = 2112;
          __int16 v29 = v19;
          _os_log_impl(&dword_21CBF7000, v20, OS_LOG_TYPE_INFO, "%s Interface name is %@.", (uint8_t *)&v26, 0x16u);
          __int16 v19 = self->_interfaceName;
        }
        self->_uint64_t interfaceIndex = if_nametoindex([(NSString *)v19 UTF8String]);
      }
      else
      {
        if (v21)
        {
          int v26 = 136315138;
          __int16 v27 = "-[SiriCoreNetworkSessionProvider connectionType]";
          _os_log_impl(&dword_21CBF7000, v20, OS_LOG_TYPE_INFO, "%s No interface name found.", (uint8_t *)&v26, 0xCu);
        }
        if (self->_connectByPOPEnabled)
        {
          int v22 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
          {
            int v26 = 136315138;
            __int16 v27 = "-[SiriCoreNetworkSessionProvider connectionType]";
            _os_log_impl(&dword_21CBF7000, v22, OS_LOG_TYPE_INFO, "%s Possible POP connection.", (uint8_t *)&v26, 0xCu);
          }
          __int16 v23 = [[SiriCoreConnectionType alloc] initWithTechnology:3003];
          int v24 = self->_connectionType;
          self->_connectionType = v23;
        }
      }
      if (self->_connectionType) {
        goto LABEL_20;
      }
      int v14 = +[SiriCoreNetworkManager connectionTypeForInterfaceName:self->_interfaceName isCellular:v7];
    }
    uint64_t v15 = self->_connectionType;
    self->_connectionType = v14;

LABEL_20:
    connectionType = self->_connectionType;
  }
  uint64_t v16 = connectionType;
LABEL_22:

  return v16;
}

- (BOOL)hasActiveConnection
{
  return self->_streamTask != 0;
}

- (void)openConnectionForURL:(id)a3 withConnectionId:(id)a4 initialPayload:(id)a5 completion:(id)a6
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  v89 = (SiriCoreNetworkSessionProvider *)a3;
  dispatch_data_t v10 = (SiriCoreNetworkSessionProvider *)a4;
  id v11 = a5;
  id v12 = a6;
  kdebug_trace();
  if (self->_completion_block)
  {
    int v13 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:18 userInfo:0];
    [(SiriCoreNetworkSessionProvider *)self _invokeOpenCompletionWithError:v13];
  }
  [(SiriCoreNetworkSessionProvider *)self _setupOpenTimer];
  int v14 = self->_route;
  BOOL prefersWWAN = self->_prefersWWAN;
  uint64_t v16 = (NSURL *)[(SiriCoreNetworkSessionProvider *)v89 copy];
  url = self->_url;
  self->_url = v16;

  v18 = (NSString *)[(SiriCoreNetworkSessionProvider *)v10 copy];
  connectionId = self->_connectionId;
  self->_connectionId = v18;

  self->_isCanceled = 0;
  v20 = v14;
  BOOL v21 = [(SiriCoreNetworkSessionProvider *)v89 host];
  int v22 = [(SAConnectionPolicyRoute *)v20 resolver];
  v88 = v20;
  uint64_t v23 = [(SAConnectionPolicyRoute *)v20 cname];
  int v24 = (void *)v23;
  if (v23) {
    __int16 v25 = (void *)v23;
  }
  else {
    __int16 v25 = v21;
  }
  v90 = v25;

  if (v22)
  {
    int v26 = v10;
    id v27 = v11;
    id v28 = v12;
    __int16 v29 = [(SAConnectionPolicyRoute *)v20 type];
    int v30 = [v29 isEqualToString:*MEMORY[0x263F65178]];

    if (v30)
    {
      uint64_t v31 = [(SAConnectionPolicyRoute *)v20 host];
      uint64_t v32 = (void *)v31;
      if (v31) {
        v33 = (void *)v31;
      }
      else {
        v33 = v21;
      }
      v34 = v33;

      v90 = v34;
    }
    id v12 = v28;
    id v11 = v27;
    dispatch_data_t v10 = v26;
  }

  if (!v90)
  {
    v35 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:10 userInfo:0];
    if (v35) {
      goto LABEL_71;
    }
  }
  if (self->_isCanceled)
  {
    v35 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:11 userInfo:0];
    if (v35) {
      goto LABEL_71;
    }
  }
  BOOL connectByPOPEnabled = self->_connectByPOPEnabled;
  v36 = [(SiriCoreNetworkSessionProvider *)v89 port];
  v82 = [(SiriCoreNetworkSessionProvider *)v89 scheme];
  uint64_t v37 = [v82 caseInsensitiveCompare:@"https"];
  policy = self->_policy;
  if (policy)
  {
    v39 = [(SAConnectionPolicy *)policy enableTcpFastOpen];
    int ShouldUseTFO = [v39 BOOLValue];
  }
  else if (AFIsInternalInstall() && (AFIsNano() & 1) == 0)
  {
    int ShouldUseTFO = _AFPreferencesShouldUseTFO();
  }
  else
  {
    int ShouldUseTFO = 0;
  }
  if (v37) {
    int v41 = 0;
  }
  else {
    int v41 = ShouldUseTFO;
  }
  int v79 = v41;
  int v80 = ShouldUseTFO;
  v86 = v12;
  BOOL v42 = prefersWWAN;
  if (v36)
  {
    unsigned int v84 = [v36 intValue];
  }
  else
  {
    if (v37) {
      int v43 = 80;
    }
    else {
      int v43 = 443;
    }
    unsigned int v84 = v43;
  }
  v44 = [MEMORY[0x263EFF9A0] dictionary];
  v45 = (os_log_t *)MEMORY[0x263F28358];
  v46 = (void *)*MEMORY[0x263F28358];
  id v85 = v11;
  v83 = v36;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    v47 = v10;
    v48 = NSNumber;
    v49 = v46;
    v50 = v48;
    dispatch_data_t v10 = v47;
    id v11 = v85;
    v51 = [v50 numberWithBool:v37 == 0];
    v45 = (os_log_t *)MEMORY[0x263F28358];
    v52 = [NSNumber numberWithBool:v42];
    *(_DWORD *)buf = 136316418;
    v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
    __int16 v99 = 2112;
    v100 = v89;
    __int16 v101 = 2112;
    v102 = (NSURLSessionStreamTask *)v90;
    __int16 v103 = 1024;
    *(_DWORD *)v104 = v84;
    *(_WORD *)&v104[4] = 2112;
    *(void *)&v104[6] = v51;
    *(_WORD *)&v104[14] = 2112;
    *(void *)&v104[16] = v52;
    _os_log_impl(&dword_21CBF7000, v49, OS_LOG_TYPE_INFO, "%s Connecting to %@ (resolved host = %@, port = %u, secure = %@, WWAN preferred %@)", buf, 0x3Au);
  }
  v53 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  [v53 setAllowsCellularAccess:1];
  [v53 setNetworkServiceType:4];
  uint64_t v54 = *MEMORY[0x263EFFB40];
  [v44 setObject:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263EFC6E0]];
  [v44 setObject:v54 forKey:*MEMORY[0x263EFC758]];
  if (v42)
  {
    v55 = *v45;
    if (os_log_type_enabled(*v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
      _os_log_impl(&dword_21CBF7000, v55, OS_LOG_TYPE_INFO, "%s Preferring WWAN", buf, 0xCu);
    }
    objc_msgSend(v53, "set_CTDataConnectionServiceType:", *MEMORY[0x263F02E10]);
  }
  else if ((AFIsHorseman() & 1) == 0)
  {
    v56 = [(SAConnectionPolicyRoute *)v88 mptcp];
    v57 = v56;
    if (v56) {
      uint64_t v58 = [v56 BOOLValue];
    }
    else {
      uint64_t v58 = 1;
    }
    objc_msgSend(v53, "set_allowsMultipathTCP:", v58);
    [v53 setMultipathServiceType:2];
  }
  if (connectByPOPEnabled)
  {
    v59 = *v45;
    if (os_log_type_enabled(*v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
      _os_log_impl(&dword_21CBF7000, v59, OS_LOG_TYPE_INFO, "%s Did not enable TLS. Using POP Connection method.", buf, 0xCu);
    }
    objc_msgSend(v53, "set_sourceApplicationSecondaryIdentifier:", @"ace.siri.apple.com");
  }
  else if (v37)
  {
    v74 = *v45;
    if (os_log_type_enabled(*v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
      __int16 v99 = 2112;
      v100 = v89;
      _os_log_impl(&dword_21CBF7000, v74, OS_LOG_TYPE_INFO, "%s Connecting to insecure ace server: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v95 = *MEMORY[0x263EFC6D8];
    uint64_t v96 = v54;
    v77 = [NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
    [v44 setObject:v77 forKey:*MEMORY[0x263EFC800]];
    objc_msgSend(v53, "set_allowsTLSSessionTickets:", 1);
    if (v80) {
      objc_msgSend(v53, "set_allowsTCPFastOpen:", 1);
    }
  }
  v81 = v44;
  objc_msgSend(v53, "set_socketStreamProperties:", v44);
  objc_msgSend(v53, "set_allowTCPIOConnectionStreamTask:", 1);
  os_log_t v60 = *v45;
  if (os_log_type_enabled(*v45, OS_LOG_TYPE_INFO))
  {
    v61 = v60;
    v62 = [v53 _socketStreamProperties];
    *(_DWORD *)buf = 136315394;
    v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
    __int16 v99 = 2112;
    v100 = v62;
    _os_log_impl(&dword_21CBF7000, v61, OS_LOG_TYPE_INFO, "%s stream properties %@", buf, 0x16u);
  }
  v63 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v53 delegate:self delegateQueue:self->_opQueue];
  v64 = v63;
  if (v90
    && ([v63 streamTaskWithHostName:v90 port:v84],
        v65 = (NSURLSessionStreamTask *)objc_claimAutoreleasedReturnValue(),
        objc_storeStrong((id *)&self->_resolvedHost, v90),
        v65))
  {
    v66 = *v45;
    if (os_log_type_enabled(*v45, OS_LOG_TYPE_INFO))
    {
      v67 = @"No TFO";
      *(_DWORD *)buf = 136316162;
      v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
      __int16 v99 = 2112;
      v100 = self;
      if (v79) {
        v67 = @"Enabling TFO";
      }
      __int16 v101 = 2112;
      v102 = v65;
      __int16 v103 = 2112;
      *(void *)v104 = v90;
      *(_WORD *)&v104[8] = 2112;
      *(void *)&v104[10] = v67;
      _os_log_impl(&dword_21CBF7000, v66, OS_LOG_TYPE_INFO, "%s self %@, task: %@ host:%@ %@", buf, 0x34u);
    }
    v68 = self->_openTimer;
    self->_isEstablishing = 1;
    v91[0] = MEMORY[0x263EF8330];
    v91[1] = 3221225472;
    v91[2] = __98__SiriCoreNetworkSessionProvider_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke;
    v91[3] = &unk_26443A398;
    v69 = v68;
    v92 = v69;
    v93 = self;
    id v94 = v86;
    v70 = (void *)MEMORY[0x21D4B91D0](v91);
    id completion_block = self->_completion_block;
    self->_id completion_block = v70;

    [(NSURLSessionStreamTask *)v65 set_initialDataPayload:v85];
    v78 = v10;
    if (connectByPOPEnabled)
    {
      if (v10) {
        NetworkServiceProxySetServiceNameForConnection();
      }
      v72 = *v45;
      if (os_log_type_enabled(*v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
        __int16 v99 = 2112;
        v100 = v78;
        _os_log_impl(&dword_21CBF7000, v72, OS_LOG_TYPE_INFO, "%s Setting NSPServiceName to %@", buf, 0x16u);
      }
    }
    else if (!v37)
    {
      [(NSURLSessionStreamTask *)v65 startSecureConnection];
    }
    [(NSURLSessionStreamTask *)v65 resume];
    [(NSURLSessionStreamTask *)v65 captureStreams];
    [v64 finishTasksAndInvalidate];
    streamTask = self->_streamTask;
    self->_streamTask = v65;
    v76 = v65;

    objc_storeStrong((id *)&self->_urlSession, v64);
    v35 = 0;
    dispatch_data_t v10 = v78;
    id v11 = v85;
  }
  else
  {
    v73 = *v45;
    if (os_log_type_enabled(*v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v98 = "-[SiriCoreNetworkSessionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]";
      __int16 v99 = 2112;
      v100 = v90;
      _os_log_impl(&dword_21CBF7000, v73, OS_LOG_TYPE_INFO, "%s Failed to create task for host:%@", buf, 0x16u);
    }
    [(SiriCoreNetworkSessionProvider *)self _cancelOpenTimer];
    v35 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:13 userInfo:0];
    [v64 invalidateAndCancel];
  }

  id v12 = v86;
  if (v35)
  {
LABEL_71:
    (*((void (**)(id, void *))v12 + 2))(v12, v35);
  }
}

void __98__SiriCoreNetworkSessionProvider_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(v3 + 10408);
  if (v4 == *(void **)(a1 + 32))
  {
    *(void *)(v3 + 10408) = 0;

    uint64_t v3 = *(void *)(a1 + 40);
  }
  *(unsigned char *)(v3 + 73) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 74) = v5 == 0;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_cancelOpenTimer
{
  openTimer = self->_openTimer;
  if (openTimer)
  {
    dispatch_source_cancel(openTimer);
    id v4 = self->_openTimer;
    self->_openTimer = 0;
  }
}

- (void)_setupOpenTimer
{
  uint64_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  dispatch_time_t v4 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__SiriCoreNetworkSessionProvider__setupOpenTimer__block_invoke;
  v8[3] = &unk_26443AF40;
  id v5 = v3;
  uint64_t v9 = v5;
  dispatch_data_t v10 = self;
  dispatch_source_set_event_handler(v5, v8);
  dispatch_resume(v5);
  openTimer = self->_openTimer;
  self->_openTimer = (OS_dispatch_source *)v5;
  uint64_t v7 = v5;
}

void __49__SiriCoreNetworkSessionProvider__setupOpenTimer__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[SiriCoreNetworkSessionProvider _setupOpenTimer]_block_invoke";
    _os_log_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_INFO, "%s Open timer firing", (uint8_t *)&v8, 0xCu);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3 == *(void **)(v4 + 10408))
  {
    *(void *)(v4 + 10408) = 0;
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:4 userInfo:0];
  if (AFDeviceSupportsSiriUOD()
    && (id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8)), v6, v6))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    [WeakRetained connectionProvider:*(void *)(a1 + 40) receivedError:v5];
  }
  else
  {
    [*(id *)(a1 + 40) _closeWithError:v5];
  }
}

- (BOOL)supportsInitialPayload
{
  return 1;
}

- (void)_cancelStaleConnectionTimer
{
  staleConnectionTimer = self->_staleConnectionTimer;
  if (staleConnectionTimer)
  {
    dispatch_source_cancel(staleConnectionTimer);
    uint64_t v4 = self->_staleConnectionTimer;
    self->_staleConnectionTimer = 0;
  }
}

- (void)_setupStaleConnectionTimer
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  unint64_t readWriteCounter = self->_readWriteCounter;
  self->_unint64_t readWriteCounter = readWriteCounter + 1;
  uint64_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  double staleConnectionInterval = self->_staleConnectionInterval;
  if (staleConnectionInterval == 0.0) {
    unint64_t v5 = 180000000000;
  }
  else {
    unint64_t v5 = (unint64_t)(staleConnectionInterval * 1000000000.0);
  }
  dispatch_time_t v6 = dispatch_time(0, v5);
  dispatch_source_set_timer(v3, v6, v5, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __60__SiriCoreNetworkSessionProvider__setupStaleConnectionTimer__block_invoke;
  handler[3] = &unk_26443AE50;
  id v12 = v13;
  handler[4] = self;
  uint64_t v7 = v3;
  id v11 = v7;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(v7);
  staleConnectionTimer = self->_staleConnectionTimer;
  self->_staleConnectionTimer = (OS_dispatch_source *)v7;
  uint64_t v9 = v7;

  _Block_object_dispose(v13, 8);
}

void __60__SiriCoreNetworkSessionProvider__setupStaleConnectionTimer__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (os_log_t *)MEMORY[0x263F28358];
  uint64_t v3 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 10424);
    int v13 = 136315650;
    int v14 = "-[SiriCoreNetworkSessionProvider _setupStaleConnectionTimer]_block_invoke";
    __int16 v15 = 2048;
    uint64_t v16 = v4;
    __int16 v17 = 2048;
    uint64_t v18 = v5;
    _os_log_impl(&dword_21CBF7000, v3, OS_LOG_TYPE_INFO, "%s Checking stale connection. Last counter value %tu current %tu", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 10424);
  if (*(void *)(v6 + 24) == v7)
  {
    int v8 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      int v14 = "-[SiriCoreNetworkSessionProvider _setupStaleConnectionTimer]_block_invoke";
      _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, "%s Connection is stale!", (uint8_t *)&v13, 0xCu);
    }
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(a1 + 40);
    if (v9 == *(void **)(v10 + 10416))
    {
      *(void *)(v10 + 10416) = 0;
    }
    id v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:30 userInfo:0];
    id v12 = [*(id *)(a1 + 32) delegate];
    [v12 connectionProvider:*(void *)(a1 + 32) receivedError:v11];
  }
  else
  {
    *(void *)(v6 + 24) = v7;
  }
}

- (void)_streamDidBecomeUnviable
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[SiriCoreNetworkSessionProvider _streamDidBecomeUnviable]";
    _os_log_impl(&dword_21CBF7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:3 userInfo:0];
  uint64_t v5 = [(SiriCoreNetworkSessionProvider *)self delegate];
  [v5 connectionProvider:self receivedError:v4];
}

- (void)URLSession:(id)a3 streamTask:(id)a4 didBecomeInputStream:(id)a5 outputStream:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v10 = (NSURLSession *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  urlSession = self->_urlSession;
  if (urlSession == v10)
  {
    self->_urlSession = 0;

    queue = self->_queue;
    if (queue) {
      dispatch_assert_queue_V2(queue);
    }
    if (v12 && v13)
    {
      [v12 setDelegate:self];
      [v13 setDelegate:self];
      [v12 open];
      [v13 open];
      __int16 v17 = [v12 streamError];
      if (!v17)
      {
        __int16 v17 = [v13 streamError];
        if (!v17)
        {
          if (self->_queue
            || ([MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:20 userInfo:0], (__int16 v17 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            objc_storeStrong((id *)&self->_inputStream, a5);
            objc_storeStrong((id *)&self->_outputStream, a6);
            MEMORY[0x21D4B8430](self->_inputStream, self->_queue);
            MEMORY[0x21D4B8480](self->_outputStream, self->_queue);
            objc_initWeak(&location, self);
            uint64_t v20 = MEMORY[0x263EF8330];
            uint64_t v21 = 3221225472;
            int v22 = __90__SiriCoreNetworkSessionProvider_URLSession_streamTask_didBecomeInputStream_outputStream___block_invoke;
            uint64_t v23 = &unk_26443A370;
            objc_copyWeak(&v24, &location);
            CFWriteStreamSetProperty((CFWriteStreamRef)v13, (CFStreamPropertyKey)*MEMORY[0x263EFC688], &v20);
            uint64_t v18 = objc_msgSend(v13, "propertyForKey:", *MEMORY[0x263EFC768], v20, v21, v22, v23);
            self->_BOOL isMPTCP = [v18 BOOLValue];

            uint64_t v19 = *MEMORY[0x263F28358];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              id v27 = "-[SiriCoreNetworkSessionProvider URLSession:streamTask:didBecomeInputStream:outputStream:]";
              _os_log_impl(&dword_21CBF7000, v19, OS_LOG_TYPE_INFO, "%s Connection became InputStreamOutputStream", buf, 0xCu);
            }
            objc_destroyWeak(&v24);
            objc_destroyWeak(&location);
            [(SiriCoreNetworkSessionProvider *)self _cancelOpenTimer];
            goto LABEL_17;
          }
        }
      }
      [v12 close];
      [v13 close];
      [(SiriCoreNetworkSessionProvider *)self _cancelOpenTimer];
    }
    else
    {
      __int16 v17 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:16 userInfo:0];
      [(SiriCoreNetworkSessionProvider *)self _cancelOpenTimer];
      if (!v17)
      {
LABEL_17:
        [(SiriCoreNetworkSessionProvider *)self _setupStaleConnectionTimer];
        __int16 v17 = 0;
      }
    }
    [(SiriCoreNetworkSessionProvider *)self _invokeOpenCompletionWithError:v17];

    goto LABEL_19;
  }
  __int16 v15 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v27 = "-[SiriCoreNetworkSessionProvider URLSession:streamTask:didBecomeInputStream:outputStream:]";
    __int16 v28 = 2112;
    __int16 v29 = v10;
    __int16 v30 = 2112;
    uint64_t v31 = urlSession;
    _os_log_impl(&dword_21CBF7000, v15, OS_LOG_TYPE_INFO, "%s Ignoring session callback from session %@ current session %@", buf, 0x20u);
  }
LABEL_19:
}

void __90__SiriCoreNetworkSessionProvider_URLSession_streamTask_didBecomeInputStream_outputStream___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[SiriCoreNetworkSessionProvider URLSession:streamTask:didBecomeInputStream:outputStream:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = a3;
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s Connection viability changed %d", (uint8_t *)&v7, 0x12u);
  }
  if (!a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _streamDidBecomeUnviable];
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v6 = (NSURLSession *)a3;
  int v7 = (NSURLSession *)a4;
  uint64_t v8 = (os_log_t *)MEMORY[0x263F28358];
  __int16 v9 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    id v13 = "-[SiriCoreNetworkSessionProvider URLSession:didBecomeInvalidWithError:]";
    __int16 v14 = 2112;
    __int16 v15 = v6;
    __int16 v16 = 2112;
    __int16 v17 = v7;
    _os_log_impl(&dword_21CBF7000, v9, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v12, 0x20u);
  }
  urlSession = self->_urlSession;
  if (urlSession == v6)
  {
    self->_urlSession = 0;

    [(SiriCoreNetworkSessionProvider *)self _invokeOpenCompletionWithError:v7];
  }
  else
  {
    uint64_t v11 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315650;
      id v13 = "-[SiriCoreNetworkSessionProvider URLSession:didBecomeInvalidWithError:]";
      __int16 v14 = 2112;
      __int16 v15 = v6;
      __int16 v16 = 2112;
      __int16 v17 = urlSession;
      _os_log_impl(&dword_21CBF7000, v11, OS_LOG_TYPE_INFO, "%s Ignoring session callback from session %@ current session %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)URLSession:(id)a3 betterRouteDiscoveredForStreamTask:(id)a4
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[SiriCoreNetworkSessionProvider URLSession:betterRouteDiscoveredForStreamTask:]";
    _os_log_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_INFO, "%s NSURLSession better route available. Not supported.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v6 = (NSInputStream *)a3;
  uint64_t v7 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    __int16 v14 = "-[SiriCoreNetworkSessionProvider stream:handleEvent:]";
    __int16 v15 = 2112;
    __int16 v16 = v6;
    __int16 v17 = 2048;
    unint64_t v18 = a4;
    _os_log_impl(&dword_21CBF7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ %lu", (uint8_t *)&v13, 0x20u);
  }
  if (self->_inputStream == v6)
  {
    if (a4 == 16 || a4 == 8)
    {
      uint64_t v8 = [(NSInputStream *)v6 streamError];
      __int16 v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:8 userInfo:0];
      }
      uint64_t v11 = v10;

      [(SiriCoreNetworkSessionProvider *)self _closeWithError:v11];
      int v12 = [(SiriCoreNetworkSessionProvider *)self delegate];
      [v12 connectionProvider:self receivedError:v11];
    }
    else if (a4 == 2 && self->_waitingOnReadGroup)
    {
      dispatch_group_leave((dispatch_group_t)self->_readGroup);
      self->_waitingOnReadGroup = 0;
    }
  }
}

- (void)_invokeOpenCompletionWithError:(id)a3
{
  id completion_block = self->_completion_block;
  if (completion_block)
  {
    id v5 = a3;
    uint64_t v7 = (void (**)(id, id))MEMORY[0x21D4B91D0](completion_block);
    id v6 = self->_completion_block;
    self->_id completion_block = 0;

    v7[2](v7, v5);
  }
}

- (BOOL)shouldFallbackQuickly
{
  return 0;
}

- (id)headerDataWithForceReconnect:(BOOL)a3
{
  return 0;
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (SiriCoreNetworkSessionProvider)initWithQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriCoreNetworkSessionProvider;
  id v6 = [(SiriCoreNetworkSessionProvider *)&v12 init];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F08A48]);
    uint64_t v8 = (void *)*((void *)v6 + 11);
    *((void *)v6 + 11) = v7;

    [*((id *)v6 + 11) setUnderlyingQueue:v5];
    [*((id *)v6 + 11) setMaxConcurrentOperationCount:1];
    objc_storeStrong((id *)v6 + 16, a3);
    dispatch_group_t v9 = dispatch_group_create();
    id v10 = (void *)*((void *)v6 + 1298);
    *((void *)v6 + 1298) = v9;

    dispatch_group_enter(*((dispatch_group_t *)v6 + 1298));
    *((unsigned char *)v6 + 10392) = 1;
  }

  return (SiriCoreNetworkSessionProvider *)v6;
}

+ (void)getMetricsContext:(id)a3
{
}

@end