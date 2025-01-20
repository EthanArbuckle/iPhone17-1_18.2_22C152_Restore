@interface PBBridgeIDSServiceDelegate
- (BOOL)connectionStateWithDevices:(id)a3 accounts:(id)a4;
- (BOOL)isTinkerPairing;
- (BOOL)listeningForIDSSentMessages;
- (BOOL)reportConnectionForService:(id)a3 accounts:(id)a4 devices:(id)a5;
- (BOOL)setupTransactionActive;
- (BOOL)shouldSuppressTransportReachabilityTimeout;
- (IDSService)service;
- (NSMutableDictionary)inflightMessages;
- (NSMutableDictionary)pendingMessages;
- (NSTimer)transportReachabilityTimer;
- (id)_sendProtoBuf:(id)a3 service:(id)a4 priority:(int64_t)a5 responseIdentifier:(id)a6 expectsResponse:(BOOL)a7;
- (id)customDescriptionOfMessageType:(unsigned __int16)a3;
- (id)sendProtoBuf:(id)a3 service:(id)a4 priority:(int64_t)a5 responseIdentifier:(id)a6 expectsResponse:(BOOL)a7 retryCount:(int64_t)a8 retryInterval:(double)a9;
- (id)serviceIdentifier;
- (void)_postMessageSendFailureForErrorMessage:(id)a3;
- (void)beginSetupTransaction;
- (void)cancelReachabilityTimer;
- (void)checkReachability;
- (void)endSetupTransaction;
- (void)resetTransportReachabilityTimer;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setInflightMessages:(id)a3;
- (void)setListeningForIDSSentMessages:(BOOL)a3;
- (void)setPendingMessages:(id)a3;
- (void)setService:(id)a3;
- (void)setShouldSuppressTransportReachabilityTimeout:(BOOL)a3;
- (void)setTinkerPairing:(BOOL)a3;
- (void)setTransportReachabilityTimer:(id)a3;
- (void)setupServiceMessageSelectorMappings;
- (void)startReachabilityTimer;
- (void)stopListeningForIDSSentMessages;
- (void)transportBecameReachable;
- (void)transportBecameUnreachable;
- (void)updateConnectivityTimer:(BOOL)a3;
@end

@implementation PBBridgeIDSServiceDelegate

- (void)beginSetupTransaction
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C445000, log, OS_LOG_TYPE_ERROR, "Error: already within a setup transaction!", v1, 2u);
}

- (void)endSetupTransaction
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_21C445000, v3, OS_LOG_TYPE_DEFAULT, "ENDED TRANSACTION!", (uint8_t *)&v10, 2u);
  }

  v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    int v10 = 138412546;
    v11 = service;
    __int16 v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "Destroyed Service (%@) and removed (%@) as delegate", (uint8_t *)&v10, 0x16u);
  }

  [(IDSService *)self->_service removeDelegate:self];
  v6 = self->_service;
  self->_service = 0;

  [(NSMutableDictionary *)self->_inflightMessages removeAllObjects];
  inflightMessages = self->_inflightMessages;
  self->_inflightMessages = 0;

  [(NSMutableDictionary *)self->_pendingMessages removeAllObjects];
  pendingMessages = self->_pendingMessages;
  self->_pendingMessages = 0;

  [(NSTimer *)self->_transportReachabilityTimer invalidate];
  transportReachabilityTimer = self->_transportReachabilityTimer;
  self->_transportReachabilityTimer = 0;

  self->_shouldSuppressTransportReachabilityTimeout = 0;
  self->_listeningForIDSSentMessages = 0;
}

- (BOOL)setupTransactionActive
{
  return self->_service != 0;
}

- (void)setupServiceMessageSelectorMappings
{
}

- (id)serviceIdentifier
{
  return 0;
}

- (void)_postMessageSendFailureForErrorMessage:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_listeningForIDSSentMessages)
  {
    if (PBIsInternalInstall())
    {
      v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
      char v6 = [v5 BOOLForKey:@"SuppressMessageFailError"];

      if ((v6 & 1) == 0)
      {
        v7 = [MEMORY[0x263F08A00] defaultCenter];
        v9 = @"PBBridgeMessageError";
        v10[0] = v4;
        v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
        [v7 postNotificationName:@"PBBridgeMessageFailedToSend" object:0 userInfo:v8];
      }
    }
  }
}

