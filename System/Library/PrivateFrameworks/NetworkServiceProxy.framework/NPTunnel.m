@interface NPTunnel
+ (void)initializeProtocol;
- (BOOL)addNewFlow:(id)a3;
- (BOOL)canHandleMoreData;
- (BOOL)disableIdleTimeout;
- (BOOL)eof;
- (BOOL)flowIsFirstFlow:(id)a3;
- (BOOL)handledDisconnected;
- (BOOL)hasFlow:(unint64_t)a3;
- (BOOL)isCancelled;
- (BOOL)isConnectionAlive;
- (BOOL)isReadyForData;
- (BOOL)isTFOProbeSucceeded;
- (BOOL)start;
- (NPTunnel)initWithEndpoint:(id)a3 parameters:(id)a4 appRule:(id)a5 flowProperties:(id)a6 delegate:(id)a7;
- (NPTunnelDelegate)delegate;
- (NSDate)connectionStartDate;
- (NSMutableDictionary)flows;
- (NSPAppRule)appRule;
- (NSUUID)identifier;
- (OS_nw_endpoint)endpoint;
- (OS_nw_endpoint)localEndpoint;
- (OS_nw_interface)outputInterface;
- (OS_nw_parameters)parameters;
- (OS_nw_path)path;
- (double)timeToFirstByte;
- (double)timeToFirstRequest;
- (id)createConnectionInfo;
- (id)handleFlowClosed:(unint64_t)a3 withFallbackReason:(int64_t)a4;
- (int)error;
- (int64_t)connectionState;
- (int64_t)fallbackReason;
- (int64_t)sendData:(id)a3 forFlow:(id)a4;
- (nw_protocol)protocol;
- (unint64_t)allocateFlowID;
- (unint64_t)initialWindowSize;
- (unint64_t)maxDataSendSizeForFlow:(id)a3;
- (unint64_t)timestamps;
- (void)cancelConnection;
- (void)dealloc;
- (void)destroyConnection;
- (void)handleCanHandleMoreData;
- (void)handleConnected;
- (void)handleConnectionIsDisconnected;
- (void)handleDisconnected;
- (void)handleOutputAvailable;
- (void)handleReady;
- (void)increaseWindowSizeForFlow:(unint64_t)a3 byBytes:(unint64_t)a4;
- (void)readMinimumLength:(unint64_t)a3 maximumLength:(unint64_t)a4;
- (void)removeFlow:(unint64_t)a3;
- (void)sendData:(id)a3 toClientFlow:(unint64_t)a4;
- (void)setConnectionStartDate:(id)a3;
- (void)setConnectionState:(int64_t)a3;
- (void)setDisableIdleTimeout:(BOOL)a3;
- (void)setEof:(BOOL)a3;
- (void)setError:(int)a3;
- (void)setFallbackReason:(int64_t)a3;
- (void)setHandledDisconnected:(BOOL)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setPath:(id)a3;
- (void)setTimeToFirstByte:(double)a3;
- (void)setTimeToFirstRequest:(double)a3;
- (void)startIdleTimer;
- (void)teardownOutputHandler;
- (void)write:(id)a3;
@end

@implementation NPTunnel

+ (void)initializeProtocol
{
  if (_MergedGlobals_38 != -1) {
    dispatch_once(&_MergedGlobals_38, &__block_literal_global_11);
  }
}

- (NPTunnel)initWithEndpoint:(id)a3 parameters:(id)a4 appRule:(id)a5 flowProperties:(id)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)NPTunnel;
  v18 = [(NPTunnel *)&v24 init];
  if (v18)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F29128]);
    v20 = (void *)*((void *)v18 + 13);
    *((void *)v18 + 13) = v19;

    objc_storeWeak((id *)v18 + 18, v17);
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v22 = (void *)*((void *)v18 + 19);
    *((void *)v18 + 19) = v21;

    objc_storeStrong((id *)v18 + 15, a3);
    objc_storeStrong((id *)v18 + 14, a4);
    *(_OWORD *)(v18 + 56) = 0u;
    *(_OWORD *)(v18 + 40) = 0u;
    *(_OWORD *)(v18 + 24) = 0u;
    *(_OWORD *)(v18 + 8) = 0u;
    if (_MergedGlobals_38 != -1) {
      dispatch_once(&_MergedGlobals_38, &__block_literal_global_11);
    }
    *((void *)v18 + 3) = &xmmword_1EB53BDF0;
    *((void *)v18 + 4) = &xmmword_1EB53BE18;
    *((void *)v18 + 24) = 0;
    objc_storeStrong((id *)v18 + 20, a5);
    *((void *)v18 + 26) = [v16 timestamps];
    [v16 setTimestamps:0];
    v18[93] = [v16 disableIdleTimeout];
  }

  return (NPTunnel *)v18;
}

