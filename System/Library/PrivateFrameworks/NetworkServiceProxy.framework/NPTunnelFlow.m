@interface NPTunnelFlow
- (BOOL)disconnectedByApp;
- (BOOL)enableDirectRace;
- (BOOL)fallbackDisabled;
- (BOOL)isBestEffort;
- (BOOL)isClientFlowClosed;
- (BOOL)isDirectConnectionViable;
- (BOOL)shouldComposeIntialData;
- (BOOL)shouldSendDataToClient:(id)a3 fromTunnel:(BOOL)a4;
- (NPFlowProperties)extraFlowProperties;
- (NPTunnel)tunnel;
- (NPTunnelFlow)initWithTunnel:(id)a3 appRule:(id)a4 hashKey:(unint64_t)a5 extraFlowProperties:(id)a6;
- (NSDate)firstTxByteTimestamp;
- (NSDate)startDate;
- (NSPAppRule)appRule;
- (OS_dispatch_data)savedData;
- (double)fallbackDelay;
- (id)appData;
- (id)combineStateInfo:(id)a3 andConnectionInfo:(id)a4;
- (id)copyConnectionInfo;
- (id)createFallbackConnectionInfoWithFallbackReason:(int64_t)a3;
- (int64_t)fallbackReason;
- (int64_t)state;
- (unint64_t)hashKey;
- (unint64_t)identifier;
- (unint64_t)initialBytesLeftOver;
- (void)cleanupLosingConnection:(BOOL)a3;
- (void)closeFromDirectConnectionWithError:(int)a3;
- (void)closeFromTunnel;
- (void)createTelemetryDataWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)fallbackTimer;
- (void)handleAppData:(id)a3;
- (void)handleTunnelCanHandleMoreData;
- (void)handleTunnelConnected;
- (void)handleTunnelDisconnected;
- (void)increaseWindowSize:(unint64_t)a3;
- (void)processConnectionInfo:(id)a3;
- (void)reportTelemetry:(id)a3 withService:(id)a4 url:(id)a5;
- (void)sendDataToClient:(id)a3 fromTunnel:(BOOL)a4;
- (void)setDisconnectedByApp:(BOOL)a3;
- (void)setFallbackDelay:(double)a3;
- (void)setFallbackDisabled:(BOOL)a3;
- (void)setFallbackReason:(int64_t)a3;
- (void)setFallbackTimer:(void *)a3;
- (void)setFirstTxByteTimestamp:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setInitialBytesLeftOver:(unint64_t)a3;
- (void)setIsDirectConnectionViable:(BOOL)a3;
- (void)setSavedData:(id)a3;
- (void)setShouldComposeIntialData:(BOOL)a3;
- (void)setTelemetryTimer:(void *)a3;
- (void)telemetryTimer;
- (void)window;
@end

@implementation NPTunnelFlow

- (NPTunnelFlow)initWithTunnel:(id)a3 appRule:(id)a4 hashKey:(unint64_t)a5 extraFlowProperties:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)NPTunnelFlow;
  v13 = [(NPTunnelFlow *)&v17 init];
  v14 = v13;
  if (v13)
  {
    v13->_identifier = 0;
    objc_storeStrong((id *)&v13->_tunnel, a3);
    v14->_hasTunnel = 1;
    objc_storeStrong((id *)&v14->_appRule, a4);
    v15 = [v11 initialWindowSize];

    if (v15)
    {
      [v11 initialWindowSize];
      [(id)objc_claimAutoreleasedReturnValue() unsignedIntegerValue];
      operator new();
    }
    [(NPTunnel *)v14->_tunnel initialWindowSize];
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  window = self->_window;
  if (window) {
    MEMORY[0x1A622A8A0](window, 0x1000C40451B5BE8);
  }
  v4.receiver = self;
  v4.super_class = (Class)NPTunnelFlow;
  [(NPTunnelFlow *)&v4 dealloc];
}

- (void)cleanupLosingConnection:(BOOL)a3
{
  if (a3)
  {
    [(NPTunnelFlow *)self closeFromDirectConnectionWithError:0];
  }
  else if (self->_hasTunnel)
  {
    [(NPTunnel *)self->_tunnel closeFlow:self];
    [(NPTunnelFlow *)self closeFromTunnel];
  }
}