- (id)_sendProtoBuf:(id)a3 service:(id)a4 priority:(int64_t)a5 responseIdentifier:(id)a6 expectsResponse:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a6;
  uint64_t v14 = v13;
  if (self->_service)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __96__PBBridgeIDSServiceDelegate__sendProtoBuf_service_priority_responseIdentifier_expectsResponse___block_invoke;
    v18[3] = &unk_264401880;
    v19 = v13;
    id v20 = v12;
    v21 = self;
    v15 = PBProtoSend(a4, v20, a5, v19, v7, v18);

    v16 = v19;
  }
  else
  {
    v16 = pbb_setupflow_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[PBBridgeIDSServiceDelegate _sendProtoBuf:service:priority:responseIdentifier:expectsResponse:]((uint64_t)v14, (uint64_t)v12, v16);
    }
    v15 = 0;
  }

  return v15;
}

void __96__PBBridgeIDSServiceDelegate__sendProtoBuf_service_priority_responseIdentifier_expectsResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __96__PBBridgeIDSServiceDelegate__sendProtoBuf_service_priority_responseIdentifier_expectsResponse___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }

  v5 = *(void **)(a1 + 48);
  char v6 = [NSString stringWithFormat:@"Failed to Send Message (Pre-Send): %@", *(void *)(a1 + 40)];
  [v5 _postMessageSendFailureForErrorMessage:v6];
}

- (id)sendProtoBuf:(id)a3 service:(id)a4 priority:(int64_t)a5 responseIdentifier:(id)a6 expectsResponse:(BOOL)a7 retryCount:(int64_t)a8 retryInterval:(double)a9
{
  BOOL v11 = a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  v19 = [(PBBridgeIDSServiceDelegate *)self _sendProtoBuf:v16 service:v17 priority:a5 responseIdentifier:v18 expectsResponse:v11];
  id v20 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v21 = [v20 BOOLForKey:@"SuppressMessageRetry"];

  if ((v21 & 1) == 0 && v19)
  {
    v22 = self;
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    v33 = __120__PBBridgeIDSServiceDelegate_sendProtoBuf_service_priority_responseIdentifier_expectsResponse_retryCount_retryInterval___block_invoke;
    v34 = &unk_2644018A8;
    v35 = v22;
    id v23 = v16;
    id v36 = v23;
    id v37 = v17;
    int64_t v39 = a5;
    id v38 = v18;
    BOOL v40 = v11;
    v24 = v22;
    v25 = (void *)MEMORY[0x21D4A74C0](&v31);
    inflightMessages = v24->_inflightMessages;
    uint64_t v27 = objc_msgSend(v23, "type", v31, v32, v33, v34);
    double v28 = 0.0;
    if (a9 >= 0.0) {
      double v28 = a9;
    }
    id v29 = +[PBBridgeIDSMessageInstance newMessageInstanceOfType:v27 retryCount:a8 & ~(a8 >> 63) retryInterval:v25 withAction:v28];
    [(NSMutableDictionary *)inflightMessages setObject:v29 forKey:v19];
  }
  return v19;
}

id __120__PBBridgeIDSServiceDelegate_sendProtoBuf_service_priority_responseIdentifier_expectsResponse_retryCount_retryInterval___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _sendProtoBuf:*(void *)(a1 + 40) service:*(void *)(a1 + 48) priority:*(void *)(a1 + 64) responseIdentifier:*(void *)(a1 + 56) expectsResponse:*(unsigned __int8 *)(a1 + 72)];
}

