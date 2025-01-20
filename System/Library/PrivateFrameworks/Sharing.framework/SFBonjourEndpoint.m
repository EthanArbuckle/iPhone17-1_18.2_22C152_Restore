@interface SFBonjourEndpoint
+ (id)createConnectionParameters;
- (BOOL)initiatedConnection;
- (BOOL)isAdvToBrowserConnection;
- (BOOL)isConnected;
- (NSMutableSet)remoteAdvDataSet;
- (NSString)localUniqueIDString;
- (NSString)remoteUniqueIDString;
- (OS_dispatch_queue)queue;
- (OS_nw_connection)connection;
- (OS_nw_endpoint)remoteEndpoint;
- (SFBonjourEndpoint)initWithConnection:(id)a3 isAdvToBrowserConnection:(BOOL)a4 localUniqueID:(id)a5 withQueue:(id)a6;
- (id)_getServerRemoteUUIDFromConnectionMetadata:(id)a3 isAdvToBrowserConnection:(BOOL)a4;
- (id)didConnectHandler;
- (id)didDisconnectHandler;
- (id)didReceiveDataHandler;
- (void)_handleUUIDHeaders;
- (void)_startConnection;
- (void)cancel;
- (void)receiveNextMessage;
- (void)sendDataMessage:(id)a3 completion:(id)a4;
- (void)setDidConnectHandler:(id)a3;
- (void)setDidDisconnectHandler:(id)a3;
- (void)setDidReceiveDataHandler:(id)a3;
- (void)setInitiatedConnection:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setLocalUniqueIDString:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteAdvDataSet:(id)a3;
- (void)setRemoteUniqueIDString:(id)a3;
@end

@implementation SFBonjourEndpoint

- (SFBonjourEndpoint)initWithConnection:(id)a3 isAdvToBrowserConnection:(BOOL)a4 localUniqueID:(id)a5 withQueue:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SFBonjourEndpoint;
  v14 = [(SFBonjourEndpoint *)&v25 init];
  v15 = v14;
  if (v14)
  {
    if (v12 && v11 && v13)
    {
      objc_storeStrong((id *)&v14->_queue, a6);
      objc_storeStrong((id *)&v15->_connection, a3);
      nw_endpoint_t v16 = nw_connection_copy_endpoint((nw_connection_t)v15->_connection);
      remoteEndpoint = v15->_remoteEndpoint;
      v15->_remoteEndpoint = (OS_nw_endpoint *)v16;

      if (v15->_remoteEndpoint)
      {
        v15->_isAdvToBrowserConnection = a4;
        objc_storeStrong((id *)&v15->_localUniqueIDString, a5);
        [(SFBonjourEndpoint *)v15 _startConnection];
        if (!v15->_isAdvToBrowserConnection)
        {
          v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
          remoteAdvDataSet = v15->_remoteAdvDataSet;
          v15->_remoteAdvDataSet = v18;
        }
        goto LABEL_8;
      }
      v21 = daemon_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v24[0] = 0;
        v22 = "Invalid remoteEndpoint ";
        goto LABEL_13;
      }
    }
    else
    {
      v21 = daemon_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v24[0] = 0;
        v22 = "Invalid arguments to SFBonjourEndpoint";
LABEL_13:
        _os_log_impl(&dword_1A5389000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)v24, 2u);
      }
    }

    v20 = 0;
    goto LABEL_15;
  }
LABEL_8:
  v20 = v15;
LABEL_15:

  return v20;
}

- (void)_startConnection
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = connection;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Started connecting to %@", (uint8_t *)&buf, 0xCu);
  }

  nw_connection_set_queue((nw_connection_t)self->_connection, (dispatch_queue_t)self->_queue);
  id location = 0;
  objc_initWeak(&location, self);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000;
  nw_endpoint_t v16 = __Block_byref_object_copy__16;
  v17 = __Block_byref_object_dispose__16;
  id v18 = 0;
  v5 = self->_connection;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __37__SFBonjourEndpoint__startConnection__block_invoke;
  v9 = &unk_1E5BC1628;
  objc_copyWeak(&v12, &location);
  v10 = self;
  p_long long buf = &buf;
  nw_connection_set_state_changed_handler(v5, &v6);
  [(SFBonjourEndpoint *)self _handleUUIDHeaders];
  nw_connection_start((nw_connection_t)self->_connection);
  objc_destroyWeak(&v12);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