- (BOOL)shouldSendDataToClient:(id)a3 fromTunnel:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    unint64_t hashKey = self->_hashKey;
    unint64_t identifier = self->_identifier;
    uint64_t v24 = [v6 length];
    v25 = "direct connection";
    *(_DWORD *)v26 = 134218754;
    *(void *)&v26[4] = hashKey;
    *(_WORD *)&v26[12] = 2048;
    if (v4) {
      v25 = "tunnel";
    }
    *(void *)&v26[14] = identifier;
    __int16 v27 = 2048;
    uint64_t v28 = v24;
    __int16 v29 = 2080;
    v30 = v25;
    _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) Received %lu bytes from %s", v26, 0x2Au);
  }

  if (self->_state == 2)
  {
    v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = self->_hashKey;
      unint64_t v10 = self->_identifier;
      id v11 = "direct connection";
      if (v4) {
        id v11 = "tunnel";
      }
      *(_DWORD *)v26 = 134218498;
      *(void *)&v26[4] = v9;
      *(_WORD *)&v26[12] = 2048;
      *(void *)&v26[14] = v10;
      __int16 v27 = 2080;
      uint64_t v28 = (uint64_t)v11;
      _os_log_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) Received first data from %s", v26, 0x20u);
    }

    if (v4)
    {
      self->_state = 3;
      id v12 = [(NPTunnelFlow *)self copyConnectionInfo];
      if (v12)
      {
        v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NPFlowProperties flowIdentifier](self->_extraFlowProperties, "flowIdentifier"));
        v14 = +[NSPManager sharedManager];
        [v14 setConnectionInfo:v12 forIdentifier:v13];
      }
    }
    else
    {
      self->_state = 4;
    }
    -[NPTunnelFlow cleanupLosingConnection:](self, "cleanupLosingConnection:", v4, *(_OWORD *)v26);
  }
  if (v4)
  {
    if (self->_hasTunnel)
    {
LABEL_15:
      BOOL v15 = 1;
      goto LABEL_22;
    }
  }
  else if (self->_isDirectConnectionViable)
  {
    goto LABEL_15;
  }
  v16 = nplog_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v18 = self->_hashKey;
    unint64_t v17 = self->_identifier;
    uint64_t v19 = [v6 length];
    v20 = "direct connection";
    *(_DWORD *)v26 = 134218754;
    *(void *)&v26[4] = v18;
    *(_WORD *)&v26[12] = 2048;
    if (v4) {
      v20 = "tunnel";
    }
    *(void *)&v26[14] = v17;
    __int16 v27 = 2048;
    uint64_t v28 = v19;
    __int16 v29 = 2080;
    v30 = v20;
    _os_log_impl(&dword_1A0FEE000, v16, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) dropping %lu bytes of data from %s", v26, 0x2Au);
  }

  BOOL v15 = 0;
LABEL_22:

  return v15;
}

- (void)sendDataToClient:(id)a3 fromTunnel:(BOOL)a4
{
  id v5 = a3;
  if (-[NPTunnelFlow shouldSendDataToClient:fromTunnel:](self, "shouldSendDataToClient:fromTunnel:")) {
    -[NPTunnel acknowledgeData:sentToFlow:](self->_tunnel, "acknowledgeData:sentToFlow:", [v5 length], self);
  }
}

- (void)handleAppData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a3;
  id v5 = v4;
  if (self->_hasTunnel)
  {
    if (v4)
    {
      if (self->_savedData)
      {
        if ([v4 length])
        {
          concat = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)self->_savedData, v5);
LABEL_12:
          savedData = self->_savedData;
          self->_savedData = concat;
        }
      }
      else
      {
        size_t v7 = [(NPTunnel *)self->_tunnel sendData:v4 forFlow:self];
        if (self->_state == 1)
        {
          self->_state = 2;
          if (!self->_fallbackDisabled)
          {
            if ([v5 length])
            {
              extraFlowProperties = self->_extraFlowProperties;
              if (extraFlowProperties
                && ([(NPFlowProperties *)extraFlowProperties fallbackTimeout], v11 > 0.0))
              {
                [(NPFlowProperties *)self->_extraFlowProperties fallbackTimeout];
                double v13 = v12;
              }
              else
              {
                v14 = [(NSPAppRule *)self->_appRule fallbackTimeout];
                [v14 doubleValue];
                double v13 = v15;
              }
              if (v13 > 0.0)
              {
                v16 = nplog_obj();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  unint64_t v20 = (unint64_t)v13;
                  _os_log_debug_impl(&dword_1A0FEE000, v16, OS_LOG_TYPE_DEBUG, "Fallback timeout %ld", buf, 0xCu);
                }

                unint64_t v17 = [(NPTunnel *)self->_tunnel parameters];
                unint64_t v18 = (void *)nw_parameters_copy_context();
                self->_fallbackTimer = (void *)nw_queue_context_create_source();

                dispatch_time(0, (uint64_t)(v13 * 1000000.0));
                nw_queue_set_timer_values();
                nw_queue_resume_source();
              }
            }
          }
        }
        if ((v7 & 0x8000000000000000) != 0)
        {
          [(NPTunnelFlow *)self closeFromTunnel];
          [(NPTunnel *)self->_tunnel cancelConnection];
          goto LABEL_14;
        }
        uint64_t v8 = [v5 length];
        if (v8 != v7)
        {
          concat = (OS_dispatch_data *)dispatch_data_create_subrange(v5, v7, v8 - v7);
          goto LABEL_12;
        }
      }
    }
    else
    {
      [(NPTunnel *)self->_tunnel closeFlow:self];
    }
  }
