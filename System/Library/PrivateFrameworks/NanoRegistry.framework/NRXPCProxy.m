@interface NRXPCProxy
+ (BOOL)requireAnEntitlement;
+ (id)clientExportedInterface;
+ (id)clientRemoteObjectInterface;
+ (id)entitlements;
+ (id)machServiceName;
+ (id)serverExportedInterface;
+ (id)serverRemoteObjectInterface;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasEntitlements;
- (BOOL)invalidated;
- (BOOL)monitorClientForSuspension;
- (NRNSXPCConnectionProtocol)connection;
- (NRXPCProxy)initWithConnection:(id)a3 delegate:(id)a4 xpcTarget:(id)a5 entitlementBitmask:(unsigned int)a6;
- (NSString)appPath;
- (id)remoteObjectProxy;
- (id)target;
- (int)pid;
- (void)_invalidate;
- (void)setMonitorClientForSuspension:(BOOL)a3;
@end

@implementation NRXPCProxy

- (NRXPCProxy)initWithConnection:(id)a3 delegate:(id)a4 xpcTarget:(id)a5 entitlementBitmask:(unsigned int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [(NRXPCProxy *)self init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_connection, a3);
    objc_storeWeak((id *)&v15->_delegate, v12);
    objc_storeStrong(&v15->_target, a5);
    v15->_entitlementBitmask = a6;
    uint64_t v16 = [v11 processName];
    appPath = v15->_appPath;
    v15->_appPath = (NSString *)v16;
  }
  return v15;
}

- (int)pid
{
  return [(NRNSXPCConnectionProtocol *)self->_connection processIdentifier];
}

- (NRNSXPCConnectionProtocol)connection
{
  return self->_connection;
}

- (BOOL)hasEntitlement:(id)a3
{
  v3 = self;
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v3) = [WeakRetained hasEntitlement:v5 withBitmask:v3->_entitlementBitmask];

  return (char)v3;
}

- (NSString)appPath
{
  return self->_appPath;
}

- (id)target
{
  return self->_target;
}

+ (id)machServiceName
{
  return 0;
}

+ (id)serverExportedInterface
{
  return 0;
}

+ (id)serverRemoteObjectInterface
{
  return 0;
}

+ (id)clientExportedInterface
{
  return 0;
}

+ (id)clientRemoteObjectInterface
{
  return 0;
}

+ (id)entitlements
{
  return 0;
}

+ (BOOL)requireAnEntitlement
{
  v2 = [a1 entitlements];
  [v2 count];

  return 0;
}

- (BOOL)hasEntitlements
{
  return self->_entitlementBitmask != 0;
}

- (id)remoteObjectProxy
{
  return (id)[(NRNSXPCConnectionProtocol *)self->_connection remoteObjectProxy];
}

- (void)_invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(NRNSXPCConnectionProtocol *)self->_connection setInterruptionHandler:0];
    [(NRNSXPCConnectionProtocol *)self->_connection setInvalidationHandler:0];
    [(NRNSXPCConnectionProtocol *)self->_connection invalidate];
    connection = self->_connection;
    self->_connection = 0;

    id target = self->_target;
    self->_id target = 0;
  }
}

- (void)setMonitorClientForSuspension:(BOOL)a3
{
  BOOL v3 = a3;
  self->_monitorClientForSuspension = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shouldMonitorProxy:self forSuspension:v3];
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (BOOL)monitorClientForSuspension
{
  return self->_monitorClientForSuspension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_appPath, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end