void __37__SFBonjourEndpoint__startConnection__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = [WeakRetained connection];
    v10 = nw_connection_copy_endpoint(v9);

    if (v6) {
      int error_code = nw_error_get_error_code(v6);
    }
    else {
      int error_code = 0;
    }
    *__error() = error_code;
    id v12 = daemon_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      hostname = nw_endpoint_get_hostname(v10);
      int port = nw_endpoint_get_port(v10);
      int v15 = *__error();
      int v38 = 67109890;
      *(_DWORD *)v39 = a2;
      *(_WORD *)&v39[4] = 2080;
      *(void *)&v39[6] = hostname;
      *(_WORD *)&v39[14] = 1024;
      *(_DWORD *)&v39[16] = port;
      LOWORD(v40[0]) = 1024;
      *(_DWORD *)((char *)v40 + 2) = v15;
      _os_log_impl(&dword_1A5389000, v12, OS_LOG_TYPE_DEFAULT, "Connection state changed to %d (host %s port %u error %d)", (uint8_t *)&v38, 0x1Eu);
    }

    switch(a2)
    {
      case 5:
        v24 = daemon_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = *((void *)v8 + 6);
          v26 = nw_endpoint_get_hostname(v10);
          int v27 = nw_endpoint_get_port(v10);
          int v38 = 138412802;
          *(void *)v39 = v25;
          *(_WORD *)&v39[8] = 2080;
          *(void *)&v39[10] = v26;
          *(_WORD *)&v39[18] = 1024;
          v40[0] = v27;
          _os_log_impl(&dword_1A5389000, v24, OS_LOG_TYPE_DEFAULT, "Connection (%@) to %s port %u cancelled", (uint8_t *)&v38, 0x1Cu);
        }

        v28 = [v8 didDisconnectHandler];

        if (v28)
        {
          v29 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          if (v29) {
            CFErrorRef v30 = nw_error_copy_cf_error(v29);
          }
          else {
            CFErrorRef v30 = 0;
          }
          v33 = [v8 didDisconnectHandler];
          ((void (**)(void, CFErrorRef))v33)[2](v33, v30);
        }
        v34 = (void *)*((void *)v8 + 6);
        *((void *)v8 + 6) = 0;

        v35 = (void *)*((void *)v8 + 5);
        *((void *)v8 + 5) = 0;

        uint64_t v36 = *(void *)(*(void *)(a1 + 40) + 8);
        v37 = *(void **)(v36 + 40);
        *(void *)(v36 + 40) = 0;

        break;
      case 4:
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
        v31 = [v8 connection];
        nw_connection_cancel(v31);

        break;
      case 3:
        nw_endpoint_t v16 = daemon_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *((void *)v8 + 6);
          id v18 = nw_endpoint_get_hostname(v10);
          int v19 = nw_endpoint_get_port(v10);
          int v38 = 138412802;
          *(void *)v39 = v17;
          *(_WORD *)&v39[8] = 2080;
          *(void *)&v39[10] = v18;
          *(_WORD *)&v39[18] = 1024;
          v40[0] = v19;
          _os_log_impl(&dword_1A5389000, v16, OS_LOG_TYPE_DEFAULT, "Connection (%@) to %s port %u succeeded! begin receiving messages", (uint8_t *)&v38, 0x1Cu);
        }

        if (([v8 isAdvToBrowserConnection] & 1) == 0)
        {
          v20 = objc_msgSend(v8, "_getServerRemoteUUIDFromConnectionMetadata:isAdvToBrowserConnection:", *(void *)(*(void *)(a1 + 32) + 48), objc_msgSend(*(id *)(a1 + 32), "isAdvToBrowserConnection"));
          [v8 setRemoteUniqueIDString:v20];
        }
        v21 = [v8 remoteUniqueIDString];

        if (v21)
        {
          v22 = [v8 didConnectHandler];

          if (v22)
          {
            v23 = [v8 didConnectHandler];
            v23[2]();
          }
          [v8 receiveNextMessage];
        }
        else
        {
          v32 = daemon_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            __37__SFBonjourEndpoint__startConnection__block_invoke_cold_1();
          }

          nw_connection_cancel(*((nw_connection_t *)v8 + 6));
        }
        break;
    }
  }
}