LABEL_14:
}

uint64_t __30__NPTunnelFlow_handleAppData___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 120))
  {
    nw_queue_cancel_source();
    *(void *)(*(void *)(a1 + 32) + 120) = 0;
  }
  v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v3 + 32);
    uint64_t v4 = *(void *)(v3 + 40);
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1A0FEE000, v2, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) fallback timer fired", (uint8_t *)&v7, 0x16u);
  }

  *(void *)(*(void *)(a1 + 32) + 16) = 13;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "closeFlow:");
  return [*(id *)(a1 + 32) closeFromTunnel];
}

- (void)increaseWindowSize:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  window = self->_window;
  if (window && (window[3] += a3, (id v6 = (int *)self->_window) != 0)) {
    uint64_t v7 = v6[3];
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t hashKey = self->_hashKey;
    unint64_t identifier = self->_identifier;
    int v11 = 134218752;
    unint64_t v12 = hashKey;
    __int16 v13 = 2048;
    unint64_t v14 = identifier;
    __int16 v15 = 2048;
    unint64_t v16 = a3;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) Received ack for %lu bytes, window size is now %lu", (uint8_t *)&v11, 0x2Au);
  }

  [(NPTunnelFlow *)self handleTunnelCanHandleMoreData];
}

- (BOOL)isClientFlowClosed
{
  return 0;
}

