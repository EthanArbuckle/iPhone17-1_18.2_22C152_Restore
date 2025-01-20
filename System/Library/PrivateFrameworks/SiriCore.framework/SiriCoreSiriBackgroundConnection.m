@interface SiriCoreSiriBackgroundConnection
- (BOOL)_canFallBackFromError:(id)a3;
- (BOOL)_consumeAceDataWithData:(id)a3 bytesRead:(unint64_t *)a4 error:(id *)a5;
- (BOOL)_consumeAceHeaderWithData:(id)a3 bytesRead:(unint64_t *)a4 error:(id *)a5;
- (BOOL)_consumeHTTPHeaderWithData:(id)a3 bytesRead:(unint64_t *)a4 error:(id *)a5;
- (BOOL)_hasBufferedDataOrOutstandingPings;
- (BOOL)_hasReadACEHeader;
- (BOOL)_hasReadHTTPHeader;
- (BOOL)_sendAcePingWithId:(unsigned int)a3 error:(id *)a4;
- (BOOL)_sendAcePongWithId:(unsigned int)a3 error:(id *)a4;
- (BOOL)_shouldTrySameConnectionMethodForMethod:(int64_t)a3 error:(id)a4;
- (BOOL)_tcpInfoIndicatesPoorLinkQuality;
- (BOOL)_tryParsingHTTPHeaderData:(id)a3 partialMessage:(__CFHTTPMessage *)a4 statusCode:(int64_t *)a5 bytesRead:(unint64_t *)a6 error:(id *)a7;
- (BOOL)_tryReadingHTTPHeaderData:(id)a3 withMessage:(__CFHTTPMessage *)a4 bytesRead:(unint64_t *)a5 error:(id *)a6;
- (BOOL)_tryReadingParsedDataFromBytes:(const void *)a3 length:(unint64_t)a4 packet:(id *)a5 object:(id *)a6 bytesParsed:(unint64_t *)a7 error:(id *)a8;
- (BOOL)_usingFlorence;
- (BOOL)_usingNetwork;
- (BOOL)_usingPOP;
- (BOOL)_usingPOPOnPeer;
- (BOOL)_usingPeer;
- (BOOL)_wifiOrCellularMayBeBetterThanCurrentStream;
- (BOOL)deviceIsInWalkaboutExperimentGroup;
- (BOOL)siriConnectionUsesPeerManagedSync;
- (BOOL)usesProxyConnection;
- (Class)_providerClass;
- (Class)peerProviderClass;
- (NSString)peerType;
- (NSString)peerVersion;
- (NSString)productTypePrefix;
- (SiriCoreSiriBackgroundConnection)init;
- (SiriCoreSiriBackgroundConnection)initWithQueue:(id)a3;
- (SiriCoreSiriBackgroundConnectionDelegate)delegate;
- (id)_aceHeaderData;
- (id)_bestErrorBetweenError:(id)a3 peerError:(id)a4;
- (id)_connectionMethodDescription;
- (id)_connectionType;
- (id)_getInitialPayloadWithBufferedLength:(unint64_t *)a3 forceReconnect:(BOOL)a4;
- (id)_headerDataForURL:(id)a3 aceHost:(id)a4 languageCode:(id)a5 syncAssistantId:(id)a6;
- (id)_httpHeaderData;
- (id)_tryReadingAceHeaderFromData:(id)a3 bytesParsed:(unint64_t *)a4 error:(id *)a5;
- (id)analysisInfo;
- (int64_t)_checkForProgressOnReadingData;
- (int64_t)_checkPings;
- (int64_t)_nextConnectionMethod;
- (int64_t)_normalizeSNR:(int64_t)a3;
- (void)_aceHeaderTimeoutFired:(id)a3 afterTimeout:(double)a4;
- (void)_bufferGeneralData:(id)a3;
- (void)_cancelOutstandingBarriers;
- (void)_cancelSecondaryConnection;
- (void)_closeConnection;
- (void)_closeConnectionAndPrepareForReconnect:(BOOL)a3;
- (void)_connectionHasBytesAvailable:(id)a3;
- (void)_didEncounterError:(id)a3;
- (void)_fallBackToNextConnectionMethod:(int64_t)a3 fromError:(id)a4 afterDelay:(double)a5;
- (void)_fallBackToNextConnectionMethodWithError:(id)a3 orElse:(id)a4;
- (void)_forceTriggerRetry;
- (void)_getCellularMetrics:(id)a3;
- (void)_getWifiMetrics:(id)a3;
- (void)_handleAceEnd;
- (void)_handleAceNop;
- (void)_handleAceObject:(id)a3;
- (void)_handleAcePing:(unsigned int)a3;
- (void)_handleAcePong:(unsigned int)a3;
- (void)_handleBarrierReply:(unsigned int)a3;
- (void)_handlePacket:(id *)a3;
- (void)_initializeBufferedGeneralOutputDataWithInitialPayload:(BOOL)a3;
- (void)_networkProviderDidOpen;
- (void)_pingTimerFired;
- (void)_prepareProviderHeaderWithForceReconnect:(BOOL)a3;
- (void)_resumePingTimer;
- (void)_scheduleAceHeaderTimeoutTimerWithInterval:(double)a3;
- (void)_sendGeneralData:(id)a3;
- (void)_setNetworkProvider:(id)a3;
- (void)_setupReadHandlerOnProvider;
- (void)_startNetworkProviderWithInfo:(id)a3;
- (void)_startSecondaryConnection;
- (void)_startWithConnectionInfo:(id)a3 proposedFallbackMethod:(int64_t)a4 allowFallbackToNewMethod:(BOOL)a5;
- (void)_tryToWriteBufferedOutputData;
- (void)_updateBuffersForInitialPayload:(id)a3 bufferedLength:(unint64_t)a4 forceReconnect:(BOOL)a5;
- (void)barrier:(id)a3;
- (void)cancel;
- (void)connectionProvider:(id)a3 receivedError:(id)a4;
- (void)connectionProvider:(id)a3 receivedIntermediateError:(id)a4;
- (void)connectionProvider:(id)a3 receivedViabilityChangeNotification:(BOOL)a4;
- (void)connectionProviderReceivedBetterRouteNotification:(id)a3;
- (void)dealloc;
- (void)getConnectionMetrics:(id)a3 withCompletion:(id)a4;
- (void)sendCommand:(id)a3 moreComing:(BOOL)a4 errorHandler:(id)a5;
- (void)sendCommands:(id)a3 errorHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDeviceIsInWalkaboutExperimentGroup:(BOOL)a3;
- (void)setPeerProviderClass:(Class)a3;
- (void)setPeerType:(id)a3;
- (void)setPeerVersion:(id)a3;
- (void)setProductTypePrefix:(id)a3;
- (void)setSendPings:(BOOL)a3;
- (void)setSiriConnectionUsesPeerManagedSync:(BOOL)a3;
- (void)setUsesProxyConnection:(BOOL)a3;
- (void)startWithConnectionInfo:(id)a3;
- (void)updateActiveBackgroundConnectionWithSecondary;
@end

@implementation SiriCoreSiriBackgroundConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryConnectionProvider, 0);
  objc_storeStrong((id *)&self->_outgoingCommandsWithSendCompletions, 0);
  objc_storeStrong((id *)&self->_peerProviderClass, 0);
  objc_storeStrong((id *)&self->_productTypePrefix, 0);
  objc_storeStrong((id *)&self->_peerVersion, 0);
  objc_storeStrong((id *)&self->_peerType, 0);
  objc_storeStrong((id *)&self->_metricsQueue, 0);
  objc_storeStrong((id *)&self->_safetyNetBuffer, 0);
  objc_storeStrong((id *)&self->_outstandingBarriers, 0);
  objc_storeStrong((id *)&self->_pingInfo, 0);
  objc_storeStrong((id *)&self->_pingTimerSource, 0);
  objc_storeStrong((id *)&self->_aceHeaderTimerSource, 0);
  objc_storeStrong((id *)&self->_errorsForConnectionMethods, 0);
  objc_storeStrong((id *)&self->_outputCompressor, 0);
  objc_storeStrong((id *)&self->_inputDecompressor, 0);
  objc_storeStrong((id *)&self->_bufferedUncompressedData, 0);
  objc_storeStrong((id *)&self->_bufferedGeneralOutputData, 0);
  objc_storeStrong((id *)&self->_bufferedProviderHeaderOutputData, 0);
  objc_storeStrong((id *)&self->_bufferedInputData, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDeviceIsInWalkaboutExperimentGroup:(BOOL)a3
{
  self->_deviceIsInWalkaboutExperimentGroup = a3;
}

- (BOOL)deviceIsInWalkaboutExperimentGroup
{
  return self->_deviceIsInWalkaboutExperimentGroup;
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

- (void)setDelegate:(id)a3
{
}

- (SiriCoreSiriBackgroundConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SiriCoreSiriBackgroundConnectionDelegate *)WeakRetained;
}

- (void)getConnectionMetrics:(id)a3 withCompletion:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  BOOL isCanceled = self->_isCanceled;
  if (self->_isCanceled || self->_dispatchedSnapshotMetrics)
  {
    v9 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      BOOL dispatchedSnapshotMetrics = self->_dispatchedSnapshotMetrics;
      *(_DWORD *)buf = 136315650;
      v58 = "-[SiriCoreSiriBackgroundConnection getConnectionMetrics:withCompletion:]";
      __int16 v59 = 1024;
      BOOL v60 = isCanceled;
      __int16 v61 = 1024;
      BOOL v62 = dispatchedSnapshotMetrics;
      _os_log_impl(&dword_21CBF7000, v9, OS_LOG_TYPE_INFO, "%s isCanceled %d dispatched %d", buf, 0x18u);
    }
    v7[2](v7, 0);
  }
  else
  {
    ++self->_metricsCount;
    v11 = objc_alloc_init(SiriCoreConnectionMetrics);
    [(SiriCoreConnectionMetrics *)v11 setConnectionMethodHistory:v6];
    double currentOpenTime = self->_currentOpenTime;
    double firstStartTime = self->_firstStartTime;
    if (currentOpenTime > firstStartTime)
    {
      v14 = [NSNumber numberWithDouble:currentOpenTime - firstStartTime];
      [(SiriCoreConnectionMetrics *)v11 setTimeUntilOpen:v14];

      double firstStartTime = self->_firstStartTime;
    }
    double firstByteReadTime = self->_firstByteReadTime;
    if (firstByteReadTime > firstStartTime)
    {
      v16 = [NSNumber numberWithDouble:firstByteReadTime - firstStartTime];
      [(SiriCoreConnectionMetrics *)v11 setTimeUntilFirstByteRead:v16];
    }
    v17 = [NSNumber numberWithUnsignedInteger:self->_startCount];
    [(SiriCoreConnectionMetrics *)v11 setAttemptCount:v17];

    v18 = [NSNumber numberWithUnsignedInteger:self->_metricsCount];
    [(SiriCoreConnectionMetrics *)v11 setMetricsCount:v18];

    pingInfo = self->_pingInfo;
    if (pingInfo)
    {
      uint64_t v20 = [(SiriCorePingInfo *)pingInfo numberOfUnacknowledgedPings];
      int64_t v21 = [(SiriCorePingInfo *)self->_pingInfo pingAcknowledgedCount] + v20;
      v22 = NSNumber;
      [(SiriCorePingInfo *)self->_pingInfo avgPingTime];
      v23 = objc_msgSend(v22, "numberWithDouble:");
      [(SiriCoreConnectionMetrics *)v11 setMeanPing:v23];

      v24 = [NSNumber numberWithInteger:v21];
      [(SiriCoreConnectionMetrics *)v11 setPingCount:v24];

      v25 = [NSNumber numberWithInteger:v20];
      [(SiriCoreConnectionMetrics *)v11 setUnacknowledgedPingCount:v25];
    }
    else
    {
      [(SiriCoreConnectionMetrics *)v11 setMeanPing:&unk_26CD90A68];
      [(SiriCoreConnectionMetrics *)v11 setPingCount:&unk_26CD90A68];
      [(SiriCoreConnectionMetrics *)v11 setUnacknowledgedPingCount:&unk_26CD90A68];
    }
    v26 = [(SiriCoreSiriBackgroundConnection *)self _connectionMethodDescription];
    [(SiriCoreConnectionMetrics *)v11 setConnectionMethod:v26];

    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    [(SiriCoreConnectionMetrics *)v11 setProviderStyle:v28];

    v29 = [(SiriCoreSiriConnectionInfo *)self->_connectionInfo connectionPolicy];
    v30 = v29;
    if (v29)
    {
      v31 = [v29 policyId];
      [(SiriCoreConnectionMetrics *)v11 setPolicyId:v31];
    }
    v32 = dispatch_group_create();
    metricsQueue = self->_metricsQueue;
    if (!metricsQueue)
    {
      v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v35 = dispatch_queue_attr_make_with_qos_class(v34, QOS_CLASS_DEFAULT, 0);

      v36 = (OS_dispatch_queue *)dispatch_queue_create(0, v35);
      v37 = self->_metricsQueue;
      self->_metricsQueue = v36;

      metricsQueue = self->_metricsQueue;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke;
    block[3] = &unk_26443AF40;
    block[4] = self;
    v38 = v11;
    v56 = v38;
    dispatch_group_async(v32, metricsQueue, block);
    v39 = self->_metricsQueue;
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke_2;
    v53[3] = &unk_26443AF40;
    v53[4] = self;
    v40 = v38;
    v54 = v40;
    dispatch_group_async(v32, v39, v53);
    connectionProvider = self->_connectionProvider;
    if (connectionProvider)
    {
      v42 = connectionProvider;
      dispatch_group_enter(v32);
      v43 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v58 = "-[SiriCoreSiriBackgroundConnection getConnectionMetrics:withCompletion:]";
        _os_log_debug_impl(&dword_21CBF7000, v43, OS_LOG_TYPE_DEBUG, "%s Asking for metrics from stream provider", buf, 0xCu);
      }
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke_250;
      v50[3] = &unk_26443AF40;
      v51 = v42;
      v52 = v32;
      v44 = v42;
      [(SiriCoreConnectionProvider *)v44 updateConnectionMetrics:v40 completion:v50];
    }
    queue = self->_queue;
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke_251;
    v47[3] = &unk_26443AFD8;
    v47[4] = self;
    v48 = v40;
    v49 = v7;
    v46 = v40;
    dispatch_group_notify(v32, queue, v47);
  }
}

uint64_t __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getWifiMetrics:*(void *)(a1 + 40)];
}

uint64_t __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getCellularMetrics:*(void *)(a1 + 40)];
}

void __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke_250(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 136315394;
    v5 = "-[SiriCoreSiriBackgroundConnection getConnectionMetrics:withCompletion:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_debug_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_DEBUG, "%s Got metrics from stream provider %@", (uint8_t *)&v4, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke_251(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 360) = 1;
  v2 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[SiriCoreSiriBackgroundConnection getConnectionMetrics:withCompletion:]_block_invoke";
    _os_log_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_INFO, "%s Giving metrics back", (uint8_t *)&v4, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_connectionMethodDescription
{
  int64_t connectionMethod = self->_connectionMethod;
  if (connectionMethod == 2)
  {
    uint64_t v6 = self->_connectionInfo;
    uint64_t v7 = [(SiriCoreSiriConnectionInfo *)v6 connectionPolicyRoute];
    uint64_t v8 = [v7 type];
    char v9 = [v8 isEqualToString:*MEMORY[0x263F65178]];

    if (v9)
    {
      int v4 = @"Florence";
    }
    else
    {
      int v10 = [(SiriCoreConnectionProvider *)self->_connectionProvider isMultipath];
      uint64_t v11 = [(SiriCoreSiriConnectionInfo *)v6 connectionPolicy];
      if (v11
        && (v12 = (void *)v11,
            BOOL v13 = [(SiriCoreSiriConnectionInfo *)v6 imposePolicyBan],
            v12,
            v13))
      {
        v14 = @"TCP_PolicyBanned";
        if (v10) {
          v14 = @"MPTCP_PolicyBanned";
        }
        int v4 = v14;
      }
      else if (v10)
      {
        int v4 = @"MPTCP";
      }
      else
      {
        int v4 = @"TCP";
      }
    }
  }
  else
  {
    uint64_t v3 = @"TCP";
    if (connectionMethod == 3) {
      uint64_t v3 = @"Peer";
    }
    if (connectionMethod == 4) {
      int v4 = @"Tuscany";
    }
    else {
      int v4 = v3;
    }
  }

  return v4;
}

- (id)analysisInfo
{
  return (id)[(SiriCoreConnectionProvider *)self->_connectionProvider analysisInfo];
}

- (void)_handleAceEnd
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = (os_log_t *)MEMORY[0x263F28358];
  int v4 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[SiriCoreSiriBackgroundConnection _handleAceEnd]";
    _os_log_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_INFO, "%s Connection got ace end. Terminating connection", (uint8_t *)&v7, 0xCu);
  }
  if ([(SiriCoreSiriBackgroundConnection *)self _hasBufferedDataOrOutstandingPings])
  {
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[SiriCoreSiriBackgroundConnection _handleAceEnd]";
      _os_log_error_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_ERROR, "%s Ace end is unexpected, return error", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:8 userInfo:0];
    [(SiriCoreSiriBackgroundConnection *)self _didEncounterError:v6];
  }
  [(SiriCoreSiriBackgroundConnection *)self cancel];
}

- (void)_handleAcePong:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[SiriCoreSiriBackgroundConnection _handleAcePong:]";
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s Connection got pong %u", (uint8_t *)&v7, 0x12u);
  }
  if (v3 > 0xFFFE795F)
  {
    [(SiriCoreSiriBackgroundConnection *)self _handleBarrierReply:v3];
  }
  else
  {
    [(SiriCorePingInfo *)self->_pingInfo markPongReceivedWithIndex:v3];
    uint64_t v6 = [MEMORY[0x263F283F8] sharedAnalytics];
    [v6 logEventWithType:1006 context:0];
  }
}

- (void)_handleAcePing:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    int v7 = "-[SiriCoreSiriBackgroundConnection _handleAcePing:]";
    __int16 v8 = 1024;
    int v9 = v3;
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s Connection got ping %u", (uint8_t *)&v6, 0x12u);
  }
  [(SiriCoreSiriBackgroundConnection *)self _sendAcePongWithId:v3 error:0];
}

- (void)_handleAceObject:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)*MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v6 = v5;
    int v7 = [v4 encodedClassName];
    int v9 = 136315394;
    uint64_t v10 = "-[SiriCoreSiriBackgroundConnection _handleAceObject:]";
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_21CBF7000, v6, OS_LOG_TYPE_INFO, "%s Connection got AceObject: %@", (uint8_t *)&v9, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained siriBackgroundConnection:self didReceiveAceObject:v4];
}

