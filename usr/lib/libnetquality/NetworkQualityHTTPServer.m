@interface NetworkQualityHTTPServer
- (NetworkQualityHTTPServer)init;
- (NetworkQualityHTTPServer)initWithConfiguration:(id)a3;
- (NetworkQualityHTTPServer)initWithLaunchd;
- (NetworkQualityHTTPServer)initWithPort:(unsigned int)a3;
- (NetworkQualityHTTPServer)initWithPort:(unsigned int)a3 enableHTTP3:(BOOL)a4;
- (NetworkQualityHTTPServer)initWithPort:(unsigned int)a3 tlsEnabled:(BOOL)a4 httpVersion:(int)a5 bonjourEnabled:(BOOL)a6;
- (id)HTTP2ParametersForServer;
- (id)HTTP3ParametersForServer;
- (id)configForConnection:(id)a3 mirrorIP:(BOOL)a4;
- (id)urlForType:(id)a3 withAddress:(id)a4 mirrorIP:(BOOL)a5;
- (id)urlFormatAddress:(id)a3;
- (void)mirrorIP:(BOOL)a3;
- (void)receiveLoop:(id)a3;
- (void)setCommmonParameters:(id)a3;
- (void)start:(id)a3;
- (void)stop;
@end

@implementation NetworkQualityHTTPServer

- (NetworkQualityHTTPServer)initWithLaunchd
{
  result = [(NetworkQualityHTTPServer *)self initWithPort:0 tlsEnabled:1 httpVersion:4 bonjourEnabled:1];
  if (result) {
    result->launchdInvoked = 1;
  }
  return result;
}

- (NetworkQualityHTTPServer)initWithPort:(unsigned int)a3
{
  return [(NetworkQualityHTTPServer *)self initWithPort:*(void *)&a3 tlsEnabled:1 httpVersion:4 bonjourEnabled:1];
}

- (NetworkQualityHTTPServer)initWithPort:(unsigned int)a3 enableHTTP3:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = 4;
  }
  return [(NetworkQualityHTTPServer *)self initWithPort:*(void *)&a3 tlsEnabled:1 httpVersion:v4 bonjourEnabled:1];
}

- (NetworkQualityHTTPServer)initWithPort:(unsigned int)a3 tlsEnabled:(BOOL)a4 httpVersion:(int)a5 bonjourEnabled:(BOOL)a6
{
  v20.receiver = self;
  v20.super_class = (Class)NetworkQualityHTTPServer;
  v10 = [(NetworkQualityHTTPServer *)&v20 init];
  if (!v10) {
    goto LABEL_7;
  }
  unsigned int v11 = +[NetworkQualityServerConfiguration defaultIdleTimeout];
  v10->port = a3;
  v10->idleTimeoutSeconds = v11;
  v10->hasStarted = 0;
  v10->tlsEnabled = a4;
  v10->bonjourEnabled = a6;
  v10->httpVersion = a5;
  v10->l4sEnabled = 0;
  dispatch_data_t v12 = dispatch_data_create("X", 1uLL, 0, 0);
  small_response_data = v10->small_response_data;
  v10->small_response_data = (OS_dispatch_data *)v12;

  v14 = malloc_type_malloc(0x100000uLL, 0x57A5137CuLL);
  memset(v14, 88, 0x100000uLL);
  dispatch_data_t v15 = dispatch_data_create(v14, 0x100000uLL, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  large_response_data = v10->large_response_data;
  v10->large_response_data = (OS_dispatch_data *)v15;

  CFArrayRef v19 = 0;
  if (!CreateSelfSignedIdentity(@"networkquality", (void **)&v10->sec_identity, &v19))
  {

LABEL_7:
    v17 = v10;
    goto LABEL_8;
  }
  netqual_log_init();
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
    -[NetworkQualityHTTPServer initWithPort:tlsEnabled:httpVersion:bonjourEnabled:]();
  }

  v17 = 0;
LABEL_8:

  return v17;
}

