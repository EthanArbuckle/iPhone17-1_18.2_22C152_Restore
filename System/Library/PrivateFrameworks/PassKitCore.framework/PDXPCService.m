@interface PDXPCService
- (NSString)remoteProcessApplicationIdentifier;
- (NSString)remoteProcessBundleIdentifier;
- (PDXPCApplicationInfo)remoteProcessApplicationInfo;
- (PDXPCService)init;
- (PDXPCService)initWithConnection:(id)a3;
- (id)connection;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (int)remoteProcessIdentifier;
- (void)clearConnectionReference;
- (void)serviceResumed;
- (void)serviceSuspended;
@end

@implementation PDXPCService

- (id)remoteObjectProxy
{
  return [(PDXPCService *)self remoteObjectProxyWithErrorHandler:0];
}

- (PDXPCService)initWithConnection:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PDXPCService;
  v6 = [(PDXPCService *)&v17 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = [v9 copy];
    className = v7->_className;
    v7->_className = (NSString *)v10;

    if (v5) {
      int v12 = [v5 processIdentifier];
    }
    else {
      int v12 = -1;
    }
    v7->_remoteProcessIdentifier = v12;
    v13 = [v5 valueForEntitlement:@"application-identifier"];
    uint64_t v14 = [v13 copy];
    remoteProcessApplicationIdentifier = v7->_remoteProcessApplicationIdentifier;
    v7->_remoteProcessApplicationIdentifier = (NSString *)v14;
  }
  return v7;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_callbacksSuspended)
  {
    v6 = 0;
  }
  else
  {
    v6 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:v4];
  }
  os_unfair_lock_unlock(p_lock);
  if (v4 && !v6) {
    v4[2](v4, 0);
  }

  return v6;
}

- (void)clearConnectionReference
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteProcessApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)serviceResumed
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    className = self->_className;
    int remoteProcessIdentifier = self->_remoteProcessIdentifier;
    int v7 = 138543874;
    v8 = className;
    __int16 v9 = 2048;
    uint64_t v10 = connection;
    __int16 v11 = 1024;
    int v12 = remoteProcessIdentifier;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_INFO, "%{public}@ (%p:%d): connection resumed", (uint8_t *)&v7, 0x1Cu);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_callbacksSuspended = 0;
  os_unfair_lock_unlock(&self->_lock);
}

- (PDXPCService)init
{
  return 0;
}

- (id)connection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_connection;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (PDXPCApplicationInfo)remoteProcessApplicationInfo
{
  uint64_t v2 = [(PDXPCService *)self remoteProcessIdentifier];
  if (v2) {
    v3 = [[PDXPCApplicationInfo alloc] initWithPID:v2];
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (NSString)remoteProcessBundleIdentifier
{
  uint64_t v2 = [(PDXPCService *)self remoteProcessApplicationInfo];
  v3 = [v2 displayID];

  return (NSString *)v3;
}

- (void)serviceSuspended
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    className = self->_className;
    int remoteProcessIdentifier = self->_remoteProcessIdentifier;
    int v7 = 138543874;
    v8 = className;
    __int16 v9 = 2048;
    uint64_t v10 = connection;
    __int16 v11 = 1024;
    int v12 = remoteProcessIdentifier;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_INFO, "%{public}@ (%p:%d): connection suspended", (uint8_t *)&v7, 0x1Cu);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_callbacksSuspended = 1;
  os_unfair_lock_unlock(&self->_lock);
}

- (int)remoteProcessIdentifier
{
  return self->_remoteProcessIdentifier;
}

- (NSString)remoteProcessApplicationIdentifier
{
  return self->_remoteProcessApplicationIdentifier;
}

@end