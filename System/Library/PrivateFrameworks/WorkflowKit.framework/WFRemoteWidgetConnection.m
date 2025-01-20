@interface WFRemoteWidgetConnection
+ (id)_createAdvertiseParameters;
+ (id)_createBrowseParameters;
+ (id)_createFramer;
+ (id)connectionToDevice:(id)a3;
+ (id)startListeningForIncomingConfigurations;
- (BOOL)invalidated;
- (BOOL)isConnectedToDevice;
- (NSMutableArray)completionHandlers;
- (NSMutableArray)dataToSend;
- (NSString)deviceIdentifier;
- (OS_dispatch_queue)queue;
- (OS_nw_browser)nwBrowser;
- (OS_nw_connection)connection;
- (OS_nw_listener)nwListener;
- (OS_xpc_object)unrepliedWakeEvent;
- (WFRemoteWidgetConnection)init;
- (WFRemoteWidgetConnection)initWithDeviceIdentifier:(id)a3;
- (WFRemoteWidgetConnectionListenerDelegate)listenerDelegate;
- (id)connectionTimeoutHandler;
- (void)_browserDiscoveredDeviceEndpoint:(id)a3;
- (void)_handleNewConnection:(id)a3;
- (void)_receiveRequestOnConnection;
- (void)_receiveResponseOnConnection;
- (void)_replyToWakeEvent:(id)a3;
- (void)_sendPendingData;
- (void)_setupWakeHandler;
- (void)_tearDownConnection;
- (void)dealloc;
- (void)invalidate;
- (void)sendData:(id)a3 completionHandler:(id)a4;
- (void)setCompletionHandlers:(id)a3;
- (void)setConnectedToDevice:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionTimeoutHandler:(id)a3;
- (void)setDataToSend:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setListenerDelegate:(id)a3;
- (void)setNwBrowser:(id)a3;
- (void)setNwListener:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUnrepliedWakeEvent:(id)a3;
@end

@implementation WFRemoteWidgetConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataToSend, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_nwListener, 0);
  objc_storeStrong((id *)&self->_nwBrowser, 0);
  objc_storeStrong((id *)&self->_unrepliedWakeEvent, 0);
  objc_storeStrong(&self->_connectionTimeoutHandler, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_listenerDelegate);
}

- (void)setDataToSend:(id)a3
{
}