- (BOOL)connectionStateWithDevices:(id)a3 accounts:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
  v8 = "WatchCredentialIngestion:]";
  if (v7)
  {
    uint64_t v9 = v7;
    id v24 = v5;
    uint64_t v10 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v13 = pbb_setupflow_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = [v12 canSend];
          *(_DWORD *)buf = 138412546;
          id v37 = v12;
          __int16 v38 = 1024;
          int v39 = v14;
          _os_log_impl(&dword_21C445000, v13, OS_LOG_TYPE_DEFAULT, "account: %@ canSend: %d", buf, 0x12u);
        }

        if ([v12 canSend])
        {
          char v15 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    char v15 = 0;
LABEL_13:
    id v5 = v24;
    v8 = "-[PBBridgeCompanionController acknowledgeBuysOnWatchCredentialIngestion:]" + 47;
  }
  else
  {
    char v15 = 0;
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v17)
  {
    char v25 = v15;
    uint64_t v18 = *(void *)v28;
    int v26 = *((void *)v8 + 106);
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v16);
        }
        id v20 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        int v21 = [v20 isNearby];
        v22 = pbb_setupflow_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v26;
          id v37 = v20;
          __int16 v38 = 1024;
          int v39 = v21;
          _os_log_impl(&dword_21C445000, v22, OS_LOG_TYPE_DEFAULT, "device: %@ isNearby: %d", buf, 0x12u);
        }

        if (v21)
        {
          LOBYTE(v17) = 1;
          goto LABEL_27;
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v17) {
        continue;
      }
      break;
    }
LABEL_27:
    char v15 = v25;
  }

  return v15 & v17;
}

- (void)checkReachability
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(IDSService *)self->_service pb_mineTinkerDevices];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
      if ([v8 isDefaultPairedDevice]) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    char v9 = [v8 isNearby];

    if (v9) {
      return;
    }
  }
  else
  {
LABEL_9:
  }
  if (self->_service) {
    [(PBBridgeIDSServiceDelegate *)self startReachabilityTimer];
  }
}

- (void)startReachabilityTimer
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!self->_transportReachabilityTimer && !self->_shouldSuppressTransportReachabilityTimeout)
  {
    v8 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel_transportBecameUnreachable selector:0 userInfo:0 repeats:60.0];
    transportReachabilityTimer = self->_transportReachabilityTimer;
    self->_transportReachabilityTimer = v8;

    long long v10 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v10 addTimer:self->_transportReachabilityTimer forMode:*MEMORY[0x263EFF588]];

    id v3 = pbb_setupflow_log();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    LOWORD(v11) = 0;
    uint64_t v5 = "Started reachability timer.";
    uint64_t v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_8;
  }
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_shouldSuppressTransportReachabilityTimeout) {
      uint64_t v4 = @"YES";
    }
    else {
      uint64_t v4 = @"NO";
    }
    int v11 = 138543362;
    long long v12 = v4;
    uint64_t v5 = "Not starting reachability timer. (is suppressed? %{public}@)";
    uint64_t v6 = v3;
    uint32_t v7 = 12;
LABEL_8:
    _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, v7);
  }
LABEL_9:
}

- (void)cancelReachabilityTimer
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = pbb_setup_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[PBBridgeIDSServiceDelegate cancelReachabilityTimer]";
    _os_log_impl(&dword_21C445000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(NSTimer *)self->_transportReachabilityTimer invalidate];
  transportReachabilityTimer = self->_transportReachabilityTimer;
  self->_transportReachabilityTimer = 0;
}

- (void)resetTransportReachabilityTimer
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = pbb_setup_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[PBBridgeIDSServiceDelegate resetTransportReachabilityTimer]";
    _os_log_impl(&dword_21C445000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(PBBridgeIDSServiceDelegate *)self cancelReachabilityTimer];
  [(PBBridgeIDSServiceDelegate *)self startReachabilityTimer];
}

- (void)setShouldSuppressTransportReachabilityTimeout:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = pbb_setup_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"NO";
    if (v3) {
      uint64_t v6 = @"YES";
    }
    int v7 = 136315394;
    v8 = "-[PBBridgeIDSServiceDelegate setShouldSuppressTransportReachabilityTimeout:]";
    __int16 v9 = 2112;
    long long v10 = v6;
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%s:%@", (uint8_t *)&v7, 0x16u);
  }

  if (self->_shouldSuppressTransportReachabilityTimeout != v3)
  {
    self->_shouldSuppressTransportReachabilityTimeout = v3;
    if (v3) {
      [(PBBridgeIDSServiceDelegate *)self cancelReachabilityTimer];
    }
    else {
      [(PBBridgeIDSServiceDelegate *)self checkReachability];
    }
  }
}