- (id)_getServerRemoteUUIDFromConnectionMetadata:(id)a3 isAdvToBrowserConnection:(BOOL)a4
{
  uint64_t v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a4)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    int v19 = __Block_byref_object_copy__16;
    v20 = __Block_byref_object_dispose__16;
    id v21 = 0;
    id v8 = nw_protocol_copy_ws_definition();
    v9 = nw_connection_copy_protocol_metadata(v6, v8);

    v10 = nw_ws_metadata_copy_server_response(v9);
    id v11 = v10;
    if (v10)
    {
      enumerator[0] = MEMORY[0x1E4F143A8];
      enumerator[1] = 3221225472;
      enumerator[2] = __89__SFBonjourEndpoint__getServerRemoteUUIDFromConnectionMetadata_isAdvToBrowserConnection___block_invoke;
      enumerator[3] = &unk_1E5BC1650;
      enumerator[4] = &v16;
      nw_ws_response_enumerate_additional_headers(v10, enumerator);
    }
    id v12 = (void *)v17[5];
    if (!v12)
    {
      id v13 = daemon_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SFBonjourEndpoint _getServerRemoteUUIDFromConnectionMetadata:isAdvToBrowserConnection:]();
      }

      id v12 = (void *)v17[5];
    }
    id v7 = v12;

    _Block_object_dispose(&v16, 8);
  }

  return v7;
}

uint64_t __89__SFBonjourEndpoint__getServerRemoteUUIDFromConnectionMetadata_isAdvToBrowserConnection___block_invoke(uint64_t a1, char *__s1, uint64_t a3)
{
  if (!strcmp(__s1, "SFBonjourEndpointServerUUIDHeader"))
  {
    uint64_t v5 = [NSString stringWithUTF8String:a3];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  return 1;
}

- (void)_handleUUIDHeaders
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "WebSocket protocol not found in connection parameters", v2, v3, v4, v5, v6);
}

void __39__SFBonjourEndpoint__handleUUIDHeaders__block_invoke(uint64_t a1, void *a2)
{
  options = a2;
  nw_protocol_definition_t v4 = nw_protocol_copy_ws_definition();
  nw_protocol_definition_t v5 = nw_protocol_options_copy_definition(options);
  int v6 = MEMORY[0x1A626C0D0](v4, v5);

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

NSObject *__39__SFBonjourEndpoint__handleUUIDHeaders__block_invoke_124(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  nw_protocol_definition_t v5 = WeakRetained;
  if (WeakRetained)
  {
    enumerator[0] = MEMORY[0x1E4F143A8];
    enumerator[1] = 3221225472;
    enumerator[2] = __39__SFBonjourEndpoint__handleUUIDHeaders__block_invoke_2;
    enumerator[3] = &unk_1E5BC16A0;
    enumerator[4] = WeakRetained;
    nw_ws_request_enumerate_additional_headers(v3, enumerator);
    int v6 = nw_ws_response_create(nw_ws_response_status_accept, 0);
    nw_ws_response_add_additional_header(v6, "SFBonjourEndpointServerUUIDHeader", (const char *)[v5[7] UTF8String]);
  }
  else
  {
    int v6 = nw_ws_response_create(nw_ws_response_status_reject, 0);
  }

  return v6;
}

uint64_t __39__SFBonjourEndpoint__handleUUIDHeaders__block_invoke_2(uint64_t a1, char *__s1, uint64_t a3)
{
  if (!strcmp(__s1, "SFBonjourEndpointClientUUIDHeader"))
  {
    uint64_t v5 = [NSString stringWithUTF8String:a3];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = v5;
  }
  return 1;
}

- (void)cancel
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "cancel called on nil connection", v2, v3, v4, v5, v6);
}

- (void)receiveNextMessage
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "receiveNextMessage called on nil connection", v2, v3, v4, v5, v6);
}

void __39__SFBonjourEndpoint_receiveNextMessage__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  v9 = a3;
  id v10 = a5;
  id WeakRetained = (nw_connection_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v12 = daemon_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      nw_connection_t v19 = v8;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_1A5389000, v12, OS_LOG_TYPE_DEFAULT, "receiveNextMessage data %@ error:%@", (uint8_t *)&v18, 0x16u);
    }

    id v13 = v8;
    if (v9 && nw_content_context_get_is_final(v9))
    {
      v14 = daemon_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        nw_connection_t v15 = WeakRetained[6];
        int v18 = 138412290;
        nw_connection_t v19 = v15;
        _os_log_impl(&dword_1A5389000, v14, OS_LOG_TYPE_DEFAULT, "receiveNextMessage got connection closed %@", (uint8_t *)&v18, 0xCu);
      }

      nw_connection_cancel(WeakRetained[6]);
    }
    else if (!v10)
    {
      uint64_t v16 = [(nw_connection_t *)WeakRetained didReceiveDataHandler];

      if (v13 && v16)
      {
        uint64_t v17 = [(nw_connection_t *)WeakRetained didReceiveDataHandler];
        ((void (**)(void, NSObject *))v17)[2](v17, v13);
      }
      [(nw_connection_t *)WeakRetained receiveNextMessage];
    }
  }
}

