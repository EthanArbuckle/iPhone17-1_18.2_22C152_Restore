@interface _RWITCPConnection
+ (_RWITCPConnection)TCPConnectionWithLockdownConnection:(_lockdown_connection *)a3;
+ (_RWITCPConnection)TCPConnectionWithSocketPath:(id)a3;
- (_RWITCPConnection)initWithServer:(id)a3 lockdownConnection:(_lockdown_connection *)a4;
- (_RWITCPConnection)initWithServer:(id)a3 socket:(int)a4;
- (_RWITCPConnectionDelegate)delegate;
- (void)_closeInputStream;
- (void)_closeOutputStream;
- (void)_commonInitializationWithServer:(id)a3 socket:(int)a4 type:(int64_t)a5;
- (void)_createInputSource;
- (void)_createOutputSource;
- (void)_dispatchSourceCancelled;
- (void)_handleInput;
- (void)_handleOutput;
- (void)_processIncomingBytes:(const char *)a3 length:(int64_t)a4;
- (void)_setOutputSourceSuspended:(BOOL)a3;
- (void)_shutdown;
- (void)dealloc;
- (void)sendMessage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startReceiving;
@end

@implementation _RWITCPConnection

+ (_RWITCPConnection)TCPConnectionWithSocketPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  if ((v6 & 1) == 0)
  {
    v9 = RWIDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[_RWITCPConnection TCPConnectionWithSocketPath:].cold.4((uint64_t)v4, v9);
    }

    goto LABEL_9;
  }
  unint64_t v7 = [v4 lengthOfBytesUsingEncoding:4];
  if (v7 >= 0x68)
  {
    v8 = RWIDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[_RWITCPConnection TCPConnectionWithSocketPath:v8];
    }

LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  uint64_t v12 = socket(1, 1, 0);
  if (v12 == -1)
  {
    v15 = RWIDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = __error();
      v17 = strerror(*v16);
      +[_RWITCPConnection TCPConnectionWithSocketPath:(uint64_t)v4];
    }

    goto LABEL_9;
  }
  v22.sa_family = 1;
  id v13 = v4;
  strlcpy(v22.sa_data, (const char *)[v13 UTF8String], 0x68uLL);
  int v14 = strlen(v22.sa_data);
  if (connect(v12, &v22, v14 + 2) == -1)
  {
    v18 = RWIDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = __error();
      v20 = strerror(*v19);
      +[_RWITCPConnection TCPConnectionWithSocketPath:(uint64_t)v13];
    }

    close(v12);
    goto LABEL_9;
  }
  v10 = (void *)[objc_alloc((Class)a1) initWithServer:0 socket:v12];
LABEL_10:

  return (_RWITCPConnection *)v10;
}

- (_RWITCPConnection)initWithServer:(id)a3 socket:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_RWITCPConnection;
  unint64_t v7 = [(_RWITCPConnection *)&v11 init];
  v8 = v7;
  if (v7)
  {
    [(_RWITCPConnection *)v7 _commonInitializationWithServer:v6 socket:v4 type:0];
    v9 = v8;
  }

  return v8;
}

+ (_RWITCPConnection)TCPConnectionWithLockdownConnection:(_lockdown_connection *)a3
{
  if (lockdown_get_socket() == -1)
  {
    id v6 = RWIDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[_RWITCPConnection TCPConnectionWithLockdownConnection:](v6);
    }

    v5 = 0;
  }
  else
  {
    v5 = (void *)[objc_alloc((Class)a1) initWithServer:0 lockdownConnection:a3];
  }
  return (_RWITCPConnection *)v5;
}

- (_RWITCPConnection)initWithServer:(id)a3 lockdownConnection:(_lockdown_connection *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_RWITCPConnection;
  unint64_t v7 = [(_RWITCPConnection *)&v11 init];
  if (v7)
  {
    uint64_t socket = lockdown_get_socket();
    v7->_connection = a4;
    [(_RWITCPConnection *)v7 _commonInitializationWithServer:v6 socket:socket type:1];
    v9 = v7;
  }

  return v7;
}

