@interface SiriNWConnection
- (BOOL)hasActiveConnection;
- (SiriNWConnection)initWithQueueAndCompletion:(id)a3 reason:(id)a4 callback:(id)a5;
- (id)_getAttemptedEndpoints;
- (id)_queue;
- (id)_setParametersForHost:(const char *)a3 useTLS:(BOOL)a4 initialPayload:(id)a5;
- (id)resolvedHost;
- (void)_cancelOpenTimer;
- (void)_closeWithError:(id)a3;
- (void)_configureConnection:(id)a3;
- (void)_getNWConnectionWithInitialData:(id)a3 completion:(id)a4;
- (void)_invokeOpenCompletionWithError:(id)a3;
- (void)_setupOpenTimer;
- (void)close;
- (void)dealloc;
- (void)openConnectionForURL:(id)a3 withConnectionId:(id)a4 initialPayload:(id)a5 completion:(id)a6;
- (void)runSiriProbeWithDepth:(int64_t)a3 trafficClass:(unsigned int)a4;
@end

@implementation SiriNWConnection

- (SiriNWConnection)initWithQueueAndCompletion:(id)a3 reason:(id)a4 callback:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)&self->_queue, a3);
  id v11 = a5;
  objc_storeStrong((id *)&self->_reason, a4);
  v12 = (void *)MEMORY[0x1D94403E0](v11);

  id wfcompletion = self->_wfcompletion;
  self->_id wfcompletion = v12;

  id v14 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v14 setDateFormat:@"yyyy-MM-dd"];
  v15 = [v14 dateFromString:@"2025-12-30"];
  dateToDisable = self->_dateToDisable;
  self->_dateToDisable = v15;

  if ([v10 containsString:@"expireddate"])
  {
    v17 = [v14 dateFromString:@"2024-01-30"];
    v18 = self->_dateToDisable;
    self->_dateToDisable = v17;
  }
  return self;
}

- (void)dealloc
{
  [(SiriNWConnection *)self _closeWithError:0];
  v3.receiver = self;
  v3.super_class = (Class)SiriNWConnection;
  [(SiriNWConnection *)&v3 dealloc];
}

- (id)_queue
{
  return self->_queue;
}

- (void)runSiriProbeWithDepth:(int64_t)a3 trafficClass:(unsigned int)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  self->_network_traffic_class = a4;
  if (a3 == 2)
  {
    id v11 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://guzzoni.apple.com:443/ace"];
    url = self->_url;
    self->_url = v11;
    int64_t v10 = 10;
  }
  else if (a3 == 1)
  {
    v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://guzzoni.apple.com:443/"];
    url = self->_url;
    self->_url = v12;
    int64_t v10 = 9;
  }
  else
  {
    if (a3) {
      goto LABEL_10;
    }
    v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"http://guzzoni.apple.com:443/"];
    v7 = self->_url;
    self->_url = v6;

    if (![(NSString *)self->_reason containsString:@"badport"])
    {
      int64_t v10 = 8;
      goto LABEL_9;
    }
    v8 = [MEMORY[0x1E4F1CB10] URLWithString:@"http://guzzoni.apple.com:80/"];
    url = self->_url;
    self->_url = v8;
    int64_t v10 = 8;
  }

LABEL_9:
  self->_probeLabel = v10;
LABEL_10:
  v13 = [MEMORY[0x1E4F1C9C8] now];
  [v13 timeIntervalSinceDate:self->_dateToDisable];
  if (v14 <= 0.0)
  {
    NSLog(&cfstr_SProbingOkToRu.isa, "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]", self->_dateToDisable, v13);
    NSLog(&cfstr_SStartingNwcon.isa, "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]", self->_network_traffic_class, a3);
    v22 = self->_url;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __55__SiriNWConnection_runSiriProbeWithDepth_trafficClass___block_invoke;
    v23[3] = &unk_1E69BD5D8;
    v23[4] = self;
    [(SiriNWConnection *)self openConnectionForURL:v22 withConnectionId:0 initialPayload:0 completion:v23];
  }
  else
  {
    NSLog(&cfstr_SProbingHasBee.isa, "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]", self->_dateToDisable, v13);
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v16 = [MEMORY[0x1E4F28B50] mainBundle];
    v17 = [v16 localizedStringForKey:@"Past Siri Probe Functional Date" value:&stru_1F2B5AC50 table:0];
    v25[0] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v19 = [v15 errorWithDomain:@"com.apple.wifi.policy" code:1 userInfo:v18];

    if (self->_wfcompletion)
    {
      v20 = (void (**)(void, void, void))MEMORY[0x1D94403E0]();
      id wfcompletion = self->_wfcompletion;
      self->_id wfcompletion = 0;

      ((void (**)(void, void, void *))v20)[2](v20, 0, v19);
    }
  }
}