- (void)dealloc
{
  timestamps = self->_timestamps;
  if (timestamps)
  {
    free(timestamps);
    self->_timestamps = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NPTunnel;
  [(NPTunnel *)&v4 dealloc];
}

- (nw_protocol)protocol
{
  return &self->_protocol;
}

- (BOOL)addNewFlow:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(v4, "setIdentifier:", -[NPTunnel allocateFlowID](self, "allocateFlowID"));
  uint64_t v5 = [v4 identifier];
  if (v5)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
    [(NSMutableDictionary *)self->_flows setObject:v4 forKeyedSubscript:v6];
    if (self->_idleTimer)
    {
      nw_queue_cancel_source();
      self->_idleTimer = 0;
    }
    v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v4 hashKey];
      uint64_t v9 = [v4 identifier];
      v10 = [(NPTunnel *)self identifier];
      int v13 = 134218498;
      uint64_t v14 = v8;
      __int16 v15 = 2048;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) added to tunnel %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    [v4 setFallbackReason:7];
    v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(NPTunnel *)self identifier];
      int v13 = 138412290;
      uint64_t v14 = (uint64_t)v11;
      _os_log_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_DEFAULT, "%@: Ran out of flow identifiers", (uint8_t *)&v13, 0xCu);
    }
  }

  return v5 != 0;
}

- (unint64_t)allocateFlowID
{
  return 1;
}

- (void)startIdleTimer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_idleTimer)
  {
    nw_queue_cancel_source();
    self->_idleTimer = 0;
  }
  if (self->_disableIdleTimeout
    || ([(NSPAppRule *)self->_appRule connectionIdleTimeout],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 unsignedLongLongValue],
        v5,
        !v6))
  {
    v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(NPTunnel *)self identifier];
      *(_DWORD *)buf = 138412290;
      int v13 = v4;
      _os_log_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEFAULT, "%@: No more flows, cancelling the tunnel", buf, 0xCu);
    }
    [(NPTunnel *)self cancelConnection];
  }
  else
  {
    v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(NPTunnel *)self identifier];
      uint64_t v9 = [(NSPAppRule *)self->_appRule connectionIdleTimeout];
      *(_DWORD *)buf = 138412546;
      int v13 = v8;
      __int16 v14 = 2112;
      __int16 v15 = v9;
      _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEFAULT, "%@: No more flows, setting the idle timer to fire in %@ seconds", buf, 0x16u);
    }
    v10 = (void *)nw_parameters_copy_context();
    self->_idleTimer = (void *)nw_queue_context_create_source();

    v11 = [(NSPAppRule *)self->_appRule connectionIdleTimeout];
    dispatch_time(0, 1000000000 * [v11 unsignedLongLongValue]);
    nw_queue_set_timer_values();

    nw_queue_resume_source();
  }
}

uint64_t __26__NPTunnel_startIdleTimer__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 80);
  if (result)
  {
    nw_queue_cancel_source();
    *(void *)(*(void *)(a1 + 32) + 80) = 0;
    v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) identifier];
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Idle timer fired, cancelling the tunnel", (uint8_t *)&v5, 0xCu);
    }
    return [*(id *)(a1 + 32) cancelConnection];
  }
  return result;
}

- (void)removeFlow:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  flows = self->_flows;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  [(NSMutableDictionary *)flows removeObjectForKey:v6];

  uint64_t v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(NPTunnel *)self identifier];
    int v10 = 134218242;
    unint64_t v11 = a3;
    __int16 v12 = 2112;
    int v13 = v8;
    _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEFAULT, "Flow %llu removed from tunnel %@", (uint8_t *)&v10, 0x16u);
  }
  if (![(NSMutableDictionary *)self->_flows count])
  {
    int64_t connectionState = self->_connectionState;
    if ((unint64_t)(connectionState - 2) < 2)
    {
      [(NPTunnel *)self cancelConnection];
    }
    else if (connectionState == 5)
    {
      [(NPTunnel *)self teardownOutputHandler];
    }
    else if (connectionState == 4)
    {
      [(NPTunnel *)self startIdleTimer];
    }
  }
}