- (NSMutableArray)dataToSend
{
  return self->_dataToSend;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setConnection:(id)a3
{
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setNwListener:(id)a3
{
}

- (OS_nw_listener)nwListener
{
  return self->_nwListener;
}

- (void)setNwBrowser:(id)a3
{
}

- (OS_nw_browser)nwBrowser
{
  return self->_nwBrowser;
}

- (void)setUnrepliedWakeEvent:(id)a3
{
}

- (OS_xpc_object)unrepliedWakeEvent
{
  return self->_unrepliedWakeEvent;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setConnectedToDevice:(BOOL)a3
{
  self->_connectedToDevice = a3;
}

- (BOOL)isConnectedToDevice
{
  return self->_connectedToDevice;
}

- (void)setConnectionTimeoutHandler:(id)a3
{
}

- (id)connectionTimeoutHandler
{
  return self->_connectionTimeoutHandler;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setListenerDelegate:(id)a3
{
}

- (WFRemoteWidgetConnectionListenerDelegate)listenerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listenerDelegate);
  return (WFRemoteWidgetConnectionListenerDelegate *)WeakRetained;
}

- (void)_tearDownConnection
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(WFRemoteWidgetConnection *)self completionHandlers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFRemoteWidgetConnectionErrorDomain" code:0 userInfo:0];
        (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  v10 = [(WFRemoteWidgetConnection *)self completionHandlers];
  [v10 removeAllObjects];

  uint64_t v11 = [(WFRemoteWidgetConnection *)self listenerDelegate];
  if (v11)
  {
    v12 = (void *)v11;
    BOOL v13 = [(WFRemoteWidgetConnection *)self invalidated];

    if (!v13)
    {
      v14 = [(WFRemoteWidgetConnection *)self listenerDelegate];
      [v14 remoteWidgetConnectionConnectionLost:self];
    }
  }
  v15 = [(WFRemoteWidgetConnection *)self listenerDelegate];

  if (!v15) {
    [(WFRemoteWidgetConnection *)self invalidate];
  }
}

- (void)_receiveResponseOnConnection
{
  objc_initWeak(&location, self);
  v3 = [(WFRemoteWidgetConnection *)self connection];
  completion[0] = MEMORY[0x1E4F143A8];
  completion[1] = 3221225472;
  completion[2] = __56__WFRemoteWidgetConnection__receiveResponseOnConnection__block_invoke;
  completion[3] = &unk_1E6553D50;
  objc_copyWeak(&v5, &location);
  completion[4] = self;
  nw_connection_receive_message(v3, completion);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __56__WFRemoteWidgetConnection__receiveResponseOnConnection__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315138;
      v20 = "-[WFRemoteWidgetConnection _receiveResponseOnConnection]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_INFO, "%s Remote widget incoming connection received message", (uint8_t *)&v19, 0xCu);
    }

    if (v8)
    {
      uint64_t v11 = getWFWidgetConfigurationLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        int v19 = 136315394;
        v20 = "-[WFRemoteWidgetConnection _receiveResponseOnConnection]_block_invoke";
        __int16 v21 = 2112;
        uint64_t v22 = (uint64_t)v8;
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, "%s Remote widget incoming connection got error receiving data %@", (uint8_t *)&v19, 0x16u);
      }

      [WeakRetained _tearDownConnection];
    }
    else
    {
      if (v7)
      {
        v12 = v7;
        BOOL v13 = getWFWidgetConfigurationLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = [v12 length];
          int v19 = 136315394;
          v20 = "-[WFRemoteWidgetConnection _receiveResponseOnConnection]_block_invoke";
          __int16 v21 = 2050;
          uint64_t v22 = v14;
          _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_INFO, "%s Remote widget incoming connection received message; sending data via completion handler. Data is of size: %{public}ld",
            (uint8_t *)&v19,
            0x16u);
        }

        v15 = [WeakRetained completionHandlers];
        long long v16 = [v15 objectAtIndex:0];

        long long v17 = getWFWidgetConfigurationLogObject();
        long long v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            int v19 = 136315138;
            v20 = "-[WFRemoteWidgetConnection _receiveResponseOnConnection]_block_invoke";
            _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_INFO, "%s Calling the completion handler with data", (uint8_t *)&v19, 0xCu);
          }

          ((void (**)(void, NSObject *, void))v16)[2](v16, v12, 0);
          long long v18 = [WeakRetained completionHandlers];
          [v18 removeObjectAtIndex:0];
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          int v19 = 136315138;
          v20 = "-[WFRemoteWidgetConnection _receiveResponseOnConnection]_block_invoke";
          _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_FAULT, "%s Could not find completion handler for incoming response. Dropping data...", (uint8_t *)&v19, 0xCu);
        }
      }
      else
      {
        v12 = getWFWidgetConfigurationLogObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v19 = 136315394;
          v20 = "-[WFRemoteWidgetConnection _receiveResponseOnConnection]_block_invoke";
          __int16 v21 = 2112;
          uint64_t v22 = 0;
          _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s Remote widget incoming connection got error receiving data %@", (uint8_t *)&v19, 0x16u);
        }
      }

      [*(id *)(a1 + 32) _receiveResponseOnConnection];
    }
  }
}

- (void)_receiveRequestOnConnection
{
  objc_initWeak(&location, self);
  v3 = [(WFRemoteWidgetConnection *)self connection];
  completion[0] = MEMORY[0x1E4F143A8];
  completion[1] = 3221225472;
  completion[2] = __55__WFRemoteWidgetConnection__receiveRequestOnConnection__block_invoke;
  completion[3] = &unk_1E6553D50;
  objc_copyWeak(&v5, &location);
  completion[4] = self;
  nw_connection_receive_message(v3, completion);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __55__WFRemoteWidgetConnection__receiveRequestOnConnection__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v12 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_INFO, "%s Remote widget outgoing connection received message", buf, 0xCu);
    }

    if (v10)
    {
      BOOL v13 = getWFWidgetConfigurationLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
        __int16 v27 = 2112;
        id v28 = v10;
        _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Remote widget outgoing connection got error receiving data %@", buf, 0x16u);
      }

      [WeakRetained _tearDownConnection];
    }
    else
    {
      if (!v8)
      {
        uint64_t v14 = getWFWidgetConfigurationLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v26 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
          _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, "%s Remote widget outgoing connection received message; no data",
            buf,
            0xCu);
        }
      }
      v15 = [*(id *)(a1 + 32) listenerDelegate];
      BOOL v16 = v15 == 0;

      if (v16)
      {
        long long v17 = getWFWidgetConfigurationLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v26 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
          _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_ERROR, "%s Remote widget outgoing connection received message; no listener delegate",
            buf,
            0xCu);
        }
      }
      if (v8)
      {
        long long v18 = [*(id *)(a1 + 32) listenerDelegate];
        BOOL v19 = v18 == 0;

        if (!v19)
        {
          id v20 = v8;
          __int16 v21 = getWFWidgetConfigurationLogObject();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v26 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
            _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_INFO, "%s Remote widget outgoing connection received message; informing listener delegate",
              buf,
              0xCu);
          }

          uint64_t v22 = [WeakRetained listenerDelegate];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __55__WFRemoteWidgetConnection__receiveRequestOnConnection__block_invoke_21;
          v23[3] = &unk_1E6553D28;
          v23[4] = *(void *)(a1 + 32);
          v23[5] = WeakRetained;
          objc_copyWeak(&v24, (id *)(a1 + 40));
          [v22 remoteWidgetConnection:WeakRetained didReceiveData:v20 responseHandler:v23];

          objc_destroyWeak(&v24);
        }
      }
      [*(id *)(a1 + 32) _receiveRequestOnConnection];
    }
  }
}

