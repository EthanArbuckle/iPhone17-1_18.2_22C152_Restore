@interface NPTunnelFlowUDP
- (NPTunnelFlowUDP)initWithTunnel:(id)a3 appRule:(id)a4 inputProtocol:(nw_protocol *)a5 extraProperties:(id)a6;
- (NSDate)firstPacketDate;
- (NSMutableArray)savedDirectData;
- (NWEndpoint)remoteEndpoint;
- (NWUDPSession)directSession;
- (unint64_t)savedDataSize;
- (void)handleAppData:(id)a3;
- (void)handleIncomingData:(id)a3 andError:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sendDataOnDirectSession:(id)a3;
- (void)setDirectSession:(id)a3;
- (void)setFirstPacketDate:(id)a3;
- (void)setSavedDataSize:(unint64_t)a3;
- (void)setSavedDirectData:(id)a3;
- (void)startDirectConnection;
- (void)startHandlingIncomingData;
- (void)stopDirectConnection;
@end

@implementation NPTunnelFlowUDP

- (NPTunnelFlowUDP)initWithTunnel:(id)a3 appRule:(id)a4 inputProtocol:(nw_protocol *)a5 extraProperties:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)NPTunnelFlowUDP;
  v11 = [(NPTunnelFlowProtocol *)&v15 initWithTunnel:a3 appRule:a4 inputProtocol:a5 extraProperties:v10];
  if (v11)
  {
    uint64_t v12 = [v10 directEndpoint];
    remoteEndpoint = v11->_remoteEndpoint;
    v11->_remoteEndpoint = (NWEndpoint *)v12;
  }
  return v11;
}

- (void)handleAppData:(id)a3
{
  id v4 = a3;
  if ([(NPTunnelFlow *)self state] == 1)
  {
    v5 = [(NPTunnelFlow *)self firstTxByteTimestamp];
    [(NPTunnelFlowUDP *)self setFirstPacketDate:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)NPTunnelFlowUDP;
  [(NPTunnelFlowProtocol *)&v6 handleAppData:v4];
  [(NPTunnelFlowUDP *)self sendDataOnDirectSession:v4];
}

- (void)startDirectConnection
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(NPTunnelFlow *)self isDirectConnectionViable])
  {
    v3 = [(NPTunnelFlowUDP *)self remoteEndpoint];

    if (v3)
    {
      id v4 = nplog_obj();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v5 = [(NPTunnelFlow *)self hashKey];
        unint64_t v6 = [(NPTunnelFlow *)self identifier];
        v7 = [(NPTunnelFlowUDP *)self remoteEndpoint];
        int v14 = 134218498;
        unint64_t v15 = v5;
        __int16 v16 = 2048;
        unint64_t v17 = v6;
        __int16 v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) starting direct session to %@", (uint8_t *)&v14, 0x20u);
      }
      id v8 = objc_alloc(MEMORY[0x1E4F38C48]);
      v9 = [(NPTunnelFlowUDP *)self remoteEndpoint];
      id v10 = objc_alloc_init(MEMORY[0x1E4F38C10]);
      v11 = (void *)[v8 initWithEndpoint:v9 parameters:v10];
      [(NPTunnelFlowUDP *)self setDirectSession:v11];

      uint64_t v12 = [(NPTunnelFlowUDP *)self directSession];
      v13 = self;
      [v12 addObserver:v13 forKeyPath:@"state" options:4 context:v13];

      [(NPTunnelFlow *)v13 setIsDirectConnectionViable:1];
    }
  }
}

- (void)stopDirectConnection
{
  uint64_t v3 = [(NPTunnelFlowUDP *)self directSession];
  if (v3
    && (id v4 = (void *)v3,
        [(NPTunnelFlowUDP *)self directSession],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 state],
        v5,
        v4,
        v6 != 5))
  {
    id v7 = [(NPTunnelFlowUDP *)self directSession];
    [v7 cancel];
  }
  else
  {
    [(NPTunnelFlowUDP *)self setSavedDirectData:0];
  }
}

- (void)handleIncomingData:(id)a3 andError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPTunnelFlow *)self tunnel];
  v9 = [v8 parameters];
  id v10 = (void *)nw_parameters_copy_context();
  v13 = v7;
  id v11 = v7;
  id v12 = v6;
  nw_queue_context_async();
}

