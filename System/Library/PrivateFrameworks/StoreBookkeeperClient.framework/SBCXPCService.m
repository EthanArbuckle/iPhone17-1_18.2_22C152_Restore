@interface SBCXPCService
+ (Class)XPCServiceInterfaceClass;
+ (id)XPCInterfaceDebugDescription;
+ (id)newListener;
- (BOOL)isConnectionConfigured;
- (NSXPCConnection)xpcConnection;
- (SBCClientConfiguration)clientConfiguration;
- (SBCXPCService)initWithClientConfiguration:(id)a3;
- (SBCXPCServiceInterface)XPCServiceInterface;
- (id)newServiceConnection;
- (void)closeServiceConnection;
- (void)dealloc;
- (void)setConnectionConfigured:(BOOL)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation SBCXPCService

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (BOOL)isConnectionConfigured
{
  return self->_connectionConfigured;
}

- (SBCClientConfiguration)clientConfiguration
{
  return self->_clientConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_XPCServiceInterface, 0);
  objc_storeStrong((id *)&self->_clientConfiguration, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)setConnectionConfigured:(BOOL)a3
{
  self->_connectionConfigured = a3;
}

- (SBCXPCServiceInterface)XPCServiceInterface
{
  return self->_XPCServiceInterface;
}

- (void)setXpcConnection:(id)a3
{
}

- (void)closeServiceConnection
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

- (id)newServiceConnection
{
  return [(SBCXPCServiceInterface *)self->_XPCServiceInterface newServiceConnection];
}

- (void)dealloc
{
  v3 = os_log_create("com.apple.amp.StoreBookkeeperClient", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23674F000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating", buf, 2u);
  }

  [(SBCXPCService *)self closeServiceConnection];
  v4.receiver = self;
  v4.super_class = (Class)SBCXPCService;
  [(SBCXPCService *)&v4 dealloc];
}

- (SBCXPCService)initWithClientConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBCXPCService;
  v6 = [(SBCXPCService *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientConfiguration, a3);
    v8 = (SBCXPCServiceInterface *)objc_alloc_init((Class)[(id)objc_opt_class() XPCServiceInterfaceClass]);
    XPCServiceInterface = v7->_XPCServiceInterface;
    v7->_XPCServiceInterface = v8;

    v7->_connectionConfigured = 0;
  }

  return v7;
}

+ (id)newListener
{
  v2 = (void *)[a1 XPCServiceInterfaceClass];
  return (id)[v2 newListener];
}

+ (id)XPCInterfaceDebugDescription
{
  v3 = NSString;
  objc_super v4 = NSStringFromClass((Class)a1);
  id v5 = objc_msgSend((id)objc_msgSend(a1, "XPCServiceInterfaceClass"), "serviceInterface");
  v6 = [v5 debugDescription];
  v7 = objc_msgSend((id)objc_msgSend(a1, "XPCServiceInterfaceClass"), "serviceClientInterface");
  v8 = [v7 debugDescription];
  v9 = [v3 stringWithFormat:@"Service Name: '%@'\n\nService Protocol:\n\n%@\n\nClient Protocol:\n\n%@\n", v4, v6, v8];

  return v9;
}

+ (Class)XPCServiceInterfaceClass
{
  objc_super v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromClass((Class)a1);
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"SBCXPCService.m", 52, @"Subclass %@ must implement +%@", v5, v6 object file lineNumber description];

  return 0;
}

@end