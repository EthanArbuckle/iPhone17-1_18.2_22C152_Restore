@interface MSVQRConnection
+ (id)connectionWithDataSource:(id)a3 messageCoder:(id)a4;
+ (id)createFramerDefinitionWithIdentifier:(id)a3;
- (BOOL)shouldTerminate;
- (IDSGroupSession)session;
- (MSVBlockGuard)guard;
- (MSVQRConnection)initWithDataSource:(id)a3 messageCoder:(id)a4;
- (MSVQRConnectionDelegate)delegate;
- (MSVQRConnectionMessageCoder)messageCoder;
- (MSVQRConnectionReportProtocol)report;
- (MSVQRConnectionSessionDataSource)dataSource;
- (NSNumber)participantIdentifier;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (OS_nw_connection)connection;
- (OS_nw_protocol_definition)framerDefinition;
- (unint64_t)state;
- (void)_clearState;
- (void)_connectionStateDidChangeWithError:(id)a3;
- (void)_createGroupSession;
- (void)_createQuicConnection;
- (void)_receiveNextMessage;
- (void)_sendPathWithCompletion:(id)a3;
- (void)_terminateWithError:(id)a3;
- (void)dealloc;
- (void)sendMessage:(id)a3;
- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4;
- (void)sessionDidJoinGroup:(id)a3 participantUpdate:(id)a4 error:(id)a5;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGuard:(id)a3;
- (void)setParticipantIdentifier:(id)a3;
- (void)setReport:(id)a3;
- (void)setSession:(id)a3;
- (void)setShouldTerminate:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)start;
- (void)stop;
@end

@implementation MSVQRConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guard, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_participantIdentifier, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_messageCoder, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_framerDefinition, 0);
  objc_destroyWeak((id *)&self->_report);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setGuard:(id)a3
{
}

- (MSVBlockGuard)guard
{
  return self->_guard;
}

- (void)setShouldTerminate:(BOOL)a3
{
  self->_shouldTerminate = a3;
}

- (BOOL)shouldTerminate
{
  return self->_shouldTerminate;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setConnection:(id)a3
{
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setParticipantIdentifier:(id)a3
{
}

- (NSNumber)participantIdentifier
{
  return self->_participantIdentifier;
}

- (void)setSession:(id)a3
{
}

- (IDSGroupSession)session
{
  return self->_session;
}

- (MSVQRConnectionMessageCoder)messageCoder
{
  return self->_messageCoder;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_nw_protocol_definition)framerDefinition
{
  return self->_framerDefinition;
}

- (void)setReport:(id)a3
{
}

- (MSVQRConnectionReportProtocol)report
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_report);
  return (MSVQRConnectionReportProtocol *)WeakRetained;
}

- (MSVQRConnectionSessionDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDelegate:(id)a3
{
}

- (MSVQRConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MSVQRConnectionDelegate *)WeakRetained;
}

- (void)_createQuicConnection
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [(MSVQRConnection *)self dataSource];
  v4 = [v3 groupSessionIdentifier];
  v23 = [v4 UUIDString];

  v24 = [(MSVQRConnection *)self participantIdentifier];
  v5 = [(MSVQRConnection *)self queue];
  v6 = [(MSVQRConnection *)self dataSource];
  v7 = [v6 applicationProtocol];

  v8 = [(MSVQRConnection *)self dataSource];
  v9 = [v8 trustHandler];

  objc_initWeak(&location, self);
  v27[1] = (id)MEMORY[0x1E4F143A8];
  v27[2] = (id)3221225472;
  v27[3] = __40__MSVQRConnection__createQuicConnection__block_invoke;
  v27[4] = &unk_1E5ADA568;
  id v22 = v7;
  id v28 = v22;
  id v10 = v9;
  id v30 = v10;
  id v21 = v5;
  id v29 = v21;
  objc_copyWeak(&v31, &location);
  quic_stream = nw_parameters_create_quic_stream();
  v12 = nw_parameters_copy_default_protocol_stack(quic_stream);
  nw_protocol_stack_clear_application_protocols(v12);
  v13 = [(MSVQRConnection *)self framerDefinition];
  options = nw_framer_create_options(v13);

  nw_protocol_stack_prepend_application_protocol(v12, options);
  v15 = objc_msgSend(MEMORY[0x1E4F6AB20], "augmentNetworkParametersForSession:participantID:parameters:", v23, objc_msgSend(v24, "integerValue"), quic_stream);
  nw_connection_t v16 = nw_connection_create(v15, quic_stream);
  [(MSVQRConnection *)self setConnection:v16];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __40__MSVQRConnection__createQuicConnection__block_invoke_4;
  handler[3] = &unk_1E5ADA590;
  objc_copyWeak(v27, &location);
  v17 = v16;
  v26 = v17;
  nw_connection_set_state_changed_handler(v17, handler);
  v18 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v34 = self;
    _os_log_impl(&dword_1A30CD000, v18, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Starting QUIC connection.", buf, 0xCu);
  }

  v19 = [(MSVQRConnection *)self report];
  [v19 startEvent:@"Start QUIC" withParentEvent:@"Connection"];

  v20 = [(MSVQRConnection *)self queue];
  nw_connection_set_queue(v17, v20);

  nw_connection_start(v17);
  objc_destroyWeak(v27);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __40__MSVQRConnection__createQuicConnection__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  nw_quic_connection_set_max_datagram_frame_size();
  nw_quic_connection_set_initial_max_streams_bidirectional();
  nw_quic_connection_set_initial_max_streams_unidirectional();
  v4 = nw_quic_connection_copy_sec_protocol_options();
  sec_protocol_options_add_tls_application_protocol(v4, (const char *)[a1[4] cStringUsingEncoding:4]);
  verify_block[0] = MEMORY[0x1E4F143A8];
  verify_block[1] = 3221225472;
  verify_block[2] = __40__MSVQRConnection__createQuicConnection__block_invoke_2;
  verify_block[3] = &unk_1E5ADA540;
  id v7 = a1[6];
  id v6 = a1[5];
  objc_copyWeak(&v8, a1 + 7);
  sec_protocol_options_set_verify_block(v4, verify_block, (dispatch_queue_t)a1[5]);
  objc_destroyWeak(&v8);
}

