@interface PDSDaemonRemoteVendor
- (BOOL)validateConnectionWithError:(id *)a3;
- (OS_dispatch_queue)queue;
- (PDSDaemonListenerVendor)daemonListenerVendor;
- (PDSDaemonRemoteVendor)initWithQueue:(id)a3 daemonListenerVendor:(id)a4;
- (id)_remoteForSync:(BOOL)a3;
- (id)_remoteInternalForSync:(BOOL)a3;
- (id)internalRemoteObjectProxyWithError:(id *)a3;
- (id)remoteObjectProxyWithError:(id *)a3;
- (id)synchronousInternalRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)setDaemonListenerVendor:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation PDSDaemonRemoteVendor

- (PDSDaemonRemoteVendor)initWithQueue:(id)a3 daemonListenerVendor:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PDSDaemonRemoteVendor.m", 81, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PDSDaemonRemoteVendor.m", 82, @"Invalid parameter not satisfying: %@", @"daemonListenerVendor" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PDSDaemonRemoteVendor;
  v11 = [(PDSDaemonRemoteVendor *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    objc_storeStrong((id *)&v12->_daemonListenerVendor, a4);
  }

  return v12;
}

- (id)_remoteInternalForSync:(BOOL)a3
{
  BOOL v4 = !a3;
  v5 = [(PDSDaemonListenerVendor *)self->_daemonListenerVendor remoteInternalListener];
  v6 = [PDSQueueProxy alloc];
  v7 = [(PDSDaemonRemoteVendor *)self queue];
  id v8 = [(PDSQueueProxy *)v6 initWithTarget:v5 queue:v7 mode:v4];

  return v8;
}

- (id)_remoteForSync:(BOOL)a3
{
  BOOL v4 = !a3;
  v5 = [(PDSDaemonListenerVendor *)self->_daemonListenerVendor remoteListenerForAllClientIDs];
  v6 = [PDSQueueProxy alloc];
  v7 = [(PDSDaemonRemoteVendor *)self queue];
  id v8 = [(PDSQueueProxy *)v6 initWithTarget:v5 queue:v7 mode:v4];

  return v8;
}

- (id)internalRemoteObjectProxyWithError:(id *)a3
{
  return [(PDSDaemonRemoteVendor *)self _remoteInternalForSync:0];
}

- (id)remoteObjectProxyWithError:(id *)a3
{
  return [(PDSDaemonRemoteVendor *)self _remoteForSync:0];
}

- (id)synchronousInternalRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PDSDaemonRemoteVendor *)self _remoteInternalForSync:1];
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PDSDaemonRemoteVendor *)self _remoteForSync:1];
}

- (BOOL)validateConnectionWithError:(id *)a3
{
  return 1;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (PDSDaemonListenerVendor)daemonListenerVendor
{
  return self->_daemonListenerVendor;
}

- (void)setDaemonListenerVendor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonListenerVendor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end