- (BOOL)hasFlow:(unint64_t)a3
{
  flows = self->_flows;
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  int v5 = [(NSMutableDictionary *)flows objectForKeyedSubscript:v4];
  LOBYTE(flows) = v5 != 0;

  return (char)flows;
}

- (id)handleFlowClosed:(unint64_t)a3 withFallbackReason:(int64_t)a4
{
  flows = self->_flows;
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v7 = [(NSMutableDictionary *)flows objectForKeyedSubscript:v6];

  if (v7)
  {
    if (a4) {
      [v7 setFallbackReason:a4];
    }
    [v7 closeFromTunnel];
  }
  return v7;
}

- (int64_t)sendData:(id)a3 forFlow:(id)a4
{
  return [a3 length];
}

- (void)increaseWindowSizeForFlow:(unint64_t)a3 byBytes:(unint64_t)a4
{
  flows = self->_flows;
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:a3];
  id v8 = [(NSMutableDictionary *)flows objectForKeyedSubscript:v6];

  uint64_t v7 = v8;
  if (v8)
  {
    [v8 increaseWindowSize:a4];
    uint64_t v7 = v8;
  }
}

- (void)sendData:(id)a3 toClientFlow:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  timestamps = self->_timestamps;
  if (timestamps) {
    BOOL v8 = g_recordTimestamps == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && !timestamps[12]) {
    timestamps[12] = mach_absolute_time();
  }
  flows = self->_flows;
  int v10 = [NSNumber numberWithUnsignedLongLong:a4];
  unint64_t v11 = [(NSMutableDictionary *)flows objectForKeyedSubscript:v10];

  if (v11)
  {
    if (self->_timeToFirstByte == 0.0)
    {
      kdebug_trace();
      __int16 v12 = [v11 startDate];
      [v12 timeIntervalSinceNow];
      self->_double timeToFirstByte = fabs(v13 * 1000.0) - self->_timeToFirstRequest;

      uint64_t v14 = [v11 startDate];
      [v14 timeIntervalSinceDate:self->_connectionStartDate];
      double v16 = v15;

      __int16 v17 = nplog_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if (v16 >= 0.0) {
          double v18 = 0.0;
        }
        else {
          double v18 = v16 * -1000.0;
        }
        uint64_t v19 = [(NPTunnel *)self identifier];
        double timeToFirstRequest = self->_timeToFirstRequest;
        double timeToFirstByte = self->_timeToFirstByte;
        int v22 = 138413058;
        v23 = v19;
        __int16 v24 = 2048;
        double v25 = timeToFirstByte;
        __int16 v26 = 2048;
        double v27 = timeToFirstRequest;
        __int16 v28 = 2048;
        double v29 = v18;
        _os_log_impl(&dword_1A0FEE000, v17, OS_LOG_TYPE_DEFAULT, "%@: TTFB: %f TTFR: %f ConnectionDelay: %f", (uint8_t *)&v22, 0x2Au);
      }
    }
    [v11 sendDataToClient:v6 fromTunnel:1];
  }
}

- (void)handleConnected
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tunnelDidConnect:self];

  if ([(NSMutableDictionary *)self->_flows count])
  {
    id v4 = [(NSMutableDictionary *)self->_flows allKeys];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [(NSMutableDictionary *)self->_flows objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * i)];
          [v9 handleTunnelConnected];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [(NPTunnel *)self startIdleTimer];
  }
}

- (void)handleReady
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_int64_t connectionState = 4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tunnelIsReady:self];

  self->_isReadyForData = 1;
  id v4 = [(NSMutableDictionary *)self->_flows allKeys];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(NSMutableDictionary *)self->_flows objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
        [v9 handleTunnelReadyForData];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)handleDisconnected
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(NSMutableDictionary *)self->_flows allKeys];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [(NSMutableDictionary *)self->_flows objectForKeyedSubscript:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        [v8 handleTunnelDisconnected];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)handleCanHandleMoreData
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_flows;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_flows, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        [v8 handleTunnelCanHandleMoreData];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)canHandleMoreData
{
  return 0;
}

- (unint64_t)initialWindowSize
{
  return 0;
}

- (id)createConnectionInfo
{
  return 0;
}

- (unint64_t)maxDataSendSizeForFlow:(id)a3
{
  return 0;
}

- (BOOL)isConnectionAlive
{
  return self->_connectionState != 5;
}