- (void)_handleAceNop
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    id v4 = "-[SiriCoreSiriBackgroundConnection _handleAceNop]";
    _os_log_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_INFO, "%s Connection got nop", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_handlePacket:(id *)a3
{
  switch(a3->var0)
  {
    case 1u:
      [(SiriCoreSiriBackgroundConnection *)self _handleAceNop];
      break;
    case 2u:
      [(SiriCoreSiriBackgroundConnection *)self _handleAcePing:a3->var1];
      break;
    case 3u:
      [(SiriCoreSiriBackgroundConnection *)self _handleAcePong:a3->var1];
      break;
    case 4u:
      [(SiriCoreSiriBackgroundConnection *)self _handleAceEnd];
      break;
    default:
      return;
  }
}

- (BOOL)_tryReadingParsedDataFromBytes:(const void *)a3 length:(unint64_t)a4 packet:(id *)a5 object:(id *)a6 bytesParsed:(unint64_t *)a7 error:(id *)a8
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  unint64_t v27 = 0;
  $391024036B902F3EE9BCB0FBA5EF777F v28 = 0;
  id v25 = 0;
  id v26 = 0;
  +[SiriCoreAceSerialization tryParsingPacketWithBytes:a3 length:a4 rawPacket:&v28 object:&v26 bytesRead:&v27 error:&v25];
  id v12 = v26;
  id v13 = v25;
  if (!v13)
  {
    if (v12) {
      BOOL v21 = 0;
    }
    else {
      BOOL v21 = v28.var0 == 0;
    }
    if (v21)
    {
      v22 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[SiriCoreSiriBackgroundConnection _tryReadingParsedDataFromBytes:length:packet:object:bytesParsed:error:]";
        _os_log_impl(&dword_21CBF7000, v22, OS_LOG_TYPE_INFO, "%s No error parsing packet but we didn't get anything!", buf, 0xCu);
      }
    }
LABEL_14:
    v14 = 0;
    if (!a5) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v14 = v13;
  v15 = [v13 domain];
  if ([v15 isEqualToString:@"SiriCoreAceSerializationErrorDomain"])
  {
    uint64_t v16 = [v14 code];

    if (!v16)
    {
      v17 = [v14 userInfo];
      v18 = [v17 objectForKey:@"SiriCoreAceSerializationErrorUserInfoBytesNeeded"];
      v19 = [v17 objectForKey:@"SiriCoreAceSerializationErrorUserInfoBytesAvailable"];
      uint64_t v20 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v30 = "-[SiriCoreSiriBackgroundConnection _tryReadingParsedDataFromBytes:length:packet:object:bytesParsed:error:]";
        __int16 v31 = 2112;
        v32 = v18;
        __int16 v33 = 2112;
        v34 = v19;
        _os_log_impl(&dword_21CBF7000, v20, OS_LOG_TYPE_INFO, "%s Need more data to read packet. Needed: %@ Have: %@", buf, 0x20u);
      }

      unint64_t v27 = 0;
      goto LABEL_14;
    }
  }
  else
  {
  }
  v23 = *MEMORY[0x263F28358];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
  {
    if (!a5) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  *(_DWORD *)buf = 136315394;
  v30 = "-[SiriCoreSiriBackgroundConnection _tryReadingParsedDataFromBytes:length:packet:object:bytesParsed:error:]";
  __int16 v31 = 2114;
  v32 = v14;
  _os_log_error_impl(&dword_21CBF7000, v23, OS_LOG_TYPE_ERROR, "%s Error parsing packet data %{public}@", buf, 0x16u);
  if (a5) {
LABEL_19:
  }
    *a5 = v28;
LABEL_20:
  if (a6) {
    *a6 = v12;
  }
  if (a7) {
    *a7 = v27;
  }
  if (a8) {
    *a8 = v14;
  }

  return v14 == 0;
}

- (id)_tryReadingAceHeaderFromData:(id)a3 bytesParsed:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v17 = 0;
  id v15 = 0;
  unint64_t v16 = 0;
  +[SiriCoreAceSerialization tryParsingAceHeaderData:a3 compressionType:&v17 bytesRead:&v16 error:&v15];
  id v7 = v15;
  __int16 v8 = v7;
  if (v7)
  {
    int v9 = [v7 domain];
    if ([v9 isEqualToString:@"SiriCoreAceSerializationErrorDomain"])
    {
      uint64_t v10 = [v8 code];

      if (!v10)
      {
        __int16 v11 = *MEMORY[0x263F28358];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v19 = "-[SiriCoreSiriBackgroundConnection _tryReadingAceHeaderFromData:bytesParsed:error:]";
          _os_log_impl(&dword_21CBF7000, v11, OS_LOG_TYPE_INFO, "%s Need more data to read ace header.", buf, 0xCu);
        }

        __int16 v8 = 0;
        goto LABEL_12;
      }
    }
    else
    {
    }
    id v13 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SiriCoreSiriBackgroundConnection _tryReadingAceHeaderFromData:bytesParsed:error:]";
      __int16 v20 = 2114;
      BOOL v21 = v8;
      _os_log_error_impl(&dword_21CBF7000, v13, OS_LOG_TYPE_ERROR, "%s Error reading ace header %{public}@", buf, 0x16u);
    }
LABEL_12:
    id v12 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  id v12 = objc_alloc_init((Class)objc_opt_class());
  if (a4) {
LABEL_13:
  }
    *a4 = v16;
LABEL_14:
  if (a5) {
    *a5 = v8;
  }

  return v12;
}

- (BOOL)_tryParsingHTTPHeaderData:(id)a3 partialMessage:(__CFHTTPMessage *)a4 statusCode:(int64_t *)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v11 = a3;
  unint64_t v12 = [v11 length];
  id v13 = v11;
  v14 = (const UInt8 *)[v13 bytes];

  if (!CFHTTPMessageAppendBytes(a4, v14, v12))
  {
    __int16 v20 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:1 userInfo:0];
    unint64_t v12 = 0;
    goto LABEL_10;
  }
  if (!CFHTTPMessageIsHeaderComplete(a4))
  {
    __int16 v20 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionInternalErrorDomain" code:0 userInfo:0];
LABEL_10:
    CFIndex ResponseStatusCode = 0;
    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  CFDataRef v15 = CFHTTPMessageCopyBody(a4);
  if (v15)
  {
    CFDataRef v16 = v15;
    unint64_t Length = CFDataGetLength(v15);
    unint64_t v18 = v12 - Length;
    if (v12 <= Length)
    {
      unint64_t v23 = Length;
      v24 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
      {
        int v25 = 136315650;
        id v26 = "-[SiriCoreSiriBackgroundConnection _tryParsingHTTPHeaderData:partialMessage:statusCode:bytesRead:error:]";
        __int16 v27 = 2050;
        unint64_t v28 = v23;
        __int16 v29 = 2050;
        unint64_t v30 = v12;
        _os_log_error_impl(&dword_21CBF7000, v24, OS_LOG_TYPE_ERROR, "%s Something has gone terribly wrong. bytesRead: %{public}lld bodyLength: %{public}tu", (uint8_t *)&v25, 0x20u);
      }
      __int16 v20 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:15 userInfo:0];
      unint64_t v18 = 0;
    }
    else
    {
      v19 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
      {
        int v25 = 136315394;
        id v26 = "-[SiriCoreSiriBackgroundConnection _tryParsingHTTPHeaderData:partialMessage:statusCode:bytesRead:error:]";
        __int16 v27 = 2048;
        unint64_t v28 = v18;
        _os_log_impl(&dword_21CBF7000, v19, OS_LOG_TYPE_INFO, "%s Header is complete bytes read %tu", (uint8_t *)&v25, 0x16u);
      }
      __int16 v20 = 0;
    }
    CFRelease(v16);
    unint64_t v12 = v18;
  }
  else
  {
    __int16 v20 = 0;
  }
  CFIndex ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(a4);
  if (a5) {
LABEL_11:
  }
    *a5 = ResponseStatusCode;
LABEL_12:
  if (a6) {
    *a6 = v12;
  }
  if (a7) {
    *a7 = v20;
  }

  return v20 == 0;
}

- (BOOL)_tryReadingHTTPHeaderData:(id)a3 withMessage:(__CFHTTPMessage *)a4 bytesRead:(unint64_t *)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v19 = 0;
  __int16 v20 = 0;
  [(SiriCoreSiriBackgroundConnection *)self _tryParsingHTTPHeaderData:a3 partialMessage:a4 statusCode:&v20 bytesRead:a5 error:&v19];
  id v8 = v19;
  int v9 = v8;
  if (v8 || v20 == (void *)200)
  {
    CFDataRef v15 = [v8 domain];
    if ([v15 isEqualToString:@"SiriCoreSiriConnectionInternalErrorDomain"])
    {
      uint64_t v16 = [v9 code];

      if (!v16)
      {

        int v9 = 0;
        if (!a6) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
    }
    else
    {
    }
    if (v9
      && (char v17 = *MEMORY[0x263F28358], os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[SiriCoreSiriBackgroundConnection _tryReadingHTTPHeaderData:withMessage:bytesRead:error:]";
      __int16 v23 = 2114;
      v24 = v9;
      _os_log_error_impl(&dword_21CBF7000, v17, OS_LOG_TYPE_ERROR, "%s Error reading HTTP Header %{public}@", buf, 0x16u);
      if (!a6) {
        goto LABEL_20;
      }
    }
    else if (!a6)
    {
      goto LABEL_20;
    }
LABEL_19:
    *a6 = v9;
    goto LABEL_20;
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x263F088A0], "localizedStringForStatusCode:");
  id v11 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = "-[SiriCoreSiriBackgroundConnection _tryReadingHTTPHeaderData:withMessage:bytesRead:error:]";
    __int16 v23 = 2050;
    v24 = v20;
    __int16 v25 = 2114;
    id v26 = v10;
    _os_log_error_impl(&dword_21CBF7000, v11, OS_LOG_TYPE_ERROR, "%s HTTP status code %{public}ld: %{public}@", buf, 0x20u);
  }
  unint64_t v12 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(self->_httpResponseHeader, @"Location");
  id v13 = [MEMORY[0x263EFF9A0] dictionary];
  v14 = [NSNumber numberWithInteger:v20];
  [v13 setObject:v14 forKey:@"SiriCoreSiriConnectionHTTPErrorStatusCodeKey"];

  if (v10) {
    [v13 setObject:v10 forKey:*MEMORY[0x263F08320]];
  }
  if (v12) {
    [v13 setObject:v12 forKey:@"SiriCoreSiriConnectionHTTPRedirectValueKey"];
  }
  int v9 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:0 userInfo:v13];

  if (a6) {
    goto LABEL_19;
  }
LABEL_20:

  return v9 == 0;
}

- (void)_setupReadHandlerOnProvider
{
  kdebug_trace();
  int v3 = self->_connectionProvider;
  connectionProvider = self->_connectionProvider;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__SiriCoreSiriBackgroundConnection__setupReadHandlerOnProvider__block_invoke;
  v6[3] = &unk_26443A5D0;
  id v7 = v3;
  id v8 = self;
  uint64_t v5 = v3;
  [(SiriCoreConnectionProvider *)connectionProvider readData:v6];
}

void __63__SiriCoreSiriBackgroundConnection__setupReadHandlerOnProvider__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  id v6 = a3;
  kdebug_trace();
  id v7 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v7[3])
  {
    id v8 = *MEMORY[0x263F28358];
    if (!v5 || v6)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        unint64_t v12 = "-[SiriCoreSiriBackgroundConnection _setupReadHandlerOnProvider]_block_invoke";
        __int16 v13 = 2112;
        size_t size = (size_t)v6;
        _os_log_error_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_ERROR, "%s Error reading data with error %@", buf, 0x16u);
        id v7 = *(void **)(a1 + 40);
      }
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __63__SiriCoreSiriBackgroundConnection__setupReadHandlerOnProvider__block_invoke_218;
      v9[3] = &unk_26443AF40;
      v9[4] = v7;
      id v10 = v6;
      [v7 _fallBackToNextConnectionMethodWithError:v10 orElse:v9];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        unint64_t v12 = "-[SiriCoreSiriBackgroundConnection _setupReadHandlerOnProvider]_block_invoke";
        __int16 v13 = 2048;
        size_t size = dispatch_data_get_size(v5);
        _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_DEFAULT, "%s read %lu bytes", buf, 0x16u);
        id v7 = *(void **)(a1 + 40);
      }
      [v7 _connectionHasBytesAvailable:v5];
      [*(id *)(a1 + 40) _setupReadHandlerOnProvider];
    }
  }
}

uint64_t __63__SiriCoreSiriBackgroundConnection__setupReadHandlerOnProvider__block_invoke_218(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) _hasBufferedDataOrOutstandingPings])
  {
    v2 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)unint64_t v12 = 136315138;
      *(void *)&v12[4] = "-[SiriCoreSiriBackgroundConnection _setupReadHandlerOnProvider]_block_invoke";
      _os_log_error_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_ERROR, "%s Read Error - mid request", v12, 0xCu);
    }
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _didEncounterError:v4];
  }
  uint64_t v5 = [*(id *)(a1 + 40) domain];
  if ([v5 isEqualToString:@"SiriCoreSiriConnectionErrorDomain"])
  {
    uint64_t v6 = [*(id *)(a1 + 40) code];

    if (v6 == 25)
    {
      id v7 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)unint64_t v12 = 136315138;
        *(void *)&v12[4] = "-[SiriCoreSiriBackgroundConnection _setupReadHandlerOnProvider]_block_invoke";
        id v8 = "%s Read Error - NWConnectionReadFailure";
LABEL_18:
        _os_log_error_impl(&dword_21CBF7000, v7, OS_LOG_TYPE_ERROR, v8, v12, 0xCu);
        return objc_msgSend(*(id *)(a1 + 32), "cancel", *(_OWORD *)v12);
      }
      return objc_msgSend(*(id *)(a1 + 32), "cancel", *(_OWORD *)v12);
    }
  }
  else
  {
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v7 = *MEMORY[0x263F28358];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v10)
    {
      *(_DWORD *)unint64_t v12 = 136315394;
      *(void *)&v12[4] = "-[SiriCoreSiriBackgroundConnection _setupReadHandlerOnProvider]_block_invoke";
      *(_WORD *)&v12[12] = 2112;
      *(void *)&v12[14] = v9;
      _os_log_error_impl(&dword_21CBF7000, v7, OS_LOG_TYPE_ERROR, "%s Read Error - error %@", v12, 0x16u);
      uint64_t v9 = *(void *)(a1 + 40);
    }
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = v9;
    return [v3 _didEncounterError:v4];
  }
  if (v10)
  {
    *(_DWORD *)unint64_t v12 = 136315138;
    *(void *)&v12[4] = "-[SiriCoreSiriBackgroundConnection _setupReadHandlerOnProvider]_block_invoke";
    id v8 = "%s Read Error - cancel";
    goto LABEL_18;
  }
  return objc_msgSend(*(id *)(a1 + 32), "cancel", *(_OWORD *)v12);
}

- (BOOL)_sendAcePongWithId:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = (os_log_t *)MEMORY[0x263F28358];
  id v8 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    char v17 = "-[SiriCoreSiriBackgroundConnection _sendAcePongWithId:error:]";
    __int16 v18 = 1024;
    LODWORD(v19) = v5;
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, "%s Sending ACE Pong %u", buf, 0x12u);
  }
  uint64_t v9 = +[SiriCoreAceSerialization dataForPong:v5];
  outputCompressor = self->_outputCompressor;
  id v15 = 0;
  uint64_t v11 = [(SiriCoreDataCompressor *)outputCompressor compressedDataForData:v9 error:&v15];
  uint64_t v12 = (uint64_t)v15;
  if (!(v12 | v11))
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:27 userInfo:0];
  }
  if (!v12)
  {
    [(SiriCoreSiriBackgroundConnection *)self _sendGeneralData:v11];
    goto LABEL_10;
  }
  uint64_t v13 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    char v17 = "-[SiriCoreSiriBackgroundConnection _sendAcePongWithId:error:]";
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    _os_log_error_impl(&dword_21CBF7000, v13, OS_LOG_TYPE_ERROR, "%s Error compressing pong %{public}@", buf, 0x16u);
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (a4) {
LABEL_8:
  }
    *a4 = (id) v12;
LABEL_10:

  return v12 == 0;
}

- (BOOL)_sendAcePingWithId:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = (os_log_t *)MEMORY[0x263F28358];
  id v8 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    char v17 = "-[SiriCoreSiriBackgroundConnection _sendAcePingWithId:error:]";
    __int16 v18 = 1024;
    LODWORD(v19) = v5;
    _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, "%s Sending ACE Ping %u", buf, 0x12u);
  }
  uint64_t v9 = +[SiriCoreAceSerialization dataForPing:v5];
  outputCompressor = self->_outputCompressor;
  id v15 = 0;
  uint64_t v11 = [(SiriCoreDataCompressor *)outputCompressor compressedDataForData:v9 error:&v15];
  uint64_t v12 = (uint64_t)v15;
  if (!(v12 | v11))
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:27 userInfo:0];
  }
  if (!v12)
  {
    [(SiriCoreSiriBackgroundConnection *)self _sendGeneralData:v11];
    goto LABEL_10;
  }
  uint64_t v13 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    char v17 = "-[SiriCoreSiriBackgroundConnection _sendAcePingWithId:error:]";
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    _os_log_error_impl(&dword_21CBF7000, v13, OS_LOG_TYPE_ERROR, "%s Error compressing ping %{public}@", buf, 0x16u);
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (a4) {
LABEL_8:
  }
    *a4 = (id) v12;
LABEL_10:

  return v12 == 0;
}

- (void)sendCommands:(id)a3 errorHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
        --v8;
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __62__SiriCoreSiriBackgroundConnection_sendCommands_errorHandler___block_invoke;
        v16[3] = &unk_26443AE78;
        id v14 = v7;
        v16[4] = v13;
        id v17 = v14;
        [(SiriCoreSiriBackgroundConnection *)self sendCommand:v13 moreComing:v8 != 0 errorHandler:v16];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

uint64_t __62__SiriCoreSiriBackgroundConnection_sendCommands_errorHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(result + 40) + 16))(*(void *)(result + 40), *(void *)(result + 32), a2);
  }
  return result;
}

