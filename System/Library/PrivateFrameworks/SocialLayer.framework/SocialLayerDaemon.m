@interface SocialLayerDaemon
+ (id)_systemUIServiceIdentifier;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMapTable)connectionsToServicesTable;
- (NSMutableArray)multiplexesPendingRemoval;
- (NSXPCListener)xpcListener;
- (int)appleLanguageChangeNotificationToken;
- (void)_acceptMainConnection:(id)a3;
- (void)_appConnectionInvalidated:(id)a3;
- (void)_appleSystemLanguageDidChange:(id)a3;
- (void)endpointForServiceNamed:(id)a3 reply:(id)a4;
- (void)multiplexDidRemoveAllServices:(id)a3;
- (void)setConnectionsToServicesTable:(id)a3;
- (void)setMultiplexesPendingRemoval:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)setupListeners;
@end

@implementation SocialLayerDaemon

- (void)endpointForServiceNamed:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v6 = (NSString *)a3;
  v7 = (void *)MEMORY[0x1E4F29268];
  v8 = (void (**)(id, void *))a4;
  v9 = [v7 currentConnection];
  Class v10 = NSClassFromString(v6);
  v11 = [(SocialLayerDaemon *)self connectionsToServicesTable];
  v12 = [v11 objectForKey:v9];

  if (v10
    && v12
    && [(objc_class *)v10 conformsToProtocol:&unk_1EEC3B4E0]
    && ([v12 endpointForServiceClass:v10], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
    v15 = SLDaemonLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138412802;
      v17 = v14;
      __int16 v18 = 2112;
      v19 = v9;
      __int16 v20 = 2112;
      Class v21 = v10;
      _os_log_debug_impl(&dword_19BE17000, v15, OS_LOG_TYPE_DEBUG, "Returning endpoint: %@ to client: %@ for service class: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    v15 = SLDaemonLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SocialLayerDaemon endpointForServiceNamed:reply:]((uint64_t)v9, (uint64_t)v6, v15);
    }
    v14 = 0;
  }

  v8[2](v8, v14);
}

- (void)_acceptMainConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC49EF8];
  [v4 setExportedInterface:v5];
  [v4 setExportedObject:self];
  v6 = +[SLDServiceListenerMultiplex emptyMultiplex];
  [v6 setDelegate:self];
  v7 = [(SocialLayerDaemon *)self connectionsToServicesTable];
  [v7 setObject:v6 forKey:v4];

  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __43__SocialLayerDaemon__acceptMainConnection___block_invoke;
  uint64_t v13 = &unk_1E58A9AD0;
  objc_copyWeak(&v14, &from);
  objc_copyWeak(&v15, &location);
  [v4 setInvalidationHandler:&v10];
  v8 = SLDGlobalWorkloop();
  objc_msgSend(v4, "_setQueue:", v8, v10, v11, v12, v13);

  v9 = SLDaemonLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_19BE17000, v9, OS_LOG_TYPE_INFO, "Accepted a new primary client connection: %@", buf, 0xCu);
  }

  [v4 resume];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (NSMapTable)connectionsToServicesTable
{
  return self->_connectionsToServicesTable;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!SLDConnectionIsEntitled(v7))
  {
    uint64_t v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SocialLayerDaemon listener:shouldAcceptNewConnection:]((uint64_t)v7, v10);
    }

    goto LABEL_7;
  }
  id v8 = [(SocialLayerDaemon *)self xpcListener];

  if (v8 != v6)
  {
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  [(SocialLayerDaemon *)self _acceptMainConnection:v7];
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setupListeners
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "Error registering for Apple system language change notification: %d. We will continue without registering, but this will result in localized strings not updating when the system language changes.", (uint8_t *)v2, 8u);
}

void __35__SocialLayerDaemon_setupListeners__block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);
  [v1 _appleSystemLanguageDidChange:0];

  objc_destroyWeak(&to);
}

+ (id)_systemUIServiceIdentifier
{
  return @"com.apple.sociallayerd";
}

- (void)_appleSystemLanguageDidChange:(id)a3
{
  id v4 = SLDaemonLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SocialLayerDaemon _appleSystemLanguageDidChange:](v4);
  }

  notify_cancel(self->_appleLanguageChangeNotificationToken);
  xpc_transaction_exit_clean();
}

void __43__SocialLayerDaemon__acceptMainConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _appConnectionInvalidated:v2];
}

- (void)_appConnectionInvalidated:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SLDaemonLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_INFO, "Primary client connection invalidated: %@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [(SocialLayerDaemon *)self connectionsToServicesTable];
  id v7 = [v6 objectForKey:v4];

  id v8 = [(SocialLayerDaemon *)self connectionsToServicesTable];
  [v8 removeObjectForKey:v4];

  if (([v7 isEmpty] & 1) == 0)
  {
    BOOL v9 = [(SocialLayerDaemon *)self multiplexesPendingRemoval];
    [v9 addObject:v7];
  }
}

- (void)multiplexDidRemoveAllServices:(id)a3
{
  id v4 = a3;
  id v5 = [(SocialLayerDaemon *)self multiplexesPendingRemoval];
  [v5 removeObject:v4];
}

- (int)appleLanguageChangeNotificationToken
{
  return self->_appleLanguageChangeNotificationToken;
}

- (void)setXpcListener:(id)a3
{
}

- (void)setConnectionsToServicesTable:(id)a3
{
}

- (NSMutableArray)multiplexesPendingRemoval
{
  return self->_multiplexesPendingRemoval;
}

- (void)setMultiplexesPendingRemoval:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiplexesPendingRemoval, 0);
  objc_storeStrong((id *)&self->_connectionsToServicesTable, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

- (void)_appleSystemLanguageDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_19BE17000, log, OS_LOG_TYPE_DEBUG, "Apple system language changed. Exiting so NSBundle/Foundation can regenerate cached language-dependent strings on the next process launch.", v1, 2u);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "Primary client connection (%@) does not have the right entitlement.", (uint8_t *)&v2, 0xCu);
}

- (void)endpointForServiceNamed:(os_log_t)log reply:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "Primary client connection (%@) requested endpoint for service (%@), but we could not create one", (uint8_t *)&v3, 0x16u);
}

@end