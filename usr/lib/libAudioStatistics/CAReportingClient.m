@interface CAReportingClient
+ (id)getClient;
+ (id)sharedInstance;
+ (void)destroyClient;
- (CAReportingClient)initWithXPC:(BOOL)a3 endpoint:(id)a4;
- (NSMutableDictionary)clientReporters;
- (NSXPCConnection)connection;
- (id)getConfigurationForReporterID:(int64_t)a3;
- (id)listClientReporterIDs;
- (id)listServerReporterIDs;
- (id)reporterWithID:(int64_t)a3;
- (int64_t)createReporterID:(unsigned int)a3;
- (uint64_t)requestMessageWithID:category:type:callback:;
- (unsigned)getServiceTypeForReporterID:(int64_t)a3;
- (void)addReporter:(id)a3;
- (void)dealloc;
- (void)destroyReporterWithID:(int64_t)a3;
- (void)destroyService;
- (void)disconnectReporters;
- (void)reconnectReporter:(id)a3;
- (void)reconnectStartedReporters;
- (void)requestMessageWithID:(int64_t)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 callback:(id)a6;
- (void)requestMessageWithID:category:type:callback:;
- (void)sendMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 reporter:(int64_t)a6;
- (void)setClientReporters:(id)a3;
- (void)setConfiguration:(id)a3 reporterID:(int64_t)a4;
- (void)setConnection:(id)a3;
- (void)setServiceType:(unsigned __int16)a3 reporterID:(int64_t)a4;
- (void)startReporter:(int64_t)a3;
- (void)stopReporter:(int64_t)a3;
@end

@implementation CAReportingClient

- (void)reconnectReporter:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315650;
      v23 = "CAReportingClient.mm";
      __int16 v24 = 1024;
      int v25 = 79;
      __int16 v26 = 2080;
      v27 = "-[CAReportingClient reconnectReporter:]";
      _os_log_impl(&dword_19025C000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v22, 0x1Cu);
    }
  }
  if (v4 && ([v4 connected] & 1) == 0)
  {
    v6 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 reporterID];
      CAReportingUtilityGenerateServiceNameFromServiceType([v4 serviceType]);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      int v9 = [v4 serviceType];
      int v10 = aNy[[v4 started]];
      int v22 = 136316418;
      v23 = "CAReportingClient.mm";
      __int16 v24 = 1024;
      int v25 = 514;
      __int16 v26 = 2048;
      v27 = (const char *)v7;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 1024;
      int v31 = v9;
      __int16 v32 = 1024;
      int v33 = v10;
      _os_log_impl(&dword_19025C000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Reconnecting reporter { careporter_id=%lli, servicename=\"%@\", servicetype=%i, started=\"%c\" }", (uint8_t *)&v22, 0x32u);
    }
    if (_os_feature_enabled_impl())
    {
      v11 = [(CAReportingClient *)self connection];
      v12 = [v11 _unboostingRemoteObjectProxy];
      [v12 createSessionWith:[v4 reporterID]];

      v13 = [(CAReportingClient *)self connection];
      v14 = [v13 _unboostingRemoteObjectProxy];
      [v14 setWithServiceType:[v4 serviceType] for:[v4 reporterID]];

      v15 = [(CAReportingClient *)self connection];
      v16 = [v15 _unboostingRemoteObjectProxy];
      v17 = [v4 configuration];
      [v16 setWithConfiguration:v17 for:objc_msgSend(v4, "reporterID")];
    }
    else
    {
      v18 = [(CAReportingClient *)self connection];
      v19 = [v18 _unboostingRemoteObjectProxy];
      [v19 createReportingSession:[v4 reporterID]];

      v20 = [(CAReportingClient *)self connection];
      v21 = [v20 _unboostingRemoteObjectProxy];
      [v21 setServiceType:[v4 serviceType] reportingSession:[v4 reporterID]];

      v15 = [(CAReportingClient *)self connection];
      v16 = [v15 _unboostingRemoteObjectProxy];
      v17 = [v4 configuration];
      [v16 setConfiguration:v17 forReporterID:[v4 reporterID]];
    }

    [v4 setConnected:1];
  }
}

- (void)reconnectStartedReporters
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    v3 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "CAReportingClient.mm";
      __int16 v21 = 1024;
      int v22 = 79;
      __int16 v23 = 2080;
      __int16 v24 = "-[CAReportingClient reconnectStartedReporters]";
      _os_log_impl(&dword_19025C000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  id v4 = (id)gReportingClient;
  objc_sync_enter(v4);
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"started == YES"];
  v6 = [(CAReportingClient *)self clientReporters];
  uint64_t v7 = [v6 allValues];
  id v8 = [v7 filteredArrayUsingPredicate:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        -[CAReportingClient startReporter:](self, "startReporter:", [v13 reporterID]);
        -[CAReportingClient sendMessage:category:type:reporter:](self, "sendMessage:category:type:reporter:", &unk_1EDFB5880, 1, 0, [v13 reporterID]);
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v4);
}

- (void)disconnectReporters
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    v3 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "CAReportingClient.mm";
      __int16 v20 = 1024;
      int v21 = 79;
      __int16 v22 = 2080;
      __int16 v23 = "-[CAReportingClient disconnectReporters]";
      _os_log_impl(&dword_19025C000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  id v4 = *(id *)AA_ClientCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "CAReportingClient.mm";
    __int16 v20 = 1024;
    int v21 = 555;
    _os_log_impl(&dword_19025C000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Disconnecting reporters", buf, 0x12u);
  }
  v5 = self;
  objc_sync_enter(v5);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(CAReportingClient *)v5 clientReporters];
  uint64_t v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v11 setConnected:0];
        v12 = [v11 perfObject];
        [v12 abandon];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v5);
}