uint64_t __47__NPTunnelFlowUDP_handleIncomingData_andError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) length];
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(a1 + 48);
    return [v9 sendDataToClient:v8 fromTunnel:0];
  }
  else
  {
    uint64_t v6 = [v3 code];
    return [v4 closeFromDirectConnectionWithError:v6];
  }
}

- (void)startHandlingIncomingData
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(NPTunnelFlowUDP *)self directSession];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__NPTunnelFlowUDP_startHandlingIncomingData__block_invoke;
  v4[3] = &unk_1E5A3B1A0;
  objc_copyWeak(&v5, &location);
  [v3 setReadHandler:v4 maxDatagrams:64];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__NPTunnelFlowUDP_startHandlingIncomingData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v8 = [v5 count];
    if (v6 || !v8)
    {
      [WeakRetained handleIncomingData:0 andError:v6];
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v9 = v5;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v9);
            }
            objc_msgSend(WeakRetained, "handleIncomingData:andError:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), 0, (void)v14);
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v11);
      }
    }
  }
}

- (void)sendDataOnDirectSession:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NPTunnelFlow *)self isDirectConnectionViable]
    && ([(NPTunnelFlowUDP *)self directSession],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 state],
        v5,
        v6 == 3))
  {
    id v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v28 = [(NPTunnelFlow *)self hashKey];
      __int16 v29 = 2048;
      unint64_t v30 = [(NPTunnelFlow *)self identifier];
      __int16 v31 = 2048;
      uint64_t v32 = [v4 length];
      _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) Sending %lu bytes of data on the direct session", buf, 0x20u);
    }

    uint64_t v8 = [(NPTunnelFlowUDP *)self directSession];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __43__NPTunnelFlowUDP_sendDataOnDirectSession___block_invoke;
    v25[3] = &unk_1E5A3B1C8;
    v25[4] = self;
    id v26 = v4;
    [v8 writeDatagram:v26 completionHandler:v25];
  }
  else if ([(NPTunnelFlow *)self enableDirectRace] {
         || [(NPTunnelFlow *)self state] != 3 && ![(NPTunnelFlow *)self fallbackDisabled])
  }
  {
    id v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v28 = [(NPTunnelFlow *)self hashKey];
      __int16 v29 = 2048;
      unint64_t v30 = [(NPTunnelFlow *)self identifier];
      __int16 v31 = 2048;
      uint64_t v32 = [v4 length];
      _os_log_debug_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) Saving %lu bytes of data for the direct session", buf, 0x20u);
    }

    uint64_t v10 = [(NPTunnelFlowUDP *)self savedDirectData];

    if (v10)
    {
      unint64_t v11 = [(NPTunnelFlowUDP *)self savedDataSize];
      unint64_t v12 = [v4 length] + v11;
      uint64_t v13 = [(NPTunnelFlow *)self appRule];
      long long v14 = [v13 fallbackBufferLimit];
      unint64_t v15 = [v14 unsignedIntegerValue];

      if (v12 >= v15)
      {
        __int16 v18 = nplog_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v19 = [(NPTunnelFlow *)self hashKey];
          unint64_t v20 = [(NPTunnelFlow *)self identifier];
          v21 = [(NPTunnelFlow *)self appRule];
          v22 = [v21 fallbackBufferLimit];
          int v23 = [(NPTunnelFlowUDP *)self savedDataSize];
          int v24 = [v4 length];
          *(_DWORD *)buf = 134218754;
          unint64_t v28 = v19;
          __int16 v29 = 2048;
          unint64_t v30 = v20;
          __int16 v31 = 2112;
          uint64_t v32 = (uint64_t)v22;
          __int16 v33 = 1024;
          int v34 = v24 + v23;
          _os_log_impl(&dword_1A0FEE000, v18, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) ran over the limit (%@) on saved data (%u), disabling fallback", buf, 0x26u);
        }
        [(NPTunnelFlow *)self closeFromDirectConnectionWithError:0];
      }
      else
      {
        long long v16 = [(NPTunnelFlowUDP *)self savedDirectData];
        [v16 addObject:v4];

        -[NPTunnelFlowUDP setSavedDataSize:](self, "setSavedDataSize:", -[NPTunnelFlowUDP savedDataSize](self, "savedDataSize") + [v4 length]);
      }
    }
    else
    {
      long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v4, 0);
      [(NPTunnelFlowUDP *)self setSavedDirectData:v17];
    }
  }
}

