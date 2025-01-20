@interface MKListener
- (BOOL)useQUIC;
- (BOOL)useTLS;
- (MKCertificate)certificate;
- (MKCertificate)clientCertificate;
- (MKListenerDelegate)delegate;
- (NSData)clientCertificateHash;
- (NSString)host;
- (NSString)service;
- (unint64_t)numberOfThreads;
- (unint64_t)port;
- (void)cancel;
- (void)connection:(id)a3 DidChangeState:(int)a4 error:(id)a5 queue:(id)a6;
- (void)connection:(id)a3 didReceiveContent:(id)a4 context:(id)a5 completed:(BOOL)a6 queue:(id)a7 error:(id)a8;
- (void)didReceiveSecureOptions:(id)a3;
- (void)didReceiveTrust:(id)a3 complete:(id)a4;
- (void)listen;
- (void)listenerDidReceiveConnection:(id)a3;
- (void)listenerDidReceiveState:(int)a3 error:(id)a4;
- (void)read:(id)a3 queue:(id)a4;
- (void)readData:(id)a3;
- (void)sendData:(id)a3 throughConnection:(id)a4 close:(BOOL)a5;
- (void)setCertificate:(id)a3;
- (void)setClientCertificate:(id)a3;
- (void)setClientCertificateHash:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHost:(id)a3;
- (void)setNumberOfThreads:(unint64_t)a3;
- (void)setPort:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setUseQUIC:(BOOL)a3;
- (void)setUseTLS:(BOOL)a3;
@end

@implementation MKListener

- (void)listen
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = +[MKLog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v44 = self;
    _os_log_impl(&dword_22BFAC000, v3, OS_LOG_TYPE_INFO, "%@ will listen.", buf, 0xCu);
  }

  host = (__CFString *)self->_host;
  if (!host) {
    host = @"::";
  }
  v5 = host;
  if (self->_port)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_port);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = @"0";
  }
  if (self->_numberOfThreads) {
    int64_t numberOfThreads = self->_numberOfThreads;
  }
  else {
    int64_t numberOfThreads = 5;
  }
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  connections = self->_connections;
  self->_connections = v8;

  v10 = (OS_dispatch_queue *)dispatch_queue_create("mk_listener_nw_listener_queue", MEMORY[0x263EF83A8]);
  listenerQueue = self->_listenerQueue;
  self->_listenerQueue = v10;

  v12 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:numberOfThreads];
  connectionQueuePool = self->_connectionQueuePool;
  self->_connectionQueuePool = v12;

  self->_lastUsedThreadIndex = -1;
  if (numberOfThreads >= 1)
  {
    uint64_t v14 = 0;
    v15 = MEMORY[0x263EF83A8];
    do
    {
      objc_msgSend(NSString, "stringWithFormat:", @"mk_listener_connection_queue_%lu", v14);
      id v16 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], v15);
      [(NSMutableArray *)self->_connectionQueuePool addObject:v17];

      ++v14;
    }
    while (numberOfThreads != v14);
  }
  objc_initWeak((id *)buf, self);
  if (!self->_useTLS)
  {
    configure_tcp[0] = MEMORY[0x263EF8330];
    configure_tcp[1] = 3221225472;
    configure_tcp[2] = __20__MKListener_listen__block_invoke;
    configure_tcp[3] = &unk_2649061E0;
    v19 = &v42;
    objc_copyWeak(&v42, (id *)buf);
    nw_parameters_t secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14478], configure_tcp);
    goto LABEL_20;
  }
  if (!self->_certificate)
  {
    v18 = objc_alloc_init(MKCertificate);
    [(MKListener *)self setCertificate:v18];
  }
  if (self->_useQUIC)
  {
    configure_quic[0] = MEMORY[0x263EF8330];
    configure_quic[1] = 3221225472;
    configure_quic[2] = __20__MKListener_listen__block_invoke_2;
    configure_quic[3] = &unk_2649061E0;
    v19 = &v40;
    objc_copyWeak(&v40, (id *)buf);
    nw_parameters_t secure_tcp = nw_parameters_create_quic(configure_quic);
LABEL_20:
    v21 = secure_tcp;
    goto LABEL_22;
  }
  configure_tls[0] = MEMORY[0x263EF8330];
  configure_tls[1] = 3221225472;
  configure_tls[2] = __20__MKListener_listen__block_invoke_3;
  configure_tls[3] = &unk_2649061E0;
  v19 = &v38;
  objc_copyWeak(&v38, (id *)buf);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __20__MKListener_listen__block_invoke_4;
  v35[3] = &unk_2649061E0;
  objc_copyWeak(&v36, (id *)buf);
  v21 = nw_parameters_create_secure_tcp(configure_tls, v35);
  objc_destroyWeak(&v36);
