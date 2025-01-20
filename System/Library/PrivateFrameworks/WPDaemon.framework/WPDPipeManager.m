@interface WPDPipeManager
- (BOOL)sendVersionInfo:(id)a3;
- (CBScalablePipeManager)pipeManager;
- (NSMutableDictionary)connectionInitiators;
- (NSMutableDictionary)endpointsDict;
- (NSMutableDictionary)peerPipesDict;
- (OS_dispatch_queue)queue;
- (WPDPipeManager)initWithServer:(id)a3;
- (id)generateStateDumpStrings;
- (id)pipeInfo:(id)a3 forClient:(id)a4;
- (id)pipeManagerState:(int64_t)a3;
- (id)streamEvent:(unint64_t)a3;
- (int64_t)writeDataToPipe:(id)a3 pipe:(id)a4;
- (void)_signpostBegin;
- (void)_signpostEnd;
- (void)channelHasData:(id)a3;
- (void)handleIncomingPipeData:(id)a3 data:(char *)a4 dataSize:(int64_t)a5;
- (void)invalidatePipeInfo:(id)a3 forPeer:(id)a4;
- (void)receivedAck:(id)a3 data:(char *)a4 dataSize:(int64_t)a5;
- (void)receivedConnectStatus:(id)a3 data:(char *)a4 dataSize:(int64_t)a5;
- (void)receivedError:(id)a3 data:(char *)a4 dataSize:(int64_t)a5;
- (void)receivedPayload:(id)a3 data:(char *)a4 dataSize:(int64_t)a5;
- (void)receivedVersionInfo:(id)a3 data:(char *)a4 dataSize:(int64_t)a5;
- (void)registerEndpoint:(id)a3 requireAck:(BOOL)a4 requireEncryption:(BOOL)a5 forClient:(id)a6;
- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5;
- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)sendAck:(id)a3 errorCode:(unsigned __int8)a4;
- (void)sendChannelData:(id)a3;
- (void)sendConnectStatus:(id)a3 connectStatus:(unsigned __int8)a4;
- (void)sendData:(id)a3 forPeer:(id)a4 forClient:(id)a5;
- (void)sendErrorResponse:(id)a3 errorCode:(unsigned __int8)a4;
- (void)sendRemainingData:(id)a3 wpClient:(id)a4;
- (void)setConnectionInitiator:(BOOL)a3 forPeer:(id)a4 forClient:(id)a5;
- (void)setConnectionInitiators:(id)a3;
- (void)setEndpointsDict:(id)a3;
- (void)setPeerPipesDict:(id)a3;
- (void)setPipeClientConnectionStatus:(BOOL)a3 forPeer:(id)a4 forClient:(id)a5;
- (void)setPipeManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)unregisterEndpoint:(id)a3 forClient:(id)a4;
- (void)update;
@end

@implementation WPDPipeManager

- (WPDPipeManager)initWithServer:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WPDPipeManager;
  v5 = [(WPDManager *)&v20 initWithServer:v4 Name:@"WPPM"];
  if (v5)
  {
    v6 = [v4 serverQueue];
    objc_storeWeak((id *)&v5->_queue, v6);

    id v7 = objc_alloc(MEMORY[0x263EFEF70]);
    v8 = [v4 serverQueue];
    uint64_t v9 = [v7 initWithDelegate:v5 queue:v8];
    pipeManager = v5->_pipeManager;
    v5->_pipeManager = (CBScalablePipeManager *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    endpointsDict = v5->_endpointsDict;
    v5->_endpointsDict = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    peerPipesDict = v5->_peerPipesDict;
    v5->_peerPipesDict = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    connectionInitiators = v5->_connectionInitiators;
    v5->_connectionInitiators = (NSMutableDictionary *)v15;

    v17 = [MEMORY[0x263EFFA08] setWithObject:v5->_pipeManager];
    [(WPDManager *)v5 setCbManagers:v17];

    v18 = [v4 wpdState];
    [v18 registerManager:v5->_pipeManager];

    v5->_wpPipeDataSignPostID = os_signpost_id_make_with_pointer((os_log_t)WiProxLog, v5);
  }

  return v5;
}

- (id)generateStateDumpStrings
{
  v3 = (void *)MEMORY[0x263EFF980];
  v14.receiver = self;
  v14.super_class = (Class)WPDPipeManager;
  id v4 = [(WPDManager *)&v14 generateStateDumpStrings];
  v5 = [v3 arrayWithArray:v4];

  v6 = NSString;
  id v7 = [(WPDPipeManager *)self endpointsDict];
  v8 = [v6 stringWithFormat:@"endpointsDict %@\n", v7];
  [v5 addObject:v8];

  uint64_t v9 = NSString;
  v10 = [(WPDPipeManager *)self peerPipesDict];
  uint64_t v11 = [v9 stringWithFormat:@"peerPipesDict %@\n", v10];
  [v5 addObject:v11];

  v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return v12;
}

- (void)registerEndpoint:(id)a3 requireAck:(BOOL)a4 requireEncryption:(BOOL)a5 forClient:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_398);
  }
  v12 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v12;
    objc_super v14 = [(WPDPipeManager *)self endpointsDict];
    *(_DWORD *)buf = 138412802;
    id v34 = v10;
    __int16 v35 = 2112;
    id v36 = v11;
    __int16 v37 = 2112;
    id v38 = v14;
    _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "WPPM: registerEndpoint %@ for client %@ endpointsDict %@", buf, 0x20u);
  }
  if (v10 && v11)
  {
    uint64_t v15 = [(WPDPipeManager *)self endpointsDict];
    v16 = [v15 objectForKeyedSubscript:v10];

    if (v16)
    {
      v17 = [v16 clientUUID];
      int v18 = [v17 isEqual:v11];

      if (v18)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_401);
        }
        v19 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v34 = v11;
          __int16 v35 = 2112;
          id v36 = v10;
          _os_log_impl(&dword_22316D000, v19, OS_LOG_TYPE_DEFAULT, "WPPM: registerEndpoint: client %@ has already registered Endpoint %@", buf, 0x16u);
        }
      }
      else
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_404);
        }
        v25 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        {
          v29 = v25;
          v30 = [v16 clientUUID];
          *(_DWORD *)buf = 138412802;
          id v34 = v30;
          __int16 v35 = 2112;
          id v36 = v10;
          __int16 v37 = 2112;
          id v38 = v11;
          _os_log_error_impl(&dword_22316D000, v29, OS_LOG_TYPE_ERROR, "WPPM: registerEndpont: client %@ has already registered endpoint %@ but new client %@ wants to register same endpoint, replace with the last client", buf, 0x20u);
        }
        [v16 setClientUUID:v11];
      }
    }
    else
    {
      v16 = objc_opt_new();
      [v16 setClientUUID:v11];
      [v16 setRequireAck:v8];
      [v16 setRequireEncyption:v7];
      objc_super v20 = [(WPDPipeManager *)self endpointsDict];
      [v20 setObject:v16 forKeyedSubscript:v10];

      pipeManager = self->_pipeManager;
      uint64_t v22 = *MEMORY[0x263EFEEB0];
      v32[0] = &unk_26D646ED8;
      v23 = objc_msgSend(NSNumber, "numberWithBool:", v7, v22, *MEMORY[0x263EFEEA8]);
      v31[2] = *MEMORY[0x263EFEEA0];
      v32[1] = v23;
      v32[2] = MEMORY[0x263EFFA88];
      v24 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
      [(CBScalablePipeManager *)pipeManager registerEndpoint:v10 type:2 priority:2 options:v24];
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_411_1);
    }
    v26 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = [(WPDPipeManager *)self endpointsDict];
      *(_DWORD *)buf = 138412290;
      id v34 = v28;
      _os_log_impl(&dword_22316D000, v27, OS_LOG_TYPE_DEFAULT, "WPPM: registerEndpoint: Current endpointsDict %@", buf, 0xCu);
    }
  }
}

- (void)unregisterEndpoint:(id)a3 forClient:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_413);
  }
  BOOL v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    id v10 = [(WPDPipeManager *)self endpointsDict];
    int v22 = 138412802;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "WPPM: unregisterEndpoint %@ for client %@ endpointsDict %@", (uint8_t *)&v22, 0x20u);
  }
  if (v6)
  {
    if (v7)
    {
      id v11 = [(WPDPipeManager *)self endpointsDict];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        uint64_t v13 = [(WPDPipeManager *)self endpointsDict];
        objc_super v14 = [v13 objectForKeyedSubscript:v6];

        if (v14
          && ([v14 clientUUID],
              uint64_t v15 = objc_claimAutoreleasedReturnValue(),
              int v16 = [v15 isEqual:v7],
              v15,
              v16))
        {
          v17 = [(WPDPipeManager *)self endpointsDict];
          [v17 removeObjectForKey:v6];

          [(CBScalablePipeManager *)self->_pipeManager unregisterEndpoint:v6];
        }
        else
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_416_0);
          }
          int v18 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            int v22 = 138412546;
            id v23 = v6;
            __int16 v24 = 2112;
            id v25 = v7;
            _os_log_impl(&dword_22316D000, v18, OS_LOG_TYPE_DEFAULT, "WPPM: unregisterEndpoint: Endpoint %@ already unregisterd for client %@", (uint8_t *)&v22, 0x16u);
          }
        }
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_419_0);
        }
        v19 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v20 = v19;
          v21 = [(WPDPipeManager *)self endpointsDict];
          int v22 = 138412290;
          id v23 = v21;
          _os_log_impl(&dword_22316D000, v20, OS_LOG_TYPE_DEFAULT, "WPPM: unregisterEndpoint: Current endpointsDict %@", (uint8_t *)&v22, 0xCu);
        }
      }
    }
  }
}

- (void)sendData:(id)a3 forPeer:(id)a4 forClient:(id)a5
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v72 = a4;
  id v73 = a5;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_421_1);
  }
  uint64_t v9 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    v48 = v9;
    *(_DWORD *)buf = 134218754;
    uint64_t v121 = [v8 length];
    __int16 v122 = 2112;
    uint64_t v123 = (uint64_t)v8;
    __int16 v124 = 2112;
    id v125 = v72;
    __int16 v126 = 2112;
    uint64_t v127 = (uint64_t)v73;
    _os_log_debug_impl(&dword_22316D000, v48, OS_LOG_TYPE_DEBUG, "WPPM: sendData: size (%lu): %@ to peer %@ for client %@", buf, 0x2Au);
  }
  id v10 = [(WPDManager *)self server];
  id v11 = [v10 getClientForUUID:v73];

  if (v11)
  {
    uint64_t v112 = 0;
    v113 = &v112;
    uint64_t v114 = 0x3032000000;
    v115 = __Block_byref_object_copy__5;
    v116 = __Block_byref_object_dispose__5;
    id v117 = 0;
    uint64_t v106 = 0;
    v107 = &v106;
    uint64_t v108 = 0x3032000000;
    v109 = __Block_byref_object_copy__5;
    v110 = __Block_byref_object_dispose__5;
    id v111 = 0;
    id v70 = [v11 endpointsSet];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_424_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDPipeManager sendData:forPeer:forClient:].cold.8();
    }
    uint64_t v12 = [(WPDPipeManager *)self peerPipesDict];
    id v71 = [v12 objectForKeyedSubscript:v72];

    if (v71)
    {
      v102[0] = MEMORY[0x263EF8330];
      v102[1] = 3221225472;
      v102[2] = __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_425;
      v102[3] = &unk_26469B970;
      id v103 = v70;
      v104 = &v112;
      v105 = &v106;
      [v71 enumerateObjectsUsingBlock:v102];
    }
    if (v113[5])
    {
      uint64_t v13 = [v8 length];
      if ([(id)v107[5] newProtocol])
      {
        if ([(id)v107[5] pipeDidConnectSent])
        {
          id v14 = [(id)v107[5] pipeDataTransfer];
          if (!v14)
          {
            id v14 = [[PipeDataTransfer alloc] initPipeDataTransferForPeer:v72];
            [(id)v107[5] setPipeDataTransfer:v14];
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_429);
            }
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
              -[WPDPipeManager sendData:forPeer:forClient:].cold.6();
            }
          }
          unsigned __int16 v101 = 0;
          [v8 getBytes:&v101 length:2];
          [v14 setTxTotalLenToSend:v101];
          uint64_t v15 = objc_msgSend(v8, "subdataWithRange:", 2, v13 - 2);
          [v14 setTxTotalDataToSend:v15];

          [v14 setTxData:v8];
          objc_msgSend(v14, "setTxSeqNum:", objc_msgSend(v14, "generateSequenceNumber"));
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_432);
          }
          int v16 = (id)WiProxLog;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            -[WPDPipeManager sendData:forPeer:forClient:].cold.5(v101, buf, [v8 length], v16);
          }

          __int16 v17 = [v8 length];
          v68 = &v66;
          size_t v18 = (unsigned __int16)(v17 + 4);
          MEMORY[0x270FA5388]();
          objc_super v20 = (char *)&v66 - v19;
          bzero((char *)&v66 - v19, v18);
          *objc_super v20 = 2;
          *(_WORD *)(v20 + 1) = v17 + 3;
          v20[3] = [v14 txSeqNum];
          id v69 = v8;
          v21 = (const void *)[v69 bytes];
          memcpy(v20 + 4, v21, [v69 length]);
          [v14 setTxDataLeftToSend:v18];
          int v22 = [MEMORY[0x263EFF8F8] dataWithBytes:v20 length:v18];
          uint64_t v23 = [(WPDPipeManager *)self writeDataToPipe:v22 pipe:v107[5]];

          if (v23 < 1)
          {
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_442_0);
            }
            v49 = WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
              -[WPDPipeManager sendData:forPeer:forClient:].cold.4(v49, v50, v51, v52, v53, v54, v55, v56);
            }
            v57 = (void *)MEMORY[0x263F087E8];
            uint64_t v132 = *MEMORY[0x263F08320];
            v133 = @"sendData failure";
            v58 = [NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
            v59 = [v57 errorWithDomain:@"WPErrorDomain" code:26 userInfo:v58];

            v60 = [(WPDPipeManager *)self queue];
            v95[0] = MEMORY[0x263EF8330];
            v95[1] = 3221225472;
            v95[2] = __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_444;
            v95[3] = &unk_26469B998;
            id v96 = v11;
            id v97 = v69;
            v100 = &v112;
            id v61 = v72;
            id v98 = v61;
            __int16 v24 = v59;
            v99 = v24;
            dispatch_async(v60, v95);

            v62 = [(id)v113[5] name];
            [(WPDPipeManager *)self invalidatePipeInfo:v62 forPeer:v61];
          }
          else
          {
            objc_msgSend(v14, "setTxDataLeftToSend:", objc_msgSend(v14, "txDataLeftToSend") - v23);
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_436);
            }
            __int16 v24 = (id)WiProxLog;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
              -[WPDPipeManager sendData:forPeer:forClient:]((uint64_t)v134, [v14 txDataLeftToSend], v24);
            }
          }
        }
        else
        {
          __int16 v37 = NSString;
          id v38 = [v11 processName];
          id v14 = [v37 stringWithFormat:@"sendData failure: LE pipe client %@ for %@ is not connected", v73, v38];

          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_450_0);
          }
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
            -[WPDPipeManager sendData:forPeer:forClient:]();
          }
          uint64_t v39 = (void *)MEMORY[0x263F087E8];
          uint64_t v130 = *MEMORY[0x263F08320];
          id v131 = v14;
          v40 = [NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
          v41 = [v39 errorWithDomain:@"WPErrorDomain" code:7 userInfo:v40];

          v42 = [(WPDPipeManager *)self queue];
          v89[0] = MEMORY[0x263EF8330];
          v89[1] = 3221225472;
          v89[2] = __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_451;
          v89[3] = &unk_26469B998;
          id v90 = v11;
          id v91 = v8;
          v94 = &v112;
          id v92 = v72;
          id v93 = v41;
          id v43 = v41;
          dispatch_async(v42, v89);
        }
      }
      else
      {
        int64_t v32 = [(WPDPipeManager *)self writeDataToPipe:v8 pipe:v107[5]];
        if (v32 == v13)
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_458_0);
          }
          v33 = (id)WiProxLog;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            id v34 = [(id)v113[5] peer];
            __int16 v35 = [v34 identifier];
            *(_DWORD *)buf = 134218498;
            uint64_t v121 = v13;
            __int16 v122 = 2048;
            uint64_t v123 = v13;
            __int16 v124 = 2112;
            id v125 = v35;
            _os_log_impl(&dword_22316D000, v33, OS_LOG_TYPE_DEFAULT, "WPPM: sendData: bytes written %ld (expected %lu) to peer %@", buf, 0x20u);
          }
          id v36 = [(WPDPipeManager *)self queue];
          v79[0] = MEMORY[0x263EF8330];
          v79[1] = 3221225472;
          v79[2] = __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_459;
          v79[3] = &unk_26469B9C0;
          id v80 = v11;
          id v81 = v8;
          v83 = &v112;
          id v82 = v72;
          dispatch_async(v36, v79);

          id v14 = v80;
        }
        else
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_454_0);
          }
          v44 = (id)WiProxLog;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            id v69 = [(id)v113[5] peer];
            v63 = [v69 identifier];
            v68 = [(id)v113[5] output];
            uint64_t v67 = [v68 streamStatus];
            v64 = [(id)v113[5] output];
            v65 = [v64 streamError];
            *(_DWORD *)buf = 134219010;
            uint64_t v121 = v32;
            __int16 v122 = 2048;
            uint64_t v123 = v13;
            __int16 v124 = 2112;
            id v125 = v63;
            __int16 v126 = 2048;
            uint64_t v127 = v67;
            __int16 v128 = 2112;
            v129 = v65;
            _os_log_error_impl(&dword_22316D000, v44, OS_LOG_TYPE_ERROR, "WPPM: sendData: bytes written %ld (expected %lu) to peer %@ with status %lu error %@", buf, 0x34u);
          }
          v45 = [(WPDPipeManager *)self queue];
          v84[0] = MEMORY[0x263EF8330];
          v84[1] = 3221225472;
          v84[2] = __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_455;
          v84[3] = &unk_26469B9C0;
          id v85 = v11;
          id v86 = v8;
          v88 = &v112;
          id v46 = v72;
          id v87 = v46;
          dispatch_async(v45, v84);

          v47 = [(id)v113[5] name];
          [(WPDPipeManager *)self invalidatePipeInfo:v47 forPeer:v46];

          id v14 = v85;
        }
      }
    }
    else
    {
      id v25 = NSString;
      __int16 v26 = [v11 endpointsSet];
      id v14 = [v25 stringWithFormat:@"sendData failure: LE pipe set %@ not found for client %@", v26, v73];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_465_1);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDPipeManager sendData:forPeer:forClient:]();
      }
      v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v118 = *MEMORY[0x263F08320];
      id v119 = v14;
      uint64_t v28 = [NSDictionary dictionaryWithObjects:&v119 forKeys:&v118 count:1];
      v29 = [v27 errorWithDomain:@"WPErrorDomain" code:7 userInfo:v28];

      v30 = [(WPDPipeManager *)self queue];
      v74[0] = MEMORY[0x263EF8330];
      v74[1] = 3221225472;
      v74[2] = __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_466;
      v74[3] = &unk_26469B9E8;
      id v75 = v11;
      id v76 = v8;
      id v77 = v72;
      id v78 = v29;
      id v31 = v29;
      dispatch_async(v30, v74);
    }
    _Block_object_dispose(&v106, 8);

    _Block_object_dispose(&v112, 8);
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_469);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDPipeManager sendData:forPeer:forClient:]();
    }
  }
}