- (NetworkQualityHTTPServer)initWithConfiguration:(id)a3
{
  id v4 = a3;
  if ([v4 httpProtocol] == 1) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = 4;
  }
  v6 = -[NetworkQualityHTTPServer initWithPort:tlsEnabled:httpVersion:bonjourEnabled:](self, "initWithPort:tlsEnabled:httpVersion:bonjourEnabled:", [v4 listenPort], [v4 tlsEnabled], [v4 httpVersion], [v4 bonjourEnabled]);
  if (v6)
  {
    v6->idleTimeoutSeconds = [v4 idleTimeoutSeconds];
    v6->mirrorIP = [v4 mirrorServerIP];
    v6->l4sEnabled = [v4 l4sEnabled];
    uint64_t v7 = [v4 networkServiceType];
    if ((unint64_t)(v7 - 2) > 9) {
      unsigned int v8 = 0;
    }
    else {
      unsigned int v8 = dword_219319C50[v7 - 2];
    }
    v6->networkTrafficClass = v8;
  }

  return v6;
}

- (NetworkQualityHTTPServer)init
{
  return [(NetworkQualityHTTPServer *)self initWithPort:0 tlsEnabled:1 httpVersion:4 bonjourEnabled:1];
}

- (void)setCommmonParameters:(id)a3
{
  parameters = a3;
  nw_parameters_set_data_mode();
  nw_parameters_set_server_mode();
  nw_parameters_set_reuse_local_address(parameters, 1);
  nw_parameters_set_receive_any_interface();
  if (self->networkTrafficClass) {
    nw_parameters_set_traffic_class();
  }
}

- (id)HTTP2ParametersForServer
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__NetworkQualityHTTPServer_HTTP2ParametersForServer__block_invoke;
  v12[3] = &unk_26439D318;
  v12[4] = self;
  v3 = (void *)MEMORY[0x21D4880C0](v12, a2);
  id v4 = (void *)MEMORY[0x21D4880C0](*MEMORY[0x263F14478]);
  if (self->tlsEnabled)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__NetworkQualityHTTPServer_HTTP2ParametersForServer__block_invoke_2;
    v10[3] = &unk_26439D340;
    id v11 = v3;
    uint64_t v5 = MEMORY[0x21D4880C0](v10);

    id v4 = (void *)v5;
  }
  options = nw_http_messaging_create_options();
  nw_http2_set_idle_timeout();
  nw_tcp_options_set_enable_l4s();
  secure_tcp = nw_parameters_create_secure_tcp(v4, (nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14470]);
  [(NetworkQualityHTTPServer *)self setCommmonParameters:secure_tcp];
  unsigned int v8 = nw_parameters_copy_default_protocol_stack(secure_tcp);
  nw_protocol_stack_prepend_application_protocol(v8, options);
  nw_parameters_set_prohibit_joining_protocols();
  nw_parameters_set_attach_protocol_listener();

  return secure_tcp;
}

void __52__NetworkQualityHTTPServer_HTTP2ParametersForServer__block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 28) - 3;
  if (v3 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = off_26439D478[v3];
  }
  options = a2;
  sec_protocol_options_add_tls_application_protocol(options, v4);
  sec_protocol_options_set_peer_authentication_required(options, 0);
  sec_protocol_options_set_local_identity(options, *(sec_identity_t *)(*(void *)(a1 + 32) + 64));
  sec_protocol_options_append_tls_ciphersuite_group(options, tls_ciphersuite_group_default);
}

void __52__NetworkQualityHTTPServer_HTTP2ParametersForServer__block_invoke_2(uint64_t a1, id a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)HTTP3ParametersForServer
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__NetworkQualityHTTPServer_HTTP3ParametersForServer__block_invoke;
  v11[3] = &unk_26439D318;
  v11[4] = self;
  id v3 = (void *)MEMORY[0x21D4880C0](v11, a2);
  options = nw_http_messaging_create_options();
  nw_http3_set_idle_timeout();
  nw_quic_connection_set_enable_l4s();
  uint64_t v9 = MEMORY[0x263EF8330];
  v10 = v3;
  id v5 = v3;
  quic_stream = nw_parameters_create_quic_stream();
  -[NetworkQualityHTTPServer setCommmonParameters:](self, "setCommmonParameters:", quic_stream, v9, 3221225472, __52__NetworkQualityHTTPServer_HTTP3ParametersForServer__block_invoke_2, &unk_26439D340);
  uint64_t v7 = nw_parameters_copy_default_protocol_stack(quic_stream);
  nw_protocol_stack_prepend_application_protocol(v7, options);
  nw_parameters_set_prohibit_joining_protocols();
  nw_parameters_set_attach_protocol_listener();

  return quic_stream;
}