void __55__WFRemoteWidgetConnection__receiveRequestOnConnection__block_invoke_21(id *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Received a response from the listener delegate", buf, 0xCu);
  }

  id v5 = [a1[4] connection];
  BOOL v6 = v5 == 0;

  id v7 = getWFWidgetConfigurationLogObject();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Connection lost, dropping response...", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v3 length];
      *(_DWORD *)buf = 136315394;
      id v20 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
      __int16 v21 = 2050;
      uint64_t v22 = v9;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s Sending response data received from the listener delegate; data is of size %{public}ld",
        buf,
        0x16u);
    }

    id v10 = v3;
    uint64_t v11 = (const void *)[v10 bytes];
    size_t v12 = [v10 length];
    id v8 = dispatch_data_create(v11, v12, MEMORY[0x1E4F14428], 0);
    BOOL v13 = +[WFRemoteWidgetConnection _createFramer];
    message = nw_framer_protocol_create_message(v13);

    v15 = nw_content_context_create("Response");
    nw_content_context_set_metadata_for_protocol(v15, message);
    BOOL v16 = [a1[5] connection];
    completion[0] = MEMORY[0x1E4F143A8];
    completion[1] = 3221225472;
    completion[2] = __55__WFRemoteWidgetConnection__receiveRequestOnConnection__block_invoke_23;
    completion[3] = &unk_1E6553D00;
    objc_copyWeak(&v18, a1 + 6);
    nw_connection_send(v16, v8, v15, 1, completion);

    objc_destroyWeak(&v18);
  }
}

void __55__WFRemoteWidgetConnection__receiveRequestOnConnection__block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3 && (uint64_t v4 = (id *)(a1 + 32), v5 = objc_loadWeakRetained(v4), v5, v5))
  {
    id WeakRetained = objc_loadWeakRetained(v4);
    id v7 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Error when sending response data %@", (uint8_t *)&v8, 0x16u);
    }

    [WeakRetained _tearDownConnection];
  }
  else
  {
    id WeakRetained = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[WFRemoteWidgetConnection _receiveRequestOnConnection]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, WeakRetained, OS_LOG_TYPE_INFO, "%s Sent response data received from the listener delegate", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_sendPendingData
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v21 = "-[WFRemoteWidgetConnection _sendPendingData]";
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_INFO, "%s Sending pending data...", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [(WFRemoteWidgetConnection *)self dataToSend];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(NSObject **)(*((void *)&v15 + 1) + 8 * v6);
        objc_initWeak((id *)buf, self);
        int v8 = +[WFRemoteWidgetConnection _createFramer];
        message = nw_framer_protocol_create_message(v8);

        __int16 v10 = nw_content_context_create("Request");
        nw_content_context_set_metadata_for_protocol(v10, message);
        id v11 = [(WFRemoteWidgetConnection *)self connection];
        completion[0] = MEMORY[0x1E4F143A8];
        completion[1] = 3221225472;
        completion[2] = __44__WFRemoteWidgetConnection__sendPendingData__block_invoke;
        completion[3] = &unk_1E6553D00;
        objc_copyWeak(&v14, (id *)buf);
        nw_connection_send(v11, v7, v10, 1, completion);

        objc_destroyWeak(&v14);
        objc_destroyWeak((id *)buf);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

void __44__WFRemoteWidgetConnection__sendPendingData__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = getWFWidgetConfigurationLogObject();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "-[WFRemoteWidgetConnection _sendPendingData]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s There was an error sending the data. Killing connection...", (uint8_t *)&v6, 0xCu);
    }

    if (WeakRetained) {
      [WeakRetained _tearDownConnection];
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "-[WFRemoteWidgetConnection _sendPendingData]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_INFO, "%s Successfully sent data", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_browserDiscoveredDeviceEndpoint:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v5 = [(WFRemoteWidgetConnection *)self connection];

  if (v5)
  {
    int v6 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v19 = "-[WFRemoteWidgetConnection _browserDiscoveredDeviceEndpoint:]";
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s Already connected to endpoint, ignoring...", buf, 0xCu);
    }
  }
  else
  {
    id v7 = [(WFRemoteWidgetConnection *)self nwBrowser];
    nw_browser_cancel(v7);

    int v6 = +[WFRemoteWidgetConnection _createAdvertiseParameters];
    nw_connection_t v8 = nw_connection_create(v4, v6);
    [(WFRemoteWidgetConnection *)self setConnection:v8];

    uint64_t v9 = [(WFRemoteWidgetConnection *)self connection];
    __int16 v10 = [(WFRemoteWidgetConnection *)self queue];
    nw_connection_set_queue(v9, v10);

    objc_initWeak(&location, self);
    id v11 = [(WFRemoteWidgetConnection *)self connection];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __61__WFRemoteWidgetConnection__browserDiscoveredDeviceEndpoint___block_invoke;
    handler[3] = &unk_1E6553CD8;
    objc_copyWeak(&v16, &location);
    long long v15 = v4;
    nw_connection_set_state_changed_handler(v11, handler);

    uint64_t v12 = [(WFRemoteWidgetConnection *)self connection];
    nw_connection_start(v12);

    BOOL v13 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v19 = "-[WFRemoteWidgetConnection _browserDiscoveredDeviceEndpoint:]";
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_DEFAULT, "%s Remote widget outgoing connection created", buf, 0xCu);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __61__WFRemoteWidgetConnection__browserDiscoveredDeviceEndpoint___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ((a2 - 4) >= 2)
    {
      if (a2 == 3)
      {
        uint64_t v9 = getWFWidgetConfigurationLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315138;
          BOOL v13 = "-[WFRemoteWidgetConnection _browserDiscoveredDeviceEndpoint:]_block_invoke";
          _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s Remote widget outgoing connection entered ready state.", (uint8_t *)&v12, 0xCu);
        }

        [WeakRetained setConnectedToDevice:1];
        [WeakRetained _receiveResponseOnConnection];
        [WeakRetained _sendPendingData];
      }
      else if (v5)
      {
        __int16 v10 = getWFWidgetConfigurationLogObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          int v12 = 136315906;
          BOOL v13 = "-[WFRemoteWidgetConnection _browserDiscoveredDeviceEndpoint:]_block_invoke";
          __int16 v14 = 2112;
          uint64_t v15 = v11;
          __int16 v16 = 2080;
          uint64_t v17 = nw_connection_state_to_string();
          __int16 v18 = 2112;
          id v19 = v5;
          _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s Remote widget outgoing connection to endpoint %@ entered state %s, error=%@", (uint8_t *)&v12, 0x2Au);
        }
      }
    }
    else
    {
      id v7 = getWFWidgetConfigurationLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v12 = 136315906;
        BOOL v13 = "-[WFRemoteWidgetConnection _browserDiscoveredDeviceEndpoint:]_block_invoke";
        __int16 v14 = 2112;
        uint64_t v15 = v8;
        __int16 v16 = 2080;
        uint64_t v17 = nw_connection_state_to_string();
        __int16 v18 = 2112;
        id v19 = v5;
        _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Remote widget outgoing connection to endpoint %@ disconnected, state=%s, error=%@", (uint8_t *)&v12, 0x2Au);
      }

      [WeakRetained _tearDownConnection];
    }
  }
}