LABEL_22:
  objc_destroyWeak(v19);
  v22 = v5;
  v23 = (const char *)[(__CFString *)v22 UTF8String];
  v24 = v6;
  v25 = nw_endpoint_create_host(v23, (const char *)[(__CFString *)v24 UTF8String]);
  nw_parameters_set_reuse_local_address(v21, 1);
  nw_parameters_set_local_endpoint(v21, v25);
  v26 = (OS_nw_listener *)nw_listener_create(v21);
  listener = self->_listener;
  self->_listener = v26;

  nw_listener_set_queue((nw_listener_t)self->_listener, (dispatch_queue_t)self->_listenerQueue);
  v28 = self->_listener;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __20__MKListener_listen__block_invoke_5;
  handler[3] = &unk_264906208;
  objc_copyWeak(&v34, (id *)buf);
  nw_listener_set_state_changed_handler(v28, handler);
  v29 = self->_listener;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __20__MKListener_listen__block_invoke_6;
  v31[3] = &unk_264906230;
  objc_copyWeak(&v32, (id *)buf);
  nw_listener_set_new_connection_handler(v29, v31);
  if ([(NSString *)self->_service length])
  {
    bonjour_service = nw_advertise_descriptor_create_bonjour_service([(NSString *)self->_service UTF8String], "_http._tcp.", 0);
    nw_listener_set_advertise_descriptor((nw_listener_t)self->_listener, bonjour_service);
  }
  nw_listener_start((nw_listener_t)self->_listener);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);

  objc_destroyWeak((id *)buf);
}

void __20__MKListener_listen__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didReceiveTCPOptions:v3];
}

void __20__MKListener_listen__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didReceiveSecureOptions:v3];
}

void __20__MKListener_listen__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didReceiveSecureOptions:v3];
}

void __20__MKListener_listen__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didReceiveTCPOptions:v3];
}

void __20__MKListener_listen__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained listenerDidReceiveState:a2 error:v5];
}

void __20__MKListener_listen__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained listenerDidReceiveConnection:v3];
}

- (void)cancel
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = +[MKLog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    dispatch_queue_t v17 = self;
    _os_log_impl(&dword_22BFAC000, v3, OS_LOG_TYPE_INFO, "%@ will cancel.", buf, 0xCu);
  }

  v4 = self;
  objc_sync_enter(v4);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(NSMutableDictionary *)v4->_connections allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        nw_connection_cancel(*(nw_connection_t *)(*((void *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)v4->_connections removeAllObjects];
  objc_sync_exit(v4);

  listener = v4->_listener;
  if (listener)
  {
    nw_listener_cancel(listener);
    v10 = v4->_listener;
    v4->_listener = 0;
  }
}

- (void)didReceiveSecureOptions:(id)a3
{
  v4 = a3;
  id v5 = v4;
  if (self->_useQUIC)
  {
    uint64_t v6 = nw_quic_copy_sec_protocol_options(v4);
    nw_quic_add_tls_application_protocol(v5, "http/1.1");
  }
  else
  {
    uint64_t v6 = v4;
    if ([&unk_26DF7B1D8 count])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [&unk_26DF7B1D8 objectAtIndexedSubscript:v7];
        tls_ciphersuite_t v9 = (unsigned __int16)[v8 integerValue];

        sec_protocol_options_append_tls_ciphersuite(v6, v9);
        ++v7;
      }
      while (v7 < [&unk_26DF7B1D8 count]);
    }
    sec_protocol_options_set_min_tls_protocol_version(v6, tls_protocol_version_TLSv12);
    sec_protocol_options_set_max_tls_protocol_version(v6, tls_protocol_version_TLSv13);
  }
  v10 = sec_identity_create([(MKCertificate *)self->_certificate identity]);
  sec_protocol_options_set_local_identity(v6, v10);
  long long v11 = [(MKCertificate *)self->_clientCertificate digest];
  [(MKListener *)self setClientCertificateHash:v11];

  sec_protocol_options_set_peer_authentication_required(v6, self->_clientCertificate != 0);
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __38__MKListener_didReceiveSecureOptions___block_invoke;
  v12[3] = &unk_264906258;
  objc_copyWeak(&v13, &location);
  sec_protocol_options_set_verify_block(v6, v12, (dispatch_queue_t)self->_listenerQueue);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __38__MKListener_didReceiveSecureOptions___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = (void *)MEMORY[0x230F5C060]();
  [WeakRetained didReceiveTrust:v7 complete:v8];
}

