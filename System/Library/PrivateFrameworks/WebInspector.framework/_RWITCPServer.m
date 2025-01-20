@interface _RWITCPServer
- (BOOL)_createListenDispatchSource;
- (BOOL)_listenOnPort:(unsigned __int16)a3;
- (_RWITCPServer)initWithLaunchdSocketName:(const char *)a3 delegate:(id)a4;
- (_RWITCPServer)initWithPort:(unsigned __int16)a3 delegate:(id)a4;
- (_RWITCPServerDelegate)delegate;
- (id)_initWithDelegate:(id)a3;
- (void)_createListenDispatchSource;
- (void)connectionClosed:(id)a3;
- (void)dealloc;
@end

@implementation _RWITCPServer

- (id)_initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_RWITCPServer;
  v5 = [(_RWITCPServer *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_listenSocket = -1;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    connections = v6->_connections;
    v6->_connections = v7;

    v9 = v6;
  }

  return v6;
}

- (_RWITCPServer)initWithPort:(unsigned __int16)a3 delegate:(id)a4
{
  uint64_t v4 = a3;
  id v5 = [(_RWITCPServer *)self _initWithDelegate:a4];
  v6 = v5;
  if (v5 && [v5 _listenOnPort:v4]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (_RWITCPServer)initWithLaunchdSocketName:(const char *)a3 delegate:(id)a4
{
  id v5 = RWIDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_RWITCPServer initWithLaunchdSocketName:delegate:](v5);
  }

  return 0;
}

- (void)dealloc
{
  int listenSocket = self->_listenSocket;
  if ((listenSocket & 0x80000000) == 0) {
    close(listenSocket);
  }
  v4.receiver = self;
  v4.super_class = (Class)_RWITCPServer;
  [(_RWITCPServer *)&v4 dealloc];
}

- (BOOL)_listenOnPort:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  int v5 = socket(30, 1, 6);
  self->_int listenSocket = v5;
  if (v5 == -1)
  {
    v7 = RWIDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_RWITCPServer _listenOnPort:]();
    }
  }
  else
  {
    int v12 = 1;
    setsockopt(v5, 0xFFFF, 4, &v12, 4u);
    setsockopt(self->_listenSocket, 0xFFFF, 512, &v12, 4u);
    long long v10 = 0uLL;
    uint64_t v9 = 7680;
    int v11 = 0;
    WORD1(v9) = __rev16(v3);
    long long v10 = *MEMORY[0x263EF88F8];
    if (bind(self->_listenSocket, (const sockaddr *)&v9, 0x1Cu) == -1)
    {
      v8 = RWIDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_RWITCPServer _listenOnPort:](v3, v8);
      }

      return 0;
    }
    if (listen(self->_listenSocket, 5) != -1) {
      return [(_RWITCPServer *)self _createListenDispatchSource];
    }
    v7 = RWIDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_RWITCPServer _listenOnPort:]();
    }
  }

  return 0;
}

- (BOOL)_createListenDispatchSource
{
  unsigned int v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.webinspector.tcpserver", 0);
  serverQueue = self->_serverQueue;
  self->_serverQueue = v3;

  int v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83E8], self->_listenSocket, 0, (dispatch_queue_t)self->_serverQueue);
  serverSource = self->_serverSource;
  self->_serverSource = v5;

  v7 = self->_serverSource;
  if (v7)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __44___RWITCPServer__createListenDispatchSource__block_invoke;
    handler[3] = &unk_2647F7560;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_serverSource);
  }
  else
  {
    v8 = RWIDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_RWITCPServer _createListenDispatchSource](v8);
    }
  }
  return v7 != 0;
}

- (void)connectionClosed:(id)a3
{
  id v4 = a3;
  serverQueue = self->_serverQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34___RWITCPServer_connectionClosed___block_invoke;
  v7[3] = &unk_2647F7538;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serverQueue, v7);
}

- (_RWITCPServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_RWITCPServerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_serverSource, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
}

- (void)initWithLaunchdSocketName:(os_log_t)log delegate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_226FA0000, log, OS_LOG_TYPE_ERROR, "_RWITCPServer from launchd socket is only supported in the Simulator", v1, 2u);
}

- (void)_listenOnPort:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_2(&dword_226FA0000, v1, v2, "_RWITCPServer: Could not create TCP listen socket: %{public}s", v3, v4, v5, v6, 2u);
}

- (void)_listenOnPort:(unsigned __int16)a1 .cold.2(unsigned __int16 a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = a1;
  uint64_t v4 = __error();
  uint64_t v5 = strerror(*v4);
  v6[0] = 67240450;
  v6[1] = v3;
  __int16 v7 = 2082;
  id v8 = v5;
  _os_log_error_impl(&dword_226FA0000, a2, OS_LOG_TYPE_ERROR, "_RWITCPServer: Could not bind the Server socket to port (%{public}hu): %{public}s", (uint8_t *)v6, 0x12u);
}

- (void)_listenOnPort:.cold.3()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_2(&dword_226FA0000, v1, v2, "_RWITCPServer: Could not make the Server socket a listening socket: %{public}s", v3, v4, v5, v6, 2u);
}

- (void)_createListenDispatchSource
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_226FA0000, log, OS_LOG_TYPE_ERROR, "_RWITCPServer: Could not create dispatch source for socket.", v1, 2u);
}

@end