- (void)sendData:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, NSObject *))a4;
  if ([(WFRemoteWidgetConnection *)self invalidated])
  {
    uint64_t v8 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[WFRemoteWidgetConnection sendData:completionHandler:]";
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Trying to send on a remote widget connection that's invalidated", buf, 0xCu);
    }

    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFRemoteWidgetConnectionErrorDomain" code:1 userInfo:0];
    v7[2](v7, 0, v9);
  }
  else if ([(WFRemoteWidgetConnection *)self isConnectedToDevice] {
         || ([(WFRemoteWidgetConnection *)self listenerDelegate],
  }
             __int16 v10 = objc_claimAutoreleasedReturnValue(),
             v10,
             !v10))
  {
    if ([(WFRemoteWidgetConnection *)self isConnectedToDevice]
      && ([(WFRemoteWidgetConnection *)self connection],
          int v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          !v12))
    {
      v25 = getWFWidgetConfigurationLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[WFRemoteWidgetConnection sendData:completionHandler:]";
        _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_ERROR, "%s Trying to send on a remote widget connection that is disconnected", buf, 0xCu);
      }

      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFRemoteWidgetConnectionErrorDomain" code:0 userInfo:0];
      v7[2](v7, 0, v9);
    }
    else
    {
      BOOL v13 = [(WFRemoteWidgetConnection *)self completionHandlers];
      __int16 v14 = _Block_copy(v7);
      [v13 addObject:v14];

      id v15 = v6;
      __int16 v16 = (const void *)[v15 bytes];
      size_t v17 = [v15 length];
      uint64_t v9 = dispatch_data_create(v16, v17, MEMORY[0x1E4F14428], 0);
      objc_initWeak(&location, self);
      __int16 v18 = [(WFRemoteWidgetConnection *)self connection];
      LODWORD(v16) = v18 == 0;

      if (v16)
      {
        id v24 = getWFWidgetConfigurationLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v30 = "-[WFRemoteWidgetConnection sendData:completionHandler:]";
          _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_DEFAULT, "%s Device not connected, waiting to send data...", buf, 0xCu);
        }

        message = [(WFRemoteWidgetConnection *)self dataToSend];
        [message addObject:v9];
      }
      else
      {
        id v19 = getWFWidgetConfigurationLogObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v30 = "-[WFRemoteWidgetConnection sendData:completionHandler:]";
          _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_DEFAULT, "%s Device connected; sending data right away",
            buf,
            0xCu);
        }

        uint64_t v20 = +[WFRemoteWidgetConnection _createFramer];
        message = nw_framer_protocol_create_message(v20);

        uint64_t v22 = nw_content_context_create("Request");
        nw_content_context_set_metadata_for_protocol(v22, message);
        uint64_t v23 = [(WFRemoteWidgetConnection *)self connection];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __55__WFRemoteWidgetConnection_sendData_completionHandler___block_invoke;
        v26[3] = &unk_1E6553D00;
        objc_copyWeak(&v27, &location);
        nw_connection_send(v23, v9, v22, 1, v26);

        objc_destroyWeak(&v27);
      }

      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v11 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[WFRemoteWidgetConnection sendData:completionHandler:]";
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Trying to send on a remote widget connection not connected", buf, 0xCu);
    }

    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFRemoteWidgetConnectionErrorDomain" code:2 userInfo:0];
    v7[2](v7, 0, v9);
  }
}