void __52__NetworkQualityHTTPServer_HTTP3ParametersForServer__block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 28) - 3;
  if (v3 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = off_26439D478[v3];
  }
  options = a2;
  sec_protocol_options_add_tls_application_protocol(options, v4);
  sec_protocol_options_set_peer_authentication_required(options, 0);
  sec_protocol_options_set_local_identity(options, *(sec_identity_t *)(*(void *)(a1 + 32) + 64));
  sec_protocol_options_append_tls_ciphersuite_group(options, tls_ciphersuite_group_default);
}

void __52__NetworkQualityHTTPServer_HTTP3ParametersForServer__block_invoke_2(uint64_t a1)
{
  id v2 = (id)nw_quic_connection_copy_sec_protocol_options();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)start:(id)a3
{
  v53[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = (OS_dispatch_queue *)dispatch_queue_create("networkQuality", MEMORY[0x263EF83A8]);
  queue = self->queue;
  self->queue = v5;

  if (self->httpVersion == 5) {
    [(NetworkQualityHTTPServer *)self HTTP3ParametersForServer];
  }
  else {
  uint64_t v7 = [(NetworkQualityHTTPServer *)self HTTP2ParametersForServer];
  }
  unsigned int v8 = v7;
  if (self->launchdInvoked)
  {
    uint64_t v9 = (OS_nw_listener *)nw_listener_create_with_launchd_key();
LABEL_6:
    listener = self->listener;
    self->listener = v9;
    goto LABEL_9;
  }
  if (!self->port)
  {
    uint64_t v9 = (OS_nw_listener *)nw_listener_create(v7);
    goto LABEL_6;
  }
  [NSString stringWithFormat:@"%d", self->port];
  listener = (OS_nw_listener *) objc_claimAutoreleasedReturnValue();
  id v11 = (OS_nw_listener *)nw_listener_create_with_port((const char *)[(OS_nw_listener *)listener UTF8String], v8);
  dispatch_data_t v12 = self->listener;
  self->listener = v11;

LABEL_9:
  if (self->listener)
  {
    v13 = dispatch_group_create();
    if (self->bonjourEnabled)
    {
      bonjour_service = nw_advertise_descriptor_create_bonjour_service(0, "_nq._tcp", "local");
      nw_listener_set_advertise_descriptor((nw_listener_t)self->listener, bonjour_service);
      dispatch_group_enter(v13);
      dispatch_data_t v15 = self->listener;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __34__NetworkQualityHTTPServer_start___block_invoke;
      handler[3] = &unk_26439D368;
      handler[4] = self;
      v43 = v13;
      nw_listener_set_advertised_endpoint_changed_handler(v15, handler);
    }
    v16 = self->listener;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __34__NetworkQualityHTTPServer_start___block_invoke_20;
    v41[3] = &unk_26439D3B8;
    v41[4] = self;
    nw_listener_set_new_connection_handler(v16, v41);
    dispatch_group_enter(v13);
    v17 = self->listener;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __34__NetworkQualityHTTPServer_start___block_invoke_3;
    v39[3] = &unk_26439D390;
    v18 = v13;
    v40 = v18;
    nw_listener_set_state_changed_handler(v17, v39);
    nw_listener_set_queue((nw_listener_t)self->listener, (dispatch_queue_t)self->queue);
    nw_listener_start((nw_listener_t)self->listener);
    if (!self->launchdInvoked) {
      dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    }
    p_name = (id *)&self->name;
    name = self->name;
    self->name = (NSString *)@"localhost";

    netqual_log_init();
    v21 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_INFO))
    {
      v22 = self->name;
      BOOL bonjourEnabled = self->bonjourEnabled;
      *(_DWORD *)buf = 136315906;
      v45 = "-[NetworkQualityHTTPServer start:]";
      __int16 v46 = 1024;
      int v47 = 276;
      __int16 v48 = 2112;
      v49 = v22;
      __int16 v50 = 1024;
      BOOL v51 = bonjourEnabled;
      _os_log_impl(&dword_2192FE000, v21, OS_LOG_TYPE_INFO, "%s:%u - Default servername=%@ bonjourEnabled=%d", buf, 0x22u);
    }
    if (self->bonjourEnabled)
    {
      CFStringRef v24 = SCDynamicStoreCopyLocalHostName(0);
      if (v24)
      {
        CFStringRef v25 = v24;
        uint64_t v26 = [NSString stringWithString:v24];
        id v27 = *p_name;
        id *p_name = (id)v26;

        CFRelease(v25);
        if (([*p_name hasSuffix:@".local"] & 1) == 0)
        {
          uint64_t v28 = [*p_name stringByAppendingString:@".local"];
          id v29 = *p_name;
          id *p_name = (id)v28;
        }
        netqual_log_init();
        v30 = os_log_netqual;
        if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_INFO))
        {
          v31 = (NSString *)*p_name;
          *(_DWORD *)buf = 136315650;
          v45 = "-[NetworkQualityHTTPServer start:]";
          __int16 v46 = 1024;
          int v47 = 287;
          __int16 v48 = 2112;
          v49 = v31;
          _os_log_impl(&dword_2192FE000, v30, OS_LOG_TYPE_INFO, "%s:%u - New servername=%@", buf, 0x1Cu);
        }
      }
      else
      {
        netqual_log_init();
        if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
          -[NetworkQualityHTTPServer start:]();
        }
      }
    }
    unsigned int port = nw_listener_get_port((nw_listener_t)self->listener);
    if (self->launchdInvoked) {
      unsigned int v35 = 56666;
    }
    else {
      unsigned int v35 = port;
    }
    self->unsigned int port = v35;
    v36 = [(NetworkQualityHTTPServer *)self urlForType:@".well-known/nq" withAddress:self->name mirrorIP:0];
    netqual_log_init();
    v37 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v45 = "-[NetworkQualityHTTPServer start:]";
      __int16 v46 = 1024;
      int v47 = 300;
      __int16 v48 = 2112;
      v49 = v36;
      _os_log_impl(&dword_2192FE000, v37, OS_LOG_TYPE_INFO, "%s:%u - Available for server @ %@", buf, 0x1Cu);
    }
    v38 = [(NetworkQualityHTTPServer *)self urlForType:@".well-known/nq" withAddress:self->name mirrorIP:0];
    v4[2](v4, v38, 0);
  }
  else
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      -[NetworkQualityHTTPServer start:]();
    }
    v32 = (void *)MEMORY[0x263F087E8];
    uint64_t v52 = *MEMORY[0x263F08320];
    v53[0] = @"Could not create listener for server";
    v18 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
    v33 = [v32 errorWithDomain:@"NetworkQualityErrorDomain" code:1007 userInfo:v18];
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v33);
  }
}