- (void)transportBecameReachable
{
  v2 = pbb_setupflow_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_21C445000, v2, OS_LOG_TYPE_DEFAULT, "Transport became reachable.", v3, 2u);
  }
}

- (void)transportBecameUnreachable
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C445000, log, OS_LOG_TYPE_ERROR, "Error: Transport is unreachable!", v1, 2u);
}

- (void)stopListeningForIDSSentMessages
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[PBBridgeIDSServiceDelegate stopListeningForIDSSentMessages]";
  _os_log_error_impl(&dword_21C445000, log, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v1, 0xCu);
}

- (void)updateConnectivityTimer:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__PBBridgeIDSServiceDelegate_updateConnectivityTimer___block_invoke;
  v3[3] = &unk_264401498;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __54__PBBridgeIDSServiceDelegate_updateConnectivityTimer___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 8))
  {
    if (*(unsigned char *)(a1 + 40) || !*(void *)(result + 16))
    {
      [(id)result cancelReachabilityTimer];
      uint64_t v3 = *(void **)(a1 + 32);
      return [v3 transportBecameReachable];
    }
    else
    {
      return [(id)result startReachabilityTimer];
    }
  }
  return result;
}

- (BOOL)reportConnectionForService:(id)a3 accounts:(id)a4 devices:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(PBBridgeIDSServiceDelegate *)self connectionStateWithDevices:v10 accounts:v9];
  long long v12 = pbb_setupflow_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"NO";
    int v15 = 138413058;
    if (v11) {
      uint64_t v13 = @"YES";
    }
    id v16 = v13;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_21C445000, v12, OS_LOG_TYPE_DEFAULT, "Connected: %@ (Service: %@ Accounts: %@ Devices: %@)", (uint8_t *)&v15, 0x2Au);
  }

  return v11;
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = pbb_setupflow_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "Accounts Changed!", v10, 2u);
  }

  id v9 = objc_msgSend(v7, "pb_mineTinkerDevices");
  [(PBBridgeIDSServiceDelegate *)self reportConnectionForService:v7 accounts:v6 devices:v9];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a3;
  id v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "Devices Changed!", v10, 2u);
  }

  id v7 = objc_msgSend(v5, "pb_mineTinkerDevices");
  id v8 = [v5 accounts];
  BOOL v9 = [(PBBridgeIDSServiceDelegate *)self reportConnectionForService:v5 accounts:v8 devices:v7];

  [(PBBridgeIDSServiceDelegate *)self updateConnectivityTimer:v9];
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  id v11 = a7;
  long long v12 = pbb_setupflow_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    int v13 = 138412802;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_fault_impl(&dword_21C445000, v12, OS_LOG_TYPE_FAULT, "incomingUnhandledProtobuf: %@ from: %@ context: %@", (uint8_t *)&v13, 0x20u);
  }
}