void __43__NPTunnelFlowUDP_sendDataOnDirectSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) tunnel];
  id v5 = [v4 parameters];
  uint64_t v6 = (void *)nw_parameters_copy_context();
  id v8 = *(id *)(a1 + 40);
  id v7 = v3;
  nw_queue_context_async();
}

uint64_t __43__NPTunnelFlowUDP_sendDataOnDirectSession___block_invoke_2(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    uint64_t v2 = nplog_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [a1[5] hashKey];
      uint64_t v6 = [a1[5] identifier];
      uint64_t v7 = [a1[6] length];
      id v8 = a1[4];
      int v9 = 134218754;
      uint64_t v10 = v5;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_error_impl(&dword_1A0FEE000, v2, OS_LOG_TYPE_ERROR, "Flow %llu (%llu) failed to send %lu bytes of data on the direct session: %@", (uint8_t *)&v9, 0x2Au);
    }

    return objc_msgSend(a1[5], "closeFromDirectConnectionWithError:", objc_msgSend(a1[4], "code"));
  }
  else
  {
    id v4 = a1[5];
    return [v4 readDataFromClient];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = [v10 isEqualToString:@"state"];
  if (a6 == self && v13)
  {
    uint64_t v14 = [a6 tunnel];
    __int16 v15 = [v14 parameters];
    id v16 = (void *)nw_parameters_copy_context();
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    unint64_t v20 = __66__NPTunnelFlowUDP_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v21 = &unk_1E5A3B1F0;
    v22 = a6;
    int v23 = a6;
    nw_queue_context_async();
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NPTunnelFlowUDP;
    [(NPTunnelFlowUDP *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

void __66__NPTunnelFlowUDP_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) directSession];
  uint64_t v3 = [v2 state];

  switch(v3)
  {
    case 5:
      int v13 = nplog_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [*(id *)(a1 + 32) hashKey];
        uint64_t v15 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)buf = 134218240;
        uint64_t v26 = v14;
        __int16 v27 = 2048;
        uint64_t v28 = v15;
        _os_log_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) direct session is now cancelled", buf, 0x16u);
      }

      id v16 = [*(id *)(a1 + 32) directSession];
      [v16 removeObserver:*(void *)(a1 + 32) forKeyPath:@"state" context:*(void *)(a1 + 40)];

      [*(id *)(a1 + 32) setDirectSession:0];
      [*(id *)(a1 + 32) setSavedDirectData:0];
      [*(id *)(a1 + 32) setIsDirectConnectionViable:0];

      break;
    case 4:
      objc_super v17 = nplog_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [*(id *)(a1 + 32) hashKey];
        uint64_t v19 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)buf = 134218240;
        uint64_t v26 = v18;
        __int16 v27 = 2048;
        uint64_t v28 = v19;
        _os_log_impl(&dword_1A0FEE000, v17, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) direct session failed", buf, 0x16u);
      }

      [*(id *)(a1 + 32) closeFromDirectConnectionWithError:0];
      break;
    case 3:
      id v4 = nplog_obj();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = [*(id *)(a1 + 32) hashKey];
        uint64_t v6 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)buf = 134218240;
        uint64_t v26 = v5;
        __int16 v27 = 2048;
        uint64_t v28 = v6;
        _os_log_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) direct session is now ready", buf, 0x16u);
      }

      [*(id *)(a1 + 32) setFallbackDisabled:1];
      uint64_t v7 = [*(id *)(a1 + 32) savedDirectData];
      [*(id *)(a1 + 32) setSavedDirectData:0];
      if ([v7 count])
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v21;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v8);
              }
              objc_msgSend(*(id *)(a1 + 32), "sendDataOnDirectSession:", *(void *)(*((void *)&v20 + 1) + 8 * v12++), (void)v20);
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v10);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "startHandlingIncomingData", (void)v20);

      break;
  }
}

- (NSMutableArray)savedDirectData
{
  return (NSMutableArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSavedDirectData:(id)a3
{
}

- (unint64_t)savedDataSize
{
  return self->_savedDataSize;
}

- (void)setSavedDataSize:(unint64_t)a3
{
  self->_savedDataSize = a3;
}

- (NWUDPSession)directSession
{
  return (NWUDPSession *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDirectSession:(id)a3
{
}

- (NSDate)firstPacketDate
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setFirstPacketDate:(id)a3
{
}

- (NWEndpoint)remoteEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 208, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_firstPacketDate, 0);
  objc_storeStrong((id *)&self->_directSession, 0);
  objc_storeStrong((id *)&self->_savedDirectData, 0);
}

@end