@interface NPTunnelFlowDNS
- (BOOL)checkAndReportTelemetry;
- (BOOL)shouldSendDataToClient:(id)a3 fromTunnel:(BOOL)a4;
- (BOOL)telemetryReported;
- (NSPDNSPacket)directDNSResponse;
- (NSPDNSPacket)query;
- (NSPDNSPacket)tunnelDNSResponse;
- (id)addDNSInfoToTelemetry:(id)a3;
- (id)createStateDictionaryWithResult:(int64_t)a3 response:(id)a4;
- (id)resultToString:(int64_t)a3;
- (int64_t)directResult;
- (int64_t)tunnelResult;
- (void)cleanupLosingConnection:(BOOL)a3;
- (void)closeFromDirectConnectionWithError:(int)a3;
- (void)closeFromTunnel;
- (void)handleAppData:(id)a3;
- (void)sendDataToClient:(id)a3 fromTunnel:(BOOL)a4;
- (void)setDirectDNSResponse:(id)a3;
- (void)setDirectResult:(int64_t)a3;
- (void)setQuery:(id)a3;
- (void)setTelemetryReported:(BOOL)a3;
- (void)setTunnelDNSResponse:(id)a3;
- (void)setTunnelResponseTimer:(void *)a3;
- (void)setTunnelResult:(int64_t)a3;
- (void)tunnelResponseTimer;
@end

@implementation NPTunnelFlowDNS

- (BOOL)shouldSendDataToClient:(id)a3 fromTunnel:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)NPTunnelFlowDNS;
  unsigned int v7 = [(NPTunnelFlow *)&v36 shouldSendDataToClient:v6 fromTunnel:v4];
  if (v4)
  {
    if (![(NPTunnelFlowDNS *)self tunnelResult])
    {
      id v20 = [[NSPDNSPacket alloc] initFromData:v6];
      [(NPTunnelFlowDNS *)self setTunnelDNSResponse:v20];

      v21 = [(NPTunnelFlowDNS *)self tunnelDNSResponse];

      if (v21)
      {
        v22 = [(NPTunnelFlowDNS *)self tunnelDNSResponse];
        uint64_t v23 = [v22 identifier];
        v24 = [(NPTunnelFlowDNS *)self query];
        uint64_t v25 = [v24 identifier];

        if (v23 == v25)
        {
          v26 = nplog_obj();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = [(NPTunnelFlowDNS *)self tunnelDNSResponse];
            uint64_t v28 = [v27 identifier];
            *(_DWORD *)buf = 134217984;
            unint64_t v38 = v28;
            _os_log_impl(&dword_1A0FEE000, v26, OS_LOG_TYPE_DEFAULT, "Received DNS response %ld from the tunnel", buf, 0xCu);
          }
          [(NPTunnelFlowDNS *)self setTunnelResult:4];
          if ([(NPTunnelFlowDNS *)self tunnelResponseTimer])
          {
            [(NPTunnelFlowDNS *)self tunnelResponseTimer];
            nw_queue_cancel_source();
            [(NPTunnelFlowDNS *)self setTunnelResponseTimer:0];
          }
        }
      }
      else
      {
        v32 = nplog_obj();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A0FEE000, v32, OS_LOG_TYPE_ERROR, "Failed to parse a DNS response from the tunnel", buf, 2u);
        }

        [(NPTunnelFlowDNS *)self setTunnelResult:2];
      }
    }
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = v7;
    if ([(NPTunnelFlowDNS *)self directResult]) {
      goto LABEL_20;
    }
    id v9 = [[NSPDNSPacket alloc] initFromData:v6];
    [(NPTunnelFlowDNS *)self setDirectDNSResponse:v9];

    v10 = [(NPTunnelFlowDNS *)self directDNSResponse];

    if (v10)
    {
      v11 = [(NPTunnelFlowDNS *)self directDNSResponse];
      uint64_t v12 = [v11 identifier];
      v13 = [(NPTunnelFlowDNS *)self query];
      uint64_t v14 = [v13 identifier];

      if (v12 != v14) {
        goto LABEL_20;
      }
      v15 = nplog_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [(NPTunnelFlowDNS *)self directDNSResponse];
        uint64_t v17 = [v16 identifier];
        *(_DWORD *)buf = 134217984;
        unint64_t v38 = v17;
        _os_log_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_DEFAULT, "Received DNS response %ld from the direct connection", buf, 0xCu);
      }
      v18 = self;
      uint64_t v19 = 4;
    }
    else
    {
      v29 = nplog_obj();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A0FEE000, v29, OS_LOG_TYPE_ERROR, "Failed to parse a DNS response from the direct connection", buf, 2u);
      }

      v18 = self;
      uint64_t v19 = 2;
    }
    [(NPTunnelFlowDNS *)v18 setDirectResult:v19];
  }