- (void)closeFromTunnel
{
  v30[2] = *MEMORY[0x1E4F143B8];
  if (self->_fallbackTimer)
  {
    nw_queue_cancel_source();
    self->_fallbackTimer = 0;
  }
  if (self->_hasTunnel)
  {
    if (self->_state != 3
      || ([(NPTunnel *)self->_tunnel handleFlowUsedTunnel], self->_hasTunnel))
    {
      if (self->_fallbackReason)
      {
        uint64_t v3 = nplog_obj();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t hashKey = self->_hashKey;
          unint64_t identifier = self->_identifier;
          id v6 = +[NSPConnectionInfo getFallbackReasonDescription:self->_fallbackReason];
          int v25 = 134218498;
          unint64_t v26 = hashKey;
          __int16 v27 = 2048;
          unint64_t v28 = identifier;
          __int16 v29 = 2112;
          v30[0] = v6;
          _os_log_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) closed with fallback reason: %@", (uint8_t *)&v25, 0x20u);
        }
        if (self->_fallbackDelay == 0.0)
        {
          startDate = self->_startDate;
          if (startDate)
          {
            [(NSDate *)startDate timeIntervalSinceNow];
            if (v8 < 0.0) {
              self->_fallbackDelay = fabs(v8) * 1000.0;
            }
          }
        }
      }
      __int16 v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NPFlowProperties flowIdentifier](self->_extraFlowProperties, "flowIdentifier"));
      uint64_t v10 = nplog_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v23 = self->_hashKey;
        unint64_t v24 = self->_identifier;
        int v25 = 134218240;
        unint64_t v26 = v23;
        __int16 v27 = 2048;
        unint64_t v28 = v24;
        _os_log_debug_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) setting final connection info", (uint8_t *)&v25, 0x16u);
      }

      id v11 = [(NPTunnelFlow *)self copyConnectionInfo];
      if (v11)
      {
        unint64_t v12 = +[NSPManager sharedManager];
        [v12 setConnectionInfo:v11 forIdentifier:v9];
      }
      if (self->_state != 3 && !self->_fallbackDisabled) {
        [(NPTunnel *)self->_tunnel handleFallbackForFlow:self];
      }
    }
  }
  self->_hasTunnel = 0;
  savedData = self->_savedData;
  self->_savedData = 0;

  if (![(NPTunnelFlow *)self isClientFlowClosed] && !self->_isDirectConnectionViable)
  {
    unint64_t v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v15 = self->_hashKey;
      unint64_t v16 = self->_identifier;
      int v25 = 134218240;
      unint64_t v26 = v15;
      __int16 v27 = 2048;
      unint64_t v28 = v16;
      _os_log_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) closed from tunnel and has no direct connection, closing the flow", (uint8_t *)&v25, 0x16u);
    }

    if (self->_tunnelError)
    {
      __int16 v17 = nplog_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v18 = self->_hashKey;
        unint64_t v19 = self->_identifier;
        int tunnelError = self->_tunnelError;
        uint64_t v21 = strerror(tunnelError);
        int v25 = 134218754;
        unint64_t v26 = v18;
        __int16 v27 = 2048;
        unint64_t v28 = v19;
        __int16 v29 = 1024;
        LODWORD(v30[0]) = tunnelError;
        WORD2(v30[0]) = 2080;
        *(void *)((char *)v30 + 6) = v21;
        _os_log_impl(&dword_1A0FEE000, v17, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) closed from tunnel with error %d (%s)", (uint8_t *)&v25, 0x26u);
      }

      int64_t fallbackReason = self->_tunnelError;
    }
    else
    {
      int64_t fallbackReason = self->_fallbackReason;
      if (fallbackReason) {
        int64_t fallbackReason = +[NSPConnectionInfo fallbackReasonToErrno:](NSPConnectionInfo, "fallbackReasonToErrno:");
      }
    }
    [(NPTunnelFlow *)self closeWithError:fallbackReason];
  }
}

- (void)closeFromDirectConnectionWithError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(_WORD *)&self->_isDirectConnectionViable = 256;
  if (self->_fallbackTimer)
  {
    nw_queue_cancel_source();
    self->_fallbackTimer = 0;
  }
  [(NPTunnelFlow *)self stopDirectConnection];
  if (!self->_hasTunnel && ![(NPTunnelFlow *)self isClientFlowClosed])
  {
    uint64_t v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t hashKey = self->_hashKey;
      unint64_t identifier = self->_identifier;
      int v8 = 134218240;
      unint64_t v9 = hashKey;
      __int16 v10 = 2048;
      unint64_t v11 = identifier;
      _os_log_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) closed from direct connection and has no tunnel, closing the flow", (uint8_t *)&v8, 0x16u);
    }

    [(NPTunnelFlow *)self closeWithError:v3];
  }
}

- (void)handleTunnelConnected
{
  [(NPTunnelFlow *)self handleTunnelCanHandleMoreData];
  if ([(NPTunnel *)self->_tunnel flowIsFirstFlow:self])
  {
    uint64_t v3 = [(NSPAppRule *)self->_appRule telemetryRatio];
    if (self->_telemetryTimer)
    {
      nw_queue_cancel_source();
      self->_telemetryTimer = 0;
    }
    [v3 doubleValue];
    if (v4 == 0.0)
    {
      uint64_t v5 = nplog_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_INFO, "Telemetry ratio is 0.0, not sending telemetry", buf, 2u);
      }
    }
    else if (+[NPUtilities rollDiceWithSuccessRatio:v3])
    {
      id v6 = [(NPTunnel *)self->_tunnel parameters];
      uint64_t v7 = (void *)nw_parameters_copy_context();
      self->_telemetryTimer = (void *)nw_queue_context_create_source();

      dispatch_time(0, 30000000000);
      nw_queue_set_timer_values();
      nw_queue_resume_source();
    }
  }
}

uint64_t __37__NPTunnelFlow_handleTunnelConnected__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 128))
  {
    nw_queue_cancel_source();
    *(void *)(*(void *)(a1 + 32) + 128) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t result = [*(id *)(v2 + 48) isConnectionAlive];
  if (result)
  {
    double v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__NPTunnelFlow_handleTunnelConnected__block_invoke_2;
    v5[3] = &unk_1E5A3B288;
    v5[4] = v4;
    return [v4 createTelemetryDataWithCompletionHandler:v5];
  }
  return result;
}