- (void)sendDataMessage:(id)a3 completion:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_connection)
  {
    id v8 = v6;
    v9 = dispatch_data_create((const void *)[v8 bytes], objc_msgSend(v8, "length"), 0, 0);
    metadata = nw_ws_create_metadata(nw_ws_opcode_binary);
    id v11 = nw_content_context_create("send");
    nw_content_context_set_metadata_for_protocol(v11, metadata);
    connection = self->_connection;
    completion[0] = MEMORY[0x1E4F143A8];
    completion[1] = 3221225472;
    completion[2] = __48__SFBonjourEndpoint_sendDataMessage_completion___block_invoke;
    completion[3] = &unk_1E5BC1718;
    id v17 = v8;
    id v18 = v7;
    nw_connection_send(connection, v9, v11, 1, completion);

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28760];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"Unable to send message, nil connection";
    nw_connection_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v9 = [v13 errorWithDomain:v14 code:-6700 userInfo:v15];

    (*((void (**)(id, NSObject *))v7 + 2))(v7, v9);
    goto LABEL_5;
  }
LABEL_6:
}

void __48__SFBonjourEndpoint_sendDataMessage_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = daemon_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) length];
    int v8 = 138412546;
    v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "nw_connection_send completed with error: %@, bytes :%lu", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v3)
    {
      CFErrorRef v7 = nw_error_copy_cf_error(v3);
      uint64_t v6 = *(void *)(a1 + 40);
    }
    else
    {
      CFErrorRef v7 = 0;
    }
    (*(void (**)(uint64_t, CFErrorRef))(v6 + 16))(v6, v7);
  }
}

+ (id)createConnectionParameters
{
  secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], &__block_literal_global_65);
  uint64_t v3 = nw_parameters_copy_default_protocol_stack(secure_tcp);
  options = nw_ws_create_options(nw_ws_version_13);
  nw_ws_options_set_auto_reply_ping(options, 1);
  nw_protocol_stack_prepend_application_protocol(v3, options);
  uint64_t v5 = nw_interface_create_with_name();
  nw_parameters_require_interface(secure_tcp, v5);

  uint64_t v6 = nw_interface_create_with_name();
  nw_parameters_prohibit_interface(secure_tcp, v6);

  return secure_tcp;
}

void __47__SFBonjourEndpoint_createConnectionParameters__block_invoke(uint64_t a1, void *a2)
{
  options = a2;
  nw_tcp_options_set_enable_keepalive(options, 1);
  nw_tcp_options_set_keepalive_idle_time(options, 2u);
  nw_tcp_options_set_no_delay(options, 1);
  nw_tcp_options_set_enable_fast_open(options, 1);
}

- (id)didConnectHandler
{
  return self->_didConnectHandler;
}

- (void)setDidConnectHandler:(id)a3
{
}

- (id)didDisconnectHandler
{
  return self->_didDisconnectHandler;
}

- (void)setDidDisconnectHandler:(id)a3
{
}

- (id)didReceiveDataHandler
{
  return self->_didReceiveDataHandler;
}

- (void)setDidReceiveDataHandler:(id)a3
{
}

- (OS_nw_endpoint)remoteEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 40, 1);
}

- (OS_nw_connection)connection
{
  return (OS_nw_connection *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isAdvToBrowserConnection
{
  return self->_isAdvToBrowserConnection;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSString)localUniqueIDString
{
  return self->_localUniqueIDString;
}

- (void)setLocalUniqueIDString:(id)a3
{
}

- (NSString)remoteUniqueIDString
{
  return self->_remoteUniqueIDString;
}

- (void)setRemoteUniqueIDString:(id)a3
{
}

- (NSMutableSet)remoteAdvDataSet
{
  return self->_remoteAdvDataSet;
}

- (void)setRemoteAdvDataSet:(id)a3
{
}

- (BOOL)initiatedConnection
{
  return self->_initiatedConnection;
}

- (void)setInitiatedConnection:(BOOL)a3
{
  self->_initiatedConnection = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteAdvDataSet, 0);
  objc_storeStrong((id *)&self->_remoteUniqueIDString, 0);
  objc_storeStrong((id *)&self->_localUniqueIDString, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong(&self->_didReceiveDataHandler, 0);
  objc_storeStrong(&self->_didDisconnectHandler, 0);

  objc_storeStrong(&self->_didConnectHandler, 0);
}

void __37__SFBonjourEndpoint__startConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "No remote UUID found, cancelling connection", v2, v3, v4, v5, v6);
}

- (void)_getServerRemoteUUIDFromConnectionMetadata:isAdvToBrowserConnection:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "No Server UUID header found in WS response", v2, v3, v4, v5, v6);
}

@end