LABEL_20:
  v30 = nplog_obj();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v33 = [(NPTunnelFlow *)self hashKey];
    unint64_t v34 = [(NPTunnelFlow *)self identifier];
    v35 = @"should not";
    *(_DWORD *)buf = 134218498;
    unint64_t v38 = v33;
    if (v8) {
      v35 = @"should";
    }
    __int16 v39 = 2048;
    unint64_t v40 = v34;
    __int16 v41 = 2112;
    v42 = v35;
    _os_log_debug_impl(&dword_1A0FEE000, v30, OS_LOG_TYPE_DEBUG, "DNS Flow %llu (%llu): %@ send data to client", buf, 0x20u);
  }

  return v8;
}

- (void)sendDataToClient:(id)a3 fromTunnel:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NPTunnelFlowDNS;
  [(NPTunnelFlowProtocol *)&v5 sendDataToClient:a3 fromTunnel:a4];
  if ([(NPTunnelFlowDNS *)self checkAndReportTelemetry])
  {
    if (![(NPTunnelFlow *)self isDirectConnectionViable]) {
      [(NPTunnelFlowDNS *)self closeFromTunnel];
    }
  }
}

- (void)closeFromTunnel
{
  v3 = [(NPTunnelFlow *)self tunnel];
  char v4 = objc_msgSend(v3, "hasFlow:", -[NPTunnelFlow identifier](self, "identifier"));

  if ((v4 & 1) == 0)
  {
    if (![(NPTunnelFlowDNS *)self tunnelResult]) {
      [(NPTunnelFlowDNS *)self setTunnelResult:3];
    }
    [(NPTunnelFlowDNS *)self checkAndReportTelemetry];
    goto LABEL_7;
  }
  if ([(NPTunnelFlowDNS *)self checkAndReportTelemetry])
  {
    objc_super v5 = [(NPTunnelFlow *)self tunnel];
    [v5 closeFlow:self];

LABEL_7:
    v9.receiver = self;
    v9.super_class = (Class)NPTunnelFlowDNS;
    [(NPTunnelFlow *)&v9 closeFromTunnel];
    return;
  }
  if (![(NPTunnelFlowDNS *)self tunnelResponseTimer])
  {
    id v6 = [(NPTunnelFlow *)self tunnel];
    unsigned int v7 = [v6 parameters];
    BOOL v8 = (void *)nw_parameters_copy_context();
    [(NPTunnelFlowDNS *)self setTunnelResponseTimer:nw_queue_context_create_source()];

    [(NPTunnelFlowDNS *)self tunnelResponseTimer];
    dispatch_time(0, 30000000000);
    nw_queue_set_timer_values();
    [(NPTunnelFlowDNS *)self tunnelResponseTimer];
    nw_queue_resume_source();
  }
}