- (CAReportingClient)initWithXPC:(BOOL)a3 endpoint:(id)a4
{
  BOOL v4 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (_os_feature_enabled_impl())
  {
    uint64_t v7 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "CAReportingClient.mm";
      __int16 v29 = 1024;
      int v30 = 79;
      __int16 v31 = 2080;
      *(void *)__int16 v32 = "-[CAReportingClient initWithXPC:endpoint:]";
      _os_log_impl(&dword_19025C000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  uint64_t v8 = *(id *)AA_ClientCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = aNy[v4];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "CAReportingClient.mm";
    __int16 v29 = 1024;
    int v30 = 571;
    __int16 v31 = 1024;
    *(_DWORD *)__int16 v32 = v9;
    *(_WORD *)&v32[4] = 2112;
    *(void *)&v32[6] = v6;
    _os_log_impl(&dword_19025C000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Creating CAReportingClient { useXPC=\"%c\", endpoint=\"%@\" }", buf, 0x22u);
  }
  v27.receiver = self;
  v27.super_class = (Class)CAReportingClient;
  uint64_t v10 = [(CAReportingClient *)&v27 init];
  if (!v10) {
    goto LABEL_26;
  }
  uint64_t v11 = objc_opt_new();
  [(CAReportingClient *)v10 setClientReporters:v11];

  if (!v4) {
    goto LABEL_26;
  }
  if (v6)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v6];
    [(CAReportingClient *)v10 setConnection:v12];
  }
  else
  {
    if (_os_feature_enabled_impl()) {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.audioanalyticsd" options:4096];
    }
    else {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.audio.toolbox.reporting.service"];
    }
    [(CAReportingClient *)v10 setConnection:v12];
  }

  long long v13 = [(CAReportingClient *)v10 connection];
  BOOL v14 = v13 == 0;

  if (!v14)
  {
    if (_os_feature_enabled_impl()) {
      [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB7668];
    }
    else {
    long long v15 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB76C8];
    }
    long long v16 = [(CAReportingClient *)v10 connection];
    [v16 setRemoteObjectInterface:v15];

    objc_initWeak((id *)buf, v10);
    v18 = [(CAReportingClient *)v10 connection];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __42__CAReportingClient_initWithXPC_endpoint___block_invoke;
    v23[3] = &unk_1E568AFA8;
    objc_copyWeak(&v24, (id *)buf);
    [v18 setInterruptionHandler:v23];

    v19 = [(CAReportingClient *)v10 connection];
    [v19 setInvalidationHandler:&__block_literal_global];

    __int16 v20 = [(CAReportingClient *)v10 connection];
    [v20 resume];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
LABEL_26:
    int v21 = v10;
    goto LABEL_27;
  }
  if (_os_feature_enabled_impl())
  {
    long long v17 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = @"com.apple.audioanalyticsd";
      caulk::slog::detail::string_converter::string_converter<NSString * {__strong}>((std::string *)buf);
      *(_DWORD *)int v33 = 136315650;
      uint64_t v34 = "CAReportingClient.mm";
      __int16 v35 = 1024;
      int v36 = 592;
      __int16 v37 = 2080;
      uint64_t v38 = *(void *)&v32[12];
      _os_log_impl(&dword_19025C000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Error creating XPC connection { servicename=\"%s\" }", v33, 0x1Cu);
      if (v32[4] && (v32[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
    }
  }
  else
  {
    long long v17 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = @"com.apple.audio.toolbox.reporting.service";
      caulk::slog::detail::string_converter::string_converter<NSString * {__strong}>((std::string *)buf);
      *(_DWORD *)int v33 = 136315650;
      uint64_t v34 = "CAReportingClient.mm";
      __int16 v35 = 1024;
      int v36 = 594;
      __int16 v37 = 2080;
      uint64_t v38 = *(void *)&v32[12];
      _os_log_impl(&dword_19025C000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Error creating XPC connection { servicename=\"%s\" }", v33, 0x1Cu);
      if (v32[4] && (v32[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
    }
  }

  int v21 = 0;
LABEL_27:

  return v21;
}

void __42__CAReportingClient_initWithXPC_endpoint___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = *(id *)AA_ClientCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "CAReportingClient.mm";
    __int16 v8 = 1024;
    int v9 = 608;
    _os_log_impl(&dword_19025C000, v2, OS_LOG_TYPE_INFO, "%25s:%-5d Interruption Handler: server exited or crashed.", (uint8_t *)&v6, 0x12u);
  }
  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained disconnectReporters];

  id v5 = objc_loadWeakRetained(v3);
  [v5 reconnectStartedReporters];
}

void __42__CAReportingClient_initWithXPC_endpoint___block_invoke_210()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = *(id *)AA_ClientCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315394;
    v2 = "CAReportingClient.mm";
    __int16 v3 = 1024;
    int v4 = 615;
    _os_log_impl(&dword_19025C000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Invalidation Handler: server exited", (uint8_t *)&v1, 0x12u);
  }
}

+ (id)sharedInstance
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    __int16 v3 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315650;
      uint64_t v11 = "CAReportingClient.mm";
      __int16 v12 = 1024;
      int v13 = 79;
      __int16 v14 = 2080;
      long long v15 = "+[CAReportingClient sharedInstance]";
      _os_log_impl(&dword_19025C000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v10, 0x1Cu);
    }
  }
  id v4 = a1;
  objc_sync_enter(v4);
  if (!gReportingClient)
  {
    uint64_t v5 = [objc_alloc((Class)v4) initWithXPC:1 endpoint:0];
    int v6 = (void *)gReportingClient;
    gReportingClient = v5;

    uint64_t v7 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315394;
      uint64_t v11 = "CAReportingClient.mm";
      __int16 v12 = 1024;
      int v13 = 636;
      _os_log_impl(&dword_19025C000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d Registering appWillResignActive for UIApplicationWillResignActiveNotification", (uint8_t *)&v10, 0x12u);
    }
  }
  objc_sync_exit(v4);

  __int16 v8 = (void *)gReportingClient;

  return v8;
}