void __40__MSVQRConnection__createQuicConnection__block_invoke_4(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    switch(a2)
    {
      case 1:
        if (v5) {
          id v7 = nw_error_copy_cf_error(v5);
        }
        else {
          id v7 = 0;
        }
        v13 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 134218242;
          id v19 = WeakRetained;
          __int16 v20 = 2114;
          id v21 = v7;
          _os_log_impl(&dword_1A30CD000, v13, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Connection state .waiting. Error %{public}@", (uint8_t *)&v18, 0x16u);
        }

        v14 = (void *)MEMORY[0x1E4F28C58];
        v15 = @"NWConnection in waiting state.";
        goto LABEL_27;
      case 2:
        id v7 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
        int v18 = 134217984;
        id v19 = WeakRetained;
        id v8 = "[MSVQRConnection] <%p> Connection state .preparing";
        break;
      case 3:
        v9 = *(NSObject **)(a1 + 32);
        id v10 = nw_protocol_copy_quic_connection_definition();
        id v7 = nw_connection_copy_protocol_metadata(v9, v10);

        if (v7)
        {
          v11 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 134217984;
            id v19 = WeakRetained;
            _os_log_impl(&dword_1A30CD000, v11, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Setting keep alive interval", (uint8_t *)&v18, 0xCu);
          }

          nw_quic_connection_set_keepalive();
        }
        v12 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 134217984;
          id v19 = WeakRetained;
          _os_log_impl(&dword_1A30CD000, v12, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Connection state .ready", (uint8_t *)&v18, 0xCu);
        }

        [WeakRetained _connectionStateDidChangeWithError:0];
        goto LABEL_28;
      case 4:
        if (v5) {
          id v7 = nw_error_copy_cf_error(v5);
        }
        else {
          id v7 = 0;
        }
        nw_connection_t v16 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 134218242;
          id v19 = WeakRetained;
          __int16 v20 = 2114;
          id v21 = v7;
          _os_log_impl(&dword_1A30CD000, v16, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Connection state .failed. Error %{public}@", (uint8_t *)&v18, 0x16u);
        }

        v14 = (void *)MEMORY[0x1E4F28C58];
        v15 = @"NWConnection in failed state.";
LABEL_27:
        v17 = objc_msgSend(v14, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MSVQRConnectionError", 102, v7, v15);
        [WeakRetained _connectionStateDidChangeWithError:v17];

        goto LABEL_28;
      case 5:
        id v7 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
        int v18 = 134217984;
        id v19 = WeakRetained;
        id v8 = "[MSVQRConnection] <%p> Connection state .cancelled";
        break;
      default:
        goto LABEL_29;
    }
    _os_log_impl(&dword_1A30CD000, v7, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v18, 0xCu);
LABEL_28:
  }
LABEL_29:
}

void __40__MSVQRConnection__createQuicConnection__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__MSVQRConnection__createQuicConnection__block_invoke_3;
  v13[3] = &unk_1E5ADA518;
  id v12 = v9;
  id v14 = v12;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  (*(void (**)(uint64_t, id, id, uint64_t, void *))(v10 + 16))(v10, v7, v8, v11, v13);
  objc_destroyWeak(&v15);
}

void __40__MSVQRConnection__createQuicConnection__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _terminateWithError:v5];
  }
}

- (void)_receiveNextMessage
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if ([(MSVQRConnection *)v2 state] == 3)
  {
    id v3 = [(MSVQRConnection *)v2 connection];
    objc_sync_exit(v2);

    objc_initWeak(location, v2);
    completion[0] = MEMORY[0x1E4F143A8];
    completion[1] = 3221225472;
    completion[2] = __38__MSVQRConnection__receiveNextMessage__block_invoke;
    completion[3] = &unk_1E5ADA4F0;
    objc_copyWeak(&v6, location);
    nw_connection_receive_message(v3, completion);
    objc_destroyWeak(&v6);
    objc_destroyWeak(location);
    v2 = (MSVQRConnection *)v3;
  }
  else
  {
    v4 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = v2;
      _os_log_impl(&dword_1A30CD000, v4, OS_LOG_TYPE_ERROR, "[MSVQRConnection] <%p> Cannot receive message because connection is not started.", (uint8_t *)location, 0xCu);
    }

    objc_sync_exit(v2);
  }
}