void __55__SiriNWConnection_runSiriProbeWithDepth_trafficClass___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3) {
    NSLog(&cfstr_SOpenconnectio.isa, "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]_block_invoke", v3);
  }
  else {
    NSLog(&cfstr_SOpenconnectio_0.isa, "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]_block_invoke");
  }
  if (*(void *)(*(void *)(a1 + 32) + 72))
  {
    v4 = (void (**)(void, void, void))MEMORY[0x1D94403E0]();
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = 0;

    ((void (**)(void, BOOL, id))v4)[2](v4, v7 == 0, v7);
  }
  NSLog(&cfstr_SOpenconnectio_1.isa, "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]_block_invoke");
  [*(id *)(a1 + 32) _closeWithError:v7];
}

- (void)_invokeOpenCompletionWithError:(id)a3
{
  id openCompletion = self->_openCompletion;
  if (openCompletion)
  {
    id v5 = a3;
    id v7 = (void (**)(id, id))MEMORY[0x1D94403E0](openCompletion);
    id v6 = self->_openCompletion;
    self->_id openCompletion = 0;

    v7[2](v7, v5);
  }
}

- (void)_getNWConnectionWithInitialData:(id)a3 completion:(id)a4
{
  id v19 = a3;
  id v6 = (void (**)(id, nw_connection_t, void *))a4;
  id v7 = self->_resolvedHost;
  v8 = [(NSURL *)self->_url port];
  id v9 = [v8 stringValue];

  int64_t v10 = [(NSURL *)self->_url scheme];
  self->_usingTLS = [v10 caseInsensitiveCompare:@"https"] == 0;

  if (!v9)
  {
    NSLog(&cfstr_SFailedToFindP.isa, "-[SiriNWConnection _getNWConnectionWithInitialData:completion:]", self->_url);
    if (self->_usingTLS) {
      id v9 = @"443";
    }
    else {
      id v9 = @"80";
    }
  }
  id v11 = v7;
  v12 = [(NSString *)v11 UTF8String];
  v13 = v9;
  host = nw_endpoint_create_host(v12, (const char *)[(__CFString *)v13 UTF8String]);
  if (host
    || ([MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.wifi.policy.siri" code:22 userInfo:0], v18 = objc_claimAutoreleasedReturnValue(), NSLog(&cfstr_SFailedToCreat_4.isa, "-[SiriNWConnection _getNWConnectionWithInitialData:completion:]", v18), !v18))
  {
    v15 = [(SiriNWConnection *)self _setParametersForHost:v12 useTLS:self->_usingTLS initialPayload:v19];
    nw_connection_t v16 = nw_connection_create(host, v15);
    v17 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
    [v17 networkActivityAddNWConnection:v16 toActivityWithLabel:self->_probeLabel];

    if (v16)
    {
      v18 = 0;
    }
    else
    {
      v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.wifi.policy.siri" code:23 userInfo:0];
      NSLog(&cfstr_SFailedToCreat_5.isa, "-[SiriNWConnection _getNWConnectionWithInitialData:completion:]", v18);
    }
  }
  else
  {
    nw_connection_t v16 = 0;
  }
  v6[2](v6, v16, v18);
}

- (void)openConnectionForURL:(id)a3 withConnectionId:(id)a4 initialPayload:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  double v14 = [v13 host];
  v15 = (NSString *)[v14 copy];
  resolvedHost = self->_resolvedHost;
  self->_resolvedHost = v15;

  v17 = (NSURL *)[v13 copy];
  url = self->_url;
  self->_url = v17;

  id v19 = (NSString *)[v12 copy];
  connectionId = self->_connectionId;
  self->_connectionId = v19;

  self->_isEstablishing = 1;
  [(SiriNWConnection *)self _setupOpenTimer];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __84__SiriNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke;
  v25[3] = &unk_1E69BDB48;
  v25[4] = self;
  id v26 = v10;
  id v21 = v10;
  v22 = (void *)MEMORY[0x1D94403E0](v25);
  id openCompletion = self->_openCompletion;
  self->_id openCompletion = v22;

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __84__SiriNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke_2;
  v24[3] = &unk_1E69BDB70;
  v24[4] = self;
  [(SiriNWConnection *)self _getNWConnectionWithInitialData:v11 completion:v24];
}

void __84__SiriNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _cancelOpenTimer];
  *(unsigned char *)(*(void *)(a1 + 32) + 81) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 82) = v4 == 0;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__SiriNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v7)
  {
    [*(id *)(a1 + 32) _configureConnection:v7];
  }
  else
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.wifi.policy.siri" code:31 userInfo:0];
    }
    [*(id *)(a1 + 32) _closeWithError:v6];
  }
}