- (id)customDescriptionOfMessageType:(unsigned __int16)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Type: %d", a3);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  long long v12 = (__CFString *)a3;
  double v13 = COERCE_DOUBLE(a4);
  id v14 = (__CFString *)a5;
  id v15 = a7;
  id v16 = [(NSMutableDictionary *)self->_inflightMessages objectForKey:v14];
  if (!v16)
  {
    __int16 v17 = pbb_setupflow_log();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 138413058;
    int v39 = v14;
    __int16 v40 = 2112;
    uint64_t v41 = v12;
    __int16 v42 = 2112;
    double v43 = v13;
    __int16 v44 = 2112;
    double v45 = *(double *)&v15;
    uint64_t v19 = "Unknown message ID: %@ (%@ -- %@) Error: %@. Not taking any action.";
LABEL_16:
    _os_log_error_impl(&dword_21C445000, v17, OS_LOG_TYPE_ERROR, v19, buf, 0x2Au);
    goto LABEL_25;
  }
  if (!v15 && a6)
  {
    kdebug_trace();
    __int16 v17 = [(NSMutableDictionary *)self->_pendingMessages objectForKey:v14];
    if ([v16 typeID] == 0xFFFF)
    {
      if ([v17 typeID] == 0xFFFF)
      {
        int v26 = @"UNACCOUNTED MESSAGE!! Please file with Pepper Pairing!";
        goto LABEL_20;
      }
      id v18 = v17;
    }
    else
    {
      id v18 = v16;
    }
    int v26 = [(PBBridgeIDSServiceDelegate *)self customDescriptionOfMessageType:[v18 typeID]];
LABEL_20:
    double Current = CFAbsoluteTimeGetCurrent();
    long long v28 = [v16 sentAbsoluteTime];
    [v28 doubleValue];
    double v30 = v29;

    if (PBLogPerformanceMetrics())
    {
      long long v31 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      [v31 addMeasurement:v26 timeSent:v14 activityType:Current - v30 activityIdentifier:v30];
    }
    +[PBBridgeCAReporter pushCommunicationTimingType:0 withValue:Current - v30];
    long long v32 = pbb_setupflow_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      int v39 = v26;
      __int16 v40 = 2112;
      uint64_t v41 = v14;
      __int16 v42 = 2048;
      double v43 = Current - v30;
      __int16 v44 = 2048;
      double v45 = Current;
      __int16 v46 = 2048;
      double v47 = v30;
      _os_log_impl(&dword_21C445000, v32, OS_LOG_TYPE_DEFAULT, "Success Sending Message: (%@) ID: (%@) Sending took (%f // %f -> %f)", buf, 0x34u);
    }

    [(NSMutableDictionary *)self->_inflightMessages removeObjectForKey:v14];
    [(NSMutableDictionary *)self->_pendingMessages removeObjectForKey:v14];

    goto LABEL_25;
  }
  id v20 = pbb_setupflow_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413058;
    int v39 = v14;
    __int16 v40 = 2112;
    uint64_t v41 = v12;
    __int16 v42 = 2112;
    double v43 = v13;
    __int16 v44 = 2112;
    double v45 = *(double *)&v15;
    _os_log_error_impl(&dword_21C445000, v20, OS_LOG_TYPE_ERROR, "Failed to send message ID: %@ (%@ -- %@) Error: %@", buf, 0x2Au);
  }

  __int16 v21 = [NSString stringWithFormat:@"Failed to Send Message (Post-Send): %@ (%@ -- %@) Error: %@", v14, v12, *(void *)&v13, v15];
  [(PBBridgeIDSServiceDelegate *)self _postMessageSendFailureForErrorMessage:v21];

  CFPreferencesSetAppValue(@"LastFailedMessageID", v14, @"com.apple.pbbridge");
  CFPreferencesSetAppValue(@"LastIDSFailureCode", (CFPropertyListRef)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "code")), @"com.apple.pbbridge");
  uint64_t v22 = [v16 retryCount];
  uint64_t v23 = pbb_setupflow_log();
  __int16 v17 = v23;
  if (v22 < 1)
  {
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 138413058;
    int v39 = v14;
    __int16 v40 = 2112;
    uint64_t v41 = v12;
    __int16 v42 = 2112;
    double v43 = v13;
    __int16 v44 = 2112;
    double v45 = *(double *)&v15;
    uint64_t v19 = "Failed fallback attempt(s) for message ID: %@ (%@ -- %@) Error: %@";
    goto LABEL_16;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    int v39 = v14;
    __int16 v40 = 2112;
    uint64_t v41 = v12;
    __int16 v42 = 2112;
    double v43 = v13;
    __int16 v44 = 2112;
    double v45 = *(double *)&v15;
    _os_log_impl(&dword_21C445000, v17, OS_LOG_TYPE_DEFAULT, "Attempt fallback message send for ID: %@ (%@ -- %@) Error: %@", buf, 0x2Au);
  }

  [(NSMutableDictionary *)self->_inflightMessages removeObjectForKey:v14];
  [v16 setRetryCount:[v16 retryCount] - 1];
  [(NSMutableDictionary *)self->_pendingMessages setObject:v16 forKey:v14];
  [v16 retryInterval];
  dispatch_time_t v25 = dispatch_time(0, (uint64_t)(v24 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__PBBridgeIDSServiceDelegate_service_account_identifier_didSendWithSuccess_error___block_invoke;
  block[3] = &unk_264401758;
  long long v34 = v14;
  v35 = v12;
  id v36 = *(id *)&v13;
  id v37 = self;
  dispatch_after(v25, MEMORY[0x263EF83A0], block);

  __int16 v17 = v34;
LABEL_25:
}

void __82__PBBridgeIDSServiceDelegate_service_account_identifier_didSendWithSuccess_error___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = pbb_setupflow_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    int v10 = 138412802;
    id v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_21C445000, v2, OS_LOG_TYPE_DEFAULT, "Firing fallback message ID: %@ (%@ -- %@)", (uint8_t *)&v10, 0x20u);
  }

  id v6 = [*(id *)(a1[7] + 40) objectForKey:a1[4]];
  id v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "Firing messageInstance %@", (uint8_t *)&v10, 0xCu);
  }

  if (v6)
  {
    id v8 = [v6 retryAction];

    if (v8)
    {
      [*(id *)(a1[7] + 32) setObject:v6 forKey:a1[4]];
      id v9 = [v6 retryAction];
      v9[2]();
    }
  }
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (BOOL)shouldSuppressTransportReachabilityTimeout
{
  return self->_shouldSuppressTransportReachabilityTimeout;
}

