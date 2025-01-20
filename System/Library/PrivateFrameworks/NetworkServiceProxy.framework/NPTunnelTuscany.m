@interface NPTunnelTuscany
- (BOOL)canHandleMoreData;
- (BOOL)flowIsFirstFlow:(id)a3;
- (BOOL)ignoreWaldoTimestamp;
- (BOOL)isFirstTunnel;
- (BOOL)isTFOProbeSucceeded;
- (BOOL)start;
- (NPTunnelTuscany)initWithEndpoint:(id)a3 parameters:(id)a4 appRule:(id)a5 flowProperties:(id)a6 onRamp:(id)a7 delegate:(id)a8;
- (NSDate)dayPassCreationDate;
- (id)createConnectionInfo;
- (id)pendingPingCompletionHandler;
- (int64_t)currentMTU;
- (int64_t)sendData:(id)a3 forFlow:(id)a4;
- (unint64_t)allocateFlowID;
- (unint64_t)initialWindowSize;
- (unint64_t)maxDataSendSizeForFlow:(id)a3;
- (unint64_t)maxFrameSize;
- (unsigned)dayPassSessionCounter;
- (void)acknowledgeData:(unint64_t)a3 sentToFlow:(id)a4;
- (void)cancelConnection;
- (void)cancelConnectionTimer;
- (void)clientRef;
- (void)closeFlow:(id)a3;
- (void)createTuscanyClient;
- (void)dealloc;
- (void)destroyConnection;
- (void)handleConnected;
- (void)handleConnectionError;
- (void)handleDataWrittenWithError:(int)a3;
- (void)handleDisconnected;
- (void)handleEOF;
- (void)handleFallbackForFlow:(id)a3;
- (void)handleFlowUsedTunnel;
- (void)handleHelloAck:(unsigned int)a3;
- (void)handleInputAvailable;
- (void)handlePingResponseRTT:(unint64_t)a3 geohash:(id)a4;
- (void)handleReadData:(nw_frame_array_s *)a3;
- (void)pingWithCompletionHandler:(id)a3;
- (void)sendDataOnUDPSession:(id)a3;
- (void)sendUsageReportWithRTT:(unint64_t)a3 geohash:(id)a4 fallbackReason:(int64_t)a5;
- (void)setClientRef:(void *)a3;
- (void)setIgnoreWaldoTimestamp:(BOOL)a3;
- (void)setIsFirstTunnel:(BOOL)a3;
- (void)setPendingPingCompletionHandler:(id)a3;
- (void)startConnectionTimer;
- (void)writeInitialData;
@end

@implementation NPTunnelTuscany

- (void)handleConnected
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v3 = [(NPTunnel *)self timestamps];
  if (v3 && g_recordTimestamps && !v3[10]) {
    v3[10] = mach_absolute_time();
  }
  v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(NPTunnel *)self identifier];
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_DEFAULT, "%@: Tuscany connection is now connected", buf, 0xCu);
  }
  v6 = [MEMORY[0x1E4F1C9C8] date];
  [(NPTunnel *)self setConnectionStartDate:v6];

  self->_shouldReportUsage = 1;
  v7 = [(NPTunnel *)self parameters];
  v8 = (void *)nw_parameters_copy_context();
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __34__NPTunnelTuscany_handleConnected__block_invoke;
  v14 = &unk_1E5A3B240;
  v15 = self;
  self->_usageReportTimer = (void *)nw_queue_context_create_source();

  dispatch_time(0, 3000000000);
  nw_queue_set_timer_values();
  nw_queue_resume_source();
  v9 = [(NPTunnelTuscany *)self clientRef];
  if (v9)
  {
    *(_DWORD *)buf = 0;
    (*(void (**)(void *, uint8_t *))(*(void *)v9 + 64))(v9, buf);
  }
  [(NPTunnelTuscany *)self cancelConnectionTimer];
  v10.receiver = self;
  v10.super_class = (Class)NPTunnelTuscany;
  [(NPTunnel *)&v10 handleConnected];
}

uint64_t __34__NPTunnelTuscany_handleConnected__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = [*(id *)(a1 + 32) identifier];
    int v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_1A0FEE000, v2, OS_LOG_TYPE_DEBUG, "%@: Usage timer fired", (uint8_t *)&v6, 0xCu);
  }
  v3 = *(void **)(a1 + 32);
  if (v3[32])
  {
    nw_queue_cancel_source();
    *(void *)(*(void *)(a1 + 32) + 256) = 0;
    v3 = *(void **)(a1 + 32);
  }
  return [v3 handleFlowUsedTunnel];
}