void __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_425(void *a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  id v7 = (void *)a1[4];
  id v13 = v6;
  id v8 = [v6 pipe];
  uint64_t v9 = [v8 name];
  LODWORD(v7) = [v7 containsObject:v9];

  if (v7)
  {
    uint64_t v10 = [v13 pipe];
    uint64_t v11 = *(void *)(a1[5] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a3 = 1;
  }
}

void __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_444(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) xpcConnectionForClient];
  v2 = [v5 remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) name];
  [v2 sentData:v3 toEndpoint:v4 forPeripheral:*(void *)(a1 + 48) withError:*(void *)(a1 + 56)];
}

void __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_451(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) xpcConnectionForClient];
  v2 = [v5 remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) name];
  [v2 sentData:v3 toEndpoint:v4 forPeripheral:*(void *)(a1 + 48) withError:*(void *)(a1 + 56)];
}

void __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_455(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) xpcConnectionForClient];
  v2 = [v8 remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) name];
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) output];
  id v7 = [v6 streamError];
  [v2 sentData:v3 toEndpoint:v4 forPeripheral:v5 withError:v7];
}

void __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_459(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) xpcConnectionForClient];
  v2 = [v5 remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) name];
  [v2 sentData:v3 toEndpoint:v4 forPeripheral:*(void *)(a1 + 48) withError:0];
}

void __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_466(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) xpcConnectionForClient];
  v2 = [v3 remoteObjectProxy];
  [v2 sentData:*(void *)(a1 + 40) toEndpoint:0 forPeripheral:*(void *)(a1 + 48) withError:*(void *)(a1 + 56)];
}

- (void)setPipeClientConnectionStatus:(BOOL)a3 forPeer:(id)a4 forClient:(id)a5
{
  BOOL v6 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_471_1);
  }
  uint64_t v10 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    v14[0] = 67109634;
    v14[1] = v6;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_debug_impl(&dword_22316D000, v10, OS_LOG_TYPE_DEBUG, "WPPM: setPipeClientConnectionStatus: status: %d to peer %@ for client %@", (uint8_t *)v14, 0x1Cu);
  }
  uint64_t v11 = [(WPDPipeManager *)self pipeInfo:v8 forClient:v9];
  uint64_t v12 = v11;
  if (v11)
  {
    if ([v11 newProtocol])
    {
      [v12 setPipeDidConnectSent:v6];
      if (!v6)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_474_1);
        }
        id v13 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14[0]) = 0;
          _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "WPPM: send disconnect status to remote peer", (uint8_t *)v14, 2u);
        }
        [(WPDPipeManager *)self sendConnectStatus:v12 connectStatus:0];
      }
    }
  }
}

- (void)setConnectionInitiator:(BOOL)a3 forPeer:(id)a4 forClient:(id)a5
{
  BOOL v6 = a3;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(WPDPipeManager *)self connectionInitiators];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_476_0);
  }
  uint64_t v12 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    id v14 = [(WPDPipeManager *)self connectionInitiators];
    *(_DWORD *)uint64_t v28 = 67109890;
    *(_DWORD *)&v28[4] = v6;
    *(_WORD *)&v28[8] = 2112;
    *(void *)&v28[10] = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    int64_t v32 = v14;
    _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "WPPM: setConnectionInitiator: %d, peer: %@, client: %@, initiators: %@", v28, 0x26u);
  }
  if (v6)
  {
    if (v11)
    {
      if (([v11 containsObject:v8] & 1) == 0)
      {
        [v11 addObject:v8];
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_479);
        }
        __int16 v15 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = v15;
          __int16 v17 = [(WPDPipeManager *)self connectionInitiators];
          *(_DWORD *)uint64_t v28 = 138412290;
          *(void *)&v28[4] = v17;
          id v18 = "WPPM: peer added: %@";
LABEL_22:
          _os_log_impl(&dword_22316D000, v16, OS_LOG_TYPE_DEFAULT, v18, v28, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v11 = [MEMORY[0x263EFF9C0] set];
      [v11 addObject:v8];
      v21 = [(WPDPipeManager *)self connectionInitiators];
      [v21 setObject:v11 forKeyedSubscript:v9];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_483_0);
      }
      int v22 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v22;
        __int16 v17 = [(WPDPipeManager *)self connectionInitiators];
        *(_DWORD *)uint64_t v28 = 138412290;
        *(void *)&v28[4] = v17;
        id v18 = "WPPM: alloc peer added %@";
        goto LABEL_22;
      }
    }
  }
  else if (v11 && [v11 count])
  {
    [v11 removeObject:v8];
    uint64_t v19 = [(WPDPipeManager *)self connectionInitiators];
    [v19 setObject:v11 forKeyedSubscript:v9];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_486_1);
    }
    objc_super v20 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v20;
      __int16 v17 = [(WPDPipeManager *)self connectionInitiators];
      *(_DWORD *)uint64_t v28 = 138412290;
      *(void *)&v28[4] = v17;
      id v18 = "WPPM: peer removed: %@";
      goto LABEL_22;
    }
  }
  uint64_t v23 = -[WPDPipeManager pipeInfo:forClient:](self, "pipeInfo:forClient:", v8, v9, *(_OWORD *)v28);
  __int16 v24 = v23;
  if (v23 && [v23 newProtocol])
  {
    [v24 setConnectionInitiator:v6];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_489);
    }
    id v25 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v28 = 138412546;
      *(void *)&v28[4] = v24;
      *(_WORD *)&v28[12] = 1024;
      *(_DWORD *)&v28[14] = v6;
      _os_log_impl(&dword_22316D000, v25, OS_LOG_TYPE_DEFAULT, "WPPM: %@ is already connected, set initiator: %d", v28, 0x12u);
    }
    __int16 v26 = [(WPDManager *)self server];
    v27 = [v26 getClientForUUID:v9];

    if (v27
      && v6
      && [v24 versionInfoSent]
      && [v24 versionInfoReceived]
      && ([v24 pipeDidConnectSent] & 1) == 0
      && [v24 useConnectStatusPDU])
    {
      [(WPDPipeManager *)self sendConnectStatus:v24 connectStatus:1];
      [v24 setPipeDidConnectSent:1];
      [v27 connectedDeviceOverLEPipe:v8];
    }
  }
}

- (id)pipeInfo:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WPDManager *)self server];
  id v9 = [v8 getClientForUUID:v7];

  uint64_t v19 = 0;
  objc_super v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = __Block_byref_object_copy__5;
  uint64_t v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  if (v9)
  {
    uint64_t v10 = [v9 endpointsSet];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_491_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDPipeManager sendData:forPeer:forClient:].cold.8();
    }
    uint64_t v11 = [(WPDPipeManager *)self peerPipesDict];
    uint64_t v12 = [v11 objectForKeyedSubscript:v6];

    if (v12)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __37__WPDPipeManager_pipeInfo_forClient___block_invoke_492;
      v16[3] = &unk_26469BA10;
      id v17 = v10;
      id v18 = &v19;
      [v12 enumerateObjectsUsingBlock:v16];
    }
    id v13 = (void *)v20[5];
  }
  else
  {
    id v13 = 0;
  }
  id v14 = v13;
  _Block_object_dispose(&v19, 8);

  return v14;
}