- (void)sendCommand:(id)a3 moreComing:(BOOL)a4 errorHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, id))a5;
  uint64_t v10 = (os_log_t *)MEMORY[0x263F28358];
  uint64_t v11 = (void *)*MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v11;
    *(_DWORD *)buf = 136315394;
    v32 = "-[SiriCoreSiriBackgroundConnection sendCommand:moreComing:errorHandler:]";
    __int16 v33 = 2112;
    id v34 = (id)objc_opt_class();
    id v13 = v34;
    _os_log_impl(&dword_21CBF7000, v12, OS_LOG_TYPE_INFO, "%s Sending ACE Object, %@", buf, 0x16u);
  }
  id v30 = 0;
  id v14 = objc_msgSend(v8, "siriCore_serializedAceDataError:", &v30);
  id v15 = v30;
  if (!v15 && v14)
  {
    p_bufferedUncompressedData = &self->_bufferedUncompressedData;
    bufferedUncompressedData = self->_bufferedUncompressedData;
    if (bufferedUncompressedData)
    {
      dispatch_data_t concat = dispatch_data_create_concat(bufferedUncompressedData, v14);

      if (concat)
      {
        objc_storeStrong((id *)&self->_bufferedUncompressedData, MEMORY[0x263EF8388]);
        id v15 = 0;
        id v14 = concat;
        if (!a4) {
          goto LABEL_14;
        }
LABEL_10:
        long long v19 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
        {
          size_t size = (void *)dispatch_data_get_size(v14);
          *(_DWORD *)buf = 136315394;
          v32 = "-[SiriCoreSiriBackgroundConnection sendCommand:moreComing:errorHandler:]";
          __int16 v33 = 2048;
          id v34 = size;
          _os_log_debug_impl(&dword_21CBF7000, v19, OS_LOG_TYPE_DEBUG, "%s Buffering ACE Object of size %lu", buf, 0x16u);
        }
        long long v20 = v14;
        long long v21 = *p_bufferedUncompressedData;
        *p_bufferedUncompressedData = (OS_dispatch_data *)v20;
        goto LABEL_22;
      }
      id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:27 userInfo:0];
      id v14 = 0;
      if (a4) {
        goto LABEL_10;
      }
    }
    else
    {
      id v15 = 0;
      if (a4) {
        goto LABEL_10;
      }
    }
LABEL_14:
    outputCompressor = self->_outputCompressor;
    id v29 = v15;
    long long v21 = [(SiriCoreDataCompressor *)outputCompressor compressedDataForData:v14 error:&v29];
    id v23 = v29;

    v24 = *v10;
    if (v23 || !v21)
    {
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        unint64_t v28 = (void *)dispatch_data_get_size(v14);
        *(_DWORD *)buf = 136315394;
        v32 = "-[SiriCoreSiriBackgroundConnection sendCommand:moreComing:errorHandler:]";
        __int16 v33 = 2048;
        id v34 = v28;
        _os_log_error_impl(&dword_21CBF7000, v24, OS_LOG_TYPE_ERROR, "%s error in compressing data of size %lu", buf, 0x16u);
      }
      id v15 = v23;
    }
    else
    {
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
      {
        id v26 = (void *)dispatch_data_get_size(v21);
        size_t v27 = dispatch_data_get_size(v14);
        *(_DWORD *)buf = 136315650;
        v32 = "-[SiriCoreSiriBackgroundConnection sendCommand:moreComing:errorHandler:]";
        __int16 v33 = 2048;
        id v34 = v26;
        __int16 v35 = 2048;
        size_t v36 = v27;
        _os_log_debug_impl(&dword_21CBF7000, v24, OS_LOG_TYPE_DEBUG, "%s compression ratio is %lu/%lu", buf, 0x20u);
      }
      [(SiriCoreSiriBackgroundConnection *)self _sendGeneralData:v21];
      id v15 = 0;
    }
LABEL_22:
  }
  if (v15) {
    v9[2](v9, v15);
  }
}

- (void)_prepareProviderHeaderWithForceReconnect:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  p_bufferedProviderHeaderOutputData = &self->_bufferedProviderHeaderOutputData;
  objc_storeStrong((id *)&self->_bufferedProviderHeaderOutputData, MEMORY[0x263EF8388]);
  id v6 = [(SiriCoreConnectionProvider *)self->_connectionProvider headerDataWithForceReconnect:v3];
  if (v6)
  {
    id v7 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[SiriCoreSiriBackgroundConnection _prepareProviderHeaderWithForceReconnect:]";
      _os_log_impl(&dword_21CBF7000, v7, OS_LOG_TYPE_INFO, "%s Preparing Provider Header", (uint8_t *)&v10, 0xCu);
    }
    dispatch_data_t concat = dispatch_data_create_concat((dispatch_data_t)*p_bufferedProviderHeaderOutputData, v6);
    dispatch_data_t v9 = (dispatch_data_t)*p_bufferedProviderHeaderOutputData;
    *p_bufferedProviderHeaderOutputData = (OS_dispatch_data *)concat;
  }
}

- (void)_sendGeneralData:(id)a3
{
  [(SiriCoreSiriBackgroundConnection *)self _bufferGeneralData:a3];

  [(SiriCoreSiriBackgroundConnection *)self _tryToWriteBufferedOutputData];
}

- (void)_bufferGeneralData:(id)a3
{
  self->_bufferedGeneralOutputData = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)self->_bufferedGeneralOutputData, (dispatch_data_t)a3);

  MEMORY[0x270F9A758]();
}

- (void)_tryToWriteBufferedOutputData
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!self->_isCanceled && self->_isOpened)
  {
    bufferedProviderHeaderOutputData = self->_bufferedProviderHeaderOutputData;
    if (bufferedProviderHeaderOutputData)
    {
      p_bufferedGeneralOutputData = &self->_bufferedGeneralOutputData;
      if (dispatch_data_get_size((dispatch_data_t)self->_bufferedProviderHeaderOutputData))
      {
        id v7 = bufferedProviderHeaderOutputData;
LABEL_10:
        size_t size = dispatch_data_get_size(v7);
        if (size)
        {
          size_t v9 = size;
          kdebug_trace();
          connectionProvider = self->_connectionProvider;
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __65__SiriCoreSiriBackgroundConnection__tryToWriteBufferedOutputData__block_invoke;
          v15[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
          v15[4] = v9;
          [(SiriCoreConnectionProvider *)connectionProvider writeData:v7 completion:v15];
          uint64_t v11 = (OS_dispatch_data *)v7;
          if (v7 != self->_bufferedProviderHeaderOutputData)
          {
            safetyNetBuffer = self->_safetyNetBuffer;
            if (safetyNetBuffer)
            {
              dispatch_data_t concat = (OS_dispatch_data *)dispatch_data_create_concat(safetyNetBuffer, v7);
              id v14 = self->_safetyNetBuffer;
              self->_safetyNetBuffer = concat;
            }
            uint64_t v11 = self->_bufferedProviderHeaderOutputData;
          }
          if (v7 == v11)
          {
            p_bufferedGeneralOutputData = &self->_bufferedProviderHeaderOutputData;
LABEL_20:
            objc_storeStrong((id *)p_bufferedGeneralOutputData, MEMORY[0x263EF8388]);
            goto LABEL_21;
          }
          if (v7 == *p_bufferedGeneralOutputData) {
            goto LABEL_20;
          }
        }
LABEL_21:

        return;
      }
    }
    else
    {
      p_bufferedGeneralOutputData = &self->_bufferedGeneralOutputData;
    }
    id v7 = *p_bufferedGeneralOutputData;
    if (!v7) {
      goto LABEL_21;
    }
    goto LABEL_10;
  }
  BOOL v3 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = self->_connectionProvider;
    *(_DWORD *)buf = 136315394;
    id v17 = "-[SiriCoreSiriBackgroundConnection _tryToWriteBufferedOutputData]";
    __int16 v18 = 2112;
    long long v19 = v4;
    _os_log_impl(&dword_21CBF7000, v3, OS_LOG_TYPE_INFO, "%s %@ is not open. buffering data", buf, 0x16u);
  }
}

void __65__SiriCoreSiriBackgroundConnection__tryToWriteBufferedOutputData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  kdebug_trace();
  uint64_t v4 = *MEMORY[0x263F28358];
  uint64_t v5 = *MEMORY[0x263F28358];
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[SiriCoreSiriBackgroundConnection _tryToWriteBufferedOutputData]_block_invoke";
      __int16 v9 = 2114;
      id v10 = v3;
      _os_log_error_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(a1 + 32);
    int v7 = 136315394;
    id v8 = "-[SiriCoreSiriBackgroundConnection _tryToWriteBufferedOutputData]_block_invoke";
    __int16 v9 = 2048;
    id v10 = v6;
    _os_log_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_DEFAULT, "%s Wrote: %lu", (uint8_t *)&v7, 0x16u);
  }
}

- (id)_headerDataForURL:(id)a3 aceHost:(id)a4 languageCode:(id)a5 syncAssistantId:(id)a6
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  CFURLRef v10 = (const __CFURL *)a3;
  uint64_t v11 = (__CFString *)a4;
  CFStringRef v12 = (const __CFString *)a5;
  value = (__CFString *)a6;
  Request = CFHTTPMessageCreateRequest(0, @"ACE", v10, (CFStringRef)*MEMORY[0x263EFC700]);
  CFURLRef v50 = v10;
  v49 = [(__CFURL *)v10 host];
  CFHTTPMessageSetHeaderFieldValue(Request, @"Host", v49);
  SiriCoreUserAgentStringCreate(self->_productTypePrefix);
  id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFHTTPMessageSetHeaderFieldValue(Request, @"User-Agent", v14);
  if (v11) {
    CFHTTPMessageSetHeaderFieldValue(Request, @"X-Ace-Host", v11);
  }
  if (v12) {
    CFHTTPMessageSetHeaderFieldValue(Request, @"Accept-Language", v12);
  }
  CFStringRef v47 = v12;
  CFHTTPMessageSetHeaderFieldValue(Request, @"Content-Length", @"2000000000");
  SiriCoreUUIDStringCreate();
  id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFHTTPMessageSetHeaderFieldValue(Request, @"X-Client-Connection-Id", v15);
  uint64_t v16 = [MEMORY[0x263F283F8] sharedAnalytics];
  v56 = @"X-Client-Connection-Id";
  v57 = v15;
  id v17 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  [v16 logEventWithType:914 context:v17];

  if (self->_siriConnectionUsesPeerManagedSync)
  {
    CFStringRef peerType = (const __CFString *)self->_peerType;
    if (peerType) {
      CFHTTPMessageSetHeaderFieldValue(Request, @"X-Linked-Siri-Type", peerType);
    }
    CFStringRef peerVersion = (const __CFString *)self->_peerVersion;
    if (peerVersion) {
      CFHTTPMessageSetHeaderFieldValue(Request, @"X-Linked-Siri-Version", peerVersion);
    }
  }
  if (AFIsInternalInstall())
  {
    if (self->_deviceIsInWalkaboutExperimentGroup) {
      CFHTTPMessageSetHeaderFieldValue(Request, @"X-Walkabout-Device", @"true");
    }
    uint64_t v20 = objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences", v47);
    long long v21 = [v20 configOverrides];

    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __91__SiriCoreSiriBackgroundConnection__headerDataForURL_aceHost_languageCode_syncAssistantId___block_invoke;
    v53[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
    v53[4] = Request;
    [v21 enumerateKeysAndObjectsUsingBlock:v53];
  }
  uint64_t v22 = objc_msgSend(MEMORY[0x263F28510], "featureFlags", v47);
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __91__SiriCoreSiriBackgroundConnection__headerDataForURL_aceHost_languageCode_syncAssistantId___block_invoke_2;
  v52[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
  v52[4] = Request;
  [v22 enumerateKeysAndObjectsUsingBlock:v52];
  if ([(SiriCoreSiriConnectionInfo *)self->_connectionInfo isForceOnDeviceOnlyDictationEnabled])
  {
    CFHTTPMessageSetHeaderFieldValue(Request, @"X-OnDevice-Only-Dictation-Forced", @"true");
  }
  if (AFIsInternalInstall() && _AFPreferencesShowAllDialogVariantsEnabled()) {
    CFHTTPMessageSetHeaderFieldValue(Request, @"X-Show-Dialog-Variants", @"true");
  }
  CFHTTPMessageSetHeaderFieldValue(Request, @"X-Sync-Owner-Assistant-ID", value);
  CFDictionaryRef v23 = CFHTTPMessageCopyAllHeaderFields(Request);
  v24 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SiriCoreSiriBackgroundConnection _headerDataForURL:aceHost:languageCode:syncAssistantId:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v23;
    _os_log_impl(&dword_21CBF7000, v24, OS_LOG_TYPE_INFO, "%s Connection Header: %@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v26 = objc_opt_respondsToSelector();

  if (v26)
  {
    id v27 = objc_loadWeakRetained((id *)&self->_delegate);
    [v27 siriBackgroundConnection:self willStartConnectionWithHTTPHeader:v23];
  }
  AFDeviceRegionCode();
  unint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v28) {
    CFHTTPMessageSetHeaderFieldValue(Request, @"X-Device-Region-Code", v28);
  }
  CFDataRef v29 = CFHTTPMessageCopySerializedMessage(Request);
  CFRelease(Request);
  if (v29)
  {
    CFRetain(v29);
    BytePtr = CFDataGetBytePtr(v29);
    size_t Length = CFDataGetLength(v29);
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __SiriCoreDispatchDataCreateFromImmutableCFData_block_invoke;
    __int16 v59 = &__block_descriptor_40_e5_v8__0l;
    CFDataRef v60 = v29;
    dispatch_data_t v32 = dispatch_data_create(BytePtr, Length, 0, buf);
    CFRelease(v29);
  }
  else
  {
    dispatch_data_t v32 = 0;
  }
  if (AFIsInternalInstall())
  {
    __int16 v33 = [MEMORY[0x263F283F8] sharedAnalytics];
    id v34 = v49;
    if (!v49) {
      id v34 = &stru_26CD85388;
    }
    v54[0] = @"host";
    v54[1] = @"userAgent";
    if (v14) {
      __int16 v35 = v14;
    }
    else {
      __int16 v35 = &stru_26CD85388;
    }
    v55[0] = v34;
    v55[1] = v35;
    if (v11) {
      size_t v36 = v11;
    }
    else {
      size_t v36 = &stru_26CD85388;
    }
    v55[2] = v36;
    v54[2] = @"aceHost";
    v54[3] = @"url";
    uint64_t v37 = [(__CFURL *)v50 absoluteString];
    v38 = (void *)v37;
    if (v37) {
      v39 = (__CFString *)v37;
    }
    else {
      v39 = &stru_26CD85388;
    }
    v55[3] = v39;
    v40 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:4];
    [v33 logEventWithType:922 context:v40];

    id v41 = objc_alloc_init(MEMORY[0x263F6E4E8]);
    v42 = v41;
    if (v14)
    {
      v43 = (void *)[(__CFString *)v14 copy];
      [v42 setUserAgent:v43];

      if (v11)
      {
LABEL_42:
        v44 = (void *)[(__CFString *)v11 copy];
        [v42 setAceHost:v44];

LABEL_45:
        v45 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
        [v45 logSessionConnectionHttpHeaderCreated:v42];

        goto LABEL_46;
      }
    }
    else
    {
      [v41 setUserAgent:&stru_26CD85388];
      if (v11) {
        goto LABEL_42;
      }
    }
    [v42 setAceHost:&stru_26CD85388];
    goto LABEL_45;
  }
LABEL_46:

  return v32;
}

void __91__SiriCoreSiriBackgroundConnection__headerDataForURL_aceHost_languageCode_syncAssistantId___block_invoke(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
}

void __91__SiriCoreSiriBackgroundConnection__headerDataForURL_aceHost_languageCode_syncAssistantId___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  headerField = a2;
  uint64_t v5 = a3;
  if ((AFIsInternalInstall() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([(__CFString *)headerField hasPrefix:*MEMORY[0x263F282D0]] & 1) == 0)
  {
    CFHTTPMessageSetHeaderFieldValue(*(CFHTTPMessageRef *)(a1 + 32), headerField, v5);
  }
}

- (void)_networkProviderDidOpen
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  kdebug_trace();
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2(queue);
  }
  uint64_t v4 = (os_log_t *)MEMORY[0x263F28358];
  uint64_t v5 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v16 = 136315138;
    id v17 = "-[SiriCoreSiriBackgroundConnection _networkProviderDidOpen]";
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v16, 0xCu);
  }
  if (self->_isOpened)
  {
    id v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      id v17 = "-[SiriCoreSiriBackgroundConnection _networkProviderDidOpen]";
      _os_log_impl(&dword_21CBF7000, v6, OS_LOG_TYPE_INFO, "%s Received open callback when we're already open?", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    self->_isOpened = 1;
    self->_primaryConnectionViable = 1;
    int v7 = [MEMORY[0x263F08AB0] processInfo];
    [v7 systemUptime];
    self->_double currentOpenTime = v8;

    [(SiriCoreSiriBackgroundConnection *)self _resumePingTimer];
    __int16 v9 = [(SiriCoreSiriConnectionInfo *)self->_connectionInfo connectionPolicyRoute];
    CFURLRef v10 = [v9 routeId];

    uint64_t v11 = [MEMORY[0x263F08AB0] processInfo];
    [v11 systemUptime];
    double v13 = v12 - self->_currentStartTime;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v15 = [(SiriCoreSiriBackgroundConnection *)self _connectionType];
    [WeakRetained siriBackgroundConnection:self didOpenWithConnectionType:v15 routeId:v10 delay:v13];
  }
  [(SiriCoreSiriBackgroundConnection *)self _tryToWriteBufferedOutputData];
}