- (int64_t)createReporterID:(unsigned int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315650;
      long long v15 = "CAReportingClient.mm";
      __int16 v16 = 1024;
      int v17 = 79;
      __int16 v18 = 2080;
      v19 = "-[CAReportingClient createReporterID:]";
      _os_log_impl(&dword_19025C000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v14, 0x1Cu);
    }
  }
  id v6 = (id)gReportingClient;
  objc_sync_enter(v6);
  int64_t v7 = a3;
  kdebug_trace();
  __int16 v8 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v9 = [v8 processIdentifier];
  if (!a3) {
    int64_t v7 = ++gReporterIDCount | (unint64_t)(v9 << 32);
  }

  if (_os_feature_enabled_impl())
  {
    int v10 = [(CAReportingClient *)self connection];
    uint64_t v11 = [v10 _unboostingRemoteObjectProxy];
    [v11 createSessionWith:v7];
  }
  else
  {
    int v10 = [(CAReportingClient *)self connection];
    uint64_t v11 = [v10 _unboostingRemoteObjectProxy];
    [v11 createReportingSession:v7];
  }

  __int16 v12 = *(id *)AA_ClientCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    long long v15 = "CAReportingClient.mm";
    __int16 v16 = 1024;
    int v17 = 661;
    __int16 v18 = 2048;
    v19 = (const char *)v7;
    _os_log_impl(&dword_19025C000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created reporter { careporter_id=%lli }", (uint8_t *)&v14, 0x1Cu);
  }
  objc_sync_exit(v6);

  return v7;
}

- (id)reporterWithID:(int64_t)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "CAReportingClient.mm";
      __int16 v33 = 1024;
      int v34 = 79;
      __int16 v35 = 2080;
      int v36 = "-[CAReportingClient reporterWithID:]";
      _os_log_impl(&dword_19025C000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  id v6 = *(id *)AA_ClientCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "CAReportingClient.mm";
    __int16 v33 = 1024;
    int v34 = 676;
    __int16 v35 = 2048;
    int v36 = (const char *)a3;
    _os_log_impl(&dword_19025C000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Finding reporter { careporter_id=%lli }", buf, 0x1Cu);
  }
  if (a3)
  {
    id v7 = (id)gReportingClient;
    objc_sync_enter(v7);
    __int16 v8 = GetLocalCAReporterObjectFromClient(self, a3);
    uint64_t v9 = v8;
    if (v8)
    {
      int v10 = v8;
      int v11 = 1;
    }
    else
    {
      if (_os_feature_enabled_impl())
      {
        int v13 = [(CAReportingClient *)self connection];
        caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(buf, v13);

        caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy((void **)buf);
        int v10 = (CAReporter *)objc_claimAutoreleasedReturnValue();
        int v14 = caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)buf);
        [(CAReporter *)v10 validateFor:a3 completion:v14];

        id v15 = v38;
        if (v37)
        {
          int v10 = (CAReporter *)*(id *)AA_ClientCategory();
          if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
          {
            id v16 = v37;
            int v17 = [v16 localizedDescription];
            int v26 = 136315650;
            objc_super v27 = "CAReportingClient.mm";
            __int16 v28 = 1024;
            int v29 = 699;
            __int16 v30 = 2112;
            __int16 v31 = v17;
            _os_log_impl(&dword_19025C000, &v10->super, OS_LOG_TYPE_ERROR, "%25s:%-5d Error creating reporter { message=\"%@\" }", (uint8_t *)&v26, 0x1Cu);
          }
        }
      }
      else
      {
        __int16 v18 = [(CAReportingClient *)self connection];
        caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(buf, v18);

        caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy((void **)buf);
        int v10 = (CAReporter *)objc_claimAutoreleasedReturnValue();
        v19 = caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)buf);
        [(CAReporter *)v10 reporterID:a3 valid:v19];

        id v15 = v38;
        if (v37)
        {
          int v10 = (CAReporter *)*(id *)AA_ClientCategory();
          if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
          {
            id v20 = v37;
            int v21 = [v20 localizedDescription];
            int v26 = 136315650;
            objc_super v27 = "CAReportingClient.mm";
            __int16 v28 = 1024;
            int v29 = 707;
            __int16 v30 = 2112;
            __int16 v31 = v21;
            _os_log_impl(&dword_19025C000, &v10->super, OS_LOG_TYPE_ERROR, "%25s:%-5d Error creating reporter { message=\"%@\" }", (uint8_t *)&v26, 0x1Cu);
          }
        }
      }

      std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](&buf[8]);
      if (!v15) {
        goto LABEL_23;
      }
      __int16 v22 = [v15 objectForKey:@"reporterID"];
      int v10 = (CAReporter *)[v22 longLongValue];

      __int16 v23 = [v15 objectForKey:@"serviceType"];
      unsigned __int16 v24 = [v23 intValue];

      if (v10)
      {
        int v10 = [[CAReporter alloc] initWithReporterID:v10 serviceType:v24];
        int v11 = 1;
      }
      else
      {
LABEL_23:
        int v11 = 0;
      }
    }
    objc_sync_exit(v7);

    if (v11) {
      __int16 v12 = v10;
    }
    else {
      __int16 v12 = 0;
    }
  }
  else
  {
    __int16 v12 = 0;
  }

  return v12;
}

- (void)addReporter:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v16 = "CAReportingClient.mm";
      __int16 v17 = 1024;
      int v18 = 79;
      __int16 v19 = 2080;
      id v20 = "-[CAReportingClient addReporter:]";
      _os_log_impl(&dword_19025C000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  if (v4)
  {
    id v6 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 reporterID];
      *(_DWORD *)buf = 136315650;
      id v16 = "CAReportingClient.mm";
      __int16 v17 = 1024;
      int v18 = 737;
      __int16 v19 = 2048;
      id v20 = (const char *)v7;
      _os_log_impl(&dword_19025C000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Adding reporter to client { careporter_id=%lli }", buf, 0x1Cu);
    }

    id v8 = (id)gReportingClient;
    objc_sync_enter(v8);
    uint64_t v9 = [(CAReportingClient *)self clientReporters];
    int v10 = [NSNumber numberWithLongLong:[v4 reporterID]];
    int v13 = v10;
    id v14 = v4;
    int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v9 addEntriesFromDictionary:v11];

    objc_sync_exit(v8);
  }
  else
  {
    __int16 v12 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "CAReportingClient.mm";
      __int16 v17 = 1024;
      int v18 = 733;
      _os_log_impl(&dword_19025C000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Received nil reporter!", buf, 0x12u);
    }
  }
}