void __34__NetworkQualityHTTPServer_start___block_invoke(uint64_t a1, nw_endpoint_t endpoint, int a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = [NSString stringWithUTF8String:nw_endpoint_get_bonjour_service_name(endpoint)];
  netqual_log_init();
  v6 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_INFO))
  {
    v10 = "-[NetworkQualityHTTPServer start:]_block_invoke";
    uint64_t v7 = "removed";
    __int16 v11 = 1024;
    int v12 = 237;
    int v9 = 136316674;
    __int16 v13 = 2080;
    if (a3) {
      uint64_t v7 = "added";
    }
    v14 = v7;
    __int16 v15 = 2112;
    v16 = v5;
    __int16 v17 = 2112;
    v18 = v5;
    __int16 v19 = 2080;
    objc_super v20 = "_nq._tcp";
    __int16 v21 = 2080;
    v22 = "local";
    _os_log_impl(&dword_2192FE000, v6, OS_LOG_TYPE_INFO, "%s:%u - Listener %s on %@ (%@.%s.%s)\n", (uint8_t *)&v9, 0x44u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v8 + 20))
  {
    *(unsigned char *)(v8 + 20) = 1;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __34__NetworkQualityHTTPServer_start___block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __34__NetworkQualityHTTPServer_start___block_invoke_2;
  handler[3] = &unk_26439D390;
  id v6 = v3;
  id v4 = v3;
  nw_connection_set_state_changed_handler(v4, handler);
  nw_connection_set_queue(v4, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 80));
  [*(id *)(a1 + 32) receiveLoop:v4];
  nw_connection_start(v4);
}