- (void)_connectionHasBytesAvailable:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2(queue);
  }
  size_t size = dispatch_data_get_size(v4);
  int v7 = (os_log_t *)MEMORY[0x263F28358];
  if (size)
  {
    safetyNetBuffer = self->_safetyNetBuffer;
    if (safetyNetBuffer)
    {
      self->_safetyNetBuffer = 0;

      __int16 v9 = [MEMORY[0x263F08AB0] processInfo];
      [v9 systemUptime];
      self->_double firstByteReadTime = v10;

      uint64_t v11 = [MEMORY[0x263F283F8] sharedAnalytics];
      [v11 logEventWithType:915 contextProvider:0];
    }
    inputDecompressor = self->_inputDecompressor;
    if (inputDecompressor)
    {
      id v52 = 0;
      double v13 = [(SiriCoreDataDecompressor *)inputDecompressor decompressedDataForData:v4 error:&v52];
      id v14 = v52;
    }
    else
    {
      double v13 = v4;
      id v14 = 0;
    }
    p_bufferedInputData = &self->_bufferedInputData;
    bufferedInputData = self->_bufferedInputData;
    if (bufferedInputData)
    {
      if (!v13) {
        goto LABEL_16;
      }
      dispatch_data_t concat = dispatch_data_create_concat(bufferedInputData, v13);
    }
    else
    {
      dispatch_data_t concat = v13;
    }
    long long v19 = *p_bufferedInputData;
    *p_bufferedInputData = (OS_dispatch_data *)concat;

    bufferedInputData = *p_bufferedInputData;
LABEL_16:
    subrange = bufferedInputData;
    long long v21 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      if (subrange) {
        size_t v22 = dispatch_data_get_size(subrange);
      }
      else {
        size_t v22 = 0;
      }
      *(_DWORD *)buf = 136315394;
      v54 = "-[SiriCoreSiriBackgroundConnection _connectionHasBytesAvailable:]";
      __int16 v55 = 2048;
      size_t v56 = v22;
      _os_log_impl(&dword_21CBF7000, v21, OS_LOG_TYPE_INFO, "%s workingData is %lu bytes", buf, 0x16u);
    }
    if (v14) {
      goto LABEL_22;
    }
    if (![(SiriCoreSiriBackgroundConnection *)self _hasReadHTTPHeader])
    {
      id v50 = 0;
      size_t v51 = 0;
      [(SiriCoreSiriBackgroundConnection *)self _consumeHTTPHeaderWithData:subrange bytesRead:&v51 error:&v50];
      id v14 = v50;
      CFDictionaryRef v23 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "-[SiriCoreSiriBackgroundConnection _connectionHasBytesAvailable:]";
        __int16 v55 = 2048;
        size_t v56 = v51;
        _os_log_impl(&dword_21CBF7000, v23, OS_LOG_TYPE_INFO, "%s Consumed %tu bytes", buf, 0x16u);
      }
      size_t v24 = v51;
      __int16 v25 = subrange;
      char v26 = v25;
      if (v25)
      {
        size_t v27 = dispatch_data_get_size(v25);
        if (v27 <= v24)
        {
          subrange = MEMORY[0x263EF8388];
          id v28 = MEMORY[0x263EF8388];
        }
        else
        {
          subrange = dispatch_data_create_subrange(v26, v24, v27 - v24);
        }
      }
      else
      {
        subrange = 0;
      }

      if (v14) {
        goto LABEL_22;
      }
    }
    if (![(SiriCoreSiriBackgroundConnection *)self _hasReadACEHeader])
    {
      size_t v51 = 0;
      id v49 = 0;
      [(SiriCoreSiriBackgroundConnection *)self _consumeAceHeaderWithData:subrange bytesRead:&v51 error:&v49];
      id v14 = v49;
      id v34 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "-[SiriCoreSiriBackgroundConnection _connectionHasBytesAvailable:]";
        __int16 v55 = 2048;
        size_t v56 = v51;
        _os_log_impl(&dword_21CBF7000, v34, OS_LOG_TYPE_INFO, "%s Consumed %tu bytes", buf, 0x16u);
      }
      size_t v35 = v51;
      size_t v36 = subrange;
      uint64_t v37 = v36;
      if (v36)
      {
        size_t v38 = dispatch_data_get_size(v36);
        if (v38 <= v35)
        {
          v39 = MEMORY[0x263EF8388];
          id v40 = MEMORY[0x263EF8388];
        }
        else
        {
          v39 = dispatch_data_create_subrange(v37, v35, v38 - v35);
        }
      }
      else
      {
        v39 = 0;
      }

      if (v14)
      {
        subrange = v39;
LABEL_22:
        objc_storeStrong((id *)&self->_bufferedInputData, subrange);
        if (v14) {
          [(SiriCoreSiriBackgroundConnection *)self _didEncounterError:v14];
        }

        goto LABEL_25;
      }
      id v41 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        if (v39) {
          size_t v42 = dispatch_data_get_size(v39);
        }
        else {
          size_t v42 = 0;
        }
        *(_DWORD *)buf = 136315394;
        v54 = "-[SiriCoreSiriBackgroundConnection _connectionHasBytesAvailable:]";
        __int16 v55 = 2048;
        size_t v56 = v42;
        _os_log_impl(&dword_21CBF7000, v41, OS_LOG_TYPE_INFO, "%s Still have %lu bytes after ace header, decompressing", buf, 0x16u);
      }
      v44 = self->_inputDecompressor;
      if (v44)
      {
        id v48 = 0;
        subrange = [(SiriCoreDataDecompressor *)v44 decompressedDataForData:v39 error:&v48];
        id v14 = v48;

        v45 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
        {
          if (subrange) {
            size_t v46 = dispatch_data_get_size(subrange);
          }
          else {
            size_t v46 = 0;
          }
          *(_DWORD *)buf = 136315394;
          v54 = "-[SiriCoreSiriBackgroundConnection _connectionHasBytesAvailable:]";
          __int16 v55 = 2048;
          size_t v56 = v46;
          _os_log_impl(&dword_21CBF7000, v45, OS_LOG_TYPE_INFO, "%s Decompressed %lu bytes", buf, 0x16u);
        }
        if (v14) {
          goto LABEL_22;
        }
      }
      else
      {
        subrange = v39;
      }
    }
    if ([(SiriCoreSiriBackgroundConnection *)self _hasReadACEHeader])
    {
      size_t v51 = 0;
      id v47 = 0;
      [(SiriCoreSiriBackgroundConnection *)self _consumeAceDataWithData:subrange bytesRead:&v51 error:&v47];
      id v14 = v47;
      CFDataRef v29 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "-[SiriCoreSiriBackgroundConnection _connectionHasBytesAvailable:]";
        __int16 v55 = 2048;
        size_t v56 = v51;
        _os_log_impl(&dword_21CBF7000, v29, OS_LOG_TYPE_INFO, "%s Consumed %tu bytes", buf, 0x16u);
      }
      size_t v30 = v51;
      uint64_t v31 = subrange;
      dispatch_data_t v32 = v31;
      if (v31)
      {
        size_t v33 = dispatch_data_get_size(v31);
        if (v33 <= v30)
        {
          subrange = MEMORY[0x263EF8388];
          id v43 = MEMORY[0x263EF8388];
        }
        else
        {
          subrange = dispatch_data_create_subrange(v32, v30, v33 - v30);
        }
      }
      else
      {
        subrange = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
    goto LABEL_22;
  }
  id v15 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[SiriCoreSiriBackgroundConnection _connectionHasBytesAvailable:]";
    _os_log_impl(&dword_21CBF7000, v15, OS_LOG_TYPE_INFO, "%s NWConnection said it had bytes available, but we couldn't read anything", buf, 0xCu);
  }
LABEL_25:
}

- (BOOL)_consumeAceDataWithData:(id)a3 bytesRead:(unint64_t *)a4 error:(id *)a5
{
  v41[3] = *MEMORY[0x263EF8340];
  unint64_t v39 = 0;
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  unint64_t v8 = [v6 length];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  double v10 = [MEMORY[0x263F08AB0] processInfo];
  [v10 systemUptime];
  double v12 = v11;

  uint64_t v31 = v7;
  if (!v8)
  {
    size_t v22 = 0;
    if (!v9) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  id v30 = v6;
  uint64_t v13 = *MEMORY[0x263F65138];
  uint64_t v35 = *MEMORY[0x263F65140];
  uint64_t v34 = *MEMORY[0x263F65D10];
  while (1)
  {
    id v37 = 0;
    uint64_t v38 = 0;
    id v36 = 0;
    -[SiriCoreSiriBackgroundConnection _tryReadingParsedDataFromBytes:length:packet:object:bytesParsed:error:](self, "_tryReadingParsedDataFromBytes:length:packet:object:bytesParsed:error:", v7, v8, &v38, &v37, &v39, &v36, v30);
    id v14 = v37;
    id v15 = v36;
    unint64_t v16 = v39;
    if (v15 || v39 == 0) {
      break;
    }
    if (v8 >= v39) {
      unint64_t v18 = v39;
    }
    else {
      unint64_t v18 = 0;
    }
    if (v8 >= v39) {
      unint64_t v19 = v8 - v39;
    }
    else {
      unint64_t v19 = 0;
    }
    if (v14)
    {
      uint64_t v20 = [v14 encodedClassName];
      if (([v20 isEqual:v13] & 1) != 0
        || ([v20 isEqual:v35] & 1) != 0
        || [v20 isEqual:v34])
      {
        [v9 addObject:v20];
      }
      [(SiriCoreSiriBackgroundConnection *)self _handleAceObject:v14];
    }
    else
    {
      [(SiriCoreSiriBackgroundConnection *)self _handlePacket:&v38];
    }
    v7 += v18;

    BOOL v21 = v8 > v16;
    unint64_t v8 = v19;
    if (!v21)
    {
      size_t v22 = 0;
      goto LABEL_25;
    }
  }
  size_t v22 = v15;

LABEL_25:
  id v6 = v30;
  if (v9)
  {
LABEL_26:
    if ([v9 count])
    {
      CFDictionaryRef v23 = [MEMORY[0x263F283F8] sharedAnalytics];
      v40[0] = @"aceCommands";
      size_t v24 = [v9 array];
      v41[0] = v24;
      v40[1] = @"bytes";
      __int16 v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
      v41[1] = v25;
      v40[2] = @"waitTime";
      char v26 = [NSNumber numberWithDouble:v12 - self->_receivedDataTime];
      v41[2] = v26;
      [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
      v28 = id v27 = v6;
      [v23 logEventWithType:1018 context:v28];

      id v6 = v27;
    }
  }
LABEL_28:
  self->_receivedDataTime = v12;
  if (a4) {
    *a4 = v7 - v31;
  }
  if (a5) {
    *a5 = v22;
  }

  return v22 == 0;
}

- (BOOL)_consumeAceHeaderWithData:(id)a3 bytesRead:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v8 = a3;
  id v9 = (NSObject **)MEMORY[0x263F28358];
  double v10 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    if (v8) {
      size_t size = dispatch_data_get_size(v8);
    }
    else {
      size_t size = 0;
    }
    *(_DWORD *)buf = 136315394;
    BOOL v21 = "-[SiriCoreSiriBackgroundConnection _consumeAceHeaderWithData:bytesRead:error:]";
    __int16 v22 = 2048;
    size_t v23 = size;
    _os_log_impl(&dword_21CBF7000, v10, OS_LOG_TYPE_INFO, "%s Still need Ace Header, trying to parse it with %lu bytes", buf, 0x16u);
  }
  id v18 = 0;
  unint64_t v19 = 0;
  double v12 = [(SiriCoreSiriBackgroundConnection *)self _tryReadingAceHeaderFromData:v8 bytesParsed:&v19 error:&v18];
  id v13 = v18;
  if (v13) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v19 == 0;
  }
  if (!v14 && v12 != 0)
  {
    unint64_t v16 = *v9;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v21 = "-[SiriCoreSiriBackgroundConnection _consumeAceHeaderWithData:bytesRead:error:]";
      __int16 v22 = 2112;
      size_t v23 = (size_t)v12;
      _os_log_impl(&dword_21CBF7000, v16, OS_LOG_TYPE_INFO, "%s Ace Header is complete, using compressor %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&self->_inputDecompressor, v12);
  }
  if (a4) {
    *a4 = v19;
  }
  if (a5) {
    *a5 = v13;
  }

  return v13 == 0;
}

- (id)_connectionType
{
  return (id)[(SiriCoreConnectionProvider *)self->_connectionProvider connectionType];
}

- (BOOL)_hasReadACEHeader
{
  return self->_inputDecompressor != 0;
}

- (BOOL)_consumeHTTPHeaderWithData:(id)a3 bytesRead:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (!self->_httpResponseHeader)
  {
    id v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SiriCoreSiriBackgroundConnection.m" lineNumber:1387 description:@"We shouldn't be trying to handle http header if we're not expecting it"];
  }
  double v10 = (os_log_t *)MEMORY[0x263F28358];
  double v11 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v22 = "-[SiriCoreSiriBackgroundConnection _consumeHTTPHeaderWithData:bytesRead:error:]";
    _os_log_impl(&dword_21CBF7000, v11, OS_LOG_TYPE_INFO, "%s Still need HTTP Header, trying to parse it", buf, 0xCu);
  }
  id v19 = 0;
  unint64_t v20 = 0;
  BOOL v12 = [(SiriCoreSiriBackgroundConnection *)self _tryReadingHTTPHeaderData:v9 withMessage:self->_httpResponseHeader bytesRead:&v20 error:&v19];
  id v13 = v19;
  if (v12)
  {
    BOOL v14 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      httpResponseHeader = self->_httpResponseHeader;
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "-[SiriCoreSiriBackgroundConnection _consumeHTTPHeaderWithData:bytesRead:error:]";
      __int16 v23 = 2112;
      uint64_t v24 = httpResponseHeader;
      _os_log_impl(&dword_21CBF7000, v14, OS_LOG_TYPE_INFO, "%s HTTP header is complete %@", buf, 0x16u);
    }
    CFRelease(self->_httpResponseHeader);
    self->_httpResponseHeader = 0;
  }
  if (a4)
  {
    unint64_t v16 = v20;
    if (v13) {
      unint64_t v16 = 0;
    }
    *a4 = v16;
  }
  if (a5) {
    *a5 = v13;
  }

  return v13 == 0;
}

- (BOOL)_hasReadHTTPHeader
{
  return self->_httpResponseHeader == 0;
}

- (void)connectionProviderReceivedBetterRouteNotification:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = (SiriCoreConnectionProvider *)a3;
  if (self->_connectionProvider == v4)
  {
    self->_betterPathAvailable = 1;
    if (!self->_primaryConnectionViable)
    {
      uint64_t v5 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
      {
        int v6 = 136315138;
        uint64_t v7 = "-[SiriCoreSiriBackgroundConnection connectionProviderReceivedBetterRouteNotification:]";
        _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s Starting secondary connection", (uint8_t *)&v6, 0xCu);
      }
      [(SiriCoreSiriBackgroundConnection *)self _startSecondaryConnection];
    }
  }
}

- (void)connectionProvider:(id)a3 receivedViabilityChangeNotification:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v6 = (SiriCoreConnectionProvider *)a3;
  if (self->_connectionProvider == v6)
  {
    if (self->_primaryConnectionViable == v4)
    {
      if (!v4)
      {
        uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:32 userInfo:0];
        [(SiriCoreSiriBackgroundConnection *)self _didEncounterError:v7];

        goto LABEL_15;
      }
LABEL_10:
      [(SiriCoreSiriBackgroundConnection *)self _cancelSecondaryConnection];
      goto LABEL_15;
    }
    uint64_t v8 = (os_log_t *)MEMORY[0x263F28358];
    id v9 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      double v10 = @"not viable";
      if (v4) {
        double v10 = @"viable";
      }
      int v12 = 136315394;
      id v13 = "-[SiriCoreSiriBackgroundConnection connectionProvider:receivedViabilityChangeNotification:]";
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_impl(&dword_21CBF7000, v9, OS_LOG_TYPE_INFO, "%s viability changed %@", (uint8_t *)&v12, 0x16u);
    }
    self->_primaryConnectionViable = v4;
    if (v4) {
      goto LABEL_10;
    }
    if (self->_betterPathAvailable)
    {
      [(SiriCoreSiriBackgroundConnection *)self _startSecondaryConnection];
    }
    else
    {
      double v11 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315138;
        id v13 = "-[SiriCoreSiriBackgroundConnection connectionProvider:receivedViabilityChangeNotification:]";
        _os_log_impl(&dword_21CBF7000, v11, OS_LOG_TYPE_INFO, "%s wait for better route event", (uint8_t *)&v12, 0xCu);
      }
    }
  }
LABEL_15:
}

- (void)connectionProvider:(id)a3 receivedIntermediateError:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__SiriCoreSiriBackgroundConnection_connectionProvider_receivedIntermediateError___block_invoke;
  v8[3] = &unk_26443AF40;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __81__SiriCoreSiriBackgroundConnection_connectionProvider_receivedIntermediateError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v3 siriBackgroundConnection:*(void *)(a1 + 32) didEncounterIntermediateError:*(void *)(a1 + 40)];
  }
}

- (void)connectionProvider:(id)a3 receivedError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__SiriCoreSiriBackgroundConnection_connectionProvider_receivedError___block_invoke;
  block[3] = &unk_26443A820;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __69__SiriCoreSiriBackgroundConnection_connectionProvider_receivedError___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32) != *(void *)(*(void *)(a1 + 40) + 24)) {
    return;
  }
  v2 = [*(id *)(a1 + 48) domain];
  if ([v2 isEqualToString:@"SiriCoreSiriConnectionErrorDomain"]
    && [*(id *)(a1 + 48) code] == 4
    && (AFDeviceSupportsSiriUOD() & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));

    if (WeakRetained)
    {
      id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      id v5 = *(void **)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 48);
      id v6 = [v5 analysisInfo];
      [v11 siriBackgroundConnection:v5 didEncounterError:v4 analysisInfo:v6];

      return;
    }
  }
  else
  {
  }
  id v7 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315394;
    id v15 = "-[SiriCoreSiriBackgroundConnection connectionProvider:receivedError:]_block_invoke";
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    _os_log_error_impl(&dword_21CBF7000, v7, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }
  id v9 = *(void **)(a1 + 40);
  uint64_t v8 = *(void **)(a1 + 48);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__SiriCoreSiriBackgroundConnection_connectionProvider_receivedError___block_invoke_132;
  v12[3] = &unk_26443AF40;
  v12[4] = v9;
  id v13 = v8;
  [v9 _fallBackToNextConnectionMethodWithError:v13 orElse:v12];
}

uint64_t __69__SiriCoreSiriBackgroundConnection_connectionProvider_receivedError___block_invoke_132(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) _hasBufferedDataOrOutstandingPings])
  {
    v2 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      id v5 = "-[SiriCoreSiriBackgroundConnection connectionProvider:receivedError:]_block_invoke";
      _os_log_error_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_ERROR, "%s Error Occurred mid request", (uint8_t *)&v4, 0xCu);
    }
    [*(id *)(a1 + 32) _didEncounterError:*(void *)(a1 + 40)];
  }
  return [*(id *)(a1 + 32) cancel];
}

- (void)_cancelOutstandingBarriers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_outstandingBarriers;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[NSMutableDictionary objectForKey:](self->_outstandingBarriers, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v7), (void)v11);
        id v9 = (void *)v8;
        if (v8) {
          (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_outstandingBarriers removeAllObjects];
  outstandingBarriers = self->_outstandingBarriers;
  self->_outstandingBarriers = 0;
}

- (void)_handleBarrierReply:(unsigned int)a3
{
  id v6 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  uint64_t v4 = -[NSMutableDictionary objectForKey:](self->_outstandingBarriers, "objectForKey:");
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
    [(NSMutableDictionary *)self->_outstandingBarriers removeObjectForKey:v6];
  }
}

- (void)barrier:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (!self->_outstandingBarriers)
  {
    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    outstandingBarriers = self->_outstandingBarriers;
    self->_outstandingBarriers = v5;
  }
  uint64_t currentBarrierIndex = self->_currentBarrierIndex;
  id v14 = 0;
  [(SiriCoreSiriBackgroundConnection *)self _sendAcePingWithId:currentBarrierIndex error:&v14];
  id v8 = v14;
  if (v8)
  {
    v4[2](v4, 0);
  }
  else
  {
    id v9 = self->_outstandingBarriers;
    uint64_t v10 = (void *)MEMORY[0x21D4B91D0](v4);
    long long v11 = [NSNumber numberWithUnsignedInt:self->_currentBarrierIndex];
    [(NSMutableDictionary *)v9 setObject:v10 forKey:v11];

    unsigned int v12 = self->_currentBarrierIndex;
    if (v12 == -1) {
      unsigned int v13 = -100000;
    }
    else {
      unsigned int v13 = v12 + 1;
    }
    self->_uint64_t currentBarrierIndex = v13;
  }
}