- (void)handleDisconnected
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(NPTunnel *)self identifier];
    *(_DWORD *)buf = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Tuscany connection is now disconnected", buf, 0xCu);
  }
  [(NPTunnelTuscany *)self handleConnectionError];
  self->_nextFlowID = 1;
  [(NPTunnel *)self setTimeToFirstRequest:0.0];
  [(NPTunnel *)self setTimeToFirstByte:0.0];
  v5.receiver = self;
  v5.super_class = (Class)NPTunnelTuscany;
  [(NPTunnel *)&v5 handleDisconnected];
  [(NPTunnelTuscany *)self cancelConnection];
}

- (void)handleConnectionError
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v3 = [(NPTunnel *)self error];
  if (v3)
  {
    int v4 = v3;
    objc_super v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [(NPTunnel *)self identifier];
      int v12 = 138412802;
      v13 = v11;
      __int16 v14 = 1024;
      int v15 = v4;
      __int16 v16 = 2080;
      v17 = strerror(v4);
      _os_log_error_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_ERROR, "%@: Tunnel connection disconnected with error: %d (%s)", (uint8_t *)&v12, 0x1Cu);
    }
    [(NPTunnel *)self timeToFirstByte];
    if (v6 == 0.0)
    {
      v7 = [(NPTunnel *)self flows];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        int v9 = v4 - 50;
        uint64_t v10 = 1;
        switch(v9)
        {
          case 0:
          case 1:
            break;
          case 3:
            uint64_t v10 = 22;
            break;
          case 4:
            uint64_t v10 = 5;
            break;
          case 10:
            uint64_t v10 = 4;
            break;
          case 11:
            uint64_t v10 = 23;
            break;
          case 14:
          case 15:
            uint64_t v10 = 2;
            break;
          default:
            uint64_t v10 = 27;
            break;
        }
        [(NPTunnel *)self setFallbackReason:v10];
        [(NPTuscanyOnRamp *)self->_onRamp setError:v10];
        [(NPTunnelTuscany *)self sendUsageReportWithRTT:0xFFFFFFFFLL geohash:0 fallbackReason:v10];
      }
    }
  }
}

- (void)handleInputAvailable
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = [(NPTunnelTuscany *)self clientRef];
  int v4 = v3;
  if (v3)
  {
    uint64_t v5 = v3[34];
    if (v5)
    {
      uint64_t v6 = *(unsigned __int16 *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 32))(v5) + 16);
      v7 = (void *)(v4[34] + 32);
    }
    else
    {
      v7 = v4 + 38;
      uint64_t v6 = 20;
    }
    int v4 = (void *)(v6 - *v7);
  }
  uint64_t v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = [(NPTunnel *)self identifier];
    int v10 = 138412802;
    uint64_t v11 = v9;
    __int16 v12 = 2048;
    v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = 0xFFFFFFFFLL;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "%@: Reading between %lu and %lu bytes from the tunnel connection", (uint8_t *)&v10, 0x20u);
  }
  [(NPTunnel *)self readMinimumLength:v4 maximumLength:0xFFFFFFFFLL];
}

- (void)handleReadData:(nw_frame_array_s *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(NPTunnelTuscany *)self cancelConnectionTimer];
  uint64_t v5 = [(NPTunnelTuscany *)self clientRef];
  if (!v5 || (NPFrameStream::handleReadData(v5, a3) & 1) == 0)
  {
    uint64_t v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [(NPTunnel *)self identifier];
      int v8 = 138412290;
      int v9 = v7;
      _os_log_error_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_ERROR, "%@: Failed to handle data read from the tunnel connection", (uint8_t *)&v8, 0xCu);
    }
    [(NPTunnelTuscany *)self sendUsageReportWithRTT:0xFFFFFFFFLL geohash:0 fallbackReason:[(NPTunnel *)self fallbackReason]];
    [(NPTunnelTuscany *)self cancelConnection];
  }
}

- (void)handleEOF
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(NPTunnel *)self identifier];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Received EOF on the tunnel connection", (uint8_t *)&v5, 0xCu);
  }
}

