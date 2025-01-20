@interface PBUIRemoteRendererXPCConnection
+ (PBUIRemoteRendererXPCConnection)defaultConnection;
- (id)connectionActivateIfNeededWithError:(id *)a3;
- (id)initToEndpoint:(id)a3;
- (id)initToServiceName:(id)a3;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
@end

@implementation PBUIRemoteRendererXPCConnection

+ (PBUIRemoteRendererXPCConnection)defaultConnection
{
  if (defaultConnection_onceToken != -1) {
    dispatch_once(&defaultConnection_onceToken, &__block_literal_global_96);
  }
  v2 = (void *)defaultConnection___result;
  return (PBUIRemoteRendererXPCConnection *)v2;
}

uint64_t __52__PBUIRemoteRendererXPCConnection_defaultConnection__block_invoke()
{
  id v0 = [[PBUIRemoteRendererXPCConnection alloc] initToServiceName:@"com.apple.springboard.SBRendererService"];
  uint64_t v1 = defaultConnection___result;
  defaultConnection___result = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)initToServiceName:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)PBUIRemoteRendererXPCConnection;
    v7 = [(PBUIRemoteRendererXPCConnection *)&v12 init];
    if (v7)
    {
      uint64_t v8 = [v6 copy];
      serviceName = v7->_serviceName;
      v7->_serviceName = (NSString *)v8;

      v7->_connectionLock = 0;
    }

    return v7;
  }
  else
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"serviceName"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(PBUIRemoteRendererXPCConnection *)a2 initToServiceName:(uint64_t)v11];
    }
    [v11 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)initToEndpoint:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)PBUIRemoteRendererXPCConnection;
    uint64_t v8 = [(PBUIRemoteRendererXPCConnection *)&v12 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_endpoint, a3);
      v9->_connectionLock = 0;
    }

    return v9;
  }
  else
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"endpoint"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(PBUIRemoteRendererXPCConnection *)a2 initToEndpoint:(uint64_t)v11];
    }
    [v11 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  uint64_t v9 = 0;
  v4 = (void (**)(id, void))a3;
  id v5 = [(PBUIRemoteRendererXPCConnection *)self connectionActivateIfNeededWithError:&v9];
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    v4[2](v4, v9);
    v7 = 0;
  }

  return v7;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  uint64_t v9 = 0;
  v4 = (void (**)(id, void))a3;
  id v5 = [(PBUIRemoteRendererXPCConnection *)self connectionActivateIfNeededWithError:&v9];
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 remoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    v4[2](v4, v9);
    v7 = 0;
  }

  return v7;
}

- (id)connectionActivateIfNeededWithError:(id *)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_connection) {
    goto LABEL_11;
  }
  if (self->_serviceName)
  {
    id v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:self->_serviceName];
  }
  else
  {
    if (!self->_endpoint) {
      goto LABEL_7;
    }
    id v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:self->_endpoint];
  }
  lock_connection = self->_lock_connection;
  self->_lock_connection = v5;

LABEL_7:
  v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1668678];
  uint64_t v8 = +[PBUICARemoteRenderer secureCodableRequestClasses];
  [v7 setClasses:v8 forSelector:sel_renderRequest_reply_ argumentIndex:0 ofReply:0];

  uint64_t v9 = [getPRUISSnapshotServiceClass() secureCodableRequestClasses];
  [v7 setClasses:v9 forSelector:sel_executeSnapshotRequest_reply_ argumentIndex:0 ofReply:0];

  v10 = [getPRUISSnapshotServiceClass() secureCodableResponseClasses];
  [v7 setClasses:v10 forSelector:sel_cachedSnapshotForRequest_reply_ argumentIndex:0 ofReply:0];

  v11 = [getPRUISAnalysisServiceClass() secureCodableRequestClasses];
  [v7 setClasses:v11 forSelector:sel_executeAnalysisRequest_reply_ argumentIndex:0 ofReply:0];

  objc_super v12 = [getPRUISAnalysisServiceClass() secureCodableResponseClasses];
  [v7 setClasses:v12 forSelector:sel_executeAnalysisRequest_reply_ argumentIndex:0 ofReply:1];

  v13 = [getPRUISAnalysisServiceClass() secureCodableResponseClasses];
  [v7 setClasses:v13 forSelector:sel_executeAnalysisRequest_reply_ argumentIndex:1 ofReply:1];

  v14 = [getPRUISAnalysisServiceClass() secureCodableRequestClasses];
  [v7 setClasses:v14 forSelector:sel_executeAnalysisRequest_error_ argumentIndex:0 ofReply:0];

  v15 = [getPRUISAnalysisServiceClass() secureCodableRequestClasses];
  [v7 setClasses:v15 forSelector:sel_executeAnalysisRequest_error_ argumentIndex:1 ofReply:0];

  v16 = [getPRUISAnalysisServiceClass() secureCodableRequestClasses];
  [v7 setClasses:v16 forSelector:sel_cancelRequest_ argumentIndex:0 ofReply:0];

  [(NSXPCConnection *)self->_lock_connection setRemoteObjectInterface:v7];
  objc_initWeak(&location, self);
  v17 = self->_lock_connection;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __71__PBUIRemoteRendererXPCConnection_connectionActivateIfNeededWithError___block_invoke;
  v26 = &unk_1E62B39F0;
  objc_copyWeak(&v27, &location);
  [(NSXPCConnection *)v17 setInvalidationHandler:&v23];
  [(NSXPCConnection *)self->_lock_connection activate];
  if (a3 && !self->_lock_connection)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    v29[0] = *MEMORY[0x1E4F28578];
    v19 = [NSString stringWithFormat:@"Connection to service (%@) refused on activation.", self->_serviceName, v23, v24, v25, v26];
    v29[1] = *MEMORY[0x1E4F28588];
    v30[0] = v19;
    v30[1] = @"Ensure this process has the correct sandbox for connection and that the service is not crashing or failing to load.";
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    *a3 = [v18 errorWithDomain:*MEMORY[0x1E4F28798] code:61 userInfo:v20];
  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

LABEL_11:
  os_unfair_recursive_lock_unlock();
  v21 = self->_lock_connection;
  return v21;
}

void __71__PBUIRemoteRendererXPCConnection_connectionActivateIfNeededWithError___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    os_unfair_recursive_lock_lock_with_options();
    v2 = (void *)v3[4];
    v3[4] = 0;

    os_unfair_recursive_lock_unlock();
    WeakRetained = v3;
  }
}

- (void)dealloc
{
  os_unfair_recursive_lock_lock_with_options();
  lock_connection = self->_lock_connection;
  if (lock_connection)
  {
    [(NSXPCConnection *)lock_connection invalidate];
    v4 = self->_lock_connection;
    self->_lock_connection = 0;
  }
  os_unfair_recursive_lock_unlock();
  v5.receiver = self;
  v5.super_class = (Class)PBUIRemoteRendererXPCConnection;
  [(PBUIRemoteRendererXPCConnection *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)initToServiceName:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  objc_super v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"PBUICARemoteRenderer.m";
  __int16 v10 = 1024;
  int v11 = 180;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1BC4B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initToEndpoint:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  objc_super v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"PBUICARemoteRenderer.m";
  __int16 v10 = 1024;
  int v11 = 190;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1BC4B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end