- (void)destroyReporterWithID:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315650;
      __int16 v17 = "CAReportingClient.mm";
      __int16 v18 = 1024;
      int v19 = 79;
      __int16 v20 = 2080;
      uint64_t v21 = "-[CAReportingClient destroyReporterWithID:]";
      _os_log_impl(&dword_19025C000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v16, 0x1Cu);
    }
  }
  id v6 = (id)gReportingClient;
  objc_sync_enter(v6);
  if (a3)
  {
    uint64_t v7 = [(CAReportingClient *)self clientReporters];
    id v8 = [NSNumber numberWithLongLong:a3];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      [(CAReportingClient *)self stopReporter:a3];
      int v10 = *(id *)AA_ClientCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315650;
        __int16 v17 = "CAReportingClient.mm";
        __int16 v18 = 1024;
        int v19 = 760;
        __int16 v20 = 2048;
        uint64_t v21 = (const char *)a3;
        _os_log_impl(&dword_19025C000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Removing reporter from client and server { careporter_id=%lli }", (uint8_t *)&v16, 0x1Cu);
      }
      [v9 setRemovedByClient:1];
      int v11 = [(CAReportingClient *)self clientReporters];
      __int16 v12 = [NSNumber numberWithLongLong:a3];
      [v11 removeObjectForKey:v12];

      if ([v9 connected])
      {
        if (_os_feature_enabled_impl())
        {
          int v13 = [(CAReportingClient *)self connection];
          id v14 = [v13 _unboostingRemoteObjectProxy];
          [v14 destroySessionFor:a3];
        }
        else
        {
          int v13 = [(CAReportingClient *)self connection];
          id v14 = [v13 _unboostingRemoteObjectProxy];
          [v14 destroyReportingSession:a3];
        }
      }
    }
    else
    {
      id v15 = *(id *)AA_ClientCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315650;
        __int16 v17 = "CAReportingClient.mm";
        __int16 v18 = 1024;
        int v19 = 773;
        __int16 v20 = 2048;
        uint64_t v21 = (const char *)a3;
        _os_log_impl(&dword_19025C000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Attempted to remove a reporter not created by this client { careporter_id=%lli }", (uint8_t *)&v16, 0x1Cu);
      }
    }
  }
  objc_sync_exit(v6);
}

- (void)requestMessageWithID:(int64_t)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 callback:(id)a6
{
  uint64_t v6 = a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int v10 = (void (**)(id, void))a6;
  if (_os_feature_enabled_impl())
  {
    int v11 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "CAReportingClient.mm";
      __int16 v35 = 1024;
      int v36 = 79;
      __int16 v37 = 2080;
      id v38 = "-[CAReportingClient requestMessageWithID:category:type:callback:]";
      _os_log_impl(&dword_19025C000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  __int16 v12 = *(id *)AA_ClientCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = CAReportingUtilityCategoryString(v7);
    id v14 = CAReportingUtilityTypeString(v6);
    *(_DWORD *)buf = 136316674;
    *(void *)&uint8_t buf[4] = "CAReportingClient.mm";
    __int16 v35 = 1024;
    int v36 = 786;
    __int16 v37 = 2048;
    id v38 = (const char *)a3;
    __int16 v39 = 2112;
    v40 = v13;
    __int16 v41 = 1024;
    int v42 = v7;
    __int16 v43 = 2112;
    v44 = v14;
    __int16 v45 = 1024;
    int v46 = v6;
    _os_log_impl(&dword_19025C000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d requestMessageWithID called. { careporter_id=%lli, eventcategoryname=\"%@\", eventcategory=%i, servicename=\"%@\", servicetype=%i }", buf, 0x3Cu);
  }
  if (!a3)
  {
    id v15 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = CAReportingUtilityCategoryString(v7);
      __int16 v17 = CAReportingUtilityTypeString(v6);
      *(_DWORD *)buf = 136316674;
      *(void *)&uint8_t buf[4] = "CAReportingClient.mm";
      __int16 v35 = 1024;
      int v36 = 788;
      __int16 v37 = 2048;
      id v38 = 0;
      __int16 v39 = 2112;
      v40 = v16;
      __int16 v41 = 1024;
      int v42 = v7;
      __int16 v43 = 2112;
      v44 = v17;
      __int16 v45 = 1024;
      int v46 = v6;
      _os_log_impl(&dword_19025C000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d requestMessageWithID: Invalid reporterID. Invoking callback. { careporter_id=%lli, eventcategoryname=\"%@\", eventcategory=%i, servicename=\"%@\", servicetype=%i }", buf, 0x3Cu);
    }
    v10[2](v10, 0);
  }
  id v18 = (id)gReportingClient;
  objc_sync_enter(v18);
  int v19 = (void *)MEMORY[0x192FCA910](v10);
  if (_os_feature_enabled_impl())
  {
    __int16 v20 = [(CAReportingClient *)self connection];
    v29[0] = MEMORY[0x192FCA910](v19);
    v29[1] = a3;
    int v30 = v7;
    __int16 v31 = v6;
    std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::function<-[CAReportingClient requestMessageWithID:category:type:callback:]::$_0,void>((uint64_t)v33, v29);
    caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::message(buf, v20, (uint64_t)v33);
    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v33);

    uint64_t v21 = caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::async_proxy((void **)buf);
    uint64_t v22 = caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)buf);
    [v21 requestMessageFor:a3 category:v7 type:v6 reply:v22];

    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](&buf[8]);
  }
  else
  {
    __int16 v23 = [(CAReportingClient *)self connection];
    v26[0] = MEMORY[0x192FCA910](v19);
    v26[1] = a3;
    int v27 = v7;
    __int16 v28 = v6;
    std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::function<-[CAReportingClient requestMessageWithID:category:type:callback:]::$_0,void>((uint64_t)v32, v26);
    caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::message(buf, v23, (uint64_t)v32);
    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v32);

    unsigned __int16 v24 = caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::async_proxy((void **)buf);
    uint64_t v25 = caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)buf);
    [v24 requestMessageForID:a3 withCategory:v7 andType:v6 reply:v25];

    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](&buf[8]);
  }

  objc_sync_exit(v18);
}

