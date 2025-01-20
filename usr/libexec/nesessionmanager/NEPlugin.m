@interface NEPlugin
- (NEPlugin)initWithAgent:(id)a3 delegateQueue:(id)a4 andDelegate:(id)a5;
- (NEPluginDelegate)delegate;
- (NSString)internalDescription;
- (NSXPCConnection)pluginConnection;
- (NSXPCInterface)managerInterface;
- (NSXPCInterface)remotePluginInterface;
- (OS_dispatch_queue)delegateQueue;
- (id)description;
- (id)remotePluginObject;
- (id)remotePluginObjectWithErrorHandler:(id)a3;
- (int)extension_pid;
- (void)setExtension_pid:(int)a3;
- (void)setInternalDescription:(id)a3;
- (void)setPluginConnection:(id)a3;
- (void)setStarted:(BOOL)a3;
@end

@implementation NEPlugin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDescription, 0);
  objc_storeStrong((id *)&self->_pluginConnection, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_agent, 0);

  objc_storeStrong((id *)&self->_pluginDriver, 0);
}

- (void)setInternalDescription:(id)a3
{
}

- (NSString)internalDescription
{
  return self->_internalDescription;
}

- (void)setPluginConnection:(id)a3
{
}

- (NSXPCConnection)pluginConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExtension_pid:(int)a3
{
  self->_extension_pid = a3;
}

- (int)extension_pid
{
  return self->_extension_pid;
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (NEPluginDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NEPluginDelegate *)WeakRetained;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NSXPCInterface)managerInterface
{
  return 0;
}

- (NSXPCInterface)remotePluginInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEPluginDriver];
}

- (id)remotePluginObjectWithErrorHandler:(id)a3
{
  pluginDriver = self->_pluginDriver;
  if (pluginDriver)
  {
    v4 = pluginDriver;
  }
  else
  {
    id v6 = a3;
    v7 = [(NEPlugin *)self pluginConnection];
    v4 = [v7 remoteObjectProxyWithErrorHandler:v6];
  }

  return v4;
}

- (id)remotePluginObject
{
  pluginDriver = self->_pluginDriver;
  if (pluginDriver)
  {
    v3 = pluginDriver;
  }
  else
  {
    v4 = [(NEPlugin *)self pluginConnection];
    v3 = [v4 remoteObjectProxy];
  }

  return v3;
}

- (id)description
{
  return [(NEPlugin *)self internalDescription];
}

- (NEPlugin)initWithAgent:(id)a3 delegateQueue:(id)a4 andDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NEPlugin;
  v12 = [(NEPlugin *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_agent, a3);
    objc_storeStrong((id *)&v13->_delegateQueue, a4);
    agent = v13->_agent;
    if (agent) {
      objc_setProperty_atomic(agent, v14, v13->_delegateQueue, 32);
    }
    objc_storeWeak((id *)&v13->_delegate, v11);
    id v16 = objc_alloc((Class)NSString);
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v19 = (NSString *)[v16 initWithFormat:@"%@(%@)", v18, v9];
    internalDescription = v13->_internalDescription;
    v13->_internalDescription = v19;

    v13->_started = 0;
  }

  return v13;
}

@end