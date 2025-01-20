@interface SiriAnalyticsXPCServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SiriAnalyticsXPCServiceListener)initWithMachServiceName:(id)a3 entitlementsKey:(id)a4 queue:(id)a5 delegate:(id)a6;
@end

@implementation SiriAnalyticsXPCServiceListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementsKey, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [v5 processIdentifier];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v7 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[SiriAnalyticsXPCServiceListener listener:shouldAcceptNewConnection:]";
    __int16 v21 = 2112;
    id v22 = v5;
    __int16 v23 = 1024;
    int v24 = v6;
    _os_log_impl(&dword_1A2B39000, v7, OS_LOG_TYPE_INFO, "%s %@ Siri Analytics Connection Connected (pid=%d])", buf, 0x1Cu);
  }
  v8 = [SiriAnalyticsXPCConnectionHandler alloc];
  entitlementsKey = self->_entitlementsKey;
  queue = self->_queue;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = [(SiriAnalyticsXPCConnectionHandler *)v8 initWithConnection:v5 entitlementsKey:entitlementsKey queue:queue delegate:WeakRetained];

  v13 = SiriAnalyticsXPCServiceInterface();
  [v5 setExportedInterface:v13];

  [v5 setExportedObject:v12];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__SiriAnalyticsXPCServiceListener_listener_shouldAcceptNewConnection___block_invoke;
  v17[3] = &__block_descriptor_36_e5_v8__0l;
  int v18 = v6;
  [v5 setInvalidationHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__SiriAnalyticsXPCServiceListener_listener_shouldAcceptNewConnection___block_invoke_2;
  v15[3] = &__block_descriptor_36_e5_v8__0l;
  int v16 = v6;
  [v5 setInterruptionHandler:v15];
  [v5 _setQueue:self->_queue];
  [v5 resume];

  return 1;
}

void __70__SiriAnalyticsXPCServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v2 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 32);
    int v4 = 136315394;
    id v5 = "-[SiriAnalyticsXPCServiceListener listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = v3;
    _os_log_impl(&dword_1A2B39000, v2, OS_LOG_TYPE_INFO, "%s Siri Analytics Connection Invalidated (pid=%d)", (uint8_t *)&v4, 0x12u);
  }
}

void __70__SiriAnalyticsXPCServiceListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v2 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 32);
    int v4 = 136315394;
    id v5 = "-[SiriAnalyticsXPCServiceListener listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = v3;
    _os_log_impl(&dword_1A2B39000, v2, OS_LOG_TYPE_INFO, "%s Siri Analytics Connection Interrupted (pid=%d)", (uint8_t *)&v4, 0x12u);
  }
}

- (SiriAnalyticsXPCServiceListener)initWithMachServiceName:(id)a3 entitlementsKey:(id)a4 queue:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SiriAnalyticsXPCServiceListener;
  v14 = [(SiriAnalyticsXPCServiceListener *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a5);
    objc_storeWeak((id *)&v15->_delegate, v13);
    objc_storeStrong((id *)&v15->_entitlementsKey, a4);
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v10];
    listener = v15->_listener;
    v15->_listener = (NSXPCListener *)v16;

    [(NSXPCListener *)v15->_listener setDelegate:v15];
    [(NSXPCListener *)v15->_listener _setQueue:v12];
    [(NSXPCListener *)v15->_listener resume];
  }

  return v15;
}

@end