uint64_t __37__NPTunnelFlow_handleTunnelConnected__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 && a3)
  {
    if (a4) {
      return objc_msgSend(*(id *)(result + 32), "reportTelemetry:withService:url:", a2, a3);
    }
  }
  return result;
}

- (void)handleTunnelDisconnected
{
  if ([(NPTunnel *)self->_tunnel fallbackReason]) {
    self->_int64_t fallbackReason = [(NPTunnel *)self->_tunnel fallbackReason];
  }
  self->_int tunnelError = [(NPTunnel *)self->_tunnel error];
  [(NPTunnelFlow *)self closeFromTunnel];
}

- (void)handleTunnelCanHandleMoreData
{
  savedData = self->_savedData;
  if (savedData)
  {
    uint64_t v5 = savedData;
    double v4 = self->_savedData;
    self->_savedData = 0;

    if ([(OS_dispatch_data *)v5 length]) {
      [(NPTunnelFlow *)self handleAppData:v5];
    }
  }
  else
  {
    [(NPTunnelFlow *)self readDataFromClient];
  }
}

- (void)processConnectionInfo:(id)a3
{
  id v10 = a3;
  double v4 = [(NPTunnel *)self->_tunnel connectionStartDate];

  if (v4)
  {
    startDate = self->_startDate;
    id v6 = [(NPTunnel *)self->_tunnel connectionStartDate];
    [(NSDate *)startDate timeIntervalSinceDate:v6];
    double v8 = v7;

    if (v8 < 0.0) {
      [v10 setConnectionDelay:v8 * -1000.0];
    }
  }
  [v10 setFirstTxByteTimeStamp:self->_firstTxByteTimestamp];
  if (self->_firstTxByteTimestamp)
  {
    -[NSDate timeIntervalSinceDate:](self->_startDate, "timeIntervalSinceDate:");
    if (v9 < 0.0) {
      [v10 setFirstTxByteDelay:v9 * -1000.0];
    }
  }
}

- (id)createFallbackConnectionInfoWithFallbackReason:(int64_t)a3
{
  uint64_t v5 = objc_alloc_init(NSPConnectionInfo);
  [(NSPConnectionInfo *)v5 setFallbackReason:a3];
  [(NSPConnectionInfo *)v5 setPathType:2];
  id v6 = [(NPTunnel *)self->_tunnel path];
  if (v6)
  {
    double v7 = (void *)nw_path_copy_interface();
    if (v7) {
      [(NSPConnectionInfo *)v5 setInterfaceType:+[NPUtilities interfaceTypeOfInterface:v7]];
    }
  }
  return v5;
}

- (id)copyConnectionInfo
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_state == 3 && self->_hasTunnel)
  {
    uint64_t v3 = [(NPTunnel *)self->_tunnel createConnectionInfo];
    [(NPTunnelFlow *)self processConnectionInfo:v3];
  }
  else
  {
    uint64_t v3 = [(NPTunnelFlow *)self createFallbackConnectionInfoWithFallbackReason:self->_fallbackReason];
    if (![v3 fallbackReason] && !-[NPTunnelFlow disconnectedByApp](self, "disconnectedByApp"))
    {
      double v4 = nplog_obj();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        unint64_t hashKey = self->_hashKey;
        unint64_t identifier = self->_identifier;
        int v8 = 134218240;
        unint64_t v9 = hashKey;
        __int16 v10 = 2048;
        unint64_t v11 = identifier;
        _os_log_error_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_ERROR, "Flow %llu (%llu) is falling back with no fallback reason", (uint8_t *)&v8, 0x16u);
      }

      +[NPDiagnosticReport logInternalError:@"NoFallbackReason" context:0];
    }
    [v3 setTunnelConnectionError:self->_tunnelError];
    [v3 setFallbackDelay:self->_fallbackDelay];
    objc_msgSend(v3, "setIsTFOProbeSucceeded:", -[NPTunnel isTFOProbeSucceeded](self->_tunnel, "isTFOProbeSucceeded"));
  }
  return v3;
}

- (id)appData
{
  return 0;
}

- (void)setFallbackReason:(int64_t)a3
{
  if (a3 && (a3 != 12 || self->_state != 3) && !self->_fallbackReason) {
    self->_int64_t fallbackReason = a3;
  }
}

- (int64_t)fallbackReason
{
  return self->_fallbackReason;
}