- (void)handleDataWrittenWithError:(int)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(NPTunnel *)self isConnectionAlive])
  {
    if (a3)
    {
      int v5 = nplog_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = [(NPTunnel *)self identifier];
        int v7 = 138412802;
        int v8 = v6;
        __int16 v9 = 1024;
        int v10 = a3;
        __int16 v11 = 2080;
        __int16 v12 = strerror(a3);
        _os_log_error_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_ERROR, "%@: Got an error while writing to the tunnel connection: %d (%s)", (uint8_t *)&v7, 0x1Cu);
      }
    }
    else
    {
      kdebug_trace();
      if ([(NPTunnelTuscany *)self canHandleMoreData])
      {
        [(NPTunnel *)self handleCanHandleMoreData];
      }
    }
  }
}

- (void)writeInitialData
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = tuscanyClientGetInitialData((NPFrameStream *)[(NPTunnelTuscany *)self clientRef], 1);
  if (v3)
  {
    [(NPTunnel *)self write:v3];
  }
  else
  {
    int v4 = nplog_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [(NPTunnel *)self identifier];
      int v6 = 138412290;
      int v7 = v5;
      _os_log_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_DEFAULT, "%@: writeInitialData called but no initial data is available", (uint8_t *)&v6, 0xCu);
    }
    [(NPTunnel *)self readMinimumLength:1 maximumLength:0xFFFFFFFFLL];
  }
}

- (void)acknowledgeData:(unint64_t)a3 sentToFlow:(id)a4
{
  int v4 = a3;
  id v13 = a4;
  if ([(NPTunnel *)self isConnectionAlive])
  {
    int v6 = (int *)[v13 window];
    if (v6)
    {
      int v7 = v6[1];
      int v8 = *v6 + v4;
      int v9 = v8 < v7 ? v8 : 0;
      int *v6 = v9;
      if (v8 >= v7 && v8 >= 1)
      {
        __int16 v11 = [(NPTunnelTuscany *)self clientRef];
        int v12 = [v13 identifier];
        if (v11) {
          FrameStream::acknowledge(v11, v12, v8, 1);
        }
      }
    }
  }
}

- (void)createTuscanyClient
{
  id v3 = [(NPTuscanyOnRamp *)self->_onRamp dayPass];
  tuscanyClientCreate(self, v3);
}

- (NPTunnelTuscany)initWithEndpoint:(id)a3 parameters:(id)a4 appRule:(id)a5 flowProperties:(id)a6 onRamp:(id)a7 delegate:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)NPTunnelTuscany;
  v17 = [(NPTunnel *)&v20 initWithEndpoint:a3 parameters:a4 appRule:a5 flowProperties:a6 delegate:v16];
  uint64_t v18 = v17;
  if (v17)
  {
    v17->_nextFlowID = 1;
    objc_storeStrong((id *)&v17->_onRamp, a7);
    v18->_isFirstTunnel = [v16 isFirstTunnel];
    [(NPTunnelTuscany *)v18 createTuscanyClient];
  }

  return v18;
}

- (void)dealloc
{
  if ([(NPTunnelTuscany *)self clientRef])
  {
    tuscanyClientDestroy((void *)[(NPTunnelTuscany *)self clientRef]);
    [(NPTunnelTuscany *)self setClientRef:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)NPTunnelTuscany;
  [(NPTunnel *)&v3 dealloc];
}

- (BOOL)start
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([(NPTunnel *)self connectionState]) {
    return 1;
  }
  int v4 = [(NPTunnel *)self parameters];
  int tfo = nw_parameters_get_tfo();

  int v6 = [(NPTunnel *)self parameters];
  int multipath = nw_parameters_get_multipath();

  int v8 = [(NPTunnel *)self parameters];
  int tfo_no_cookie = nw_parameters_get_tfo_no_cookie();

  int v10 = [(NPTunnel *)self parameters];
  int no_delay = nw_parameters_get_no_delay();

  int v12 = nplog_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(NPTunnel *)self identifier];
    __int16 v14 = [(NPTunnel *)self endpoint];
    *(_DWORD *)buf = 138413570;
    v21 = v13;
    __int16 v22 = 2080;
    uint64_t description = nw_endpoint_get_description();
    __int16 v24 = 1024;
    int v25 = tfo;
    __int16 v26 = 1024;
    int v27 = multipath;
    __int16 v28 = 1024;
    int v29 = tfo_no_cookie;
    __int16 v30 = 1024;
    int v31 = no_delay;
    _os_log_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_DEFAULT, "%@: Opening Tuscany connection to %s, TFO enabled = %d MPTCP enabled = %d, No TFO cookie = %d, No Delay = %d", buf, 0x2Eu);
  }
  kdebug_trace();
  id v15 = [(NPTunnel *)self appRule];
  id v16 = [v15 enableUDPRace];
  int v17 = [v16 BOOLValue];

  if (v17)
  {
    uint64_t v18 = tuscanyClientGetInitialData((NPFrameStream *)[(NPTunnelTuscany *)self clientRef], 0);
    if (v18) {
      [(NPTunnelTuscany *)self sendDataOnUDPSession:v18];
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)NPTunnelTuscany;
  return [(NPTunnel *)&v19 start];
}