- (BOOL)start
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  output_handler = self->_protocol.output_handler;
  if (output_handler)
  {
    self->_int64_t connectionState = 2;
    uint64_t v4 = (uint64_t (*)(void))*((void *)output_handler->callbacks + 3);
    return v4();
  }
  else
  {
    uint64_t v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [(NPTunnel *)self identifier];
      int v8 = 138412290;
      long long v9 = v7;
      _os_log_error_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_ERROR, "%@: Cannot start the connection, no output handler available", (uint8_t *)&v8, 0xCu);
    }
    return 0;
  }
}

- (BOOL)flowIsFirstFlow:(id)a3
{
  return 0;
}

- (void)handleConnectionIsDisconnected
{
  savedData = self->_savedData;
  self->_savedData = 0;

  [(NPTunnel *)self handleDisconnected];
  if (self->_connectionState == 5)
  {
    uint64_t v4 = [(NPTunnel *)self parameters];
    uint64_t v5 = (void *)nw_parameters_copy_context();
    nw_queue_context_async();
  }
}

uint64_t __42__NPTunnel_handleConnectionIsDisconnected__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) destroyConnection];
}

- (void)handleOutputAvailable
{
  if (self->_savedData) {
    [(NPTunnel *)self write:0];
  }
}

- (void)write:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  data2 = a3;
  v37[0] = 0;
  v37[1] = 0;
  nw_frame_array_init();
  v36[0] = 0;
  v36[1] = 0;
  nw_frame_array_init();
  output_handler = self->_protocol.output_handler;
  if (self->_connectionState == 5 || output_handler == 0)
  {
    uint64_t v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = [(NPTunnel *)self identifier];
      LODWORD(v40) = 138412290;
      *(void *)((char *)&v40 + 4) = v28;
      _os_log_error_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_ERROR, "%@: write called while not connected", (uint8_t *)&v40, 0xCu);
    }
    [(NPTunnel *)self handleDataWrittenWithError:57];
    goto LABEL_49;
  }
  savedData = self->_savedData;
  if (savedData)
  {
    if (data2) {
      dispatch_data_t concat = dispatch_data_create_concat(savedData, data2);
    }
    else {
      dispatch_data_t concat = savedData;
    }
    subrange = concat;
    uint64_t v10 = self->_savedData;
    self->_savedData = 0;
  }
  else
  {
    subrange = data2;
  }
  if (!subrange)
  {
    [(NPTunnel *)self handleDataWrittenWithError:0];
    goto LABEL_49;
  }
  long long v11 = (void (*)(nw_protocol *, nw_protocol *, uint64_t, size_t, uint64_t, void *))*((void *)output_handler->callbacks
                                                                                               + 11);
  size_t size = dispatch_data_get_size(subrange);
  v11(output_handler, &self->_protocol, 1, size, 0xFFFFFFFFLL, v37);
  long long v13 = nw_frame_array_first();
  if (!v13)
  {
    uint64_t v14 = 0;
    goto LABEL_39;
  }
  while (1)
  {
    uint64_t v14 = nw_frame_array_next();
    size_t v15 = dispatch_data_get_size(subrange);
    *(void *)&long long v40 = 0;
    *((void *)&v40 + 1) = &v40;
    uint64_t v41 = 0x2020000000;
    int v42 = 0;
    if (nw_frame_uses_external_data())
    {
      if ((nw_frame_set_external_data() & 1) == 0)
      {
        v23 = nplog_obj();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v31 = [(NPTunnel *)self identifier];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v31;
          _os_log_error_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_ERROR, "%@: Failed to set data in frame", buf, 0xCu);
        }
        goto LABEL_38;
      }
    }
    else
    {
      unsigned int v35 = 0;
      uint64_t v16 = nw_frame_unclaimed_bytes();
      if (v35)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        uint64_t v39 = v35;
        v34[0] = 0;
        v34[1] = v34;
        v34[2] = 0x2020000000;
        v34[3] = 0;
        applier[0] = MEMORY[0x1E4F143A8];
        applier[1] = 3221225472;
        applier[2] = __18__NPTunnel_write___block_invoke;
        applier[3] = &unk_1E5A3C020;
        applier[4] = buf;
        applier[5] = v34;
        applier[6] = &v40;
        applier[7] = v16;
        dispatch_data_apply(subrange, applier);
        _Block_object_dispose(v34, 8);
        _Block_object_dispose(buf, 8);
      }
    }
    if (!*(_DWORD *)(*((void *)&v40 + 1) + 24))
    {
      uint64_t v19 = nplog_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [(NPTunnel *)self identifier];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v20;
        _os_log_impl(&dword_1A0FEE000, v19, OS_LOG_TYPE_DEFAULT, "%@: Did not write any bytes to a frame", buf, 0xCu);
      }
      goto LABEL_29;
    }
    if ((nw_frame_claim() & 1) == 0) {
      break;
    }
    nw_frame_collapse();
    nw_frame_unclaim();
    size_t v17 = *(unsigned int *)(*((void *)&v40 + 1) + 24);
    size_t v18 = v15 - v17;
    if (v15 <= v17)
    {
      uint64_t v19 = subrange;
      subrange = 0;
    }
    else
    {
      uint64_t v19 = subrange;
      subrange = dispatch_data_create_subrange(subrange, v17, v18);
    }