- (void)_configureConnection:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_connection, a3);
  objc_storeStrong((id *)&self->_content_context, (id)*MEMORY[0x1E4F38C68]);
  nw_connection_set_queue(v5, (dispatch_queue_t)self->_queue);
  id v6 = v5;
  MEMORY[0x1D943FF70]();
  nw_connection_set_read_close_handler();
  nw_connection_set_write_close_handler();
  nw_connection_start(v6);
}

void __41__SiriNWConnection__configureConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    CFErrorRef v7 = 0;
    goto LABEL_7;
  }
  CFErrorRef v7 = nw_error_copy_cf_error(v5);
  if (!v7)
  {
LABEL_7:
    int v9 = 1;
    goto LABEL_8;
  }
  uint64_t id = *(void *)(a1 + 32);
  if (id) {
    uint64_t id = nw_connection_get_id();
  }
  NSLog(&cfstr_SStateDErrorFo.isa, "-[SiriNWConnection _configureConnection:]_block_invoke", a2, v7, id);
  int v9 = 0;
LABEL_8:
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 168), v7);
  uint64_t v10 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v10 + 80) && *(void *)(a1 + 32) == *(void *)(v10 + 40))
  {
    switch((int)a2)
    {
      case 0:
        uint64_t v16 = nw_connection_get_id();
        NSLog(&cfstr_SStateNwConnec_2.isa, "-[SiriNWConnection _configureConnection:]_block_invoke", v16);
        break;
      case 1:
        uint64_t v17 = nw_connection_get_id();
        NSLog(&cfstr_SStateNwConnec.isa, "-[SiriNWConnection _configureConnection:]_block_invoke", v17);
        break;
      case 2:
        uint64_t v18 = nw_connection_get_id();
        NSLog(&cfstr_SStateNwConnec_0.isa, "-[SiriNWConnection _configureConnection:]_block_invoke", v18);
        break;
      case 3:
        uint64_t v11 = nw_connection_get_id();
        NSLog(&cfstr_SStateNwConnec_1.isa, "-[SiriNWConnection _configureConnection:]_block_invoke", v11);
        [*(id *)(a1 + 40) _invokeOpenCompletionWithError:0];
        break;
      case 4:
        uint64_t v19 = nw_connection_get_id();
        NSLog(&cfstr_SStateNwConnec_3.isa, "-[SiriNWConnection _configureConnection:]_block_invoke", v19);
        break;
      case 5:
        uint64_t v12 = nw_connection_get_id();
        NSLog(&cfstr_SStateNwConnec_4.isa, "-[SiriNWConnection _configureConnection:]_block_invoke", v12);
        id v13 = (void *)MEMORY[0x1E4F28C58];
        if (v9)
        {
          double v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.wifi.policy.siri" code:16 userInfo:0];
        }
        else
        {
          uint64_t v20 = *MEMORY[0x1E4F28A50];
          v21[0] = v7;
          v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
          double v14 = [v13 errorWithDomain:@"com.apple.wifi.policy.siri" code:16 userInfo:v15];
        }
        [*(id *)(a1 + 40) _closeWithError:v14];

        break;
      default:
        break;
    }
  }
  else
  {
    NSLog(&cfstr_SGotNwConnecti.isa, "-[SiriNWConnection _configureConnection:]_block_invoke", *(unsigned __int8 *)(v10 + 80));
  }
}

uint64_t __41__SiriNWConnection__configureConnection___block_invoke_2(uint64_t a1)
{
  NSLog(&cfstr_SReadClosed.isa, "-[SiriNWConnection _configureConnection:]_block_invoke_2");
  v2 = *(void **)(a1 + 32);

  return [v2 _closeWithError:0];
}

uint64_t __41__SiriNWConnection__configureConnection___block_invoke_3(uint64_t a1)
{
  NSLog(&cfstr_SWriteClosed.isa, "-[SiriNWConnection _configureConnection:]_block_invoke_3");
  v2 = *(void **)(a1 + 32);

  return [v2 _closeWithError:0];
}

- (void)_setupOpenTimer
{
  id v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  dispatch_time_t v4 = dispatch_time(0, 15000000000);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__SiriNWConnection__setupOpenTimer__block_invoke;
  v8[3] = &unk_1E69BC8B0;
  id v5 = v3;
  int v9 = v5;
  uint64_t v10 = self;
  dispatch_source_set_event_handler(v5, v8);
  dispatch_resume(v5);
  openTimer = self->_openTimer;
  self->_openTimer = (OS_dispatch_source *)v5;
  CFErrorRef v7 = v5;
}