- (uint64_t)requestMessageWithID:category:type:callback:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (id)listClientReporterIDs
{
  id v3 = (id)gReportingClient;
  objc_sync_enter(v3);
  id v4 = [(CAReportingClient *)self clientReporters];
  uint64_t v5 = [v4 allKeys];

  objc_sync_exit(v3);

  return v5;
}

- (id)listServerReporterIDs
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = (id)gReportingClient;
  objc_sync_enter(v3);
  if (_os_feature_enabled_impl())
  {
    id v4 = [(CAReportingClient *)self connection];
    caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(&v22, v4);

    id v5 = v25;
    if (v24)
    {
      uint64_t v6 = *(id *)AA_ClientCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = v24;
        id v8 = [v7 localizedDescription];
        int v16 = 136315650;
        __int16 v17 = "CAReportingClient.mm";
        __int16 v18 = 1024;
        int v19 = 836;
        __int16 v20 = 2112;
        uint64_t v21 = v8;
        _os_log_impl(&dword_19025C000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d error listing reporters { message=\"%@\" }", (uint8_t *)&v16, 0x1Cu);
      }
    }
  }
  else
  {
    uint64_t v9 = [(CAReportingClient *)self connection];
    caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(&v22, v9);

    int v10 = caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_proxy(&v22);
    int v11 = caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::reply((uint64_t)&v22);
    [v10 getAllReporters:v11];

    id v5 = v25;
    if (v24)
    {
      __int16 v12 = *(id *)AA_ClientCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = v24;
        id v14 = [v13 localizedDescription];
        int v16 = 136315650;
        __int16 v17 = "CAReportingClient.mm";
        __int16 v18 = 1024;
        int v19 = 844;
        __int16 v20 = 2112;
        uint64_t v21 = v14;
        _os_log_impl(&dword_19025C000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d error listing reporters { message=\"%@\" }", (uint8_t *)&v16, 0x1Cu);
      }
    }
  }

  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](v23);
  objc_sync_exit(v3);

  return v5;
}

- (void)startReporter:(int64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id v5 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v23 = 136315650;
      *(void *)&void v23[4] = "CAReportingClient.mm";
      __int16 v24 = 1024;
      int v25 = 79;
      __int16 v26 = 2080;
      int v27 = "-[CAReportingClient startReporter:]";
      _os_log_impl(&dword_19025C000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", v23, 0x1Cu);
    }
  }
  id v6 = (id)gReportingClient;
  objc_sync_enter(v6);
  id v7 = *(id *)AA_ClientCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int16 v23 = 136315650;
    *(void *)&void v23[4] = "CAReportingClient.mm";
    __int16 v24 = 1024;
    int v25 = 861;
    __int16 v26 = 2048;
    int v27 = (const char *)a3;
    _os_log_impl(&dword_19025C000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Starting { careporter_id=%lli }", v23, 0x1Cu);
  }
  id v8 = GetLocalCAReporterObjectFromClient(self, a3);
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 reporterID];
    [v9 serviceType];
    kdebug_trace();
    [(CAReportingClient *)self reconnectReporter:v9];
    if (([v9 started] & 1) == 0)
    {
      int v10 = [MEMORY[0x1E4F1C9C8] date];
      [v9 setStartDate:v10];

      [v9 setStarted:1];
      int v11 = *(id *)AA_ClientCategory();
      os_signpost_id_t v12 = [v9 signpostID];
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        id v13 = [v9 configuration];
        id v14 = CAReportingUtilityRetrieveAppName(v13);
        *(_DWORD *)__int16 v23 = 138543362;
        *(void *)&void v23[4] = v14;
        _os_signpost_emit_with_name_impl(&dword_19025C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CoreAudioReportingSession", "Starting Application=%{public}@", v23, 0xCu);
      }
      if ([v9 serviceType] == 11 && CAReportingUtilityIsInternalBuild())
      {
        if (_os_feature_enabled_impl())
        {
          id v15 = [(CAReportingClient *)self connection];
          caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message((uint64_t)v23, v15);

          int v16 = caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_proxy((void **)v23);
          [v16 startSessionFor:a3];
        }
        else
        {
          __int16 v20 = [(CAReportingClient *)self connection];
          caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message((uint64_t)v23, v20);

          int v16 = caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_proxy((void **)v23);
          uint64_t v21 = caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::reply((uint64_t)v23);
          [v16 startReportingSessionForID:a3 reply:v21];
        }
        std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100](&v23[8]);
      }
      else
      {
        if (_os_feature_enabled_impl())
        {
          __int16 v18 = [(CAReportingClient *)self connection];
          int v19 = [v18 _unboostingRemoteObjectProxy];
          [v19 startSessionFor:a3];
        }
        else
        {
          __int16 v18 = [(CAReportingClient *)self connection];
          int v19 = [v18 _unboostingRemoteObjectProxy];
          [v19 startReportingSessionForID:a3];
        }
      }
      uint64_t v22 = [v9 perfObject];
      [v22 begin];
    }
  }
  else
  {
    __int16 v17 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v23 = 136315650;
      *(void *)&void v23[4] = "CAReportingClient.mm";
      __int16 v24 = 1024;
      int v25 = 865;
      __int16 v26 = 2048;
      int v27 = (const char *)a3;
      _os_log_impl(&dword_19025C000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Reporter not found { careporter_id=%lli }", v23, 0x1Cu);
    }
  }

  objc_sync_exit(v6);
}