LABEL_29:

    nw_frame_array_remove();
    nw_frame_array_append();

    _Block_object_dispose(&v40, 8);
    if (subrange)
    {
      long long v13 = v14;
      if (v14) {
        continue;
      }
    }
    goto LABEL_39;
  }
  v23 = nplog_obj();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    id v21 = [(NPTunnel *)self identifier];
    int v22 = *(_DWORD *)(*((void *)&v40 + 1) + 24);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v22;
    _os_log_error_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_ERROR, "%@: Failed to claim %u bytes", buf, 0x12u);
  }
LABEL_38:

  _Block_object_dispose(&v40, 8);
  uint64_t v14 = v13;
LABEL_39:
  if ((nw_frame_array_is_empty() & 1) == 0) {
    (*((void (**)(nw_protocol *, void *))output_handler->callbacks + 12))(output_handler, v36);
  }
  if ((nw_frame_array_is_empty() & 1) == 0)
  {
    *(void *)&long long v40 = 0;
    *((void *)&v40 + 1) = &v40;
    uint64_t v41 = 0x2020000000;
    int v42 = 0;
    nw_frame_array_foreach();
    double v25 = nplog_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      double v29 = [(NPTunnel *)self identifier];
      int v30 = *(_DWORD *)(*((void *)&v40 + 1) + 24);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v29;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v30;
      _os_log_error_impl(&dword_1A0FEE000, v25, OS_LOG_TYPE_ERROR, "%@: Failed to use %u frames", buf, 0x12u);
    }
    _Block_object_dispose(&v40, 8);
  }
  if (subrange)
  {
    __int16 v26 = self->_savedData;
    self->_savedData = (OS_dispatch_data *)subrange;
    double v27 = subrange;
  }
  else
  {
    [(NPTunnel *)self handleDataWrittenWithError:0];
  }

LABEL_49:
}

BOOL __18__NPTunnel_write___block_invoke(void *a1, int a2, int a3, void *__src, size_t a5)
{
  if (*(void *)(*(void *)(a1[4] + 8) + 24) >= a5) {
    size_t v6 = a5;
  }
  else {
    size_t v6 = *(void *)(*(void *)(a1[4] + 8) + 24);
  }
  memcpy((void *)(a1[7] + *(void *)(*(void *)(a1[5] + 8) + 24)), __src, v6);
  *(void *)(*(void *)(a1[4] + 8) + 24) -= v6;
  *(void *)(*(void *)(a1[5] + 8) + 24) += v6;
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) += v6;
  return *(void *)(*(void *)(a1[4] + 8) + 24) != 0;
}

uint64_t __18__NPTunnel_write___block_invoke_7(uint64_t a1)
{
  return 1;
}

- (void)readMinimumLength:(unint64_t)a3 maximumLength:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_connectionState == 5)
  {
    uint64_t v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      size_t v6 = [(NPTunnel *)self identifier];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEFAULT, "%@: read called after the connection was torn down", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    output_handler = self->_protocol.output_handler;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    nw_frame_array_init();
    if ((*((unsigned int (**)(nw_protocol *, nw_protocol *, unint64_t, unint64_t, uint64_t, uint64_t *))output_handler->callbacks
          + 10))(output_handler, &self->_protocol, a3, a4, 0xFFFFFFFFLL, &v10))
    {
      [(NPTunnel *)self handleReadData:&v10];
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      long long v13 = __np_tunnel_finalize_output_frames_block_invoke;
      uint64_t v14 = &__block_descriptor_40_e31_B16__0__NSObject_OS_nw_frame__8l;
      size_t v15 = &v10;
      nw_frame_array_foreach();
    }
    else if (self->_eof)
    {
      [(NPTunnel *)self handleEOF];
    }
  }
}