void __38__MSVQRConnection__receiveNextMessage__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v10 && (CFErrorRef v12 = nw_error_copy_cf_error(v10)) != 0)
    {
      v13 = v12;
      [WeakRetained _terminateWithError:v12];
    }
    else
    {
      id v14 = [WeakRetained framerDefinition];
      v13 = nw_content_context_copy_protocol_metadata(v9, v14);

      if (v13)
      {
        id v15 = nw_framer_message_copy_object_value(v13, "Header");
        if (v15 && (_NSIsNSDictionary() & 1) != 0)
        {
          nw_connection_t v16 = [v15 objectForKeyedSubscript:@"MessageTypeKey"];
          int v17 = [v16 isEqualToString:@"Proto"];

          if (v17)
          {
            v42 = v8;
            int v18 = [WeakRetained messageCoder];
            id v19 = [v18 messageFromData:v42];

            __int16 v20 = [WeakRetained messageCoder];
            uint64_t v21 = [v20 traceIdentifierForMessage:v19];
            uint64_t v22 = (void *)v21;
            v23 = @"no-trace";
            if (v21) {
              v23 = (__CFString *)v21;
            }
            v24 = v23;

            v25 = os_log_create("com.apple.amp.MediaServices", "QuickRelay_Oversize");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218498;
              id v49 = WeakRetained;
              __int16 v50 = 2112;
              v51 = v24;
              __int16 v52 = 2114;
              v53 = v19;
              _os_log_impl(&dword_1A30CD000, v25, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Received message: [%@]%{public}@", buf, 0x20u);
            }

            v26 = [WeakRetained delegate];
            if (objc_opt_respondsToSelector())
            {
              v27 = [WeakRetained delegateQueue];
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __38__MSVQRConnection__receiveNextMessage__block_invoke_106;
              block[3] = &unk_1E5ADA408;
              id v45 = v26;
              id v46 = WeakRetained;
              id v47 = v19;
              dispatch_async(v27, block);
            }
            [WeakRetained _receiveNextMessage];
          }
          else
          {
            id v30 = [v15 objectForKeyedSubscript:@"MessageTypeKey"];
            int v31 = [v30 isEqualToString:@"Status"];

            if (v31)
            {
              v32 = [v15 objectForKeyedSubscript:@"StatusCodeKey"];
              unsigned int v33 = [v32 unsignedIntValue];
              uint64_t v34 = v33;

              if (v33 >= 0x11)
              {
                objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedRpcStatusCode-%ld", v33);
                v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v43 = off_1E5ADA698[v33];
              }
              uint64_t v35 = _MSVLogCategoryQuickRelay();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                id v49 = WeakRetained;
                __int16 v50 = 2114;
                v51 = v43;
                _os_log_impl(&dword_1A30CD000, v35, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Received status %{public}@.", buf, 0x16u);
              }

              v36 = v8;
              v37 = v36;
              if (v36)
              {
                v38 = objc_msgSend(NSString, "stringWithCString:encoding:", -[__CFString bytes](v36, "bytes"), 1);
                if (v38)
                {
                  uint64_t v39 = [NSString stringWithFormat:@"%@ - %@", v43, v38];

                  v43 = (__CFString *)v39;
                }
              }
              v40 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVQRConnectionRPCError", v34, @"%@", v43);
              v41 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MSVQRConnectionError", 200, v40, @"Received status code from QR server.");
              [WeakRetained _terminateWithError:v41];
            }
          }
        }
        else
        {
          id v28 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVQRConnectionError", 200, @"Message has no header.");
          [WeakRetained _terminateWithError:v28];
        }
      }
      else
      {
        id v29 = os_log_create("com.apple.amp.MediaServices", "QuickRelay_Oversize");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218243;
          id v49 = WeakRetained;
          __int16 v50 = 2113;
          v51 = v8;
          _os_log_impl(&dword_1A30CD000, v29, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Ignoring message from unknown protocol. Content: %{private}@", buf, 0x16u);
        }

        [WeakRetained _receiveNextMessage];
        v13 = 0;
      }
    }
  }
}

uint64_t __38__MSVQRConnection__receiveNextMessage__block_invoke_106(uint64_t a1)
{
  return [*(id *)(a1 + 32) connection:*(void *)(a1 + 40) didReceiveMessage:*(void *)(a1 + 48)];
}

- (void)_connectionStateDidChangeWithError:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__MSVQRConnection__connectionStateDidChangeWithError___block_invoke;
  v12[3] = &unk_1E5ADA4A0;
  v12[4] = self;
  id v5 = (uint64_t (**)(void, void))MEMORY[0x1A62426F0](v12);
  id v6 = [(MSVQRConnection *)self report];
  id v7 = self;
  objc_sync_enter(v7);
  if ([(MSVQRConnection *)v7 state] == 2) {
    [v6 endEvent:@"Start QUIC" withError:v4];
  }
  objc_sync_exit(v7);

  if ((((uint64_t (**)(void, id))v5)[2](v5, v4) & 1) == 0)
  {
    [v6 startEvent:@"Send Path" withParentEvent:@"Connection"];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__MSVQRConnection__connectionStateDidChangeWithError___block_invoke_2;
    v8[3] = &unk_1E5ADA4C8;
    id v9 = v6;
    uint64_t v10 = v7;
    uint64_t v11 = v5;
    [(MSVQRConnection *)v7 _sendPathWithCompletion:v8];
  }
}