uint64_t __34__NPTunnelFlowDNS_closeFromTunnel__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) hashKey];
    uint64_t v4 = [*(id *)(a1 + 32) identifier];
    int v6 = 134218240;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A0FEE000, v2, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) tunnel DNS response timer fired", (uint8_t *)&v6, 0x16u);
  }

  uint64_t result = [*(id *)(a1 + 32) tunnelResponseTimer];
  if (result)
  {
    [*(id *)(a1 + 32) tunnelResponseTimer];
    nw_queue_cancel_source();
    [*(id *)(a1 + 32) setTunnelResponseTimer:0];
    [*(id *)(a1 + 32) setTunnelResult:1];
    [*(id *)(a1 + 32) checkAndReportTelemetry];
    return [*(id *)(a1 + 32) closeFromTunnel];
  }
  return result;
}

- (void)closeFromDirectConnectionWithError:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPTunnelFlowDNS;
  [(NPTunnelFlow *)&v4 closeFromDirectConnectionWithError:*(void *)&a3];
  if (![(NPTunnelFlowDNS *)self directResult]) {
    [(NPTunnelFlowDNS *)self setDirectResult:1];
  }
  [(NPTunnelFlowDNS *)self checkAndReportTelemetry];
}

- (BOOL)checkAndReportTelemetry
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([(NPTunnelFlowDNS *)self telemetryReported]
    || ![(NPTunnelFlowDNS *)self tunnelResult]
    || ![(NPTunnelFlowDNS *)self directResult])
  {
    return [(NPTunnelFlowDNS *)self telemetryReported];
  }
  uint64_t v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v28 = [(NPTunnelFlow *)self hashKey];
    __int16 v29 = 2048;
    unint64_t v30 = [(NPTunnelFlow *)self identifier];
    _os_log_debug_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) tunnel and direct DNS results known, checking if telemetry should be reported", buf, 0x16u);
  }

  objc_super v4 = [(NPTunnelFlow *)self appRule];
  objc_super v5 = [v4 telemetryRatio];

  [(NPTunnelFlowDNS *)self setTelemetryReported:1];
  int v6 = [(NPTunnelFlow *)self tunnel];
  char v7 = [v6 isConnectionAlive];

  if (v7)
  {
    [v5 doubleValue];
    if (v8 == 0.0)
    {
      uint64_t v9 = nplog_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        unint64_t v10 = [(NPTunnelFlow *)self hashKey];
        unint64_t v11 = [(NPTunnelFlow *)self identifier];
        *(_DWORD *)buf = 134218240;
        unint64_t v28 = v10;
        __int16 v29 = 2048;
        unint64_t v30 = v11;
        uint64_t v12 = "Flow %llu (%llu) configured telemetry ratio is 0";
LABEL_12:
        v15 = v9;
        uint32_t v16 = 22;
LABEL_13:
        _os_log_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_INFO, v12, buf, v16);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    BOOL v18 = +[NPUtilities rollDiceWithSuccessRatio:v5];
    uint64_t v19 = nplog_obj();
    uint64_t v9 = v19;
    if (!v18)
    {
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      unint64_t v21 = [(NPTunnelFlow *)self hashKey];
      unint64_t v22 = [(NPTunnelFlow *)self identifier];
      [v5 doubleValue];
      *(_DWORD *)buf = 134218496;
      unint64_t v28 = v21;
      __int16 v29 = 2048;
      unint64_t v30 = v22;
      __int16 v31 = 2048;
      uint64_t v32 = v23;
      uint64_t v12 = "Flow %llu (%llu) random telemety ratio did not fall within configured ratio (%f)";
      v15 = v9;
      uint32_t v16 = 32;
      goto LABEL_13;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v24 = [(NPTunnelFlow *)self hashKey];
      unint64_t v25 = [(NPTunnelFlow *)self identifier];
      *(_DWORD *)buf = 134218240;
      unint64_t v28 = v24;
      __int16 v29 = 2048;
      unint64_t v30 = v25;
      _os_log_debug_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) reporting telemetry", buf, 0x16u);
    }

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __42__NPTunnelFlowDNS_checkAndReportTelemetry__block_invoke;
    v26[3] = &unk_1E5A3B288;
    v26[4] = self;
    [(NPTunnelFlow *)self createTelemetryDataWithCompletionHandler:v26];

    return [(NPTunnelFlowDNS *)self telemetryReported];
  }
  uint64_t v9 = nplog_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    unint64_t v13 = [(NPTunnelFlow *)self hashKey];
    unint64_t v14 = [(NPTunnelFlow *)self identifier];
    *(_DWORD *)buf = 134218240;
    unint64_t v28 = v13;
    __int16 v29 = 2048;
    unint64_t v30 = v14;
    uint64_t v12 = "Flow %llu (%llu) not reporting telemetry because the tunnel is not connected";
    goto LABEL_12;
  }