- (void)stopReporter:(int64_t)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id v5 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136315650;
      id v28 = "CAReportingClient.mm";
      __int16 v29 = 1024;
      int v30 = 79;
      __int16 v31 = 2080;
      __int16 v32 = "-[CAReportingClient stopReporter:]";
      _os_log_impl(&dword_19025C000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v27, 0x1Cu);
    }
  }
  id v6 = (id)gReportingClient;
  objc_sync_enter(v6);
  id v7 = *(id *)AA_ClientCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315650;
    id v28 = "CAReportingClient.mm";
    __int16 v29 = 1024;
    int v30 = 909;
    __int16 v31 = 2048;
    __int16 v32 = (const char *)a3;
    _os_log_impl(&dword_19025C000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Stopping { careporter_id=%lli }", (uint8_t *)&v27, 0x1Cu);
  }
  id v8 = GetLocalCAReporterObjectFromClient(self, a3);
  uint64_t v9 = v8;
  if (v8)
  {
    if (![v8 started]
      || ([v9 startDate],
          int v10 = objc_claimAutoreleasedReturnValue(),
          BOOL v11 = v10 == 0,
          v10,
          v11))
    {
      uint64_t v22 = *(id *)AA_ClientCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        int v27 = 136315650;
        id v28 = "CAReportingClient.mm";
        __int16 v29 = 1024;
        int v30 = 917;
        __int16 v31 = 2048;
        __int16 v32 = (const char *)a3;
        _os_log_impl(&dword_19025C000, v22, OS_LOG_TYPE_DEBUG, "%25s:%-5d !reporter.started or reporter.startDate is nil { careporter_id=%lli }", (uint8_t *)&v27, 0x1Cu);
      }
    }
    else
    {
      [v9 reporterID];
      [v9 serviceType];
      kdebug_trace();
      __int16 v35 = @"session_duration";
      os_signpost_id_t v12 = NSNumber;
      id v13 = [v9 startDate];
      [v13 timeIntervalSinceNow];
      id v15 = [v12 numberWithDouble:fabs(v14)];
      v36[0] = v15;
      int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      [(CAReportingClient *)self sendMessage:v16 category:1 type:0 reporter:a3];

      __int16 v17 = [v9 perfObject];
      __int16 v18 = [v17 endAndReturnPerformanceMetrics];

      if (v18)
      {
        int v19 = *(id *)AA_ClientCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          int v27 = 136315906;
          id v28 = "CAReportingClient.mm";
          __int16 v29 = 1024;
          int v30 = 925;
          __int16 v31 = 2048;
          __int16 v32 = (const char *)a3;
          __int16 v33 = 2112;
          int v34 = v18;
          _os_log_impl(&dword_19025C000, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d gathered perf metrics { careporter_id=%lli, perfMetrics=\"%@\" }", (uint8_t *)&v27, 0x26u);
        }
        [(CAReportingClient *)self sendMessage:v18 category:13 type:0 reporter:a3];
      }

      if ([v9 connected])
      {
        if (_os_feature_enabled_impl())
        {
          __int16 v20 = [(CAReportingClient *)self connection];
          uint64_t v21 = [v20 _unboostingRemoteObjectProxy];
          [v21 stopSessionFor:a3];
        }
        else
        {
          __int16 v20 = [(CAReportingClient *)self connection];
          uint64_t v21 = [v20 _unboostingRemoteObjectProxy];
          [v21 stopReportingSessionForID:a3];
        }
      }
      __int16 v23 = *(id *)AA_ClientCategory();
      os_signpost_id_t v24 = [v9 signpostID];
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        int v25 = [v9 configuration];
        CAReportingUtilityRetrieveAppName(v25);
        __int16 v26 = (char *)objc_claimAutoreleasedReturnValue();
        int v27 = 138543362;
        id v28 = v26;
        _os_signpost_emit_with_name_impl(&dword_19025C000, v23, OS_SIGNPOST_INTERVAL_END, v24, "CoreAudioReportingSession", "Stopping Application=%{public}@", (uint8_t *)&v27, 0xCu);
      }
      [v9 setStarted:0];
      [v9 setStartDate:0];
    }
  }

  objc_sync_exit(v6);
}