uint64_t __54__MSVQRConnection__connectionStateDidChangeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if ([*(id *)(a1 + 32) shouldTerminate])
  {
    [*(id *)(a1 + 32) _terminateWithError:0];
  }
  else
  {
    if (!v3)
    {
      uint64_t v5 = 0;
      goto LABEL_6;
    }
    [*(id *)(a1 + 32) _terminateWithError:v3];
  }
  uint64_t v5 = 1;
LABEL_6:
  objc_sync_exit(v4);

  return v5;
}

void __54__MSVQRConnection__connectionStateDidChangeWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) endEvent:@"Send Path" withError:v3];
  id v4 = *(id *)(a1 + 40);
  objc_sync_enter(v4);
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    objc_sync_exit(v4);
  }
  else
  {
    [*(id *)(a1 + 40) setState:3];
    objc_sync_exit(v4);

    [*(id *)(a1 + 32) endEvent:@"Connection"];
    [*(id *)(a1 + 40) _receiveNextMessage];
    uint64_t v5 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1A30CD000, v5, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Started QR connection and registered for message handling.", buf, 0xCu);
    }

    id v7 = [*(id *)(a1 + 40) delegate];
    if (objc_opt_respondsToSelector())
    {
      id v8 = [*(id *)(a1 + 40) delegateQueue];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __54__MSVQRConnection__connectionStateDidChangeWithError___block_invoke_99;
      v11[3] = &unk_1E5ADAA78;
      id v9 = v7;
      uint64_t v10 = *(void *)(a1 + 40);
      id v12 = v9;
      uint64_t v13 = v10;
      dispatch_async(v8, v11);
    }
  }
}

uint64_t __54__MSVQRConnection__connectionStateDidChangeWithError___block_invoke_99(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectionDidStart:*(void *)(a1 + 40)];
}

- (void)_sendPathWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v6 = [v5 UUIDString];

  id v7 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [(MSVQRConnection *)self dataSource];
    id v9 = [v8 rpcPath];
    *(_DWORD *)buf = 134218498;
    id v29 = self;
    __int16 v30 = 2114;
    int v31 = v9;
    __int16 v32 = 2114;
    unsigned int v33 = v6;
    _os_log_impl(&dword_1A30CD000, v7, OS_LOG_TYPE_DEBUG, "[MSVQRConnection] <%p> Sending path %{public}@ with traceID: %{public}@", buf, 0x20u);
  }
  uint64_t v10 = [(MSVQRConnection *)self dataSource];
  uint64_t v11 = [v10 rpcPath];
  id v12 = [v11 dataUsingEncoding:4];

  id v13 = v12;
  id v14 = (const void *)[v13 bytes];
  size_t v15 = [v13 length];
  uint64_t v16 = [(MSVQRConnection *)self queue];
  int v17 = dispatch_data_create(v14, v15, v16, 0);

  int v18 = nw_content_context_create("PathContext");
  id v19 = [(MSVQRConnection *)self framerDefinition];
  message = nw_framer_protocol_create_message(v19);

  v26[0] = @"MessageTypeKey";
  v26[1] = @"TraceIdKey";
  v27[0] = @"Path";
  v27[1] = v6;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  nw_framer_message_set_object_value(message, "Header", v21);

  nw_content_context_set_metadata_for_protocol(v18, message);
  uint64_t v22 = [(MSVQRConnection *)self connection];
  completion[0] = MEMORY[0x1E4F143A8];
  completion[1] = 3221225472;
  completion[2] = __43__MSVQRConnection__sendPathWithCompletion___block_invoke;
  completion[3] = &unk_1E5ADA478;
  id v25 = v4;
  id v23 = v4;
  nw_connection_send(v22, v17, v18, 1, completion);
}

void __43__MSVQRConnection__sendPathWithCompletion___block_invoke(uint64_t a1, nw_error_t error)
{
  if (error) {
    error = (nw_error_t)nw_error_copy_cf_error(error);
  }
  nw_error_t v3 = error;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sessionDidJoinGroup:(id)a3 participantUpdate:(id)a4 error:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v28 = self;
    __int16 v29 = 2114;
    id v30 = v10;
    _os_log_impl(&dword_1A30CD000, v11, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Session did join group with error %{public}@", buf, 0x16u);
  }

  id v12 = [(MSVQRConnection *)self guard];
  int v13 = [v12 disarm];

  if (v13)
  {
    id v14 = [(MSVQRConnection *)self report];
    [v14 endEvent:@"Join Group Session" withError:v10];
    [(MSVQRConnection *)self setGuard:0];
    if (v10)
    {
      size_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MSVQRConnectionError", 102, v10, @"GroupSession join failed with error.");
      [(MSVQRConnection *)self _terminateWithError:v15];
    }
    else
    {
      objc_initWeak(&location, self);
      uint64_t v16 = [MSVBlockGuard alloc];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __63__MSVQRConnection_sessionDidJoinGroup_participantUpdate_error___block_invoke;
      v22[3] = &unk_1E5ADA450;
      v22[4] = self;
      objc_copyWeak(&v23, &location);
      int v17 = [(MSVBlockGuard *)v16 initWithTimeout:v22 interruptionHandler:20.0];
      [(MSVQRConnection *)self setGuard:v17];

      [v14 startEvent:@"Register Plugin" withParentEvent:@"Connection"];
      int v18 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v28 = self;
        _os_log_impl(&dword_1A30CD000, v18, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Register plugin.", buf, 0xCu);
      }

      uint64_t v25 = *MEMORY[0x1E4F6A8A8];
      id v19 = [(MSVQRConnection *)self dataSource];
      __int16 v20 = [v19 pluginIdentifier];
      v26 = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      [v8 registerPluginWithOptions:v21];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
}

void __63__MSVQRConnection_sessionDidJoinGroup_participantUpdate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVQRConnectionError", 102, @"Timed out waiting for plugin allocation.");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [*(id *)(a1 + 32) report];
    [v4 endEvent:@"Register Plugin" withError:v6];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _terminateWithError:v6];
  }
}

- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F6A8A0]];
  id v6 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    id v12 = self;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1A30CD000, v6, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Registered plugin allocation info. Participant ID: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  id v7 = [(MSVQRConnection *)self guard];
  int v8 = [v7 disarm];

  if (v8)
  {
    id v9 = [(MSVQRConnection *)self report];
    [v9 endEvent:@"Register Plugin" withError:0];

    [(MSVQRConnection *)self setGuard:0];
    if (v5)
    {
      [(MSVQRConnection *)self setParticipantIdentifier:v5];
      [(MSVQRConnection *)self _createQuicConnection];
    }
    else
    {
      id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVQRConnectionError", 102, @"Plugin info had no participant identifier.");
      [(MSVQRConnection *)self _terminateWithError:v10];
    }
  }
}

- (void)_createGroupSession
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  nw_error_t v3 = [(MSVQRConnection *)self dataSource];
  id v4 = [v3 account];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F6AB20]);
    id v6 = [(MSVQRConnection *)self dataSource];
    id v7 = [v6 account];
    int v8 = [(MSVQRConnection *)self dataSource];
    id v9 = [v8 groupSessionOptions];
    id v10 = (void *)[v5 initWithAccount:v7 options:v9];
    [(MSVQRConnection *)self setSession:v10];

    int v11 = [(MSVQRConnection *)self session];
    id v12 = [(MSVQRConnection *)self queue];
    [v11 setDelegate:self queue:v12];

    objc_initWeak(&location, self);
    __int16 v13 = [MSVBlockGuard alloc];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __38__MSVQRConnection__createGroupSession__block_invoke;
    v23[3] = &unk_1E5ADA450;
    v23[4] = self;
    objc_copyWeak(&v24, &location);
    id v14 = [(MSVBlockGuard *)v13 initWithTimeout:v23 interruptionHandler:20.0];
    [(MSVQRConnection *)self setGuard:v14];

    uint64_t v15 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(MSVQRConnection *)self dataSource];
      int v17 = [v16 groupSessionIdentifier];
      *(_DWORD *)buf = 134218242;
      __int16 v29 = self;
      __int16 v30 = 2114;
      uint64_t v31 = v17;
      _os_log_impl(&dword_1A30CD000, v15, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Joining group session with sessionID: %{public}@.", buf, 0x16u);
    }
    int v18 = [(MSVQRConnection *)self report];
    [v18 startEvent:@"Join Group Session" withParentEvent:@"Connection"];

    id v19 = [(MSVQRConnection *)self session];
    uint64_t v26 = *MEMORY[0x1E4F6AAA0];
    __int16 v20 = [MEMORY[0x1E4F1C9B8] data];
    v27 = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v19 joinWithOptions:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVQRConnectionError", 100, @"No account in data source, cannot create group session.");
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    [(MSVQRConnection *)self _terminateWithError:v22];
  }
}

void __38__MSVQRConnection__createGroupSession__block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVQRConnectionError", 102, @"Timed out waiting to join group session.");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [*(id *)(a1 + 32) report];
    [v4 endEvent:@"Join Group Session" withError:v6];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _terminateWithError:v6];
  }
}

- (void)_clearState
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(MSVQRConnection *)self setGuard:0];
  nw_error_t v3 = [(MSVQRConnection *)self connection];

  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      id v12 = self;
      _os_log_impl(&dword_1A30CD000, v4, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Clear connection.", (uint8_t *)&v11, 0xCu);
    }

    id v5 = [(MSVQRConnection *)self connection];
    nw_connection_set_state_changed_handler(v5, &__block_literal_global_4450);

    id v6 = [(MSVQRConnection *)self connection];
    nw_connection_cancel(v6);

    [(MSVQRConnection *)self setConnection:0];
  }
  id v7 = [(MSVQRConnection *)self session];

  if (v7)
  {
    int v8 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      id v12 = self;
      _os_log_impl(&dword_1A30CD000, v8, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Clear group session.", (uint8_t *)&v11, 0xCu);
    }

    id v9 = [(MSVQRConnection *)self session];
    [v9 leaveGroupSession];

    id v10 = [(MSVQRConnection *)self session];
    [v10 invalidate];

    [(MSVQRConnection *)self setSession:0];
  }
  [(MSVQRConnection *)self setShouldTerminate:0];
}