LABEL_14:

  BOOL v17 = [(NPTunnelFlowDNS *)self telemetryReported];
  return v17;
}

void __42__NPTunnelFlowDNS_checkAndReportTelemetry__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  char v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 addDNSInfoToTelemetry:a2];
  [*(id *)(a1 + 32) reportTelemetry:v10 withService:v9 url:v8];
}

- (id)resultToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_1E5A3B2A8[a3 - 1];
  }
}

- (id)createStateDictionaryWithResult:(int64_t)a3 response:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = [(NPTunnelFlowDNS *)self resultToString:a3];
  [v7 setObject:v8 forKeyedSubscript:@"net_result"];

  if (v6)
  {
    id v9 = [v6 responseCodeString];
    [v7 setObject:v9 forKeyedSubscript:@"response"];

    id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
    unint64_t v11 = [v6 answers];
    uint64_t v12 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    unint64_t v13 = objc_msgSend(v6, "answers", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          BOOL v18 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyStateDictionary];
          if (v18) {
            [v12 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    [v7 setObject:v12 forKeyedSubscript:@"answers"];
    uint64_t v19 = [v6 timestamp];
    id v20 = [(NPTunnelFlowDNS *)self query];
    unint64_t v21 = [v20 timestamp];
    [v19 timeIntervalSinceDate:v21];
    double v23 = v22 * 1000.0;

    unint64_t v24 = (void *)[objc_alloc(NSNumber) initWithDouble:v23];
    [v7 setObject:v24 forKeyedSubscript:@"rtt"];
  }
  return v7;
}

- (id)addDNSInfoToTelemetry:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (void *)[a3 mutableCopy];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v7 = [(NPTunnelFlowDNS *)self query];
  id v8 = [v7 queries];
  id v9 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v8, "count"));

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = [(NPTunnelFlowDNS *)self query];
  unint64_t v11 = [v10 queries];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * i) copyStateDictionary];
        if (v16) {
          [v9 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  [v5 setObject:v9 forKeyedSubscript:@"questions"];
  int64_t v17 = [(NPTunnelFlowDNS *)self tunnelResult];
  BOOL v18 = [(NPTunnelFlowDNS *)self tunnelDNSResponse];
  uint64_t v19 = [(NPTunnelFlowDNS *)self createStateDictionaryWithResult:v17 response:v18];

  if (v19) {
    [v5 setObject:v19 forKeyedSubscript:@"alternate"];
  }
  int64_t v20 = [(NPTunnelFlowDNS *)self directResult];
  unint64_t v21 = [(NPTunnelFlowDNS *)self directDNSResponse];
  double v22 = [(NPTunnelFlowDNS *)self createStateDictionaryWithResult:v20 response:v21];

  if (v22) {
    [v5 setObject:v22 forKeyedSubscript:@"direct"];
  }
  [v4 setObject:v5 forKeyedSubscript:@"dns"];

  return v4;
}

- (void)cleanupLosingConnection:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v6 = [(NPTunnelFlow *)self hashKey];
    unint64_t v7 = [(NPTunnelFlow *)self identifier];
    id v8 = @"Direct";
    int v9 = 134218498;
    unint64_t v10 = v6;
    if (v3) {
      id v8 = @"Tunnel";
    }
    __int16 v11 = 2048;
    unint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) %@ won: skip cleanup of losing connection", (uint8_t *)&v9, 0x20u);
  }
}

