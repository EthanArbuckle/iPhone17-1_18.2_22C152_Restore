@interface SLDServiceListenerMultiplex
+ (id)emptyMultiplex;
- (BOOL)isEmpty;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMapTable)listenerToServiceTable;
- (NSMapTable)serviceToConnectionsTable;
- (NSMapTable)serviceToListenerTable;
- (NSString)description;
- (SLDServiceListenerMultiplex)init;
- (SLDServiceMultiplexDelegate)delegate;
- (id)_listenerForService:(id)a3;
- (id)endpointForServiceClass:(Class)a3;
- (void)_acceptConnection:(id)a3 forService:(id)a4;
- (void)_logFullDescription;
- (void)_notifyDelegateIfEmpty;
- (void)_service:(id)a3 lostConnection:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setListenerToServiceTable:(id)a3;
- (void)setServiceToConnectionsTable:(id)a3;
- (void)setServiceToListenerTable:(id)a3;
@end

@implementation SLDServiceListenerMultiplex

- (void)setDelegate:(id)a3
{
}

- (id)endpointForServiceClass:(Class)a3
{
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v5 = [(objc_class *)a3 sharedService];
    v6 = [(SLDServiceListenerMultiplex *)self _listenerForService:v5];
  }
  else
  {
    v7 = SLDaemonLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SLDServiceListenerMultiplex endpointForServiceClass:]();
    }

    v6 = 0;
  }
  v8 = [v6 endpoint];

  return v8;
}

- (id)_listenerForService:(id)a3
{
  id v4 = a3;
  v5 = [(NSMapTable *)self->_serviceToListenerTable objectForKey:v4];
  if (!v5)
  {
    v5 = [MEMORY[0x1E4F29290] anonymousListener];
    [(NSMapTable *)self->_serviceToListenerTable setObject:v5 forKey:v4];
    [(NSMapTable *)self->_listenerToServiceTable setObject:v4 forKey:v5];
    [v5 setDelegate:self];
    v6 = SLDGlobalWorkloop();
    [v5 _setQueue:v6];

    [v5 resume];
  }
  v7 = SLDaemonLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SLDServiceListenerMultiplex _listenerForService:]();
  }

  return v5;
}

+ (id)emptyMultiplex
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (SLDServiceListenerMultiplex)init
{
  v10.receiver = self;
  v10.super_class = (Class)SLDServiceListenerMultiplex;
  id v2 = [(SLDServiceListenerMultiplex *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    serviceToListenerTable = v2->_serviceToListenerTable;
    v2->_serviceToListenerTable = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    listenerToServiceTable = v2->_listenerToServiceTable;
    v2->_listenerToServiceTable = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    serviceToConnectionsTable = v2->_serviceToConnectionsTable;
    v2->_serviceToConnectionsTable = (NSMapTable *)v7;
  }
  return v2;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SLDServiceListenerMultiplex;
  id v4 = [(SLDServiceListenerMultiplex *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@ :::\n Services->Listeners: %@, Listeners->Services: %@, Services->Connections:%@", v4, self->_serviceToListenerTable, self->_listenerToServiceTable, self->_serviceToConnectionsTable];

  return (NSString *)v5;
}

- (void)_logFullDescription
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_19BE17000, a2, OS_LOG_TYPE_DEBUG, "%@", v4, 0xCu);
}

- (BOOL)isEmpty
{
  return ![(NSMapTable *)self->_listenerToServiceTable count]
      && ![(NSMapTable *)self->_serviceToListenerTable count]
      && [(NSMapTable *)self->_serviceToConnectionsTable count] == 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  objc_super v7 = [(NSMapTable *)self->_listenerToServiceTable objectForKey:a3];
  if ((SLDConnectionIsEntitled(v6) & 1) == 0)
  {
    objc_super v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SLDServiceListenerMultiplex listener:shouldAcceptNewConnection:].cold.4();
    }
    goto LABEL_14;
  }
  if (!v7)
  {
    objc_super v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SLDServiceListenerMultiplex listener:shouldAcceptNewConnection:]();
    }
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v7 allowsConnection:v6] & 1) == 0)
  {
    objc_super v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SLDServiceListenerMultiplex listener:shouldAcceptNewConnection:]();
    }
LABEL_14:

    BOOL v9 = 0;
    goto LABEL_15;
  }
  v8 = SLDaemonLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SLDServiceListenerMultiplex listener:shouldAcceptNewConnection:]();
  }

  [(SLDServiceListenerMultiplex *)self _acceptConnection:v6 forService:v7];
  [(SLDServiceListenerMultiplex *)self _logFullDescription];
  BOOL v9 = 1;
LABEL_15:

  return v9;
}