- (BOOL)isTinkerPairing
{
  return self->_isTinkerPairing;
}

- (void)setTinkerPairing:(BOOL)a3
{
  self->_isTinkerPairing = a3;
}

- (NSTimer)transportReachabilityTimer
{
  return self->_transportReachabilityTimer;
}

- (void)setTransportReachabilityTimer:(id)a3
{
}

- (NSMutableDictionary)inflightMessages
{
  return self->_inflightMessages;
}

- (void)setInflightMessages:(id)a3
{
}

- (NSMutableDictionary)pendingMessages
{
  return self->_pendingMessages;
}

- (void)setPendingMessages:(id)a3
{
}

- (BOOL)listeningForIDSSentMessages
{
  return self->_listeningForIDSSentMessages;
}

- (void)setListeningForIDSSentMessages:(BOOL)a3
{
  self->_listeningForIDSSentMessages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong((id *)&self->_inflightMessages, 0);
  objc_storeStrong((id *)&self->_transportReachabilityTimer, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)_sendProtoBuf:(os_log_t)log service:priority:responseIdentifier:expectsResponse:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = @"Response ";
  int v4 = 138413058;
  if (!a1) {
    uint64_t v3 = &stru_26CC94B60;
  }
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = 142;
  __int16 v8 = 2080;
  id v9 = "-[PBBridgeIDSServiceDelegate _sendProtoBuf:service:priority:responseIdentifier:expectsResponse:]";
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_fault_impl(&dword_21C445000, log, OS_LOG_TYPE_FAULT, "Service Was Nil! %@Protobuf (%d %s) -- %@", (uint8_t *)&v4, 0x26u);
}

void __96__PBBridgeIDSServiceDelegate__sendProtoBuf_service_priority_responseIdentifier_expectsResponse___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = @"Response ";
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = 138413314;
  if (!v4) {
    uint64_t v3 = &stru_26CC94B60;
  }
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = 145;
  __int16 v10 = 2080;
  uint64_t v11 = "-[PBBridgeIDSServiceDelegate _sendProtoBuf:service:priority:responseIdentifier:expectsResponse:]_block_invoke";
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_fault_impl(&dword_21C445000, log, OS_LOG_TYPE_FAULT, "Failed to send IDS %@Protobuf (%d %s) -- %@ (Error: %@)", (uint8_t *)&v6, 0x30u);
}

@end