void __55__WFRemoteWidgetConnection_sendData_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = getWFWidgetConfigurationLogObject();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "-[WFRemoteWidgetConnection sendData:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s There was an error sending the data.  Killing connection...", (uint8_t *)&v6, 0xCu);
    }

    if (WeakRetained) {
      [WeakRetained _tearDownConnection];
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "-[WFRemoteWidgetConnection sendData:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_INFO, "%s Successfully sent data", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)invalidate
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[WFRemoteWidgetConnection invalidate]";
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s Invalidating WFRemoteWidgetConnection", buf, 0xCu);
  }

  if ([(WFRemoteWidgetConnection *)self invalidated])
  {
    uint64_t v4 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[WFRemoteWidgetConnection invalidate]";
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetConnection already invalidated", buf, 0xCu);
    }
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = [(WFRemoteWidgetConnection *)self completionHandlers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
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
          uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * v9);
          uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFRemoteWidgetConnectionErrorDomain" code:1 userInfo:0];
          (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    int v12 = [(WFRemoteWidgetConnection *)self completionHandlers];
    [v12 removeAllObjects];

    BOOL v13 = [(WFRemoteWidgetConnection *)self nwBrowser];

    if (v13)
    {
      __int16 v14 = [(WFRemoteWidgetConnection *)self nwBrowser];
      nw_browser_cancel(v14);

      [(WFRemoteWidgetConnection *)self setNwBrowser:0];
    }
    id v15 = [(WFRemoteWidgetConnection *)self nwListener];

    if (v15)
    {
      __int16 v16 = [(WFRemoteWidgetConnection *)self nwListener];
      nw_listener_cancel(v16);

      [(WFRemoteWidgetConnection *)self setNwListener:0];
    }
    size_t v17 = [(WFRemoteWidgetConnection *)self connection];

    if (v17)
    {
      __int16 v18 = [(WFRemoteWidgetConnection *)self connection];
      nw_connection_cancel(v18);

      [(WFRemoteWidgetConnection *)self setConnection:0];
    }
    [(WFRemoteWidgetConnection *)self setConnectedToDevice:0];
    [(WFRemoteWidgetConnection *)self setInvalidated:1];
    [(WFRemoteWidgetConnection *)self setDataToSend:0];
  }
}

- (void)_handleNewConnection:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __49__WFRemoteWidgetConnection__handleNewConnection___block_invoke;
  handler[3] = &unk_1E6553CD8;
  objc_copyWeak(&v13, &location);
  id v5 = v4;
  int v12 = v5;
  nw_connection_set_state_changed_handler(v5, handler);
  if (self->_connection)
  {
    uint64_t v6 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      connection = self->_connection;
      *(_DWORD *)buf = 136315650;
      __int16 v16 = "-[WFRemoteWidgetConnection _handleNewConnection:]";
      __int16 v17 = 2112;
      __int16 v18 = v5;
      __int16 v19 = 2112;
      long long v20 = connection;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s WFRemoteWidgetConnection has incoming connection %@, but already owns an incoming connection %@", buf, 0x20u);
    }
  }
  uint64_t v8 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[WFRemoteWidgetConnection _handleNewConnection:]";
    __int16 v17 = 2112;
    __int16 v18 = v5;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetConnection incoming connection %@", buf, 0x16u);
  }

  nw_connection_set_queue(v5, (dispatch_queue_t)self->_queue);
  nw_connection_start(v5);
  uint64_t v9 = self->_connection;
  self->_connection = (OS_nw_connection *)v5;
  uint64_t v10 = v5;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __49__WFRemoteWidgetConnection__handleNewConnection___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 - 4) < 2)
  {
    uint64_t v7 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v17 = 136315650;
      __int16 v18 = "-[WFRemoteWidgetConnection _handleNewConnection:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Incoming connection failed or was canceled. Connection=%@ Error=%@", (uint8_t *)&v17, 0x20u);
    }

    uint64_t v9 = objc_loadWeakRetained(WeakRetained + 2);
    [v9 remoteWidgetConnectionConnectionLost:WeakRetained];