void __37__WPDPipeManager_pipeInfo_forClient___block_invoke_492(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v10 = v6;
  id v8 = [v6 pipe];
  id v9 = [v8 name];
  LODWORD(v7) = [v7 containsObject:v9];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)streamEvent:(unint64_t)a3
{
  id result = @"NSStreamEventNone";
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      id result = @"NSStreamEventOpenCompleted";
      break;
    case 2uLL:
      id result = @"NSStreamEventHasBytesAvailable";
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 4uLL:
      id result = @"NSStreamEventHasSpaceAvailable";
      break;
    case 8uLL:
      id result = @"NSStreamEventErrorOccurred";
      break;
    default:
      if (a3 == 16) {
        id result = @"NSStreamEventEndEncountered";
      }
      else {
LABEL_5:
      }
        id result = @"unknown";
      break;
  }
  return result;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v75 = 0;
  id v76 = &v75;
  uint64_t v77 = 0x3032000000;
  id v78 = __Block_byref_object_copy__5;
  v79 = __Block_byref_object_dispose__5;
  id v80 = 0;
  uint64_t v71 = 0;
  id v72 = &v71;
  uint64_t v73 = 0x2020000000;
  char v74 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  char v70 = 0;
  id v7 = [(WPDPipeManager *)self peerPipesDict];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __37__WPDPipeManager_stream_handleEvent___block_invoke;
  v62[3] = &unk_26469BA60;
  id v8 = v6;
  id v63 = v8;
  v64 = &v71;
  v65 = &v75;
  uint64_t v66 = &v67;
  [v7 enumerateKeysAndObjectsUsingBlock:v62];

  id v9 = (void *)v76[5];
  if (v9)
  {
    id v10 = [v9 pipe];
    uint64_t v11 = [v10 peer];
    id v56 = [v11 identifier];

    uint64_t v12 = [(WPDPipeManager *)self endpointsDict];
    id v13 = [(id)v76[5] pipe];
    id v14 = [v13 name];
    __int16 v15 = [v12 objectForKeyedSubscript:v14];
    id v16 = [v15 clientUUID];

    id v17 = [(WPDManager *)self server];
    id v18 = [v17 getClientForUUID:v16];

    switch(a4)
    {
      case 1uLL:
        if (*((unsigned char *)v72 + 24))
        {
          if (!v18)
          {
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_525_0);
            }
            id v38 = (id)WiProxLog;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              v45 = [(id)v76[5] pipe];
              id v46 = [v45 name];
              *(_DWORD *)buf = 138412802;
              id v82 = v16;
              __int16 v83 = 2112;
              uint64_t v84 = (uint64_t)v56;
              __int16 v85 = 2112;
              id v86 = v46;
              _os_log_error_impl(&dword_22316D000, v38, OS_LOG_TYPE_ERROR, "WPPM: output open: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);
            }
            goto LABEL_69;
          }
          if ((![(id)v76[5] newProtocol]
             || [(id)v76[5] versionInfoSent]
             && [(id)v76[5] versionInfoReceived])
            && ([(id)v76[5] pipeDidConnectSent] & 1) == 0)
          {
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_519_0);
            }
            id v43 = WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v44 = "WPPM: output open: send pipe connect notification";
              goto LABEL_85;
            }
            goto LABEL_86;
          }
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_522);
          }
          uint64_t v20 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = (void *)v76[5];
            *(_DWORD *)buf = 138412290;
            id v82 = v21;
            int v22 = "WPPM: output open: current pipe info: %@";
            uint64_t v23 = v20;
            uint32_t v24 = 12;
            goto LABEL_63;
          }
        }
        else
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_528_0);
          }
          uint64_t v33 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            int v34 = *((unsigned __int8 *)v68 + 24);
            *(_DWORD *)buf = 67109120;
            LODWORD(v82) = v34;
            int v22 = "WPPM: handleEvent: input stream opened %d";
            uint64_t v23 = v33;
            uint32_t v24 = 8;
            goto LABEL_63;
          }
        }
        goto LABEL_96;
      case 2uLL:
        uint64_t v55 = (uint64_t)&v55;
        MEMORY[0x270FA5388](v19);
        bzero(v54, 0x1000uLL);
        uint64_t v25 = [v8 read:v54 maxLength:4096];
        if (!v25)
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_562_0);
          }
          __int16 v35 = (id)WiProxLog;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            id v36 = [v8 streamError];
            -[WPDPipeManager stream:handleEvent:](v36, buf, v35);
          }
          goto LABEL_95;
        }
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_546);
        }
        __int16 v26 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v82 = v56;
          __int16 v83 = 2048;
          uint64_t v84 = v25;
          _os_log_impl(&dword_22316D000, v26, OS_LOG_TYPE_DEFAULT, "WPPM: input stream: receivedData from peer %@ of len %ld", buf, 0x16u);
        }
        if (*((unsigned char *)v68 + 24))
        {
          if ([(id)v76[5] newProtocol])
          {
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_549);
            }
            v27 = WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22316D000, v27, OS_LOG_TYPE_DEFAULT, "WPPM: input stream: new protocol", buf, 2u);
            }
            [(WPDPipeManager *)self handleIncomingPipeData:v76[5] data:v54 dataSize:v25];
            goto LABEL_96;
          }
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_552);
          }
          uint64_t v39 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22316D000, v39, OS_LOG_TYPE_DEFAULT, "WPPM: input stream: old protocol", buf, 2u);
          }
          if (v18)
          {
            v40 = [MEMORY[0x263EFF8F8] dataWithBytes:v54 length:v25];
            v41 = [(WPDPipeManager *)self queue];
            v57[0] = MEMORY[0x263EF8330];
            v57[1] = 3221225472;
            v57[2] = __37__WPDPipeManager_stream_handleEvent___block_invoke_553;
            v57[3] = &unk_26469B9C0;
            id v58 = v18;
            id v59 = v40;
            id v61 = &v75;
            id v60 = v56;
            id v42 = v40;
            dispatch_async(v41, v57);

            goto LABEL_96;
          }
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_556_0);
          }
          __int16 v35 = (id)WiProxLog;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v47 = [(id)v76[5] pipe];
            v48 = [v47 name];
            *(_DWORD *)buf = 138412802;
            id v82 = v16;
            __int16 v83 = 2112;
            uint64_t v84 = (uint64_t)v56;
            __int16 v85 = 2112;
            id v86 = v48;
            _os_log_error_impl(&dword_22316D000, v35, OS_LOG_TYPE_ERROR, "WPPM: input stream: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);
          }
LABEL_95:

          goto LABEL_96;
        }
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_559_0);
        }
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDPipeManager stream:handleEvent:].cold.4();
        }
        goto LABEL_96;
      case 4uLL:
        if (!*((unsigned char *)v72 + 24))
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_543);
          }
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
            -[WPDPipeManager stream:handleEvent:]();
          }
          goto LABEL_96;
        }
        if ([(id)v76[5] newProtocol])
        {
          if (([(id)v76[5] versionInfoSent] & 1) == 0)
          {
            [(WPDPipeManager *)self sendVersionInfo:v76[5]];
            goto LABEL_96;
          }
          if ([(id)v76[5] versionInfoReceived])
          {
            if ([(id)v76[5] versionInfoSent]
              && [(id)v76[5] versionInfoReceived]
              && ([(id)v76[5] pipeDidConnectSent] & 1) == 0)
            {
              if (v18)
              {
                if (WPLogInitOnce != -1) {
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_534);
                }
                id v43 = WiProxLog;
                if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  v44 = "WPPM: output stream: send pipe connect notification";
LABEL_85:
                  _os_log_impl(&dword_22316D000, v43, OS_LOG_TYPE_DEFAULT, v44, buf, 2u);
                }
LABEL_86:
                [(id)v76[5] setPipeDidConnectSent:1];
                [v18 connectedDeviceOverLEPipe:v56];
              }
              else
              {
                if (WPLogInitOnce != -1) {
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_537);
                }
                v49 = (id)WiProxLog;
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v52 = [(id)v76[5] pipe];
                  uint64_t v53 = [v52 name];
                  *(_DWORD *)buf = 138412802;
                  id v82 = v16;
                  __int16 v83 = 2112;
                  uint64_t v84 = (uint64_t)v56;
                  __int16 v85 = 2112;
                  id v86 = v53;
                  _os_log_error_impl(&dword_22316D000, v49, OS_LOG_TYPE_ERROR, "WPPM: output stream: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);
                }
                uint64_t v50 = [(id)v76[5] pipe];
                uint64_t v51 = [v50 name];
                [(WPDPipeManager *)self invalidatePipeInfo:v51 forPeer:v56];

LABEL_69:
                id v18 = 0;
              }
            }
            else
            {
              [(WPDPipeManager *)self sendRemainingData:v76[5] wpClient:v18];
            }
            goto LABEL_96;
          }
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_531_0);
          }
          uint64_t v37 = WiProxLog;
          if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_96;
          }
          *(_WORD *)buf = 0;
          int v22 = "WPPM: output stream: wait to receive version info";
        }
        else
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_540);
          }
          uint64_t v37 = WiProxLog;
          if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_96;
          }
          *(_WORD *)buf = 0;
          int v22 = "WPPM: output stream: using old protocol";
        }
        uint64_t v23 = v37;
        uint32_t v24 = 2;
LABEL_63:
        _os_log_impl(&dword_22316D000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
        goto LABEL_96;
      case 8uLL:
        if (*((unsigned char *)v72 + 24) || *((unsigned char *)v68 + 24))
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_565);
          }
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
            -[WPDPipeManager stream:handleEvent:].cold.5();
          }
          uint64_t v28 = [(id)v76[5] pipe];
          __int16 v29 = [v28 name];
          id v30 = [(id)v76[5] pipe];
          __int16 v31 = [v30 peer];
          int64_t v32 = [v31 identifier];
          [(WPDPipeManager *)self invalidatePipeInfo:v29 forPeer:v32];
        }
        goto LABEL_96;
      default:
        goto LABEL_96;
    }
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_516);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDPipeManager stream:handleEvent:]();
  }
  id v18 = 0;
  id v56 = 0;
  id v16 = 0;
LABEL_96:

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);
}

void __37__WPDPipeManager_stream_handleEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__WPDPipeManager_stream_handleEvent___block_invoke_2;
  v5[3] = &unk_26469BA38;
  id v6 = *(id *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  [a3 enumerateObjectsUsingBlock:v5];
}

void __37__WPDPipeManager_stream_handleEvent___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  id v13 = a2;
  id v6 = [v13 pipe];
  long long v7 = [v6 output];
  int v8 = [v7 isEqual:a1[4]];

  if (v8)
  {
    uint64_t v9 = a1[5];
  }
  else
  {
    id v10 = [v13 pipe];
    uint64_t v11 = [v10 input];
    int v12 = [v11 isEqual:a1[4]];

    if (!v12) {
      goto LABEL_6;
    }
    uint64_t v9 = a1[7];
  }
  *(unsigned char *)(*(void *)(v9 + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  *a3 = 1;
LABEL_6:
}

void __37__WPDPipeManager_stream_handleEvent___block_invoke_553(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) xpcConnectionForClient];
  v2 = [v6 remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) pipe];
  id v5 = [v4 name];
  [v2 receivedData:v3 fromEndpoint:v5 forPeripheral:*(void *)(a1 + 48)];
}

- (void)handleIncomingPipeData:(id)a3 data:(char *)a4 dataSize:(int64_t)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = *a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_567_0);
  }
  id v10 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    int v12 = [v8 pipe];
    id v13 = [v12 name];
    *(_DWORD *)uint64_t v37 = 138412802;
    *(void *)&v37[4] = v13;
    __int16 v38 = 2048;
    int64_t v39 = a5;
    __int16 v40 = 1024;
    int v41 = v9;
    _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEFAULT, "WPPM: handleIncomingPipeData: %@ of size: %ld first byte 0x%x", v37, 0x1Cu);
  }
  uint64_t v14 = [v8 pipeDataTransfer];
  if (v14)
  {
    __int16 v15 = (void *)v14;
    id v16 = [v8 pipeDataTransfer];
    int v17 = [v16 rxWaitForMoreData];

    if (v17)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_570);
      }
      uint64_t v18 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v37 = 0;
        uint64_t v19 = "WPPM: handleIncomingPipeData: continuation of previous packet";
        uint64_t v20 = v18;
        uint32_t v21 = 2;
LABEL_11:
        _os_log_impl(&dword_22316D000, v20, OS_LOG_TYPE_DEFAULT, v19, v37, v21);
      }
LABEL_12:
      int v22 = self;
      id v23 = v8;
      uint32_t v24 = a4;
      int64_t v25 = a5;
LABEL_13:
      -[WPDPipeManager receivedPayload:data:dataSize:](v22, "receivedPayload:data:dataSize:", v23, v24, v25, *(void *)v37);
      goto LABEL_39;
    }
  }
  uint64_t v26 = [v8 ackData];
  if (!v26
    || (v27 = (void *)v26,
        [v8 ackData],
        uint64_t v28 = objc_claimAutoreleasedReturnValue(),
        int v29 = [v28 rxWaitForMoreData],
        v28,
        v27,
        !v29))
  {
    switch(v9)
    {
      case 1:
        [(WPDPipeManager *)self receivedVersionInfo:v8 data:a4 + 1 dataSize:a5 - 1];
        goto LABEL_39;
      case 2:
        uint32_t v24 = a4 + 1;
        int64_t v25 = a5 - 1;
        int v22 = self;
        id v23 = v8;
        goto LABEL_13;
      case 3:
        uint64_t v33 = a4 + 1;
        int64_t v34 = a5 - 1;
        __int16 v31 = self;
        id v32 = v8;
        goto LABEL_31;
      case 4:
        [(WPDPipeManager *)self receivedError:v8 data:a4 + 1 dataSize:a5 - 1];
        goto LABEL_39;
      case 5:
        [(WPDPipeManager *)self receivedConnectStatus:v8 data:a4 + 1 dataSize:a5 - 1];
        goto LABEL_39;
      default:
        if (![v8 versionInfoSent]
          || ![v8 versionInfoReceived])
        {
          id v36 = [MEMORY[0x263EFF8F8] dataWithBytes:a4 length:a5];
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_579_0);
          }
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
            -[WPDPipeManager handleIncomingPipeData:data:dataSize:]();
          }

          goto LABEL_39;
        }
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_576_1);
        }
        uint64_t v35 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v37 = 67109120;
          *(_DWORD *)&v37[4] = v9;
          uint64_t v19 = "WPPM: handleIncomingPipeData: continuation of pervious packet first byte 0x%x";
          uint64_t v20 = v35;
          uint32_t v21 = 8;
          goto LABEL_11;
        }
        break;
    }
    goto LABEL_12;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_573_0);
  }
  id v30 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v37 = 0;
    _os_log_impl(&dword_22316D000, v30, OS_LOG_TYPE_DEFAULT, "WPPM: handleIncomingPipeData: continuation of previous packet", v37, 2u);
  }
  __int16 v31 = self;
  id v32 = v8;
  uint64_t v33 = a4;
  int64_t v34 = a5;
LABEL_31:
  [(WPDPipeManager *)v31 receivedAck:v32 data:v33 dataSize:v34];
LABEL_39:
}

- (void)receivedVersionInfo:(id)a3 data:(char *)a4 dataSize:(int64_t)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_581_0);
  }
  int v9 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)uint64_t v33 = a5;
    _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "WPPM: receivedVersionInfo of len %ld", buf, 0xCu);
  }
  if (a5 <= 5)
  {
    [(WPDPipeManager *)self sendErrorResponse:v8 errorCode:3];
    goto LABEL_30;
  }
  [v8 setVersion:a4[1]];
  unsigned int v10 = a4[2];
  [v8 setSupportedFeatures:(a4[4] << 16) | (a4[3] << 8) | (a4[5] << 24) | v10];
  [v8 setVersionInfoReceived:1];
  [v8 setUseConnectStatusPDU:v10 & 1];
  uint64_t v11 = [v8 pipe];
  int v12 = [v11 peer];
  __int16 v31 = [v12 identifier];

  id v13 = [(WPDPipeManager *)self endpointsDict];
  uint64_t v14 = [v8 pipe];
  __int16 v15 = [v14 name];
  id v16 = [v13 objectForKeyedSubscript:v15];
  int v17 = [v16 clientUUID];

  uint64_t v18 = [(WPDManager *)self server];
  uint64_t v19 = [v18 getClientForUUID:v17];

  if ([v8 versionInfoReceived]
    && [v8 versionInfoSent]
    && ([v8 pipeDidConnectSent] & 1) == 0)
  {
    if (!v19)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_587_0);
      }
      uint32_t v24 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = v24;
        int v29 = [v8 pipe];
        id v30 = [v29 name];
        *(_DWORD *)buf = 138412802;
        *(void *)uint64_t v33 = v17;
        *(_WORD *)&v33[8] = 2112;
        int64_t v34 = v31;
        __int16 v35 = 2112;
        id v36 = v30;
        _os_log_error_impl(&dword_22316D000, v28, OS_LOG_TYPE_ERROR, "WPPM: receivedVersionInfo: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);
      }
      goto LABEL_25;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_584_0);
    }
    uint64_t v20 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v21 = v20;
      int v22 = [v8 useConnectStatusPDU];
      int v23 = [v8 connectionInitiator];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v33 = v22;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v23;
      _os_log_impl(&dword_22316D000, v21, OS_LOG_TYPE_DEFAULT, "WPPM: receivedVersionInfo: version info exchanged - use conn PDU: %d, initiator: %d", buf, 0xEu);
    }
    if ([v8 useConnectStatusPDU])
    {
      if (![v8 connectionInitiator]) {
        goto LABEL_19;
      }
      [(WPDPipeManager *)self sendConnectStatus:v8 connectStatus:1];
    }
    [v8 setPipeDidConnectSent:1];
    [v19 connectedDeviceOverLEPipe:v31];