- (void)_commonInitializationWithServer:(id)a3 socket:(int)a4 type:(int64_t)a5
{
  id v15 = a3;
  objc_storeStrong((id *)&self->_server, a3);
  self->_uint64_t socket = a4;
  self->_type = a5;
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  outputMessageQueue = self->_outputMessageQueue;
  self->_outputMessageQueue = v9;

  objc_super v11 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
  incomingData = self->_incomingData;
  self->_incomingData = v11;

  id v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.webinspector.tcpconnection", 0);
  connectionQueue = self->_connectionQueue;
  self->_connectionQueue = v13;

  [(_RWITCPConnection *)self _createOutputSource];
  [(_RWITCPConnection *)self _createInputSource];
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  [(_RWITCPConnection *)self _shutdown];
  v3.receiver = self;
  v3.super_class = (Class)_RWITCPConnection;
  [(_RWITCPConnection *)&v3 dealloc];
}

- (void)_shutdown
{
  if (!self->_shutdown)
  {
    self->_shutdown = 1;
    [(_RWITCPConnection *)self _closeInputStream];
    [(_RWITCPConnection *)self _closeOutputStream];
    outputMessageQueue = self->_outputMessageQueue;
    self->_outputMessageQueue = 0;

    incomingData = self->_incomingData;
    self->_incomingData = 0;

    connectionQueue = self->_connectionQueue;
    self->_connectionQueue = 0;
  }
}

- (void)_dispatchSourceCancelled
{
  if (self->_inputSourceCancelled && self->_outputSourceCancelled)
  {
    int64_t type = self->_type;
    if (type == 1)
    {
      if (!self->_connection) {
        return;
      }
      lockdown_disconnect();
      self->_connection = 0;
      p_int socket = &self->_socket;
      goto LABEL_9;
    }
    if (!type)
    {
      p_int socket = &self->_socket;
      int socket = self->_socket;
      if ((socket & 0x80000000) == 0)
      {
        close(socket);
LABEL_9:
        *p_int socket = -1;
      }
    }
  }
}

- (void)sendMessage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  connectionQueue = self->_connectionQueue;
  if (connectionQueue)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33___RWITCPConnection_sendMessage___block_invoke;
    v7[3] = &unk_2647F74A8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(connectionQueue, v7);
  }
}

- (void)startReceiving
{
}

- (void)_createOutputSource
{
  objc_super v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8418], self->_socket, 0, (dispatch_queue_t)self->_connectionQueue);
  outputSource = self->_outputSource;
  self->_outputSource = v3;

  v5 = self->_outputSource;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __40___RWITCPConnection__createOutputSource__block_invoke;
  handler[3] = &unk_2647F74D0;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  id v6 = self->_outputSource;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40___RWITCPConnection__createOutputSource__block_invoke_2;
  v7[3] = &unk_2647F74D0;
  v7[4] = self;
  dispatch_source_set_cancel_handler(v6, v7);
  self->_outputSourceSuspended = 1;
}

- (void)_closeOutputStream
{
  outputSource = self->_outputSource;
  if (outputSource)
  {
    if (self->_outputSourceSuspended)
    {
      [(_RWITCPConnection *)self _setOutputSourceSuspended:0];
      outputSource = self->_outputSource;
    }
    dispatch_source_cancel(outputSource);
    id v4 = self->_outputSource;
    self->_outputSource = 0;

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39___RWITCPConnection__closeOutputStream__block_invoke;
    block[3] = &unk_2647F74D0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    server = self->_server;
    if (server) {
      [(_RWITCPServer *)server connectionClosed:self];
    }
  }
}

- (void)_setOutputSourceSuspended:(BOOL)a3
{
  outputSource = self->_outputSource;
  if (a3)
  {
    dispatch_suspend(outputSource);
    BOOL v5 = 1;
  }
  else
  {
    dispatch_resume(outputSource);
    BOOL v5 = 0;
  }
  self->_outputSourceSuspended = v5;
}

- (void)_handleOutput
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_226FA0000, log, OS_LOG_TYPE_ERROR, "_RWITCPConnection failed to write a message", v1, 2u);
}

