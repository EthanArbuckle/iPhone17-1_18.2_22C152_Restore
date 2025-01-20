@interface WLKFederatedAnalyticsReporter
+ (id)defaultFederatedAnalyticsReporter;
- (NSXPCConnection)connection;
- (void)_invalidationHandler;
- (void)reportPunchout:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation WLKFederatedAnalyticsReporter

+ (id)defaultFederatedAnalyticsReporter
{
  if (defaultFederatedAnalyticsReporter_token != -1) {
    dispatch_once(&defaultFederatedAnalyticsReporter_token, &__block_literal_global_36);
  }
  v2 = (void *)defaultFederatedAnalyticsReporter_defaultReporter;

  return v2;
}

uint64_t __66__WLKFederatedAnalyticsReporter_defaultFederatedAnalyticsReporter__block_invoke()
{
  defaultFederatedAnalyticsReporter_defaultReporter = objc_alloc_init(WLKFederatedAnalyticsReporter);

  return MEMORY[0x1F41817F8]();
}

- (void)reportPunchout:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = [(WLKFederatedAnalyticsReporter *)v4 connection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_3_0];

  [v6 reportFederatedPunchout:v7];
  objc_sync_exit(v4);
}

void __48__WLKFederatedAnalyticsReporter_reportPunchout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKFederatedAnalyticsReporter - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v4, 0xCu);
  }
}

- (NSXPCConnection)connection
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_connection)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.watchlistd.xpc" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    id v5 = v2->_connection;
    uint64_t v6 = WLKConnectionClientInterface();
    [(NSXPCConnection *)v5 setExportedInterface:v6];

    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    id v7 = v2->_connection;
    v8 = WLKConnectionServerInterface();
    [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_7_0];
    objc_initWeak(&location, v2);
    v9 = v2->_connection;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __43__WLKFederatedAnalyticsReporter_connection__block_invoke_8;
    v15 = &unk_1E620A550;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v9 setInvalidationHandler:&v12];
    [(NSXPCConnection *)v2->_connection resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  v10 = v2->_connection;

  return v10;
}

void __43__WLKFederatedAnalyticsReporter_connection__block_invoke()
{
  v0 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1BA2E8000, v0, OS_LOG_TYPE_DEFAULT, "WLKFederatedAnalyticsReporter - Connection interrupted.", v1, 2u);
  }
}

void __43__WLKFederatedAnalyticsReporter_connection__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidationHandler];
}

- (void)_invalidationHandler
{
  uint64_t v3 = WLKPlaybackTrackingLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKFederatedAnalyticsReporter - Connection invalidated.", v6, 2u);
  }

  int v4 = self;
  objc_sync_enter(v4);
  connection = v4->_connection;
  v4->_connection = 0;

  objc_sync_exit(v4);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end