LABEL_19:
    if ((unint64_t)a5 >= 7) {
      [(WPDPipeManager *)self handleIncomingPipeData:v8 data:a4 + 6 dataSize:a5 - 6];
    }
  }
LABEL_25:
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_590);
  }
  int64_t v25 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = v25;
    int v27 = [v8 version];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)uint64_t v33 = v27;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = 1;
    _os_log_impl(&dword_22316D000, v26, OS_LOG_TYPE_DEFAULT, "WPPM: receivedVersionInfo: remote version %d, local version %d", buf, 0xEu);
  }
LABEL_30:
}

- (void)receivedPayload:(id)a3 data:(char *)a4 dataSize:(int64_t)a5
{
  v123[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_592);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    -[WPDPipeManager receivedPayload:data:dataSize:].cold.4();
    if (a5) {
      goto LABEL_5;
    }
  }
  else if (a5)
  {
LABEL_5:
    int v9 = [v8 pipe];
    unsigned int v10 = [v9 peer];
    uint64_t v108 = [v10 identifier];

    uint64_t v11 = [(WPDPipeManager *)self endpointsDict];
    int v12 = [v8 pipe];
    id v13 = [v12 name];
    uint64_t v14 = [v11 objectForKeyedSubscript:v13];
    uint64_t v15 = [v14 clientUUID];

    id v16 = [(WPDManager *)self server];
    v107 = (void *)v15;
    int v17 = [v16 getClientForUUID:v15];

    id v18 = [v8 pipeDataTransfer];
    if ([v8 newProtocol] && (objc_msgSend(v8, "pipeDidConnectSent") & 1) == 0)
    {
      if (v18) {
        [v18 resetRxTransfer];
      }
      [(WPDPipeManager *)self sendErrorResponse:v8 errorCode:6];
      goto LABEL_84;
    }
    if (!v18)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_595);
      }
      uint64_t v19 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22316D000, v19, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: initialize pipe transfer object", buf, 2u);
      }
      id v18 = [[PipeDataTransfer alloc] initPipeDataTransferForPeer:v108];
      [v8 setPipeDataTransfer:v18];
    }
    uint64_t v106 = [MEMORY[0x263EFF990] data];
    if ([v18 rxFirstPacket])
    {
      uint64_t v20 = [MEMORY[0x263EFF8F8] dataWithBytes:a4 length:a5];
      [v18 setRxData:v20];

      uint32_t v21 = [v18 rxData];
      unint64_t v22 = [v21 length];
      unsigned int v23 = [v18 rxCurrentDataSize];

      uint32_t v24 = v106;
      if (v22 > v23)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_619);
        }
        int64_t v25 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDPipeManager receivedPayload:data:dataSize:](v25, v18);
        }
        [v18 setRxWaitForMoreData:0];
        uint64_t v26 = [v18 rxData];
        uint64_t v27 = [v18 rxCurrentDataSize];
        uint64_t v28 = [v18 rxData];
        int v29 = objc_msgSend(v26, "subdataWithRange:", v27, objc_msgSend(v28, "length") - objc_msgSend(v18, "rxCurrentDataSize"));
        uint32_t v24 = v106;
        [v106 setData:v29];

        id v30 = [v18 rxData];
        __int16 v31 = objc_msgSend(v30, "subdataWithRange:", 0, objc_msgSend(v18, "rxCurrentDataSize"));

        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_622);
        }
        id v32 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = v32;
          uint64_t v34 = [v31 length];
          *(_DWORD *)buf = 134218242;
          *(void *)uint64_t v121 = v34;
          *(_WORD *)&v121[8] = 2112;
          *(void *)&v121[10] = v31;
          _os_log_impl(&dword_22316D000, v33, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: of len (%lu) %@", buf, 0x16u);
        }
        [v18 setRxData:v31];
      }
      __int16 v35 = [v18 rxData];
    }
    else
    {
      if (a5 <= 2)
      {
        [(WPDPipeManager *)self sendErrorResponse:v8 errorCode:3];
        __int16 v35 = 0;
        uint32_t v24 = v106;
LABEL_83:

LABEL_84:
        goto LABEL_85;
      }
      v105 = v17;
      int v56 = *a4;
      int v57 = a4[1];
      uint64_t v58 = a4[2];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_598);
      }
      id v59 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v121 = v56 | (v57 << 8);
        *(_WORD *)&v121[4] = 1024;
        *(_DWORD *)&v121[6] = v58;
        _os_log_debug_impl(&dword_22316D000, v59, OS_LOG_TYPE_DEBUG, "WPPM: receivedPayload: FIRST PACKET len %d, seqNum %d", buf, 0xEu);
      }
      [v18 setRxSeqNum:v58];
      id v60 = [MEMORY[0x263EFF8F8] dataWithBytes:a4 + 3 length:a5 - 3];
      [v18 setRxData:v60];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_601);
      }
      int v17 = v105;
      id v61 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPDPipeManager receivedPayload:data:dataSize:](v61, v18);
      }
      if ((unint64_t)a5 < 5)
      {
        __int16 v35 = 0;
        uint32_t v24 = v106;
      }
      else
      {
        [v18 setRxTotalLenToReceive:*(unsigned __int16 *)(a4 + 3)];
        v62 = [MEMORY[0x263EFF8F8] dataWithBytes:a4 + 5 length:a5 - 5];
        [v18 setRxTotalDataToReceive:v62];

        objc_msgSend(v18, "setRxCurrentDataSize:", objc_msgSend(v18, "rxTotalLenToReceive"));
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_604);
        }
        id v63 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v64 = v63;
          int v65 = [v18 rxTotalLenToReceive];
          uint64_t v66 = [v18 rxTotalDataToReceive];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)uint64_t v121 = v65;
          *(_WORD *)&v121[4] = 2112;
          *(void *)&v121[6] = v66;
          _os_log_impl(&dword_22316D000, v64, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: FIRST PACKET rxTLen %d, rxTData: %@", buf, 0x12u);
        }
        __int16 v35 = [v18 rxTotalDataToReceive];
        uint64_t v67 = [v18 rxTotalDataToReceive];
        unint64_t v68 = [v67 length];
        unsigned int v69 = [v18 rxCurrentDataSize];

        if (v68 > v69)
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_607);
          }
          char v70 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
            -[WPDPipeManager receivedPayload:data:dataSize:](v70, v18);
          }
          uint64_t v71 = [v18 rxTotalDataToReceive];
          uint64_t v72 = [v18 rxTotalLenToReceive];
          uint64_t v73 = [v18 rxTotalDataToReceive];
          char v74 = objc_msgSend(v71, "subdataWithRange:", v72, objc_msgSend(v73, "length") - objc_msgSend(v18, "rxTotalLenToReceive"));
          uint32_t v24 = v106;
          [v106 setData:v74];

          int v17 = v105;
          if (v105)
          {
            uint64_t v75 = [v18 rxData];
            id v76 = objc_msgSend(v75, "subdataWithRange:", 0, objc_msgSend(v18, "rxTotalLenToReceive") + 2);

            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_610);
            }
            uint64_t v77 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            {
              id v78 = v77;
              uint64_t v79 = [v76 length];
              *(_DWORD *)buf = 134218242;
              *(void *)uint64_t v121 = v79;
              *(_WORD *)&v121[8] = 2112;
              *(void *)&v121[10] = v76;
              _os_log_impl(&dword_22316D000, v78, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: notify didReceive of len (%lu) %@", buf, 0x16u);
            }
            id v80 = [(WPDPipeManager *)self queue];
            v115[0] = MEMORY[0x263EF8330];
            v115[1] = 3221225472;
            v115[2] = __48__WPDPipeManager_receivedPayload_data_dataSize___block_invoke_611;
            v115[3] = &unk_26469B9E8;
            id v116 = v105;
            id v117 = v76;
            id v81 = v8;
            id v118 = v81;
            id v119 = v108;
            id v82 = v76;
            dispatch_async(v80, v115);

            [(WPDPipeManager *)self sendAck:v81 errorCode:0];
            uint32_t v24 = v106;
          }
          else
          {
            if (WPLogInitOnce != -1) {
              dispatch_once(&WPLogInitOnce, &__block_literal_global_613);
            }
            id v93 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
            {
              v102 = v93;
              id v103 = [v8 pipe];
              v104 = [v103 name];
              *(_DWORD *)buf = 138412802;
              *(void *)uint64_t v121 = v107;
              *(_WORD *)&v121[8] = 2112;
              *(void *)&v121[10] = v108;
              __int16 v122 = 2112;
              v123[0] = v104;
              _os_log_error_impl(&dword_22316D000, v102, OS_LOG_TYPE_ERROR, "WPPM: receivedPayload: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);

              uint32_t v24 = v106;
            }
          }
          [v18 resetRxTransfer];
          if (![v24 length]) {
            goto LABEL_83;
          }
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_616);
          }
          v94 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            v95 = v94;
            uint64_t v96 = [v24 length];
            *(_DWORD *)buf = 134218242;
            *(void *)uint64_t v121 = v96;
            *(_WORD *)&v121[8] = 2112;
            *(void *)&v121[10] = v24;
            _os_log_impl(&dword_22316D000, v95, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: decode next packet of len (%lu) %@", buf, 0x16u);
          }
          id v97 = v24;
          uint64_t v98 = [v97 bytes];
          uint64_t v89 = [v97 length];
          id v90 = self;
          id v91 = v8;
          uint64_t v92 = v98;
LABEL_82:
          [(WPDPipeManager *)v90 handleIncomingPipeData:v91 data:v92 dataSize:v89];
          goto LABEL_83;
        }
        [v18 setRxFirstPacket:1];
        int v17 = v105;
        uint32_t v24 = v106;
      }
    }
    id v36 = [v18 rxTotalDataWithLen];
    uint64_t v37 = [v18 rxData];
    [v36 appendData:v37];

    __int16 v38 = [v18 rxCurrentReceivedData];
    [v38 appendData:v35];

    objc_msgSend(v18, "setRxCurrentDataSize:", (unsigned __int16)(objc_msgSend(v18, "rxCurrentDataSize") - objc_msgSend(v35, "length")));
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_625);
    }
    int64_t v39 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v40 = v17;
      int v41 = v39;
      uint64_t v42 = [v18 rxCurrentReceivedData];
      uint64_t v43 = [v42 length];
      int v44 = [v18 rxCurrentDataSize];
      v45 = [v18 rxTotalDataWithLen];
      uint64_t v46 = [v45 length];
      *(_DWORD *)buf = 134218754;
      *(void *)uint64_t v121 = v43;
      *(_WORD *)&v121[8] = 2112;
      *(void *)&v121[10] = v108;
      __int16 v122 = 1024;
      LODWORD(v123[0]) = v44;
      WORD2(v123[0]) = 2048;
      *(void *)((char *)v123 + 6) = v46;
      _os_log_impl(&dword_22316D000, v41, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: length of data received %ld from peer %@, length of data remaining to receive: %d, rxTotalData %ld", buf, 0x26u);

      int v17 = v40;
      uint32_t v24 = v106;
    }
    [(WPDPipeManager *)self _signpostBegin];
    if ([v18 rxCurrentDataSize]
      || ([v18 rxCurrentReceivedData],
          v48 = objc_claimAutoreleasedReturnValue(),
          uint64_t v49 = [v48 length],
          v48,
          !v49))
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_635);
      }
      v47 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22316D000, v47, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: transfer wait", buf, 2u);
      }
      [v18 setRxWaitForMoreData:1];
    }
    else
    {
      if (v17)
      {
        uint64_t v50 = (void *)MEMORY[0x263EFF8F8];
        uint64_t v51 = [v18 rxTotalDataWithLen];
        uint64_t v52 = [v50 dataWithData:v51];

        uint64_t v53 = [(WPDPipeManager *)self queue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __48__WPDPipeManager_receivedPayload_data_dataSize___block_invoke_626;
        block[3] = &unk_26469BA88;
        id v110 = v17;
        id v111 = v52;
        id v54 = v8;
        id v112 = v54;
        id v113 = v108;
        uint64_t v114 = self;
        id v55 = v52;
        dispatch_async(v53, block);

        [(WPDPipeManager *)self sendAck:v54 errorCode:0];
      }
      else
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_632);
        }
        __int16 v83 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        {
          v99 = v83;
          v100 = [v8 pipe];
          unsigned __int16 v101 = [v100 name];
          *(_DWORD *)buf = 138412802;
          *(void *)uint64_t v121 = v107;
          *(_WORD *)&v121[8] = 2112;
          *(void *)&v121[10] = v108;
          __int16 v122 = 2112;
          v123[0] = v101;
          _os_log_error_impl(&dword_22316D000, v99, OS_LOG_TYPE_ERROR, "WPPM: receivedPayload: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);
        }
      }
      [v18 resetRxTransfer];
    }
    if (![v24 length]) {
      goto LABEL_83;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_638);
    }
    uint64_t v84 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v85 = v84;
      uint64_t v86 = [v24 length];
      *(_DWORD *)buf = 134218242;
      *(void *)uint64_t v121 = v86;
      *(_WORD *)&v121[8] = 2112;
      *(void *)&v121[10] = v24;
      _os_log_impl(&dword_22316D000, v85, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: decode next packet of len (%lu) %@", buf, 0x16u);
    }
    id v87 = v24;
    uint64_t v88 = [v87 bytes];
    uint64_t v89 = [v87 length];
    id v90 = self;
    id v91 = v8;
    uint64_t v92 = v88;
    goto LABEL_82;
  }
  [(WPDPipeManager *)self sendErrorResponse:v8 errorCode:3];
LABEL_85:
}

void __48__WPDPipeManager_receivedPayload_data_dataSize___block_invoke_611(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) xpcConnectionForClient];
  v2 = [v6 remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) pipe];
  id v5 = [v4 name];
  [v2 receivedData:v3 fromEndpoint:v5 forPeripheral:*(void *)(a1 + 56)];
}