- (void)didReceiveTrust:(id)a3 complete:(id)a4
{
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  SecTrustRef v7 = sec_trust_copy_ref((sec_trust_t)a3);
  v10 = [[MKCertificate alloc] initWithTrust:v7];
  id v8 = [(MKCertificate *)v10 digest];
  uint64_t v9 = [v8 isEqualToData:self->_clientCertificateHash];
  CFRelease(v7);
  v6[2](v6, v9);
}

- (void)listenerDidReceiveState:(int)a3 error:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  SecTrustRef v7 = +[MKLog log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412802;
    id v11 = self;
    __int16 v12 = 1024;
    int v13 = a3;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_22BFAC000, v7, OS_LOG_TYPE_INFO, "%@ did receive a state. state=%d, error=%@", (uint8_t *)&v10, 0x1Cu);
  }

  if (a3 == 4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained listenerDidCancel:self];
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    uint64_t port = nw_listener_get_port((nw_listener_t)self->_listener);
    [(MKListener *)self setPort:port];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained listener:self didOpen:port];
LABEL_7:
  }
}

- (void)listenerDidReceiveConnection:(id)a3
{
  id v4 = a3;
  connectionQueuePool = self->_connectionQueuePool;
  unint64_t v6 = self->_lastUsedThreadIndex + 1;
  self->_int64_t lastUsedThreadIndex = v6;
  if (v6 >= [(NSMutableArray *)connectionQueuePool count])
  {
    int64_t lastUsedThreadIndex = 0;
    self->_int64_t lastUsedThreadIndex = 0;
  }
  else
  {
    int64_t lastUsedThreadIndex = self->_lastUsedThreadIndex;
  }
  id v8 = [(NSMutableArray *)self->_connectionQueuePool objectAtIndex:lastUsedThreadIndex];
  uint64_t v9 = self;
  objc_sync_enter(v9);
  int v10 = [MEMORY[0x263F08D40] valueWithPointer:v4];
  [(NSMutableDictionary *)v9->_connections setObject:v4 forKey:v10];

  objc_sync_exit(v9);
  objc_initWeak(&location, v9);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__MKListener_listenerDidReceiveConnection___block_invoke;
  v13[3] = &unk_264906280;
  objc_copyWeak(&v16, &location);
  id v11 = v4;
  __int16 v14 = v11;
  __int16 v12 = v8;
  id v15 = v12;
  nw_connection_set_state_changed_handler(v11, v13);
  nw_connection_set_queue(v11, v12);
  nw_connection_start(v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __43__MKListener_listenerDidReceiveConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id *)(a1 + 48);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained connection:*(void *)(a1 + 32) DidChangeState:a2 error:v6 queue:*(void *)(a1 + 40)];
}

- (void)connection:(id)a3 DidChangeState:(int)a4 error:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    int v13 = +[MKLog log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MKListener connection:DidChangeState:error:queue:]((uint64_t)v11, v13);
    }
  }
  else if (a4 == 5 || a4 == 4)
  {
    __int16 v14 = self;
    objc_sync_enter(v14);
    id v15 = [MEMORY[0x263F08D40] valueWithPointer:v10];
    [(NSMutableDictionary *)v14->_connections removeObjectForKey:v15];

    objc_sync_exit(v14);
  }
  else if (a4 == 3)
  {
    [(MKListener *)self read:v10 queue:v12];
  }
}

- (void)read:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230F5C060]();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  objc_initWeak(&location, self);
  completion[0] = MEMORY[0x263EF8330];
  completion[1] = 3221225472;
  completion[2] = __25__MKListener_read_queue___block_invoke;
  completion[3] = &unk_2649062A8;
  __int16 v14 = v17;
  objc_copyWeak(&v15, &location);
  uint64_t v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  nw_connection_receive(v9, 1u, 0xFFFFFFFF, completion);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(v17, 8);
}