LABEL_5:

    [WeakRetained _tearDownConnection];
    goto LABEL_16;
  }
  if (a2 == 3)
  {
    uint64_t v10 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v17 = 136315394;
      __int16 v18 = "-[WFRemoteWidgetConnection _handleNewConnection:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s Incoming connection entered the ready state.  Connection=%@", (uint8_t *)&v17, 0x16u);
    }

    [WeakRetained _receiveRequestOnConnection];
  }
  else
  {
    int v12 = getWFWidgetConfigurationLogObject();
    uint64_t v9 = v12;
    if (v5)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = nw_connection_state_to_string();
        __int16 v14 = *(void **)(a1 + 32);
        int v17 = 136315906;
        __int16 v18 = "-[WFRemoteWidgetConnection _handleNewConnection:]_block_invoke";
        __int16 v19 = 2080;
        uint64_t v20 = v13;
        __int16 v21 = 2112;
        id v22 = v14;
        __int16 v23 = 2112;
        id v24 = v5;
        _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Incoming connection entered state %s.  Connection=%@, Error=%@", (uint8_t *)&v17, 0x2Au);
      }
      goto LABEL_5;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = nw_connection_state_to_string();
      __int16 v16 = *(void **)(a1 + 32);
      int v17 = 136315650;
      __int16 v18 = "-[WFRemoteWidgetConnection _handleNewConnection:]_block_invoke";
      __int16 v19 = 2080;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v16;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s Incoming connection entered state %s.  Connection=%@", (uint8_t *)&v17, 0x20u);
    }
  }
LABEL_16:
}

- (void)_replyToWakeEvent:(id)a3
{
  xpc_object_t original = a3;
  if (xpc_dictionary_get_BOOL(original, "replyRequired"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    xpc_dictionary_send_reply();
  }
}

- (void)_setupWakeHandler
{
  id v3 = [(WFRemoteWidgetConnection *)self queue];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __45__WFRemoteWidgetConnection__setupWakeHandler__block_invoke;
  handler[3] = &unk_1E6553CB0;
  void handler[4] = self;
  xpc_set_event_stream_handler("com.apple.rapport.matching", v3, handler);
}

void __45__WFRemoteWidgetConnection__setupWakeHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [NSString alloc];
  id v5 = objc_msgSend(v4, "initWithCString:encoding:", xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14560]), 4);
  uint64_t v6 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[WFRemoteWidgetConnection _setupWakeHandler]_block_invoke";
    __int16 v11 = 2112;
    int v12 = v5;
    _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s Wake event received %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v7 = [*(id *)(a1 + 32) nwListener];

  uint64_t v8 = *(void **)(a1 + 32);
  if (v7) {
    [v8 _replyToWakeEvent:v3];
  }
  else {
    [v8 setUnrepliedWakeEvent:v3];
  }
}

- (WFRemoteWidgetConnection)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)WFRemoteWidgetConnection;
  id v2 = [(WFRemoteWidgetConnection *)&v20 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.shortcuts.WFRemoteWidgetConnection", v4);
    uint64_t v6 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v5;

    uint64_t v7 = +[WFRemoteWidgetConnection _createAdvertiseParameters];
    application_service = nw_advertise_descriptor_create_application_service("com.apple.workflow.remotewidgets");
    int v9 = nw_listener_create(v7);
    nw_listener_set_advertise_descriptor(v9, application_service);
    objc_initWeak(&location, v2);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    __int16 v16 = __32__WFRemoteWidgetConnection_init__block_invoke;
    int v17 = &unk_1E6553C88;
    objc_copyWeak(&v18, &location);
    nw_listener_set_new_connection_handler(v9, &v14);
    MEMORY[0x1C87CA350](v9, &__block_literal_global_13);
    nw_listener_set_queue(v9, *((dispatch_queue_t *)v2 + 9));
    nw_listener_start(v9);
    uint64_t v10 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "-[WFRemoteWidgetConnection init]";
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s Listener started!", buf, 0xCu);
    }

    objc_storeStrong((id *)v2 + 7, v9);
    objc_msgSend(v2, "_setupWakeHandler", v14, v15, v16, v17);
    if (*((void *)v2 + 5))
    {
      objc_msgSend(v2, "_replyToWakeEvent:");
      __int16 v11 = (void *)*((void *)v2 + 5);
      *((void *)v2 + 5) = 0;
    }
    id v12 = v2;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return (WFRemoteWidgetConnection *)v2;
}

void __32__WFRemoteWidgetConnection_init__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleNewConnection:v5];
  }
}