- (void)startConnectionTimer
{
  objc_super v3 = [(NPTunnel *)self appRule];
  int v4 = [v3 connectionTimeout];
  [v4 doubleValue];
  double v6 = v5;

  if (v6 > 0.0 && !self->_connectionTimer)
  {
    int v7 = [(NPTunnel *)self parameters];
    int v8 = (void *)nw_parameters_copy_context();
    self->_connectionTimer = (void *)nw_queue_context_create_source();

    dispatch_time(0, (uint64_t)(v6 * 1000000.0));
    nw_queue_set_timer_values();
    nw_queue_resume_source();
  }
}

void *__39__NPTunnelTuscany_startConnectionTimer__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  result = *(void **)(a1 + 32);
  if (result[29])
  {
    [result cancelConnectionTimer];
    objc_super v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = [*(id *)(a1 + 32) identifier];
      int v5 = 138412290;
      double v6 = v4;
      _os_log_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Connection timer fired", (uint8_t *)&v5, 0xCu);
    }
    [*(id *)(a1 + 32) setError:60];
    return (void *)[*(id *)(a1 + 32) cancelConnection];
  }
  return result;
}

- (void)cancelConnectionTimer
{
  if (self->_connectionTimer)
  {
    nw_queue_cancel_source();
    self->_connectionTimer = 0;
  }
}

- (void)cancelConnection
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(NPTunnel *)self identifier];
    *(_DWORD *)buf = 138412290;
    int v8 = v4;
    _os_log_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Cancelling the Tuscany connection", buf, 0xCu);
  }
  [(NPTunnel *)self setIsCancelled:1];
  if (self->_shouldReportUsage && [(NPTunnel *)self connectionState] == 4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35__NPTunnelTuscany_cancelConnection__block_invoke;
    v6[3] = &unk_1E5A3BFA8;
    v6[4] = self;
    [(NPTunnelTuscany *)self pingWithCompletionHandler:v6];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NPTunnelTuscany;
    [(NPTunnel *)&v5 cancelConnection];
  }
}

id __35__NPTunnelTuscany_cancelConnection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4) {
    [*(id *)(a1 + 32) sendUsageReportWithRTT:a2 geohash:a3 fallbackReason:0];
  }
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)NPTunnelTuscany;
  return objc_msgSendSuper2(&v6, sel_cancelConnection);
}

- (void)sendDataOnUDPSession:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_UDPSession)
  {
    objc_super v5 = [(NPTunnel *)self endpoint];
    objc_super v6 = nplog_obj();
    uint64_t v7 = v6;
    if (v5)
    {
      BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

      if (v8)
      {
        uint64_t v9 = nplog_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          id v16 = [(NPTunnel *)self identifier];
          *(_DWORD *)buf = 138412546;
          int v25 = v16;
          __int16 v26 = 2080;
          uint64_t description = nw_endpoint_get_description();
          _os_log_debug_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_DEBUG, "%@: Racing UDP to %s", buf, 0x16u);
        }
      }
      int v10 = nw_parameters_create();
      nw_parameters_set_data_mode();
      nw_parameters_set_indefinite();
      __int16 v11 = nw_connection_create(v5, v10);
      int v12 = dispatch_get_global_queue(0, 0);
      nw_connection_set_queue(v11, v12);

      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      objc_super v19 = __40__NPTunnelTuscany_sendDataOnUDPSession___block_invoke;
      objc_super v20 = &unk_1E5A3BFD0;
      v21 = self;
      id v22 = v4;
      id v13 = v11;
      v23 = v13;
      MEMORY[0x1A622AEF0]();
      nw_connection_start(v13);
      UDPSession = self->_UDPSession;
      self->_UDPSession = (OS_nw_connection *)v13;
      uint64_t v7 = v13;
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v15 = [(NPTunnel *)self identifier];
      *(_DWORD *)buf = 138412290;
      int v25 = v15;
      _os_log_error_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_ERROR, "%@: No UDP endpoint available, not racing UDP", buf, 0xCu);
    }
  }
}

