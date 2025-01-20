@interface PDSXPCClient
- (BOOL)_hasToolEntitlement;
- (OS_dispatch_queue)queue;
- (PDSDaemonListenerVendor)daemonListenerVendor;
- (PDSRemote)daemonListener;
- (PDSXPCClient)initWithConnection:(id)a3 interfaceVendor:(id)a4 daemonListenerVendor:(id)a5 queue:(id)a6;
- (PDSXPCDaemonConnection)connection;
- (id)_connectionEntitledClientIDs;
- (void)connectInternalWithCompletion:(id)a3;
- (void)connectWithClientID:(id)a3 completion:(id)a4;
- (void)resume;
- (void)setConnection:(id)a3;
- (void)setDaemonListener:(id)a3;
- (void)setDaemonListenerVendor:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation PDSXPCClient

- (PDSXPCClient)initWithConnection:(id)a3 interfaceVendor:(id)a4 daemonListenerVendor:(id)a5 queue:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PDSXPCClient.m", 32, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
LABEL_10:
      v22 = [MEMORY[0x263F08690] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"PDSXPCClient.m", 34, @"Invalid parameter not satisfying: %@", @"daemonListenerVendor" object file lineNumber description];

      if (v15) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PDSXPCClient.m", 33, @"Invalid parameter not satisfying: %@", @"interfaceVendor" object file lineNumber description];

  if (!v14) {
    goto LABEL_10;
  }
LABEL_4:
  if (v15) {
    goto LABEL_5;
  }
LABEL_11:
  v23 = [MEMORY[0x263F08690] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"PDSXPCClient.m", 35, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_5:
  v24.receiver = self;
  v24.super_class = (Class)PDSXPCClient;
  v16 = [(PDSXPCClient *)&v24 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_daemonListenerVendor, a5);
    objc_storeStrong((id *)&v17->_queue, a6);
    objc_storeStrong((id *)&v17->_connection, a3);
    [v12 _setQueue:v15];
    v18 = [MEMORY[0x263F5B9F0] handShakeInterfaceFromVendor:v13];
    [v12 setExportedInterface:v18];

    [v12 setExportedObject:v17];
  }

  return v17;
}

- (void)resume
{
}

- (id)_connectionEntitledClientIDs
{
  v16[1] = *MEMORY[0x263EF8340];
  v2 = [(PDSXPCDaemonConnection *)self->_connection valueForEntitlement:*MEMORY[0x263F5BA08]];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16[0] = v2;
      id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
LABEL_4:
      v4 = v3;
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v5 = v2;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v12;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_17;
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }

      id v3 = v5;
      goto LABEL_4;
    }
LABEL_17:
    v4 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x263EFFA68];
  }
LABEL_18:

  return v4;
}

- (BOOL)_hasToolEntitlement
{
  v2 = [(PDSXPCDaemonConnection *)self->_connection valueForEntitlement:*MEMORY[0x263F5BA18]];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)connectWithClientID:(id)a3 completion:(id)a4
{
  id v12 = a3;
  uint64_t v6 = (void (**)(id, void *, void))a4;
  if ([(PDSXPCClient *)self _hasToolEntitlement])
  {
    uint64_t v7 = [(PDSDaemonListenerVendor *)self->_daemonListenerVendor remoteListenerForAllClientIDs];
    [(PDSXPCClient *)self setDaemonListener:v7];

    uint64_t v8 = [(PDSXPCClient *)self daemonListener];
    v6[2](v6, v8, 0);
    goto LABEL_10;
  }
  uint64_t v8 = [(PDSXPCClient *)self _connectionEntitledClientIDs];
  if (![v8 count])
  {
    uint64_t v11 = -301;
LABEL_8:
    v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA30] code:v11 userInfo:0];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v10);
    goto LABEL_9;
  }
  if (![v8 containsObject:v12])
  {
    uint64_t v11 = -302;
    goto LABEL_8;
  }
  v9 = [(PDSDaemonListenerVendor *)self->_daemonListenerVendor remoteListenerForClientIDs:v8];
  [(PDSXPCClient *)self setDaemonListener:v9];

  v10 = [(PDSXPCClient *)self daemonListener];
  v6[2](v6, v10, 0);
LABEL_9:

LABEL_10:
}

- (void)connectInternalWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, void))a3;
  if ([(PDSXPCClient *)self _hasToolEntitlement])
  {
    id v5 = [(PDSDaemonListenerVendor *)self->_daemonListenerVendor remoteInternalListener];
    v4[2](v4, v5, 0);
  }
  else
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA30] code:-304 userInfo:0];
    ((void (**)(id, id, id))v4)[2](v4, 0, v5);
  }
}

- (PDSRemote)daemonListener
{
  return self->_daemonListener;
}

- (void)setDaemonListener:(id)a3
{
}

- (PDSDaemonListenerVendor)daemonListenerVendor
{
  return self->_daemonListenerVendor;
}

- (void)setDaemonListenerVendor:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (PDSXPCDaemonConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_daemonListenerVendor, 0);
  objc_storeStrong((id *)&self->_daemonListener, 0);
}

@end