uint64_t __48__WPDPipeManager_receivedPayload_data_dataSize___block_invoke_626(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) xpcConnectionForClient];
  uint64_t v3 = [v2 remoteObjectProxy];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) pipe];
  id v6 = [v5 name];
  [v3 receivedData:v4 fromEndpoint:v6 forPeripheral:*(void *)(a1 + 56)];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_629);
  }
  long long v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 40);
    int v9 = v7;
    uint64_t v10 = [v8 length];
    uint64_t v11 = *(void *)(a1 + 56);
    int v13 = 134218242;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload queue block processed: length of data received %lu from peer %@", (uint8_t *)&v13, 0x16u);
  }
  return [*(id *)(a1 + 64) _signpostEnd];
}

- (void)receivedAck:(id)a3 data:(char *)a4 dataSize:(int64_t)a5
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_640);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDPipeManager receivedAck:data:dataSize:].cold.5();
  }
  uint64_t v9 = [v8 pipeDataTransfer];
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    v64 = (void *)v9;
    uint64_t v11 = [v8 pipe];
    int v12 = [v11 peer];
    int v13 = [v12 identifier];

    uint64_t v14 = [(WPDPipeManager *)self endpointsDict];
    __int16 v15 = [v8 pipe];
    uint64_t v16 = [v15 name];
    uint64_t v17 = [v14 objectForKeyedSubscript:v16];
    uint64_t v18 = [v17 clientUUID];

    uint64_t v19 = [(WPDManager *)self server];
    id v63 = (void *)v18;
    uint64_t v20 = [v19 getClientForUUID:v18];

    if (!v20)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_646);
      }
      int64_t v25 = v13;
      __int16 v40 = v63;
      int v41 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = v41;
        uint64_t v43 = [v8 pipe];
        int v44 = [v43 name];
        *(_DWORD *)buf = 138412802;
        *(void *)uint64_t v79 = v63;
        *(_WORD *)&v79[8] = 2112;
        id v80 = v25;
        *(_WORD *)id v81 = 2112;
        *(void *)&v81[2] = v44;
        _os_log_error_impl(&dword_22316D000, v42, OS_LOG_TYPE_ERROR, "WPPM: receivedAck: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);
      }
      goto LABEL_59;
    }
    if (a5 < 5)
    {
      id v28 = [v8 ackData];
      int64_t v25 = v13;
      if (!v28)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_665_0);
        }
        v45 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22316D000, v45, OS_LOG_TYPE_DEFAULT, "WPPM: init ackData object", buf, 2u);
        }
        id v28 = [[PipeDataTransfer alloc] initPipeDataTransferForPeer:v13];
        [v8 setAckData:v28];
      }
      uint64_t v46 = [v28 rxCurrentReceivedData];
      [v46 appendBytes:a4 length:a5];

      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_668);
      }
      v47 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v48 = v47;
        uint64_t v49 = [v28 rxCurrentReceivedData];
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v79 = v49;
        _os_log_impl(&dword_22316D000, v48, OS_LOG_TYPE_DEFAULT, "WPPM: Currenlty received ack data: %@", buf, 0xCu);
      }
      uint64_t v50 = [v28 rxCurrentReceivedData];
      unint64_t v51 = [v50 length];

      if (v51 < 5)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_671_0);
        }
        __int16 v40 = v63;
        int v56 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22316D000, v56, OS_LOG_TYPE_DEFAULT, "WPPM: Still have not received full ack packet.", buf, 2u);
        }
        [v28 setRxWaitForMoreData:1];
      }
      else
      {
        id v52 = [v28 rxCurrentReceivedData];
        uint64_t v53 = [v52 bytes];
        id v54 = [v28 rxCurrentReceivedData];
        -[WPDPipeManager receivedAck:data:dataSize:](self, "receivedAck:data:dataSize:", v8, v53, [v54 length]);

        __int16 v40 = v63;
      }
    }
    else
    {
      int v21 = *a4;
      int v22 = a4[1];
      int v23 = *((unsigned __int16 *)a4 + 1);
      uint64_t v62 = a4[4];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_649_0);
      }
      uint32_t v24 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)uint64_t v79 = v21;
        *(_WORD *)&void v79[4] = 1024;
        *(_DWORD *)&v79[6] = v22;
        LOWORD(v80) = 1024;
        *(_DWORD *)((char *)&v80 + 2) = v23;
        HIWORD(v80) = 1024;
        *(_DWORD *)id v81 = v62;
        _os_log_debug_impl(&dword_22316D000, v24, OS_LOG_TYPE_DEBUG, "WPPM: receivedAck: of len %d, seqNum %d, pLen %d, status %d", buf, 0x1Au);
      }
      if (v22 != [v64 txSeqNum])
      {
        int64_t v25 = v13;
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_652);
        }
        __int16 v40 = v63;
        id v55 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDPipeManager receivedAck:data:dataSize:].cold.4(v55);
        }
        goto LABEL_59;
      }
      int64_t v25 = v13;
      if (v23 != [v64 txTotalLenToSend])
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_655);
        }
        __int16 v40 = v63;
        int v57 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDPipeManager receivedAck:data:dataSize:](v57);
        }
        goto LABEL_59;
      }
      uint64_t v26 = (void *)MEMORY[0x263EFF8F8];
      uint64_t v27 = [v64 txData];
      id v28 = [v26 dataWithData:v27];

      if (v62)
      {
        int v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v76 = *MEMORY[0x263F08320];
        id v30 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to send data over LE Pipe %d", v62);
        uint64_t v77 = v30;
        __int16 v31 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        id v32 = [v29 errorWithDomain:@"WPErrorDomain" code:26 userInfo:v31];

        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_661);
        }
        uint64_t v33 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDPipeManager receivedAck:data:dataSize:](v33);
        }
        uint64_t v34 = [(WPDPipeManager *)self queue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __44__WPDPipeManager_receivedAck_data_dataSize___block_invoke_662;
        block[3] = &unk_26469BA88;
        id v66 = v20;
        id v67 = v28;
        id v35 = v8;
        id v68 = v35;
        id v36 = v13;
        id v69 = v36;
        id v70 = v32;
        id v37 = v32;
        dispatch_async(v34, block);

        __int16 v38 = [v35 pipe];
        int64_t v39 = [v38 name];
        [(WPDPipeManager *)self invalidatePipeInfo:v39 forPeer:v36];
      }
      else
      {
        uint64_t v58 = [(WPDPipeManager *)self queue];
        v71[0] = MEMORY[0x263EF8330];
        v71[1] = 3221225472;
        v71[2] = __44__WPDPipeManager_receivedAck_data_dataSize___block_invoke_656;
        v71[3] = &unk_26469B9E8;
        id v72 = v20;
        id v73 = v28;
        id v59 = v8;
        id v74 = v59;
        id v75 = v13;
        dispatch_async(v58, v71);

        if ((unint64_t)a5 >= 6) {
          [(WPDPipeManager *)self handleIncomingPipeData:v59 data:a4 + 5 dataSize:a5 - 5];
        }

        id v37 = v72;
      }

      [v64 resetTxTransfer];
      id v60 = [v8 ackData];

      __int16 v40 = v63;
      if (v60)
      {
        id v61 = [v8 ackData];
        [v61 resetRxTransfer];
      }
    }

LABEL_59:
    uint64_t v10 = v64;
    goto LABEL_60;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_643);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDPipeManager receivedAck:data:dataSize:]();
  }
LABEL_60:
}

void __44__WPDPipeManager_receivedAck_data_dataSize___block_invoke_656(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) xpcConnectionForClient];
  v2 = [v6 remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) pipe];
  id v5 = [v4 name];
  [v2 sentData:v3 toEndpoint:v5 forPeripheral:*(void *)(a1 + 56) withError:0];
}

void __44__WPDPipeManager_receivedAck_data_dataSize___block_invoke_662(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) xpcConnectionForClient];
  v2 = [v6 remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) pipe];
  id v5 = [v4 name];
  [v2 sentData:v3 toEndpoint:v5 forPeripheral:*(void *)(a1 + 56) withError:*(void *)(a1 + 64)];
}

- (void)receivedError:(id)a3 data:(char *)a4 dataSize:(int64_t)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (a5 >= 2)
  {
    int v9 = a4[1];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_673);
    }
    uint64_t v10 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDPipeManager receivedError:data:dataSize:](v9, a5, v10);
    }
    if (v9 == 6)
    {
      uint64_t v11 = [v8 pipeDataTransfer];
      if (v11)
      {
        int v12 = [v8 pipe];
        int v13 = [v12 peer];
        uint64_t v14 = [v13 identifier];

        __int16 v15 = [(WPDPipeManager *)self endpointsDict];
        uint64_t v16 = [v8 pipe];
        uint64_t v17 = [v16 name];
        uint64_t v18 = [v15 objectForKeyedSubscript:v17];
        uint64_t v19 = [v18 clientUUID];

        uint64_t v20 = [(WPDManager *)self server];
        int v21 = [v20 getClientForUUID:v19];

        if (v21)
        {
          int v22 = (void *)MEMORY[0x263F087E8];
          uint64_t v43 = *MEMORY[0x263F08320];
          int v23 = [NSString stringWithFormat:@"Failed to send data over LE Pipe %d, remote device is not active", 6];
          int v44 = v23;
          uint32_t v24 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          int64_t v25 = [v22 errorWithDomain:@"WPErrorDomain" code:7 userInfo:v24];

          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_685);
          }
          uint64_t v26 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
            -[WPDPipeManager receivedError:data:dataSize:](v26);
          }
          uint64_t v27 = (void *)MEMORY[0x263EFF8F8];
          id v28 = [v8 pipeDataTransfer];
          int v29 = [v28 txData];
          id v30 = [v27 dataWithData:v29];

          __int16 v31 = [(WPDPipeManager *)self queue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __46__WPDPipeManager_receivedError_data_dataSize___block_invoke_686;
          block[3] = &unk_26469B9E8;
          id v39 = v21;
          id v40 = v30;
          id v41 = v8;
          id v42 = v25;
          id v32 = v25;
          id v33 = v30;
          dispatch_async(v31, block);
        }
        else
        {
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_679_0);
          }
          uint64_t v34 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          {
            id v35 = v34;
            id v36 = [v8 pipe];
            id v37 = [v36 name];
            *(_DWORD *)buf = 138412802;
            uint64_t v46 = v19;
            __int16 v47 = 2112;
            v48 = v14;
            __int16 v49 = 2112;
            uint64_t v50 = v37;
            _os_log_error_impl(&dword_22316D000, v35, OS_LOG_TYPE_ERROR, "WPPM: receivedError: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);
          }
        }
      }
      else
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_676_0);
        }
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDPipeManager receivedError:data:dataSize:]();
        }
      }
    }
  }
}

void __46__WPDPipeManager_receivedError_data_dataSize___block_invoke_686(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) xpcConnectionForClient];
  v2 = [v9 remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) pipe];
  id v5 = [v4 name];
  id v6 = [*(id *)(a1 + 48) pipe];
  long long v7 = [v6 peer];
  id v8 = [v7 identifier];
  [v2 sentData:v3 toEndpoint:v5 forPeripheral:v8 withError:*(void *)(a1 + 56)];
}

- (void)receivedConnectStatus:(id)a3 data:(char *)a4 dataSize:(int64_t)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (a5 >= 2)
  {
    int v9 = a4[1];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_688_0);
    }
    uint64_t v10 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v38 = v9;
      __int16 v39 = 2048;
      int64_t v40 = a5;
      _os_log_impl(&dword_22316D000, v10, OS_LOG_TYPE_DEFAULT, "WPPM: receivedConnectStatus: status: %d, dataSize: %ld", buf, 0x12u);
    }
    if (v9)
    {
      if (v9 == 1)
      {
        uint64_t v11 = [v8 pipe];
        int v12 = [v11 peer];
        uint64_t v34 = [v12 identifier];

        int v13 = [(WPDPipeManager *)self endpointsDict];
        uint64_t v14 = [v8 pipe];
        __int16 v15 = [v14 name];
        uint64_t v16 = [v13 objectForKeyedSubscript:v15];
        uint64_t v17 = [v16 clientUUID];

        uint64_t v18 = [(WPDManager *)self server];
        uint64_t v19 = [v18 getClientForUUID:v17];

        if (v19)
        {
          [v8 setUseConnectStatusPDU:1];
          [v8 setPipeDidConnectSent:1];
          [v19 connectedDeviceOverLEPipe:v34];
        }
      }
      if ((unint64_t)a5 >= 3) {
        [(WPDPipeManager *)self handleIncomingPipeData:v8 data:a4 + 2 dataSize:a5 - 2];
      }
    }
    else
    {
      uint64_t v20 = [v8 pipe];
      int v21 = [v20 peer];
      int v22 = [v21 identifier];

      int v23 = [(WPDPipeManager *)self endpointsDict];
      uint32_t v24 = [v8 pipe];
      int64_t v25 = [v24 name];
      uint64_t v26 = [v23 objectForKeyedSubscript:v25];
      uint64_t v27 = [v26 clientUUID];

      id v28 = [(WPDManager *)self server];
      int v29 = [v28 getClientForUUID:v27];

      if (v29)
      {
        id v30 = (void *)MEMORY[0x263F087E8];
        uint64_t v35 = *MEMORY[0x263F08320];
        __int16 v31 = [NSString stringWithFormat:@"Remote peer %@ disconnected the link", v22];
        id v36 = v31;
        id v32 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        id v33 = [v30 errorWithDomain:@"WPErrorDomain" code:7 userInfo:v32];

        [v29 disconnectedDeviceOverLEPipe:v22 withError:v33];
      }
    }
  }
}

- (void)sendAck:(id)a3 errorCode:(unsigned __int8)a4
{
  id v6 = a3;
  long long v7 = [v6 pipeDataTransfer];

  if (v7)
  {
    id v8 = [v6 pipe];
    int v9 = [v8 output];

    __int16 v23 = 1027;
    uint64_t v10 = [v6 pipeDataTransfer];
    char v24 = [v10 rxSeqNum];

    uint64_t v11 = [v6 pipeDataTransfer];
    __int16 v12 = [v11 rxTotalLenToReceive];

    __int16 v25 = v12;
    unsigned __int8 v26 = a4;
    int v13 = [MEMORY[0x263EFF8F8] dataWithBytes:&v23 length:6];
    int64_t v14 = [(WPDPipeManager *)self writeDataToPipe:v13 pipe:v6];

    if (v14 == 6)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_699);
      }
      __int16 v15 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPDPipeManager sendAck:errorCode:](v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_696);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDPipeManager sendAck:errorCode:]();
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_693);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDPipeManager sendAck:errorCode:]();
    }
  }
}

- (BOOL)sendVersionInfo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  __int16 v9 = 1281;
  char v10 = 1;
  int v11 = 1;
  id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:&v9 length:7];
  int64_t v6 = [(WPDPipeManager *)self writeDataToPipe:v5 pipe:v4];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_701_0);
  }
  long long v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v13 = v6;
    __int16 v14 = 2112;
    __int16 v15 = v5;
    _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "WPPM: sendVersionInfo: bytes written %ld (expected 7) data %@", buf, 0x16u);
  }
  if (v6 == 7) {
    [v4 setVersionInfoSent:1];
  }

  return v6 == 7;
}