void __40__NPTunnelTuscany_sendDataOnUDPSession___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_super v5 = a3;
  if (v5)
  {
    objc_super v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v7;
      __int16 v9 = 1024;
      nw_error_domain_t error_domain = nw_error_get_error_domain(v5);
      __int16 v11 = 1024;
      int error_code = nw_error_get_error_code(v5);
      _os_log_error_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_ERROR, "%@: Got an error on the UDP session: %d:%d", buf, 0x18u);
    }
  }
  else if (a2 == 3)
  {
    *(void *)buf = *(id *)(a1 + 40);
    nw_connection_write_multiple();
  }
}

void __40__NPTunnelTuscany_sendDataOnUDPSession___block_invoke_13(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = nplog_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_super v5 = [*(id *)(a1 + 32) identifier];
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2080;
      __int16 v9 = strerror(a2);
      _os_log_error_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_ERROR, "%@: Got an error while writing the UDP datagram: %s", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)handleFallbackForFlow:(id)a3
{
  id v4 = a3;
  id v6 = [(NPTunnel *)self delegate];
  uint64_t v5 = [v4 fallbackReason];

  [v6 tunnel:self flowDidFallbackWithReason:v5];
}

- (void)destroyConnection
{
  v7.receiver = self;
  v7.super_class = (Class)NPTunnelTuscany;
  [(NPTunnel *)&v7 destroyConnection];
  [(NPTunnelTuscany *)self cancelConnectionTimer];
  UDPSession = self->_UDPSession;
  if (UDPSession)
  {
    nw_connection_cancel(UDPSession);
    id v4 = self->_UDPSession;
    self->_UDPSession = 0;
  }
  if (self->_pingTimer)
  {
    nw_queue_cancel_source();
    self->_pingTimer = 0;
  }
  pendingPingCompletionHandler = (void (**)(id, uint64_t, void, uint64_t))self->_pendingPingCompletionHandler;
  if (pendingPingCompletionHandler)
  {
    pendingPingCompletionHandler[2](pendingPingCompletionHandler, 0xFFFFFFFFLL, 0, 1);
    id v6 = self->_pendingPingCompletionHandler;
    self->_pendingPingCompletionHandler = 0;
  }
  if (self->_usageReportTimer)
  {
    nw_queue_cancel_source();
    self->_usageReportTimer = 0;
  }
}

- (int64_t)currentMTU
{
  objc_super v3 = [(NPTunnel *)self path];

  if (v3
    && ([(NPTunnel *)self path],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int mtu = nw_path_get_mtu(),
        v4,
        mtu > 0))
  {
    return mtu - 100;
  }
  else
  {
    return 1400;
  }
}

- (unint64_t)maxFrameSize
{
  return [(NPTuscanyOnRamp *)self->_onRamp maxFrameSize];
}

- (void)handleFlowUsedTunnel
{
  if (self->_shouldReportUsage)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __39__NPTunnelTuscany_handleFlowUsedTunnel__block_invoke;
    v2[3] = &unk_1E5A3BFA8;
    v2[4] = self;
    [(NPTunnelTuscany *)self pingWithCompletionHandler:v2];
  }
}

uint64_t __39__NPTunnelTuscany_handleFlowUsedTunnel__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  if (a4) {
    return [*(id *)(result + 32) sendUsageReportWithRTT:a2 geohash:a3 fallbackReason:0];
  }
  return result;
}

