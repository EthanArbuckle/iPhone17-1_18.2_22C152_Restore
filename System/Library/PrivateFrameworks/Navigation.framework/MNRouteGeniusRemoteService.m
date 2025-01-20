@interface MNRouteGeniusRemoteService
- (BOOL)_q_openConnectionIfNecessary;
- (MNRouteGeniusRemoteService)initWithDelegate:(id)a3;
- (void)_q_closeConnection;
- (void)dealloc;
- (void)didUpdateRouteGenius:(id)a3;
- (void)forceReroute;
- (void)start;
- (void)stop;
@end

@implementation MNRouteGeniusRemoteService

- (BOOL)_q_openConnectionIfNecessary
{
  p_connection = &self->_connection;
  if (!self->_connection)
  {
    v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0E49818];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    [v4 setClasses:v7 forSelector:sel_didUpdateRouteGenius_ argumentIndex:0 ofReply:0];

    v8 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.navd.routegenius" options:4096];
    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0E73D08];
    [v8 setRemoteObjectInterface:v9];

    [v8 setExportedInterface:v4];
    [v8 setExportedObject:self];
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke;
    v13[3] = &unk_1E60FAAD0;
    objc_copyWeak(&v14, &location);
    [v8 setInvalidationHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke_3;
    v11[3] = &unk_1E60FAAD0;
    objc_copyWeak(&v12, &location);
    [v8 setInterruptionHandler:v11];
    objc_storeStrong((id *)p_connection, v8);
    [v8 resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return 1;
}

void __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke_2;
    block[3] = &unk_1E60FAAD0;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }
}

void __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;

  *((unsigned char *)WeakRetained + 24) = 0;
}

void __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke_4;
    block[3] = &unk_1E60FAAD0;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }
}

void __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_q_closeConnection");
  }
}

- (void)_q_closeConnection
{
  [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  self->_started = 0;
}

- (MNRouteGeniusRemoteService)initWithDelegate:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNRouteGeniusRemoteService;
  id v6 = [(MNRouteGeniusRemoteService *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("MNRouteGeniusRemoteQueue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (void)dealloc
{
  [(MNRouteGeniusRemoteService *)self _q_closeConnection];
  connection = self->_connection;
  self->_connection = 0;

  queue = self->_queue;
  self->_queue = 0;

  v5.receiver = self;
  v5.super_class = (Class)MNRouteGeniusRemoteService;
  [(MNRouteGeniusRemoteService *)&v5 dealloc];
}

- (void)forceReroute
{
  objc_initWeak(&location, self);
  v3 = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__MNRouteGeniusRemoteService_forceReroute__block_invoke;
  v10[3] = &unk_1E60FAAF8;
  v11 = v3;
  v4 = v3;
  objc_copyWeak(&v12, &location);
  objc_super v5 = (void *)MEMORY[0x1BA99B3A0](v10);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MNRouteGeniusRemoteService_forceReroute__block_invoke_2;
  block[3] = &unk_1E60FAB20;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __42__MNRouteGeniusRemoteService_forceReroute__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "MNRouteGeniusRemoteService force reroute error : %@", buf, 0xCu);
  }

  objc_super v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MNRouteGeniusRemoteService_forceReroute__block_invoke_62;
  block[3] = &unk_1E60FAAD0;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async(v5, block);
  objc_destroyWeak(&v7);
}

void __42__MNRouteGeniusRemoteService_forceReroute__block_invoke_62(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)*((void *)WeakRetained + 1);
    *((void *)WeakRetained + 1) = 0;

    *((unsigned char *)WeakRetained + 24) = 0;
    [*((id *)WeakRetained + 4) didUpdateRouteGenius:0];
  }
}

void __42__MNRouteGeniusRemoteService_forceReroute__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 24))
    {
      v4 = [WeakRetained[1] remoteObjectProxyWithErrorHandler:*(void *)(a1 + 32)];
      [v4 forceReroute];
    }
    else
    {
      v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v5[0] = 0;
        _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEBUG, "Cancelling reroute, MNRouteGeniusRemoteService is not started", (uint8_t *)v5, 2u);
      }
    }
  }
}