- (void)_acceptConnection:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSMapTable *)self->_serviceToConnectionsTable objectForKey:v7];
  if (!v8)
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    [(NSMapTable *)self->_serviceToConnectionsTable setObject:v8 forKey:v7];
  }
  [v8 addObject:v6];
  objc_initWeak(&location, v6);
  objc_initWeak(&from, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__SLDServiceListenerMultiplex__acceptConnection_forService___block_invoke;
  v14[3] = &unk_1E58A9AF8;
  objc_copyWeak(&v16, &from);
  objc_copyWeak(&v17, &location);
  id v9 = v7;
  id v15 = v9;
  [v6 setInvalidationHandler:v14];
  if (objc_opt_respondsToSelector()) {
    [v9 receivedConnection:v6];
  }
  objc_super v10 = (void *)MEMORY[0x1E4F29280];
  v11 = [(id)objc_opt_class() remoteObjectProtocol];
  v12 = [v10 interfaceWithProtocol:v11];

  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(id)objc_opt_class() setupInterface:v12];
  }
  [v6 setExportedObject:v9];
  [v6 setExportedInterface:v12];
  v13 = SLDGlobalWorkloop();
  [v6 _setQueue:v13];

  [v6 resume];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __60__SLDServiceListenerMultiplex__acceptConnection_forService___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (v2) {
    [WeakRetained _service:*(void *)(a1 + 32) lostConnection:v2];
  }
}

- (void)_service:(id)a3 lostConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = SLDaemonLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SLDServiceListenerMultiplex _service:lostConnection:]();
  }

  id v9 = [(NSMapTable *)self->_serviceToConnectionsTable objectForKey:v6];
  [v9 removeObject:v7];
  if (![v9 count])
  {
    [(NSMapTable *)self->_serviceToConnectionsTable removeObjectForKey:v6];
    objc_super v10 = [(NSMapTable *)self->_serviceToListenerTable objectForKey:v6];
    if (v10)
    {
      [(NSMapTable *)self->_serviceToListenerTable removeObjectForKey:v6];
      [(NSMapTable *)self->_listenerToServiceTable removeObjectForKey:v10];
      [v10 invalidate];
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v6 lostConnection:v7];
  }
  [(SLDServiceListenerMultiplex *)self _logFullDescription];
  [(SLDServiceListenerMultiplex *)self _notifyDelegateIfEmpty];
}

- (void)_notifyDelegateIfEmpty
{
  uint64_t v3 = [(SLDServiceListenerMultiplex *)self delegate];

  if (v3 && [(SLDServiceListenerMultiplex *)self isEmpty])
  {
    id v4 = [(SLDServiceListenerMultiplex *)self delegate];
    [v4 multiplexDidRemoveAllServices:self];
  }
}

- (SLDServiceMultiplexDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SLDServiceMultiplexDelegate *)WeakRetained;
}

- (NSMapTable)serviceToListenerTable
{
  return self->_serviceToListenerTable;
}

- (void)setServiceToListenerTable:(id)a3
{
}

- (NSMapTable)listenerToServiceTable
{
  return self->_listenerToServiceTable;
}

- (void)setListenerToServiceTable:(id)a3
{
}

- (NSMapTable)serviceToConnectionsTable
{
  return self->_serviceToConnectionsTable;
}

- (void)setServiceToConnectionsTable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceToConnectionsTable, 0);
  objc_storeStrong((id *)&self->_listenerToServiceTable, 0);
  objc_storeStrong((id *)&self->_serviceToListenerTable, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)endpointForServiceClass:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "Service class does not implement the the required SLDService protocol: %@", v2, v3, v4, v5, v6);
}

- (void)_listenerForService:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_8(v0);
  OUTLINED_FUNCTION_1_1(&dword_19BE17000, v2, v3, "Configured a new service listener:[%@] serviceClass:[%@]", v4, v5, v6, v7, v8);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "There is not a service connected to this listener: %@", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_8(v0);
  OUTLINED_FUNCTION_1_1(&dword_19BE17000, v2, v3, "Accepting a new service connection: [%@] : [%@]", v4, v5, v6, v7, v8);
}

- (void)listener:shouldAcceptNewConnection:.cold.3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_19BE17000, v1, OS_LOG_TYPE_ERROR, "Service: %@ denied connection: %@", v2, 0x16u);
}

- (void)listener:shouldAcceptNewConnection:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "XPC Connection does not have the proper entitlement: %@", v2, v3, v4, v5, v6);
}

- (void)_service:lostConnection:.cold.1()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_8(v0);
  OUTLINED_FUNCTION_1_1(&dword_19BE17000, v2, v3, "Service connection invalidated: %@ for service class: %@", v4, v5, v6, v7, v8);
}

@end