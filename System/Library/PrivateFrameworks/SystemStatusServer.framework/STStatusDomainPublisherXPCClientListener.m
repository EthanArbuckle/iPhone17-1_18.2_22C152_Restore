@interface STStatusDomainPublisherXPCClientListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (STStatusDomainPublisherXPCClientListener)initWithServerHandle:(id)a3;
- (void)dealloc;
@end

@implementation STStatusDomainPublisherXPCClientListener

- (STStatusDomainPublisherXPCClientListener)initWithServerHandle:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STStatusDomainPublisherXPCClientListener;
  v5 = [(STStatusDomainPublisherXPCClientListener *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_serverHandle, v4);
    id v7 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v8 = [v7 initWithMachServiceName:*MEMORY[0x1E4FA98B0]];
    xpcListener = v6->_xpcListener;
    v6->_xpcListener = (NSXPCListener *)v8;

    [(NSXPCListener *)v6->_xpcListener setDelegate:v6];
    [(NSXPCListener *)v6->_xpcListener resume];
  }

  return v6;
}

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (STStatusDomainPublisherXPCClientListener *)self->_xpcListener;
  }
  [(STStatusDomainPublisherXPCClientListener *)self invalidate];
  v3.receiver = v2;
  v3.super_class = (Class)STStatusDomainPublisherXPCClientListener;
  [(STStatusDomainPublisherXPCClientListener *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [STStatusDomainPublisherXPCClientHandle alloc];
  if (self) {
    self = (STStatusDomainPublisherXPCClientListener *)objc_loadWeakRetained((id *)&self->_serverHandle);
  }
  id v7 = [(STStatusDomainPublisherXPCClientHandle *)v6 initWithXPCConnection:v5 serverHandle:self];

  return v7 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_destroyWeak((id *)&self->_serverHandle);
}

@end