void __32__WFRemoteWidgetConnection_init__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (a2 == 2)
  {
    id v5 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[WFRemoteWidgetConnection init]_block_invoke_2";
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Listener entered the ready state", (uint8_t *)&v7, 0xCu);
    }
  }
  if (v4)
  {
    uint64_t v6 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      uint64_t v8 = "-[WFRemoteWidgetConnection init]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Listener threw error %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (WFRemoteWidgetConnection)initWithDeviceIdentifier:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WFRemoteWidgetConnection;
  id v6 = [(WFRemoteWidgetConnection *)&v32 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v8 = (void *)*((void *)v6 + 10);
    *((void *)v6 + 10) = v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    id v10 = (void *)*((void *)v6 + 11);
    *((void *)v6 + 11) = v9;

    objc_storeStrong((id *)v6 + 3, a3);
    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.shortcuts.WFRemoteWidgetConnection", v12);
    uint64_t v14 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = v13;

    uint64_t v15 = +[WFRemoteWidgetConnection _createBrowseParameters];
    application_service = nw_browse_descriptor_create_application_service("com.apple.workflow.remotewidgets");
    nw_browse_descriptor_set_device_types();
    int v17 = nw_browser_create(application_service, v15);
    nw_browser_set_state_changed_handler(v17, &__block_literal_global_44460);
    objc_initWeak(&location, v6);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __53__WFRemoteWidgetConnection_initWithDeviceIdentifier___block_invoke_6;
    handler[3] = &unk_1E6553C60;
    objc_copyWeak(&v30, &location);
    id v18 = v5;
    id v29 = v18;
    nw_browser_set_browse_results_changed_handler(v17, handler);
    __int16 v19 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[WFRemoteWidgetConnection initWithDeviceIdentifier:]";
      __int16 v35 = 2112;
      id v36 = v18;
      _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_DEFAULT, "%s Starting NWBrowser. Looking for device with id %@", buf, 0x16u);
    }

    nw_browser_set_queue(v17, *((dispatch_queue_t *)v6 + 9));
    nw_browser_start(v17);
    objc_super v20 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v17;
    __int16 v21 = v17;

    dispatch_time_t v22 = dispatch_time(0, 20000000000);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __53__WFRemoteWidgetConnection_initWithDeviceIdentifier___block_invoke_9;
    v26[3] = &unk_1E6558B28;
    id v23 = v6;
    id v27 = v23;
    dispatch_after(v22, MEMORY[0x1E4F14428], v26);
    id v24 = v23;

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return (WFRemoteWidgetConnection *)v6;
}

void __53__WFRemoteWidgetConnection_initWithDeviceIdentifier___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (v4 && WeakRetained)
  {
    nw_endpoint_t v7 = nw_browse_result_copy_endpoint(v4);
    if (v7)
    {
      uint64_t device_id = nw_endpoint_get_device_id();
      if (device_id)
      {
        uint64_t v9 = (void *)[[NSString alloc] initWithCString:device_id encoding:4];
        id v10 = getWFWidgetConfigurationLogObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315394;
          dispatch_queue_t v13 = "-[WFRemoteWidgetConnection initWithDeviceIdentifier:]_block_invoke";
          __int16 v14 = 2112;
          uint64_t v15 = v9;
          _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s Discovered device with id %@", (uint8_t *)&v12, 0x16u);
        }

        if ([v9 isEqualToString:*(void *)(a1 + 32)])
        {
          id v11 = objc_loadWeakRetained((id *)(a1 + 40));
          [v11 _browserDiscoveredDeviceEndpoint:v7];
        }
      }
    }
  }
}

void __53__WFRemoteWidgetConnection_initWithDeviceIdentifier___block_invoke_9(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) connectionTimeoutHandler];
  if (v2)
  {
    id v3 = (void *)v2;
    char v4 = [*(id *)(a1 + 32) isConnectedToDevice];

    if ((v4 & 1) == 0)
    {
      id v5 = getWFWidgetConfigurationLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136315138;
        uint64_t v8 = "-[WFRemoteWidgetConnection initWithDeviceIdentifier:]_block_invoke";
        _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s Timed out establishing connection to the target remote device", (uint8_t *)&v7, 0xCu);
      }

      id v6 = [*(id *)(a1 + 32) connectionTimeoutHandler];
      v6[2]();
    }
  }
}