void __35__SiriNWConnection__setupOpenTimer__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  NSLog(&cfstr_SOpenTimerFiri.isa, "-[SiriNWConnection _setupOpenTimer]_block_invoke");
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 == *(void **)(v3 + 120))
  {
    *(void *)(v3 + 120) = 0;
  }
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v5 = v4;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 168);
  if (v6)
  {
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    v10[0] = v6;
    CFErrorRef v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v8 = (void *)[v5 initWithDomain:@"com.apple.wifi.policy.siri" code:4 userInfo:v7];
  }
  else
  {
    v8 = (void *)[v4 initWithDomain:@"com.apple.wifi.policy.siri" code:4 userInfo:0];
  }
  [*(id *)(a1 + 40) _closeWithError:v8];
}

- (void)_cancelOpenTimer
{
  openTimer = self->_openTimer;
  if (openTimer)
  {
    dispatch_source_cancel(openTimer);
    id v4 = self->_openTimer;
    self->_openTimer = 0;
  }
}

- (BOOL)hasActiveConnection
{
  return self->_connection != 0;
}

- (void)_closeWithError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_isCanceled)
  {
    NSLog(&cfstr_SIsAlredyCance.isa, "-[SiriNWConnection _closeWithError:]");
  }
  else
  {
    if (v4) {
      NSLog(&cfstr_SClosingWithEr.isa, "-[SiriNWConnection _closeWithError:]", v4);
    }
    else {
      NSLog(&cfstr_SClosing.isa, "-[SiriNWConnection _closeWithError:]");
    }
    resolvedHost = self->_resolvedHost;
    self->_resolvedHost = 0;

    self->_isReady = 0;
    self->_isCanceled = 1;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __36__SiriNWConnection__closeWithError___block_invoke;
    v29[3] = &unk_1E69BC8B0;
    v29[4] = self;
    id v30 = v5;
    uint64_t v7 = MEMORY[0x1D94403E0](v29);
    v8 = (void *)v7;
    connection = self->_connection;
    if (connection)
    {
      uint64_t v10 = connection;
      uint64_t v11 = self->_connection;
      self->_connection = 0;

      uint64_t v12 = self->_content_context;
      content_context = self->_content_context;
      self->_content_context = 0;

      if (!self->_attemptedEndpoints)
      {
        double v14 = [(SiriNWConnection *)self _getAttemptedEndpoints];
        attemptedEndpoints = self->_attemptedEndpoints;
        self->_attemptedEndpoints = v14;
      }
      uint64_t v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      uint64_t v17 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
      int64_t probeLabel = self->_probeLabel;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __36__SiriNWConnection__closeWithError___block_invoke_2;
      v27[3] = &unk_1E69BC8D8;
      v28 = v16;
      uint64_t v19 = v16;
      [v17 networkActivityRemoveNWConnection:v10 fromActivityWithLabel:probeLabel completion:v27];

      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__SiriNWConnection__closeWithError___block_invoke_3;
      block[3] = &unk_1E69BD678;
      uint64_t v24 = v10;
      v25 = v12;
      id v26 = v8;
      id v21 = v12;
      v22 = v10;
      dispatch_group_notify(v19, queue, block);
    }
    else
    {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
    }
  }
}

void __36__SiriNWConnection__closeWithError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[14])
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.wifi.policy.siri" code:17 userInfo:0];
      v2 = *(void **)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 40);
    }
    id v6 = (id)v4;
    if (v3) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v4;
    }
    [v2 _invokeOpenCompletionWithError:v5];
  }
}

void __36__SiriNWConnection__closeWithError___block_invoke_2(uint64_t a1)
{
}

uint64_t __36__SiriNWConnection__closeWithError___block_invoke_3(uint64_t a1)
{
  nw_connection_send(*(nw_connection_t *)(a1 + 32), 0, *(nw_content_context_t *)(a1 + 40), 1, &__block_literal_global_6);
  nw_connection_set_read_close_handler();
  nw_connection_set_write_close_handler();
  nw_connection_cancel(*(nw_connection_t *)(a1 + 32));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __36__SiriNWConnection__closeWithError___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = a2;
  if (v2)
  {
    error = v2;
    int error_code = nw_error_get_error_code(v2);
    BOOL v4 = nw_error_get_error_domain(error) == nw_error_domain_posix;
    v2 = error;
    if (!v4 || error_code != 57)
    {
      NSLog(&cfstr_SCloseErrorIs.isa, "-[SiriNWConnection _closeWithError:]_block_invoke_4", error);
      v2 = error;
    }
  }
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__SiriNWConnection_close__block_invoke;
  block[3] = &unk_1E69BC8D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __25__SiriNWConnection_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeWithError:0];
}