- (BOOL)isBestEffort
{
  return 0;
}

- (id)combineStateInfo:(id)a3 andConnectionInfo:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = (void *)[a3 mutableCopy];
  int v8 = [v7 objectForKeyedSubscript:@"connection"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = (id)[v8 mutableCopy];
  }
  else {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  __int16 v10 = v9;
  unint64_t v11 = [v6 edgeAddress];

  if (v11)
  {
    uint64_t v12 = [v6 edgeAddress];
    [v10 setObject:v12 forKeyedSubscript:@"peer_address"];
  }
  __int16 v13 = +[NPUtilities getInterfaceName:](NPUtilities, "getInterfaceName:", [v6 interfaceType]);
  [v10 setObject:v13 forKeyedSubscript:@"interface"];

  [(NPTunnel *)self->_tunnel timeToFirstByte];
  uint64_t v15 = v14;
  [(NPTunnel *)self->_tunnel timeToFirstRequest];
  uint64_t v17 = v16;
  int bytes = 0;
  if (!SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 4uLL, &bytes)) {
    uint64_t v15 = ((double)(bytes % 30 + 100) / 100.0) * v15;
  }
  unint64_t v18 = [NSNumber numberWithUnsignedInt:v15];
  [v10 setObject:v18 forKeyedSubscript:@"ttfb"];

  unint64_t v19 = [NSNumber numberWithUnsignedInt:v17];
  [v10 setObject:v19 forKeyedSubscript:@"ttfr"];

  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v21 = [v6 interfaceName];

  if (v21)
  {
    v22 = [v6 TCPInfo];
    unint64_t v23 = [v6 interfaceName];
    unint64_t v24 = [v22 objectForKeyedSubscript:v23];

    if ([v24 length] == 408)
    {
      uint64_t v25 = [v24 bytes];
      unint64_t v26 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v25 + 24)];
      [v20 setObject:v26 forKeyedSubscript:@"rtt"];

      __int16 v27 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v25 + 28)];
      [v20 setObject:v27 forKeyedSubscript:@"rttvar"];

      unint64_t v28 = [NSNumber numberWithUnsignedLongLong:*(void *)(v25 + 284)];
      [v20 setObject:v28 forKeyedSubscript:@"resend"];

      __int16 v29 = [NSNumber numberWithUnsignedLongLong:*(void *)(v25 + 76)];
      [v20 setObject:v29 forKeyedSubscript:@"tx"];

      v30 = [NSNumber numberWithUnsignedLongLong:*(void *)(v25 + 108)];
      [v20 setObject:v30 forKeyedSubscript:@"rx"];
    }
  }
  v53 = self;
  v54 = v8;
  v55 = v7;
  uint64_t v31 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "TFOSucceeded"));
  [v20 setObject:v31 forKeyedSubscript:@"tfo"];

  [v10 setObject:v20 forKeyedSubscript:@"tcp"];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v32 = [v6 multipathSubflowSwitchCounts];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = 0;
    uint64_t v36 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v57 != v36) {
          objc_enumerationMutation(v32);
        }
        uint64_t v38 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        v39 = [v6 multipathSubflowSwitchCounts];
        v40 = [v39 objectForKeyedSubscript:v38];

        v35 += [v40 unsignedIntegerValue];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v56 objects:v63 count:16];
    }
    while (v34);
  }
  else
  {
    uint64_t v35 = 0;
  }

  v61[0] = @"enabled";
  v41 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isMultipath"));
  v62[0] = v41;
  v61[1] = @"subflows";
  v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "multipathSubflowCount"));
  v62[1] = v42;
  v61[2] = @"switches";
  v43 = [NSNumber numberWithUnsignedInteger:v35];
  v62[2] = v43;
  v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:3];
  [v10 setObject:v44 forKeyedSubscript:@"mptcp"];

  v45 = [v6 exceptions];

  if (v45)
  {
    v46 = [v6 exceptions];
    [v10 setObject:v46 forKeyedSubscript:@"exceptions"];
  }
  [v55 setObject:v10 forKeyedSubscript:@"connection"];
  uint64_t v47 = copyOSVersionString();
  uint64_t v48 = copyProductTypeString();
  if (v47 | v48)
  {
    id v49 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v50 = v49;
    if (v47) {
      [v49 setObject:v47 forKeyedSubscript:@"build"];
    }
    if (v48) {
      [v50 setObject:v48 forKeyedSubscript:@"type"];
    }
    [v55 setObject:v50 forKeyedSubscript:@"device"];
  }
  v51 = [(NSPAppRule *)v53->_appRule label];
  [v55 setObject:v51 forKeyedSubscript:@"source"];

  return v55;
}