- (void)_terminateWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(MSVQRConnection *)v5 state] == 1 || ![(MSVQRConnection *)v5 state])
  {
    objc_sync_exit(v5);
  }
  else
  {
    if ([(MSVQRConnection *)v5 state] == 2)
    {
      id v6 = [(MSVQRConnection *)v5 report];
      [v6 endEvent:@"Connection" withError:v4];
    }
    [(MSVQRConnection *)v5 setState:1];
    objc_sync_exit(v5);

    id v7 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      int v17 = v5;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl(&dword_1A30CD000, v7, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Terminating with error %{public}@", buf, 0x16u);
    }

    if ([(MSVQRConnection *)v5 shouldTerminate]) {
      int v8 = 0;
    }
    else {
      int v8 = v4;
    }
    id v9 = v8;
    [(MSVQRConnection *)v5 _clearState];
    [(MSVQRConnection *)v5 setState:0];
    id v10 = [(MSVQRConnection *)v5 delegate];
    if (objc_opt_respondsToSelector())
    {
      int v11 = [(MSVQRConnection *)v5 delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__MSVQRConnection__terminateWithError___block_invoke;
      block[3] = &unk_1E5ADA408;
      id v13 = v10;
      id v14 = v5;
      id v15 = v9;
      dispatch_async(v11, block);
    }
  }
}

uint64_t __39__MSVQRConnection__terminateWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) connection:*(void *)(a1 + 40) didEndWithError:*(void *)(a1 + 48)];
}

- (void)sendMessage:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"MSVQRConnection.m", 182, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];
  }
  id v6 = self;
  objc_sync_enter(v6);
  if ([(MSVQRConnection *)v6 state] == 3)
  {
    id v7 = [(MSVQRConnection *)v6 connection];
    objc_sync_exit(v6);

    int v8 = [(MSVQRConnection *)v6 messageCoder];
    uint64_t v9 = [v8 traceIdentifierForMessage:v5];
    id v10 = (void *)v9;
    int v11 = @"no-trace";
    if (v9) {
      int v11 = (__CFString *)v9;
    }
    id v12 = v11;

    id v13 = os_log_create("com.apple.amp.MediaServices", "QuickRelay_Oversize");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218499;
      uint64_t v34 = v6;
      __int16 v35 = 2114;
      v36 = v12;
      __int16 v37 = 2113;
      id v38 = v5;
      _os_log_impl(&dword_1A30CD000, v13, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Sending message: [%{public}@]%{private}@", buf, 0x20u);
    }

    id v14 = [(MSVQRConnection *)v6 messageCoder];
    id v15 = [v14 dataFromMessage:v5];

    id v16 = v15;
    int v17 = (const void *)[v16 bytes];
    size_t v18 = [v16 length];
    id v19 = [(MSVQRConnection *)v6 queue];
    uint64_t v20 = dispatch_data_create(v17, v18, v19, 0);

    uint64_t v21 = nw_content_context_create("MessageContext");
    id v22 = [(MSVQRConnection *)v6 framerDefinition];
    message = nw_framer_protocol_create_message(v22);

    uint64_t v31 = @"MessageTypeKey";
    uint64_t v32 = @"Proto";
    id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    nw_framer_message_set_object_value(message, "Header", v24);

    nw_content_context_set_metadata_for_protocol(v21, message);
    objc_initWeak((id *)buf, v6);
    completion[0] = MEMORY[0x1E4F143A8];
    completion[1] = 3221225472;
    completion[2] = __31__MSVQRConnection_sendMessage___block_invoke;
    completion[3] = &unk_1E5ADA3E0;
    objc_copyWeak(&v30, (id *)buf);
    nw_connection_send(v7, v20, v21, 1, completion);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);

    id v6 = (MSVQRConnection *)v7;
  }
  else
  {
    uint64_t v25 = os_log_create("com.apple.amp.MediaServices", "QuickRelay_Oversize");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      unint64_t v26 = [(MSVQRConnection *)v6 state];
      if (v26 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedState-%ld", v26);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = off_1E5ADA678[v26];
      }
      *(_DWORD *)buf = 134218498;
      uint64_t v34 = v6;
      __int16 v35 = 2114;
      v36 = v27;
      __int16 v37 = 2114;
      id v38 = v5;
      _os_log_impl(&dword_1A30CD000, v25, OS_LOG_TYPE_ERROR, "[MSVQRConnection] <%p> Connection in state %{public}@ cannot send message: %{public}@", buf, 0x20u);
    }
    objc_sync_exit(v6);
  }
}

void __31__MSVQRConnection_sendMessage___block_invoke(uint64_t a1, void *a2)
{
  error = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (error)
    {
      CFErrorRef v4 = nw_error_copy_cf_error(error);
      if (v4)
      {
        CFErrorRef v5 = v4;
        [WeakRetained _terminateWithError:v4];
      }
    }
  }
}