- (int64_t)_checkPings
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    id v14 = "-[SiriCoreSiriBackgroundConnection _checkPings]";
    _os_log_impl(&dword_21CBF7000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v13, 0xCu);
  }
  unsigned int currentPingIndex = self->_currentPingIndex;
  if (currentPingIndex + 1 <= 0xFFFE795F) {
    unsigned int v5 = currentPingIndex + 1;
  }
  else {
    unsigned int v5 = 0;
  }
  self->_unsigned int currentPingIndex = v5;
  -[SiriCoreSiriBackgroundConnection _sendAcePingWithId:error:](self, "_sendAcePingWithId:error:");
  id v6 = [MEMORY[0x263F283F8] sharedAnalytics];
  [v6 logEventWithType:1005 context:0];

  pingInfo = self->_pingInfo;
  if (!pingInfo)
  {
    id v8 = objc_alloc_init(SiriCorePingInfo);
    id v9 = self->_pingInfo;
    self->_pingInfo = v8;

    pingInfo = self->_pingInfo;
  }
  [(SiriCorePingInfo *)pingInfo markPingSentWithIndex:self->_currentPingIndex];
  unint64_t v10 = [(SiriCorePingInfo *)self->_pingInfo numberOfUnacknowledgedPings];
  int64_t v11 = v10 > 2;
  if (v10 == 3) {
    int64_t v11 = 3;
  }
  if (v10 == 7) {
    v11 |= 4uLL;
  }
  if (v10 <= 0xB) {
    return v11;
  }
  else {
    return v11 | 8;
  }
}

- (int64_t)_checkForProgressOnReadingData
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F28358];
  uint64_t v4 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v22 = 136315138;
    __int16 v23 = "-[SiriCoreSiriBackgroundConnection _checkForProgressOnReadingData]";
    _os_log_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v22, 0xCu);
  }
  lastInputDataPointer = self->_lastInputDataPointer;
  bufferedInputData = self->_bufferedInputData;
  if (lastInputDataPointer != bufferedInputData)
  {
    uint64_t v7 = 0;
    self->_lastInputsize_t Length = 0;
    self->_lastInputDataPointer = bufferedInputData;
    uint64_t v8 = 168;
    goto LABEL_13;
  }
  if (lastInputDataPointer)
  {
    size_t size = dispatch_data_get_size(lastInputDataPointer);
    uint64_t v7 = (objc_class *)size;
    if (size && size == self->_lastInputLength)
    {
      unint64_t v10 = self->_inputLengthUnchangedCounter + 1;
      self->_unint64_t inputLengthUnchangedCounter = v10;
      int64_t v11 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315394;
        __int16 v23 = "-[SiriCoreSiriBackgroundConnection _checkForProgressOnReadingData]";
        __int16 v24 = 2048;
        unint64_t v25 = v10;
        _os_log_impl(&dword_21CBF7000, v11, OS_LOG_TYPE_INFO, "%s Incremented Input Unchanged Counter to %lu", (uint8_t *)&v22, 0x16u);
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  self->_unint64_t inputLengthUnchangedCounter = 0;
LABEL_12:
  uint64_t v8 = 152;
LABEL_13:
  *(Class *)((char *)&self->super.isa + v8) = v7;
  lastOutputDataPointer = self->_lastOutputDataPointer;
  bufferedGeneralOutputData = self->_bufferedGeneralOutputData;
  if (lastOutputDataPointer != bufferedGeneralOutputData)
  {
    id v14 = 0;
    unint64_t outputLengthUnchangedCounter = 0;
    self->_lastOutputsize_t Length = 0;
    self->_lastOutputDataPointer = bufferedGeneralOutputData;
    uint64_t v16 = 192;
    goto LABEL_23;
  }
  if (lastOutputDataPointer)
  {
    size_t v17 = dispatch_data_get_size(lastOutputDataPointer);
    id v14 = (objc_class *)v17;
    if (v17 && v17 == self->_lastOutputLength)
    {
      unint64_t outputLengthUnchangedCounter = self->_outputLengthUnchangedCounter + 1;
      self->_unint64_t outputLengthUnchangedCounter = outputLengthUnchangedCounter;
      uint64_t v18 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315394;
        __int16 v23 = "-[SiriCoreSiriBackgroundConnection _checkForProgressOnReadingData]";
        __int16 v24 = 2048;
        unint64_t v25 = outputLengthUnchangedCounter;
        _os_log_impl(&dword_21CBF7000, v18, OS_LOG_TYPE_INFO, "%s Incremented Output Unchanged Counter to %lu", (uint8_t *)&v22, 0x16u);
        unint64_t outputLengthUnchangedCounter = self->_outputLengthUnchangedCounter;
      }
      goto LABEL_22;
    }
  }
  else
  {
    id v14 = 0;
  }
  unint64_t outputLengthUnchangedCounter = 0;
  self->_unint64_t outputLengthUnchangedCounter = 0;
LABEL_22:
  uint64_t v16 = 176;
LABEL_23:
  *(Class *)((char *)&self->super.isa + v16) = v14;
  unint64_t inputLengthUnchangedCounter = self->_inputLengthUnchangedCounter;
  if (outputLengthUnchangedCounter > 9 || inputLengthUnchangedCounter > 9) {
    return (outputLengthUnchangedCounter + inputLengthUnchangedCounter > 2) | 0xCLL;
  }
  else {
    return outputLengthUnchangedCounter + inputLengthUnchangedCounter > 2;
  }
}

- (void)_pingTimerFired
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v43 = "-[SiriCoreSiriBackgroundConnection _pingTimerFired]";
    _os_log_impl(&dword_21CBF7000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  bufferedInputData = self->_bufferedInputData;
  if (bufferedInputData && dispatch_data_get_size(bufferedInputData)
    || (bufferedGeneralOutputData = self->_bufferedGeneralOutputData) != 0
    && dispatch_data_get_size(bufferedGeneralOutputData))
  {
    int64_t v6 = [(SiriCoreSiriBackgroundConnection *)self _checkForProgressOnReadingData];
  }
  else
  {
    int64_t v6 = [(SiriCoreSiriBackgroundConnection *)self _checkPings];
  }
  unint64_t v7 = v6;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 4) != 0) {
      goto LABEL_16;
    }
LABEL_14:
    id v9 = 0;
    int v10 = 0;
    uint64_t v11 = (v7 >> 3) & 1;
    if ((v7 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_29;
  }
  char v8 = [(SiriCoreConnectionProvider *)self->_connectionProvider shouldFallbackQuickly];
  if ((v7 & 4) == 0 && (v8 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_16:
  if (![(SiriCoreSiriBackgroundConnection *)self _usingPeer])
  {
    if ([(SiriCoreSiriBackgroundConnection *)self _usingPOP]
      || [(SiriCoreSiriBackgroundConnection *)self _usingFlorence])
    {
      unsigned int v12 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v43 = "-[SiriCoreSiriBackgroundConnection _pingTimerFired]";
        _os_log_impl(&dword_21CBF7000, v12, OS_LOG_TYPE_INFO, "%s Ping timeout while using POP or Florence method", buf, 0xCu);
      }
      uint64_t v38 = @"SiriCoreSiriConnectionShouldSkipTuscanyOnNextAttemptKey";
      uint64_t v39 = MEMORY[0x263EFFA88];
      int v10 = 1;
      id v9 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      LODWORD(v11) = 1;
      if ((v7 & 1) == 0)
      {
LABEL_35:
        if (!v11) {
          goto LABEL_46;
        }
        goto LABEL_36;
      }
    }
    else
    {
      id v9 = 0;
      int v10 = 0;
      LODWORD(v11) = 0;
      if ((v7 & 1) == 0) {
        goto LABEL_35;
      }
    }
LABEL_29:
    if ([(SiriCoreSiriBackgroundConnection *)self _usingPOP]
      && ![(SiriCoreSiriBackgroundConnection *)self _usingPeer]
      || ![(SiriCoreSiriBackgroundConnection *)self _tcpInfoIndicatesPoorLinkQuality])
    {
      goto LABEL_35;
    }
    pingInfo = self->_pingInfo;
    if (pingInfo)
    {
      uint64_t v15 = [(SiriCorePingInfo *)pingInfo numberOfUnacknowledgedPings];
      uint64_t v16 = self->_pingInfo;
      if (v16)
      {
        int64_t v17 = [(SiriCorePingInfo *)v16 pingAcknowledgedCount] + v15;
        goto LABEL_49;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    int64_t v17 = 0;
LABEL_49:
    v36[0] = @"pingCount";
    unint64_t v25 = [NSNumber numberWithInteger:v17];
    v36[1] = @"unacknowledgedPingCount";
    v37[0] = v25;
    uint64_t v26 = [NSNumber numberWithInteger:v15];
    v37[1] = v26;
    uint64_t v27 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

    if (self->_pingInfo) {
      uint64_t v28 = v27;
    }
    else {
      uint64_t v28 = 0;
    }
    CFDataRef v29 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:34 userInfo:v28];
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__SiriCoreSiriBackgroundConnection__pingTimerFired__block_invoke;
    block[3] = &unk_26443AF40;
    void block[4] = self;
    id v35 = v29;
    id v31 = v29;
    dispatch_async(queue, block);

    id v9 = (void *)v27;
    if ((v11 & 1) == 0) {
      goto LABEL_46;
    }
    goto LABEL_36;
  }
  if ([(SiriCoreSiriBackgroundConnection *)self _wifiOrCellularMayBeBetterThanCurrentStream])
  {
    id v40 = @"SiriCoreSiriConnectionShouldSkipIDSOnNextAttemptKey";
    uint64_t v41 = MEMORY[0x263EFFA88];
    id v9 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    int v10 = 0;
LABEL_36:
    uint64_t v18 = (os_log_t *)MEMORY[0x263F28358];
    id v19 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v43 = "-[SiriCoreSiriBackgroundConnection _pingTimerFired]";
      _os_log_impl(&dword_21CBF7000, v19, OS_LOG_TYPE_INFO, "%s Ping timeout", buf, 0xCu);
    }
    if ([(SiriCoreSiriBackgroundConnection *)self _hasReadHTTPHeader])
    {
      unint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = 6;
    }
    else
    {
      int v22 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v43 = "-[SiriCoreSiriBackgroundConnection _pingTimerFired]";
        _os_log_impl(&dword_21CBF7000, v22, OS_LOG_TYPE_INFO, "%s Overriding ping error since we haven't read our ace header yet.", buf, 0xCu);
      }
      unint64_t v20 = (void *)MEMORY[0x263F087E8];
      if (v10) {
        uint64_t v21 = 14;
      }
      else {
        uint64_t v21 = 5;
      }
    }
    __int16 v23 = [v20 errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:v21 userInfo:v9];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __51__SiriCoreSiriBackgroundConnection__pingTimerFired__block_invoke_129;
    v32[3] = &unk_26443AF40;
    v32[4] = self;
    id v33 = v23;
    id v24 = v23;
    [(SiriCoreSiriBackgroundConnection *)self _fallBackToNextConnectionMethodWithError:v24 orElse:v32];

    goto LABEL_46;
  }
  int v13 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v43 = "-[SiriCoreSiriBackgroundConnection _pingTimerFired]";
    _os_log_impl(&dword_21CBF7000, v13, OS_LOG_TYPE_INFO, "%s Ignoring Ping timeout since wifi isn't available to fall back to.", buf, 0xCu);
  }
  id v9 = 0;
LABEL_46:
}

void __51__SiriCoreSiriBackgroundConnection__pingTimerFired__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v3 siriBackgroundConnection:*(void *)(a1 + 32) didEncounterIntermediateError:*(void *)(a1 + 40)];
  }
}

uint64_t __51__SiriCoreSiriBackgroundConnection__pingTimerFired__block_invoke_129(uint64_t a1)
{
  [MEMORY[0x263F283F0] logPingTimeout];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _didEncounterError:v3];
}

- (void)_resumePingTimer
{
  if (self->_pingTimerSource)
  {
    pingInfo = self->_pingInfo;
    self->_pingInfo = 0;

    pingTimerSource = self->_pingTimerSource;
    dispatch_resume(pingTimerSource);
  }
}

- (void)setSendPings:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  pingTimerSource = self->_pingTimerSource;
  if (a3)
  {
    if (pingTimerSource)
    {
      self->_BOOL dispatchedSnapshotMetrics = 0;
    }
    else
    {
      unint64_t v7 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v15 = "-[SiriCoreSiriBackgroundConnection setSendPings:]";
        _os_log_impl(&dword_21CBF7000, v7, OS_LOG_TYPE_INFO, "%s Start sending pings", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      queue = self->_queue;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __49__SiriCoreSiriBackgroundConnection_setSendPings___block_invoke;
      handler[3] = &unk_26443A568;
      objc_copyWeak(&v13, (id *)buf);
      id v9 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, queue);
      dispatch_time_t v10 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v9, v10, 0x3B9ACA00uLL, 0);
      dispatch_source_set_event_handler(v9, handler);
      uint64_t v11 = self->_pingTimerSource;
      self->_pingTimerSource = (OS_dispatch_source *)v9;

      if (self->_isOpened)
      {
        [(SiriCoreSiriBackgroundConnection *)self _resumePingTimer];
        self->_BOOL dispatchedSnapshotMetrics = 0;
      }
      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }
  }
  else if (pingTimerSource)
  {
    unsigned int v5 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[SiriCoreSiriBackgroundConnection setSendPings:]";
      _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s Stop sending pings", buf, 0xCu);
      pingTimerSource = self->_pingTimerSource;
    }
    dispatch_source_cancel(pingTimerSource);
    if (!self->_isOpened) {
      dispatch_resume((dispatch_object_t)self->_pingTimerSource);
    }
    int64_t v6 = self->_pingTimerSource;
    self->_pingTimerSource = 0;
  }
}

void __49__SiriCoreSiriBackgroundConnection_setSendPings___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pingTimerFired];
}

- (void)_aceHeaderTimeoutFired:(id)a3 afterTimeout:(double)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  int64_t v6 = (OS_dispatch_source *)a3;
  unint64_t v7 = v6;
  if (self->_aceHeaderTimerSource == v6)
  {
    self->_aceHeaderTimerSource = 0;

    ++self->_aceHeaderTimerFireCount;
    if (![(SiriCoreSiriBackgroundConnection *)self _hasReadACEHeader])
    {
      if (self->_isOpened && self->_aceHeaderTimerFireCount <= 1)
      {
        if ([(SiriCoreSiriBackgroundConnection *)self _usingPOP])
        {
          char v8 = *MEMORY[0x263F28358];
          int v9 = 1;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            CFDataRef v29 = "-[SiriCoreSiriBackgroundConnection _aceHeaderTimeoutFired:afterTimeout:]";
            dispatch_time_t v10 = "%s ACE Header timeout while using POP Connection Method";
LABEL_13:
            _os_log_impl(&dword_21CBF7000, v8, OS_LOG_TYPE_INFO, v10, buf, 0xCu);
            goto LABEL_14;
          }
          goto LABEL_14;
        }
        if ([(SiriCoreSiriBackgroundConnection *)self _usingFlorence])
        {
          char v8 = *MEMORY[0x263F28358];
          int v9 = 1;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            CFDataRef v29 = "-[SiriCoreSiriBackgroundConnection _aceHeaderTimeoutFired:afterTimeout:]";
            dispatch_time_t v10 = "%s ACE Header timeout while using Florence";
            goto LABEL_13;
          }
LABEL_14:
          uint64_t v11 = 0;
          goto LABEL_15;
        }
        if (![(SiriCoreSiriBackgroundConnection *)self _usingPeer]
          || ![(SiriCoreSiriBackgroundConnection *)self _wifiOrCellularMayBeBetterThanCurrentStream])
        {
          int64_t v17 = (os_log_t *)MEMORY[0x263F28358];
          uint64_t v18 = *MEMORY[0x263F28358];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            CFDataRef v29 = "-[SiriCoreSiriBackgroundConnection _aceHeaderTimeoutFired:afterTimeout:]";
            _os_log_impl(&dword_21CBF7000, v18, OS_LOG_TYPE_INFO, "%s Rescheduling aceheader timeout since wifi isn't available or bt link is ok", buf, 0xCu);
          }
          [(SiriCoreSiriBackgroundConnection *)self _scheduleAceHeaderTimeoutTimerWithInterval:30.0 - a4];
          if (self->_isOpened)
          {
            id v19 = *v17;
            if (os_log_type_enabled(*v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              CFDataRef v29 = "-[SiriCoreSiriBackgroundConnection _aceHeaderTimeoutFired:afterTimeout:]";
              _os_log_impl(&dword_21CBF7000, v19, OS_LOG_TYPE_INFO, "%s Ace Header Timeout. Intermediate error", buf, 0xCu);
            }
            id v16 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:5 userInfo:0];
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

            if (WeakRetained)
            {
              id v21 = objc_loadWeakRetained((id *)&self->_delegate);
              [v21 siriBackgroundConnection:self didEncounterIntermediateError:v16];
            }
          }
          else
          {
            id v16 = 0;
          }
          uint64_t v11 = 0;
          goto LABEL_21;
        }
        uint64_t v26 = @"SiriCoreSiriConnectionShouldSkipIDSOnNextAttemptKey";
        uint64_t v27 = MEMORY[0x263EFFA88];
        uint64_t v11 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      }
      else
      {
        uint64_t v11 = 0;
      }
      int v9 = 0;
LABEL_15:
      unsigned int v12 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        CFDataRef v29 = "-[SiriCoreSiriBackgroundConnection _aceHeaderTimeoutFired:afterTimeout:]";
        _os_log_impl(&dword_21CBF7000, v12, OS_LOG_TYPE_INFO, "%s Ace Header Timeout. Error", buf, 0xCu);
      }
      if (v9)
      {
        id v24 = @"SiriCoreSiriConnectionShouldSkipTuscanyOnNextAttemptKey";
        uint64_t v25 = MEMORY[0x263EFFA88];
        uint64_t v13 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

        uint64_t v14 = 14;
        uint64_t v11 = (void *)v13;
      }
      else
      {
        uint64_t v14 = 5;
      }
      uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:v14 userInfo:v11];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __72__SiriCoreSiriBackgroundConnection__aceHeaderTimeoutFired_afterTimeout___block_invoke;
      v22[3] = &unk_26443AF40;
      v22[4] = self;
      id v16 = v15;
      id v23 = v16;
      [(SiriCoreSiriBackgroundConnection *)self _fallBackToNextConnectionMethodWithError:v16 orElse:v22];

LABEL_21:
    }
  }
}

uint64_t __72__SiriCoreSiriBackgroundConnection__aceHeaderTimeoutFired_afterTimeout___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didEncounterError:*(void *)(a1 + 40)];
}

- (void)_scheduleAceHeaderTimeoutTimerWithInterval:(double)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unsigned int v5 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int64_t v17 = "-[SiriCoreSiriBackgroundConnection _scheduleAceHeaderTimeoutTimerWithInterval:]";
    __int16 v18 = 1024;
    int v19 = (int)a3;
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s Scheduling Ace Header timeout for %d seconds", buf, 0x12u);
  }
  aceHeaderTimerSource = self->_aceHeaderTimerSource;
  if (aceHeaderTimerSource)
  {
    dispatch_source_cancel(aceHeaderTimerSource);
    unint64_t v7 = self->_aceHeaderTimerSource;
    self->_aceHeaderTimerSource = 0;
  }
  if (a3 > 0.0)
  {
    char v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
    dispatch_time_t v9 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v8, v9, (unint64_t)(a3 * 1000000000.0), 0);
    objc_initWeak((id *)buf, self);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __79__SiriCoreSiriBackgroundConnection__scheduleAceHeaderTimeoutTimerWithInterval___block_invoke;
    handler[3] = &unk_26443A540;
    dispatch_time_t v10 = v8;
    uint64_t v14 = v10;
    objc_copyWeak(v15, (id *)buf);
    v15[1] = *(id *)&a3;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume(v10);
    uint64_t v11 = self->_aceHeaderTimerSource;
    self->_aceHeaderTimerSource = (OS_dispatch_source *)v10;
    unsigned int v12 = v10;

    objc_destroyWeak(v15);
    objc_destroyWeak((id *)buf);
  }
}