- (void)start
{
  objc_initWeak(&location, self);
  id v3 = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__MNRouteGeniusRemoteService_start__block_invoke;
  v12[3] = &unk_1E60FAAF8;
  v4 = v3;
  v13 = v4;
  objc_copyWeak(&v14, &location);
  objc_super v5 = (void *)MEMORY[0x1BA99B3A0](v12);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__MNRouteGeniusRemoteService_start__block_invoke_2;
  v8[3] = &unk_1E60FAB48;
  objc_copyWeak(&v11, &location);
  id v9 = v4;
  id v10 = v5;
  id v6 = v4;
  id v7 = v5;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __35__MNRouteGeniusRemoteService_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "MNRouteGeniusRemoteService start connection error : %@", buf, 0xCu);
  }

  objc_super v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MNRouteGeniusRemoteService_start__block_invoke_64;
  block[3] = &unk_1E60FAAD0;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async(v5, block);
  objc_destroyWeak(&v7);
}

void __35__MNRouteGeniusRemoteService_start__block_invoke_64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)*((void *)WeakRetained + 1);
    *((void *)WeakRetained + 1) = 0;

    *((unsigned char *)WeakRetained + 24) = 0;
    [*((id *)WeakRetained + 4) didUpdateRouteGenius:0];
  }
}

void __35__MNRouteGeniusRemoteService_start__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_q_openConnectionIfNecessary");
    if (!*((unsigned char *)v4 + 24))
    {
      objc_super v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEBUG, "MNRouteGeniusRemoteService is starting a connection", buf, 2u);
      }

      *((unsigned char *)v4 + 24) = 1;
      id v6 = [*((id *)v4 + 1) remoteObjectProxyWithErrorHandler:*(void *)(a1 + 40)];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __35__MNRouteGeniusRemoteService_start__block_invoke_65;
      v7[3] = &unk_1E60FAB90;
      id v8 = *(id *)(a1 + 32);
      objc_copyWeak(&v9, v2);
      [v6 startWithHandler:v7];

      objc_destroyWeak(&v9);
    }
  }
}

void __35__MNRouteGeniusRemoteService_start__block_invoke_65(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MNRouteGeniusRemoteService_start__block_invoke_2_66;
  block[3] = &unk_1E60FAAD0;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __35__MNRouteGeniusRemoteService_start__block_invoke_2_66(uint64_t a1)
{
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEBUG, "MNRouteGeniusRemoteService is closing the connection", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_q_closeConnection");
  }
}

- (void)stop
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__MNRouteGeniusRemoteService_stop__block_invoke;
  v4[3] = &unk_1E60FAAD0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __34__MNRouteGeniusRemoteService_stop__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && WeakRetained[24])
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "MNRouteGeniusRemoteService is stopping the connection", v5, 2u);
    }

    *((unsigned char *)v2 + 24) = 0;
    objc_msgSend(v2, "_q_openConnectionIfNecessary");
    id v4 = [*((id *)v2 + 1) remoteObjectProxyWithErrorHandler:&__block_literal_global_27];
    [v4 stopWithHandler:&__block_literal_global_70];
  }
}

void __34__MNRouteGeniusRemoteService_stop__block_invoke_67(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "MNRouteGeniusRemoteService stop connection error : %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didUpdateRouteGenius:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MNRouteGeniusRemoteService_didUpdateRouteGenius___block_invoke;
  block[3] = &unk_1E60FAB90;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__MNRouteGeniusRemoteService_didUpdateRouteGenius___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v3 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "received a 'didUpdateRouteGenius' with data", v7, 2u);
      }

      id v4 = WeakRetained[4];
      id v5 = (void *)[*(id *)(a1 + 32) copy];
      [v4 didUpdateRouteGenius:v5];
    }
    else
    {
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEBUG, "received a 'didUpdateRouteGenius' with nil", buf, 2u);
      }

      [WeakRetained[4] didUpdateRouteGenius:*(void *)(a1 + 32)];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end