- (id)resolvedHost
{
  return self->_resolvedHost;
}

- (id)_setParametersForHost:(const char *)a3 useTLS:(BOOL)a4 initialPayload:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x1D94403E0](*MEMORY[0x1E4F38C90]);
  if (v5)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__SiriNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke;
    v19[3] = &__block_descriptor_33_e42_v16__0__NSObject_OS_nw_protocol_options__8l;
    char v20 = 1;
    uint64_t v10 = MEMORY[0x1D94403E0](v19);

    uint64_t v9 = (void *)v10;
  }
  secure_tcp = nw_parameters_create_secure_tcp(v9, &__block_literal_global_218);
  if (v5)
  {
    size_t v12 = strlen(a3);
    xpc_object_t v13 = xpc_data_create(a3, v12);
    nw_parameters_set_tls_session_id();
  }
  double v14 = (void *)nw_context_create();
  nw_context_set_scheduling_mode();
  nw_context_set_isolate_protocol_stack();
  nw_context_set_privacy_level();
  nw_context_set_isolate_protocol_cache();
  nw_parameters_set_context();
  nw_parameters_set_data_mode();
  NSLog(&cfstr_SNetworkTraffi.isa, "-[SiriNWConnection _setParametersForHost:useTLS:initialPayload:]", self->_network_traffic_class);
  nw_parameters_set_traffic_class();
  nw_parameters_set_indefinite();
  nw_parameters_set_tfo();
  if (v8) {
    nw_parameters_set_initial_data_payload();
  }
  NSLog(&cfstr_SOptimisticdns.isa, "-[SiriNWConnection _setParametersForHost:useTLS:initialPayload:]");
  nw_parameters_set_expired_dns_behavior(secure_tcp, nw_parameters_expired_dns_behavior_allow);
  *(_OWORD *)task_info_out = 0u;
  long long v18 = 0u;
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(*MEMORY[0x1E4F14960], 0xFu, task_info_out, &task_info_outCnt)) {
    NSLog(&cfstr_SFailedToGetTa.isa, "-[SiriNWConnection _setParametersForHost:useTLS:initialPayload:]");
  }
  else {
    nw_parameters_set_source_application();
  }

  return secure_tcp;
}

void __64__SiriNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke(uint64_t a1, id a2)
{
  uint64_t v3 = a2;
  sec_protocol_options_set_tls_tickets_enabled(v3, *(unsigned char *)(a1 + 32));
}

void __64__SiriNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke_2(int a1, nw_protocol_options_t options)
{
}

- (id)_getAttemptedEndpoints
{
  attemptedEndpoints = self->_attemptedEndpoints;
  if (attemptedEndpoints)
  {
    NSLog(&cfstr_SCached.isa, a2, "-[SiriNWConnection _getAttemptedEndpoints]", attemptedEndpoints);
    BOOL v4 = self->_attemptedEndpoints;
  }
  else
  {
    BOOL v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v5 = self->_connection;
    if (v5 && !self->_isCanceled)
    {
      id v6 = (void *)nw_connection_copy_attempted_endpoint_array();
      if (v6)
      {
        uint64_t count = nw_array_get_count();
        if (count)
        {
          uint64_t v8 = count;
          for (uint64_t i = 0; i != v8; ++i)
          {
            uint64_t v10 = nw_array_get_object_at_index();
            uint64_t description = nw_endpoint_get_description();
            if (description)
            {
              size_t v12 = (void *)[[NSString alloc] initWithUTF8String:description];
              if (v12) {
                [(NSArray *)v4 addObject:v12];
              }
            }
          }
        }
      }
    }
    NSLog(&cfstr_S.isa, "-[SiriNWConnection _getAttemptedEndpoints]", v4);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_dateToDisable, 0);
  objc_storeStrong((id *)&self->_mostRecentErrorFromNWConnection, 0);
  objc_storeStrong((id *)&self->_attemptedEndpoints, 0);
  objc_storeStrong((id *)&self->_connectionUnviableTimer, 0);
  objc_storeStrong((id *)&self->_staleConnectionTimer, 0);
  objc_storeStrong((id *)&self->_openTimer, 0);
  objc_storeStrong(&self->_openCompletion, 0);
  objc_storeStrong((id *)&self->_connectionId, 0);
  objc_storeStrong(&self->_wfcompletion, 0);
  objc_storeStrong((id *)&self->_content_context, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_resolvedHost, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end