void __79__SiriCoreSiriBackgroundConnection__scheduleAceHeaderTimeoutTimerWithInterval___block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _aceHeaderTimeoutFired:*(void *)(a1 + 32) afterTimeout:*(double *)(a1 + 48)];
}

- (BOOL)_wifiOrCellularMayBeBetterThanCurrentStream
{
  char v3 = AFDeviceSupportsWiFiLPASMode();
  return v3 & [(SiriCoreSiriBackgroundConnection *)self _tcpInfoIndicatesPoorLinkQuality];
}

- (BOOL)_tcpInfoIndicatesPoorLinkQuality
{
  return [(SiriCoreConnectionProvider *)self->_connectionProvider providerStatsIndicatePoorLinkQuality];
}

- (void)_getWifiMetrics:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v16 = 0;
  unsigned __int8 v15 = 0;
  id v4 = a3;
  unsigned int v5 = objc_alloc_init(SiriCoreWiFiManagerClient);
  id v13 = 0;
  id v14 = 0;
  [(SiriCoreWiFiManagerClient *)v5 hasAssociatedNetworkWithRSSI:&v18 andSNR:&v17 andCCA:&v16 andPhyMode:&v14 andChannelInfo:&v13 isCaptive:&v15];
  id v6 = v14;
  id v7 = v13;
  char v8 = [NSNumber numberWithInteger:v18];
  [v4 setRssi:v8];

  dispatch_time_t v9 = [NSNumber numberWithInteger:v16];
  [v4 setCca:v9];

  [v4 setWifiPhyMode:v6];
  [v4 setWifiChannelInfo:v7];

  dispatch_time_t v10 = [NSNumber numberWithBool:v15];
  [v4 setIsCaptive:v10];

  int64_t v11 = [(SiriCoreSiriBackgroundConnection *)self _normalizeSNR:v17];
  unsigned int v12 = [NSNumber numberWithInteger:v11];
  [v4 setSnr:v12];
}

- (int64_t)_normalizeSNR:(int64_t)a3
{
  uint64_t v3 = 40;
  if ((unint64_t)(a3 - 25) < 0xF) {
    uint64_t v3 = 25;
  }
  if ((unint64_t)(a3 - 15) >= 0xA) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 15;
  }
  if ((unint64_t)(a3 - 10) >= 5) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = 10;
  }
  if ((unint64_t)a3 >= 0xA) {
    return v5;
  }
  else {
    return 0;
  }
}

- (void)_getCellularMetrics:(id)a3
{
  id v8 = 0;
  id v9 = 0;
  id v7 = &unk_26CD90A50;
  id v3 = a3;
  +[SiriCoreNetworkManager getCarrierName:&v9 signalStrength:&v8 subscriptionCount:&v7];
  id v4 = v9;
  id v5 = v8;
  id v6 = v7;
  [v3 setCarrierName:v4];
  [v3 setSignalStrengthBars:v5];
  [v3 setSimSubscriptions:v6];
}

- (BOOL)_canFallBackFromError:(id)a3
{
  return [(SiriCoreConnectionProvider *)self->_connectionProvider shouldFallbackFromError:a3];
}

- (void)_fallBackToNextConnectionMethodWithError:(id)a3 orElse:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = (os_log_t *)MEMORY[0x263F28358];
  id v9 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136315394;
    id v31 = "-[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethodWithError:orElse:]";
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl(&dword_21CBF7000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v30, 0x16u);
  }
  int64_t v10 = [(SiriCoreSiriBackgroundConnection *)self _nextConnectionMethod];
  double v11 = 0.0;
  if (v10)
  {
    uint64_t NextSupported = v10;
    goto LABEL_5;
  }
  if (self->_connectionMethod != 2 || !self->_usesProxyConnection) {
    goto LABEL_24;
  }
  if ([(SiriCoreSiriConnectionInfo *)self->_connectionInfo useWiFiHint])
  {
    uint64_t v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136315394;
      id v31 = "-[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethodWithError:orElse:]";
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_21CBF7000, v16, OS_LOG_TYPE_DEFAULT, "%s Resetting connection method on error (%@) while trying peer", (uint8_t *)&v30, 0x16u);
    }
    uint64_t v17 = [(SiriCoreSiriConnectionInfo *)self->_connectionInfo connectionPolicyRoute];
    uint64_t v18 = [v17 type];
    uint64_t NextSupported = _SiriCoreSiriConnectionMethodGetNextSupported(0, v18, self->_usesProxyConnection);

    [(SiriCoreSiriConnectionInfo *)self->_connectionInfo setUseWiFiHint:0];
    goto LABEL_5;
  }
  if (!AFHasCellularData() || !objc_msgSend(v6, "siriCore_isNetworkDownError"))
  {
LABEL_24:
    p_safetyNetBuffer = &self->_safetyNetBuffer;
    goto LABEL_25;
  }
  int v19 = [MEMORY[0x263F08AB0] processInfo];
  [v19 systemUptime];
  double v21 = v20 - self->_firstStartTime;

  int v22 = *v8;
  BOOL v23 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
  if (v21 > 30.0)
  {
    if (v23)
    {
      int v30 = 136315138;
      id v31 = "-[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethodWithError:orElse:]";
      _os_log_impl(&dword_21CBF7000, v22, OS_LOG_TYPE_DEFAULT, "%s Ran out of time waiting for network to become available", (uint8_t *)&v30, 0xCu);
    }
    goto LABEL_24;
  }
  if (v23)
  {
    int v30 = 136315394;
    id v31 = "-[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethodWithError:orElse:]";
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl(&dword_21CBF7000, v22, OS_LOG_TYPE_DEFAULT, "%s Resetting connection method on error (%@) while waiting for cellular", (uint8_t *)&v30, 0x16u);
  }
  uint64_t v25 = [(SiriCoreSiriConnectionInfo *)self->_connectionInfo connectionPolicyRoute];
  uint64_t v26 = [v25 type];
  uint64_t NextSupported = _SiriCoreSiriConnectionMethodGetNextSupported(0, v26, self->_usesProxyConnection);

  double v11 = 1.0;
LABEL_5:
  p_safetyNetBuffer = &self->_safetyNetBuffer;
  if (self->_safetyNetBuffer
    && NextSupported
    && [(SiriCoreSiriBackgroundConnection *)self _canFallBackFromError:v6])
  {
    [(SiriCoreSiriBackgroundConnection *)self _fallBackToNextConnectionMethod:NextSupported fromError:v6 afterDelay:v11];
    if (v6)
    {
      id v14 = [(SiriCoreSiriConnectionInfo *)self->_connectionInfo url];
      if (v14)
      {
        unsigned __int8 v15 = (void *)*MEMORY[0x263F28300];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28300], OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = v15;
          id v28 = [v14 absoluteString];
          uint64_t v29 = [v28 UTF8String];
          int v30 = 136315138;
          id v31 = (const char *)v29;
          _os_log_error_impl(&dword_21CBF7000, v27, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v30, 0xCu);
        }
      }
    }
    goto LABEL_27;
  }
LABEL_25:
  id v24 = *p_safetyNetBuffer;
  *p_safetyNetBuffer = 0;

  if (v7) {
    v7[2](v7);
  }
LABEL_27:
}

- (void)_fallBackToNextConnectionMethod:(int64_t)a3 fromError:(id)a4 afterDelay:(double)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (os_log_t *)MEMORY[0x263F28358];
  int64_t v10 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v23 = "-[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethod:fromError:afterDelay:]";
    __int16 v24 = 2112;
    double v25 = *(double *)&v8;
    _os_log_impl(&dword_21CBF7000, v10, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  double v11 = [NSNumber numberWithInteger:self->_connectionMethod];
  unsigned int v12 = [(NSMutableDictionary *)self->_errorsForConnectionMethods objectForKey:v11];

  if (v12) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = [(SiriCoreSiriBackgroundConnection *)self _shouldTrySameConnectionMethodForMethod:self->_connectionMethod error:v8];
  }
  if (!self->_errorsForConnectionMethods)
  {
    id v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    errorsForConnectionMethods = self->_errorsForConnectionMethods;
    self->_errorsForConnectionMethods = v14;
  }
  if (v8)
  {
    uint64_t v16 = objc_alloc_init(SiriCoreErrorInfo);
    [(SiriCoreErrorInfo *)v16 setError:v8];
    [(SiriCoreErrorInfo *)v16 setIsPeerConnectionError:[(SiriCoreConnectionProvider *)self->_connectionProvider isPeerConnectionError:v8]];
    [(SiriCoreErrorInfo *)v16 setIsPeerNotNearbyError:[(SiriCoreConnectionProvider *)self->_connectionProvider isPeerNotNearbyError:v8]];
    [(NSMutableDictionary *)self->_errorsForConnectionMethods setObject:v16 forKey:v11];
  }
  [(SiriCoreSiriBackgroundConnection *)self _closeConnectionAndPrepareForReconnect:1];
  if (a5 <= 0.0)
  {
    [(SiriCoreSiriBackgroundConnection *)self _startWithConnectionInfo:self->_connectionInfo proposedFallbackMethod:a3 allowFallbackToNewMethod:!v13];
  }
  else
  {
    uint64_t v17 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v23 = "-[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethod:fromError:afterDelay:]";
      __int16 v24 = 2048;
      double v25 = a5;
      _os_log_impl(&dword_21CBF7000, v17, OS_LOG_TYPE_DEFAULT, "%s Delaying fallback for %lfs", buf, 0x16u);
    }
    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__SiriCoreSiriBackgroundConnection__fallBackToNextConnectionMethod_fromError_afterDelay___block_invoke;
    block[3] = &unk_26443A518;
    void block[4] = self;
    void block[5] = a3;
    BOOL v21 = v13;
    dispatch_after(v18, queue, block);
  }
}

uint64_t __89__SiriCoreSiriBackgroundConnection__fallBackToNextConnectionMethod_fromError_afterDelay___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethod:fromError:afterDelay:]_block_invoke";
    _os_log_impl(&dword_21CBF7000, v2, OS_LOG_TYPE_DEFAULT, "%s Beginning fallback now", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _startWithConnectionInfo:*(void *)(*(void *)(a1 + 32) + 32) proposedFallbackMethod:*(void *)(a1 + 40) allowFallbackToNewMethod:*(unsigned char *)(a1 + 48) == 0];
}

- (BOOL)_shouldTrySameConnectionMethodForMethod:(int64_t)a3 error:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 userInfo];
  uint64_t v7 = [v6 objectForKey:*MEMORY[0x263F08608]];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v5;
  }
  id v10 = v9;

  double v11 = [v10 domain];
  if (([v11 isEqualToString:*MEMORY[0x263F08438]] & 1) == 0
    && ![v11 isEqualToString:*MEMORY[0x263F144D0]])
  {
    goto LABEL_17;
  }
  uint64_t v12 = [v10 code];
  BOOL v14 = v12 == 9 || v12 == 57;
  if (a3 == 3 && v12 != 9 && v12 != 57)
  {
    if (v12 == 54)
    {
      BOOL v14 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v14 = 0;
  }
LABEL_18:

  return v14;
}

- (BOOL)_hasBufferedDataOrOutstandingPings
{
  bufferedInputData = self->_bufferedInputData;
  return bufferedInputData && dispatch_data_get_size(bufferedInputData)
      || (bufferedGeneralOutputData = self->_bufferedGeneralOutputData) != 0
      && dispatch_data_get_size(bufferedGeneralOutputData)
      || self->_pingTimerSource != 0;
}

- (id)_bestErrorBetweenError:(id)a3 peerError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v7;
  if (v6)
  {
    id v9 = [v6 userInfo];
    id v10 = [v9 objectForKey:*MEMORY[0x263F08608]];

    if (v10) {
      double v11 = v10;
    }
    else {
      double v11 = v6;
    }
    id v8 = v11;
  }

  return v8;
}

- (void)_didEncounterError:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_hasReportedError)
  {
    id v5 = [(NSMutableDictionary *)self->_errorsForConnectionMethods objectForKey:&unk_26CD90A38];
    id v6 = v5;
    if (!v5) {
      goto LABEL_11;
    }
    if ([v5 isPeerNotNearbyError] && AFHasCellularData())
    {
      id v7 = v4;
    }
    else
    {
      int v8 = [v6 isPeerConnectionError];
      id v9 = (void *)MEMORY[0x263F28508];
      id v10 = [v6 error];
      double v11 = [(SiriCoreSiriBackgroundConnection *)self _bestErrorBetweenError:v4 peerError:v10];
      if (v8)
      {
        uint64_t v12 = @"Couldn't reach companion for peer connection";
        BOOL v13 = v9;
        uint64_t v14 = 1000;
      }
      else
      {
        uint64_t v12 = @"Companion couldn't reach Siri";
        BOOL v13 = v9;
        uint64_t v14 = 1001;
      }
      id v7 = [v13 errorWithCode:v14 description:v12 underlyingError:v11];
    }
    [(objc_class *)self->_peerProviderClass getMetricsContext:&__block_literal_global_569];
    if (!v7) {
LABEL_11:
    }
      id v7 = v4;
    unsigned __int8 v15 = (void *)*MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v15;
      uint64_t v17 = [v6 error];
      int v25 = 136316162;
      uint64_t v26 = "-[SiriCoreSiriBackgroundConnection _didEncounterError:]";
      __int16 v27 = 2112;
      id v28 = self;
      __int16 v29 = 2112;
      id v30 = v4;
      __int16 v31 = 2112;
      __int16 v32 = v17;
      __int16 v33 = 2112;
      id v34 = v7;
      _os_log_impl(&dword_21CBF7000, v16, OS_LOG_TYPE_INFO, "%s connection (%@) error=(%@)\npeerError=(%@)\nfinalError=(%@)", (uint8_t *)&v25, 0x34u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v19 = [(SiriCoreSiriBackgroundConnection *)self analysisInfo];
    [WeakRetained siriBackgroundConnection:self didEncounterError:v7 analysisInfo:v19];

    double v20 = [(SiriCoreSiriConnectionInfo *)self->_connectionInfo url];
    if (v20)
    {
      BOOL v21 = (void *)*MEMORY[0x263F28300];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28300], OS_LOG_TYPE_ERROR))
      {
        int v22 = v21;
        id v23 = [v20 absoluteString];
        uint64_t v24 = [v23 UTF8String];
        int v25 = 136315138;
        uint64_t v26 = (const char *)v24;
        _os_log_error_impl(&dword_21CBF7000, v22, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v25, 0xCu);
      }
    }
    self->_hasReportedError = 1;
  }
}

void __55__SiriCoreSiriBackgroundConnection__didEncounterError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263F283F8] sharedAnalytics];
  [v3 logEventWithType:1004 context:v2 contextNoCopy:1];

  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [v2 objectForKey:@"connected_bt_devices"];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [v2 objectForKey:@"connected_bt_devices"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v34 = v2;
      int v8 = [v2 objectForKey:@"connected_bt_devices"];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v37 != v11) {
              objc_enumerationMutation(v8);
            }
            BOOL v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = v13;
              id v15 = objc_alloc_init(MEMORY[0x263F6E440]);
              uint64_t v16 = [v14 objectForKey:@"index"];
              if (v16)
              {
                uint64_t v17 = [v14 objectForKey:@"index"];
                [v15 setIndex:v17];
              }
              else
              {
                [v15 setIndex:0];
              }

              dispatch_time_t v18 = [v14 objectForKey:@"RSSI"];
              if (v18)
              {
                int v19 = [v14 objectForKey:@"RSSI"];
                [v19 doubleValue];
                objc_msgSend(v15, "setRssi:");
              }
              else
              {
                [v15 setRssi:0.0];
              }

              [v35 addObject:v15];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v10);
      }

      id v2 = v34;
    }
  }
  id v20 = objc_alloc_init(MEMORY[0x263F6E4D0]);
  [v20 setConnectedBtDevices:v35];
  BOOL v21 = [v2 objectForKey:@"cloud_connected"];
  if (v21)
  {
    int v22 = [v2 objectForKey:@"cloud_connected"];
    objc_msgSend(v20, "setIsCloudConnected:", objc_msgSend(v22, "BOOLValue"));
  }
  else
  {
    [v20 setIsCloudConnected:0];
  }

  id v23 = [v2 objectForKey:@"connected"];
  if (v23)
  {
    uint64_t v24 = [v2 objectForKey:@"connected"];
    objc_msgSend(v20, "setIsConnected:", objc_msgSend(v24, "BOOLValue"));
  }
  else
  {
    [v20 setIsConnected:0];
  }

  int v25 = [v2 objectForKey:@"has_device"];
  if (v25)
  {
    uint64_t v26 = [v2 objectForKey:@"has_device"];
    objc_msgSend(v20, "setHasDevice:", objc_msgSend(v26, "BOOLValue"));
  }
  else
  {
    [v20 setHasDevice:0];
  }

  __int16 v27 = [v2 objectForKey:@"last_nearby_status_change"];
  if (v27)
  {
    id v28 = [v2 objectForKey:@"last_nearby_status_change"];
    [v28 doubleValue];
    objc_msgSend(v20, "setTimeSinceLastNearbyChangeInSeconds:");
  }
  else
  {
    [v20 setTimeSinceLastNearbyChangeInSeconds:0.0];
  }

  __int16 v29 = [v2 objectForKey:@"nearby"];
  if (v29)
  {
    id v30 = [v2 objectForKey:@"nearby"];
    objc_msgSend(v20, "setIsNearby:", objc_msgSend(v30, "BOOLValue"));
  }
  else
  {
    [v20 setIsNearby:0];
  }

  __int16 v31 = [v2 objectForKey:@"preferring_bt_classic"];
  if (v31)
  {
    __int16 v32 = [v2 objectForKey:@"preferring_bt_classic"];
    objc_msgSend(v20, "setIsPreferringBtClassic:", objc_msgSend(v32, "BOOLValue"));
  }
  else
  {
    [v20 setIsPreferringBtClassic:0];
  }

  __int16 v33 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
  [v33 logPeerConnectionFailed:v20];
}

- (void)_closeConnection
{
}