- (void)sendUsageReportWithRTT:(unint64_t)a3 geohash:(id)a4 fallbackReason:(int64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (a5 || self->_shouldReportUsage)
  {
    self->_shouldReportUsage = 0;
    if (self->_usageReportTimer)
    {
      nw_queue_cancel_source();
      self->_usageReportTimer = 0;
    }
    if (a5 == 26)
    {
      __int16 v9 = [(NPTunnel *)self appRule];
      uint64_t v10 = [v9 requireTFO];
      int v11 = [v10 BOOLValue];

      if (v11) {
        a5 = 26;
      }
      else {
        a5 = 0;
      }
    }
    int v12 = nplog_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(NPTunnel *)self identifier];
      __int16 v14 = +[NSPConnectionInfo getFallbackReasonDescription:a5];
      int v21 = 138412546;
      id v22 = v13;
      __int16 v23 = 2112;
      __int16 v24 = v14;
      _os_log_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_DEFAULT, "%@: Reporting usage with fallback reason: %@", (uint8_t *)&v21, 0x16u);
    }
    id v15 = [NPUsageReport alloc];
    id v16 = [(NPTunnel *)self appRule];
    uint64_t v17 = [v16 matchSigningIdentifier];
    uint64_t v18 = [(NPUsageReport *)v15 initWithSigningIdentifier:v17 fallbackReason:a5];

    [(NPUsageReport *)v18 setRtt:a3];
    [(NPUsageReport *)v18 setGeohash:v8];
    objc_super v19 = [(NPTuscanyOnRamp *)self->_onRamp dayPassUUID];
    [(NPUsageReport *)v18 setDayPassUUID:v19];

    objc_super v20 = +[NSPManager sharedManager];
    [v20 sendUsageReport:v18];
  }
}

- (void)closeFlow:(id)a3
{
  id v4 = a3;
  if ([v4 identifier])
  {
    if ([(NPTunnelTuscany *)self clientRef]
      && [(NPTunnel *)self connectionState] == 4
      && [v4 state] == 3)
    {
      tuscanyClientSendClose((NPTuscanyClient *)[(NPTunnelTuscany *)self clientRef], v4);
    }
    v5.receiver = self;
    v5.super_class = (Class)NPTunnelTuscany;
    [(NPTunnel *)&v5 closeFlow:v4];
  }
}

- (int64_t)sendData:(id)a3 forFlow:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 state] == 1)
  {
    if ([(NPTunnelTuscany *)self flowIsFirstFlow:v7])
    {
      id v8 = [v7 appRule];
      __int16 v9 = [v8 edgeSetIdentifier];

      if (!v9) {
        [(NPTunnelTuscany *)self setIgnoreWaldoTimestamp:1];
      }
      uint64_t v10 = nplog_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v16 = [(NPTunnel *)self identifier];
        *(_DWORD *)uint64_t v17 = 138412546;
        *(void *)&v17[4] = v16;
        __int16 v18 = 2048;
        uint64_t v19 = [v6 length];
        _os_log_debug_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEBUG, "%@: sendData (size %lu): first request", v17, 0x16u);
      }
    }
  }
  else if (![(NPTunnelTuscany *)self canHandleMoreData])
  {
    int64_t v14 = 0;
    goto LABEL_18;
  }
  if ([v6 length])
  {
    [(NPTunnel *)self timeToFirstRequest];
    if (v11 == 0.0)
    {
      kdebug_trace();
      int v12 = [v7 startDate];
      [v12 timeIntervalSinceNow];
      [(NPTunnel *)self setTimeToFirstRequest:fabs(v13 * 1000.0)];
    }
  }
  if (tuscanyClientSendData((id *)[(NPTunnelTuscany *)self clientRef], v7, v6, (unint64_t *)v17))
  {
    if (*(void *)v17 >= 0x7FFFFFFFuLL) {
      int64_t v14 = 0;
    }
    else {
      int64_t v14 = *(void *)v17;
    }
  }
  else
  {
    [(NPTunnelTuscany *)self sendUsageReportWithRTT:0xFFFFFFFFLL geohash:0 fallbackReason:[(NPTunnel *)self fallbackReason]];
    int64_t v14 = -1;
  }
LABEL_18:

  return v14;
}

- (unint64_t)allocateFlowID
{
  unint64_t result = self->_nextFlowID;
  if (result > 0xFFFFFFFE) {
    return 0;
  }
  self->_nextFlowID = result + 2;
  return result;
}

- (BOOL)canHandleMoreData
{
  return [(NPTunnel *)self connectionState] == 3
      || [(NPTunnel *)self connectionState] == 4;
}