void __53__WFRemoteWidgetConnection_initWithDeviceIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "-[WFRemoteWidgetConnection initWithDeviceIdentifier:]_block_invoke";
      id v6 = "%s Browser state change returned an error!";
      int v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl(&dword_1C7F0A000, v7, v8, v6, (uint8_t *)&v9, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (a2 == 1)
  {
    id v5 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[WFRemoteWidgetConnection initWithDeviceIdentifier:]_block_invoke";
      id v6 = "%s Remote Widget browser entered the ready state.";
      int v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_7;
    }
LABEL_8:
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFRemoteWidgetConnection *)self nwBrowser];
  if (v3
    || ([(WFRemoteWidgetConnection *)self nwListener],
        (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    id v5 = [(WFRemoteWidgetConnection *)self connection];

    if (!v5) {
      goto LABEL_7;
    }
  }
  id v4 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    os_log_type_t v8 = "-[WFRemoteWidgetConnection dealloc]";
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_FAULT, "%s WFRemoteWidgetConnection deallocated without [invalidate] being called...", buf, 0xCu);
  }

LABEL_7:
  [(WFRemoteWidgetConnection *)self invalidate];
  v6.receiver = self;
  v6.super_class = (Class)WFRemoteWidgetConnection;
  [(WFRemoteWidgetConnection *)&v6 dealloc];
}

+ (id)_createAdvertiseParameters
{
  application_service = nw_parameters_create_application_service();
  id v3 = nw_parameters_copy_default_protocol_stack(application_service);
  id v4 = +[WFRemoteWidgetConnection _createFramer];
  options = nw_framer_create_options(v4);
  nw_protocol_stack_prepend_application_protocol(v3, options);

  return application_service;
}

+ (id)_createBrowseParameters
{
  application_service = nw_parameters_create_application_service();
  xpc_object_t v3 = xpc_array_create(0, 0);
  xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, "com.apple.rapport.browse");
  xpc_object_t v4 = xpc_array_create(0, 0);
  xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, "RapportBrowseAgent");
  nw_parameters_set_required_netagent_classes();
  id v5 = nw_parameters_copy_default_protocol_stack(application_service);
  objc_super v6 = +[WFRemoteWidgetConnection _createFramer];
  options = nw_framer_create_options(v6);
  nw_protocol_stack_prepend_application_protocol(v5, options);

  return application_service;
}

+ (id)_createFramer
{
  if (_createFramer_onceToken[0] != -1) {
    dispatch_once(_createFramer_onceToken, &__block_literal_global_27);
  }
  uint64_t v2 = (void *)_createFramer_definition;
  return v2;
}

void __41__WFRemoteWidgetConnection__createFramer__block_invoke()
{
  nw_protocol_definition_t definition = nw_framer_create_definition("WFRemoteWidgetConnection", 0, &__block_literal_global_31);
  v1 = (void *)_createFramer_definition;
  _createFramer_nw_protocol_definition_t definition = (uint64_t)definition;
}

uint64_t __41__WFRemoteWidgetConnection__createFramer__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  nw_framer_set_input_handler(v2, &__block_literal_global_34);
  nw_framer_set_output_handler(v2, &__block_literal_global_38);

  return 1;
}

void __41__WFRemoteWidgetConnection__createFramer__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, size_t a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_super v6 = v5;
  if (HIDWORD(a4))
  {
    int v7 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned int v8 = 136315394;
      uint64_t v9 = "+[WFRemoteWidgetConnection _createFramer]_block_invoke_5";
      __int16 v10 = 2050;
      size_t v11 = a4;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Message length exceeds UINT32_MAX. Message length %{public}ld", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    unsigned int v8 = bswap32(a4);
    nw_framer_write_output(v5, (const uint8_t *)&v8, 4uLL);
    nw_framer_write_output_no_copy(v6, a4);
  }
}

uint64_t __41__WFRemoteWidgetConnection__createFramer__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 4;
  while (1)
  {
    *(_DWORD *)temp_buffer = 0;
    uint64_t v9 = 0;
    __int16 v10 = &v9;
    uint64_t v11 = 0x2020000000;
    int v12 = 0;
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __41__WFRemoteWidgetConnection__createFramer__block_invoke_4;
    v8[3] = &unk_1E6553DB8;
    v8[4] = &v9;
    if (!nw_framer_parse_input(v2, 4uLL, 4uLL, temp_buffer, v8)) {
      break;
    }
    id v5 = nw_framer_message_create(v2);
    BOOL v6 = nw_framer_deliver_input_no_copy(v2, *((unsigned int *)v10 + 6), v5, 1);

    if (!v6)
    {
      uint64_t v4 = 0;
      break;
    }
    _Block_object_dispose(&v9, 8);
  }
  _Block_object_dispose(&v9, 8);

  return v4;
}

uint64_t __41__WFRemoteWidgetConnection__createFramer__block_invoke_4(uint64_t a1, unsigned int *a2, unint64_t a3)
{
  uint64_t result = 0;
  if (a2)
  {
    if (a3 >= 4)
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = bswap32(*a2);
      return 4;
    }
  }
  return result;
}

+ (id)startListeningForIncomingConfigurations
{
  uint64_t v2 = objc_alloc_init(WFRemoteWidgetConnection);
  return v2;
}

+ (id)connectionToDevice:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[WFRemoteWidgetConnection alloc] initWithDeviceIdentifier:v3];

  return v4;
}

@end