- (void)handleAppData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    unint64_t v18 = [(NPTunnelFlow *)self hashKey];
    __int16 v19 = 2048;
    unint64_t v20 = [(NPTunnelFlow *)self identifier];
    __int16 v21 = 2048;
    uint64_t v22 = [v4 length];
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "DNS Flow %llu (%llu) received %lu bytes from the app", buf, 0x20u);
  }

  if ([v4 length])
  {
    if ([(NPTunnelFlow *)self state] == 1)
    {
      id v6 = [[NSPDNSPacket alloc] initFromData:v4];
      [(NPTunnelFlowDNS *)self setQuery:v6];

      unint64_t v7 = [(NPTunnelFlowDNS *)self query];

      id v8 = nplog_obj();
      int v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          unint64_t v10 = [(NPTunnelFlow *)self hashKey];
          unint64_t v11 = [(NPTunnelFlow *)self identifier];
          unint64_t v12 = [(NPTunnelFlowDNS *)self query];
          uint64_t v13 = [v12 identifier];
          *(_DWORD *)buf = 134218496;
          unint64_t v18 = v10;
          __int16 v19 = 2048;
          unint64_t v20 = v11;
          __int16 v21 = 2048;
          uint64_t v22 = v13;
          _os_log_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_INFO, "Flow %llu (%llu) received query %ld", buf, 0x20u);
        }
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          unint64_t v14 = [(NPTunnelFlow *)self hashKey];
          unint64_t v15 = [(NPTunnelFlow *)self identifier];
          *(_DWORD *)buf = 134218240;
          unint64_t v18 = v14;
          __int16 v19 = 2048;
          unint64_t v20 = v15;
          _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Flow %llu (%llu) failed to parse the DNS query", buf, 0x16u);
        }

        [(NPTunnelFlowDNS *)self setTelemetryReported:1];
      }
      [(NPTunnelFlowUDP *)self startDirectConnection];
    }
    v16.receiver = self;
    v16.super_class = (Class)NPTunnelFlowDNS;
    [(NPTunnelFlowUDP *)&v16 handleAppData:v4];
  }
  else
  {
    [(NPTunnelFlowDNS *)self closeFromDirectConnectionWithError:0];
    [(NPTunnelFlowDNS *)self closeFromTunnel];
  }
}

- (NSPDNSPacket)query
{
  return (NSPDNSPacket *)objc_getProperty(self, a2, 224, 1);
}

- (void)setQuery:(id)a3
{
}

- (int64_t)tunnelResult
{
  return self->_tunnelResult;
}

- (void)setTunnelResult:(int64_t)a3
{
  self->_tunnelResult = a3;
}

- (NSPDNSPacket)tunnelDNSResponse
{
  return (NSPDNSPacket *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTunnelDNSResponse:(id)a3
{
}

- (int64_t)directResult
{
  return self->_directResult;
}

- (void)setDirectResult:(int64_t)a3
{
  self->_directResult = a3;
}

- (NSPDNSPacket)directDNSResponse
{
  return (NSPDNSPacket *)objc_getProperty(self, a2, 256, 1);
}

- (void)setDirectDNSResponse:(id)a3
{
}

- (void)tunnelResponseTimer
{
  return self->_tunnelResponseTimer;
}

- (void)setTunnelResponseTimer:(void *)a3
{
  self->_tunnelResponseTimer = a3;
}

- (BOOL)telemetryReported
{
  return self->_telemetryReported;
}

- (void)setTelemetryReported:(BOOL)a3
{
  self->_telemetryReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directDNSResponse, 0);
  objc_storeStrong((id *)&self->_tunnelDNSResponse, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end