void __34__NetworkQualityHTTPServer_start___block_invoke_2(uint64_t a1, int a2)
{
  if (a2 == 4) {
    nw_connection_cancel(*(nw_connection_t *)(a1 + 32));
  }
}

void __34__NetworkQualityHTTPServer_start___block_invoke_3(uint64_t a1, int a2)
{
  if (a2 == 2) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

- (void)stop
{
  nw_listener_cancel((nw_listener_t)self->listener);
  listener = self->listener;
  self->listener = 0;
}

- (void)mirrorIP:(BOOL)a3
{
  self->mirrorIP = a3;
}

- (void)receiveLoop:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__NetworkQualityHTTPServer_receiveLoop___block_invoke;
  v6[3] = &unk_26439D458;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  nw_connection_receive(v5, 0, 0xFFFFFFFF, v6);
}

void __40__NetworkQualityHTTPServer_receiveLoop___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  int v9 = a2;
  v10 = a3;
  id v11 = a5;
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_2;
  v47[3] = &unk_26439D3E0;
  char v51 = a4;
  id v12 = v11;
  v14 = (nw_connection_t *)(a1 + 40);
  __int16 v13 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v48 = v12;
  uint64_t v49 = v15;
  id v50 = v13;
  v16 = (void (**)(void))MEMORY[0x21D4880C0](v47);
  if (!v12)
  {
    __int16 v17 = nw_protocol_copy_http_definition();
    nw_protocol_metadata_t v18 = nw_content_context_copy_protocol_metadata(v10, v17);

    nw_protocol_metadata_t v32 = v18;
    if (!v18)
    {
      netqual_log_init();
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
        __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_1();
      }
      nw_connection_cancel(*v14);
      goto LABEL_41;
    }
    uint64_t v19 = nw_http_metadata_copy_request();
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__1;
    v45 = __Block_byref_object_dispose__1;
    id v46 = 0;
    uint64_t v36 = MEMORY[0x263EF8330];
    uint64_t v37 = 3221225472;
    v38 = __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_33;
    v39 = &unk_26439D408;
    v40 = &v41;
    v30 = (void *)v19;
    nw_http_request_access_path();
    if (!v42[5])
    {
      netqual_log_init();
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
        __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_2();
      }
      goto LABEL_40;
    }
    well_known = (void *)nw_http_response_create_well_known();
    objc_super v20 = (void *)v42[5];
    if (!v20)
    {
      if (!v9) {
        goto LABEL_34;
      }
      goto LABEL_24;
    }
    if ([v20 isEqualToString:@"/small"])
    {
      nw_http_fields_append();
      __int16 v21 = *(id *)(*(void *)(a1 + 32) + 40);
    }
    else
    {
      if ([(id)v42[5] isEqualToString:@"/large"])
      {
        nw_http_fields_append();
        [NSString stringWithFormat:@"%zu", 0x300000000, v30];
        id v22 = objc_claimAutoreleasedReturnValue();
        [v22 UTF8String];
        nw_http_fields_append();
        char v23 = 1;
        goto LABEL_26;
      }
      if (([(id)v42[5] isEqualToString:@"/"] & 1) == 0
        && ([(id)v42[5] isEqualToString:@"/config"] & 1) == 0
        && ![(id)v42[5] isEqualToString:@"/.well-known/nq"])
      {
        if (![(id)v42[5] isEqualToString:@"/slurp"])
        {
          netqual_log_init();
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
            __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_3();
          }
          if (!v9) {
            goto LABEL_34;
          }
          goto LABEL_24;
        }
        if (v9) {
          dispatch_data_get_size(v9);
        }
        CFStringRef v24 = *(id *)(*(void *)(a1 + 32) + 40);

        nw_http_fields_append();
        goto LABEL_23;
      }
      nw_http_fields_append();
      __int16 v21 = [*(id *)(a1 + 32) configForConnection:*(void *)(a1 + 40) mirrorIP:*(unsigned __int8 *)(*(void *)(a1 + 32) + 24)];
    }
    CFStringRef v24 = v21;

LABEL_23:
    int v9 = v24;
    if (!v24) {
      goto LABEL_34;
    }