- (void)sendMessage:(id)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 reporter:(int64_t)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v10 = (char *)a3;
  if (_os_feature_enabled_impl())
  {
    BOOL v11 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v23 = "CAReportingClient.mm";
      __int16 v24 = 1024;
      int v25 = 79;
      __int16 v26 = 2080;
      int v27 = "-[CAReportingClient sendMessage:category:type:reporter:]";
      _os_log_impl(&dword_19025C000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  id v12 = (id)gReportingClient;
  objc_sync_enter(v12);
  kdebug_trace();
  id v13 = *(id *)AA_ClientCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v23 = "CAReportingClient.mm";
    __int16 v24 = 1024;
    int v25 = 955;
    __int16 v26 = 2112;
    int v27 = v10;
    __int16 v28 = 2048;
    int64_t v29 = a6;
    _os_log_impl(&dword_19025C000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Sending message { message=\"%@\", careporter_id=%lli }", buf, 0x26u);
  }
  if (-[CAReportingClient sendMessage:category:type:reporter:]::once != -1) {
    dispatch_once(&-[CAReportingClient sendMessage:category:type:reporter:]::once, &__block_literal_global_214);
  }
  if (!-[CAReportingClient sendMessage:category:type:reporter:]::gCAReportingIsDarwin)
  {
    if (v8 == 7 && v7 == 6 && CAReportingUtilityIsInternalBuild())
    {
      if (_os_feature_enabled_impl())
      {
        int v16 = [(CAReportingClient *)self connection];
        __int16 v17 = [v16 remoteObjectProxy];
        __int16 v18 = CAReportingUtilityAddDates((uint64_t)v10);
        [v17 sendWithMessage:v18 with:7 and:6 for:a6];
      }
      else
      {
        int v16 = [(CAReportingClient *)self connection];
        __int16 v17 = [v16 remoteObjectProxy];
        __int16 v18 = CAReportingUtilityAddDates((uint64_t)v10);
        [v17 sendMessage:v18 withCategory:7 andType:6 forReportingID:a6];
      }
    }
    else
    {
      if (_os_feature_enabled_impl())
      {
        int v16 = [(CAReportingClient *)self connection];
        int v19 = [v16 _unboostingRemoteObjectProxy];
        __int16 v20 = CAReportingUtilityAddDates((uint64_t)v10);
        [v19 sendWithMessage:v20 with:v8 and:v7 for:a6];
      }
      else
      {
        int v16 = [(CAReportingClient *)self connection];
        int v19 = [v16 _unboostingRemoteObjectProxy];
        __int16 v20 = CAReportingUtilityAddDates((uint64_t)v10);
        [v19 sendMessage:v20 withCategory:v8 andType:v7 forReportingID:a6];
      }
    }
    goto LABEL_25;
  }
  if (v10)
  {
    if (v8 == 7 && v7 == 6)
    {
      double v14 = [v10 objectForKeyedSubscript:@"issue_type"];
      BOOL v15 = v14 == 0;

      if (!v15)
      {
        uint64_t v21 = v10;
        AnalyticsSendEventLazy();
        int v16 = v21;
LABEL_25:
      }
    }
  }
  objc_sync_exit(v12);
}

uint64_t __56__CAReportingClient_sendMessage_category_type_reporter___block_invoke()
{
  uint64_t result = os_variant_is_darwinos();
  -[CAReportingClient sendMessage:category:type:reporter:]::gCAReportingIsDarwin = result;
  return result;
}

id __56__CAReportingClient_sendMessage_category_type_reporter___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)setServiceType:(unsigned __int16)a3 reporterID:(int64_t)a4
{
  uint64_t v5 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    uint64_t v7 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136315650;
      int v27 = "CAReportingClient.mm";
      __int16 v28 = 1024;
      int v29 = 79;
      __int16 v30 = 2080;
      __int16 v31 = "-[CAReportingClient setServiceType:reporterID:]";
      _os_log_impl(&dword_19025C000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v26, 0x1Cu);
    }
  }
  id v8 = (id)gReportingClient;
  objc_sync_enter(v8);
  uint64_t v9 = *(id *)AA_ClientCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = CAReportingUtilityGenerateServiceNameFromServiceType(v5);
    int v26 = 136315906;
    int v27 = "CAReportingClient.mm";
    __int16 v28 = 1024;
    int v29 = 1012;
    __int16 v30 = 2048;
    __int16 v31 = (const char *)a4;
    __int16 v32 = 2112;
    __int16 v33 = v10;
    _os_log_impl(&dword_19025C000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Set servicetype { careporter_id=%lli, serviceType=\"%@\" }", (uint8_t *)&v26, 0x26u);
  }
  BOOL v11 = GetLocalCAReporterObjectFromClient(self, a4);
  id v12 = v11;
  if (v11)
  {
    int v13 = [v11 serviceType];
    if (v13 != v5)
    {
      [v12 cacheServiceType:v5];
      double v14 = [v12 perfObject];
      [v14 setServiceType:v5];
    }
    int v15 = [v12 started] ^ 1;
    if (v13 == v5) {
      LOBYTE(v15) = 1;
    }
    if (v15)
    {
      __int16 v20 = *(id *)AA_ClientCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = CAReportingUtilityGenerateServiceNameFromServiceType(v5);
        int v26 = 136316162;
        int v27 = "CAReportingClient.mm";
        __int16 v28 = 1024;
        int v29 = 1043;
        __int16 v30 = 2048;
        __int16 v31 = (const char *)a4;
        __int16 v32 = 2112;
        __int16 v33 = v21;
        __int16 v34 = 1024;
        int v35 = v5;
        _os_log_impl(&dword_19025C000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting new serviceType { careporter_id=%lli, servicename=\"%@\", servicetype=%i }", (uint8_t *)&v26, 0x2Cu);
      }
      if (_os_feature_enabled_impl())
      {
        uint64_t v22 = [(CAReportingClient *)self connection];
        __int16 v23 = [v22 _unboostingRemoteObjectProxy];
        [v23 setWithServiceType:v5 for:a4];
      }
      else
      {
        uint64_t v22 = [(CAReportingClient *)self connection];
        __int16 v23 = [v22 _unboostingRemoteObjectProxy];
        [v23 setServiceType:v5 reportingSession:a4];
      }
    }
    else
    {
      int v16 = *(id *)AA_ClientCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 136315650;
        int v27 = "CAReportingClient.mm";
        __int16 v28 = 1024;
        int v29 = 1029;
        __int16 v30 = 2048;
        __int16 v31 = (const char *)a4;
        _os_log_impl(&dword_19025C000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Stopping while reconfiguring service { careporter_id=%lli }", (uint8_t *)&v26, 0x1Cu);
      }
      [v12 stop];
      if (_os_feature_enabled_impl())
      {
        __int16 v17 = [(CAReportingClient *)self connection];
        __int16 v18 = [v17 _unboostingRemoteObjectProxy];
        [v18 setWithServiceType:v5 for:a4];
      }
      else
      {
        __int16 v17 = [(CAReportingClient *)self connection];
        __int16 v18 = [v17 _unboostingRemoteObjectProxy];
        [v18 setServiceType:v5 reportingSession:a4];
      }

      __int16 v24 = *(id *)AA_ClientCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = CAReportingUtilityGenerateServiceNameFromServiceType(v5);
        int v26 = 136316162;
        int v27 = "CAReportingClient.mm";
        __int16 v28 = 1024;
        int v29 = 1038;
        __int16 v30 = 2048;
        __int16 v31 = (const char *)a4;
        __int16 v32 = 2112;
        __int16 v33 = v25;
        __int16 v34 = 1024;
        int v35 = v5;
        _os_log_impl(&dword_19025C000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting new serviceType { careporter_id=%lli, servicename=\"%@\", servicetype=%i }", (uint8_t *)&v26, 0x2Cu);
      }
      [v12 start];
    }
  }
  else
  {
    int v19 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315650;
      int v27 = "CAReportingClient.mm";
      __int16 v28 = 1024;
      int v29 = 1016;
      __int16 v30 = 2048;
      __int16 v31 = (const char *)a4;
      _os_log_impl(&dword_19025C000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Reporter not found! { careporter_id=%lli }", (uint8_t *)&v26, 0x1Cu);
    }
  }

  objc_sync_exit(v8);
}

