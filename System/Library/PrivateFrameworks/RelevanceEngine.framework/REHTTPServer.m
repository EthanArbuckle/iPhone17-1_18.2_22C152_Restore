@interface REHTTPServer
- (BOOL)_valid;
- (REHTTPServer)initWithPort:(unsigned __int16)a3 delegate:(id)a4;
- (REHTTPServerDelegate)delegate;
- (unsigned)port;
- (void)connection:(id)a3 didReceiveRequest:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)didCloseConnection:(_CFHTTPServerConnection *)a3;
- (void)didOpenConnection:(_CFHTTPServerConnection *)a3;
- (void)didRecievedError:(id)a3;
- (void)invalidate;
- (void)invalidated;
@end

@implementation REHTTPServer

- (REHTTPServer)initWithPort:(unsigned __int16)a3 delegate:(id)a4
{
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)REHTTPServer;
  v8 = [(REHTTPServer *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_delegate, a4);
    uint64_t v10 = RECreateSharedQueue(@"HTTPServer");
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [MEMORY[0x263EFF980] array];
    connections = v9->_connections;
    v9->_connections = (NSMutableArray *)v12;

    [MEMORY[0x263F08D40] valueWithWeakObject:v9];
    v18 = off_26CFA4CF8;
    long long v16 = xmmword_26CFA4CD8;
    long long v17 = *(_OWORD *)off_26CFA4CE8;
    v9->_port = a3;
    v9->_server = (_CFHTTPServer *)_CFHTTPServerCreateService();
    _CFHTTPServerSetDispatchQueue();
    if (!v9->_port)
    {
      v14 = (void *)_CFHTTPServerCopyProperty();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v14, "unsignedIntegerValue", v16, v17, v18)) {
        v9->_port = [v14 unsignedIntegerValue];
      }
    }
  }

  return v9;
}

- (void)dealloc
{
  [(REHTTPServer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)REHTTPServer;
  [(REHTTPServer *)&v3 dealloc];
}

- (void)invalidate
{
  if ([(REHTTPServer *)self _valid])
  {
    server = self->_server;
    MEMORY[0x270EE2A00](server);
  }
}

- (BOOL)_valid
{
  server = self->_server;
  if (server) {
    LOBYTE(server) = _CFHTTPServerIsValid() != 0;
  }
  return (char)server;
}

- (void)invalidated
{
}

- (void)didRecievedError:(id)a3
{
  id v3 = a3;
  v4 = RELogForDomain(21);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[REHTTPServer didRecievedError:]((uint64_t)v3, v4);
  }
}

- (void)didOpenConnection:(_CFHTTPServerConnection *)a3
{
  v4 = [[REHTTPConnection alloc] initWithConnection:a3];
  if (v4)
  {
    [(NSMutableArray *)self->_connections addObject:v4];
    [(REHTTPConnection *)v4 setDelegate:self];
    [(REHTTPConnection *)v4 open];
    v5 = RELogForDomain(21);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[REHTTPServer didOpenConnection:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)didCloseConnection:(_CFHTTPServerConnection *)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  connections = self->_connections;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __35__REHTTPServer_didCloseConnection___block_invoke;
  v13[3] = &unk_2644C0760;
  v13[4] = &v14;
  v13[5] = a3;
  [(NSMutableArray *)connections enumerateObjectsUsingBlock:v13];
  if (v15[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_connections, "removeObjectAtIndex:");
    v5 = RELogForDomain(21);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[REHTTPServer didCloseConnection:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  _Block_object_dispose(&v14, 8);
}

void __35__REHTTPServer_didCloseConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 connection] == *(void *)(a1 + 40))
  {
    *a4 = 1;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    [v7 close];
  }
}

- (void)connection:(id)a3 didReceiveRequest:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = RELogForDomain(21);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[REHTTPServer connection:didReceiveRequest:completion:](v7, v9);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__REHTTPServer_connection_didReceiveRequest_completion___block_invoke;
  block[3] = &unk_2644BC570;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(queue, block);
}

void __56__REHTTPServer_connection_didReceiveRequest_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 httpServer:*(void *)(a1 + 32) handleRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (unsigned)port
{
  return self->_port;
}

- (REHTTPServerDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)didRecievedError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_DEBUG, "Server encountered error %@", (uint8_t *)&v2, 0xCu);
}

- (void)didOpenConnection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)didCloseConnection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)connection:(void *)a1 didReceiveRequest:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 url];
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_DEBUG, "Received request at path %@", (uint8_t *)&v4, 0xCu);
}

@end