- (unint64_t)initialWindowSize
{
  return 0x10000;
}

- (id)createConnectionInfo
{
  objc_super v3 = objc_alloc_init(NSPConnectionInfo);
  if ([(NPTunnel *)self connectionState] == 3
    || [(NPTunnel *)self connectionState] == 4)
  {
    id v4 = [(NPTunnel *)self path];
    uint64_t v5 = [(NPTunnel *)self outputInterface];
    uint64_t v6 = [(NPTunnel *)self endpoint];
    id v7 = [(NPTunnel *)self parameters];
    v35 = (void *)v6;
    +[NPUtilities fillOutConnectionInfo:v3 withPath:v4 interface:v5 remoteEndpoint:v6 parameters:v7 outputHandler:(void)[(NPTunnel *)self protocol][32]];

    [(NSPConnectionInfo *)v3 setPathType:1];
    id v8 = +[NSPManager sharedManager];
    [v8 timeIntervalSinceLastUsage];
    -[NSPConnectionInfo setTimeIntervalSinceLastUsage:](v3, "setTimeIntervalSinceLastUsage:");

    [(NSPConnectionInfo *)v3 setEdgeType:[(NPTuscanyOnRamp *)self->_onRamp currentEdgeType]];
    [(NSPConnectionInfo *)v3 setIsTFOProbeSucceeded:[(NPTuscanyOnRamp *)self->_onRamp isTFOEnabled]];
    v37 = v3;
    v36 = (void *)v5;
    if ([(NPTunnelTuscany *)self clientRef]
      && (__int16 v9 = [(NPTunnelTuscany *)self clientRef]) != 0)
    {
      uint64_t v10 = 0;
      id v11 = 0;
      int v12 = v9 + 496;
      do
      {
        uint64_t v13 = *(void *)&v12[v10 * 8];
        int64_t v14 = (&Frame::Exception::label(int)::names)[v10];
        if (v14) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15)
        {
          if (!v11) {
            id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          id v16 = [NSNumber numberWithUnsignedLong:v13];
          uint64_t v17 = [NSString stringWithUTF8String:v14];
          [v11 setObject:v16 forKeyedSubscript:v17];
        }
        ++v10;
      }
      while (v10 != 6);
    }
    else
    {
      id v11 = 0;
    }
    objc_super v3 = v37;
    [(NSPConnectionInfo *)v37 setExceptions:v11];
    [(NPTunnel *)self timeToFirstByte];
    -[NSPConnectionInfo setTimeToFirstByte:](v37, "setTimeToFirstByte:");
    if ([(NPTunnel *)self timestamps])
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v19 = [(NPTunnel *)self timestamps];
      for (uint64_t i = 0; i != 15; ++i)
      {
        double v23 = 0.0;
        if (i)
        {
          uint64_t v24 = i;
          while (v24 > 0)
          {
            unint64_t v25 = v19[--v24];
            if (v25) {
              goto LABEL_24;
            }
          }
          unint64_t v25 = *(v19 - 1);
LABEL_24:
          unint64_t v26 = v19[i];
          BOOL v27 = v26 >= v25;
          unint64_t v28 = v26 - v25;
          if (v28 != 0 && v27 && g_recordTimestamps != 0)
          {
            LODWORD(v20) = g_timebaseInfo;
            LODWORD(v21) = unk_1E953B9F8;
            double v23 = (double)v28 * (double)v20 / (double)v21 / 1000000.0;
          }
        }
        __int16 v30 = +[NPUtilities timestampIdentifierToName:i];
        id v31 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        uint64_t v32 = (void *)[objc_alloc(NSNumber) initWithDouble:v23];
        v33 = objc_msgSend(v31, "initWithObjectsAndKeys:", v32, v30, 0);

        [v18 addObject:v33];
      }
      objc_super v3 = v37;
      [(NSPConnectionInfo *)v37 setTimingIntervals:v18];
    }
  }
  return v3;
}

- (void)handleHelloAck:(unsigned int)a3
{
  uint64_t v5 = [(NPTunnel *)self timestamps];
  if (v5 && g_recordTimestamps && !v5[11]) {
    v5[11] = mach_absolute_time();
  }
  self->_waldoTimestamp = a3;
  [(NPTunnel *)self handleReady];
}