- (void)_createInputSource
{
  objc_super v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83E8], self->_socket, 0, (dispatch_queue_t)self->_connectionQueue);
  inputSource = self->_inputSource;
  self->_inputSource = v3;

  BOOL v5 = self->_inputSource;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __39___RWITCPConnection__createInputSource__block_invoke;
  handler[3] = &unk_2647F74D0;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  id v6 = self->_inputSource;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39___RWITCPConnection__createInputSource__block_invoke_2;
  v7[3] = &unk_2647F74D0;
  v7[4] = self;
  dispatch_source_set_cancel_handler(v6, v7);
}

- (void)_closeInputStream
{
  inputSource = self->_inputSource;
  if (inputSource)
  {
    dispatch_source_cancel(inputSource);
    id v4 = self->_inputSource;
    self->_inputSource = 0;
  }
}

- (void)_handleInput
{
  *(_DWORD *)buf = 67240450;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 2082;
  *(void *)(buf + 10) = a1;
  _os_log_error_impl(&dword_226FA0000, log, OS_LOG_TYPE_ERROR, "_RWITCPConnection read failed: %{public}d - %{public}s", buf, 0x12u);
}

- (void)_processIncomingBytes:(const char *)a3 length:(int64_t)a4
{
  [(NSMutableData *)self->_incomingData appendBytes:a3 length:a4];
  incomingData = self->_incomingData;
  id v13 = 0;
  id v6 = +[_RWITCPRelayMessage TCPRelayMessageFromDataStream:incomingData error:&v13];
  id v7 = v13;
  if (v7)
  {
LABEL_5:
    [(_RWITCPConnection *)self _shutdown];
  }
  else
  {
    id v8 = MEMORY[0x263EF83A0];
    while (v6)
    {
      -[NSMutableData replaceBytesInRange:withBytes:length:](self->_incomingData, "replaceBytesInRange:withBytes:length:", 0, [v6 length], 0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __50___RWITCPConnection__processIncomingBytes_length___block_invoke;
      block[3] = &unk_2647F74A8;
      block[4] = self;
      id v12 = v6;
      id v9 = v6;
      dispatch_async(v8, block);

      v10 = self->_incomingData;
      id v13 = 0;
      id v6 = +[_RWITCPRelayMessage TCPRelayMessageFromDataStream:v10 error:&v13];
      id v7 = v13;
      if (v7) {
        goto LABEL_5;
      }
    }
  }
}

- (_RWITCPConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_RWITCPConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_incomingData, 0);
  objc_storeStrong((id *)&self->_outputMessageQueue, 0);
  objc_storeStrong((id *)&self->_outputSource, 0);
  objc_storeStrong((id *)&self->_inputSource, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

+ (void)TCPConnectionWithSocketPath:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 138478339;
  uint64_t v4 = a1;
  __int16 v5 = 2050;
  uint64_t v6 = a2;
  __int16 v7 = 2050;
  uint64_t v8 = 104;
  _os_log_error_impl(&dword_226FA0000, log, OS_LOG_TYPE_ERROR, "_RWITCPConnection: path to unix domain socket at '%{private}@' is too long: path is %{public}lu bytes, but must be less than %{public}lu bytes", (uint8_t *)&v3, 0x20u);
}

+ (void)TCPConnectionWithSocketPath:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0(a1, a2, a3, 5.8081e-34);
  _os_log_error_impl(&dword_226FA0000, v4, OS_LOG_TYPE_ERROR, "_RWITCPConnection: Could not create unix domain socket at patch %{private}@: %{public}s", v3, 0x16u);
}

+ (void)TCPConnectionWithSocketPath:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0(a1, a2, a3, 5.8081e-34);
  _os_log_error_impl(&dword_226FA0000, v4, OS_LOG_TYPE_ERROR, "_RWITCPConnection: Could not connect to unix domain socket at (%{private}@): %{public}s", v3, 0x16u);
}

+ (void)TCPConnectionWithSocketPath:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226FA0000, a2, OS_LOG_TYPE_ERROR, "_RWITCPConnection: provided unix domain socket does not exist at path %{private}@", (uint8_t *)&v2, 0xCu);
}

+ (void)TCPConnectionWithLockdownConnection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_226FA0000, log, OS_LOG_TYPE_ERROR, "_RWITCPConnection: lockdown_get_socket invalid socket", v1, 2u);
}

@end