- (void)createTelemetryDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NPTunnel *)self->_tunnel createConnectionInfo];
  if (v5)
  {
    id v6 = [(NEAppRule *)self->_appRule matchSigningIdentifier];
    objc_initWeak(&location, self);
    double v7 = +[NSPManager sharedManager];
    int v8 = [v5 edgeAddress];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__NPTunnelFlow_createTelemetryDataWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E5A3B768;
    v9[4] = self;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    id v10 = v5;
    [v7 fetchStateForClient:v6 withPeerEndpoint:v8 completionHandler:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
  }
}

void __57__NPTunnelFlow_createTelemetryDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(*(void *)(a1 + 32) + 48) parameters];
  id v11 = (void *)nw_parameters_copy_context();
  objc_copyWeak(&v17, (id *)(a1 + 56));
  id v12 = v7;
  id v16 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  id v14 = v8;
  id v15 = v9;
  nw_queue_context_async();

  objc_destroyWeak(&v17);
}

void __57__NPTunnelFlow_createTelemetryDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v2 = [WeakRetained combineStateInfo:*(void *)(a1 + 32) andConnectionInfo:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)reportTelemetry:(id)a3 withService:(id)a4 url:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [[NPTunnelFlowTelemetry alloc] initWithTunnel:self->_tunnel service:v9 postURL:v8];

  if (v10)
  {
    [(NPTunnel *)self->_tunnel addNewFlow:v10];
    [(NPTunnelFlowTelemetry *)v10 reportTelemetry:v11];
  }
}

- (unint64_t)hashKey
{
  return self->_hashKey;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (NPTunnel)tunnel
{
  return self->_tunnel;
}

- (int64_t)state
{
  return self->_state;
}

- (NSPAppRule)appRule
{
  return self->_appRule;
}

- (NPFlowProperties)extraFlowProperties
{
  return self->_extraFlowProperties;
}

- (NSDate)firstTxByteTimestamp
{
  return self->_firstTxByteTimestamp;
}

- (void)setFirstTxByteTimestamp:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)window
{
  return self->_window;
}

- (unint64_t)initialBytesLeftOver
{
  return self->_initialBytesLeftOver;
}

- (void)setInitialBytesLeftOver:(unint64_t)a3
{
  self->_initialBytesLeftOver = a3;
}

- (BOOL)isDirectConnectionViable
{
  return self->_isDirectConnectionViable;
}

- (void)setIsDirectConnectionViable:(BOOL)a3
{
  self->_isDirectConnectionViable = a3;
}

- (BOOL)fallbackDisabled
{
  return self->_fallbackDisabled;
}

- (void)setFallbackDisabled:(BOOL)a3
{
  self->_fallbackDisabled = a3;
}

- (BOOL)enableDirectRace
{
  return self->_enableDirectRace;
}

- (BOOL)disconnectedByApp
{
  return self->_disconnectedByApp;
}

- (void)setDisconnectedByApp:(BOOL)a3
{
  self->_disconnectedByApp = a3;
}

- (BOOL)shouldComposeIntialData
{
  return self->_shouldComposeIntialData;
}

- (void)setShouldComposeIntialData:(BOOL)a3
{
  self->_shouldComposeIntialData = a3;
}

- (OS_dispatch_data)savedData
{
  return self->_savedData;
}

- (void)setSavedData:(id)a3
{
}

- (void)fallbackTimer
{
  return self->_fallbackTimer;
}

- (void)setFallbackTimer:(void *)a3
{
  self->_fallbackTimer = a3;
}

- (void)telemetryTimer
{
  return self->_telemetryTimer;
}

- (void)setTelemetryTimer:(void *)a3
{
  self->_telemetryTimer = a3;
}

- (double)fallbackDelay
{
  return self->_fallbackDelay;
}

- (void)setFallbackDelay:(double)a3
{
  self->_fallbackDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedData, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_firstTxByteTimestamp, 0);
  objc_storeStrong((id *)&self->_extraFlowProperties, 0);
  objc_storeStrong((id *)&self->_appRule, 0);
  objc_storeStrong((id *)&self->_tunnel, 0);
}

@end