- (unint64_t)maxDataSendSizeForFlow:(id)a3
{
  if ([a3 state] != 1 && !-[NPTunnelTuscany canHandleMoreData](self, "canHandleMoreData")) {
    return 0;
  }
  unint64_t result = [(NPTunnelTuscany *)self clientRef];
  if (result)
  {
    uint64_t v5 = *(void *)(result + 264);
    if (v5) {
      return v5 - 24;
    }
    else {
      return 1256;
    }
  }
  return result;
}

- (void)pingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_pendingPingCompletionHandler || [(NPTunnel *)self connectionState] != 4)
  {
    (*((void (**)(id, uint64_t, void, void))v4 + 2))(v4, 0xFFFFFFFFLL, 0, 0);
  }
  else
  {
    if (self->_pingTimer)
    {
      nw_queue_cancel_source();
      self->_pingTimer = 0;
    }
    uint64_t v5 = (void *)MEMORY[0x1A622B750](v4);
    id pendingPingCompletionHandler = self->_pendingPingCompletionHandler;
    self->_id pendingPingCompletionHandler = v5;

    id v7 = [(NPTunnel *)self parameters];
    id v8 = (void *)nw_parameters_copy_context();
    self->_pingTimer = (void *)nw_queue_context_create_source();

    dispatch_time(0, 2000000000);
    nw_queue_set_timer_values();
    nw_queue_resume_source();
    __int16 v9 = [(NPTunnelTuscany *)self clientRef];
    if (v9) {
      Client::ping(v9, 0, 0);
    }
  }
}

uint64_t __45__NPTunnelTuscany_pingWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[31])
  {
    nw_queue_cancel_source();
    *(void *)(*(void *)(a1 + 32) + 248) = 0;
    v2 = *(void **)(a1 + 32);
  }
  return [v2 handlePingResponseRTT:0xFFFFFFFFLL geohash:0];
}

- (void)handlePingResponseRTT:(unint64_t)a3 geohash:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(NPTunnel *)self identifier];
    int v11 = 138412546;
    int v12 = v8;
    __int16 v13 = 2048;
    unint64_t v14 = a3;
    _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEFAULT, "%@: Received ping RTT of %lu", (uint8_t *)&v11, 0x16u);
  }
  if (self->_pingTimer)
  {
    nw_queue_cancel_source();
    self->_pingTimer = 0;
  }
  if (self->_pendingPingCompletionHandler)
  {
    __int16 v9 = (void (**)(void, void, void, void))MEMORY[0x1A622B750]();
    id pendingPingCompletionHandler = self->_pendingPingCompletionHandler;
    self->_id pendingPingCompletionHandler = 0;

    ((void (**)(void, unint64_t, id, uint64_t))v9)[2](v9, a3, v6, 1);
  }
}

- (BOOL)flowIsFirstFlow:(id)a3
{
  return [a3 identifier] == 1;
}

- (unsigned)dayPassSessionCounter
{
  unsigned int v3 = [(NPTuscanyOnRamp *)self->_onRamp getNextSessionCounter];
  if (!v3) {
    [(NPTunnel *)self setFallbackReason:[(NPTuscanyOnRamp *)self->_onRamp error]];
  }
  return v3;
}

- (NSDate)dayPassCreationDate
{
  return [(NPTuscanyOnRamp *)self->_onRamp dayPassCreationDate];
}

- (BOOL)isTFOProbeSucceeded
{
  return [(NPTuscanyOnRamp *)self->_onRamp isTFOEnabled];
}

- (void)clientRef
{
  return self->_clientRef;
}

- (void)setClientRef:(void *)a3
{
  self->_clientRef = a3;
}

- (BOOL)ignoreWaldoTimestamp
{
  return self->_ignoreWaldoTimestamp;
}

- (void)setIgnoreWaldoTimestamp:(BOOL)a3
{
  self->_ignoreWaldoTimestamp = a3;
}

- (id)pendingPingCompletionHandler
{
  return self->_pendingPingCompletionHandler;
}

- (void)setPendingPingCompletionHandler:(id)a3
{
}

- (BOOL)isFirstTunnel
{
  return self->_isFirstTunnel;
}

- (void)setIsFirstTunnel:(BOOL)a3
{
  self->_isFirstTunnel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingPingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_onRamp, 0);
  objc_storeStrong((id *)&self->_UDPSession, 0);
}

@end