LABEL_24:
    size_t size = dispatch_data_get_size(v9);
    if (size)
    {
      [NSString stringWithFormat:@"%zu", size, v30];
      id v22 = objc_claimAutoreleasedReturnValue();
      [v22 UTF8String];
      nw_http_fields_append();
      char v23 = 0;
LABEL_26:

      if (!a4)
      {
LABEL_27:
        v16[2](v16);
LABEL_39:

LABEL_40:
        _Block_object_dispose(&v41, 8);

LABEL_41:
        goto LABEL_42;
      }
LABEL_35:
      nw_http_response_set_status_code();
      uint64_t v26 = nw_content_context_create("response");
      metadata_for_response = nw_http_create_metadata_for_response();
      nw_content_context_set_metadata_for_protocol(v26, metadata_for_response);

      if (v23)
      {
        uint64_t v28 = objc_alloc_init(BodyWriter);
        [(BodyWriter *)v28 setConnection:*v14];
        [(BodyWriter *)v28 setPostData:*(void *)(*(void *)(a1 + 32) + 48)];
        [(BodyWriter *)v28 setBytesLeftToPost:0x300000000];
        [(BodyWriter *)v28 sendBodyDataWithContext:v26];
      }
      else
      {
        id v29 = *v14;
        completion[0] = MEMORY[0x263EF8330];
        completion[1] = 3221225472;
        completion[2] = __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_62;
        completion[3] = &unk_26439D430;
        v34 = well_known;
        unsigned int v35 = *v14;
        nw_connection_send(v29, v9, v26, 1, completion);

        uint64_t v28 = v34;
      }

      goto LABEL_39;
    }
LABEL_34:
    char v23 = 0;
    if (!a4) {
      goto LABEL_27;
    }
    goto LABEL_35;
  }
  netqual_log_init();
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
    __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_4();
  }
LABEL_42:
}

uint64_t __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 56) && !*(void *)(result + 32)) {
    return [*(id *)(result + 40) receiveLoop:*(void *)(result + 48)];
  }
  return result;
}

uint64_t __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_33(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [NSString stringWithUTF8String:a2];

  return MEMORY[0x270F9A758]();
}

void __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_62(uint64_t a1)
{
  if (nw_http_response_get_status_code() >= 0x190)
  {
    id v2 = *(NSObject **)(a1 + 40);
    nw_connection_cancel(v2);
  }
}

- (id)urlFormatAddress:(id)a3
{
  id v3 = a3;
  address = nw_endpoint_get_address(v3);
  id v5 = nw_endpoint_copy_address_string(v3);
  unsigned int port = nw_endpoint_get_port(v3);

  int sa_family = address->sa_family;
  if (sa_family == 30)
  {
    int v9 = [NSString stringWithFormat:@"%s", v5];
    if (([v9 isEqualToString:@"::1"] & 1) == 0)
    {
      id v10 = objc_alloc_init(MEMORY[0x263F089C0]);
      [v10 addCharactersInString:@"abcdefghijklmnopqrstuvwxyz0123456789:"];
      uint64_t v11 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v10];

      int v9 = (void *)v11;
    }
    uint64_t v8 = [NSString stringWithFormat:@"[%@]:%d", v9, port];
  }
  else if (sa_family == 2)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%s:%d", v5, port];
  }
  else
  {
    uint64_t v8 = 0;
  }
  free(v5);

  return v8;
}