- (unsigned)getServiceTypeForReporterID:(int64_t)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "CAReportingClient.mm";
      __int16 v38 = 1024;
      int v39 = 79;
      __int16 v40 = 2080;
      __int16 v41 = "-[CAReportingClient getServiceTypeForReporterID:]";
      _os_log_impl(&dword_19025C000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", buf, 0x1Cu);
    }
  }
  id v6 = (id)gReportingClient;
  objc_sync_enter(v6);
  uint64_t v7 = [(CAReportingClient *)self clientReporters];
  id v8 = [NSNumber numberWithLongLong:a3];
  uint64_t v9 = [v7 objectForKey:v8];

  if (v9)
  {
    unsigned __int16 v10 = [v9 serviceType];
  }
  else if (_os_feature_enabled_impl())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v11 = [(CAReportingClient *)self connection];
      caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(buf, v11);

      id v12 = caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy((void **)buf);
      int v13 = caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)buf);
      [v12 validateFor:a3 completion:v13];

      id v14 = v43;
      if (v42)
      {
        int v15 = *(id *)AA_ClientCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v16 = v42;
          __int16 v17 = [v16 localizedDescription];
          int v29 = 136315906;
          __int16 v30 = "CAReportingClient.mm";
          __int16 v31 = 1024;
          int v32 = 1084;
          __int16 v33 = 2112;
          __int16 v34 = v17;
          __int16 v35 = 2048;
          int64_t v36 = a3;
          _os_log_impl(&dword_19025C000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Error getting service type { message=\"%@\", careporter_id=%lli }", (uint8_t *)&v29, 0x26u);
        }
      }
    }
    else
    {
      __int16 v18 = [(CAReportingClient *)self connection];
      caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(buf, v18);

      int v19 = caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy((void **)buf);
      __int16 v20 = caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)buf);
      [v19 reporterID:a3 valid:v20];

      id v14 = v43;
      if (v42)
      {
        uint64_t v21 = *(id *)AA_ClientCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v22 = v42;
          __int16 v23 = [v22 localizedDescription];
          int v29 = 136315906;
          __int16 v30 = "CAReportingClient.mm";
          __int16 v31 = 1024;
          int v32 = 1094;
          __int16 v33 = 2112;
          __int16 v34 = v23;
          __int16 v35 = 2048;
          int64_t v36 = a3;
          _os_log_impl(&dword_19025C000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Error getting service type { message=\"%@\", careporter_id=%lli }", (uint8_t *)&v29, 0x26u);
        }
      }
    }

    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](&buf[8]);
    if (v14)
    {
      __int16 v24 = [v14 objectForKey:@"reporterID"];
      uint64_t v25 = [v24 longLongValue];

      int v26 = [v14 objectForKey:@"serviceType"];
      unsigned __int16 v27 = [v26 intValue];

      if (v25) {
        unsigned __int16 v10 = v27;
      }
      else {
        unsigned __int16 v10 = -1;
      }
    }
    else
    {
      unsigned __int16 v10 = -1;
    }
  }
  else
  {
    unsigned __int16 v10 = -1;
  }
  objc_sync_exit(v6);

  return v10;
}

- (void)setConfiguration:(id)a3 reporterID:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v7 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315650;
      BOOL v11 = "CAReportingClient.mm";
      __int16 v12 = 1024;
      int v13 = 79;
      __int16 v14 = 2080;
      int v15 = "-[CAReportingClient setConfiguration:reporterID:]";
      _os_log_impl(&dword_19025C000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v10, 0x1Cu);
    }
  }
  id v8 = (id)gReportingClient;
  objc_sync_enter(v8);
  uint64_t v9 = GetLocalCAReporterObjectFromClient(self, a4);
  [v9 setConfiguration:v6];

  objc_sync_exit(v8);
}

- (id)getConfigurationForReporterID:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315650;
      int v13 = "CAReportingClient.mm";
      __int16 v14 = 1024;
      int v15 = 79;
      __int16 v16 = 2080;
      __int16 v17 = "-[CAReportingClient getConfigurationForReporterID:]";
      _os_log_impl(&dword_19025C000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v12, 0x1Cu);
    }
  }
  id v6 = (id)gReportingClient;
  objc_sync_enter(v6);
  uint64_t v7 = GetLocalCAReporterObjectFromClient(self, a3);
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 configuration];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  int v10 = (void *)v9;

  objc_sync_exit(v6);

  return v10;
}

+ (id)getClient
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    v2 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315650;
      uint64_t v7 = "CAReportingClient.mm";
      __int16 v8 = 1024;
      int v9 = 79;
      __int16 v10 = 2080;
      BOOL v11 = "+[CAReportingClient getClient]";
      _os_log_impl(&dword_19025C000, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v6, 0x1Cu);
    }
  }
  id v3 = (id)gReportingClient;
  objc_sync_enter(v3);
  id v4 = (id)gReportingClient;
  objc_sync_exit(v3);

  return v4;
}

+ (void)destroyClient
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    v2 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315650;
      int v6 = "CAReportingClient.mm";
      __int16 v7 = 1024;
      int v8 = 79;
      __int16 v9 = 2080;
      __int16 v10 = "+[CAReportingClient destroyClient]";
      _os_log_impl(&dword_19025C000, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v5, 0x1Cu);
    }
  }
  id v3 = (id)gReportingClient;
  objc_sync_enter(v3);
  id v4 = (void *)gReportingClient;
  gReportingClient = 0;

  objc_sync_exit(v3);
}

- (void)destroyService
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id v3 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315650;
      int v8 = "CAReportingClient.mm";
      __int16 v9 = 1024;
      int v10 = 79;
      __int16 v11 = 2080;
      uint64_t v12 = "-[CAReportingClient destroyService]";
      _os_log_impl(&dword_19025C000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Assertion failed: Unreachable Code. { function=\"%s\" }", (uint8_t *)&v7, 0x1Cu);
    }
  }
  id v4 = (id)gReportingClient;
  objc_sync_enter(v4);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    int v5 = [(CAReportingClient *)self connection];
    int v6 = [v5 _unboostingRemoteObjectProxy];
    [v6 killService];
  }
  objc_sync_exit(v4);
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = *(id *)AA_ClientCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v6 = "CAReportingClient.mm";
    __int16 v7 = 1024;
    int v8 = 1182;
    _os_log_impl(&dword_19025C000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Destroying client", buf, 0x12u);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAReportingClient;
  [(CAReportingClient *)&v4 dealloc];
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSMutableDictionary)clientReporters
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientReporters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientReporters, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)requestMessageWithID:category:type:callback:
{
}

@end