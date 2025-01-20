@interface STDynamicActivityAttributionListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (STDynamicActivityAttributionListener)initWithServerHandle:(id)a3;
- (void)dealloc;
@end

@implementation STDynamicActivityAttributionListener

- (STDynamicActivityAttributionListener)initWithServerHandle:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STDynamicActivityAttributionListener;
  v5 = [(STDynamicActivityAttributionListener *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_serverHandle, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.systemstatus.activityattribution"];
    xpcListener = v6->_xpcListener;
    v6->_xpcListener = (NSXPCListener *)v7;

    [(NSXPCListener *)v6->_xpcListener setDelegate:v6];
    [(NSXPCListener *)v6->_xpcListener resume];
  }

  return v6;
}

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (STDynamicActivityAttributionListener *)self->_xpcListener;
  }
  [(STDynamicActivityAttributionListener *)self invalidate];
  v3.receiver = v2;
  v3.super_class = (Class)STDynamicActivityAttributionListener;
  [(STDynamicActivityAttributionListener *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [STDynamicActivityAttributionXPCClientHandle alloc];
  if (self) {
    self = (STDynamicActivityAttributionListener *)objc_loadWeakRetained((id *)&self->_serverHandle);
  }
  uint64_t v7 = [(STDynamicActivityAttributionXPCClientHandle *)v6 initWithXPCConnection:v5 serverHandle:self];

  return v7 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);

  objc_destroyWeak((id *)&self->_serverHandle);
}

@end