- (void)sendErrorResponse:(id)a3 errorCode:(unsigned __int8)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v7 = [v6 pipe];
  id v8 = [v7 output];

  __int16 v15 = 260;
  unsigned __int8 v16 = a4;
  __int16 v9 = [MEMORY[0x263EFF8F8] dataWithBytes:&v15 length:3];
  int64_t v10 = [(WPDPipeManager *)self writeDataToPipe:v9 pipe:v6];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_703);
  }
  int v11 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = v11;
    uint64_t v13 = [v8 streamStatus];
    __int16 v14 = [v8 streamError];
    *(_DWORD *)buf = 134218498;
    int64_t v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    _os_log_impl(&dword_22316D000, v12, OS_LOG_TYPE_DEFAULT, "WPPM: sendErrorResponse: bytes written %ld (expected 3) with status %ld error %@", buf, 0x20u);
  }
}

- (void)sendConnectStatus:(id)a3 connectStatus:(unsigned __int8)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  __int16 v10 = 261;
  unsigned __int8 v11 = a4;
  id v5 = (void *)MEMORY[0x263EFF8F8];
  id v6 = a3;
  long long v7 = [v5 dataWithBytes:&v10 length:3];
  int64_t v8 = [(WPDPipeManager *)self writeDataToPipe:v7 pipe:v6];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_705);
  }
  __int16 v9 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v13 = v8;
    _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "WPPM: sendConnectStatus: bytes written %ld (expected 3)", buf, 0xCu);
  }
}

- (void)sendRemainingData:(id)a3 wpClient:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [v6 pipeDataTransfer];
  __int16 v9 = v8;
  if (v8)
  {
    if ([v8 txDataLeftToSend])
    {
      __int16 v10 = [v9 txData];
      uint64_t v11 = [v10 length];

      uint64_t v12 = [v9 txDataLeftToSend];
      uint64_t v13 = v11 - v12;
      uint64_t v14 = [v9 txData];
      __int16 v15 = objc_msgSend(v14, "subdataWithRange:", v11 - v12, v12);

      uint64_t v35 = v15;
      uint64_t v16 = [(WPDPipeManager *)self writeDataToPipe:v15 pipe:v6];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_713_0);
      }
      uint64_t v17 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v18 = v17;
        *(_DWORD *)buf = 134218752;
        uint64_t v41 = v13;
        __int16 v42 = 2048;
        uint64_t v43 = v11;
        __int16 v44 = 2048;
        uint64_t v45 = [v15 length];
        __int16 v46 = 2048;
        uint64_t v47 = v16;
        _os_log_impl(&dword_22316D000, v18, OS_LOG_TYPE_DEFAULT, "WPPM: sendRemainingData: starting at %lu total len %lu len %lu, bytes written %ld", buf, 0x2Au);
      }
      if (v16 < 1)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_719_0);
        }
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDPipeManager sendRemainingData:wpClient:]();
        }
        char v24 = (void *)MEMORY[0x263EFF8F8];
        __int16 v25 = [v9 txData];
        unsigned __int8 v26 = [v24 dataWithData:v25];

        uint64_t v27 = [(WPDPipeManager *)self queue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __45__WPDPipeManager_sendRemainingData_wpClient___block_invoke_720;
        block[3] = &unk_26469B6F8;
        id v37 = v7;
        id v38 = v26;
        id v28 = v6;
        id v39 = v28;
        id v29 = v26;
        dispatch_async(v27, block);

        id v30 = [v28 pipe];
        __int16 v31 = [v30 name];
        id v32 = [v28 pipe];
        id v33 = [v32 peer];
        uint64_t v34 = [v33 identifier];
        [(WPDPipeManager *)self invalidatePipeInfo:v31 forPeer:v34];
      }
      else
      {
        objc_msgSend(v9, "setTxDataLeftToSend:", objc_msgSend(v9, "txDataLeftToSend") - v16);
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_716);
        }
        __int16 v19 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = v19;
          uint64_t v21 = [v9 txDataLeftToSend];
          *(_DWORD *)buf = 134217984;
          uint64_t v41 = v21;
          _os_log_impl(&dword_22316D000, v20, OS_LOG_TYPE_DEFAULT, "WPPM: sendRemainingData: txLeftToSend %lu", buf, 0xCu);
        }
      }

      goto LABEL_27;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_710);
    }
    uint64_t v22 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v23 = "WPPM: sendRemainingData:  All data sent";
      goto LABEL_20;
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_707_0);
    }
    uint64_t v22 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v23 = "WPPM: sendRemainingData: no pipe data found";
LABEL_20:
      _os_log_impl(&dword_22316D000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
    }
  }
LABEL_27:
}

void __45__WPDPipeManager_sendRemainingData_wpClient___block_invoke_720(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) xpcConnectionForClient];
  v2 = [v12 remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) pipe];
  id v5 = [v4 name];
  id v6 = [*(id *)(a1 + 48) pipe];
  id v7 = [v6 peer];
  int64_t v8 = [v7 identifier];
  __int16 v9 = [*(id *)(a1 + 48) pipe];
  __int16 v10 = [v9 output];
  uint64_t v11 = [v10 streamError];
  [v2 sentData:v3 toEndpoint:v5 forPeripheral:v8 withError:v11];
}

- (int64_t)writeDataToPipe:(id)a3 pipe:(id)a4
{
  __n[8] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 pipe];
  uint64_t v8 = [v5 length];
  unint64_t v9 = 0;
  id v43 = v5;
  if (!v5) {
    goto LABEL_38;
  }
  size_t v10 = v8;
  if (!v8) {
    goto LABEL_38;
  }
  if ([v7 channel])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_722);
    }
    id v42 = v6;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDPipeManager writeDataToPipe:pipe:]();
    }
    [v7 channel];
    os_channel_ring_id();
    [v7 channel];
    os_channel_tx_ring();
    unint64_t v9 = 0;
    *(void *)&long long v11 = 67109376;
    long long v41 = v11;
    uint64_t v12 = v10;
    while (1)
    {
      memset(__n, 0, 64);
      if (!os_channel_get_next_slot()) {
        break;
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_725_0);
      }
      uint64_t v13 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v41;
        *(_DWORD *)uint64_t v45 = WORD1(__n[0]);
        *(_WORD *)&v45[4] = 2048;
        *(void *)&v45[6] = v12;
        _os_log_debug_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEBUG, "WPPM: writeDataToPipe: slot len: %d, remaining %ld", buf, 0x12u);
      }
      __int16 v14 = WORD1(__n[0]);
      if (v12 < WORD1(__n[0])) {
        __int16 v14 = v12;
      }
      WORD1(__n[0]) = v14;
      __int16 v15 = (void *)__n[2];
      uint64_t v16 = [v43 bytes];
      memcpy(v15, (const void *)(v16 + v9), WORD1(__n[0]));
      os_channel_set_slot_properties();
      uint64_t v17 = WORD1(__n[0]);
      v9 += WORD1(__n[0]);
      if (WORD1(__n[0])) {
        uint64_t v12 = v10 - v9;
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_728_0);
      }
      int64_t v18 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        *(void *)uint64_t v45 = v17;
        *(_WORD *)&v45[8] = 2048;
        *(void *)&v45[10] = v9;
        __int16 v46 = 2048;
        uint64_t v47 = v12;
        _os_log_impl(&dword_22316D000, v18, OS_LOG_TYPE_DEFAULT, "WPPM: writeDataToPipe: send data over skywalk written %ld total %ld remaining %ld", buf, 0x20u);
      }
      os_channel_advance_slot();
      if (v10 <= v9) {
        goto LABEL_30;
      }
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_731_0);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDPipeManager writeDataToPipe:pipe:]();
    }
LABEL_30:
    objc_msgSend(v7, "channel", v41);
    os_channel_sync();
    goto LABEL_31;
  }
  __int16 v19 = [v7 output];
  if ([v19 streamStatus] == 6)
  {

LABEL_33:
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_743_0);
    }
    uint64_t v22 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDPipeManager writeDataToPipe:pipe:](v22);
    }
    unint64_t v9 = 0;
    goto LABEL_38;
  }
  uint64_t v20 = [v7 output];
  uint64_t v21 = [v20 streamStatus];

  if (v21 == 7) {
    goto LABEL_33;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_734_0);
  }
  char v24 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v25 = v24;
    unsigned __int8 v26 = [v7 name];
    LODWORD(__n[0]) = 138412290;
    *(size_t *)((char *)__n + 4) = (size_t)v26;
    _os_log_impl(&dword_22316D000, v25, OS_LOG_TYPE_DEFAULT, "WPPM: writeDataToPipe: %@ send data over stream", (uint8_t *)__n, 0xCu);
  }
  uint64_t v27 = [v7 output];
  unint64_t v9 = objc_msgSend(v27, "write:maxLength:", objc_msgSend(v5, "bytes"), v10);

  if (v9 == v10)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_740_0);
    }
    id v28 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = v28;
      id v30 = [v7 peer];
      __int16 v31 = [v30 identifier];
      LODWORD(__n[0]) = 134218498;
      *(size_t *)((char *)__n + 4) = v10;
      WORD2(__n[1]) = 2048;
      *(size_t *)((char *)&__n[1] + 6) = v10;
      HIWORD(__n[2]) = 2112;
      __n[3] = (size_t)v31;
      _os_log_impl(&dword_22316D000, v29, OS_LOG_TYPE_DEFAULT, "WPPM: writeDataToPipe: bytes written %ld (expected %lu) to peer %@", (uint8_t *)__n, 0x20u);
    }
    unint64_t v9 = v10;
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_737_0);
    }
    id v32 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = v32;
      [v7 peer];
      uint64_t v34 = v42 = v6;
      uint64_t v35 = [v34 identifier];
      id v36 = [v7 output];
      size_t v37 = [v36 streamStatus];
      [v7 output];
      v39 = id v38 = v7;
      int64_t v40 = [v39 streamError];
      LODWORD(__n[0]) = 134219010;
      *(size_t *)((char *)__n + 4) = v9;
      WORD2(__n[1]) = 2048;
      *(size_t *)((char *)&__n[1] + 6) = v10;
      HIWORD(__n[2]) = 2112;
      __n[3] = (size_t)v35;
      LOWORD(__n[4]) = 2048;
      *(size_t *)((char *)&__n[4] + 2) = v37;
      WORD1(__n[5]) = 2112;
      *(size_t *)((char *)&__n[5] + 4) = (size_t)v40;
      _os_log_impl(&dword_22316D000, v33, OS_LOG_TYPE_DEFAULT, "WPPM: writeDataToPipe: bytes written %ld (expected %lu) to peer %@ status %lu with error %@", (uint8_t *)__n, 0x34u);

      id v7 = v38;
LABEL_31:
      id v6 = v42;
    }
  }
LABEL_38:

  return v9;
}

- (id)pipeManagerState:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA) {
    return @"unknown";
  }
  else {
    return off_26469BAF8[a3];
  }
}

- (void)update
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_766);
  }
  uint64_t v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)buf = 134217984;
    int64_t v23 = [(WPDManager *)self state];
    _os_log_impl(&dword_22316D000, v4, OS_LOG_TYPE_DEFAULT, "WPPM: PipeManager state: %ld", buf, 0xCu);
  }
  if ([(WPDManager *)self state] <= 2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = [(WPDPipeManager *)self peerPipesDict];
    id v6 = [v5 allKeys];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = [(WPDPipeManager *)self peerPipesDict];
          uint64_t v13 = [v12 objectForKey:v11];

          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __24__WPDPipeManager_update__block_invoke_767;
          v16[3] = &unk_26469BAB0;
          void v16[4] = self;
          [v13 enumerateObjectsUsingBlock:v16];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    if ([(WPDManager *)self state] <= 1)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_769);
      }
      __int16 v14 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22316D000, v14, OS_LOG_TYPE_DEFAULT, "WPPM: scalablePipeManagerDidUpdateState: remove all endpointsDict because bluetooth is not ON.", buf, 2u);
      }
      __int16 v15 = [(WPDPipeManager *)self endpointsDict];
      [v15 removeAllObjects];
    }
  }
}