- (void)_closeConnectionAndPrepareForReconnect:(BOOL)a3
{
  [(SiriCoreConnectionProvider *)self->_connectionProvider close];
  connectionProvider = self->_connectionProvider;
  self->_connectionProvider = 0;

  bufferedInputData = self->_bufferedInputData;
  self->_bufferedInputData = 0;

  inputDecompressor = self->_inputDecompressor;
  self->_inputDecompressor = 0;

  if (!a3)
  {
    bufferedGeneralOutputData = self->_bufferedGeneralOutputData;
    self->_bufferedGeneralOutputData = 0;

    outputCompressor = self->_outputCompressor;
    self->_outputCompressor = 0;

    bufferedUncompressedData = self->_bufferedUncompressedData;
    self->_bufferedUncompressedData = 0;

    [(SiriCoreSiriBackgroundConnection *)self _cancelOutstandingBarriers];
  }
  httpResponseHeader = self->_httpResponseHeader;
  if (httpResponseHeader)
  {
    CFRelease(httpResponseHeader);
    self->_httpResponseHeader = 0;
  }
  aceHeaderTimerSource = self->_aceHeaderTimerSource;
  if (aceHeaderTimerSource)
  {
    dispatch_source_cancel(aceHeaderTimerSource);
    BOOL v13 = self->_aceHeaderTimerSource;
    self->_aceHeaderTimerSource = 0;
  }
  pingTimerSource = self->_pingTimerSource;
  if (pingTimerSource)
  {
    dispatch_source_cancel(pingTimerSource);
    if (!self->_isOpened) {
      dispatch_resume((dispatch_object_t)self->_pingTimerSource);
    }
    id v15 = self->_pingTimerSource;
    self->_pingTimerSource = 0;
  }
  *(_WORD *)&self->_isOpened = 0;
  self->_hasReportedError = 0;

  kdebug_trace();
}

- (void)_initializeBufferedGeneralOutputDataWithInitialPayload:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  bufferedGeneralOutputData = self->_bufferedGeneralOutputData;
  p_bufferedGeneralOutputData = &self->_bufferedGeneralOutputData;
  if (!bufferedGeneralOutputData)
  {
    objc_storeStrong((id *)p_bufferedGeneralOutputData, MEMORY[0x263EF8388]);
    if (a3)
    {
      id v7 = objc_alloc_init(SiriCoreZlibDataCompressor);
      outputCompressor = self->_outputCompressor;
      self->_outputCompressor = &v7->super;
    }
    else
    {
      uint64_t v9 = (os_log_t *)MEMORY[0x263F28358];
      uint64_t v10 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        int v19 = "-[SiriCoreSiriBackgroundConnection _initializeBufferedGeneralOutputDataWithInitialPayload:]";
        _os_log_impl(&dword_21CBF7000, v10, OS_LOG_TYPE_INFO, "%s Sending HTTP Header", (uint8_t *)&v18, 0xCu);
      }
      uint64_t v11 = [(SiriCoreSiriBackgroundConnection *)self _httpHeaderData];
      [(SiriCoreSiriBackgroundConnection *)self _bufferGeneralData:v11];

      uint64_t v12 = objc_alloc_init(SiriCoreZlibDataCompressor);
      BOOL v13 = self->_outputCompressor;
      self->_outputCompressor = &v12->super;

      id v14 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        int v19 = "-[SiriCoreSiriBackgroundConnection _initializeBufferedGeneralOutputDataWithInitialPayload:]";
        _os_log_impl(&dword_21CBF7000, v14, OS_LOG_TYPE_INFO, "%s Sending ACE Header", (uint8_t *)&v18, 0xCu);
      }
      id v15 = [(SiriCoreSiriBackgroundConnection *)self _aceHeaderData];
      [(SiriCoreSiriBackgroundConnection *)self _bufferGeneralData:v15];
    }
  }
  bufferedUncompressedData = self->_bufferedUncompressedData;
  p_bufferedUncompressedData = &self->_bufferedUncompressedData;
  if (!bufferedUncompressedData) {
    objc_storeStrong((id *)p_bufferedUncompressedData, MEMORY[0x263EF8388]);
  }
}

- (id)_aceHeaderData
{
  return +[SiriCoreAceSerialization dataForStreamHeaderWithCompressionType:2];
}

- (id)_httpHeaderData
{
  BOOL siriConnectionUsesPeerManagedSync = self->_siriConnectionUsesPeerManagedSync;
  uint64_t v4 = [(SiriCoreSiriConnectionInfo *)self->_connectionInfo url];
  id v5 = [(SiriCoreSiriConnectionInfo *)self->_connectionInfo aceHost];
  id v6 = [(SiriCoreSiriConnectionInfo *)self->_connectionInfo languageCode];
  connectionInfo = self->_connectionInfo;
  if (siriConnectionUsesPeerManagedSync) {
    [(SiriCoreSiriConnectionInfo *)connectionInfo peerAssistantIdentifier];
  }
  else {
  int v8 = [(SiriCoreSiriConnectionInfo *)connectionInfo assistantIdentifier];
  }
  uint64_t v9 = [(SiriCoreSiriBackgroundConnection *)self _headerDataForURL:v4 aceHost:v5 languageCode:v6 syncAssistantId:v8];

  return v9;
}

- (void)_forceTriggerRetry
{
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:32 userInfo:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained siriBackgroundConnection:self didEncounterError:v4 analysisInfo:0];
}

- (void)_cancelSecondaryConnection
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  secondaryConnectionProvider = self->_secondaryConnectionProvider;
  if (secondaryConnectionProvider)
  {
    id v4 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315138;
      id v7 = "-[SiriCoreSiriBackgroundConnection _cancelSecondaryConnection]";
      _os_log_debug_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_DEBUG, "%s Canceling secondary connection", (uint8_t *)&v6, 0xCu);
      secondaryConnectionProvider = self->_secondaryConnectionProvider;
    }
    [(SiriCoreConnectionProvider *)secondaryConnectionProvider close];
    id v5 = self->_secondaryConnectionProvider;
    self->_secondaryConnectionProvider = 0;

    self->_secondaryConnectionOpenState = 0;
    self->_betterPathAvailable = 0;
  }
}

- (void)_startSecondaryConnection
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (!self->_secondaryConnectionOpenState)
  {
    id v3 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v31 = "-[SiriCoreSiriBackgroundConnection _startSecondaryConnection]";
      _os_log_impl(&dword_21CBF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting secondary connection.", buf, 0xCu);
    }
    self->_secondaryConnectionOpenState = 1;
    id v4 = self->_connectionInfo;
    id v5 = [(SiriCoreSiriConnectionInfo *)v4 url];
    int v6 = [[SiriCoreNWConnection alloc] initWithQueue:self->_queue];
    id v7 = [(SiriCoreSiriConnectionInfo *)v4 connectionPolicyRoute];
    [(SiriCoreNWConnection *)v6 setPolicyRoute:v7];

    uint64_t v8 = [(SiriCoreSiriConnectionInfo *)v4 connectionPolicy];
    [(SiriCoreNWConnection *)v6 setProviderConnectionPolicy:v8];

    [(SiriCoreNWConnection *)v6 setPrefersWWAN:[(SiriCoreSiriConnectionInfo *)v4 prefersWWAN]];
    [(SiriCoreNWConnection *)v6 setConnectByPOPMethod:0];
    [(SiriCoreNWConnection *)v6 setDelegate:self];
    objc_storeStrong((id *)&self->_secondaryConnectionProvider, v6);
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    if (AFIsInternalInstall())
    {
      v29[0] = v10;
      v28[0] = @"provider";
      v28[1] = @"id";
      uint64_t v11 = [NSNumber numberWithUnsignedLong:v6];
      v29[1] = v11;
      v28[2] = @"connectionId";
      uint64_t v12 = [(SiriCoreSiriConnectionInfo *)v4 connectionId];
      BOOL v13 = (void *)v12;
      if (v12) {
        id v14 = (__CFString *)v12;
      }
      else {
        id v14 = &stru_26CD85388;
      }
      v29[2] = v14;
      v28[3] = @"url";
      id v15 = [(SiriCoreSiriConnectionInfo *)v4 url];
      uint64_t v16 = [v15 absoluteString];
      uint64_t v17 = (void *)v16;
      if (v16) {
        int v18 = (__CFString *)v16;
      }
      else {
        int v18 = &stru_26CD85388;
      }
      v29[3] = v18;
      int v19 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];
    }
    else
    {
      v26[0] = @"provider";
      v26[1] = @"id";
      v27[0] = v10;
      uint64_t v11 = [NSNumber numberWithUnsignedLong:v6];
      v27[1] = v11;
      int v19 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    }

    uint64_t v20 = [MEMORY[0x263F283F8] sharedAnalytics];
    [v20 logEventWithType:1009 context:v19];

    secondaryConnectionProvider = self->_secondaryConnectionProvider;
    int v22 = [(SiriCoreSiriConnectionInfo *)v4 connectionId];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __61__SiriCoreSiriBackgroundConnection__startSecondaryConnection__block_invoke;
    v24[3] = &unk_26443A4D0;
    v24[4] = self;
    id v25 = v19;
    id v23 = v19;
    [(SiriCoreConnectionProvider *)secondaryConnectionProvider openConnectionForURL:v5 withConnectionId:v22 initialPayload:0 completion:v24];
  }
}

void __61__SiriCoreSiriBackgroundConnection__startSecondaryConnection__block_invoke(uint64_t a1, void *a2)
{
  v21[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  kdebug_trace();
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 336);
  id v5 = [MEMORY[0x263F283F8] sharedAnalytics];
  v21[0] = *(void *)(a1 + 40);
  int v6 = AFAnalyticsContextCreateWithError();
  v21[1] = v6;
  int v19 = @"primaryIsViable";
  id v7 = [NSNumber numberWithBool:v4];
  uint64_t v20 = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v21[2] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  uint64_t v10 = AFAnalyticsContextsMerge();
  [v5 logEventWithType:1010 context:v10];

  if (v4)
  {
    uint64_t v11 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = @"ignored with no errors.";
      if (v3) {
        uint64_t v12 = v3;
      }
      int v15 = 136315394;
      uint64_t v16 = "-[SiriCoreSiriBackgroundConnection _startSecondaryConnection]_block_invoke";
      __int16 v17 = 2112;
      int v18 = v12;
      _os_log_impl(&dword_21CBF7000, v11, OS_LOG_TYPE_DEFAULT, "%s Secondary open completion %@", (uint8_t *)&v15, 0x16u);
    }
    [*(id *)(a1 + 32) _cancelSecondaryConnection];
  }
  else if (v3)
  {
    [*(id *)(a1 + 32) _cancelSecondaryConnection];
    BOOL v13 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:3 userInfo:0];
    [*(id *)(a1 + 32) _didEncounterError:v13];
  }
  else
  {
    id v14 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      uint64_t v16 = "-[SiriCoreSiriBackgroundConnection _startSecondaryConnection]_block_invoke";
      _os_log_impl(&dword_21CBF7000, v14, OS_LOG_TYPE_DEFAULT, "%s Secondary connection opened and waiting.", (uint8_t *)&v15, 0xCu);
    }
    *(void *)(*(void *)(a1 + 32) + 344) = 2;
    [*(id *)(a1 + 32) _forceTriggerRetry];
  }
}

- (void)updateActiveBackgroundConnectionWithSecondary
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [(SiriCoreSiriBackgroundConnection *)self _closeConnectionAndPrepareForReconnect:0];
  objc_storeStrong((id *)&self->_connectionProvider, self->_secondaryConnectionProvider);
  secondaryConnectionProvider = self->_secondaryConnectionProvider;
  self->_secondaryConnectionProvider = 0;

  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int v6 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
  [v6 setConnectionProvider:v5];

  id v7 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[SiriCoreSiriBackgroundConnection updateActiveBackgroundConnectionWithSecondary]";
    _os_log_impl(&dword_21CBF7000, v7, OS_LOG_TYPE_INFO, "%s secondary provider opened", (uint8_t *)&v10, 0xCu);
  }
  int v8 = [(SiriCoreConnectionProvider *)self->_connectionProvider shouldFallbackQuickly];
  double v9 = 7.0;
  if (v8) {
    double v9 = 5.0;
  }
  [(SiriCoreSiriBackgroundConnection *)self _scheduleAceHeaderTimeoutTimerWithInterval:v9];
  [(SiriCoreSiriBackgroundConnection *)self _updateBuffersForInitialPayload:0 bufferedLength:0 forceReconnect:[(SiriCoreSiriConnectionInfo *)self->_connectionInfo forceReconnect]];
  self->_httpResponseHeader = CFHTTPMessageCreateEmpty(0, 0);
  [(SiriCoreSiriBackgroundConnection *)self _setupReadHandlerOnProvider];
  [(SiriCoreSiriBackgroundConnection *)self _networkProviderDidOpen];
  self->_secondaryConnectionOpenState = 0;
  *(_WORD *)&self->_primaryConnectionViable = 1;
}

- (void)cancel
{
  if (!self->_isCanceled)
  {
    [(SiriCoreSiriBackgroundConnection *)self _closeConnection];
    self->_BOOL isCanceled = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_storeWeak((id *)&self->_delegate, 0);
    [WeakRetained siriBackgroundConnectionDidClose:self];
  }
}

- (void)_startNetworkProviderWithInfo:(id)a3
{
  v49[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 url];
  kdebug_trace();
  uint64_t v45 = 0;
  int v6 = -[SiriCoreSiriBackgroundConnection _getInitialPayloadWithBufferedLength:forceReconnect:](self, "_getInitialPayloadWithBufferedLength:forceReconnect:", &v45, [v4 forceReconnect]);
  id v7 = self->_connectionProvider;
  int v8 = self->_connectionInfo;
  BOOL v9 = [(SiriCoreSiriBackgroundConnection *)self _usingPOP];
  int v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  id v35 = (void *)v11;
  if (AFIsInternalInstall())
  {
    v49[0] = v11;
    v48[0] = @"provider";
    v48[1] = @"id";
    uint64_t v12 = [NSNumber numberWithUnsignedLong:v7];
    v49[1] = v12;
    v48[2] = @"connectionId";
    uint64_t v13 = [(SiriCoreSiriConnectionInfo *)v8 connectionId];
    id v14 = (void *)v13;
    if (v13) {
      int v15 = (__CFString *)v13;
    }
    else {
      int v15 = &stru_26CD85388;
    }
    v49[2] = v15;
    v48[3] = @"url";
    [(SiriCoreSiriConnectionInfo *)v8 url];
    uint64_t v16 = v34 = v5;
    uint64_t v17 = [v16 absoluteString];
    id v32 = v4;
    BOOL v18 = v9;
    int v19 = v7;
    uint64_t v20 = v6;
    BOOL v21 = (void *)v17;
    if (v17) {
      int v22 = (__CFString *)v17;
    }
    else {
      int v22 = &stru_26CD85388;
    }
    v49[3] = v22;
    id v23 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 4, v32);

    int v6 = v20;
    id v7 = v19;
    BOOL v9 = v18;
    id v4 = v33;

    id v5 = v34;
  }
  else
  {
    v46[0] = @"provider";
    v46[1] = @"id";
    v47[0] = v11;
    uint64_t v12 = [NSNumber numberWithUnsignedLong:v7];
    v47[1] = v12;
    id v23 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
  }

  uint64_t v24 = [MEMORY[0x263F283F8] sharedAnalytics];
  [v24 logEventWithType:1007 context:v23];

  connectionProvider = self->_connectionProvider;
  uint64_t v26 = [(SiriCoreSiriConnectionInfo *)v8 connectionId];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  void v36[2] = __66__SiriCoreSiriBackgroundConnection__startNetworkProviderWithInfo___block_invoke;
  v36[3] = &unk_26443A4A8;
  long long v37 = v7;
  long long v38 = self;
  BOOL v44 = v9;
  id v39 = v23;
  id v40 = v8;
  id v42 = v4;
  uint64_t v43 = v45;
  id v41 = v6;
  id v27 = v4;
  id v28 = v6;
  __int16 v29 = v8;
  id v30 = v23;
  __int16 v31 = v7;
  [(SiriCoreConnectionProvider *)connectionProvider openConnectionForURL:v5 withConnectionId:v26 initialPayload:v28 completion:v36];
}

void __66__SiriCoreSiriBackgroundConnection__startNetworkProviderWithInfo___block_invoke(uint64_t a1, void *a2)
{
  v26[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  kdebug_trace();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 24);
  int v6 = [MEMORY[0x263F283F8] sharedAnalytics];
  v26[0] = *(void *)(a1 + 48);
  id v7 = AFAnalyticsContextCreateWithError();
  v26[1] = v7;
  uint64_t v24 = @"stale";
  int v8 = [NSNumber numberWithBool:v4 != v5];
  id v25 = v8;
  BOOL v9 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  void v26[2] = v9;
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:3];
  uint64_t v11 = AFAnalyticsContextsMerge();
  [v6 logEventWithType:1008 context:v11];

  if (v4 == v5)
  {
    uint64_t v13 = *MEMORY[0x263F28358];
    BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v14)
      {
        *(_DWORD *)buf = 136315394;
        BOOL v21 = "-[SiriCoreSiriBackgroundConnection _startNetworkProviderWithInfo:]_block_invoke";
        __int16 v22 = 2112;
        id v23 = v3;
        _os_log_impl(&dword_21CBF7000, v13, OS_LOG_TYPE_INFO, "%s provider open error: %@", buf, 0x16u);
      }
      int v15 = *(void **)(a1 + 40);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __66__SiriCoreSiriBackgroundConnection__startNetworkProviderWithInfo___block_invoke_68;
      v18[3] = &unk_26443AF40;
      v18[4] = v15;
      id v19 = v3;
      [v15 _fallBackToNextConnectionMethodWithError:v19 orElse:v18];
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 136315138;
        BOOL v21 = "-[SiriCoreSiriBackgroundConnection _startNetworkProviderWithInfo:]_block_invoke_2";
        _os_log_impl(&dword_21CBF7000, v13, OS_LOG_TYPE_INFO, "%s provider opened", buf, 0xCu);
      }
      char v16 = [*(id *)(a1 + 32) shouldFallbackQuickly];
      double v17 = 5.0;
      if ((v16 & 1) == 0)
      {
        if (*(unsigned char *)(a1 + 88)) {
          objc_msgSend(*(id *)(a1 + 56), "timeout", 5.0);
        }
        else {
          double v17 = 7.0;
        }
      }
      [*(id *)(a1 + 40) _scheduleAceHeaderTimeoutTimerWithInterval:v17];
      objc_msgSend(*(id *)(a1 + 40), "_updateBuffersForInitialPayload:bufferedLength:forceReconnect:", *(void *)(a1 + 64), *(void *)(a1 + 80), objc_msgSend(*(id *)(a1 + 72), "forceReconnect"));
      *(void *)(*(void *)(a1 + 40) + 88) = CFHTTPMessageCreateEmpty(0, 0);
      [*(id *)(a1 + 40) _setupReadHandlerOnProvider];
      [*(id *)(a1 + 40) _networkProviderDidOpen];
    }
  }
  else
  {
    uint64_t v12 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v21 = "-[SiriCoreSiriBackgroundConnection _startNetworkProviderWithInfo:]_block_invoke";
      _os_log_impl(&dword_21CBF7000, v12, OS_LOG_TYPE_DEFAULT, "%s Ignoring open completion for stale connection", buf, 0xCu);
    }
  }
}