- (void)stop
{
  obj = self;
  objc_sync_enter(obj);
  if ([(MSVQRConnection *)obj state])
  {
    if ([(MSVQRConnection *)obj state] == 3) {
      [(MSVQRConnection *)obj _terminateWithError:0];
    }
    else {
      [(MSVQRConnection *)obj setShouldTerminate:1];
    }
  }
  objc_sync_exit(obj);
}

- (void)start
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  obj = self;
  objc_sync_enter(obj);
  if ([(MSVQRConnection *)obj state])
  {
    objc_sync_exit(obj);
  }
  else
  {
    [(MSVQRConnection *)obj setState:2];
    objc_sync_exit(obj);

    uint64_t v2 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      nw_error_t v3 = [(MSVQRConnection *)obj dataSource];
      *(_DWORD *)buf = 134218242;
      id v7 = obj;
      __int16 v8 = 2112;
      uint64_t v9 = v3;
      _os_log_impl(&dword_1A30CD000, v2, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Starting with data source: %@.", buf, 0x16u);
    }
    CFErrorRef v4 = [(MSVQRConnection *)obj report];
    [v4 startEvent:@"Connection"];

    [(MSVQRConnection *)obj _createGroupSession];
  }
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  nw_error_t v3 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl(&dword_1A30CD000, v3, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Deallocating.", buf, 0xCu);
  }

  [(MSVQRConnection *)self _clearState];
  v4.receiver = self;
  v4.super_class = (Class)MSVQRConnection;
  [(MSVQRConnection *)&v4 dealloc];
}

- (MSVQRConnection)initWithDataSource:(id)a3 messageCoder:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MSVQRConnection;
  uint64_t v10 = [(MSVQRConnection *)&v23 init];
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
LABEL_4:
        int v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v12 = dispatch_queue_create("com.apple.amp.mediaservices.MSVQRConnection.serialQueue", v11);
        queue = v10->_queue;
        v10->_queue = (OS_dispatch_queue *)v12;

        id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v15 = dispatch_queue_create("com.apple.amp.mediaservices.MSVQRConnection.delegateQueue", v14);
        delegateQueue = v10->_delegateQueue;
        v10->_delegateQueue = (OS_dispatch_queue *)v15;

        v10->_state = 0;
        v10->_shouldTerminate = 0;
        objc_storeStrong((id *)&v10->_dataSource, a3);
        objc_storeStrong((id *)&v10->_messageCoder, a4);
        int v17 = [(MSVQRConnectionSessionDataSource *)v10->_dataSource applicationProtocol];
        uint64_t v18 = +[MSVQRConnection createFramerDefinitionWithIdentifier:v17];
        framerDefinition = v10->_framerDefinition;
        v10->_framerDefinition = (OS_nw_protocol_definition *)v18;

        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, v10, @"MSVQRConnection.m", 135, @"Invalid parameter not satisfying: %@", @"dataSource" object file lineNumber description];

      if (v9) {
        goto LABEL_4;
      }
    }
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, v10, @"MSVQRConnection.m", 136, @"Invalid parameter not satisfying: %@", @"coder" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v10;
}

+ (id)createFramerDefinitionWithIdentifier:(id)a3
{
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  int v11 = __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke;
  dispatch_queue_t v12 = &__block_descriptor_48_e32_i16__0__NSObject_OS_nw_framer__8l;
  uint64_t v13 = 4;
  id v14 = a1;
  id v3 = a3;
  objc_super v4 = (void *)MEMORY[0x1A62426F0](&v9);
  id v5 = v3;
  id v6 = (const char *)objc_msgSend(v5, "cStringUsingEncoding:", 4, v9, v10, v11, v12, v13, v14);

  nw_protocol_definition_t definition = nw_framer_create_definition(v6, 0, v4);
  return definition;
}

uint64_t __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  nw_framer_set_cleanup_handler(v3, &__block_literal_global_129);
  nw_framer_set_wakeup_handler(v3, &__block_literal_global_131);
  nw_framer_set_stop_handler(v3, &__block_literal_global_134);
  input_handler[0] = MEMORY[0x1E4F143A8];
  input_handler[1] = 3221225472;
  input_handler[2] = __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke_5;
  input_handler[3] = &__block_descriptor_48_e32_Q16__0__NSObject_OS_nw_framer__8l;
  uint64_t v4 = *(void *)(a1 + 40);
  input_void handler[4] = *(void *)(a1 + 32);
  input_handler[5] = v4;
  nw_framer_set_input_handler(v3, input_handler);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke_139;
  v7[3] = &__block_descriptor_48_e76_v36__0__NSObject_OS_nw_framer__8__NSObject_OS_nw_protocol_metadata__16Q24B32l;
  uint64_t v5 = *(void *)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  v7[5] = v5;
  nw_framer_set_output_handler(v3, v7);

  return 1;
}