- (void)cancelConnection
{
  self->_isCancelled = 1;
  if (self->_idleTimer)
  {
    nw_queue_cancel_source();
    self->_idleTimer = 0;
  }
  int64_t connectionState = self->_connectionState;
  if ((unint64_t)(connectionState - 2) >= 3)
  {
    if (connectionState != 5)
    {
      self->_int64_t connectionState = 5;
      size_t v6 = [(NPTunnel *)self parameters];
      uint64_t v7 = (void *)nw_parameters_copy_context();
      nw_queue_context_async();
    }
  }
  else
  {
    self->_int64_t connectionState = 5;
    output_handler = self->_protocol.output_handler;
    if (output_handler)
    {
      uint64_t v5 = (void (*)(void))*((void *)output_handler->callbacks + 4);
      v5();
    }
  }
}

uint64_t __28__NPTunnel_cancelConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) destroyConnection];
}

- (void)destroyConnection
{
  if (![(NSMutableDictionary *)self->_flows count]) {
    [(NPTunnel *)self teardownOutputHandler];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tunnelDidCancel:self];

  MEMORY[0x1F40F3B38](&self->_protocol);
}

- (void)teardownOutputHandler
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  output_handler = self->_protocol.output_handler;
  uint64_t v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v8 = [(NPTunnel *)self identifier];
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_debug_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_DEBUG, "%@: Tearing down output handler", (uint8_t *)&v9, 0xCu);
  }
  if (output_handler)
  {
    callbacks = output_handler->callbacks;
    if (callbacks)
    {
      size_t v6 = (void (*)(nw_protocol *, nw_protocol *, uint64_t))*((void *)callbacks + 1);
      if (v6) {
        v6(output_handler, &self->_protocol, 1);
      }
    }
  }
  handle = self->_protocol.handle;
  self->_protocol.output_handler = 0;
  self->_protocol.handle = 0;
}

- (OS_nw_interface)outputInterface
{
  flow_id = self->_protocol.output_handler->flow_id;
  if (flow_id)
  {
    flow_id = (*(void (**)(void))(flow_id[3] + 208))();
  }
  return (OS_nw_interface *)flow_id;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (OS_nw_parameters)parameters
{
  return self->_parameters;
}

- (OS_nw_endpoint)endpoint
{
  return self->_endpoint;
}

- (OS_nw_endpoint)localEndpoint
{
  return self->_localEndpoint;
}

- (void)setLocalEndpoint:(id)a3
{
}

- (OS_nw_path)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NPTunnelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPTunnelDelegate *)WeakRetained;
}

- (NSMutableDictionary)flows
{
  return self->_flows;
}

- (NSPAppRule)appRule
{
  return self->_appRule;
}

- (NSDate)connectionStartDate
{
  return self->_connectionStartDate;
}

- (void)setConnectionStartDate:(id)a3
{
}

- (double)timeToFirstRequest
{
  return self->_timeToFirstRequest;
}

- (void)setTimeToFirstRequest:(double)a3
{
  self->_double timeToFirstRequest = a3;
}

- (double)timeToFirstByte
{
  return self->_timeToFirstByte;
}

- (void)setTimeToFirstByte:(double)a3
{
  self->_double timeToFirstByte = a3;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_int64_t connectionState = a3;
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (int64_t)fallbackReason
{
  return self->_fallbackReason;
}

- (void)setFallbackReason:(int64_t)a3
{
  self->_fallbackReason = a3;
}

- (unint64_t)timestamps
{
  return self->_timestamps;
}

- (BOOL)isTFOProbeSucceeded
{
  return self->_isTFOProbeSucceeded;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)isReadyForData
{
  return self->_isReadyForData;
}

- (BOOL)eof
{
  return self->_eof;
}

- (void)setEof:(BOOL)a3
{
  self->_eof = a3;
}

- (BOOL)handledDisconnected
{
  return self->_handledDisconnected;
}

- (void)setHandledDisconnected:(BOOL)a3
{
  self->_handledDisconnected = a3;
}

- (BOOL)disableIdleTimeout
{
  return self->_disableIdleTimeout;
}

- (void)setDisableIdleTimeout:(BOOL)a3
{
  self->_disableIdleTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionStartDate, 0);
  objc_storeStrong((id *)&self->_appRule, 0);
  objc_storeStrong((id *)&self->_flows, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_savedData, 0);
}

@end