void __24__WPDPipeManager_update__block_invoke_767(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 pipeManager];
  id v4 = [v3 pipe];

  [v2 scalablePipeManager:v5 pipeDidDisconnect:v4 error:0];
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_771_0);
  }
  uint64_t v11 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl(&dword_22316D000, v11, OS_LOG_TYPE_DEFAULT, "WPPM: didRegisterEndpoint %@ (error %@)", (uint8_t *)&v13, 0x16u);
  }
  if (v10)
  {
    uint64_t v12 = [(WPDPipeManager *)self endpointsDict];
    [v12 removeObjectForKey:v9];
  }
}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_773_0);
  }
  uint64_t v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_22316D000, v7, OS_LOG_TYPE_DEFAULT, "WPPM: didUnregisterEndpoint %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v60 = v6;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_775);
  }
  int v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    uint64_t v10 = [v7 name];
    uint64_t v11 = [v7 peer];
    uint64_t v12 = [v11 identifier];
    int v13 = [(WPDPipeManager *)self peerPipesDict];
    id v14 = [(WPDPipeManager *)self connectionInitiators];
    *(_DWORD *)buf = 138413058;
    id v68 = v10;
    __int16 v69 = 2112;
    uint64_t v70 = (uint64_t)v12;
    __int16 v71 = 2112;
    *(void *)id v72 = v13;
    *(_WORD *)&v72[8] = 2112;
    id v73 = v14;
    _os_log_impl(&dword_22316D000, v9, OS_LOG_TYPE_DEFAULT, "WPPM: pipeDidConnect: %@ %@ peer dict %@, initiators: %@", buf, 0x2Au);
  }
  __int16 v15 = [v7 name];
  int v16 = [v15 isEqualToString:@"nearby"];

  uint64_t v17 = v16 ^ 1u;
  long long v18 = [v7 peer];
  long long v19 = [v18 identifier];

  long long v20 = [(WPDPipeManager *)self peerPipesDict];
  uint64_t v21 = [v20 objectForKeyedSubscript:v19];

  if (v21)
  {
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __53__WPDPipeManager_scalablePipeManager_pipeDidConnect___block_invoke_776;
    v63[3] = &unk_26469BAD8;
    id v64 = v7;
    id v65 = v19;
    id v22 = v21;
    id v66 = v22;
    [v22 enumerateObjectsUsingBlock:v63];
  }
  else
  {
    id v22 = [MEMORY[0x263EFF9C0] set];
  }
  int64_t v23 = objc_alloc_init(PipeInfo);
  [(PipeInfo *)v23 setPipe:v7];
  [(PipeInfo *)v23 setNewProtocol:v17];
  [(PipeInfo *)v23 setLocalVersion:1];
  [(PipeInfo *)v23 setLocalSupportedFeatures:1];
  uint64_t v24 = [(WPDPipeManager *)self endpointsDict];
  __int16 v25 = [v7 name];
  unsigned __int8 v26 = [v24 objectForKeyedSubscript:v25];
  uint64_t v27 = [v26 clientUUID];

  id v28 = (void *)v27;
  if (v27)
  {
    id v29 = [(WPDPipeManager *)self connectionInitiators];
    id v30 = [v29 objectForKeyedSubscript:v27];

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_782_0);
    }
    __int16 v31 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v68 = v30;
      __int16 v69 = 2112;
      uint64_t v70 = v27;
      _os_log_impl(&dword_22316D000, v31, OS_LOG_TYPE_DEFAULT, "WPPM: peersSet: %@ for clientUUID: %@", buf, 0x16u);
    }
    if ([v30 containsObject:v19])
    {
      [(PipeInfo *)v23 setConnectionInitiator:1];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_785_0);
      }
      id v32 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22316D000, v32, OS_LOG_TYPE_DEFAULT, "WPPM: set connection initiator", buf, 2u);
      }
    }
  }
  if ([v7 channel])
  {
    id v59 = (void *)v27;
    [v7 channel];
    int fd = os_channel_get_fd();
    uint64_t v34 = [(WPDPipeManager *)self queue];
    dispatch_source_t v35 = dispatch_source_create(MEMORY[0x263EF83E8], fd, 0, v34);
    [(PipeInfo *)v23 setPipeReadSource:v35];

    id v36 = [(PipeInfo *)v23 pipeReadSource];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __53__WPDPipeManager_scalablePipeManager_pipeDidConnect___block_invoke_786;
    handler[3] = &unk_26469ADA0;
    handler[4] = self;
    id v37 = v7;
    id v62 = v37;
    dispatch_source_set_event_handler(v36, handler);

    [v22 addObject:v23];
    id v38 = [(WPDPipeManager *)self peerPipesDict];
    [v38 setObject:v22 forKeyedSubscript:v19];

    id v39 = [(PipeInfo *)v23 pipeReadSource];
    dispatch_resume(v39);

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_789_0);
    }
    int64_t v40 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v41 = v40;
      id v42 = [(PipeInfo *)v23 pipeReadSource];
      uint64_t v43 = [v37 channel];
      int v44 = [v37 reliablePipe];
      *(_DWORD *)buf = 134219008;
      id v68 = v42;
      __int16 v69 = 2048;
      uint64_t v70 = v43;
      __int16 v71 = 1024;
      *(_DWORD *)id v72 = fd;
      *(_WORD *)&v72[4] = 1024;
      *(_DWORD *)&v72[6] = fd;
      LOWORD(v73) = 1024;
      *(_DWORD *)((char *)&v73 + 2) = v44;
      _os_log_impl(&dword_22316D000, v41, OS_LOG_TYPE_DEFAULT, "WPPM: Created pipe read %p for skywalk channel %p fd 0x%x(%d) isreliable? %d", buf, 0x28u);
    }
    [(WPDPipeManager *)self sendChannelData:v23];

    id v28 = v59;
  }
  else
  {
    uint64_t v45 = (void *)voucher_copy();
    [(PipeInfo *)v23 setVoucher:v45];

    __int16 v46 = [v7 input];
    [v46 setDelegate:self];

    uint64_t v47 = [v7 output];
    [v47 setDelegate:self];

    uint64_t v48 = [v7 input];
    __int16 v49 = [MEMORY[0x263EFF9F0] currentRunLoop];
    uint64_t v50 = *MEMORY[0x263EFF478];
    [v48 scheduleInRunLoop:v49 forMode:*MEMORY[0x263EFF478]];

    uint64_t v51 = [v7 output];
    id v52 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v51 scheduleInRunLoop:v52 forMode:v50];

    uint64_t v53 = [v7 input];
    [v53 open];

    id v54 = [v7 output];
    [v54 open];

    [(PipeInfo *)v23 applyQOSOverride];
    [v22 addObject:v23];
    id v55 = [(WPDPipeManager *)self peerPipesDict];
    [v55 setObject:v22 forKeyedSubscript:v19];
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_792);
  }
  int v56 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v57 = v56;
    uint64_t v58 = [(WPDPipeManager *)self peerPipesDict];
    *(_DWORD *)buf = 138412546;
    id v68 = v58;
    __int16 v69 = 2112;
    uint64_t v70 = (uint64_t)v19;
    _os_log_impl(&dword_22316D000, v57, OS_LOG_TYPE_DEFAULT, "WPPM: Pipes after pipeDidConnect %@ to peer %@", buf, 0x16u);
  }
}

void __53__WPDPipeManager_scalablePipeManager_pipeDidConnect___block_invoke_776(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 pipe];
  id v6 = [v5 name];
  id v7 = [*(id *)(a1 + 32) name];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_778);
    }
    id v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      __53__WPDPipeManager_scalablePipeManager_pipeDidConnect___block_invoke_776_cold_1(a1 + 32, v9);
    }
    *a3 = 1;
  }
}

uint64_t __53__WPDPipeManager_scalablePipeManager_pipeDidConnect___block_invoke_786(uint64_t a1)
{
  return [*(id *)(a1 + 32) channelHasData:*(void *)(a1 + 40)];
}

- (void)sendChannelData:(id)a3
{
  id v4 = a3;
  id v5 = [(WPDPipeManager *)self endpointsDict];
  id v6 = [v4 pipe];
  id v7 = [v6 name];
  int v8 = [v5 objectForKeyedSubscript:v7];
  id v9 = [v8 clientUUID];

  uint64_t v10 = [(WPDManager *)self server];
  uint64_t v11 = [v10 getClientForUUID:v9];

  if ([v4 newProtocol])
  {
    if (([v4 versionInfoSent] & 1) == 0)
    {
      [(WPDPipeManager *)self sendVersionInfo:v4];
      goto LABEL_31;
    }
    if ([v4 versionInfoReceived])
    {
      if (![v4 versionInfoSent]
        || ![v4 versionInfoReceived]
        || ([v4 pipeDidConnectSent] & 1) != 0
        || ([v4 useConnectStatusPDU] & 1) != 0)
      {
        [(WPDPipeManager *)self sendRemainingData:v4 wpClient:v11];
        goto LABEL_31;
      }
      if (v11)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_797_0);
        }
        int v13 = WiProxLog;
        if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        __int16 v28 = 0;
        id v14 = (uint8_t *)&v28;
LABEL_19:
        _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "WPPM: sendChannelData: send pipe connect notification", v14, 2u);
LABEL_20:
        objc_msgSend(v4, "setPipeDidConnectSent:", 1, v26);
        __int16 v15 = [v4 pipe];
        int v16 = [v15 peer];
        uint64_t v17 = [v16 identifier];
        [v11 connectedDeviceOverLEPipe:v17];

        goto LABEL_31;
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_800);
      }
      __int16 v25 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        [(WPDPipeManager *)(uint64_t)v9 sendChannelData:v4];
      }
      goto LABEL_30;
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_794);
    }
    long long v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v29 = 0;
      _os_log_impl(&dword_22316D000, v18, OS_LOG_TYPE_DEFAULT, "WPPM: sendChannelData: wait to receive version info", v29, 2u);
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_803);
    }
    uint64_t v12 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22316D000, v12, OS_LOG_TYPE_DEFAULT, "WPPM: sendChannelData: using old protocol, send didConnect if not sent already", buf, 2u);
    }
    if (([v4 pipeDidConnectSent] & 1) == 0)
    {
      if (v11)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_806);
        }
        int v13 = WiProxLog;
        if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        LOWORD(v26) = 0;
        id v14 = (uint8_t *)&v26;
        goto LABEL_19;
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_809);
      }
      long long v19 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        [(WPDPipeManager *)(uint64_t)v9 sendChannelData:v4];
      }
LABEL_30:
      long long v20 = [v4 pipe];
      uint64_t v21 = [v20 name];
      id v22 = [v4 pipe];
      int64_t v23 = [v22 peer];
      uint64_t v24 = [v23 identifier];
      [(WPDPipeManager *)self invalidatePipeInfo:v21 forPeer:v24];
    }
  }
LABEL_31:
}

- (void)channelHasData:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v4 = [(WPDPipeManager *)self peerPipesDict];
  id v5 = [v35 peer];
  id v6 = [v5 identifier];
  uint64_t v34 = [v4 objectForKeyedSubscript:v6];

  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy__5;
  uint64_t v48 = __Block_byref_object_dispose__5;
  id v49 = 0;
  if (v34)
  {
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __33__WPDPipeManager_channelHasData___block_invoke_812;
    v41[3] = &unk_26469BA10;
    id v7 = v35;
    id v42 = v7;
    uint64_t v43 = &v44;
    [v34 enumerateObjectsUsingBlock:v41];

    if (v45[5])
    {
      [v7 channel];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      os_channel_ring_id();
      os_channel_rx_ring();
      if (os_channel_get_next_slot())
      {
        *(void *)&long long v8 = 138412290;
        long long v33 = v8;
        do
        {
          ++channelHasData__rxCount;
          id v9 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", (void)v55, WORD1(v54), v33);
          if (WPLogInitOnce != -1) {
            dispatch_once(&WPLogInitOnce, &__block_literal_global_817_0);
          }
          uint64_t v10 = (id)WiProxLog;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v25 = [v9 length];
            uint64_t v26 = [v7 name];
            *(_DWORD *)buf = 134218242;
            uint64_t v51 = v25;
            __int16 v52 = 2112;
            uint64_t v53 = v26;
            _os_log_debug_impl(&dword_22316D000, v10, OS_LOG_TYPE_DEBUG, "WPPM: channelHasData Received %lu bytes over skywalk %@", buf, 0x16u);
          }
          if ([(id)v45[5] newProtocol])
          {
            uint64_t v11 = v45[5];
            id v12 = v9;
            -[WPDPipeManager handleIncomingPipeData:data:dataSize:](self, "handleIncomingPipeData:data:dataSize:", v11, [v12 bytes], objc_msgSend(v12, "length"));
          }
          else
          {
            int v13 = [(WPDPipeManager *)self endpointsDict];
            id v14 = [v7 name];
            __int16 v15 = [v13 objectForKeyedSubscript:v14];
            int v16 = [v15 clientUUID];

            uint64_t v17 = [v7 peer];
            long long v18 = [v17 identifier];

            if (v16 && v18)
            {
              long long v19 = [(WPDManager *)self server];
              long long v20 = [v19 getClientForUUID:v16];

              if (v20)
              {
                uint64_t v21 = [(WPDPipeManager *)self queue];
                block[0] = MEMORY[0x263EF8330];
                block[1] = 3221225472;
                block[2] = __33__WPDPipeManager_channelHasData___block_invoke_818;
                block[3] = &unk_26469B9E8;
                id v37 = v20;
                id v38 = v9;
                id v39 = v7;
                id v40 = v18;
                dispatch_async(v21, block);
              }
              else
              {
                if (WPLogInitOnce != -1) {
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_821);
                }
                int64_t v23 = WiProxLog;
                if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v33;
                  uint64_t v51 = (uint64_t)v16;
                  _os_log_error_impl(&dword_22316D000, v23, OS_LOG_TYPE_ERROR, "WPPM: channelHasData failure: client %@ is not found", buf, 0xCu);
                }
              }
            }
            else
            {
              if (WPLogInitOnce != -1) {
                dispatch_once(&WPLogInitOnce, &__block_literal_global_824);
              }
              id v22 = WiProxLog;
              if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v51 = (uint64_t)v16;
                __int16 v52 = 2112;
                uint64_t v53 = v18;
                _os_log_error_impl(&dword_22316D000, v22, OS_LOG_TYPE_ERROR, "WPPM: channelHasData failure: clientUUID %@ or identfier %@ is invalid", buf, 0x16u);
              }
            }
          }
          uint64_t next_slot = os_channel_get_next_slot();
        }
        while (next_slot);
      }
      os_channel_advance_slot();
      if (channelHasData__rxCount > 31 || os_channel_available_slot_count() <= 1)
      {
        channelHasData__rxCount = 0;
        os_channel_sync();
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_814_0);
      }
      id v30 = (id)WiProxLog;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        __int16 v31 = [v7 peer];
        id v32 = [v31 identifier];
        -[WPDPipeManager channelHasData:](v32, (uint64_t)&v54, v30, v31);
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_811_0);
    }
    uint64_t v27 = (id)WiProxLog;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      __int16 v28 = [v35 peer];
      id v29 = [v28 identifier];
      -[WPDPipeManager channelHasData:](v29, (uint64_t)&v54, v27, v28);
    }
  }
  _Block_object_dispose(&v44, 8);
}

void __33__WPDPipeManager_channelHasData___block_invoke_812(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  id v6 = [v10 pipe];
  id v7 = [v6 name];
  long long v8 = [*(id *)(a1 + 32) name];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __33__WPDPipeManager_channelHasData___block_invoke_818(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) xpcConnectionForClient];
  v2 = [v5 remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) name];
  [v2 receivedData:v3 fromEndpoint:v4 forPeripheral:*(void *)(a1 + 56)];
}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_826);
  }
  uint64_t v11 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    int v13 = [v9 peer];
    id v14 = [v13 identifier];
    __int16 v15 = [(WPDPipeManager *)self peerPipesDict];
    int v16 = [(WPDPipeManager *)self connectionInitiators];
    int v37 = 138413314;
    id v38 = v14;
    __int16 v39 = 2112;
    id v40 = v9;
    __int16 v41 = 2112;
    id v42 = v10;
    __int16 v43 = 2112;
    uint64_t v44 = v15;
    __int16 v45 = 2112;
    uint64_t v46 = v16;
    _os_log_impl(&dword_22316D000, v12, OS_LOG_TYPE_DEFAULT, "WPPM: pipeDidDisconnect %@ %@ (error %@), pipes %@, set: %@", (uint8_t *)&v37, 0x34u);
  }
  uint64_t v17 = [v9 name];
  long long v18 = [v9 peer];
  long long v19 = [v18 identifier];
  [(WPDPipeManager *)self invalidatePipeInfo:v17 forPeer:v19];

  long long v20 = [(WPDPipeManager *)self endpointsDict];
  uint64_t v21 = [v9 name];
  id v22 = [v20 objectForKeyedSubscript:v21];
  int64_t v23 = [v22 clientUUID];

  if (v23)
  {
    uint64_t v24 = [(WPDPipeManager *)self connectionInitiators];
    uint64_t v25 = [v24 objectForKeyedSubscript:v23];

    uint64_t v26 = [v9 peer];
    uint64_t v27 = [v26 identifier];
    int v28 = [v25 containsObject:v27];

    if (v28)
    {
      id v29 = [v9 peer];
      id v30 = [v29 identifier];
      [v25 removeObject:v30];

      __int16 v31 = [(WPDPipeManager *)self connectionInitiators];
      [v31 setObject:v25 forKeyedSubscript:v23];
    }
    id v32 = [(WPDManager *)self server];
    long long v33 = [v32 getClientForUUID:v23];

    if (v33)
    {
      uint64_t v34 = [v9 peer];
      id v35 = [v34 identifier];
      [v33 disconnectedDeviceOverLEPipe:v35 withError:v10];
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_829);
      }
      id v36 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDPipeManager scalablePipeManager:pipeDidDisconnect:error:]((uint64_t)v23, v36, v9);
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_832);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPDPipeManager scalablePipeManager:pipeDidDisconnect:error:]();
    }
  }
}