uint64_t __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke_5(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  do
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x2020000000;
    int v27 = 0;
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__4497;
    id v22 = __Block_byref_object_dispose__4498;
    id v23 = 0;
    size_t v5 = *(void *)(a1 + 32);
    parse[0] = v4;
    parse[1] = 3221225472;
    parse[2] = __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke_135;
    parse[3] = &unk_1E5ADA5F8;
    size_t v16 = v5;
    id v6 = v11;
    uint64_t v13 = v6;
    id v14 = &v18;
    uint64_t v7 = *(void *)(a1 + 40);
    dispatch_queue_t v15 = &v24;
    uint64_t v17 = v7;
    if (nw_framer_parse_input(v6, v5, v5, 0, parse) && v19[5])
    {
      id v8 = nw_framer_message_create(v6);
      nw_framer_message_set_object_value(v8, "Header", (id)v19[5]);
      BOOL v9 = nw_framer_deliver_input_no_copy(v6, *((int *)v25 + 6), v8, 1);

      if (!v9) {
        uint64_t v2 = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
      uint64_t v2 = *(void *)(a1 + 32);
    }

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  while (v9);

  return v2;
}

void __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke_139(uint64_t a1, void *a2, NSObject *a3, size_t a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a2;
  id v8 = nw_framer_message_copy_object_value(a3, "Header");
  BOOL v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"MessageTypeKey"];
    int v11 = [v10 isEqualToString:@"Proto"];

    if (v11)
    {
      unsigned int v12 = bswap32(a4);
LABEL_12:
      *(_DWORD *)buf = v12;
      nw_framer_write_output(v7, buf, *(void *)(a1 + 40));
LABEL_13:
      nw_framer_write_output_no_copy(v7, a4);
      goto LABEL_14;
    }
    uint64_t v18 = [v9 objectForKeyedSubscript:@"MessageTypeKey"];
    int v19 = [v18 isEqualToString:@"Status"];

    if (v19)
    {
      uint64_t v20 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v21;
        _os_log_impl(&dword_1A30CD000, v20, OS_LOG_TYPE_ERROR, "[MSVQRConnection] <%p> Should not be sending status codes to server.", buf, 0xCu);
      }

      id v22 = [v9 objectForKeyedSubscript:@"StatusCodeKey"];
      int v23 = [v22 unsignedIntValue];

      unsigned int v12 = bswap32(a4 | (v23 << 16) | 0x80000000);
      goto LABEL_12;
    }
    uint64_t v24 = [v9 objectForKeyedSubscript:@"MessageTypeKey"];
    int v25 = [v24 isEqualToString:@"Path"];

    if (v25)
    {
      uint64_t v26 = [v9 objectForKeyedSubscript:@"TraceIdKey"];
      *(_WORD *)output_buffer = bswap32(a4 + ((v26 != 0) << 15)) >> 16;
      nw_framer_write_output(v7, output_buffer, 2uLL);
      if (v26)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        int v27 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v26];
        [v27 getUUIDBytes:buf];

        nw_framer_write_output(v7, buf, 0x10uLL);
      }

      goto LABEL_13;
    }
    uint64_t v13 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      dispatch_queue_t v15 = "[MSVQRConnection] <%p> Header did not contain valid message type %{public}@";
      size_t v16 = v13;
      uint32_t v17 = 22;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v13 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v14;
      dispatch_queue_t v15 = "[MSVQRConnection] <%p> No header found on output message.";
      size_t v16 = v13;
      uint32_t v17 = 12;
LABEL_6:
      _os_log_impl(&dword_1A30CD000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    }
  }

LABEL_14:
}

uint64_t __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke_135(uint64_t a1, uint64_t a2, unint64_t a3)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if (!a2 || *(void *)(a1 + 56) > a3) {
    return 0;
  }
  __memcpy_chk();
  unsigned int v4 = bswap32(0);
  if ((v4 & 0x80000000) != 0)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (unsigned __int16)v4;
    v28[0] = @"MessageTypeKey";
    v28[1] = @"StatusCodeKey";
    v29[0] = @"Status";
    unsigned int v6 = HIWORD(v4) & 0x7FFF;
    uint64_t v7 = [NSNumber numberWithUnsignedShort:v6];
    v29[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    int v11 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 64);
      int v13 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 134218496;
      uint64_t v23 = v12;
      __int16 v24 = 1024;
      unsigned int v25 = v6;
      __int16 v26 = 1024;
      int v27 = v13;
      uint64_t v14 = "[MSVQRConnection] <%p> Parsed status - code: %d, len: %d";
      dispatch_queue_t v15 = v11;
      uint32_t v16 = 24;
LABEL_11:
      _os_log_impl(&dword_1A30CD000, v15, OS_LOG_TYPE_DEBUG, v14, buf, v16);
    }
  }
  else
  {
    if (v4 >= 0xF4241)
    {
      nw_framer_mark_failed_with_error(*(nw_framer_t *)(a1 + 32), 22);
      return 0;
    }
    id v30 = @"MessageTypeKey";
    v31[0] = @"Proto";
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    int v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
    int v11 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void *)(a1 + 64);
      unsigned int v21 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 134218240;
      uint64_t v23 = v20;
      __int16 v24 = 1024;
      unsigned int v25 = v21;
      uint64_t v14 = "[MSVQRConnection] <%p> Parsed proto - len: %d";
      dispatch_queue_t v15 = v11;
      uint32_t v16 = 18;
      goto LABEL_11;
    }
  }

  return *(void *)(a1 + 56);
}

uint64_t __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke_4()
{
  return 1;
}

+ (id)connectionWithDataSource:(id)a3 messageCoder:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[MSVQRConnection alloc] initWithDataSource:v6 messageCoder:v5];

  return v7;
}

@end