void __25__MKListener_read_queue___block_invoke(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  uint64_t v9 = (id *)(a1 + 7);
  id v10 = a5;
  id v11 = a3;
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained(v9);
  [WeakRetained connection:a1[4] didReceiveContent:v12 context:v11 completed:a4 queue:a1[5] error:v10];
}

- (void)connection:(id)a3 didReceiveContent:(id)a4 context:(id)a5 completed:(BOOL)a6 queue:(id)a7 error:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  if (v17)
  {
    char v18 = +[MKLog log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MKListener connection:didReceiveContent:context:completed:queue:error:]((uint64_t)v17, v18);
    }

    nw_connection_cancel(v13);
  }
  else if (v14)
  {
    v19 = nw_connection_copy_endpoint(v13);
    hostname = (char *)nw_endpoint_get_hostname(v19);
    if (hostname) {
      hostname = (char *)[[NSString alloc] initWithUTF8String:hostname];
    }
    v21 = [[MKConnection alloc] initWithConnection:v13 queue:v16 hostname:hostname];
    v22 = (void *)MEMORY[0x230F5C060]();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained connection:v21 didReceiveData:v14];
  }
  else
  {
    v24 = +[MKLog log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_22BFAC000, v24, OS_LOG_TYPE_INFO, "MKListener will ignore a new connection that has empty content.", v25, 2u);
    }
  }
}

- (void)readData:(id)a3
{
  id v4 = a3;
  id v6 = [v4 connection];
  id v5 = [v4 queue];

  [(MKListener *)self read:v6 queue:v5];
}

- (void)sendData:(id)a3 throughConnection:(id)a4 close:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x230F5C060]();
  id v11 = [v9 connection];
  id v12 = [v9 queue];
  id v13 = v8;
  id v14 = dispatch_data_create((const void *)[v13 bytes], objc_msgSend(v13, "length"), v12, 0);
  id v15 = (id *)MEMORY[0x263F14450];
  if (!v5) {
    id v15 = (id *)MEMORY[0x263F14440];
  }
  id v16 = *v15;
  objc_initWeak(&location, self);
  completion[0] = MEMORY[0x263EF8330];
  completion[1] = 3221225472;
  completion[2] = __47__MKListener_sendData_throughConnection_close___block_invoke;
  completion[3] = &unk_2649062D0;
  objc_copyWeak(&v22, &location);
  BOOL v23 = v5;
  id v17 = v11;
  v20 = v17;
  id v18 = v9;
  id v21 = v18;
  nw_connection_send(v17, v14, v16, 1, completion);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __47__MKListener_sendData_throughConnection_close___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (*(unsigned char *)(a1 + 56)) {
    nw_connection_cancel(*(nw_connection_t *)(a1 + 32));
  }
  else {
    [WeakRetained readData:*(void *)(a1 + 40)];
  }
}

- (MKListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MKListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useTLS
{
  return self->_useTLS;
}

- (void)setUseTLS:(BOOL)a3
{
  self->_useTLS = a3;
}

- (BOOL)useQUIC
{
  return self->_useQUIC;
}

- (void)setUseQUIC:(BOOL)a3
{
  self->_useQUIC = a3;
}

- (unint64_t)port
{
  return self->_port;
}

- (void)setPort:(unint64_t)a3
{
  self->_uint64_t port = a3;
}

- (unint64_t)numberOfThreads
{
  return self->_numberOfThreads;
}

- (void)setNumberOfThreads:(unint64_t)a3
{
  self->_int64_t numberOfThreads = a3;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (MKCertificate)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
}

- (MKCertificate)clientCertificate
{
  return self->_clientCertificate;
}

- (void)setClientCertificate:(id)a3
{
}

- (NSData)clientCertificateHash
{
  return self->_clientCertificateHash;
}

- (void)setClientCertificateHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCertificateHash, 0);
  objc_storeStrong((id *)&self->_clientCertificate, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueuePool, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)connection:(uint64_t)a1 DidChangeState:(NSObject *)a2 error:queue:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "did had a connection error. error=%@", (uint8_t *)&v2, 0xCu);
}

- (void)connection:(uint64_t)a1 didReceiveContent:(NSObject *)a2 context:completed:queue:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "MKListener could not continue to receive a connection because an underlying issue occurred unexpectedly. error=%@", (uint8_t *)&v2, 0xCu);
}

@end