uint64_t __66__SiriCoreSiriBackgroundConnection__startNetworkProviderWithInfo___block_invoke_68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didEncounterError:*(void *)(a1 + 40)];
}

- (void)_updateBuffersForInitialPayload:(id)a3 bufferedLength:(unint64_t)a4 forceReconnect:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v8 = a3;
  BOOL v9 = *MEMORY[0x263F28358];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
    {
      size_t size = dispatch_data_get_size(v8);
      bufferedGeneralOutputData = self->_bufferedGeneralOutputData;
      if (bufferedGeneralOutputData) {
        bufferedGeneralOutputData = dispatch_data_get_size(bufferedGeneralOutputData);
      }
      int v22 = 136315650;
      id v23 = "-[SiriCoreSiriBackgroundConnection _updateBuffersForInitialPayload:bufferedLength:forceReconnect:]";
      __int16 v24 = 2048;
      size_t v25 = size;
      __int16 v26 = 2048;
      id v27 = bufferedGeneralOutputData;
      _os_log_debug_impl(&dword_21CBF7000, v9, OS_LOG_TYPE_DEBUG, "%s Stream opened with initial payload length %lu, buffered general output length %lu", (uint8_t *)&v22, 0x20u);
    }
    safetyNetBuffer = self->_safetyNetBuffer;
    if (safetyNetBuffer)
    {
      dispatch_data_t concat = (OS_dispatch_data *)dispatch_data_create_concat(safetyNetBuffer, v8);
      uint64_t v13 = self->_safetyNetBuffer;
      self->_safetyNetBuffer = concat;
    }
    BOOL v14 = self->_bufferedGeneralOutputData;
    int v15 = v14;
    if (v14)
    {
      size_t v16 = dispatch_data_get_size((dispatch_data_t)v14);
      if (v16 <= a4)
      {
        subrange = (OS_dispatch_data *)MEMORY[0x263EF8388];
        id v18 = MEMORY[0x263EF8388];
      }
      else
      {
        subrange = (OS_dispatch_data *)dispatch_data_create_subrange(v15, a4, v16 - a4);
      }
    }
    else
    {
      subrange = 0;
    }

    id v19 = self->_bufferedGeneralOutputData;
    self->_bufferedGeneralOutputData = subrange;
  }
  else
  {
    if (v10)
    {
      int v22 = 136315138;
      id v23 = "-[SiriCoreSiriBackgroundConnection _updateBuffersForInitialPayload:bufferedLength:forceReconnect:]";
      _os_log_debug_impl(&dword_21CBF7000, v9, OS_LOG_TYPE_DEBUG, "%s No initial payload", (uint8_t *)&v22, 0xCu);
    }
    [(SiriCoreSiriBackgroundConnection *)self _prepareProviderHeaderWithForceReconnect:v5];
  }
  [(SiriCoreSiriBackgroundConnection *)self _initializeBufferedGeneralOutputDataWithInitialPayload:v8 != 0];
}

- (id)_getInitialPayloadWithBufferedLength:(unint64_t *)a3 forceReconnect:(BOOL)a4
{
  BOOL v4 = a4;
  *a3 = 0;
  dispatch_data_t concat = 0;
  if ([(SiriCoreSiriBackgroundConnection *)self _usingPOP])
  {
    if ([(SiriCoreConnectionProvider *)self->_connectionProvider supportsInitialPayload])
    {
      int v8 = [(SiriCoreConnectionProvider *)self->_connectionProvider headerDataWithForceReconnect:v4];
      if (!v8)
      {
        int v8 = MEMORY[0x263EF8388];
        id v9 = MEMORY[0x263EF8388];
      }
      bufferedGeneralOutputData = self->_bufferedGeneralOutputData;
      if (bufferedGeneralOutputData)
      {
        dispatch_data_t concat = dispatch_data_create_concat(v8, bufferedGeneralOutputData);

        size_t size = self->_bufferedGeneralOutputData;
        if (size) {
          size_t size = dispatch_data_get_size(size);
        }
        *a3 = (unint64_t)size;
      }
      else
      {
        uint64_t v12 = [(SiriCoreSiriBackgroundConnection *)self _httpHeaderData];
        uint64_t v13 = dispatch_data_create_concat(v8, v12);

        BOOL v14 = [(SiriCoreSiriBackgroundConnection *)self _aceHeaderData];
        dispatch_data_t concat = dispatch_data_create_concat(v13, v14);
      }
    }
    else
    {
      dispatch_data_t concat = 0;
    }
  }
  if (concat == (dispatch_data_t)MEMORY[0x263EF8388]) {
    dispatch_data_t v15 = 0;
  }
  else {
    dispatch_data_t v15 = concat;
  }
  size_t v16 = v15;

  return v16;
}

- (Class)_providerClass
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(SiriCoreSiriBackgroundConnection *)self _usingPeer])
  {
    peerProviderClass = self->_peerProviderClass;
    if (peerProviderClass) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if ([(SiriCoreSiriConnectionInfo *)self->_connectionInfo requiresURLSession])
  {
    BOOL v4 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[SiriCoreSiriBackgroundConnection _providerClass]";
      _os_log_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_DEFAULT, "%s Forcing provider to URL Session due to connection info", (uint8_t *)&v10, 0xCu);
    }
    peerProviderClass = (objc_class *)objc_opt_class();
    if (!peerProviderClass) {
LABEL_18:
    }
      peerProviderClass = (objc_class *)objc_opt_class();
  }
  else
  {
    if (!AFIsInternalInstall() || (AFIsNano() & 1) != 0) {
      goto LABEL_18;
    }
    BOOL v5 = _AFPreferencesNetworkStackOverride();
    if (([v5 isEqualToString:@"NWConnection"] & 1) != 0
      || [v5 isEqualToString:@"NetworkSessionProvider"])
    {
      peerProviderClass = (objc_class *)objc_opt_class();
      if (peerProviderClass)
      {
        int v6 = (void *)*MEMORY[0x263F28358];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEFAULT))
        {
          id v7 = v6;
          int v8 = NSStringFromClass(peerProviderClass);
          int v10 = 136315394;
          uint64_t v11 = "-[SiriCoreSiriBackgroundConnection _providerClass]";
          __int16 v12 = 2112;
          uint64_t v13 = v8;
          _os_log_impl(&dword_21CBF7000, v7, OS_LOG_TYPE_DEFAULT, "%s Forcing network provider to %@ due to preferences", (uint8_t *)&v10, 0x16u);
        }
      }
    }
    else
    {
      peerProviderClass = 0;
    }

    if (!peerProviderClass) {
      goto LABEL_18;
    }
  }
LABEL_19:

  return peerProviderClass;
}

- (void)_setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_connectionProvider, a3);
  id v4 = a3;
  BOOL v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  int v6 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];

  [v6 setConnectionProvider:v7];
}

- (void)_startWithConnectionInfo:(id)a3 proposedFallbackMethod:(int64_t)a4 allowFallbackToNewMethod:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (self->_connectionProvider)
  {
    uint64_t v57 = [MEMORY[0x263F08690] currentHandler];
    [v57 handleFailureInMethod:a2 object:self file:@"SiriCoreSiriBackgroundConnection.m" lineNumber:267 description:@"Can't start a connection twice"];
  }
  uint64_t v11 = (os_log_t *)MEMORY[0x263F28358];
  __int16 v12 = (void *)*MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 > 3) {
      uint64_t v13 = @"POP";
    }
    else {
      uint64_t v13 = off_26443A610[a4];
    }
    *(_DWORD *)v58 = 136315906;
    *(void *)&v58[4] = "-[SiriCoreSiriBackgroundConnection _startWithConnectionInfo:proposedFallbackMethod:allowFallbackToNewMethod:]";
    *(_WORD *)&v58[12] = 2112;
    *(void *)&v58[14] = v10;
    *(_WORD *)&v58[22] = 2112;
    size_t v59 = (size_t)v13;
    *(_WORD *)CFDataRef v60 = 1024;
    *(_DWORD *)&v60[2] = v5;
    uint64_t v14 = v12;
    _os_log_impl(&dword_21CBF7000, v14, OS_LOG_TYPE_DEFAULT, "%s %@ %@ %d", v58, 0x26u);
  }
  int64_t connectionMethod = self->_connectionMethod;
  objc_storeStrong((id *)&self->_connectionInfo, a3);
  size_t v16 = [MEMORY[0x263F08AB0] processInfo];
  [v16 systemUptime];
  self->_currentStartTime = v17;

  if (self->_firstStartTime <= 0.0) {
    self->_double firstStartTime = self->_currentStartTime;
  }
  self->_double currentOpenTime = 0.0;
  ++self->_startCount;
  if (!connectionMethod)
  {
    if (([v10 useWiFiHint] & 1) == 0)
    {
LABEL_19:
      a4 = [(SiriCoreSiriBackgroundConnection *)self _nextConnectionMethod];
      goto LABEL_20;
    }
    a4 = 2;
LABEL_20:
    self->_int64_t connectionMethod = a4;
    goto LABEL_24;
  }
  if (v5)
  {
    if (!a4) {
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  os_log_t v18 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    unint64_t v19 = self->_connectionMethod;
    if (v19 > 3) {
      uint64_t v20 = @"POP";
    }
    else {
      uint64_t v20 = off_26443A610[v19];
    }
    *(_DWORD *)v58 = 136315394;
    *(void *)&v58[4] = "-[SiriCoreSiriBackgroundConnection _startWithConnectionInfo:proposedFallbackMethod:allowFallbackToNewMethod:]";
    *(_WORD *)&v58[12] = 2112;
    *(void *)&v58[14] = v20;
    BOOL v21 = v18;
    _os_log_impl(&dword_21CBF7000, v21, OS_LOG_TYPE_INFO, "%s Fallback not allowed for this attempt, sticking with %@", v58, 0x16u);
  }
  a4 = self->_connectionMethod;
LABEL_24:
  if (a4 == 3 && [v10 skipPeer])
  {
    int v22 = [v10 skipPeerErrorReason];
    if (!v22) {
      int v22 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SiriCoreSiriConnectionErrorDomain" code:12 userInfo:0];
    }
    if (!self->_errorsForConnectionMethods)
    {
      id v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      errorsForConnectionMethods = self->_errorsForConnectionMethods;
      self->_errorsForConnectionMethods = v23;
    }
    size_t v25 = objc_alloc_init(SiriCoreErrorInfo);
    [(SiriCoreErrorInfo *)v25 setError:v22];
    [(SiriCoreErrorInfo *)v25 setIsPeerConnectionError:[(SiriCoreConnectionProvider *)self->_connectionProvider isPeerConnectionError:v22]];
    [(SiriCoreErrorInfo *)v25 setIsPeerNotNearbyError:[(SiriCoreConnectionProvider *)self->_connectionProvider isPeerNotNearbyError:v22]];
    [(NSMutableDictionary *)self->_errorsForConnectionMethods setObject:v25 forKey:&unk_26CD90A38];
    self->_int64_t connectionMethod = [(SiriCoreSiriBackgroundConnection *)self _nextConnectionMethod];
  }
  os_log_t v26 = *v11;
  BOOL v27 = os_log_type_enabled(*v11, OS_LOG_TYPE_INFO);
  if (connectionMethod)
  {
    if (v27)
    {
      unint64_t v28 = self->_connectionMethod;
      if (v28 > 3) {
        __int16 v29 = @"POP";
      }
      else {
        __int16 v29 = off_26443A610[v28];
      }
      safetyNetBuffer = self->_safetyNetBuffer;
      if (safetyNetBuffer) {
        size_t size = dispatch_data_get_size(safetyNetBuffer);
      }
      else {
        size_t size = 0;
      }
      bufferedGeneralOutputData = self->_bufferedGeneralOutputData;
      if (bufferedGeneralOutputData) {
        bufferedGeneralOutputData = dispatch_data_get_size(bufferedGeneralOutputData);
      }
      *(_DWORD *)v58 = 136315906;
      *(void *)&v58[4] = "-[SiriCoreSiriBackgroundConnection _startWithConnectionInfo:proposedFallbackMethod:allowFallb"
                           "ackToNewMethod:]";
      *(_WORD *)&v58[12] = 2112;
      *(void *)&v58[14] = v29;
      *(_WORD *)&v58[22] = 2048;
      size_t v59 = size;
      *(_WORD *)CFDataRef v60 = 2048;
      *(void *)&v60[2] = bufferedGeneralOutputData;
      id v35 = v26;
      _os_log_impl(&dword_21CBF7000, v35, OS_LOG_TYPE_INFO, "%s falling back to %@ connection method; safety net has %lu bytes, output buffer has %lu bytes",
        v58,
        0x2Au);
    }
    long long v36 = self->_bufferedGeneralOutputData;
    if (v36)
    {
      if (dispatch_data_get_size((dispatch_data_t)self->_bufferedGeneralOutputData))
      {
        long long v37 = self->_safetyNetBuffer;
        if (v37)
        {
          dispatch_data_t concat = (OS_dispatch_data *)dispatch_data_create_concat(v37, v36);
          id v39 = self->_safetyNetBuffer;
          self->_safetyNetBuffer = concat;
        }
      }
    }
    id v40 = self->_safetyNetBuffer;
    if (v40)
    {
      if (dispatch_data_get_size((dispatch_data_t)self->_safetyNetBuffer)) {
        id v41 = v40;
      }
      else {
        id v41 = 0;
      }
    }
    else
    {
      id v41 = 0;
    }
    objc_storeStrong((id *)&self->_bufferedGeneralOutputData, v41);
  }
  else if (v27)
  {
    unint64_t v30 = self->_connectionMethod;
    if (v30 > 3) {
      __int16 v31 = @"POP";
    }
    else {
      __int16 v31 = off_26443A610[v30];
    }
    *(_DWORD *)v58 = 136315394;
    *(void *)&v58[4] = "-[SiriCoreSiriBackgroundConnection _startWithConnectionInfo:proposedFallbackMethod:allowFallbackToNewMethod:]";
    *(_WORD *)&v58[12] = 2112;
    *(void *)&v58[14] = v31;
    id v42 = v26;
    _os_log_impl(&dword_21CBF7000, v42, OS_LOG_TYPE_INFO, "%s using %@ connection method", v58, 0x16u);
  }
  objc_storeStrong((id *)&self->_safetyNetBuffer, MEMORY[0x263EF8388]);
  uint64_t v43 = [(SiriCoreSiriBackgroundConnection *)self _providerClass];
  BOOL v44 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v58 = 136315394;
    *(void *)&v58[4] = "-[SiriCoreSiriBackgroundConnection _startWithConnectionInfo:proposedFallbackMethod:allowFallbackToNewMethod:]";
    *(_WORD *)&v58[12] = 2112;
    *(void *)&v58[14] = v43;
    _os_log_impl(&dword_21CBF7000, v44, OS_LOG_TYPE_INFO, "%s Using Provider: %@", v58, 0x16u);
  }
  uint64_t v45 = (void *)[[v43 alloc] initWithQueue:self->_queue];
  size_t v46 = [v10 connectionPolicyRoute];
  [v45 setPolicyRoute:v46];

  if (!connectionMethod)
  {
    id v47 = [v10 connectionPolicy];
    [v45 setProviderConnectionPolicy:v47];
  }
  objc_msgSend(v45, "setPrefersWWAN:", objc_msgSend(v10, "prefersWWAN", *(void *)v58, *(void *)&v58[8]));
  if (([v10 useWiFiHint] & 1) == 0 && (AFIsNano() & 1) == 0)
  {
    id v48 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v58 = 136315138;
      *(void *)&v58[4] = "-[SiriCoreSiriBackgroundConnection _startWithConnectionInfo:proposedFallbackMethod:allowFallb"
                           "ackToNewMethod:]";
      _os_log_impl(&dword_21CBF7000, v48, OS_LOG_TYPE_INFO, "%s Setting scope to Cellular", v58, 0xCu);
    }
    [v45 setPrefersWWAN:1];
  }
  if ([(SiriCoreSiriBackgroundConnection *)self _usingPOP]) {
    uint64_t v49 = AFIsNano() ^ 1;
  }
  else {
    uint64_t v49 = 0;
  }
  [v45 setConnectByPOPMethod:v49];
  [v45 setDelegate:self];
  connectionProvider = self->_connectionProvider;
  self->_connectionProvider = (SiriCoreConnectionProvider *)v45;
  id v51 = v45;

  id v52 = (objc_class *)objc_opt_class();
  v53 = NSStringFromClass(v52);
  v54 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
  [v54 setConnectionProvider:v53];

  __int16 v55 = [(SiriCoreSiriBackgroundConnection *)self delegate];
  size_t v56 = [(SiriCoreConnectionProvider *)self->_connectionProvider connectionType];

  [v55 siriBackgroundConnection:self willStartWithConnectionType:v56];
  [(SiriCoreSiriBackgroundConnection *)self _startNetworkProviderWithInfo:v10];
}

- (void)startWithConnectionInfo:(id)a3
{
}

- (int64_t)_nextConnectionMethod
{
  int64_t connectionMethod = self->_connectionMethod;
  id v4 = [(SiriCoreSiriConnectionInfo *)self->_connectionInfo connectionPolicyRoute];
  BOOL v5 = [v4 type];
  int64_t NextSupported = _SiriCoreSiriConnectionMethodGetNextSupported(connectionMethod, v5, self->_usesProxyConnection);

  return NextSupported;
}

- (BOOL)_usingNetwork
{
  return self->_connectionMethod == 2;
}

- (BOOL)_usingPeer
{
  return self->_connectionMethod == 3;
}

- (BOOL)_usingPOPOnPeer
{
  if (self->_connectionMethod != 3) {
    return 0;
  }
  id v2 = [(SiriCoreSiriConnectionInfo *)self->_connectionInfo connectionPolicyRoute];
  id v3 = [v2 type];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F65188]];

  return v4;
}

- (BOOL)_usingFlorence
{
  if (self->_connectionMethod != 2) {
    return 0;
  }
  id v2 = [(SiriCoreSiriConnectionInfo *)self->_connectionInfo connectionPolicyRoute];
  id v3 = [v2 type];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F65178]];

  return v4;
}

- (BOOL)_usingPOP
{
  return self->_connectionMethod == 4;
}

- (void)dealloc
{
  [(SiriCoreSiriBackgroundConnection *)self _closeConnection];
  [(SiriCoreSiriBackgroundConnection *)self stopHeartBeat];
  v3.receiver = self;
  v3.super_class = (Class)SiriCoreSiriBackgroundConnection;
  [(SiriCoreSiriBackgroundConnection *)&v3 dealloc];
}

- (SiriCoreSiriBackgroundConnection)init
{
  return 0;
}

- (SiriCoreSiriBackgroundConnection)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriCoreSiriBackgroundConnection;
  int v6 = [(SiriCoreSiriBackgroundConnection *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    objc_storeStrong((id *)&v7->_bufferedProviderHeaderOutputData, MEMORY[0x263EF8388]);
    v7->_unsigned int currentPingIndex = 0;
    v7->_uint64_t currentBarrierIndex = -100000;
    [(SiriCoreSiriBackgroundConnection *)v7 startHeartBeat];
  }

  return v7;
}

@end