- (id)configForConnection:(id)a3 mirrorIP:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = nw_connection_copy_parameters((nw_connection_t)a3);
  id v7 = v6;
  if (v6)
  {
    nw_endpoint_t v8 = nw_parameters_copy_local_endpoint(v6);
    if (v8)
    {
      int v9 = [(NetworkQualityHTTPServer *)self urlFormatAddress:v8];
    }
    else
    {
      int v9 = 0;
    }
  }
  else
  {
    int v9 = 0;
  }
  netqual_log_init();
  id v10 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v29 = "-[NetworkQualityHTTPServer configForConnection:mirrorIP:]";
    __int16 v30 = 1024;
    int v31 = 487;
    __int16 v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_2192FE000, v10, OS_LOG_TYPE_INFO, "%s:%u - testEndPoint: %@", buf, 0x1Cu);
  }
  id v11 = objc_alloc(MEMORY[0x263EFF9A0]);
  v26[1] = @"urls";
  v27[0] = &unk_26CAB1DE0;
  v26[0] = @"version";
  v24[0] = @"small_download_url";
  id v12 = [(NetworkQualityHTTPServer *)self urlForType:@"small" withAddress:v9 mirrorIP:v4];
  v25[0] = v12;
  v24[1] = @"large_download_url";
  __int16 v13 = [(NetworkQualityHTTPServer *)self urlForType:@"large" withAddress:v9 mirrorIP:v4];
  v25[1] = v13;
  v24[2] = @"upload_url";
  v14 = [(NetworkQualityHTTPServer *)self urlForType:@"slurp" withAddress:v9 mirrorIP:v4];
  v25[2] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
  v27[1] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  __int16 v17 = (void *)[v11 initWithDictionary:v16];

  id v23 = 0;
  nw_protocol_metadata_t v18 = [MEMORY[0x263F08900] dataWithJSONObject:v17 options:11 error:&v23];
  id v19 = v23;
  if (v19)
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      -[NetworkQualityHTTPServer configForConnection:mirrorIP:]();
    }
    dispatch_data_t v20 = 0;
  }
  else
  {
    id v21 = v18;
    dispatch_data_t v20 = dispatch_data_create((const void *)[v21 bytes], [v21 length], 0, 0);
  }

  return v20;
}

- (id)urlForType:(id)a3 withAddress:(id)a4 mirrorIP:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  int v9 = (NSString *)a4;
  name = v9;
  if (!v5) {
    name = self->name;
  }
  id v11 = name;
  if (self->tlsEnabled) {
    id v12 = @"https";
  }
  else {
    id v12 = @"http";
  }
  __int16 v13 = v12;
  int v14 = [v8 isEqualToString:@"config"];
  if (v5)
  {
    if (v14) {
      [NSString stringWithFormat:@"%@://%@", v13, v11, v17, v18];
    }
    else {
      [NSString stringWithFormat:@"%@://%@/%@", v13, v11, v8, v18];
    }
  }
  else if (v14)
  {
    [NSString stringWithFormat:@"%@://%@:%d", v13, v11, self->port, v18];
  }
  else
  {
    [NSString stringWithFormat:@"%@://%@:%d/%@", v13, v11, self->port, v8];
  uint64_t v15 = };

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->listener, 0);
  objc_storeStrong((id *)&self->sec_identity, 0);
  objc_storeStrong((id *)&self->config_response_data, 0);
  objc_storeStrong((id *)&self->large_response_data, 0);
  objc_storeStrong((id *)&self->small_response_data, 0);

  objc_storeStrong((id *)&self->name, 0);
}

- (void)initWithPort:tlsEnabled:httpVersion:bonjourEnabled:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *(_DWORD *)id v3 = 136315650;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v3[7] = 99;
  v3[9] = v0;
  int v4 = v1;
  _os_log_error_impl(&dword_2192FE000, v2, OS_LOG_TYPE_ERROR, "%s:%u - Failed to create self signed identity: %d", (uint8_t *)v3, 0x18u);
}

- (void)start:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)((char *)&v1[3] + 2) = 216;
  _os_log_error_impl(&dword_2192FE000, v0, OS_LOG_TYPE_ERROR, "%s:%u - NULL listener", (uint8_t *)v1, 0x12u);
}

- (void)start:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - Could not lookup local host name, serving with %@", v2, v3, v4, v5, 2u);
}

void __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - Received non-HTTP message, cancelling %@", v2, v3, v4, v5, 2u);
}

void __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)((char *)&v1[3] + 2) = 355;
  _os_log_error_impl(&dword_2192FE000, v0, OS_LOG_TYPE_ERROR, "%s:%u - No path for request", (uint8_t *)v1, 0x12u);
}

void __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - unhandled path: %@", v2, v3, v4, v5, 2u);
}

void __40__NetworkQualityHTTPServer_receiveLoop___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - saw error %@", v2, v3, v4, v5, 2u);
}

- (void)configForConnection:mirrorIP:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315906;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_2192FE000, v2, OS_LOG_TYPE_ERROR, "%s:%u - Error serializing data (%@): %@", (uint8_t *)v3, 0x26u);
}

@end