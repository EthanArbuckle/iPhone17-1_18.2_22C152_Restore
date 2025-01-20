@interface PDSXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSArray)connectedClients;
- (NSMutableArray)XPCClients;
- (OS_dispatch_workloop)workloop;
- (PDSDaemonListenerVendor)daemonListenerVendor;
- (PDSXPCInterfaceVendor)interfaceVendor;
- (PDSXPCListener)XPCListener;
- (PDSXPCServer)initWithServiceName:(id)a3 listenerVendor:(id)a4 interfaceVendor:(id)a5 daemonListenerVendor:(id)a6 queue:(id)a7 workloop:(id)a8;
- (void)resume;
- (void)setDaemonListenerVendor:(id)a3;
- (void)setInterfaceVendor:(id)a3;
- (void)setWorkloop:(id)a3;
- (void)setXPCClients:(id)a3;
- (void)setXPCListener:(id)a3;
@end

@implementation PDSXPCServer

- (PDSXPCServer)initWithServiceName:(id)a3 listenerVendor:(id)a4 interfaceVendor:(id)a5 daemonListenerVendor:(id)a6 queue:(id)a7 workloop:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PDSXPCServer.m", 34, @"Invalid parameter not satisfying: %@", @"serviceName" object file lineNumber description];

    if (v15)
    {
LABEL_3:
      if (v16) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  v26 = [MEMORY[0x263F08690] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"PDSXPCServer.m", 35, @"Invalid parameter not satisfying: %@", @"listenerVendor" object file lineNumber description];

  if (v16)
  {
LABEL_4:
    if (v17) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v27 = [MEMORY[0x263F08690] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"PDSXPCServer.m", 36, @"Invalid parameter not satisfying: %@", @"interfaceVendor" object file lineNumber description];

  if (v17)
  {
LABEL_5:
    if (v18) {
      goto LABEL_6;
    }
LABEL_14:
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PDSXPCServer.m", 38, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v19) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_13:
  v28 = [MEMORY[0x263F08690] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"PDSXPCServer.m", 37, @"Invalid parameter not satisfying: %@", @"daemonListenerVendor" object file lineNumber description];

  if (!v18) {
    goto LABEL_14;
  }
LABEL_6:
  if (v19) {
    goto LABEL_7;
  }
LABEL_15:
  v30 = [MEMORY[0x263F08690] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"PDSXPCServer.m", 39, @"Invalid parameter not satisfying: %@", @"workloop" object file lineNumber description];

LABEL_7:
  v32.receiver = self;
  v32.super_class = (Class)PDSXPCServer;
  v20 = [(PDSXPCServer *)&v32 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_workloop, a8);
    objc_storeStrong((id *)&v21->_daemonListenerVendor, a6);
    objc_storeStrong((id *)&v21->_interfaceVendor, a5);
    uint64_t v22 = [v15 listenerForMachService:v14];
    XPCListener = v21->_XPCListener;
    v21->_XPCListener = (PDSXPCListener *)v22;

    [(PDSXPCListener *)v21->_XPCListener _setQueue:v18];
    [(PDSXPCListener *)v21->_XPCListener setDelegate:v21];
  }

  return v21;
}

- (void)resume
{
}

- (NSArray)connectedClients
{
  v2 = (void *)[(NSMutableArray *)self->_XPCClients copy];
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x263EFFA68];
  }
  v4 = v2;

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 valueForEntitlement:*MEMORY[0x263F5BA18]];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v8 BOOLValue]) {
      goto LABEL_8;
    }
  }
  v9 = [v7 valueForEntitlement:*MEMORY[0x263F5BA08]];
  if (!v9)
  {
    id v14 = pds_defaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PDSXPCServer listener:shouldAcceptNewConnection:]((uint64_t)v7, v14);
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v14 = pds_defaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PDSXPCServer listener:shouldAcceptNewConnection:]((uint64_t)v7, (uint64_t)v9, v14);
      }
LABEL_17:
      BOOL v16 = 0;
      goto LABEL_18;
    }
  }

LABEL_8:
  if (!self->_XPCClients)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    XPCClients = self->_XPCClients;
    self->_XPCClients = v10;
  }
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = dispatch_queue_create_with_target_V2("com.apple.pds.xpc.clientqueue", v12, (dispatch_queue_t)self->_workloop);

  v13 = [[PDSXPCClient alloc] initWithConnection:v7 interfaceVendor:self->_interfaceVendor daemonListenerVendor:self->_daemonListenerVendor queue:v9];
  [(NSMutableArray *)self->_XPCClients addObject:v13];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __51__PDSXPCServer_listener_shouldAcceptNewConnection___block_invoke;
  v18[3] = &unk_2645C8BB8;
  objc_copyWeak(&v20, &location);
  id v14 = v13;
  id v19 = v14;
  [v7 setInvalidationHandler:v18];
  id v15 = pds_defaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v7;
    _os_log_impl(&dword_221791000, v15, OS_LOG_TYPE_DEFAULT, "Allowing PDS Client connection {newConnection: %@}", buf, 0xCu);
  }

  [v14 resume];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  BOOL v16 = 1;
LABEL_18:

  return v16;
}

void __51__PDSXPCServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    v3 = pds_defaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_221791000, v3, OS_LOG_TYPE_DEFAULT, "PDS Client went invalid {client: %@}", (uint8_t *)&v6, 0xCu);
    }

    v5 = [WeakRetained XPCClients];
    [v5 removeObject:*(void *)(a1 + 32)];
  }
}

- (PDSXPCListener)XPCListener
{
  return self->_XPCListener;
}

- (void)setXPCListener:(id)a3
{
}

- (PDSXPCInterfaceVendor)interfaceVendor
{
  return self->_interfaceVendor;
}

- (void)setInterfaceVendor:(id)a3
{
}

- (PDSDaemonListenerVendor)daemonListenerVendor
{
  return self->_daemonListenerVendor;
}

- (void)setDaemonListenerVendor:(id)a3
{
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)setWorkloop:(id)a3
{
}

- (NSMutableArray)XPCClients
{
  return self->_XPCClients;
}

- (void)setXPCClients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_XPCClients, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_daemonListenerVendor, 0);
  objc_storeStrong((id *)&self->_interfaceVendor, 0);
  objc_storeStrong((id *)&self->_XPCListener, 0);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221791000, a2, OS_LOG_TYPE_ERROR, "PDS Client connection missing entitlement -- rejecting {newConnection: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_221791000, log, OS_LOG_TYPE_ERROR, "PDS Client connection has invalid entitlement type -- rejecting {clientIDEntitlement: %@, newConnection: %@}", (uint8_t *)&v3, 0x16u);
}

@end