- (void)invalidatePipeInfo:(id)a3 forPeer:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = [(WPDPipeManager *)self peerPipesDict];
    id v10 = [v9 objectForKeyedSubscript:v8];

    if (v10)
    {
      uint64_t v21 = 0;
      id v22 = &v21;
      uint64_t v23 = 0x3032000000;
      uint64_t v24 = __Block_byref_object_copy__5;
      uint64_t v25 = __Block_byref_object_dispose__5;
      id v26 = 0;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __45__WPDPipeManager_invalidatePipeInfo_forPeer___block_invoke_835;
      long long v18 = &unk_26469BA10;
      id v19 = v6;
      long long v20 = &v21;
      [v10 enumerateObjectsUsingBlock:&v15];
      if (v22[5])
      {
        objc_msgSend(v10, "removeObject:", v15, v16, v17, v18);
        if ([v10 count])
        {
          uint64_t v11 = [(WPDPipeManager *)self peerPipesDict];
          [v11 setObject:v10 forKeyedSubscript:v8];
        }
        else
        {
          uint64_t v11 = [(WPDPipeManager *)self peerPipesDict];
          [v11 removeObjectForKey:v8];
        }

        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_840);
        }
        int v13 = (id)WiProxLog;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [(WPDPipeManager *)self peerPipesDict];
          *(_DWORD *)buf = 138412546;
          int v28 = v14;
          __int16 v29 = 2112;
          id v30 = v10;
          _os_log_impl(&dword_22316D000, v13, OS_LOG_TYPE_DEFAULT, "WPPM: invalidatePipeInfo: current peer pipes %@, pipeInfoSet: %@", buf, 0x16u);
        }
      }
      else
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_837);
        }
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDPipeManager invalidatePipeInfo:forPeer:]();
        }
      }

      _Block_object_dispose(&v21, 8);
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_834_0);
      }
      id v12 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDPipeManager invalidatePipeInfo:forPeer:]((uint64_t)v8, v12, self);
      }
    }
  }
}

void __45__WPDPipeManager_invalidatePipeInfo_forPeer___block_invoke_835(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v10 = v6;
  id v8 = [v6 pipe];
  id v9 = [v8 name];
  LODWORD(v7) = [v7 isEqualToString:v9];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)_signpostBegin
{
  uint64_t v3 = (id)WiProxLog;
  id v4 = v3;
  os_signpost_id_t wpPipeDataSignPostID = self->_wpPipeDataSignPostID;
  if (wpPipeDataSignPostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_22316D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, wpPipeDataSignPostID, "receivedPayload", (const char *)&unk_2231D26A1, v6, 2u);
  }
}

- (void)_signpostEnd
{
  uint64_t v3 = (id)WiProxLog;
  id v4 = v3;
  os_signpost_id_t wpPipeDataSignPostID = self->_wpPipeDataSignPostID;
  if (wpPipeDataSignPostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_22316D000, v4, OS_SIGNPOST_INTERVAL_END, wpPipeDataSignPostID, "receivedPayload", (const char *)&unk_2231D26A1, v6, 2u);
  }
}

- (OS_dispatch_queue)queue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (CBScalablePipeManager)pipeManager
{
  return (CBScalablePipeManager *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPipeManager:(id)a3
{
}

- (NSMutableDictionary)endpointsDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEndpointsDict:(id)a3
{
}

- (NSMutableDictionary)peerPipesDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPeerPipesDict:(id)a3
{
}

- (NSMutableDictionary)connectionInitiators
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConnectionInitiators:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionInitiators, 0);
  objc_storeStrong((id *)&self->_peerPipesDict, 0);
  objc_storeStrong((id *)&self->_endpointsDict, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_destroyWeak((id *)&self->_queue);
}

- (void)sendData:forPeer:forClient:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "WPPM: sendData failure: client %@ not found to send data to", v2, v3, v4, v5, v6);
}

- (void)sendData:forPeer:forClient:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "WPPM: %@", v2, v3, v4, v5, v6);
}

- (void)sendData:(uint64_t)a1 forPeer:(uint64_t)a2 forClient:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_14_0(&dword_22316D000, a2, a3, "WPPM: sendData: txLeftToSend %lu", (uint8_t *)a1);
}

- (void)sendData:(uint64_t)a3 forPeer:(uint64_t)a4 forClient:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendData:(uint64_t)a3 forPeer:(os_log_t)log forClient:.cold.5(unsigned __int16 a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2048;
  *(void *)(buf + 10) = a3;
  _os_log_debug_impl(&dword_22316D000, log, OS_LOG_TYPE_DEBUG, "WPPM: sendData: txTLen %d, txLen %lu", buf, 0x12u);
}

- (void)sendData:forPeer:forClient:.cold.6()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_22316D000, v0, OS_LOG_TYPE_DEBUG, "WPPM: sendData: Initialize pipe data transfer object", v1, 2u);
}

- (void)sendData:forPeer:forClient:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "WPPM: client endpoints: %@", v2, v3, v4, v5, v6);
}

- (void)stream:handleEvent:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "WPPM: handleEvent: Pipe Info is nil", v2, v3, v4, v5, v6);
}

- (void)stream:handleEvent:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "WPPM: handleEvent: output stream is not opened?!", v2, v3, v4, v5, v6);
}

- (void)stream:(os_log_t)log handleEvent:.cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = 0;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_22316D000, log, OS_LOG_TYPE_ERROR, "WPPM: input stream: Failed to read data from pipe with error %ld %@", buf, 0x16u);
}

- (void)stream:handleEvent:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "WPPM: handleEvent: input stream is not opened!!", v2, v3, v4, v5, v6);
}

- (void)stream:handleEvent:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "WPPM: handleEvent: input/output stream error occurred - remove from list", v2, v3, v4, v5, v6);
}

- (void)handleIncomingPipeData:data:dataSize:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "WPPM: handleIncomingPipeData: bogus data received - ignore!! %@", v2, v3, v4, v5, v6);
}

- (void)receivedPayload:(void *)a1 data:(void *)a2 dataSize:.cold.1(void *a1, void *a2)
{
  id v4 = a1;
  [(id)OUTLINED_FUNCTION_15() rxCurrentDataSize];
  uint64_t v5 = [a2 rxData];
  [v5 length];
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_1_2(&dword_22316D000, v6, v7, "WPPM: receivedPayload: data size expected: %d, but received: %lu", v8, v9, v10, v11, v12);
}

- (void)receivedPayload:(void *)a1 data:(void *)a2 dataSize:.cold.2(void *a1, void *a2)
{
  id v4 = a1;
  [(id)OUTLINED_FUNCTION_15() rxTotalLenToReceive];
  uint64_t v5 = [a2 rxTotalDataToReceive];
  [v5 length];
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_1_2(&dword_22316D000, v6, v7, "WPPM: receivedPayload: FIRST PACKET - data size expected: %d but received %lu", v8, v9, v10, v11, v12);
}

- (void)receivedPayload:(void *)a1 data:(void *)a2 dataSize:.cold.3(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  id v4 = [a2 rxTotalDataWithLen];
  uint64_t v5 = [v4 length];
  uint64_t v6 = [a2 rxData];
  uint64_t v7 = [v6 length];
  uint64_t v8 = [a2 rxData];
  int v9 = 134218498;
  uint64_t v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  id v14 = v8;
  _os_log_debug_impl(&dword_22316D000, v3, OS_LOG_TYPE_DEBUG, "WPPM: receivedPayload: FIRST PACKET txTotalDataLen (%lu) rxData (%lu) %@", (uint8_t *)&v9, 0x20u);
}

- (void)receivedPayload:data:dataSize:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "WPPM: receivedPayload of len %ld", v2, v3, v4, v5, v6);
}

- (void)receivedAck:data:dataSize:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "WPPM: receivedAck: Data transfer object is nil", v2, v3, v4, v5, v6);
}

- (void)receivedAck:(void *)a1 data:dataSize:.cold.2(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_15() localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_1(&dword_22316D000, v4, v5, "WPPM: receivedAck: %@", v6, v7, v8, v9, v10);
}

- (void)receivedAck:(void *)a1 data:dataSize:.cold.3(void *a1)
{
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_10_1() txTotalLenToSend];
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_19_0(&dword_22316D000, v3, v4, "WPPM: receivedAck: received payload len %d doesn't match with sender payload len %d", v5, v6, v7, v8, v9);
}

- (void)receivedAck:(void *)a1 data:dataSize:.cold.4(void *a1)
{
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_10_1() txSeqNum];
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_19_0(&dword_22316D000, v3, v4, "WPPM: receivedAck: Received seqNum %d doesn't match with sender seqNum %d", v5, v6, v7, v8, v9);
}

- (void)receivedAck:data:dataSize:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22316D000, v0, v1, "WPPM: receivedAck: dataSize %ld", v2, v3, v4, v5, v6);
}

- (void)receivedError:data:dataSize:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "WPPM: receivedError: Data transfer object is nil", v2, v3, v4, v5, v6);
}

- (void)receivedError:(void *)a1 data:dataSize:.cold.2(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_15() localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_1(&dword_22316D000, v4, v5, "WPPM: receivedError: %@", v6, v7, v8, v9, v10);
}

- (void)receivedError:(unsigned __int8)a1 data:(uint64_t)a2 dataSize:(os_log_t)log .cold.3(unsigned __int8 a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_22316D000, log, OS_LOG_TYPE_ERROR, "WPPM: receivedError: error: %d, dataSize: %ld", (uint8_t *)v3, 0x12u);
}

- (void)sendAck:errorCode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "WPPM: sendAck: pipe data transfer obejct is nil", v2, v3, v4, v5, v6);
}

- (void)sendAck:(uint64_t)a3 errorCode:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendAck:errorCode:.cold.3()
{
  OUTLINED_FUNCTION_15_0();
  id v3 = v2;
  [(id)OUTLINED_FUNCTION_10_1() streamStatus];
  uint8_t v10 = [v0 streamError];
  OUTLINED_FUNCTION_18_0(&dword_22316D000, v4, v5, "WPPM: sendAck: bytes written %ld (expected 6) with status %ld error %@", v6, v7, v8, v9, 2u);
}

- (void)sendRemainingData:wpClient:.cold.1()
{
  OUTLINED_FUNCTION_15_0();
  id v2 = v1;
  [(id)OUTLINED_FUNCTION_10_1() length];
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_7_0(&dword_22316D000, v3, v4, "WPPM: sendRemainingData: fail to send remaining data %lu with error %ld", v5, v6, v7, v8, v9);
}

- (void)writeDataToPipe:(void *)a1 pipe:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_15() output];
  [v3 streamStatus];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_1(&dword_22316D000, v4, v5, "WPPM: writeDataToPipe: output stream is not opened %lu", v6, v7, v8, v9, v10);
}

- (void)writeDataToPipe:pipe:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22316D000, v0, v1, "WPPM: writeDataToPipe slot is nil", v2, v3, v4, v5, v6);
}

- (void)writeDataToPipe:pipe:.cold.3()
{
  OUTLINED_FUNCTION_15_0();
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = v1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_10_1() name];
  OUTLINED_FUNCTION_13_0();
  _os_log_debug_impl(&dword_22316D000, v0, OS_LOG_TYPE_DEBUG, "WPPM: writeDataToPipe: %@ send (%lu) data over skywalk", v4, 0x16u);
}

void __53__WPDPipeManager_scalablePipeManager_pipeDidConnect___block_invoke_776_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_10_1() name];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_18_0(&dword_22316D000, v5, v6, "WPPM: pipeDidConnect: pipe %@ already exist for peer %@, Peer pipe set %@", v7, v8, v9, v10, v11);
}

- (void)sendChannelData:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 pipe];
  uint64_t v6 = [v5 peer];
  uint64_t v7 = [v6 identifier];
  uint64_t v8 = [a3 pipe];
  uint64_t v9 = [v8 name];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_16_0(&dword_22316D000, v10, v11, "WPPM: sendChannelData: Client %@ not found for peer %@ and Endpoint %@", v12, v13, v14, v15, v16);
}

- (void)channelHasData:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_14_0(&dword_22316D000, a2, a3, "WPPM: channelHasData - no peerPipeSet found for peer %@", (uint8_t *)a2);
}

- (void)channelHasData:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_14_0(&dword_22316D000, a2, a3, "WPPM: channelHasData - no pipeInfo found for peer %@", (uint8_t *)a2);
}

- (void)scalablePipeManager:pipeDidDisconnect:error:.cold.1()
{
  OUTLINED_FUNCTION_15_0();
  id v3 = v2;
  [(id)OUTLINED_FUNCTION_10_1() name];
  objc_claimAutoreleasedReturnValue();
  id v4 = [(id)OUTLINED_FUNCTION_15() endpointsDict];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7_0(&dword_22316D000, v5, v6, "WPPM: pipeDidDisconnect failure: No client exist for Endpoint %@, current endpointsDict %@", v7, v8, v9, v10, v11);
}

- (void)scalablePipeManager:(uint64_t)a1 pipeDidDisconnect:(void *)a2 error:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 name];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7_0(&dword_22316D000, v6, v7, "WPPM: pipeDidDisconnect failure: Client %@ not found for Endpoint %@", v8, v9, v10, v11, v12);
}

- (void)invalidatePipeInfo:(void *)a3 forPeer:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint64_t v6 = [a3 peerPipesDict];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_22316D000, v5, OS_LOG_TYPE_ERROR, "WPPM: invalidatePipeInfo: No PipeInfo set found for peer %@ in %@", (uint8_t *)&v7, 0x16u);
}

- (void)invalidatePipeInfo:forPeer:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_22316D000, v0, v1, "WPPM: invalidatePipeInfo: pipe not found which is matching endpoint name %@", v2, v3, v4, v5, v6);
}

@end